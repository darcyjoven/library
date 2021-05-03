#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_axmt540.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0213(1900-01-01 00:00:00), PR版次:0213(2021-03-30 20:56:57)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000928
#+ Filename...: s_axmt540
#+ Description: 出貨單應用元件
#+ Creator....: 04543(2014-03-20 17:46:11)
#+ Modifier...: 00000 -SD/PR- 05423
 
{</section>}
 
{<section id="s_axmt540.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#151118-00012#1  2015/11/18  By Shiun      更改抓取匯率時的基準日期
#151117-00005#1  2015/12/04  By TSD.Tim    過帳/取消過帳時異動條碼庫存檔(bcab_t)
#150917-00001#3  2016/01/21  By earl       多角中斷調整為可拆單功能
#160125-00025#2  2016/02/15  By earl       整理條碼產生邏輯
#160328-00029#4  2016/03/29  By Hans       將重複內容的錯誤訊息置換為公用錯誤訊息
#160321-00016#16 2016/03/29  By Jessy      將重複內容的錯誤訊息置換為公用錯誤訊息
#160408-00035#7  2016/04/21  By xianghui   过帐和过帐还原时，如果有备置量需要回写订单xmdr的已备置量
#160428-00015#1  2016/04/28  By wujie      销售出货单axmt540生成采购收货入库单apmt530的时候，apmt530的价格没有根据采购单apmt500带出来，而是带的axmt540的价格
#160318-00016#1  2016/05/04  By 02040      直送訂單產生採購入庫單需提示執行成功
#160127-00035#1  2016/05/04  By 02040      料號的批號控管方式(imaf061)為1必需有批號時，過帳需扣卡批號不可為空
#160511-00015#1  2016/05/11  By Sarah      v_inaa001的不存在提示訊息顯示為amm-00753是不太適合的
#160506-00011#1  2016/05/11  By Dido       當倉退多筆時,項次變數未同步更新
#160202-00019#5  2016/05/26  By xianghui   RMA 覆出单需要抓取RMA单号和项次
#160523-00018#5  2016/06/07  By 02040      多角出貨單不可直接做結案，調整改call s_apmp500做結案動作
#160419-00058#1  2016/06/04  By 02097      呼叫s_inventory_upd_inag時傳入的日期是畫面上的扣帳日期
#160613-00003#1  2016/06/14  By dorislai   1.取消過帳時，詢問是否將直送訂單的"收貨入庫作廢"
#                                          2.修改取消過帳的順序，原本：2.收貨入庫單過帳還原 → 3.收貨入庫單取消確認 → 4.收貨入庫單作廢 → 1.出貨單過帳
#                                                              改成：1.出貨單過帳 → 2.收貨入庫單過帳還原 → 3.收貨入庫單取消確認 → 4.收貨入庫單作廢 
#160629-00019#1  2016/07/04  By catmoon    過帳時，將理由碼(inaj016)一併寫入
#160705-00008#2  2016/07/21  By 03079      單價控制 
#160519-00008#8  2016/07/28  By 02097      单据上库存管理特征栏位依依料件设定控管 
#160727-00046#1  2016/07/29  By 03079      庫位控卡調整
#160808-00038#1  2016/08/12  By 02097      增加控卡发票客户不可为空
#160805-00004#1  2016/08/17  By 02040      調整訂單結案流程，需多角拋轉完後，才做結案
#160922-00024#1  2016/09/26  By fionchen   調整#160127-00035#1,若出貨項次為多庫儲批出貨,應檢查多庫儲批出貨明細(xmdm_t)的批號資料是否為空
#160923-00023#1  2016/09/29  By 02040      多角訂單/出通/出貨，不做信用額度查核
#161109-00016#1  2016/11/09  By shiun      調整當D-BAS-0063(出貨單過帳檢核是否有包裝單)為Y時的邏輯判斷及當D-BAS-0064(出貨單過帳檢核是否有Invoice)為Y時的邏輯判斷
#161026-00025#1  2016/11/10  By 08993      在呼叫v_pmao004前,增加一行轉換錯誤訊息apm-00260改為使用axm-00053
#161109-00085#48 2016/11/21  By 08993      整批調整系統星號寫法
#161109-00037#1  2016/12/16  By Ann_Huang  調整當過帳時庫存不足時,執行s_inventory_upd_inag()判斷不要遇到錯誤就EXIT FOREACH,應檢查所有單身資料
#161205-00025#10 2016/12/21  By lori       效能調整
#161219-00059#1  2016/12/26  By ouhz       调整aooi260设置了单位换算后,axmt540审核后，再拣量数量错误（多了1000倍）
#161221-00064#17 2017/01/10  By zhujing    增加pmao000(1-采购，2-销售),用于区分axmi120和apmi120数据显示
#170116-00044#2  2017/01/16  By dorislai   若料號為費用性料號，不需異動庫儲批
#170117-00044#2  2017/01/19  By ouhz       调整出货单在途/非在途仓库对应的库存管理特征给值问题
#170215-00050#1  2017/02/16  By ouhz       调整出货性质为签收订单出货/调拨订单/借货订单时s_axmt540_inaj_ins()的储位/库存管理特征给值问题
#170301-00030#1  2017/03/01  By 09257      g_prog整批調整
#170307-00015#6  2017/03/08  By09232        ROWNUM写法批量调整 
#170309-00045#1  2017/03/21  By 08992      修改s_axmt540_inaj_ins不帶入儲位
#170323-00095#1  2017/03/25  By 08992      修正出貨單過帳流程，庫位必須要有儲位，過帳檢查是否有輸入儲位
#170326-00004#3  2017/03/27  By sakura     FUNCTION s_axmt540_get_exchange中,判斷傳入的幣別與ooef016相同,則自動匯率給1
#170324-00033#1  2017/03/30  By sakura     s_axmt540_ship_chk()中s_axmt540_pre39與s_axmt540_pre40兩個SQL應該要多串xrcb_t,原本拿xrca018與xrca064來過濾訂單單號,改成xrcb002與xrcb003
#170325-00029#1  2017/03/31  By 08992      修正有走出通時，出貨單取消確認，不寫入出通單的在揀、備置(inan_t、inap_t)
#170325-00027#1  2017/04/05  By 08993      1.結算資料，已產生帳款，提示"已有產生帳款之結算資料，不可取消確認"
#                                          2.結算資料皆未產生帳款，詢問"已有結算資料，是否刪除結算資料"
#                                            是=>刪除結算資料，取消確認；否=>不可取消確認
#                                          3.更換axm-00620的內容，原：出貨單%1項次%2已經存在合約結算檔中，不允許還原！
#                                                                改成：出貨單%1項次%2，已經存在銷售合約結算檔中，不允許還原！
#170406-00007#1  2017/04/06  By ouhz       调整出货来源为出通单时，设置了超交率，修改出货数量报错问题
#170328-00060#1  2017/04/17  By 08992      可出貨的出貨數量SQL錯誤
#170427-00007#4  2017/04/25  By 07024      UPDATE xmdd_t時，LOCK該筆資料
#170327-00082#1  2017/05/09  By 02295      借货出货单的库存异动类型给401
#170331-00009#1  2017/05/10  By 08992      修正庫存更新傳參錯誤導致無法過帳還原
#170516-00056#1  2017/05/22  By fionchen   增加取得單據單身總額function
#170329-00046#21 2017/05/24  By 08992      因應尾差調整，新增的FUNCTION，下方敘述為「FUNCTION名:功能」
#                                          1.s_axmt540_chk_xmdl025:檢查單身是否有多稅別 或 稅別是否有應用公式計算
#                                          2.s_axmt540_get_xmdlamt:取得相關金額(總未稅金額/總含稅金額/總稅額)
#                                          3.s_axmt540_unconf_xrcd:取消確認，將分攤後的結果還原
#                                          4.s_axmt540_tax_recount:計算單頭總額、單身尾差調整(與axmt540_total_count相同)
#                                          5.s_axmt540_get_amount:取得未稅金額、含稅金額、稅額(與axmt540_get_amount相同)
#                                          6.s_axmt540_adjust_xmdl:單身尾差調整(單筆的與xrcd筆對)
#                                          7.s_axmt540_upd_xmdk_amount:更新單頭 總未稅金額/總含稅金額/總稅額
#170516-00005#1  2017/05/27  By fionchen   出貨單別設定不撿核在撿量也需撿核備置量
#170407-00018#1  2017/05/31  By 08992      修正出貨過帳沒有回寫訂單備置已沖銷量
#170601-00082#1  2017/06/01  By Sarah      執行axmt580新增就直接放棄,程式會直接當掉,因為FUNCTION s_axmt540_get_xmdlamt()段檢查傳入參數為空時,只有一個回傳值(應該有四個回傳值才對)
#170603-00039#1  2017/06/06  By 08992      修正訂單走出通確認、過帳沒有檢查在揀量
#170607-00026#1  2017/06/08  By ouhz       调整当订单设置订金并且2:需立应收账款方可出货时，加管控预收单审核时才能出货
#170608-00043#1  2017/06/09  By ouhz       调整出通单单别参数设置D-BAS-0060=3时，axmt540审核后根据sum(xmdh017)回写订单的已出通量
#170609-00040#1  2017/06/12  By ywtsai     供應商直送訂單需依照實際出貨單數量產生
#160908-00003#4  2017/06/14  By Reanna     若已審核未過帳的出貨單已立對帳單(aist310)，則不可取消確認、作廢....
#170618-00027#1  2017/06/18  By 06137      修正整測問題：出通單的已转出货单数量，在出貨單審核時没有回写。
#170718-00022#1  2017/07/25  By 08992      修改作廢處理段，已經作廢的製造批序號在新增的單據上能夠使用
#170810-00021#1  2017/08/10  By catmoon    出通數量需總和無作廢的出通單
#160929-00038#2  2017/08/21  By lixiang    计价数量栏位处理，先预设带出剩余的计价数量，不用单位换算重新计算
#170724-00041#4  2017/08/22  by sakura     s_inventory_check_inan()增加參數'p_imafsite',流通傳ALL,製造傳g_site或null
#170605-00020#16 2017/09/01  By Sarah      FUNCTION s_axmt540_xmdl015_chk()中需判斷inaa007='1'才檢查資料須存在inab_t中
#170906-00038#1  2017/09/12  By ouhz       调整直运订单出货时自动产生收货入库，pmdt084需给值'Y'问题
#170809-00006#6  2017/09/14  By 10042      1.多角拋轉單據不檢查部門的法人設定 2.人員檢查改成v_ooag001
#170922-00048#7  2017/09/25  By 07423      修正s_tax_ins傳入匯率錯誤問題
#170726-00040#1  2017/09/28  By 08992      1.控卡一張出通單只能產生一張出貨單，如有二個項次，項次二為轉出貨，出貨單確認回寫實際出通量欄位回寫0，
#                                            若需再出貨要另立出通單
#                                          2.出貨單取消確認回寫實際出通量…等欄位時，增加加檢查，如已有其他出通單，則數量不可大於可出通量
#171010-00005#1  2017/10/12  By 08734      调整超交率的算法
#171013-00043#1  2017/10/25  By 05599      在审核段增加控管,如果单头在途仓与单身出货仓库有相同的报错提示,出货仓库不可以与在途仓一样
#170302-00045#3  2017/10/30  By 08993      修改訂單SQL條件用到xmdcsite的，換成xmdcunit
#171130-00043#1  2017/12/01  By 08525      還原170516-00005的調整
#171205-00037#1  2017/12/06  By 00272      過帳(確認時不檢查)或出庫單據考慮在揀量時,庫位才不可為空
#170618-00400#1  2017/12/19  By 09042      確認時增加判斷，庫位、儲位需為已存在之有效庫位
#171219-00022#16 2017/12/25  by 09767      延續171113-00003，call ainp001的程式段要移至各主程式
#170618-00261#2  2017/12/21  By 08992      調整結關日，單據新增時不預設，過帳時判斷，外銷且結關日為空，則預設為過帳日
#170619-00049#2  2017/01/08  By 08992      增加判斷若是續拋傳入global變數
#171214-00052#17 2018/01/16  By 08992      取消單據取消確認時執行s_axmt540_unconf_xrcd()將分攤後的結果還原為未分攤的部份
#180129-00048#1  2018/01/30  By 10046      修正FUNCTION:s_axmt540_makings_no，回傳值數量加上l_flag
#171214-00053#2  2018/02/05  By 09042      子件 特性代碼為9.樣品時不能更新axmi125(xmag_t)及aimm211的imai221/201.202.223.224.212
#180130-00029#1  2018/02/05  By 06021      调整供应商直送时出货单过账产生收货入库后报sub-00633错误
#180207-00007#1  2018/02/07  By 09042      修正171214-00053#2问题 s_axmt540.4gl CALL s_aooi160_get_exrate('1',g_site,g_today,l_xmdl024,g_ooef016,0,l_scc40) RETURNING l_rate 第4个传参有误！
#170925-00016#5  2018/02/07  By 10042      將多角流程自動拋轉(E-BAS-0022)='Y'與還原移至sub
#170617-00078#7  2018/02/06  By 08992      新增s_axmt540_show_aicerrmsg顯示拋轉錯誤匯總訊息
#171220-00020#1  2018/03/07  By 08992      修正出貨單確認時沒有一併更新計價數量
#171222-00011#2  2018/03/13  By 06137      1.統銷統收出貨單過帳時，增加判斷，如為一般訂單維持目前處理方式，如為簽收訂單，不執行產生接單站出貨單動作，執行原簽收調撥段且必輸回寫訂單的已出貨量
#                                          →s_axmt540有透過呼叫s_aic_carry_gen_tri_sb產生第0站的出貨單，請再統銷統收的判斷多加，訂單性質=1:一般訂單，才跑s_aic_carry_gen_tri_sb
#                                          →簽收出貨單過帳時，需另外檢查數量是否有更新回訂單的已出貨量(xmdd014)
#180316-00018#1  2018/03/16  By 04441      於s_axmt540_post_upd()將庫存異動s_axmt540_inag_inaj_upd()往後挪至更新在揀和備置量之後
#170930-00013#15 2018/03/19  by 09767      资料存在进出口明细资料中，不可取消审核
#180316-00044#1  2018/03/22  By 06137      統銷統收產生之接單站出貨單，不可執行過帳還原,調整s_axmt540_aic_auto_reduce內容
#180103-00036#4  2018/04/10  By 10042      1.多角流程銷售逆拋確認時，加檢查起始站訂單多帳期設定是否影響出貨
#                                          2.修正多期帳管出貨模式選：4:依已收款金額出貨，有打預收單，出貨單單據確認檢查，仍顯示無預收單的錯誤
#180323-00035#1  2018/04/17  By 10042      出貨單過帳不需重新取價
#180428-00007#1  2018/04/28  By 02295      出通转出货单控管选择:3.一对一(回写出通量)时,出货单过账回写出通单的实际数量时,一并回写检验合格量
#180430-00014#1  2018/05/02  By 00272      供應商直送訂單流程,透過axmt540扣帳所產生的入庫單,其入庫單據的單據日期=扣帳日期=前方單據axmt540的扣帳日期
#180428-00009#1  2018/05/07  By 02295      出通转出货单控管选择:3.一对一(回写出通量)时,出货单取消审核时,回写出通单实际数量,需要如果数量超过订单可转出通单数量时,回写数量为最大可转出通量
#170105-00057#4  2018/05/24  By 06137      多角走中斷時，銷退需加判斷已續拋的量才可銷退，拋轉時不中斷，但要自動配對出貨單號
#                                          調整有中斷點時，多角續拋回寫最終站出貨單之已簽收量的時間，原本是續拋第0站出貨扣帳時回寫，改為拋轉回寫
#180702-00019#1  2018/07/02  By 02111      增加單據項次。
#171218-00024#8  2018/07/03  By 07024      1.修正批號檢查，錯誤顯示再左下角，沒有彈跳出來的問題
#                                          2.新增一個s_axmt540_continue_chk，判斷是否為多角續拋(for axmt540.axmp540使用)
#180704-00021#1  2018/07/06  By 10130      修正用仓储批+库存特征会抓取多笔数据导致审核失败
#161021-00012#7  2018/07/06  By 06137      調整s_axmt540_client_chk，將s_control_chk_doc改成使用s_control_check_customer校驗控制組資料
#180705-00102#1   18/07/06 By 10130   修正axmt520/axmt540的报错码
#171218-00024#2  2018/07/18  By 07024      過帳檢查：1.增加銷售正拋時，應檢查最終站的庫存是否足夠(製造批序號相同)
#                                                   2.續拋多增加：(1)製造批序號，最終站的可續拋量是否足夠
#                                                                (2)可續拋數量檢查，條件多加入庫存管理特徵
#                                                   3.過帳時，批號不受aimm212的控制，只要有庫存，就能出貨
#180712-00076#1  2018/07/25  By 06137      多角性質:3.統銷統收時，出貨據點的出貨單過帳時不進行信用額度處理
#180802-00058#1  2018/08/03  By 07024      修正統銷統收(簽收流程)，同個項次，出貨單拋轉完，第二次打出貨單，過帳時，已出貨數量(xmdd014)回寫錯誤的問題
#180806-00038#1  2018/08/09  By 10042      來源為直送訂單的出貨單過帳，產生收貨入庫單時，只產生本次出貨的訂單項次、項序、分批序
#180810-00050#1  2018/08/13  By 10130      审核时新增管控当单价位0时不可审核
#180111-00043#81 2018/08/06  By 09505      修改设计器产生方法的时候说明默认给值是CALL s_aooi150_ins (传入参数)，将方法改为此方法的实际用途
#180814-00057#1  2018/09/04  By 02159      將s_axmt540_inaa_chk()中的axm-00898控卡拿掉
#180918-00016#1  2018/09/19  By 05423      费用料号过账时，不用控卡库储必输,但如果有录入，需要检核库位储位规则
#180921-00031#1  2018/09/25  By 10046      修正s_axmt540_xmdl_xmdm_chk()，如果是多庫儲批=Y，應改抓取xmdm_t的庫儲批資料
#181002-00013#1  2018/10/03  By 10042      增加FUNCTION s_axmt520_ws_postprocess()，讓BPM使用
#181005-00009#5  2018/10/16  By 07024      1.加上多庫儲，單據確認時，出貨數量與多庫儲總數量的比對
#                                          2.修正可出通量計算錯誤的問題
#180808-00012#1  2018/10/23  By 07024      出貨總額需與訂單總額一致(D-BAS-0088)='Y'，多次出貨，自動將差額分攤至此項次最後一筆出貨資料
#181026-00022#2  2018/10/29  By 10042      FUNCTION s_axmt520_ws_postprocess()先mark
#181001-00015#84 2018/10/31  By 10046      修正SQL無ENT條件
#181031-00015#1  2018/11/02  By 10046      延續180921-00031#1，修正多庫儲批檢查時，沒有分別依各項次的xmdl013(多庫儲批出貨)設定來檢查
#181102-00013#1  2018/11/07  By 00272      #180810-00050#1 控卡不正確,樣品時,單價需可以為0
#181102-00040#1  2018/11/21  By 10046      修正當來源訂單案時，出貨單仍可過帳
#181011-00007#1  2018/11/27  By 06978      修正出貨單為多倉儲批時，抓取未確認數量會造成-284的錯誤
#181127-00047#1  2018/11/28  By 10042      s_axmt540_xmdl_xmdm_chk增加一個傳參，判斷是否檢查在揀量
#181030-00017#2  2018/12/07  By 10042      1.修改s_axmt540_get_xmdlamt，單身只要有一筆來源訂單是D-BAS-0088 = 'Y'，要走多稅別的段落
#                                          2.修改s_axmt540_adjust_last_amt，出貨+已出貨的數量要轉成套數才能跟xmdc007比較
#181219-00057#1  2018/12/22  By 06137      修正若來源出通單的單別參數"出通轉出貨單控管"是設置'3:一對一(差異部分另起出通單)'時,出貨單確認時回寫對應訂單的已轉出通量錯誤
#190111-00036#1  2019/01/15  by 09767      更新在检量之前，先检核在捡量，防止多张出货单(单身料是同一仓库同一料的情况)同时审核的时候，出现在捡量>库存量的情况
#190125-00036#1  2019/01/28  by 09767      出通单单身与出货单单身关联条件不对
#190125-00005#1  2019/01/30  By 10042      s_axmt540_xmdh_p這句SQL要加上排除作廢資料
#190401-00045#1  2019/04/10  By 07024      流程：訂單-出貨，訂單有換貨數量，修正打出貨單時，計價數量沒有計算到的問題
#190312-00016#1  2019/04/11  By 07024      一對一(回寫出通量)，計價數量也要回寫，修正訂單同一項次，多次出通，計價數量錯誤的問題
#190417-00053#1  2019/04/25  By 06021      修正190111-00036#1，调整出货单单身出同订单+项次+仓储批，报sub-00633错误问题
#190423-00040#1  2019/04/26  By 02111      調整抓取 xrcc_t 原幣收款沖帳金額 的邏輯。
#190507-00045#1  2019/05/08  By 06021      修正180806-00038#1，订单送货模式设置供应商直送，订单项次不是从1开始时出货单过账报错问题
#190521-00006#1  2019/05/21  By 10983      修正l_site为null时，s_credit报错。
#190225-00018#1  2019/05/22  By 02159      修正#170324-00033#1,當有多交期付款分項次時,在SQL條件需用axrt310單頭來源單號(xrca018)與訂金序(xrca064) 當條件處理
#190522-00018#1  2019/05/23  By 10130      修正#190111-00036#1 检查在捡量时没有控管到单据别是否勾选考虑在捡量
#190523-00002#1  2019/05/23  By 02111      判斷出貨單過帳日當其是否有產生發出商品數據，若有就不可以過帳還原。
#190523-00039#1  2019/05/23  By 00272      出貨單[確認]後會產生axmi125是CALL s_axmt540_confe_other(),此FUNCTION內有用到l_oodb005和l_oodb006但是都沒有任何程式段給值
#190521-00023#2  2019/06/10  By 01366      借貨出貨過帳時，不異動信用額度資料
#190606-00023#1  2019/06/19  By 10983      多角正抛首站，出货单过账不检查库存，但要产生对应的inaj档。
#190705-00045#4  2019/07/10  By 12133      調整交易單據，於確認檢查時，判斷"不使用"計價單位，且計價單位與計價數量與交易單位、交易數量不符者
#                                          1.更新計價單位、計價數量=交易單位、交易數量
#                                          2.重計該筆單身未稅金額、稅額、含稅金額
#                                          3.重計單頭總未稅金額、總稅額、總含稅金額
#                                          4.進行單身尾差處理
#190604-00053#1  2019/07/12  By 02111      單別參數設置 [訂單總額與出貨總額一致] 時，推算訂單轉出貨單剩餘金額時，沒有考慮 2:銷退依原訂單出貨 的銷退單。
#190718-00056#1  2019/07/19  By 01366      調整多角銷售正拋首站的出貨單不更新在揀量
#190719-00024#1  2019/07/22  By 10983      直送订单出货不检查在捡量。
#190722-00039#1  2019/07/23  By 01996      直送订单再产生收货入库单,抓取的pmdp004,pmdp005,pmdp006 需要关联条件,订单单身的xmdc032 = '3'.供应商直送
#190730-00009#1  2019/08/23  By 02111      axmt541 過帳時，產生在途倉的製造批序號。
#190831-00003#1  2019/09/02  By 01996      出货单审核/取消审核,增加更新出通单计价数量的逻辑
#190702-00010#16 2019/09/05  By 10042      OQC確認後與取消確認前因應sQMS所做的調整
#190702-00010#20 2019/09/25  By 07423      sQMS整合測試問題調整
#190927-00018#1  2019/09/27  By 10983      調整出貨單不能過賬還原的錯誤。
#190926-00009#1  2019/09/26  By 01996      出货性质为4.调拨订单 不做信用额度控制
#191031-00033#1  2019/11/06  By 10983      调整l_para_data1 定义类型错误。
#191111-00001#1  2019/11/11  By 01996      出通转出货控制不为'3'时,无需回写计价数量
#190802-00035#4  2019/12/05  By 01534      調整s_credit_check_xmac004()傳參
#191212-00041#1  2020/01/17  By 10042      客户使用複合稅，修改單價時，金額和稅額計算正確，保存後金額和税額欄位被清成0
#200107-00018#1  2020/02/11  By 01996      在拣量检查s_axmt540_xmdl014_xmdl015_xmdl016_xmdk052_chk() 中需重新抓取多角设定资料
#191227-00008#1  2020/02/12  By 01996      抓取xmdl_t单身资料时,xmdlseq 不给写死条件为1
#191213-00012#1  2019/12/17  By 01996      补充190718-00056#1的调整,多角销售首站,不更新,不检查在拣量
#200221-00005#1  2020/02/24  By 01996      调拨订单过账需要写入入库的inao_t 
#200228-00023#1  2020/03/11  By 13130      过账时，单身多个项次均存在不能出货事项时，应一并提错，而非只报最先一项的错误
#200226-00039#1  2020/03/24  By 00593      確認時報錯sub-01454"[部门%1的所属法人] 必须与 [当前据点的所属法人] 相同！",傳入的傳參應該是部門代號,誤傳了業務人員
#200415-00017#1  2020/04/15  By 06978      修改直送訂單出貨產生收貨入庫單時，需依照對應採購單產生入庫明細
#191023-00015#1  2020/04/22  By 12290      将原先审核时对制造批序号进行的检查，改为过账时进行检查
#200116-00020#16 2020/04/28  By 12133      單據單身是否進行尾差分攤增加判斷，依發票類型的計稅原則做判斷
#200511-00030#1  2020/05/11  By 11515      修正：axmt542过账报插入inao_t表违反唯一限制，却能过账的问题
#200616-00081#1  2020/06/18  By 06978      修正訂單訂金若需收款完成才可出貨，則抓取訂金帳款單時，需判斷是否有對帳單號
#200521-00022#1  2020/07/02  By 00902      判斷S-FIN-1003參數=4.發出商品及凍結發出成本 且 "發出商品開帳單別否"參數=Y時，則略過原本的檢查與處理段，直接更新狀態碼與最近修改者、最近修改日期
#200722-00018#1  2020/07/27  By 10130      修正出货计价数量异常问题
#200820-00037#1  2020/08/13  By 01534      直送訂單過賬報錯
#200904-00008#1  2020/09/04  By 06978      修正單價不可為0的報錯訊息應該用axm-00971
#200910-00010#1  2020/09/10  By 06978      修正訂單與出貨總額需一致的金額差異判斷增加未稅金額判斷
#200916-00004#1  2020/09/16  By 06978      修正直送訂單的出貨單確認時不需要檢核在撿量
#200916-00013#1  2020/09/23  By 01534      调整PGS(rownum)问题
#200617-00022#9  2020/09/28  By 12133      單頭稅別使用"依料件設定"時，單身稅別要增加控卡，稅別的含稅否需與單頭一致，不可含未稅混雜
#201007-00009#1  2020/10/07  By 06978      修正D-BAS-0088訂單總金額需與出貨總金額一致，調整差額時，應調整再單身金額最大筆
#201021-00009#1  2020/10/21  By 13132      修改35p运行时log档报-201问题
#201030-00027#2  2020/11/04  By 12787      過帳處理庫存異動時(處理段s_axmt540_inag_inaj_upd)，如為簽收訂單，且參數「走簽收流程，但依出貨認列發出商品否」=Y時，l_warehouse給在途非成本倉   ※搜尋xmdk039
#200731-00049#1  2020/11/26  By 10130      出货过账重新取汇率的逻辑要加上控管汇率计算基准不能为1
#201020-00031#1  2020/10/21  By 01996      调整190423-00040的错误,应该判断S-FIN-1002 = 3 时 才增加 xrccseq = xrcbseq 的条件
#201201-00008#1  2020/12/01  By 06978      修正銷退判斷計稅原則不應受到出貨總額需與訂單一致的影響
#201215-00027#1  2020/12/15  By 06978      修正出貨審核時，與帳款收款金額核對計算出貨含稅金額，不可計入簽收出貨單金額
#201209-00028#7  2020/12/15  By 12133      1.原單據確認時，在conf_upd段才會寫入在揀相關資料，增加在conf_chk段資料檢查無誤後，先行寫入 
#                                          2.處理在揀資料時，增加判斷已存在在揀明細不可重覆執行 
#                                          3.bpm送簽失敗時執行(s_axmt540_ws_breakprocess)進行在揀資料刪除還原…等動作
#201216-00027#5  2020/12/22  By 12787      判斷成本倉還是非成本倉，原先是依參數...,改成xmdk新收入準則欄位比較準確
#201224-00035#1  2020/12/24  By 06978      修正r_success_chkALL未依照實際失敗狀況更新問題
#201204-00025#1  2021/01/08  By 12787      多角銷售正拋，出貨單確認寫入在揀量時，改寫入最終站的在揀資料,最終站出貨單過帳後，也需刪除此在揀資料
#210121-00024#1  2021/01/25  By 10983      出货单取消审核时，若来源出通单中止出货，则需额外回写一遍订单资料。
#210127-00024#1  2021/01/27  By 05423      续#201204-00025#1，在拣量写入对应站点后，下方的在拣量检核也要用相应的据点进行检核
#200929-00014#4  2021/02/03  By 01534      跨法人調撥處理 1.資料來源(xmdk085)增加選項"6.集團交易轉入"
#                                          1-1.過帳還原增加判斷，資料來源="6"時，不可過帳還原且"維謢單價"ACTION灰掉不可使用
#                                          2.銷退單增加判斷，資料來源="6"時，不可維護銷退單
#210324-00031#1  2021/03/24  By 05423      修正出货单来源订单有软备置的时候，依然产生在拣量的问题，应该扣除掉已经备置的数量
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"
GLOBALS "../../../com/sub/4gl/s_apmm101.inc"   #150721-00001 160115 By earl add
#170619-00049#2-s add
GLOBALS
DEFINE g_aic_continue       LIKE type_t.num5       #判斷多角是否續拋
DEFINE g_ooef016            LIKE ooef_t.ooef016            #取本幣
DEFINE g_aic_direct         LIKE type_t.num5       #記錄是否為多角正拋(TRUE:是 FALSE:否) #171218-00024#2-add
END GLOBALS
#170619-00049#2-e add
#end add-point
 
{</section>}
 
{<section id="s_axmt540.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
#171218-00024#2-s-add
DEFINE g_aic        RECORD
             icab003      LIKE icab_t.icab003, #營運據點
             icac007      LIKE icac_t.icac007, #出貨單單別
             icad004      LIKE icad_t.icad004, #庫位
             icad005      LIKE icad_t.icad005  #儲位
       END RECORD
#171218-00024#2-e-add
#210324-00031#1 add-S
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#210324-00031#1 add-E
#end add-point
 
{</section>}
 
{<section id="s_axmt540.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
 
#end add-point
 
{</section>}
 
{<section id="s_axmt540.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_axmt540.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 定義LOCK CURSOR
# Memo...........:
# Usage..........: CALL s_axmt540_cursor()
# Input parameter: 
# Return code....: 
# Date & Author..: 2017/05/04 By 07024 (#170427-00007#4)
# Modify.........:
###############################################################################
PUBLIC FUNCTION s_axmt540_cursor()
   DEFINE l_sql   STRING
   
   LET l_sql = " SELECT xmdddocno FROM xmdd_t ",
               "  WHERE xmddent = ?",
               "    AND xmdddocno = ? ",
               "    AND xmddseq = ? ",
               "    AND xmddseq1 = ? ",
               "    AND xmddseq2 = ? ",
               "    FOR UPDATE NOWAIT"
   DECLARE s_axmt540_cl CURSOR FROM l_sql
END FUNCTION
################################################################################
# Descriptions...: 出貨單作廢流程
# Memo...........: 對出貨單據進行單據作廢檢查
# Usage..........: CALL s_axmt540_invalid_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 出貨單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_invalid_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_axmt540_stus_chk(p_xmdkdocno,'void') THEN
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單過帳流程
# Memo...........: 對出貨單據進行庫存過帳檢查
# Usage..........: CALL s_axmt540_post_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 單據單號
#                : 
# Return code....: r_success  執行結果
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_post_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_slip          LIKE ooba_t.ooba001
   DEFINE l_xmdk028       LIKE xmdk_t.xmdk028
   DEFINE l_xmdk029       LIKE xmdk_t.xmdk029
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002
   DEFINE l_xmdg024       LIKE xmdg_t.xmdg024     #包裝單製作
   DEFINE l_xmdg025       LIKE xmdg_t.xmdg025     #Invoice製作
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_inaa007      LIKE inaa_t.inaa007   #170323-00095#1  add   
   DEFINE l_xmdl        RECORD
             xmdlseq      LIKE xmdl_t.xmdlseq,
             xmdl003      LIKE xmdl_t.xmdl003,  #150917-00001#3  2016/01/21  By earl add
             xmdl004      LIKE xmdl_t.xmdl004,  #150917-00001#3  2016/01/21  By earl add
             xmdl005      LIKE xmdl_t.xmdl005,  #150917-00001#3  2016/01/21  By earl add
             xmdl006      LIKE xmdl_t.xmdl006,  #150917-00001#3  2016/01/21  By earl add
             xmdl008      LIKE xmdl_t.xmdl008,  #160127-00035#1  add
             xmdl016      LIKE xmdl_t.xmdl016,  #160127-00035#1  add
             xmdl013      LIKE xmdl_t.xmdl013,  #160922-00024#1  add
             xmdl018      LIKE xmdl_t.xmdl018,
             xmdl023      LIKE xmdl_t.xmdl023,
             xmdl014      LIKE xmdl_t.xmdl014,  #170323-00095#1 add
             xmdl015      LIKE xmdl_t.xmdl015,  #170323-00095#1 add
             xmdl056      LIKE xmdl_t.xmdl056             
                        END RECORD
   #150917-00001#3  2016/01/21  By earl add s
   DEFINE l_xmdm        RECORD
             xmdmseq1     LIKE xmdm_t.xmdmseq1,
             #171218-00024#2-s-add
             xmdm001      LIKE xmdm_t.xmdm001,
             xmdm002      LIKE xmdm_t.xmdm002,
             xmdm005      LIKE xmdm_t.xmdm005,
             xmdm006      LIKE xmdm_t.xmdm006,
             #171218-00024#2-e-add
             xmdm007      LIKE xmdm_t.xmdm007
             #171218-00024#2-s-add
            ,xmdm008      LIKE xmdm_t.xmdm008,
             xmdm009      LIKE xmdm_t.xmdm009,
             xmdm033      LIKE xmdm_t.xmdm033
             #171218-00024#2-e-add
                        END RECORD
   
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_chk           LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE l_qty           LIKE xmdl_t.xmdl205     #未續拋數量
   DEFINE l_qty_batch     LIKE xmdl_t.xmdl205     #未續拋數量(考慮批號)
   #150917-00001#3  2016/01/21  By earl add e
   DEFINE l_imaf061       LIKE imaf_t.imaf061     #160127-00035#1  add
   DEFINE l_n1            LIKE type_t.num5        #160922-00024#1  add
   DEFINE l_n2            LIKE type_t.num5        #160922-00024#1  add
   DEFINE l_count         LIKE type_t.num5        #add--161109-00016#1 By shiun
   #170619-00049#2-s add
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add 
   #191023-00015#1 add-S   
   DEFINE l_xmdmseq LIKE xmdm_t.xmdmseq,
          l_xmdmseq1 LIKE xmdm_t.xmdmseq1,
          l_xmdm001 LIKE xmdm_t.xmdm001,
          l_xmdm008 LIKE xmdm_t.xmdm008,
          l_xmdm009 LIKE xmdm_t.xmdm009,
          l_imaf071 LIKE imaf_t.imaf071,
          l_imaf081 LIKE imaf_t.imaf081,
          l_imaf053 LIKE imaf_t.imaf053,
          l_imaf054 LIKE imaf_t.imaf054,         
          l_inao012 LIKE inao_t.inao012,
          l_imaf055 LIKE imaf_t.imaf055,
          l_xmdm033 LIKE xmdm_t.xmdm033  
   #191023-00015#1 add-S
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_axmt540_stus_chk(p_xmdkdocno,'pos') THEN
      LET r_success = FALSE
   END IF

   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''
 
   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
    # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add   

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   #171218-00024#2-s-add
   LET g_aic_direct = FALSE
   INITIALIZE g_aic.* TO NULL
   #取得是否為多角正拋
   CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.icab003,g_aic.icac007,g_aic.icad004,g_aic.icad005
   #171218-00024#2-e-add

   #在途庫位檢查
   IF NOT s_axmt540_xmdk039_xmdk040_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #160408-00035#9-add-(S)
   #檢查出貨明細與多庫儲批數量是否吻合
   #IF NOT s_axmt540_xmdl_xmdm_chk(p_xmdkdocno) THEN   #181127-00047#1 mark
   IF NOT s_axmt540_xmdl_xmdm_chk(p_xmdkdocno,2) THEN  #181127-00047#1 add  #不檢查在揀量
      LET r_success = FALSE
   END IF
   #160408-00035#9-add-(E)
   #150706 by 04441 add start
   IF NOT s_axmt540_control_check_stock(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #150706 by 04441 add end

   LET l_sql = "SELECT DISTINCT xmdl001,xmdl002 FROM xmdl_t",
               " WHERE xmdlent = '",g_enterprise,"'",
               "   AND xmdldocno = '",p_xmdkdocno,"'"               
   PREPARE s_axmt540_pre16 FROM l_sql
   DECLARE s_axmt540_cs16 CURSOR FOR s_axmt540_pre16
   
   LET l_sql = "SELECT xmdg024,xmdg025",
               "  FROM xmdg_t",
               " WHERE xmdgent = '",g_enterprise,"'",
               "   AND xmdgdocno = ?"
   PREPARE s_axmt540_pre13 FROM l_sql
   
   CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
   IF NOT l_success THEN
      LET r_success = FALSE
   END IF     
   
   LET l_xmdk028 = ''
   LET l_xmdk029 = ''
   LET l_xmdk044 = ''           #150917-00001#3  2016/01/21  By earl add
   SELECT xmdk028,xmdk029,
          xmdk044               #150917-00001#3  2016/01/21  By earl add
     INTO l_xmdk028,l_xmdk029,
          l_xmdk044             #150917-00001#3  2016/01/21  By earl add
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   #191023-00015#1 add-S  过账时检查批序号
   #檢查製造批序號數量是否一致
   DECLARE inao_chk_cs CURSOR FOR 
      SELECT xmdmseq,xmdmseq1,xmdm001,xmdm008,xmdm009,xmdm033 FROM xmdm_t WHERE xmdment = g_enterprise AND xmdmdocno = p_xmdkdocno #160519-00008#8 add xmdm033
   FOREACH inao_chk_cs INTO l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm008,l_xmdm009,l_xmdm033        #160519-00008#8 add xmdm033
      #製造批序號數量須與申請數量一致！
      SELECT imaf071,imaf081,imaf053,imaf054 INTO l_imaf071,l_imaf081,l_imaf053,l_imaf054 FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = l_xmdm001
         
      SELECT COUNT(*) INTO l_n FROM inao_t
       WHERE inaoent = g_enterprise
         AND inaodocno = p_xmdkdocno
         AND inaoseq = l_xmdmseq
         AND inaoseq1= l_xmdmseq1
         
      IF cl_null(l_n) THEN LET l_n = 0 END IF
      
      #料件設置必須使用製造批序號，請維護對應製造批序號的資料！
      IF (l_imaf071 = '1' OR l_imaf081 = '1') AND l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00991'
         LET g_errparam.extend = l_xmdmseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      
      IF l_imaf071 = '1' OR l_imaf081 = '1' OR ((l_imaf071 = '3' OR l_imaf071 = '3') AND l_n > 0 )  THEN
         SELECT SUM(inao012) INTO l_inao012 FROM inao_t
          WHERE inaoent = g_enterprise
            AND inaodocno = p_xmdkdocno
            AND inaoseq = l_xmdmseq
            AND inaoseq1= l_xmdmseq1
         IF cl_null(l_inao012) THEN
            LET l_inao012 = 0
         END IF 
         IF l_imaf054 = 'N' THEN   #不走庫存多單位
            CALL s_aooi250_convert_qty(l_xmdm001,l_imaf053,l_xmdm008,l_inao012)
                 RETURNING l_success,l_inao012
         END IF          
         IF l_inao012 <> l_xmdm009 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'apm-00990'
            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            RETURN r_success          
         END IF         
      END IF
      #設置必須要批號時，批號欄位不可為空
      IF l_imaf071 = '1' THEN
         SELECT COUNT(*) INTO l_n FROM inao_t
           WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno
             AND inaoseq = l_xmdmseq AND inaoseq1 = l_xmdmseq1
             AND (inao008 IS NULL OR inao008 = ' ' )
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'apm-00992'
            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF      
      #設置必須要序號時，序號欄位不可為空
      IF l_imaf081 = '1' THEN
         SELECT COUNT(*) INTO l_n FROM inao_t
           WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno
             AND inaoseq = l_xmdmseq AND inaoseq1 = l_xmdmseq1
             AND (inao009 IS NULL OR inao009 = ' ')
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'apm-00993'
            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success 
         END IF
      END IF
      #160519-00008#8  
      CALL s_axmt540_get_imaf(l_xmdm001) RETURNING l_imaf055,l_imaf061    
      IF l_imaf055 = '1' AND cl_null(l_xmdm033) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_xmdm001
         LET g_errparam.code   = 'sub-00125'         #庫存管理特徵不可為空！  
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #160519-00008#8                                
   END FOREACH  
   #191023-00015#1 add-E

   #出貨單單別參數設置"出貨過帳時要檢查包裝單"
   IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0063') = 'Y' THEN
      IF l_xmdk028 = 'Y' THEN
         LET l_n = 0                 
         SELECT COUNT(xmdlseq) INTO l_n
           FROM xmdl_t
          WHERE xmdlent = g_enterprise
            AND xmdldocno = p_xmdkdocno
            AND NOT EXISTS (SELECT 1 FROM xmel_t,xmem_t
                             WHERE xmelent = xmement AND xmement = xmdlent
                               AND xmeldocno = xmemdocno
                               AND xmel004 = '2'         #包裝單來源為'2:出貨單'
                               AND xmelstus <> 'X'
                               AND xmem001 = xmdldocno
                               AND xmem002 = xmdlseq)
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00417'    #該出貨單無對應之包裝單資料！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
         END IF  
         
      ELSE
         LET l_count = 0   #add--161109-00016#1 By shiun
         FOREACH s_axmt540_cs16 INTO l_xmdl001,l_xmdl002
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               EXIT FOREACH
            END IF
     
            IF cl_null(l_xmdl001) THEN
               CONTINUE FOREACH
            END IF
     
            #mark--161109-00016#1 By shiun--(S)
#            LET l_xmdg024 = ''
#            LET l_xmdg025 = ''
#            EXECUTE s_axmt540_pre13 USING l_xmdl001 INTO l_xmdg024,l_xmdg025
#                        
#            #來源出通單有選包裝單
#            IF l_xmdg024 = 'Y' THEN   
            #mark--161109-00016#1 By shiun--(E)
               #檢核該出貨單是否有對應的包裝單
               LET l_n = 0 
               SELECT COUNT(xmdhseq) INTO l_n
                 FROM xmdh_t
                WHERE xmdhent = g_enterprise
                  AND xmdhdocno = l_xmdl001
                  AND xmdhseq = l_xmdl002
                  AND NOT EXISTS (SELECT 1 FROM xmel_t,xmem_t
                                   WHERE xmelent = xmement AND xmement = xmdhent
                                     AND xmeldocno = xmemdocno
                                     AND xmel004 = '1'         #包裝單來源為'1:出貨通知單'
                                     AND xmelstus <> 'X'
                                     AND xmem001 = xmdhdocno
                                     AND xmem002 = xmdhseq)

               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00419'   #該出貨單之來源出通單%1項次%2無對應之包裝單資料！
                  LET g_errparam.extend = p_xmdkdocno
                  LET g_errparam.popup = TRUE
                  LET g_errparam.replace[1] = l_xmdl001
                  LET g_errparam.replace[2] = l_xmdl002
                  CALL cl_err()

                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF  
#            END IF   #mark--161109-00016#1 By shiun
            LET l_count = l_count + 1   #add--161109-00016#1 By shiun
         END FOREACH
         #add--161109-00016#1 By shiun--(S)
         IF l_count = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00417'    #該出貨單無對應之包裝單資料！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #add--161109-00016#1 By shiun--(E)
      END IF
   END IF

   #出貨單單別參數設置"出貨過帳時要檢查Invoice"
   IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0064') = 'Y' THEN            
      IF l_xmdk029 = 'Y' THEN
         #檢核該出貨單是否有對應的Invoice且Invoice類型為"正式"
         LET l_n = 0      
         SELECT COUNT(xmdlseq) INTO l_n
           FROM xmdl_t
          WHERE xmdlent = g_enterprise
            AND xmdldocno = p_xmdkdocno
            AND NOT EXISTS (SELECT 1 FROM xmdo_t,xmdp_t
                             WHERE xmdoent = xmdpent AND xmdpent = xmdlent
                               AND xmdodocno = xmdpdocno
                               AND xmdo001 = '1'         #Invoice類型為'1:正式Invoice'
                               AND xmdo004 = '2'         #Invoice來源為'2:出貨單'      
                               AND xmdostus <> 'X'
                               AND xmdp001 = xmdldocno
                               AND xmdp002 = xmdlseq) #單號                    
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00186'    #該出貨單無對應類型為"正式Invoice"之Invoice資料！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
         END IF  
         
      ELSE
         LET l_count = 0   #add--161109-00016#1 By shiun
         FOREACH s_axmt540_cs16 INTO l_xmdl001,l_xmdl002
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               EXIT FOREACH
            END IF
     
            IF cl_null(l_xmdl001) THEN
               CONTINUE FOREACH
            END IF
     
            #mark--161109-00016#1 By shiun--(S)
#            LET l_xmdg024 = ''
#            LET l_xmdg025 = ''
#            EXECUTE s_axmt540_pre13 USING l_xmdl001 INTO l_xmdg024,l_xmdg025
#                        
#            #來源出通單有選Invoice
#            IF l_xmdg025 = 'Y' THEN
            #mark--161109-00016#1 By shiun--(E)
               #檢核該出貨單是否有對應的Invoice且Invoice類型為"正式"             
               LET l_n = 0
               SELECT COUNT(xmdhseq) INTO l_n
                 FROM xmdh_t
                WHERE xmdhent = g_enterprise
                  AND xmdhdocno = l_xmdl001
                  AND xmdhseq = l_xmdl002
                  AND NOT EXISTS (SELECT 1 FROM xmdo_t,xmdp_t
                                   WHERE xmdoent = xmdpent AND xmdpent = xmdhent
                                     AND xmdodocno = xmdpdocno
                                     AND xmdo001 = '1'         #Invoice類型為'1:正式Invoice'
                                     AND xmdo004 = '1'         #Invoice來源為'1:出通單'
                                     AND xmdostus <> 'X'
                                     AND xmdp001 = xmdhdocno
                                     AND xmdp002 = xmdhseq) #單號
               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00418'   #該出貨單之來源出通單%1項次%2無對應類型為"正式Invoice"之Invoice資料！
                  LET g_errparam.extend = l_xmdl001
                  LET g_errparam.popup = TRUE
                  LET g_errparam.replace[1] = l_xmdl001
                  LET g_errparam.replace[2] = l_xmdl002
                  CALL cl_err()

                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF  
#            END IF   #mark--161109-00016#1 By shiun
            LET l_count = l_count + 1
         END FOREACH
         #add--161109-00016#1 By shiun--(S)
         IF l_count = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00186'    #該出貨單無對應類型為"正式Invoice"之Invoice資料！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #add--161109-00016#1 By shiun--(E)
      END IF
   END IF

   #直送訂單檢核是否有對應的採購單
   IF NOT s_axmt540_direct_process('1',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF

   #檢查需求等候排隊數量
   IF NOT s_axmt540_inas('ckpos',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   
   #檢驗合格量
   LET l_sql = "SELECT xmdlseq,COALESCE(xmdl018,0),xmdl023,COALESCE(xmdl056,0),",
               "       xmdl003,xmdl004,xmdl005,xmdl006, ",   #150917-00001#3  2016/01/21  By earl add
               #"       xmdl008,xmdl016,xmdl013 ",                    #160127-00035#1 add  #160922-00024#1 add xmdl013  #170323-00095#1 mark
               "       xmdl008,xmdl016,xmdl013,xmdl014,xmdl015 ",            #170323-00095#1 add
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_xmdl_pre FROM l_sql
   DECLARE s_axmt540_xmdl_cs CURSOR FOR s_axmt540_xmdl_pre
   
   #150917-00001#3  2016/01/21  By earl add s
   LET l_sql = "SELECT xmdmseq1,xmdm007",
               #171218-00024#2-s-add
               "      ,xmdm001,xmdm002,xmdm005, ",
               "       xmdm006,xmdm008,xmdm009, ",
               "       xmdm033 ",
               #171218-00024#2-e-add
               "  FROM xmdm_t",
               " WHERE xmdment = ",g_enterprise,
               "   AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdmseq = ?"
   PREPARE s_axmt540_xmdm_pre FROM l_sql
   DECLARE s_axmt540_xmdm_cs CURSOR FOR s_axmt540_xmdm_pre
   #150917-00001#3  2016/01/21  By earl add e
   
   INITIALIZE l_xmdl.* TO NULL
   FOREACH s_axmt540_xmdl_cs INTO l_xmdl.xmdlseq,l_xmdl.xmdl018,l_xmdl.xmdl023,l_xmdl.xmdl056,
                                  l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,  #150917-00001#3  2016/01/21  By earl add
                                  l_xmdl.xmdl008,l_xmdl.xmdl016,l_xmdl.xmdl013                  #160127-00035#1 add    #160922-00024#1 add xmdl013
                                  ,l_xmdl.xmdl014,l_xmdl.xmdl015                                #170323-00095#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:s_axmt540_xmdl_cs"
         LET g_errparam.popup = TRUE
         CALL cl_err()         
         LET r_success = FALSE
         EXIT FOREACH
      END IF     
      #170323-00095#1-s
      LET l_inaa007 = ''
      SELECT inaa007 INTO l_inaa007
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = g_site
         AND inaa001 = l_xmdl.xmdl014 
      IF l_inaa007 != '5' AND cl_null(l_xmdl.xmdl015) THEN   
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ain-00271'
         LET g_errparam.extend = l_xmdl.xmdl014
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #170323-00095#1-e       
      #檢驗
      IF l_xmdl.xmdl023 = 'Y' THEN
         IF l_xmdl.xmdl018 > l_xmdl.xmdl056 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00557'   #項次%1出貨數量%2不可大於檢驗合格量%3！
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_xmdl.xmdlseq
            LET g_errparam.replace[2] = l_xmdl.xmdl018
            LET g_errparam.replace[3] = l_xmdl.xmdl056
            CALL cl_err()
            LET r_success = FALSE
            CONTINUE FOREACH
         END IF
      END IF
      #--160127-00035#1--add--(S)
      LET l_imaf061 = ''
      SELECT imaf061 INTO l_imaf061
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = l_xmdl.xmdl008
      #160922-00024#1 add --(S)--
      LET l_n1 = 0
      LET l_n2 = 0
      IF l_xmdl.xmdl013 = 'Y' THEN
         SELECT COUNT(xmdmseq1) INTO l_n1
           FROM xmdm_t
          WHERE xmdment = g_enterprise
            AND xmdmsite = g_site
            AND xmdmdocno = p_xmdkdocno
            AND xmdmseq = l_xmdl.xmdlseq           
            AND (xmdm007 is null OR xmdm007 = ' ')
            
         SELECT COUNT(xmdmseq1) INTO l_n2
           FROM xmdm_t
          WHERE xmdment = g_enterprise
            AND xmdmsite = g_site
            AND xmdmdocno = p_xmdkdocno
            AND xmdmseq = l_xmdl.xmdlseq           
            AND xmdm007 is not null  
            AND xmdm007 <> ' '            
      END IF
      #160922-00024#1 add --(E)--
      #171218-00024#2-s-mark
      #調整成，只要有庫存，就能出貨
      #CASE l_imaf061
      #  WHEN '1'
      #   #IF cl_null(l_xmdl.xmdl016) THEN   #160922-00024#1 mark
      #    #160922-00024 add --(S)--
      #    IF (l_xmdl.xmdl013 = 'N' and cl_null(l_xmdl.xmdl016)) or
      #       (l_xmdl.xmdl013 = 'Y' and l_n1 > 0)                THEN
      #    #160922-00024 add --(E)--
      #      INITIALIZE g_errparam TO NULL
      #      LET g_errparam.code = 'ain-00272'   #當前料件設定必須有批號，批號不可為空！
      #      LET g_errparam.extend = l_xmdl.xmdl008
      #      LET g_errparam.popup = TRUE
      #      CALL cl_err()
      #      LET r_success = FALSE
      #      CONTINUE FOREACH          
      #    END IF
      #  WHEN '2'
      #   #IF NOT cl_null(l_xmdl.xmdl016) THEN  #160922-00024#1 mark
      #    #160922-00024 add --(S)--
      #    IF (l_xmdl.xmdl013 = 'N' and NOT cl_null(l_xmdl.xmdl016)) or
      #       (l_xmdl.xmdl013 = 'Y' and l_n2 > 0)                    THEN
      #    #160922-00024 add --(E)--
      #      INITIALIZE g_errparam TO NULL
      #      LET g_errparam.code = 'asf-00387'   # 當前料件設定不可有批號，批號不可有值！
      #      LET g_errparam.extend = l_xmdl.xmdl008
      #      LET g_errparam.popup = TRUE
      #      CALL cl_err()
      #      LET r_success = FALSE
      #      CONTINUE FOREACH            
      #    END IF
      #END CASE        
      #171218-00024#2-e-mark
      #--160127-00035#1--add--(E)      
   
      #150917-00001#3  2016/01/21  By earl add s
      INITIALIZE l_xmdm.* TO NULL
      OPEN s_axmt540_xmdm_cs USING l_xmdl.xmdlseq
      FOREACH s_axmt540_xmdm_cs INTO l_xmdm.xmdmseq1,l_xmdm.xmdm007
                                     #171218-00024#2-s-add
                                    ,l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm005,
                                     l_xmdm.xmdm006,l_xmdm.xmdm008,l_xmdm.xmdm009,
                                     l_xmdm.xmdm033
                                     #171218-00024#2-e-add
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH s_axmt540_xmdm_cs"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #171218-00024#2-s-mark
         #CALL s_aic_carry_continue_qty(g_site,l_xmdk044,'1',l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,l_xmdm.xmdm007,'','')
         #RETURNING l_chk,l_qty,l_qty_batch
         #171218-00024#2-e-mark
         #171218-00024#2-s-add
         #可續拋量檢查
         CALL s_aic_carry_continue_qty2(g_site,l_xmdk044,'1',l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,l_xmdm.xmdm007,
                                        l_xmdm.xmdm033,'','')
         RETURNING l_chk,l_qty,l_qty_batch
         #171218-00024#2-e-add
         IF l_chk THEN
            IF l_qty_batch < 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00749'  #項次%1 項序%2 多角出貨單"出貨數量"不可大於最終站可續拋數量！
               LET g_errparam.extend = p_xmdkdocno
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_xmdl.xmdlseq
               LET g_errparam.replace[2] = l_xmdm.xmdmseq1
               CALL cl_err()
               
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
         END IF
      END FOREACH
      CLOSE s_axmt540_xmdm_cs
      #150917-00001#3  2016/01/21  By earl add e
   

   
   END FOREACH

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單確認流程
# Memo...........: 對出貨單據進行單據檢查
# Usage..........: CALL s_axmt540_conf_chk()
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 單據單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_axmt540_conf_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_n             LIKE type_t.num10
   DEFINE l_xmdk007       LIKE xmdk_t.xmdk007
   DEFINE l_xmaj007_1     LIKE xmaj_t.xmaj007      #出貨單確認時超限控管方式(據點)
   DEFINE l_xmaj007_2     LIKE xmaj_t.xmaj007      #出貨單確認時超限控管方式(集團)   
   #150821-xianghui-b   
   DEFINE l_xmdmseq LIKE xmdm_t.xmdmseq,
          l_xmdmseq1 LIKE xmdm_t.xmdmseq1,
          l_xmdm001 LIKE xmdm_t.xmdm001,
          l_xmdm008 LIKE xmdm_t.xmdm008,
          l_xmdm009 LIKE xmdm_t.xmdm009,
          l_imaf071 LIKE imaf_t.imaf071,
          l_imaf081 LIKE imaf_t.imaf081,
          l_imaf053 LIKE imaf_t.imaf053,
          l_imaf054 LIKE imaf_t.imaf054,         
          l_inao012 LIKE inao_t.inao012,
          l_success LIKE type_t.num5
   #150821-xianghui-e
   DEFINE l_imaf055        LIKE imaf_t.imaf055  #160519-00008#8
   DEFINE l_imaf061        LIKE imaf_t.imaf061  #160519-00008#8  
   DEFINE l_xmdm033        LIKE xmdm_t.xmdm033  #160519-00008#8  
   DEFINE l_xmdk202        LIKE xmdk_t.xmdk202  #160808-00038#1
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add   
   #180810-00050#1--s
   DEFINE l_xmdk018       LIKE xmdk_t.xmdk018
   DEFINE l_xmah006       LIKE xmah_t.xmah006
   DEFINE l_xmdlseq       LIKE xmdl_t.xmdlseq
   DEFINE l_xmdl024       LIKE xmdl_t.xmdl024
   #180810-00050#1--e
   DEFINE l_cnt           LIKE type_t.num5         #181102-00013#1 add
   DEFINE l_slip          LIKE ooba_t.ooba002      #190702-00010#16 add
   DEFINE l_ooac001       LIKE ooac_t.ooac001      #190702-00010#16 add
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002      #190926-00009#1 add
   #200617-00022#7 add -S-
   DEFINE l_xmdk012       LIKE xmdk_t.xmdk012
   DEFINE l_xmdk014       LIKE xmdk_t.xmdk014
   DEFINE l_xmdl025       LIKE xmdl_t.xmdl025
   DEFINE l_oodb011       LIKE oodb_t.oodb011
   DEFINE l_oodb005       LIKE oodb_t.oodb005
   #200617-00022#7 add -E-
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_axmt540_stus_chk(p_xmdkdocno,'con') THEN
      LET r_success = FALSE
   END IF
   
   #檢查有無輸入單身
   LET l_n = 0
   SELECT COUNT(xmdlseq) INTO l_n
     FROM xmdl_t
    WHERE xmdlent = g_enterprise
      AND xmdldocno = p_xmdkdocno
      
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'ade-00007'  #未輸入單據明細，不可進行確認！ #160321-00016#16 mark
      LET g_errparam.code = 'sub-01322'  #未輸入單據明細，不可進行確認！  #160321-00016#16 add
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF
   
   #190705-00045#4  2019/07/10  By 12133 add---(S)
   IF NOT s_axmt540_conf_pricing_unit(p_xmdkdocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #190705-00045#4  2019/07/10  By 12133 add---(E)
   
   #檢查統銷統收的來源訂單是否都為同一site
   LET l_n = 0
   SELECT COUNT(DISTINCT xmdasite) INTO l_n
     FROM xmdk_t,xmdl_t,xmda_t
    WHERE xmdkent = xmdlent AND xmdlent = xmdaent AND xmdaent = g_enterprise
      AND xmdkdocno = xmdldocno
      AND xmdadocno = xmdl003
      AND xmdkdocno = p_xmdkdocno
      AND xmdk045 = '3'  #3:統銷統收

   IF l_n > 1 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00706'  #"多角性質"為"3.統銷統收"時，來源訂單只可為單一營運據點！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF
   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''
   
   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add 

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   
   #171218-00024#2-s-add
   LET g_aic_direct = FALSE
   INITIALIZE g_aic.* TO NULL
   #取得是否為多角正拋
   CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.icab003,g_aic.icac007,g_aic.icad004,g_aic.icad005
   #171218-00024#2-e-add
   
   #在途庫位檢查
   IF NOT s_axmt540_xmdk039_xmdk040_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #170618-00400#1 add(s)
   #檢查庫存是否為有效
   IF NOT s_axmt540_inaa_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170618-00400#1 add(e)
   #檢查出貨明細與多庫儲批數量是否吻合
   #IF NOT s_axmt540_xmdl_xmdm_chk(p_xmdkdocno) THEN   #181127-00047#1 mark
   IF NOT s_axmt540_xmdl_xmdm_chk(p_xmdkdocno,1) THEN  #181127-00047#1 add  #檢查在揀量
      LET r_success = FALSE
   END IF
   #201209-00028#9 add -S-
   #更新在揀量
   IF NOT s_axmt540_ins_inap(p_xmdkdocno,'1','con') THEN
      LET r_success = FALSE
   END IF
   #201209-00028#9 add -E-

   #檢查出通單之包裝單、Invoice是否一致
   IF NOT s_axmt540_pack_Invoice_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF

   #檢查出通單項次是否均在出貨單
   IF NOT s_axmt540_xmdgseq_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF

   #若出貨單來源為出通單時，檢查出貨數量是否大於出通單的身可轉出貨數量
   #若出貨單來源為訂單時，檢查出貨數量是否大於訂單的可轉出貨數量
   IF NOT s_axmt540_ship_chk(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF

   #信用額度檢查
   LET l_xmdk007 = ''
   LET l_xmdk202 = ''      #160808-00038#1
   SELECT xmdk007,xmdk202,xmdk002 INTO l_xmdk007,l_xmdk202,l_xmdk002    #160808-00038#1 add xmdk020   #190926-00009#1 add xmdk002
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   IF l_xmdk002 <> '4' THEN    #190926-00009#1 add
      CALL s_axmt500_get_credit('6',l_xmdk007) RETURNING l_xmaj007_1,l_xmaj007_2
      IF NOT s_axmt540_credit('1',p_xmdkdocno) THEN
         IF l_xmaj007_1 = '4' OR l_xmaj007_2 = '4' THEN      #拒絕
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00439'   #信用額度已超限，拒絕單據確認！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()         
            LET r_success = FALSE
         ELSE
            IF l_xmaj007_1 = '3' OR l_xmaj007_2 = '3' THEN      #警告
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00515'   #信用額度已超限！
               LET g_errparam.extend = p_xmdkdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()      
            END IF
         END IF      
      END IF
   END IF            #190926-00009#1 add
   #160808-00038#1--(S)
   IF cl_null(l_xmdk202) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = 'aap-00216'
      LET g_errparam.extend = p_xmdkdocno,"-",s_fin_get_colname('','xmdk202')
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #160808-00038#1--(E)

#191023-00015#1 mark-S
#   #150821-xianghui-b
#   #檢查製造批序號數量是否一致
#   DECLARE inao_chk_cs CURSOR FOR 
#      SELECT xmdmseq,xmdmseq1,xmdm001,xmdm008,xmdm009,xmdm033 FROM xmdm_t WHERE xmdment = g_enterprise AND xmdmdocno = p_xmdkdocno #160519-00008#8 add xmdm033
#   FOREACH inao_chk_cs INTO l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm008,l_xmdm009,l_xmdm033        #160519-00008#8 add xmdm033
#      #製造批序號數量須與申請數量一致！
#      SELECT imaf071,imaf081,imaf053,imaf054 INTO l_imaf071,l_imaf081,l_imaf053,l_imaf054 FROM imaf_t
#       WHERE imafent = g_enterprise
#         AND imafsite = g_site
#         AND imaf001 = l_xmdm001
#         
#      SELECT COUNT(*) INTO l_n FROM inao_t
#       WHERE inaoent = g_enterprise
#         AND inaodocno = p_xmdkdocno
#         AND inaoseq = l_xmdmseq
#         AND inaoseq1= l_xmdmseq1
#         
#      IF cl_null(l_n) THEN LET l_n = 0 END IF
#      
#      #料件設置必須使用製造批序號，請維護對應製造批序號的資料！
#      IF (l_imaf071 = '1' OR l_imaf081 = '1') AND l_n = 0 THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'apm-00991'
#         LET g_errparam.extend = l_xmdmseq
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      
#      IF l_imaf071 = '1' OR l_imaf081 = '1' OR ((l_imaf071 = '3' OR l_imaf071 = '3') AND l_n > 0 )  THEN
#         SELECT SUM(inao012) INTO l_inao012 FROM inao_t
#          WHERE inaoent = g_enterprise
#            AND inaodocno = p_xmdkdocno
#            AND inaoseq = l_xmdmseq
#            AND inaoseq1= l_xmdmseq1
#         IF cl_null(l_inao012) THEN
#            LET l_inao012 = 0
#         END IF 
#         IF l_imaf054 = 'N' THEN   #不走庫存多單位
#            CALL s_aooi250_convert_qty(l_xmdm001,l_imaf053,l_xmdm008,l_inao012)
#                 RETURNING l_success,l_inao012
#         END IF          
#         IF l_inao012 <> l_xmdm009 THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'apm-00990'
#            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            
#            LET r_success = FALSE
#            RETURN r_success          
#         END IF         
#      END IF
#      #設置必須要批號時，批號欄位不可為空
#      IF l_imaf071 = '1' THEN
#         SELECT COUNT(*) INTO l_n FROM inao_t
#           WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno
#             AND inaoseq = l_xmdmseq AND inaoseq1 = l_xmdmseq1
#             AND (inao008 IS NULL OR inao008 = ' ' )
#         IF l_n > 0 THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'apm-00992'
#            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET r_success = FALSE
#            RETURN r_success
#         END IF
#      END IF      
#      #設置必須要序號時，序號欄位不可為空
#      IF l_imaf081 = '1' THEN
#         SELECT COUNT(*) INTO l_n FROM inao_t
#           WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno
#             AND inaoseq = l_xmdmseq AND inaoseq1 = l_xmdmseq1
#             AND (inao009 IS NULL OR inao009 = ' ')
#         IF l_n > 0 THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'apm-00993'
#            LET g_errparam.extend = l_xmdmseq,"/",l_xmdmseq1
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET r_success = FALSE
#            RETURN r_success 
#         END IF
#      END IF
#      #160519-00008#8  
#      CALL s_axmt540_get_imaf(l_xmdm001) RETURNING l_imaf055,l_imaf061    
#      IF l_imaf055 = '1' AND cl_null(l_xmdm033) THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_xmdm001
#         LET g_errparam.code   = 'sub-00125'         #庫存管理特徵不可為空！  
#         LET g_errparam.popup  = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#      END IF
#      #160519-00008#8                                
#   END FOREACH  
#   #150821-xianghui-e
#191023-00015#1 mark-E
   
   #180810-00050#1 --s
   LET l_xmdk018 = ''
   LET l_xmah006 = ''
   LET l_xmdlseq = 0
   LET l_xmdl024 = 0
   SELECT xmdk018 INTO l_xmdk018 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = p_xmdkdocno
   
   SELECT xmah006 INTO l_xmah006 FROM xmah_t
                    WHERE xmahent = g_enterprise
                      AND xmah001 = l_xmdk018
  #181102-00013#1---mark---str---                     
  #DECLARE xmah_chk_cs CURSOR FOR 
  #   SELECT xmdlseq FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = p_xmdkdocno #160519-00008#8 ADD xmdm033
  #FOREACH xmah_chk_cs INTO l_xmdlseq
  #   SELECT xmdl024 INTO l_xmdl024 FROM xmdl_t 
  #                 WHERE xmdlent = g_enterprise
  #                   AND xmdldocno = p_xmdkdocno
  #                   AND xmdlseq = l_xmdlseq
  #END FOREACH 
  #181102-00013#1---mark---end---
  #181102-00013#1---add----str---
  #改成用下段控卡,上述的寫法,(1)未考慮到樣品不應受單價可否為0 的控卡 (2)且當單身有多筆時,只有最後一筆有作用
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM xmdl_t
    WHERE xmdlent = g_enterprise
      AND xmdldocno = p_xmdkdocno
      AND xmdl007 <> '9'           #子件特性為樣品
      AND xmdl024 = 0
  #181102-00013#1---add----end---   
   
  #IF l_xmdl024 = 0 AND l_xmah006 = 'N' THEN                        #181102-00013#1 mark
   IF l_cnt >= 1    AND l_xmah006 = 'N' AND g_prog = 'axmt541' THEN #181102-00013#1 add 單價不可以為0 的僅在axmt541無訂單出貨控卡,因為有訂單出貨的,在訂單確認時,就會控卡了
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_xmdl024
         LET g_errparam.code   = 'axm-00971'         #单价不为0  
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
   END IF      
   #180810-00050#1 --e
   
   #190702-00010#16 -S add
   #檢查是否有OQC
   #檢查是否有與sQMS或SPC整合 
   IF s_aqct300_is_sqms() THEN
      #判斷是否有出通單,若有出通單則判斷出通單檢驗時機設定,若無出通單則進行出貨單OQC
      CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
      LET l_cnt = 0
      IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0062') = 'N' THEN   #出貨單與出通單勾稽
         SELECT COUNT(1)
           INTO l_cnt
           FROM xmdl_t
          WHERE xmdlent = g_enterprise
            AND xmdldocno = p_xmdkdocno
            AND xmdl023 = 'Y'
      ELSE
         SELECT COUNT(1)
           INTO l_cnt
           FROM xmdl_t,
                (SELECT (CASE ecom0008 when '1' THEN 
                        (CASE ecom0002 when 'Y' THEN ecom0003+1 else ecom0003 END)+1 ELSE 1 END) cnt,ecom0001
                   FROM ( SELECT TO_NUMBER((SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0001')) ecom0001,
                                (SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0002') ecom0002,
                                TO_NUMBER((SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0003')) ecom0003,
                                (SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0008') ecom0008
                           FROM dual)) 
          WHERE xmdlent = g_enterprise
            AND xmdldocno = p_xmdkdocno
            AND xmdl023 = 'Y'
            AND (SUBSTR(xmdl001,cnt,ecom0001) IN (SELECT ooac002 
                                                   FROM ooac_t 
                                                  WHERE ooacent = g_enterprise
                                                    AND ooac001 = (SELECT ooef004 FROM ooef_t WHERE ooefent=g_enterprise AND ooef001=g_site) 
                                                    AND ooac003 ='D-BAS-0094'     #OQC檢驗時機為"2.出貨時檢驗"
                                                    AND ooac004= '2')
             OR xmdl001 IS NULL) 
         #PGS(D)-07556-add-s
         #PGS(D)-07556-add-e         
      END IF
   
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF      
      IF l_cnt > 0 THEN
         SELECT COUNT(1)
           INTO l_cnt
           FROM oobn_t,oobm_t
          WHERE oobnent = oobment
            AND oobn001 = oobm001
            AND oobnent = g_enterprise
            AND oobn002 = l_slip
            AND oobn003 IN (SELECT oobx001
                              FROM oobx_t
                             WHERE oobxent = oobnent
                               AND oobx004 = 'aqct300')
            AND oobmstus = 'Y'
         IF l_cnt = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aqc-00179'  #單別%1沒有設定對應檢驗單別，請至[單據流程設定作業(aooi210)]設定對應的檢驗單別！
            LET g_errparam.replace[1] = l_slip
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   #190702-00010#16 -E add
   
   #200617-00022#7 add -S-
   #單身稅別的含稅否需與單頭一致
   SELECT xmdk012,xmdk014 INTO l_xmdk012,l_xmdk014
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   IF NOT cl_null(l_xmdk012) THEN
      SELECT DISTINCT oodb011 INTO l_oodb011
        FROM ooef_t,oodb_t 
       WHERE oodb001 = ooef019 AND ooefent = oodbent AND oodbent = g_enterprise 
         AND ooef001 = g_site AND oodbstus = 'Y'   
         AND oodb002 = l_xmdk012
      IF l_oodb011 = '2' THEN  #依料件設定
         LET g_coll_title[1] = cl_getmsg('axm-00008',g_lang)  #項次
         LET g_coll_title[2] = cl_getmsg('sub-01484',g_lang)  #稅別
         DECLARE oodb005_chk_cs CURSOR FOR 
         SELECT xmdlseq,xmdl025,oodb005
           FROM ooef_t,oodb_t,xmdl_t
          WHERE oodb001 = ooef019 AND ooefent = oodbent AND xmdlent = oodbent AND oodbent = g_enterprise 
            AND ooef001 = g_site AND oodbstus = 'Y'  AND oodb002 = xmdl025
            AND xmdldocno = p_xmdkdocno
         FOREACH oodb005_chk_cs INTO l_xmdlseq,l_xmdl025,l_oodb005
            IF l_oodb005 <> l_xmdk014 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-01108'      #單身稅別的含稅否需與單頭一致!
               LET g_errparam.coll_vals[1] = l_xmdlseq
               LET g_errparam.coll_vals[2] = l_xmdl025
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END FOREACH
      END IF
   END IF
   #200617-00022#7 add -E-
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單取消確認流程
# Memo...........: 對出貨單據進行單據確認還原檢查
# Usage..........: CALL s_axmt540_unconf_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 單據單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_unconf_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_n             LIKE type_t.num5
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   DEFINE l_cocd_ent  LIKE type_t.num5    #170930-00013#15 add by 09767
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_axmt540_stus_chk(p_xmdkdocno,'uncon') THEN
      LET r_success = FALSE
   END IF
   
   
   #170930-00013#15 add by 09767-->s
   SELECT COUNT(1) INTO l_cocd_ent FROM cocd_t
      WHERE cocdent = g_enterprise
       AND cocdsite = g_site
       AND cocd002 = '1'
       AND  cocd003 = (SELECT xmdk056 FROM xmdk_t WHERE xmdkent = g_enterprise
                           AND xmdkdocno = p_xmdkdocno )
   IF l_cocd_ent > 0 THEN
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'aco-00122'      #180705-00102#1   mark By 10130
      LET g_errparam.code = 'aco-00149'       #180705-00102#1   add  By 10130
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #170930-00013#15 add by 09767-->e
   
   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''
   
   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add 


   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   #若出貨單已經有轉有效包裝單時則不允許取消確認
   LET l_n = 0
   SELECT COUNT(xmeldocno) INTO l_n
     FROM xmel_t
          LEFT OUTER JOIN xmem_t ON xmement = xmelent AND xmemdocno = xmeldocno
    WHERE xmelent= g_enterprise      
      AND xmel004 = '2'         #包裝單來源為'2:出貨單'
      AND xmelstus <> 'X'
      AND (xmel005 = p_xmdkdocno OR xmem001 = p_xmdkdocno)
   
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00416'   #已經有對應的包裝單資料，不可做取消確認！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF  
   
   #若出貨單已經有轉有效Invoice且Invoice類型為'1:正式Invoice'時則不允許取消確認
   LET l_n = 0
   SELECT COUNT(xmdodocno) INTO l_n
     FROM xmdo_t
          LEFT OUTER JOIN xmdp_t ON xmdpent = xmdoent AND xmdpdocno = xmdodocno
    WHERE xmdoent = g_enterprise
      AND xmdo001 = '1'         #Invoice類型為'1:正式Invoice'
      AND xmdo004 = '2'         #Invoice來源為'2:出貨單'
      AND xmdostus <> 'X'
      AND (xmdo005 = p_xmdkdocno OR xmdp001 = p_xmdkdocno) #單號
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00185'   #已經有對應的Invoice資料，不可做取消確認！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   #151113-00019#1 Sarah add -----(S)
   #若出貨單已經有轉有效QC單時則不允許取消確認
   LET l_n = 0
   SELECT COUNT(qcbadocno) INTO l_n
     FROM qcba_t
    WHERE qcbaent = g_enterprise
      AND qcba000 = '4'   #4.OQC
      AND qcba001 = p_xmdkdocno
      AND qcbastus <> 'X'
      AND qcba036 <> 'Y'  #190702-00010#16 add  #不檢查已拋轉sQMS的單
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00473'    #已經有對應的QC資料，不可做取消確認！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()   
      LET r_success = FALSE
   END IF
   #151113-00019#1 Sarah add -----(E)
   
   #160908-00003#4 add ------
   LET l_n = 0
   SELECT COUNT(isafdocno) INTO l_n
     FROM isaf_t
     LEFT JOIN isag_t ON isafent=isagent AND isafcomp=isagcomp AND isafdocno=isagdocno
    WHERE isafent = g_enterprise
      AND isafstus <> 'X'
      AND isag002 = p_xmdkdocno
   IF cl_null(l_n) THEN LET l_n = 0 END IF
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00825'    #此出貨單已有開立發票對帳單(aist310)，不可取消確認或作廢！
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()   
      LET r_success = FALSE
   END IF
   #160908-00003#4 add end---
  
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單狀態碼檢查
# Memo...........: 當確認段(con)多檢查業務、部門狀態碼
# Usage..........: CALL s_axmt540_stus_chk(p_xmdkdocno,p_cmd)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 單據單號
#                : p_cmd       流程：con確認,uncon取消確認,pos過帳,unpos過帳還原,void作廢
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_stus_chk(p_xmdkdocno,p_cmd)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_cmd           LIKE type_t.chr5
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_stus          LIKE xmdk_t.xmdkstus
   DEFINE l_xmdk003       LIKE xmdk_t.xmdk003   #業務人員
   DEFINE l_xmdk004       LIKE xmdk_t.xmdk004   #業務部門
   DEFINE l_xmdkdocdt     LIKE xmdk_t.xmdkdocdt
   #170809-00006#6  add--S
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdk083       LIKE xmdk_t.xmdk083
   #170809-00006#6  add--E

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET g_errno = ''
   LET l_stus = ''
   LET l_xmdk003 = ''
   LET l_xmdk004 = ''
   LET l_xmdkdocdt = ''
   #170809-00006#6  add--S
   LET l_xmdk045 = ''
   LET l_xmdk083 = ''
   #170809-00006#6  add--E
   

   SELECT xmdkstus,xmdk003,xmdk004,xmdkdocdt
          ,xmdk045,xmdk083                       #170809-00006#6  add
     INTO l_stus,l_xmdk003,l_xmdk004,l_xmdkdocdt
          ,l_xmdk045,l_xmdk083                   #170809-00006#6  add
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   CASE p_cmd
      WHEN 'con'
         CASE l_stus
            WHEN 'Y'
               LET g_errno = 'sub-00178'
            WHEN 'X'
               LET g_errno = 'sub-00229'
            WHEN 'S'
               LET g_errno = 'sub-00230'               
         END CASE
      WHEN 'uncon'
         CASE l_stus
            WHEN 'N'
               LET g_errno = 'sub-00180'
            WHEN 'A'   
               LET g_errno = 'sub-00180'
            WHEN 'D'   
               LET g_errno = 'sub-00180'
            WHEN 'R'   
               LET g_errno = 'sub-00180'
            WHEN 'W'   
               LET g_errno = 'sub-00180'               
            WHEN 'X'
               LET g_errno = 'sub-00229'
            WHEN 'S'
               LET g_errno = 'sub-00230'               
         END CASE
      WHEN 'pos'
         CASE l_stus
            WHEN 'N'
               LET g_errno = 'sub-00180'
            WHEN 'A'   
               LET g_errno = 'sub-00180'
            WHEN 'D'   
               LET g_errno = 'sub-00180'
            WHEN 'R'   
               LET g_errno = 'sub-00180'
            WHEN 'W'   
               LET g_errno = 'sub-00180'               
            WHEN 'X'
               LET g_errno = 'sub-00229'
            WHEN 'S'
               LET g_errno = 'sub-00230'
         END CASE
      WHEN 'unpos'
         CASE l_stus
            WHEN 'N'
               LET g_errno = 'sub-00180'
            WHEN 'A'   
               LET g_errno = 'sub-00180'
            WHEN 'D'   
               LET g_errno = 'sub-00180'
            WHEN 'R'   
               LET g_errno = 'sub-00180'
            WHEN 'W'   
               LET g_errno = 'sub-00180'               
            WHEN 'X'
               LET g_errno = 'sub-00229'
            WHEN 'Y'
               LET g_errno = 'agl-00054'
         END CASE
      WHEN 'void'
         CASE l_stus
            WHEN 'Y'
               LET g_errno = 'sub-00178'
            WHEN 'X'
               LET g_errno = 'sub-00229'
            WHEN 'S'
               LET g_errno = 'sub-00230'
         END CASE
   END CASE
   
   IF NOT cl_null(g_errno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF
   
   IF p_cmd = 'con' THEN        #確認流程多檢查業務、部門狀態碼
     #170809-00006#6 mark--S
     #IF NOT s_employee_chk(l_xmdk003) THEN
     #   LET r_success = FALSE
     #END IF
      
     #IF NOT s_department_chk(l_xmdk004,l_xmdkdocdt) THEN
     #   LET r_success = FALSE
     #END IF
     #170809-00006#6 mark--E
     #170809-00006#6  add--S
      #人員
      IF cl_null(l_xmdk003) THEN 
         #申請人員未輸入！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00283'
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      ELSE
         INITIALIZE g_chkparam.* TO NULL      
         LET g_chkparam.arg1 = l_xmdk003
         LET g_errshow = TRUE                                                                                                
         LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130" 
         IF NOT cl_chk_exist("v_ooag001") THEN
            LET r_success = FALSE
         END IF
      END IF
      
      #部門
      IF cl_null(l_xmdk004) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00284'
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         
      ELSE
         LET g_errshow = TRUE
         INITIALIZE g_chkparam.* TO NULL
         LET g_chkparam.arg1 = l_xmdk004
         LET g_chkparam.arg2 = l_xmdkdocdt
         LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
         LET g_chkparam.err_str[2] = "aoo-00008:sub-01455|",l_xmdk003,"|''|:EXEPROGaooi125"
         LET g_chkparam.err_str[3] = "aoo-00201:sub-01456|",l_xmdk003,"|''|:EXEPROGaooi125"
         IF l_xmdk045 = '5' AND l_xmdk083 = 'Y' THEN
            IF NOT cl_chk_exist("v_ooeg001_11") THEN
               LET r_success = FALSE
            END IF
         ELSE
           #LET g_chkparam.err_str[4] = "sub-01397:sub-01454|",l_xmdk003,"|''|:EXEPROGaooi125"  #200226-00039#1 mark
            LET g_chkparam.err_str[4] = "sub-01397:sub-01454|",l_xmdk004,"|''|:EXEPROGaooi125"  #200226-00039#1 add
            IF NOT cl_chk_exist("v_ooeg001") THEN
               LET r_success = FALSE
            END IF
         END IF
      END IF
     #170809-00006#6  add--E
      
   END IF
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單過帳還原流程
# Memo...........: 對出貨單據進行庫存過帳還原檢查
# Usage..........: CALL s_axmt540_unpost_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 出貨單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_unpost_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   DEFINE l_xmdk001       LIKE xmdk_t.xmdk001   #扣帳日期
   DEFINE l_para_data     LIKE type_t.chr80     #接參數用
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_xmdl038       LIKE xmdl_t.xmdl038
   DEFINE l_xmdl039       LIKE xmdl_t.xmdl039
   DEFINE l_xmdl040       LIKE xmdl_t.xmdl040
   DEFINE l_xmdl042       LIKE xmdl_t.xmdl042
   DEFINE l_xmdl043       LIKE xmdl_t.xmdl043
   DEFINE l_xmdl044       LIKE xmdl_t.xmdl044
   DEFINE l_xmdl047       LIKE xmdl_t.xmdl047
   DEFINE l_xmdl053       LIKE xmdl_t.xmdl053
   DEFINE l_xmdl054       LIKE xmdl_t.xmdl054
   DEFINE l_xmdl055       LIKE xmdl_t.xmdl055
   DEFINE l_str           STRING
   DEFINE l_xmdlseq       LIKE xmdl_t.xmdlseq
   DEFINE l_sql           STRING
   DEFINE l_success       LIKE type_t.num5     #15/06/15 Sarah add
   DEFINE l_xmdk035       LIKE xmdk_t.xmdk035  #150709 by 04441 add
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   DEFINE l_year          LIKE type_t.num5 #190523-00002#1 add
   DEFINE l_month         LIKE type_t.num5 #190523-00002#1 add  
   DEFINE l_ooef017       LIKE ooef_t.ooef017 #190927-00018#1---add   
   DEFINE l_xmdk085       LIKE xmdk_t.xmdk085 #200929-00014#4 add

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_axmt540_stus_chk(p_xmdkdocno,'unpos') THEN
      LET r_success = FALSE
   END IF

   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''

   #SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003                   #200929-00014#4 mark
   SELECT xmdk044,xmdk045,xmdl003,xmdk085 INTO l_xmdk044,l_xmdk045,l_xmdl003,l_xmdk085  #200929-00014#4 add
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add 

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   
   #200929-00014#4 add---(s)
   IF l_xmdk085 = '6' AND NOT (g_prog MATCHES 'aint330*' OR g_prog MATCHES 'aint350*' OR g_prog MATCHES 'aint360*') THEN    #6.集團交易轉入   
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-01130'
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success   
   END IF 
   #200929-00014#4 add---(e)

   #150706 by 04441 add start
   IF NOT s_axmt540_control_check_stock(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #150706 by 04441 add end

   LET l_xmdk001 = ''
   LET l_xmdk002 = ''
   LET l_xmdk035 = ''
   SELECT xmdk001,xmdk002,xmdk035
     INTO l_xmdk001,l_xmdk002,l_xmdk035
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno

   #150709 by 04441 add start
   #多角序號有值，且該值存在其他已過帳出貨單時，不可過帳還原
   IF NOT cl_null(l_xmdk035) THEN
      LET l_n = 0
      SELECT COUNT(xmdkdocno) INTO l_n
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = l_xmdk035
         AND xmdkstus = 'S'
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00700'   #多角序號有值，且該值存在其他單據時，不可過帳還原！
         LET g_errparam.extend = l_xmdk035
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   #150709 by 04441 add end

   #15/06/15 Sarah add
   #檢查是否"即時成本運算模式",若是,則不可進行過帳還原
   #(因為過帳時已經更新了inaj_t,而成本計算完全依賴inaj_t,若成本計算後又去更新inaj_t會有問題)
   CALL s_cost_realtime_chk_unpost(g_site)
        RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
   END IF
   #15/06/15 Sarah add

   #160422-00027#1-s
   #過帳還原時，判斷訂單單據已結案，則不可過帳還原
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      AND xmdkent = xmdlent
      AND xmdkdocno = xmdldocno
      AND xmdl003 IN (SELECT xmdadocno FROM xmda_t WHERE xmdaent = g_enterprise AND xmdastus = 'C')
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00779'
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #160422-00027#1-e
   
   #揀核是否已經已經有對應有未作廢的銷退單
   LET l_n = 0
   SELECT COUNT(xmdkdocno) INTO l_n
     FROM xmdk_t
          LEFT OUTER JOIN xmdl_t ON xmdlent = xmdkent AND xmdldocno = xmdkdocno
    WHERE xmdkent = g_enterprise
      AND xmdk000 = '6' #銷退單
      AND xmdkstus <> 'X'
      AND (xmdk005 = p_xmdkdocno OR xmdl001 = p_xmdkdocno)

   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00420'   #此單據已存在未作廢的銷退單，不可取消過帳！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE      
   END IF 

   IF l_xmdk002 = '3' THEN   #簽收訂單
      #核是否已經有有效的簽收單，若有則不允許過帳還原
      LET l_n = 0
      SELECT COUNT(xmdkdocno) INTO l_n
        FROM xmdk_t LEFT OUTER JOIN xmdl_t ON xmdlent = xmdkent AND xmdldocno = xmdkdocno
       WHERE xmdkent = g_enterprise
         AND xmdk000 = '4' #簽收單
         AND xmdkstus <> 'X'
         AND (xmdk005 = p_xmdkdocno OR xmdl001 = p_xmdkdocno)
         
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00255'   #此單據已存在未作廢的簽收單，不可取消過帳！
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE      
      END IF            
   END IF

   IF l_xmdk002 = '8' THEN   #借貨訂單
      #核是否已經有有效的"借貨還價"，若有則不允許過帳還原
      LET l_n = 0
      SELECT COUNT(xmdkdocno) INTO l_n
        FROM xmdk_t LEFT OUTER JOIN xmdl_t ON xmdlent = xmdkent AND xmdldocno = xmdkdocno
       WHERE xmdkent = g_enterprise
         AND xmdk000 = '7' #借貨還價
         AND xmdkstus <> 'X'
         AND (xmdk005 = p_xmdkdocno OR xmdl001 = p_xmdkdocno)
         
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00569'   #此單據已存在未作廢的借貨還價單，不可取消過帳！
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE      
      END IF
      
      #核是否已經有有效的"借貨還量"，若有則不允許過帳還原
      LET l_n = 0
      SELECT COUNT(xmdkdocno) INTO l_n
        FROM xmdk_t LEFT OUTER JOIN xmdl_t ON xmdlent = xmdkent AND xmdldocno = xmdkdocno
       WHERE xmdkent = g_enterprise
         AND xmdk000 = '8' #借貨還量
         AND xmdkstus <> 'X'
         AND (xmdk005 = p_xmdkdocno OR xmdl001 = p_xmdkdocno)
         
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00570'   #此單據已存在未作廢的借貨還量單，不可取消過帳！
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF

   #扣帳日期小於成本關帳日則不允許過帳還原，錯誤訊息「扣帳日期小於關帳日期，不可過帳還原]     
   CALL cl_get_para(g_enterprise,g_site,'S-MFG-0031') RETURNING l_para_data
   IF l_xmdk001 <= l_para_data OR cl_null(l_xmdk001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00665'   #扣帳日期%1小於關帳日期%2，不可還原！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = l_xmdk001
      LET g_errparam.replace[2] = l_para_data
      CALL cl_err()
      LET r_success = FALSE
   END IF

   #財務檢查
   LET l_xmdl038 = 0
   LET l_xmdl039 = 0
   LET l_xmdl040 = 0
   LET l_xmdl053 = 0
   LET l_xmdl054 = 0
   LET l_xmdl055 = 0
   LET l_xmdl047 = 0
   SELECT SUM(COALESCE(xmdl038,0)),SUM(COALESCE(xmdl039,0)),SUM(COALESCE(xmdl040,0)),
          SUM(COALESCE(xmdl053,0)),SUM(COALESCE(xmdl054,0)),SUM(COALESCE(xmdl055,0)),
          SUM(COALESCE(xmdl047,0))
     INTO l_xmdl038,l_xmdl039,l_xmdl040,
          l_xmdl053,l_xmdl054,l_xmdl055,
          l_xmdl047
     FROM xmdl_t
    WHERE xmdlent = g_enterprise
      AND xmdldocno = p_xmdkdocno

   #立帳
   LET l_n = l_xmdl038 + l_xmdl039 + l_xmdl040
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00523'     #此筆資料已立帳，不可取消過帳！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE      
   END IF

   #暫估
   LET l_n = l_xmdl053 + l_xmdl054 + l_xmdl055
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00524'     #此筆資料已有暫估資料，不可取消過帳！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE      
   END IF

   #發票
   IF l_xmdl047 > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00525'     #此筆資料已有發票資料，不可取消過帳！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE      
   END IF

   LET l_sql = "SELECT xmdlseq,xmdl042,xmdl043,xmdl044",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               " ORDER BY xmdlseq"
   PREPARE s_axmt540_xmdl_pre02 FROM l_sql
   DECLARE s_axmt540_xmdl_cs02 CURSOR FOR s_axmt540_xmdl_pre02
 
   LET l_sql = "SELECT COUNT(xmde001)",
               "  FROM xmde_t",
               " WHERE xmdeent = ",g_enterprise,
               "   AND xmde000 = '1'",
               "   AND xmde001 = ?",
               "   AND xmde002 = ?",
               "   AND xmde003 = '",p_xmdkdocno,"'",
               "   AND xmde004 = ?"
   PREPARE s_axmt540_xmde_pre FROM l_sql

   #170325-00027#1-s-add
   #銷售折扣合約
   #--結算資料，已產生帳款
   LET l_sql = "SELECT COUNT(xmde001)",
               "  FROM xmde_t",
               " WHERE xmdeent = ",g_enterprise,
               "   AND xmde000 = '3'",
               "   AND xmde003 = '",p_xmdkdocno,"'",
               "   AND xmde004 = ?",
               "   AND xmde025 = '2' " #已產生帳款
   PREPARE s_axmt540_xmde_pre1 FROM l_sql
   #170325-00027#1-e-add
   
   FOREACH s_axmt540_xmdl_cs02 INTO l_xmdlseq,l_xmdl042,l_xmdl043,l_xmdl044
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #若出貨單的取價來源為合約單時，需要檢核該出貨單是否已經存在xmde_t(合約結算檔)中，若存在則不允許過帳還原
      IF l_xmdl042 = '4' THEN
         LET l_n = 0
         EXECUTE s_axmt540_xmde_pre USING l_xmdl043,l_xmdl044,l_xmdlseq INTO l_n
         
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00615'     #出貨單號%1項次%2已經存在合約結算檔中，不允許還原！
            LET g_errparam.extend = ''
            LET g_errparam.replace[1] = p_xmdkdocno
            LET g_errparam.replace[2] = l_xmdlseq
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
      #170325-00027#1-s-add   
      LET l_n = 0
      EXECUTE s_axmt540_xmde_pre1 USING l_xmdlseq INTO l_n
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00817'     #出貨單號%1項次%2，已存在銷售折扣合約結算檔中，且已過帳，不允許還原！
         LET g_errparam.extend = ''
         LET g_errparam.replace[1] = p_xmdkdocno
         LET g_errparam.replace[2] = l_xmdlseq
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
      END IF
      #170325-00027#1-e-add
   END FOREACH
   #190927-00018#1---add---s
   SELECT ooef017 INTO l_ooef017 FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site
   #190927-00018#1---add---e
   #190523-00002#1 add start -----
   LET l_n = 0 
   LET l_year = YEAR(l_xmdk001)
   LET l_month = MONTH(l_xmdk001)
   SELECT COUNT(1) INTO l_n 
     FROM xcea_t
    WHERE xceaent = g_enterprise
      AND xcea004 = l_year
      AND xcea005 = l_month
      AND xceastus <> 'X'
      AND xcea002 IN ('11','12')
      AND xceacomp = l_ooef017   #190927-00018#1---add
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-01038'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
   END IF
   #190523-00002#1 add end    -----   

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 包裝單、Invoice檢查
# Memo...........: 檢查個比出通單之包裝單、Invoice是否一致
# Usage..........: CALL s_axmt540_pack_Invoice_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單據單號
#                :
# Return code....: r_success      處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_pack_Invoice_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001  #來源出通單號
   DEFINE l_xmdg024       LIKE xmdg_t.xmdg024  #包裝單製作
   DEFINE l_xmdg024_t     LIKE xmdg_t.xmdg024
   DEFINE l_xmdg025       LIKE xmdg_t.xmdg025  #Invoice製作
   DEFINE l_xmdg025_t     LIKE xmdg_t.xmdg025
   DEFINE l_pack_err      LIKE type_t.num5
   DEFINE l_invoice_err   LIKE type_t.num5
   DEFINE l_gzze003       LIKE gzze_t.gzze003

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET l_pack_err = TRUE
   LET l_invoice_err = TRUE
   LET l_xmdg024_t = ''
   LET l_xmdg025_t = ''
   
   LET l_sql = "SELECT DISTINCT xmdk002,xmdl001",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdlent = '",g_enterprise,"'",
               "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre FROM l_sql
   DECLARE s_axmt540_cs CURSOR FOR s_axmt540_pre
   
   FOREACH s_axmt540_cs INTO l_xmdk002,l_xmdl001
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF cl_null(l_xmdl001) THEN
         CONTINUE FOREACH
      END IF
      
      LET l_xmdg024 = ''   #包裝單
      LET l_xmdg025 = ''   #Invoice
      SELECT xmdg024,xmdg025 INTO l_xmdg024,l_xmdg025
        FROM xmdg_t
       WHERE xmdgent = g_enterprise
         AND xmdgdocno = l_xmdl001

      #備份舊值做比較
      IF cl_null(l_xmdg024_t) THEN
         LET l_xmdg024_t = l_xmdg024
      END IF
      IF cl_null(l_xmdg025_t) THEN
         LET l_xmdg025_t = l_xmdg025
      END IF

      CASE l_xmdk002
         WHEN '8'  #借貨出貨單
            CALL cl_getmsg('axm-00584',g_dlang) RETURNING l_gzze003   #借貨出貨通知單維護作業axmt521
         OTHERWISE
            CALL cl_getmsg('axm-00583',g_dlang) RETURNING l_gzze003   #出貨通知單維護作業axmt520
      END CASE 

      IF l_pack_err THEN
         IF l_xmdg024 <> l_xmdg024_t OR cl_null(l_xmdg024) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00180'  #出通單設置的"是否製作包裝單"不一致！
            LET g_errparam.extend = l_xmdl001
            LET g_errparam.popup = TRUE
            
            LET g_errparam.replace[1] = l_gzze003
            
            CALL cl_err()
          
            LET r_success = FALSE
            LET l_pack_err = FALSE
         END IF
      END IF
      
      IF l_invoice_err THEN
         IF l_xmdg025 <> l_xmdg025_t OR cl_null(l_xmdg025) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00181'  #出通單設置的"是否製作Invoice"不一致！
            LET g_errparam.extend = l_xmdl001
            LET g_errparam.popup = TRUE
            
            LET g_errparam.replace[1] = l_gzze003
            
            CALL cl_err()
         
            LET r_success = FALSE
            LET l_invoice_err = FALSE
         END IF
      END IF
   END FOREACH

   CLOSE s_axmt540_cs
   FREE s_axmt540_pre

   RETURN r_success
   
END FUNCTION
################################################################################
# Descriptions...: 檢查出通單項次是否均在出貨單
# Memo...........:
# Usage..........: CALL s_axmt540_xmdgseq_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出貨單號
#                : 
# Return code....: r_success      處理狀態
#                : 
# Date & Author..: 140321 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdgseq_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
   DEFINE l_slip          LIKE ooba_t.ooba001
   DEFINE l_n             LIKE type_t.num5   
   DEFINE l_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   LET l_sql = "SELECT DISTINCT xmdl001",
               "  FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre1 FROM l_sql
   DECLARE s_axmt540_cs1 CURSOR FOR s_axmt540_pre1

   LET l_sql = "SELECT COUNT(xmdhseq)",
               "  FROM xmdh_t WHERE xmdhent = '",g_enterprise,"'",
               "   AND xmdhdocno = ?",
               "   AND NOT EXISTS (SELECT 1 FROM xmdl_t WHERE xmdlent = xmdhent AND xmdl001 = xmdhdocno ",
               "                      AND xmdl002 = xmdhseq AND xmdldocno = '",p_xmdkdocno,"')"
   PREPARE s_axmt540_pre3 FROM l_sql

   FOREACH s_axmt540_cs1 INTO l_xmdl001
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl001) THEN
         CONTINUE FOREACH
      END IF

      CALL s_aooi200_get_slip(l_xmdl001) RETURNING l_success,l_slip
      IF NOT l_success THEN
         LET r_success = FALSE
         CONTINUE FOREACH
      END IF

      IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0060') = '1' THEN    #出通轉出貨單控管為"一對一"
         LET l_n = 0
         EXECUTE s_axmt540_pre3 USING l_xmdl001 INTO l_n         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "EXECUTE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            CONTINUE FOREACH
         END IF         
         
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00182'   #出通單單別參數"轉出貨單控管方式"為"1:一對一"時，所有出通項次資料均需在此出貨單上！
            LET g_errparam.extend = l_xmdl001
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            CONTINUE FOREACH
         END IF
      END IF
   END FOREACH
   
   CLOSE s_axmt540_cs1
   FREE s_axmt540_pre1
   FREE s_axmt540_pre3

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單確認流程
# Memo...........: 對出貨單據進行單據確認
# Usage..........: CALL s_axmt540_conf_upd()
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 單據單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140321 By earl
# Modify.........: 150630 By Polly 信用餘額變更改至扣帳段處理
################################################################################
PUBLIC FUNCTION s_axmt540_conf_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_datetime      DATETIME YEAR TO SECOND
   DEFINE l_slip          LIKE ooba_t.ooba001
   DEFINE l_xmdk000       LIKE xmdk_t.xmdk000      #150630 polly add
   DEFINE l_xmdk007       LIKE xmdk_t.xmdk007
   DEFINE l_xmaj007_1     LIKE xmaj_t.xmaj007
   DEFINE l_xmaj007_2     LIKE xmaj_t.xmaj007
   DEFINE l_success       LIKE type_t.num5
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002  #190926-00009#1 add
   DEFINE l_cnt           LIKE type_t.num5      #201209-00028#9 add
   

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET l_datetime = cl_get_current()

   UPDATE xmdk_t
      SET xmdkstus = 'Y',
          xmdkcnfid = g_user,
          xmdkcnfdt = l_datetime
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF

   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''

   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add  

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   
   #回寫出通單
   #IF NOT s_axmt540_xmdh_upd(p_xmdkdocno,'con') THEN #180702-00019#1 mark
   IF NOT s_axmt540_xmdh_upd(p_xmdkdocno,'','con') THEN #180702-00019#1 add
      LET r_success = FALSE
   END IF
   
   #在揀量更新
   #201209-00028#9 add -S-
   #chk段先做更新
   SELECT COUNT(1) INTO l_cnt
     FROM inap_t
    WHERE inapent = g_enterprise
      AND inap001 = p_xmdkdocno
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt = 0 THEN
   #201209-00028#9 add -E-
      IF NOT s_axmt540_ins_inap(p_xmdkdocno,'1','con') THEN
         LET r_success = FALSE
      END IF
   END IF  #201209-00028#9 add

   #其他欄位回寫
   IF NOT s_axmt540_other_upd(p_xmdkdocno,'con') THEN
      LET r_success = FALSE
   END IF

   #171214-00053#2  add(s)
   #確認後更新其它資料
   IF NOT s_axmt540_confe_other(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF    
   #171214-00053#2  add(e)
   
   CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
   IF NOT l_success THEN
      LET r_success = FALSE
   END IF

   #信用額度檢查
   LET l_xmdk000 = ''
   LET l_xmdk007 = ''
   SELECT xmdk000,xmdk007,xmdk002     #190926-00009#1 add xmdk002
     INTO l_xmdk000,l_xmdk007,l_xmdk002   #190926-00009#1 add l_xmdk002
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
  
   IF l_xmdk002 <> '4' THEN      #190926-00009#1 add
      #因"拒絕"、"警告"的狀況已於conf_chk排除，故只檢查"警告且留置"
      CALL s_axmt500_get_credit('6',l_xmdk007) RETURNING l_xmaj007_1,l_xmaj007_2
      IF (l_xmaj007_1 = '2' OR l_xmaj007_2 = '2') AND
         NOT s_axmt540_credit('1',p_xmdkdocno) AND
         s_axmt540_xmdk045_chk(p_xmdkdocno) THEN      #"警告且留置"且"信用額度超限"，過濾統銷統收產生之出貨單
         
         UPDATE xmdk_t
            SET xmdkstus = 'H'
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_xmdkdocno
      
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "UPDATE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()     
            LET r_success = FALSE
         END IF
               
      ELSE
         #出貨單單別參數設置"自動過帳"
         IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0083') = 'Y' THEN
            
            IF NOT s_axmt540_post_chk(p_xmdkdocno) THEN
               LET r_success = FALSE
            ELSE
               
               IF NOT s_axmt540_post_upd(p_xmdkdocno) THEN
                  LET r_success = FALSE
               END IF
            END IF
         END IF
      END IF
    #190926-00009#1 add(s)
   ELSE
      #出貨單單別參數設置"自動過帳"
      IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0083') = 'Y' THEN
         
         IF NOT s_axmt540_post_chk(p_xmdkdocno) THEN
            LET r_success = FALSE
         ELSE
            
            IF NOT s_axmt540_post_upd(p_xmdkdocno) THEN
               LET r_success = FALSE
            END IF
         END IF
      END IF
   END IF
   #190926-00009#1 add(e)
   #20150630--POLLY--MARK--(S)
   #更新信用餘額檔(正向)     
   #IF NOT s_axmt540_credit('2',p_xmdkdocno) THEN
   #   LET r_success = FALSE
   #END IF
   #20150630--POLLY--MARK--(E)
   #170329-00046#21-s-add
   #檢查是否為單一稅別(TRUE:單一稅別；FALSE:多稅別)
   IF s_axmt540_chk_xmdl025(p_xmdkdocno) THEN
      #為單一稅，計算單頭總額、單身尾差調整
      IF NOT s_axmt540_tax_recount(p_xmdkdocno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   #170329-00046#21-e-add
   
   RETURN r_success

END FUNCTION
################################################################################
# Descriptions...: 出貨單取消確認流程
# Memo...........: 對出貨單據進行單據確認還原
# Usage..........: CALL s_axmt540_unconf_upd(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   出貨單號
#                : 
# Return code....: r_success     處理狀態
#                : 
# Date & Author..: 140322 By earl
# Modify.........: 150630 By Polly 信用餘額變更改至扣帳段處理
################################################################################
PUBLIC FUNCTION s_axmt540_unconf_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_xmdk000       LIKE xmdk_t.xmdk000      #150630 polly add
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   #190702-00010#16 -S add
   DEFINE l_qcbadocno   LIKE qcba_t.qcbadocno
   DEFINE l_sql         STRING
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE l_qcba037     LIKE qcba_t.qcba037
   DEFINE l_success     LIKE type_t.num5
   #190702-00010#16 -E add
   DEFINE l_qcbamoddt   LIKE qcba_t.qcbamoddt   #190702-00010#20 add
   
   #210121-00024#1---add---s   
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001  #出通單號
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002  #出通單項次
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004  #訂單項次
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005  #訂單項序
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006  #訂單分批序
   DEFINE l_xmdl008       LIKE xmdl_t.xmdl008
   DEFINE l_xmdl017       LIKE xmdl_t.xmdl017
   DEFINE l_xmdl021       LIKE xmdl_t.xmdl021 
   DEFINE l_stus          LIKE xmdg_t.xmdgstus   
   #210121-00024#1---add---e
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
  
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #190702-00010#16 -S add
   #是否有與sQMS或SPC整合
   IF s_aqct300_is_sqms() THEN
      SELECT COUNT(1)
        INTO l_cnt
        FROM qcba_t
       WHERE qcbaent = g_enterprise
         AND qcba001 = p_xmdkdocno
         AND qcba037 IN ('4')
      IF l_cnt > 0 THEN
         #對應的QC資料有已為4.檢驗完成QMS拋轉狀態，不可做取消確認！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aqc-00185'
         LET g_errparam.extend = p_xmdkdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      ELSE
         #190702-00010#20 add --(S)--
         #因為拋轉還原XML會直接給來源單號,利用來源單號將相關檢驗單據一併還原,因此執行一次即可
         LET l_sql = "SELECT qcbadocno ", 
                     "  FROM qcba_t ",
                     " WHERE qcbaent = ",g_enterprise,
                     "   AND qcba001 = '",p_xmdkdocno,"'",
                     "   AND qcbastus <> 'X' ",
                     "   AND qcba037 = '2' "
         DECLARE s_axmt540_bcl SCROLL CURSOR FROM l_sql       
         OPEN s_axmt540_bcl
         FETCH FIRST s_axmt540_bcl INTO l_qcbadocno
         CLOSE s_axmt540_bcl
         IF NOT cl_null(l_qcbadocno) THEN      
            IF NOT s_aqct300_redu_qc_to_sqms(l_qcbadocno) THEN
               #還原sQMS檢驗單據失敗，不可取消確認！
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aqc-00187'
               LET g_errparam.extend = p_xmdkdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            ELSE
               #更新QC單據拋轉狀態
               UPDATE qcba_t
                  SET qcba037 = '1'
                WHERE qcbaent = g_enterprise
                  AND qcba001 = p_xmdkdocno
                  AND qcbastus <> 'X'
               IF sqlca.sqlcode OR sqlca.sqlerrd[3] = 0 THEN                        
                  #更新檢驗單據[QMS拋轉狀態]失敗，不可取消確認！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aqc-00188'
                  LET g_errparam.extend = p_xmdkdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF               
            END IF                        
         END IF         
         #190702-00010#20 add --(E)--
         LET l_sql = " SELECT qcbadocno,qcba037",
                     "   FROM qcba_t",
                     "  WHERE qcbaent = ",g_enterprise,
                     "    AND qcba001 = '",p_xmdkdocno,"'"
                    ,"    AND qcbastus != 'X'"       #190702-00010#20 add 
         PREPARE s_axmt540_qcbadocno_pre FROM l_sql
         DECLARE s_axmt540_qcbadocno_cur CURSOR FOR s_axmt540_qcbadocno_pre
         FOREACH s_axmt540_qcbadocno_cur INTO l_qcbadocno,l_qcba037
            IF cl_null(l_qcba037) THEN LET l_qcba037 = '1' END IF
           #190702-00010#20 mark --(S)--
           #因為前面已經先執行將相關來源單據拋轉至sQMS單據還原了,因此這邊不需再執行 
           ##若檢驗單sQMS狀態=2.已拋轉(檢驗中),則需先將sQMS單據還原
           #IF l_qcba037 = '2' THEN
           #   IF NOT s_aqct300_redu_qc_to_sqms(l_qcbadocno) THEN
           #      #還原sQMS檢驗單據失敗，不可取消確認！
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = 'aqc-00187'
           #      LET g_errparam.extend = l_qcbadocno
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #      LET r_success = FALSE
           #      EXIT FOREACH
           #   ELSE
           #      #更新QC單據拋轉狀態
           #      UPDATE qcba_t
           #         SET qcba037 = '1'
           #       WHERE qcbaent = g_enterprise
           #         AND qcbadocno = l_qcbadocno
           #      IF sqlca.sqlcode OR sqlca.sqlerrd[3] = 0 THEN                        
           #         #更新檢驗單據[QMS拋轉狀態]失敗，不可取消確認！
           #         INITIALIZE g_errparam TO NULL
           #         LET g_errparam.code = 'aqc-00188'
           #         LET g_errparam.extend = l_qcbadocno
           #         LET g_errparam.popup = TRUE
           #         CALL cl_err()
           #         LET r_success = FALSE
           #         EXIT FOREACH                     
           #      END IF                  
           #   END IF
           #END IF
           #190702-00010#20 mark --(E)--
            IF NOT s_aqct300_upd_inao024(l_qcbadocno,1)  THEN
               LET r_success = FALSE
               EXIT FOREACH
            ELSE
               LET l_qcbamoddt = cl_get_current()    #190702-00010#20 add
               UPDATE qcba_t
                  SET qcbastus = 'X',
                      qcbamodid = g_user,
                     #qcbamoddt = cl_get_current()   #190702-00010#20 mark
                      qcbamoddt = l_qcbamoddt        #190702-00010#20 add
                WHERE qcbaent = g_enterprise
                  AND qcbadocno = l_qcbadocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'UPDATE qcba_t'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
            END IF
         END FOREACH
      END IF
   END IF
   #190702-00010#16 -E add
   
   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''

   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add    

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add

   UPDATE xmdk_t
      SET xmdkstus = 'N',
          xmdkcnfid = NULL,
          xmdkcnfdt = NULL
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   #PGS(D)-13130 meno -E
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF

   #回寫出通單
   #IF NOT s_axmt540_xmdh_upd(p_xmdkdocno,'uncon') THEN   #180702-00019#1 mark
   IF NOT s_axmt540_xmdh_upd(p_xmdkdocno,'','uncon') THEN #180702-00019#1 add
      LET r_success = FALSE
   END IF
   
   #210121-00024#1---add---s
   LET l_sql = "SELECT DISTINCT xmdl001,xmdl002,xmdl003,xmdl004,xmdl005, ",
               "                xmdl006,xmdl008,xmdl017,xmdl021 ",
               "  FROM xmdl_t",
                " WHERE xmdlent = '",g_enterprise,"'",
                "   AND xmdldocno = '",p_xmdkdocno,"'"              
   PREPARE s_axmt540_pre44 FROM l_sql
   DECLARE s_axmt540_cs44 CURSOR FOR s_axmt540_pre44
   FOREACH s_axmt540_cs44 INTO l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
                            ,l_xmdl008,l_xmdl017,l_xmdl021
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl001) OR cl_null(l_xmdl002) THEN
         CONTINUE FOREACH
      END IF
      
      SELECT xmdgstus INTO l_stus FROM xmdg_t
       WHERE xmdgent = g_enterprise
         AND xmdgdocno = l_xmdl001
      IF l_stus = 'Q' THEN
         IF NOT s_axmt520_xmdh_upd(l_xmdl001) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
   END FOREACH     
   #210121-00024#1---add---e
   
   #在揀量更新
   IF NOT s_axmt540_ins_inap(p_xmdkdocno,'-1','uncon') THEN
      LET r_success = FALSE
   END IF
   #150630--POLLY--MARK--(S)
   #更新信用餘額檔(反向)
   #IF NOT s_axmt540_credit('3',p_xmdkdocno) THEN
   #   LET r_success = FALSE
   #END IF
   #150630--POLLY--MARK--(E)
   #171214-00052#17-s mark 
   #170329-00046#21-s -add
#   #檢查是否為單一稅別(TRUE:單一稅別；FALSE:多稅別)
#   IF s_axmt540_chk_xmdl025(p_xmdkdocno) THEN
#      #若為單一稅別，則將已經調整過(xrcd008='Y')的資料，分攤還原
#      IF s_axmt540_unconf_xrcd(p_xmdkdocno) THEN
#         #更新單頭 總未稅金額/總含稅金額/總稅額
#         IF NOT s_axmt540_upd_xmdk_amount(p_xmdkdocno) THEN
#            LET r_success = FALSE
#            RETURN r_success
#         END IF
#      ELSE
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#   END IF
#   #170329-00046#21-e -add
   #171214-00052#17-e mark 
   #其他欄位回寫
   IF NOT s_axmt540_other_upd(p_xmdkdocno,'uncon') THEN
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 檢查出貨數量是否大於來源的可轉出貨量
# Memo...........:
# Usage..........: CALL s_axmt540_ship_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   出貨單號
#                : 
# Return code....: r_success     處理狀態
#                : 
# Date & Author..: 140626 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_ship_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   DEFINE l_xmdlseq       LIKE xmdl_t.xmdlseq
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001  #出通單號
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002  #出通單項次
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003  #訂單單號
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004  #訂單項次
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005  #訂單項序
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006  #訂單分批序
   DEFINE l_xmdm005       LIKE xmdm_t.xmdm005  #庫位
   DEFINE l_xmdm006       LIKE xmdm_t.xmdm006  #儲位
   DEFINE l_xmdm007       LIKE xmdm_t.xmdm007  #批號
   DEFINE l_xmdm033       LIKE xmdm_t.xmdm033  #庫存管理特徵
   DEFINE l_gzze003       LIKE gzze_t.gzze003
   DEFINE l_ship          LIKE xmdl_t.xmdl018  #未出貨數量
   DEFINE l_can_ship      LIKE xmdl_t.xmdl018  #可出貨數量

   #150624---earl---add---s
   DEFINE l_xmdl028       LIKE xmdl_t.xmdl028
   DEFINE l_xmdb     RECORD
             xmdbdocno    LIKE xmdb_t.xmdbdocno,   #訂單單號
             xmdb001      LIKE xmdb_t.xmdb001,     #期別
             xmdb016      LIKE xmdb_t.xmdb016,     #帳款類型
             xmdb017      LIKE xmdb_t.xmdb017,     #帳款影響出貨模式
             xmdb007      LIKE xmdb_t.xmdb007      #應收帳款單號
                     END RECORD
   
   DEFINE l_xrcc     RECORD
             xrcc108      LIKE xrcc_t.xrcc108,     #原幣應收金額
             xrcc109      LIKE xrcc_t.xrcc109      #原幣收款沖帳金額
                     END RECORD
   #150624---earl---add---e

   #150917-00001#3  2016/01/21  By earl add s
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_chk           LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE l_qty           LIKE xmdl_t.xmdl205     #未續拋數量
   DEFINE l_qty_batch     LIKE xmdl_t.xmdl205     #未續拋數量(考慮批號)
   #150917-00001#3  2016/01/21  By earl add e
   DEFINE l_xrcastus      LIKE xrca_t.xrcastus   #170607-00026#1	add
   DEFINE l_icaa004       LIKE icaa_t.icaa004    #180103-00036#4 add
   DEFINE l_axrfrdoc      LIKE isaf_t.isafdocno  #200616-00081#1 add
   DEFINE l_xmdb001       LIKE type_t.chr1       #200616-00081#1 add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET l_ship = ''
   LET l_can_ship = ''

   #統銷統收產生之出貨單不做回寫、檢查動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF

   LET l_sql = "SELECT xmdk002,xmdk044,",   #150917-00001#3  2016/01/21  By earl mod
               "       xmdlseq,xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,xmdl006",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdlent = '",g_enterprise,"'",
               "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre4 FROM l_sql
   DECLARE s_axmt540_cs4 CURSOR FOR s_axmt540_pre4

   LET l_sql = "SELECT xmdm005,xmdm006,xmdm007,xmdm033 FROM xmdm_t",
               " WHERE xmdment = '",g_enterprise,"'",
               "   AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdmseq = ?"
   PREPARE s_axmt540_pre5 FROM l_sql
   DECLARE s_axmt540_cs5 CURSOR FOR s_axmt540_pre5

   #150624---earl---add---s
   #180103-00036#4 -S mark
  #LET l_sql = "SELECT xmdbdocno,xmdb001,xmdb016,xmdb017,xmdb007",
  #            "  FROM xmdb_t",
  #            " WHERE xmdbent = ",g_enterprise,
  #            "   AND xmdbdocno IN (SELECT xmdl003",
  #            "                       FROM xmdl_t",
  #            "                      WHERE xmdlent = ",g_enterprise,
  #            "                        AND xmdldocno = '",p_xmdkdocno,"')"
   #180103-00036#4 -E mark
   
   #180103-00036#4 -S add
   LET l_xmdk044 = ''
   LET l_icaa004 = ''
   SELECT xmdk044,icaa004
     INTO l_xmdk044,l_icaa004
     FROM xmdk_t,icaa_t
    WHERE xmdkent = g_enterprise
      AND icaaent = xmdkent
      AND icaa001 = xmdk044
      AND xmdkdocno = p_xmdkdocno
   
   LET l_sql = " SELECT xmdbdocno,xmdb001,xmdb016,xmdb017,xmdb007",
               "   FROM xmdb_t",
               "  WHERE xmdbent = ",g_enterprise
   IF l_icaa004 = '2' THEN  #逆拋
      LET l_sql = l_sql," AND xmdbdocno IN (SELECT xmdadocno",
                        "                     FROM xmda_t,icab_t",
                        "                    WHERE xmdaent = ",g_enterprise,
                        "                      AND icabent = xmdaent",
                        "                      AND icab001 = '",l_xmdk044,"'",
                        "                      AND icab002 = (SELECT MIN(icab002)",
                        "                                       FROM icab_t",
                        "                                      WHERE icabent = xmdaent",
                        "                                        AND icab001 = '",l_xmdk044,"')",
                        "                      AND xmdasite = icab003",
                        "                      AND xmda031 IN (SELECT DISTINCT xmda031",
                        "                                       FROM xmda_t,xmdl_t,xmdc_t",
                        "                                      WHERE xmdaent = ",g_enterprise,
                        "                                        AND xmdaent = xmdlent",
                        "                                        AND xmdaent = xmdcent",
                        "                                        AND xmdadocno = xmdcdocno",
                        "                                        AND xmdcdocno = xmdl003",
                        "                                        AND xmdcseq = xmdl004",
                        "                                        AND xmdldocno = '",p_xmdkdocno,"'))"
   ELSE  #正拋或無多角編號
      LET l_sql = l_sql," AND xmdbdocno IN (SELECT xmdl003",
                        "                     FROM xmdl_t",
                        "                    WHERE xmdlent = ",g_enterprise,
                        "                      AND xmdldocno = '",p_xmdkdocno,"')"
   END IF
   #180103-00036#4 -E add
   
   PREPARE s_axmt540_pre38 FROM l_sql
   DECLARE s_axmt540_cs38 CURSOR FOR s_axmt540_pre38
   
   #170324-00033#1 by sakura mark(S)
   #LET l_sql = "SELECT SUM(xrcc108),SUM(xrcc109)",
   #            "  FROM xrca_t,xrcc_t",
   #            " WHERE xrcaent = xrccent AND xrccent = ",g_enterprise,
   #            "   AND xrcald = xrccld",
   #            "   AND xrcadocno = xrccdocno",
   #            "   AND xrca016 = '10'",   #訂單
   #            "   AND xrcastus = 'Y'",
   #            "   AND xrca018 = ?",
   #            "   AND xrca064 = ?"
   #PREPARE s_axmt540_pre39 FROM l_sql
   #
   #LET l_sql = "SELECT SUM(xrcc109)",
   #            "  FROM xrca_t,xrcc_t",
   #            " WHERE xrcaent = xrccent AND xrccent = ",g_enterprise,
   #            "   AND xrcald = xrccld",
   #            "   AND xrcadocno = xrccdocno",
   #            "   AND xrca016 = '10'",   #訂單
   #            "   AND xrcastus = 'Y'",
   #            "   AND xrca018 = ?",
   #            "   AND xrca064 IN (SELECT xmdb001 ",
   #            "                     FROM xmdb_t",
   #            "                    WHERE xmdbent = ",g_enterprise,
   #            "                      AND xmdbdocno = xrca018",
   #            "                      AND xmdb017 = '4')"
   #PREPARE s_axmt540_pre40 FROM l_sql   
   #170324-00033#1 by sakura mark(E)
   
   #170324-00033#1 by sakura add(S)
   LET l_sql = "SELECT SUM(xrcc108),SUM(xrcc109)",
               "  FROM xrca_t,xrcc_t,xrcb_t ",
               " WHERE xrcaent = xrccent AND xrccent = ",g_enterprise,
               "   AND xrcald = xrccld",
               "   AND xrcadocno = xrccdocno",
               "   AND xrcaent = xrcbent ",
               "   AND xrcadocno = xrcbdocno ",               
               "   AND xrcald = xrcbld ",
               "   AND xrcb001 = '10'",   #訂單
               "   AND xrcastus = 'Y'",
               #190225-00018#1 by 02159 add(S)
               "   AND xrca018 = ? ",    #來源單號
               #"   AND xrca064 = ? "     #訂金序      #200616-00081#1 mark
               "   AND NVL(TO_CHAR(xrca064),' ') = ? " #200616-00081#1 add               
               #190225-00018#1 by 02159 add(E)
               #190225-00018#1 by 02159 mark(S)
               #"   AND xrcb002 = ?",
               #"   AND xrcb003 = ?"
               #190225-00018#1 by 02159 mark(E)
   PREPARE s_axmt540_pre39 FROM l_sql

   LET l_sql = "SELECT SUM(xrcc109)",
               "  FROM xrca_t,xrcc_t,xrcb_t ",
               " WHERE xrcaent = xrccent AND xrccent = ",g_enterprise,
               "   AND xrcald = xrccld",
               "   AND xrcadocno = xrccdocno",
               "   AND xrcaent = xrcbent ",
               "   AND xrcadocno = xrcbdocno ",               
               "   AND xrcald = xrcbld ",               
               "   AND xrcb001 = '10'",   #訂單
               "   AND xrcastus = 'Y'",
              #"   AND xrcbseq = xrccseq ", #190423-00040#1 add    #201020-00031#1 mark
               "   AND xrcb002 = ?",
               #180103-00036#4 -S mark
              #"   AND xrcb003 IN (SELECT xmdb001 ",
              #"                     FROM xmdb_t",
              #"                    WHERE xmdbent = ",g_enterprise,
              #"                      AND xmdbdocno = xrcb002",
              #"                      AND xmdb017 = '4')"
               #180103-00036#4 -E mark
               #180103-00036#4 -S add
               "   AND EXISTS (SELECT xmdcseq ",
               "                 FROM xmdc_t ",
               "                WHERE xmdcent = xrcaent ",
               "                  AND xmdcdocno = xrcb002 ",
               "                  AND xrcb003 = xmdcseq) "
               #180103-00036#4 -E add
   #201020-00031#1 add(s)
   IF cl_get_para(g_enterprise,g_site,'S-FIN-1002') = '3' THEN
      LET l_sql = l_sql," AND xrcbseq = xrccseq "
   END IF   
   #201020-00031#1 add(e)
   PREPARE s_axmt540_pre40 FROM l_sql
   #170324-00033#1 by sakura add(E)

   LET l_sql = "SELECT SUM(xmdl028)",
               "  FROM xmdk_t a,xmdl_t",
               " WHERE a.xmdkent = xmdlent AND xmdlent = ",g_enterprise,
               "   AND a.xmdkdocno = xmdldocno",
               "   AND a.xmdkstus <> 'X'",
               "   AND xmdl003 = ?",
               "   AND xmdk0001 <> '4' ",          #201215-00027#1 add
               "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
               "                                          FROM xmdk_t b",
               "                                         WHERE b.xmdkent = a.xmdkent",
               "                                           AND b.xmdkdocno = a.xmdk035",
               "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
   PREPARE s_axmt540_pre41 FROM l_sql

   #180103-00036#4 -S add
   #逆拋->依照最後一站的出貨單數量(xmdl018)，去乘第0站訂單的單價(xmdc015)
   LET l_sql = " SELECT SUM (xmdc015 * xmdl018)",
               "   FROM xmdc_t,xmdl_t,xmda_t,icab_t",
               "  WHERE xmdaent = ",g_enterprise,
               "    AND xmdaent = xmdcent",
               "    AND icabent = xmdaent",
               "    AND xmdlent = xmdaent",   #181001-00015#84 add
               "    AND icab001 = '",l_xmdk044,"'",
               "    AND icab002 = (SELECT MIN(icab002)",
               "                     FROM icab_t",
               "                    WHERE icabent = xmdaent",
               "                      AND icab001 = '",l_xmdk044,"')",
               "    AND xmdasite = icab003",
               "    AND xmdadocno = xmdcdocno",
               "    AND xmdcseq = xmdl004",
               "    AND xmdldocno = '",p_xmdkdocno,"'",
               "    AND xmda031 IN (SELECT DISTINCT xmda031",
               "                      FROM xmda_t,xmdl_t,xmdc_t",
               "                     WHERE xmdaent = ",g_enterprise,
               "                       AND xmdaent = xmdlent",
               "                       AND xmdaent = xmdcent",
               "                       AND xmdadocno = xmdcdocno",
               "                       AND xmdcdocno = xmdl003",
               "                       AND xmdcseq = xmdl004",
               "                       AND xmdldocno = '",p_xmdkdocno,"')"
   PREPARE s_axmt540_pre41_1 FROM l_sql
   #180103-00036#4 -E add

   INITIALIZE l_xmdb.* TO NULL
   FOREACH s_axmt540_cs38 INTO l_xmdb.xmdbdocno,l_xmdb.xmdb001,l_xmdb.xmdb016,l_xmdb.xmdb017,l_xmdb.xmdb007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:s_axmt540_cs38"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
   
      IF l_xmdb.xmdb016 = '1' OR l_xmdb.xmdb016 = '2' THEN   #1:簽約金,2:訂金
         CASE l_xmdb.xmdb017
            WHEN '2'   #2:需立應收帳款方可出貨
               #多帳期的xmdb007有值才可確認
               IF cl_null(l_xmdb.xmdb007) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00701'  #訂單%1多帳期期別%2之訂金預收款未收不可出貨
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  
                  LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                  LET g_errparam.replace[2] = l_xmdb.xmdb001
                  
                  CALL cl_err()
                 
                  LET r_success = FALSE
                  CONTINUE FOREACH
                #170607-00026#1---add---begin---
                ELSE
                  SELECT xrcastus INTO l_xrcastus FROM xrca_t
                   WHERE xrcaent = g_enterprise
                     AND xrcadocno = l_xmdb.xmdb007
                  IF l_xrcastus = 'N' THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'axm-00834'  #订单%1多账期别%2之订金预收款单未审核不可出货！
                   LET g_errparam.extend = ''
                   LET g_errparam.popup = TRUE
                   LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                   LET g_errparam.replace[2] = l_xmdb.xmdb001
                   CALL cl_err()
                   LET r_success = FALSE
                   CONTINUE FOREACH
                  END IF 
                #170607-00026#1---add---end---   
               END IF
               
            WHEN '3'   #3:需收款兌現方可出貨
               #當是需收款兌現方可出貨時需檢查axrt310中對應的SUM(xrcc108) = SUM(xrcc109)才可確認
               INITIALIZE l_xrcc.* TO NULL
               #200616-00081#1 add---start---
               LET l_axrfrdoc = ''
               SELECT DISTINCT isafdocno INTO l_axrfrdoc
                 FROM isaf_t,isag_t
                WHERE isafent = isagent
                  AND isafcomp = isagcomp
                  AND isafdocno = isagdocno
                  AND isaf001 = '3'
                  AND isag001 = '10'
                  AND isag002 = l_xmdb.xmdbdocno
               IF cl_null(l_axrfrdoc) THEN
                  LET l_axrfrdoc = l_xmdb.xmdbdocno
                  LET l_xmdb001 = l_xmdb.xmdb001
               ELSE
                  LET l_xmdb001 = ' '
               END IF
               EXECUTE s_axmt540_pre39 USING l_axrfrdoc,l_xmdb001 INTO l_xrcc.xrcc108,l_xrcc.xrcc109
               #200616-00081#1 add---end---
               #EXECUTE s_axmt540_pre39 USING l_xmdb.xmdbdocno,l_xmdb.xmdb001 INTO l_xrcc.xrcc108,l_xrcc.xrcc109     #200616-00081#1 mark
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "EXECUTE:s_axmt540_pre39"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
               
               IF cl_null(l_xrcc.xrcc108) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00693'   #訂單%1多帳期期別%2無對應之已確認訂金預收資料！
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                     
                  LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                  LET g_errparam.replace[2] = l_xmdb.xmdb001
                     
                  CALL cl_err()
                     
                  LET r_success = FALSE
                  CONTINUE FOREACH                  
               END IF
               
               IF cl_null(l_xrcc.xrcc109) THEN
                  LET l_xrcc.xrcc109 = 0
               END IF
               
               IF l_xrcc.xrcc108 <> l_xrcc.xrcc109 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00694'  #訂單%1多帳期期別%2之訂金應收金額%3與沖帳金額%4不符！
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  
                  LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                  LET g_errparam.replace[2] = l_xmdb.xmdb001
                  LET g_errparam.replace[3] = l_xrcc.xrcc108
                  LET g_errparam.replace[4] = l_xrcc.xrcc109
                  
                  CALL cl_err()
                 
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            
            
            WHEN '4'   #4:依已收款金額出貨
               #當是依收款金額出貨時，需檢查該訂單對應的所有出貨金額要小於對應的預收款以兌現金額(xrcc109)時才可以確認
               INITIALIZE l_xrcc.* TO NULL
               EXECUTE s_axmt540_pre40 USING l_xmdb.xmdbdocno INTO l_xrcc.xrcc109
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "EXECUTE:s_axmt540_pre40"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF

               IF cl_null(l_xrcc.xrcc109) THEN
                  INITIALIZE g_errparam TO NULL
                 #LET g_errparam.code = 'axm-00695'  #180103-00036#4 mark  #更正錯誤訊息
                  #訂單%1多帳期期別%2無對應之已確認訂金預收資料！
                  LET g_errparam.code = 'axm-00693'  #180103-00036#4 add
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  
                  LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                  LET g_errparam.replace[2] = l_xmdb.xmdb001
                  
                  CALL cl_err()
                  
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
               
               LET l_xmdl028 = ''
              #EXECUTE s_axmt540_pre41 USING l_xmdb.xmdbdocno INTO l_xmdl028  #180103-00036#4 mark
               #180103-00036#4 -S add
               IF l_icaa004 = '2' THEN  #逆拋
                  EXECUTE s_axmt540_pre41_1 INTO l_xmdl028
               ELSE  #正拋或無多角編號
                  EXECUTE s_axmt540_pre41 USING l_xmdb.xmdbdocno INTO l_xmdl028
               END IF
               #180103-00036#4 -E add

               IF cl_null(l_xmdl028) THEN
                  LET l_xmdl028 = 0
               END IF
               
               IF l_xmdl028 > l_xrcc.xrcc109 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00695'  #訂單%1多帳期期別%2之出貨總金額%3不可大於沖帳金額%4！
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  
                  LET g_errparam.replace[1] = l_xmdb.xmdbdocno
                  LET g_errparam.replace[2] = l_xmdb.xmdb001
                  LET g_errparam.replace[3] = l_xmdl028
                  LET g_errparam.replace[4] = l_xrcc.xrcc109
                  
                  CALL cl_err()
                 
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            
         END CASE
      END IF
   END FOREACH   
   #150624---earl---add---e

   FOREACH s_axmt540_cs4 INTO l_xmdk002,l_xmdk044,  #150917-00001#3  2016/01/21  By earl mod
                              l_xmdlseq,l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF NOT cl_null(l_xmdl001) THEN  #來源為出通單
         CASE l_xmdk002
            WHEN '8'  #借貨出貨單
               CALL cl_getmsg('axm-00584',g_dlang) RETURNING l_gzze003   #借貨出貨通知單維護作業axmt521
            OTHERWISE
               CALL cl_getmsg('axm-00583',g_dlang) RETURNING l_gzze003   #出貨通知單維護作業axmt520
         END CASE
      
         CALL s_axmt540_get_max_ship_qty(1,'','',l_xmdl001,l_xmdl002,'','') RETURNING l_ship,l_can_ship
    
         IF l_can_ship < 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00183'  #出貨單"出貨數量"不可大於出通單%1項次%2的"可出貨數量"！
            LET g_errparam.extend = l_xmdl001
            LET g_errparam.popup = TRUE
            
            LET g_errparam.replace[1] = l_xmdl001
            LET g_errparam.replace[2] = l_xmdl002
            LET g_errparam.replace[3] = l_gzze003
            
            CALL cl_err()

            LET r_success = FALSE
            CONTINUE FOREACH
         END IF
        
         #檢查多庫儲批
         OPEN s_axmt540_cs5 USING l_xmdlseq
         FOREACH s_axmt540_cs5 INTO l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm033
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               CONTINUE FOREACH
            END IF

            CALL s_axmt540_get_max_ship_qty1('','',l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm033,l_xmdl001,l_xmdl002) RETURNING l_can_ship
            IF l_can_ship < 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00183'   #出貨單"出貨數量"不可大於出通單%1項次%2的"可出貨數量"！
               LET g_errparam.extend = l_xmdl001
               LET g_errparam.popup = TRUE
               
               LET g_errparam.replace[1] = l_xmdl001
               LET g_errparam.replace[2] = l_xmdl002
               LET g_errparam.replace[3] = l_gzze003
               
               CALL cl_err()

               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
         END FOREACH
         
      ELSE       #來源為訂單
         IF NOT cl_null(l_xmdl003) THEN  
            CASE l_xmdk002
               WHEN '8'  #借貨出貨單
                  CALL cl_getmsg('axm-00586',g_dlang) RETURNING l_gzze003   #借貨訂單維護作業axmt501
               OTHERWISE
                  CALL cl_getmsg('axm-00585',g_dlang) RETURNING l_gzze003   #訂單維護作業axmt500
            END CASE
         
            CALL s_axmt540_get_max_ship_qty(2,'','',l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006) RETURNING l_ship,l_can_ship
            
            IF l_can_ship < 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00184'  #出貨單"出貨數量"不可大於訂單%1項次%2項序%3分批序%4"可轉出貨數量"！
               LET g_errparam.extend = l_xmdl003
               LET g_errparam.popup = TRUE

               LET g_errparam.replace[1] = l_xmdl003
               LET g_errparam.replace[2] = l_xmdl004
               LET g_errparam.replace[3] = l_xmdl005
               LET g_errparam.replace[4] = l_xmdl006
               LET g_errparam.replace[5] = l_gzze003
               
               CALL cl_err()

               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
         END IF
      END IF
      
      #150917-00001#3  2016/01/21  By earl add s
      #171218-00024#2-s-mark
      #CALL s_aic_carry_continue_qty(g_site,l_xmdk044,'1',l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,'','','')
      #RETURNING l_chk,l_qty,l_qty_batch
      #171218-00024#2-e-mark
      #171218-00024#2-s-add
      #可續拋量檢查
      CALL s_aic_carry_continue_qty2(g_site,l_xmdk044,'1',l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,'','','','')
      RETURNING l_chk,l_qty,l_qty_batch
      #171218-00024#2-e-add
      IF l_chk THEN
         IF l_qty < 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00748'  #項次%1 多角出貨單"出貨數量"不可大於最終站可續拋數量！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_xmdlseq
            CALL cl_err()
            
            LET r_success = FALSE
            CONTINUE FOREACH
         END IF
      END IF
      #150917-00001#3  2016/01/21  By earl add e
      
   END FOREACH
   
   CLOSE s_axmt540_cs38
   FREE s_axmt540_pre38
   FREE s_axmt540_pre39
   FREE s_axmt540_pre40
   FREE s_axmt540_pre41
   CLOSE s_axmt540_cs4
   FREE s_axmt540_pre4
   CLOSE s_axmt540_cs5
   FREE s_axmt540_pre5   
   
   RETURN r_success
   
END FUNCTION
################################################################################
# Descriptions...: 出貨單過帳流程
# Memo...........: 對出貨單據進行庫存過帳
# Usage..........: CALL s_axmt540_post_upd(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 出貨單號
#                : 
# Return code....: r_success  處理狀況
#                : 
# Date & Author..: 140324 By earl

# Modify.........: 150630 By Polly (1)出貨單走簽收，出貨確認檢核額度是否超限，到簽收確認後才更新信用餘額檔
#                                  (2)出貨單不走簽收，出貨確認檢核額度是否超限，扣帳確認直接更新信用餘額檔
################################################################################
PUBLIC FUNCTION s_axmt540_post_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_datetime      DATETIME YEAR TO SECOND
   DEFINE l_xmdk000       LIKE xmdk_t.xmdk000     #150630 polly add
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002     #150630 polly add
   #150709 by 04441 add start
   DEFINE l_xmdk035       LIKE xmdk_t.xmdk035
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_xmdasite      LIKE xmda_t.xmdasite
   DEFINE l_slip          LIKE xmdk_t.xmdkdocno
   DEFINE l_success       LIKE type_t.num5
   #150709 by 04441 add end
   #170618-00261#2-s add
   DEFINE l_xmdk001       LIKE xmdk_t.xmdk001
   DEFINE l_xmdk016       LIKE xmdk_t.xmdk016
   DEFINE l_xmdk017       LIKE xmdk_t.xmdk017
   DEFINE l_xmdk032       LIKE xmdk_t.xmdk032
   DEFINE l_xmdk042       LIKE xmdk_t.xmdk042
   #170618-00261#2-e add
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   #180712-00076#1 Add By 06137  180726(S)
   DEFINE l_sql           STRING
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdcunit      LIKE xmdc_t.xmdcunit
   #180712-00076#1 Add By 06137  180726(E)
   DEFINE l_xmdk043       LIKE xmdk_t.xmdk043  #200731-00049#1 add
   
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   LET l_datetime = cl_get_current()

   UPDATE xmdk_t
      SET xmdkstus = 'S',
          xmdkpstid = g_user,
          xmdkpstdt = l_datetime
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF      

   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdl003 = ''

   SELECT xmdk044,xmdk045,xmdl003 INTO l_xmdk044,l_xmdk045,l_xmdl003
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
      AND xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add
#200916-00013#1-S add
#200916-00013#1-E add   

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add

   #171218-00024#2-s-add
   LET g_aic_direct = FALSE
   INITIALIZE g_aic.* TO NULL
   #取得是否為多角正拋
   CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.icab003,g_aic.icac007,g_aic.icad004,g_aic.icad005
   #171218-00024#2-e-add
   
   #直送訂單產生收貨入庫單並過帳
   IF NOT s_axmt540_direct_process('2',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF

   #回寫訂單
   IF NOT s_axmt540_xmdd_upd(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
#180316-00018#1-s mark 往後挪
#   #庫存量更新
#   IF NOT s_axmt540_inag_inaj_upd('post',p_xmdkdocno) THEN
#      LET r_success = FALSE
#   END IF   
#180316-00018#1-e mark
   #在揀量更新
   IF NOT s_axmt540_ins_inap(p_xmdkdocno,'-1','pos') THEN
      LET r_success = FALSE
   END IF   

   #2015/01/16 by stellar add ----- (S)   
   #備置量更新
   IF NOT s_axmt540_upd_inan(p_xmdkdocno,'1') THEN
      LET r_success = FALSE
   END IF
   #2015/01/16 by stellar add ----- (E)

   #需求等候排隊數量更新
   IF NOT s_axmt540_inas('pos',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #180316-00018#1-s
   #庫存量更新
   IF NOT s_axmt540_inag_inaj_upd('post',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF   
   #180316-00018#1-e
   LET l_xmdk000 = ''
   LET l_xmdk002 = ''
   LET l_xmdk035 = ''
   LET l_xmdk045 = ''
   #170618-00261#2-s add
   LET l_xmdk001 = ''
   LET l_xmdk016 = ''
   LET l_xmdk017 = ''
   LET l_xmdk032 = ''
   LET l_xmdk042 = ''   
   #170618-00261#2-e add
   LET l_xmdk043 = ''   #200731-00049#1 add
   SELECT xmdk000,xmdk002,
          xmdk001,xmdk016,xmdk032,xmdk042,           #170618-00261#2-s add
          xmdk035,xmdk045                 
          ,xmdk043                                   #200731-00049#1 add          
     INTO l_xmdk000,l_xmdk002,
          l_xmdk001,l_xmdk016,l_xmdk032,l_xmdk042,   #170618-00261#2-e add 
          l_xmdk035,l_xmdk045   
          ,l_xmdk043                                 #200731-00049#1 add          
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno         
   #170618-00261#2-s add
   #IF cl_null(l_xmdk032) AND l_xmdk042 = '2' THEN    #200731-00049#1 mark  
   IF cl_null(l_xmdk032) AND l_xmdk042 = '2' AND l_xmdk043 <> '1' THEN     #200731-00049#1 add    
      LET l_xmdk032 = l_xmdk001
      CALL s_axmt540_get_exchange(l_xmdk042,l_xmdk016,l_xmdk001) RETURNING l_xmdk017      
      UPDATE xmdk_t
         SET xmdk032 = l_xmdk032,
             xmdk017 = l_xmdk017
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
      END IF            
     #CALL s_axmt540_detail_upd(p_xmdkdocno,'','',l_xmdk017,'3') RETURNING r_success   #180323-00035#1 mark
   END IF
   #170618-00261#2-e add
   #150630--POLLY--ADD--(S)
   #IF l_xmdk000 MATCHES '[12]' AND l_xmdk002 <> '3' THEN  #180712-00076#1 Mark By 06137  180726
   #180712-00076#1 Add By 06137  180726(S)
   IF l_xmdk045 = '3' THEN  #多角性質為3.統銷統收時
      LET l_xmdl003 = ''
      LET l_xmdl004 = ''
      LET l_xmdcunit = ''
      #取出貨單第一筆明細的訂單單號、項次
      LET l_sql = "SELECT xmdl003,xmdl004 ", 
                  "  FROM xmdl_t ",
                  " WHERE xmdlent = ", g_enterprise ,
                  "   AND xmdldocno = '", p_xmdkdocno ,"' "
      PREPARE s_axmt540_xmdl_pre1 FROM l_sql
      DECLARE s_axmt540_xmdl_cur SCROLL CURSOR FOR s_axmt540_xmdl_pre1
      OPEN s_axmt540_xmdl_cur
      FETCH FIRST s_axmt540_xmdl_cur INTO l_xmdl003,l_xmdl004
      FREE s_axmt540_xmdl_pre1
      CLOSE s_axmt540_xmdl_cur    
      #取得統銷統收的訂單出貨據點
      SELECT xmdcunit INTO l_xmdcunit 
        FROM xmdc_t
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = l_xmdl003
         AND xmdcseq = l_xmdl004
   END IF  
  
   IF l_xmdk002 <> '4' THEN #190926-00009#1 add  
     #IF (l_xmdk000 MATCHES '[12]' AND l_xmdk002 <> '3' AND l_xmdk045 !='3')               #190521-00023#2 mark
      IF (l_xmdk000 MATCHES '[12]' AND (NOT l_xmdk002 MATCHES '[38]') AND l_xmdk045 !='3') #190521-00023#2 add 8.借貨訂單
      OR (l_xmdk000 MATCHES '[12]' AND l_xmdk045 ='3' AND g_site!=l_xmdcunit ) THEN   
      #180712-00076#1 Add By 06137  180726(E)   
         #更新信用餘額檔(正向)
         IF NOT s_axmt540_credit('2',p_xmdkdocno) THEN
            LET r_success = FALSE
         END IF
      END IF
   END IF                   #190926-00009#1 add
   #150630--POLLY--ADD--(E)
      
   #150917-00001#3  2016/01/21  By earl add s
   #其他欄位回寫
   IF NOT s_axmt540_other_upd(p_xmdkdocno,'pos') THEN
      LET r_success = FALSE
   END IF
   #150917-00001#3  2016/01/21  By earl add e
   
   #過帳時，判斷多角性質(xmdk045)=3.統銷統收時，在訂單的xmdasite產生一張已過帳的出貨單
   #IF l_xmdk045 = '3' AND cl_null(l_xmdk035) THEN    #171222-00011#2 Mark By 06137  180313
   IF l_xmdk045 = '3' AND cl_null(l_xmdk035) AND l_xmdk002 = '1' THEN    #171222-00011#2 Add By 06137  180313  加上訂單(出貨)性質=1.一般出貨
      CALL s_aic_carry_gen_tri_sb(p_xmdkdocno) RETURNING r_success,l_xmdkdocno
      IF r_success THEN
         IF NOT cl_null(l_xmdkdocno) THEN
            INITIALIZE g_errparam TO NULL       
            LET g_errparam.code   = 'axm-00709'   #統銷統收之初始站出貨單號%1產生成功！
            LET g_errparam.extend = ''
            LET g_errparam.replace[1] = l_xmdkdocno
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         END IF
      ELSE
         RETURN r_success
      END IF
   END IF
   
   #160125-00025#2  2016/02/15  By earl mod s
   IF r_success THEN
      IF NOT s_barcode_01_upd('1',g_prog,g_site,p_xmdkdocno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   #160125-00025#2  2016/02/15  By earl mod e
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新在揀量
# Memo...........:
# Usage..........: CALL s_axmt540_ins_inap(p_xmdkdocno,p_type,p_cmd)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出貨單號
#                : p_type         異動類型(1.在揀量增加-1.在揀量減少)
#                : p_cmd          流程：con確認,uncon取消確認,pos過帳,unpos過帳還原,upd修改
# Return code....: r_success      處理狀態
#                : 
# Date & Author..: 140326 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_ins_inap(p_xmdkdocno,p_type,p_cmd)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_type          LIKE type_t.chr2
   DEFINE p_cmd           LIKE type_t.chr5
   
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_xmdkdocdt     LIKE xmdk_t.xmdkdocdt  #單據日期
   DEFINE l_sql           STRING
   DEFINE l_xmdmseq       LIKE xmdm_t.xmdmseq
   DEFINE l_xmdmseq1      LIKE xmdm_t.xmdmseq1
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdm001       LIKE xmdm_t.xmdm001
   DEFINE l_xmdm002       LIKE xmdm_t.xmdm002
   DEFINE l_xmdm005       LIKE xmdm_t.xmdm005
   DEFINE l_xmdm006       LIKE xmdm_t.xmdm006
   DEFINE l_xmdm007       LIKE xmdm_t.xmdm007
   DEFINE l_xmdm008       LIKE xmdm_t.xmdm008   
   DEFINE l_xmdm009       LIKE xmdm_t.xmdm009
   DEFINE l_xmdm033       LIKE xmdm_t.xmdm033
 
   DEFINE l_type1         LIKE type_t.chr2     #出貨單異動類型
   DEFINE l_type2         LIKE type_t.chr2     #出通單異動類型
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_xmdiseq1      LIKE xmdi_t.xmdiseq1
   DEFINE l_xmdi005       LIKE xmdi_t.xmdi005
   DEFINE l_xmdi006       LIKE xmdi_t.xmdi006
   DEFINE l_xmdi007       LIKE xmdi_t.xmdi007
   DEFINE l_xmdi013       LIKE xmdi_t.xmdi013

   DEFINE l_xmdgdocdt     LIKE xmdg_t.xmdgdocdt
   DEFINE l_xmdm034       LIKE xmdm_t.xmdm034      #160408-00035#7 add
   DEFINE l_xmdm035       LIKE xmdm_t.xmdm035      #160408-00035#7 add
   DEFINE l_imaa004       LIKE imaa_t.imaa004      #170116-00044#2-add
   DEFINE l_flag          LIKE type_t.num5         #190417-00053#1 add
   #DEFINE l_para_data1    LIKE type_t.num5        #190522-00018#1 add    #191031-00033#1---mark
   DEFINE l_para_data1    LIKE type_t.chr1         #191031-00033#1---add
   DEFINE l_slip          LIKE ooba_t.ooba001      #190522-00018#1 add
   DEFINE l_success       LIKE type_t.num5         #190522-00018#1 add
  #190718-00056#1 add --s
   DEFINE l_xmdk044        LIKE xmdk_t.xmdk044     #多角流程編號
   DEFINE l_aic_first_site LIKE icab_t.icab003     #多角銷售正拋首站據點
   DEFINE l_para_inap      LIKE type_t.chr1        #庫存在揀量異動否
  #190718-00056#1 add --e
   DEFINE l_xmdc032        LIKE xmdc_t.xmdc032     #200916-00004#1 add
   #201204-00025#1 add -S
   DEFINE l_site_o         LIKE xmdk_t.xmdksite    
   DEFINE l_cnt            LIKE type_t.num5
   DEFINE l_xmdk083        LIKE xmdk_t.xmdk083
   DEFINE l_xmdk035        LIKE xmdk_t.xmdk035
   DEFINE l_xmdkdocno      LIKE xmdk_t.xmdkdocno
   DEFINE l_aic_last_site  LIKE icab_t.icab003     #多角銷售正拋最終站據點
   DEFINE l_para_inap2     LIKE type_t.chr1 
   #201204-00025#1 add -E
   DEFINE l_imaf058        LIKE imaf_t.imaf058     #210324-00031#1 add 存货拣货策略 1.软备置
   
   WHENEVER ERROR CONTINUE 
 
   LET r_success = TRUE
   
   IF p_type = '-1' THEN
      LET l_type1 = '-1'
      LET l_type2 = '1'
   ELSE
      LET l_type1 = '1'
      LET l_type2 = '-1'
   END IF
  
   LET l_xmdkdocdt = ''
   LET l_xmdk044   = ''          #190718-00056#1 add
   SELECT xmdkdocdt,xmdk044,xmdk083,xmdk035      #190718-00056#1 add xmdk044     #201204-00025#1 add xmdk083,xmdk035
     INTO l_xmdkdocdt,l_xmdk044,l_xmdk083,l_xmdk035  #190718-00056#1 add l_xmdk044 #201204-00025#1 add xmdk083,xmdk035
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno 
      
   #190718-00056#1 add --s
   LET l_para_inap = 'Y'
   LET l_para_inap2 = 'Y'  #201204-00025#1 add
   LET l_aic_first_site = ''
   IF NOT cl_null(l_xmdk044) THEN
      #201204-00025#1 add -S
      #取得最终站资料
      CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.icab003,g_aic.icac007,g_aic.icad004,g_aic.icad005
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM icaa_t,icab_t
       WHERE icaaent = icabent AND icaa001 = icab001
         AND icaaent = g_enterprise
         AND icaa001 = l_xmdk044
         AND icaa003 = '1'  #銷售
         AND icaa004 = '1'  #正拋
         AND icab002 = (SELECT MIN(icab002) FROM icab_t
                         WHERE icabent = icaaent AND icab001 = icaa001)
      IF l_cnt > 0 THEN
         LET g_aic_direct = TRUE
      END IF
      
      #201204-00025#1 add -E
      SELECT icab003
        INTO l_aic_first_site
        FROM icaa_t,icab_t
       WHERE icaaent = icabent AND icaa001 = icab001
         AND icaaent = g_enterprise
         AND icaa001 = l_xmdk044
         AND icaa003 = '1'  #銷售
         AND icaa004 = '1'  #正拋
         AND icab002 = (SELECT MIN(icab002) FROM icab_t
                         WHERE icabent = icaaent AND icab001 = icaa001)
      IF l_aic_first_site = g_site THEN
         LET l_para_inap = 'N' #多角銷售正拋首站不更新在揀量
      END IF
      
      #201204-00025#1 add -S
      #最終站據點
      SELECT icab003
        INTO l_aic_last_site
        FROM icaa_t,icab_t
       WHERE icaaent = icabent AND icaa001 = icab001
         AND icaaent = g_enterprise
         AND icaa001 = l_xmdk044
         AND icaa003 = '1'  #銷售
         AND icaa004 = '1'  #正拋
         AND icab002 = (SELECT MAX(icab002) FROM icab_t
                         WHERE icabent = icaaent AND icab001 = icaa001)
      IF l_aic_last_site = g_site THEN
         SELECT xmdkdocno INTO l_xmdkdocno 
         FROM xmdk_t
         WHERE xmdkent = g_enterprise
           AND xmdksite = l_aic_first_site
           AND xmdk035 = l_xmdk035
           
         LET l_para_inap2 = 'N' #多角銷售正拋最终站确认不更新在揀量
      ELSE
         LET l_xmdkdocno = p_xmdkdocno
      END IF
      #201204-00025#1 add -E
   END IF
   #190718-00056#1 add --e
               
   LET l_sql = "SELECT xmdl001,xmdl002,xmdl003,xmdl004,",  
               "       xmdmseq,xmdmseq1,xmdm001,xmdm002,",
               "       xmdm005,xmdm006,xmdm007,xmdm008,xmdm009,",
               "       (SELECT imaa004 FROM imaa_t WHERE imaaent = xmdlent AND imaa001=xmdl008) imaa004,", #170116-00044#2-add
               "       (SELECT imaf058 FROM imaf_t WHERE imafent = xmdlent AND imafsite = xmdlsite AND imaf001 = xmdl008) imaf058,",   #210324-00031#1 add 存货拣货策略
               "       xmdm033,xmdm034,xmdm035",        #160408-00035#7 add xmdm034,xmdm035
               "  FROM xmdl_t,xmdm_t",
               " WHERE xmdlent = xmdment AND xmdment = '",g_enterprise,"'",
               "   AND xmdldocno = xmdmdocno AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdlseq = xmdmseq",
               " ORDER BY xmdmseq,xmdmseq1"
   PREPARE s_axmt540_pre26 FROM l_sql
   DECLARE s_axmt540_cs26 CURSOR FOR s_axmt540_pre26   

   LET l_sql = "SELECT COUNT(xmdiseq1),xmdgdocdt",
               "  FROM xmdg_t,xmdi_t",
               " WHERE xmdgent = xmdient AND xmdient = '",g_enterprise,"'",
               "   AND xmdgdocno = xmdidocno",
               "   AND xmdidocno = ?",
               "   AND xmdiseq = ?",
               " GROUP BY xmdgdocdt"
   PREPARE s_axmt540_pre7 FROM l_sql

   FOREACH s_axmt540_cs26 INTO l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,        
                               l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm002,
                               l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm009,
                               l_imaa004, #170116-00044#2-add
                               l_imaf058, #210324-00031#1 add
                               l_xmdm033,l_xmdm034,l_xmdm035              #160408-00035#7 add xmdm034,xmdm035
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #費用資料(來源有訂單單號但無訂單項次)
      IF NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004) THEN
         CONTINUE FOREACH
      END IF
      #170116-00044#2-s-add
      #料號為費用類別
      IF l_imaa004 = 'E' THEN
         CONTINUE FOREACH
      END IF
      #170116-00044#2-e-add
      #200916-00004#1 add---start---
      LET l_xmdc032 = NULL
      SELECT xmdc032 INTO l_xmdc032
        FROM xmdc_t
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = l_xmdl003
         AND xmdcseq = l_xmdl004
      #200916-00004#1 add---end---
      
      #可能為Null的欄位
      IF cl_null(l_xmdm002) THEN LET l_xmdm002 = ' ' END IF  #產品特徵
      IF cl_null(l_xmdm006) THEN LET l_xmdm006 = ' ' END IF  #儲位
      IF cl_null(l_xmdm007) THEN LET l_xmdm007 = ' ' END IF  #批號
      IF cl_null(l_xmdm033) THEN LET l_xmdm033 = ' ' END IF  #庫存管理特徵
            
      #160408-00035#7---add---begin
      #出货过帐时需要冲销xmr_t和inao_t资料且删除inap_t
      #如果出货过正时出货数量由备置量与在拣量组成，需要优先冲销掉备置量，再冲销在拣量
      #过正还原时需要将过帐时是动作反处理，因为此时无法确定备置量和在拣量故在xmdm_t加入备置量和在拣量两栏位
      #IF NOT cl_null(l_xmdm034) AND g_prog = 'axmt540'  AND l_xmdm034 > 0  THEN     #161219-00059#1  add 'AND l_xmdm034 > 0'   #170301-00030#1 by 09257 --mark
      IF NOT cl_null(l_xmdm034) AND g_prog MATCHES 'axmt540*'  AND l_xmdm034 > 0  THEN   #170301-00030#1 by 09257 --add 
         #210324-00031#1 add-S
         #如果是软备置，则需要将软备置的库储批根据出货单单身库储批重新统计
         IF l_imaf058 = '1' THEN
            #                                异动类型 营运据点 料号    产品特征  库存管理特征 库位     储位      批号      交易单位   备置数量
            IF NOT s_axmt540_prepare_recount(p_type,g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm034) THEN
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
         END IF
         #210324-00031#1 add-E
         LET l_xmdm009 = l_xmdm035         
      END IF
      
      #160408-00035#7---add---end    
      #IF l_para_inap = 'Y' THEN #190718-00056#1 add #201204-00025#1 mark
         IF l_xmdc032 <> '3' THEN            #200916-00004#1 add      
            #201204-00025#1 add -S
            #若為多角銷售正拋，改寫入最終站的在揀資料
            #單號、項次、項序使用起始出貨單資料,其餘營運據點、庫位、儲位、批號……等使用最終站資料
            IF g_aic_direct THEN
               #僅過帳，未拋轉，不可以把在拣資料刪掉
               IF p_cmd <> 'pos' AND p_cmd <> 'unpos' THEN
                  IF l_para_inap2 <> 'N' THEN
                     #庫存在揀量異動
                     LET l_site_o = g_site       #據點備份
                     IF l_para_inap = 'N' THEN
                        LET g_site = g_aic.icab003  #將據點換成最終站的據點，讓多角正拋能檢查到最終站的庫存數量  
                     END IF                        
                                                 #異動類型 #營運據點     #單據編號      #項次    #項序      #料件編號
                     IF NOT s_inventory_ins_inap(l_type1,g_site,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm001,
                                               #產品特徵 #庫存管理特徵 #庫位       #儲位         #批號
                                               l_xmdm002,l_xmdm033,g_aic.icad004,g_aic.icad005,l_xmdm007,
                                               #交易單位  #數量     #單據日期    #人員  #部門  #營運據點
                                               l_xmdm008,l_xmdm009,l_xmdkdocdt,g_user,g_dept,g_site) THEN
                        LET r_success = FALSE
                        LET g_site = l_site_o       #還原據點
                        CONTINUE FOREACH
                     END IF
                     LET g_site = l_site_o       #還原據點
                  END IF
               END IF
               
               IF (l_xmdk083 = 'Y' AND p_cmd ='pos') OR ( l_xmdk083 = 'N' AND p_cmd ='unpos' AND l_para_inap <> 'N' )  THEN
                  #庫存在揀量異動
                                              #異動類型 #營運據點     #單據編號      #項次    #項序      #料件編號
                  IF NOT s_inventory_ins_inap(l_type1,g_site,l_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm001,
                                            #產品特徵 #庫存管理特徵 #庫位       #儲位         #批號
                                            l_xmdm002,l_xmdm033,g_aic.icad004,g_aic.icad005,l_xmdm007,
                                            #交易單位  #數量     #單據日期    #人員  #部門  #營運據點
                                            l_xmdm008,l_xmdm009,l_xmdkdocdt,g_user,g_dept,g_site) THEN
                     LET r_success = FALSE
                     CONTINUE FOREACH
                  END IF
               END IF
               
            ELSE
            #201204-00025#1 add -E
            
               #庫存在揀量異動
               IF NOT s_inventory_ins_inap(l_type1,g_site,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm001,
                                         l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,
                                         l_xmdm008,l_xmdm009,l_xmdkdocdt,g_user,g_dept,g_site) THEN
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            END IF #201204-00025#1 add
            #END IF #190718-00056#1 add       #191213-00012#1 mark
            #190417-00053#1---mark---begin---
            #190111-00036#1 add-->s
            #IF NOT s_axmt540_xmdl_xmdm_chk(p_xmdkdocno,1) THEN  #檢查在揀量
            #   LET r_success = FALSE
            #END IF
            #190111-00036#1 add-->e
            #190417-00053#1---mark---end---
            
            #190522-00018#1 add--s
            CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
            IF NOT l_success THEN
               LET r_success = FALSE
            END IF 
            #210127-00024#1 add-S
            IF g_aic_direct THEN
               #僅過帳，未拋轉，不可以把在拣資料刪掉
               IF p_cmd <> 'pos' AND p_cmd <> 'unpos' THEN
                  IF l_para_inap2 <> 'N' THEN
                     #庫存在揀量異動
                     LET l_site_o = g_site       #據點備份
                     IF l_para_inap = 'N' THEN
                        LET g_site = g_aic.icab003  #將據點換成最終站的據點，讓多角正拋能檢查到最終站的庫存數量  
                     END IF
                  END IF
               END IF
            END IF            
            #210127-00024#1 add-E
            CALL cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0070') RETURNING l_para_data1   
#          IF l_para_data1 = 'Y' THEN    #210127-00024#1 mark
            IF l_para_data1 = 'Y' AND p_cmd = 'conf' THEN   #210127-00024#1 add
            #190522-00018#1 add--e   
               #190417-00053#1---add---begin----
               CALL  s_inventory_check_inan_axmt540(g_site,l_xmdm001,l_xmdm002,
                                                 l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,
                                                 l_xmdm008,l_xmdm009,
                                           p_xmdkdocno,l_xmdmseq,0,l_xmdl003,l_xmdl004,'') RETURNING r_success,l_flag 
               IF NOT r_success OR l_flag = 0 THEN   #庫存量不足
                  #210127-00024#1 add-S
                  IF g_aic_direct THEN
                     #僅過帳，未拋轉，不可以把在拣資料刪掉
                     IF p_cmd <> 'pos' AND p_cmd <> 'unpos' THEN
                        IF l_para_inap2 <> 'N' THEN
                           LET g_site = l_site_o
                        END IF
                     END IF
                  END IF
                  #210127-00024#1 add-E
                  LET r_success = FALSE
                 CONTINUE FOREACH
               END IF
               #190417-00053#1--add---end----
            END IF   #190522-00018#1 add  
            IF NOT s_inventory_upd_inan(l_type1,g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,
                                      l_xmdm008,l_xmdm009,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,g_site) THEN
               #210127-00024#1 add-S
               IF g_aic_direct THEN
                  #僅過帳，未拋轉，不可以把在拣資料刪掉
                  IF p_cmd <> 'pos' AND p_cmd <> 'unpos' THEN
                     IF l_para_inap2 <> 'N' THEN
                        LET g_site = l_site_o
                     END IF
                  END IF
               END IF
               #210127-00024#1 add-E
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
            #210127-00024#1 add-S
            IF g_aic_direct THEN
               #僅過帳，未拋轉，不可以把在拣資料刪掉
               IF p_cmd <> 'pos' AND p_cmd <> 'unpos' THEN
                  IF l_para_inap2 <> 'N' THEN
                     LET g_site = l_site_o
                  END IF
               END IF
            END IF
            #210127-00024#1 add-E
            
            #更新出通單在揀量
            IF NOT cl_null(l_xmdl001) AND NOT cl_null(l_xmdl002) AND      
               #(p_cmd = 'con' OR p_cmd = 'uncon' OR p_cmd = 'upd') THEN       #170325-00029#1  mark
               (p_cmd = 'con' OR p_cmd = 'upd') THEN                           #170325-00029#1  add
               
               #統銷統收產生之出貨單不做回寫動作
               IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
                  CONTINUE FOREACH
               END IF
               
               #計算出通單是否有多庫儲批
               LET l_n = 0
               EXECUTE s_axmt540_pre7 USING l_xmdl001,l_xmdl002 INTO l_n,l_xmdgdocdt
               IF l_n = 0 OR cl_null(l_n) THEN
                  CONTINUE FOREACH
               END IF
            
               LET l_sql = "SELECT xmdiseq1,xmdi005,xmdi006,xmdi007,xmdi013",
                           "  FROM xmdi_t ",
                           " WHERE xmdient = '",g_enterprise,"'",
                           "   AND xmdidocno = '",l_xmdl001,"'",
                           "   AND xmdiseq = '",l_xmdl002,"'"
            
               IF l_n > 1 THEN  #有多庫儲批加上多庫儲批的對應(因出通單沒建立多庫儲批可能沒輸入庫儲批)
                  #170603-00039#1-s
#                  LET l_sql = l_sql," AND COALESCE(xmdi005,' ') = COALESCE('",l_xmdm005,"',' ')",
#                                    " AND COALESCE(xmdi006,' ') = COALESCE('",l_xmdm006,"',' ')",
#                                    " AND COALESCE(xmdi007,' ') = COALESCE('",l_xmdm007,"',' ')",
#                                    " AND COALESCE(xmdi013,' ') = COALESCE('",l_xmdm033,"',' ')"
                  IF NOT cl_null(l_xmdm005) THEN
                     LET l_sql = l_sql," AND xmdi005 = '",l_xmdm005,"' "
                  END IF 
                  IF NOT cl_null(l_xmdm006) THEN      
                     LET l_sql = l_sql," AND xmdi006 = '",l_xmdm006,"' "
                  END IF 
                  IF NOT cl_null(l_xmdm007) THEN 
                     LET l_sql = l_sql," AND xmdi007 = '",l_xmdm007,"' "
                  END IF     
                  IF NOT cl_null(l_xmdm033) THEN 
                     LET l_sql = l_sql," AND xmdi013 = '",l_xmdm033,"' "
                  END IF      
                  #170603-00039#1-e
                  
                  #180704-00021#1 add --s
                  IF l_xmdm006 = ' ' THEN      
                     LET l_sql = l_sql," AND xmdi006 = '",l_xmdm006,"' "
                  END IF 
                  
                  IF l_xmdm007 = ' ' THEN 
                     LET l_sql = l_sql," AND xmdi007 = '",l_xmdm007,"' "
                  END IF     
                  
                  IF l_xmdm033 = ' ' THEN 
                     LET l_sql = l_sql," AND xmdi013 = '",l_xmdm033,"' "
                  END IF   
                  #180704-00021#1 add --e            
               END IF
            
               PREPARE s_axmt540_pre12 FROM l_sql
               EXECUTE s_axmt540_pre12 INTO l_xmdiseq1,l_xmdi005,l_xmdi006,l_xmdi007,l_xmdi013
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "EXECUTE:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
            
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            
               #出通單在揀量異動
               IF NOT cl_null(l_xmdi005) THEN
            
                  IF NOT s_inventory_ins_inap(l_type2,g_site,l_xmdl001,l_xmdl002,l_xmdiseq1,l_xmdm001,
                                            l_xmdm002,l_xmdi013,l_xmdi005,l_xmdi006,l_xmdi007,
                                            l_xmdm008,l_xmdm009,l_xmdgdocdt,g_user,g_dept,g_site) THEN
                     LET r_success = FALSE
                     CONTINUE FOREACH
                  END IF
                  
                  IF NOT s_inventory_upd_inan(l_type2,g_site,l_xmdm001,l_xmdm002,l_xmdi013,l_xmdi005,l_xmdi006,l_xmdi007,
                                            l_xmdm008,l_xmdm009,l_xmdl001,l_xmdl002,l_xmdiseq1,g_site) THEN
                     LET r_success = FALSE
                     CONTINUE FOREACH
                  END IF
                  
               END IF
            END IF
         END IF             #200916-00004#1 add
      #END IF   #191213-00012#1 add #201204-00025#1 mark
   END FOREACH
   CLOSE s_axmt540_cs26
   FREE s_axmt540_pre26
   FREE s_axmt540_pre7
   FREE s_axmt540_pre12
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 出貨單過帳還原流程
# Memo...........: 對出貨單據進行庫存過帳還原檢查
# Usage..........: CALL s_axmt540_unpost_upd(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出貨單號
#                :
# Return code....: r_success      處理狀態
#                : 
# Date & Author..: 140326 By earl
# Modify.........: 150630 By Polly (1)出貨單走簽收，出貨確認檢核額度是否超限，到簽收確認後才更新信用餘額檔
#                                  (2)出貨單不走簽收，出貨確認檢核額度是否超限，扣帳確認直接更新信用餘額檔
################################################################################
PUBLIC FUNCTION s_axmt540_unpost_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_pmdsdocno     LIKE pmds_t.pmdsdocno
   DEFINE l_xmdk083       LIKE xmdk_t.xmdk083
   DEFINE l_xmdk000       LIKE xmdk_t.xmdk000      #150630 polly add
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002      #150630 polly add
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_cnt           LIKE type_t.num5         #151228 xianghui add
   #170619-00049#2-s add
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003   
   #170619-00049#2-e add
   #180712-00076#1 Add By 06137  180726(S)
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdcunit      LIKE xmdc_t.xmdcunit
   #180712-00076#1 Add By 06137  180726(E)

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   #150626---earl---add---s
   #多角已拋轉不可直接取消過帳(double chk故不寫在chk段)
   LET l_xmdk000 = ''
   LET l_xmdk002 = ''
   LET l_xmdk044 = ''      #170619-00049#2 add
   LET l_xmdk045 = ''
   LET l_xmdk083 = ''
   SELECT xmdk000,xmdk002,
          xmdk045,xmdk083
         ,xmdk044          #170619-00049#2 add 
     INTO l_xmdk000,l_xmdk002,
          l_xmdk045,l_xmdk083
         ,l_xmdk044        #170619-00049#2 add    
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   IF l_xmdk083 = 'Y' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aic-00181'   #多角流程已拋轉之單據不可取消過帳！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   #150626---earl---add---e
   #170619-00049#2-s add   
   LET l_chk = FALSE
   LET l_xmdadocno = ''
   LET l_icab003_final = ''
   LET g_aic_continue = FALSE
   LET l_xmdl003 = ''
   
   SELECT xmdl003 INTO l_xmdl003
     FROM xmdl_t
    WHERE xmdlent = g_enterprise
      AND xmdldocno = p_xmdkdocno
     # AND xmdlseq = 1   #191227-00008#1 mark
      AND rownum = 1    #191227-00008#1 add

#200916-00013#1-S add
#200916-00013#1-E add 

   IF l_xmdk045 MATCHES '2' THEN
      CALL s_aic_carry_continue_xmda(g_site,l_xmdk044,'1',l_xmdl003) 
          RETURNING l_chk,l_xmdadocno,l_icab003_final
      IF l_chk THEN
         IF NOT cl_null(l_xmdadocno) THEN
            LET g_aic_continue = TRUE
         END IF   
      END IF
   END IF
   #170619-00049#2-e add
   #171218-00024#2-s-add
   LET g_aic_direct = FALSE
   INITIALIZE g_aic.* TO NULL
   #取得是否為多角正拋
   CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.icab003,g_aic.icac007,g_aic.icad004,g_aic.icad005
   #171218-00024#2-e-add

   #151228--xianghui--add--b
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM pjdb_t   
    WHERE pjdbent = g_enterprise
      AND pjdb050 = p_xmdkdocno
   #IF l_cnt > 0  AND g_prog <> 'apjt302' THEN   #170301-00030#1 by 09257 --mark
   IF l_cnt > 0  AND g_prog NOT MATCHES 'apjt302*' THEN   #170301-00030#1 by 09257 --add   
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apj-00122'   #專案進度維護作業產生的出貨單，不可以取消過賬
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success   
   END IF
   #151228--xianghui--add--b
   #170325-00027#1-s-add
   #銷售折扣合約
   #--結算資料皆未產生帳款
   LET l_sql = "SELECT COUNT(xmde001)",
               "  FROM xmde_t",
               " WHERE xmdeent = ",g_enterprise,
               "   AND xmde000 = '3'",
               "   AND xmde003 = '",p_xmdkdocno,"'",
               "   AND xmde025 = '1' " #未產生帳款
   PREPARE s_axmt540_xmde_pre2 FROM l_sql
 
   LET l_cnt = 0
   EXECUTE s_axmt540_xmde_pre2 INTO l_cnt
   IF l_cnt > 0 THEN
      #取消過帳，需刪除存在銷售折扣合約結算檔中的資料，請問是否刪除？
      IF cl_ask_confirm('axm-00816') THEN
        #刪除合約單號，相關的結算資料
        DELETE FROM xmde_t 
         WHERE xmdeent = g_enterprise AND xmdesite = g_site
           AND xmde003 = p_xmdkdocno  AND xmde025 = '1'
        IF SQLCA.sqlcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = "DELETE xmde_t"
           LET g_errparam.popup = TRUE
           CALL cl_err()
           
           LET r_success = FALSE
           RETURN r_success
        END IF
      ELSE
        LET r_success = FALSE
        RETURN r_success
      END IF
   END IF
   #170325-00027#1-e-add   
   #PGS(D)-13130 meno -S mark  
#   UPDATE xmdk_t
#      SET xmdkstus = 'Y',
#          xmdkpstid = NULL,
#          xmdkpstdt = NULL
#    WHERE xmdkent = g_enterprise
#      AND xmdkdocno = p_xmdkdocno
   #PGS(D)-13130 meno -E mark 
   #PGS(D)-13130 meno -S add   
   UPDATE xmdk_t
      SET xmdkstus = 'Y',
          xmdkpstid = NULL,
          xmdkpstdt = null
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   #PGS(D)-13130 meno -E add 
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF      
   #160613-00003#1-mark-(S)
#   LET l_sql = "SELECT DISTINCT pmdsdocno",
#               "  FROM pmds_t",
#               " WHERE pmdsent = '",g_enterprise,"'",
#               "   AND pmds051 = '",p_xmdkdocno,"'",
#               "   AND pmdsstus = 'S'"
#   PREPARE s_axmt540_pre30 FROM l_sql
#   DECLARE s_axmt540_cs30 CURSOR FOR s_axmt540_pre30
#   
#   #收貨入庫單取消過帳取消確認作廢
#   FOREACH s_axmt540_cs30 INTO l_pmdsdocno
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = "FROEACH:"
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF   
#      
#      #收貨入庫單取消過帳取消確認作廢
#      IF NOT s_axmt540_pmdsstus_chang(l_pmdsdocno,'2') THEN
#         LET r_success = FALSE
#         CONTINUE FOREACH
#      END IF
#
#   END FOREACH   
   #160613-00003#1-mark-(E)
   #回寫訂單
   IF NOT s_axmt540_xmdd_upd(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   
   #庫存量更新
   IF NOT s_axmt540_inag_inaj_upd('unpos',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF   
   

   #在揀量更新
   IF NOT s_axmt540_ins_inap(p_xmdkdocno,'1','unpos') THEN
      LET r_success = FALSE
   END IF    
   
   #2015/01/16 by stellar add ----- (S)
   #備置量更新
   IF NOT s_axmt540_upd_inan(p_xmdkdocno,'-1') THEN
      LET r_success = FALSE
   END IF
   #2015/01/16 by stellar add ----- (E)


   #需求等候排隊數量更新
   IF NOT s_axmt540_inas('unpos',p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   
   #160613-00003#1-add-(S)
   #已出貨單，回抓訂單是否為"直送訂單"
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM xmdc_t,xmdl_t
    WHERE xmdcent = xmdlent
      AND xmdcdocno = xmdl003
      AND xmdcseq = xmdl004
      AND xmdldocno = p_xmdkdocno
      AND xmdc032 = '3' #廠商直送
   #若為直送訂單，取消過帳時，需跳出視窗詢問   
   IF l_cnt > 0 THEN
      LET l_cnt = 0 
      #確認是否有收貨入庫單
      SELECT COUNT(*) INTO l_cnt
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmds051 = p_xmdkdocno
         AND pmdsstus = 'S'
      IF l_cnt > 0 THEN
         #是否作廢收貨入庫單？
         IF NOT cl_ask_confirm('axm-00788') THEN 
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
   END IF
   
   LET l_sql = "SELECT DISTINCT pmdsdocno",
               "  FROM pmds_t",
               " WHERE pmdsent = '",g_enterprise,"'",
               "   AND pmds051 = '",p_xmdkdocno,"'",
               "   AND pmdsstus = 'S'"
   PREPARE s_axmt540_pre30 FROM l_sql
   DECLARE s_axmt540_cs30 CURSOR FOR s_axmt540_pre30
   
   #收貨入庫單取消過帳取消確認作廢
   FOREACH s_axmt540_cs30 INTO l_pmdsdocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FROEACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF   
      
      #收貨入庫單取消過帳取消確認作廢
      IF NOT s_axmt540_pmdsstus_chang(l_pmdsdocno,'2') THEN
         LET r_success = FALSE
         CONTINUE FOREACH
      END IF

   END FOREACH   
   #160613-00003#1-add-(E)
   
   #150630--POLLY--ADD--(S)
   #IF l_xmdk000 MATCHES '[12]' AND l_xmdk002 <> '3' THEN   #180712-00076#1 Mark By 06137  180726  
   #180712-00076#1 Add By 06137  180726(S)
   IF l_xmdk045 = '3' THEN  #多角性質為3.統銷統收時
      LET l_xmdl003 = ''
      LET l_xmdl004 = ''
      LET l_xmdcunit = ''
      #取出貨單第一筆明細的訂單單號、項次
      LET l_sql = "SELECT xmdl003,xmdl004 ", 
                  "  FROM xmdl_t ",
                  " WHERE xmdlent = ", g_enterprise ,
                  "   AND xmdldocno = '", p_xmdkdocno ,"' "
      PREPARE s_axmt540_xmdl_pre2 FROM l_sql
      DECLARE s_axmt540_xmdl_cur2 SCROLL CURSOR FOR s_axmt540_xmdl_pre2
      OPEN s_axmt540_xmdl_cur2
      FETCH FIRST s_axmt540_xmdl_cur2 INTO l_xmdl003,l_xmdl004
      FREE s_axmt540_xmdl_pre2
      CLOSE s_axmt540_xmdl_cur2    
      #取得統銷統收的訂單出貨據點
      SELECT xmdcunit INTO l_xmdcunit 
        FROM xmdc_t
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = l_xmdl003
         AND xmdcseq = l_xmdl004
   END IF  
   
  #IF (l_xmdk000 MATCHES '[12]' AND l_xmdk002 <> '3' AND l_xmdk045 !='3')               #190521-00023#2 mark
   IF (l_xmdk000 MATCHES '[12]' AND (NOT l_xmdk002 MATCHES '[38]') AND l_xmdk045 !='3') #190521-00023#2 add 8.借貨訂單
   OR (l_xmdk000 MATCHES '[12]' AND l_xmdk045 ='3' AND g_site!=l_xmdcunit ) THEN   
   #180712-00076#1 Add By 06137  180726(E)    
      #更新信用餘額檔(反向)
      IF NOT s_axmt540_credit('3',p_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF
   #150630--POLLY--ADD--(E)
   
   #150917-00001#3  2016/01/21  By earl add s
   #其他欄位回寫
   IF NOT s_axmt540_other_upd(p_xmdkdocno,'unpos') THEN
      LET r_success = FALSE
   END IF
   #150917-00001#3  2016/01/21  By earl add e
   
   #判斷多角性質(xmdk045)=3.統銷統收，則刪除過帳系統自動產生的出貨單，用出貨單號=多角序號去找
   IF l_xmdk045 = '3' THEN
      IF NOT s_axmt540_delete(p_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF

   #160125-00025#2  2016/02/15  By earl mod s
   IF r_success THEN
      IF NOT s_barcode_01_upd('2',g_prog,g_site,p_xmdkdocno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   #160125-00025#2  2016/02/15  By earl mod e

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 出貨單作廢流程
# Memo...........: 對出貨單據進行單據作廢
# Usage..........: CALL s_axmt540_invalid_upd(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno 出貨單號
#                : 
# Return code....: r_success   處理狀態
#                : 
# Date & Author..: 140320 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_invalid_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   UPDATE xmdk_t
      SET xmdkstus = 'X'
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF      
   #170718-00022#1-s
   IF NOT s_inventory_del_inao(p_xmdkdocno) THEN
      LET r_success = FALSE
   END IF
   #170718-00022#1-e      
   RETURN r_success   
   
#   待應用元件
#   2.更新單據狀態碼
#  (2).新增一筆資料修改歷程到log檔
END FUNCTION

################################################################################
# Descriptions...: 多庫儲批數量檢查
# Memo...........:
# Usage..........: CALL s_axmt540_xmdl_xmdm_chk(p_xmdkdocno,p_type)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   #單據單號
#                : p_type        #1.檢查/2.不檢查 在揀量
# Return code....: r_success     #執行狀態
#                : 
# Date & Author..: 140328 By earl
# Modify.........: #181127-00047#1 增加一個參數
################################################################################
PUBLIC FUNCTION s_axmt540_xmdl_xmdm_chk(p_xmdkdocno,p_type)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_type          LIKE type_t.num5  #181127-00047#1 add
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   DEFINE l_xmdlseq       LIKE xmdl_t.xmdlseq
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdl008       LIKE xmdl_t.xmdl008
   DEFINE l_xmdl009       LIKE xmdl_t.xmdl009
   DEFINE l_xmdl013       LIKE xmdl_t.xmdl013
   DEFINE l_xmdl014       LIKE xmdl_t.xmdl014
   DEFINE l_xmdl015       LIKE xmdl_t.xmdl015
   DEFINE l_xmdl016       LIKE xmdl_t.xmdl016
   DEFINE l_xmdl052       LIKE xmdl_t.xmdl052
   DEFINE l_xmdl017       LIKE xmdl_t.xmdl017
   DEFINE l_xmdl018       LIKE xmdl_t.xmdl018
   DEFINE l_xmdl020       LIKE xmdl_t.xmdl020
  #DEFINE l_xmdm009       LIKE xmdl_t.xmdl009 #181005-00009#5-mark
   DEFINE l_xmdm009       LIKE xmdm_t.xmdm009 #181005-00009#5-add 修正LIKE錯型態
   DEFINE l_xmdm011       LIKE xmdm_t.xmdm011
   DEFINE l_sql           STRING
   DEFINE l_xmdh011       LIKE xmdh_t.xmdh011
   DEFINE l_xmdh012       LIKE xmdh_t.xmdh012
   DEFINE l_xmdh013       LIKE xmdh_t.xmdh013
   DEFINE l_xmdh014       LIKE xmdh_t.xmdh014
   DEFINE l_xmdh029       LIKE xmdh_t.xmdh029
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_gzze003       LIKE gzze_t.gzze003
   DEFINE l_xmdastus      LIKE xmda_t.xmdastus  #160419-00029#1
   DEFINE l_imaf055       LIKE imaf_t.imaf055   #160519-00008#8
   DEFINE l_imaf061       LIKE imaf_t.imaf061   #160519-00008#8  
   DEFINE l_imaa004       LIKE imaa_t.imaa004   #170116-00044#2-add
   DEFINE l_xmdkstus      LIKE xmdk_t.xmdkstus  #171205-00037#1 add
   DEFINE l_para_data     LIKE type_t.chr80     #171205-00037#1 add
   DEFINE l_success       LIKE type_t.num5      #171205-00037#1 add
   DEFINE l_slip          LIKE ooba_t.ooba001   #171205-00037#1 add
   DEFINE l_xmdlseq_o     LIKE xmdl_t.xmdlseq   #181005-00009#5-add #紀錄當前的項次
   DEFINE l_xmdl018_1     LIKE xmdl_t.xmdl009   #181005-00009#5-add 紀錄項次的出貨數量
   DEFINE l_xmdc032       LIKE xmdc_t.xmdc032   #190719-00024#1---add
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #181005-00009#5-s-add
   #取得項次的出貨數量
   LET l_sql = " SELECT xmdl018 ",
               "   FROM xmdl_t ",
               "  WHERE xmdlent = ",g_enterprise,
               "    AND xmdldocno = ? AND xmdlseq = ? "
   PREPARE s_axmt540_xmdl_num_pre FROM l_sql
   #181005-00009#5-e-add
   
   #180921-00031#1 add --s
   #多庫儲批="Y"→抓xmdm_t；多庫儲批="N"→抓xmdl_t
   #181031-00015#1 mark --s
   #LET l_xmdl013 = "N"
   #SELECT xmdl013 INTO l_xmdl013
   #  FROM xmdl_t
   # WHERE xmdlent = g_enterprise
   #   AND xmdldocno = p_xmdkdocno
   #181031-00015#1 mark --e
   #181031-00015#1 add --s
   #多庫儲批="Y"→抓xmdm_t；多庫儲批="N"→抓xmdl_t，每個項次是否為多庫儲批都要各別判斷
   LET l_sql = "SELECT xmdlseq,xmdl013 FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise," AND xmdldocno = '",p_xmdkdocno,"'",
               " ORDER BY xmdlseq"
   PREPARE s_axmt540_pre32 FROM l_sql
   DECLARE s_axmt540_cs32 CURSOR FOR s_axmt540_pre32
   FOREACH s_axmt540_cs32 INTO l_xmdlseq,l_xmdl013
   #181031-00015#1 add --e
      IF l_xmdl013 = "Y" THEN
         LET l_sql = "SELECT xmdk002,",
                     "       xmdmseq,xmdl001,xmdl002,xmdl003,xmdl004,",
                     "       xmdl008,xmdl009,",
                     "       (SELECT imaa004 FROM imaa_t WHERE imaaent = xmdlent AND imaa001 = xmdl008), ", #170116-00044#2-add
                     "       xmdl013,xmdm005,xmdm006,xmdm007,xmdm033,",
                     "       xmdm008,xmdm009,xmdm011",
                     "  FROM xmdk_t,xmdl_t,xmdm_t",
                     " WHERE xmdkent = xmdlent AND xmdlent = '",g_enterprise,"'",
                     "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'",
                    #"   AND xmdlent = xmdment AND xmdldocno = xmdmdocno AND xmdlseq = xmdmseq"                            #181031-00015#1 mark
                     "   AND xmdlent = xmdment AND xmdldocno = xmdmdocno AND xmdlseq = xmdmseq AND xmdlseq = ",l_xmdlseq   #181031-00015#1 add
                    ," ORDER BY xmdmseq " #181005-00009#5-add 
      ELSE
      #180921-00031#1 add --e
         LET l_sql = "SELECT xmdk002,",
                     "       xmdlseq,xmdl001,xmdl002,xmdl003,xmdl004,",
                     "       xmdl008,xmdl009,",
                     "       (SELECT imaa004 FROM imaa_t WHERE imaaent = xmdlent AND imaa001 = xmdl008), ", #170116-00044#2-add
                     "       xmdl013,xmdl014,xmdl015,xmdl016,xmdl052,",
                     "       xmdl017,xmdl018,xmdl020",
                     "  FROM xmdk_t,xmdl_t",
                     " WHERE xmdkent = xmdlent AND xmdlent = '",g_enterprise,"'",
                    #"   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'"                            #181031-00015#1 mark
                     "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"' AND xmdlseq = ",l_xmdlseq   #181031-00015#1 add
                    ," ORDER BY xmdlseq " #181005-00009#5-add
      END IF   #180921-00031#1 add
      PREPARE s_axmt540_pre28 FROM l_sql
      DECLARE s_axmt540_cs28 CURSOR FOR s_axmt540_pre28
      
      LET l_sql = "SELECT SUM(xmdm009),SUM(xmdm011)",
                  "  FROM xmdm_t",
                  " WHERE xmdment = '",g_enterprise,"'",
                  "   AND xmdmdocno = '",p_xmdkdocno,"'",
                  "   AND xmdmseq = ? "
      PREPARE s_axmt540_pre29 FROM l_sql 
      #171205-00037#1---add----str---
      LET l_xmdkstus = ''
      SELECT xmdkstus INTO l_xmdkstus
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno
      
      CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
      IF NOT l_success THEN
         LET r_success = FALSE
      END IF
      CALL cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0070') RETURNING l_para_data  #出庫單據考慮在揀量
      #171205-00037#1---add----end---
      LET l_xmdlseq_o = '' #181005-00009#5-add
      FOREACH s_axmt540_cs28 INTO l_xmdk002,
                                  l_xmdlseq,l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,
                                  l_xmdl008,l_xmdl009,l_imaa004,  #170116-00044#2-add-l_imaa004
                                  l_xmdl013,l_xmdl014,l_xmdl015,l_xmdl016,l_xmdl052,
                                  l_xmdl017,l_xmdl018,l_xmdl020                
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #160419-00029#1-s
         IF cl_null(l_xmdl001) AND NOT cl_null(l_xmdl003) THEN
            LET l_xmdastus = ''
            SELECT xmdastus INTO l_xmdastus
              FROM xmda_t
             WHERE xmdaent = g_enterprise
               AND xmdadocno = l_xmdl003
           #IF l_xmdastus <> 'Y' THEN                #181102-00040#1 mark
            IF NOT l_xmdastus  MATCHES '[YC]' THEN   #181102-00040#1 add   #訂單結案時仍可過帳
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code   = 'axm-00305'
               LET g_errparam.extend = l_xmdl003
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
         #160419-00029#1-e
         #190719-00024#1---add--s
         SELECT xmdc032 INTO l_xmdc032 FROM xmdc_t
         WHERE xmdcent = g_enterprise 
         AND xmdcdocno = l_xmdl003
         AND xmdcseq = l_xmdl004         
         IF p_type = 1 AND l_xmdc032 <> '3' THEN #181127-00047#1 add #要檢查在揀量
         #190719-00024#1---add--e
#         IF p_type = 1 THEN  #181127-00047#1 add  #要檢查在揀量    #190719-00024#1---mark
            #在揀量check(已排除出通單)
            IF NOT s_axmt540_xmdl014_xmdl015_xmdl016_xmdk052_chk(l_xmdl001,l_xmdl002,l_xmdl008,l_xmdl009,
                                                                 l_xmdl014,l_xmdl015,l_xmdl016,l_xmdl052,
                                                                 l_xmdl017,l_xmdl018,
                                                                 p_xmdkdocno,l_xmdlseq) THEN
               LET r_success = FALSE
            END IF
         END IF              #181127-00047#1 add
         IF l_xmdl013 = 'N' THEN #非多庫儲批出貨
            #費用資料(來源有訂單單號但無訂單項次)
            #170116-00044#2-s-add
#            IF (NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004)) OR l_imaa004 = 'E' THEN #180918-00016#1 mark
            IF (NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004)) OR (l_imaa004 = 'E' AND cl_null(l_xmdl014)) THEN #180918-00016#1 mod 如果是费用料号且库位为空，才跳过检核
               CONTINUE FOREACH
            END IF
            #非多庫儲批出貨，且非為費用資料，需輸入庫位
            #170116-00044#2-e-add
            #171205-00037#1---add----str---
            #過帳(確認時不檢查)或出庫單據考慮在揀量時,庫位才不可為空
            IF l_xmdkstus = 'Y' #過帳時才檢查(因為確認和過帳都會CALL此FUNCTION)
               OR l_para_data = 'Y' THEN #出庫單據考慮在揀量
            #171205-00037#1---add----end---
               IF cl_null(l_xmdl014) AND (cl_null(l_xmdl003) OR NOT cl_null(l_xmdl004)) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00256'   #項次%1非多庫儲批之單身的庫位編號不可為空！
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  LET g_errparam.replace[1] = l_xmdlseq
                  CALL cl_err()
               
                  LET r_success = FALSE
               END IF
            END IF #171205-00037#1 add
            #檢查是否存在來源出通單
            LET l_xmdh011 = 'N'  #多庫儲批
            LET l_xmdh012 = ''  #庫位
            LET l_xmdh013 = ''  #儲位
            LET l_xmdh014 = ''  #批號
            LET l_xmdh029 = ''  #庫存管理特徵
            CALL s_axmt540_source_define(l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004)
             RETURNING l_xmdh011,l_xmdh012,l_xmdh013,l_xmdh014,l_xmdh029
      
            #出通單若有做多庫儲批，輸入儲位必須存在
            IF l_xmdh011 = 'Y' THEN
               LET l_n = 0
               SELECT COUNT(xmdiseq1) INTO l_n
                 FROM xmdi_t
                WHERE xmdient = g_enterprise
                  AND xmdidocno = l_xmdl001
                  AND xmdiseq = l_xmdl002
                  AND COALESCE(xmdi005,' ') = COALESCE(l_xmdl014,' ')
                  AND COALESCE(xmdi006,' ') = COALESCE(l_xmdl015,' ')
                  AND COALESCE(xmdi007,' ') = COALESCE(l_xmdl016,' ')
                  AND COALESCE(xmdi013,' ') = COALESCE(l_xmdl052,' ')
      
               IF l_n = 0 THEN
               
                  CASE l_xmdk002
                     WHEN '8'  #借貨出貨單
                        CALL cl_getmsg('axm-00584',g_dlang) RETURNING l_gzze003   #借貨出貨通知單維護作業axmt521
                     OTHERWISE
                        CALL cl_getmsg('axm-00583',g_dlang) RETURNING l_gzze003   #出貨通知單維護作業axmt520
                  END CASE            
               
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00463'    #項次%1之庫位、儲位、批號、庫存管理特徵不存在出通單號%1項次%2，請重新輸入！
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  LET g_errparam.replace[1] = l_xmdlseq
                  LET g_errparam.replace[2] = l_xmdl001
                  LET g_errparam.replace[3] = l_xmdl002               
                  LET g_errparam.replace[4] = l_gzze003
                  
                  CALL cl_err()
            
                  LET r_success = FALSE
               END IF
            END IF
            
         END IF
         
         EXECUTE s_axmt540_pre29 USING l_xmdlseq INTO l_xmdm009,l_xmdm011
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "EXECUTE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      
         IF cl_null(l_xmdm009) THEN LET l_xmdm009 = 0 END IF
         IF cl_null(l_xmdm011) THEN LET l_xmdm011 = 0 END IF
         IF cl_null(l_xmdl018) THEN LET l_xmdl018 = 0 END IF
         IF cl_null(l_xmdl020) THEN LET l_xmdl020 = 0 END IF
            
         #數量
        #IF l_xmdm009 <> l_xmdl018 THEN                       #180921-00031#1 mark
        #IF l_xmdm009 <> l_xmdl018 AND l_xmdh011 = "N" THEN   #180921-00031#1 add #多庫儲批="N"時，才需比對xmdl_t及xmdl_m的數量   #181031-00015#1 mark
         IF l_xmdm009 <> l_xmdl018 AND l_xmdl013 = "N" THEN   #多庫儲批="N"時，才需比對xmdl_t及xmdm_t的數量                       #181031-00015#1 add
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00196'  #多庫儲批總"出貨數量%1"不可與項次%2"出貨數量%3"不相等！
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_xmdm009 
            LET g_errparam.replace[2] = l_xmdlseq 
            LET g_errparam.replace[3] = l_xmdl018
            CALL cl_err()
      
            LET r_success = FALSE
         END IF
         #181005-00009#5-s-add
         #單號180921-00031#1，少考慮多庫儲的檢查，此段是補多庫儲的數量檢查
         #l_xmdlseq_o的判斷，是為了避免多庫儲，同項次的錯誤顯示多次
         IF l_xmdl013 = 'Y' AND (l_xmdlseq <> l_xmdlseq_o OR cl_null(l_xmdlseq_o)) THEN
            LET l_xmdl018_1 = 0
            EXECUTE s_axmt540_xmdl_num_pre USING p_xmdkdocno,l_xmdlseq INTO l_xmdl018_1
            IF l_xmdm009 <> l_xmdl018_1 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00196'  #多庫儲批總"出貨數量%1"不可與項次%2"出貨數量%3"不相等！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_xmdm009 
               LET g_errparam.replace[2] = l_xmdlseq 
               LET g_errparam.replace[3] = l_xmdl018_1
               CALL cl_err()
            
               LET r_success = FALSE
            END IF
         END IF
         #項次舊值更換
         IF cl_null(l_xmdlseq_o) OR l_xmdlseq_o <> l_xmdlseq THEN
            LET l_xmdlseq_o = l_xmdlseq
         END IF 
         #181005-00009#5-e-add
         #160519-00008#8
         CALL s_axmt540_get_imaf(l_xmdl008) RETURNING l_imaf055,l_imaf061    #160519-00008#8  
         IF l_xmdl013 = 'N' THEN
            IF l_imaf055 = '1' AND cl_null(l_xmdl052) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_xmdl008
               LET g_errparam.code   = 'sub-00125'         #庫存管理特徵不可為空！  
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
         #160519-00008#8
#         #141105取消參考數量需相等的控卡
#         #參考數量
#         IF l_xmdm011 <> l_xmdl020 THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'axm-00232'  #多庫儲批總"參考數量%1"不可與項次%2"參考數量%3"不相等！
#            LET g_errparam.extend = ''
#            LET g_errparam.popup = TRUE
#            LET g_errparam.replace[1] = l_xmdm011 
#            LET g_errparam.replace[2] = l_xmdlseq 
#            LET g_errparam.replace[3] = l_xmdl020
#            CALL cl_err()
#     
#            LET r_success = FALSE
#            EXIT FOREACH
#         END IF
      
      END FOREACH      
      CLOSE s_axmt540_cs28
      FREE s_axmt540_pre28 
      FREE s_axmt540_pre29
   #181031-00015#1 add --s
   END FOREACH
   FREE s_axmt540_cs32
   #181031-00015#1 add --e      
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 出貨量回寫出通單更新
# Memo...........:
# Usage..........: CALL s_axmt540_xmdh_upd(p_xmdkdocno,p_xmdlseq,p_cmd)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno  單據單號
#                : p_xmdlseq    單據項次
#                : p_cmd        流程：con確認,uncon取消確認,upd修改
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 140417 By earl
# Modify.........: 180702-00019#1 18/05/28 By 02111 增加單據項次。
################################################################################
PUBLIC FUNCTION s_axmt540_xmdh_upd(p_xmdkdocno,p_xmdlseq,p_cmd)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_cmd           LIKE type_t.chr5
   DEFINE p_xmdlseq       LIKE xmdl_t.xmdlseq  #180702-00019#1 add   
   DEFINE r_success       LIKE type_t.num5   
   DEFINE l_sql           STRING
   DEFINE l_xmdl001       LIKE xmdl_t.xmdl001  #出通單號
   DEFINE l_xmdl002       LIKE xmdl_t.xmdl002  #出通單項次
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003  #訂單單號
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004  #訂單項次
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005  #訂單項序
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006  #訂單分批序
   DEFINE l_xmdl018       LIKE xmdl_t.xmdl018  #出貨數量
   DEFINE l_xmdh016       LIKE xmdh_t.xmdh016  #申請出通數量
   DEFINE l_xmdh017       LIKE xmdh_t.xmdh017  #實際出通數量
   DEFINE l_xmdm009       LIKE xmdm_t.xmdm009  #出貨數量
   DEFINE l_slip          LIKE ooba_t.ooba001  #單別
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_xmdm005       LIKE xmdm_t.xmdm005
   DEFINE l_xmdm006       LIKE xmdm_t.xmdm006
   DEFINE l_xmdm007       LIKE xmdm_t.xmdm007
   DEFINE l_xmdm033       LIKE xmdm_t.xmdm033
   DEFINE l_xmdh017_1     LIKE xmdh_t.xmdh017  #170608-00043#1 add
   #170726-00040#1-s add
   DEFINE l_xmdhseq       LIKE xmdh_t.xmdhseq
   DEFINE l_xmdh002       LIKE xmdh_t.xmdh002
   DEFINE l_xmdh003       LIKE xmdh_t.xmdh003
   DEFINE l_xmdh004       LIKE xmdh_t.xmdh004
   DEFINE l_xmdh017_2     LIKE xmdh_t.xmdh017
   DEFINE l_xmdh016_2     LIKE xmdh_t.xmdh016
   DEFINE l_cnt           LIKE type_t.num5     
   DEFINE l_qty           LIKE xmdc_t.xmdc007
   DEFINE l_qty1          LIKE xmdc_t.xmdc007
   #170726-00040#1-e add 
   DEFINE l_xmdh001       LIKE xmdh_t.xmdh001  #181219-00057#1 Add By 06137 
   DEFINE l_qty2          LIKE xmdc_t.xmdc007  #180428-00009#1
   #190312-00016#1-s-add
   DEFINE l_xmdl008       LIKE xmdl_t.xmdl008  #料件編號
   DEFINE l_xmdl017       LIKE xmdl_t.xmdl017  #出貨單位
   DEFINE l_xmdl021       LIKE xmdl_t.xmdl021  #計價單位
   DEFINE l_xmdh021       LIKE xmdh_t.xmdh021  #計價數量
   DEFINE l_success       LIKE type_t.num5
   #190312-00016#1-e-add
   #190831-00003#1 add(s)
   DEFINE l_xmdh006       LIKE xmdh_t.xmdh006
   DEFINE l_xmdh021_2     LIKE xmdh_t.xmdh021
   DEFINE l_xmdh021_3     LIKE xmdh_t.xmdh021
   DEFINE l_xmdh020       LIKE xmdh_t.xmdh020
   DEFINE l_xmdh015       LIKE xmdh_t.xmdh015
   DEFINE l_xmdh016_3     LIKE xmdh_t.xmdh016
   #190831-00003#1 add(e)
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   IF cl_null(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   #統銷統收產生之出貨單不做回寫動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
  #LET l_sql = "SELECT DISTINCT xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,xmdl006 FROM xmdl_t", #190312-00016#1-mark
   #190312-00016#1-s-add
   LET l_sql = "SELECT DISTINCT xmdl001,xmdl002,xmdl003,xmdl004,xmdl005, ",
               "                xmdl006,xmdl008,xmdl017,xmdl021 ",
               "  FROM xmdl_t",
   #190312-00016#1-e-add   
                " WHERE xmdlent = '",g_enterprise,"'",
                "   AND xmdldocno = '",p_xmdkdocno,"'"
   #180702-00019#1 add start -----                
   IF NOT cl_null(p_xmdlseq) THEN
      LET l_sql = l_sql ," AND xmdlseq = ",p_xmdlseq   
   END IF
   #180702-00019#1 add end   -----                
   PREPARE s_axmt540_pre8 FROM l_sql
   DECLARE s_axmt540_cs8 CURSOR FOR s_axmt540_pre8

   #161205-00025#10 161221 by lori mod---(S)
   #LET l_sql = "SELECT SUM(xmdl018)",
   #            "  FROM xmdk_t a,xmdl_t",
   #            " WHERE a.xmdkent = xmdlent AND xmdlent = '",g_enterprise,"'",
   #            "   AND a.xmdkdocno = xmdldocno",
   #            "   AND xmdl001 = ?",
   #            "   AND xmdl002 = ?",
   #            "   AND a.xmdkstus IN ('H','Y','S')",
   #            "   AND a.xmdk000 = '1'",     #出貨單
   #            "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
   #            "                                          FROM xmdk_t b",
   #            "                                         WHERE b.xmdkent = a.xmdkent",
   #            "                                           AND b.xmdkdocno = a.xmdk035",
   #            "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
    LET l_sql = "SELECT SUM(xmdl018)",
                "  FROM xmdl_t ",
                " WHERE xmdlent = ",g_enterprise,
                "   AND xmdl001 = ?",
                "   AND xmdl002 = ?",
                "   AND EXISTS(SELECT 1 FROM xmdk_t t1 WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno ",
                "                                        AND xmdkstus IN ('H','Y','S') ",
                "                                        AND xmdk000 = '1' ",  #出貨單
                "                                        AND NOT (xmdk045 = '3' ",
                "                                              AND EXISTS(SELECT 1 FROM xmdk_t t2 ",     
                "                                                          WHERE t2.xmdkent = t1.xmdkent ",
                "                                                            AND t2.xmdkdocno = t1.xmdk035 ",
                "                                                            AND t2.xmdkstus <> 'X')))"   #排除統銷統收之初始站出貨單
   #161205-00025#10 161221 by lori mod---(E)
   PREPARE s_axmt540_pre9 FROM l_sql
 
   LET l_sql = "SELECT xmdh016,xmdh017",  #申請出通數量，實際出通數量
               "  FROM xmdh_t",
               " WHERE xmdhent = '",g_enterprise,"'",
               "   AND xmdhdocno = ?",
               "   AND xmdhseq = ?"
   PREPARE s_axmt540_pre10 FROM l_sql
   #170726-00040#1-s add   
   #LET l_sql = " SELECT xmdhseq,xmdh002,xmdh003,xmdh004,xmdh017 ",           #181219-00057#1 Mark By 06137 181222
   LET l_sql = " SELECT xmdhseq,xmdh001,xmdh002,xmdh003,xmdh004,xmdh017 ",    #181219-00057#1 Add By 06137 181222
               "    FROM xmdh_t ", 
               " WHERE xmdhdocno = ? AND xmdhent = ",g_enterprise,"  ", 
               " AND xmdhseq NOT IN (SELECT b.xmdhseq FROM xmdh_t b ",
               #" LEFT JOIN xmdl_t ON xmdlent = b.xmdhent AND xmdl001 = b.xmdhdocno AND xmdlseq = b.xmdhseq ",    #190125-00036#1 mark
               " LEFT JOIN xmdl_t ON xmdlent = b.xmdhent AND xmdl001 = b.xmdhdocno AND xmdl002 = b.xmdhseq ",     #190125-00036#1 mod
               #" WHERE b.xmdhent = xmdh_t.xmdhent AND xmdl001 = xmdh_t.xmdhdocno  ) "  #190125-00005#1 mark
               #190125-00005#1 -S add
               #要加上排除作廢資料
               " LEFT JOIN xmdk_t ON xmdkent = xmdlent AND xmdkdocno = xmdldocno",
               " WHERE b.xmdhent = xmdh_t.xmdhent AND xmdl001 = xmdh_t.xmdhdocno AND xmdkstus <> 'X')"
               #190125-00005#1 -E add
   PREPARE s_axmt540_xmdh_p FROM l_sql
   DECLARE s_axmt540_xmdh1 CURSOR FOR s_axmt540_xmdh_p
   #170726-00040#1-e add
   #更新出通單單身
  FOREACH s_axmt540_cs8 INTO l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
                            ,l_xmdl008,l_xmdl017,l_xmdl021 #190312-00016#1-add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl001) OR cl_null(l_xmdl002) THEN
         CONTINUE FOREACH
      END IF

      EXECUTE s_axmt540_pre10 USING l_xmdl001,l_xmdl002 INTO l_xmdh016,l_xmdh017
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF cl_null(l_xmdh016) THEN
         LET l_xmdh016 = 0
      END IF
      
      IF cl_null(l_xmdh017) THEN
         LET l_xmdh017 = 0
      END IF

      #依據出貨明細xmdl018資料更新對應的出通明細資料xmdh030(sum已確認的出貨單)
      EXECUTE s_axmt540_pre9 USING l_xmdl001,l_xmdl002 INTO l_xmdl018
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
       
      IF cl_null(l_xmdl018) THEN
         LET l_xmdl018 = 0
      END IF

      # 若來源出通單的單別參數"出通轉出貨單控管"是設置'3:一對一(差異部分另起出通單)'時，
      # 需比對出貨單上的出貨數量是否與出通單上的申請出通量有差異，若有差異需回去更新出通單上的實際出貨量
      # 依據出貨明細的xmdl018更新回對應出通單上的xmdh017欄位
      CALL s_aooi200_get_slip(l_xmdl001) RETURNING r_success,l_slip
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0060') = '3' THEN               
         IF p_cmd = 'uncon' THEN
            #170726-00040#1-s add
            LET l_cnt = 0
            #180428-00009#1---mod---s
            #SELECT COUNT(1) INTO l_cnt
            #  FROM xmdk_t
            # WHERE xmdkent = g_enterprise
            #   AND xmdk006 = l_xmdl003
            #   AND xmdkstus <> 'X'
            SELECT COUNT(1) INTO l_cnt
              FROM xmdg_t
             WHERE xmdgent = g_enterprise
               AND xmdg004 = l_xmdl003
               AND xmdgstus <> 'X'               
            #180428-00009#1---mod---e   
            IF l_cnt = 1 THEN   
            #170726-00040#1-e add
               LET l_xmdh017 = l_xmdh016   #"實際出通數量"回歸原"申請出通數量"
               #170726-00040#1-s add
               #FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2            #181219-00057#1 Mark By 06137 181222
               FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh001,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2   #181219-00057#1 Add By 06137  181222
                  LET l_xmdh016_2 = 0
                  SELECT xmdh016
                        ,xmdh006,xmdh020,xmdh015        #190831-00003#1 add                              
                    INTO l_xmdh016_2
                        ,l_xmdh006,l_xmdh020,l_xmdh015  #190831-00003#1 add
                    FROM xmdh_t
                   WHERE xmdhent = g_enterprise
                     AND xmdhdocno = l_xmdl001
                     AND xmdhseq = l_xmdhseq
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004     
                  #190831-00003#1 add(s)
                  #出通單計價數量轉換
                  CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdh016_2)
                        RETURNING l_success,l_xmdh021_2 
                  #190831-00003#1 add(e)
                  UPDATE xmdh_t SET xmdh017 = l_xmdh016_2,
                                    xmdh021 = l_xmdh021_2  #190831-00003#1 add
                   WHERE xmdhent = g_enterprise
                     AND xmdhdocno = l_xmdl001
                     AND xmdhseq = l_xmdhseq
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004               
                  UPDATE xmdd_t
                     SET xmdd031 = l_xmdh016_2
                   WHERE xmddent = g_enterprise
                     #AND xmdddocno = l_xmdl003  #181219-00057#1 Mark By 06137 181222
                     AND xmdddocno = l_xmdh001   #181219-00057#1 Add By 06137  181222
                     AND xmddseq = l_xmdh002
                     AND xmddseq1 = l_xmdh003
                     AND xmddseq2 = l_xmdh004               
               END FOREACH    
               #170726-00040#1-e add               
            #170726-00040#1-s add   
            ELSE #表示有超過一張以上的出通單存在,那就要用剩餘的數量回寫出通單的實際出通量           
               LET l_qty = 0
               #將訂單分批數量(xmdd006) 扣掉 訂單對應的其他出貨單(非本次取消的出貨單)的出貨數量加總
               #180428-00009#1---mod---s
               #SELECT NVL(xmdd006,0) - (SELECT NVL(SUM(xmdl018),0)
               #                           FROM xmdl_t
               #                          WHERE xmdlent = g_enterprise
               #                            AND xmdl003 = l_xmdl003
               #                            AND xmdl004 = l_xmdl004
               #                            AND xmdl005 = l_xmdl005
               #                            AND xmdl006 = l_xmdl006
               #                            AND xmdldocno <> p_xmdkdocno)                             
               SELECT NVL(xmdd006,0) - (SELECT NVL(SUM(xmdh017),0)
                                          FROM xmdh_t
                                         WHERE xmdhent = g_enterprise
                                           AND xmdh001 = l_xmdl003
                                           AND xmdh002 = l_xmdl004
                                           AND xmdh003 = l_xmdl005
                                           AND xmdh004 = l_xmdl006
                                           AND xmdhdocno <> l_xmdl001)                                           
               #180428-00009#1---mod---e                             
                 INTO l_qty
                 FROM xmdd_t
                WHERE xmddent  = g_enterprise
                  AND xmdddocno= l_xmdl003
                  AND xmddseq  = l_xmdl004
                  AND xmddseq1 = l_xmdl005
                  AND xmddseq2 = l_xmdl006  
               IF l_qty > 0 THEN
                  LET l_xmdh017 = l_qty
               END IF 
               #180428-00009#1---add---s
               IF l_xmdh016 < l_qty THEN
                  LET l_xmdh017 = l_xmdh016
               END IF
               #180428-00009#1---add---e
               #取消確認時也要對對應的出通單沒有進來出貨單的項次做回寫
               #FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2            #181219-00057#1 Mark By 06137 181222
               FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh001,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2   #181219-00057#1 Add By 06137  181222
                  LET l_qty1 = 0
                  SELECT NVL(SUM(xmdh017),0) INTO l_qty1
                    FROM xmdh_t
                   WHERE xmdhent = g_enterprise
                     AND xmdh001 = l_xmdl003
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004                     
                     AND xmdhdocno <> l_xmdl001
                     
                  #180428-00009#1---add---s
                  SELECT NVL(xmdd006,0)                            
                    INTO l_qty2
                    FROM xmdd_t
                   WHERE xmddent = g_enterprise
                     AND xmdddocno = l_xmdl003
                     AND xmddseq = l_xmdh002
                     AND xmddseq1 = l_xmdh003
                     AND xmddseq2 = l_xmdh004                 
                  #180428-00009#1---add---e
                  
                  #190831-00003#1 add(s)
                  #抓取料号,计价单位,出货单位,申请出通数量,用于更新计价数量
                  LET l_xmdh016_3 = 0
                  SELECT xmdh006,xmdh020,xmdh015,xmdh016                      
                    INTO l_xmdh006,l_xmdh020,l_xmdh015,l_xmdh016_3
                    FROM xmdh_t
                   WHERE xmdhent = g_enterprise
                     AND xmdhdocno = l_xmdl001
                     AND xmdhseq = l_xmdhseq
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004
                    
                  #出通單計價數量轉換
                  CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdh016_3)
                        RETURNING l_success,l_xmdh021_2 
                  LET l_xmdh021_3 = l_qty2-l_qty1 
                  CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdh021_3)
                        RETURNING l_success,l_xmdh021_3
                  #190831-00003#1 add(e) 
                  
                  UPDATE xmdh_t
                     #SET xmdh017 = xmdh016 - l_qty1   #180428-00009#1 mark
                     SET xmdh017 = xmdh016,             #180428-00009#1  add 
                         xmdh021 =  l_xmdh021_2   #190831-00003#1 add
                   WHERE xmdhent = g_enterprise
                     AND xmdhdocno = l_xmdl001
                     AND xmdhseq = l_xmdhseq
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004
                     AND xmdh016 <= l_qty2-l_qty1  #180428-00009#1 add
                  
                  #180428-00009#1---add---s 
                  UPDATE xmdh_t
                     SET xmdh017 = l_qty2-l_qty1,
                         xmdh021 = l_xmdh021_3     #180428-00009#1 add
                   WHERE xmdhent = g_enterprise
                     AND xmdhdocno = l_xmdl001
                     AND xmdhseq = l_xmdhseq
                     AND xmdh002 = l_xmdh002
                     AND xmdh003 = l_xmdh003
                     AND xmdh004 = l_xmdh004
                     AND xmdh016 > l_qty2-l_qty1   
                  #180428-00009#1---add---e   
                  
                 
                 
                  
                  UPDATE xmdd_t
                     SET xmdd031 = (SELECT xmdh017 + l_qty1
                                      FROM xmdh_t
                                     WHERE xmdhent = g_enterprise
                                       AND xmdhdocno = l_xmdl001
                                       AND xmdhseq = l_xmdhseq
                                       AND xmdh002 = l_xmdh002
                                       AND xmdh003 = l_xmdh003
                                       AND xmdh004 = l_xmdh004)
                   WHERE xmddent = g_enterprise
                     #AND xmdddocno = l_xmdl003   #181219-00057#1 Mark By 06137 181222 
                     AND xmdddocno = l_xmdh001    #181219-00057#1 Add By 06137  181222
                     AND xmddseq = l_xmdh002
                     AND xmddseq1 = l_xmdh003
                     AND xmddseq2 = l_xmdh004
               END FOREACH               
            END IF                 
            #170726-00040#1-e add            
         ELSE   #con,upd
            LET l_xmdh017 = l_xmdl018   #"實際出通數量"更新為"出貨數量"
            #170726-00040#1-s add
            #FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2            #181219-00057#1 Mark By 06137 181222
            FOREACH s_axmt540_xmdh1 USING l_xmdl001 INTO l_xmdhseq,l_xmdh001,l_xmdh002,l_xmdh003,l_xmdh004,l_xmdh017_2   #181219-00057#1 Add By 06137  181222
               UPDATE xmdh_t SET xmdh017 = 0     
                WHERE xmdhent = g_enterprise
                  AND xmdhdocno = l_xmdl001
                  AND xmdhseq = l_xmdhseq
                  AND xmdh002 = l_xmdh002
                  AND xmdh003 = l_xmdh003
                  AND xmdh004 = l_xmdh004                    
               UPDATE xmdd_t
                  SET xmdd031 = xmdd031 - l_xmdh017_2
                WHERE xmddent = g_enterprise
                  #AND xmdddocno = l_xmdl003  #181219-00057#1 Mark By 06137 181222
                  AND xmdddocno = l_xmdh001   #181219-00057#1 Add By 06137  181222
                  AND xmddseq = l_xmdh002
                  AND xmddseq1 = l_xmdh003
                  AND xmddseq2 = l_xmdh004    
               #190831-00003#1 add(s)
               UPDATE xmdh_t SET xmdh021 = 0     
                WHERE xmdhent = g_enterprise
                  AND xmdhdocno = l_xmdl001
                  AND xmdhseq = l_xmdhseq
                  AND xmdh002 = l_xmdh002
                  AND xmdh003 = l_xmdh003
                  AND xmdh004 = l_xmdh004
               #190831-00003#1 add(e)
            END FOREACH
            #170726-00040#1-e add            
         END IF
         
         #170427-00007#4-s-add
         CALL s_axmt540_cursor()
         OPEN s_axmt540_cl USING g_enterprise,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "s_axmt540_cl:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CLOSE s_axmt540_cl
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #170427-00007#4-e-add
         #190312-00016#1-s-add
         #出通單計價數量轉換
         CALL s_aooi250_convert_qty(l_xmdl008,l_xmdl017,l_xmdl021,l_xmdh017)
                        RETURNING l_success,l_xmdh021
         #190312-00016#1-e-add
         #170608-00043#1----add----begin---
         UPDATE xmdh_t
            SET xmdh017 = l_xmdh017,
                xmdh030 = l_xmdl018
                ,xmdh056 = l_xmdh017   #180428-00007#1 add
                ,xmdh021 = l_xmdh021   #190312-00016#1-add
          WHERE xmdhent = g_enterprise
            AND xmdhdocno = l_xmdl001
            AND xmdhseq = l_xmdl002    
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "UPDATE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()          
            LET r_success = FALSE
            EXIT FOREACH
         END IF  


         #汇总出通单实际出通量回写订单的已出通量
         SELECT SUM(xmdh017) INTO l_xmdh017_1 FROM xmdh_t,xmdg_t
            WHERE xmdhent = g_enterprise
              AND xmdhdocno = xmdgdocno
              AND xmdhent = xmdgent
              AND xmdh001= l_xmdl003
              AND xmdh002 = l_xmdl004
              AND xmdh003 = l_xmdl005
              AND xmdh004 = l_xmdl006
             #AND xmdgstus = 'Y'    #170810-00021#1 mark
              AND xmdgstus <> 'X'   #170810-00021#1 add
         IF cl_null(l_xmdh017_1) THEN LET l_xmdh017_1  = 0  END IF
         #170608-00043#1----add---end--
         
         UPDATE xmdd_t
            SET xmdd031 = l_xmdh017_1       #170608-00043#1 mod l_xmdh017_1 to l_xmdh017
          WHERE xmddent = g_enterprise
            AND xmdddocno = l_xmdl003
            AND xmddseq = l_xmdl004
            AND xmddseq1 = l_xmdl005
            AND xmddseq2 = l_xmdl006
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "UPDATE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      #170618-00027#1 Add By Ken 170618(S)   
      ELSE          #參數'D-BAS-0060'='1','2'使用原本的更新实际出通数量xmdh017,已转出货数量xmdh030
         UPDATE xmdh_t
            SET xmdh017 = l_xmdh017,
                xmdh030 = l_xmdl018
#               ,xmdh021 = l_xmdh017    #171220-00020#1 add  #191111-00001#1 mark
          WHERE xmdhent = g_enterprise
            AND xmdhdocno = l_xmdl001
            AND xmdhseq = l_xmdl002
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "UPDATE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
   
            LET r_success = FALSE
            EXIT FOREACH
         END IF   
      #170618-00027#1 Add By Ken 170618(E)
      END IF
      #170608-00043#1----mark---begin---
#      UPDATE xmdh_t
#         SET xmdh017 = l_xmdh017,
#             xmdh030 = l_xmdl018
#       WHERE xmdhent = g_enterprise
#         AND xmdhdocno = l_xmdl001
#         AND xmdhseq = l_xmdl002
#      
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = "UPDATE:"
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF         
      #170608-00043#1----mark---end------        
   END FOREACH
   
   CLOSE s_axmt540_cl   #170427-00007#4-add
   CLOSE s_axmt540_cs8
   FREE s_axmt540_pre8 
   FREE s_axmt540_pre9 
   FREE s_axmt540_pre10
  
   IF NOT r_success THEN
      RETURN r_success
   END IF

   #更新出通單多庫儲批
   LET l_sql = "SELECT xmdl001,xmdl002,",
               "       xmdm005,xmdm006,xmdm007,xmdm033",
               "  FROM xmdl_t,xmdm_t",
               " WHERE xmdlent = xmdment AND xmdment = '",g_enterprise,"'",
               "   AND xmdldocno = xmdmdocno AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdlseq = xmdmseq" #180702-00019#1 remove ,
               #" ORDER BY xmdmseq,xmdmseq1" #180702-00019#1 mark
   #180702-00019#1 add start -----                
   IF NOT cl_null(p_xmdlseq) THEN
      LET l_sql = l_sql ," AND xmdlseq = ",p_xmdlseq   
   END IF
   LET l_sql = l_sql ," ORDER BY xmdmseq,xmdmseq1"
   #180702-00019#1 add end   -----  
   PREPARE s_axmt540_pre2 FROM l_sql
   DECLARE s_axmt540_cs2 CURSOR FOR s_axmt540_pre2

   LET l_sql = "SELECT COUNT(xmdiseq1)",
               "  FROM xmdg_t,xmdi_t",
               " WHERE xmdgent = xmdient AND xmdient = '",g_enterprise,"'",
               "   AND xmdgdocno = xmdidocno",
               "   AND xmdidocno = ?",
               "   AND xmdiseq = ?"
   PREPARE s_axmt540_pre6 FROM l_sql

   FOREACH s_axmt540_cs2 INTO l_xmdl001,l_xmdl002,
                              l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm033
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl001) OR cl_null(l_xmdl002) THEN
         CONTINUE FOREACH
      END IF

      #計算出通單是否有多庫儲批
      LET l_n = 0
      EXECUTE s_axmt540_pre6 USING l_xmdl001,l_xmdl002 INTO l_n
      IF l_n = 0 OR cl_null(l_n) THEN
         CONTINUE FOREACH
      END IF

     #161205-00025#10 161221 by lori mod---(S) 
     #LET l_sql = "SELECT SUM(xmdm009)",
     #            "  FROM xmdk_t a,xmdl_t,xmdm_t",
     #            " WHERE a.xmdkent = xmdlent AND xmdlent = xmdment",
     #            "   AND xmdment = '",g_enterprise,"'",
     #            "   AND a.xmdkdocno = xmdldocno AND xmdldocno = xmdmdocno",
     #            "   AND xmdlseq = xmdmseq",
     #            "   AND xmdl001 = '",l_xmdl001,"'",
     #            "   AND xmdl002 = '",l_xmdl002,"'",
     #            "   AND a.xmdkstus IN ('H','Y','S')",
     #            "   AND a.xmdk000 = '1'",      #出貨單
     #            "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
     #            "                                          FROM xmdk_t b",
     #            "                                         WHERE b.xmdkent = a.xmdkent",
     #            "                                           AND b.xmdkdocno = a.xmdk035",
     #            "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
      LET l_sql = "SELECT SUM(xmdm009)",
                  "  FROM ( SELECT xmdment,xmdmdocno,xmdmseq, ",
                  "                COALESCE(xmdm009,0) xmdm009, ",
                  "                COALESCE(xmdm005,' ') xmdm005, ",
                  "                COALESCE(xmdm006,' ') xmdm006, ",
                  "                COALESCE(xmdm007,' ') xmdm007, ",
                  "                COALESCE(xmdm033,' ') xmdm033  ",
                  #PGS(D)-13130 meno -S
                  #"          FROM xmdm_t WHERE xmdment = ",g_enterprise,")",
                  "          FROM xmdm_t WHERE xmdment = ",g_enterprise,") t51 ",
                  #PGS(D)-13130 meno -E
                  " WHERE EXISTS(SELECT 1 FROM xmdl_t WHERE xmdment = xmdlent AND xmdmdocno = xmdldocno AND xmdmseq = xmdlseq ",
                  "                                     AND xmdl001 = '",l_xmdl001,"' AND xmdl002 = '",l_xmdl002,"') ",
                  "   AND EXISTS(SELECT 1 FROM xmdk_t t1 WHERE xmdment = xmdkent AND xmdmdocno = xmdkdocno ",
                  "                                        AND xmdkstus IN ('H','Y','S') AND xmdk000 = '1' ",
                  "                                        AND NOT (xmdk045 = '3' ",
                  "                                              AND EXISTS(SELECT 1 FROM xmdk_t t2 ",
                  "                                                          WHERE t2.xmdkent = t1.xmdkent ",
                  "                                                            AND t2.xmdkdocno = t1.xmdk035 ",
                  "                                                            AND t2.xmdkstus <> 'X')))"                  
     #161205-00025#10 161221 by lori mod---(E)
      
      IF l_n > 1 THEN  #有多庫儲批加上多庫儲批的對應(因出通單沒建立多庫儲批可能沒輸入庫儲批)
        #161205-00025#10 161221 by lori mod---(S) 
        #LET l_sql = l_sql," AND COALESCE(xmdm005,' ') = COALESCE('",l_xmdm005,"',' ')",
        #                  " AND COALESCE(xmdm006,' ') = COALESCE('",l_xmdm006,"',' ')",
        #                  " AND COALESCE(xmdm007,' ') = COALESCE('",l_xmdm007,"',' ')",
        #                  " AND COALESCE(xmdm033,' ') = COALESCE('",l_xmdm033,"',' ')"
         LET l_sql = l_sql," AND xmdm005 = COALESCE('",l_xmdm005,"',' ')",
                           " AND xmdm006 = COALESCE('",l_xmdm006,"',' ')",
                           " AND xmdm007 = COALESCE('",l_xmdm007,"',' ')",
                           " AND xmdm033 = COALESCE('",l_xmdm033,"',' ')"                           
        #161205-00025#10 161221 by lori mod---(E)                   
      END IF
      
      PREPARE s_axmt540_pre11 FROM l_sql
      EXECUTE s_axmt540_pre11 INTO l_xmdm009

      IF cl_null(l_xmdm009) THEN
         LET l_xmdm009 = 0
      END IF
          
      IF l_n > 1 THEN  #有多庫儲批加上多庫儲批的對應(因出通單沒建立多庫儲批可能沒輸入庫儲批)          
         UPDATE xmdi_t
            SET xmdi012 = l_xmdm009
          WHERE xmdient = g_enterprise
            AND xmdidocno = l_xmdl001
            AND xmdiseq = l_xmdl002
            AND COALESCE(xmdi005,' ') = COALESCE(l_xmdm005,' ')
            AND COALESCE(xmdi006,' ') = COALESCE(l_xmdm006,' ')
            AND COALESCE(xmdi007,' ') = COALESCE(l_xmdm007,' ')
            AND COALESCE(xmdi013,' ') = COALESCE(l_xmdm033,' ')
            
      ELSE
         UPDATE xmdi_t
            SET xmdi012 = l_xmdm009
          WHERE xmdient = g_enterprise
            AND xmdidocno = l_xmdl001
            AND xmdiseq = l_xmdl002
            
      END IF

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
          
   END FOREACH
      
   CLOSE s_axmt540_cs2
   CLOSE s_axmt540_pre2
   FREE s_axmt540_pre11
   FREE s_axmt540_pre6

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 稅額計算
# Memo...........:
# Usage..........: s_axmt540_tax_count(p_xmdlseq_t,p_xmdldocno,p_xmdlseq,p_site,p_xmdl025,
#                                      p_xmdl022,p_xmdl024,p_xmdl016,p_xmdl017,
#                                      p_xmdl003,p_xmdl004,p_xmdl018)
#                  RETURNING r_xmdl027,r_xmdl028,r_xmdl029
# Input parameter: DEFINE p_xmdlseq_t  LIKE xmdl_t.xmdlseq   #項次(舊值刪除用)
#                : DEFINE p_xmdldocno  LIKE xmdl_t.xmdldocno #單據單號
#                : DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq   #項次
#                : DEFINE p_site       LIKE xmdl_t.xmdlsite  #營運據點
#                : DEFINE p_xmdl025    LIKE xmdl_t.xmdl      #稅別
#                : DEFINE p_xmdl022    LIKE xmdl_t.xmdl022   #計價數量
#                : DEFINE p_xmdl024    LIKE xmdl_t.xmdl024   #單價
#                : DEFINE p_xmdk016    LIKE xmdk_t.xmdk016   #幣別
#                : DEFINE p_xmdk017    LIKE xmdk_t.xmdk017   #匯率
#                : DEFINE p_xmdl003    LIKE xmdl_t.xmdl003   #訂單單號
#                : DEFINE p_xmdl004    LIKE xmdl_t.xmdl004   #訂單項次
#                : DEFINE p_xmdl018    LIKE xmdl_t.xmdl018   #出貨數量
# Return code....: DEFINE r_xmdl027    LIKE xmdl_t.xmdl027   #原幣未稅金額
#                : DEFINE r_xmdl028    LIKE xmdl_t.xmdl028   #原幣含稅金額
#                : DEFINE r_xmdl029    LIKE xmdl_t.xmdl029   #原幣稅額
# Date & Author..: 140730 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_tax_count(p_xmdlseq_t,p_xmdldocno,p_xmdlseq,p_site,p_xmdl025,p_xmdl022,p_xmdl024,p_xmdk016,p_xmdk017,p_xmdl003,p_xmdl004,p_xmdl018)
   DEFINE p_xmdlseq_t  LIKE xmdl_t.xmdlseq   #項次(舊值刪除用)
   DEFINE p_xmdldocno  LIKE xmdl_t.xmdldocno #單據單號
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq   #項次
   DEFINE p_site       LIKE xmdl_t.xmdlsite  #營運據點
   DEFINE p_xmdl025    LIKE xmdl_t.xmdl025   #稅別
   DEFINE p_xmdl022    LIKE xmdl_t.xmdl022   #計價數量
   DEFINE p_xmdl024    LIKE xmdl_t.xmdl024   #單價
   DEFINE p_xmdk016    LIKE xmdk_t.xmdk016   #幣別
   DEFINE p_xmdk017    LIKE xmdk_t.xmdk017   #匯率

   #150112若完全出貨、簽收補上尾差
   DEFINE p_xmdl003    LIKE xmdl_t.xmdl003   #訂單單號
   DEFINE p_xmdl004    LIKE xmdl_t.xmdl004   #訂單項次
   DEFINE p_xmdl018    LIKE xmdl_t.xmdl018   #出貨數量

   DEFINE r_xmdl027    LIKE xmdl_t.xmdl027   #原幣未稅金額
   DEFINE r_xmdl028    LIKE xmdl_t.xmdl028   #原幣含稅金額
   DEFINE r_xmdl029    LIKE xmdl_t.xmdl029   #原幣稅額

   DEFINE l_slip       LIKE ooba_t.ooba001
   
   DEFINE l_xrcd    RECORD
          xrcd103     LIKE xrcd_t.xrcd103,
          xrcd104     LIKE xrcd_t.xrcd104,
          xrcd105     LIKE xrcd_t.xrcd105,
          xrcd113     LIKE xrcd_t.xrcd113,
          xrcd114     LIKE xrcd_t.xrcd114,
          xrcd115     LIKE xrcd_t.xrcd115,
          xrcd123     LIKE xrcd_t.xrcd123,
          xrcd124     LIKE xrcd_t.xrcd124,
          xrcd125     LIKE xrcd_t.xrcd125,
          xrcd133     LIKE xrcd_t.xrcd133,
          xrcd134     LIKE xrcd_t.xrcd134,
          xrcd135     LIKE xrcd_t.xrcd135
                    END RECORD
       
   DEFINE l_money     LIKE xrcd_t.xrcd102   #價格*數量
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_sql       STRING

   DEFINE l_from    RECORD
          xmdc007     LIKE xmdc_t.xmdc007,  #訂單銷售數量
          xrcd103     LIKE xrcd_t.xrcd103,  #原幣未稅金額
          xrcd104     LIKE xrcd_t.xrcd104,  #原幣稅額
          xrcd105     LIKE xrcd_t.xrcd105,  #原幣含稅金額
          xrcd113     LIKE xrcd_t.xrcd113,  #本幣未稅金額
          xrcd114     LIKE xrcd_t.xrcd114,  #本幣稅額
          xrcd115     LIKE xrcd_t.xrcd115,  #本幣含稅金額
          xrcd123     LIKE xrcd_t.xrcd123,  #本位幣二未稅金額
          xrcd124     LIKE xrcd_t.xrcd124,  #本位幣二稅額
          xrcd125     LIKE xrcd_t.xrcd125,  #本位幣二含稅金額
          xrcd133     LIKE xrcd_t.xrcd133,  #本位幣三未稅金額
          xrcd134     LIKE xrcd_t.xrcd134,  #本位幣三稅額
          xrcd135     LIKE xrcd_t.xrcd135   #本位幣三含稅金額
                    END RECORD

   DEFINE l_sum     RECORD
          xmdl018     LIKE xmdl_t.xmdl018,  #數量
          xrcd103     LIKE xrcd_t.xrcd103,  #原幣未稅金額
          xrcd104     LIKE xrcd_t.xrcd104,  #原幣稅額
          xrcd105     LIKE xrcd_t.xrcd105,  #原幣含稅金額
          xrcd113     LIKE xrcd_t.xrcd113,  #本幣未稅金額
          xrcd114     LIKE xrcd_t.xrcd114,  #本幣稅額
          xrcd115     LIKE xrcd_t.xrcd115,  #本幣含稅金額
          xrcd123     LIKE xrcd_t.xrcd123,  #本位幣二未稅金額
          xrcd124     LIKE xrcd_t.xrcd124,  #本位幣二稅額
          xrcd125     LIKE xrcd_t.xrcd125,  #本位幣二含稅金額
          xrcd133     LIKE xrcd_t.xrcd133,  #本位幣三未稅金額
          xrcd134     LIKE xrcd_t.xrcd134,  #本位幣三稅額
          xrcd135     LIKE xrcd_t.xrcd135   #本位幣三含稅金額
                    END RECORD

   WHENEVER ERROR CONTINUE

   INITIALIZE l_xrcd.* TO NULL
   LET r_xmdl027 = ''      
   LET r_xmdl029 = ''     
   LET r_xmdl028 = ''      
            
   LET l_sql = "SELECT SUM(xmdc007),",
               "       SUM(xrcd103),SUM(xrcd104),SUM(xrcd105),",
               "       SUM(xrcd113),SUM(xrcd114),SUM(xrcd115),",
               "       SUM(xrcd123),SUM(xrcd124),SUM(xrcd125),",
               "       SUM(xrcd133),SUM(xrcd134),SUM(xrcd135)",
               "  FROM xmdc_t,xrcd_t",
               " WHERE xmdcent = xrcdent AND xrcdent = ",g_enterprise,
               "   AND xmdcdocno = xrcddocno AND xrcddocno = ?",
               "   AND xmdcseq = xrcdseq AND xrcdseq = ?",
               "   AND xrcdseq2 = 0"
   PREPARE s_axmt540_tax_pre01 FROM l_sql
           
   LET l_sql = "SELECT SUM(xmdl018) + SUM(xmdl081),",
               "       SUM(xrcd103),SUM(xrcd104),SUM(xrcd105),",
               "       SUM(xrcd113),SUM(xrcd114),SUM(xrcd115),",
               "       SUM(xrcd123),SUM(xrcd124),SUM(xrcd125),",
               "       SUM(xrcd133),SUM(xrcd134),SUM(xrcd135)",
               "  FROM xmdk_t a,xmdl_t,xrcd_t",
               " WHERE a.xmdkent = xmdlent AND xmdlent = xrcdent AND xrcdent = ",g_enterprise,
               "   AND a.xmdkdocno = xmdldocno AND xmdldocno = xrcddocno",
               "   AND xmdlseq = xrcdseq AND xrcdseq2 = 0",
               "   AND a.xmdk000 = (SELECT c.xmdk000 FROM xmdk_t c",
               "                                    WHERE c.xmdkent = ",g_enterprise,
               "                                      AND c.xmdkdocno = '",p_xmdldocno,"')",
               "   AND a.xmdkstus <> 'X'",
               "   AND xmdl003 = ?",
               "   AND xmdl004 = ?",
               "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
               "                                          FROM xmdk_t b",
               "                                         WHERE b.xmdkent = a.xmdkent",
               "                                           AND b.xmdkdocno = a.xmdk035",
               "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
               
   IF NOT cl_null(p_xmdlseq_t) THEN  #排除該單身舊資料
      LET l_sql = l_sql," AND NOT (xmdldocno = '",p_xmdldocno,"' AND xmdlseq = '",p_xmdlseq_t,"')"
   END IF
   PREPARE s_axmt540_tax_pre02 FROM l_sql

   IF NOT cl_null(p_xmdldocno) AND
      NOT cl_null(p_xmdlseq) AND
      NOT cl_null(p_site) AND
      NOT cl_null(p_xmdl025) AND
      NOT cl_null(p_xmdl022) AND
      NOT cl_null(p_xmdl024) AND
      NOT cl_null(p_xmdk016) AND
      NOT cl_null(p_xmdk017) THEN

      IF NOT cl_null(p_xmdlseq_t) THEN  #刪除舊值
         CALL s_axmt540_tax_delete(p_xmdldocno,p_xmdlseq_t,'2') RETURNING l_success
         IF NOT l_success THEN
            RETURN r_xmdl027,r_xmdl028,r_xmdl029
         END IF
      END IF

      LET l_money = p_xmdl024 * p_xmdl022

      CALL s_tax_ins(p_xmdldocno,p_xmdlseq,0,p_site,l_money,
                     p_xmdl025,p_xmdl022,p_xmdk016,p_xmdk017,' ',' ',' ')
                     
      RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,
                l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115,l_xrcd.xrcd123,l_xrcd.xrcd124,
                l_xrcd.xrcd125,l_xrcd.xrcd133,l_xrcd.xrcd134,l_xrcd.xrcd135
                
      LET r_xmdl027 = l_xrcd.xrcd103  #未稅金額
      LET r_xmdl028 = l_xrcd.xrcd105  #含稅金額
      LET r_xmdl029 = l_xrcd.xrcd104  #稅額

      #150112若完全出貨、簽收補上尾差
      IF NOT cl_null(p_xmdl003) AND NOT cl_null(p_xmdl004) THEN
         CALL s_aooi200_get_slip(p_xmdl003) RETURNING l_success,l_slip
         
         IF NOT l_success THEN
            RETURN r_xmdl027,r_xmdl028,r_xmdl029
         END IF

         IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0088') = 'Y' THEN    #出貨總額需與訂單總額一致
            
            INITIALIZE l_from.* TO NULL
            EXECUTE s_axmt540_tax_pre01 USING p_xmdl003,p_xmdl004 
            INTO l_from.xmdc007,
                 l_from.xrcd103,l_from.xrcd104,l_from.xrcd105,
                 l_from.xrcd113,l_from.xrcd114,l_from.xrcd115,
                 l_from.xrcd123,l_from.xrcd124,l_from.xrcd125,
                 l_from.xrcd133,l_from.xrcd134,l_from.xrcd135
            
            INITIALIZE l_sum.* TO NULL
            EXECUTE s_axmt540_tax_pre02 USING p_xmdl003,p_xmdl004
            INTO l_sum.xmdl018,
                 l_sum.xrcd103,l_sum.xrcd104,l_sum.xrcd105,
                 l_sum.xrcd113,l_sum.xrcd114,l_sum.xrcd115,
                 l_sum.xrcd123,l_sum.xrcd124,l_sum.xrcd125,
                 l_sum.xrcd133,l_sum.xrcd134,l_sum.xrcd135
 
            IF cl_null(l_sum.xmdl018) THEN LET l_sum.xmdl018 = 0 END IF
            IF cl_null(l_sum.xrcd103) THEN LET l_sum.xrcd103 = 0 END IF
            IF cl_null(l_sum.xrcd104) THEN LET l_sum.xrcd104 = 0 END IF
            IF cl_null(l_sum.xrcd105) THEN LET l_sum.xrcd105 = 0 END IF
            IF cl_null(l_sum.xrcd113) THEN LET l_sum.xrcd113 = 0 END IF
            IF cl_null(l_sum.xrcd114) THEN LET l_sum.xrcd114 = 0 END IF
            IF cl_null(l_sum.xrcd115) THEN LET l_sum.xrcd115 = 0 END IF
            IF cl_null(l_sum.xrcd123) THEN LET l_sum.xrcd123 = 0 END IF
            IF cl_null(l_sum.xrcd124) THEN LET l_sum.xrcd124 = 0 END IF
            IF cl_null(l_sum.xrcd125) THEN LET l_sum.xrcd125 = 0 END IF
            IF cl_null(l_sum.xrcd133) THEN LET l_sum.xrcd133 = 0 END IF
            IF cl_null(l_sum.xrcd134) THEN LET l_sum.xrcd134 = 0 END IF
            IF cl_null(l_sum.xrcd135) THEN LET l_sum.xrcd135 = 0 END IF
 
            IF l_from.xmdc007 = l_sum.xmdl018 + p_xmdl018 THEN   #全數出貨
               IF r_xmdl028 < l_from.xrcd105 - l_sum.xrcd105 THEN  #出貨含稅金額<訂單含稅金額，將尾差補上
                  UPDATE xrcd_t
                     SET xrcd103 = l_from.xrcd103 - l_sum.xrcd103,   #未稅金額
                         xrcd104 = l_from.xrcd104 - l_sum.xrcd104,   #稅額
                         xrcd105 = l_from.xrcd105 - l_sum.xrcd105,   #含稅金額
                         
                         xrcd113 = l_from.xrcd113 - l_sum.xrcd113,   #本幣未稅
                         xrcd114 = l_from.xrcd114 - l_sum.xrcd114,   #本幣稅額
                         xrcd115 = l_from.xrcd115 - l_sum.xrcd115,   #本幣含稅金額
                  
                         xrcd123 = l_from.xrcd123 - l_sum.xrcd123,  #本位幣二未稅金額
                         xrcd124 = l_from.xrcd124 - l_sum.xrcd124,  #本位幣二稅額
                         xrcd125 = l_from.xrcd125 - l_sum.xrcd125,  #本位幣二含稅金額
                         
                         xrcd133 = l_from.xrcd133 - l_sum.xrcd133,  #本位幣三未稅金額
                         xrcd134 = l_from.xrcd134 - l_sum.xrcd134,  #本位幣三稅額
                         xrcd135 = l_from.xrcd135 - l_sum.xrcd135   #本位幣三含稅金額
                   WHERE xrcdent = g_enterprise
                     AND xrcddocno = p_xmdldocno
                     AND xrcdseq = p_xmdlseq
                     AND xrcdseq2 = 0
                     
                  IF SQLCA.sqlcode THEN
                     RETURN r_xmdl027,r_xmdl028,r_xmdl029
                  ELSE
                     LET r_xmdl027 = l_from.xrcd103 - l_sum.xrcd103  #未稅金額
                     LET r_xmdl028 = l_from.xrcd105 - l_sum.xrcd105  #含稅金額
                     LET r_xmdl029 = l_from.xrcd104 - l_sum.xrcd104  #稅額
                  END IF
               END IF
            END IF
            
         END IF
      END IF
      
   END IF
   
   RETURN r_xmdl027,r_xmdl028,r_xmdl029
END FUNCTION

################################################################################
# Descriptions...: 更改多庫儲批資料(input後)
# Memo...........:
# Usage..........: CALL s_axmt540_change_xmdm_upd_after(p_xmdkdocno,p_xmdlseq,p_xmdkstus)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   單據單號
#                : p_xmdlseq     單據項次
#                : p_xmdkstus    單據狀態
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 140328 By earl
# Modify.........: #180702-00019#1 18/05/28 By 02111   增加單據項次
################################################################################
PUBLIC FUNCTION s_axmt540_change_xmdm_upd_after(p_xmdkdocno,p_xmdlseq,p_xmdkstus)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdkstus      LIKE xmdk_t.xmdkstus
   DEFINE r_success       LIKE type_t.num5
   DEFINE p_xmdlseq       LIKE xmdl_t.xmdlseq #180702-00019#1 add   

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
      
   IF p_xmdkstus NOT MATCHES '[YH]' THEN
      RETURN r_success
   END IF  
   
   #CALL s_axmt540_xmdh_upd(p_xmdkdocno,'upd') RETURNING r_success          #180702-00019#1 mark
   CALL s_axmt540_xmdh_upd(p_xmdkdocno,p_xmdlseq,'upd') RETURNING r_success #180702-00019#1 add
   IF NOT r_success THEN
      RETURN r_success
   END IF
      
   #在揀量更新
   CALL s_axmt540_ins_inap(p_xmdkdocno,'1','upd') RETURNING r_success 
      
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 庫存量更新
# Memo...........:
# Usage..........: CALL s_axmt540_inag_inaj_upd(p_cmd,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_cmd          post:過帳,unpos:取消過帳
#                : p_xmdkdocno    單據單號
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140418 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inag_inaj_upd(p_cmd,p_xmdkdocno)
   DEFINE p_cmd           LIKE type_t.chr10        #post:過帳,unpos:取消過帳
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   
   DEFINE l_ope1          LIKE type_t.num5         #本庫運算
   DEFINE l_ope2          LIKE type_t.num5         #在途庫運算
   DEFINE l_flag          LIKE type_t.chr1         #1.扣帳  2.扣帳還原
   
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   
   DEFINE l_xmdk039       LIKE xmdk_t.xmdk039
   DEFINE l_xmdk040       LIKE xmdk_t.xmdk040
   DEFINE l_xmdk044       LIKE xmdk_t.xmdk044  #171218-00024#2-add
   DEFINE l_sql           STRING
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdmseq       LIKE xmdm_t.xmdmseq
   DEFINE l_xmdmseq1      LIKE xmdm_t.xmdmseq1
   DEFINE l_xmdm001       LIKE xmdm_t.xmdm001
   DEFINE l_xmdm002       LIKE xmdm_t.xmdm002
   DEFINE l_xmdm005       LIKE xmdm_t.xmdm005
   DEFINE l_xmdm006       LIKE xmdm_t.xmdm006
   DEFINE l_xmdm007       LIKE xmdm_t.xmdm007
   DEFINE l_xmdm009       LIKE xmdm_t.xmdm009
   DEFINE l_xmdm008       LIKE xmdm_t.xmdm008
   DEFINE l_xmdm010       LIKE xmdm_t.xmdm010
   DEFINE l_xmdm011       LIKE xmdm_t.xmdm011
   DEFINE l_xmdm033       LIKE xmdm_t.xmdm033
   DEFINE l_xmdk001       LIKE xmdk_t.xmdk001
   DEFINE l_xmdk007       LIKE xmdk_t.xmdk007
   DEFINE l_warehouse     LIKE xmdk_t.xmdk039
   DEFINE l_type          LIKE type_t.chr1
   DEFINE l_xmdk087       LIKE xmdk_t.xmdk087  #add by lixiang 2015/12/30
   DEFINE l_xmdk004       LIKE xmdk_t.xmdk004  #160328-00008#1
   DEFINE l_xmdl057       LIKE xmdl_t.xmdl057  #160512-00004#1
   DEFINE l_xmdl058       LIKE xmdl_t.xmdl058  #160512-00004#1
   DEFINE r_success_chkALL   LIKE type_t.num5  #161109-00037#1 add
   DEFINE l_imaa004       LIKE imaa_t.imaa004  #170116-00044#2-add
   DEFINE l_cnt           LIKE type_t.num5     #170116-00044#2-add
   DEFINE l_xmdk071       LIKE xmdk_t.xmdk071  #201216-00027#5 add
   
   #171219-00022#16  add by 09767-->s
   DEFINE la_param     RECORD
             prog        STRING,
             background   LIKE type_t.chr1
                      END RECORD
   DEFINE ls_js          STRING                   
   #171219-00022#16  add by 09767-->e
   #171218-00024#2-s-add
   DEFINE l_site_o        LIKE xmdk_t.xmdksite 
   DEFINE l_extend        STRING
   DEFINE l_success       LIKE type_t.num5
   #171218-00024#2-e-add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   IF cl_null(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   IF p_cmd = 'post' THEN   #過帳
      LET l_ope1 = -1
      LET l_ope2 = 1
      LET l_flag = 1
   ELSE                     #取消過帳
      LET l_ope1 = 1
      LET l_ope2 = -1
      LET l_flag = 2
   END IF
   
   LET l_xmdk001 = ''
   LET l_xmdk002 = ''    #出貨性質
   LET l_xmdk004 = ''
   LET l_xmdk007 = ''
   LET l_xmdk039 = ''    #在途成本庫位
   LET l_xmdk040 = ''    #再途非成本庫位
   LET l_xmdk087 = ''
   SELECT xmdk001,xmdk002,xmdk004,xmdk007,xmdk039,xmdk040,xmdk087
         ,xmdk044   #171218-00024#2-add
         ,xmdk071   #201216-00027#5 add
     INTO l_xmdk001,l_xmdk002,l_xmdk004,l_xmdk007,l_xmdk039,l_xmdk040,l_xmdk087
         ,l_xmdk044 #171218-00024#2-add
         ,l_xmdk071 #201216-00027#5 add
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno

   LET l_sql = "SELECT xmdl003,xmdl004,xmdl057,xmdl058,",  #160512-00004#1 add xmdl057,xmdl058,
               "       xmdmseq,xmdmseq1,xmdm001,xmdm002,",
               "       xmdm005,xmdm006,xmdm007,xmdm009,xmdm008,xmdm010,xmdm011,",
               "       (SELECT imaa004 FROM imaa_t WHERE imaaent=xmdlent AND imaa001=xmdl008) imaa004,", #170116-00044#2-add
               "       xmdm033", 
               "  FROM xmdk_t,xmdl_t,xmdm_t",
               " WHERE xmdkent = xmdlent AND xmdlent = xmdment AND xmdment = ",g_enterprise,
               "   AND xmdkdocno = xmdldocno AND xmdldocno = xmdmdocno AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdlseq = xmdmseq",
               " ORDER BY xmdmseq,xmdmseq1"
   PREPARE s_axmt540_pre20 FROM l_sql
   DECLARE s_axmt540_cs20 CURSOR FOR s_axmt540_pre20

   IF p_cmd = 'post' THEN
      FOREACH s_axmt540_cs20 INTO l_xmdl003,l_xmdl004,l_xmdl057,l_xmdl058,  #160512-00004#1 add l_xmdl057,l_xmdl058,
                                  l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm002,
                                  l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm009,l_xmdm008,l_xmdm010,l_xmdm011,
                                  #l_xmdm033           #170116-00044#2-add-s-mod
                                  l_imaa004,l_xmdm033  #170116-00044#2-add-e-mod
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
     
            LET r_success = FALSE
            EXIT FOREACH
         END IF  
     
         #費用資料(來源有訂單單號但無訂單項次)
         IF NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004) THEN
            CONTINUE FOREACH
         END IF
         #170116-00044#2-s-add
         #料號為費用類別
         IF l_imaa004 = 'E' THEN
            CONTINUE FOREACH
         END IF
         #170116-00044#2-e-add
         
         #蒐集不存在inag_t的資料
         #160512-00004#1-s modify
         ##料件編號,產品特徵,庫存管理特徵,庫位,儲位,批號,有效日期,備註,第一次入庫日期,單位
         #CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,'','',g_today,l_xmdm008,g_site)
         #                                 料件编号   产品特征  库存管理特征 库位
         CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,
         #                                 储位      批号      单位       备注
                                           l_xmdm006,l_xmdm007,l_xmdm008,'',
         #                                 第一次入库日期 製造日期 有效日期 營運據點
                                           g_today  ,l_xmdl058,l_xmdl057,g_site)
         #160512-00004#1-e modify

         IF l_xmdk002 = '3' OR l_xmdk002 = '4' OR l_xmdk002 = '8' THEN     #過帳且出貨性質為"簽收訂單","調撥訂單","借貨訂單"，在途倉inag新增
            #檢查來源是否為成本倉
            CALL s_axmt540_inag012_chk(g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008)
            RETURNING l_type

            IF l_type = 'Y' THEN   #成本庫
               LET l_warehouse = l_xmdk039
            ELSE
               LET l_warehouse = l_xmdk040
            END IF

            #201030-00027#2 add -S
            #過帳處理庫存異動時,如為簽收訂單，且參數「走簽收流程，但依出貨認列發出商品否」=Y時，l_warehouse給在途非成本倉
#            IF cl_get_para(g_enterprise,g_site,'S-FIN-1003') = '4' AND cl_get_para(g_enterprise,g_site,'S-FIN-9029') = "Y" THEN  #201216-00027#5 mark
            IF l_xmdk071 =  "Y" THEN  #201216-00027#5 add
               LET l_warehouse = l_xmdk040
            END IF
            #201030-00027#2 add -E
            
            #蒐集不存在inag_t的資料
            #160512-00004#1-s modify
            ##料件編號,產品特徵,庫存管理特徵,庫位,儲位,批號,有效日期,備註,第一次入庫日期,單位
            #CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,' ',l_warehouse,' ',l_xmdm007,'','',g_today,l_xmdm008,g_site)
            #                                 料件编号   产品特征  库存管理特征 库位
            CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,       #170117-00044#2 mod ' ' to l_xmdm033
            #                                 储位      批号      单位       备注
#                                              l_xmdm006 ,l_xmdm007,l_xmdm008,'',               #170117-00044#2 mod ' ' to l_xmdm006   #170309-00045#1  mark
                                               ' ' ,l_xmdm007,l_xmdm008,'',                     #170309-00045#1 add                                              
            #                                 第一次入库日期 製造日期 有效日期 營運據點
                                              g_today  ,l_xmdl058,l_xmdl057,g_site)
            #160512-00004#1-e modify
     
         END IF  

         #add by lixiang 2015/12/30---begin---
         #xmdk087=Y且xmdk002<>‘3’时，出货单过账产生2笔inaj，一笔从出货仓出掉（inaj036=调拨）、一笔入到发票仓（inaj036=调拨，储位预设为客户编号）
         #若出货单上库位为成本仓，发票仓取S-FIN-1005；
         #若出货单上库位为非成本仓，发票仓取S-FIN-1006
         #IF l_xmdk087 = 'Y' AND l_xmdk002 <> '3' THEN
         IF l_xmdk087 = 'Y' AND l_xmdk002 NOT MATCHES '[348]' THEN    #需再排除調撥訂單 和 借貨訂單   
            #檢查來源是否為成本倉
            CALL s_axmt540_inag012_chk(g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008)
            RETURNING l_type
            
            LET l_warehouse = ''         
            IF l_type = 'Y' THEN    #成本倉
               LET l_warehouse = cl_get_para(g_enterprise,g_site,'S-FIN-1005')
            ELSE
               LET l_warehouse = cl_get_para(g_enterprise,g_site,'S-FIN-1006')
            END IF
            
            
            IF NOT cl_null(l_warehouse) THEN
               #蒐集不存在inag_t的資料
               #160512-00004#1-s modify
               ##料件編號,產品特徵,庫存管理特徵,庫位,儲位,批號,有效日期,備註,第一次入庫日期,單位
               #CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,l_xmdk007,l_xmdm007,'','',g_today,l_xmdm008,g_site)
               #                                 料件编号   产品特征  库存管理特征 库位
               CALL s_inventory_ins_inag_collect(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,
               #                                 储位      批号      单位       备注
                                                 l_xmdk007,l_xmdm007,l_xmdm008,'',
               #                                 第一次入库日期 製造日期 有效日期 營運據點
                                                 g_today  ,l_xmdl058,l_xmdl057,g_site)
               #160512-00004#1-e modify
            END IF
         END IF
         #add by lixiang 2015/12/30---end---        
         
      END FOREACH               
         
      #INSERT在途倉
      CALL s_inventory_ins_inag(g_site) RETURNING r_success
     
      IF NOT r_success THEN
         RETURN r_success
      END IF
   END IF


   LET r_success_chkALL = TRUE   #161109-00037#1 add
   FOREACH s_axmt540_cs20 INTO l_xmdl003,l_xmdl004,l_xmdl057,l_xmdl058,  #160512-00004#1 add l_xmdl057,l_xmdl058,
                               l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm002,
                               l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm009,l_xmdm008,l_xmdm010,l_xmdm011,
                               #l_xmdm033            #170116-00044#2-s-mod
                               l_imaa004,l_xmdm033  #170116-00044#2-e-mod
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF         

      #費用資料(來源有訂單單號但無訂單項次)
      IF NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004) THEN
         CONTINUE FOREACH
      END IF
      #170116-00044#2-s-add
      #料號為費用類別
      IF l_imaa004 = 'E' THEN
         CONTINUE FOREACH
      END IF
      #170116-00044#2-e-add
      
      #171218-00024#2-s-add
      #續拋過帳檢查製造批序號
      IF NOT cl_null(l_xmdk044) AND p_cmd = 'post' THEN
         IF NOT s_aic_carry_continue_lot_chk(g_site,l_xmdk044,'1',l_xmdl003,p_xmdkdocno,l_xmdmseq) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00995'
            LET g_errparam.extend = ""
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = p_xmdkdocno
            LET g_errparam.replace[2] = l_xmdmseq         
            CALL cl_err()
            LET r_success_chkALL = FALSE
            CONTINUE FOREACH
         END IF
      END IF
      
      #若為多角銷售正拋，要做最終站庫存檢查
      IF g_aic_direct THEN
         LET l_site_o = g_site       #據點備份
         LET g_site = g_aic.icab003  #將據點換成最終站的據點，讓多角正拋能檢查到最終站的庫存數量
         CALL s_inventory_check_inag008('-1',l_xmdm001,l_xmdm002,l_xmdm033,
                                        g_aic.icad004,g_aic.icad005,l_xmdm007,l_xmdm009,
                                        g_aic.icac007,l_xmdmseq,l_xmdmseq1,l_xmdm008,g_site)
             RETURNING l_success,l_flag
             
         LET g_site = l_site_o       #還原據點
         INITIALIZE g_errparam TO NULL
         LET g_errparam.replace[1] = l_xmdm001
         LET g_errparam.replace[2] = l_xmdm002
         LET g_errparam.replace[3] = l_xmdm033
         LET g_errparam.replace[4] = g_aic.icad004
         LET g_errparam.replace[5] = g_aic.icad005
         LET g_errparam.replace[6] = l_xmdm007
         LET g_errparam.replace[7] = p_xmdkdocno
         LET g_errparam.replace[8] = l_xmdmseq
         LET g_errparam.replace[9] = l_xmdmseq1
         LET l_extend = cl_getmsg('ain-00968',g_lang)
         LET l_extend = cl_getmsg('lib-00114',g_lang),g_site,"，",cl_getmsg('ain-00968',g_lang)
         IF NOT (l_success = 1 AND l_flag = 1) THEN
            IF l_flag = 2 THEN 
               LET g_errparam.code = 'sub-00633'
            ELSE
               LET g_errparam.code = 'sub-00145'
            END IF
            LET g_errparam.extend = l_extend
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            CONTINUE FOREACH
         END IF
            
      END IF 
      #171218-00024#2-e-add
         
      #更新庫存明細檔
      #料件编号,产品特征,库存管理特征,库位,储位,批号,
      #异动类型(1:入库,-1:出库,0:报废,2:盘点),异动数量,异动日期,
      #单据编号,项次,项序,单位,参考数量
      #扣帳or扣帳還原,營運據點
      CALL s_inventory_upd_inag(l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,
                                l_ope1,l_xmdm009,l_xmdk001,
                                p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm008,l_xmdm011,
                                l_flag,g_site) RETURNING r_success            #160419-00058#1 g_today 改為 l_xmdk001                             
      IF NOT r_success THEN         
        #EXIT FOREACH                  #161109-00037#1 mark
         LET r_success_chkALL = FALSE  #161109-00037#1 add
         CONTINUE FOREACH              #161109-00037#1 add
      END IF         

      IF p_cmd = 'post' THEN
         #更新庫存交易明細表
         #出入庫碼(1入庫-1出庫),單據編號,項次,項序,料件編號,產品特徵
         #庫位編號,儲位編號,批號,數量,單位,參考單位,參考數量           
         CALL s_axmt540_inaj_ins(l_ope1,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,
                                 l_xmdm001,l_xmdm002,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm033,
                                 l_xmdm009,l_xmdm008,l_xmdm010,l_xmdm011,l_xmdk001,l_xmdk007,l_xmdk002,l_xmdk004)
         RETURNING r_success            
         IF NOT r_success THEN
            LET r_success_chkALL = FALSE    #201224-00035#1 add
            EXIT FOREACH
         END IF
      END IF
      
      #若出貨性質為"簽收訂單出貨","調撥訂單","借貨訂單"
      IF l_xmdk002 = '3' OR l_xmdk002 = '4' OR l_xmdk002 = '8' THEN
         #檢查來源是否為成本倉
         CALL s_axmt540_inag012_chk(g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008)
         RETURNING l_type
                                       
         IF l_type = 'Y' THEN    #成本倉
            LET l_warehouse = l_xmdk039
         ELSE
            LET l_warehouse = l_xmdk040
         END IF

         #201030-00027#2 add -S
         #過帳處理庫存異動時,如為簽收訂單，且參數「走簽收流程，但依出貨認列發出商品否」=Y時，l_warehouse給在途非成本倉
#         IF cl_get_para(g_enterprise,g_site,'S-FIN-1003') = '4' AND cl_get_para(g_enterprise,g_site,'S-FIN-9029') = "Y" THEN #201216-00027#5 mark
         IF l_xmdk071 =  "Y" THEN   #201216-00027#5 add
            LET l_warehouse = l_xmdk040
         END IF
         #201030-00027#2 add -E

            #更新庫存明細檔
            #料件编号,产品特征,库存管理特征,库位,储位,批号,
            #异动类型(1:入库,-1:出库,0:报废,2:盘点),异动数量,异动日期,
            #单据编号,项次,项序,单位,参考数量
            #扣帳or扣帳還原,營運據點
            #CALL s_inventory_upd_inag(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,l_xmdm006,l_xmdm007,    #170117-00044#2 mod ' ' to l_xmdm033,l_xmdm006      #170309-00045#1 mark
            CALL s_inventory_upd_inag(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,' ',l_xmdm007,            #170309-00045#1 add
                                      #l_ope1,l_xmdm009,l_xmdk001,                                        #170331-00009#1 mark
                                      l_ope2,l_xmdm009,l_xmdk001,                                         #170331-00009#1 add
                                      p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm008,l_xmdm011,
                                      l_flag,g_site) RETURNING r_success      #160419-00058#1 g_today 改為 l_xmdk001       
         IF NOT r_success THEN
           #EXIT FOREACH                  #161109-00037#1 mark
            LET r_success_chkALL = FALSE  #161109-00037#1 add
            CONTINUE FOREACH              #161109-00037#1 add
         END IF
    
         IF p_cmd = 'post' THEN
            #200221-00005#1 add(s)
            IF NOT s_axmt540_inao_copy_4(p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_warehouse) THEN
               EXIT FOREACH
            END IF
            #200221-00005#1 add(e)
            #更新庫存交易明細表
            #出入庫碼(1入庫-1出庫),單據編號,項次,項序,料件編號,產品特徵
            #庫位編號,儲位編號,批號,數量,單位,參考單位,參考數量                  
            CALL s_axmt540_inaj_ins(l_ope2,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,
                                    #l_xmdm001,l_xmdm002,l_warehouse,l_xmdm006,l_xmdm007,l_xmdm033,   #170215-00050#1 mod      #170309-00045#1  mark                        ' ' to l_xmdm006,l_xmdm033
                                    l_xmdm001,l_xmdm002,l_warehouse,' ',l_xmdm007,l_xmdm033,    #170309-00045#1 add
                                    l_xmdm009,l_xmdm008,l_xmdm010,l_xmdm011,l_xmdk001,l_xmdk007,l_xmdk002,l_xmdk004)
            RETURNING r_success
            IF NOT r_success THEN
               LET r_success_chkALL = FALSE    #201224-00035#1 add
               EXIT FOREACH
            END IF
         END IF
      END IF
      
      #add by lixiang 2015/12/30---begin---
      #xmdk087=Y且xmdk002<>‘3’时，出货单过账产生2笔inaj，一笔从出货仓出掉（inaj036=调拨）、一笔入到发票仓（inaj036=调拨，储位预设为客户编号）
      #若出货单上库位为成本仓，发票仓取S-FIN-1005；
      #若出货单上库位为非成本仓，发票仓取S-FIN-1006
      #IF l_xmdk087 = 'Y' AND l_xmdk002 <> '3' THEN
      IF l_xmdk087 = 'Y' AND l_xmdk002 NOT MATCHES '[348]' THEN    #需再排除調撥訂單 和 借貨訂單
         #檢查來源是否為成本倉
         CALL s_axmt540_inag012_chk(g_site,l_xmdm001,l_xmdm002,l_xmdm033,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008)
         RETURNING l_type
         
         LET l_warehouse = ''         
         IF l_type = 'Y' THEN    #成本倉
            LET l_warehouse = cl_get_para(g_enterprise,g_site,'S-FIN-1005')
         ELSE
            LET l_warehouse = cl_get_para(g_enterprise,g_site,'S-FIN-1006')
         END IF
         
         IF NOT cl_null(l_warehouse) THEN
            #更新庫存明細檔
            #料件编号,产品特征,库存管理特征,库位,储位,批号,
            #异动类型(1:入库,-1:出库,0:报废,2:盘点),异动数量,异动日期,
            #单据编号,项次,项序,单位,参考数量
            #扣帳or扣帳還原,營運據點
            CALL s_inventory_upd_inag(l_xmdm001,l_xmdm002,l_xmdm033,l_warehouse,l_xmdk007,l_xmdm007,
                                      l_ope2,l_xmdm009,l_xmdk001,
                                      p_xmdkdocno,l_xmdmseq,l_xmdmseq1,l_xmdm008,l_xmdm011,
                                      l_flag,g_site) RETURNING r_success               #160419-00058#1 g_today 改為 l_xmdk001
            IF NOT r_success THEN
              #EXIT FOREACH                  #161109-00037#1 mark
               LET r_success_chkALL = FALSE  #161109-00037#1 add
               CONTINUE FOREACH              #161109-00037#1 add
            END IF
            
            IF p_cmd = 'post' THEN
               #更新庫存交易明細表
               #出入庫碼(1入庫-1出庫),單據編號,項次,項序,料件編號,產品特徵
               #庫位編號,儲位編號,批號,數量,單位,參考單位,參考數量                  
               CALL s_axmt540_inaj_ins(l_ope2,p_xmdkdocno,l_xmdmseq,l_xmdmseq1,
                                       l_xmdm001,l_xmdm002,l_warehouse,l_xmdk007,l_xmdm007,l_xmdm033,   
                                       l_xmdm009,l_xmdm008,l_xmdm010,l_xmdm011,l_xmdk001,l_xmdk007,l_xmdk002,l_xmdk004)
               RETURNING r_success
               IF NOT r_success THEN
                  LET r_success_chkALL = FALSE    #201224-00035#1 add
                  EXIT FOREACH
               END IF
            END IF
         END IF
      END IF
      #add by lixiang 2015/12/30---end---

   END FOREACH
                                                 
   CLOSE s_axmt540_cs20
   FREE s_axmt540_pre20 

   #161109-00037#1-(S) add
   IF NOT r_success_chkALL THEN
      LET r_success = FALSE
   END IF
   #161109-00037#1-(E) add
   
   IF NOT r_success THEN
      RETURN r_success
   END IF    

   IF p_cmd = 'unpos' THEN
      #刪除庫存交易明細
#      DELETE FROM inaj_t
#       WHERE inajent = g_enterprise
#         AND inaj001 = p_xmdkdocno
#      
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = "DELETE:"
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE                  
#      END IF         
     #170116-00044#2-s-add
     #若料號為費用性料號，不需異動庫儲批
     LET l_cnt = 0
     SELECT COUNT(1) INTO l_cnt
       FROM xmdl_t
       LEFT OUTER JOIN imaa_t ON imaaent = xmdlent AND imaa001 = xmdl008
      WHERE xmdlent = g_enterprise  AND xmdlsite = g_site 
        AND xmdldocno = p_xmdkdocno AND imaa004<>'E'
     IF l_cnt = 0 THEN
        RETURN r_success
     END IF
     #170116-00044#2-e-add
     #add by lixh 20151215
     DELETE FROM inao_t
      WHERE inaoent = g_enterprise
        AND inaodocno = p_xmdkdocno
        AND inao000 = '2'
        AND inao013 = '1'
     #add by lixh 20151215
      CALL s_inventory_del_inaj(p_xmdkdocno,g_site) RETURNING r_success
      
      IF NOT r_success THEN
          RETURN r_success
      END IF
      
   END IF
   #171219-00022#16 add by 09767-->s
   #背景执行ainp001,更新imai_t,inad_t程式段移至這邊處理，抓取indr_t所有資料進行更新
   INITIALIZE la_param.* TO NULL
   LET la_param.prog     = 'ainp001'
   LET la_param.background = 'Y'
   LET ls_js = util.JSON.stringify(la_param)
   CALL cl_cmdrun(ls_js)
   #171219-00022#16 add by 09767-->e
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 庫存交易明細新增
# Memo...........:
# Usage..........: CALL s_axmt540_inaj_ins(p_inaj004,p_xmdkdocno,p_xmdmseq,p_xmdmseq1,
#                                          p_xmdm001,p_xmdm002,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm033,
#                                          p_xmdm009,p_xmdm008,p_xmdm010,p_xmdm011,p_xmdk001,p_xmdk002,p_xmdk004)
#                  RETURNING r_success
# Input parameter: p_inaj004           #出入庫碼(1入庫-1出庫)
#                : p_xmdkdocno         #單據編號
#                : p_xmdmseq           #項次
#                : p_xmdmseq1          #項序
#                : p_xmdm001           #料件編號
#                : p_xmdm002           #產品特徵
#                : p_xmdm005           #庫位編號
#                : p_xmdm006           #儲位編號
#                : p_xmdm007           #批號
#                : p_xmdm033           #庫存管理特徵
#                : p_xmdm009           #數量
#                : p_xmdm008           #單位
#                : p_xmdm010           #參考單位
#                : p_xmdm011           #參考數量
#                : p_xmdk001           #扣帳日期
#                : p_xmdk007           #客戶編號
#                : p_xmdk002           #出貨性質
#                : p_xmdk004           #部門
# Return code....: r_success           #執行結果
#                : 
# Date & Author..: 140418 By earl
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_axmt540_inaj_ins(p_inaj004,p_xmdkdocno,p_xmdmseq,p_xmdmseq1,p_xmdm001,p_xmdm002,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm033,p_xmdm009,p_xmdm008,p_xmdm010,p_xmdm011,p_xmdk001,p_xmdk007,p_xmdk002,p_xmdk004)
   DEFINE p_inaj004        LIKE inaj_t.inaj004     #出入庫碼(1入庫,-1出庫)   
   DEFINE p_xmdkdocno      LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdmseq        LIKE xmdm_t.xmdmseq
   DEFINE p_xmdmseq1       LIKE xmdm_t.xmdmseq1
   DEFINE p_xmdm001        LIKE xmdm_t.xmdm001
   DEFINE p_xmdm002        LIKE xmdm_t.xmdm002
   DEFINE p_xmdm005        LIKE xmdm_t.xmdm005
   DEFINE p_xmdm006        LIKE xmdm_t.xmdm006
   DEFINE p_xmdm007        LIKE xmdm_t.xmdm007
   DEFINE p_xmdm033        LIKE xmdm_t.xmdm033
   DEFINE p_xmdm009        LIKE xmdm_t.xmdm009
   DEFINE p_xmdm008        LIKE xmdm_t.xmdm008
   DEFINE p_xmdm010        LIKE xmdm_t.xmdm010
   DEFINE p_xmdm011        LIKE xmdm_t.xmdm011
   DEFINE p_xmdk001        LIKE xmdk_t.xmdk001
   DEFINE p_xmdk007        LIKE xmdk_t.xmdk007
   DEFINE p_xmdk002        LIKE xmdk_t.xmdk002  #151101-00001#1
   DEFINE p_xmdk004        LIKE xmdk_t.xmdk004  #160328-00008#1
   DEFINE r_success        LIKE type_t.num5
   #161109-00085#48-s mod
   #DEFINE l_inao         RECORD LIKE inao_t.*   #161109-00085#48-s mark
   DEFINE l_inao         RECORD  #製造批序號庫存異動明細檔
          inaoent LIKE inao_t.inaoent, #企業編號
          inaosite LIKE inao_t.inaosite, #營運據點
          inaodocno LIKE inao_t.inaodocno, #單號
          inaoseq LIKE inao_t.inaoseq, #項次
          inaoseq1 LIKE inao_t.inaoseq1, #項序
          inaoseq2 LIKE inao_t.inaoseq2, #序號
          inao000 LIKE inao_t.inao000, #資料類型
          inao001 LIKE inao_t.inao001, #料件編號
          inao002 LIKE inao_t.inao002, #產品特徵
          inao003 LIKE inao_t.inao003, #庫存管理特徵
          inao004 LIKE inao_t.inao004, #包裝容器編號
          inao005 LIKE inao_t.inao005, #庫位
          inao006 LIKE inao_t.inao006, #儲位
          inao007 LIKE inao_t.inao007, #批號
          inao008 LIKE inao_t.inao008, #製造批號
          inao009 LIKE inao_t.inao009, #製造序號
          inao010 LIKE inao_t.inao010, #製造日期
          inao011 LIKE inao_t.inao011, #有效日期
          inao012 LIKE inao_t.inao012, #數量
          inao013 LIKE inao_t.inao013, #出入庫碼
          inaoud001 LIKE inao_t.inaoud001, #自定義欄位(文字)001
          inaoud002 LIKE inao_t.inaoud002, #自定義欄位(文字)002
          inaoud003 LIKE inao_t.inaoud003, #自定義欄位(文字)003
          inaoud004 LIKE inao_t.inaoud004, #自定義欄位(文字)004
          inaoud005 LIKE inao_t.inaoud005, #自定義欄位(文字)005
          inaoud006 LIKE inao_t.inaoud006, #自定義欄位(文字)006
          inaoud007 LIKE inao_t.inaoud007, #自定義欄位(文字)007
          inaoud008 LIKE inao_t.inaoud008, #自定義欄位(文字)008
          inaoud009 LIKE inao_t.inaoud009, #自定義欄位(文字)009
          inaoud010 LIKE inao_t.inaoud010, #自定義欄位(文字)010
          inaoud011 LIKE inao_t.inaoud011, #自定義欄位(數字)011
          inaoud012 LIKE inao_t.inaoud012, #自定義欄位(數字)012
          inaoud013 LIKE inao_t.inaoud013, #自定義欄位(數字)013
          inaoud014 LIKE inao_t.inaoud014, #自定義欄位(數字)014
          inaoud015 LIKE inao_t.inaoud015, #自定義欄位(數字)015
          inaoud016 LIKE inao_t.inaoud016, #自定義欄位(數字)016
          inaoud017 LIKE inao_t.inaoud017, #自定義欄位(數字)017
          inaoud018 LIKE inao_t.inaoud018, #自定義欄位(數字)018
          inaoud019 LIKE inao_t.inaoud019, #自定義欄位(數字)019
          inaoud020 LIKE inao_t.inaoud020, #自定義欄位(數字)020
          inaoud021 LIKE inao_t.inaoud021, #自定義欄位(日期時間)021
          inaoud022 LIKE inao_t.inaoud022, #自定義欄位(日期時間)022
          inaoud023 LIKE inao_t.inaoud023, #自定義欄位(日期時間)023
          inaoud024 LIKE inao_t.inaoud024, #自定義欄位(日期時間)024
          inaoud025 LIKE inao_t.inaoud025, #自定義欄位(日期時間)025
          inaoud026 LIKE inao_t.inaoud026, #自定義欄位(日期時間)026
          inaoud027 LIKE inao_t.inaoud027, #自定義欄位(日期時間)027
          inaoud028 LIKE inao_t.inaoud028, #自定義欄位(日期時間)028
          inaoud029 LIKE inao_t.inaoud029, #自定義欄位(日期時間)029
          inaoud030 LIKE inao_t.inaoud030, #自定義欄位(日期時間)030
          inao014 LIKE inao_t.inao014, #庫存單位
          inao020 LIKE inao_t.inao020, #檢驗合格量
          inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
          inao022 LIKE inao_t.inao022, #已驗退/簽退量
          inao023 LIKE inao_t.inao023, #已倉退/銷退量
          inao024 LIKE inao_t.inao024, #已轉QC量
          inao025 LIKE inao_t.inao025  #已退品量
                  END RECORD
   #161109-00085#48-e mod
   DEFINE l_sql            STRING
   DEFINE l_xmdk087        LIKE xmdk_t.xmdk087  #add by lixiang 2015/12/30
   DEFINE l_n              LIKE type_t.num5     #add by lixiang 2015/12/30

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF NOT cl_null(p_inaj004) OR
      NOT cl_null(p_xmdkdocno) OR
      NOT cl_null(p_xmdm001) OR
      NOT cl_null(p_xmdm005) OR
      NOT cl_null(p_xmdm009) OR
      NOT cl_null(p_xmdm008) THEN

      #更新庫存交易明細表
      INITIALIZE g_inaj.* TO NULL

      LET g_inaj.inajent = g_enterprise       #企業代碼          
      LET g_inaj.inajsite = g_site            #營運據點      
      LET g_inaj.inaj001 = p_xmdkdocno        #單據編號          
      LET g_inaj.inaj002 = p_xmdmseq          #項次                      
      LET g_inaj.inaj003 = p_xmdmseq1         #項序
      LET g_inaj.inaj004 = p_inaj004          #出入庫碼(1入庫,-1出庫)               
      LET g_inaj.inaj005 = p_xmdm001          #料件編號          
      LET g_inaj.inaj006 = p_xmdm002          #產品特徵          
      LET g_inaj.inaj007 = p_xmdm033          #庫存管理特徵      
      LET g_inaj.inaj008 = p_xmdm005          #庫位編號          
      LET g_inaj.inaj009 = p_xmdm006          #儲位編號         
      LET g_inaj.inaj010 = p_xmdm007          #批號                      
      LET g_inaj.inaj011 = p_xmdm009          #交易數量          
      LET g_inaj.inaj012 = p_xmdm008          #交易單位          
      #LET g_inaj.inaj013 = #元件有預設值      #交易單位與庫存單位換算率         
      #LET g_inaj.inaj014 = #元件有預設值      #交易單位與料件基本單位換算率     
      LET g_inaj.inaj015 = g_prog             #異動命令代號              
      #LET g_inaj.inaj016 =                   #理由碼                     
      LET g_inaj.inaj017 = p_xmdk004          #異動部門編號  #160328-00008#1
      LET g_inaj.inaj018 = p_xmdk007          #異動廠商/客戶編號  
      #LET g_inaj.inaj019 =                   #備註                       
      #LET g_inaj.inaj020 =                   #工單單號/料號            
      #LET g_inaj.inaj021 =                   #多角序號                 
      LET g_inaj.inaj022 = p_xmdk001          #單據扣帳日期
      LET g_inaj.inaj023 = cl_get_today()     #實際執行扣帳日期  
      LET g_inaj.inaj024 = cl_get_time()      #資料產生時間              
      LET g_inaj.inaj025 = g_user             #異動資料產生者
      LET g_inaj.inaj026 = p_xmdm010          #參考單位
      LET g_inaj.inaj027 = p_xmdm011          #參考數量
      #LET g_inaj.inaj028                     #成本料號
      #add by lixiang 2015/06/27---s----
      #LET g_inaj.inaj038 =  #專案編號
      #LET g_inaj.inaj039 =  #WBS    
      #SELECT xmdl030,xmdl031 INTO g_inaj.inaj038,g_inaj.inaj039 FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = p_xmdkdocno AND xmdlseq = p_xmdmseq #160629-00019#1 mark
      #add by lixiang 2015/06/27---e----
      #160629-00019#1--add--start--
      SELECT xmdl003,xmdl030,xmdl031,xmdl050  #160812-00014#1 add xmdl003
        INTO g_inaj.inaj044,g_inaj.inaj038,g_inaj.inaj039,g_inaj.inaj016  #160812-00014#1 add inaj044
        FROM xmdl_t 
       WHERE xmdlent = g_enterprise 
         AND xmdldocno = p_xmdkdocno 
         AND xmdlseq = p_xmdmseq
      #160629-00019#1--add--end----
      #151101-00001 by whiteny add start
      IF p_xmdk002 MATCHES '[348]' THEN   #170327-00082#1 add 8
         LET g_inaj.inaj036 = '401'           #調撥
      END IF
      #151101-00001 by whiteny add end
      
      #add by lixiang 2015/12/30---begin---
      #xmdk087=Y且xmdk002<>‘3’时，出货单过账产生2笔inaj，一笔从出货仓出掉（inaj036=调拨）、一笔入到发票仓（inaj036=调拨，储位预设为客户编号）
      SELECT xmdk087 INTO l_xmdk087 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = p_xmdkdocno
      #IF l_xmdk087 = 'Y' AND p_xmdk002 <> '3' THEN
      IF l_xmdk087 = 'Y' AND p_xmdk002 NOT MATCHES '[348]' THEN    #需再排除調撥訂單 和 借貨訂單
         LET g_inaj.inaj036 = '401'           #調撥
         
         #將inao的資料也同步更新，入到發票倉
         #161109-00085#48-s mod
#         LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
         LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                              inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                              inao020,inao021,inao022,inao023,inao024,inao025 
                         FROM inao_t ",
         #161109-00085#48-e mod
                     "  WHERE inaoent = '",g_enterprise,"'",
                     "    AND inaodocno = '",p_xmdkdocno,"'",
                     "    AND inaoseq = '",p_xmdmseq,"'",
                     "    AND inaoseq1 = '",p_xmdmseq1,"'",
                     #PGS(D)-13130 memo -S-
                     #"    AND inao000 = 2 ",
                     "    AND inao000 = '2' ",
                     #PGS(D)-13130 memo -E-
                     "    AND inao013 = '-1' "
         PREPARE s_axmt540_inao_pre9 FROM l_sql
         DECLARE s_axmt540_inao_cur9 CURSOR FOR s_axmt540_inao_pre9
         #161109-00085#48-s mod
#         FOREACH s_axmt540_inao_cur9 INTO l_inao.*   #161109-00085#48-s mark
         FOREACH s_axmt540_inao_cur9 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                          l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                          l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                          l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                          l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                          l_inao.inao024,l_inao.inao025
         #161109-00085#48-e mod         
         
            LET l_inao.inao013 = p_inaj004
            LET l_inao.inao005 = p_xmdm005
            LET l_inao.inao006 = p_xmdm006
            LET l_inao.inao007 = p_xmdm007
            
            LET l_n = 0
            SELECT COUNT(*) INTO l_n FROM inao_t 
               WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno AND inaoseq = l_inao.inaoseq AND inaoseq1 = l_inao.inaoseq1
                 AND inao013 = p_inaj004 AND inaoseq2 = l_inao.inaoseq2
            IF l_n = 0 OR cl_null(l_n) THEN
            
               INSERT INTO inao_t(inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                                  inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,
                                  inao014,inao020,inao021,inao022,inao023,inao024)
                      VALUES(g_enterprise,g_site,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                             l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                             l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                             l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                             l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                             l_inao.inao024) 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "ins inao_t:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()         
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF   
            END IF               
         END FOREACH 
      END IF
      #add by lixiang 2015/12/30---end---  
      
      #add by lixh 20151215  
      #IF p_xmdk002 = '3' AND p_inaj004 = '1' THEN   #簽收訂單   #入庫 #190730-00009#1 mark
      IF (p_xmdk002 = '3' OR p_xmdk002 = '8') AND p_inaj004 = '1' THEN   #簽收訂單 OR 借貨出貨 #入庫 #190730-00009#1 add
         #161109-00085#48-s mod
#         LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
         LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                              inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                              inao020,inao021,inao022,inao023,inao024,inao025 
                         FROM inao_t ",
         #161109-00085#48-e mod
                     "  WHERE inaoent = '",g_enterprise,"'",
                     "    AND inaodocno = '",p_xmdkdocno,"'",
                     "    AND inaoseq = '",p_xmdmseq,"'",
                     "    AND inaoseq1 = '",p_xmdmseq1,"'",
                     "    AND inao000 = 2 ",
                     "    AND inao013 = '-1' "
         PREPARE s_axmt540_inao_pre8 FROM l_sql
         DECLARE s_axmt540_inao_cur8 CURSOR FOR s_axmt540_inao_pre8  
         #161109-00085#48-s mod
#         FOREACH s_axmt540_inao_cur8 INTO l_inao.*   #161109-00085#48-s mark
         FOREACH s_axmt540_inao_cur8 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                          l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                          l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                          l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                          l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                          l_inao.inao024,l_inao.inao025
         #161109-00085#48-e mod
         
            LET l_inao.inao013 = p_inaj004
            LET l_inao.inao005 = p_xmdm005
            #LET l_inao.inao006 = p_xmdm006   #170309-00045#1 mark 
            LET l_inao.inao006 = ' '           #170309-00045#1 add
            LET l_inao.inao007 = p_xmdm007
            
            #200511-00030#1 add -s
             LET l_n = 0
            SELECT COUNT(*) INTO l_n FROM inao_t 
               WHERE inaoent = g_enterprise AND inaodocno = p_xmdkdocno AND inaoseq = l_inao.inaoseq AND inaoseq1 = l_inao.inaoseq1
                 AND inao013 = p_inaj004 AND inaoseq2 = l_inao.inaoseq2
            IF l_n = 0 OR cl_null(l_n) THEN
            #200511-00030#1 add -e
               INSERT INTO inao_t(inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                                  inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,
                                  inao014,inao020,inao021,inao022,inao023,inao024)
                      VALUES(g_enterprise,g_site,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                             l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                             l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                             l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                             l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                             l_inao.inao024) 
   
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "ins inao_t:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()         
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF   
            END IF     #200511-00030#1 add           
         END FOREACH 
      END IF
      #add by lixh 20151215
      #190606-00023#1---mark---s      
#      #171218-00024#2-s-add
#      #多角續拋/正拋，因還沒有入庫，先不用檢查庫存
#      IF g_aic_continue OR g_aic_direct THEN
#      
#      ELSE
#      #171218-00024#2-e-add
      #190606-00023#1---mark--e
       IF r_success = TRUE THEN  #200511-00030#1 add
         CALL s_inventory_ins_inaj(g_site) RETURNING r_success
       END IF                    #200511-00030#1 add
#      END IF #171218-00024#2-add               #190606-00023#1---mark
   END IF 
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 出貨量回寫訂單更新
# Memo...........:
# Usage..........: CALL s_axmt540_xmdd_upd(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno  單據單號
#                : 
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 140417 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdd_upd(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5  
   DEFINE l_sql           STRING
   DEFINE l_num           LIKE type_t.num5
   DEFINE l_xmdk002       LIKE xmdk_t.xmdk002
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006   
   DEFINE l_xmdl018       LIKE xmdl_t.xmdl018

   DEFINE l_xmda045       LIKE xmda_t.xmda045 #物流結案
   DEFINE l_xmdc045       LIKE xmdc_t.xmdc045 #行狀態


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_null(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   #統銷統收產生之出貨單不做回寫動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   LET l_sql = "SELECT xmdl003,xmdl004,xmdl005,xmdl006 ",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent",
               "   AND xmdlent = ",g_enterprise,
               "   AND xmdkdocno = xmdldocno",
               "   AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre17 FROM l_sql
   DECLARE s_axmt540_cs17 CURSOR FOR s_axmt540_pre17

   LET l_sql = "SELECT SUM(xmdl018)",
               "  FROM xmdk_t a,xmdl_t",
               " WHERE a.xmdkent = xmdlent",
               "   AND a.xmdkdocno = xmdldocno",
               "   AND xmdlent = '",g_enterprise,"'",
               "   AND xmdl003 = ?",
               "   AND xmdl004 = ?",
               "   AND xmdl005 = ?",
               "   AND xmdl006 = ?",
               "   AND a.xmdkstus = 'S'",
               "   AND a.xmdk000 = '1'",    #出貨單
               #180802-00058#1-s-mark
               #"   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
               #"                                          FROM xmdk_t b",
               #"                                         WHERE b.xmdkent = a.xmdkent",
               #"                                           AND b.xmdkdocno = a.xmdk035",
               #"                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
               #180802-00058#1-e-mark
               #180802-00058#1-s-add
               "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1 ",
               "                                          FROM xmdc_t,xmdd_t ",                                    
               "                                         WHERE xmdcent = xmddent AND xmdcdocno = xmdddocno ", 
               "                                           AND xmdcent = xmdlent AND xmdddocno = xmdl003 ",
               "                                           AND xmddseq = xmdl004 AND xmddseq1=xmdl005 ",
                                                                               #出貨單與訂單同據點，是初始站的出貨單
               "                                           AND xmddseq2=xmdl006  AND xmdcsite=a.xmdksite )) " #排除統銷統收之初始站出貨單
               #180802-00058#1-e-add
   PREPARE s_axmt540_pre18 FROM l_sql

  #160805-00004#1-s-mark
  #LET l_sql = "SELECT DISTINCT xmdk002,",
  #            "                xmdl003,xmdl004",
  #            "  FROM xmdk_t,xmdl_t",
  #            " WHERE xmdkent = xmdlent",
  #            "   AND xmdlent = ",g_enterprise,
  #            "   AND xmdkdocno = xmdldocno",
  #            "   AND xmdldocno = '",p_xmdkdocno,"'"
  #PREPARE s_axmt540_pre34 FROM l_sql
  #DECLARE s_axmt540_cs34 CURSOR FOR s_axmt540_pre34
  #
  #LET l_sql = "SELECT COUNT(xmddseq2)",
  #            "  FROM xmdd_t",
  #            " WHERE xmddent = ",g_enterprise,
  #            "   AND xmdddocno = ?",
  #            "   AND xmddseq = ?",
  #            "   AND xmdd006 > xmdd014"
  #PREPARE s_axmt540_pre35 FROM l_sql 
  #
  #LET l_sql = "SELECT DISTINCT xmdk002,xmdl003",
  #            "  FROM xmdk_t,xmdl_t",
  #            " WHERE xmdkent = xmdlent",
  #            "   AND xmdlent = ",g_enterprise,
  #            "   AND xmdkdocno = xmdldocno",
  #            "   AND xmdldocno = '",p_xmdkdocno,"'"
  #PREPARE s_axmt540_pre36 FROM l_sql
  #DECLARE s_axmt540_cs36 CURSOR FOR s_axmt540_pre36
  #
  #LET l_sql = "SELECT COUNT(xmdcseq)",
  #            "  FROM xmdc_t",
  #            " WHERE xmdcent = ",g_enterprise,
  #            "   AND xmdcdocno = ?",
  #            "   AND xmdc045 = '1'"
  #PREPARE s_axmt540_pre37 FROM l_sql
  #160805-00004#1-e-mark
  
   FOREACH s_axmt540_cs17 INTO l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl003) OR cl_null(l_xmdl004) OR cl_null(l_xmdl005) OR cl_null(l_xmdl006) THEN
         CONTINUE FOREACH
      END IF

      EXECUTE s_axmt540_pre18 USING l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006 INTO l_xmdl018
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
   
      IF cl_null(l_xmdl018) THEN
         LET l_xmdl018 = 0
      END IF
      
      #170427-00007#4-s-add
      CALL s_axmt540_cursor()
      OPEN s_axmt540_cl USING g_enterprise,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_axmt540_cl:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CLOSE s_axmt540_cl
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      #170427-00007#4-e-add
      
      UPDATE xmdd_t
         SET xmdd014 = l_xmdl018
       WHERE xmddent = g_enterprise
         AND xmdddocno = l_xmdl003
         AND xmddseq = l_xmdl004
         AND xmddseq1 = l_xmdl005
         AND xmddseq2 = l_xmdl006
      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH
   
   CLOSE s_axmt540_cl   #170427-00007#4-add
   CLOSE s_axmt540_cs17
   FREE s_axmt540_pre17 
   FREE s_axmt540_pre18  

    

   IF NOT r_success THEN
      RETURN r_success
   END IF
   
  #160805-00004#1-s-mark(改至拋轉完多角後，再做結案) 
  #FOREACH s_axmt540_cs34 INTO l_xmdk002,
  #                            l_xmdl003,l_xmdl004
  #   IF SQLCA.sqlcode THEN
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = SQLCA.sqlcode
  #      LET g_errparam.extend = "FOREACH:"
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #      LET r_success = FALSE
  #      EXIT FOREACH
  #   END IF
  #   
  #   IF cl_null(l_xmdl003) OR cl_null(l_xmdl004) THEN
  #      CONTINUE FOREACH
  #   END IF
  #  
  #   #非"簽收訂單","借貨訂單" 訂單項次的訂單量是否已經全數出貨，若是將訂單項次對應的狀態碼(xmdc045)更新為'結案'(2)
  #   IF l_xmdk002 <> '3' AND l_xmdk002 <> '8' THEN
  #       
  #      EXECUTE s_axmt540_pre35 USING l_xmdl003,l_xmdl004
  #      INTO l_num
  #     
  #      IF SQLCA.sqlcode THEN
  #         INITIALIZE g_errparam TO NULL
  #         LET g_errparam.code = SQLCA.sqlcode
  #         LET g_errparam.extend = "EXECUTE:"
  #         LET g_errparam.popup = TRUE
  #         CALL cl_err()
  #         LET r_success = FALSE
  #         EXIT FOREACH
  #      END IF
  #     #160523-00018#5-s-add
  #      IF l_num > 0 THEN        #未全數出貨
  #         #取消結案
  #         IF NOT s_axmp510_xmdc045_unclosed(l_xmdl003,l_xmdl004,g_site) THEN
  #            LET r_success = FALSE
  #            EXIT FOREACH             
  #         END IF         
  #      ELSE
  #         IF NOT s_axmp510_xmdc045_closed('1',l_xmdl003,l_xmdl004,'',g_site) THEN
  #            LET r_success = FALSE
  #            EXIT FOREACH        
  #         END IF 
  #      END IF         
  #     #160523-00018#5-e-add 
  #     #160523-00018#5-s-mark
  #     #IF l_num > 0 THEN        #未全數出貨
  #     #   LET l_xmdc045 = '1'   #一般            
  #     #ELSE
  #     #   LET l_xmdc045 = '2'   #正常結案
  #     #END IF          
  #     #UPDATE xmdc_t
  #     #   SET xmdc045 = l_xmdc045
  #     # WHERE xmdcent = g_enterprise
  #     #   AND xmdcdocno = l_xmdl003
  #     #   AND xmdcseq = l_xmdl004
  #     #
  #     #IF SQLCA.sqlcode THEN
  #     #   INITIALIZE g_errparam TO NULL
  #     #   LET g_errparam.code = SQLCA.sqlcode
  #     #   LET g_errparam.extend = "UPDATE:"
  #     #   LET g_errparam.popup = TRUE
  #     #   CALL cl_err()
  #     #
  #     #   LET r_success = FALSE
  #     #   EXIT FOREACH
  #     #END IF
  #     #160523-00018#5-e-mark 
  #   END IF          
  #END FOREACH
  #
  #
  #CLOSE s_axmt540_cs34
  #FREE s_axmt540_pre34 
  #FREE s_axmt540_pre35
  #
  #IF NOT r_success THEN
  #   RETURN r_success
  #END IF
  #
  #
  ##且若該訂單所有項次的狀態均已結案時，訂單單頭的物流捷案(xmda045)也須更新為'Y'
  #FOREACH s_axmt540_cs36 INTO l_xmdk002,l_xmdl003
  #   IF SQLCA.sqlcode THEN
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = SQLCA.sqlcode
  #      LET g_errparam.extend = "FOREACH:"
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #
  #      LET r_success = FALSE
  #      EXIT FOREACH
  #   END IF
  #
  #   IF cl_null(l_xmdl003) THEN
  #      CONTINUE FOREACH
  #   END IF
  #
  #   #非"簽收訂單","借貨訂單"
  #   IF l_xmdk002 <> '3' AND l_xmdk002 <> '8' THEN
  #     EXECUTE s_axmt540_pre37 USING l_xmdl003 INTO l_num
  #
  #      IF SQLCA.sqlcode THEN
  #         INITIALIZE g_errparam TO NULL
  #         LET g_errparam.code = SQLCA.sqlcode
  #         LET g_errparam.extend = "EXECUTE:"
  #         LET g_errparam.popup = TRUE
  #         CALL cl_err()
  #
  #         LET r_success = FALSE
  #         EXIT FOREACH
  #      END IF
  #
  #      IF l_num = 0 THEN   #單身已全都結案
  #         LET l_xmda045 = 'Y'
  #      ELSE
  #         LET l_xmda045 = 'N'
  #      END IF
  #
  #      UPDATE xmda_t
  #         SET xmda045 = l_xmda045
  #       WHERE xmdaent = g_enterprise
  #         AND xmdadocno = l_xmdl003
  #
  #      IF SQLCA.sqlcode THEN
  #         INITIALIZE g_errparam TO NULL
  #         LET g_errparam.code = SQLCA.sqlcode
  #         LET g_errparam.extend = "UPDATE:"
  #         LET g_errparam.popup = TRUE
  #         CALL cl_err()
  #  
  #         LET r_success = FALSE
  #         EXIT FOREACH
  #      END IF
  #
  #   END IF
  #END FOREACH
  #
  #CLOSE s_axmt540_cs36
  #FREE s_axmt540_pre36
  #FREE s_axmt540_pre37
  #
  #IF NOT r_success THEN
  #   RETURN r_success
  #END IF
  #160805-00004#1-e-mark((改至拋轉完多角後，再做結案))

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢查是否為成本庫
# Memo...........:
# Usage..........: CALL axmt580_inag012_chk(p_inagsite,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007)
#                  RETURNING 回传参数
# Input parameter: p_inagsite  營運據點
#                : p_inag001   料件編號
#                : p_inag002   產品特徵
#                : p_inag003   庫存管理特徵
#                : p_inag004   庫位編號
#                : p_inag005   儲位編號
#                : p_inag006   批號
#                : p_inag007   庫存單位
# Return code....: r_inag012   Y(成本庫)/N(非成本庫)
#                : 
# Date & Author..: 140410 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inag012_chk(p_inagsite,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007)
   DEFINE p_inagsite   LIKE inag_t.inagsite
   DEFINE p_inag001    LIKE inag_t.inag001
   DEFINE p_inag002    LIKE inag_t.inag002
   DEFINE p_inag003    LIKE inag_t.inag003
   DEFINE p_inag004    LIKE inag_t.inag004
  #DEFINE p_inag005    LIKE inag_t.inag015  #161109-00037#1 mark
   DEFINE p_inag005    LIKE inag_t.inag005  #161109-00037#1 add
   DEFINE p_inag006    LIKE inag_t.inag006
   DEFINE p_inag007    LIKE inag_t.inag007
   DEFINE r_inag012    LIKE inag_t.inag012

   WHENEVER ERROR CONTINUE

   #可能為Null欄位補空白
   IF cl_null(p_inag002) THEN LET p_inag002 = ' ' END IF
   IF cl_null(p_inag003) THEN LET p_inag003 = ' ' END IF
   IF cl_null(p_inag005) THEN LET p_inag005 = ' ' END IF
   IF cl_null(p_inag006) THEN LET p_inag006 = ' ' END IF

   LET r_inag012 = ''

   SELECT inag012 INTO r_inag012
     FROM inag_t
    WHERE inagent = g_enterprise
      AND inagsite = p_inagsite
      AND inag001 = p_inag001
      AND inag002 = p_inag002
      AND inag003 = p_inag003
      AND inag004 = p_inag004
      AND inag005 = p_inag005
      AND inag006 = p_inag006
      AND inag007 = p_inag007
      
   IF cl_null(r_inag012) THEN
      #庫位基本資料
      SELECT inaa010 INTO r_inag012
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = p_inagsite
         AND inaa001 = p_inag004
   END IF   
   
   IF cl_null(r_inag012) THEN
      LET r_inag012 = 'N'
   END IF
   
   RETURN r_inag012
END FUNCTION

################################################################################
# Descriptions...: 整合用的「確認」功能應用元件s_[主程式]_ws_confirm()
# Memo...........:
# Usage..........: CALL s_axmt540_ws_confirm(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單據單號
#                : 
# Return code....: r_success      處理狀態
#                : 
# Date & Author..: 140606 By Emma
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_ws_confirm(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   #確認前檢核段
   CALL s_axmt540_conf_chk(p_xmdkdocno) RETURNING r_success
   IF r_success THEN
      #確認交易處理段
      CALL s_axmt540_conf_upd(p_xmdkdocno) RETURNING r_success
   END IF
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 帶出匯率
# Memo...........:
# Usage..........: CALL s_axmt540_get_exchange(p_xmdk042,p_xmdk016,p_date)
#                  RETURNING r_xmdk017
# Input parameter: p_xmdk042       內外銷
#                : p_xmdk016       幣別
#                : p_date          匯率基準日
# Return code....: r_xmdk017       匯率
#                : 
# Date & Author..: 140703 By earl
# Modify.........: 151118-00012#1 By shiun   增加傳入參數"匯率基準日"
################################################################################
PUBLIC FUNCTION s_axmt540_get_exchange(p_xmdk042,p_xmdk016,p_date)
   DEFINE p_xmdk042          LIKE xmdk_t.xmdk042    #內外銷
   DEFINE p_xmdk016          LIKE xmdk_t.xmdk016    #幣別
   DEFINE p_date             LIKE xmdk_t.xmdkdocdt  #匯率基準日
   DEFINE r_xmdk017          LIKE xmdk_t.xmdk017    #匯率

   DEFINE l_para_data        LIKE type_t.chr80
   DEFINE l_ooef016          LIKE ooef_t.ooef016
   DEFINE l_exchange         LIKE xmdk_t.xmdk017
   
   WHENEVER ERROR CONTINUE

   LET r_xmdk017 = ''

   IF cl_null(p_xmdk042) OR cl_null(p_xmdk016) THEN
      RETURN r_xmdk017     #直接讓匯率為空
   END IF
   
   #170326-00004#3 by sakura add(S)
   #判斷傳入的幣別與ooef016相同,則自動匯率給1
   LET l_ooef016 = ''
   SELECT ooef016 INTO l_ooef016
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site
   IF p_xmdk016 = l_ooef016 THEN
      LET r_xmdk017 = 1
      RETURN r_xmdk017
   END IF
   #170326-00004#3 by sakura add(E)   

   LET l_para_data = ''
   CASE p_xmdk042
      WHEN '1'  #內銷外幣採用匯率類型
         CALL cl_get_para(g_enterprise,g_site,'S-BAS-0010') RETURNING l_para_data
      WHEN '2'  #外銷外幣採用匯率類型
         CALL cl_get_para(g_enterprise,g_site,'S-BAS-0011') RETURNING l_para_data
   END CASE

   IF cl_null(l_para_data) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00363'  #查無外幣採用匯率類型！
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_xmdk017
   ELSE
      #取本幣
      LET l_ooef016 = ''
      SELECT ooef016 INTO l_ooef016
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_site
          
      #取匯率
      #add--151118-00012#1 By shiun--(S)
      IF cl_null(p_date) THEN
         LET p_date = g_today
      END IF
      #add--151118-00012#1 By shiun--(E)
      CALL s_aooi160_get_exrate('1',g_site,p_date,p_xmdk016,l_ooef016,0,l_para_data) RETURNING l_exchange   #modify--151118-00012#1 By shiun   g_today改成p_date
         
      LET r_xmdk017 = l_exchange
   END IF
   
   RETURN r_xmdk017
END FUNCTION

################################################################################
# Descriptions...: SELECT客戶編號值
# Memo...........: 自動SELECT客戶預設資料
# Usage..........: CALL s_axmt540_client_default(p_xmdk007,p_xmdk003,p_xmdk004)
#                  RETURNING r_xmdk.*
# Input parameter: p_xmdk007     #訂單客戶
#                : p_xmdk003     #業務人員
#                : p_xmdk004     #業務部門
# Return code....: r_xmdk.*     
#                : (xmdk010             LIKE xmdk_t.xmdk010,   #收款條件
#                :  xmdk011             LIKE xmdk_t.xmdk011,   #交易條件
#                :  xmdk012             LIKE xmdk_t.xmdk012,   #稅別
#                :  xmdk015             LIKE xmdk_t.xmdk015,   #發票類型
#                :  xmdk016             LIKE xmdk_t.xmdk016,   #幣別
#                :  xmdk018             LIKE xmdk_t.xmdk018,   #取價方式
#                :  xmdk022             LIKE xmdk_t.xmdk022,   #運輸方式
#                :  xmdk023             LIKE xmdk_t.xmdk023,   #交運起點
#                :  xmdk024             LIKE xmdk_t.xmdk024,   #交運終點
#                :  xmdk030             LIKE xmdk_t.xmdk030,   #銷售通路
#                :  xmdk031             LIKE xmdk_t.xmdk031    #銷售分類)
# Date & Author..: 140622 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_client_default(p_xmdk007,p_xmdk003,p_xmdk004)
   DEFINE p_xmdk007       LIKE xmdk_t.xmdk007   #訂單客戶
   DEFINE p_xmdk003       LIKE xmdk_t.xmdk003   #業務人員
   DEFINE p_xmdk004       LIKE xmdk_t.xmdk004   #業務部門

   DEFINE r_xmdk       RECORD
      xmdk003             LIKE xmdk_t.xmdk003,   #業務人員   #2015/03/04 by stellar add
      xmdk004             LIKE xmdk_t.xmdk004,   #業務部門   #2015/03/04 by stellar add
      xmdk010             LIKE xmdk_t.xmdk010,   #收款條件
      xmdk011             LIKE xmdk_t.xmdk011,   #交易條件
      xmdk012             LIKE xmdk_t.xmdk012,   #稅別
      xmdk015             LIKE xmdk_t.xmdk015,   #發票類型
      xmdk016             LIKE xmdk_t.xmdk016,   #幣別
      xmdk018             LIKE xmdk_t.xmdk018,   #取價方式
      xmdk022             LIKE xmdk_t.xmdk022,   #運輸方式
      xmdk023             LIKE xmdk_t.xmdk023,   #交運起點
      xmdk024             LIKE xmdk_t.xmdk024,   #交運終點
      xmdk030             LIKE xmdk_t.xmdk030,   #銷售通路
      xmdk031             LIKE xmdk_t.xmdk031,   #銷售分類
      xmdk042             LIKE xmdk_t.xmdk042,   #內外銷
      xmdk043             LIKE xmdk_t.xmdk043    #取匯率方式
                       END RECORD

   DEFINE l_success       LIKE type_t.num5
   DEFINE l_search        LIKE type_t.chr1
   DEFINE l_controlno     LIKE ooha_t.ooha001
   DEFINE l_pmaa096       LIKE pmaa_t.pmaa096   #預設業務員   #2015/03/03 by stellar add
   DEFINE l_pmaa097       LIKE pmaa_t.pmaa097   #預設業務部門 #2015/03/03 by stellar add
   
   WHENEVER ERROR CONTINUE

   INITIALIZE r_xmdk.* TO NULL
   LET l_search = 'N'

   IF NOT cl_null(p_xmdk007) THEN
      LET l_success = ''
      LET l_controlno = ''

#      IF NOT cl_null(p_xmdk003) AND NOT cl_null(p_xmdk004) THEN   #2015/03/04 by stellar mark
         #控制組編號
         #2015/03/04 by stellar modify ----- (S)
#         CALL s_control_get_group('2',p_xmdk003,p_xmdk004) RETURNING l_success,l_controlno
         CALL s_control_get_group('2',g_user,g_dept) RETURNING l_success,l_controlno
         #2015/03/04 by stellar modify ----- (E)


      #150721-00001 160115 By earl mod s
      CALL s_apmm101_default_pmab('2',l_controlno,g_site,p_xmdk007) RETURNING g_pmab.*

      LET r_xmdk.xmdk010 = g_pmab.pmab037
      LET r_xmdk.xmdk011 = g_pmab.pmab053
      LET r_xmdk.xmdk012 = g_pmab.pmab034
      LET r_xmdk.xmdk015 = g_pmab.pmab056
      LET r_xmdk.xmdk016 = g_pmab.pmab033
      LET r_xmdk.xmdk018 = g_pmab.pmab054
      LET r_xmdk.xmdk022 = g_pmab.pmab040
      LET r_xmdk.xmdk023 = g_pmab.pmab041
      LET r_xmdk.xmdk024 = g_pmab.pmab042
      LET r_xmdk.xmdk030 = g_pmab.pmab038
      LET r_xmdk.xmdk031 = g_pmab.pmab039
      LET r_xmdk.xmdk042 = g_pmab.pmab057
      LET r_xmdk.xmdk043 = g_pmab.pmab058
      LET r_xmdk.xmdk003 = g_pmab.pmab031
      LET r_xmdk.xmdk004 = g_pmab.pmab059

#         #判斷客戶是否有設置訂單控制組客戶預設條件(axmi111)，若有則抓取相關的預設條件      
#         IF l_success THEN
#            SELECT xmae006,xmae020,xmae004,xmae022,xmae003,
#                   xmae021,xmae011,xmae012,xmae013,xmae008,
#                   xmae009,
#                   xmae023,xmae024
#                  ,xmae019,xmae025   #2015/03/04 by stellar add
#              INTO r_xmdk.xmdk010,r_xmdk.xmdk011,r_xmdk.xmdk012,r_xmdk.xmdk015,r_xmdk.xmdk016,
#                   r_xmdk.xmdk018,r_xmdk.xmdk022,r_xmdk.xmdk023,r_xmdk.xmdk024,r_xmdk.xmdk030,
#                   r_xmdk.xmdk031,
#                   r_xmdk.xmdk042,r_xmdk.xmdk043
#                  ,r_xmdk.xmdk003,r_xmdk.xmdk004   #2015/03/04 by stellar
#              FROM xmae_t
#             WHERE xmaeent = g_enterprise
#               AND xmae001 = p_xmdk007
#               AND xmae002 = l_controlno
#               
#             IF NOT SQLCA.sqlcode THEN   #有找到資料
#                LET l_search = 'Y'                
#             END IF
#         END IF
##      END IF   #2015/03/04 by stellar mark
#      
#      IF l_search = 'N' THEN             #改抓客戶據點預設條件(axmm202)資料
#         SELECT pmab087,pmab103,pmab084,pmab106,pmab083,
#                pmab104,pmab090,pmab091,pmab092,pmab088,
#                pmab089,
#                pmab107,pmab108
#               ,pmab081,pmab109   #2015/03/04 by stellar add
#           INTO r_xmdk.xmdk010,r_xmdk.xmdk011,r_xmdk.xmdk012,r_xmdk.xmdk015,r_xmdk.xmdk016,
#                r_xmdk.xmdk018,r_xmdk.xmdk022,r_xmdk.xmdk023,r_xmdk.xmdk024,r_xmdk.xmdk030,
#                r_xmdk.xmdk031,
#                r_xmdk.xmdk042,r_xmdk.xmdk043
#               ,r_xmdk.xmdk003,r_xmdk.xmdk004   #2015/03/04 by stellar add
#           FROM pmab_t
#          WHERE pmabent = g_enterprise            
#            AND pmabsite = g_site
#            AND pmab001 = p_xmdk007
#      END IF
#      
#      #2015/03/04 by stellar add ----- (S)
#      IF cl_null(r_xmdk.xmdk003) OR cl_null(r_xmdk.xmdk004) THEN
#         LET l_pmaa096 = ''
#         LET l_pmaa097 = ''
#         SELECT pmaa096,pmaa097 INTO l_pmaa096,l_pmaa097
#           FROM pmaa_t
#          WHERE pmaaent = g_enterprise
#            AND pmaa001 = p_xmdk007
#            
#         IF cl_null(r_xmdk.xmdk003) THEN
#            LET r_xmdk.xmdk003 = l_pmaa096
#         END IF
#         
#         IF cl_null(r_xmdk.xmdk004) THEN
#            LET r_xmdk.xmdk004 = l_pmaa097
#         END IF
#      END IF
#      
#      IF NOT cl_null(r_xmdk.xmdk003) AND cl_null(r_xmdk.xmdk004) THEN
#         SELECT ooag003 INTO r_xmdk.xmdk004
#           FROM ooag_t 
#          WHERE ooagent = g_enterprise 
#            AND ooag001 = r_xmdk.xmdk003
#      END IF
#      
#      IF cl_null(r_xmdk.xmdk003) THEN
#         #LET r_xmdk.xmdk003 = p_xmdk003  #150415---earl---mark
#         LET r_xmdk.xmdk003 = g_user
#      END IF
#      
#      IF cl_null(r_xmdk.xmdk004) THEN
#         #LET r_xmdk.xmdk004 = p_xmdk004  #150415---earl---mark
#         LET r_xmdk.xmdk004 = g_dept
#      END IF
#      #2015/03/04 by stellar add ----- (E)
      #150721-00001 160115 By earl mod e
   END IF
   
   RETURN r_xmdk.*
END FUNCTION

################################################################################
# Descriptions...: 查詢交易夥伴資料
# Memo...........:
# Usage..........: CALL s_axmt540_client_partner(p_xmdkdocno,p_xmdk007,p_type)
#                  RETURNING r_client_par
# Input parameter: p_xmdkdocno    單據單號
#                : p_xmdk007      訂單客戶
#                : p_type         交易類型(1.收付款對象2.出貨對象)
# Return code....: r_client_par   交易夥伴對象
#                : 
# Date & Author..: 140622 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_client_partner(p_xmdkdocno,p_xmdk007,p_type)
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno #單據單號
   DEFINE p_xmdk007     LIKE xmdk_t.xmdk007   #訂單客戶
   DEFINE p_type        LIKE pmac_t.pmac003   #交易類型(1.收付款對象,2.出貨對象,3.發票對象)
   
   DEFINE r_client_par  LIKE xmdk_t.xmdk008   #交易夥伴
   
   DEFINE l_sql         STRING   
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_where       STRING 
   DEFINE l_pmac002     LIKE pmac_t.pmac002

   WHENEVER ERROR CONTINUE
   
   LET r_client_par = ''

   IF NOT cl_null(p_xmdk007) THEN
      LET l_sql = "SELECT pmac002 FROM pmab_t,pmac_t",
                  " WHERE pmabent = pmacent AND pmacent = ",g_enterprise,
                  "   AND pmac001 = '",p_xmdk007,"'",
                  "   AND pmac003 = '",p_type,"'",
                  "   AND pmabsite = '",g_site,"'",
                  "   AND pmac004 = 'Y'",     #150917-00025:1 改為只抓主要
                  "   AND pmab001 = pmac002",
                  " ORDER BY pmac004 DESC,pmac002"
      PREPARE client_pre FROM l_sql
      DECLARE client_cur SCROLL CURSOR FOR client_pre

      LET l_pmac002 = ''
      OPEN client_cur
      FETCH FIRST client_cur INTO l_pmac002
      
      IF cl_null(l_pmac002) THEN  #無設置交易對象夥伴時預設為客戶編號
         LET r_client_par = p_xmdk007
      ELSE
         LET r_client_par = l_pmac002
      END IF

   END IF   
   
   RETURN r_client_par
END FUNCTION

################################################################################
# Descriptions...: 可出貨的出貨數量
# Memo...........: 主程式輸入出貨包裝單位,包裝數量後,先換成 出貨數量,判斷出貨數量 不可 <=可出貨數量
#                : 主程式呼叫前要確認KEY值不可為空,出通單:p_source_docno,p_seq,訂單:p_source_docno,p_seq,p_seq1,p_seq2
# Usage..........: CALL s_axmt540_get_max_ship_qty(p_source,p_ship_docno,p_ship_seq,p_source_docno,p_seq,p_seq1,p_seq2)
#                  RETURNING r_qty,r_max_qry
# Input parameter: p_source         來源,1.出通單,2.訂單
#                : p_ship_docno     出貨單單號
#                : p_ship_seq       出貨單項次
#                : p_source_docno   出通單單號/訂單單號
#                : p_seq            出通單項次/訂單項次
#                : p_seq1           出通單傳空值/訂單項序
#                : p_seq2           出通單傳空值/訂單分批序
# Return code....: r_qty            未出貨數量(預帶欄位用)
#                : r_max_qty        可出貨數量(考慮超交量，檢查用)
# Date & Author..: 140626 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_max_ship_qty(p_source,p_ship_docno,p_ship_seq,p_source_docno,p_seq,p_seq1,p_seq2)
   DEFINE p_source         LIKE type_t.num5        #來源,1.出通單,2.訂單
   DEFINE p_ship_docno     LIKE xmdk_t.xmdkdocno   #出貨單單號(排除本張出貨單可傳空值)
   DEFINE p_ship_seq       LIKE xmdl_t.xmdlseq     #出貨單項次(可傳空值)
   DEFINE p_source_docno   LIKE xmdk_t.xmdkdocno   #出通單單號/訂單單號
   DEFINE p_seq            LIKE xmdl_t.xmdl004     #出通單項次/訂單項次
   DEFINE p_seq1           LIKE xmdl_t.xmdl005     #出通單傳空值/訂單項序
   DEFINE p_seq2           LIKE xmdl_t.xmdl006     #出通單傳空值/訂單分批序
   DEFINE r_qty            LIKE xmdl_t.xmdl205     #未出貨數量
   DEFINE r_max_qty        LIKE xmdl_t.xmdl205     #可出貨數量(考慮超交量)
   DEFINE l_unship_qty     LIKE xmdl_t.xmdl018     #訂單/出通單數量-已出貨數量
   DEFINE l_num_qty        LIKE xmdl_t.xmdl018     #訂單數量
   DEFINE l_uncof_qty      LIKE xmdl_t.xmdl018     #未確認出貨單的出貨數量
   DEFINE l_sql1           STRING
   DEFINE l_sql2           STRING
   DEFINE l_xmdl008        LIKE xmdl_t.xmdl008     #料件編號
   DEFINE l_imaf128        LIKE imaf_t.imaf128     #銷售超交率
   DEFINE l_xmdc032        LIKE xmdc_t.xmdc032     #160219-00003#1 add
   DEFINE l_pmdp023        LIKE pmdp_t.pmdp023     #160219-00003#1 add

   WHENEVER ERROR CONTINUE

   LET r_qty = NULL
   LET r_max_qty = NULL
   LET l_xmdl008 = NULL
   LET l_unship_qty = NULL
   LET l_num_qty = NULL
   LET l_uncof_qty = NULL
   LET l_sql1 = NULL
   LET l_sql2 = NULL

  #161205-00025#10 161221 by lori mod---(S)
  #LET l_sql1 = "SELECT SUM(COALESCE(xmdl018,0)) FROM xmdl_t,xmdk_t a ",
  #             " WHERE xmdlent = a.xmdkent AND xmdldocno = a.xmdkdocno ",
  #             "   AND xmdlent = ",g_enterprise,
  #             "   AND a.xmdk000 = '1'",               #出貨單
  #             "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
  #             "                                          FROM xmdk_t b",
  #             "                                         WHERE b.xmdkent = a.xmdkent",
  #             "                                           AND b.xmdkdocno = a.xmdk035",
  #             "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
   LET l_sql1 = "SELECT SUM(COALESCE(xmdl018,0)) FROM xmdl_t ",
                " WHERE xmdlent = ",g_enterprise,
                "   AND EXISTS (SELECT 1 FROM xmdk_t t1 ",
                "                WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
                "                  AND xmdk000 = '1' ",
                "                  AND NOT (t1.xmdk045 = '3' ",
                "                        AND EXISTS (SELECT 1 FROM xmdk_t t2 ",
                "                                     WHERE t2.xmdkent = t1.xmdkent AND t2.xmdkdocno = t1.xmdk035 ",
                "                                       AND t2.xmdkstus <> 'X')) "
                
   CASE p_source
      WHEN 1   
         LET l_sql1 = l_sql1,"     AND xmdkstus NOT IN ('X','H','Y','S') "
      WHEN 2
         LET l_sql1 = l_sql1,"     AND xmdkstus NOT IN ('X','S') "       
   END CASE  
  
   LET l_sql1 = l_sql1,  
                "              ) "                
  #161205-00025#10 161221 by lori mod---(E)
   IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
     #LET l_sql1 = l_sql1," AND NOT (a.xmdkdocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"   #161205-00025#10 161221 by lori mark
      LET l_sql1 = l_sql1," AND NOT (xmdldocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"     #161205-00025#10 161221 by lori add
   END IF
   
   CASE p_source
      WHEN 1   #來源為出通單時，可出貨包裝數量 = xmdh017實際出通數量-xmdh030已轉出貨數量-SUM(xmdl018)出貨單未確認的數量 
         IF cl_null(p_source_docno) OR cl_null(p_seq) THEN
            RETURN r_qty,r_max_qty
         END IF
         
        #LET l_sql1 = l_sql1," AND xmdl001 = '",p_source_docno,"' AND xmdl002 = ",p_seq," AND a.xmdkstus NOT IN ('X','H','Y','S')"   #161205-00025#10 161221 by lori mark
        #PGS(D)-13130 memo -S-
        ##161205-00025#10 161221 by lori mark
        #LET l_sql1 = l_sql1," AND xmdl001 = '",p_source_docno,"' AND xmdl002 = ",p_seq                                              ##161205-00025#10 161221 by lori add
        LET l_sql1 = l_sql1," AND xmdl001 = '",p_source_docno,"' AND xmdl002 = ",p_seq 
        #PGS(D)-13130 memo -E-
         
       
        #161205-00025#10 161221 by lori mod---(S)       
        ##150521 by 04441 150519-00041#2 modify start
        ##LET l_sql2 = "SELECT COALESCE(xmdh017,0)-COALESCE(xmdh030,0),'',xmdh006",
        # LET l_sql2 = "SELECT COALESCE(xmdh056,0)-COALESCE(xmdh030,0),'',xmdh006",
        ##150521 by 04441 150519-00041#2 modify end
        #              "  FROM xmdh_t",
        #              " WHERE xmdhent = ",g_enterprise," AND xmdhdocno = '",p_source_docno,"'",
        #              "   AND xmdhseq = ",p_seq
        #LET l_sql2 = "SELECT xmdh056-xmdh030,'',xmdh006 ",               #170406-00007#1 mark
        #LET l_sql2 = "SELECT xmdh056-xmdh030,xmdh016,xmdh006 ",          #170328-00060#1 mark
        LET l_sql2 = "SELECT COALESCE(xmdh056,0)-COALESCE(xmdh030,0), ",  #170328-00060#1 add
#                    "               COALESCE(xmdh030,0) xmdh030, ",      #170328-00060#1 mark 
                     "       xmdh016, ",                                  #170406-00007#1 add                     
                     "       xmdh006 ",
                     "  FROM xmdh_t ",
                     " WHERE xmdhent = ",g_enterprise," AND xmdhdocno = '",p_source_docno,"'",
                    #"   AND xmdhseq = ",p_seq,")"  #170328-00060#1 mark
                     "   AND xmdhseq = ",p_seq," "  #170328-00060#1 add
        #161205-00025#10 161221 by lori mod---(E)               
      WHEN 2   #來源為訂單時，可出貨包裝數量 = xmdd006分批訂購數量-xmdd014已出貨量+xmdd016銷退換貨數量+xmdd034已簽退數量-SUM(xmdl018)出貨單未確認及未過帳數量
         IF cl_null(p_source_docno) OR cl_null(p_seq) OR cl_null(p_seq1) OR cl_null(p_seq2) THEN
            RETURN r_qty,r_max_qty
         END IF

         LET l_sql1 = l_sql1," AND xmdl003 = '",p_source_docno,"' AND xmdl004 = ",p_seq,
                            #" AND xmdl005= ",p_seq1," AND xmdl006 = ",p_seq2," AND a.xmdkstus NOT IN ('X','S')"   #161205-00025#10 161221 by lori mark
                             " AND xmdl005= ",p_seq1," AND xmdl006 = ",p_seq2                                      #161205-00025#10 161221 by lori add

         #--160219-00003#1--add--(S)
        #CALL s_axmt540_get_xmdc032(p_source_docno,p_seq,p_seq1,p_seq2) RETURNING l_xmdc032,l_pmdp023              #161205-00025#10 161221 by lori mark
         #161205-00025#10 161221 by lori add---(S)
         LET l_sql2 = "SELECT COALESCE(xmdd014,0) xmdd014, ",
                      "       COALESCE(xmdd016,0) xmdd016, ",
                      "       COALESCE(xmdd034,0) xmdd034, ",
                      "       xmdd006,xmdd001 ",
                      "  FROM xmdd_t",
                      " WHERE xmddent = ",g_enterprise," AND xmdddocno = '",p_source_docno,"' ",
                      "   AND xmddseq = ",p_seq," AND xmddseq1 = ",p_seq1," AND xmddseq2 = ",p_seq2         
         #161205-00025#10 161221 by lori add---(E)
        #IF l_xmdc032 = '3' THEN  #170406-00007#1 mark
            #161205-00025#10 161221 by lori add---(S)
            LET l_pmdp023 = 0   
            LET l_xmdc032 = ''
            CALL s_axmt540_get_xmdc032(p_source_docno,p_seq,p_seq1,p_seq2) RETURNING l_xmdc032,l_pmdp023
            #161205-00025#10 161221 by lori add---(E)
           IF l_xmdc032 = '3' THEN      #170406-00007#1 add  
           #161205-00025#10 161221 by lori mod---(S)
           #LET l_sql2 = "SELECT ",l_pmdp023,"-COALESCE(xmdd014,0)+COALESCE(xmdd016,0)+COALESCE(xmdd034,0),xmdd006,xmdd001",
           #             "  FROM xmdd_t",
           #             " WHERE xmddent = ",g_enterprise," AND xmdddocno = '",p_source_docno,"' ",
           #             "   AND xmddseq = ",p_seq," AND xmddseq1 = ",p_seq1," AND xmddseq2 = ",p_seq2
              LET l_sql2 = "SELECT ",l_pmdp023,"-xmdd014+xmdd016+xmdd034,xmdd006,xmdd001 FROM (",l_sql2,") tsed"
           #161205-00025#10 161221 by lori mod---(E)
           ELSE
         #--160219-00003#1--add--(E)
           #161205-00025#10 161221 by lori mod---(S)
           #LET l_sql2 = "SELECT COALESCE(xmdd006,0)-COALESCE(xmdd014,0)+COALESCE(xmdd016,0)+COALESCE(xmdd034,0),xmdd006,xmdd001",
           #             "  FROM xmdd_t",
           #             " WHERE xmddent = ",g_enterprise," AND xmdddocno = '",p_source_docno,"' ",
           #             "   AND xmddseq = ",p_seq," AND xmddseq1 = ",p_seq1," AND xmddseq2 = ",p_seq2
           #PGS(D)-13130 meno -S
              #LET l_sql2 = "SELECT xmdd006-xmdd014+xmdd016+xmdd034,xmdd006,xmdd001 FROM (",l_sql2,") tsed" 
              LET l_sql2 = "SELECT xmdd006-xmdd014+xmdd016+xmdd034,xmdd006,xmdd001 FROM (",l_sql2,") t51  "                
           #PGS(D)-13130 meno -E              
           #161205-00025#10 161221 by lori mod---(E)              
           END IF   #160219-00003#1 add
   END CASE 
   
   PREPARE s_axmt540_uncof_qty FROM l_sql1
   EXECUTE s_axmt540_uncof_qty INTO l_uncof_qty
      
   IF cl_null(l_uncof_qty) THEN LET l_uncof_qty = 0 END IF

   PREPARE s_axmt540_unship_qty FROM l_sql2
   EXECUTE s_axmt540_unship_qty INTO l_unship_qty,l_num_qty,l_xmdl008
   
   IF cl_null(l_unship_qty) THEN LET l_unship_qty = 0 END IF

   LET r_qty = l_unship_qty - l_uncof_qty
   
   IF NOT cl_null(l_num_qty) THEN
      #aimm213銷售超交率imaf128
      LET l_imaf128 = ''
      SELECT imaf128
        INTO l_imaf128
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = l_xmdl008
   
      IF NOT cl_null(l_imaf128) THEN
         #LET r_max_qty = r_qty + l_num_qty * l_imaf128 / 100  #171010-00005#1 mark
         LET r_max_qty = (l_num_qty * (1+l_imaf128 / 100)) + (l_unship_qty - l_num_qty) - l_uncof_qty  #171010-00005#1 add
      END IF
   END IF
   
   IF cl_null(r_max_qty) THEN
      LET r_max_qty = r_qty
   END IF

   RETURN r_qty,r_max_qty
END FUNCTION

################################################################################
# Descriptions...: 查詢銷售取價方式
# Memo...........:
# Usage..........: CALL s_axmt540_xmdh_sel(p_xmdk018,p_xmdkdocno,p_xmdadocno)
#                  RETURNING 
# Input parameter: p_xmdk018      單頭取價方式(若為Null改以單身訂單單號抓訂單取價方式)
#                : p_xmdkdocno    單身出貨單號(讓簽收單或消退單抓"無訂單出貨單"的取價方式)
#                : p_xmdadocno    單身訂單單號
# Return code....: r_xmah003      價格允許修改
#                : r_xmah004      修改容差率
#                : r_xmah005      價格超過修改容差率處理方式
#                : r_xmah006      允許單價為0
# Date & Author..: 140702 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdh_sel(p_xmdk018,p_xmdkdocno,p_xmdadocno)
   DEFINE p_xmdk018    LIKE xmdk_t.xmdk018
   DEFINE p_xmdkdocno  LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdadocno  LIKE xmda_t.xmdadocno   
   DEFINE r_xmah     RECORD
            xmah001    LIKE xmah_t.xmah001, 
            xmah002    LIKE xmah_t.xmah002,     #160705-00008#2 20160721 
            xmah003    LIKE xmah_t.xmah003,
            xmah004    LIKE xmah_t.xmah004,
            xmah005    LIKE xmah_t.xmah005,
            xmah006    LIKE xmah_t.xmah006
                     END RECORD

   WHENEVER ERROR CONTINUE

   INITIALIZE r_xmah.* TO NULL
   
   IF cl_null(p_xmdk018) THEN   #單頭無取價方式改抓訂單
      IF cl_null(p_xmdadocno) THEN      
         SELECT xmdk018 INTO r_xmah.xmah001
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_xmdkdocno
      ELSE
         SELECT xmda017 INTO r_xmah.xmah001
           FROM xmda_t
          WHERE xmdaent = g_enterprise
            AND xmdadocno = p_xmdadocno
      END IF
        
   ELSE
      LET r_xmah.xmah001 = p_xmdk018
   END IF

   SELECT xmah003,xmah004,xmah005,xmah006,xmah002      #160705-00008#2 20160721 
     INTO r_xmah.xmah003,r_xmah.xmah004,r_xmah.xmah005,r_xmah.xmah006,r_xmah.xmah002 #160705-00008#2 20160721 
     FROM xmah_t
    WHERE xmahent = g_enterprise
      AND xmah001 = r_xmah.xmah001
      
   RETURN r_xmah.xmah001,r_xmah.xmah003,r_xmah.xmah004,r_xmah.xmah005,r_xmah.xmah006,r_xmah.xmah002 #160705-00008#2 20160721 
END FUNCTION

################################################################################
# Descriptions...: 單價控管檢查
# Memo...........:
# Usage..........: CALL axmt540_xmdl024_chk(p_xmdk018,p_xmdadocno,p_xmdl024,p_xmdl045)
#                  RETURNING r_success
# Input parameter: p_xmdk018      單頭取價方式(若為Null改以單身訂單單號抓訂單取價方式)
#                : p_xmdadocno    來源訂單單號
#                : p_xmdl024      單價
#                : p_xmdl045      取出價格
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140702 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_price_chk(p_xmdk018,p_xmdadocno,p_xmdl024,p_xmdl045)
   DEFINE p_xmdk018    LIKE xmdk_t.xmdk018
   DEFINE p_xmdadocno  LIKE xmda_t.xmdadocno
   DEFINE p_xmdl024    LIKE xmdl_t.xmdl024
   DEFINE p_xmdl045    LIKE xmdl_t.xmdl045
   
   DEFINE l_num        LIKE xmah_t.xmah004
   DEFINE r_success    LIKE type_t.num5      #執行結果
      
   DEFINE l_xmah001    LIKE xmah_t.xmah001
   DEFINE l_xmah002    LIKE xmah_t.xmah002   #160705-00008#2 20160721 
   DEFINE l_xmah003    LIKE xmah_t.xmah003
   DEFINE l_xmah004    LIKE xmah_t.xmah004   #修改容差率
   DEFINE l_xmah005    LIKE xmah_t.xmah005   #超過容差率處理方式
   DEFINE l_xmah006    LIKE xmah_t.xmah006   #允許單價為零
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   CALL s_axmt540_xmdh_sel(p_xmdk018,'',p_xmdadocno)
   RETURNING l_xmah001,l_xmah003,l_xmah004,l_xmah005,l_xmah006,l_xmah002 #160705-00008#2 20160721 
         
   #若單頭取價方式的基本資料設置單價不可為0時，則輸入的單價不可以為0
   IF NOT cl_null(l_xmah006) THEN
      IF l_xmah006 = 'N' AND p_xmdl024 = 0 THEN
         INITIALIZE g_errparam TO NULL
         #LET g_errparam.code = 'apm-00273'  #當前取價方式中單價不允許為0！    #200904-00008#1 mark
         LET g_errparam.code = 'axm-00971'                                   #200904-00008#1 add
         LET g_errparam.extend = l_xmah001
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF

   #不允許修改單價
   #160705-00008#2 20160721 -----(S) 
   #IF l_xmah003 = 'N' AND p_xmdl024 <> p_xmdl045 THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00650'  #取價方式%1不允許修改單價！
   #   LET g_errparam.extend = l_xmah001
   #   LET g_errparam.popup = TRUE
   #   LET g_errparam.replace[1] = l_xmah001
   #   CALL cl_err()
   #   
   #   LET r_success = FALSE
   #   RETURN r_success      
   #END IF
   IF p_xmdl024 <> p_xmdl045 THEN
      IF (p_xmdl045 > 0 OR l_xmah002 <> 'Y') AND l_xmah003 <> 'Y' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00650'  #取價方式%1不允許修改單價！
         LET g_errparam.extend = l_xmah001
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmah001
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   #160705-00008#2 20160721 -----(E) 

   #價格調高直接pass
   IF p_xmdl024 > p_xmdl045 THEN
      RETURN r_success
   END IF

   IF NOT cl_null(l_xmah004) THEN
      IF p_xmdl045 = 0 OR
         cl_null(p_xmdl045) THEN
         RETURN r_success
      END IF

      LET l_num = (p_xmdl045 - p_xmdl024) / p_xmdl045 * 100
   
      #若輸入的單價超過單頭取價方式的容差率範圍，依據取價方式的基本資料設置的處理方式進行管控
      IF l_num > l_xmah004 THEN                           
         IF l_xmah005 = '1' THEN #拒絕
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00192'  #單價差異%1%不可大於當前取價方式%2的容差率範圍%3%！
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_num
            LET g_errparam.replace[2] = l_xmah001
            LET g_errparam.replace[3] = l_xmah004
            
            CALL cl_err()  
            LET r_success = FALSE
            RETURN r_success
         ELSE                    #提醒
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00358'  #單價差異%1%大於當前取價方式%2的容差率範圍%3%！
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_num
            LET g_errparam.replace[2] = l_xmah001
            LET g_errparam.replace[3] = l_xmah004

            CALL cl_err()  
         END IF
      END IF
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: #檢查收款條件
# Memo...........:
# Usage..........: CALL s_axmt540_receive_condition_chk(p_xmdk007,p_xmdk010)
#                  RETURNING r_success
# Input parameter: p_xmdk007   供應商編號
#                : p_xmdk010   收款條件編號
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 140704 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_receive_condition_chk(p_xmdk007,p_xmdk010)
   DEFINE p_xmdk007    LIKE xmdk_t.xmdk007
   DEFINE p_xmdk010    LIKE xmdk_t.xmdk010   
   DEFINE r_success    LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE   
   
   IF NOT cl_null(p_xmdk007) AND NOT cl_null(p_xmdk010) THEN
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL
               
      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = p_xmdk007
      LET g_chkparam.arg2 = p_xmdk010               
                  
      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_pmad002_2") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 客戶資料檢查
# Memo...........:
# Usage..........: CALL s_axmt540_client_chk(p_xmdkdocno,p_type,p_client1,p_client2)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   單據單號
#                : p_type        1.客戶編號2.收貨客戶3.收款客戶4.發票客戶
#                : p_client1     客戶編號
#                : p_client2     收貨客戶or收款客戶
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 140704 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_client_chk(p_xmdkdocno,p_type,p_client1,p_client2)
   DEFINE p_xmdkdocno  LIKE xmdk_t.xmdkdocno #單據單號(客戶編號檢查單據別限用資料)
   DEFINE p_type       LIKE type_t.chr1      #1.客戶編號2.收貨客戶3.收款客戶4.發票客戶
   DEFINE p_client1    LIKE xmdk_t.xmdk007   #客戶編號
   DEFINE p_client2    LIKE xmdk_t.xmdk009   #收貨客戶or收款客戶

   DEFINE r_success    LIKE type_t.num5      #執行結果

   DEFINE l_success    LIKE type_t.num5
   DEFINE l_flag       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   CASE p_type
      WHEN '1'   #收款客戶xmdk007
         IF NOT cl_null(p_client1) THEN         
            #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
            INITIALIZE g_chkparam.* TO NULL

            #設定g_chkparam.*的參數
            LET g_chkparam.arg1 = p_client1
            LET g_chkparam.arg2 = g_site
            LET g_errshow = TRUE                                                                                                #160328-00029#4
            LET g_chkparam.err_str[1] = "apm-00201:sub-01302|axmm200|",cl_get_progname("axmm200",g_lang,"2"),"|:EXEPROGaxmm200" #160328-00029#4
            #呼叫檢查存在並帶值的library
            IF NOT cl_chk_exist("v_pmaa001_3") THEN
               LET r_success = FALSE
               RETURN r_success
            END IF   
            
            #150721-00001#1  2016/01/08 By earl mod s
#            #檢查單據別是否設置限用的資料
#            IF NOT s_control_check_customer(p_client1,'2',g_site,g_user,g_dept,p_xmdkdocno) THEN
#               LET r_success = FALSE
#               RETURN r_success
#            END IF
            
            #161021-00012#7 Mark By 06137  180706(S)
            #CALL s_control_chk_doc('3',p_xmdkdocno,p_client1,'','','','') RETURNING l_success,l_flag
            #IF NOT l_success OR NOT l_flag THEN
            #   LET r_success = FALSE
            #   RETURN r_success
            #END IF
            #161021-00012#7 Mark By 06137  180706(E)
            #150721-00001#1  2016/01/08 By earl mod e
            
            #161021-00012#7 Add By 06137  180706(S)
            IF NOT s_control_check_customer(p_client1,'2',g_site,g_user,g_dept,p_xmdkdocno) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF                        
            #161021-00012#7 Add By 06137  180706(E)
         END IF

      WHEN '2'  #收貨客戶xmdk009
         IF NOT cl_null(p_client1) AND NOT cl_null(p_client2) THEN            
            IF p_client1 <> p_client2 THEN   #與客戶編號相同不檢查 
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = p_client1
               LET g_chkparam.arg2 = p_client2
               LET g_chkparam.arg3 = g_site
               LET g_errshow = TRUE                                                                                                #160328-00029#4
               LET g_chkparam.err_str[1] = "axr-00049:sub-01302|apmm102|",cl_get_progname("apmm102",g_lang,"2"),"|:EXEPROGapmm102" #160328-00029#4
                  
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_pmac002_2") THEN
                  LET r_success = FALSE
                  RETURN r_success
               END IF
            END IF
         END IF
         
      WHEN '3'  #收款客戶xmdk008
         IF NOT cl_null(p_client1) AND NOT cl_null(p_client2) THEN
            IF p_client1 <> p_client2 THEN   #與客戶編號相同不檢查 
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = p_client1
               LET g_chkparam.arg2 = p_client2
               LET g_chkparam.arg3 = g_site
               LET g_errshow = TRUE                                                                                                #160328-00029#4
               LET g_chkparam.err_str[1] = "axr-00049:sub-01302|apmm102|",cl_get_progname("apmm102",g_lang,"2"),"|:EXEPROGapmm102" #160328-00029#4
                  
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_pmac002") THEN
                  LET r_success = FALSE
                  RETURN r_success
               END IF
            END IF
         END IF
         
      WHEN '4' #發票客戶xmdk202
         IF NOT cl_null(p_client1) AND NOT cl_null(p_client2) THEN
            IF p_client1 <> p_client2 THEN   #與客戶編號相同不檢查 
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = p_client1
               LET g_chkparam.arg2 = p_client2
               LET g_chkparam.arg3 = g_site
               LET g_errshow = TRUE                                                                                                #160328-00029#4
               LET g_chkparam.err_str[1] = "axr-00049:sub-01302|apmm102|",cl_get_progname("apmm102",g_lang,"2"),"|:EXEPROGapmm102" #160328-00029#4
                  
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_pmac002_6") THEN
                  LET r_success = FALSE
                  RETURN r_success
               END IF
            END IF
         END IF
         
   END CASE
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 單位檢查
# Memo...........:
# Usage..........: CALL s_axmt540_unit_chk(p_xmdl008,p_xmdl017)
#                  RETURNING r_success
# Input parameter: p_xmdl008      料件編號
#                : p_xmdl017      單位
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140707 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_unit_chk(p_xmdl008,p_xmdl017)
   DEFINE p_xmdl008     LIKE xmdl_t.xmdl008
   DEFINE p_xmdl017     LIKE xmdl_t.xmdl017
   DEFINE r_success     LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_null(p_xmdl008) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00229'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF NOT cl_null(p_xmdl017) THEN
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL
            
      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = p_xmdl008
      LET g_chkparam.arg2 = p_xmdl017
                                    
      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_imao002") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢查料件是否使用批號
# Memo...........:
# Usage..........: CALL s_axmt540_imaf061_chk(p_imaf001)
#                  RETURNING r_success
# Input parameter: p_imaf001      料件編號
#                : 
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140710 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_imaf061_chk(p_imaf001)
   DEFINE p_imaf001    LIKE imaf_t.imaf001
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_imaf061    LIKE imaf_t.imaf061
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET l_imaf061 = ''   
   SELECT imaf061 INTO l_imaf061
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = g_site
      AND imaf001 = p_imaf001
      
   IF l_imaf061 <> '1' AND
      l_imaf061 <> '3' THEN   #[T:料件據點進銷存檔].[C:批號控管]=1(必須有批號)或3(不控管)時才可輸入
         LET r_success = FALSE
         RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢查多庫儲批出貨數量是否大於出通單的可轉出貨量
# Memo...........:
# Usage..........: CALL s_axmt540_get_max_ship_qty1(p_xmdmdocno,p_xmdmseq,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm033,p_xmdl001,p_xmdl002)
#                  RETURNING r_success
# Input parameter: p_xmdmdocno   單據單號(排除用可NULL)
#                : p_xmdmseq     單據項次(排除用可NULL)
#                : p_xmdm005     庫位(對應回出通單用，因項序可能不同)
#                : p_xmdm006     儲位(對應回出通單用，因項序可能不同)
#                : p_xmdm007     批號(對應回出通單用，因項序可能不同)
#                : p_xmdm033     庫存管理特徵(對應回出通單用，因項序可能不同)
#                : p_xmdl001     來源單號
#                : p_xmdl002     來源項次
# Return code....: r_max_qty     可出貨數量
#                : 
# Date & Author..: 140710 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_max_ship_qty1(p_xmdmdocno,p_xmdmseq,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm033,p_xmdl001,p_xmdl002)
   DEFINE p_xmdmdocno      LIKE xmdm_t.xmdmdocno
   DEFINE p_xmdmseq        LIKE xmdm_t.xmdmseq
   DEFINE p_xmdm005        LIKE xmdm_t.xmdm005   
   DEFINE p_xmdm006        LIKE xmdm_t.xmdm006
   DEFINE p_xmdm007        LIKE xmdm_t.xmdm007
   DEFINE p_xmdm033        LIKE xmdm_t.xmdm033
   DEFINE p_xmdl001        LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002        LIKE xmdl_t.xmdl002      

   DEFINE r_max_qty        LIKE xmdl_t.xmdl018     #可出貨的出貨數量
   DEFINE l_unship_qty     LIKE xmdl_t.xmdl018     #出通單數量-已出貨數量
   DEFINE l_uncof_qty      LIKE xmdl_t.xmdl018     #未確認出貨單的出貨數量
   DEFINE l_n              LIKE type_t.num5
   DEFINE l_sql1           STRING
   DEFINE l_sql2           STRING
   DEFINE l_cof_qty        LIKE xmdl_t.xmdl018     #已確認出貨單的出貨數量  #14/12/18 Sarah add
   #170406-00007#1---add----begin--------
   DEFINE l_xmdi001        LIKE xmdi_t.xmdi001     #料件编号
   DEFINE l_imaf128        LIKE imaf_t.imaf128     #銷售超交率
   #170406-00007#1----add---end--------
   
   WHENEVER ERROR CONTINUE

   LET r_max_qty = NULL
   LET l_unship_qty = NULL
   LET l_uncof_qty = NULL
   LET l_sql1 = NULL
   LET l_sql2 = NULL
   LET l_cof_qty = NULL   #14/12/18 Sarah add

   IF cl_null(p_xmdl001) OR cl_null(p_xmdl002) THEN   #無來源不比較
       RETURN r_max_qty
   END IF

   #來源為出通單時，可出貨數量 = xmdi009出通數量-xmdi012已轉出貨數量-SUM(xmdm009)出貨單未確認的數量
  #161205-00025#10 161221 by lori mod---(S)
  #LET l_sql1 = "SELECT SUM(COALESCE(xmdm009,0)) FROM xmdk_t a,xmdl_t,xmdm_t",
  #             " WHERE a.xmdkent = xmdlent AND xmdlent = xmdment AND xmdment = '",g_enterprise,"'",
  #             "   AND a.xmdkdocno = xmdldocno AND xmdldocno = xmdmdocno",
  #             "   AND xmdlseq = xmdmseq",
  #             "   AND a.xmdk000 = '1'",         #出貨單
  #             "   AND a.xmdkstus NOT IN ('X','H','Y','S')",
  #             "   AND xmdl001 = '",p_xmdl001,"'",
  #             "   AND xmdl002 = '",p_xmdl002,"'",
  #             "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
  #             "                                          FROM xmdk_t b",
  #             "                                         WHERE b.xmdkent = a.xmdkent",
  #             "                                           AND b.xmdkdocno = a.xmdk035",
  #             "                                           AND b.xmdkstus <> 'X'))"      #排除統銷統收之初始站出貨單
   LET l_sql1 = "SELECT SUM(xmdm009) ",
                "  FROM ( SELECT xmdment,xmdmdocno,xmdmseq, ",
                "               COALESCE(xmdm009,0) xmdm009, ",
                "               COALESCE(xmdm005,' ') xmdm005, ",
                "               COALESCE(xmdm006,' ') xmdm006, ",
                "               COALESCE(xmdm007,' ') xmdm007, ",
                "               COALESCE(xmdm033,' ') xmdm033  ",
                #PGS(D)-13130 memo -S-
                #"          FROM xmdm_t WHERE xmdment = ",g_enterprise,") ",
                "          FROM xmdm_t WHERE xmdment = ",g_enterprise,") t51 ",
                #PGS(D)-13130 memo -E-
                " WHERE EXISTS(SELECT 1 FROM xmdl_t,xmdk_t t1 ",
                "               WHERE xmdment = xmdlent AND xmdmdocno = xmdldocno AND xmdmseq = xmdlseq ",
                "                 AND xmdlent = xmdkent AND xmdldocno = xmdkdocno ",
                "                 AND xmdk000 = '1' ",   #出貨單
                "                 AND xmdkstus NOT IN ('X','H','Y','S') ",
                "                 AND xmdl001 = '",p_xmdl001,"'",
                "                 AND xmdl002 = '",p_xmdl002,"'",
                "                 AND NOT (t1.xmdk045 = '3' ",
                "                        AND EXISTS (SELECT 1 FROM xmdk_t t2 ",
                "                                     WHERE t2.xmdkent = t1.xmdkent AND t2.xmdkdocno = t1.xmdk035 ",
                "                                       AND t2.xmdkstus <> 'X'))) "   #排除統銷統收之初始站出貨單
  #161205-00025#10 161221 by lori mod---(E)             
   IF NOT cl_null(p_xmdmdocno) AND NOT cl_null(p_xmdmseq) THEN
      LET l_sql1 = l_sql1," AND NOT (xmdmdocno = '",p_xmdmdocno,"' AND xmdmseq = '",p_xmdmseq,"')"
   END IF
   
  #161205-00025#10 161221 by lori mod---(S)    
  #LET l_sql2 = "SELECT COALESCE(xmdi009,0) - COALESCE(xmdi012,0)",
  #             "  FROM xmdi_t ",
  #             " WHERE xmdient = '",g_enterprise,"'",
  #             "   AND xmdidocno = '",p_xmdl001,"'",
  #             "   AND xmdiseq = '",p_xmdl002,"'"
   #181011-00007#1 mark---start---
   #LET l_sql2 = "SELECT COALESCE(xmdi009,0) xmdi009, ",
   #             "       COALESCE(xmdi012,0) xmdi012, ",
   #181011-00007#1 mark---end---
   #181011-00007#1 add---start---
   LET l_sql2 = "SELECT COALESCE(SUM(xmdi009),0) xmdi009, ",
                "       COALESCE(SUM(xmdi012),0) xmdi012, ",
   #181011-00007#1 add---end---
                "       COALESCE(xmdi005,' ') xmdi005, ",
                "       COALESCE(xmdi006,' ') xmdi006, ",
                "       COALESCE(xmdi007,' ') xmdi007, ",
                "       COALESCE(xmdi013,' ') xmdi013 ",
                "  FROM xmdi_t ",
                " WHERE xmdient = '",g_enterprise,"'",
                "   AND xmdidocno = '",p_xmdl001,"'",
                "   AND xmdiseq = '",p_xmdl002,"'"  
  #161205-00025#10 161221 by lori mod---(E)  
  
   #計算出通單是否有建立多庫儲批
   LET l_n = 0
   SELECT COUNT(xmdiseq1) INTO l_n
     FROM xmdi_t
    WHERE xmdient = g_enterprise
      AND xmdidocno = p_xmdl001
      AND xmdiseq = p_xmdl002

   IF l_n > 1 THEN  #有多庫儲批加上多庫儲批的對應(因出通單沒建立多庫儲批可能沒輸入庫儲批)
     #181005-00009#5-s-mark
#     #161205-00025#10 161221 by lori mod---(S)  
#     #LET l_sql1 = l_sql1," AND COALESCE(xmdm005,' ') = COALESCE('",p_xmdm005,"',' ')",
#     #                    " AND COALESCE(xmdm006,' ') = COALESCE('",p_xmdm006,"',' ')",
#     #                    " AND COALESCE(xmdm007,' ') = COALESCE('",p_xmdm007,"',' ')",
#     #                    " AND COALESCE(xmdm033,' ') = COALESCE('",p_xmdm033,"',' ')"
#     #170407-00018#1-s 
##      LET l_sql1 = l_sql1," AND xmdm005 = COALESCE('",p_xmdm005,"',' ')",
##                          " AND xmdm006 = COALESCE('",p_xmdm006,"',' ')",
##                          " AND xmdm007 = COALESCE('",p_xmdm007,"',' ')",  
##                          " AND xmdm033 = COALESCE('",p_xmdm033,"',' ')" 
#      IF NOT cl_null(p_xmdm005) THEN
#         LET l_sql1 = l_sql1," AND xmdm005 = '",p_xmdm005,"' "
#         LET l_sql2 = l_sql2," AND xmdi005 = '",p_xmdm005,"' "
#      END IF 
#      IF NOT cl_null(p_xmdm006) THEN      
#         LET l_sql1 = l_sql1," AND xmdm006 = '",p_xmdm006,"' "
#         LET l_sql2 = l_sql2," AND xmdi006 = '",p_xmdm006,"' "
#      END IF 
#      IF NOT cl_null(p_xmdm007) THEN 
#         LET l_sql1 = l_sql1," AND xmdm007 = '",p_xmdm007,"' " 
#         LET l_sql2 = l_sql2," AND xmdi007 = '",p_xmdm007,"' "
#      END IF     
#      IF NOT cl_null(p_xmdm033) THEN 
#         LET l_sql1 = l_sql1," AND xmdm033 = '",p_xmdm033,"' " 
#         LET l_sql2 = l_sql2," AND xmdi013 = '",p_xmdm033,"' "
#      END IF                   
#     #LET l_sql2 = l_sql2," AND COALESCE(xmdi005,' ') = COALESCE('",p_xmdm005,"',' ')",
#     #                    " AND COALESCE(xmdi006,' ') = COALESCE('",p_xmdm006,"',' ')",
#     #                    " AND COALESCE(xmdi007,' ') = COALESCE('",p_xmdm007,"',' ')",
#     #                    " AND COALESCE(xmdi013,' ') = COALESCE('",p_xmdm033,"',' ')"
##      LET l_sql2 = l_sql2," AND xmdi005 = COALESCE('",p_xmdm005,"',' ')",
##                          " AND xmdi006 = COALESCE('",p_xmdm006,"',' ')",
##                          " AND xmdi007 = COALESCE('",p_xmdm007,"',' ')",  
##                          " AND xmdi013 = COALESCE('",p_xmdm033,"',' ')"   
#     #170407-00018#1-e                            
#     #161205-00025#10 161221 by lori mod---(E)
     #181005-00009#5-e-mark
     #181005-00009#5-s-add
     #計算可出通量-已出貨量，應該考慮到還沒打資料的庫/儲/批/庫存管理特徵
     LET l_sql1 = l_sql1," AND COALESCE(xmdm005,' ') = COALESCE('",p_xmdm005,"',' ')",
                         " AND COALESCE(xmdm006,' ') = COALESCE('",p_xmdm006,"',' ')",
                         " AND COALESCE(xmdm007,' ') = COALESCE('",p_xmdm007,"',' ')",  
                         " AND COALESCE(xmdm033,' ') = COALESCE('",p_xmdm033,"',' ')" 
     LET l_sql2 = l_sql2," AND COALESCE(xmdi005,' ') = COALESCE('",p_xmdm005,"',' ')",
                         " AND COALESCE(xmdi006,' ') = COALESCE('",p_xmdm006,"',' ')",
                         " AND COALESCE(xmdi007,' ') = COALESCE('",p_xmdm007,"',' ')",
                         " AND COALESCE(xmdi013,' ') = COALESCE('",p_xmdm033,"',' ')" 
     #181005-00009#5-e-add
   END IF

   PREPARE s_axmt540_uncof_qty1 FROM l_sql1
   EXECUTE s_axmt540_uncof_qty1 INTO l_uncof_qty
   
   IF cl_null(l_uncof_qty) THEN LET l_uncof_qty = 0 END IF

   #LET l_sql2 = "SELECT xmdi009-xmdi012 FROM (",l_sql2,") tsed"   #161205-00025#10 161221 by lori add   #181011-00007#1 mark
   #PGS(D)-13130 memo -S-
   #LET l_sql2 = "SELECT xmdi009-xmdi012 FROM (",l_sql2," GROUP BY xmdi005,xmdi006,xmdi007,xmdi013) tsed" #181011-00007#1 add
   LET l_sql2 = "SELECT xmdi009-xmdi012 FROM (",l_sql2," GROUP BY xmdi005,xmdi006,xmdi007,xmdi013) t51  " 
   #PGS(D)-13130 memo -E-
   PREPARE s_axmt540_unship_qty1 FROM l_sql2
   EXECUTE s_axmt540_unship_qty1 INTO l_unship_qty
   
   IF cl_null(l_unship_qty) THEN LET l_unship_qty = 0 END IF

   LET r_max_qty = l_unship_qty - l_uncof_qty
   #170406-00007#1----add---begin------
   IF NOT cl_null(l_unship_qty) THEN
      #aimm213銷售超交率imaf128
      LET l_imaf128 = ''
      LET l_xmdi001 = ''
      #SELECT xmdi001 INTO l_xmdi001 FROM xmdi_t         #181011-00007#1 mark
      SELECT DISTINCT xmdi001 INTO l_xmdi001 FROM xmdi_t   #181011-00007#1 add
        WHERE xmdient = g_enterprise
          AND xmdidocno = p_xmdl001
          AND xmdiseq =  p_xmdl002       
      SELECT imaf128
        INTO l_imaf128
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = l_xmdi001
   
      IF NOT cl_null(l_imaf128) THEN
         LET r_max_qty = r_max_qty + l_unship_qty * l_imaf128 / 100
      END IF
    END IF
   #170406-00007#1----add--end------
   #14/12/18 Sarah add
   #當有傳入單據編號時,還要再檢查這張出貨單是否已確認
   #若為已確認,則只要檢查修改的數量有沒有大於出貨單單身的數量
   IF NOT cl_null(p_xmdmdocno) AND NOT cl_null(p_xmdmseq) THEN
      LET l_n = 0
      SELECT COUNT(*) INTO l_n FROM xmdk_t
       WHERE xmdkent = g_enterprise AND xmdkdocno = p_xmdmdocno AND xmdkstus = 'Y'
      IF l_n > 0 THEN    #這張出貨單已確認,抓單身的出貨數量來比較就好
         LET l_sql1 = "SELECT SUM(COALESCE(xmdl018,0)) FROM xmdl_t",
                      " WHERE xmdlent = '",g_enterprise,"'",
                      "   AND xmdldocno = '",p_xmdmdocno,"'",
                      "   AND xmdlseq = '",p_xmdmseq,"'"
         PREPARE s_axmt540_cof_qty FROM l_sql1
         EXECUTE s_axmt540_cof_qty INTO l_cof_qty
         IF cl_null(l_cof_qty) THEN LET l_cof_qty = 0 END IF
         IF l_cof_qty > 0 THEN LET r_max_qty = l_cof_qty END IF
      END IF
   END IF
   #14/12/18 Sarah add

   RETURN r_max_qty
END FUNCTION

################################################################################
# Descriptions...: 更改多庫儲批資料(input前)
# Memo...........:
# Usage..........: CALL s_axmt540_change_xmdm_upd_before(p_xmdkdocno,p_xmdkstus)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   單據單號
#                : p_xmdkseq     單據項次
#                : p_xmdkstus    單據狀態
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 140328 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_change_xmdm_upd_before(p_xmdkdocno,p_xmdkstus)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdkstus      LIKE xmdk_t.xmdkstus
   DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   IF p_xmdkstus NOT MATCHES '[YH]' THEN
      RETURN r_success
   END IF      
      
   #在揀量更新
   CALL s_axmt540_ins_inap(p_xmdkdocno,'-1','upd') RETURNING r_success 

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 料號帶出客戶料號
# Memo...........:
# Usage..........: CALL s_axmt540_client_no(p_xmdk007,p_xmdl008,p_xmdl009)
#                  RETURNING r_xmdl033
# Input parameter: p_xmdk007      訂單客戶
#                : p_xmdl008      料件編號
#                : p_xmdl009      產品特徵
# Return code....: r_success      執行結果
#                : r_xmdl033      客戶料號
# Date & Author..: 140728 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_client_no(p_xmdk007,p_xmdl008,p_xmdl009)
   DEFINE p_xmdk007    LIKE xmdk_t.xmdk007
   DEFINE p_xmdl008    LIKE xmdl_t.xmdl008
   DEFINE p_xmdl009    LIKE xmdl_t.xmdl009
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_xmdl033    LIKE xmdl_t.xmdl033
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_xmdl033 = ''
   
   IF NOT cl_null(p_xmdk007) AND
      NOT cl_null(p_xmdl008) AND
      NOT p_xmdl009 IS NULL THEN
      
      #161221-00064#17 mod-S
#      CALL s_apmi070_get_pmao004(p_xmdk007,p_xmdl008,p_xmdl009)
      CALL s_apmi070_get_pmao004_2(p_xmdk007,p_xmdl008,p_xmdl009,'2')
      #161221-00064#17 mod-E
      RETURNING r_success,r_xmdl033
   
   END IF
   
   RETURN r_success,r_xmdl033

END FUNCTION

################################################################################
# Descriptions...: 由客戶料號得出料號及產品特徵
# Memo...........:
# Usage..........: CALL s_axmt540_makings_no(p_xmdkdocno,p_xmdk007,p_xmdl008,p_xmdl009,p_xmdl033)
#                  RETURNING r_success,r_xmdl008,r_xmdl009
# Input parameter: p_xmdkdocno 單據單號
#                : p_xmdk007   訂單客戶
#                : p_xmdl008   料件編號
#                : p_xmdl009   產品特徵
#                : p_xmdl033   客戶料號
# Return code....: r_success   執行結果
#                : r_xmdl008   料件編號
#                : r_xmdl009   產品特徵
#                : l_flag      是否要自動將客戶料號、料件編號、產品特徵回寫至料號對應維檔中
# Date & Author..: 140728 By earl
#                : 180129-00048#1 2018/01/30 By 10046 增加l_flag回傳值
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_makings_no(p_xmdkdocno,p_xmdk007,p_xmdl008,p_xmdl009,p_xmdl033)
   DEFINE p_xmdkdocno    LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdk007      LIKE xmdk_t.xmdk007
   DEFINE p_xmdl008      LIKE xmdl_t.xmdl008
   DEFINE p_xmdl009      LIKE xmdl_t.xmdl009   
   DEFINE p_xmdl033      LIKE xmdl_t.xmdl033
   
   DEFINE r_success      LIKE type_t.num5
   DEFINE r_xmdl008      LIKE xmdl_t.xmdl008
   DEFINE r_xmdl009      LIKE xmdl_t.xmdl009
   
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_flag         LIKE type_t.chr1
   
   WHENEVER ERROR CONTINUE
   LET l_flag='N' 
   LET r_success = TRUE
   LET r_xmdl008 = p_xmdl008
   LET r_xmdl009 = p_xmdl009
      
   IF NOT cl_null(p_xmdk007) AND NOT cl_null(p_xmdl033) THEN

      IF NOT cl_null(p_xmdl008) AND NOT p_xmdl009 IS NULL THEN   #已有輸入料號
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt
           FROM pmao_t
          WHERE pmaoent = g_enterprise
            AND pmao001 = p_xmdk007
            AND pmao002 = p_xmdl008
            AND pmao003 = p_xmdl009
            AND pmao004 = p_xmdl033
            AND pmao000 = '2' #161221-00064#17 add

         IF l_cnt = 0 THEN      #apmi070無該筆資料
            IF cl_ask_confirm('axm-00445') THEN   #當前的客戶編號+客戶料號不存在於料號對應維檔中，是否要自動將客戶料號、料件編號、產品特徵回寫至料號對應維檔中
                LET l_flag='Y' 
               #IF NOT s_axmt500_ins_pmao(p_xmdkdocno,p_xmdk007,p_xmdl008,p_xmdl009,p_xmdl033) THEN
               #   LET r_success = FALSE
               #   RETURN r_success,r_xmdl008,r_xmdl009
               #END IF
            ELSE
               LET r_success = FALSE
               RETURN r_success,r_xmdl008,r_xmdl009
               #,l_flag
               ,l_flag   #180129-00048#1 add
            END IF
         ELSE                    #apmi070有資料
            #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
            INITIALIZE g_chkparam.* TO NULL
               
            #設定g_chkparam.*的參數
            LET g_chkparam.arg1 = p_xmdk007
            LET g_chkparam.arg2 = p_xmdl008
            LET g_chkparam.arg3 = p_xmdl009
            LET g_chkparam.arg4 = p_xmdl033
            LET g_errshow = TRUE                                                                                                #160328-00029#4
            LET g_chkparam.err_str[1] = "apm-00261:sub-01302|apmi120|",cl_get_progname("apmi120",g_lang,"2"),"|:EXEPROGapmi120" #160328-00029#4
            #161026-00025#1-s
            LET g_chkparam.err_str[2] = "apm-00260:axm-00053|axmi120|",cl_get_progname("axmi120",g_lang,"2"),"|:EXEPROGaxmi120"
            #161026-00025#1-e
            #呼叫檢查存在並帶值的library
            IF NOT cl_chk_exist("v_pmao004") THEN
               LET r_success = FALSE
               RETURN r_success,r_xmdl008,r_xmdl009
               #,l_flag
               ,l_flag   #180129-00048#1 add
            END IF
         END IF

      ELSE     #未輸入料號，由客戶料號帶出料號及產品特徵
         #161221-00064#17 mod-S
#         CALL s_apmi070_get_pmao002_pmao003(p_xmdk007,p_xmdl033) RETURNING r_success,r_xmdl008,r_xmdl009
         CALL s_apmi070_get_pmao002_pmao003_2(p_xmdk007,p_xmdl033,'2') RETURNING r_success,r_xmdl008,r_xmdl009
         #161221-00064#17 mod-E
         IF NOT r_success THEN
            RETURN r_success,r_xmdl008,r_xmdl009
            #,l_flag
            ,l_flag   #180129-00048#1 add
         END IF
      END IF
   END IF

   RETURN r_success,r_xmdl008,r_xmdl009,l_flag

END FUNCTION

################################################################################
# Descriptions...: 檢查aini001儲位控管是否為5.不使用儲位管理
# Memo...........:
# Usage..........: CALL s_axmt540_inaa007_chk(p_xmdl014)
#                  RETURNING r_success
# Input parameter: p_xmdl014      庫位
#                : 
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140728 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inaa007_chk(p_xmdl014)
   DEFINE p_xmdl014     LIKE xmdl_t.xmdl014
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_inaa007     LIKE inaa_t.inaa007
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF NOT cl_null(p_xmdl014) THEN
      LET l_inaa007 = ''
      SELECT inaa007 INTO l_inaa007
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = g_site
         AND inaa001 = p_xmdl014
         
      #儲位控管若為5.不使用儲位控管   
      IF l_inaa007 = '5' THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: xrcd_t刪除
# Memo...........:
# Usage..........: CALL s_axmt540_tax_delete(p_xmdldocno,p_xmdlseq,p_type)
#                  RETURNING r_success
# Input parameter: p_xmdldocno   #單據單號
#                : p_xmdlseq     #單據項次
#                : p_type        #1.單據單號全刪  2.僅刪除單據項次
# Return code....: r_success     #執行結果
#                : 
# Date & Author..: 140801 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_tax_delete(p_xmdldocno,p_xmdlseq,p_type)
   #暫時用，待財務完成後改用財務元件
   DEFINE p_xmdldocno   LIKE xmdl_t.xmdldocno
   DEFINE p_xmdlseq     LIKE xmdl_t.xmdlseq
   DEFINE p_type        LIKE type_t.chr5
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sql         STRING
 
   WHENEVER ERROR CONTINUE
 
   LET r_success = TRUE
   
   IF cl_null(p_type) OR p_type NOT MATCHES '[12]' THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF NOT cl_null(p_xmdldocno) THEN
      IF p_type = '1' THEN
         DELETE FROM xrcd_t
          WHERE xrcdent = g_enterprise
            AND xrcddocno = p_xmdldocno
            
      ELSE
         DELETE FROM xrcd_t
          WHERE xrcdent = g_enterprise
            AND xrcddocno = p_xmdldocno
            AND xrcdseq = p_xmdlseq
            
      END IF

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'DELETE'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         RETURN r_success      
      END IF
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 直送訂單流程
# Memo...........:
# Usage..........: CALL s_axmt540_direct_process(p_type,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_type         1.檢核是否有對應的採購單  2.產生對應的收貨入庫單並過帳
#                : p_xmdkdocno    出貨單號
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 140812 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_direct_process(p_type,p_xmdkdocno)
   DEFINE p_type          LIKE type_t.chr1
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_sql_ins       STRING
   DEFINE l_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006
   DEFINE l_xmdc032       LIKE xmdc_t.xmdc032
   DEFINE l_n             LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET l_sql = "SELECT xmdl003,xmdl004,xmdl005,xmdl006",
               "  FROM xmdl_t",
               " WHERE xmdlent = '",g_enterprise,"'",
               "   AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre14 FROM l_sql
   DECLARE s_axmt540_cs14 CURSOR FOR s_axmt540_pre14
   
   LET l_sql = "SELECT xmdc032",
               "  FROM xmdc_t",
               " WHERE xmdcent = '",g_enterprise,"'",
               "   AND xmdcdocno = ?",
               "   AND xmdcseq = ?"
   PREPARE s_axmt540_pre15 FROM l_sql

   LET l_sql = "SELECT COUNT(pmdpseq1)",
               "  FROM pmdl_t,pmdp_t",
               " WHERE pmdlent = pmdpent AND pmdpent = '",g_enterprise,"'",
               "   AND pmdldocno = pmdpdocno",
               "   AND pmdlstus = 'Y'",
               "   AND pmdp003 = ?",
               "   AND pmdp004 = ?",
               "   AND pmdp005 = ?",
               "   AND pmdp006 = ?"
   PREPARE s_axmt540_pre19 FROM l_sql


   LET l_sql_ins = '('
   FOREACH s_axmt540_cs14 INTO l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
   
      IF cl_null(l_xmdl003) OR cl_null(l_xmdl004)
         OR cl_null(l_xmdl005) OR cl_null(l_xmdl006) THEN         
         CONTINUE FOREACH
      END IF

      #取貨模式xmdc032
      LET l_xmdc032 = ''
      EXECUTE s_axmt540_pre15 USING l_xmdl003,l_xmdl004 INTO l_xmdc032
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF l_xmdc032 = '3' THEN  #3.供應商直送
         IF p_type = '1' THEN  #檢核是否有對應的採購單
            #是否存在採購單
            LET l_n = 0
            EXECUTE s_axmt540_pre19 USING l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006 INTO l_n
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "EXECUTE:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
          
               LET r_success = FALSE
               EXIT FOREACH
            END IF
          
            IF l_n = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00424'   #直送訂單%1項次%2項序%3分批序%4查無對應的已確認採購單，不可過帳！
               LET g_errparam.extend = ""
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_xmdl003
               LET g_errparam.replace[2] = l_xmdl004
               LET g_errparam.replace[3] = l_xmdl005
               LET g_errparam.replace[4] = l_xmdl006
               CALL cl_err()
          
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
         END IF
         
         IF p_type = '2' THEN  #產生對應的收貨入庫單並過帳
            #先記錄下直送訂單來源
            LET l_sql_ins = l_sql_ins,
                            " (pmdp003 = '",l_xmdl003,"'",
                            " AND pmdp004 = '",l_xmdl004,"'",
                            " AND pmdp005 = '",l_xmdl005,"'",
                            " AND pmdp006 = '",l_xmdl006,"') OR"
         END IF
      END IF
   
   END FOREACH

   IF NOT r_success THEN
      RETURN r_success
   END IF

   IF p_type = '2' THEN  #產生對應的收貨入庫單並過帳      
      #去掉最後的"OR"
      LET l_sql_ins = l_sql_ins.subString(1,l_sql_ins.getLength() - 3)
      IF NOT cl_null(l_sql_ins) THEN
         LET l_sql_ins = l_sql_ins,")"
         
         #直送訂單產生收貨入庫單並過帳
         CALL s_axmt540_receipt_insert(l_sql_ins,p_xmdkdocno) RETURNING r_success
         IF NOT r_success THEN
            RETURN r_success
         END IF
   
      END IF      
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 直送訂單產生收貨入庫單並過帳
# Memo...........:
# Usage..........: CALL s_axmt540_receipt_insert(p_sql,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_sql       來源訂單SQL
#                : p_xmdkdocno 出貨單號
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 140814 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_receipt_insert(p_sql,p_xmdkdocno)
   DEFINE p_sql           STRING
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
                          
   DEFINE l_sql           STRING
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_slip          LIKE pmds_t.pmdsdocno
   
   DEFINE l_success_doc   DYNAMIC ARRAY OF RECORD
            pmdsdocno       LIKE pmds_t.pmdsdocno
                          END RECORD
   #180806-00038#1 -S add
   DEFINE l_xmdl004       LIKE xmdl_t.xmdl004
   DEFINE l_xmdl005       LIKE xmdl_t.xmdl005
   DEFINE l_xmdl006       LIKE xmdl_t.xmdl006
   #180806-00038#1 -E add
   #收貨/入庫單頭檔
   DEFINE l_pmds   RECORD
          pmdssite   LIKE pmds_t.pmdssite,
          pmdsdocno  LIKE pmds_t.pmdsdocno,
          pmdsdocdt  LIKE pmds_t.pmdsdocdt,
          pmds000    LIKE pmds_t.pmds000,
          pmds001    LIKE pmds_t.pmds001,
          pmds002    LIKE pmds_t.pmds002,
          pmds003    LIKE pmds_t.pmds003,

          pmds006    LIKE pmds_t.pmds006,
          pmds007    LIKE pmds_t.pmds007,
          pmds008    LIKE pmds_t.pmds008,
          pmds009    LIKE pmds_t.pmds009,

          pmds011    LIKE pmds_t.pmds011,

          pmds014    LIKE pmds_t.pmds014,

          pmds021    LIKE pmds_t.pmds021,

          pmds028    LIKE pmds_t.pmds028,

          pmds031    LIKE pmds_t.pmds031,
          pmds032    LIKE pmds_t.pmds032,
          pmds033    LIKE pmds_t.pmds033,
          pmds034    LIKE pmds_t.pmds034,
          pmds035    LIKE pmds_t.pmds035,

          pmds037    LIKE pmds_t.pmds037,
          pmds038    LIKE pmds_t.pmds038,
          pmds039    LIKE pmds_t.pmds039,
          pmds040    LIKE pmds_t.pmds040,
          pmds041    LIKE pmds_t.pmds041,

          pmds043    LIKE pmds_t.pmds043,
          pmds044    LIKE pmds_t.pmds044,

          pmds046    LIKE pmds_t.pmds046,
          pmds047    LIKE pmds_t.pmds047,
          pmds048    LIKE pmds_t.pmds048,
          pmds049    LIKE pmds_t.pmds049,
          pmds050    LIKE pmds_t.pmds050,
          pmds051    LIKE pmds_t.pmds051,

          pmdsownid  LIKE pmds_t.pmdsownid,
          pmdsowndp  LIKE pmds_t.pmdsowndp,
          pmdscrtid  LIKE pmds_t.pmdscrtid,
          pmdscrtdp  LIKE pmds_t.pmdscrtdp,
          pmdscrtdt  LIKE pmds_t.pmdscrtdt,
          pmdsstus   LIKE pmds_t.pmdsstus
                END RECORD

   DEFINE l_pmdt    RECORD
          pmdtseq    LIKE pmdt_t.pmdtseq,
          pmdt001    LIKE pmdt_t.pmdt001,
          pmdt002    LIKE pmdt_t.pmdt002,
          pmdt003    LIKE pmdt_t.pmdt003,
          pmdt004    LIKE pmdt_t.pmdt004,
          pmdt005    LIKE pmdt_t.pmdt005,
          pmdt006    LIKE pmdt_t.pmdt006,
          pmdt007    LIKE pmdt_t.pmdt007,
          pmdt008    LIKE pmdt_t.pmdt008,
          pmdt009    LIKE pmdt_t.pmdt009,
          pmdt010    LIKE pmdt_t.pmdt010,
          pmdt011    LIKE pmdt_t.pmdt011,
          
          pmdt016    LIKE pmdt_t.pmdt016,
          pmdt017    LIKE pmdt_t.pmdt017,
          pmdt018    LIKE pmdt_t.pmdt018,
          pmdt019    LIKE pmdt_t.pmdt019,
          pmdt020    LIKE pmdt_t.pmdt020,
          pmdt021    LIKE pmdt_t.pmdt021,
          pmdt022    LIKE pmdt_t.pmdt022,
          pmdt023    LIKE pmdt_t.pmdt023,
          pmdt024    LIKE pmdt_t.pmdt024,
          pmdt025    LIKE pmdt_t.pmdt025,
          pmdt026    LIKE pmdt_t.pmdt026,
          
          pmdt036    LIKE pmdt_t.pmdt036,
          pmdt037    LIKE pmdt_t.pmdt037,
          pmdt038    LIKE pmdt_t.pmdt038,
          pmdt039    LIKE pmdt_t.pmdt039,
          pmdt040    LIKE pmdt_t.pmdt040,
          pmdt041    LIKE pmdt_t.pmdt041,
          pmdt042    LIKE pmdt_t.pmdt042,
          pmdt043    LIKE pmdt_t.pmdt043,
          pmdt044    LIKE pmdt_t.pmdt044,
          pmdt045    LIKE pmdt_t.pmdt045,
          pmdt046    LIKE pmdt_t.pmdt046,
          pmdt047    LIKE pmdt_t.pmdt047,
          
          pmdt052    LIKE pmdt_t.pmdt052,
          
          pmdt062    LIKE pmdt_t.pmdt062,
          pmdt063    LIKE pmdt_t.pmdt063,
          pmdt064    LIKE pmdt_t.pmdt064,
          pmdt065    LIKE pmdt_t.pmdt065
         ,pmdt084    LIKE pmdt_t.pmdt084  #170906-00038#1 add 
                END RECORD

   DEFINE l_pmdu    RECORD
          pmduseq1   LIKE pmdu_t.pmduseq1,
          pmdu001    LIKE pmdu_t.pmdu001,
          pmdu002    LIKE pmdu_t.pmdu002,
          pmdu003    LIKE pmdu_t.pmdu003,
          pmdu004    LIKE pmdu_t.pmdu004,
          pmdu005    LIKE pmdu_t.pmdu005,
          pmdu006    LIKE pmdu_t.pmdu006,
          pmdu007    LIKE pmdu_t.pmdu007,
          pmdu008    LIKE pmdu_t.pmdu008,
          pmdu009    LIKE pmdu_t.pmdu009,
          pmdu010    LIKE pmdu_t.pmdu010,
          pmdu011    LIKE pmdu_t.pmdu011,
          pmdu012    LIKE pmdu_t.pmdu012,
          pmdu013    LIKE pmdu_t.pmdu013,
          pmdu014    LIKE pmdu_t.pmdu014,
          pmdu015    LIKE pmdu_t.pmdu015
                END RECORD

   DEFINE l_pmdl    RECORD
          pmdldocno  LIKE pmdl_t.pmdldocno,
          pmdl004    LIKE pmdl_t.pmdl004,
          pmdl005    LIKE pmdl_t.pmdl005,
          pmdl006    LIKE pmdl_t.pmdl006,
          pmdl009    LIKE pmdl_t.pmdl009,
          pmdl010    LIKE pmdl_t.pmdl010,
          pmdl011    LIKE pmdl_t.pmdl011,
          pmdl012    LIKE pmdl_t.pmdl012,
          pmdl013    LIKE pmdl_t.pmdl013,
          pmdl015    LIKE pmdl_t.pmdl015,
          pmdl017    LIKE pmdl_t.pmdl017,
          pmdl018    LIKE pmdl_t.pmdl018,
          pmdl021    LIKE pmdl_t.pmdl021,
          pmdl022    LIKE pmdl_t.pmdl022,
          pmdl028    LIKE pmdl_t.pmdl028,
          pmdl031    LIKE pmdl_t.pmdl031,          
          pmdl054    LIKE pmdl_t.pmdl054,
          pmdl055    LIKE pmdl_t.pmdl055
                END RECORD                

   DEFINE l_pmdp    RECORD
          pmdp003    LIKE pmdp_t.pmdp003,
          pmdp004    LIKE pmdp_t.pmdp004,
          pmdp005    LIKE pmdp_t.pmdp005,
          pmdp006    LIKE pmdp_t.pmdp006          
                END RECORD

   DEFINE l_pmdn    RECORD
          pmdn003    LIKE pmdn_t.pmdn003,
          pmdn004    LIKE pmdn_t.pmdn004,
          pmdn005    LIKE pmdn_t.pmdn005,
          pmdn006    LIKE pmdn_t.pmdn006,
          pmdn008    LIKE pmdn_t.pmdn008,
          pmdn010    LIKE pmdn_t.pmdn010,
          pmdn015    LIKE pmdn_t.pmdn015,    #160428-00015#1  add pmdn015
          pmdn016    LIKE pmdn_t.pmdn016,
          pmdn017    LIKE pmdn_t.pmdn017,
          pmdn020    LIKE pmdn_t.pmdn020,
          pmdn021    LIKE pmdn_t.pmdn021,
          pmdn035    LIKE pmdn_t.pmdn035,
          pmdn040    LIKE pmdn_t.pmdn040,
          pmdn041    LIKE pmdn_t.pmdn041,
          pmdn042    LIKE pmdn_t.pmdn042,
          pmdn044    LIKE pmdn_t.pmdn044
                END RECORD

   DEFINE l_pmdo    RECORD
          pmdoseq    LIKE pmdo_t.pmdoseq,
          pmdoseq1   LIKE pmdo_t.pmdoseq1,
          pmdoseq2   LIKE pmdo_t.pmdoseq2,
          pmdo003    LIKE pmdo_t.pmdo003
                END RECORD

   DEFINE l_xmdl    RECORD
          xmdlseq    LIKE xmdl_t.xmdlseq,
          xmdl008    LIKE xmdl_t.xmdl008,
          xmdl009    LIKE xmdl_t.xmdl009,          
          xmdl013    LIKE xmdl_t.xmdl013,
          xmdl014    LIKE xmdl_t.xmdl014,
          xmdl015    LIKE xmdl_t.xmdl015,
          xmdl016    LIKE xmdl_t.xmdl016,
          xmdl018    LIKE xmdl_t.xmdl018,
          xmdl020    LIKE xmdl_t.xmdl020,
          xmdl022    LIKE xmdl_t.xmdl022,
          xmdl024    LIKE xmdl_t.xmdl024,
          xmdl052    LIKE xmdl_t.xmdl052
                END RECORD

   DEFINE l_xmdm    RECORD
          xmdmseq1   LIKE xmdm_t.xmdmseq1,
          xmdm005    LIKE xmdm_t.xmdm005,
          xmdm006    LIKE xmdm_t.xmdm006,
          xmdm007    LIKE xmdm_t.xmdm007,
          xmdm009    LIKE xmdm_t.xmdm009,
          xmdm011    LIKE xmdm_t.xmdm011
                END RECORD

   DEFINE l_xrcd    RECORD   
          xrcd103    LIKE xrcd_t.xrcd103,
          xrcd104    LIKE xrcd_t.xrcd104,
          xrcd105    LIKE xrcd_t.xrcd105,
          xrcd113    LIKE xrcd_t.xrcd113,
          xrcd114    LIKE xrcd_t.xrcd114,
          xrcd115    LIKE xrcd_t.xrcd115
                END RECORD

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   LET l_sql = "SELECT DISTINCT pmdldocno,pmdl004,",
               "                pmdl005,pmdl006,pmdl009,pmdl010,",
               "                pmdl011,pmdl012,pmdl013,pmdl015,",
               "                pmdl017,pmdl018,pmdl021,pmdl022,",
               "                pmdl028,pmdl031,pmdl054,pmdl055",
               "  FROM pmdl_t,pmdp_t",
               " WHERE pmdlent = pmdpent AND pmdpent = ",g_enterprise,
               "   AND pmdldocno = pmdpdocno",
               "   AND pmdlstus = 'Y'"
   LET l_sql = l_sql," AND ",p_sql

   PREPARE s_axmt540_pre21 FROM l_sql
   DECLARE s_axmt540_cs21 CURSOR FOR s_axmt540_pre21
   
   #200415-00017#1 add---start---
   LET l_sql = "SELECT xmdl004,xmdl005,xmdl006 ",
               "  FROM xmdl_t ",
               " WHERE xmdlent = '",g_enterprise,"' ",
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               "   AND EXISTS(SELECT 1 FROM xmdc_t where xmdcent = xmdlent",
               "              AND xmdcdocno = xmdl003 AND xmdcseq = xmdl004 AND xmdc032 = '3')",
               "   AND EXISTS(SELECT 1 FROM pmdp_t WHERE pmdpent = xmdlent",
               "              AND pmdp003 = xmdl003 AND pmdp004 = xmdl004 AND pmdpdocno = ? )"
   PREPARE s_axmt540_cs22pre FROM l_sql
   DECLARE s_axmt540_cs22 CURSOR FOR s_axmt540_cs22pre
   #200415-00017#1 add---end---

   LET l_sql = "SELECT DISTINCT pmdp003,pmdp004,pmdp005,pmdp006,",
               "                pmdoseq,pmdoseq1,pmdoseq2,",
               "                pmdo003,",   
               "                pmdn003,pmdn004,pmdn005,pmdn006,pmdn008,pmdn010,",
               "                pmdn015,pmdn016,pmdn017,",   #160428-00015#1 add pmdn015
               "                pmdn020,pmdn021,",
               "                pmdn035,pmdn040,",
               "                pmdn041,pmdn042,pmdn044",
               #170609-00040#1 add---start---
               "   FROM pmdp_t ",
               " LEFT JOIN pmdn_t ON pmdnent = pmdpent AND pmdnsite = pmdpsite AND pmdndocno = pmdpdocno AND pmdnseq = pmdpseq ",
               " LEFT JOIN pmdo_t ON pmdoent = pmdpent AND pmdosite = pmdpsite AND pmdodocno = pmdpdocno AND pmdoseq = pmdpseq AND pmdoseq2 = pmdp006 ",
               "  WHERE pmdpent = '",g_enterprise,"'",
               "    AND pmdpsite = '",g_site,"'",               
               "    AND pmdpdocno = ?"
               #170609-00040#1 mark---start---
               #"  FROM pmdn_t,pmdo_t,pmdp_t",
               #" WHERE pmdnent = pmdoent AND pmdoent = pmdpent AND pmdpent = '",g_enterprise,"'",
               #"   AND pmdndocno = pmdodocno AND pmdodocno = pmdpdocno",
               #"   AND pmdnseq = pmdoseq AND pmdoseq = pmdpseq",
               #"   AND pmdoseq1 = pmdpseq1",
               #"   AND pmdndocno = ?"
               #170609-00040#1 mark---end---
   LET l_sql = l_sql," AND ",p_sql
   
   #180806-00038#1 -S add
   #只找出這次要出貨的項次、項序、分批序
   LET l_xmdl004 = ''
   LET l_xmdl005 = ''
   LET l_xmdl006 = ''
   #200415-00017#1 mark---start---
   #DECLARE s_axmt540_cs22 CURSOR FOR
   #SELECT xmdl004,xmdl005,xmdl006
   #  FROM xmdl_t
   # WHERE xmdlent = g_enterprise
   #   AND xmdldocno = p_xmdkdocno
   #   AND EXISTS(SELECT 1 FROM xmdc_t where xmdcent = xmdlent                        #190722-00039#1 add
   #              AND xmdcdocno = xmdl003 AND xmdcseq = xmdl004 AND xmdc032 = '3')    #190722-00039#1 add
   #200415-00017#1 mark---end---
   
   
   LET l_sql = " SELECT pmdp003,pmdp004,pmdp005,pmdp006,pmdoseq,",
               "        pmdoseq1,pmdoseq2,pmdo003,pmdn003,pmdn004,",
               "        pmdn005,pmdn006,pmdn008,pmdn010,pmdn015,",
               "        pmdn016,pmdn017,pmdn020,pmdn021,pmdn035,",
               "        pmdn040,pmdn041,pmdn042,pmdn044",
               "   FROM (",l_sql,") tsed",
               #190507-00045#1--add--begin----  
               "  WHERE pmdp004 = ?",
               "    AND pmdp005 = ?",
               "    AND pmdp006 = ?"             
               #190507-00045#1---add--begin----  
               #190507-00045#1---mark--begin----               
#               "  WHERE pmdoseq = ?",
#               "    AND pmdoseq1 = ?",
#               "    AND pmdoseq2 = ?"
#               "    ,AND pmdp004 = pmdoseq",
#               "    AND pmdp005 = pmdoseq1",
#               "    AND pmdp006 = pmdoseq2"
                #190507-00045#1---mark--end----
                
   #180806-00038#1 -E add
   LET l_sql = l_sql ," AND ROWNUM = 1 "   #200820-00037#1 add

#200916-00013#1-S add
#200916-00013#1-E add

   PREPARE s_axmt540_pre22 FROM l_sql
   #DECLARE s_axmt540_cs22 CURSOR FOR s_axmt540_pre22  #180806-00038#1 mark

   LET l_sql = "SELECT xmdlseq,xmdl008,xmdl009,",
               "       xmdl013,xmdl014,xmdl015,xmdl016,",
               "       xmdl018,xmdl020,xmdl022,xmdl024,",
               "       xmdl052",
               "  FROM xmdl_t",
               " WHERE xmdlent = '",g_enterprise,"'",
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               "   AND xmdl003 = ?",
               "   AND xmdl004 = ?",
               "   AND xmdl005 = ?",
               "   AND xmdl006 = ?"
   PREPARE s_axmt540_pre23 FROM l_sql

   LET l_sql = " SELECT MAX(pmdtseq)+1 FROM pmdt_t",
               " WHERE pmdtent = '",g_enterprise,"'",
               "   AND pmdtdocno = ?"
   PREPARE s_axmt540_pre25 FROM l_sql

   LET l_sql = "SELECT xmdmseq1,",
               "       xmdm005,xmdm006,xmdm007,",
               "       xmdm009,xmdm011",
               "  FROM xmdm_t",
               " WHERE xmdment = '",g_enterprise,"'",
               "   AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdmseq = ?",
               " ORDER BY xmdmseq1"
   PREPARE s_axmt540_pre27 FROM l_sql
   DECLARE s_axmt540_cs27 CURSOR FOR s_axmt540_pre27

   LET l_n = 0
   CALL l_success_doc.clear()
   INITIALIZE l_pmdl.* TO NULL
   FOREACH s_axmt540_cs21 INTO l_pmdl.pmdldocno,l_pmdl.pmdl004,
                               l_pmdl.pmdl005,l_pmdl.pmdl006,l_pmdl.pmdl009,l_pmdl.pmdl010,
                               l_pmdl.pmdl011,l_pmdl.pmdl012,l_pmdl.pmdl013,l_pmdl.pmdl015,
                               l_pmdl.pmdl017,l_pmdl.pmdl018,l_pmdl.pmdl021,l_pmdl.pmdl022,
                               l_pmdl.pmdl028,l_pmdl.pmdl031,l_pmdl.pmdl054,l_pmdl.pmdl055                               
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #塞pmds_t
      INITIALIZE l_pmds.* TO NULL
      LET l_pmds.pmdssite = g_site  
     #LET l_pmds.pmdsdocdt = g_today   #180430-00014#1 mark      
      LET l_pmds.pmds000 = '3'  #採購收貨入庫單 apmt530
      #LET l_pmds.pmds001 = g_today   #180410-00055#1  mark
      # 180410-00055#1 add----s------
      #收货单默认过账日期与出货单过账日期相同，否则会导致库存不足
      SELECT xmdk001 INTO l_pmds.pmds001 FROM xmdk_t WHERE xmdkent=g_enterprise 
                                                   AND xmdksite=g_site AND xmdkdocno=p_xmdkdocno
      
      # 180410-00055#1 add---e------  
      LET l_pmds.pmdsdocdt = l_pmds.pmds001 #180430-00014#1 add      
      LET l_pmds.pmds002 = g_user
      LET l_pmds.pmds003 = g_dept

      LET l_pmds.pmds006 = l_pmdl.pmdldocno
      LET l_pmds.pmds007 = l_pmdl.pmdl004
      LET l_pmds.pmds008 = l_pmdl.pmdl021
      LET l_pmds.pmds009 = l_pmdl.pmdl022

      LET l_pmds.pmds011 = l_pmdl.pmdl005

      #多角性質
      LET l_pmds.pmds014 = l_pmdl.pmdl006

      LET l_pmds.pmds021 = 'N'
      
      LET l_pmds.pmds028 = l_pmdl.pmdl028
      
      LET l_pmds.pmds031 = l_pmdl.pmdl009
      LET l_pmds.pmds032 = l_pmdl.pmdl010
      LET l_pmds.pmds033 = l_pmdl.pmdl011
      LET l_pmds.pmds034 = l_pmdl.pmdl012
      LET l_pmds.pmds035 = l_pmdl.pmdl013
      
      LET l_pmds.pmds037 = l_pmdl.pmdl015
      
      LET l_pmds.pmds039 = l_pmdl.pmdl017
      LET l_pmds.pmds040 = l_pmdl.pmdl018
      LET l_pmds.pmds041 = l_pmdl.pmdl031

      LET l_pmds.pmds047 = 'N'
      LET l_pmds.pmds048 = l_pmdl.pmdl054
      LET l_pmds.pmds049 = l_pmdl.pmdl055
      LET l_pmds.pmds050 = 'N'
      LET l_pmds.pmds051 = p_xmdkdocno    #對應出貨單號

      LET l_pmds.pmdsownid = g_user
      LET l_pmds.pmdsowndp = g_dept
      LET l_pmds.pmdscrtid = g_user
      LET l_pmds.pmdscrtdp = g_dept
      LET l_pmds.pmdscrtdt = cl_get_current()
      LET l_pmds.pmdsstus = 'N'

      #取單別，只取一次
      IF l_n = 0 THEN
         CALL s_aooi210_get_doc(g_site,'','2',l_pmdl.pmdldocno,'apmt530','axm-00436') RETURNING r_success,l_slip
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
      END IF

      #自動產生收貨入庫單號pmdsdocno
      CALL s_aooi200_gen_docno(g_site,l_slip,l_pmds.pmdsdocdt,'apmt530') RETURNING r_success,l_pmds.pmdsdocno
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      #帶出匯率
      CALL s_axmt540_get_exchange(l_pmds.pmds048,l_pmds.pmds037,l_pmds.pmdsdocdt) RETURNING l_pmds.pmds038   #modify--151118-00012#1 By shiun   增加傳入參數l_pmds.pmdsdocdt

      INSERT INTO pmds_t (pmdsent,pmdssite,pmdsdocno,pmdsdocdt,
                          pmds000,pmds001,pmds002,pmds003,
                          pmds006,pmds007,pmds008,pmds009,
                          pmds011,pmds014,
                          pmds021,pmds028,
                          pmds031,pmds032,pmds033,pmds034,pmds035,
                          pmds037,pmds038,pmds039,pmds040,
                          pmds041,
                          pmds047,pmds048,pmds049,pmds050,
                          pmds051,
                          pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp,pmdscrtdt,pmdsstus)
           VALUES (g_enterprise,l_pmds.pmdssite,l_pmds.pmdsdocno,l_pmds.pmdsdocdt,
                   l_pmds.pmds000,l_pmds.pmds001,l_pmds.pmds002,l_pmds.pmds003,
                   l_pmds.pmds006,l_pmds.pmds007,l_pmds.pmds008,l_pmds.pmds009,
                   l_pmds.pmds011,l_pmds.pmds014,
                   l_pmds.pmds021,l_pmds.pmds028,
                   l_pmds.pmds031,l_pmds.pmds032,l_pmds.pmds033,l_pmds.pmds034,l_pmds.pmds035,
                   l_pmds.pmds037,l_pmds.pmds038,l_pmds.pmds039,l_pmds.pmds040,
                   l_pmds.pmds041,
                   l_pmds.pmds047,l_pmds.pmds048,l_pmds.pmds049,l_pmds.pmds050,
                   l_pmds.pmds051,
                   l_pmds.pmdsownid,l_pmds.pmdsowndp,l_pmds.pmdscrtid,l_pmds.pmdscrtdp,l_pmds.pmdscrtdt,l_pmds.pmdsstus)

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT:" 
         LET g_errparam.code = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #單身
      INITIALIZE l_pmdp.* TO NULL
      INITIALIZE l_pmdo.* TO NULL
      INITIALIZE l_pmdn.* TO NULL
      #180806-00038#1 -S mark
      #OPEN s_axmt540_cs22 USING l_pmdl.pmdldocno
      #FOREACH s_axmt540_cs22 INTO l_pmdp.pmdp003,l_pmdp.pmdp004,l_pmdp.pmdp005,l_pmdp.pmdp006,
      #180806-00038#1 -E mark
      #180806-00038#1 -S add
      #FOREACH s_axmt540_cs22 INTO l_xmdl004,l_xmdl005,l_xmdl006                         #200415-00017#1 mark
      FOREACH s_axmt540_cs22 USING l_pmdl.pmdldocno INTO l_xmdl004,l_xmdl005,l_xmdl006   #200415-00017#1 add
         EXECUTE s_axmt540_pre22 USING l_pmdl.pmdldocno,l_xmdl004,l_xmdl005,l_xmdl006
                             INTO l_pmdp.pmdp003,l_pmdp.pmdp004,l_pmdp.pmdp005,l_pmdp.pmdp006,
      #180806-00038#1 -E add
                                  l_pmdo.pmdoseq,l_pmdo.pmdoseq1,l_pmdo.pmdoseq2,
                                  l_pmdo.pmdo003, 
                                  l_pmdn.pmdn003,l_pmdn.pmdn004,l_pmdn.pmdn005,l_pmdn.pmdn006,l_pmdn.pmdn008,l_pmdn.pmdn010,
                                  l_pmdn.pmdn015,l_pmdn.pmdn016,l_pmdn.pmdn017,   #160428-00015#1 add pmdn015
                                  l_pmdn.pmdn020,l_pmdn.pmdn021,
                                  l_pmdn.pmdn035,l_pmdn.pmdn040,
                                  l_pmdn.pmdn041,l_pmdn.pmdn042,l_pmdn.pmdn044

         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
       
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #塞pmdt_t      
         INITIALIZE l_pmdt.* TO NULL
         LET l_pmdt.pmdt001 = l_pmds.pmds006
         LET l_pmdt.pmdt002 = l_pmdo.pmdoseq
         LET l_pmdt.pmdt003 = l_pmdo.pmdoseq1
         LET l_pmdt.pmdt004 = l_pmdo.pmdoseq2
         LET l_pmdt.pmdt005 = l_pmdo.pmdo003
         LET l_pmdt.pmdt008 = l_pmdn.pmdn003
         LET l_pmdt.pmdt009 = l_pmdn.pmdn004
         LET l_pmdt.pmdt010 = l_pmdn.pmdn005

         LET l_pmdt.pmdt019 = l_pmdn.pmdn006
         
         LET l_pmdt.pmdt021 = l_pmdn.pmdn008
         
         LET l_pmdt.pmdt023 = l_pmdn.pmdn010
         
         LET l_pmdt.pmdt025 = l_pmdn.pmdn020
         LET l_pmdt.pmdt026 = 'N'
         
         LET l_pmdt.pmdt037 = l_pmdn.pmdn017
         
         LET l_pmdt.pmdt040 = l_pmdn.pmdn035
         LET l_pmdt.pmdt041 = l_pmdn.pmdn021
         LET l_pmdt.pmdt042 = l_pmdn.pmdn040
         LET l_pmdt.pmdt043 = l_pmdn.pmdn041
         LET l_pmdt.pmdt044 = l_pmdn.pmdn042
         LET l_pmdt.pmdt045 = l_pmdn.pmdn044
         LET l_pmdt.pmdt046 = l_pmdn.pmdn016

         LET l_pmdt.pmdt052 = '1'

         #出貨單
         INITIALIZE l_xmdl.* TO NULL
         EXECUTE s_axmt540_pre23 USING l_pmdp.pmdp003,l_pmdp.pmdp004,l_pmdp.pmdp005,l_pmdp.pmdp006
         INTO l_xmdl.xmdlseq,l_xmdl.xmdl008,l_xmdl.xmdl009,
              l_xmdl.xmdl013,l_xmdl.xmdl014,l_xmdl.xmdl015,l_xmdl.xmdl016,
              l_xmdl.xmdl018,l_xmdl.xmdl020,l_xmdl.xmdl022,l_xmdl.xmdl024,
              l_xmdl.xmdl052
              
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "EXECUTE:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
       
            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET l_pmdt.pmdt006 = l_xmdl.xmdl008
         LET l_pmdt.pmdt007 = l_xmdl.xmdl009

         LET l_pmdt.pmdt016 = l_xmdl.xmdl014   #庫位
         LET l_pmdt.pmdt017 = l_xmdl.xmdl015   #儲位
         LET l_pmdt.pmdt018 = l_xmdl.xmdl016   #批號
         LET l_pmdt.pmdt063 = l_xmdl.xmdl052   #庫存管理特徵
         
         LET l_pmdt.pmdt020 = l_xmdl.xmdl018
         LET l_pmdt.pmdt022 = l_xmdl.xmdl020
         LET l_pmdt.pmdt024 = l_xmdl.xmdl022

#160428-00015#1--begin  #取采购单单价
#         LET l_pmdt.pmdt036 = l_xmdl.xmdl024
         LET l_pmdt.pmdt036 = l_pmdn.pmdn015
#160428-00015#1--end         
         LET l_pmdt.pmdt062 = l_xmdl.xmdl013

         LET l_pmdt.pmdt064 = p_xmdkdocno
         LET l_pmdt.pmdt065 = l_xmdl.xmdlseq
         LET l_pmdt.pmdt084 = 'Y'                    #170906-00038#1 add 

         #預設沖銷順序
         LET l_sql = " SELECT MAX(pmdt011)+1 FROM pmdt_t",
                     " WHERE pmdtent = '",g_enterprise,"'",
                     "   AND pmdtdocno = '",l_pmds.pmdsdocno,"'",
                     "   AND pmdt006 = '",l_pmdt.pmdt006,"' AND pmdt007 = '",l_pmdt.pmdt007,"'",
                     "   AND pmdt019 = '",l_pmdt.pmdt019,"'"
         IF NOT cl_null(l_pmdt.pmdt016) THEN
            LET l_sql =  l_sql , " AND pmdt016 = '",l_pmdt.pmdt016,"' "
         END IF
         IF NOT cl_null(l_pmdt.pmdt017) OR l_pmdt.pmdt017 = ' ' THEN
            LET l_sql =  l_sql , " AND pmdt017 = '",l_pmdt.pmdt017,"' "
         END IF
         IF NOT cl_null(l_pmdt.pmdt018) THEN
            LET l_sql =  l_sql , " AND pmdt018 = '",l_pmdt.pmdt018,"' "
         END IF
         PREPARE s_axmt540_pre24 FROM l_sql

         EXECUTE s_axmt540_pre24 INTO l_pmdt.pmdt011
         IF cl_null(l_pmdt.pmdt011) THEN
            LET l_pmdt.pmdt011 = 1
         END IF

         #項次
         EXECUTE s_axmt540_pre25 USING l_pmds.pmdsdocno INTO l_pmdt.pmdtseq
         IF cl_null(l_pmdt.pmdtseq) THEN
            LET l_pmdt.pmdtseq = 1
         END IF

         #稅額計算
         CALL s_apmt520_get_amount(l_pmds.pmdsdocno,l_pmdt.pmdtseq,l_pmdt.pmdt001,l_pmdt.pmdt020,l_pmdt.pmdt036,l_pmdt.pmdt046)
         RETURNING l_pmdt.pmdt038,l_pmdt.pmdt047,l_pmdt.pmdt039
         
         INSERT INTO pmdt_t (pmdtent,pmdtsite,pmdtdocno,pmdtseq,
                             pmdt001,pmdt002,pmdt003,pmdt004,pmdt005,
                             pmdt006,pmdt007,pmdt008,pmdt009,pmdt010,
                             pmdt011,
                             pmdt016,pmdt017,pmdt018,pmdt019,pmdt020,
                             pmdt021,pmdt022,pmdt023,pmdt024,pmdt025,
                             pmdt026,
                             pmdt036,pmdt037,pmdt038,pmdt039,pmdt040,
                             pmdt041,pmdt042,pmdt043,pmdt044,pmdt045,
                             pmdt046,pmdt047,
                             pmdt052,pmdt062,pmdt063,pmdt064,pmdt065,pmdt084)   ##170906-00038#1 add ',pmdt084'
              VALUES (g_enterprise,l_pmds.pmdssite,l_pmds.pmdsdocno,l_pmdt.pmdtseq,
                      l_pmdt.pmdt001,l_pmdt.pmdt002,l_pmdt.pmdt003,l_pmdt.pmdt004,l_pmdt.pmdt005,
                      l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt008,l_pmdt.pmdt009,l_pmdt.pmdt010,
                      l_pmdt.pmdt011,
                      l_pmdt.pmdt016,l_pmdt.pmdt017,l_pmdt.pmdt018,l_pmdt.pmdt019,l_pmdt.pmdt020,
                      l_pmdt.pmdt021,l_pmdt.pmdt022,l_pmdt.pmdt023,l_pmdt.pmdt024,l_pmdt.pmdt025,
                      l_pmdt.pmdt026,
                      l_pmdt.pmdt036,l_pmdt.pmdt037,l_pmdt.pmdt038,l_pmdt.pmdt039,l_pmdt.pmdt040,
                      l_pmdt.pmdt041,l_pmdt.pmdt042,l_pmdt.pmdt043,l_pmdt.pmdt044,l_pmdt.pmdt045,
                      l_pmdt.pmdt046,l_pmdt.pmdt047,
                      l_pmdt.pmdt052,l_pmdt.pmdt062,l_pmdt.pmdt063,l_pmdt.pmdt064,l_pmdt.pmdt065,l_pmdt.pmdt084)  #170906-00038#1 add ',l_pmdt.pmdt084'

         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "INSERT:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
       
            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #多庫儲批
         INITIALIZE l_xmdm.* TO NULL
         OPEN s_axmt540_cs27 USING l_xmdl.xmdlseq
         FOREACH s_axmt540_cs27 INTO l_xmdm.xmdmseq1,
                                     l_xmdm.xmdm005,l_xmdm.xmdm006,l_xmdm.xmdm007,
                                     l_xmdm.xmdm009,l_xmdm.xmdm011
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               EXIT FOREACH
            END IF
            
            #塞pmdt_t
            INITIALIZE l_pmdu.* TO NULL
            LET l_pmdu.pmduseq1 = l_xmdm.xmdmseq1
            LET l_pmdu.pmdu001 = l_pmdt.pmdt006
            LET l_pmdu.pmdu002 = l_pmdt.pmdt007
            LET l_pmdu.pmdu003 = l_pmdt.pmdt009
            LET l_pmdu.pmdu004 = l_pmdt.pmdt010
            #LET l_pmdu.pmdu005 = ' '            #180130-00029#1 mark
            LET l_pmdu.pmdu005 = l_pmdt.pmdt063  #180130-00029#1 add
            LET l_pmdu.pmdu006 = l_xmdm.xmdm005
            LET l_pmdu.pmdu007 = l_xmdm.xmdm006
            LET l_pmdu.pmdu008 = l_xmdm.xmdm007
            LET l_pmdu.pmdu009 = l_pmdt.pmdt019
            LET l_pmdu.pmdu010 = l_xmdm.xmdm009
            LET l_pmdu.pmdu011 = l_pmdt.pmdt021
            LET l_pmdu.pmdu012 = l_xmdm.xmdm011
            LET l_pmdu.pmdu013 = l_xmdm.xmdm009
            LET l_pmdu.pmdu014 = 0
            LET l_pmdu.pmdu015 = 0
            
            INSERT INTO pmdu_t (pmduent,pmdusite,pmdudocno,
                                pmduseq,pmduseq1,
                                pmdu001,pmdu002,pmdu003,pmdu004,pmdu005,
                                pmdu006,pmdu007,pmdu008,pmdu009,pmdu010,
                                pmdu011,pmdu012,pmdu013,pmdu014,pmdu015)
                 VALUES (g_enterprise,l_pmds.pmdssite,l_pmds.pmdsdocno,
                         l_pmdt.pmdtseq,l_pmdu.pmduseq1,
                         l_pmdu.pmdu001,l_pmdu.pmdu002,l_pmdu.pmdu003,l_pmdu.pmdu004,l_pmdu.pmdu005,
                         l_pmdu.pmdu006,l_pmdu.pmdu007,l_pmdu.pmdu008,l_pmdu.pmdu009,l_pmdu.pmdu010,
                         l_pmdu.pmdu011,l_pmdu.pmdu012,l_pmdu.pmdu013,l_pmdu.pmdu014,l_pmdu.pmdu015)
                         
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "INSERT:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
       
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END FOREACH
         
         IF NOT r_success THEN
            EXIT FOREACH
         END IF

         #產生收貨原始需求分配明細資料
         IF NOT s_apmt520_gen_pmdv(l_pmds.pmdsdocno,l_pmdt.pmdtseq) THEN
            LET r_success = FALSE
            
            EXIT FOREACH
         END IF
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      INITIALIZE l_xrcd.* TO NULL
      #重新計算整單的未稅、含稅總金額
      CALL s_tax_recount(l_pmds.pmdsdocno) RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115

      UPDATE pmds_t SET pmds043 = l_xrcd.xrcd103,  #採購單總未稅金額
                        pmds044 = l_xrcd.xrcd105,  #採購單總含稅金額
                        pmds046 = l_xrcd.xrcd104   #採購總稅額
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = l_pmds.pmdsdocno
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL       
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = 'UPDATE'
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF

      #收貨入庫單確認
      CALL s_axmt540_pmdsstus_chang(l_pmds.pmdsdocno,'1') RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      LET l_success_doc[l_n+1].pmdsdocno = l_pmds.pmdsdocno

      LET l_n = l_n + 1
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success   
   END IF

   FOR l_n = 1 TO l_success_doc.getLength()
      INITIALIZE g_errparam TO NULL       
      LET g_errparam.code   = 'axm-00635'
      LET g_errparam.extend = ''
      LET g_errparam.replace[1] = l_success_doc[l_n].pmdsdocno
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   END FOR
   CALL cl_err_collect_show()     #160318-00016#1 add
   CALL cl_err_collect_init()     #160318-00016#1 add
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 收貨入庫單確認過帳or取消確認過帳
# Memo...........:
# Usage..........: CALL s_axmt540_pmdsstus_chang(p_pmdsdocno,p_type)
#                  RETURNING r_success
# Input parameter: p_pmdsdocno  收貨入庫單號
#                : p_type       1.過帳確認2.取消過帳取消確認作廢
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 140815 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_pmdsstus_chang(p_pmdsdocno,p_type)
   DEFINE p_pmdsdocno    LIKE pmds_t.pmdsdocno
   DEFINE p_type         LIKE type_t.chr1
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_prog         LIKE type_t.chr20
   DEFINE l_argv1        LIKE type_t.chr10
   DEFINE l_pmds000      LIKE pmds_t.pmds000

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
    
   LET l_prog = g_prog    #備份
   LET g_prog = 'apmt530'  
   
   LET l_pmds000 = ''
   SELECT pmds000 INTO l_pmds000
     FROM pmds_t
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = p_pmdsdocno

   LET l_argv1 = g_argv[1]
   LET g_argv[1] = l_pmds000

   CASE p_type
      WHEN '1' #過帳確認
         #收貨入庫單確認
         CALL s_apmt520_conf_chk(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
            
         CALL s_apmt520_conf_upd(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
            
         #收貨入庫單過帳
         CALL s_apmt520_posted_chk(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
            
         CALL s_apmt520_posted_upd(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
      WHEN '2' #取消過帳取消確認作廢
         #收貨入庫單取消過帳
         CALL s_apmt520_unposted_chk(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
         CALL s_apmt520_unposted_upd(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
         #收貨入庫單取消確認
         CALL s_apmt520_unconf_chk(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
         CALL s_apmt520_unconf_upd(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
         #收貨入庫單作廢
         CALL s_apmt520_invalid_chk(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
         CALL s_apmt520_invalid_upd(p_pmdsdocno) RETURNING r_success
         IF NOT r_success THEN
            EXIT CASE
         END IF
         
   END CASE
   
   LET g_prog = l_prog    #還原
   LET g_argv[1] = l_argv1
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 在揀量檢查
# Memo...........:
# Usage..........: CALL s_axmt540_xmdl014_xmdl015_xmdl016_xmdk052_chk(p_xmdl001,p_xmdl002,p_xmdl008,p_xmdl009,
#                                                                     p_xmdl014,p_xmdl015,p_xmdl016,p_xmdl052,
#                                                                     p_xmdl017,p_xmdl018,p_xmdldocno,p_xmdlseq)
#                  RETURNING r_success
# Input parameter: p_xmdl001       出通單號
#                : p_xmdl002       出通項次
#                : p_xmdl008       料件編號
#                : p_xmdl009       產品特徵
#                : p_xmdl014       庫位
#                : p_xmdl015       儲位
#                : p_xmdl016       批號
#                : p_xmdl052       庫存管理特徵
#                : p_xmdl017       出貨單位
#                : p_xmdl018       數量
#                : p_xmdldocno     出貨單號
#                : p_xmdlseq       出貨項次
# Return code....: r_success       執行結果
#                : 
# Date & Author..: 140909 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdl014_xmdl015_xmdl016_xmdk052_chk(p_xmdl001,p_xmdl002,p_xmdl008,p_xmdl009,p_xmdl014,p_xmdl015,p_xmdl016,p_xmdl052,p_xmdl017,p_xmdl018,p_xmdldocno,p_xmdlseq)
   DEFINE p_xmdl001     LIKE xmdl_t.xmdl001    #出通單號
   DEFINE p_xmdl002     LIKE xmdl_t.xmdl002    #出通項次
   DEFINE p_xmdl008     LIKE xmdl_t.xmdl008    #料件編號
   DEFINE p_xmdl009     LIKE xmdl_t.xmdl009    #產品特徵
   DEFINE p_xmdl014     LIKE xmdl_t.xmdl014    #庫位
   DEFINE p_xmdl015     LIKE xmdl_t.xmdl015    #儲位
   DEFINE p_xmdl016     LIKE xmdl_t.xmdl016    #批號
   DEFINE p_xmdl052     LIKE xmdl_t.xmdl052    #庫存管理特徵
   DEFINE p_xmdl017     LIKE xmdl_t.xmdl017    #出貨單位
   DEFINE p_xmdl018     LIKE xmdl_t.xmdl018    #數量
   DEFINE p_xmdldocno   LIKE xmdl_t.xmdldocno  #出貨單號
   DEFINE p_xmdlseq     LIKE xmdl_t.xmdlseq    #出貨單項次
   
   DEFINE l_para_data   LIKE type_t.chr80
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_flag        LIKE type_t.num5
   DEFINE l_slip        LIKE ooba_t.ooba001    #單別
   DEFINE l_xmdl003     LIKE xmdl_t.xmdl003    #訂單單號 #160408-00035#9-add
   DEFINE l_xmdl004     LIKE xmdl_t.xmdl004    #訂單項次 #160408-00035#9-add
   #171218-00024#2-s-add
   DEFINE l_site        LIKE xmdl_t.xmdlsite   #據點
   DEFINE l_xmdl014     LIKE xmdl_t.xmdl014    #庫位
   DEFINE l_xmdl015     LIKE xmdl_t.xmdl015    #儲位
   #171218-00024#2-e-add
   DEFINE l_xmdk044     LIKE xmdk_t.xmdk044     #200107-00018#1 add 

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #因出通已經做過在減量，不重複做檢查
   #IF cl_null(p_xmdl001) AND cl_null(p_xmdl002) THEN   #170603-00039#1 mark
      IF NOT cl_null(p_xmdl008) AND
#         NOT p_xmdl009 IS NULL  AND  #170603-00039#1 mark 
#         NOT cl_null(p_xmdl014) AND  #170603-00039#1 mark 
#         NOT p_xmdl015 IS NULL  AND  #170603-00039#1 mark 
#         NOT p_xmdl016 IS NULL  AND  #170603-00039#1 mark 
#         NOT p_xmdl052 IS NULL  AND  #170603-00039#1 mark 
         NOT cl_null(p_xmdl017) AND
#         NOT cl_null(p_xmdl018) AND  #170603-00039#1 mark 
         NOT cl_null(p_xmdldocno) AND
         NOT cl_null(p_xmdlseq) THEN
         CALL s_aooi200_get_slip(p_xmdldocno) RETURNING r_success,l_slip
         IF NOT r_success THEN
            RETURN r_success
         END IF

         CALL cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0070') RETURNING l_para_data  #出庫單據考慮在揀量
        #IF l_para_data = 'Y' THEN    #170516-00005#1 mark  #單據不考慮在撿量也須考慮備置量,因此還是需撿核   #171130-00043#1 Remark #171218-00024#2-mark
         IF l_para_data = 'Y' AND NOT g_aic_continue THEN   #單據不考慮在撿量也須考慮備置量,因此還是需撿核                          #171218-00024#2-add  多角續拋不需檢查在撿量        
            #160408-00035#9-add-(S)
            SELECT xmdl003,xmdl004 INTO l_xmdl003,l_xmdl004
              FROM xmdl_t
             WHERE xmdlent = g_enterprise
               AND xmdldocno = p_xmdldocno
               AND xmdlseq = p_xmdlseq
            #160408-00035#9-add-(E) 
            #171218-00024#2-s-mark
            #CALL s_inventory_check_inan(g_site,p_xmdl008,p_xmdl009,
            #                            p_xmdl052,p_xmdl014,p_xmdl015,p_xmdl016,
            #                            p_xmdl017,p_xmdl018,
            #                            p_xmdldocno,p_xmdlseq,0,l_xmdl003,l_xmdl004,'') RETURNING r_success,l_flag #160408-00035#9-add-l_xmdl003,l_xmdl004   #170724-00041#4 by sakura add 增加參數,''   
            #171218-00024#2-e-mark
            #200107-00018#1 add(s)  
            SELECT xmdk044 INTO l_xmdk044
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = p_xmdldocno
            CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING g_aic_direct,g_aic.*     
            #200107-00018#1 add(e) 
            #171218-00024#2-s-add
            IF g_aic_direct THEN
               #多角正拋，要檢查最終站的資料
               LET l_site = g_aic.icab003
               LET l_xmdl014 = g_aic.icad004
               LET l_xmdl015 = g_aic.icad005
            ELSE
               LET l_site = g_site
               LET l_xmdl014 = p_xmdl014
               LET l_xmdl015 = p_xmdl015
            END IF

            CALL s_inventory_check_inan(l_site,p_xmdl008,p_xmdl009,
                                        p_xmdl052,l_xmdl014,l_xmdl015,p_xmdl016,
                                        p_xmdl017,p_xmdl018,
                                        p_xmdldocno,p_xmdlseq,0,l_xmdl003,l_xmdl004,'') RETURNING r_success,l_flag #160408-00035#9-add-l_xmdl003,l_xmdl004   #170724-00041#4 by sakura add 增加參數,''   

            #171218-00024#2-e-add
            IF NOT r_success OR l_flag = 0 THEN   #庫存量不足
               LET r_success = FALSE
               RETURN r_success
            END IF
        END IF                      #171130-00043#1 Remark 

      END IF 
   #END IF   #170603-00039#1 mark
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 來源庫儲批
# Memo...........:
# Usage..........: CALL s_axmt540_source_define(p_xmdl001,p_xmdl002,p_xmdl003,p_xmdl004)
#                  RETURNING r_xmdl013,r_xmdl014,r_xmdl015,r_xmdl016
# Input parameter: p_xmdl001      來源出通單號
#                : p_xmdl002      來源出通單項次
#                : p_xmdl003      來源訂單單號
#                : p_xmdl004      來源訂單項次
# Return code....: r_xmdl013      多庫儲批
#                : r_xmdl014      庫位
#                : r_xmdl015      儲位
#                : r_xmdl016      批號
#                : r_xmdl052      庫存管理特徵
# Date & Author..: 140821 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_source_define(p_xmdl001,p_xmdl002,p_xmdl003,p_xmdl004)
   DEFINE p_xmdl001       LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002       LIKE xmdl_t.xmdl002
   DEFINE p_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE p_xmdl004       LIKE xmdl_t.xmdl004   
   DEFINE r_xmdl013       LIKE xmdl_t.xmdl013
   DEFINE r_xmdl014       LIKE xmdl_t.xmdl014
   DEFINE r_xmdl015       LIKE xmdl_t.xmdl015
   DEFINE r_xmdl016       LIKE xmdl_t.xmdl016
   DEFINE r_xmdl052       LIKE xmdl_t.xmdl052

   WHENEVER ERROR CONTINUE

   LET r_xmdl013 = 'N'
   LET r_xmdl014 = ''
   LET r_xmdl015 = ''
   LET r_xmdl016 = ''
   LET r_xmdl052 = ''
   IF NOT cl_null(p_xmdl001) AND NOT cl_null(p_xmdl002) THEN

      SELECT xmdh011,xmdh012,xmdh013,xmdh014,xmdh029
        INTO r_xmdl013,r_xmdl014,r_xmdl015,r_xmdl016,r_xmdl052
        FROM xmdh_t
       WHERE xmdhent = g_enterprise
         AND xmdhdocno = p_xmdl001
         AND xmdhseq = p_xmdl002

   ELSE
      IF NOT cl_null(p_xmdl003) AND NOT cl_null(p_xmdl004) THEN

         SELECT xmdc028,xmdc029,xmdc030,xmdc057
           INTO r_xmdl014,r_xmdl015,r_xmdl016,r_xmdl052
           FROM xmdc_t
          WHERE xmdcent = g_enterprise
#           AND xmdcsite = g_site   #170302-00045#3 mark
            AND xmdcunit = g_site   #170302-00045#3 add
            AND xmdcdocno = p_xmdl003
            AND xmdcseq = p_xmdl004
            
      END IF
   END IF
   
   RETURN r_xmdl013,r_xmdl014,r_xmdl015,r_xmdl016,r_xmdl052
END FUNCTION

################################################################################
# Descriptions...: 在途庫位檢查、庫位檢查
# Memo...........:
# Usage..........: CALL s_axmt540_xmdk039_xmdk040_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單據單號
#                : 
# Return code....: r_success
#                : 
# Date & Author..: 140918 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdk039_xmdk040_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno LIKE xmdk_t.xmdkdocno
   DEFINE r_success   LIKE type_t.num5
   
   DEFINE l_xmdk002   LIKE xmdk_t.xmdk002
   DEFINE l_xmdk039   LIKE xmdk_t.xmdk039
   DEFINE l_xmdk040   LIKE xmdk_t.xmdk040
   DEFINE l_sql       STRING
   DEFINE l_type      LIKE type_t.chr1
   DEFINE l_cost      LIKE type_t.chr1
   DEFINE l_noncost   LIKE type_t.chr1
   DEFINE l_xmdm      RECORD
             xmdm001     LIKE xmdm_t.xmdm001,
             xmdm002     LIKE xmdm_t.xmdm002,
             xmdm033     LIKE xmdm_t.xmdm033,
             xmdm005     LIKE xmdm_t.xmdm005,
             xmdm006     LIKE xmdm_t.xmdm006,
             xmdm007     LIKE xmdm_t.xmdm007,
             xmdm008     LIKE xmdm_t.xmdm008
             
                      END RECORD

   DEFINE l_xmdl003      LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004      LIKE xmdl_t.xmdl004
   DEFINE l_xmdl014      LIKE xmdl_t.xmdl014 #171013-00043#1 add
   DEFINE l_success      LIKE type_t.num5    #150921-00014 earl add
   DEFINE l_flag         LIKE type_t.num5    #150921-00014 earl add
   DEFINE l_imaa004      LIKE imaa_t.imaa004 #170116-00044#2-add
   DEFINE l_xmdk071      LIKE xmdk_t.xmdk071 #201216-00027#5 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET l_cost = FALSE
   LET l_noncost = FALSE

   LET l_xmdk002 = ''    #出貨性質
   LET l_xmdk039 = ''    #在途成本庫位
   LET l_xmdk040 = ''    #再途非成本庫位
   SELECT xmdk002,xmdk039,xmdk040,xmdk071  #201216-00027#5 add  xmdk071
     INTO l_xmdk002,l_xmdk039,l_xmdk040,l_xmdk071 #201216-00027#5 add  xmdk071
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno

   LET l_sql = "SELECT xmdl003,xmdl004,xmdl014,", #171013-00043#1 add xmdl014
               "       xmdm001,xmdm002,",
               "       (SELECT imaa004 FROM imaa_t WHERE imaaent=xmdlent AND imaa001=xmdl008) imaa004,", #170116-00044#2-add
               "       xmdm033,xmdm005,xmdm006,xmdm007,xmdm008",
               "  FROM xmdl_t,xmdm_t",
               " WHERE xmdlent = xmdment AND xmdment = ",g_enterprise,
               "   AND xmdldocno = xmdmdocno AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdlseq = xmdmseq"
   PREPARE s_axmt540_pre33 FROM l_sql
   DECLARE s_axmt540_cs33 CURSOR FOR s_axmt540_pre33   
      
   LET l_xmdl003 = ''
   LET l_xmdl004 = ''
   LET l_xmdl014 = ''  #171013-00043#1 add
   LET l_imaa004 = ''  #170116-00044#2-add
   INITIALIZE l_xmdm.* TO NULL
   FOREACH s_axmt540_cs33 INTO l_xmdl003,l_xmdl004,l_xmdl014, #171013-00043#1 add xmdl014
                               l_xmdm.xmdm001,l_xmdm.xmdm002,l_imaa004,#170116-00044#2-add-l_imaa004
                               l_xmdm.xmdm033,l_xmdm.xmdm005,l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #150921-00014 earl add s
      #檢核輸入的庫位(From)是否在單據別限制範圍內
      IF NOT cl_null(l_xmdm.xmdm005) THEN
         CALL s_control_chk_doc('6',p_xmdkdocno,l_xmdm.xmdm005,'','','','')
         RETURNING l_success,l_flag
      
         IF NOT l_success OR NOT l_flag THEN
            LET r_success = FALSE
         END IF
      END IF
      #150921-00014 earl add e
      
      #171013-00043#1 add (s)
      #檢查出貨庫位有無與在途庫位/非成本庫位相同，若相同則報錯
      IF l_xmdk039 = l_xmdl014 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00874'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF l_xmdk040 = l_xmdl014 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00874'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      #171013-00043#1 add (e)
      #171013-00043#1 add (e)

      IF l_xmdk002 = '3' OR l_xmdk002 = '4' OR l_xmdk002 = '8' THEN     #過帳且出貨性質為"簽收訂單","調撥訂單","借貨訂單"
         #費用資料(來源有訂單單號但無訂單項次)
         IF NOT cl_null(l_xmdl003) AND cl_null(l_xmdl004) THEN
            CONTINUE FOREACH
         END IF
         #170116-00044#2-s-add
         #料號為費用類別
         IF l_imaa004 = 'E' THEN
            CONTINUE FOREACH
         END IF
         #170116-00044#2-e-add
         #檢查來源是否為成本倉
         CALL s_axmt540_inag012_chk(g_site,l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm033,l_xmdm.xmdm005,l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008)
         RETURNING l_type
     
         IF l_type = 'Y' THEN   #成本庫
            IF cl_null(l_xmdk039) THEN
               LET l_cost = TRUE              
            END IF
         ELSE
            IF cl_null(l_xmdk040) THEN
               LET l_noncost = TRUE
            END IF
         END IF
         
         #201030-00027#2 add -S
         #過帳處理庫存異動時,如為簽收訂單，且參數「走簽收流程，但依出貨認列發出商品否」=Y時，l_warehouse給在途非成本倉
#        IF cl_get_para(g_enterprise,g_site,'S-FIN-1003') = '4' AND cl_get_para(g_enterprise,g_site,'S-FIN-9029') = "Y" THEN  #201216-00027#5 mark
         IF l_xmdk071 =  "Y" THEN  #201216-00027#5 add
            LET l_cost = FALSE
            IF cl_null(l_xmdk040) THEN
               LET l_noncost = TRUE
            END IF
         END IF 
         #201030-00027#2 add -E
      END IF
   END FOREACH
      
   #150921-00014 earl add s
   #檢核輸入的庫位(To)是否在單據別限制範圍內
   IF NOT cl_null(l_xmdk039) THEN
      CALL s_control_chk_doc('7',p_xmdkdocno,l_xmdk039,'','','','')
      RETURNING l_success,l_flag
   
      IF NOT l_success OR NOT l_flag THEN
         LET r_success = FALSE
      END IF
   END IF
   
   IF NOT cl_null(l_xmdk040) THEN
      CALL s_control_chk_doc('7',p_xmdkdocno,l_xmdk040,'','','','')
      RETURNING l_success,l_flag
   
      IF NOT l_success OR NOT l_flag THEN
         LET r_success = FALSE
      END IF
   END IF
   #150921-00014 earl add e

   #在途成本庫、非成本庫
   IF l_noncost AND l_cost THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00472'   #無替換之在途成本庫位與在途非成本庫位！
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
  
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #在途成本庫
   IF l_cost THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00470'   #無替換之在途成本庫位！
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
  
      LET r_success = FALSE
      RETURN r_success      
   END IF
  
   #在途成非成本庫
   IF l_noncost THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00471'   #無替換之在途非成本庫位！
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
  
      LET r_success = FALSE
      RETURN r_success    
   END IF
      
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 預帶料件預設值
# Memo...........:
# Usage..........: CALL s_axmt540_materials_search(p_xmdk003,p_xmdk004,p_xmdk007,p_xmdl008,p_xmdl009)
#                  RETURNING r_xmdl.xmdl007,r_xmdl.xmdl010,r_xmdl.xmdl017,r_xmdl.xmdl019,r_xmdl.xmdl021,r_xmdl.xmdl014,r_xmdl.xmdl015
# Input parameter: p_xmdk003        業務人員
#                : p_xmdk004        業務部門
#                : p_xmdk007        客戶編號
#                : p_xmdl008        料件編號
#                : p_xmdl009        產品特徵
# Return code....: r_xmdl.xmdl007   子件特性
#                : r_xmdl.xmdl010   包裝容器
#                : r_xmdl.xmdl017   出貨單位
#                : r_xmdl.xmdl019   參考單位
#                : r_xmdl.xmdl021   計價單位
#                : r_xmdl.xmdl014   出貨庫位
#                : r_xmdl.xmdl015   出貨儲位
# Date & Author..: 141201 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_materials_search(p_xmdk003,p_xmdk004,p_xmdk007,p_xmdl008,p_xmdl009)
   DEFINE p_xmdk003    LIKE xmdk_t.xmdk003
   DEFINE p_xmdk004    LIKE xmdk_t.xmdk004
   DEFINE p_xmdk007    LIKE xmdk_t.xmdk007
   DEFINE p_xmdl008    LIKE xmdl_t.xmdl008
   DEFINE p_xmdl009    LIKE xmdl_t.xmdl009

   DEFINE r_xmdl   RECORD
             xmdl007    LIKE xmdl_t.xmdl007,  #子件特性
             xmdl010    LIKE xmdl_t.xmdl010,  #包裝容器
             xmdl017    LIKE xmdl_t.xmdl017,  #出貨單位
             xmdl019    LIKE xmdl_t.xmdl019,  #參考單位
             xmdl021    LIKE xmdl_t.xmdl021,  #計價單位
             xmdl014    LIKE xmdl_t.xmdl014,  #出貨庫位
             xmdl015    LIKE xmdl_t.xmdl015   #出貨儲位
                   END RECORD

   DEFINE l_imaf   RECORD
             imaf123    LIKE imaf_t.imaf123,  #慣用包裝容器
             imaf112    LIKE imaf_t.imaf112,  #銷售單位
             imaf015    LIKE imaf_t.imaf015,  #參考單位
             imaf113    LIKE imaf_t.imaf113,  #銷售計價單位
             imaf091    LIKE imaf_t.imaf091,  #預設庫位
             imaf092    LIKE imaf_t.imaf092,  #預設儲位
             imaf122    LIKE imaf_t.imaf122   #訂單子件拆解方式
                   END RECORD

   DEFINE l_success    LIKE type_t.num5
   DEFINE l_controlno  LIKE ooha_t.ooha001   

   INITIALIZE r_xmdl.* TO NULL   

   IF NOT cl_null(p_xmdk003) AND NOT cl_null(p_xmdk004) THEN
      #先判斷這個供應商是否有設多個當前銷售控制組範圍內的客戶預設條件
      LET l_controlno = ''
      CALL s_control_get_group('2',p_xmdk003,p_xmdk004) RETURNING l_success,l_controlno

      IF l_success THEN
         #若訂購料件有設置客戶料件預設條件'(axmi121)時，則需將設置的預設條件值預設到訂購單對應欄位
         #包裝容器、出貨單位、參考單位、計價單位、出貨庫位、出貨儲位
         SELECT xmaf005,xmaf006,xmaf007,xmaf008,
                xmaf010,xmaf011
           INTO r_xmdl.xmdl010,r_xmdl.xmdl017,r_xmdl.xmdl019,r_xmdl.xmdl021,
                r_xmdl.xmdl014,r_xmdl.xmdl015
           FROM xmaf_t
          WHERE xmafent = g_enterprise
            AND xmafsite = g_site
            AND xmaf001 = p_xmdk007      #客戶編號
            AND xmaf002 = l_controlno    #控制組
            AND xmaf003 = p_xmdl008      #料件編號
            AND COALESCE(xmaf004,' ') = COALESCE(p_xmdl009,' ')      #產品特徵

      END IF
   END IF
   
   #慣用包裝容器、出貨單位、參考單位、計價單位、預設庫位、預設儲位
   INITIALIZE l_imaf.* TO NULL
   SELECT imaf123,imaf112,imaf015,imaf113,
          imaf091,imaf092,
          imaf122
     INTO l_imaf.imaf123,l_imaf.imaf112,l_imaf.imaf015,l_imaf.imaf113,
          l_imaf.imaf091,l_imaf.imaf092,
          l_imaf.imaf122
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = g_site
      AND imaf001 = p_xmdl008

   #沒有設置'客戶控制組料件預設條件改抓料件進銷存檔預設的條件
   IF cl_null(r_xmdl.xmdl010) THEN
      LET r_xmdl.xmdl010 = l_imaf.imaf123
   END IF

   IF cl_null(r_xmdl.xmdl017) THEN
      LET r_xmdl.xmdl017 = l_imaf.imaf112
   END IF

   IF cl_null(r_xmdl.xmdl019) THEN
      LET r_xmdl.xmdl019 = l_imaf.imaf015
   END IF

   IF cl_null(r_xmdl.xmdl021) THEN
      LET r_xmdl.xmdl021 = l_imaf.imaf113
   END IF

   IF cl_null(r_xmdl.xmdl014) THEN
      LET r_xmdl.xmdl014 = l_imaf.imaf091   #庫位
      LET r_xmdl.xmdl015 = l_imaf.imaf092   #儲位
   END IF

   #若[T:料件進銷存檔].[C:接單拆解方式(訂單)]的值為'1:自動CKD'或是'2:自動SKD'時，則[C:子件特性]的值預設'2:CKD'或是'3:SKD'
   IF l_imaf.imaf122 = '1' THEN
      LET r_xmdl.xmdl007 = '2'
   END IF
         
   IF l_imaf.imaf122 = '2' THEN
      LET r_xmdl.xmdl007 = '3'
   END IF

   RETURN r_xmdl.xmdl007,r_xmdl.xmdl010,r_xmdl.xmdl017,r_xmdl.xmdl019,r_xmdl.xmdl021,r_xmdl.xmdl014,r_xmdl.xmdl015
END FUNCTION

################################################################################
# Descriptions...: 更新備置量
# Memo...........:
# Usage..........: CALL s_axmt540_upd_inan(p_xmdkdocno,p_type)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出貨單號
#                : p_type         1:過帳/-1:過帳還原
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2015/01/16 By stellar
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_upd_inan(p_xmdkdocno,p_type)
DEFINE p_xmdkdocno         LIKE xmdk_t.xmdkdocno
DEFINE p_type              LIKE type_t.num5
DEFINE r_success           LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_xmdmseq           LIKE xmdm_t.xmdmseq
DEFINE l_xmdmseq1          LIKE xmdm_t.xmdmseq1
DEFINE l_xmdl003           LIKE xmdl_t.xmdl003
DEFINE l_xmdl004           LIKE xmdl_t.xmdl004
DEFINE l_xmdl005           LIKE xmdl_t.xmdl005
DEFINE l_xmdl006           LIKE xmdl_t.xmdl006
DEFINE l_xmdm001           LIKE xmdm_t.xmdm001
DEFINE l_xmdm002           LIKE xmdm_t.xmdm002
DEFINE l_xmdm005           LIKE xmdm_t.xmdm005
DEFINE l_xmdm006           LIKE xmdm_t.xmdm006
DEFINE l_xmdm007           LIKE xmdm_t.xmdm007
DEFINE l_xmdm008           LIKE xmdm_t.xmdm008   
DEFINE l_xmdm009           LIKE xmdm_t.xmdm009
DEFINE l_xmdm033           LIKE xmdm_t.xmdm033
DEFINE l_success           LIKE type_t.num5
DEFINE l_xmdm034           LIKE xmdm_t.xmdm034  #160408-00035#7

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_null(p_xmdkdocno) OR cl_null(p_type) THEN
      RETURN r_success
   END IF
   
   #統銷統收產生之出貨單不做回寫動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   LET l_sql = "SELECT xmdl003,xmdl004,xmdl005,xmdl006,",
               "       xmdmseq,xmdmseq1,xmdm001,xmdm002,",
               "       xmdm005,xmdm006,xmdm007,xmdm008,xmdm009,",
               "       xmdm033,xmdm034",   #160408-00035#7  xmdm034
               "  FROM xmdl_t,xmdm_t",
               " WHERE xmdlent = xmdment AND xmdment = '",g_enterprise,"'",
               "   AND xmdldocno = xmdmdocno AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdlseq = xmdmseq",
               "   AND xmdl003 IS NOT NULL",
               "   AND xmdl004 IS NOT NULL",
               "   AND xmdl005 IS NOT NULL",
               "   AND xmdl006 IS NOT NULL",
               " ORDER BY xmdmseq,xmdmseq1"
   PREPARE s_axmt540_upd_inan_pre FROM l_sql
   DECLARE s_axmt540_upd_inan_cs CURSOR FOR s_axmt540_upd_inan_pre
   FOREACH s_axmt540_upd_inan_cs INTO l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,
                                      l_xmdmseq,l_xmdmseq1,l_xmdm001,l_xmdm002,
                                      l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm009,
                                      l_xmdm033,l_xmdm034   #160408-00035#7 l_xmdm034       
#      #160408-00035#7---mod---begin
#      #CALL s_prepare_upd('1',g_site,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,l_xmdm001,l_xmdm002,l_xmdm033,
#      #                   l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm009,p_type)
      CALL s_prepare_upd('1',g_site,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,l_xmdm001,l_xmdm002,l_xmdm033,
                         l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm034,p_type)                         
      #160408-00035#7---mod---end
           RETURNING l_success    
      IF NOT l_success THEN
         LET r_success = FALSE
         CONTINUE FOREACH
      END IF     
   END FOREACH
   
   RETURN r_success
END FUNCTION

#出貨單庫位檢查
PUBLIC FUNCTION s_axmt540_xmdl014_chk(p_xmdh011,p_xmdl001,p_xmdl002,p_xmdl014,p_xmdkdocno)
   DEFINE p_xmdh011     LIKE xmdh_t.xmdh011   #來源出通單是否做多庫儲批
   DEFINE p_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002     LIKE xmdl_t.xmdl002
   DEFINE p_xmdl014     LIKE xmdl_t.xmdl014
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno #150921-00014 earl add 出貨單號
   
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_n           LIKE type_t.num5
   DEFINE l_flag        LIKE type_t.num5      #150921-00014 earl add
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF NOT cl_null(p_xmdl014) THEN
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL
               
      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = g_site
      LET g_chkparam.arg2 = p_xmdl014
      LET g_errshow = TRUE                                                                                                #160328-00029#4
      LET g_chkparam.err_str[1] = "aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001" #160328-00029#4
      LET g_chkparam.err_str[2] = "amm-00753:aoo-00149"  #160511-00015#1
      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_inaa001") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      IF p_xmdh011 = 'Y' THEN
         LET l_n = 0
         SELECT COUNT(xmdiseq1) INTO l_n
           FROM xmdi_t
          WHERE xmdient = g_enterprise
            AND xmdidocno = p_xmdl001
            AND xmdiseq = p_xmdl002
            AND COALESCE(xmdi005,' ') = COALESCE(p_xmdl014,' ')

         IF l_n = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00432'    #此庫位不存在來源多庫儲批庫位，請重新輸入！
            LET g_errparam.extend = p_xmdl014
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      
      #150921-00014 earl add s
      #檢核輸入的庫位(From)是否在單據別限制範圍內
      IF NOT cl_null(p_xmdkdocno) THEN
         CALL s_control_chk_doc('6',p_xmdkdocno,p_xmdl014,'','','','')
         RETURNING r_success,l_flag
         
         IF NOT r_success OR NOT l_flag THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      #150921-00014 earl add e
      
   END IF
   
   RETURN r_success
END FUNCTION

#出貨單儲位檢察
PUBLIC FUNCTION s_axmt540_xmdl015_chk(p_xmdh011,p_xmdl001,p_xmdl002,p_xmdl014,p_xmdl015)
   DEFINE p_xmdh011     LIKE xmdh_t.xmdh011   #來源出通單是否做多庫儲批
   DEFINE p_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002     LIKE xmdl_t.xmdl002
   DEFINE p_xmdl014     LIKE xmdl_t.xmdl014
   DEFINE p_xmdl015     LIKE xmdl_t.xmdl015
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_n           LIKE type_t.num5
   DEFINE l_inaa007     LIKE inaa_t.inaa007   #170605-00020#16 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   IF NOT cl_null(p_xmdl015) THEN
      IF cl_null(p_xmdl014) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00126'    #庫位不可為空
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF  

      #170605-00020#16-s add
      #需判斷inaa007='1'才檢查資料須存在inab_t中
      #1.事先規劃：需存在儲位基本資料檔
      #2.人工指定：輸入時不檢查(入庫會新增儲位基本資料，出庫於過帳時檢查inag)
      #5.不使用：儲位欄位不可輸入
      SELECT inaa007 INTO l_inaa007
        FROM inaa_t
       WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = p_xmdl014
      IF l_inaa007 = '1' THEN   #1.使用儲位管理-事先規劃
      #170605-00020#16-e add 
         #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
         INITIALIZE g_chkparam.* TO NULL   
         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_xmdl014
         LET g_chkparam.arg3 = p_xmdl015
         LET g_errshow = TRUE                                                                                                #160328-00029#4
         LET g_chkparam.err_str[1] = "aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002" #160328-00029#4                     
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_inab002_1") THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF   #170605-00020#16 add
      
      #出通單若有做多庫儲批，輸入儲位必須存在
      IF p_xmdh011 = 'Y' THEN
         LET l_n = 0
         SELECT COUNT(xmdiseq1) INTO l_n
           FROM xmdi_t
          WHERE xmdient = g_enterprise
            AND xmdidocno = p_xmdl001
            AND xmdiseq = p_xmdl002
            AND COALESCE(xmdi005,' ') = COALESCE(p_xmdl014,' ')
            AND COALESCE(xmdi006,' ') = COALESCE(p_xmdl015,' ')
     
         IF l_n = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00433'    #此儲位不存在來源多庫儲批儲位，請重新輸入！
            LET g_errparam.extend = p_xmdl015
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success
         END IF
         
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

#出貨單批號檢查
PUBLIC FUNCTION s_axmt540_xmdl016_chk(p_xmdh011,p_xmdl001,p_xmdl002,p_xmdl008,p_xmdl009,p_xmdl016)
   DEFINE p_xmdh011     LIKE xmdh_t.xmdh011   #來源出通單是否做多庫儲批
   DEFINE p_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002     LIKE xmdl_t.xmdl002
   DEFINE p_xmdl008     LIKE xmdl_t.xmdl008
   DEFINE p_xmdl009     LIKE xmdl_t.xmdl009
   DEFINE p_xmdl016     LIKE xmdl_t.xmdl016
   
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_n           LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   LET g_errshow = TRUE #171218-00024#8-add
   
   IF NOT cl_null(p_xmdl016) THEN

      #料件編號
      IF cl_null(p_xmdl008) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00123'    #料件編號不可為空
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF  

      IF NOT p_xmdl009 IS NULL THEN
         #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
         INITIALIZE g_chkparam.* TO NULL

         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_xmdl008
         LET g_chkparam.arg3 = p_xmdl009
         LET g_chkparam.arg4 = p_xmdl016
                  
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_inad001_1") THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      
      #出通單若有做多庫儲批，輸入儲位必須存在
      IF p_xmdh011 = 'Y' THEN
         LET l_n = 0
         SELECT COUNT(xmdiseq1) INTO l_n
           FROM xmdi_t
          WHERE xmdient = g_enterprise
            AND xmdidocno = p_xmdl001
            AND xmdiseq = p_xmdl002
            AND COALESCE(xmdi007,' ') = COALESCE(p_xmdl016,' ')
     
         IF l_n = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00434'    #此批號不存在來源多庫儲批批號，請重新輸入！
            LET g_errparam.extend = p_xmdl016
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success
         END IF         
      END IF 
      
   END IF

   RETURN r_success
END FUNCTION

#出貨單庫存管理特徵檢查
PUBLIC FUNCTION s_axmt540_xmdl052_chk(p_xmdh011,p_xmdl001,p_xmdl002,p_xmdl052)
   DEFINE p_xmdh011     LIKE xmdh_t.xmdh011   #來源出通單是否做多庫儲批
   DEFINE p_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002     LIKE xmdl_t.xmdl002
   DEFINE p_xmdl052     LIKE xmdl_t.xmdl052
   
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_n           LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF NOT cl_null(p_xmdl052) THEN
      #出通單若有做多庫儲批，輸入庫存管理特徵必須存在
      IF p_xmdh011 = 'Y' THEN
         LET l_n = 0
         SELECT COUNT(xmdiseq1) INTO l_n
           FROM xmdi_t
          WHERE xmdient = g_enterprise
            AND xmdidocno = p_xmdl001
            AND xmdiseq = p_xmdl002
            AND COALESCE(xmdi013,' ') = COALESCE(p_xmdl052,' ')

         IF l_n = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00446'    #此批號不存在來源多庫儲批庫存管理特徵，請重新輸入！
            LET g_errparam.extend = p_xmdl052
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新庫存需求等候排隊數量
# Memo...........:
# Usage..........: CALL s_axmt540_inas(p_cmd,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_cmd        #ckpos/pos/unpos
#                : p_xmdkdocno  #單據單號
# Return code....: 
#                : 
# Date & Author..: 150130 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inas(p_cmd,p_xmdkdocno)
   DEFINE p_cmd           LIKE type_t.chr5       #ckpos/pos/unpos
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno  #單據單號

   DEFINE r_success       LIKE type_t.num5

   DEFINE l_imaf058       LIKE imaf_t.imaf058
   DEFINE l_sql           STRING
   DEFINE l_xmdl       RECORD
             xmdl003      LIKE xmdl_t.xmdl003,
             xmdl004      LIKE xmdl_t.xmdl004,
             xmdl005      LIKE xmdl_t.xmdl005,
             xmdl006      LIKE xmdl_t.xmdl006,
             xmdl008      LIKE xmdl_t.xmdl008,
             xmdl009      LIKE xmdl_t.xmdl009,
             xmdl017      LIKE xmdl_t.xmdl017,
             xmdl018      LIKE xmdl_t.xmdl018
                       END RECORD

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   #統銷統收產生之出貨單不做回寫動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF

   #171218-00024#2-s-add
   #多角續拋不考慮等候模式
   IF g_aic_continue THEN
      RETURN r_success
   END IF
   #171218-00024#2-e-add
   LET l_sql = "SELECT xmdl003,xmdl004,xmdl005,xmdl006,",
               "       xmdl008,xmdl009,xmdl017,xmdl018",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               " ORDER BY xmdl003,xmdl004,xmdl005,xmdl006"
   PREPARE s_axmt540_inas_pre FROM l_sql
   DECLARE s_axmt540_inas_cur CURSOR FOR s_axmt540_inas_pre

   LET l_sql = "SELECT imaf058",
               "  FROM imaf_t",
               " WHERE imafent = ",g_enterprise,
               "   AND imafsite = '",g_site,"'",
               "   AND imaf001 = ?"
   PREPARE s_axmt540_imaf058_sel FROM l_sql

   LET l_sql = "SELECT xmdd001,xmdd002",
               "  FROM xmdd_t",
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = ?",
               "   AND xmddseq = ?",
               "   AND xmddseq1 = ?",
               "   AND xmddseq2 = ?"
   PREPARE s_axmt540_xmdd001_sel FROM l_sql

   INITIALIZE l_xmdl.* TO NULL
   FOREACH s_axmt540_inas_cur INTO l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,
                                   l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl017,l_xmdl.xmdl018
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:s_axmt540_inas_cur'
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF

      #無來源訂單不做需求等候異動
      IF cl_null(l_xmdl.xmdl003) OR
         cl_null(l_xmdl.xmdl004) OR
         cl_null(l_xmdl.xmdl005) OR
         cl_null(l_xmdl.xmdl006) THEN
         
          CONTINUE FOREACH
      ELSE
         #回抓訂單的料號、產品特徵(因出貨單可能會換成替代料)
         EXECUTE s_axmt540_xmdd001_sel USING l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006
         INTO l_xmdl.xmdl008,l_xmdl.xmdl009
      END IF

      #取該筆料件存貨備置策略(imaf058)
      LET l_imaf058 = ''
      EXECUTE s_axmt540_imaf058_sel USING l_xmdl.xmdl008 INTO l_imaf058

      #若imaf058 ='3.需求等候模式' 
      IF l_imaf058 = '3' THEN
         CASE p_cmd
            WHEN 'ckpos'  #過帳檢查
               CALL s_inventory_check_inas(g_site,l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,
                                           l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl017,l_xmdl.xmdl018)
               RETURNING r_success

            WHEN 'pos'    #過帳
               CALL s_inventory_upd_inas(g_site,l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,
                                         l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl017,l_xmdl.xmdl018,'-1')
               RETURNING r_success
               
            WHEN 'unpos'  #取消過帳
               CALL s_inventory_upd_inas(g_site,l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006,
                                         l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl017,l_xmdl.xmdl018,'1')
               RETURNING r_success
               
         END CASE
         #200228-00023#1 mark-s 13130
#         IF NOT r_success THEN
#            EXIT FOREACH
#         END IF
         #200228-00023#1 mark-e 13130
      END IF
   END FOREACH

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 其他欄位回寫
# Memo...........:
# Usage..........: CALL s_axmt540_other_upd(p_xmdkdocno,p_cmd)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno  #單據單號
#                : p_cmd        #流程：con確認,uncon取消確認,pos過帳,unpos過帳還原,void作廢
# Return code....: r_success
#                : 
# Date & Author..: 150305 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_other_upd(p_xmdkdocno,p_cmd)
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno
   DEFINE p_cmd         LIKE type_t.chr5       #流程：con確認,uncon取消確認,pos過帳,unpos過帳還原,void作廢
   
   DEFINE r_success     LIKE type_t.num5
   
   DEFINE l_xmdk044     LIKE xmdk_t.xmdk044   #150917-00001#3  2016/01/21  By earl add
   DEFINE l_xmdlseq     LIKE xmdl_t.xmdlseq
   DEFINE l_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002     LIKE xmdl_t.xmdl002
   DEFINE l_xmdl003     LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004     LIKE xmdl_t.xmdl004
   DEFINE l_xmdl005     LIKE xmdl_t.xmdl005
   DEFINE l_xmdl006     LIKE xmdl_t.xmdl006
   DEFINE l_xmdl022     LIKE xmdl_t.xmdl022
   DEFINE l_xmdl027     LIKE xmdl_t.xmdl027
   DEFINE l_xmdl028     LIKE xmdl_t.xmdl028
   DEFINE l_xmdl029     LIKE xmdl_t.xmdl029
   DEFINE l_xmdl042     LIKE xmdl_t.xmdl042
   DEFINE l_xmdl043     LIKE xmdl_t.xmdl043
   DEFINE l_xmdl044     LIKE xmdl_t.xmdl044
   DEFINE l_xmdl016     LIKE xmdl_t.xmdl016   #150917-00001#3  2016/01/21  By earl add
   DEFINE l_xmdl018     LIKE xmdl_t.xmdl018   #150917-00001#3  2016/01/21  By earl add
   
   DEFINE l_xmdy020     LIKE xmdy_t.xmdy020
   DEFINE l_xmdy021     LIKE xmdy_t.xmdy021
   DEFINE l_xmdy022     LIKE xmdy_t.xmdy022
   DEFINE l_xmdy023     LIKE xmdy_t.xmdy023
   
   DEFINE l_sql         STRING
   DEFINE l_xmdkdocdt   LIKE xmdk_t.xmdkdocdt   #出貨單單據日期     #add by Sarah 2015/08/06
   DEFINE l_upd         LIKE type_t.chr1        #150917-00001#3  2016/01/21  By earl add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   #統銷統收產生之出貨單不做回寫動作
   IF NOT s_axmt540_xmdk045_chk(p_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   #150917-00001#3  2016/01/21  By earl mod s
   LET l_sql = "SELECT xmdk044,",
               "       xmdlseq,xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,xmdl006,",
               "       COALESCE(xmdl022,0),COALESCE(xmdl027,0),COALESCE(xmdl028,0),COALESCE(xmdl029,0),",
               "       xmdl042,xmdl043,xmdl044,",
               "       xmdl016,COALESCE(xmdl018,0)",   
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
               "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'",
               " ORDER BY xmdlseq"
   #150917-00001#3  2016/01/21  By earl mod e
   PREPARE s_axmt540_xmdl_pre01 FROM l_sql
   DECLARE s_axmt540_xmdl_cs01 CURSOR FOR s_axmt540_xmdl_pre01

   LET l_sql = "SELECT COALESCE(xmdy020,0),COALESCE(xmdy021,0),COALESCE(xmdy022,0),COALESCE(xmdy023,0)",
               "  FROM xmdy_t",
               " WHERE xmdyent = ",g_enterprise,
               "   AND xmdydocno = ?",
               "   AND xmdyseq = ?"
   PREPARE s_axmt540_xmdy_pre FROM l_sql

   FOREACH s_axmt540_xmdl_cs01 INTO l_xmdk044,   #150917-00001#3  2016/01/21  By earl add
                                    l_xmdlseq,l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,
                                    l_xmdl022,l_xmdl027,l_xmdl028,l_xmdl029,
                                    l_xmdl042,l_xmdl043,l_xmdl044,
                                    l_xmdl016,l_xmdl018   #150917-00001#3  2016/01/21  By earl add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF p_cmd = 'con' OR p_cmd = 'uncon' THEN
         #無來源且過帳、取消過帳如果取價來源為4：合約單時，需更新合約單上的累積量與金額
         IF l_xmdl042 = '4' AND NOT cl_null(l_xmdl043) AND NOT cl_null(l_xmdl044) AND
            cl_null(l_xmdl001) AND cl_null(l_xmdl003) THEN
            
            
            EXECUTE s_axmt540_xmdy_pre USING l_xmdl043,l_xmdl044
               INTO l_xmdy020,l_xmdy021,l_xmdy022,l_xmdy023
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
            
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF            
            
            IF cl_null(l_xmdy020) THEN
               LET l_xmdy020 = 0
            END IF
            
            IF cl_null(l_xmdy021) THEN
               LET l_xmdy021 = 0
            END IF

            IF cl_null(l_xmdy022) THEN
               LET l_xmdy022 = 0
            END IF

            IF cl_null(l_xmdy023) THEN
               LET l_xmdy023 = 0
            END IF
            
            IF p_cmd = 'con' THEN  #確認
               LET l_xmdy020 = l_xmdy020 + l_xmdl022  #累積數量
               LET l_xmdy021 = l_xmdy021 + l_xmdl027  #累積未稅金額
               LET l_xmdy022 = l_xmdy022 + l_xmdl028  #累積含稅金額
               LET l_xmdy023 = l_xmdy023 + l_xmdl029  #累積稅額
            ELSE  #取消確認
               LET l_xmdy020 = l_xmdy020 - l_xmdl022  #累積數量
               LET l_xmdy021 = l_xmdy021 - l_xmdl027  #累積未稅金額
               LET l_xmdy022 = l_xmdy022 - l_xmdl028  #累積含稅金額
               LET l_xmdy023 = l_xmdy023 - l_xmdl029  #累積稅額
            END IF
            
            UPDATE xmdy_t
               SET xmdy020 = l_xmdy020,
                   xmdy021 = l_xmdy021,
                   xmdy022 = l_xmdy022,
                   xmdy023 = l_xmdy023
             WHERE xmdyent = g_enterprise
               AND xmdydocno = l_xmdl043
               AND xmdyseq = l_xmdl044
               
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.extend = "UPDATE xmdy_t"
               LET g_errparam.popup = FALSE
               CALL cl_err()
               
               LET r_success = FALSE
               CONTINUE FOREACH
            END IF
            
            #add by Sarah 2015/08/06
            #確認時若回寫的累加量已到達累計量門檻時，也需同步回寫xmdz004與xmdz005
            IF p_cmd = 'con' THEN  #確認
               LET l_xmdkdocdt = NULL
               SELECT xmdkdocdt INTO l_xmdkdocdt
                 FROM xmdk_t
                WHERE xmdkent = g_enterprise
                  AND xmdkdocno = p_xmdkdocno
               IF cl_null(l_xmdkdocdt) THEN LET l_xmdkdocdt = g_today END IF

               UPDATE xmdz_t
                  SET xmdz004 = l_xmdkdocdt,
                      xmdz005 = p_xmdkdocno
                WHERE xmdzent = g_enterprise
                  AND xmdzdocno = l_xmdl043
                  AND xmdzseq = l_xmdl044
                  AND xmdz001 BETWEEN (l_xmdy020-l_xmdl022) AND l_xmdy020
               IF SQLCA.sqlcode THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.extend = "UPDATE xmdz_t"
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            END IF
            #add by Sarah 2015/08/06

         END IF
      END IF
      
      #150917-00001#3  2016/01/21  By earl add s
      IF p_cmd = 'pos' OR p_cmd = 'unpos' THEN
         IF p_cmd = 'pos' THEN
            LET l_upd = '1'  #過帳
         ELSE
            LET l_upd = '2'  #取消過帳
         END IF
         
         #續拋回寫最終站出貨單已簽收數量         
        #IF NOT s_aic_carry_continue_upd(g_site,l_xmdk044,'1',l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,l_xmdl016,l_xmdl018,l_upd) THEN   #170619-00049#2 mark
         #170619-00049#2-s
         #170105-00057#4 Mark By 06137  180524(S)
         #IF NOT s_aic_carry_continue_upd(g_site,l_xmdk044,'1',l_xmdl003,l_xmdl004,l_xmdl005,l_xmdl006,
         #                                l_xmdl016,l_xmdl018,l_upd,p_xmdkdocno,l_xmdlseq) THEN
         ##170619-00049#2-e                                
         #   LET r_success = FALSE
         #   CONTINUE FOREACH
         #END IF
         #170105-00057#4 Mark By 06137  180524(E)         
      END IF
      #150917-00001#3  2016/01/21  By earl add e
      
   END FOREACH
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 檢查/更新信用額度
# Memo...........:
# Usage..........: CALL s_axmt540_credit(p_type,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_type       #類型：1信用額度檢查2更新信用餘額檔(正向)3更新信用餘額檔(反向)  
#                : p_xmdkdocno  #出貨單號
# Return code....: r_success    #執行結果
#                : 
# Date & Author..: 140902 By earl
# Modify.........: 150629 By Polly  調整信用額度餘額更新元件
#                : 150925 by 04441 add p_type=4.信用額度檢查l_flag(0:超限2:逾期)
################################################################################
PUBLIC FUNCTION s_axmt540_credit(p_type,p_xmdkdocno)
   DEFINE p_type         LIKE type_t.num5         #類型：1信用額度檢查2更新信用餘額檔(正向)3更新信用餘額檔(反向)
   DEFINE p_xmdkdocno    LIKE xmdk_t.xmdkdocno
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_slip         LIKE ooba_t.ooba001
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_oproj        LIKE xmaa_t.xmaa002      #前置計算項目
   DEFINE l_sql          STRING 
   DEFINE l_flag         LIKE type_t.num5         #信用餘額足夠否(1:足夠, 0:不足)
   DEFINE l_site         LIKE xmdl_t.xmdlsite     #來源營運據點
   DEFINE l_sum          LIKE xmdl_t.xmdl028

   DEFINE l_xmdk      RECORD
             xmdksite    LIKE xmdk_t.xmdksite,
             xmdk000     LIKE xmdk_t.xmdk000,
             xmdk007     LIKE xmdk_t.xmdk007,
             xmdk016     LIKE xmdk_t.xmdk016,
             xmdk052     LIKE xmdk_t.xmdk052
                      END RECORD
  #--150701--polly--add--(S)
   DEFINE ls_js        STRING  
   DEFINE lc_param  RECORD
             xmab003    LIKE xmab_t.xmab003, 
             xmab006    LIKE xmab_t.xmab006,
             xmab007    LIKE xmab_t.xmab007,
             proj       LIKE xmaa_t.xmaa002,
             proj_o     LIKE xmaa_t.xmaa002,
             type       LIKE type_t.num5,
             glaald     LIKE glaa_t.glaald,
             glaacomp   LIKE glaa_t.glaacomp               
                END RECORD
  #--150701--polly--add--(E)
#190802-00035#4-S add  
DEFINE lc_param2  RECORD
             curr       LIKE ooan_t.ooan002,    
             rate       LIKE xmab_t.xmab013  
                  END RECORD                  
DEFINE ls_js2     STRING             
#190802-00035#4-E add 

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   INITIALIZE l_xmdk.* TO NULL
   SELECT xmdksite,xmdk000,xmdk007,xmdk016,COALESCE(xmdk052,0),xmdk017
     INTO l_xmdk.xmdksite,l_xmdk.xmdk000,l_xmdk.xmdk007,l_xmdk.xmdk016,l_xmdk.xmdk052,lc_param2.rate   #190802-00035#4 add xmdk017
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   LET lc_param2.curr = l_xmdk.xmdk016   #190802-00035#4 add
   
   LET l_oproj = ''
   
   CASE l_xmdk.xmdk000  
     WHEN '1'                #axmt540出貨單   
       CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
       IF l_success THEN
          IF cl_get_doc_para(g_enterprise,l_xmdk.xmdksite,l_slip,'D-BAS-0062') = 'Y' THEN    #出貨單與出通單勾稽
             #出通單
             LET l_oproj = 'S2'
          ELSE
             #訂單
             LET l_oproj = 'S1'
          END IF
          IF p_type = '1' OR p_type = '4' THEN  #150626 by 04441 add p_type = '4'
             #160923-00023#1-s-add  
             #多角排除
             IF NOT s_credit_aic_chk('S3',p_xmdkdocno) THEN
                RETURN r_success
             END IF       
             #160923-00023#1-e-add              
             #收款據點
             LET l_sql = "SELECT xmdcorga,SUM(xmdl028)",
                         "  FROM xmdl_t,xmdc_t",
                         " WHERE xmdlent = xmdcent AND xmdcent = ",g_enterprise,
                         "   AND xmdldocno = '",p_xmdkdocno,"'",
                         "   AND xmdcdocno = xmdl003",
                         "   AND xmdcseq = xmdl004",
                         "   GROUP BY xmdcorga "                         
             PREPARE s_axmt540_pre31 FROM l_sql
             DECLARE s_axmt540_cs31 CURSOR FOR s_axmt540_pre31      
 
             FOREACH s_axmt540_cs31 INTO l_site,l_sum
                IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = "FOREACH:"
                   LET g_errparam.popup = TRUE
                   CALL cl_err()           
                   LET r_success = FALSE
                   EXIT FOREACH
                END IF
                IF cl_null(l_site) THEN
                   LET l_site = l_xmdk.xmdksite
                END IF               
                #CALL s_credit_check_xmac004(l_site,l_xmdk.xmdk007,'S3',l_oproj,l_sum,l_xmdk.xmdk016)   #190802-00035#4 mark
                LET ls_js2 = util.JSON.stringify(lc_param2)                                    #190802-00035#4 add 
                CALL s_credit_check_xmac004(l_site,l_xmdk.xmdk007,'S3',l_oproj,l_sum,ls_js2)  #190802-00035#4 add 
                  RETURNING l_success,l_flag
                #150626 by 04441 modify start
                IF l_flag <> 1 THEN  #信用額度不足
                   IF p_type = '1' THEN
                      LET r_success = FALSE
                      RETURN r_success
                   ELSE
                      RETURN l_flag
                   END IF
                END IF
                #150925 by 04441 modify end
             END FOREACH
         ELSE
            LET lc_param.xmab003 = p_xmdkdocno
            LET lc_param.xmab006 = l_xmdk.xmdk007
            LET lc_param.xmab007 = l_xmdk.xmdk016
            LET lc_param.proj    = 'S3'
            LET lc_param.proj_o  = l_oproj   
            IF p_type = '2' THEN
               LET lc_param.type    = '1'   #正向
            ELSE
               LET lc_param.type    = '2'   #反向
            END IF
            LET lc_param.glaald  = ''  
            LET lc_param.glaacomp = ''            
            LET ls_js = util.JSON.stringify(lc_param)
            IF NOT s_credit_move(ls_js) THEN          #更新信用餘額檔
               LET r_success = FALSE
               RETURN r_success
            END IF           
         END IF        
       END IF
     WHEN '2'          #axmt541無訂單出貨單
       IF p_type = '1' OR p_type = '4' THEN  #檢核信用額度  #150626 by 04441 add p_type = '4'
         #160923-00023#1-s-add  
          #多角排除
          IF NOT s_credit_aic_chk('S3',p_xmdkdocno) THEN
             RETURN r_success
          END IF       
         #160923-00023#1-e-add
         #190521-00006#1---ad d--s
         IF cl_null(l_site) THEN
            LET l_site = l_xmdk.xmdksite
         END IF
         #190521-00006#1---add---e         
          #CALL s_credit_check_xmac004(l_site,l_xmdk.xmdk007,'S3','',l_xmdk.xmdk052,l_xmdk.xmdk016) RETURNING l_success,l_flag #190802-00035#4 mark
          LET ls_js2 = util.JSON.stringify(lc_param2)                                    #190802-00035#4 add 
          CALL s_credit_check_xmac004(l_site,l_xmdk.xmdk007,'S3','',l_xmdk.xmdk052,ls_js2) RETURNING l_success,l_flag  #190802-00035#4 add           
          #150626 by 04441 modify start
          IF l_flag <> 1 THEN  #信用額度不足
             IF p_type = '1' THEN
                LET r_success = FALSE
                RETURN r_success
             ELSE
                RETURN l_flag
             END IF
          END IF
          #150925 by 04441 modify end
       ELSE
          LET lc_param.xmab003 = p_xmdkdocno
          LET lc_param.xmab006 = l_xmdk.xmdk007
          LET lc_param.xmab007 = l_xmdk.xmdk016
          LET lc_param.proj    = 'S3'
          LET lc_param.proj_o  = ''   
          IF p_type = '2' THEN
             LET lc_param.type    = '1'   #正向
          ELSE
             LET lc_param.type    = '2'   #反向
          END IF
          LET lc_param.glaald  = ''  
          LET lc_param.glaacomp = ''            
          LET ls_js = util.JSON.stringify(lc_param)
          IF NOT s_credit_move(ls_js) THEN           #更新信用餘額檔
             LET r_success = FALSE
             RETURN r_success
          END IF       
       END IF
   END CASE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢核該單號中是否有庫位不存在於過帳人員設定的控制組的限制範圍內
# Memo...........:
# Usage..........: CALL s_axmt540_control_check_stock(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: 單號
# Return code....: TURE OR FALSE
# Date & Author..: 150706 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_control_check_stock(p_xmdkdocno)
DEFINE p_xmdkdocno  LIKE xmdk_t.xmdkdocno
DEFINE r_success    LIKE type_t.num5
DEFINE l_xmdk039    LIKE xmdk_t.xmdk039
DEFINE l_xmdk040    LIKE xmdk_t.xmdk040
DEFINE l_xmdm005    LIKE xmdm_t.xmdm005
#160727-00046#1 20160729 add -----(S) 
DEFINE l_xmdk002    LIKE xmdk_t.xmdk002
#160727-00046#1 20160729 add -----(E) 

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   #160727-00046#1 20160729 mark -----(S) 
   #LET l_xmdk039 = ''
   #LET l_xmdk040 = ''
   #SELECT xmdk039,xmdk040
   #  INTO l_xmdk039,l_xmdk040
   #  FROM xmdk_t
   # WHERE xmdkent = g_enterprise
   #   AND xmdkdocno = p_xmdkdocno
   #IF NOT cl_null(l_xmdk039) THEN
   #   IF NOT s_control_check_stock(l_xmdk039,'5',g_site,g_user,g_dept) THEN
   #      LET　r_success = FALSE
   #   END IF
   #END IF
   #IF NOT cl_null(l_xmdk040) THEN
   #   IF NOT s_control_check_stock(l_xmdk040,'5',g_site,g_user,g_dept) THEN
   #      LET　r_success = FALSE
   #   END IF
   #END IF
   #160727-00046#1 20160729 mark -----(E) 
   
   #160727-00046#1 20160729 add -----(S) 
   LET l_xmdk002 = ''
   SELECT xmdk002 INTO l_xmdk002
     FROM xmdk_t
    WHERE xmdkent   = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   #160727-00046#1 20160729 add -----(E) 
   
   #單身庫位
   LET l_xmdm005 = ''
   DECLARE s_axmt540_control_check_stock_cur CURSOR FOR
      SELECT xmdm005 FROM xmdm_t
       WHERE xmdment = g_enterprise
         AND xmdmdocno = p_xmdkdocno
         AND xmdm005 IS NOT NULL
         AND xmdm005 <> ' '
         
   #IF g_prog NOT MATCHES 'axmt580' AND (NOT (g_prog MATCHES 'axmt540' AND l_xmdk002 = '4')) THEN #160727-00046#1 20160729 add   #170301-00030#1 by 09257 --mark 
   IF g_prog NOT MATCHES 'axmt580*' AND (NOT (g_prog MATCHES 'axmt540*' AND l_xmdk002 = '4')) THEN   #170301-00030#1 by 09257 --add
      FOREACH s_axmt540_control_check_stock_cur INTO l_xmdm005
         IF NOT s_control_check_stock(l_xmdm005,'5',g_site,g_user,g_dept) THEN
            LET　r_success = FALSE
         END IF
         LET l_xmdm005 = ''
      END FOREACH
   END IF            #160727-00046#1 20160729 add 
   
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ain-00275'    
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 將初始站出貨單過帳還原>確認還原>刪除
# Memo...........:
# Usage..........: CALL s_axmt540_delete(p_xmdkdocno)
# Input parameter: p_xmdkdocno 單號
#                : 
# Return code....: TRUE OR FALSE
# Date & Author..: 150709 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_delete(p_xmdkdocno)
   DEFINE p_xmdkdocno  LIKE xmdk_t.xmdkdocno
   DEFINE r_success    LIKE type_t.num5 
   DEFINE l_xmdkdocno  LIKE xmdk_t.xmdkdocno
   DEFINE l_xmdkdocdt  LIKE xmdk_t.xmdkdocdt
   DEFINE l_xmdksite   LIKE xmdk_t.xmdksite
   DEFINE l_site       LIKE xmdk_t.xmdksite

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET l_xmdkdocno = ''
   LET l_xmdkdocdt = ''
   LET l_xmdksite = ''
   SELECT xmdkdocno,xmdkdocdt,xmdksite
     INTO l_xmdkdocno,l_xmdkdocdt,l_xmdksite
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdk035 = p_xmdkdocno
      AND xmdkstus <> 'X'
   
   #無初始站單號，不做處理
   IF cl_null(l_xmdkdocno) THEN
      RETURN r_success
   END IF
   
   #備份營運據點
   LET l_site = g_site
   LET g_site = l_xmdksite

#150807 多角序號不清空，因清空後無法判別是第0站產生之出貨單或是原出貨單 earl
#   #清空多角序號
#   UPDATE xmdk_t
#      SET xmdk035 = ''
#    WHERE xmdkent = g_enterprise
#      AND xmdkdocno = l_xmdkdocno
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "xmdk_t"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = FALSE
#      CALL cl_err()
#      
#      LET r_success = FALSE
#   END IF
   
   #過帳還原
   IF r_success THEN
      IF NOT s_axmt540_unpost_chk(l_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF
   IF r_success THEN
      IF NOT s_axmt540_unpost_upd(l_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF
   
   #取消確認
   IF r_success THEN
      IF NOT s_apmt520_unconf_chk(l_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF
   IF r_success THEN
      IF NOT s_apmt520_unconf_upd(l_xmdkdocno) THEN
         LET r_success = FALSE
      END IF
   END IF
      
   #單頭刪除
   IF r_success THEN
      DELETE FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = l_xmdkdocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_xmdkdocno
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = FALSE
         CALL cl_err()
         
         LET r_success = FALSE
      END IF
      #編碼
      IF NOT s_aooi200_del_docno(l_xmdkdocno,l_xmdkdocdt) THEN
         LET r_success = FALSE
      END IF
      #刪除稅額xrcd
      IF NOT s_axmt540_tax_delete(l_xmdkdocno,'','1') THEN
         LET r_success = FALSE
      END IF
      #刪除備註
      IF NOT s_aooi360_del('6','axmt540',l_xmdkdocno,'','','','','','','','','4') THEN
         LET r_success = FALSE
      END IF
      #單身刪除
      DELETE FROM xmdl_t
       WHERE xmdlent = g_enterprise
         AND xmdldocno = l_xmdkdocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "xmdl_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = FALSE
         CALL cl_err()
         
         LET r_success = FALSE
      END IF
      
      DELETE FROM xmdm_t
       WHERE xmdment = g_enterprise
         AND xmdmdocno = l_xmdkdocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "xmdl_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = FALSE
         CALL cl_err()
         
         LET r_success = FALSE
      END IF
   END IF
   
   #還原營運據點
   LET g_site = l_site
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 統銷統收產生之出貨單不做回寫動作
# Memo...........:
# Usage..........: CALL s_axmt540_xmdk045_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出貨單號
#                : 
# Return code....: r_success      TRUE要回寫/FALSE不須回寫
#                : 
# Date & Author..: 150717 By earl
# Modify.........: 2016/05/13 By Lori  #160505-00018#4 將 PRIVATE 改為 PUBLIC
################################################################################
PUBLIC FUNCTION s_axmt540_xmdk045_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sel        RECORD
      xmdk045             LIKE xmdk_t.xmdk045,   #多角性質
      xmdk035             LIKE xmdk_t.xmdk035    #多角序號
                       END RECORD
   DEFINE l_n             LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   INITIALIZE l_sel.* TO NULL
   SELECT xmdk045,xmdk035
     INTO l_sel.xmdk045,l_sel.xmdk035
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   IF l_sel.xmdk045 = '3' THEN  #3:統銷統收
      LET l_n = 0
      SELECT COUNT(xmdkdocno) INTO l_n
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = l_sel.xmdk035
         AND xmdkstus <> 'X'
      
      IF l_n > 0 THEN
         LET r_success = FALSE   #不需回寫
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 統銷統收產生初始站出貨單
# Memo...........:
# Usage..........: CALL s_axmt540_produce_packing(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno  出貨單號
#                : 
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 150806 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_produce_packing(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   
   DEFINE l_xmdk005       LIKE xmdk_t.xmdk005
   DEFINE l_xmdk006       LIKE xmdk_t.xmdk006
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_slip          LIKE xmdk_t.xmdkdocno
   DEFINE l_sql           STRING
   DEFINE l_site          LIKE xmdk_t.xmdksite
   DEFINE l_xmdkstus      LIKE xmdk_t.xmdkstus
   
   DEFINE l_imaf          RECORD
      imaf091                LIKE imaf_t.imaf091,
      imaf092                LIKE imaf_t.imaf092
                          END RECORD
   DEFINE l_xrcd          RECORD
      xrcd103                LIKE xrcd_t.xrcd103,
      xrcd104                LIKE xrcd_t.xrcd104,
      xrcd105                LIKE xrcd_t.xrcd105,
      xrcd113                LIKE xrcd_t.xrcd113,
      xrcd114                LIKE xrcd_t.xrcd114,
      xrcd115                LIKE xrcd_t.xrcd115
                          END RECORD
   DEFINE l_xmda          RECORD
      xmdasite               LIKE xmda_t.xmdasite,
      xmda011                LIKE xmda_t.xmda011,
      xmda012                LIKE xmda_t.xmda012,
      xmda013                LIKE xmda_t.xmda013,
      xmda015                LIKE xmda_t.xmda015,
      xmda016                LIKE xmda_t.xmda016
                          END RECORD
   DEFINE l_xmdk          RECORD
      xmdkent                LIKE xmdk_t.xmdkent,
      xmdksite               LIKE xmdk_t.xmdksite,
      xmdkdocno              LIKE xmdk_t.xmdkdocno,
      xmdkdocdt              LIKE xmdk_t.xmdkdocdt,
      xmdk000                LIKE xmdk_t.xmdk000,
      xmdk001                LIKE xmdk_t.xmdk001,
      xmdk002                LIKE xmdk_t.xmdk002,
      xmdk003                LIKE xmdk_t.xmdk003,
      xmdk004                LIKE xmdk_t.xmdk004,
      xmdk005                LIKE xmdk_t.xmdk005,
      xmdk006                LIKE xmdk_t.xmdk006,
      xmdk007                LIKE xmdk_t.xmdk007,
      xmdk008                LIKE xmdk_t.xmdk008,
      xmdk009                LIKE xmdk_t.xmdk009,
      xmdk010                LIKE xmdk_t.xmdk010,
      xmdk011                LIKE xmdk_t.xmdk011,
      xmdk012                LIKE xmdk_t.xmdk012,
      xmdk013                LIKE xmdk_t.xmdk013,
      xmdk014                LIKE xmdk_t.xmdk014,
      xmdk015                LIKE xmdk_t.xmdk015,
      xmdk016                LIKE xmdk_t.xmdk016,
      xmdk017                LIKE xmdk_t.xmdk017,
      xmdk018                LIKE xmdk_t.xmdk018,
      xmdk019                LIKE xmdk_t.xmdk019,
      xmdk020                LIKE xmdk_t.xmdk020,
      xmdk021                LIKE xmdk_t.xmdk021,
      xmdk022                LIKE xmdk_t.xmdk022,
      xmdk023                LIKE xmdk_t.xmdk023,
      xmdk024                LIKE xmdk_t.xmdk024,
      xmdk025                LIKE xmdk_t.xmdk025,
      xmdk026                LIKE xmdk_t.xmdk026,
      xmdk027                LIKE xmdk_t.xmdk027,
      xmdk028                LIKE xmdk_t.xmdk028,
      xmdk029                LIKE xmdk_t.xmdk029,
      xmdk030                LIKE xmdk_t.xmdk030,
      xmdk031                LIKE xmdk_t.xmdk031,
      xmdk032                LIKE xmdk_t.xmdk032,
      xmdk033                LIKE xmdk_t.xmdk033,
      xmdk034                LIKE xmdk_t.xmdk034,
      xmdk035                LIKE xmdk_t.xmdk035,
      xmdk036                LIKE xmdk_t.xmdk036,
      xmdk037                LIKE xmdk_t.xmdk037,
      xmdk038                LIKE xmdk_t.xmdk038,
      xmdk039                LIKE xmdk_t.xmdk039,
      xmdk040                LIKE xmdk_t.xmdk040,
      xmdk041                LIKE xmdk_t.xmdk041,
      xmdk042                LIKE xmdk_t.xmdk042,
      xmdk043                LIKE xmdk_t.xmdk043,
      xmdk044                LIKE xmdk_t.xmdk044,
      xmdk045                LIKE xmdk_t.xmdk045,
      xmdk051                LIKE xmdk_t.xmdk051,
      xmdk052                LIKE xmdk_t.xmdk052,
      xmdk053                LIKE xmdk_t.xmdk053,
      xmdk055                LIKE xmdk_t.xmdk055,
      xmdk083                LIKE xmdk_t.xmdk083,
      xmdk202                LIKE xmdk_t.xmdk202,
      xmdk087                LIKE xmdk_t.xmdk087,   #出貨走發票倉調撥 #add by lixiang 2015/12/30
      xmdk071                LIKE xmdk_t.xmdk071,   #201216-00027#5 add
      xmdkownid              LIKE xmdk_t.xmdkownid,
      xmdkowndp              LIKE xmdk_t.xmdkowndp,
      xmdkcrtid              LIKE xmdk_t.xmdkcrtid,
      xmdkcrtdp              LIKE xmdk_t.xmdkcrtdp,
      xmdkcrtdt              LIKE xmdk_t.xmdkcrtdt,
      xmdkstus               LIKE xmdk_t.xmdkstus
                          END RECORD
   DEFINE l_xmdl          RECORD
      xmdlent                LIKE xmdl_t.xmdlent,
      xmdlsite               LIKE xmdl_t.xmdlsite,
      xmdldocno              LIKE xmdl_t.xmdldocno,
      xmdlseq                LIKE xmdl_t.xmdlseq,
      xmdl001                LIKE xmdl_t.xmdl001,
      xmdl002                LIKE xmdl_t.xmdl002,
      xmdl003                LIKE xmdl_t.xmdl003,
      xmdl004                LIKE xmdl_t.xmdl004,
      xmdl005                LIKE xmdl_t.xmdl005,
      xmdl006                LIKE xmdl_t.xmdl006,
      xmdl007                LIKE xmdl_t.xmdl007,
      xmdl008                LIKE xmdl_t.xmdl008,
      xmdl009                LIKE xmdl_t.xmdl009,
      xmdl010                LIKE xmdl_t.xmdl010,
      xmdl011                LIKE xmdl_t.xmdl011,
      xmdl012                LIKE xmdl_t.xmdl012,
      xmdl013                LIKE xmdl_t.xmdl013,
      xmdl014                LIKE xmdl_t.xmdl014,
      xmdl015                LIKE xmdl_t.xmdl015,
      xmdl016                LIKE xmdl_t.xmdl016,
      xmdl017                LIKE xmdl_t.xmdl017,
      xmdl018                LIKE xmdl_t.xmdl018,
      xmdl019                LIKE xmdl_t.xmdl019,
      xmdl020                LIKE xmdl_t.xmdl020,
      xmdl021                LIKE xmdl_t.xmdl021,
      xmdl022                LIKE xmdl_t.xmdl022,
      xmdl023                LIKE xmdl_t.xmdl023,
      xmdl024                LIKE xmdl_t.xmdl024,
      xmdl025                LIKE xmdl_t.xmdl025,
      xmdl026                LIKE xmdl_t.xmdl026,
      xmdl027                LIKE xmdl_t.xmdl027,
      xmdl028                LIKE xmdl_t.xmdl028,
      xmdl029                LIKE xmdl_t.xmdl029,
      xmdl030                LIKE xmdl_t.xmdl030,
      xmdl031                LIKE xmdl_t.xmdl031,
      xmdl032                LIKE xmdl_t.xmdl032,
      xmdl033                LIKE xmdl_t.xmdl033,
      xmdl034                LIKE xmdl_t.xmdl034,
      xmdl035                LIKE xmdl_t.xmdl035,
      xmdl036                LIKE xmdl_t.xmdl036,
      xmdl037                LIKE xmdl_t.xmdl037,
      xmdl038                LIKE xmdl_t.xmdl038,
      xmdl039                LIKE xmdl_t.xmdl039,
      xmdl040                LIKE xmdl_t.xmdl040,
      xmdl041                LIKE xmdl_t.xmdl041,
      xmdl042                LIKE xmdl_t.xmdl042,
      xmdl043                LIKE xmdl_t.xmdl043,
      xmdl044                LIKE xmdl_t.xmdl044,
      xmdl045                LIKE xmdl_t.xmdl045,
      xmdl046                LIKE xmdl_t.xmdl046,
      xmdl047                LIKE xmdl_t.xmdl047,
      xmdl048                LIKE xmdl_t.xmdl048,
      xmdl049                LIKE xmdl_t.xmdl049,
      xmdl050                LIKE xmdl_t.xmdl050,
      xmdl051                LIKE xmdl_t.xmdl051,
      xmdl052                LIKE xmdl_t.xmdl052,
      xmdl053                LIKE xmdl_t.xmdl053,
      xmdl054                LIKE xmdl_t.xmdl054,
      xmdl055                LIKE xmdl_t.xmdl055,
      xmdl056                LIKE xmdl_t.xmdl056,
      xmdl081                LIKE xmdl_t.xmdl081,
      xmdl082                LIKE xmdl_t.xmdl082,
      xmdl083                LIKE xmdl_t.xmdl083,
      xmdl084                LIKE xmdl_t.xmdl084,
      xmdl085                LIKE xmdl_t.xmdl085,
      xmdl086                LIKE xmdl_t.xmdl086,
      xmdl087                LIKE xmdl_t.xmdl087,
      xmdl088                LIKE xmdl_t.xmdl088
                          END RECORD
DEFINE l_xmdm             RECORD
      xmdment                LIKE xmdm_t.xmdment,
      xmdmsite               LIKE xmdm_t.xmdmsite,
      xmdmdocno              LIKE xmdm_t.xmdmdocno,
      xmdmseq                LIKE xmdm_t.xmdmseq,
      xmdmseq1               LIKE xmdm_t.xmdmseq1,
      xmdm001                LIKE xmdm_t.xmdm001,
      xmdm002                LIKE xmdm_t.xmdm002,
      xmdm003                LIKE xmdm_t.xmdm003,
      xmdm004                LIKE xmdm_t.xmdm004,
      xmdm005                LIKE xmdm_t.xmdm005,
      xmdm006                LIKE xmdm_t.xmdm006,
      xmdm007                LIKE xmdm_t.xmdm007,
      xmdm008                LIKE xmdm_t.xmdm008,
      xmdm009                LIKE xmdm_t.xmdm009,
      xmdm010                LIKE xmdm_t.xmdm010,
      xmdm011                LIKE xmdm_t.xmdm011,
      xmdm012                LIKE xmdm_t.xmdm012,
      xmdm013                LIKE xmdm_t.xmdm013,
      xmdm014                LIKE xmdm_t.xmdm014,
      xmdm031                LIKE xmdm_t.xmdm031,
      xmdm032                LIKE xmdm_t.xmdm032,
      xmdm033                LIKE xmdm_t.xmdm033
                          END RECORD
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   LET l_sql = "SELECT xmdl003 ",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               "   AND xmdl003 IS NOT NULL",
               " ORDER BY xmdlseq"
   PREPARE axmt540_produce_packing_pre FROM l_sql
   DECLARE axmt540_produce_packing_cur SCROLL CURSOR FOR axmt540_produce_packing_pre

   LET l_xmdk005 = ''
   LET l_xmdk006 = ''
   LET l_xmdk045 = ''
   SELECT xmdk005,xmdk006,xmdk045
     INTO l_xmdk005,l_xmdk006,l_xmdk045
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   #非統銷統收不產生
   IF l_xmdk045 <> '3' THEN
      RETURN r_success
   END IF
   
   #來源訂單號
   IF cl_null(l_xmdk006) THEN
      OPEN axmt540_produce_packing_cur
      FETCH FIRST axmt540_produce_packing_cur INTO l_xmdk006
      IF cl_null(l_xmdk006) THEN
         INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00707'   #"多角性質"為"3.統銷統收"時，來源訂單不可為空！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF

   INITIALIZE l_xmda.* TO NULL
   SELECT xmdasite,
          xmda011,xmda012,xmda013,
          xmda015,xmda016
     INTO l_xmda.xmdasite,
          l_xmda.xmda011,l_xmda.xmda012,l_xmda.xmda013,
          l_xmda.xmda015,l_xmda.xmda016
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = l_xmdk006

   #抓來源訂單的下站單別
   CALL s_aooi210_get_doc(l_xmda.xmdasite,'','2',l_xmdk006,'axmt540','axm-00705') RETURNING r_success,l_slip
   IF NOT r_success THEN
      RETURN r_success
   END IF

   INITIALIZE l_xmdk.* TO NULL
   
   LET l_xmdk.xmdkent = g_enterprise
   LET l_xmdk.xmdksite = l_xmda.xmdasite
   LET l_xmdk.xmdkdocdt = g_today
   LET l_xmdk.xmdk001 = g_today  #扣帳日期
   LET l_xmdk.xmdk002 = '1'      #出貨性質
   LET l_xmdk.xmdkownid = g_user
   LET l_xmdk.xmdkowndp = g_dept
   LET l_xmdk.xmdkcrtid = g_user
   LET l_xmdk.xmdkcrtdp = g_dept
   LET l_xmdk.xmdkcrtdt = cl_get_current()
   LET l_xmdk.xmdkstus = 'N'
   
   LET l_xmdk.xmdk012 = l_xmda.xmda011 #稅別
   LET l_xmdk.xmdk013 = l_xmda.xmda012 #稅率
   LET l_xmdk.xmdk014 = l_xmda.xmda013 #單價含稅否
   LET l_xmdk.xmdk016 = l_xmda.xmda015 #幣別
   LET l_xmdk.xmdk017 = l_xmda.xmda016 #匯率
   LET l_xmdk.xmdk035 = p_xmdkdocno    #多角序號存放該出貨單單號
   
   SELECT xmdk000,xmdk003,xmdk004,
          xmdk006,xmdk007,xmdk008,xmdk009,xmdk010,
          xmdk011,xmdk015,
          xmdk018,xmdk019,xmdk020,
          xmdk021,xmdk022,xmdk023,xmdk024,xmdk025,
          xmdk026,xmdk027,xmdk028,xmdk029,xmdk030,
          xmdk031,xmdk032,xmdk033,xmdk034,
          xmdk036,xmdk037,xmdk038,xmdk039,xmdk040,
          xmdk041,xmdk042,xmdk043,xmdk044,xmdk045,
          xmdk055,xmdk083,xmdk202,
           xmdk087   #出貨走發票倉調撥 #add by lixiang 2015/12/30
          ,xmdk071 #201216-00027#5 add
     INTO l_xmdk.xmdk000,l_xmdk.xmdk003,l_xmdk.xmdk004,
          l_xmdk.xmdk006,l_xmdk.xmdk007,l_xmdk.xmdk008,l_xmdk.xmdk009,l_xmdk.xmdk010,
          l_xmdk.xmdk011,l_xmdk.xmdk015,
          l_xmdk.xmdk018,l_xmdk.xmdk019,l_xmdk.xmdk020,
          l_xmdk.xmdk021,l_xmdk.xmdk022,l_xmdk.xmdk023,l_xmdk.xmdk024,l_xmdk.xmdk025,
          l_xmdk.xmdk026,l_xmdk.xmdk027,l_xmdk.xmdk028,l_xmdk.xmdk029,l_xmdk.xmdk030,
          l_xmdk.xmdk031,l_xmdk.xmdk032,l_xmdk.xmdk033,l_xmdk.xmdk034,
          l_xmdk.xmdk036,l_xmdk.xmdk037,l_xmdk.xmdk038,l_xmdk.xmdk039,l_xmdk.xmdk040,
          l_xmdk.xmdk041,l_xmdk.xmdk042,l_xmdk.xmdk043,l_xmdk.xmdk044,l_xmdk.xmdk045,
          l_xmdk.xmdk055,l_xmdk.xmdk083,l_xmdk.xmdk202,
          l_xmdk.xmdk087  #add by lixiang 2015/12/30
         ,l_xmdk.xmdk071  #201216-00027#5 add
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno

   #自動產生單號
   CALL s_aooi200_gen_docno(l_xmdk.xmdksite,l_slip,l_xmdk.xmdkdocdt,'axmt540')
   RETURNING r_success,l_xmdk.xmdkdocno
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'
      LET g_errparam.extend = l_xmdk.xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      RETURN r_success
   END IF

   INSERT INTO xmdk_t(xmdkent,xmdksite,
                      xmdkdocno,xmdkdocdt,xmdk000,
                      xmdk001,xmdk002,xmdk003,xmdk004,xmdk005,
                      xmdk006,xmdk007,xmdk008,xmdk009,xmdk010,
                      xmdk011,xmdk012,xmdk013,xmdk014,xmdk015,
                      xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,
                      xmdk021,xmdk022,xmdk023,xmdk024,xmdk025,
                      xmdk026,xmdk027,xmdk028,xmdk029,xmdk030,
                      xmdk031,xmdk032,xmdk033,xmdk034,xmdk035,
                      xmdk036,xmdk037,xmdk038,xmdk039,xmdk040,
                      xmdk041,xmdk042,xmdk043,xmdk044,xmdk045,
                      xmdk051,xmdk052,xmdk053,xmdk055,
                      xmdk083,xmdk202,
                      xmdk087,   #出貨走發票倉調撥 #add by lixiang 2015/12/30
                      xmdk071,   #201216-00027#5 add
                      xmdkownid,xmdkowndp,
                      xmdkcrtid,xmdkcrtdp,xmdkcrtdt,
                      xmdkstus)
        VALUES (l_xmdk.xmdkent,l_xmdk.xmdksite,
                l_xmdk.xmdkdocno,l_xmdk.xmdkdocdt,l_xmdk.xmdk000,
                l_xmdk.xmdk001,l_xmdk.xmdk002,l_xmdk.xmdk003,l_xmdk.xmdk004,l_xmdk.xmdk005,
                l_xmdk.xmdk006,l_xmdk.xmdk007,l_xmdk.xmdk008,l_xmdk.xmdk009,l_xmdk.xmdk010,
                l_xmdk.xmdk011,l_xmdk.xmdk012,l_xmdk.xmdk013,l_xmdk.xmdk014,l_xmdk.xmdk015,
                l_xmdk.xmdk016,l_xmdk.xmdk017,l_xmdk.xmdk018,l_xmdk.xmdk019,l_xmdk.xmdk020,
                l_xmdk.xmdk021,l_xmdk.xmdk022,l_xmdk.xmdk023,l_xmdk.xmdk024,l_xmdk.xmdk025,
                l_xmdk.xmdk026,l_xmdk.xmdk027,l_xmdk.xmdk028,l_xmdk.xmdk029,l_xmdk.xmdk030,
                l_xmdk.xmdk031,l_xmdk.xmdk032,l_xmdk.xmdk033,l_xmdk.xmdk034,l_xmdk.xmdk035,
                l_xmdk.xmdk036,l_xmdk.xmdk037,l_xmdk.xmdk038,l_xmdk.xmdk039,l_xmdk.xmdk040,
                l_xmdk.xmdk041,l_xmdk.xmdk042,l_xmdk.xmdk043,l_xmdk.xmdk044,l_xmdk.xmdk045,
                l_xmdk.xmdk051,l_xmdk.xmdk052,l_xmdk.xmdk053,l_xmdk.xmdk055,
                l_xmdk.xmdk083,l_xmdk.xmdk202,
                l_xmdk.xmdk087,  #add by lixiang 2015/12/30
                l_xmdk.xmdk071,  #201216-00027#5 add
                l_xmdk.xmdkownid,l_xmdk.xmdkowndp,
                l_xmdk.xmdkcrtid,l_xmdk.xmdkcrtdp,l_xmdk.xmdkcrtdt,
                l_xmdk.xmdkstus)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "INSERT:xmdk_t" 
      LET g_errparam.code = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
      LET r_success = FALSE
      RETURN r_success
   END IF
      
   #SELECT FROM xmdl_t
   LET l_sql = " SELECT xmdlseq,",
               "        xmdl003,xmdl004,xmdl005,",
               "        xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,",
               "        xmdl011,xmdl012,xmdl013,xmdl014,xmdl015,",
               "        xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,",
               "        xmdl021,xmdl022,xmdl051,xmdl052",
               "   FROM xmdl_t",
               "  WHERE xmdlent = ",g_enterprise,
               "    AND xmdldocno = '",p_xmdkdocno,"'",
               "  ORDER BY xmdlseq"
   PREPARE axmt540_produce_xmdl_pre FROM l_sql
   DECLARE axmt540_produce_xmdl_cs CURSOR WITH HOLD FOR axmt540_produce_xmdl_pre
   
   #SELECT FROM xmdc_t,xmdd_t
   LET l_sql = "SELECT xmdc021,xmdc027,",
               "       xmdc036,xmdc037,xmdc038,xmdc040,",
               "       xmdc041,xmdc042,xmdc043,xmdc044,",
               "       xmdd018,xmdd019,xmdd020",
               "  FROM xmdc_t,xmdd_t",
               " WHERE xmdcent = xmddent AND xmddent = ",g_enterprise,
               "   AND xmdcdocno = xmdddocno",
               "   AND xmdcseq = xmddseq",
               "   AND xmdddocno = ?",
               "   AND xmddseq = ?",
               "   AND xmddseq1 = ?",
               "   AND xmddseq2 = ?"
   PREPARE axmt540_produce_xmdd_pre FROM l_sql
   
   LET l_sql = "SELECT imaf091,imaf092",
               "  FROM imaf_t",
               " WHERE imafent = ",g_enterprise,
               "   AND imafsite = ?",
               "   AND imaf001 = ?"
   PREPARE axmt540_produce_imaf_pre FROM l_sql
   
   #SELECT FROM xmdm_t
   LET l_sql = "SELECT xmdmseq1,",
               "       xmdm001,xmdm002,xmdm003,xmdm004,",
               "       xmdm007,xmdm008,xmdm009,xmdm010,",
               "       xmdm011",
               "  FROM xmdm_t",
               " WHERE xmdment = ",g_enterprise,
               "   AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdmseq = ?"
   PREPARE axmt540_produce_xmdm_pre FROM l_sql
   DECLARE axmt540_produce_xmdm_cs CURSOR WITH HOLD FOR axmt540_produce_xmdm_pre
   
   INITIALIZE l_xmdl.* TO NULL
   FOREACH axmt540_produce_xmdl_cs INTO l_xmdl.xmdlseq,
                                        l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,
                                        l_xmdl.xmdl006,l_xmdl.xmdl007,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl010,
                                        l_xmdl.xmdl011,l_xmdl.xmdl012,l_xmdl.xmdl013,l_xmdl.xmdl014,l_xmdl.xmdl015,
                                        l_xmdl.xmdl016,l_xmdl.xmdl017,l_xmdl.xmdl018,l_xmdl.xmdl019,l_xmdl.xmdl020,
                                        l_xmdl.xmdl021,l_xmdl.xmdl022,l_xmdl.xmdl051,l_xmdl.xmdl052
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:axmt540_produce_xmdl_cs"
         LET g_errparam.popup = TRUE
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF
                
      LET l_xmdl.xmdlent = l_xmdk.xmdkent
      LET l_xmdl.xmdlsite = l_xmdk.xmdksite
      LET l_xmdl.xmdldocno = l_xmdk.xmdkdocno
      LET l_xmdl.xmdl023 = 'N'   #檢驗否
      LET l_xmdl.xmdl056 = l_xmdl.xmdl018  #檢驗合格量
      LET l_xmdl.xmdl035 = 0     #已簽收量
      LET l_xmdl.xmdl036 = 0     #已簽退量
      LET l_xmdl.xmdl037 = 0     #已銷退量
      LET l_xmdl.xmdl038 = 0     #主帳套已立帳數量
      LET l_xmdl.xmdl039 = 0     #帳套二已立帳數量
      LET l_xmdl.xmdl040 = 0     #帳套三已立帳數量
      LET l_xmdl.xmdl047 = 0     #已開發票數量
      LET l_xmdl.xmdl053 = 0     #主帳套暫估數量
      LET l_xmdl.xmdl054 = 0     #帳套二暫估數量
      LET l_xmdl.xmdl055 = 0     #帳套三暫估數量
      LET l_xmdl.xmdl081 = 0     #簽退數量
      LET l_xmdl.xmdl082 = 0     #簽退參考數量
      LET l_xmdl.xmdl083 = 0     #簽退計價數量
      LET l_xmdl.xmdl087 = 'Y'   #需自立應收否
      LET l_xmdl.xmdl088 = l_xmdk.xmdk044 #多角流程代碼

      EXECUTE axmt540_produce_xmdd_pre USING l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,l_xmdl.xmdl006
      INTO l_xmdl.xmdl041,l_xmdl.xmdl033,
           l_xmdl.xmdl030,l_xmdl.xmdl031,l_xmdl.xmdl032,l_xmdl.xmdl042,
           l_xmdl.xmdl043,l_xmdl.xmdl044,l_xmdl.xmdl045,l_xmdl.xmdl046,
           l_xmdl.xmdl024,l_xmdl.xmdl025,l_xmdl.xmdl026
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE:axmt540_produce_xmdd_pre"
         LET g_errparam.popup = TRUE
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #料件預設庫位、預設儲位
      INITIALIZE l_imaf.* TO NULL
      EXECUTE axmt540_produce_imaf_pre USING l_xmdl.xmdlsite,l_xmdl.xmdl008
      INTO l_imaf.imaf091,l_imaf.imaf092
      
      #庫位
      IF cl_null(l_imaf.imaf091) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aim-00245'   #營運據點%1料件編號%2無預設之庫位、儲位！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmdl.xmdlsite
         LET g_errparam.replace[2] = l_xmdl.xmdl008
         
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #儲位
      IF cl_null(l_imaf.imaf092) THEN
         LET l_imaf.imaf092 = ' '
      END IF
      
      IF l_xmdl.xmdl013 <> 'Y' THEN   #非多庫儲批
         #庫位、儲位替換成料件預設庫位、儲位
         LET l_xmdl.xmdl014 = l_imaf.imaf091    #庫位
         LET l_xmdl.xmdl015 = l_imaf.imaf092    #儲位
         LET l_xmdl.xmdl052 = ' '  #庫存管理特徵
      END IF
      #170329-00046#1-s
#      #計算稅額
#      CALL s_axmt540_tax_count('',l_xmdl.xmdldocno,l_xmdl.xmdlseq,l_xmdl.xmdlsite,l_xmdl.xmdl025,
#                               l_xmdl.xmdl022,l_xmdl.xmdl024,l_xmdk.xmdk016,l_xmdk.xmdk017,
#                               l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl018)
#      RETURNING l_xmdl.xmdl027,l_xmdl.xmdl028,l_xmdl.xmdl029
      CALL s_axmt540_tax_recount(l_xmdl.xmdldocno)  RETURNING r_success
      #170329-00046#1-e
      INSERT INTO xmdl_t(xmdlent,xmdlsite,
                         xmdldocno,xmdlseq,
                         xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,
                         xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,
                         xmdl011,xmdl012,xmdl013,xmdl014,xmdl015,
                         xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,
                         xmdl021,xmdl022,xmdl023,xmdl024,xmdl025,
                         xmdl026,xmdl027,xmdl028,xmdl029,xmdl030,
                         xmdl031,xmdl032,xmdl033,xmdl034,xmdl035,
                         xmdl036,xmdl037,xmdl038,xmdl039,xmdl040,
                         xmdl041,xmdl042,xmdl043,xmdl044,xmdl045,
                         xmdl046,xmdl047,xmdl048,xmdl049,xmdl050,
                         xmdl051,xmdl052,xmdl053,xmdl054,xmdl055,
                         xmdl056,
                         xmdl081,xmdl082,xmdl083,xmdl084,xmdl085,
                         xmdl086,xmdl087,xmdl088)
      VALUES (l_xmdl.xmdlent,l_xmdl.xmdlsite,
              l_xmdl.xmdldocno,l_xmdl.xmdlseq,
              l_xmdl.xmdl001,l_xmdl.xmdl002,l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,
              l_xmdl.xmdl006,l_xmdl.xmdl007,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl010,
              l_xmdl.xmdl011,l_xmdl.xmdl012,l_xmdl.xmdl013,l_xmdl.xmdl014,l_xmdl.xmdl015,
              l_xmdl.xmdl016,l_xmdl.xmdl017,l_xmdl.xmdl018,l_xmdl.xmdl019,l_xmdl.xmdl020,
              l_xmdl.xmdl021,l_xmdl.xmdl022,l_xmdl.xmdl023,l_xmdl.xmdl024,l_xmdl.xmdl025,
              l_xmdl.xmdl026,l_xmdl.xmdl027,l_xmdl.xmdl028,l_xmdl.xmdl029,l_xmdl.xmdl030,
              l_xmdl.xmdl031,l_xmdl.xmdl032,l_xmdl.xmdl033,l_xmdl.xmdl034,l_xmdl.xmdl035,
              l_xmdl.xmdl036,l_xmdl.xmdl037,l_xmdl.xmdl038,l_xmdl.xmdl039,l_xmdl.xmdl040,
              l_xmdl.xmdl041,l_xmdl.xmdl042,l_xmdl.xmdl043,l_xmdl.xmdl044,l_xmdl.xmdl045,
              l_xmdl.xmdl046,l_xmdl.xmdl047,l_xmdl.xmdl048,l_xmdl.xmdl049,l_xmdl.xmdl050,
              l_xmdl.xmdl051,l_xmdl.xmdl052,l_xmdl.xmdl053,l_xmdl.xmdl054,l_xmdl.xmdl055,
              l_xmdl.xmdl056,
              l_xmdl.xmdl081,l_xmdl.xmdl082,l_xmdl.xmdl083,l_xmdl.xmdl084,l_xmdl.xmdl085,
              l_xmdl.xmdl086,l_xmdl.xmdl087,l_xmdl.xmdl088)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT:xmdl_t" 
         LET g_errparam.code = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      INITIALIZE l_xmdm.* TO NULL
      LET l_xmdm.xmdment = l_xmdl.xmdlent
      LET l_xmdm.xmdmsite = l_xmdl.xmdlsite
      LET l_xmdm.xmdmdocno = l_xmdl.xmdldocno
      LET l_xmdm.xmdmseq = l_xmdl.xmdlseq
      LET l_xmdm.xmdm005 = l_imaf.imaf091    #庫位
      LET l_xmdm.xmdm006 = l_imaf.imaf092    #儲位
      LET l_xmdm.xmdm012 = 0   #已簽收數量
      LET l_xmdm.xmdm013 = 0   #已簽退數量
      LET l_xmdm.xmdm014 = 0   #已銷退數量
      LET l_xmdm.xmdm031 = 0   #簽退數量
      LET l_xmdm.xmdm032 = 0   #簽退參考數量
      LET l_xmdm.xmdm033 = ' ' #庫存管理特徵

      OPEN axmt540_produce_xmdm_cs USING l_xmdl.xmdlseq
      FOREACH axmt540_produce_xmdm_cs INTO l_xmdm.xmdmseq1,
                                           l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,
                                           l_xmdm.xmdm007,l_xmdm.xmdm008,l_xmdm.xmdm009,l_xmdm.xmdm010,
                                           l_xmdm.xmdm011
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:axmt540_produce_xmdm_cs"
            LET g_errparam.popup = TRUE
            CALL cl_err()           
            LET r_success = FALSE
            EXIT FOREACH
         END IF

         INSERT INTO xmdm_t(xmdment,xmdmsite,
                            xmdmdocno,xmdmseq,xmdmseq1,
                            xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,
                            xmdm006,xmdm007,xmdm008,xmdm009,xmdm010,
                            xmdm011,xmdm012,xmdm013,xmdm014,
                            xmdm031,xmdm032,xmdm033)
               VALUES (l_xmdm.xmdment,l_xmdm.xmdmsite,
                       l_xmdm.xmdmdocno,l_xmdm.xmdmseq,l_xmdm.xmdmseq1,
                       l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm.xmdm005,
                       l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008,l_xmdm.xmdm009,l_xmdm.xmdm010,
                       l_xmdm.xmdm011,l_xmdm.xmdm012,l_xmdm.xmdm013,l_xmdm.xmdm014,
                       l_xmdm.xmdm031,l_xmdm.xmdm032,l_xmdm.xmdm033)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "INSERT:xmdm_t" 
            LET g_errparam.code = SQLCA.sqlcode 
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
      RETURN r_success
   END IF
   
   INITIALIZE l_xrcd.* TO NULL
   #重新計算整單的未稅、含稅總金額
   CALL s_tax_recount(l_xmdk.xmdkdocno) RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115
   
   UPDATE xmdk_t SET xmdk051 = l_xrcd.xrcd103,
                     xmdk052 = l_xrcd.xrcd105,
                     xmdk053 = l_xrcd.xrcd104
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = l_xmdk.xmdkdocno

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'UPDATE xmdk_t'
      LET g_errparam.extend = l_xmdk.xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      
      RETURN r_success
   END IF
 
   #備份營運據點
   LET l_site = g_site
   LET g_site = l_xmdk.xmdksite
   
   #出貨單確認
   CALL s_axmt540_conf_chk(l_xmdk.xmdkdocno) RETURNING r_success
   IF r_success THEN
      CALL s_axmt540_conf_upd(l_xmdk.xmdkdocno) RETURNING r_success
   END IF
   
   IF r_success THEN
      LET l_xmdkstus = ''
      SELECT xmdkstus INTO l_xmdkstus
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = l_xmdk.xmdkdocno
      
      #無自動過帳才跑過帳段
      IF l_xmdkstus <> 'S' THEN
         CALL s_axmt540_post_chk(l_xmdk.xmdkdocno) RETURNING r_success
         IF r_success THEN
            CALL s_axmt540_post_upd(l_xmdk.xmdkdocno) RETURNING r_success
         END IF
      END IF
   END IF
   
   #還原營運據點
   LET g_site = l_site
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 將來源單據的inao_t的資料複製到當前單據
# Memo...........:
# Usage..........: CALL s_axmt540_inao_copy()
#                  RETURNING r_success
# Input parameter: p_from_docno  來源單號
#                : p_from_seq    來源項次
#                : p_from_inao000 來源類型(1.申請2.實際)
#                : p_inao003     庫存管理特徵
#                : p_inao005     庫位
#                : p_inao006     儲位
#                : p_inao007     批號
#                : p_to_docno    目的單號
#                : p_to_seq      目的項次
#                : p_to_seq1     目的項序
#                : p_to_inao000  類型(1.申請2.實際)
#                : p_type        數量計算類型(0.檢驗合格量1.已入庫/出貨/簽收量2.已驗退/簽退量3.已倉退/銷退量4.已轉QC量)
#                : p_type1       是否走多倉儲批
# Return code....: r_success    TRUR/FALSE   
# Date & Author..: 2015/08/22 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inao_copy(p_from_docno,p_from_seq,p_from_inao000,p_inao003,p_inao005,p_inao006,p_inao007,p_to_docno,p_to_seq,p_to_seq1,p_type,p_type1,p_to_inao000)
DEFINE p_from_docno LIKE xmdk_t.xmdkdocno,
       p_from_seq   LIKE xmdm_t.xmdmseq,
       p_from_seq1  LIKE xmdm_t.xmdmseq1,
       p_from_inao000 LIKE inao_t.inao000,
       p_inao003    LIKE inao_t.inao003,
       p_inao005    LIKE inao_t.inao005,
       p_inao006    LIKE inao_t.inao006,
       p_inao007    LIKE inao_t.inao007,
       p_to_docno   LIKE xmdk_t.xmdkdocno,
       p_to_seq     LIKE xmdm_t.xmdmseq,
       p_to_seq1    LIKE xmdm_t.xmdmseq1,
       p_to_inao000 LIKE inao_t.inao000,
       p_type       LIKE type_t.chr1,
       p_type1      LIKE type_t.chr1        
DEFINE r_success    LIKE type_t.num5
DEFINE l_sql        STRING
#161109-00085#48-s mod
#DEFINE l_inao       RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao       RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_num        LIKE inao_t.inao012 
DEFINE l_cnt        LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   #add by lixh 20150825
   LET l_cnt = 0
   LET l_sql = " SELECT COUNT(inaodocno)  FROM inao_t ",
               " WHERE inaoent = ",g_enterprise, 
               "   AND inaosite = '",g_site,"'",
               "   AND inaodocno = '",p_to_docno,"'",
               "   AND inao000 = '2' "
              
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq = '",p_to_seq,"' "
   END IF   
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq1 = '",p_to_seq1,"' "
   END IF 
   PREPARE s_axmt540_inao_pre3 FROM l_sql
   EXECUTE s_axmt540_inao_pre3 INTO l_cnt
   
   IF l_cnt > 0 THEN   
   #add by lixh 20150825
   
      CALL s_axmt540_update_inao(p_to_docno,p_to_seq,p_to_seq1,p_from_docno,p_from_seq,'0',p_type) RETURNING r_success

       #IF p_type <> '3' THEN #add by lixh 20150815 
#          IF r_success THEN 
#             DELETE FROM inao_t 
#              WHERE inaoent = g_enterprise 
#                AND inaosite = g_site
#                AND inaodocno = p_to_docno
#                AND inaoseq = p_to_seq
#                AND inaoseq1 = p_to_seq1
#           END IF 
       #END IF  #add by lixh 20150815 
  
   END IF  #add by lixh 20150825
   
   DELETE FROM inao_t 
    WHERE inaoent = g_enterprise 
      AND inaosite = g_site
      AND inaodocno = p_to_docno
      AND inaoseq = p_to_seq
      AND inaoseq1 = p_to_seq1
      AND inao000 = '1'
     
   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_from_docno,"'",
               "    AND inaoseq = ",p_from_seq,
               "    AND inao000 = '",p_from_inao000,"' "
                             
   IF p_inao003 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao003 = '",p_inao003,"'"
   END IF
   IF p_inao005 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao005 = '",p_inao005,"'"
   END IF 
   IF p_inao006 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao006 = '",p_inao006,"'"
   END IF
   IF p_inao007 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao007 = '",p_inao007,"'"
   END IF   
   
   #add by lixiang 2016/1/8--begin--
   #銷退時，從來源檔中複製inao的資料，需要考慮出貨或簽收時，除了會產生出庫的資料，還有可能會產生相關的入庫的inao的資料
   #如出貨單 xmdk087=Y且xmdk002<>‘3’时，出货单过账产生2笔inaj，一笔从出货仓出掉（inaj036=调拨）、一笔入到发票仓（inaj036=调拨，储位预设为客户编号）
   #簽收單 xmdk087=Y，签收单审核产生两笔inaj，一笔从签收仓出掉（inaj036=调拨）、一笔入到发票仓（inaj036=调拨，储位预设为客户编号）
   #所以需求加上判斷條件，只能複製出庫類型的資料
   IF p_type = '3' THEN
      LET l_sql = l_sql, " AND inao013 = '-1' "
   END IF
   #add by lixiang 2016/1/8--end--
   LET l_sql = l_sql," ORDER BY inao005,inao006,inao007,inao003 "
   
   PREPARE s_axmt540_inao_pre FROM l_sql
   DECLARE s_axmt540_inao_cur CURSOR FOR s_axmt540_inao_pre    
   LET l_cnt = 1
   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_cur INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_cur INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                   l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                   l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                   l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                   l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                   l_inao.inao024,l_inao.inao025
   #161109-00085#48-e mod
      LET l_num = 0
      CASE p_type
         WHEN '0'
            IF cl_null(l_inao.inao020) THEN
               LET l_inao.inao020 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao020 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF           
         WHEN '1'
            IF cl_null(l_inao.inao021) THEN
               LET l_inao.inao021 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao021 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF  
            LET l_inao.inao013 = '-1'      #160202-00019#5         
         WHEN '2'
            IF cl_null(l_inao.inao022) THEN
               LET l_inao.inao022 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao022 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF           
         WHEN '3'
            IF cl_null(l_inao.inao023) THEN
               LET l_inao.inao023 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao023 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF 
            LET l_inao.inao013 = '1'
                        
         WHEN '4'
            IF cl_null(l_inao.inao024) THEN
               LET l_inao.inao024 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao024 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF                     
      END CASE 
      LET l_inao.inaoseq1 = p_to_seq1     
      IF p_type1 = 'N' THEN 
         LET l_inao.inaoseq1 = 1
      END IF
      SELECT MAX(inaoseq2)+1 INTO l_inao.inaoseq2 FROM inao_t
       WHERE inaoent = g_enterprise
         AND inaodocno = p_to_docno
         AND inaoseq = p_to_seq
         AND inaoseq1 = l_inao.inaoseq1
         AND inao000 = p_to_inao000
      IF cl_null(l_inao.inaoseq2) THEN LET l_inao.inaoseq2 = 1 END IF  
      
      LET l_inao.inao000 = p_to_inao000
      LET l_inao.inao020 = 0
      LET l_inao.inao021 = 0
      LET l_inao.inao022 = 0
      LET l_inao.inao023 = 0
      LET l_inao.inao024 = 0
      INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                          inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                          inao020,inao021,inao022,inao023,inao024)
                  VALUES (g_enterprise,g_site,p_to_docno,p_to_seq,l_inao.inaoseq1,l_inao.inaoseq2,
                          l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,
                          l_inao.inao007,l_inao.inao008,l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                          l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,l_inao.inao024)
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ins inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF   
   END FOREACH 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 回寫來源iano_t相關欄位
# Memo...........:
# Usage..........: CALL s_axmt540_update_inao(p_docno,p_seq,p_seq1,p_from_docno,p_from_seq,p_type)
#                  RETURNING r_success
# Input parameter: p_docno   單號
#                : p_seq     項次
#                : p_seq1    項序
#                : p_from_docno 來源單號
#                : p_from_seq   來源項次
#                : p_type       加減項
#                : p_type2      數量計算類型(0.檢驗合格量1.已入庫/出貨/簽收量2.已驗退/簽退量3.已倉退/銷退量4.已轉QC量)
# Return code....: r_success   TRUE/FALSE
# Date & Author..: 2015/08/22 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_update_inao(p_docno,p_seq,p_seq1,p_from_docno,p_from_seq,p_type,p_type2)
DEFINE p_docno  LIKE xmdk_t.xmdkdocno,
       p_seq    LIKE xmdm_t.xmdmseq,
       p_seq1   LIKE xmdm_t.xmdmseq1,
       p_from_docno LIKE xmdl_t.xmdl001,
       p_from_seq   LIKE xmdl_t.xmdl002,
       p_type       LIKE type_t.chr1,
       p_type2      LIKE type_t.chr1,
       r_success LIKE type_t.num5
#161109-00085#48-s mod
#DEFINE l_inao     RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao   RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_sql    STRING
DEFINE l_xmdl001 LIKE xmdl_t.xmdl001
DEFINE l_xmdl002 LIKE xmdl_t.xmdl002
DEFINE l_inaoseq1 LIKE inao_t.inaoseq1
DEFINE l_inaoseq2 LIKE inao_t.inaoseq2
DEFINE l_inao008  LIKE inao_t.inao008
DEFINE l_inao009  LIKE inao_t.inao009

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
     
   #抓取当前单据制造批序号资料
   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_docno,"'",
               "    AND inao000 = '2' "
   IF NOT cl_null(p_seq) THEN                
      LET l_sql = l_sql,"    AND inaoseq = ",p_seq
   END IF
   IF NOT cl_null(p_seq1) THEN                
      LET l_sql = l_sql,"    AND inaoseq1 = ",p_seq1
   END IF   
   PREPARE s_axmt540_inao_upd_pre FROM l_sql
   DECLARE s_axmt540_inao_upd_cur CURSOR FOR s_axmt540_inao_upd_pre    

   #根据当前制造批序号资料抓取来源单据的inao资料
   #来源资料的项序与当前资料的项序不一样,所以用制造批号和制造序号抓取
   LET l_sql = " SELECT DISTINCT inao008,inao009 FROM inao_t ",
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = ?",
               "    AND inaoseq = ?",
               "    AND inao000 = '2' ",
               "    AND inao008 = ? ",
               "    AND inao009 = ? " 
   PREPARE s_axmt540_inao_upd_pre1 FROM l_sql
   DECLARE s_axmt540_inao_upd_cur1 CURSOR FOR s_axmt540_inao_upd_pre1 
   
 #170307-00015#6 2017/03/08 By09232 mark(s)
   #LET l_sql = "SELECT inaoseq1,inaoseq2",            
               #"  FROM inao_t ",
               #" WHERE inaoent = '",g_enterprise,"'",
               #"   AND inaodocno = ?",
               #"   AND inaoseq = ?", 
               #"   AND inao001 = ?",
               #"   AND inao002 = ?",
               #"   AND inao003 = ?",
               #"   AND inao008 = ?",
               #"   AND inao009 = ?",
               #"   AND rownum = 1"
 #170307-00015#6 2017/03/08 By09232 mark(e)
               
 #170307-00015#6 2017/03/08 By09232 add(s)
      LET l_sql = "SELECT inaoseq1,inaoseq2",            
               "  FROM inao_t ",
               " WHERE inaoent = '",g_enterprise,"'",
               "   AND inaodocno = ?",
               "   AND inaoseq = ?", 
               "   AND inao001 = ?",
               "   AND inao002 = ?",
               "   AND inao003 = ?",
               "   AND inao008 = ?",
               "   AND inao009 = ?"
 #170307-00015#6 2017/03/08 By09232 add(e)

   #160202-00019#5---add---s
   #IF g_prog = 'armt400' THEN   #170301-00030#1 by 09257 --mark
   IF g_prog MATCHES 'armt400*' THEN   #170301-00030#1 by 09257 --add 
       LET l_sql = l_sql," AND inao000 = '2'"
   END IF
   #160202-00019#5---add---s  
   IF p_type = '1' THEN
      CASE p_type2
         WHEN '0'
            LET l_sql = l_sql," AND inao012-inao020 > 0 "        
         WHEN '1'
            LET l_sql = l_sql," AND inao012-inao021 > 0 "         
         WHEN '2'
            LET l_sql = l_sql," AND inao012-inao022 > 0 "         
         WHEN '3'
            LET l_sql = l_sql," AND inao012-inao023 > 0 "             
         WHEN '4'
            LET l_sql = l_sql," AND inao012-inao024 > 0 "          
      END CASE
   ELSE
      CASE p_type2
         WHEN '0'
            LET l_sql = l_sql," AND inao020 > 0 "        
         WHEN '1'
            LET l_sql = l_sql," AND inao021 > 0 "         
         WHEN '2'
            LET l_sql = l_sql," AND inao022 > 0 "         
         WHEN '3'
            LET l_sql = l_sql," AND inao023 > 0 "             
         WHEN '4'
            LET l_sql = l_sql," AND inao024 > 0 "          
      END CASE   
   END IF
  #LET l_sql = l_sql," ORDER BY inaoseq1,inaoseq2"  #170307-00015#6 2017/03/08 By09232 mark
  
  #170307-00015#6 2017/03/08 By09232 add(s)
   LET l_sql = "SELECT a.inaoseq1,a.inaoseq2 FROM (",
               l_sql," ORDER BY inaoseq1,inaoseq2 ) a",
               " WHERE rownum  = 1"  
   #PGS(D)-13589 -S- 
   #PGS(D)-13589 -E-
  #170307-00015#6 2017/03/08 By09232 add(e)
   
   PREPARE s_axmt540_inao_upd_pre4 FROM l_sql 

   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_upd_cur INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_upd_cur INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                       l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                       l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                       l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                       l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                       l_inao.inao024,l_inao.inao025 
   #161109-00085#48-e mod
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'foreach inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF
      #160202-00019#5---add---s
      #IF g_prog = 'armt400' THEN   #170301-00030#1 by 09257 --mark
      IF g_prog MATCHES 'armt400*' THEN   #170301-00030#1 by 09257 --add
         IF cl_null(p_from_docno) OR cl_null(p_from_seq) THEN
            SELECT rmdb001,rmdb002 INTO p_from_docno,p_from_seq
              FROM rmdb_t
             WHERE rmdbent = g_enterprise
               AND rmdbdocno = l_inao.inaodocno
               AND rmdbseq = l_inao.inaoseq            
         END IF
      ELSE
      #160202-00019#5---add---e
         IF cl_null(p_from_docno) OR cl_null(p_from_seq) THEN
            SELECT xmdl001,xmdl002 INTO p_from_docno,p_from_seq
              FROM xmdl_t
             WHERE xmdlent = g_enterprise
               AND xmdldocno = l_inao.inaodocno
               AND xmdlseq = l_inao.inaoseq           
         ELSE                                    #160506-00011
            LET p_from_seq = l_inao.inaoseq      #160506-00011         
         END IF
      END IF   #160202-00019#5
      FOREACH s_axmt540_inao_upd_cur1 USING p_from_docno,p_from_seq,l_inao.inao008,l_inao.inao009
                                      INTO l_inao008,l_inao009
         IF SQLCA.sqlcode THEN  
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'foreach inao_t'
            LET g_errparam.extend = ""
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH 
         END IF             

         EXECUTE s_axmt540_inao_upd_pre4 USING p_from_docno,p_from_seq,l_inao.inao001,
                                               l_inao.inao002,l_inao.inao003,l_inao008,l_inao009 
                                          INTO l_inaoseq1,l_inaoseq2
         IF p_type = '1' THEN
            CASE p_type2
               WHEN '0'
                  LET l_sql = " UPDATE inao_t SET inao020 = inao020 + ",l_inao.inao012         
               WHEN '1'
                  LET l_sql = " UPDATE inao_t SET inao021 = inao021 + ",l_inao.inao012         
               WHEN '2'
                  LET l_sql = " UPDATE inao_t SET inao022 = inao022 + ",l_inao.inao012          
               WHEN '3'
                  LET l_sql = " UPDATE inao_t SET inao023 = inao023 + ",l_inao.inao012             
               WHEN '4'
                  LET l_sql = " UPDATE inao_t SET inao024 = inao024 + ",l_inao.inao012       
            END CASE
         ELSE   
            CASE p_type2
               WHEN '0'
                  LET l_sql = " UPDATE inao_t SET inao020 = inao020 - ",l_inao.inao012         
               WHEN '1'
                  LET l_sql = " UPDATE inao_t SET inao021 = inao021 - ",l_inao.inao012         
               WHEN '2'
                  LET l_sql = " UPDATE inao_t SET inao022 = inao022 - ",l_inao.inao012          
               WHEN '3'
                  LET l_sql = " UPDATE inao_t SET inao023 = inao023 - ",l_inao.inao012             
               WHEN '4'
                  LET l_sql = " UPDATE inao_t SET inao024 = inao024 - ",l_inao.inao012   
            END CASE          
         END IF
         LET l_sql = l_sql," WHERE inaoent = '",g_enterprise,"'",
                           "   AND inaodocno = '",p_from_docno,"'",
                           "   AND inaoseq = ",p_from_seq,
                           "   AND inaoseq1 = ? ",
                           "   AND inaoseq2 = ? "
         #160202-00019#5---add---s
         #IF g_prog = 'armt400' THEN   #170301-00030#1 by 09257 --mark
         IF g_prog MATCHES 'armt400*' THEN   #170301-00030#1 by 09257 --add
             LET l_sql = l_sql," AND inao000 = '2'"
         END IF
         #160202-00019#5---add---s         
         PREPARE s_axmt540_inao_upd_pre5 FROM l_sql                         
         EXECUTE s_axmt540_inao_upd_pre5 USING l_inaoseq1,l_inaoseq2                  
         IF SQLCA.sqlcode THEN  
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'upd inao_t'
            LET g_errparam.extend = ""
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH 
         END IF  
      END FOREACH          
   END FOREACH
   
   #add by lixh 20150826
#   LET l_sql = " DELETE FROM inao_t WHERE inaoent = '",g_enterprise,"'",
#               "    AND inaodocno = '",p_docno,"'",
#               "    AND inao000 = '1' "
#   IF NOT cl_null(p_seq) THEN
#      LET l_sql = l_sql," AND inaoseq = '",p_seq,"'"
#   END IF  
#   IF NOT cl_null(p_seq1) THEN
#      LET l_sql = l_sql," AND inaoseq1 = '",p_seq1,"'"
#   END IF    
#   IF p_type2 = '3' THEN   #銷退
#      LET l_sql = l_sql," AND inao013 =  1"
#   END IF
#   PREPARE s_axmt540_inao_upd_pre6 FROM l_sql                         
#   EXECUTE s_axmt540_inao_upd_pre6      
   #add by lixh 20150826
   
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 回寫出貨單批序號明細
# Memo...........:
# Usage..........: CALL s_axmt540_update_inao_2(p_docno,p_seq,p_seq1,p_xmdm007,p_from_docno,p_from_seq,p_type)
#                  RETURNING TRUE/FALSE
# Input parameter: p_docno        簽退單號
#                : p_seq          簽退項次
#                : p_seq1         簽退項序
#                : p_xmdm007      批號
#                : p_from_docno   出貨單號
#                : p_from_seq     出貨項次
#                : p_type         類型（簽收/簽退）
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_update_inao_2(p_docno,p_seq,p_seq1,p_xmdm007,p_from_docno,p_from_seq,p_type)
DEFINE p_docno         LIKE xmdk_t.xmdkdocno,
       p_seq           LIKE xmdm_t.xmdmseq,
       p_seq1          LIKE xmdm_t.xmdmseq1,
       p_xmdm007       LIKE xmdm_t.xmdm007,
       p_from_docno    LIKE xmdl_t.xmdl001,
       p_from_seq      LIKE xmdl_t.xmdl002,
       p_type          LIKE type_t.chr2,
       p_type2         LIKE type_t.chr1,
       r_success       LIKE type_t.num5  
#161109-00085#48-s mod
#DEFINE l_inao          RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao          RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_sql           STRING
DEFINE l_sql2          STRING
DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
DEFINE l_xmdl002       LIKE xmdl_t.xmdl002
DEFINE l_inaoseq       LIKE inao_t.inaoseq
DEFINE l_inaoseq1      LIKE inao_t.inaoseq1
DEFINE l_inaoseq2      LIKE inao_t.inaoseq2
DEFINE l_inao012       LIKE inao_t.inao012
DEFINE l_inao021       LIKE inao_t.inao021

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
     

   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_docno,"'",
               "    AND inao000 = '2' ",
               "    AND inao013 = '-1' "
               
   IF NOT cl_null(p_seq) THEN                
      LET l_sql = l_sql,"    AND inaoseq = ",p_seq
   END IF
   IF NOT cl_null(p_seq1) THEN                
      LET l_sql = l_sql,"    AND inaoseq1 = ",p_seq1
   END IF   
   IF p_xmdm007 IS NOT NULL THEN
      LET l_sql = l_sql,"    AND inao007 = '",p_xmdm007,"'"
   END IF

   LET l_sql = l_sql," ORDER BY inaodocno,inaoseq,inaoseq1,inaoseq2,inao007 "
   
   PREPARE s_axmt540_inao_upd_pre2 FROM l_sql
   DECLARE s_axmt540_inao_upd_cur2 CURSOR FOR s_axmt540_inao_upd_pre2    
   
   LET l_sql2 = " SELECT inaoseq,inaoseq1,inaoseq2,inao012,inao021 FROM inao_t ",
                "  WHERE inaoent = '",g_enterprise,"'",
                "   AND inaodocno = '",p_from_docno,"'",
                "   AND inao007 = ? ",
                "   AND inao008 = ? ",
                "   AND inao009 = ? ",
                "   AND inao013 = '-1'"
                
   IF NOT cl_null(p_from_seq) THEN
      LET l_sql2 = l_sql2," AND inaoseq = '",p_from_seq,"'"
   END IF
#   IF p_xmdm007 IS NOT NULL THEN
#      LET l_sql2 = l_sql2," AND inao007 = '",p_xmdm007,"'"
#   END IF 

   

   PREPARE s_axmt540_inao_upd_pre3 FROM l_sql2
   DECLARE s_axmt540_inao_upd_cur3 CURSOR FOR s_axmt540_inao_upd_pre3
   
   LET r_success = TRUE
   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_upd_cur2 INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_upd_cur2 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                        l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                        l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                        l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                        l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                        l_inao.inao024,l_inao.inao025 
   #161109-00085#48-e mod
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'foreach inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF  
      
      #回寫出貨單
      FOREACH s_axmt540_inao_upd_cur3 USING l_inao.inao007,l_inao.inao008,l_inao.inao009 INTO l_inaoseq,l_inaoseq1,l_inaoseq2,l_inao012,l_inao021
          IF p_type = '1' THEN   #加項
             IF l_inao012 >= l_inao021+l_inao.inao012 THEN  #滿足回寫條件
                UPDATE inao_t SET inao021 = inao021 + l_inao.inao012
                 WHERE inaoent = g_enterprise
                   AND inaodocno = p_from_docno
                   AND inaoseq = l_inaoseq
                   AND inaoseq1 = l_inaoseq1
                   AND inaoseq2 = l_inaoseq2
                   AND inao013 = '-1'
                IF SQLCA.sqlcode THEN  
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'foreach inao_t'
                   LET g_errparam.extend = ""
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   LET r_success = FALSE
                   CONTINUE FOREACH 
                ELSE                   
                   EXIT FOREACH  
                END IF                   
             END IF
          END IF
          
          IF p_type = '-1' THEN   #減項
             IF l_inao021-l_inao.inao012 >=0 THEN  #滿足回寫條件
                UPDATE inao_t SET inao021 = inao021 - l_inao.inao012
                 WHERE inaoent = g_enterprise
                   AND inaodocno = p_from_docno
                   AND inaoseq = l_inaoseq
                   AND inaoseq1 = l_inaoseq1
                   AND inaoseq2 = l_inaoseq2
                   AND inao013 = '-1'
                IF SQLCA.sqlcode THEN  
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'foreach inao_t'
                   LET g_errparam.extend = ""
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   LET r_success = FALSE
                   CONTINUE FOREACH 
                ELSE                   
                   EXIT FOREACH  
                END IF                   
             END IF
          END IF
          
      END FOREACH
      
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_axmt540_inao_copy_2(p_from_docno,p_from_seq,p_from_inao000,p_to_docno,p_to_seq,p_to_seq1,p_xmdm007,p_type)
#                  RETURNING TRUE/FALSE
# Input parameter: p_from_docno      出貨單號
#                : p_from_seq        出貨項次
#                : p_from_inao000    類型 (1:申請 2：實際)
#                : p_to_docno        簽收單號
#                : p_to_seq          簽收項次
#                : p_to_seq1         簽收項序
#                : p_xmdm007         批號
#                : p_type            類型（1：簽收 2：簽退）

# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inao_copy_2(p_from_docno,p_from_seq,p_from_inao000,p_to_docno,p_to_seq,p_to_seq1,p_xmdm007,p_type)
DEFINE p_from_docno LIKE xmdk_t.xmdkdocno,
       p_from_seq   LIKE xmdm_t.xmdmseq,
       p_from_seq1  LIKE xmdm_t.xmdmseq1,
       p_from_inao000 LIKE inao_t.inao000,
       p_to_docno   LIKE xmdk_t.xmdkdocno,
       p_to_seq     LIKE xmdm_t.xmdmseq,
       p_to_seq1    LIKE xmdm_t.xmdmseq1,
       p_xmdm007    LIKE xmdm_t.xmdm007,
       p_type       LIKE type_t.chr1      
DEFINE r_success    LIKE type_t.num5
DEFINE l_sql        STRING
#161109-00085#48-s mod
#DEFINE l_inao       RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao       RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_num        LIKE inao_t.inao012 
DEFINE l_xmdk039    LIKE xmdk_t.xmdk039
DEFINE l_xmdk040    LIKE xmdk_t.xmdk040
DEFINE l_xmdl014    LIKE xmdl_t.xmdl014
DEFINE l_inaa010    LIKE inaa_t.inaa010

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
#   LET l_cnt = 0
#   SELECT COUNT(*) INTO l_cnt FROM inao_t
#    WHERE inaoent = g_enterprise 
#      AND inaosite = g_site
#      AND inaodocno = p_to_docno
#      AND inaoseq = p_to_seq
#      AND inaoseq1 = p_to_seq1   
#      AND inao000 = '2'
   LET l_cnt = 0
   LET l_sql = " SELECT COUNT(inaodocno)  FROM inao_t ",
               " WHERE inaoent = ",g_enterprise, 
               "   AND inaosite = '",g_site,"'",
               "   AND inaodocno = '",p_to_docno,"'",
               "   AND inao000 = '2' ",              
               "   AND inao013 = '-1' "
               
#   IF p_type = '1' THEN  #簽收
#      LET l_sql = l_sql, "   AND inao013 = '-1' "
#   END IF
#   
#   IF p_type = '2' THEN  #簽退
#      LET l_sql = l_sql, "   AND inao013 = '-' "
#   END IF
   
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq = '",p_to_seq,"' "
   END IF   
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq1 = '",p_to_seq1,"' "
   END IF 
   PREPARE s_axmt540_inao_pre4 FROM l_sql
   EXECUTE s_axmt540_inao_pre4 INTO l_cnt       
   #有資料先回寫出貨單再開窗   
   IF l_cnt > 0 THEN      
      CALL s_axmt540_update_inao_2(p_to_docno,p_to_seq,p_to_seq1,p_xmdm007,p_from_docno,p_from_seq,'-1') RETURNING r_success
#      IF r_success THEN 
#         DELETE FROM inao_t 
#          WHERE inaoent = g_enterprise 
#            AND inaosite = g_site
#            AND inaodocno = p_to_docno
#            AND inaoseq = p_to_seq
#            AND inaoseq1 = p_to_seq1
#      END IF
   END IF 

   DELETE FROM inao_t 
    WHERE inaoent = g_enterprise 
      AND inaosite = g_site
      AND inaodocno = p_to_docno
      AND inaoseq = p_to_seq
      AND inaoseq1 = p_to_seq1
      AND inao000 = '1'
      AND inao013 = '-1' 
     

   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_from_docno,"'",
               "    AND inaoseq = ",p_from_seq,
               "    AND inao000 = '",p_from_inao000,"' ",
               "    AND inao013 = '-1'"              

#   IF p_xmdm006 IS NOT NULL THEN
#      LET l_sql = l_sql, " AND inao006 = '",p_xmdm006,"'"
#   END IF
   IF p_xmdm007 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao007 = '",p_xmdm007,"'"
   END IF   
   LET l_sql = l_sql," ORDER BY inaodocno,inaoseq,inaoseq1 "
   
   PREPARE s_axmt540_inao_pre2 FROM l_sql
   DECLARE s_axmt540_inao_cur2 CURSOR FOR s_axmt540_inao_pre2    

   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_cur2 INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_cur2 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                    l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                    l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                    l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                    l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                    l_inao.inao024,l_inao.inao025 
   #161109-00085#48-e mod
      LET l_num = 0
      CASE p_type
         WHEN '0'
            IF cl_null(l_inao.inao020) THEN
               LET l_inao.inao020 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao020 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF           
         WHEN '1'
            IF cl_null(l_inao.inao021) THEN
               LET l_inao.inao021 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao021 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF         
         WHEN '2'
            IF cl_null(l_inao.inao022) THEN
               LET l_inao.inao022 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao022 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF           
         WHEN '3'
            IF cl_null(l_inao.inao023) THEN
               LET l_inao.inao023 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao023 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF             
                        
         WHEN '4'
            IF cl_null(l_inao.inao024) THEN
               LET l_inao.inao024 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao024 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF                     
      END CASE   
      

      SELECT MAX(inaoseq2)+1 INTO l_inao.inaoseq2 FROM inao_t
       WHERE inaoent = g_enterprise
         AND inaodocno = p_to_docno
         AND inaoseq = p_to_seq
         AND inaoseq1 = p_to_seq1
         AND inao000 = '1'  #add by lixh 20150828
         AND inao013 = '-1'
      IF cl_null(l_inao.inaoseq2) THEN LET l_inao.inaoseq2 = 1 END IF  
      LET l_inao.inao000 = '1'    #申請
      LET l_inao.inao013 = '-1'   #add by lixh 20150901
      LET l_inao.inao020 = 0
      LET l_inao.inao021 = 0
      LET l_inao.inao022 = 0
      LET l_inao.inao023 = 0
      LET l_inao.inao024 = 0
      #add by lixh 20151215
      #IF g_prog = 'axmt580' THEN   #170301-00030#1 by 09257 --mark
      IF g_prog MATCHES 'axmt580*' THEN   #170301-00030#1 by 09257 --add
         SELECT xmdk039,xmdk040,xmdl014 INTO l_xmdk039,l_xmdk040,l_xmdl014 FROM xmdk_t,xmdl_t
          WHERE xmdkent = xmdlent
            AND xmdkdocno = xmdldocno
            AND xmdlent = g_enterprise
            AND xmdldocno = p_from_docno
            AND xmdlseq = p_from_seq
         SELECT inaa010 INTO l_inaa010 FROM inaa_t
          WHERE inaaent = g_enterprise
            AND inaasite = g_site
            AND inaa001 = l_xmdl014 
         IF l_inaa010 = 'Y' THEN
            LET l_inao.inao005 = l_xmdk039
         ELSE
            LET l_inao.inao005 = l_xmdk040
         END IF
         LET l_inao.inao006 = ' '         
      END IF
      #add by lixh 20151215
      INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                          inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                          inao020,inao021,inao022,inao023,inao024)
                  VALUES (g_enterprise,g_site,p_to_docno,p_to_seq,p_to_seq1,l_inao.inaoseq2,
                          l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,
                          l_inao.inao007,l_inao.inao008,l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                          l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,l_inao.inao024)
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ins inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF   
   END FOREACH 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 簽退單資料複製
# Memo...........:
# Usage..........: CALL s_axmt540_inao_copy_3(p_from_docno,p_from_seq,p_from_inao000,p_to_docno,p_to_seq,p_to_seq1,p_xmdm007)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_inao_copy_3(p_from_docno,p_from_seq,p_from_inao000,p_to_docno,p_to_seq,p_to_seq1,p_xmdm007)
DEFINE p_from_docno LIKE xmdk_t.xmdkdocno,
       p_from_seq   LIKE xmdm_t.xmdmseq,
       p_from_seq1  LIKE xmdm_t.xmdmseq1,
       p_from_inao000 LIKE inao_t.inao000,
       p_to_docno   LIKE xmdk_t.xmdkdocno,
       p_to_seq     LIKE xmdm_t.xmdmseq,
       p_to_seq1    LIKE xmdm_t.xmdmseq1,
       p_xmdm007    LIKE xmdm_t.xmdm007
  
DEFINE r_success    LIKE type_t.num5
DEFINE l_sql        STRING
#161109-00085#48-s mod
#DEFINE l_inao       RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao       RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_num        LIKE inao_t.inao012 

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   LET l_cnt = 0
   LET l_sql = " SELECT COUNT(inaodocno)  FROM inao_t ",
               " WHERE inaoent = ",g_enterprise, 
               "   AND inaosite = '",g_site,"'",
               "   AND inaodocno = '",p_to_docno,"'",
               "   AND inao000 = '2' ",
               "   AND inao013 = '1'"
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq = '",p_to_seq,"' "
   END IF   
   IF NOT cl_null(p_to_seq) THEN
      LET l_sql = l_sql," AND inaoseq1 = '",p_to_seq1,"' "
   END IF 
   PREPARE s_axmt540_inao_pre6 FROM l_sql
   EXECUTE s_axmt540_inao_pre6 INTO l_cnt       
   #有資料先回寫出貨單再開窗   
   IF l_cnt > 0 THEN      
      CALL s_axmt540_update_inao_3(p_to_docno,p_to_seq,p_to_seq1,p_xmdm007,p_from_docno,p_from_seq,'2') RETURNING r_success  #p_type 1:簽收 2：簽退
   END IF 
   
   DELETE FROM inao_t 
    WHERE inaoent = g_enterprise 
      AND inaosite = g_site
      AND inaodocno = p_to_docno
      AND inaoseq = p_to_seq
      AND inaoseq1 = p_to_seq1
      AND inao000 = '1'
      AND inao013 = '1'      

   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_from_docno,"'",
               "    AND inaoseq = ",p_from_seq,
               "    AND inao000 = '",p_from_inao000,"' ",
               "    AND inao013 = '-1' "
                             

#   IF p_xmdm006 IS NOT NULL THEN
#      LET l_sql = l_sql, " AND inao006 = '",p_xmdm006,"'"
#   END IF
   IF p_xmdm007 IS NOT NULL THEN
      LET l_sql = l_sql, " AND inao007 = '",p_xmdm007,"'"
   END IF   
   LET l_sql = l_sql," ORDER BY inaodocno,inaoseq,inaoseq1 "
   
   PREPARE s_axmt540_inao_pre7 FROM l_sql
   DECLARE s_axmt540_inao_cur7 CURSOR FOR s_axmt540_inao_pre7  

   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_cur7 INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_cur7 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                    l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                    l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                    l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                    l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                    l_inao.inao024,l_inao.inao025 
   #161109-00085#48-e mod
      LET l_num = 0
#      CASE p_type
#         WHEN '0'
#            IF cl_null(l_inao.inao020) THEN
#               LET l_inao.inao020 = 0
#            END IF
#            LET l_num = l_inao.inao012 - l_inao.inao020 
#            IF l_num = 0 THEN
#               CONTINUE FOREACH
#            ELSE
#               LET l_inao.inao012 = l_num                      
#            END IF           
#         WHEN '1'
            IF cl_null(l_inao.inao021) THEN
               LET l_inao.inao021 = 0
            END IF
            LET l_num = l_inao.inao012 - l_inao.inao021 
            IF l_num = 0 THEN
               CONTINUE FOREACH
            ELSE
               LET l_inao.inao012 = l_num                      
            END IF         
#         WHEN '2'
#            IF cl_null(l_inao.inao022) THEN
#               LET l_inao.inao022 = 0
#            END IF
#            LET l_num = l_inao.inao012 - l_inao.inao022 
#            IF l_num = 0 THEN
#               CONTINUE FOREACH
#            ELSE
#               LET l_inao.inao012 = l_num                      
#            END IF           
#         WHEN '3'
#            IF cl_null(l_inao.inao023) THEN
#               LET l_inao.inao023 = 0
#            END IF
#            LET l_num = l_inao.inao012 - l_inao.inao023 
#            IF l_num = 0 THEN
#               CONTINUE FOREACH
#            ELSE
#               LET l_inao.inao012 = l_num                      
#            END IF             
#                        
#         WHEN '4'
#            IF cl_null(l_inao.inao024) THEN
#               LET l_inao.inao024 = 0
#            END IF
#            LET l_num = l_inao.inao012 - l_inao.inao024 
#            IF l_num = 0 THEN
#               CONTINUE FOREACH
#            ELSE
#               LET l_inao.inao012 = l_num                      
#            END IF                     
#      END CASE   
      

      SELECT MAX(inaoseq2)+1 INTO l_inao.inaoseq2 FROM inao_t
       WHERE inaoent = g_enterprise
         AND inaodocno = p_to_docno
         AND inaoseq = p_to_seq
         AND inaoseq1 = p_to_seq1
         AND inao000 = '1'  #add by lixh 20150828
         AND inao013 = '1'
      IF cl_null(l_inao.inaoseq2) THEN LET l_inao.inaoseq2 = 1 END IF  
      LET l_inao.inao000 = '1'    #申請
      LET l_inao.inao013 = '1'    #入庫
      LET l_inao.inao020 = 0
      LET l_inao.inao021 = 0
      LET l_inao.inao022 = 0
      LET l_inao.inao023 = 0
      LET l_inao.inao024 = 0
      INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                          inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                          inao020,inao021,inao022,inao023,inao024)
                  VALUES (g_enterprise,g_site,p_to_docno,p_to_seq,p_to_seq1,l_inao.inaoseq2,
                          l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,
                          l_inao.inao007,l_inao.inao008,l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                          l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,l_inao.inao024)
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ins inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF   
   END FOREACH 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: s_axmt540_update_inao_3(p_docno,p_seq,p_seq1,p_xmdm007,p_from_docno,p_from_seq,p_type)
#                  RETURNING TRUE/FALSE
# Input parameter: p_docno        簽退單號
#                : p_seq          簽退項次
#                : p_seq1         簽退項序
#                : p_xmdm007      批號
#                : p_from_docno   出貨單號
#                : p_from_seq     出貨項次
#                : p_type         類型（簽收/簽退）
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_update_inao_3(p_docno,p_seq,p_seq1,p_xmdm007,p_from_docno,p_from_seq,p_type)
DEFINE p_docno         LIKE xmdk_t.xmdkdocno,
       p_seq           LIKE xmdm_t.xmdmseq,
       p_seq1          LIKE xmdm_t.xmdmseq1,
       p_xmdm007       LIKE xmdm_t.xmdm007,
       p_from_docno    LIKE xmdl_t.xmdl001,
       p_from_seq      LIKE xmdl_t.xmdl002,
       p_type          LIKE type_t.chr2,
       p_type2         LIKE type_t.chr1,
       r_success       LIKE type_t.num5
#161109-00085#48-s mod
#DEFINE l_inao          RECORD LIKE inao_t.*   #161109-00085#48-s mark
DEFINE l_inao          RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025  #已退品量
               END RECORD
#161109-00085#48-e mod
DEFINE l_sql           STRING
DEFINE l_sql2          STRING
DEFINE l_xmdl001       LIKE xmdl_t.xmdl001
DEFINE l_xmdl002       LIKE xmdl_t.xmdl002
DEFINE l_inaoseq       LIKE inao_t.inaoseq
DEFINE l_inaoseq1      LIKE inao_t.inaoseq1
DEFINE l_inaoseq2      LIKE inao_t.inaoseq2
DEFINE l_inao012       LIKE inao_t.inao012
DEFINE l_inao021       LIKE inao_t.inao021

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
     

   #161109-00085#48-s mod
#   LET l_sql = " SELECT * FROM inao_t ",   #161109-00085#48-s mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
   #161109-00085#48-e mod
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_docno,"'",
               "    AND inao000 = '2' ",
               "    AND inao013 = '1' "
               
   IF NOT cl_null(p_seq) THEN                
      LET l_sql = l_sql,"    AND inaoseq = ",p_seq
   END IF
   IF NOT cl_null(p_seq1) THEN                
      LET l_sql = l_sql,"    AND inaoseq1 = ",p_seq1
   END IF   
   IF p_xmdm007 IS NOT NULL THEN
      LET l_sql = l_sql,"    AND inao007 = '",p_xmdm007,"'"
   END IF

   LET l_sql = l_sql," ORDER BY inaodocno,inaoseq,inaoseq1,inaoseq2,inao007 "
   
   PREPARE s_axmt540_inao_upd_pre7 FROM l_sql
   DECLARE s_axmt540_inao_upd_cur7 CURSOR FOR s_axmt540_inao_upd_pre7   
   
   LET l_sql2 = " SELECT inaoseq,inaoseq1,inaoseq2,inao012,inao021 FROM inao_t ",
                "  WHERE inaoent = '",g_enterprise,"'",
                "   AND inaodocno = '",p_from_docno,"'",
                "   AND inao007 = ? ",
                "   AND inao008 = ? ",
                "   AND inao009 = ? ",
                "   AND inao013 = '-1'"
                
   IF NOT cl_null(p_from_seq) THEN
      LET l_sql2 = l_sql2," AND inaoseq = '",p_from_seq,"'"
   END IF
   
   PREPARE s_axmt540_inao_upd_pre8 FROM l_sql2
   DECLARE s_axmt540_inao_upd_cur8 CURSOR FOR s_axmt540_inao_upd_pre8
   
   LET r_success = TRUE
   #161109-00085#48-s mod
#   FOREACH s_axmt540_inao_upd_cur7 INTO l_inao.*   #161109-00085#48-s mark
   FOREACH s_axmt540_inao_upd_cur7 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                        l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                        l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                        l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                        l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                        l_inao.inao024,l_inao.inao025 
   #161109-00085#48-e mod
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'foreach inao_t'
         LET g_errparam.extend = ""
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH 
      END IF  
      
      #回寫出貨單
      FOREACH s_axmt540_inao_upd_cur8 USING l_inao.inao007,l_inao.inao008,l_inao.inao009 INTO l_inaoseq,l_inaoseq1,l_inaoseq2,l_inao012,l_inao021
          IF p_type = '1' THEN   #加項
             IF l_inao012 >= l_inao021+l_inao.inao012 THEN  #滿足回寫條件
                UPDATE inao_t SET inao021 = inao021 + l_inao.inao012
                 WHERE inaoent = g_enterprise
                   AND inaodocno = p_from_docno
                   AND inaoseq = l_inaoseq
                   AND inaoseq1 = l_inaoseq1
                   AND inaoseq2 = l_inaoseq2
                   AND inao013 = '-1'
                IF SQLCA.sqlcode THEN  
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'foreach inao_t'
                   LET g_errparam.extend = ""
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   LET r_success = FALSE
                   CONTINUE FOREACH 
                ELSE                   
                   EXIT FOREACH  
                END IF                   
             END IF
          END IF
          
          IF p_type = '-1' THEN   #減項
             IF l_inao021-l_inao.inao012 >=0 THEN  #滿足回寫條件
                UPDATE inao_t SET inao021 = inao021 - l_inao.inao012
                 WHERE inaoent = g_enterprise
                   AND inaodocno = p_from_docno
                   AND inaoseq = l_inaoseq
                   AND inaoseq1 = l_inaoseq1
                   AND inaoseq2 = l_inaoseq2
                   AND inao013 = '-1'
                IF SQLCA.sqlcode THEN  
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'foreach inao_t'
                   LET g_errparam.extend = ""
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   LET r_success = FALSE
                   CONTINUE FOREACH 
                ELSE                   
                   EXIT FOREACH  
                END IF                   
             END IF
          END IF
          
      END FOREACH
      
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 
# Memo...........:
# Usage..........: CALL s_axmt540_get_imaf(p_imaf001)
#                  RETURNING r_imaf055,r_imaf061
# Input parameter: p_imaf001   料件編號
# Return code....: r_imaf055   庫存管理特微
#                : r_imaf061   庫存批號控管方式
# Date & Author..: 160310 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_imaf(p_imaf001)
DEFINE p_imaf001    LIKE imaf_t.imaf001
DEFINE r_imaf055    LIKE imaf_t.imaf055
DEFINE r_imaf061    LIKE imaf_t.imaf061

   WHENEVER ERROR CONTINUE
   
   LET r_imaf055 = ''
   LET r_imaf061 = ''
   
   IF NOT cl_null(p_imaf001) THEN
      SELECT imaf055,imaf061 INTO r_imaf055,r_imaf061
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = p_imaf001
   END IF
   
   RETURN r_imaf055,r_imaf061
END FUNCTION
################################################################################
# Descriptions...: 訂單單身取貨方式為「供應商直送」，需控卡出貨數量為已確認的採購數量
# Memo...........:
# Usage..........: CALL s_axmt540_get_xmdc032(p_xmdl003,p_xmdl004,p_xmdl005,p_xmdl006)
#                  RETURNING r_xmdc032,r_pmdp023
# Input parameter: p_xmdl003      來源單號
#                : p_xmdl004      來源項次
#                : p_xmdl005      來源項序
#                : p_xmdl006      來源分批序
# Return code....: r_xmdc032      取貨方式
#                : r_pmdp023      需求數量         
# Date & Author..: 160219-00003#1 By Polly
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_xmdc032(p_xmdl003,p_xmdl004,p_xmdl005,p_xmdl006)
DEFINE p_type     LIKE type_t.num5
DEFINE p_xmdl003  LIKE xmdl_t.xmdl003
DEFINE p_xmdl004  LIKE xmdl_t.xmdl004
DEFINE p_xmdl005  LIKE xmdl_t.xmdl005
DEFINE p_xmdl006  LIKE xmdl_t.xmdl006
DEFINE r_xmdc032  LIKE xmdc_t.xmdc032
DEFINE r_pmdp023  LIKE pmdp_t.pmdp023


   LET r_pmdp023 = 0
   
   #訂單單身取貨方式為「供應商直送」，需控卡出貨數量為已確認的採購數量
   SELECT xmdc032 INTO r_xmdc032
     FROM xmdc_t  WHERE xmdcent = g_enterprise
      AND xmdcdocno = p_xmdl003
      AND xmdcseq = p_xmdl004  
   
   IF r_xmdc032 = '3' THEN
      SELECT SUM(pmdp023) INTO r_pmdp023
        FROM pmdl_t,pmdp_t
       WHERE pmdlent = pmdpent AND pmdldocno = pmdpdocno 
         AND pmdlent = g_enterprise
         AND pmdl007 = '3'   #訂單
         AND pmdlstus = 'Y'
         AND pmdp003 = p_xmdl003
         AND pmdp004 = p_xmdl004
         AND pmdp005 = p_xmdl005
         AND pmdp006 = p_xmdl006
      IF cl_null(r_pmdp023) THEN LET r_pmdp023 = 0 END IF      
   END IF        
   RETURN r_xmdc032,r_pmdp023
END FUNCTION

################################################################################
# Descriptions...: 抓取备置量-已冲备置量
# Memo...........:
# Usage..........: CALL s_axmt540_get_xmdr008_xmdr009(p_xmdrdocno,p_xmdrseq,p_xmdrseq1,p_xmdrseq2,p_xmdr001,p_xmdr002,p_xmdr003,p_xmdr004,p_xmdr005,p_xmdr006,p_xmdr007)
#                  RETURNING r_qty
# Return code....: r_qty            未冲备置量
# Date & Author..: 2016/04/21 By xianghui
# Modify.........: 160408-00035#7
#                : 
################################################################################
PUBLIC FUNCTION s_axmt540_get_xmdr008_xmdr009(p_xmdrdocno,p_xmdrseq,p_xmdrseq1,p_xmdrseq2,p_xmdr001,p_xmdr002,p_xmdr003,p_xmdr004,p_xmdr005,p_xmdr006,p_xmdr007)
DEFINE p_xmdrdocno LIKE xmdr_t.xmdrdocno,
       p_xmdrseq LIKE xmdr_t.xmdrseq,
       p_xmdrseq1 LIKE xmdr_t.xmdrseq1,
       p_xmdrseq2 LIKE xmdr_t.xmdrseq2,
       p_xmdr001 LIKE xmdr_t.xmdr001,
       p_xmdr002 LIKE xmdr_t.xmdr002,
       p_xmdr003 LIKE xmdr_t.xmdr003,
       p_xmdr004 LIKE xmdr_t.xmdr004,
       p_xmdr005 LIKE xmdr_t.xmdr005,
       p_xmdr006 LIKE xmdr_t.xmdr006,
       p_xmdr007 LIKE xmdr_t.xmdr007
DEFINE l_imaf058 LIKE imaf_t.imaf058
DEFINE l_sql STRING
DEFINE r_qty LIKE xmdr_t.xmdr008
#210324-00031#1 add-S
DEFINE l_qty      LIKE xmdr_t.xmdr008 
DEFINE l_xmdm008  LIKE xmdm_t.xmdm008  #单位
DEFINE l_xmdm009  LIKE xmdm_t.xmdm009  #出货数量
#210324-00031#1 add-E


  LET l_imaf058 = ''
  SELECT imaf058 INTO l_imaf058
    FROM imaf_t
   WHERE imafent = g_enterprise
     AND imafsite = g_site
     AND imaf001 = p_xmdr001
   #210324-00031#1 add-S
   IF l_imaf058 NOT MATCHES '[12]' THEN
      LET r_qty = 0
      RETURN r_qty
   END IF
   #210324-00031#1 add-E
    
   LET l_sql = " SELECT xmdr008 - xmdr009 ",
               "   FROM xmdr_t ",
               "  WHERE xmdrent = '",g_enterprise,"'",
               "    AND xmdrdocno = '",p_xmdrdocno,"'",
               "    AND xmdrseq = ",p_xmdrseq,
               "    AND xmdrseq1 = ",p_xmdrseq1,
               "    AND xmdrseq2 = ",p_xmdrseq2,
               "    AND xmdr001 = '",p_xmdr001,"'",
               "    AND xmdr002 = '",p_xmdr002,"'",               
               "    AND xmdr007 = '",p_xmdr007,"'"
           
   IF l_imaf058 = '2' THEN 
       LET l_sql = l_sql,"    AND xmdr003 = '",p_xmdr003,"'",
                         "    AND xmdr004 = '",p_xmdr004,"'",
                         "    AND xmdr005 = '",p_xmdr005,"'",
                         "    AND xmdr006 = '",p_xmdr006,"'"
   END IF  
   #210324-00031#1 mark-S
#   IF NOT cl_null(p_xmdrseq) OR l_imaf058 = '2' THEN #201021-00009#1 add
#      PREPARE s_axmt540_get_xmdr_pre FROM l_sql
#      EXECUTE s_axmt540_get_xmdr_pre INTO r_qty
#   END IF #201021-00009#1 add
#   IF cl_null(r_qty) THEN LET r_qty = 0 END IF
   #210324-00031#1 mark-E
   #210324-00031#1 add-S
   PREPARE s_axmt540_get_xmdr_pre FROM l_sql
   EXECUTE s_axmt540_get_xmdr_pre INTO r_qty
   IF cl_null(r_qty) THEN LET r_qty = 0 END IF
   #需要扣除掉已經出現在出貨單身的備置量
   LET l_qty = 0
   LET l_sql = " SELECT SUM(xmdm034) ",
               "   FROM xmdm_t LEFT OUTER JOIN xmdk_t ON xmdment = xmdkent AND xmdmdocno = xmdkdocno ",
               "               LEFT OUTER JOIN xmdl_t ON xmdlent = xmdment AND xmdldocno = xmdmdocno AND xmdmseq = xmdlseq ",
               "  WHERE xmdment = ",g_enterprise,
               "    AND xmdkstus <> 'X' ",
               "    AND xmdl003 = '",p_xmdrdocno,"' ",
               "    AND xmdl004 = ",p_xmdrseq,
               "    AND xmdl005 = ",p_xmdrseq1,
               "    AND xmdl006 = ",p_xmdrseq2,
               "    AND xmdm001 = '",p_xmdr001,"' ",
               "    AND xmdm002 = '",p_xmdr002,"' "
   IF l_imaf058 = '2' THEN
      LET l_sql = l_sql," AND xmdm033 = '",p_xmdr003,"' ",
                        " AND xmdm006 = '",p_xmdr004,"' ",
                        " AND xmdm007 = '",p_xmdr005,"' ",
                        " AND xmdm008 = '",p_xmdr006,"' "
   END IF                        
   PREPARE s_axmt540_get_xmdr_o_pre FROM l_sql
   EXECUTE s_axmt540_get_xmdr_o_pre INTO l_qty
   IF NOT cl_null(l_qty) THEN
      LET r_qty = r_qty - l_qty
   END IF
   #210324-00031#1 add-E
   IF cl_null(r_qty) THEN LET r_qty = 0 END IF
   RETURN r_qty  
      
END FUNCTION

################################################################################
# Descriptions...: 訂單結案
# Memo...........:
# Usage..........: CALL s_axmt540_xmda_closd(p_type,p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_type          1結案2取消結案
#                : p_xmdadocno     訂單單號
# Return code....: r_success       TRUE/FALSE
# Date & Author..: #160805-00004#1 160817 By 02040
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmda_closd(p_type,p_xmdkdocno)
 DEFINE p_type       LIKE type_t.num5
 DEFINE p_xmdkdocno  LIKE xmdk_t.xmdkdocno
 DEFINE r_success    LIKE type_t.num5
 DEFINE l_xmdk002    LIKE xmdk_t.xmdk002
 DEFINE l_xmdl003    LIKE xmdl_t.xmdl003
 DEFINE l_xmdl004    LIKE xmdl_t.xmdl004
 DEFINE l_sql        STRING
 

   WHENEVER ERROR CONTINUE
 
   LET r_success = TRUE
   
   LET l_sql = "SELECT xmdl003,xmdl004 FROM xmdl_t ",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE s_axmt540_pre42 FROM l_sql
   DECLARE s_axmt540_cs42 CURSOR FOR s_axmt540_pre42  
   
   LET l_xmdk002 = ''
   SELECT xmdk002 INTO l_xmdk002
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   IF l_xmdk002 <> '3' AND l_xmdk002 <> '8' THEN
      FOREACH s_axmt540_cs42 INTO l_xmdl003,l_xmdl004
         IF cl_null(l_xmdl003) OR cl_null(l_xmdl004) THEN
            CONTINUE FOREACH
         END IF
         IF p_type = '1' THEN
            #單身行狀態結案
            IF NOT s_axmp510_xmdc045_closed('1',l_xmdl003,l_xmdl004,'',g_site) THEN
               LET r_success = FALSE
               EXIT FOREACH        
            END IF
            #物流結案            
            IF NOT s_axmp510_xmda045_closed(l_xmdl003,g_site) THEN
               LET r_success = FALSE
               EXIT FOREACH              
            END IF    
            #狀態結案
            IF NOT s_axmp510_xmdastus_closed('2',l_xmdl003,g_site) THEN
               LET r_success = FALSE
               EXIT FOREACH              
            END IF            
         ELSE
            #單身行狀態取消結案
            IF NOT s_axmp510_xmdc045_unclosed(l_xmdl003,l_xmdl004,g_site) THEN
               LET r_success = FALSE
               EXIT FOREACH             
            END IF 
            #取消結案，更新單頭狀態為Y，物流結案為N
            IF NOT s_axmp510_xmda045_unclosed(l_xmdl003,g_site) THEN 
               LET r_success = FALSE
               EXIT FOREACH              
            END IF   
         END IF
      END FOREACH   
   END IF   
   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 檢查單身是否有多稅別 或 稅別是否有應用公式計算
# Memo...........:
# Usage..........: CALL s_axmt540_chk_xmdl025(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        單據編號
# Return code....: r_success      結果(TRUE:單一稅別；FALSE:多稅別)
# Date & Author..: 2017/05/22 By fionchen (#170516-00056#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_chk_xmdl025(p_docno)
   DEFINE  p_docno   LIKE   xmdl_t.xmdldocno
   DEFINE  r_success LIKE   type_t.num5
   DEFINE  l_cnt     LIKE   type_t.num5
   #181030-00017#2 -S add
   DEFINE  l_xmdlseq  LIKE xmdl_t.xmdlseq  #項次
   DEFINE  l_xmdl003  LIKE xmdl_t.xmdl003  #來源訂單
   DEFINE  l_xmdl004  LIKE xmdl_t.xmdl004  #來源項次
   DEFINE  l_sql      STRING
   DEFINE  l_success  LIKE type_t.num10
   DEFINE  l_slip     LIKE ooba_t.ooba002  #單據別
   #181030-00017#2 -E add   
   DEFINE  l_isac005  LIKE isac_t.isac005  #計稅原則 #200116-00020#16 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #判斷單身是否多稅別
   LET l_cnt = 0
   SELECT COUNT(UNIQUE xmdl025) INTO l_cnt
     FROM xmdl_t
    WHERE xmdlent = g_enterprise AND xmdldocno = p_docno
   IF l_cnt > 1 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #判斷單身稅別是否有應用公式
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM xmdl_t,oodb_t,ooef_t
    WHERE xmdlent = oodbent AND xmdl025 = oodb002
      AND xmdlent = ooefent AND xmdlsite = ooef001 AND ooef019 = oodb001
      AND xmdlent = g_enterprise AND xmdldocno = p_docno AND oodb007 IS NOT NULL
   IF l_cnt > 0 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF g_prog <> 'axmt600' THEN        #201201-00008#1 add
      #181030-00017#2 -S add
      #抓出單身的來源訂單
      LET l_sql = " SELECT xmdlseq,xmdl003,xmdl004 ",
                  "   FROM xmdl_t",
                  "  WHERE xmdlent = ",g_enterprise,
                  "    AND xmdldocno = '",p_docno,"'"
      PREPARE s_axmt540_get_xmdl003_pre1 FROM l_sql
      DECLARE s_axmt540_get_xmdl003_cur1 CURSOR FOR s_axmt540_get_xmdl003_pre1
      
      FOREACH s_axmt540_get_xmdl003_cur1 INTO l_xmdlseq,l_xmdl003,l_xmdl004
         IF NOT cl_null(l_xmdl003) THEN
            #取得單別
            CALL s_aooi200_get_slip(l_xmdl003) RETURNING l_success,l_slip
            #出貨總額需與訂單總額一致
            IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0088') = 'Y' THEN
               #單身只要有一筆是D-BAS-0088 = 'Y'，就走多稅別的段落
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END IF
      END FOREACH
      #181030-00017#2 -E add 
   END IF                           #201201-00008#1 add   
   
   #191212-00041#1 -S add
   #增加判斷xmdl025是否存在aooi620,有則表示為複合稅
   SELECT COUNT(1) INTO l_cnt
     FROM xmdl_t,oodc_t,ooef_t
    WHERE xmdlent = oodcent AND xmdl025 = oodc002
      AND xmdlent = ooefent AND xmdlsite = ooef001 AND ooef019 = oodc001
      AND xmdlent = g_enterprise AND xmdldocno = p_docno
   IF l_cnt > 0 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #191212-00041#1 -E add
   
   #200116-00020#16 add---(S)
   #依發票類型做判斷，計稅原則(isac005)="1:依交易總額重計稅(清單式)"需進行尾差分攤，為"2:依發票細項計稅(明細式)"不需進行尾差分攤
   SELECT isac005 INTO l_isac005
     FROM xmdk_t,ooef_t,isac_t
    WHERE xmdkent = ooefent AND xmdkent = isacent
      AND xmdksite = ooef001 
      AND ooef019 = isac001 AND xmdk015 = isac002
      AND xmdkent = g_enterprise AND xmdkdocno = p_docno
   IF l_isac005 = 2 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #200116-00020#16 add---(E)
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取得相關金額(總未稅金額/總含稅金額/總稅額)
# Memo...........:
# Usage..........: CALL s_axmt540_get_xmdlamt(p_docno)
#                  RETURNING r_success,r_xmdk051,r_xmdk052,r_xmdk053
# Input parameter: p_docno        單據編號
# Return code....: r_success      TREU/FALSE
#                : r_xmdk051      總未稅金額
#                : r_xmdk052      總含稅金額
#                : r_xmdk053      總稅額
# Date & Author..: 2017/05/22 By fionchen (#170516-00056#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_xmdlamt(p_docno)
   DEFINE  p_docno   LIKE  xmdl_t.xmdldocno
   DEFINE  p_site    LIKE  xmdl_t.xmdlsite
   DEFINE  r_success LIKE  type_t.num5
   DEFINE  r_xmdk051 LIKE  xmdk_t.xmdk051
   DEFINE  r_xmdk052 LIKE  xmdk_t.xmdk052
   DEFINE  r_xmdk053 LIKE  xmdk_t.xmdk053
   DEFINE  l_cnt     LIKE  type_t.num5
   DEFINE  l_sql     STRING
   DEFINE  l_success LIKE  type_t.num5
   DEFINE  l_amt     LIKE  xmdk_t.xmdk051  #金額(數量*單價)
   DEFINE  l_xmdk012 LIKE  xmdk_t.xmdk012  #稅別
   DEFINE  l_xmdk016 LIKE  xmdk_t.xmdk016  #幣別
   DEFINE  l_xmdk017 LIKE  xmdk_t.xmdk017  #匯率
   DEFINE  l_doc_len  LIKE type_t.num5     #單號長度
   DEFINE  l_doc_len1 LIKE type_t.num5     #單號長度
   DEFINE  l_xrcd    RECORD
             xrcd103 LIKE  xrcd_t.xrcd103, #原幣未稅金額
             xrcd104 LIKE  xrcd_t.xrcd104, #原幣稅額
             xrcd105 LIKE  xrcd_t.xrcd105, #原幣含稅金額
             xrcd113 LIKE  xrcd_t.xrcd113, #本幣未稅金額
             xrcd114 LIKE  xrcd_t.xrcd114, #本幣稅額
             xrcd115 LIKE  xrcd_t.xrcd115  #本幣含稅金額
           END RECORD
   #181030-00017#2 -S add
   DEFINE  l_xmdlseq  LIKE xmdl_t.xmdlseq  #項次
   DEFINE  l_xmdl003  LIKE xmdl_t.xmdl003  #來源訂單
   DEFINE  l_xmdl004  LIKE xmdl_t.xmdl004  #來源項次
   DEFINE  l_xmdl018  LIKE xmdl_t.xmdl018  #數量
   DEFINE  l_xmdl027  LIKE xmdl_t.xmdl027  #未稅金額
   DEFINE  l_xmdl028  LIKE xmdl_t.xmdl028  #含稅金額
   DEFINE  l_xmdl029  LIKE xmdl_t.xmdl029  #稅額
   DEFINE  l_slip     LIKE ooba_t.ooba002  #單據別
   DEFINE  l_success2 LIKE type_t.num5
   #181030-00017#2 -E add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdk051 = 0
   LET r_xmdk052 = 0
   LET r_xmdk053 = 0
   
   #傳入單據編號為空;請指定單據編號!
   IF cl_null(p_docno) THEN
#170601-00082#1-s mark
#沒有單號不需要做後面的金額計算，也不需要報錯，直接RETURN就好
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00228'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#170601-00082#1-e mark
      LET r_success = FALSE
     #RETURN r_success                                 #170601-00082#1 mark
      RETURN r_success,r_xmdk051,r_xmdk052,r_xmdk053   #170601-00082#1 mod
   END IF
   
   #檢查單號是否完整
   LET l_doc_len = cl_get_para(g_enterprise,p_site,'E-COM-0005')
   LET l_doc_len1 = length(p_docno)
   IF l_doc_len <> l_doc_len1 THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdk051,r_xmdk052,r_xmdk053
   END IF
   
   #撿查是否有單身資料
   SELECT COUNT(1) INTO l_cnt
     FROM xmdl_t
    WHERE xmdlent = g_enterprise AND xmdldocno = p_docno
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt = 0 THEN    
      RETURN r_success,r_xmdk051,r_xmdk052,r_xmdk053
   END IF   
   #檢查單身是否有多稅別 或 稅別是否有應用公式計算(TRUE:單一稅別；FALSE:多稅別)
  #CALL s_axmt540_chk_xmdl025(p_docno) RETURNING l_success   #200116-00020#16 mark 移到後面
   
   IF g_prog <> 'axmt600' THEN                #201201-00008#1 add
      #181030-00017#2 -S add
      #抓出單身的來源訂單
      LET l_sql = " SELECT xmdlseq,xmdl003,xmdl004,xmdl018,xmdl027,",
                  "        xmdl028,xmdl029",
                  "   FROM xmdl_t",
                  "  WHERE xmdlent = ",g_enterprise,
                  "    AND xmdldocno = '",p_docno,"'"
                 ,"  ORDER BY xmdl028 DESC "               #201007-00009#1 add
      PREPARE s_axmt540_get_xmdl003_pre FROM l_sql
      DECLARE s_axmt540_get_xmdl003_cur CURSOR FOR s_axmt540_get_xmdl003_pre
      
      FOREACH s_axmt540_get_xmdl003_cur INTO l_xmdlseq,l_xmdl003,l_xmdl004,l_xmdl018,l_xmdl027,
                                             l_xmdl028,l_xmdl029
         IF NOT cl_null(l_xmdl003) THEN
            #取得單別
            CALL s_aooi200_get_slip(l_xmdl003) RETURNING l_success2,l_slip
            #出貨總額需與訂單總額一致
            IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0088') = 'Y' THEN
               #尾差調整(出貨總額需與訂單總額一致)
               CALL s_axmt540_adjust_last_amt(p_docno,l_xmdlseq,l_xmdl003,l_xmdl004,l_xmdl018,l_xmdl027,l_xmdl028,l_xmdl029)
               #單身只要有一筆是D-BAS-0088 = 'Y'，就走多稅別的段落
               LET l_success = FALSE
            END IF
         END IF
      END FOREACH
      #181030-00017#2 -E add
   END IF                                 #201201-00008#1 add
   
   #清空
   LET l_amt = 0
   LET l_xmdk012 = ''
   LET l_xmdk016 = ''
   LET l_xmdk017 = ''
   INITIALIZE l_xrcd TO NULL
   
   
   #檢查單身是否有多稅別 或 稅別是否有應用公式計算(TRUE:單一稅別；FALSE:多稅別)
   CALL s_axmt540_chk_xmdl025(p_docno) RETURNING l_success   #200116-00020#16 上面移下來
   IF l_success THEN
   #單一稅別
      #取得金額相關資料，以及單身的總金額
      SELECT xmdk012,xmdk016,xmdk017,
             #依含稅否，取得加總的未稅金額or含稅金額，避免因為進位，造成差額的問題
             #如：單價含稅，單頭跟單身的含稅總額，應該相同，單價未含稅亦同
             SUM(CASE xmdk014 WHEN 'N' THEN xmdl027  WHEN 'Y' THEN xmdl028 END)
        INTO l_xmdk012,l_xmdk016,l_xmdk017,l_amt
        FROM xmdk_t,xmdl_t 
        WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno
          AND xmdlent = g_enterprise AND xmdldocno = p_docno
        GROUP BY xmdk012,xmdk016,xmdk017
      #取得未稅金額/含稅金額/稅額         (金額已算好，數量可直接傳1)
      CALL s_tax_count(g_site,l_xmdk012,l_amt,1,l_xmdk016,l_xmdk017) 
          RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115
      #給值 總未稅金額/總含稅金額/總稅額
      LET r_xmdk051 = l_xrcd.xrcd103   
      LET r_xmdk052 = l_xrcd.xrcd105   
      LET r_xmdk053 = l_xrcd.xrcd104   
   ELSE
   #多稅別
      #取得未稅金額/含稅金額/稅額
      SELECT SUM(xmdl027),SUM(xmdl028),SUM(xmdl029) INTO r_xmdk051,r_xmdk052,r_xmdk053
        FROM xmdl_t 
       WHERE xmdlent = g_enterprise AND xmdldocno = p_docno
   END IF
   
   RETURN r_success,r_xmdk051,r_xmdk052,r_xmdk053
END FUNCTION

################################################################################
# Descriptions...: 取消確認，將分攤後的結果還原
# Memo...........: ※針對已調整過的資料還原※
# Usage..........: CALL s_axmt540_unconf_xrcd(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        單據編號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2017/05/25 By 08992(#170329-00046#21)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_unconf_xrcd(p_docno)
   DEFINE  p_docno   LIKE xmdl_t.xmdldocno
   DEFINE  r_success LIKE type_t.num5
   DEFINE  l_sql     STRING
   DEFINE  l_xmdl027 LIKE xmdl_t.xmdl027
   DEFINE  l_xmdl028 LIKE xmdl_t.xmdl028
   DEFINE  l_xmdl029 LIKE xmdl_t.xmdl029
   DEFINE  l_xmdk    RECORD
             xmdk016 LIKE xmdk_t.xmdk016,
             xmdlseq LIKE xmdl_t.xmdlseq,
             amt     LIKE xmdl_t.xmdl022, #xmdh021*xmdh023
             xmdl022 LIKE xmdl_t.xmdl022,
             xmdl025 LIKE xmdl_t.xmdl025
           END RECORD
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   #傳入單據編號為空;請指定單據編號!
   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET l_sql = "SELECT xmdk016,xmdlseq,(xmdl022*xmdl024),xmdl022,xmdl025 ",
               "  FROM xmdk_t,xmdl_t,xrcd_t ",
               " WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
               "   AND xmdkent = xrcdent AND xmdkdocno = xrcddocno AND xmdlseq = xrcdseq ",
               "   AND xmdkent = ",g_enterprise,
               "   AND xmdkdocno = '",p_docno,"'",
               "   AND xrcd008 = 'Y' " #調整註記='Y'
   PREPARE s_apmt520_xrcdseq_pre FROM l_sql
   DECLARE s_apmt520_xrcdseq_cur CURSOR FOR s_apmt520_xrcdseq_pre
   
   LET l_xmdl027 = 0
   LET l_xmdl028 = 0
   LET l_xmdl029 = 0
   INITIALIZE l_xmdk TO NULL
   #取得已調整過的資料(xrcd008='Y')
   FOREACH s_apmt520_xrcdseq_cur INTO l_xmdk.xmdk016,l_xmdk.xmdlseq,l_xmdk.amt,l_xmdk.xmdl022,l_xmdk.xmdl025
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_apmt520_xrcdseq_cur"
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #取得此筆資料的 未稅金額/含稅金額/稅額，並將資料重新寫入xrcd
      CALL s_axmt540_get_amount(p_docno,l_xmdk.xmdk016,l_xmdk.xmdlseq,l_xmdk.amt,l_xmdk.xmdl022,l_xmdk.xmdl025)
          RETURNING l_xmdl027,l_xmdl028,l_xmdl029
      #更新未稅金額/含稅金額/稅額
      UPDATE xmdl_t SET xmdl027 = l_xmdl027,
                        xmdl028 = l_xmdl028,
                        xmdl029 = l_xmdl029
       WHERE xmdlent = g_enterprise 
         AND xmdldocno = p_docno AND xmdlseq = l_xmdk.xmdlseq
      IF SQLCA.sqlcode THEN 
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd xmdl_t；err xmdlseq:",l_xmdk.xmdlseq
         LET g_errparam.popup = TRUE
         CALL cl_err()
    
         LET r_success = FALSE
         EXIT FOREACH
      END IF
   END FOREACH 
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 單身尾差調整(單筆的與xrcd筆對)
# Memo...........: 無異動xrcd
# Usage..........: CALL s_axmt540_adjust_xmdl(p_docno)
#                :     RETURNING r_success
# Input parameter: p_docno     單據編號 
# Return code....: r_success   TRUE/FALSE
# Date & Author..: 2017/05/19 By 08992 (#170329-00046#21)
# Modify.........
################################################################################
PUBLIC FUNCTION s_axmt540_adjust_xmdl(p_docno)
   DEFINE p_docno   LIKE xmdk_t.xmdkdocno
   DEFINE r_success LIKE type_t.num5
   DEFINE l_sql     STRING
   DEFINE l_xmdlseq LIKE xmdl_t.xmdlseq
   DEFINE l_xrcd103 LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104 LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105 LIKE xrcd_t.xrcd105
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   LET l_sql = " SELECT xmdlseq,xrcd103,xrcd104,xrcd105",
               "   FROM xmdl_t,xrcd_t ",
               "  WHERE xmdlent = xrcdent AND xmdldocno = xrcddocno ",
               "    AND xmdlseq = xrcdseq AND xrcdseq2 = '0' ",
               "    AND xmdlent = ",g_enterprise,
               "    AND xmdldocno = '",p_docno,"'",
               "    AND (xmdl027 <> xrcd103 OR xmdl028 <> xrcd105 OR xmdl029 <> xrcd104) "
   PREPARE s_apmt500_seq_pre FROM l_sql
   DECLARE s_apmt500_seq_cur CURSOR FOR s_apmt500_seq_pre
   
   LET l_xmdlseq = ''
   LET l_xrcd103 = 0
   LET l_xrcd104 = 0
   LET l_xrcd105 = 0
   #抓取與xrcd不同的金額or稅額
   FOREACH s_apmt500_seq_cur INTO l_xmdlseq,l_xrcd103,l_xrcd104,l_xrcd105
      #更新與xrcd不相同的項次
      UPDATE xmdl_t SET xmdl027 = xmdl027 + (l_xrcd103 - xmdl027),
                        xmdl028 = xmdl028 + (l_xrcd105 - xmdl028),
                        xmdl029 = xmdl029 + (l_xrcd104 - xmdl029) 
       WHERE xmdlent = g_enterprise AND xmdldocno = p_docno  AND xmdlseq = l_xmdlseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "adjust upd xmdl_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()  
         LET r_success = FALSE
         RETURN r_success         
      END IF 
   END FOREACH 

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新單頭 總未稅金額/總含稅金額/總稅額
# Memo...........: #1.利用s_axmt540_get_xmdlamt取得金額
#                : #2.更新單頭金額(xmdk051.xmdk052.xmdk053)
# Usage..........: CALL s_axmt540_upd_xmdg_amount(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        單據編號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2017/05/22 By dorislai (#170329-00046#21)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_upd_xmdk_amount(p_docno)
   DEFINE p_docno   LIKE xmdg_t.xmdgdocno 
   DEFINE r_success LIKE type_t.num5
   DEFINE l_success LIKE type_t.num5
   DEFINE l_xmdl027 LIKE xmdl_t.xmdl027
   DEFINE l_xmdl028 LIKE xmdl_t.xmdl028
   DEFINE l_xmdl029 LIKE xmdl_t.xmdl029
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #取得相關金額(總未稅金額/總含稅金額/總稅額)
   CALL s_axmt540_get_xmdlamt(p_docno) RETURNING l_success,l_xmdl027,l_xmdl028,l_xmdl029
   IF l_success THEN
      #更新單頭 總未稅金額/總含稅金額/總稅額
      UPDATE xmdk_t SET xmdk051 = l_xmdl027,
                        xmdk052 = l_xmdl028,
                        xmdk053 = l_xmdl029
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_docno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "upd xmdk_t"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   ELSE
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 取得未稅金額、含稅金額、稅額
# Memo...........: 與axmt540_get_amount相同，且會異動到xrcd
# Usage..........: CALL s_axmt540_get_amount(p_docno,p_xmdk016,p_xmdlseq,p_amt,p_xmdl022,p_xmdl025)
# Input parameter: p_docno     單據編號
#                : p_xmdk016   幣別
#                : p_xmdlseq   項次
#                : p_amt       金額(xmdl022*xmdl024)
#                : p_xmdl022   數量
#                : p_xmdl025   稅別
# Return code....: r_xmdl027   總未稅金額
#                : r_xmdl028   總含稅金額
#                : r_xmdl029   總稅額
# Date & Author..: 2017/05/25 By 08992 (#170329-00046#21)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_amount(p_docno,p_xmdk016,p_xmdlseq,p_amt,p_xmdl022,p_xmdl025)
   DEFINE p_docno    LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdk016  LIKE xmdk_t.xmdk016
   DEFINE p_xmdlseq  LIKE xmdl_t.xmdlseq
   DEFINE p_amt      LIKE xmdl_t.xmdl022
   DEFINE p_xmdl022  LIKE xmdl_t.xmdl022
   DEFINE p_xmdl025  LIKE xmdl_t.xmdl025
   DEFINE r_xmdl027  LIKE xmdl_t.xmdl027
   DEFINE r_xmdl028  LIKE xmdl_t.xmdl028
   DEFINE r_xmdl029  LIKE xmdl_t.xmdl029
   DEFINE l_xrcd     RECORD
            xrcd103  LIKE xrcd_t.xrcd103,
            xrcd104  LIKE xrcd_t.xrcd104,
            xrcd105  LIKE xrcd_t.xrcd105,
            xrcd113  LIKE xrcd_t.xrcd113,
            xrcd114  LIKE xrcd_t.xrcd114,
            xrcd115  LIKE xrcd_t.xrcd115,
            xrcd123  LIKE xrcd_t.xrcd123,
            xrcd124  LIKE xrcd_t.xrcd124,
            xrcd125  LIKE xrcd_t.xrcd125,
            xrcd133  LIKE xrcd_t.xrcd133,
            xrcd134  LIKE xrcd_t.xrcd134,
            xrcd135  LIKE xrcd_t.xrcd135
          END RECORD
   DEFINE l_xmdk017  LIKE xmdk_t.xmdk017   #170922-00048#7 add       
          
   WHENEVER ERROR CONTINUE
   
   #170922-00048#7 add --(S)--
   #取得該單據匯率
   SELECT xmdk017 INTO l_xmdk017
     FROM xmdk_t
    WHERE xmdkent   = g_enterprise
      AND xmdkdocno = p_docno 
   
   IF cl_null(l_xmdk017) OR l_xmdk017 = 0 THEN
      LET l_xmdk017 = 1
   END IF      
   #170922-00048#7 add --(E)--
   
   #寫入xrcd
   CALL s_tax_ins(p_docno,p_xmdlseq,0,g_site,p_amt,p_xmdl025,
                 #p_xmdl022,p_xmdk016,1,'','','' )           #170922-00048#7 mark
                  p_xmdl022,p_xmdk016,l_xmdk017,'','','' )   #170922-00048#7 add 
        RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,
                  l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115,
                  l_xrcd.xrcd123,l_xrcd.xrcd124,l_xrcd.xrcd125,
                  l_xrcd.xrcd133,l_xrcd.xrcd134,l_xrcd.xrcd135
                  
   LET r_xmdl027 = l_xrcd.xrcd103 #未稅金額
   LET r_xmdl028 = l_xrcd.xrcd105 #含稅金額
   LET r_xmdl029 = l_xrcd.xrcd104 #稅額
   
   RETURN r_xmdl027,r_xmdl028,r_xmdl029
END FUNCTION

################################################################################
# Descriptions...: 計算單頭總額、單身尾差調整
# Memo...........: 與axmt540_total_count()相同，且會異動到xrcd
# Usage..........: CALL s_axmt540_tax_recount(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        單據編號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2017/05/25 By 08992(#170329-00046#21)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_tax_recount(p_docno)
   DEFINE  p_docno   LIKE xmdl_t.xmdldocno
   DEFINE  r_success LIKE type_t.num5
   DEFINE  l_xrcd    RECORD
             xrcd103 LIKE  xrcd_t.xrcd103, #原幣未稅金額
             xrcd104 LIKE  xrcd_t.xrcd104, #原幣稅額
             xrcd105 LIKE  xrcd_t.xrcd105, #原幣含稅金額
             xrcd113 LIKE  xrcd_t.xrcd113, #本幣未稅金額
             xrcd114 LIKE  xrcd_t.xrcd114, #本幣稅額
             xrcd115 LIKE  xrcd_t.xrcd115  #本幣含稅金額
           END RECORD
   
   WHENEVER ERROR CONTINUE
   
   #傳入單據編號為空;請指定單據編號!
   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   
   #檢查是否為單一稅別(TRUE:單一稅別；FALSE:多稅別)
   IF s_axmt540_chk_xmdl025(p_docno) THEN  #191212-00041#1 add
      #重新計算xrcd
      CALL s_tax_recount(p_docno) RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,
                                            l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115     
      #更新單頭 總未稅金額/含稅金額/稅額 
      UPDATE xmdk_t SET xmdk051 = l_xrcd.xrcd103,
                        xmdk052 = l_xrcd.xrcd105,
                        xmdk053 = l_xrcd.xrcd104
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_docno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd xmdk_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()  
         LET r_success = FALSE
         RETURN r_success         
      END IF 
      
      #單身尾差調整
      IF NOT s_axmt540_adjust_xmdl(p_docno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF  #191212-00041#1 add
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 可出貨的計價數量
# Memo...........:
# Usage..........: CALL s_axmt540_get_max_ship_valuation_qty(p_source,p_ship_docno,p_ship_seq,p_source_docno,p_seq,p_seq1,p_seq2)
#                  RETURNING r_qty
# Input parameter: p_source         來源,1.出通單,2.訂單
#                : p_ship_docno     出貨單單號
#                : p_ship_seq       出貨單項次
#                : p_source_docno   出通單單號/訂單單號
#                : p_seq            出通單項次/訂單項次
#                : p_seq1           出通單傳空值/訂單項序
#                : p_seq2           出通單傳空值/訂單分批序
# Return code....: r_qty            未出貨計價數量(預帶欄位用)
# Date & Author..: #160929-00038#2 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_get_max_ship_valuation_qty(p_source,p_ship_docno,p_ship_seq,p_source_docno,p_seq,p_seq1,p_seq2)
   DEFINE p_source         LIKE type_t.num5        #來源,1.出通單,2.訂單
   DEFINE p_ship_docno     LIKE xmdk_t.xmdkdocno   #出貨單單號(排除本張出貨單可傳空值)
   DEFINE p_ship_seq       LIKE xmdl_t.xmdlseq     #出貨單項次(可傳空值)
   DEFINE p_source_docno   LIKE xmdk_t.xmdkdocno   #出通單單號/訂單單號
   DEFINE p_seq            LIKE xmdl_t.xmdl004     #出通單項次/訂單項次
   DEFINE p_seq1           LIKE xmdl_t.xmdl005     #出通單傳空值/訂單項序
   DEFINE p_seq2           LIKE xmdl_t.xmdl006     #出通單傳空值/訂單分批序
   DEFINE r_qty            LIKE xmdl_t.xmdl205     #未出貨的計價數量
   DEFINE l_unship_qty     LIKE xmdl_t.xmdl018     #訂單/出通單數量-已出貨數量
   DEFINE l_num_qty        LIKE xmdl_t.xmdl018     #訂單數量
   DEFINE l_uncof_qty      LIKE xmdl_t.xmdl018     #未確認出貨單的出貨數量
   DEFINE l_sql1           STRING
   DEFINE l_sql2           STRING
   DEFINE l_xmdl008        LIKE xmdl_t.xmdl008     #料件編號
   DEFINE l_sql3           STRING                       #200722-00018#1 add
   DEFINE l_xmdd001        LIKE xmdd_t.xmdd001          #200722-00018#1 add
   DEFINE l_xmdd004        LIKE xmdd_t.xmdd004          #200722-00018#1 add
   DEFINE l_xmdd026        LIKE xmdd_t.xmdd026          #200722-00018#1 add
   DEFINE l_sum            LIKE type_t.num10            #200722-00018#1 add
   DEFINE l_success        LIKE type_t.num10            #200722-00018#1 add

   WHENEVER ERROR CONTINUE

   LET r_qty = NULL
   LET l_xmdl008 = NULL
   LET l_unship_qty = NULL
   LET l_num_qty = NULL
   LET l_uncof_qty = NULL
   LET l_sql1 = NULL
   LET l_sql2 = NULL
   LET l_sql3 = NULL  #200722-00018#1 add
   LET l_sum = 0      #200722-00018#1 add

   LET l_sql1 = "SELECT SUM(COALESCE(xmdl022,0)) FROM xmdl_t ",
                " WHERE xmdlent = ",g_enterprise,
                "   AND EXISTS (SELECT 1 FROM xmdk_t t1 ",
                "                WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
                "                  AND xmdk000 = '1' ",
                "                  AND NOT (t1.xmdk045 = '3' ",
                "                        AND EXISTS (SELECT 1 FROM xmdk_t t2 ",
                "                                     WHERE t2.xmdkent = t1.xmdkent AND t2.xmdkdocno = t1.xmdk035 ",
                "                                       AND t2.xmdkstus <> 'X')) ",
                "                  AND xmdkstus <> 'X' ) "  

   IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
      LET l_sql1 = l_sql1," AND NOT (xmdldocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"    
   END IF
   
   CASE p_source
      WHEN 1   #來源為出通單時，可出貨計價數量 = xmdh021 出通計價數量-SUM(xmdl022)出貨單上有效的的計價數量 
         IF cl_null(p_source_docno) OR cl_null(p_seq) THEN
            RETURN r_qty
         END IF
         
         LET l_sql1 = l_sql1," AND xmdl001 = '",p_source_docno,"' AND xmdl002 = ",p_seq
       
        LET l_sql2 = "SELECT COALESCE(xmdh021,0) ", 
                     "  FROM xmdh_t ",
                     " WHERE xmdhent = ",g_enterprise," AND xmdhdocno = '",p_source_docno,"'",
                     "   AND xmdhseq = ",p_seq," " 
             
      WHEN 2   #來源為訂單時，可出貨計價數量 = xmdd027分批訂購計價數量-SUM(xmdl022)出貨單有效的計價數量
         IF cl_null(p_source_docno) OR cl_null(p_seq) OR cl_null(p_seq1) OR cl_null(p_seq2) THEN
            RETURN r_qty
         END IF

         LET l_sql1 = l_sql1," AND xmdl003 = '",p_source_docno,"' AND xmdl004 = ",p_seq,
                             " AND xmdl005= ",p_seq1," AND xmdl006 = ",p_seq2             

        #LET l_sql2 = "SELECT COALESCE(xmdd027,0) ",                       #190401-00045#1-mark
        #LET l_sql2 = "SELECT COALESCE(xmdd027,0) + COALESCE(xmdd016,0) ", #190401-00045#1-add 應該要加上換貨數量  #200722-00018#1 mark
        LET l_sql2 = "SELECT COALESCE(xmdd027,0) ", #190401-00045#1-add 應該要加上換貨數量  #200722-00018#1 add
                      "  FROM xmdd_t",
                      " WHERE xmddent = ",g_enterprise," AND xmdddocno = '",p_source_docno,"' ",
                      "   AND xmddseq = ",p_seq," AND xmddseq1 = ",p_seq1," AND xmddseq2 = ",p_seq2    
       
        #200722-00018#1 add--s
        LET l_sql3 = "SELECT COALESCE(xmdd016,0) + COALESCE(xmdd034,0) ",  
                      "  FROM xmdd_t",
                      " WHERE xmddent = ",g_enterprise," AND xmdddocno = '",p_source_docno,"' ",
                      "   AND xmddseq = ",p_seq," AND xmddseq1 = ",p_seq1," AND xmddseq2 = ",p_seq2   
        
        PREPARE s_axmt540_get_ji FROM l_sql3
        EXECUTE s_axmt540_get_ji INTO l_sum              
        #200722-00018#1 add--e                      
           
   END CASE 
   
   PREPARE s_axmt540_get_valuation_qty FROM l_sql1
   EXECUTE s_axmt540_get_valuation_qty INTO l_uncof_qty
      
   IF cl_null(l_uncof_qty) THEN LET l_uncof_qty = 0 END IF

   PREPARE s_axmt540_get_unship_qty FROM l_sql2
   EXECUTE s_axmt540_get_unship_qty INTO l_unship_qty
   
   IF cl_null(l_unship_qty) THEN LET l_unship_qty = 0 END IF
   
   #200722-00018#1 add--s
   IF cl_null(l_sum) OR l_sum = 0 THEN
      LET l_sum = 0 
   ELSE
      SELECT xmdd001,xmdd004,xmdd026 INTO l_xmdd001,l_xmdd004,l_xmdd026 FROM xmdd_t  
      WHERE xmddent = g_enterprise AND xmdddocno = p_source_docno AND xmddseq = p_seq
        AND xmddseq1 = p_seq1 AND xmddseq2 = p_seq2  
      
      CALL s_aooi250_convert_qty(l_xmdd001,l_xmdd004,l_xmdd026,l_sum)
                                      RETURNING l_success,l_sum      
   END IF
   #200722-00018#1 add--e
   #LET r_qty = l_unship_qty - l_uncof_qty        #200722-00018#1 mark
   LET r_qty = l_unship_qty - l_uncof_qty + l_sum #200722-00018#1 add
   RETURN r_qty
   
END FUNCTION

################################################################################
# Descriptions...: 检查库/储位是否有效
# Memo...........:
# Usage..........: s_axmt540_inaa_chk(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   单号
#                : 
# Return code....: r_success     执行结果
#                : 
# Date & Author..: 2017/12/19 By 09042
# Modify.........: #170618-00400#1 確認時增加判斷，庫位、儲位需為已存在之有效庫位
################################################################################
PUBLIC FUNCTION s_axmt540_inaa_chk(p_xmdkdocno)
   DEFINE p_xmdkdocno LIKE xmdk_t.xmdkdocno
   DEFINE l_cnt       LIKE type_t.num10
   DEFINE l_xmdl013   LIKE xmdl_t.xmdl013
   DEFINE l_xmdl014   LIKE xmdl_t.xmdl014
   DEFINE l_xmdl015   LIKE xmdl_t.xmdl015
   DEFINE l_xmdm005   LIKE xmdm_t.xmdm005
   DEFINE l_xmdm006   LIKE xmdm_t.xmdm006
   DEFINE l_xmdmseq   LIKE xmdm_t.xmdmseq
   DEFINE l_xmdmseq1  LIKE xmdm_t.xmdmseq1
   DEFINE r_success   LIKE type_t.num5  
   DEFINE l_sql       STRING
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE   
   
   LET l_sql = " SELECT xmdmseq,xmdmseq1,xmdm005,xmdm006 ",
               "   FROM xmdm_t ",
               "  WHERE xmdment = ",g_enterprise,
               "    AND xmdmdocno = '",p_xmdkdocno,"'",
               "    AND xmdm005 IS NOT NULL ",
               "    AND xmdm005 <> ' ' "               
               
   PREPARE s_axmt540_pre99 FROM l_sql
   DECLARE s_axmt540_cs99 CURSOR FOR s_axmt540_pre99 

   LET l_xmdm005 = ''
   LET l_xmdm006 = ''
   FOREACH s_axmt540_cs99 INTO l_xmdmseq,l_xmdmseq1,l_xmdm005,l_xmdm006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF   
   
      LET l_cnt = 0
      
      SELECT COUNT(1) INTO l_cnt
        FROM inaa_t
       WHERE inaaent = g_enterprise 
         AND inaasite = g_site 
         AND inaa001 = l_xmdm005
         AND inaastus = 'Y'
      
      IF l_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00897'
         LET g_errparam.replace[1] = l_xmdmseq 
         LET g_errparam.replace[2] = l_xmdmseq1  
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF   
      
      #180814-00057#1 by 02159 mark(S)
      #LET l_cnt = 0
      #
      #IF NOT cl_null(l_xmdm006) THEN
      #   SELECT COUNT(1) INTO l_cnt 
      #     FROM inab_t
      #    WHERE inabent = g_enterprise
      #      AND inabsite = g_site
      #      AND inab001 = l_xmdm005
      #      AND inab002 = l_xmdm006
      #      AND inabstus = 'Y'
      #      
      #   IF l_cnt = 0 THEN
      #      INITIALIZE g_errparam TO NULL
      #      LET g_errparam.code = 'axm-00898'
      #      LET g_errparam.replace[1] = l_xmdmseq 
      #      LET g_errparam.replace[2] = l_xmdmseq1            
      #      LET g_errparam.popup = TRUE
      #      CALL cl_err()
      #      LET r_success = FALSE
      #   END IF
      #END IF
      #180814-00057#1 by 02159 mark(E)      
   END FOREACH
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 單頭更改時單身更新重新取價計算
# Memo...........:
# Usage..........: CALL axmt540_detail_update(p_xmdkdocno,p_oodb006,p_oodb011,p_xmdk017,p_type)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno #單號
#                : p_oodb006  #稅率      p_type為1時使用
#                : p_oodb011  #稅別應用  p_type為1時使用
#                : p_xmdk017  #匯率
#                : p_type     #0.其他(重新取價)1.更改稅別2.更改幣別4.重新取價Action
# Return code....: r_success  #執行結果
#                : 
# Date & Author..: 2018/01/02 By 08992  #170618-00261#2 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_detail_upd(p_xmdkdocno,p_oodb006,p_oodb011,p_xmdk017,p_type)
   DEFINE p_oodb006     LIKE oodb_t.oodb006
   DEFINE p_oodb011     LIKE oodb_t.oodb011
   DEFINE p_xmdk017     LIKE xmdk_t.xmdk017
   DEFINE P_xmdkdocno  LIKE xmdk_t.xmdkdocno
   DEFINE l_xmdkdocdt  LIKE xmdk_t.xmdkdocdt
   DEFINE l_xmdk007    LIKE xmdk_t.xmdk007
   DEFINE l_xmdk010    LIKE xmdk_t.xmdk010
   DEFINE l_xmdk011    LIKE xmdk_t.xmdk011
   DEFINE l_xmdk012    LIKE xmdk_t.xmdk012
   DEFINE l_xmdk016    LIKE xmdk_t.xmdk016
   DEFINE l_xmdk018    LIKE xmdk_t.xmdk018
   DEFINE l_xmdk030    LIKE xmdk_t.xmdk030
   DEFINE l_xmdk042    LIKE xmdk_t.xmdk042 
   DEFINE l_amt        LIKE xmdk_t.xmdk051 
   DEFINE p_type        LIKE type_t.chr1
   DEFINE r_success     LIKE type_t.num5

   DEFINE l_num         LIKE type_t.num5
   DEFINE l_sql         STRING

   DEFINE l_xmdl027     LIKE xmdl_t.xmdl027
   DEFINE l_xmdl028     LIKE xmdl_t.xmdl028
   DEFINE l_xmdl029     LIKE xmdl_t.xmdl029
     
   DEFINE l_xmdl     RECORD
             xmdlseq       LIKE xmdl_t.xmdlseq,
             xmdl001       LIKE xmdl_t.xmdl001,
             xmdl003       LIKE xmdl_t.xmdl003,
             xmdl004       LIKE xmdl_t.xmdl004,
             xmdl008       LIKE xmdl_t.xmdl008,
             xmdl009       LIKE xmdl_t.xmdl009,
             xmdl016       LIKE xmdl_t.xmdl016,
             xmdl018       LIKE xmdl_t.xmdl018,
             xmdl021       LIKE xmdl_t.xmdl021,
             xmdl022       LIKE xmdl_t.xmdl022,
             xmdl024       LIKE xmdl_t.xmdl024,
             xmdl025       LIKE xmdl_t.xmdl025,
             xmdl026       LIKE xmdl_t.xmdl026,
             xmdl042       LIKE xmdl_t.xmdl042,
             xmdl043       LIKE xmdl_t.xmdl043,
             xmdl044       LIKE xmdl_t.xmdl044,
             xmdl045       LIKE xmdl_t.xmdl045
                     END RECORD

   DEFINE l_source  LIKE xmdc_t.xmdc040
   DEFINE l_price   LIKE xmdc_t.xmdc043
   DEFINE l_docno   LIKE xmdc_t.xmdcdocno
   DEFINE l_seq     LIKE xmdc_t.xmdcseq
   DEFINE l_errshow LIKE type_t.num5

   
   LET r_success = TRUE
   
   IF p_type = '4' THEN
      LET l_errshow = TRUE
   ELSE
      LET l_errshow = FALSE
   END IF
   
   IF cl_null(p_type) THEN
      RETURN r_success
   END IF

   SELECT xmdkdocdt,xmdk007,xmdk010,xmdk011,xmdk016,
          xmdk018,xmdk030,xmdk042 
     INTO l_xmdkdocdt,l_xmdk007,l_xmdk010,l_xmdk011,l_xmdk016,
          l_xmdk018,l_xmdk030,l_xmdk042         
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno

   LET l_sql = "SELECT xmdlseq,xmdl001,xmdl003,xmdl004,",
               "       xmdl008,xmdl009,xmdl016,",               
               "       xmdl018,xmdl021,xmdl022,",
               "       xmdl024,xmdl025,xmdl026,",
               "       xmdl042,xmdl043,xmdl044,xmdl045",
               "  FROM xmdl_t",
               " WHERE xmdlent = '",g_enterprise,"'",
               "   AND xmdldocno = '",p_xmdkdocno,"'"
   PREPARE axmt540_detail_pre FROM l_sql
   DECLARE axmt540_detail_cs CURSOR WITH HOLD FOR axmt540_detail_pre

   #無設定幣別、內外銷不更新
   IF cl_null(l_xmdk016) OR cl_null(l_xmdk042) THEN
      IF l_errshow THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00555'    #幣別、內外銷不可為空！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
   
      RETURN r_success
   END IF

   LET l_num = 0
   SELECT COUNT(xmdlseq) INTO l_num
     FROM xmdl_t
    WHERE xmdlent = g_enterprise
      AND xmdldocno = p_xmdkdocno

   IF l_num = 0 THEN
      RETURN r_success  #無單身不更新
   END IF
  
   
   INITIALIZE l_xmdl.* TO NULL
   FOREACH axmt540_detail_cs INTO l_xmdl.xmdlseq,l_xmdl.xmdl001,l_xmdl.xmdl003,l_xmdl.xmdl004,
                                  l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl016,
                                  l_xmdl.xmdl018,l_xmdl.xmdl021,l_xmdl.xmdl022,
                                  l_xmdl.xmdl024,l_xmdl.xmdl025,l_xmdl.xmdl026,
                                  l_xmdl.xmdl042,l_xmdl.xmdl043,l_xmdl.xmdl044,l_xmdl.xmdl045
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF p_type = '1' THEN        #稅別修改
         IF p_oodb011 = '1' THEN  #正常稅率
            LET l_xmdl.xmdl025 = l_xmdk012  #稅別
            LET l_xmdl.xmdl026 = p_oodb006         #稅率
         END IF
         
      ELSE   #重新取價、修改幣別
         #取價
         IF cl_null(l_xmdl.xmdl001) AND cl_null(l_xmdl.xmdl003) THEN   #無來源且有輸入料號、產品特徵時才做取價

            IF NOT cl_null(l_xmdk018) AND NOT cl_null(l_xmdk007) AND NOT cl_null(l_xmdk016)
               AND NOT cl_null(l_xmdk010) AND NOT cl_null(l_xmdk011) AND NOT cl_null(l_xmdk030)
               AND NOT cl_null(p_xmdkdocno) AND NOT cl_null(l_xmdkdocdt) AND NOT cl_null(l_xmdk042)
               AND NOT cl_null(l_xmdl.xmdl008)
               AND NOT cl_null(l_xmdl.xmdl021) AND NOT cl_null(l_xmdl.xmdl022)
               AND NOT cl_null(l_xmdl.xmdl025) THEN

               IF cl_null(l_xmdl.xmdl009) THEN  #產品特徵
                  LET l_xmdl.xmdl009 = ' '
               END IF
             
               CALL s_sale_price_get(l_xmdk018,l_xmdk007,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdk016,
                                     l_xmdl.xmdl025,l_xmdk010,l_xmdk011,l_xmdk030,p_xmdkdocno,
                                     l_xmdkdocdt,l_xmdl.xmdl021,l_xmdl.xmdl022,g_site,'1',
                                     l_xmdk042)
               RETURNING l_source,l_price,l_docno,l_seq

               LET l_xmdl.xmdl042 = l_source
               LET l_xmdl.xmdl043 = l_docno
               LET l_xmdl.xmdl044 = l_seq
               LET l_xmdl.xmdl045 = l_price
            
               LET l_xmdl.xmdl024 = l_price
            END IF
         END IF
      END IF
      LET l_amt = l_xmdl.xmdl022 * l_xmdl.xmdl024 
      CALL s_axmt540_get_amount(p_xmdkdocno,l_xmdk016,l_xmdl.xmdlseq,l_amt,l_xmdl.xmdl022,l_xmdl.xmdl025)
          RETURNING l_xmdl027,l_xmdl028,l_xmdl029

      UPDATE xmdl_t
         SET xmdl042 = l_xmdl.xmdl042,   #取價來源
             xmdl043 = l_xmdl.xmdl043,   #來源參考單號
             xmdl044 = l_xmdl.xmdl044,   #來源參考項次
             xmdl045 = l_xmdl.xmdl045,   #取出價格             
             xmdl024 = l_xmdl.xmdl024,   #單價
             xmdl025 = l_xmdl.xmdl025,   #稅別
             xmdl026 = l_xmdl.xmdl026,   #稅率
             xmdl027 = l_xmdl027,        #未稅金額
             xmdl028 = l_xmdl028,        #含稅金額
             xmdl029 = l_xmdl029         #稅額
       WHERE xmdlent = g_enterprise
         AND xmdldocno = p_xmdkdocno
         AND xmdlseq = l_xmdl.xmdlseq

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'UPDATE'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF      
   END FOREACH

   IF NOT r_success THEN
      RETURN r_success
   END IF
        
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 出货单確認後，回寫回其它資料
# Memo...........:
# Usage..........: CALL s_axmt540_confe_other(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    出货单号
#                :
# Return code....: r_success      TRUE/FALSE
#                : 
# Date & Author..: 2018/02/05 By 09042
# Modify.........: #171214-00053#2  add
#                : #180111-00043#81 By 09505
################################################################################
PUBLIC FUNCTION s_axmt540_confe_other(p_xmdkdocno)
  DEFINE   p_xmdkdocno   LIKE xmdk_t.xmdkdocno
  DEFINE   r_success     LIKE type_t.num5
  DEFINE   l_sql         STRING
  DEFINE   l_cnt         LIKE type_t.num5  
  DEFINE   l_xmdl003     LIKE xmdl_t.xmdl003 
  DEFINE   l_xmdl008     LIKE xmdl_t.xmdl008
  DEFINE   l_xmdl009     LIKE xmdl_t.xmdl009
  DEFINE   l_xmdl021     LIKE xmdl_t.xmdl021
  DEFINE   l_xmdl022     LIKE xmdl_t.xmdl022
  DEFINE   l_xmdl024     LIKE xmdl_t.xmdl024
  DEFINE   l_xmdl025     LIKE xmdl_t.xmdl025
  DEFINE   l_xmdl042     LIKE xmdl_t.xmdl042
  DEFINE   l_xmdl043     LIKE xmdl_t.xmdl043
  DEFINE   l_xmdl044     LIKE xmdl_t.xmdl044     
  DEFINE   l_xmdl027     LIKE xmdl_t.xmdl027     
  DEFINE   l_xmdl028     LIKE xmdl_t.xmdl028     
  DEFINE   l_xmdl029     LIKE xmdl_t.xmdl029     
  DEFINE   l_xmdl030     LIKE xmdl_t.xmdl030     
  DEFINE   l_xmdl007     LIKE xmdl_t.xmdl007     
  DEFINE   l_scc40       LIKE type_t.chr2        
  DEFINE   l_rate        LIKE ooan_t.ooan005  
  DEFINE   l_xmag012     LIKE xmag_t.xmag012     
  DEFINE   l_xmag013     LIKE xmag_t.xmag013     
  DEFINE   l_xmag014     LIKE xmag_t.xmag014     
  DEFINE   l_xmag015     LIKE xmag_t.xmag015     
  DEFINE   l_xmag016     LIKE xmag_t.xmag016     
  DEFINE   l_xmag017     LIKE xmag_t.xmag017     
  DEFINE   l_xmag018     LIKE xmag_t.xmag018     
  DEFINE   l_xmdk007     LIKE xmdk_t.xmdk007     
  DEFINE   l_xmdk016     LIKE xmdk_t.xmdk016     
  DEFINE   l_xmdk042     LIKE xmdk_t.xmdk042     
  DEFINE   l_oodb005     LIKE oodb_t.oodb005     
  DEFINE   l_oodb006     LIKE oodb_t.oodb006     
  DEFINE   l_success     LIKE type_t.num5  
  DEFINE   l_oodbl004    LIKE oodbl_t.oodbl004   #190523-00039#1 add
  DEFINE   l_oodb011     LIKE oodb_t.oodb011     #190523-00039#1 add
  
  LET r_success = TRUE

  SELECT xmdk007,xmdk016,xmdk042 
    INTO l_xmdk007,l_xmdk016,l_xmdk042 
    FROM xmdk_t
   WHERE xmdkent = g_enterprise
     AND xmdkdocno = p_xmdkdocno
     
  CASE l_xmdk042
    WHEN '1'  #內銷外幣採用匯率類型
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0010') RETURNING l_scc40
    WHEN '2'  #外銷外幣採用匯率類型
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0011') RETURNING l_scc40
    OTHERWISE EXIT CASE
  END CASE
  #取本幣
  LET g_ooef016 = ''
  SELECT ooef016 INTO g_ooef016
    FROM ooef_t
   WHERE ooefent = g_enterprise
     AND ooef001 = g_site   
     
  LET l_sql = "SELECT xmdl003,xmdl008,xmdl009,xmdl021,COALESCE(xmdl022,0),xmdl024, ",
              "       xmdl025,xmdl042,xmdl043,xmdl044,xmdl027, ",
              "       COALESCE(xmdl028,0),COALESCE(xmdl029,0), ",
              "       xmdl030,xmdl007 ",                                  #add by lixiang 2015/06/29
              "  FROM xmdk_t,xmdl_t ",
              "  WHERE xmdkent = '",g_enterprise,"' ",
              "   AND xmdkdocno = '",p_xmdkdocno,"' ",
              "   AND xmdkent = xmdlent ",
              "   AND xmdkdocno = xmdldocno "

  PREPARE xmdl_sel FROM l_sql
  DECLARE xmdl_cur CURSOR FOR xmdl_sel
  FOREACH xmdl_cur INTO l_xmdl003,l_xmdl008,l_xmdl009,l_xmdl021,l_xmdl022,l_xmdl024,
                        l_xmdl025,l_xmdl042,l_xmdl043,l_xmdl044,l_xmdl027,
                        l_xmdl028,l_xmdl029,
                        l_xmdl030,  #add by lixiang 2015/06/29
                        l_xmdl007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:xmdc_cur'
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF     
      
      IF cl_null(l_xmdl009) THEN LET l_xmdl009 = ' ' END IF       
      #190523-00039#1---add---str---
         CALL s_tax_chk(g_site,l_xmdl025)
           RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
      #190523-00039#1---add---end---
      
     #確認後更新單價至價格檔
      LET l_xmag012 = l_xmdl024
      #將單價轉換成本國幣的單價
      LET l_rate = ''
      #CALL s_aooi160_get_exrate('1',g_site,g_today,l_xmdl024,g_ooef016,0,l_scc40) RETURNING l_rate   #180207-00007#1 mark
      CALL s_aooi160_get_exrate('1',g_site,g_today,l_xmdk016,g_ooef016,0,l_scc40) RETURNING l_rate    #180207-00007#1 add
      
      IF NOT cl_null(l_rate) THEN
         LET l_xmag013 = l_xmag012 * l_rate
         CALL s_curr_round(g_site,g_ooef016,l_xmag013,'1') RETURNING l_xmag013
      END IF
      IF cl_null(l_xmag013) THEN LET l_xmag013 = l_xmag012 END IF

      LET l_xmag014 = l_xmdl021
      LET l_xmag015 = l_xmdl022
      LET l_xmag016 = l_xmdl028
      LET l_xmag017 = l_xmdl027
      LET l_xmag018 = l_xmdl003
      
      #更新客戶料件一般銷售價格維護axmi125
      LET l_cnt = 0 
      SELECT COUNT(*) INTO l_cnt      
       FROM xmag_t
      WHERE xmagent = g_enterprise
        AND xmagsite = g_site
        AND xmag000 = 'N'          
        AND xmag001 = l_xmdk007
        AND xmag002 = l_xmdl008
        AND xmag003 = l_xmdl009
        AND xmag006 = l_xmdl021
        #AND xmag007 = l_xmdl024     #180207-00007#1 mark
        AND xmag007 = l_xmdk016      #180207-00007#1 add
        AND xmag009 = l_xmdl025   
      IF l_xmdl007 <> '9' THEN
         IF l_cnt > 0 THEN
            UPDATE xmag_t
               SET xmag012 = l_xmag012,
                   xmag013 = l_xmag013,
                   xmag014 = l_xmag014,
                   xmag015 = l_xmag015,
                   xmag016 = l_xmag016,
                   xmag017 = l_xmag017,
                   xmag018 = l_xmag018,
                   xmag019 = g_today,
                   xmag020 = g_user
             WHERE xmagent = g_enterprise
               AND xmagsite = g_site
               AND xmag000 = 'N'          
               AND xmag001 = l_xmdk007
               AND xmag002 = l_xmdl008
               AND xmag003 = l_xmdl009
               AND xmag004 = ' '
               AND xmag005 = ' '
               AND xmag006 = l_xmdl021
               #AND xmag007 = l_xmdl024     #180207-00007#1 mark
               AND xmag007 = l_xmdk016      #180207-00007#1 add
               AND xmag009 = l_xmdl025 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.extend = "UPDATE xmag_t"            
               LET g_errparam.popup  = FALSE
               CALL cl_err()         
               LET r_success = FALSE
               RETURN r_success  
            END IF            
         ELSE
            INSERT INTO xmag_t
                        (xmagent, xmagsite,  xmag000,  xmag001,xmag002,
                         xmag003,  xmag004,  xmag005,  xmag006,xmag007,  
                         xmag008,  xmag009,  xmag010,  xmag011,xmag012,  
                         xmag013,  xmag014,  xmag015,  xmag016,xmag017,
                         xmag018,  xmag019,  xmag020,xmagownid,xmagowndp,
                         xmagcrtid,xmagcrtdp,xmagcrtdt,xmagstus)
                 VALUES (g_enterprise,g_site,'N',l_xmdk007,l_xmdl008,
                         l_xmdl009,' ',' ',l_xmdl021,l_xmdk016,
                         l_rate,l_xmdl025,l_oodb005,l_oodb006,l_xmag012,
                         l_xmag013,l_xmag014,l_xmag015,l_xmag016,l_xmag017,
                         l_xmag018,g_today,g_user,g_user,g_dept,
                         g_user,g_dept,g_today,'Y')
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.extend = "INSERT xmag_t"            
               LET g_errparam.popup  = FALSE
               CALL cl_err() 
               LET r_success = FALSE            
               RETURN r_success  
            END IF   
         END IF
      END IF
      #151118-00022#1-s
      IF l_oodb005 = 'Y' THEN
         LET l_xmag013 = l_xmag013 / (1 + l_oodb006/100)
      END IF
      #151118-00022#1-e
      IF l_xmdl007 <> '9' THEN
         #更新料件據點資料的最近銷售價格(aimm201)
         UPDATE imai_t
            SET imai221 = l_xmag013,
                imai201 = g_today,
                imai202 = l_xmdl003
          WHERE imaient = g_enterprise
            AND imaisite = g_site
            AND imai001 = l_xmdl008
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.extend = "UPDATE imai_t"            
            LET g_errparam.popup  = FALSE
            CALL cl_err() 
            LET r_success = FALSE            
            RETURN r_success
         END IF
      END IF
  END FOREACH  

  RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 多角自動拋轉
# Memo...........:
# Usage..........: CALL s_axmt540_aic_auto_cast(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2018/02/07 By 10042
# Modify.........: 170925-00016#5 add
################################################################################
PUBLIC FUNCTION s_axmt540_aic_auto_cast(p_xmdkdocno)
   DEFINE p_xmdkdocno    LIKE xmdk_t.xmdkdocno
   DEFINE l_xmdk044      LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045      LIKE xmdk_t.xmdk045
   DEFINE l_xmdk002      LIKE xmdk_t.xmdk002
   DEFINE l_xmdk083      LIKE xmdk_t.xmdk083
   DEFINE r_success      LIKE type_t.num5
   DEFINE la_param       RECORD
          prog           STRING,
          actionid       STRING,
          background     LIKE type_t.chr1,
          param          DYNAMIC ARRAY OF STRING
          END RECORD     
   DEFINE ls_js          STRING
   
   LET r_success = TRUE
   
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdk002 = ''
   SELECT xmdk044,xmdk045,xmdk002
     INTO l_xmdk044,l_xmdk045,l_xmdk002
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   IF cl_get_para(g_enterprise,'','E-BAS-0022') = 'Y' AND
      l_xmdk045 MATCHES '[27]' AND 
      l_xmdk002 <> '3' AND
      l_xmdk044 IS NOT NULL THEN
      INITIALIZE la_param.* TO NULL
      LET la_param.prog     = 'aicp500'
      LET la_param.param[1] = p_xmdkdocno
      LET la_param.param[2] = g_sessionkey        #170617-00078#7 add      
      LET ls_js = util.JSON.stringify(la_param)
      CALL cl_cmdrun_wait(ls_js)

      LET l_xmdk083 = ''
      SELECT xmdk083 INTO l_xmdk083
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno
      #多角流程拋轉失敗！
      IF l_xmdk083 <> 'Y' THEN
         #170617-00078#7-s add
         #將自動拋轉寫入icer_t的錯誤訊息設定到錯誤訊息
         CALL s_axmt540_show_aicerrmsg(g_sessionkey,p_xmdkdocno)
         #170617-00078#7-e add      
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'aic-00177'
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      END IF
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 多角自動拋轉還原
# Memo...........:
# Usage..........: CALL s_axmt540_aic_auto_reduce(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2018/02/07 By 10042
# Modify.........: 170925-00016#5 add
################################################################################
PUBLIC FUNCTION s_axmt540_aic_auto_reduce(p_xmdkdocno)
   DEFINE p_xmdkdocno    LIKE xmdk_t.xmdkdocno
   DEFINE l_xmdk044      LIKE xmdk_t.xmdk044
   DEFINE l_xmdk045      LIKE xmdk_t.xmdk045
   DEFINE l_xmdk002      LIKE xmdk_t.xmdk002
   DEFINE l_xmdk083      LIKE xmdk_t.xmdk083
   DEFINE r_success      LIKE type_t.num5
   DEFINE la_param       RECORD
          prog           STRING,
          actionid       STRING,
          background     LIKE type_t.chr1,
          param          DYNAMIC ARRAY OF STRING
          END RECORD     
   DEFINE ls_js          STRING
   #180316-00044#1 Add By 06137	180322(S)
   DEFINE l_sql          STRING    
   DEFINE l_cnt          LIKE type_t.num10
   #180316-00044#1 Add By 06137	180322(E)   
   
   LET r_success = TRUE
   
   LET l_xmdk044 = ''
   LET l_xmdk045 = ''
   LET l_xmdk002 = ''
   SELECT xmdk044,xmdk045,xmdk002
     INTO l_xmdk044,l_xmdk045,l_xmdk002
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
      
   #180316-00044#1 Add By 06137	180322(s)
   IF l_xmdk045 MATCHES '[3]' AND NOT cl_null(l_xmdk044) THEN  #多角性質：統銷統收
      LET l_cnt = 0
      LET l_sql = " SELECT COUNT(1) ",
                  "   FROM ( SELECT icaa001 FROM icaa_t LEFT OUTER JOIN icab_t ON icabent = icaaent AND icab001 = icaa001 WHERE icaaent = ",g_enterprise," AND icaastus = 'Y'",
                  "                         AND ((icaa003 = '1' AND icaa004 = '1' AND icab002 = 0 AND icab003 = '",g_site,"')",
                  "                              OR ((icaa003 = '1' OR icaa003 = '2') AND icaa004 = '2' AND icab002 = (SELECT MAX(icab002) FROM icab_t WHERE icabent = icaaent AND icab001 = icaa001) AND icab003 = '",g_site,"')",
                  "                              OR (icaa005 = 'Y' AND icaa003 = '1' AND icaa004 = '2'  AND icab002 = 0 AND icab003 = '",g_site,"')",
                  "                             )",
                  "                         AND icaa001 = ? ",
                  "                     )  "
      PREPARE s_axmt540_xmdk_cnt FROM l_sql      
      EXECUTE s_axmt540_xmdk_cnt USING l_xmdk044 INTO l_cnt
      IF l_cnt = 0 THEN
         #非出貨據點，不可過帳還原！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00951'
         LET g_errparam.extend = g_site
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success  
      ELSE
         #統銷統收的出貨單，僅能透過aicp910[統銷統收整批流程還原作業]進行還原！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00952'
         LET g_errparam.extend = g_site
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success               
      END IF
   END IF
   
   IF l_xmdk045 MATCHES '[257]' THEN #多角性質：2.銷售多角,5.中間交易,7.代採購出貨
      IF NOT cl_null(l_xmdk044) THEN
         INITIALIZE g_chkparam.* TO NULL
         LET g_errshow = TRUE #是否開窗
         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = l_xmdk044
         LET g_chkparam.arg2 = g_site
         LET g_chkparam.arg3 = l_xmdk002
         LET g_chkparam.err_str[1] ="aic-00012:sub-01302|aici100|",cl_get_progname("aici100",g_lang,"2"),"|:EXEPROGaici100"
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_icaa001_3") THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF   
   END IF
   #180316-00044#1 Add By 06137	180322(e)      
      
   IF cl_get_para(g_enterprise,'','E-BAS-0022') = 'Y' AND
      l_xmdk045 MATCHES '[27]' AND 
      l_xmdk002 <> '3' AND
      l_xmdk044 IS NOT NULL THEN
      INITIALIZE la_param.* TO NULL
      LET la_param.prog     = 'aicp510'
      LET la_param.param[1] = p_xmdkdocno
      LET la_param.param[2] = g_sessionkey        #170617-00078#7 add      
      LET ls_js = util.JSON.stringify(la_param)
      CALL cl_cmdrun_wait(ls_js)
   END IF
   
   LET l_xmdk083 = ''
   SELECT xmdk083 INTO l_xmdk083
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   #IF l_xmdk083 = 'Y' THEN                       #180316-00044#1 Mark By 06137	180322
   IF l_xmdk083 = 'Y' AND l_xmdk002 <> '3' THEN   #180316-00044#1 Add By 06137	180322
      #170617-00078#7-s add
      #將自動拋轉寫入icer_t的錯誤訊息設定到錯誤訊息
      CALL s_axmt540_show_aicerrmsg(g_sessionkey,p_xmdkdocno)
      #170617-00078#7-e add   
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      #多角流程已拋轉之單據不可取消過帳！
#      LET g_errparam.code   = 'aic-00177'   #201204-00025#1 mark 调整报错
      LET g_errparam.code   = 'aic-00181'    #201204-00025#1 add
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 拋轉錯誤訊息匯總
# Memo...........:
# Usage..........: CALL s_axmt540_show_aicerrmsg(p_sessionkey,p_xmdkdocno)
# Input parameter: p_sessionkey       sessionkey
#                : p_xmdkdocno        訂單單號
# Return code....: 
# Date & Author..: 2018/02/06 By 08992 (#170617-00078#7 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_show_aicerrmsg(p_sessionkey,p_xmdkdocno)
DEFINE p_sessionkey    LIKE icer_t.icer001 
DEFINE p_xmdkdocno     LIKE icer_t.icer003
DEFINE l_cnt           LIKE type_t.num5
DEFINE l_icer RECORD
           icerent         LIKE icer_t.icerent,
           icersite        LIKE icer_t.icersite,
           icer001         LIKE icer_t.icer001,    #sessionkey
           icer002         LIKE icer_t.icer002,    #員工編號
           icer003         LIKE icer_t.icer003,    #執行單據編號
           icer004         LIKE icer_t.icer004,    #單據編號
           icer005         LIKE icer_t.icer005,    #單據日期
           icer006         LIKE icer_t.icer006,    #來源單據編號
           icer007         LIKE icer_t.icer007,    #採購性質
           icer008         LIKE icer_t.icer008,    #交易對象
           icer009         LIKE icer_t.icer009,    #交易對象名稱
           icer010         LIKE icer_t.icer010,    #收款對象
           icer011         LIKE icer_t.icer011,    #收款對象名稱
           icer012         LIKE icer_t.icer012,    #送/收貨對象
           icer013         LIKE icer_t.icer013,    #送/收貨對象名稱
           icer014         LIKE icer_t.icer014,    #人員
           icer015         LIKE icer_t.icer015,    #人員全名
           icer016         LIKE icer_t.icer016,    #部門
           icer017         LIKE icer_t.icer017,    #部門名稱
           icer018         LIKE icer_t.icer018,    #資料所有者
           icer019         LIKE icer_t.icer019,    #資料所有者全名
           icer020         LIKE icer_t.icer020,    #資料建立者
           icer021         LIKE icer_t.icer021,    #資料建立者全名
           icer022         LIKE icer_t.icer022,    #多角序號
           icer023         LIKE icer_t.icer023,    #最終供應商
           icer024         LIKE icer_t.icer024,    #最終供應商名稱
           icer025         LIKE icer_t.icer025,    #營運據點
           icer026         LIKE icer_t.icer026,    #營運據點名稱
           icer027         LIKE icer_t.icer027,    #錯誤訊息編號
           icer028         LIKE icer_t.icer028     #錯誤訊息內容
              END RECORD
   
   SELECT COUNT(1) INTO l_cnt
     FROM icer_t
    WHERE icerent = g_enterprise 
      AND icer001 = p_sessionkey
      AND icer002 = g_user
      AND icer003 = p_xmdkdocno

   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   
   IF l_cnt > 0 THEN
      LET g_coll_title[1] = cl_getmsg('axm-00941',g_dlang) #當站出貨單     
      LET g_coll_title[2] = cl_getmsg('axm-00942',g_dlang) #出貨單日期  
      LET g_coll_title[3] = cl_getmsg('apm-00052',g_dlang) #客戶編號
      LET g_coll_title[4] = cl_getmsg('axm-00928',g_dlang) #客戶名稱
      LET g_coll_title[5] = cl_getmsg('amm-00366',g_dlang) #業務人員
      LET g_coll_title[6] = cl_getmsg('axm-00929',g_dlang) #全名
      LET g_coll_title[7] = cl_getmsg('amm-00367',g_dlang) #業務部門
      LET g_coll_title[8] = cl_getmsg('axm-00930',g_dlang) #部門名稱 
      LET g_coll_title[9] = cl_getmsg('axm-00931',g_dlang) #多角流程編號
      LET g_coll_title[10] = cl_getmsg('amm-00374',g_dlang) #營運據點 
      LET g_coll_title[11] = cl_getmsg('axm-00932',g_dlang) #營運據點名稱      
   
      DECLARE axmt580_get_icer_cs CURSOR FOR
       SELECT icerent,icersite,icer001,icer002,icer003, 
              icer004,icer005,icer006,icer007,icer008, 
              icer009,icer010,icer011,icer012,icer013, 
              icer014,icer015,icer016,icer017,icer018, 
              icer019,icer020,icer021,icer022,icer023, 
              icer024,icer025,icer026,icer027,icer028
         FROM icer_t  
        WHERE icerent = g_enterprise 
          AND icer001 = p_sessionkey
          AND icer002 = g_user
          AND icer003 = p_xmdkdocno 
        
      FOREACH axmt580_get_icer_cs 
         INTO l_icer.icerent,l_icer.icersite,l_icer.icer001,l_icer.icer002,l_icer.icer003,
              l_icer.icer004,l_icer.icer005,l_icer.icer006,l_icer.icer007,l_icer.icer008,
              l_icer.icer009,l_icer.icer010,l_icer.icer011,l_icer.icer012,l_icer.icer013,
              l_icer.icer014,l_icer.icer015,l_icer.icer016,l_icer.icer017,l_icer.icer018,
              l_icer.icer019,l_icer.icer020,l_icer.icer021,l_icer.icer022,l_icer.icer023,
              l_icer.icer024,l_icer.icer025,l_icer.icer026,l_icer.icer027,l_icer.icer028
        
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = l_icer.icer027
         LET g_errparam.extend = l_icer.icer028
         LET g_errparam.coll_vals[1] = l_icer.icer004
         LET g_errparam.coll_vals[2] = l_icer.icer005
         LET g_errparam.coll_vals[3] = l_icer.icer008
         LET g_errparam.coll_vals[4] = l_icer.icer009
         LET g_errparam.coll_vals[5] = l_icer.icer014
         LET g_errparam.coll_vals[6] = l_icer.icer015
         LET g_errparam.coll_vals[7] = l_icer.icer016
         LET g_errparam.coll_vals[8] = l_icer.icer017
         LET g_errparam.coll_vals[9] = l_icer.icer022
         LET g_errparam.coll_vals[10] = l_icer.icer025
         LET g_errparam.coll_vals[11] = l_icer.icer026
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END FOREACH      
   END IF        
END FUNCTION

################################################################################
# Descriptions...: 判斷是否為多角續拋
# Memo...........: (for axmt540.axmp540使用)
# Usage..........: CALL s_axmt540_continue_chk(p_xmdk044,p_xmdl003)
#                : RETURNING r_chk,r_xmdadocno,r_icab003_final
# Input parameter: p_xmdk044       多角編號
#                : p_xmdl003       來源訂單單號
# Return code....: r_chk           是否為多角續拋(TRUE/FALSE)
#                : r_xmdadocno     最終站訂單單號
#                : r_icab003_final 最終站營運據點
# Date & Author..: 2018/06/20 By 07024 (#171218-00024#8)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_continue_chk(p_xmdk044,p_xmdl003)
   DEFINE p_xmdk044       LIKE xmdk_t.xmdk044
   DEFINE p_xmdl003       LIKE xmdl_t.xmdl003
   DEFINE r_chk           LIKE type_t.num5
   DEFINE r_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE r_icab003_final LIKE icab_t.icab003
   DEFINE l_chk           LIKE type_t.num5
   DEFINE l_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE l_icab003_final LIKE icab_t.icab003
   
   LET r_chk = FALSE
   LET r_xmdadocno = ''
   LET r_icab003_final = ''
     
   CALL s_aic_carry_continue_xmda(g_site,p_xmdk044,'1',p_xmdl003) 
       RETURNING l_chk,l_xmdadocno,l_icab003_final
   IF l_chk THEN
      IF NOT cl_null(l_xmdadocno) THEN
         LET r_chk = TRUE
         LET r_xmdadocno = l_xmdadocno
         LET r_icab003_final = l_icab003_final
      END IF
   END IF

   RETURN r_chk,r_xmdadocno,r_icab003_final
END FUNCTION

################################################################################
# Descriptions...: 多角出貨單提交BPM確認結束後，自動拋轉
# Memo...........: bpm只有確認會走簽核，只有確認自動過帳時，會需要呼叫此FUNCTION
# Usage..........: CALL s_axmt540_ws_postprocess()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2018/10/03 By 10042
# Modify.........: #181002-00013#1 add
################################################################################
PUBLIC FUNCTION s_axmt540_ws_postprocess()
DEFINE l_xmdkdocno     LIKE xmdk_t.xmdkdocno
DEFINE l_success       LIKE type_t.num5
DEFINE l_slip          LIKE ooba_t.ooba002
DEFINE l_xmdkstus      LIKE xmdk_t.xmdkstus
   #181026-00022#2 -S mark  #BPM批簽有多張單據同時拋多角，造成取單號table lock的情況，先mark
   #LET l_xmdkdocno = cl_bpm_get_key_value("xmdkdocno")
   #
   ##單據別參數
   #CALL s_aooi200_get_slip(l_xmdkdocno) RETURNING l_success,l_slip
   #
   #SELECT xmdkstus INTO l_xmdkstus
   #  FROM xmdk_t
   # WHERE xmdkent = g_enterprise
   #   AND xmdkdocno = l_xmdkdocno
   #
   #IF l_xmdkstus = 'S' THEN
   #   #多角自動拋轉
   #   CALL s_axmt540_aic_auto_cast(l_xmdkdocno) RETURNING l_success
   #   IF l_success THEN
   #      LET g_success = TRUE
   #   ELSE
   #      CALL s_transaction_begin()
   #      CALL cl_err_collect_init()
   #      
   #      #取消過帳
   #      CALL s_axmt540_unpost_upd(l_xmdkdocno) RETURNING l_success
   #      IF l_success THEN
   #         #取消確認
   #         CALL s_axmt540_unconf_upd(l_xmdkdocno) RETURNING l_success
   #      END IF
   #      IF l_success THEN
   #         #更新單據狀態碼
   #         UPDATE xmdk_t SET xmdkstus = 'W'
   #          WHERE xmdkent = g_enterprise
   #            AND xmdkdocno = l_xmdkdocno
   #         CALL s_transaction_end('Y','0')
   #         LET g_success = FALSE
   #      ELSE
   #         CALL s_transaction_end('N','0')
   #         LET g_success = TRUE
   #      END IF 
   #   END IF
   #END IF
   #181026-00022#2 -E mark
END FUNCTION

################################################################################
# Descriptions...: 檢查"出貨數量"與"多庫儲批總出貨數量"，是否相同
# Memo...........:
# Usage..........: CALL s_axmt540_xmdl018_chk(p_xmdkdocno,p_xmdlseq,p_xmdl018)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno    單據單號
#                : p_xmdlseq      項次
#                : p_xmdl018      出貨數量
# Return code....: r_success      結果(TRUE/FALSE)
# Date & Author..: 2018/10/18 By 07024 (#181005-00009#5)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_xmdl018_chk(p_xmdkdocno,p_xmdlseq,p_xmdl018)
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdlseq     LIKE xmdl_t.xmdlseq
   DEFINE p_xmdl018     LIKE xmdl_t.xmdl018
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_xmdm009_sum LIKE xmdm_t.xmdm009
   
   LET r_success = TRUE
   
   #取得當筆項次多庫儲總數量
   LET l_xmdm009_sum = 0
   SELECT SUM(xmdm009) INTO l_xmdm009_sum
     FROM xmdm_t
    WHERE xmdment = g_enterprise
      AND xmdmdocno = p_xmdkdocno
      AND xmdmseq = p_xmdlseq 
   
   IF p_xmdl018 <> l_xmdm009_sum THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00196'  #多庫儲批總"出貨數量%1"不可與項次%2"出貨數量%3"不相等！
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = l_xmdm009_sum 
      LET g_errparam.replace[2] = p_xmdlseq 
      LET g_errparam.replace[3] = p_xmdl018
      CALL cl_err()
  
      LET r_success = FALSE
   END IF 

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 出貨總額需與訂單總額一致(D-BAS-0088)='Y'，
#                : 打最後一筆資料時，金額的差額，補再這一筆
# Memo...........: (參考FUN s_axmt540_tax_count寫的，由於FUN s_axmt540_tax_count
#                   是算金額+捕尾差一起寫，所以另寫一個FUN)
# Usage..........: CALL s_axmt540_adjust_last_amt(p_xmdldocno,p_xmdlseq,p_xmdl003,
#                       p_xmdl004,p_xmdl018,p_xmdl027,p_xmdl028,p_xmdl029)
# Input parameter: p_xmdldocno    出貨單單據編號
#                : p_xmdlseq      出貨單項次
#                : p_xmdl003      來源訂單單號
#                : p_xmdl004      來源訂單項次
#                : p_xmdl018      出貨單數量
#                : p_xmdl027      出貨單未稅金額
#                : p_xmdl028      出貨單含稅金額
#                : p_xmdl029      出貨單稅額
# Return code....: 無
# Date & Author..: 2018/10/23 By 07024 (#180808-00012#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_adjust_last_amt(p_xmdldocno,p_xmdlseq,p_xmdl003,p_xmdl004,p_xmdl018,p_xmdl027,p_xmdl028,p_xmdl029)
   DEFINE p_xmdldocno  LIKE xmdl_t.xmdldocno
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq
   DEFINE p_xmdl003    LIKE xmdl_t.xmdl003
   DEFINE p_xmdl004    LIKE xmdl_t.xmdl004
   DEFINE p_xmdl018    LIKE xmdl_t.xmdl018
   DEFINE p_xmdl027    LIKE xmdl_t.xmdl027
   DEFINE p_xmdl028    LIKE xmdl_t.xmdl028
   DEFINE p_xmdl029    LIKE xmdl_t.xmdl029
   DEFINE l_sql        STRING 
   DEFINE l_slip       LIKE ooba_t.ooba002
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_from    RECORD
          xmdc007     LIKE xmdc_t.xmdc007,  #訂單銷售數量
          xrcd103     LIKE xrcd_t.xrcd103,  #原幣未稅金額
          xrcd104     LIKE xrcd_t.xrcd104,  #原幣稅額
          xrcd105     LIKE xrcd_t.xrcd105,  #原幣含稅金額
          xrcd113     LIKE xrcd_t.xrcd113,  #本幣未稅金額
          xrcd114     LIKE xrcd_t.xrcd114,  #本幣稅額
          xrcd115     LIKE xrcd_t.xrcd115,  #本幣含稅金額
          xrcd123     LIKE xrcd_t.xrcd123,  #本位幣二未稅金額
          xrcd124     LIKE xrcd_t.xrcd124,  #本位幣二稅額
          xrcd125     LIKE xrcd_t.xrcd125,  #本位幣二含稅金額
          xrcd133     LIKE xrcd_t.xrcd133,  #本位幣三未稅金額
          xrcd134     LIKE xrcd_t.xrcd134,  #本位幣三稅額
          xrcd135     LIKE xrcd_t.xrcd135   #本位幣三含稅金額
                    END RECORD
   DEFINE l_sum     RECORD
          xmdl018     LIKE xmdl_t.xmdl018,  #數量
          xrcd103     LIKE xrcd_t.xrcd103,  #原幣未稅金額
          xrcd104     LIKE xrcd_t.xrcd104,  #原幣稅額
          xrcd105     LIKE xrcd_t.xrcd105,  #原幣含稅金額
          xrcd113     LIKE xrcd_t.xrcd113,  #本幣未稅金額
          xrcd114     LIKE xrcd_t.xrcd114,  #本幣稅額
          xrcd115     LIKE xrcd_t.xrcd115,  #本幣含稅金額
          xrcd123     LIKE xrcd_t.xrcd123,  #本位幣二未稅金額
          xrcd124     LIKE xrcd_t.xrcd124,  #本位幣二稅額
          xrcd125     LIKE xrcd_t.xrcd125,  #本位幣二含稅金額
          xrcd133     LIKE xrcd_t.xrcd133,  #本位幣三未稅金額
          xrcd134     LIKE xrcd_t.xrcd134,  #本位幣三稅額
          xrcd135     LIKE xrcd_t.xrcd135   #本位幣三含稅金額
                    END RECORD
   #190604-00053#1 add start -----
   DEFINE l_sum_2   RECORD
          xmdl018     LIKE xmdl_t.xmdl018,  #數量
          xrcd103     LIKE xrcd_t.xrcd103,  #原幣未稅金額
          xrcd104     LIKE xrcd_t.xrcd104,  #原幣稅額
          xrcd105     LIKE xrcd_t.xrcd105,  #原幣含稅金額
          xrcd113     LIKE xrcd_t.xrcd113,  #本幣未稅金額
          xrcd114     LIKE xrcd_t.xrcd114,  #本幣稅額
          xrcd115     LIKE xrcd_t.xrcd115,  #本幣含稅金額
          xrcd123     LIKE xrcd_t.xrcd123,  #本位幣二未稅金額
          xrcd124     LIKE xrcd_t.xrcd124,  #本位幣二稅額
          xrcd125     LIKE xrcd_t.xrcd125,  #本位幣二含稅金額
          xrcd133     LIKE xrcd_t.xrcd133,  #本位幣三未稅金額
          xrcd134     LIKE xrcd_t.xrcd134,  #本位幣三稅額
          xrcd135     LIKE xrcd_t.xrcd135   #本位幣三含稅金額
                    END RECORD
   #190604-00053#1 add end   -----                    
   DEFINE l_qpa       LIKE xmdl_t.xmdl034   #QPA  #181030-00017#2 add
   
   WHENEVER ERROR CONTINUE

   IF cl_null(p_xmdl003) OR cl_null(p_xmdl004) THEN
      RETURN
   END IF
   
   #取得訂單項次總金額
   LET l_sql = "SELECT SUM(xmdc007),",
               "       SUM(xrcd103),SUM(xrcd104),SUM(xrcd105),",
               "       SUM(xrcd113),SUM(xrcd114),SUM(xrcd115),",
               "       SUM(xrcd123),SUM(xrcd124),SUM(xrcd125),",
               "       SUM(xrcd133),SUM(xrcd134),SUM(xrcd135)",
               "  FROM xmdc_t,xrcd_t",
               " WHERE xmdcent = xrcdent     AND xrcdent = ",g_enterprise,
               "   AND xmdcdocno = xrcddocno AND xrcddocno = ?",
               "   AND xmdcseq = xrcdseq     AND xrcdseq = ?",
               "   AND xrcdseq2 = 0 "
   PREPARE s_axmt540_adjust_amt01 FROM l_sql
   
   #取得出貨單總金額(來源訂單+來源項次)
   LET l_sql = "SELECT SUM(xmdl018),",
               "       SUM(xrcd103),SUM(xrcd104),SUM(xrcd105),",
               "       SUM(xrcd113),SUM(xrcd114),SUM(xrcd115),",
               "       SUM(xrcd123),SUM(xrcd124),SUM(xrcd125),",
               "       SUM(xrcd133),SUM(xrcd134),SUM(xrcd135)",
               "  FROM xmdk_t a,xmdl_t,xrcd_t",
               " WHERE a.xmdkent = xmdlent AND xmdlent = xrcdent AND xrcdent = ",g_enterprise,
               "   AND a.xmdkdocno = xmdldocno AND xmdldocno = xrcddocno",
               "   AND xmdlseq = xrcdseq AND xrcdseq2 = 0",
               "   AND a.xmdk000 = (SELECT c.xmdk000 FROM xmdk_t c",
               "                                    WHERE c.xmdkent = ",g_enterprise,
               "                                      AND c.xmdkdocno = '",p_xmdldocno,"')",
               "   AND a.xmdkstus <> 'X'",
               "   AND xmdl003 = ? ",
               "   AND xmdl004 = ? ",
               "   AND NOT (a.xmdk045 = '3' AND EXISTS (SELECT 1",
               "                                          FROM xmdk_t b",
               "                                         WHERE b.xmdkent = a.xmdkent",
               "                                           AND b.xmdkdocno = a.xmdk035",
               "                                           AND b.xmdkstus <> 'X'))",    #排除統銷統收之初始站出貨單
               " AND NOT (xmdldocno = '",p_xmdldocno,"' AND xmdlseq = '",p_xmdlseq,"')" #排除該單身舊資料
   PREPARE s_axmt540_adjust_amt02 FROM l_sql
   
   #190604-00053#1 add start ------
   #取得銷退單總金額(來源訂單+來源項次)
   LET l_sql = "SELECT SUM(xmdl018),",
               "       SUM(xrcd103),SUM(xrcd104),SUM(xrcd105),",
               "       SUM(xrcd113),SUM(xrcd114),SUM(xrcd115),",
               "       SUM(xrcd123),SUM(xrcd124),SUM(xrcd125),",
               "       SUM(xrcd133),SUM(xrcd134),SUM(xrcd135)",
               "  FROM xmdk_t a,xmdl_t,xrcd_t",
               " WHERE a.xmdkent = xmdlent AND xmdlent = xrcdent AND xrcdent = ",g_enterprise,
               "   AND a.xmdkdocno = xmdldocno AND xmdldocno = xrcddocno",
               "   AND xmdlseq = xrcdseq AND xrcdseq2 = 0",
               "   AND a.xmdk000 = '6' AND xmdk082 = '2' ", 
               "   AND a.xmdkstus = 'S'",
               "   AND xmdl003 = ? ",
               "   AND xmdl004 = ? "
   PREPARE s_axmt540_adjust_amt03 FROM l_sql
   #190604-00053#1 add end   ------   
   
   #取得單別
   CALL s_aooi200_get_slip(p_xmdl003) RETURNING l_success,l_slip
   #出貨總額需與訂單總額一致
   IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0088') = 'Y' THEN
      #取得訂單項次總金額
      INITIALIZE l_from.* TO NULL
      EXECUTE s_axmt540_adjust_amt01 USING p_xmdl003,p_xmdl004     
                                      INTO l_from.xmdc007,
                                           l_from.xrcd103,l_from.xrcd104,l_from.xrcd105,
                                           l_from.xrcd113,l_from.xrcd114,l_from.xrcd115,
                                           l_from.xrcd123,l_from.xrcd124,l_from.xrcd125,
                                           l_from.xrcd133,l_from.xrcd134,l_from.xrcd135
      #取得出貨單總金額(來源訂單+來源項次)      
      INITIALIZE l_sum.* TO NULL
      EXECUTE s_axmt540_adjust_amt02 USING p_xmdl003,p_xmdl004
                                      INTO l_sum.xmdl018,
                                           l_sum.xrcd103,l_sum.xrcd104,l_sum.xrcd105,
                                           l_sum.xrcd113,l_sum.xrcd114,l_sum.xrcd115,
                                           l_sum.xrcd123,l_sum.xrcd124,l_sum.xrcd125,
                                           l_sum.xrcd133,l_sum.xrcd134,l_sum.xrcd135
      IF cl_null(l_sum.xmdl018) THEN LET l_sum.xmdl018 = 0 END IF
      IF cl_null(l_sum.xrcd103) THEN LET l_sum.xrcd103 = 0 END IF
      IF cl_null(l_sum.xrcd104) THEN LET l_sum.xrcd104 = 0 END IF
      IF cl_null(l_sum.xrcd105) THEN LET l_sum.xrcd105 = 0 END IF
      IF cl_null(l_sum.xrcd113) THEN LET l_sum.xrcd113 = 0 END IF
      IF cl_null(l_sum.xrcd114) THEN LET l_sum.xrcd114 = 0 END IF
      IF cl_null(l_sum.xrcd115) THEN LET l_sum.xrcd115 = 0 END IF
      IF cl_null(l_sum.xrcd123) THEN LET l_sum.xrcd123 = 0 END IF
      IF cl_null(l_sum.xrcd124) THEN LET l_sum.xrcd124 = 0 END IF
      IF cl_null(l_sum.xrcd125) THEN LET l_sum.xrcd125 = 0 END IF
      IF cl_null(l_sum.xrcd133) THEN LET l_sum.xrcd133 = 0 END IF
      IF cl_null(l_sum.xrcd134) THEN LET l_sum.xrcd134 = 0 END IF
      IF cl_null(l_sum.xrcd135) THEN LET l_sum.xrcd135 = 0 END IF
      
      #190604-00053#1 add start ------
      #取得銷退單總金額(來源訂單+來源項次)
      INITIALIZE l_sum_2.* TO NULL
      EXECUTE s_axmt540_adjust_amt03 USING p_xmdl003,p_xmdl004
                                      INTO l_sum_2.xmdl018,
                                           l_sum_2.xrcd103,l_sum_2.xrcd104,l_sum_2.xrcd105,
                                           l_sum_2.xrcd113,l_sum_2.xrcd114,l_sum_2.xrcd115,
                                           l_sum_2.xrcd123,l_sum_2.xrcd124,l_sum_2.xrcd125,
                                           l_sum_2.xrcd133,l_sum_2.xrcd134,l_sum_2.xrcd135

      IF cl_null(l_sum_2.xmdl018) THEN LET l_sum_2.xmdl018 = 0 END IF
      IF cl_null(l_sum_2.xrcd103) THEN LET l_sum_2.xrcd103 = 0 END IF
      IF cl_null(l_sum_2.xrcd104) THEN LET l_sum_2.xrcd104 = 0 END IF
      IF cl_null(l_sum_2.xrcd105) THEN LET l_sum_2.xrcd105 = 0 END IF
      IF cl_null(l_sum_2.xrcd113) THEN LET l_sum_2.xrcd113 = 0 END IF
      IF cl_null(l_sum_2.xrcd114) THEN LET l_sum_2.xrcd114 = 0 END IF
      IF cl_null(l_sum_2.xrcd115) THEN LET l_sum_2.xrcd115 = 0 END IF
      IF cl_null(l_sum_2.xrcd123) THEN LET l_sum_2.xrcd123 = 0 END IF
      IF cl_null(l_sum_2.xrcd124) THEN LET l_sum_2.xrcd124 = 0 END IF
      IF cl_null(l_sum_2.xrcd125) THEN LET l_sum_2.xrcd125 = 0 END IF
      IF cl_null(l_sum_2.xrcd133) THEN LET l_sum_2.xrcd133 = 0 END IF
      IF cl_null(l_sum_2.xrcd134) THEN LET l_sum_2.xrcd134 = 0 END IF
      IF cl_null(l_sum_2.xrcd135) THEN LET l_sum_2.xrcd135 = 0 END IF
      #190604-00053#1 add end   ------      
      
      #IF l_from.xmdc007 = l_sum.xmdl018 + p_xmdl018 THEN     #全數出貨  #181030-00017#2 mark
      
      #181030-00017#2 -S add
      #計算訂單項次已出貨數量之最小套數
      CALL s_axmt500_count_min_xmdd014(p_xmdl003,p_xmdl004,'2',g_site,'2') RETURNING l_sum.xmdl018,l_success
      
      #出貨數量應該要除以QPA，變成套數
      SELECT xmdl034
        INTO l_qpa
        FROM xmdl_t
       WHERE xmdlent = g_enterprise
         AND xmdldocno = p_xmdldocno
         AND xmdlseq = p_xmdlseq
      
      #全數出貨
      IF l_from.xmdc007 = l_sum.xmdl018 + (p_xmdl018 / l_qpa) THEN
      #181030-00017#2 -E add
      
         #IF p_xmdl028 <> l_from.xrcd105 - l_sum.xrcd105 THEN  #出貨含稅金額<訂單含稅金額，將尾差補上               #200910-00010#1 mark
         IF (p_xmdl028 <> l_from.xrcd105 - l_sum.xrcd105) OR (p_xmdl027 <> l_from.xrcd103 - l_sum.xrcd103) THEN  #200910-00010#1 add
            UPDATE xrcd_t
               #190604-00053#1 mark start -----
               #SET xrcd103 = l_from.xrcd103 - l_sum.xrcd103, #未稅金額
               #    xrcd104 = l_from.xrcd104 - l_sum.xrcd104, #稅額
               #    xrcd105 = l_from.xrcd105 - l_sum.xrcd105, #含稅金額
               #    xrcd113 = l_from.xrcd113 - l_sum.xrcd113, #本幣未稅
               #    xrcd114 = l_from.xrcd114 - l_sum.xrcd114, #本幣稅額
               #    xrcd115 = l_from.xrcd115 - l_sum.xrcd115, #本幣含稅金額
               #    xrcd123 = l_from.xrcd123 - l_sum.xrcd123, #本位幣二未稅金額
               #    xrcd124 = l_from.xrcd124 - l_sum.xrcd124, #本位幣二稅額
               #    xrcd125 = l_from.xrcd125 - l_sum.xrcd125, #本位幣二含稅金額
               #    xrcd133 = l_from.xrcd133 - l_sum.xrcd133, #本位幣三未稅金額
               #    xrcd134 = l_from.xrcd134 - l_sum.xrcd134, #本位幣三稅額
               #    xrcd135 = l_from.xrcd135 - l_sum.xrcd135  #本位幣三含稅金額
               #190604-00053#1 mark end   -----
               #190604-00053#1 add start -----
               SET xrcd103 = l_from.xrcd103 - l_sum.xrcd103 + l_sum_2.xrcd103, #未稅金額
                   xrcd104 = l_from.xrcd104 - l_sum.xrcd104 + l_sum_2.xrcd104, #稅額
                   xrcd105 = l_from.xrcd105 - l_sum.xrcd105 + l_sum_2.xrcd105, #含稅金額
                   xrcd113 = l_from.xrcd113 - l_sum.xrcd113 + l_sum_2.xrcd113, #本幣未稅
                   xrcd114 = l_from.xrcd114 - l_sum.xrcd114 + l_sum_2.xrcd114, #本幣稅額
                   xrcd115 = l_from.xrcd115 - l_sum.xrcd115 + l_sum_2.xrcd115, #本幣含稅金額
                   xrcd123 = l_from.xrcd123 - l_sum.xrcd123 + l_sum_2.xrcd123, #本位幣二未稅金額
                   xrcd124 = l_from.xrcd124 - l_sum.xrcd124 + l_sum_2.xrcd124, #本位幣二稅額
                   xrcd125 = l_from.xrcd125 - l_sum.xrcd125 + l_sum_2.xrcd125, #本位幣二含稅金額
                   xrcd133 = l_from.xrcd133 - l_sum.xrcd133 + l_sum_2.xrcd133, #本位幣三未稅金額
                   xrcd134 = l_from.xrcd134 - l_sum.xrcd134 + l_sum_2.xrcd134, #本位幣三稅額
                   xrcd135 = l_from.xrcd135 - l_sum.xrcd135 + l_sum_2.xrcd135  #本位幣三含稅金額
               #190604-00053#1 add end   -----
             WHERE xrcdent = g_enterprise
               AND xrcddocno = p_xmdldocno
               AND xrcdseq = p_xmdlseq
               AND xrcdseq2 = 0
            #181030-00017#2 -S add
            UPDATE xmdl_t 
               #190604-00053#1 mark start -----
               #SET xmdl027 = l_from.xrcd103 - l_sum.xrcd103, #未稅金額
               #    xmdl028 = l_from.xrcd105 - l_sum.xrcd105, #含稅金額
               #    xmdl029 = l_from.xrcd104 - l_sum.xrcd104  #稅額
               #190604-00053#1 mark end   -----
               #190604-00053#1 add start -----
               SET xmdl027 = l_from.xrcd103 - l_sum.xrcd103 + l_sum_2.xrcd103, #未稅金額
                   xmdl028 = l_from.xrcd105 - l_sum.xrcd105 + l_sum_2.xrcd105, #含稅金額
                   xmdl029 = l_from.xrcd104 - l_sum.xrcd104 + l_sum_2.xrcd104  #稅額
               #190604-00053#1 add end   -----
             WHERE xmdlent = g_enterprise
               AND xmdldocno = p_xmdldocno
               AND xmdlseq = p_xmdlseq
            #181030-00017#2 -E add
         END IF
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 調整交易單據，於確認檢查時，判斷"不使用"計價單位，且計價單位與計價數量與交易單位、交易數量不符者
#                  1.更新計價單位、計價數量=交易單位、交易數量
#                  2.重計該筆單身未稅金額、稅額、含稅金額
#                  3.重計單頭總未稅金額、總稅額、總含稅金額
#                  4.進行單身尾差處理    
# Memo...........:
# Usage..........: CALL s_axmt540_conf_pricing_unit(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        單據編號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2019/07/10 By 12133(#190705-00045#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_conf_pricing_unit(p_docno)
   DEFINE  p_docno   LIKE xmdk_t.xmdkdocno
   DEFINE  r_success LIKE type_t.num5
   DEFINE  l_sql     STRING
   DEFINE  l_xmdl017 LIKE xmdl_t.xmdl017
   DEFINE  l_xmdl018 LIKE xmdl_t.xmdl018
   DEFINE  l_xmdl021 LIKE xmdl_t.xmdl021
   DEFINE  l_xmdl027 LIKE xmdl_t.xmdl027
   DEFINE  l_xmdl028 LIKE xmdl_t.xmdl028
   DEFINE  l_xmdl029 LIKE xmdl_t.xmdl029
   DEFINE  l_xmdk016 LIKE xmdk_t.xmdk016
   DEFINE  l_xmdlseq LIKE xmdl_t.xmdlseq
   DEFINE  l_amt     LIKE xmdl_t.xmdl022  #lxmdl022*xmdl024
   DEFINE  l_xmdl022 LIKE xmdl_t.xmdl022
   DEFINE  l_xmdl024 LIKE xmdl_t.xmdl024
   DEFINE  l_xmdl025 LIKE xmdl_t.xmdl025
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0007') = "Y" THEN
      RETURN r_success
   END IF

   #傳入單據編號為空;請指定單據編號!
   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET l_sql = "SELECT xmdl017,xmdl018,xmdl021,xmdk016,xmdlseq,xmdl024,xmdl022,xmdl025 ",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
               "   AND xmdkent = ",g_enterprise,
               "   AND xmdkdocno = '",p_docno,"'",
               "   AND (xmdl021 <> xmdl017  OR xmdl022 <> xmdl018)"
   PREPARE s_axmt540_conf_pricing_unit_pre FROM l_sql
   DECLARE s_axmt540_conf_pricing_unit_cur CURSOR FOR s_axmt540_conf_pricing_unit_pre
   
   LET l_xmdl027 = 0
   LET l_xmdl028 = 0
   LET l_xmdl029 = 0
   
   FOREACH s_axmt540_conf_pricing_unit_cur INTO l_xmdl017,l_xmdl018,l_xmdl021,l_xmdk016,l_xmdlseq,l_xmdl024,l_xmdl022,l_xmdl025
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_axmt540_conf_pricing_unit_cur"
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      #計價單位=出貨單位，計價數量=出貨數量
      LET l_xmdl021 = l_xmdl017
      LET l_xmdl022 = l_xmdl018
      LET l_amt = l_xmdl022*l_xmdl024
      
      #取得此筆資料的 未稅金額/含稅金額/稅額，並將資料重新寫入xrcd
      CALL s_axmt540_get_amount(p_docno,l_xmdk016,l_xmdlseq,l_amt,l_xmdl022,l_xmdl025)
          RETURNING l_xmdl027,l_xmdl028,l_xmdl029
      #更新未稅金額/含稅金額/稅額
      UPDATE xmdl_t SET xmdl027 = l_xmdl027,
                        xmdl028 = l_xmdl028,
                        xmdl029 = l_xmdl029,
                        xmdl021 = l_xmdl021,
                        xmdl022 = l_xmdl022
       WHERE xmdlent = g_enterprise 
         AND xmdldocno = p_docno AND xmdlseq = l_xmdlseq
      IF SQLCA.sqlcode THEN 
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd xmdl_t；err xmdlseq:",l_xmdlseq
         LET g_errparam.popup = TRUE
         CALL cl_err()
    
         LET r_success = FALSE
         EXIT FOREACH
      END IF
   END FOREACH 
   
   IF s_axmt540_chk_xmdl025(p_docno) THEN
      #為單一稅，計算單頭總額、單身尾差調整
      IF NOT s_axmt540_tax_recount(p_docno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 產生對應的QC單並拋轉sQMS
# Memo...........:
# Usage..........: CALL s_axmt540_crt_sqms(p_xmdkdocno,p_xmdkdocdt)
# Input parameter: p_xmdkdocno    單號
#                : p_xmdkdocdt    日期
# Date & Author..: 2019/09/05 By 10042
# Modify.........: 190702-00010#16 add
################################################################################
PUBLIC FUNCTION s_axmt540_crt_sqms(p_xmdkdocno,p_xmdkdocdt)
DEFINE p_xmdkdocno    LIKE xmdk_t.xmdkdocno
DEFINE p_xmdkdocdt    LIKE xmdk_t.xmdkdocdt
DEFINE l_cnt          LIKE type_t.num5
DEFINE l_success      LIKE type_t.num5
DEFINE l_start_no     LIKE qcba_t.qcbadocno
DEFINE l_end_no       LIKE qcba_t.qcbadocno
DEFINE l_oobn003      LIKE oobn_t.oobn003
DEFINE l_slip         LIKE ooba_t.ooba002

   IF NOT s_aqct300_is_sqms() THEN
      RETURN
   END IF
   
   #判斷是否有出通單,若有出通單則判斷出通單檢驗時機設定,若無出通單則進行出貨單OQC
   CALL s_aooi200_get_slip(p_xmdkdocno) RETURNING l_success,l_slip
   #檢查是否有OQC
   LET l_cnt = 0
   IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0062') = 'N' THEN   #出貨單與出通單勾稽
      SELECT COUNT(1)
        INTO l_cnt
        FROM xmdl_t
       WHERE xmdlent = g_enterprise
         AND xmdldocno = p_xmdkdocno
         AND xmdl023 = 'Y'
   ELSE          
      SELECT COUNT(1)
        INTO l_cnt
        FROM xmdl_t,
             (SELECT (CASE ecom0008 WHEN '1' THEN 
                     (CASE ecom0002 WHEN 'Y' THEN ecom0003+1 ELSE ecom0003 END)+1 ELSE 1 END) cnt,ecom0001
                FROM ( SELECT TO_NUMBER((SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0001')) ecom0001,
                             (SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0002') ecom0002,
                             TO_NUMBER((SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0003')) ecom0003,
                             (SELECT ooaa002 FROM ooaa_t WHERE ooaaent=g_enterprise AND ooaa001 = 'E-COM-0008') ecom0008
                        FROM dual)) 
       WHERE xmdlent = g_enterprise
         AND xmdldocno = p_xmdkdocno
         AND xmdl023 = 'Y'
         AND (SUBSTR(xmdl001,cnt,ecom0001) IN (SELECT ooac002 
                                       FROM ooac_t 
                                      WHERE ooacent = g_enterprise
                                        AND ooac001 = (SELECT ooef004 FROM ooef_t WHERE ooefent=g_enterprise AND ooef001=g_site) 
                                        AND ooac003 ='D-BAS-0094'     #OQC檢驗時機為"2.出貨時檢驗"
                                        AND ooac004= '2')
          OR xmdl001 IS NULL)  
      #PGS(D)-07556-add-s
      #PGS(D)-07556-add-e                                       
   END IF
   
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   
   IF l_cnt > 0 THEN
      CALL s_aooi210_get_doc(g_site,'','2',p_xmdkdocno,'aqct300','') RETURNING l_success,l_oobn003
      IF l_success THEN
         CALL s_aqct300_gen_for_sqms('10',p_xmdkdocno,'',l_oobn003,p_xmdkdocdt) RETURNING l_success,l_start_no,l_end_no
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 复制当前调拨出货的入库的制造批序号资料
# Memo...........:
# Usage..........: s_axmt540_inao_copy_4(p_inaodocno,p_inaoseq,p_inaoseq1,p_inao005)
#                  RETURNING 回传参数
# Input parameter: p_inaodocno  单据编号
#                : p_inaoseq    项次
#                : p_inaoseq1   项序
#                : p_inao005    库位
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20200224 By 01996
# Modify.........: 200221-00005#1 add
################################################################################
PUBLIC FUNCTION s_axmt540_inao_copy_4(p_inaodocno,p_inaoseq,p_inaoseq1,p_inao005)
DEFINE r_success    LIKE type_t.num5
DEFINE l_sql        STRING
DEFINE l_inao       RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企業編號
       inaosite LIKE inao_t.inaosite, #營運據點
       inaodocno LIKE inao_t.inaodocno, #單號
       inaoseq LIKE inao_t.inaoseq, #項次
       inaoseq1 LIKE inao_t.inaoseq1, #項序
       inaoseq2 LIKE inao_t.inaoseq2, #序號
       inao000 LIKE inao_t.inao000, #資料類型
       inao001 LIKE inao_t.inao001, #料件編號
       inao002 LIKE inao_t.inao002, #產品特徵
       inao003 LIKE inao_t.inao003, #庫存管理特徵
       inao004 LIKE inao_t.inao004, #包裝容器編號
       inao005 LIKE inao_t.inao005, #庫位
       inao006 LIKE inao_t.inao006, #儲位
       inao007 LIKE inao_t.inao007, #批號
       inao008 LIKE inao_t.inao008, #製造批號
       inao009 LIKE inao_t.inao009, #製造序號
       inao010 LIKE inao_t.inao010, #製造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #數量
       inao013 LIKE inao_t.inao013, #出入庫碼
       inao014 LIKE inao_t.inao014, #庫存單位
       inao020 LIKE inao_t.inao020, #檢驗合格量
       inao021 LIKE inao_t.inao021, #已入庫/出貨/簽收量
       inao022 LIKE inao_t.inao022, #已驗退/簽退量
       inao023 LIKE inao_t.inao023, #已倉退/銷退量
       inao024 LIKE inao_t.inao024, #已轉QC量
       inao025 LIKE inao_t.inao025
                   END RECORD
DEFINE p_inaodocno  LIKE inao_t.inaodocno
DEFINE p_inaoseq    LIKE inao_t.inaoseq
DEFINE p_inaoseq1   LIKE inao_t.inaoseq1
DEFINE p_inao005    LIKE inao_t.inao005
DEFINE l_cnt        LIKE type_t.num5

   LET r_success = TRUE
   LET l_cnt = 0
   LET l_sql = " SELECT COUNT(inaodocno)  FROM inao_t ",
               " WHERE inaoent = ",g_enterprise, 
               "   AND inaosite = '",g_site,"'",
               "   AND inaodocno = '",p_inaodocno,"'",
               "   AND inao000 = '2' ",              
               "   AND inao013 = '-1' ",
               "   AND inaoseq = ",p_inaoseq,
               "   AND inaoseq1 = ",p_inaoseq1

   PREPARE s_inao_copy_4_prep FROM l_sql
   EXECUTE s_inao_copy_4_prep INTO l_cnt  
   IF l_cnt > 0 THEN
      LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                        inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                        inao020,inao021,inao022,inao023,inao024,inao025 
                   FROM inao_t ",
               "  WHERE inaoent = '",g_enterprise,"'",
               "    AND inaosite = '",g_site,"'",
               "    AND inaodocno = '",p_inaodocno,"'",
               "    AND inaoseq = ",p_inaoseq,
               "    AND inaoseq1 = ",p_inaoseq1,
               "    AND inao000 = '2' ",
               "    AND inao013 = '-1'"   
      PREPARE s_inao_copy_4_prep2 FROM l_sql
      DECLARE s_inao_copy_4_curs2 CURSOR FOR s_inao_copy_4_prep2
      FOREACH s_inao_copy_4_curs2 INTO l_inao.inaoent,l_inao.inaosite,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,
                                    l_inao.inaoseq2,l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,
                                    l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                                    l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                                    l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,
                                    l_inao.inao024,l_inao.inao025 
         LET l_inao.inao013 = '1'
         LET l_inao.inao005 = p_inao005
         LET l_inao.inao006 = ' '
         INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,
                       inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,
                       inao020,inao021,inao022,inao023,inao024)
               VALUES (g_enterprise,g_site,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,l_inao.inaoseq2,
                       l_inao.inao000,l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,
                       l_inao.inao007,l_inao.inao008,l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,
                       l_inao.inao014,l_inao.inao020,l_inao.inao021,l_inao.inao022,l_inao.inao023,l_inao.inao024)
         IF SQLCA.sqlcode THEN  
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ins inao_t'
            LET g_errparam.extend = ""
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH 
         END IF   
      END FOREACH                                    
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_axmt540_statechange_transfer(p_xmdkdocno,p_type)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   出货单号
#                : 传入参数变量2   类型（1:审核   2:取消审核   3:过账    4:过账还原)
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20/07/02  By 00902
# Modify.........: 200521-00022#3
################################################################################
PUBLIC FUNCTION s_axmt540_statechange_transfer(p_xmdkdocno,p_type)
DEFINE p_xmdkdocno      LIKE xmdk_t.xmdkdocno
DEFINE p_type           LIKE type_t.chr1
DEFINE r_success        LIKE type_t.num5 
DEFINE l_datetime       DATETIME YEAR TO SECOND


   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_xmdkdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'  #傳入的單據編號為空！
      LET g_errparam.extend = p_xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET l_datetime = cl_get_current()
   
   CASE p_type
        WHEN '1'
        IF cl_ask_confirm('aim-00108') THEN
          UPDATE xmdk_t
             SET xmdkstus = 'Y',
                 xmdkcnfid = g_user,
                 xmdkcnfdt = l_datetime
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = p_xmdkdocno
        ELSE
           LET r_success = FALSE 
           RETURN r_success
        END IF
             
        WHEN '2'
        IF cl_ask_confirm('aim-00110') THEN
          UPDATE xmdk_t
             SET xmdkstus = 'N',
                 xmdkcnfid = '',
                 xmdkcnfdt = ''
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = p_xmdkdocno
        ELSE
           LET r_success = FALSE 
           RETURN r_success
        END IF
             
         WHEN '3'
         IF cl_ask_confirm('sub-00360') THEN
           UPDATE xmdk_t
             SET xmdkstus = 'S',
                 xmdkpstid = g_user,
                 xmdkpstdt = l_datetime
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = p_xmdkdocno
         ELSE
           LET r_success = FALSE 
           RETURN r_success
         END IF
             
         WHEN '4'
         IF cl_ask_confirm('sub-00361') THEN
           UPDATE xmdk_t
             SET xmdkstus = 'Y',
                 xmdkpstid = '',
                 xmdkpstdt = ''
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = p_xmdkdocno
         ELSE
           LET r_success = FALSE 
           RETURN r_success
         END IF
   END CASE 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "UPDATE:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
   END IF
   
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: bpm送簽失敗時，進行在揀資料刪除還原
# Memo...........:
# Usage..........: CALL s_axmt540_ws_breakprocess(p_xmdkdocno)
#                  RETURNING r_success
# Input parameter: p_xmdkdocno   單據編號
# Return code....: r_success     TRUE/FALSE
# Date & Author..: #201209-00028#9 2020/12/17 By 12133
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axmt540_ws_breakprocess(p_xmdkdocno)
DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #在揀量更新
   CALL s_axmt540_ins_inap(p_xmdkdocno,'-1','uncon') RETURNING r_success
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 软备置审核/取消审核时产生具体库储批的备置资料
# Memo...........:
# Usage..........: CALL s_axmt540_prepare_recount(p_type,p_site,p_xmdm001,p_xmdm002,p_xmdm033,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm008,p_xmdm034)
#                  RETURNING r_success
# Date & Author..: 2021-3-29 By 05423
# Modify.........: #210324-00031#1 add
################################################################################
PUBLIC FUNCTION s_axmt540_prepare_recount(p_type,p_site,p_xmdm001,p_xmdm002,p_xmdm033,p_xmdm005,p_xmdm006,p_xmdm007,p_xmdm008,p_xmdm034)
DEFINE p_type           LIKE type_t.chr2     #异动类型：1.审核  2.取消审核
DEFINE p_site           LIKE xmdm_t.xmdmsite
DEFINE p_xmdm001        LIKE xmdm_t.xmdm001  #料号
DEFINE p_xmdm002        LIKE xmdm_t.xmdm002  #产品特征
DEFINE p_xmdm033        LIKE xmdm_t.xmdm033  #库存管理特征
DEFINE p_xmdm005        LIKE xmdm_t.xmdm005  #库位
DEFINE p_xmdm006        LIKE xmdm_t.xmdm006  #储位
DEFINE p_xmdm007        LIKE xmdm_t.xmdm007  #批号
DEFINE p_xmdm008        LIKE xmdm_t.xmdm008  #交易单位
DEFINE p_xmdm034        LIKE xmdm_t.xmdm034  #备置数量
DEFINE r_success        LIKE type_t.num5
DEFINE l_imaf058        LIKE imaf_t.imaf058  #存货备置策略
DEFINE l_sql            STRING
DEFINE l_unit           LIKE xmdm_t.xmdm008
DEFINE l_qty            LIKE xmdm_t.xmdm009
DEFINE l_cnt            LIKE type_t.num10
DEFINE l_inan RECORD  #库存在拣量统计档
       inanent LIKE inan_t.inanent, #企业编号
       inansite LIKE inan_t.inansite, #营运据点
       inan000 LIKE inan_t.inan000, #库存类型
       inan001 LIKE inan_t.inan001, #料件编号
       inan002 LIKE inan_t.inan002, #产品特征
       inan003 LIKE inan_t.inan003, #库存管理特征
       inan004 LIKE inan_t.inan004, #库位编号
       inan005 LIKE inan_t.inan005, #储位编号
       inan006 LIKE inan_t.inan006, #批号
       inan007 LIKE inan_t.inan007, #库存单位
       inan010 LIKE inan_t.inan010  #在拣量
END RECORD

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
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
   IF cl_null(p_xmdm001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_xmdm008) THEN
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
   IF p_type <> '1' AND p_type <> '-1' THEN
      RETURN r_success
   END IF
   
   IF cl_null(p_xmdm002) THEN LET p_xmdm002 = ' ' END IF #产品特征
   IF cl_null(p_xmdm033) THEN LET p_xmdm033 = ' ' END IF #库存管理特征
   IF cl_null(p_xmdm005) THEN LET p_xmdm005 = ' ' END IF #库位
   IF cl_null(p_xmdm006) THEN LET p_xmdm006 = ' ' END IF #储位
   IF cl_null(p_xmdm007) THEN LET p_xmdm007 = ' ' END IF
   IF cl_null(p_site) THEN LET p_site = g_site END IF
#160927-00024#1-s
   #依據傳入料號檢核料件進銷存據點檔的存貨備置策略
   #若不為'1.軟備置'或'2.硬備置'則不須往下執行
   LET l_imaf058 = ''
   SELECT imaf058 INTO l_imaf058
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = p_site
      AND imaf001 = p_xmdm001
   #需求等候模式
   IF l_imaf058 <> '1' THEN
      RETURN r_success
   END IF
   LET l_inan.inanent = g_enterprise
   LET l_inan.inansite = g_site
   LET l_inan.inan000 = '2'
   LET l_inan.inan001 = p_xmdm001
   LET l_inan.inan002 = p_xmdm002  
   LET l_inan.inan003 = p_xmdm033
   LET l_inan.inan004 = p_xmdm005
   LET l_inan.inan005 = p_xmdm006
   LET l_inan.inan006 = p_xmdm007
   
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   CALL s_inventory_unit(p_site,p_xmdm001,p_xmdm008,p_xmdm034,p_site)
        RETURNING r_success,l_unit,l_qty
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   CASE 
      WHEN p_type = '1'
         #增加
         LET l_qty = l_qty
      WHEN p_type = '-1'
         #減少
         LET l_qty = - l_qty
      OTHERWISE EXIT CASE
   END CASE
   
   LET l_sql = " SELECT COUNT(1) FROM inan_t ",
               "  WHERE inanent  = ",g_enterprise,
               "    AND inansite = '",p_site,"' ",
               "    AND inan000  = '",l_inan.inan000,"' ",
               "    AND inan001  = '",l_inan.inan001,"' ",
               "    AND inan002  = '",l_inan.inan002,"' ",
               "    AND inan003  = '",l_inan.inan003,"' ",
               "    AND inan004  = ? ",
               "    AND inan005  = ? ",
               "    AND inan006  = ? ",
               "    AND inan007  = '",l_unit,"' "
   PREPARE s_axmt540_prepare_recount_count_pre FROM l_sql
   
   LET l_sql = " INSERT INTO inan_t ",
               " (inanent,inansite,inan000,inan001,inan002,inan003, ",
               "  inan004,inan005 ,inan006,inan007,inan010) ",
               " values(?,?,?,?,?, ?,?,?,?,?, ?) "
   PREPARE s_axmt540_prepare_recount_insert_pre FROM l_sql
   
   LET l_sql = " UPDATE inan_t SET inan010 = inan010 + ? ",
               "  WHERE inanent  = ",g_enterprise,
               "    AND inansite = '",p_site,"' ",
               "    AND inan000  = '",l_inan.inan000,"' ",
               "    AND inan001  = '",l_inan.inan001,"' ",
               "    AND inan002  = '",l_inan.inan002,"' ",
               "    AND inan003  = '",l_inan.inan003,"' ",
               "    AND inan004  = ? ",
               "    AND inan005  = ? ",
               "    AND inan006  = ? ",
               "    AND inan007  = '",l_unit,"' "
   PREPARE s_axmt540_prepare_recount_update_pre FROM l_sql
   #软备置，库储批皆为空的已经有写入了
#   LET l_cnt = 0
#   EXECUTE s_axmt540_prepare_recount_count_pre USING ' ',' ',' ' INTO l_cnt
#   #檢查傳入的營運據點、料件、產品特徵、庫存管理特徵是否有對應的inan_t資料
#   #若沒有則自動新增對應的inan_t資料
#   IF l_cnt = 0 OR cl_null(l_cnt) THEN
#      EXECUTE s_axmt540_prepare_recount_insert_pre USING
#         g_enterprise,p_site,l_inan000,p_item,p_inan002,
#         p_inan003,' ',' ',' ',l_unit,l_qty
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'execute s_axmt540_prepare_recount_insert_pre'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#      END IF
#   #依據傳入參數，更新那一筆inan_t，異動的數量為p_qty
#   ELSE
#      EXECUTE s_axmt540_prepare_recount_update_pre USING l_qty,' ',' ',' '
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'execute s_axmt540_prepare_recount_update_pre,item_no:',p_item,',Product Feature:',p_inan002,   #200206-00012#1 add
#                                 ',Qty:',l_qty                                                                              #200206-00012#1 add
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#      END IF
#   END IF
   
   IF NOT cl_null(l_inan.inan004) THEN
      LET l_cnt = 0
      EXECUTE s_axmt540_prepare_recount_count_pre USING l_inan.inan004,' ',' ' INTO l_cnt
      #依據傳入參數的庫位，新增一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_axmt540_prepare_recount_insert_pre USING
            g_enterprise,p_site,l_inan.inan000,l_inan.inan001,l_inan.inan002,
            l_inan.inan003,l_inan.inan004,' ',' ',l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_insert_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #依據傳入參數的庫位，更新單純for庫位的那一筆inan_t，異動的數量為p_qty
      ELSE
         EXECUTE s_axmt540_prepare_recount_update_pre USING l_qty,l_inan.inan004,' ',' '
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_update_pre,Item_no:',l_inan.inan001,',Product Feature:',l_inan.inan002,    #200206-00012#1 add
                                    ',Warehouse:',l_inan.inan004,',Qty:',l_qty                                                       #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   
   IF NOT cl_null(l_inan.inan005) THEN
      LET l_cnt = 0
      EXECUTE s_axmt540_prepare_recount_count_pre USING l_inan.inan004,l_inan.inan005,' ' INTO l_cnt
      #若傳入參數的儲位也有值時，則需再多新增for庫位這一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_axmt540_prepare_recount_insert_pre USING
            g_enterprise,p_site,l_inan.inan000,l_inan.inan001,l_inan.inan002,
            l_inan.inan003,l_inan.inan004,l_inan.inan005,' ',l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_insert_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #若傳入參數的儲位也有值時，則需再多更新庫位+儲位這一筆inan_t，異動的是量為p_qty
      ELSE
         EXECUTE s_axmt540_prepare_recount_update_pre USING l_qty,l_inan.inan004,l_inan.inan005,' '
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_update_pre,Item_no:',l_inan.inan001,',Product Feature:',l_inan.inan002,   #200206-00012#1 add
                                    ',Warehouse:',l_inan.inan004,',Location:',l_inan.inan005,',Qty:',l_qty                               #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   
   IF NOT cl_null(l_inan.inan006) THEN
      LET l_cnt = 0
      EXECUTE s_axmt540_prepare_recount_count_pre USING l_inan.inan004,l_inan.inan005,l_inan.inan006 INTO l_cnt
      #若傳入參數的儲位和批號都有值時，則需再多新增for庫位+儲位這一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_axmt540_prepare_recount_insert_pre USING
            g_enterprise,p_site,l_inan.inan000,l_inan.inan001,l_inan.inan002,
            l_inan.inan003,l_inan.inan004,l_inan.inan005,l_inan.inan006,l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_insert_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #若傳入參數的批號也有值時，則需再多更新庫位+儲位+批號這一筆inan_t，異動量為p_qty
      ELSE
         EXECUTE s_axmt540_prepare_recount_update_pre USING l_qty,l_inan.inan004,l_inan.inan005,l_inan.inan006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_axmt540_prepare_recount_update_pre,Item_no:',l_inan.inan001,',Product Feature:',l_inan.inan002,    #200206-00012#1 add
                                     ',Warehouse:',l_inan.inan004,',Location:',l_inan.inan005,',LotNo:',l_inan.inan006,',Qty:',l_qty           #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF


   RETURN r_success
END FUNCTION

 
{</section>}
 
