#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aapp330.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0167(1900-01-01 00:00:00), PR版次:0167(2021-04-26 14:37:52)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000589
#+ Filename...: s_aapp330
#+ Description: 應付帳款單批次產生傳票作業
#+ Creator....: 02097(2014-07-21 10:37:33)
#+ Modifier...: 00000 -SD/PR- 11234
 
{</section>}
 
{<section id="s_aapp330.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150126-00027#1              By Belle    增加傳票補號
#150202-00002#1              By Reanna   月結部份不用判斷單別是否拋傳票，都要拋
#150209-00008#2   2015/02/10 By Belle    增加現金變動碼
#                 150227     By albireo  把客戶修改問題的部分版回來:外币的原币金额应该为0
#150317apo        2015/03/17 By apo      因應直接沖銷(應稅折抵為N)及直接付款改為回寫至apca107修改
#150825-00004#8   2015/08/28 By Reanna   增加aapt920重評價依幣別彙總
#151013-00019#2   2015/10/16 By Reanna   進項稅額傳票摘要放發票號碼
#151029           2015/10/26 By Hans     aapt93* 根據單據性質D-FIN-1002判斷如果是Y則負數，N則借貸相反
#150703-00021#24  2015/11/13 By Hans     增加預算控管
#151203-00013#3   2015/12/04 By Jessy    150825-00004#6/7/9三張單修改的段落,全數還原,因原來分錄底稿就已有依幣別匯總
#151211           2015/12/11 By Belle    單據負向才處理紅沖
#151216-00008#3   2016/01/05 By Reanna   aapt920匯差科目：
#                                        agli031勾选多币别>>汇兑损益科目币别=外币/原币金额=0
#                                        agli031不勾选多币别>>汇兑损益科目币别=本币/原币金额=本币金额
#151120-00004#1   2016/03/21 By 02097    红冲允许负数，因此不卡不可负数
#160107-00001#1   2016/03/29 By 02097    增加标凖成本计算
#160523-00023#1   2016/05/23 By Dido     當指定傳票單號時接收變數宣告不足,導致傳票拋轉有誤
#160506-00002#3   2016/06/02 By Hams     aapt430傳票顯示應為正數
#160621-00026#1   2016/06/22 By 03538    暫估稅額處理,S-FIN3012含稅立暫估時,要連稅額也產生;拿掉S-FIN-3003迴轉否影響是否沖暫估
#160509-00004#89  2016/07/01 By 03538    增加aapt823分錄邏輯
#160630-00012#1   2016/07/05 By albireo  P10分錄產生時, 科目的幣別及匯率，應取單身的幣別及匯率。
#160706-00009#1   2016/07/06 By 06821    標準成本價差額原用含稅金額-成本去計算，改用未稅金額-成本
#160707-00030#1   160707     By albireo  無單:有直接沖帳對帳款有沖銷時,原幣金額應用本幣/匯率取位,
#                                             於彙總時先以帳款科目總金額比對單頭apca108-apcc109的差異給到帳款科目任一筆的原幣中
#160628-00002#2   2016/07/07 By 02599    直接冲账分录改成抓取未税金额和税额，抓取单头资料gen_ap_1_c10的SQL语句缺少ENT
#160726-00008#1   2016/07/26 By 01727    直接沖賬部分,原幣金額沒有區分含稅和未稅金額
#160727-00019#31  2016/08/10 By 08734    临时表长度超过15码的减少到15码以下 s_fin_tmp_conti_no ——> s_fin_tmp
#160912-00002#1   2016/09/12 By 01727    aapt300/axrt300  沖含稅待抵時, 沒有依資料 稅/稅額分別產生分錄底稿
#160816-00022#4   2016/09/21 By 06821    若aoos020暫估回轉=Y則分錄不取沖暫估訊息apcf
#161102-00020#1   2016/11/02 By Reanna   修正每按一次產生分錄底稿，金額就累加的bug
#161104-00038#1   2016/11/07 By dorishsu 修改s_aapp330_gen_ap_1_ins_group_tmp函式,取l_tmpsum因為反向的會錯,要絕對值
#161003-00014#15  2016/11/17 By Hans     預算控管元件修改。
#161111-00048#2   2016/11/16 By 08171    SUB_程式中DEFINE / INSERT INTO 有星號整批調整
#161124-00066#1   2016/11/29 By dorishsu 產生分錄時,應付金額都只需用本幣作記錄
#161208-00026#23  2016/12/15 By 08732    SUB_程式中DEFINE / INSERT INTO 有星號整批調整(針對SELECT *的部份)
#161215-00064#1   2016/12/26 By dorishsu 已直接付款完(l_diff109=0),無沖帳差異金額需調整,不需再與l_tmpsum計算
#161228-00064#1   2016/12/27 By Reanna   應付金額(應付帳款貸方科目)，只有aapt330付款給員工，是用本幣支付，所以換算至本幣，其他維持原幣顯示
#170103-00019#5   2017/01/09 By Reanna   产生凭证时，应一并检核立冲否，并写入立冲明细表；为科目冲销时，明细操作的立冲处理需开放点选。
#170117-00032#1   2017/01/18 By dorishsu s_aapp330_gen_ap_1_ins_group_tmp取得l_tmpsum後,需再扣除直接沖帳(apce_t)與單身相同帳款科目的金額
#170116-00074#4   2017/01/23 By Hans     aapp330拋轉不在檢核
#170213-00048#1   2017/02/14 By dorishsu aapt930/aapt931,依來源暫估立帳單號,匯總單身存貨科目及金額,產生分錄
#170215-00043#1   170215     By albireo  針對#170213-00048#1微調金額計算方式
#170216-00006#1   170216     By albireo  aapt930/aapt931 存貨科目之核算項依以下原則處理:
#                                        1.依aapt930/931之核算項   2.依原單存貨科目核算項啟用否取值
#170214-00042#1   2017/02/17 By Reanna   調整匯總時，若匯總條件=5.全部，核算項的帳款客戶不用強制給Y
#170222-00025#1   170223     By albireo  調整彙總時SQL錯誤
#170301-00021#1   2017/03/01 By 09263    g_prog整批調整
#170314-00066#1   2017/03/17 By dorishsu s_aapp330_gen_ap_1_ins_tmp產生沖暫估DIFF,取消"#如果单身只有销退/或其他减项,则借贷相反"處理,否則DIFF分錄產生不出來
#170328-00116#1   170328     By albireo  aapt920:temptable 營運據點抓取xregsite  應改為抓取xrehorga
#170328-00075#1   2017/03/29 By 04150    CALL s_account_item前，CALL s_fin_get_scc_value重抓g_prog傳入
#170427-00078#1   170427     By albireo  若環境無D-FIN-5002應視同不做預算管理
#170428-00026#1   2017/05/04 By dorishsu 沖暫估DIFF及沖暫估的分錄摘要增加判斷,如果科目不為null,且單身摘要為空,則取agli050彈性摘要
#170430-00006#2   2017/05/19 By Sabrina  效能優化
#170515-00018#1   2017/05/23 By dorishsu 1.aapt931產生分錄時,依來源暫估立帳單號,取單身存貨科目及金額, 核算項信息. 2.修正aapt931憑證科目借貸方相反問題
#170515-00030#1   2017/05/24 By dorishsu aapt930產生分錄時,依來源暫估立帳單號,取單身存貨科目及金額,核算項信息.
#170606-00050#1   2017/06/06 By dorishsu 調整170215-00043#1金額計算方式
#170628-00052#1   2017/06/29 By dorishsu 延續170606-00050#1增加考慮取位可能會有尾差問題
#170710-00019#1   2017/07/18 By dorishsu 修正aapt920转凭证时提示借贷金额为空值或小于等于0。
#170723-00002#1   2017/07/24 By 06821    修正#170430-00006#2,形成分錄,借方沒有幣別
#170724-00032#1   2017/07/24 By 02114    抓取弹性摘要时,目的字段统一改成glgb001
#170727-00005#1   2017/07/31 By 02114    处理明细临时表的原币金额有误，没有考虑正负值,造成单身有正有负时,原币金额会直接加总
#170810-00013#1   170815     By albireo  170727-00005的調整須做微調
#170808-00064#1   2017/08/23 By 04150    glad010及glad027以agli031 設定為主
#170824-00024#1   2017/08/28 By dorishsu 修正s_aapp330_gen_ap_1_ins_group_tmp,如果是多張單據批次產生傳票,則不做diff處理.
#170829-00014#1   2017/08/31 By chenssz  进项税科目的分录，增加单身摘要为null时才取agli050彈性摘要的判断
#170907-00051#1   2017/09/07 By dorishsu 修正170430-00006#2在s_aapp330_gen_ap_1_ins_tmp誤用不存在的變數p_ld
#170509-00094#2   2017/09/15 By Sabrina  當單別紅字傳票參數為'Y'且glad002='Y'時，傳票金額顯示在正常餘額方向且允許負數
#170821-00012#1   2017/09/22 By 06821    當aoos020暫估期初迴轉且沖暫估時認列差異(S-FIN-3034)=Y 時,沖暫估訊息給予差異科目,產生差異分錄;為 N時,維持目前規格(不給差異科目),不產生分錄
#170927-00019#1   2017/09/28 By 05795    应付账款单批次产生凭证，汇总方式选依来源单据个别生成，未按应付单据顺序生成凭证，不好对账
#170918-00040#1   2017/09/28 By 06821    因 收付款客商,帳款客商應用主要是搭配 總帳系統 後續分析應用所做的控制,將170214-00042|170808-00064 處理段還原,如有類似需求 收付款客商,帳款客商 需要參考 agli031 者 建議個案處理
#170509-00094#1   2017/09/29 B7 05488    不啟用底稿時拋轉傳票呈現方式要和啟用底稿一致
#171011-00005#1   2017/10/12 By 06821    暫估參數(迴轉否&認列差異否)皆為N時, 沖銷暫估時分錄有誤
#171016-00014#1   2017/10/17 By 08729    aapt300生成的凭证金额与单据不符，初步判断与暂估补丁相关
#170915-00038#6   2017/10/18 By 05488    aapt931暫估進項稅額分錄底稿方向錯誤
#170915-00038#10  2017/11/08 By 06821    aapt930暫估分錄調整
#171221-00005#1   2017/12/21 By 05795    加判断是否有多币种的逻辑
#171225-00015#1   2018/01/08 By 04152    調整分錄順序
#180109-00059#1   2018/01/10 By 05795    170428-00026 此版號有修正沒有帶出 彈性摘要 的問題，但只針對產生匯差的時候才有。 
#                                        但實際上，所有的科目都有可能會用到 彈性摘要 這塊....所以應該都要考慮到才對。
#180124-00020#1   2018/01/29 By 06821    AP產生底稿時glgb026記錄會科來源, 延續#171225-00015#1 做順序調整
#180208-00014#1   2018/02/08 By 04441    增加判斷帳套是否有使用本位幣二三
#180208-00035#1   2018/02/08 By 04441    修正#180208-00014#1
#180226-00016#1   2018/03/05 By 06821    aoos020參數:當暫估帳款期初迴轉否='Y' 沖暫估時認列差異='YorN' ->分錄不平 ; 當暫估帳款期初迴轉否='N'  ,沖暫估時認列差異='N' -> 分錄正確
#180227-00043#3   2018/03/13 By 09232    agli171 如果勾选“汇差以净额产生分录底稿”，aapt920则将“重评价科目的”金额,以币别加核算项为group 计算汇差净额，产生分录底稿。
#180313-00016#1   2018/03/16 By 05634    s_aapp330_gen_ins_tmp,也要寫現金變動碼
#180111-00043#54  2018/03/17 By 09505    现在设计器产生方法的时候说明默认给值是CALL s_aooi150_ins (传入参数)，本次批量调整将方法明改为此方法的实际用途说明。
#180319-00030#1   2018/03/19 By 09232    延续#180227-00043#3,agli171勾选“汇差已净额产生分录”时，重评价科目若沒有勾客商碼,不要強制給
#180129-00031#1   2018/03/22 By 08729    直接沖帳的會科沒有但出摘要
#180228-00002#1   2018/03/23 By 05795    判断aapp420做的事aapt430得抛传票，不需要强制给glad010 和 glad027 为 Y
#180129-00027#1   2018/03/27 By 07900    在aapt420應付沖銷中,產生分錄時，增加紅字傳票科目借貸方的判斷(170509-00094#2)
#                                        CASE  apde002 IN (11.匯兌損失 12.匯兌收益 13.帳務處理 14.手續費) 則必須判斷紅字傳票原則, 其余不更動。
#180402-00049#1   2018/04/03 By 04152    若沒有啟用分錄底稿，若是有走迴轉，產生的傳票應該是AC不是AR
#180404-00011#1   2018/04/04 By 05795    检查aooi200参数aglt310是允许红字,按余额类型生成分录 一个A科目设置为Y 一个B科目设置为N.会报 aap-00076 这个错
#180327-00063#1   2018/04/18 By 08729    如果再直接沖帳裡沖待抵單，並有稅額的話，要產生稅額科目再貸方
#180424-00003#1   2018/05/03 By 05634    修改s_aapp330_gen_ap_1_ins_group_tmp的l_diff109計算處理邏輯
#180423-00029#1   2018/05/03 By 04152    產生傳票寫入tmp前，若不啟用本位幣二&三時，匯率都給予null
#180424-00004#1   2018/05/03 By 05016    檢核預算是否超額修正
#                                        單別參數 D-FIN-5002 是否進行預算控制 增加 C:表示若該項次有編製預算時檢核預算可用額度, 未編製預算時則不檢核
#180423-00051#1   2018/05/11 By 06821    aapt300分录底稿中账款对象和收付款对来源应为【其他信息】页签中值
#180413-00017#7   2018/05/09 By 10554    anmt480  來源=3.手續費會科取 anmi152 , 對方科目取手續費支付帳戶對應科目
#180410-00038#1   2018/05/14 By 09232    ap產生底稿時稅額科目借貸相減後取淨額產生
#180409-00059#1   2018/05/18 By 10554    摘要邏輯修正：稅額科目以取彈性摘要為主，取不到則給NULL。
#180521-00018#1   2018/05/28 By 09232    延续#180410-00038#1修改，aapp330也好考虑税额净额产生。
#180608-00039#1   2018/06/08 By 06821    延续#180410-00038#1修改，aapt420 產生分錄底稿時報錯 insert s_voucher_tmp
#180611-00007#1   2018/06/11 By 05016    延续#180410-00038#1修改，aapt560 產生分錄底稿時報錯 insert s_voucher_tmp
#180621-00040#1   2018/06/22 By 05488    延续#180410-00038#1修改，aapt430 產生分錄底稿時報錯 insert s_voucher_tmp
#180623-00004#1   2018/07/10 By 04152    調整#170509-00094#2，單別允許紅字憑證，這樣暫估科目也要一併辦理
#180712-00002#1   2018/07/12 By 00537    180129-00027#1漏做D-FIN-1002的考虑，参考axr的补上
#180130-00050#93  2018/07/13 By 06821    取設置的現金變動碼時有誤
#180130-00050#5   2018/07/18 By 10554    INSERT/UPDATE table前，金額匯率相關欄位若為空值須給0
#180612-00075#1   2018/07/23 By 05016    s_aapp330取得[目的科目]apdc015的處理，可先合併以淨額產生至分錄中。
#180731-00017#7   2018/08/14 By 06137    調整to_date、to_char的寫法改掉，以符合其他資料庫語法(先調整WHERE條件，使用SELECT欄位尚未調整)
#180813-00039#1   2018/08/17 By 06821    應付帳款單分錄不啟用分錄底稿時原幣呈現有誤(把存在已核銷金額加回來,讓該分錄僅呈現當下這張單據上正確的金額內容)
#180904-00075#1   2018/09/05 By 00768    还原#180612-00075#1功能单号修改，此修改会造成分录底稿借贷方向错误
#180808-00051#1   2018/09/05 By 10554    增加「會科合併原則」
#180808-00051#2   2018/09/14 By 10554    續#180808-00051#1補充aapp420使用段落
#180808-00013#7   2018/09/18 By 10554    aapt430新增紅字處理
#180912-00033#1   2018/09/21 By 10043    憑證科目未啟用多幣別管理，原幣應等於借/貸金額
#180808-00013#1   2018/09/18 By 10554    aapt920新增紅字處理
#181008-00028#1   2018/10/09 By 05795    处理税额多科目产生分录只产生一个科目问题
#181015-00017#1   2018/10/15 By 10554    當匯總方式選"依單據日期"或是"全部".合併原則選3.借貸不合併.order 的順序為"借貸"+"科目"+"帳款客戶" 
#181018-00024#1   2018/10/18 By 05016    aapt430 來源科目產生分錄底稿的時候 客商管理直接給apce038(帳款對象)
#181025-00068#1   2018/10/18 By 05795    aapt420中#91.其他借项，92.其他贷项 也需要判斷紅字傳票原則
#181115-00027#1   2018/11/20 BY 05795    单据别设置立即审核则产生总账资料时候也需要立即审核
#181127-00053#1   2018/11/28 By 05795    agli050设置后摘要需要带出
#181225-00037#1   2018/12/26 By 05488    ent修改
#190114-00063#1   2019/01/17 By 05016    aapt3* 確認時不產生分錄底稿的資料檢核段會利用分錄底稿去檢查資料，補上BPM用之狀態瑪。
#190122-00062#1   2019/01/24 By 08729    因有紅字傳票，A科目科餘型態為借餘;A科目可輸入借方負數，導致寫進bgbd時抓到貸方金額，就都寫成0
#180926-00034#4   2019/03/29 by 08172    增加axrt401
#180507-00035#6   2019/04/12 By 10043    依法人層參數S-FIN-0003若=2則在抛轉傳票後,依每張傳票是否含有現金類科目,若該張傳票有現金類科目則取其他科目依其借方或貸方,取agli031現金變動碼寫入glbc
#190510-00022#1   2019/05/13 By 10554    傳票寫入期別應以會計週期行事曆為主
#190522-00006#1   2019/05/22 By 11234    aapt920根据agli050摘要设置带出摘要
#190524-00012#1   2019/05/24 By 05795    更新摘要得时候需要根据单据更新要不然会把其他得单据摘要一起更新了
#190528-00007#1   2019/06/05 By 10043    1.拋轉GL, 寫入glbc_t 皆須寫入 glbc005 , 且依照來源單帳款客商拆分
#                                        2.調整aoos020 S-FIN-0003='2'且無啟用分錄底稿，須先產生底稿，因寫入glbc須依據來源單帳款客商拆分，傳票產生後刪除底稿
#190517-00057#1   2019/06/12 By 05016    直接付款所產生的分錄的帳款客戶取apde038
#190619-00013#1   2019/06/21 By 10043    帳套無用分錄底稿,aoos020現流表來源參數=1.票據資金系統,拋轉傳票寫入glbc005統一抓原單據的帳款對象,
#                                        因直接付款寫入分錄,glgb022給的是付款對象,造成寫入glbc005錯誤
#190626-00054#1   2019/06/26 By 01531    餐饮烘焙--(存在内部暂估单的)外部暂估单存货科目客商核算项=stbcsite,不是apca004
#190711-00001#1   2019/07/15 By 05795    如果agli010該帳套是否有啟用"標準成本"處理，取agli010的設置成本計算類型glaa120，若在axci100的計價方式值為1.標準成本 没去净额，启用数量金额式，如应付单包含仓退，数量是加仓退数量而不是减
#190806-00013#1   2019/08/06 By 10043    1.調整#190517-00057#1,直接付款帳款對象取apca004 2.還原此單#190619-00013#1,aoos020 S-FIN-0003參數設定1.票據資金系統,寫入glbc時機點
#190703-00001#2   2019/08/20 By 10043    aapt920匯差科目先依模組取值即本單agli171加的欄位取值,若空白時才依目前的取值方式
#190826-00030#1   2019/08/27 By 08729    修正設定稅額彈性摘要，分錄沒有按照稅額拆分
#190909-00032#1   2019/09/09 By 11234    aapt300贷方科目需赋值摘要内容
#190911-00001#1   2019/09/11 By 05634    aapt430產生傳票時,原幣金額要同借貸方金額一樣判斷,若為負數,做正數處理
#191202-00027#1   2019/12/04 By 07804    修正會科合併原則選擇2：合併交易單同科目-不分借貸方向合併淨額，啟用多幣別科目的原幣金額錯誤
#191219-00033#1   2019/12/20 By 05795    凭证预览和抛转生成的凭证借贷相反
#200219-00047#1   2020/02/24 By 10043    aapt330處理直接沖帳金額應扣掉繳款金額
#200205-00019#1   2020/02/27 By 08729    修正當直接沖帳裡有aapt341的單時，貸方沒有取到稅額科目的問題
#200309-00072#1   2020/03/10 By 11234    本币金额为负时，原币也要为负
#200213-00035#1   2020/04/09 By 12290    直接沖帳若拉出的待抵單為員工預支單時,產生分錄時客商碼應取待抵單的客商碼EMPL,而非AP單單頭的客商碼
#200408-00070#1   2020/04/10 By 05795    分录预览原币金额不对
#200408-00057#1   2020/04/14 By 08729    aapt430單身收付款客商要對應付款對象，帳款客商要對應帳款對象(目前都給apdc026帳款對象)
#200228-00020#1   2020/04/16 By 01531    好利来产品回收（冲仓退暂估时，应付暂估分录显示有误）
#200420-00042#1   2020/04/20 By 10043    1.優化aglt310檢核預算是否超出限額的錯誤訊息內容 2.預算控管依部門組織樹取值
#200428-00028#1   2020/04/29 By 08729    修正當帳款單幣別不是本位幣時，有直接付款的時候 分錄裡的原幣匯錯誤
#200526-00009#1   2020/05/26 By 10043    修改aglt3*寫入預算滾動檔之來源碼
#191016-00040#1   2020/05/11 By 12290    1.修正agli031已设置按余额类型产生和aooi200设置允许产生红字凭证后，没有产生红字凭证的问题
#                                        2.冲销类型增加'15'
#200529-00046#1   2020/06/08 By 10043    因應除AP/GL模組,憑證確認時需寫入預算滾動檔,優化檢核預算超限錯誤訊息
#190507-00025#1   2020/06/12 By 10043    1.AP的aapt3*立账与冲账aapt420可以合并抛总账
#                                        2.若aoos020現流表來源參數=1.票據資金系統且現金科目不啟用帳款客商,glbc005給空
#190507-00025#3   2020/06/24 By 10043    aapt420拋轉傳票單別紅字傳票=N,拋轉後aglt310變負數紅字憑證
#201030-00021#1   2020/11/03 By 11234    修改多张预付单合并抛转凭证生成现金变动码错误问题
#201112-00004#1   2020/11/12 By 05795    aapt420分录，当第一单身是41时，产生分录时，收付款对像的栏位取单头,
#200807-00004#1   2020/08/07 By 11234    修改aapt430分录预览原币和本币金额不等的问题
#200907-00035#1   2020/11/20 By 11234    当是委外且为标准成本时,科目抓axci201中的委外标准成本差异科目
#201204-00019#1   2020/12/11 BY 05795    报销的多应用为本位币支付，故此作业为本币
#201207-00021#1   2020/12/14 By 10043    新增以現變碼拆分科目相關邏輯
#200605-00130#2   2020/12/21 By 13656    现金流量表之数据源为2.总账系统科目设置现金变动码时，若底稿中存在现金科目，非现金科目现金变动码预设agli031中设置的现金变动码
#201217-00013#1   2020/12/31 By 05795    sql字段给的不对
#201209-00007#1   2021/01/04 by 05795    如果日期没查到就不需要走s_date_get_first_date这个方法
#201014-00031#1   2020/10/22 By 11234    aapt420第二单身的科目的核算项收付款对象栏位取单头的付款对象
#190711-00019#1   2021/03/04 By 13656    1. AAP\AXR 批处理抛转凭证时,依附件规则抛转:数量、单价
#210324-00039#1   2021/03/25 By 11234    修正科目+现金变动码一致时，抛总账生成glbc重复的问题
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util #150703-00021#24
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"
 
#end add-point
 
{</section>}
 
{<section id="s_aapp330.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
TYPE type_g_tmp_d   RECORD
                     docno    LIKE glaq_t.glaqdocno,     #01-彙總單號
                     docdt    LIKE glap_t.glapdocdt,     #02-彙總日期
                     sw       LIKE type_t.chr1,          #03-1.借  2.貸
                     glaqent  LIKE glaq_t.glaqent,       #04-
                     glaqcomp LIKE glaq_t.glaqcomp,      #05-
                     glaqld   LIKE glaq_t.glaqld,        #06-
                     glaq001  LIKE glaq_t.glaq001,       #07-摘要
                     glaq002  LIKE glaq_t.glaq002,       #08-科目編號
                     glaq005  LIKE glaq_t.glaq005,       #09-交易幣別
                     glaq006  LIKE glaq_t.glaq006,       #10-匯率
                     glaq007  LIKE glaq_t.glaq007,       #11-計價單位
                     glaq008  LIKE glaq_t.glaq008,       #12-數量
                     glaq009  LIKE glaq_t.glaq009,       #13-單價
                     glaq011  LIKE glaq_t.glaq011,       #14-票據編碼
                     glaq012  LIKE glaq_t.glaq012,       #15-票據日期
                     glaq013  LIKE glaq_t.glaq013,       #16-申請人
                     glaq014  LIKE glaq_t.glaq014,       #17-銀行帳號
                     glaq015  LIKE glaq_t.glaq015,       #18-結算方式
                     glaq016  LIKE glaq_t.glaq016,       #19-收支項目
                     glaq017  LIKE glaq_t.glaq017,       #20-營運據點
                     glaq018  LIKE glaq_t.glaq018,       #21-固定核算項-部門
                     glaq019  LIKE glaq_t.glaq019,       #22-固定核算項-利潤/成本中心
                     glaq020  LIKE glaq_t.glaq020,       #23-固定核算項-區域
                     glaq021  LIKE glaq_t.glaq021,       #24-固定核算項-交易客商
                     glaq022  LIKE glaq_t.glaq022,       #25-固定核算項-帳款客戶
                     glaq023  LIKE glaq_t.glaq023,       #26-固定核算項-客群
                     glaq024  LIKE glaq_t.glaq024,       #27-固定核算項-產品類別
                     glaq025  LIKE glaq_t.glaq025,       #28-固定核算項-人員
                     glaq026  LIKE glaq_t.glaq026,       #29-固定核算項-預算編號(NO USE)
                     glaq027  LIKE glaq_t.glaq027,       #30-固定核算項-專案編號
                     glaq028  LIKE glaq_t.glaq028,       #31-固定核算項-WBS        
                     glaq051  LIKE glaq_t.glaq051,       #32-固定核算項-經營方式   
                     glaq052  LIKE glaq_t.glaq052,       #33-固定核算項-渠道       
                     glaq053  LIKE glaq_t.glaq053,       #34-固定核算項-品牌       
                     glaq029  LIKE glaq_t.glaq029,       #35-自由核算項
                     glaq030  LIKE glaq_t.glaq030,       #36-自由核算項
                     glaq031  LIKE glaq_t.glaq031,       #37-自由核算項
                     glaq032  LIKE glaq_t.glaq032,       #38-自由核算項
                     glaq033  LIKE glaq_t.glaq033,       #39-自由核算項
                     glaq034  LIKE glaq_t.glaq034,       #40-自由核算項
                     glaq035  LIKE glaq_t.glaq035,       #41-自由核算項
                     glaq036  LIKE glaq_t.glaq036,       #42-自由核算項
                     glaq037  LIKE glaq_t.glaq037,       #43-自由核算項
                     glaq038  LIKE glaq_t.glaq038,       #44-自由核算項
                     d        LIKE glaq_t.glaq003,       #45-借方金額
                     c        LIKE glaq_t.glaq004,       #46-貸方金額
                     sum      LIKE glaq_t.glaq010,       #47-金額
                     glaq039  LIKE glaq_t.glaq039,       #48-本位幣二-匯率
                     glaq040  LIKE glaq_t.glaq040,       #49-本位幣二-借方金額
                     glaq041  LIKE glaq_t.glaq041,       #40-本位幣二-貸方金額
                     glaq042  LIKE glaq_t.glaq042,       #51-本位幣三-匯率
                     glaq043  LIKE glaq_t.glaq043,       #52-本位幣三-借方金額
                     glaq044  LIKE glaq_t.glaq044,       #53-本位幣三-貸方金額
                     docseq   LIKE glaq_t.glaqseq,       #54-來源單據項次
                     source   LIKE type_t.chr100,        #55-來源TABLE(回寫時,會依據來源資料回寫)
                     glaqseq  LIKE glaq_t.glaqseq,       #56-項次
                     xrca039  LIKE xrca_t.xrca039,       #57-會計檢核附件份數
                     apcb022  LIKE apcb_t.apcb022,       #58-正負值
                     key1     LIKE type_t.chr80,         #59-PK1
                     key2     LIKE type_t.chr80,         #60-PK2
                     type     LIKE type_t.chr1,          #61-彙總類型(1:清單,2:彙總)
                     glaq010  LIKE glaq_t.glaq010,       #62-原幣
                     apcb023  LIKE apcb_t.apcb023,       #63-暫估否
                     glgb055  LIKE glgb_t.glgb055,       #64-現金變動碼
                     red      LIKE type_t.chr1           #65-紅沖否
                     END RECORD                            
TYPE type_g_tmp_glbc_d   RECORD
                     glbcent    LIKE glbc_t.glbcent,
                     glbcld     LIKE glbc_t.glbcld,
                     glbccomp   LIKE glbc_t.glbccomp, 
                     glbcdocno  LIKE glbc_t.glbcdocno,   
                     glbcseq    LIKE glbc_t.glbcseq,
                     glbcseq1   LIKE glbc_t.glbcseq1,
                     glbc001    LIKE glbc_t.glbc001,
                     glbc002    LIKE glbc_t.glbc002,
                     glbc003    LIKE glbc_t.glbc003,
                     glbc004    LIKE glbc_t.glbc004,
                     glbc005    LIKE glbc_t.glbc005,
                     glbc006    LIKE glbc_t.glbc006,
                     glbc007    LIKE glbc_t.glbc007,
                     glbc008    LIKE glbc_t.glbc008,
                     glbc009    LIKE glbc_t.glbc009,
                     glbc010    LIKE glbc_t.glbc010,
                     glbc011    LIKE glbc_t.glbc011,
                     glbc012    LIKE glbc_t.glbc012,   
                     glbc013    LIKE glbc_t.glbc013,
                     glbc014    LIKE glbc_t.glbc014,
                     key1     LIKE type_t.chr80,         #59-PK1-彙總欄位
                     key2     LIKE type_t.chr80          #60-PK2-彙總欄位
                     END RECORD       
DEFINE g_tmp         type_g_tmp_d          
DEFINE g_tmp_glbc    type_g_tmp_glbc_d          
#DEFINE g_glad        RECORD LIKE glad_t.*  #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE g_glad RECORD  #帳套科目管理設定檔
       gladent LIKE glad_t.gladent, #企業編號
       gladownid LIKE glad_t.gladownid, #資料所有者
       gladowndp LIKE glad_t.gladowndp, #資料所屬部門
       gladcrtid LIKE glad_t.gladcrtid, #資料建立者
       gladcrtdp LIKE glad_t.gladcrtdp, #資料建立部門
       gladcrtdt LIKE glad_t.gladcrtdt, #資料創建日
       gladmodid LIKE glad_t.gladmodid, #資料修改者
       gladmoddt LIKE glad_t.gladmoddt, #最近修改日
       gladstus LIKE glad_t.gladstus, #狀態碼
       gladld LIKE glad_t.gladld, #帳套
       glad001 LIKE glad_t.glad001, #會計科目編號
       glad002 LIKE glad_t.glad002, #是否按餘額類型產生分錄
       glad003 LIKE glad_t.glad003, #啟用傳票項次細項立沖
       glad004 LIKE glad_t.glad004, #傳票項次異動別
       glad005 LIKE glad_t.glad005, #是否啟用數量金額式
       glad006 LIKE glad_t.glad006, #借方現金變動碼
       glad007 LIKE glad_t.glad007, #啟用部門管理
       glad008 LIKE glad_t.glad008, #啟用利潤成本管理
       glad009 LIKE glad_t.glad009, #啟用區域管理
       glad010 LIKE glad_t.glad010, #啟用收付款客商管理
       glad011 LIKE glad_t.glad011, #啟用客群管理
       glad012 LIKE glad_t.glad012, #啟用產品類別管理
       glad013 LIKE glad_t.glad013, #啟用人員管理
       glad014 LIKE glad_t.glad014, #no use
       glad015 LIKE glad_t.glad015, #啟用專案管理
       glad016 LIKE glad_t.glad016, #啟用WBS管理
       glad017 LIKE glad_t.glad017, #啟用自由核算項一
       glad0171 LIKE glad_t.glad0171, #自由核算項一類型編號
       glad0172 LIKE glad_t.glad0172, #自由核算項一控制方式
       glad018 LIKE glad_t.glad018, #啟用自由核算項二
       glad0181 LIKE glad_t.glad0181, #自由核算項二類型編號
       glad0182 LIKE glad_t.glad0182, #自由核算項二控制方式
       glad019 LIKE glad_t.glad019, #啟用自由核算項三
       glad0191 LIKE glad_t.glad0191, #自由核算項三類型編號
       glad0192 LIKE glad_t.glad0192, #自由核算項三控制方式
       glad020 LIKE glad_t.glad020, #啟用自由核算項四
       glad0201 LIKE glad_t.glad0201, #自由核算項四類型編號
       glad0202 LIKE glad_t.glad0202, #自由核算項四控制方式
       glad021 LIKE glad_t.glad021, #啟用自由核算項五
       glad0211 LIKE glad_t.glad0211, #自由核算項五類型編號
       glad0212 LIKE glad_t.glad0212, #自由核算項五控制方式
       glad022 LIKE glad_t.glad022, #啟用自由核算項六
       glad0221 LIKE glad_t.glad0221, #自由核算項六類型編號
       glad0222 LIKE glad_t.glad0222, #自由核算項六控制方式
       glad023 LIKE glad_t.glad023, #啟用自由核算項七
       glad0231 LIKE glad_t.glad0231, #自由核算項七類型編號
       glad0232 LIKE glad_t.glad0232, #自由核算項七控制方式
       glad024 LIKE glad_t.glad024, #啟用自由核算項八
       glad0241 LIKE glad_t.glad0241, #自由核算項八類型編號
       glad0242 LIKE glad_t.glad0242, #自由核算項八控制方式
       glad025 LIKE glad_t.glad025, #啟用自由核算項九
       glad0251 LIKE glad_t.glad0251, #自由核算項九類型編號
       glad0252 LIKE glad_t.glad0252, #自由核算項九控制方式
       glad026 LIKE glad_t.glad026, #啟用自由核算項十
       glad0261 LIKE glad_t.glad0261, #自由核算項十類型編號
       glad0262 LIKE glad_t.glad0262, #自由核算項十控制方式
       glad027 LIKE glad_t.glad027, #啟用帳款客商管理
       glad030 LIKE glad_t.glad030, #是否進行預算管控
       glad031 LIKE glad_t.glad031, #啟用經營方式管理
       glad032 LIKE glad_t.glad032, #啟用通路管理
       glad033 LIKE glad_t.glad033, #啟用品牌管理
       glad034 LIKE glad_t.glad034, #科目做多幣別管理
       gladud001 LIKE glad_t.gladud001, #自定義欄位(文字)001
       gladud002 LIKE glad_t.gladud002, #自定義欄位(文字)002
       gladud003 LIKE glad_t.gladud003, #自定義欄位(文字)003
       gladud004 LIKE glad_t.gladud004, #自定義欄位(文字)004
       gladud005 LIKE glad_t.gladud005, #自定義欄位(文字)005
       gladud006 LIKE glad_t.gladud006, #自定義欄位(文字)006
       gladud007 LIKE glad_t.gladud007, #自定義欄位(文字)007
       gladud008 LIKE glad_t.gladud008, #自定義欄位(文字)008
       gladud009 LIKE glad_t.gladud009, #自定義欄位(文字)009
       gladud010 LIKE glad_t.gladud010, #自定義欄位(文字)010
       gladud011 LIKE glad_t.gladud011, #自定義欄位(數字)011
       gladud012 LIKE glad_t.gladud012, #自定義欄位(數字)012
       gladud013 LIKE glad_t.gladud013, #自定義欄位(數字)013
       gladud014 LIKE glad_t.gladud014, #自定義欄位(數字)014
       gladud015 LIKE glad_t.gladud015, #自定義欄位(數字)015
       gladud016 LIKE glad_t.gladud016, #自定義欄位(數字)016
       gladud017 LIKE glad_t.gladud017, #自定義欄位(數字)017
       gladud018 LIKE glad_t.gladud018, #自定義欄位(數字)018
       gladud019 LIKE glad_t.gladud019, #自定義欄位(數字)019
       gladud020 LIKE glad_t.gladud020, #自定義欄位(數字)020
       gladud021 LIKE glad_t.gladud021, #自定義欄位(日期時間)021
       gladud022 LIKE glad_t.gladud022, #自定義欄位(日期時間)022
       gladud023 LIKE glad_t.gladud023, #自定義欄位(日期時間)023
       gladud024 LIKE glad_t.gladud024, #自定義欄位(日期時間)024
       gladud025 LIKE glad_t.gladud025, #自定義欄位(日期時間)025
       gladud026 LIKE glad_t.gladud026, #自定義欄位(日期時間)026
       gladud027 LIKE glad_t.gladud027, #自定義欄位(日期時間)027
       gladud028 LIKE glad_t.gladud028, #自定義欄位(日期時間)028
       gladud029 LIKE glad_t.gladud029, #自定義欄位(日期時間)029
       gladud030 LIKE glad_t.gladud030, #自定義欄位(日期時間)030
       glad035 LIKE glad_t.glad035, #是否是子系統科目
       glad036 LIKE glad_t.glad036  #貸方現金變動碼
END RECORD
#161111-00048#2 --e add
DEFINE g_sfin2011    LIKE type_t.chr1
DEFINE g_sfin3012    LIKE type_t.chr1      #160621-00026#1
DEFINE g_dfin1002    LIKE type_t.chr1      #紅沖否
DEFINE g_glaa001     LIKE glaa_t.glaa001   #180208-00014#1
DEFINE g_glaa004     LIKE glaa_t.glaa004
DEFINE g_glaa015     LIKE glaa_t.glaa015   #180208-00014#1
DEFINE g_glaa019     LIKE glaa_t.glaa019   #180208-00014#1
DEFINE g_xcat005     LIKE xcat_t.xcat005   #160107-00001#1
DEFINE g_sfin3034    LIKE type_t.chr1      #170821-00012#1 add 暫估期初迴轉,沖暫估時認列差異否
DEFINE g_red_pn      LIKE type_t.chr1      #180808-00051#1 add 批次產生傳票單據中是否含紅字傳票
#end add-point
 
{</section>}
 
{<section id="s_aapp330.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_aapp330.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aapp330.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 傳票段的程式結構
# Memo...........:
# Date & Author..: 2016/03/01 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_how_to_debug()

# 【說明】
# 財務模組產生分錄底稿的方式大同小異，財務模組是function名稱不同結構相同，其他模組程式在s_voucher.4gl。
# 產生分錄一定是要先CREATE TEMP TABLE(s_aapp330_cre_tmp)
# 因應帳套資料維護作業(aglli010)的，是否啟用分錄底稿(glaa121)選項
# 啟用分錄底稿否：
#    Y：以TEMP TABLE方式產生到分錄底稿實體TABLE(glga_t/glgb_t)，後續會以glga_t/glgb_t產生到轉帳傳票維護作業(aglt310)
#    N：以TEMP TABLE方式產生到轉帳傳票維護作業(aglt310)
#
# 產生分錄底稿的流程順序： 
# 1. s_aapp330_cre_tmp -> 2. s_aapp330_gen_ac：統一以s_aapp330_gen_ac做為函式的入口，依照來源類型(P10/P20...)，決定要呼叫那一個 s_aapp330_gen_ap_aaptxxx
#                            2-1. s_aapp330_gen_ap_aaptxxx：元件目的是產生的科目清單，將這些清單寫入TEMP TABLE(在TEMP TABLE中的type欄位是1:科目清單)
#                                 2-1-1. s_aapp330_gen_ap_1_def_cursor：避免重覆定義SQL語句，因此統一做SQL的宣告
#                                 2-1-2. s_aapp330_gen_ap_1_ins_tmp：寫入科目清單(帳款單性質為2*的單據方向處理)
#                            2-2. s_aapp330_gen_ap_1_ins_group_tmp：依據是否啟用科目核算項(glad_t)做匯總(在TEMP TABLE中的type欄位是2:科目匯總)
#
# 產生傳票的流程順序：
# 1. s_aapp330_generate_voucher
#    啟用分錄底稿否：
#    【Y】 1.1 s_pre_voucher_ins_glap：以glga_t/glgb_t寫到轉帳傳票維護作業(aglt310)
#    【N】 1.2 s_aapp330_gen_ap_1_ins_glap：以temp table的資料寫入aglt310單頭，因為是temp table，所以temp table的資料要先準備好
#              1.2.1 s_aapp330_gen_ap_1_ins_glaq：以temp table的資料寫入aglt310單身
# DEBUG重點：
# 1. 一般錯誤應該在傳票預覽，這樣的情況可看s_aapp330_gen_ap_1_ins_tmp這個元件，因為這元件處理科目的金額/方向。
# 2. 可在INSERT INTO s_voucher_tmp VALUES(g_tmp.*)之前，查看g_tmp變數，寫入temp table"一定要正確"因為後續都是將這裡的資料撈出來處理的
# 

END FUNCTION

################################################################################
# Descriptions...: 產生TEMP
# Date & Author..: 14/07/21 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_cre_tmp()
   DEFINE r_success       LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   

   DROP TABLE s_voucher_tmp; #ODI-ORA#
   CREATE TEMP TABLE s_voucher_tmp(
      docno    LIKE glaq_t.glaqdocno,     #01-彙總單號
      docdt    LIKE glap_t.glapdocdt,     #02-彙總日期
      sw       LIKE type_t.chr1,          #03-1.借  2.貸
      glaqent  LIKE glaq_t.glaqent,       #04-
      glaqcomp LIKE glaq_t.glaqcomp,      #05-
      glaqld   LIKE glaq_t.glaqld,        #06-
      glaq001  LIKE glaq_t.glaq001,       #07-摘要
      glaq002  LIKE glaq_t.glaq002,       #08-科目編號
      glaq005  LIKE glaq_t.glaq005,       #09-交易幣別
      glaq006  LIKE glaq_t.glaq006,       #10-匯率
      glaq007  LIKE glaq_t.glaq007,       #11-計價單位
      glaq008  LIKE glaq_t.glaq008,       #12-數量
      glaq009  LIKE glaq_t.glaq009,       #13-單價
      glaq011  LIKE glaq_t.glaq011,       #14-票據編碼
      glaq012  LIKE glaq_t.glaq012,       #15-票據日期
      glaq013  LIKE glaq_t.glaq013,       #16-申請人
      glaq014  LIKE glaq_t.glaq014,       #17-銀行帳號
      glaq015  LIKE glaq_t.glaq015,       #18-結算方式
      glaq016  LIKE glaq_t.glaq016,       #19-收支項目
      glaq017  LIKE glaq_t.glaq017,       #20-營運據點
      glaq018  LIKE glaq_t.glaq018,       #21-固定核算項-部門
      glaq019  LIKE glaq_t.glaq019,       #22-固定核算項-利潤/成本中心
      glaq020  LIKE glaq_t.glaq020,       #23-固定核算項-區域
      glaq021  LIKE glaq_t.glaq021,       #24-固定核算項-交易客商
      glaq022  LIKE glaq_t.glaq022,       #25-固定核算項-帳款客戶
      glaq023  LIKE glaq_t.glaq023,       #26-固定核算項-客群
      glaq024  LIKE glaq_t.glaq024,       #27-固定核算項-產品類別
      glaq025  LIKE glaq_t.glaq025,       #28-固定核算項-人員
      glaq026  LIKE glaq_t.glaq026,       #29-固定核算項-預算編號
      glaq027  LIKE glaq_t.glaq027,       #30-固定核算項-專案編號
      glaq028  LIKE glaq_t.glaq028,       #31-固定核算項-WBS
      glaq051  LIKE glaq_t.glaq051,       #32-固定核算項-經營方式
      glaq052  LIKE glaq_t.glaq052,       #33-固定核算項-渠道
      glaq053  LIKE glaq_t.glaq053,       #34-固定核算項-品牌
      glaq029  LIKE glaq_t.glaq029,       #35-自由核算項
      glaq030  LIKE glaq_t.glaq030,       #36-自由核算項
      glaq031  LIKE glaq_t.glaq031,       #37-自由核算項
      glaq032  LIKE glaq_t.glaq032,       #38-自由核算項
      glaq033  LIKE glaq_t.glaq033,       #39-自由核算項
      glaq034  LIKE glaq_t.glaq034,       #40-自由核算項
      glaq035  LIKE glaq_t.glaq035,       #41-自由核算項
      glaq036  LIKE glaq_t.glaq036,       #42-自由核算項
      glaq037  LIKE glaq_t.glaq037,       #43-自由核算項
      glaq038  LIKE glaq_t.glaq038,       #44-自由核算項
      d        LIKE glaq_t.glaq003,       #45-借方金額
      c        LIKE glaq_t.glaq004,       #46-貸方金額
      sum      LIKE glaq_t.glaq010,       #47-金額
      glaq039  LIKE glaq_t.glaq039,       #48-本位幣二-匯率
      glaq040  LIKE glaq_t.glaq040,       #49-本位幣二-借方金額
      glaq041  LIKE glaq_t.glaq041,       #40-本位幣二-貸方金額
      glaq042  LIKE glaq_t.glaq042,       #51-本位幣三-匯率
      glaq043  LIKE glaq_t.glaq043,       #52-本位幣三-借方金額
      glaq044  LIKE glaq_t.glaq044,       #53-本位幣三-貸方金額
      docseq   LIKE glaq_t.glaqseq,       #54-來源單據項次
      source   LIKE type_t.chr100,        #55-來源TABLE(回寫時,會依據來源資料回寫)
      glaqseq  LIKE glaq_t.glaqseq,       #56-項次
      xrca039  LIKE xrca_t.xrca039,       #57-會計檢核附件份數
      apcb022  LIKE apcb_t.apcb022,       #58-正負值
      key1     LIKE type_t.chr80,         #59-PK1-彙總欄位
      key2     LIKE type_t.chr80,         #60-PK2-彙總欄位
      type     LIKE type_t.chr1,          #61-彙總類型(0:FOR P次使用,1:科目清單,2:科目彙總)
      glaq010  LIKE glaq_t.glaq010,       #62-原幣
      apcb023  LIKE apcb_t.apcb023,       #63-暫估否
      glgb055  LIKE glgb_t.glgb055,       #64-現金變動碼
      red      LIKE type_t.chr1,          #65-红冲否(待抵单使用) #20150616   
      glaq0101 LIKE glaq_t.glaq010,       #原幣           #170509-00094#1 add
      flag     LIKE type_t.chr1           #180227-00043#3 add(“1”代表账款科目资料，"2"代表重评价科目资料）
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create_s_voucher_tmp'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #170509-00094#1---add---start---   

   DROP TABLE s_voucher_tmp2; #ODI-ORA#
   CREATE TEMP TABLE s_voucher_tmp2(
      docno    LIKE glaq_t.glaqdocno,     #01-彙總單號
      docdt    LIKE glap_t.glapdocdt,     #02-彙總日期
      sw       LIKE type_t.chr1,          #03-1.借  2.貸
      glaqent  LIKE glaq_t.glaqent,       #04-
      glaqcomp LIKE glaq_t.glaqcomp,      #05-
      glaqld   LIKE glaq_t.glaqld,        #06-
      glaq001  LIKE glaq_t.glaq001,       #07-摘要
      glaq002  LIKE glaq_t.glaq002,       #08-科目編號
      glaq005  LIKE glaq_t.glaq005,       #09-交易幣別
      glaq006  LIKE glaq_t.glaq006,       #10-匯率
      glaq007  LIKE glaq_t.glaq007,       #11-計價單位
      glaq008  LIKE glaq_t.glaq008,       #12-數量
      glaq009  LIKE glaq_t.glaq009,       #13-單價
      glaq011  LIKE glaq_t.glaq011,       #14-票據編碼
      glaq012  LIKE glaq_t.glaq012,       #15-票據日期
      glaq013  LIKE glaq_t.glaq013,       #16-申請人
      glaq014  LIKE glaq_t.glaq014,       #17-銀行帳號
      glaq015  LIKE glaq_t.glaq015,       #18-結算方式
      glaq016  LIKE glaq_t.glaq016,       #19-收支項目
      glaq017  LIKE glaq_t.glaq017,       #20-營運據點
      glaq018  LIKE glaq_t.glaq018,       #21-固定核算項-部門
      glaq019  LIKE glaq_t.glaq019,       #22-固定核算項-利潤/成本中心
      glaq020  LIKE glaq_t.glaq020,       #23-固定核算項-區域
      glaq021  LIKE glaq_t.glaq021,       #24-固定核算項-交易客商
      glaq022  LIKE glaq_t.glaq022,       #25-固定核算項-帳款客戶
      glaq023  LIKE glaq_t.glaq023,       #26-固定核算項-客群
      glaq024  LIKE glaq_t.glaq024,       #27-固定核算項-產品類別
      glaq025  LIKE glaq_t.glaq025,       #28-固定核算項-人員
      glaq026  LIKE glaq_t.glaq026,       #29-固定核算項-預算編號
      glaq027  LIKE glaq_t.glaq027,       #30-固定核算項-專案編號
      glaq028  LIKE glaq_t.glaq028,       #31-固定核算項-WBS
      glaq051  LIKE glaq_t.glaq051,       #32-固定核算項-經營方式
      glaq052  LIKE glaq_t.glaq052,       #33-固定核算項-渠道
      glaq053  LIKE glaq_t.glaq053,       #34-固定核算項-品牌
      glaq029  LIKE glaq_t.glaq029,       #35-自由核算項
      glaq030  LIKE glaq_t.glaq030,       #36-自由核算項
      glaq031  LIKE glaq_t.glaq031,       #37-自由核算項
      glaq032  LIKE glaq_t.glaq032,       #38-自由核算項
      glaq033  LIKE glaq_t.glaq033,       #39-自由核算項
      glaq034  LIKE glaq_t.glaq034,       #40-自由核算項
      glaq035  LIKE glaq_t.glaq035,       #41-自由核算項
      glaq036  LIKE glaq_t.glaq036,       #42-自由核算項
      glaq037  LIKE glaq_t.glaq037,       #43-自由核算項
      glaq038  LIKE glaq_t.glaq038,       #44-自由核算項
      d        LIKE glaq_t.glaq003,       #45-借方金額
      c        LIKE glaq_t.glaq004,       #46-貸方金額
      sum      LIKE glaq_t.glaq010,       #47-金額
      glaq039  LIKE glaq_t.glaq039,       #48-本位幣二-匯率
      glaq040  LIKE glaq_t.glaq040,       #49-本位幣二-借方金額
      glaq041  LIKE glaq_t.glaq041,       #40-本位幣二-貸方金額
      glaq042  LIKE glaq_t.glaq042,       #51-本位幣三-匯率
      glaq043  LIKE glaq_t.glaq043,       #52-本位幣三-借方金額
      glaq044  LIKE glaq_t.glaq044,       #53-本位幣三-貸方金額
      docseq   LIKE glaq_t.glaqseq,       #54-來源單據項次
      source   LIKE type_t.chr100,        #55-來源TABLE(回寫時,會依據來源資料回寫)
      glaqseq  LIKE glaq_t.glaqseq,       #56-項次
      xrca039  LIKE xrca_t.xrca039,       #57-會計檢核附件份數
      apcb022  LIKE apcb_t.apcb022,       #58-正負值
      key1     LIKE type_t.chr80,         #59-PK1-彙總欄位
      key2     LIKE type_t.chr80,         #60-PK2-彙總欄位
      type     LIKE type_t.chr1,          #61-彙總類型(0:FOR P次使用,1:科目清單,2:科目彙總)
      glaq010  LIKE glaq_t.glaq010,       #62-原幣(借)
      apcb023  LIKE apcb_t.apcb023,       #63-暫估否
      glgb055  LIKE glgb_t.glgb055,       #64-現金變動碼
      red      LIKE type_t.chr1           #65-红冲否(待抵单使用) 
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create_s_voucher_tmp2'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF   
   #170509-00094#1---add---end---
   
   #現金變動碼用

   DROP TABLE s_voucher_glbc; #ODI-ORA#
   CREATE TEMP TABLE s_voucher_glbc(
      glbcent    LIKE glbc_t.glbcent,
      glbcld     LIKE glbc_t.glbcld,
      glbccomp   LIKE glbc_t.glbccomp, 
      glbcdocno  LIKE glbc_t.glbcdocno,   
      glbcseq    LIKE glbc_t.glbcseq,
      glbcseq1   LIKE glbc_t.glbcseq1,
      glbc001    LIKE glbc_t.glbc001,
      glbc002    LIKE glbc_t.glbc002,
      glbc003    LIKE glbc_t.glbc003,
      glbc004    LIKE glbc_t.glbc004,
      glbc005    LIKE glbc_t.glbc005,
      glbc006    LIKE glbc_t.glbc006,
      glbc007    LIKE glbc_t.glbc007,
      glbc008    LIKE glbc_t.glbc008,
      glbc009    LIKE glbc_t.glbc009,
      glbc010    LIKE glbc_t.glbc010,
      glbc011    LIKE glbc_t.glbc011,
      glbc012    LIKE glbc_t.glbc012,   
      glbc013    LIKE glbc_t.glbc013,
      glbc014    LIKE glbc_t.glbc014,
      key1     LIKE type_t.chr80,         #59-PK1-彙總欄位
      key2     LIKE type_t.chr80          #60-PK2-彙總欄位
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create_s_voucher_glbc'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   
   #201207-00021#1 add ---s for glbc使用
   DROP TABLE s_pre_glbctmp;  
   CREATE TEMP TABLE s_pre_glbctmp(
   docno   LIKE glgb_t.glgbdocno,#單號   
   glgbseq LIKE glgb_t.glgbseq,  #項次
   glgb001 LIKE glgb_t.glgb001,  #摘要
   glgb002 LIKE glgb_t.glgb002,  #科目  
   glgb003 LIKE glgb_t.glgb003,  #借方金額
   glgb004 LIKE glgb_t.glgb004,  #貸方金額
   glgb005 LIKE glgb_t.glgb005,  #交易幣別
   glgb006 LIKE glgb_t.glgb006,  #匯率
   glgb007 LIKE glgb_t.glgb007,  #計價單位
   glgb010 LIKE glgb_t.glgb010,  #原幣
   glgb017 LIKE glgb_t.glgb017,  #營運據點
   glgb018 LIKE glgb_t.glgb018,  #部門
   glgb019 LIKE glgb_t.glgb019,  #利潤/成本中心
   glgb020 LIKE glgb_t.glgb020,  #區域
   glgb021 LIKE glgb_t.glgb021,  #收付款客商
   glgb022 LIKE glgb_t.glgb022,  #帳款客商
   glgb023 LIKE glgb_t.glgb023,  #客群
   glgb024 LIKE glgb_t.glgb024,  #產品分類
   glgb025 LIKE glgb_t.glgb025,  #人員
   glgb026 LIKE glgb_t.glgb026,  #科目類型
   glgb027 LIKE glgb_t.glgb027,  #專案編號
   glgb028 LIKE glgb_t.glgb028,  #WBS
   glgb051 LIKE glgb_t.glgb051,  #經營方式
   glgb052 LIKE glgb_t.glgb052,  #渠道 
   glgb053 LIKE glgb_t.glgb053,  #品牌
   glgb029 LIKE glgb_t.glgb029,  #自由核算項一
   glgb030 LIKE glgb_t.glgb030,  #自由核算項二
   glgb031 LIKE glgb_t.glgb031,  #自由核算項三
   glgb032 LIKE glgb_t.glgb032,  #自由核算項四
   glgb033 LIKE glgb_t.glgb033,  #自由核算項五
   glgb034 LIKE glgb_t.glgb034,  #自由核算項六
   glgb035 LIKE glgb_t.glgb035,  #自由核算項七
   glgb036 LIKE glgb_t.glgb036,  #自由核算項八
   glgb037 LIKE glgb_t.glgb037,  #自由核算項九
   glgb038 LIKE glgb_t.glgb038,  #自由核算項十
   glgb039 LIKE glgb_t.glgb039,  #匯率(本位幣二)
   glgb040 LIKE glgb_t.glgb040,  #借方金額(本位幣二)
   glgb041 LIKE glgb_t.glgb041,  #貸方金額(本位幣二)
   glgb042 LIKE glgb_t.glgb042,  #匯率(本位幣三)
   glgb043 LIKE glgb_t.glgb043,  #借方金額(本位幣三)    
   glgb044 LIKE glgb_t.glgb044,  #貸方金額(本位幣三) 
   glgb055 LIKE glgb_t.glgb055,  #現金變動碼
   sw      LIKE type_t.chr1      #借貸
   );
   #201207-00021#1 add ---e   
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 
# Date & Author..: 14/07/21 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ac(p_ac,p_cate,p_ld,p_date,p_slip,p_sum_type,p_wc,p_preview)
DEFINE p_ac            LIKE type_t.chr2
DEFINE p_type          LIKE type_t.chr2
#DEFINE p_cate          LIKE type_t.chr10        #SCC:8035 #190507-00025#1 mark
DEFINE p_cate          LIKE gzza_t.gzza001       #190507-00025#1 add
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_date          LIKE glap_t.glapdocdt
DEFINE p_slip          LIKE ooba_t.ooba002
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
#DEFINE p_preview       LIKE type_t.chr1       #180808-00051#1 mark       
DEFINE p_preview       LIKE type_t.chr10       #180808-00051#1 add

DEFINE r_success       LIKE type_t.num5
DEFINE r_start_no      LIKE glap_t.glapdocno
DEFINE r_end_no        LIKE glap_t.glapdocno
DEFINE l_cnt           LIKE type_t.num5
#DEFINE l_glab011       LIKE glab_t.glab011    #150825-00004#9 #151203-00013#3 mark
DEFINE l_sql           STRING             #170430-00006#2 add
DEFINE l_str            LIKE type_t.chr10     #180808-00051#1 add 
DEFINE l_acctype        LIKE type_t.chr1      #180808-00051#1 add 會科合併原則
DEFINE l_preview        LIKE type_t.chr1      #180808-00051#1 add 彙總方式
DEFINE l_tok            base.Stringtokenizer  #180808-00051#1 add
#190507-00025#1 add ---s
DEFINE l_cate          LIKE type_t.chr10  #原帳款類型 
DEFINE l_cate2         LIKE type_t.chr10  #沖銷類型 
DEFINE l_cate3         LIKE type_t.chr10  #沖銷類型 
#190507-00025#1 add ---e
DEFINE l_groupglbc     LIKE type_t.chr1   #201207-00021#1 add

   WHENEVER ERROR CONTINUE
   
   LET r_success  = FALSE
   LET r_start_no = NULL
   LET r_end_no   = NULL
   #180808-00051#1---add---(S)拆解p_preview成l_preview和l_acctype
   LET l_preview = ''
   LET l_acctype = ''
   LET l_tok = base.StringTokenizer.create(p_preview,"@")
   WHILE l_tok.hasMoreTokens()
      IF cl_null(l_preview) THEN
         LET l_preview = l_tok.nextToken()
      ELSE
         #LET l_acctype = l_tok.nextToken() #201207-00021#1 mark
         #201207-00021#1 add ---s
         IF cl_null(l_acctype) THEN
            LET l_acctype = l_tok.nextToken()
         ELSE
            LET l_groupglbc = l_tok.nextToken()
         END IF         
         #201207-00021#1 add ---e         
      END IF
   END WHILE
   LET p_preview = l_preview
   IF cl_null(l_acctype) THEN LET l_acctype = '3' END IF #沒有給會科合併原則的一律給3
   IF cl_null(l_groupglbc) THEN LET l_groupglbc = 'Y' END IF #201207-00021#1 add
   #180808-00051#1---add---(E)

   IF cl_null(p_ld) THEN   #帐套参数为空
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00121'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success,r_start_no,r_end_no
   END IF
   
   CALL s_ld_chk_authorization(g_user,p_ld) RETURNING g_sub_success   #检查帐套是否正确
   IF NOT g_sub_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axr-00022'
      LET g_errparam.extend = p_ld
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success,r_start_no,r_end_no
   END IF 
   
   IF cl_null(p_sum_type) THEN   #产生凭证的汇总方式为空
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00123'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success,r_start_no,r_end_no
   END IF
   
   IF cl_null(p_wc) THEN LET p_wc = " 1=1" END IF
   
   #190507-00025#1 add ---s
   #拆解p_cate成l_cate和l_cate2和l_cate3
   LET l_cate = '' LET l_cate2 = '' LET l_cate3 = ''
   LET l_tok = base.StringTokenizer.create(p_cate,"@")
   WHILE l_tok.hasMoreTokens()
      IF cl_null(l_cate) THEN
         LET l_cate = l_tok.nextToken()
      ELSE
         IF cl_null(l_cate2) THEN
            LET l_cate2 = l_tok.nextToken()
         ELSE
            LET l_cate3 = l_tok.nextToken()
         END IF  
      END IF
   END WHILE
   LET p_cate = l_cate
   #190507-00025#1 add ---e

  #CALL s_ld_sel_glaa(p_ld,'glaa004') RETURNING g_sub_success,g_glaa004      #170430-00006#2 mark
   #170430-00006#2---add---start-  
   #180208-00014#1-s
   #SELECT glaa004 INTO g_glaa004 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld      
   SELECT glaa001,glaa004,glaa015,glaa019          
     INTO g_glaa001,g_glaa004,g_glaa015,g_glaa019
     FROM glaa_t
    WHERE glaaent = g_enterprise AND glaald = p_ld   
   #180208-00014#1-e
      
   #180227-00043#3 add-s
   #IF g_prog MATCHES 'aapt920*' THEN    #180410-00038#1 mark
   #IF g_prog MATCHES 'aapt920*' OR g_prog MATCHES 'aapt3*' OR g_prog MATCHES 'aapp13*'  THEN    #180410-00038#1 add  #180521-00018#1 mark
   #IF g_prog MATCHES 'aapt920*' OR g_prog MATCHES 'aapt3*' OR g_prog MATCHES 'aapp13*' OR g_prog MATCHES 'aapp330*'  THEN    #180521-00018#1 add     #180608-00039#1 mark
   #IF g_prog MATCHES 'aapt920*' OR g_prog MATCHES 'aapt3*' OR g_prog MATCHES 'aapp13*' OR g_prog MATCHES 'aapp330*' OR g_prog MATCHES 'aapt420*' THEN #180608-00039#1 add g_prog MATCHES 'aapt420*' #180611-00007#1  mark
#   IF g_prog MATCHES 'aapt920*' OR g_prog MATCHES 'aapt3*' OR g_prog MATCHES 'aapp13*' OR g_prog MATCHES 'aapp330*' OR g_prog MATCHES 'aapt420*' OR g_prog MATCHES 'aapt5*' THEN #180611-00007#1  add g_prog MATCHES 'aapt5*'  #180926-00034#4 mark
   IF g_prog MATCHES 'aapt920*' OR g_prog MATCHES 'aapt3*' OR g_prog MATCHES 'aapp13*' OR g_prog MATCHES 'aapp330*' OR g_prog MATCHES 'aapt420*' OR g_prog MATCHES 'aapt5*' OR g_prog MATCHES 'axrt401*' THEN  #180926-00034#4 add   
      #aapt920时flag用来区别“账款科目资料”“重评价科目资料”，#aapt300时flag用来区别税额科目资料
      LET l_sql = "INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,",
               " glaqld,glaq001,glaq002,glaq005,glaq006,",    
               " glaq007,glaq008,glaq009,glaq011,glaq012,",   
               " glaq013,glaq014,glaq015,glaq016,glaq017,", 
               " glaq018,glaq019,glaq020,glaq021,glaq022,", 
               " glaq023,glaq024,glaq025,glaq026,glaq027,", 
               " glaq028,glaq051,glaq052,glaq053,glaq029,", 
               " glaq030,glaq031,glaq032,glaq033,glaq034,",   
               " glaq035,glaq036,glaq037,glaq038,d,",         
               " c,sum,glaq039,glaq040,glaq041,",   
               " glaq042,glaq043,glaq044,docseq,source,",   
               " glaqseq,xrca039,apcb022,key1,key2,",    
               " type,glaq010,apcb023,glgb055,red,flag)",                   
               " VALUES(?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
               "        ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
               "        ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,", 
               "        ?,?,?,?,?,?)" 
   ELSE
   #180227-00043#3 add-e
      LET l_sql = "INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,",
               " glaqld,glaq001,glaq002,glaq005,glaq006,",    
               " glaq007,glaq008,glaq009,glaq011,glaq012,",   
               " glaq013,glaq014,glaq015,glaq016,glaq017,", 
               " glaq018,glaq019,glaq020,glaq021,glaq022,", 
               " glaq023,glaq024,glaq025,glaq026,glaq027,", 
               " glaq028,glaq051,glaq052,glaq053,glaq029,", 
               " glaq030,glaq031,glaq032,glaq033,glaq034,",   
               " glaq035,glaq036,glaq037,glaq038,d,",         
               " c,sum,glaq039,glaq040,glaq041,",   
               " glaq042,glaq043,glaq044,docseq,source,",   
               " glaqseq,xrca039,apcb022,key1,key2,",    
               #" type,glaq010,apcb023,glgb055,red)",      #180621-00040#1 mark    
               " type,glaq010,apcb023,glgb055,red,flag)",  #180621-00040#1 add
               " VALUES(?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
               "        ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
               "        ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,", 
               #"        ?,?,?,?,?)"         #180621-00040#1 mark   
               "        ?,?,?,?,?,  ?)"      #180621-00040#1 add   

   
   
   END IF   #180227-00043#3 add
   
   
   PREPARE s_aapp330_ins_voucher_tmp_p FROM l_sql
   #170430-00006#2---add---end---
   
   
   #171225-00015#1 add ------
   LET l_sql = "SELECT MIN(docseq)",
               "  FROM s_voucher_tmp",
               " WHERE type = '1' AND glaq002 = ?"
   PREPARE s_aapp330_sel_apcbseq_p1 FROM l_sql
   #171225-00015#1 add end---
   
   LET g_dfin1002 = 'N'
   CASE p_ac
       WHEN '1' #AP                                   
            CASE p_cate    #影響後續傳票寫入glap008
                #WHEN 'P10' CALL s_aapp330_gen_ap_aapt300(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success  #AP-立帐自动产生凭证 #180808-00051#1 mark
                 WHEN 'P10' CALL s_aapp330_gen_ap_aapt300(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success            #180808-00051#1 add
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success           #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
                         
                #WHEN 'P20' CALL s_aapp330_gen_ap_aapt420(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success  #AP-沖帐自动产生凭证 #180808-00051#1 mark
                 WHEN 'P20' CALL s_aapp330_gen_ap_aapt420(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success #180808-00051#1 add
                           #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success           #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
                 
                #WHEN 'P30' CALL s_aapp330_gen_ap_aapt430(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success  #AP-沖帐自动产生凭证 #180808-00051#1 mark
                 WHEN 'P30' CALL s_aapp330_gen_ap_aapt430(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success  #180808-00051#1 add
                           #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success           #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
                 
                #WHEN 'P40' CALL s_aapp330_gen_ap_aapt920(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success #180808-00051#1 mark
                 WHEN 'P40' CALL s_aapp330_gen_ap_aapt920(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success #180808-00051#1 add
                            #151203-00013#3 --s mark
                            ##150825-00004#9 add ------
                            ##如果重評價設定(agli171)成依幣別彙總，在進這裡做處理
                            #SELECT glab011 INTO l_glab011
                            #  FROM glab_t
                            # WHERE glabent = g_enterprise
                            #   AND glabld  = p_ld
                            #   AND glab001 = '25'
                            #   AND glab002 = '8318'
                            #   AND glab003 = '8318_11'
                            #IF l_glab011 = '3' THEN  #3:依幣別匯總
                            #   CALL s_aapp330_gen_ap_3_ins_group_tmp(p_ld) RETURNING g_sub_success
                            #ELSE
                            ##150825-00004#9 add end---
                            #151203-00013#3 --e mark
                              #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success  #180808-00051#1 mark
                            #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success  #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
                            #END IF #150825-00004#9 #151203-00013#3 mark
                            
                #WHEN 'P50' CALL s_aapp330_gen_ap_aapt930(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success     #180808-00051#1 mark
                 WHEN 'P50' CALL s_aapp330_gen_ap_aapt930(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success #180808-00051#1 add    
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success            #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success  #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
                 
                #WHEN 'P51' CALL s_aapp330_gen_ap_aapt931(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success     #180808-00051#1 mark
                 WHEN 'P51' CALL s_aapp330_gen_ap_aapt931(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success     #180808-00051#1 add
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success            #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success  #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success  #201207-00021#1 add
                 
                #WHEN 'P60' CALL s_aapp330_gen_ap_aapt940(p_ld,p_sum_type,p_wc,p_preview) RETURNING g_sub_success     #180808-00051#1 mark
                 WHEN 'P60' CALL s_aapp330_gen_ap_aapt940(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success     #180808-00051#1 add
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type) RETURNING g_sub_success           #180808-00051#1 mark
                           #CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success  #180808-00051#1 add #201207-00021#1 mark
                            CALL s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add
            END CASE
            
            #190507-00025#1 add ---s
            IF NOT cl_null(l_cate2) THEN
               CASE l_cate2 
                  WHEN 'P20' 
                     CALL s_aapp330_gen_ap_aapt420(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success 
                     #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success   #201207-00021#1 mark
                     CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add               
                  WHEN 'P30' 
                     CALL s_aapp330_gen_ap_aapt430(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success                         
                     #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success   #201207-00021#1 mark
                     CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add 
               END CASE
            END IF
            IF NOT cl_null(l_cate3) THEN
               CASE l_cate3               
                  WHEN 'P30' 
                     CALL s_aapp330_gen_ap_aapt430(p_ld,p_sum_type,p_wc,p_preview,l_acctype) RETURNING g_sub_success                         
                     #CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype) RETURNING g_sub_success   #201207-00021#1 mark
                     CALL s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,l_acctype,l_groupglbc) RETURNING g_sub_success #201207-00021#1 add 
               END CASE
            END IF
            #190507-00025#1 add ---e                        
            
      IF NOT g_sub_success THEN RETURN r_success,r_start_no,r_end_no END IF
   END CASE
   LET r_success = TRUE
   RETURN r_success,r_start_no,r_end_no  
END FUNCTION

################################################################################
# Descriptions...: DEFINE CURSOR
# Memo...........: 180808-00051#1 add p_acctype
# Date & Author..: 14/07/18 By Belle
# Modify.........: 18/09/10 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype)
DEFINE p_ld          LIKE glaa_t.glaald
DEFINE p_wc          LIKE type_t.chr1000
DEFINE p_sum_type    LIKE type_t.chr1
DEFINE p_preview     LIKE type_t.chr1
DEFINE p_acctype     LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success     LIKE type_t.num5
DEFINE l_sql         STRING
DEFINE l_ar          DYNAMIC ARRAY OF RECORD
           feld1     LIKE type_t.chr50,      #彙總條件1
           feld2     LIKE type_t.chr50,      #彙總條件2
           feld3     LIKE type_t.chr50,      #彙總條件1
           feld4     LIKE type_t.chr50,      #彙總條件2
           feld5     LIKE type_t.chr50,
           feld6     LIKE type_t.chr50,
           feld7     LIKE type_t.chr50,
           feld8     LIKE type_t.chr50,
           feld9     LIKE type_t.chr50,      #壞帳彙總條件1
           felda     LIKE type_t.chr50       #壞帳彙總條件2
                 END RECORD
DEFINE l_stus        STRING #190114-00063#1
#190528-00007#1 add ---s
DEFINE l_field       STRING
DEFINE l_field1      STRING
DEFINE l_field2      STRING
DEFINE l_field3      STRING
DEFINE l_field4      STRING
#190528-00007#1 add ---e
DEFINE l_glaa004     LIKE glaa_t.glaa004 #201207-00021#1 add



#p0x開頭的表示 由參考的資料設定
#p1x開頭的表示 前端實體TABLE(AP立帳)
#p4x開頭的表示 前端實體TABLE(AP沖帳)
#p2x開頭的表示 temp TABLE
#p3x開頭的表示 回寫的資料     

   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   LET l_stus = " IN ('",p_preview,"','A' ) " #190114-00063#1 add
   CALL l_ar.clear()
   #从agli030取科目设置--(S)
   #LET l_sql = " SELECT * FROM glad_t ",   #161208-00026#23   mark
   #161208-00026#23   add---s
   LET l_sql = " SELECT gladent,gladownid,gladowndp,gladcrtid,gladcrtdp,
                        gladcrtdt,gladmodid,gladmoddt,gladstus,gladld,
                        glad001,glad002,glad003,glad004,glad005,
                        glad006,glad007,glad008,glad009,glad010,
                        glad011,glad012,glad013,glad014,glad015,
                        glad016,glad017,glad0171,glad0172,glad018,
                        glad0181,glad0182,glad019,glad0191,glad0192,
                        glad020,glad0201,glad0202,glad021,glad0211,
                        glad0212,glad022,glad0221,glad0222,glad023,
                        glad0231,glad0232,glad024,glad0241,glad0242,
                        glad025,glad0251,glad0252,glad026,glad0261,
                        glad0262,glad027,glad030,glad031,glad032,
                        glad033,glad034,gladud001,gladud002,gladud003,
                        gladud004,gladud005,gladud006,gladud007,gladud008,
                        gladud009,gladud010,gladud011,gladud012,gladud013,
                        gladud014,gladud015,gladud016,gladud017,gladud018,
                        gladud019,gladud020,gladud021,gladud022,gladud023,
                        gladud024,gladud025,gladud026,gladud027,gladud028,
                        gladud029,gladud030,glad035,glad036"
                        ,",glac016,glac008 ",   #170430-00006#2 add                       
                  " FROM glad_t ",
                  " LEFT JOIN glac_t ON glacent = gladent AND glad001 = glac002 AND glac001 = '",g_glaa004,"'", #170430-00006#2 add
   #161208-00026#23   add---e
               "  WHERE gladent = ",g_enterprise," AND gladld = '",p_ld CLIPPED,"'",
               "    AND glad001 = ? "
   PREPARE gen_ap_1_p01  FROM l_sql
   DECLARE gen_ap_1_c01 CURSOR FOR gen_ap_1_p01
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c01'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF       
   #从agli030取科目设置--(E)
   
   #从临时表中取科目--(S)
   #180808-00051#1---add---(S)
   IF p_acctype = '1' THEN
      LET l_sql = " SELECT DISTINCT docno,glaq002 FROM s_voucher_tmp ",
                  "  WHERE type = '1' AND glaq002 IS NOT NULL",
                  "  ORDER BY docno,glaq002"
   ELSE
   #180808-00051#1---add---(E)
   #LET l_sql = " SELECT DISTINCT glaq002 FROM s_voucher_tmp ",   #180808-00051#1 add
   LET l_sql = " SELECT DISTINCT '',glaq002 FROM s_voucher_tmp ", #180808-00051#1 add
               "  WHERE type = '1' AND glaq002 IS NOT NULL",
               "  ORDER BY glaq002"
   END IF  #180808-00051#1 add
   PREPARE gen_ap_1_p20  FROM l_sql
   DECLARE gen_ap_1_c20 CURSOR FOR gen_ap_1_p20
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c20'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET l_sql = " SELECT UNIQUE key1,key2 FROM s_voucher_tmp WHERE type = '2' ORDER BY KEY1"  #170927-00019#1---add--- ORDER BY KEY1
   PREPARE gen_ap_1_p21  FROM l_sql
   DECLARE gen_ap_1_c21 CURSOR WITH HOLD FOR gen_ap_1_p21
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c21'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #用于生成glaq_t资料的临时表
  #LET l_sql = " SELECT * FROM s_voucher_tmp WHERE type = '2' AND key1 = ? AND key2 = ? ORDER BY glaq002 "        #170509-00094#1 mark
   #180808-00051#1---add---(S)p_acctype = '1'時不用排序
   IF p_acctype = '1' THEN
      LET l_sql = " SELECT * FROM s_voucher_tmp2 WHERE type = '2' AND key1 = ? AND key2 = ? "
   ELSE
   #180808-00051#1---add---(E)
      LET l_sql = " SELECT * FROM s_voucher_tmp2 WHERE type = '2' AND key1 = ? AND key2 = ? ORDER BY sw,glaq002 "    #170509-00094#1 add
   END IF #180808-00051#1 add
   #181015-00017#1---add---(S)
   IF p_sum_type MATCHES '[25]' AND p_acctype = '3' THEN
      LET l_sql = l_sql,",glaq022"
   END IF
   #181015-00017#1---add---(E)
   PREPARE gen_ap_1_p22  FROM l_sql
   DECLARE gen_ap_1_c22 CURSOR WITH HOLD FOR gen_ap_1_p22
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c22'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   #从临时表中取科目--(E)
   
   #回寫帳款單據--(S)
   #LET l_sql = " SELECT DISTINCT docno FROM s_voucher_tmp WHERE type = '1' AND key1 = ? AND key2 = ?" #190507-00025#1 mark
   LET l_sql = " SELECT DISTINCT docno FROM s_voucher_tmp WHERE type = '2' AND key1 = ? AND key2 = ?"  #190507-00025#1 add
   PREPARE gen_ap_1_p23 FROM l_sql
   DECLARE gen_ap_1_c23 CURSOR WITH HOLD FOR gen_ap_1_p23
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c23'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #190507-00025#1 add ---s 判斷是否為aapt4*
   LET l_sql = " SELECT COUNT(1) FROM apda_t ",
               "  WHERE apdaent = ",g_enterprise,
               "    AND apdald = '",p_ld,"' AND apdadocno = ? "
   PREPARE sel_apda_pre FROM l_sql
   
   LET l_sql = " SELECT apda001 FROM apda_t WHERE apdaent = ",g_enterprise," AND apdadocno = ? ",
               "  UNION ",
               " SELECT apca001 FROM apca_t WHERE apcaent = ",g_enterprise," AND apcadocno = ? "
   PREPARE sel_glap008_pre FROM l_sql
   
   LET l_sql = " UPDATE glap_t SET glap008 = ? ",
               "  WHERE glapent = ",g_enterprise,
               "    AND glapdocno = ? "   
   PREPARE upd_glap008_pre FROM l_sql   
   #190507-00025#1 add ---e
   
   LET l_sql = "UPDATE apca_t SET apca038 = ? ",
               " WHERE apcaent = ",g_enterprise,
               "   AND apcald  = '",p_ld,"' AND apcadocno = ? "
   PREPARE gen_ap_1_p24 FROM l_sql
   
   LET l_sql = "UPDATE apda_t SET apda014 = ? ",
               " WHERE apdaent = ",g_enterprise,
               "   AND apdald  = '",p_ld,"' AND apdadocno = ? "
   PREPARE gen_ap_1_p25 FROM l_sql
   ##回寫帳款單據--(E)
   LET l_sql = " SELECT pmdt016 FROM pmdt_t ",
               "  WHERE pmdtent = ",g_enterprise,
               "    AND pmdtdocno = ? AND pmdtseq =?"
   PREPARE pmdt016_pre FROM l_sql
   #資料範圍--(S)
   #aapt3*立帳
   IF p_wc = "!#@" THEN
   #LET l_sql = "SELECT * FROM apca_t ",   #161208-00026#23   mark
   #161208-00026#23   add---s
   LET l_sql = "SELECT apcaent,apcaownid,apcaowndp,apcacrtid,apcacrtdp,
                       apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt,
                       apcapstid,apcapstdt,apcastus,apcald,apcacomp,
                       apcadocno,apcadocdt,apcasite,apca001,apca003,
                       apca004,apca005,apca006,apca007,apca008,
                       apca009,apca010,apca011,apca012,apca013,
                       apca014,apca015,apca016,apca017,apca018,
                       apca019,apca020,apca021,apca022,apca025,
                       apca026,apca027,apca028,apca029,apca030,
                       apca031,apca032,apca033,apca034,apca035,
                       apca036,apca037,apca038,apca039,apca040,
                       apca041,apca042,apca043,apca044,apca045,
                       apca046,apca047,apca048,apca049,apca050,
                       apca051,apca052,apca053,apca054,apca055,
                       apca056,apca057,apca058,apca059,apca060,
                       apca061,apca062,apca063,apca064,apca065,
                       apca066,apca100,apca101,apca103,apca104,
                       apca106,apca107,apca108,apca113,apca114,
                       apca116,apca117,apca118,apca120,apca121,
                       apca123,apca124,apca126,apca127,apca128,
                       apca130,apca131,apca133,apca134,apca136,
                       apca137,apca138,apcaud001,apcaud002,apcaud003,
                       apcaud004,apcaud005,apcaud006,apcaud007,apcaud008,
                       apcaud009,apcaud010,apcaud011,apcaud012,apcaud013,
                       apcaud014,apcaud015,apcaud016,apcaud017,apcaud018,
                       apcaud019,apcaud020,apcaud021,apcaud022,apcaud023,
                       apcaud024,apcaud025,apcaud026,apcaud027,apcaud028,
                       apcaud029,apcaud030,apca067,apca068,apca069,
                       apca070,apca071,apca072,apca073
                  FROM apca_t ",
   #161208-00026#23   add---e
                  " WHERE apcastus = 'Y' AND apca038 IS NULL ",
                  "   AND apcaent = ",g_enterprise, #160628-00002#2 add
                  "   AND apcald   = '",p_ld CLIPPED,"' AND apcadocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"                 
   ELSE                                                            
      #LET l_sql = "SELECT * FROM apca_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT apcaent,apcaownid,apcaowndp,apcacrtid,apcacrtdp,
                          apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt,
                          apcapstid,apcapstdt,apcastus,apcald,apcacomp,
                          apcadocno,apcadocdt,apcasite,apca001,apca003,
                          apca004,apca005,apca006,apca007,apca008,
                          apca009,apca010,apca011,apca012,apca013,
                          apca014,apca015,apca016,apca017,apca018,
                          apca019,apca020,apca021,apca022,apca025,
                          apca026,apca027,apca028,apca029,apca030,
                          apca031,apca032,apca033,apca034,apca035,
                          apca036,apca037,apca038,apca039,apca040,
                          apca041,apca042,apca043,apca044,apca045,
                          apca046,apca047,apca048,apca049,apca050,
                          apca051,apca052,apca053,apca054,apca055,
                          apca056,apca057,apca058,apca059,apca060,
                          apca061,apca062,apca063,apca064,apca065,
                          apca066,apca100,apca101,apca103,apca104,
                          apca106,apca107,apca108,apca113,apca114,
                          apca116,apca117,apca118,apca120,apca121,
                          apca123,apca124,apca126,apca127,apca128,
                          apca130,apca131,apca133,apca134,apca136,
                          apca137,apca138,apcaud001,apcaud002,apcaud003,
                          apcaud004,apcaud005,apcaud006,apcaud007,apcaud008,
                          apcaud009,apcaud010,apcaud011,apcaud012,apcaud013,
                          apcaud014,apcaud015,apcaud016,apcaud017,apcaud018,
                          apcaud019,apcaud020,apcaud021,apcaud022,apcaud023,
                          apcaud024,apcaud025,apcaud026,apcaud027,apcaud028,
                          apcaud029,apcaud030,apca067,apca068,apca069,
                          apca070,apca071,apca072,apca073
                     FROM apca_t ",
      #161208-00026#23   add---e
                  #" WHERE apcastus = '",p_preview   ,"' AND apca038 IS NULL ", #190114-00063#1 mark
                  " WHERE apca038 IS NULL AND apcastus ",l_stus,                #190114-00063#1 add
                  "   AND apcaent = ",g_enterprise, #160628-00002#2 add
                  "   AND apcald   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF
   LET l_sql = l_sql," ORDER BY apcadocdt,apcadocno"  #180808-00051#1 add
   PREPARE gen_ap_1_p10  FROM l_sql
   DECLARE gen_ap_1_c10 CURSOR FOR gen_ap_1_p10
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c10'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   #資料範圍--(E)
   LET l_ar[1].feld1 = 'apcadocno'     LET l_ar[1].feld2 = ",''"
   LET l_ar[2].feld1 = "''"            LET l_ar[2].feld2 = ",to_char(apcadocdt,'yyyy/MM/dd') "
   LET l_ar[3].feld1 = 'apca004'       LET l_ar[3].feld2 = ",''"
   LET l_ar[4].feld1 = 'apca004'       LET l_ar[4].feld2 = ",to_char(apcadocdt,'yyyy/MM/dd') "
   LET l_ar[5].feld1 = "''"            LET l_ar[5].feld2 = ",'' "
   LET l_ar[1].feld3 = 'apdadocno'     LET l_ar[1].feld4 = ",''"
   LET l_ar[2].feld3 = "''"            LET l_ar[2].feld4 = ",to_char(apdadocdt,'yyyy/MM/dd') "
   LET l_ar[3].feld3 = 'apda004'       LET l_ar[3].feld4 = ",''"
   LET l_ar[4].feld3 = 'apda004'       LET l_ar[4].feld4 = ",to_char(apdadocdt,'yyyy/MM/dd') "
   LET l_ar[5].feld3 = "''"            LET l_ar[5].feld4 = ",'' "
   LET l_ar[1].feld5 = 'xremdocno'     LET l_ar[1].feld6 = ",''"
   LET l_ar[2].feld5 = "''"            LET l_ar[2].feld6 = ",to_char(xremdocdt,'yyyy/MM/dd') "
   LET l_ar[3].feld5 = 'xrem004'       LET l_ar[3].feld6 = ",''"
   LET l_ar[4].feld5 = 'xrem004'       LET l_ar[4].feld6 = ",to_char(xremdocdt,'yyyy/MM/dd') "
   LET l_ar[5].feld5 = "''"            LET l_ar[5].feld6 = ",'' "
   LET l_ar[1].feld7 = 'xregdocno'     LET l_ar[1].feld8 = ",''"
   LET l_ar[2].feld7 = "''"            LET l_ar[2].feld8 = ",to_char(xregdocdt,'yyyy/MM/dd') "
   LET l_ar[3].feld7 = 'xreg004'       LET l_ar[3].feld8 = ",''"
   LET l_ar[4].feld7 = 'xreg004'       LET l_ar[4].feld8 = ",to_char(xregdocdt,'yyyy/MM/dd') "
   #LET l_ar[5].feld7 = "''"            LET l_ar[4].feld8 = ",'' "   #170710-00019#1 mark
   LET l_ar[5].feld7 = "''"            LET l_ar[5].feld8 = ",'' "    #170710-00019#1 add
   LET l_ar[1].feld9 = 'xrejdocno'     LET l_ar[1].felda = ",''"
   LET l_ar[2].feld9 = "''"            LET l_ar[2].felda = ",to_char(xrejdocdt,'yyyy/MM/dd') "
   LET l_ar[3].feld9 = 'xrej004'       LET l_ar[3].felda = ",''"
   LET l_ar[4].feld9 = 'xrej004'       LET l_ar[4].felda = ",to_char(xrejdocdt,'yyyy/MM/dd') "
   LET l_ar[5].feld9 = "''"            LET l_ar[5].felda = ",'' "
   
   
   #贷 應付科目--(S)
   #161228-00064#1 add ------
   #aapt330走這>>aapt330付款給員工，是用本幣支付，所以換算至本幣，其他維持原幣顯示
   #IF g_prog = 'aapt330' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapt330*' THEN   #170301-00021#1 by 09263 --add
   
   #161228-00064#1 add end---
                  #             单号/     日期/ 借/    企业/    法人/  帐套/   摘要/    科目
      LET l_sql = "SELECT apcadocno,apcadocdt,'2',apcaent,apcacomp,apcald,apcb047,apcb029,",
                  #          币别/    汇率/   单位/    数量/   单价/票据编号/票据日期/ 申请人/银行帐号/结算方式/收支项目
                  #"       apcb100,apcb102,apcb006,apcb007,apcb101,     '',     '',apca014,     '',     '',    '',",  #因aapt330取單頭無交易幣 因此這裡改取單身   #160630-00012#1 apca101>>>apcb102 #161124-00066#1 mark
                  "       apca100,apca101,apcb006,apcb007,apcb101,     '',     '',apca014,     '',     '',    '',",   #161124-00066#1 add
                  #        营运据点/   部门/利润中心/    区域/收付款客户/帐款客户/客群/产品类别/人员
                  "       apcborga,apcb010,apcb011,apcb024,apca005,apca004,apcb036,apcb012,apcb051,",                 #160407-00019#1   apca004/apca005调换位置
                  #预算编号/专案编号/WBS/經營方式/渠道/品牌
                  "       apca059,apcb015,apcb016,apcb033,apcb034,apcb035,",
                  "       apcb037,apcb038,apcb039,apcb040,apcb041,", #自由核算項1~5
                  "       apcb042,apcb043,apcb044,apcb045,apcb046,", #自由核算項6~10
                  #       借/     贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
                  #"       0,apcb115,apcb105,apcb121,0,apcb125,apcb131,0,apcb135,",      #161124-00066#1 mark
                  "       0,apcb115,apcb115 as b,apcb121,0,apcb125,apcb131,0,apcb135,",  #161124-00066#1 add
                  #項次/來源/--/會計檢核附件份數/正負值
                  "       apcbseq,'apcb','',apca039,apcb022  ",
                  #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
                  #"       ,",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcb105,'','','',",     #161124-00066#1 mark
                  "       ,",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcb115 as c,'','','',", #161124-00066#1 add
                  #"       apca106+apca107,apca116+apca117,apca126+apca127,apca136+apca137 ",      #150317apo                #200219-00047#1 mark
                  "       apca106+apca107-apca109,apca116+apca117-apca119,apca126+apca127-apca129,apca136+apca137-apca139 ", #200219-00047#1 add
                  "  FROM apca_t,apcb_t ",
                  " WHERE apcbent = ",g_enterprise," AND apcbld = '",p_ld CLIPPED,"'",
                  "   AND apcbdocno = ? AND apcaent = apcbent ",
                  "   AND apcald = apcbld AND apcadocno = apcbdocno ",
                  " ORDER BY apcb115*apcb022 desc"
   #161228-00064#1 add ------
   ELSE
                  #       单号/     日期/      借/ 企业/   法人/     帐套/  摘要/   科目
      LET l_sql = "SELECT apcadocno,apcadocdt,'2',apcaent,apcacomp,apcald,apcb047,apcb029,",
                  #       币别/   汇率/    单位/   数量/   单价/    票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
                  "       apca100,apca101,apcb006,apcb007,apcb101,     '',     '',apca014,     '',     '',    '',",
                  #       营运据点/部门/    利润中心/区域/   收付款客户/帐款客户/客群/产品类别/人员
                  #"       apcborga,apcb010,apcb011,apcb024,apca005,apca004,apcb036,apcb012,apcb051,",  #180423-00051#1 mark
                  "       apcborga,apcb010,apcb011,apcb024,apcb055,apcb054,apcb036,apcb012,apcb051,",   #180423-00051#1 add  apca005,apca004-> apcb055,apcb054
                  #       预算编号/专案编号/WBS/經營方式/渠道/品牌
                  "       apca059,apcb015,apcb016,apcb033,apcb034,apcb035,",
                  "       apcb037,apcb038,apcb039,apcb040,apcb041,", #自由核算項1~5
                  "       apcb042,apcb043,apcb044,apcb045,apcb046,", #自由核算項6~10
                  #       借/贷/    原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
                  "       0,apcb115,apcb105,apcb121,0,apcb125,apcb131,0,apcb135,",
                  #       項次/來源/--/會計檢核附件份數/正負值
                  "       apcbseq,'apcb','',apca039,apcb022  ",
                  #       彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
                  "       ,",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcb105,'','','',",
                  "       apca106+apca107,apca116+apca117,apca126+apca127,apca136+apca137 ",
                  "  FROM apca_t,apcb_t ",
                  " WHERE apcbent = ",g_enterprise," AND apcbld = '",p_ld CLIPPED,"'",
                  "   AND apcbdocno = ? AND apcaent = apcbent ",
                  "   AND apcald = apcbld AND apcadocno = apcbdocno ",
                  " ORDER BY apcb115*apcb022 desc"
   END IF
   #161228-00064#1 add end---
   PREPARE gen_ap_1_p12  FROM l_sql
   DECLARE gen_ap_1_c12 CURSOR FOR gen_ap_1_p12
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c12'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF      
   #贷 應付科目--(E)
   
   #借:費用類科目--(S)
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apcadocno,apcadocdt,'1',apcaent,apcacomp,apcald,apcb047,apcb021,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apcb100,apcb102,apcb006,apcb007,apcb101,'','',apca014,'','','',",                 #因aapt330取單頭無交易幣 因此這裡改取單身    #160630-00012#1 apca101>>>apcb102
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               #"       apcborga,apcb010,apcb011,apcb024,apca005,apca004,apcb036,apcb012,apcb051,",       #160407-00019#1   apca004/apca005调换位置 #180423-00051#1 mark
               "       apcborga,apcb010,apcb011,apcb024,apcb055,apcb054,apcb036,apcb012,apcb051,",        #180423-00051#1 add apca005,apca004->apcb055,apcb054
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apca059,apcb015,apcb016,apcb033,apcb034,apcb035,",
               "       apcb037,apcb038,apcb039,apcb040,apcb041,", #自由核算項1~5
               "       apcb042,apcb043,apcb044,apcb045,apcb046,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apcb113,0,apcb103,apcb121,apcb123,0,apcb131,apcb133,0,",
               #項次/來源/--/會計檢核附件份數/正負值
               "       apcbseq,'apcb','',apca039,apcb022,",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcb103,apcb023,'','',",
               #標準成本金額-交易币/本币一二三
               "       apcb001,apcb106,apcb116,apcb126,apcb136 ",                                        #160107-00001#1
               "  FROM apca_t,apcb_t ",
               " WHERE apcbent   = ",g_enterprise," AND apcbld = '",p_ld CLIPPED,"'",
               "   AND apcbdocno = ?      AND apcaent   = apcbent ",
               "   AND apcald    = apcbld AND apcadocno = apcbdocno "              
   PREPARE gen_ap_1_p11  FROM l_sql
   DECLARE gen_ap_1_c11 CURSOR FOR gen_ap_1_p11
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c11'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF               
   #借:費用類科目--(E)
   

   
   #進項稅額--(S)
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apcadocno,apcadocdt,'1',apcaent,apcacomp,apcald,apcb047,xrcd009,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apcb100,apcb102,'',0,0,'','',apca014,'','','',",      #160630-00012#1 apca101>>>apcb102
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               #"       apcborga,apcb010,apcb011,apcb024,apca005,apca004,apcb036,apcb012,apcb051,",    #160407-00019#1   apca004/apca005调换位置 #180423-00051#1 mark
               "       apcborga,apcb010,apcb011,apcb024,apcb055,apcb054,apcb036,apcb012,apcb051,",     #180423-00051#1 add apca005,apca004->apcb055,apcb054
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apca059,apcb015,apcb016,apcb033,apcb034,apcb035,",
               "       apcb037,apcb038,apcb039,apcb040,apcb041,", #自由核算項1~5
               "       apcb042,apcb043,apcb044,apcb045,apcb046,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       xrcd114,0,xrcd104,xrcd121,xrcd124,0,xrcd131,xrcd134,0,",
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrcdseq,'xrcd','',apca039,apcb022,",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "      ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',xrcd104,'','','' ",
               #用于标记税额分录
               "       ,'2' ",   #180410-00038#1 add
               "  FROM apca_t,apcb_t,xrcd_t ",
               " WHERE apcbent   = ",g_enterprise," AND apcbld = '",p_ld CLIPPED,"'",
               "   AND apcaent   = apcbent AND apcald = apcbld AND apcadocno = apcbdocno",
               "   AND xrcdent   = apcbent AND xrcdld = apcbld AND xrcddocno = apcbdocno",
               "   AND apcbdocno = ?       AND xrcdseq   = apcbseq "               
   PREPARE gen_ap_1_p13  FROM l_sql
   DECLARE gen_ap_1_c13 CURSOR FOR gen_ap_1_p13
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c13'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF   
   #進項稅額--(E)
   
   #直接沖帳--(S)
               #借：未税金额
               #单号/日期/借/企业/法人/帐套/摘要/科目               
   LET l_sql = "SELECT apcedocno,apcadocdt,'2',apceent,apcecomp,apceld,apce010,apce016,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apce100,apce101,'',0,0,'','',apce017,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apceorga,apce018,apce019,apce035,apca005,apca004,apce036,apce020,apce017,",    #160407-00019#1
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apce037,apce022,apce023,apce044,apce045,apce046,",
               "       apce051,apce052,apce053,apce054,apce055,", #自由核算項1~5
               "       apce056,apce057,apce058,apce059,apce060,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
#               "       apce119,0, apce109,apce121,apce129,0,apce131,apce139,0,", #160628-00002#2 mark
               "       apce113,0, apce103,apce121,apce123,0,apce131,apce133,0,",  #160628-00002#2 add
               #項次/來源/--/會計檢核附件份數/正負值                                              ", 
               "       apceseq,'apce','',apca039,(CASE apce015 WHEN 'D' THEN '1'ELSE '-1' END),",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apce103,'',apce013,'' ",  #160726-00008#1 apce109 --> apce103
               #待抵单号/用于标记是未税金额分录
               "      ,apce003,'1'",  #160628-00002#2 add 
               "  FROM apca_t,apce_t ",
               " WHERE apceent  = ",g_enterprise," AND apceld = '",p_ld CLIPPED,"'",
               "   AND apcaent  = apceent   AND apcald    = apceld ",
               "   AND apcadocno= apcedocno AND apcedocno = ? "  
               #160628-00002#2--add--str--
               #借：税额
              ," UNION ",
               #单号/日期/借/企业/法人/帐套/摘要/科目               
               "SELECT apcedocno,apcadocdt,'2',apceent,apcecomp,apceld,apce010,apce016,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apce100,apce101,'',0,0,'','',apce017,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apceorga,apce018,apce019,apce035,apca005,apca004,apce036,apce020,apce017,",    #160407-00019#1
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apce037,apce022,apce023,apce044,apce045,apce046,",
               "       apce051,apce052,apce053,apce054,apce055,", #自由核算項1~5
               "       apce056,apce057,apce058,apce059,apce060,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apce114,0, apce104,apce121,apce124,0,apce131,apce134,0,",
               #項次/來源/--/會計檢核附件份數/正負值                                              ", 
               "       apceseq,'apce','',apca039,(CASE apce015 WHEN 'D' THEN '1'ELSE '-1' END),",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apce104,'',apce013,'', ",  #160726-00008#1 apce109 --> apce104
               #待抵单号/用于标记是税额分录
               "       apce003,'2' ", 
               "  FROM apca_t,apce_t ",
               " WHERE apceent  = ",g_enterprise," AND apceld = '",p_ld CLIPPED,"'",
               "   AND apcaent  = apceent   AND apcald    = apceld ",
               "   AND apcadocno= apcedocno AND apcedocno = ? " 
               #160628-00002#2--add--end
   PREPARE gen_ap_1_p14  FROM l_sql
   DECLARE gen_ap_1_c14 CURSOR FOR gen_ap_1_p14
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c14'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF   
   #直接沖帳--(E)
   #直接付款--(S)
               #单号/日期/借/企业/法人/帐套/摘要/科目               
   LET l_sql = "SELECT apdedocno,apcadocdt,'2',apdeent,apdecomp,apdeld,apde010,apde016,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apde100,apde101,'',0,0,'','',apde017,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               #"       apdeorga,apde018,apde019,apde035,apca005,apca004,apde036,apde020,apde017,",    #160407-00019#1 #190517-00057#1 mark
               #"       apdeorga,apde018,apde019,apde035,apde038,apde038,apde036,apde020,apde017,",    #190517-00057#1 add  #190806-00013#1 mark
               "       apdeorga,apde018,apde019,apde035,apde038,apca004,apde036,apde020,apde017,",     #190806-00013#1 add               
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
#               "       '',apde022,apde023,apde044,apde045,apde046,",  #201217-00013#1----mark
               "       '',apde022,apde023,apde042,apde043,apde044,",  #201217-00013#1---add
               "       apde051,apde052,apde053,apde054,apde055,", #自由核算項1~5
               "       apde056,apde057,apde058,apde059,apde060,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apde119,0 , apde109,apde121,apde129,0,apde131,apde139,0,",
               #項次/來源/--/會計檢核附件份數/正負值                                              ", 
               "       apdeseq,'apde','',apca039,(CASE apde015 WHEN 'D' THEN '1'ELSE '-1' END),",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apde109,'',apde012,'' ",
               "  FROM apca_t,apde_t ",
               " WHERE apdeent  = ",g_enterprise," AND apdeld = '",p_ld CLIPPED,"'",
               "   AND apcaent  = apdeent   AND apcald    = apdeld ",
               "   AND apcadocno= apdedocno AND apdedocno = ? "            
   PREPARE gen_ap_1_p15  FROM l_sql
   DECLARE gen_ap_1_c15 CURSOR FOR gen_ap_1_p15
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c15'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF   
   #直接付款--(E)
   
   #雜項暫估--(S)---
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT DISTINCT apcadocno,apcadocdt,'2',apcaent,apcacomp,apcald,apcf049,apcf021,",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apca100,apcf102,'','',apcf101,'','',apca014,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apcforga,apcf026,apcf027,apcf028,apcf029,apcf030,apcf031,apcf032,apcf033,'',",
               #专案编号/WBS/經營方式/渠道/品牌/自由核算项1~10
               "       apcf034,apcf035,apcf036,apcf037,apcf038,apcf039,apcf040,apcf041,apcf042,",
               "       apcf043,apcf044,apcf045,apcf046,apcf047,apcf048,",
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apcf115,0,apcf105,apcf122,apcf125,0,apcf132,apcf135,0,",
               #項次/來源/--/會計檢核附件份數/正負值
               "       apcfseq,'apcf','',0,1, ",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcf105,'','','',",
               #暫估單號
               "       apcf008",
               "  FROM apca_t,apcf_t ",
               " WHERE apcaent = apcfent AND apcald = apcfld AND apcadocno = apcfdocno ",
               "   AND apcfent = ",g_enterprise," AND apcfld = '",p_ld CLIPPED,"'",
               "   AND apcfdocno = ?    ",# AND apcfseq   = ? ",
               "   AND apcf008  <> 'DIFF'"               
   PREPARE gen_ap_1_p163 FROM l_sql
   DECLARE gen_ap_1_c163 CURSOR FOR gen_ap_1_p163
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c161'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 
   

   ##DIFF處理(贷：應收暫估會科(無條件放貸方))
                #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT DISTINCT apcadocno,apcadocdt,'2',apcaent,apcacomp,apcald,apcf049,apcf021,",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apca100,apcf102,'','',apcf101,'','',apca014,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apcforga,apcf026,apcf027,apcf028,apcf029,apcf030,apcf031,apcf032,apcf033,'',",
               #专案编号/WBS/經營方式/渠道/品牌/自由核算项1~10
               "       apcf034,apcf035,apcf036,apcf037,apcf038,apcf039,apcf040,apcf041,apcf042,",
               "       apcf043,apcf044,apcf045,apcf046,apcf047,apcf048,",
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apcf115,0,apcf105,apcf122,apcf125,0,apcf132,apcf135,0,",
               #項次/來源/--/會計檢核附件份數/正負值
               "       apcfseq,'apcf','',0,'1', ",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcf105,'','','' ",
               "  FROM apca_t,apcf_t ",
               " WHERE apcaent = apcfent AND apcald = apcfld AND apcadocno = apcfdocno ",
               "   AND apcaent = ",g_enterprise," AND apcald = '",p_ld CLIPPED,"'",
               "   AND apcadocno = ? ",
               "   AND apcf008   = 'DIFF'"               
   PREPARE gen_ap_1_p162 FROM l_sql
   DECLARE gen_ap_1_c162 CURSOR FOR gen_ap_1_p162
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c162'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 
   #暫估差異--(E)---無條件放貸方
   #160621-00026#1--S
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT DISTINCT apcadocno,apcadocdt,'2',apcaent,apcacomp,apcald,apcf049,apcf023,",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apca100,apcf102,'','',apcf101,'','',apca014,'','','',",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apcforga,apcf026,apcf027,apcf028,apcf029,apcf030,apcf031,apcf032,apcf033,'',",
               #专案编号/WBS/經營方式/渠道/品牌/自由核算项1~10
               "       apcf034,apcf035,apcf036,apcf037,apcf038,apcf039,apcf040,apcf041,apcf042,",
               "       apcf043,apcf044,apcf045,apcf046,apcf047,apcf048,",
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,apcf114,apcf104,apcf122,0,apcf124,apcf132,0,apcf134,",
               #項次/來源/--/會計檢核附件份數/正負值
               "       apcfseq,'apcf','',0,1, ",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',apcf104,'','','',",
               #暫估單號
               "       apcf008",
               "  FROM apca_t,apcf_t ",
               " WHERE apcaent = apcfent AND apcald = apcfld AND apcadocno = apcfdocno ",
               "   AND apcfent = ",g_enterprise," AND apcfld = '",p_ld CLIPPED,"'",
               "   AND apcfdocno = ?    ",# AND apcfseq   = ? ",
               "   AND apcf008  <> 'DIFF'"               
   PREPARE gen_ap_1_p164 FROM l_sql
   DECLARE gen_ap_1_c164 CURSOR FOR gen_ap_1_p164
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c161'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF    
   #160621-00026#1--E
   #160107-00001#1--(S)
   #借:費用類科目--(S)
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apcadocno,apcadocdt,'1',apcaent,apcacomp,apcald,apcb047,apcb021,",
               #币别/汇率/计价单位/计价数量/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apcb100,apcb102,apcb006,apcb007,apcb101,'','',apca014,'','','',",                 #因aapt330取單頭無交易幣 因此這裡改取單身    #160630-00012#1 apca101>>>apcb102
               #营运据点/部门/利润中心/区域/帐款客户/收付款客户/客群/产品类别/人员
               "       apcborga,apcb010,apcb011,apcb024,apca005,apca004,apcb036,apcb012,apcb051,",       #160407-00019#1   apca004/apca005调换位置
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apca059,apcb015,apcb016,apcb033,apcb034,apcb035,",
               "       apcb037,apcb038,apcb039,apcb040,apcb041,", #自由核算項1~5
               "       apcb042,apcb043,apcb044,apcb045,apcb046,", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               #"       (apcb115-apcb116),0,(apcb105-apcb106),apcb121,(apcb125-apcb126),0,apcb131,(apcb135-apcb136),0,", #160706-00009#1 mark
               "       (apcb113-apcb116),0,(apcb103-apcb106),apcb121,(apcb123-apcb126),0,apcb131,(apcb133-apcb136),0,",  #160706-00009#1 add
               #項次/來源/--/會計檢核附件份數/正負值
               "       apcbseq,'apcb','',apca039,apcb022,",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               #"       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',(apcb105-apcb106),apcb023,'','' ", #160706-00009#1 mark
               "       ",l_ar[p_sum_type].feld1,l_ar[p_sum_type].feld2,",'1',(apcb103-apcb106),apcb023,'','' ",  #160706-00009#1 add
               "  FROM apca_t,apcb_t ",
               " WHERE apcbent   = ",g_enterprise," AND apcbld = '",p_ld CLIPPED,"'",
               "   AND apcbdocno = ?      AND apcaent   = apcbent ",
               "   AND apcald    = apcbld AND apcadocno = apcbdocno ",
               "   AND apcb001 IN ('11','20','21') AND apcb023 = 'N' "
   PREPARE gen_ap_1_p18  FROM l_sql
   DECLARE gen_ap_1_c18 CURSOR FOR gen_ap_1_p18
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c18'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF            
   #160107-00001#1--(E)
   #資料範圍--(S)
   #aapt4*沖帳 
   IF p_wc = "!#@" THEN
       #LET l_sql = "SELECT * FROM apda_t ",   #161208-00026#23   mark
       #161208-00026#23   add---s
       LET l_sql = "SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
                           apdasite,apda001,apda002,apda003,apda004,
                           apda005,apda006,apda007,apda008,apda009,
                           apda010,apda011,apda012,apda013,apda014,
                           apda015,apda016,apda017,apda018,apda019,
                           apda020,apda021,apda113,apda123,apda133,
                           apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
                           apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
                           apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
                           apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
                           apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
                           apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
                           apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
                           apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
                           apdaud029,apdaud030,apda104,apda105,apda114,
                           apda115,apda124,apda125,apda134,apda135,
                           apda022,apda023
                      FROM apda_t ",
       #161208-00026#23   add---e
                   " WHERE apdastus = 'Y' AND apda014 IS NULL ",
                   "   AND apdaent = ",g_enterprise, #160628-00002#2 add
                   "   AND apda001 <> '43' ", #190507-00025#1 add
                   "   AND apdald   = '",p_ld CLIPPED,"' AND apdadocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
   ELSE           
      #LET l_sql = "SELECT * FROM apda_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
                          apdasite,apda001,apda002,apda003,apda004,
                          apda005,apda006,apda007,apda008,apda009,
                          apda010,apda011,apda012,apda013,apda014,
                          apda015,apda016,apda017,apda018,apda019,
                          apda020,apda021,apda113,apda123,apda133,
                          apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
                          apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
                          apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
                          apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
                          apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
                          apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
                          apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
                          apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
                          apdaud029,apdaud030,apda104,apda105,apda114,
                          apda115,apda124,apda125,apda134,apda135,
                          apda022,apda023
                     FROM apda_t ",
      #161208-00026#23   add---e
                  " WHERE apdastus = '",p_preview   ,"' AND apda014 IS NULL ",
                  "   AND apdaent = ",g_enterprise, #160628-00002#2 add
                  "   AND apdald   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF          
   LET l_sql = l_sql," ORDER BY apdadocdt,apdadocno" #180808-00051#1 add
   PREPARE gen_ap_1_p40 FROM l_sql
   DECLARE gen_ap_1_c40 CURSOR FOR gen_ap_1_p40
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p40'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   #資料範圍--(E)

   
   #借---(S)

               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apcedocno,apdadocdt,'1',apceent,apcecomp,apceld,apce010,apce016,           ",
               #币别/汇率/计价单位/計價單位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目     
               "       apce100,apce101,'',0,0,'','',apce017,'','','',                             ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员                         
               "       apceorga,apce018,apce019,apce035,apda005,apce038,apce036,apce020,apce017,  ",     #160407-00019#1   apce038/apda005调换位置
               #预算编号/专案编号/WBS/經營方式/渠道/品牌                                               
               "       apce037,apce022,apce023,apce044,apce045,apce046,                           ",
               "       apce051,apce052,apce053,apce054,apce055,                                   ", #自由核算項1~5
               "       apce056,apce057,apce058,apce059,apce060,                                   ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額              
               "       apce119,0,apce109,apce121,apce129,0,apce131,apce139,0,                     ",         
               #項次/來源/--/會計檢核附件份數/正負值                                                   
               "       apceseq,'apce','','','-1' ,                                                ", 
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',apce109,'','',''",
               "  FROM apda_t,apce_t                                                              ",
               " WHERE apceent   =  ",g_enterprise,"                                              ",
               "   AND apceld    = '",p_ld CLIPPED,"'                                             ",
               "   AND apcedocno = ?                                                              ",
               "   AND apdaent   = apceent                                                        ",
               "   AND apdald    = apceld                                                         ",
               "   AND apdadocno = apcedocno                                                      ",
               "   AND apce015 = 'D'                                                              "               
   PREPARE gen_ap_1_p41 FROM l_sql
   DECLARE gen_ap_1_c41 CURSOR FOR gen_ap_1_p41
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c41'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF



   #201112-00004#1---add----str
   IF g_prog MATCHES 'aapt420*' THEN
      LET l_sql = "SELECT apcedocno,apdadocdt,'2',apceent,apcecomp,apceld,apce010,apce016,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
                "      apce100,apce101,'',0,0,'','',apce017,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       apceorga,apce018,apce019,apce035,apda005,apce038,apce036,apce020,apce017,",                
                 #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apce037,apce022,apce023,apce044,apce045,apce046,                         ",
               "       apce051,apce052,apce053,apce054,apce055,                                 ", #自由核算項1~5
               "       apce056,apce057,apce058,apce059,apce060,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,apce119,apce109,apce121,0,apce129,apce131,0,apce139,                   ",         
               #項次/來源/--/會計檢核附件份數/正負值         
               "       apceseq,'apce','','','1' ,                                               ", 
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',apce109,'','',''      ",               
               "  FROM apda_t,apce_t                   ",
               " WHERE apceent   =  ",g_enterprise,"   ",
               "   AND apceld    = '",p_ld CLIPPED,"'  ",
               "   AND apcedocno = ?                   ",
               "   AND apdaent   = apceent             ",
               "   AND apdald    = apceld              ",
               "   AND apdadocno = apcedocno           ",
               "   AND apce015 = 'C'                  "                 
   
   ELSE
   #201112-00004#1---add----end
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apcedocno,apdadocdt,'2',apceent,apcecomp,apceld,apce010,apce016,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
                "      apce100,apce101,'',0,0,'','',apce017,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
              # "       apceorga,apce018,apce019,apce035,apda005,apce038,apce036,apce020,apce017,",    #160407-00019#1   apce038/apda005调换位置 #181018-00024#1 mark
               "       apceorga,apce018,apce019,apce035,apce038,apce038,apce036,apce020,apce017,",    #181018-00024#1 add              
                 #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       apce037,apce022,apce023,apce044,apce045,apce046,                         ",
               "       apce051,apce052,apce053,apce054,apce055,                                 ", #自由核算項1~5
               "       apce056,apce057,apce058,apce059,apce060,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,apce119,apce109,apce121,0,apce129,apce131,0,apce139,                   ",         
               #項次/來源/--/會計檢核附件份數/正負值         
               "       apceseq,'apce','','','1' ,                                               ", 
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',apce109,'','',''      ",               
               "  FROM apda_t,apce_t                   ",
               " WHERE apceent   =  ",g_enterprise,"   ",
               "   AND apceld    = '",p_ld CLIPPED,"'  ",
               "   AND apcedocno = ?                   ",
               "   AND apdaent   = apceent             ",
               "   AND apdald    = apceld              ",
               "   AND apdadocno = apcedocno           ",
               "   AND apce015 = 'C'                  "                 

   END IF   #201112-00004#1---add
   #160509-00004#89--s
   #IF g_prog = 'aapt823' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapt823*' THEN   #170301-00021#1 by 09263 --add
      #多廠商付款核銷,對象在單身
      LET l_sql = cl_replace_str(l_sql,'apda005','apce038')
   END IF
   #160509-00004#89--e
   PREPARE gen_ap_1_p42 FROM l_sql
   DECLARE gen_ap_1_c42 CURSOR FOR gen_ap_1_p42
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c42'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF   
   
   #付款單身借方
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apdedocno,apdadocdt,'1',apdeent,apdecomp,apdeld,apde010,apde016,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
                "      apde100,apde101,'',0,0,'','',apde017,'','','',                           ",
               #营运据点/部门/利润中心/区域/交易客户/帐款客户/客群/产品类别/人员
               "        apdeorga,apde018,apde019,apde035,apde038,apde038,apde036,apde020,apde017, ",
                 #预算编号/专案编号/WBS/經營方式/渠道/品牌  
#               "       '',apde022,apde023,apde044,apde045,apde046,                              ", #201217-00013#1----mark
               "       '',apde022,apde023,apde042,apde043,apde044,                              ", #201217-00013#1----add
               "       apde051,apde052,apde053,apde054,apde055,                                 ", #自由核算項1~5
               "       apde056,apde057,apde058,apde059,apde060,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       apde119,0,apde109,apde121,apde129,0,apde131,apde139,0,                    ",         
               #項次/來源/--/會計檢核附件份數/正負值
               "       apdeseq,'apde','','', '-1',                                              ", 
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',apde109,'',apde012,'' ",                                          
               "  FROM apda_t,apde_t                   ",
               " WHERE apdeent   =  ",g_enterprise,"   ",
               "   AND apdeld    = '",p_ld CLIPPED,"'  ",
               "   AND apdedocno = ?                   ",
               "   AND apdaent   = apdeent             ",
               "   AND apdald    = apdeld              ",
               "   AND apdadocno = apdedocno           ",
               "   AND apde015 = 'D'                   "                 

   #160509-00004#89--s
   #IF g_prog = 'aapt823' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapt823*' THEN   #170301-00021#1 by 09263 --add
      #多廠商付款核銷,對象在單身
      LET l_sql = cl_replace_str(l_sql,'apda005','apce038')
   END IF
   #160509-00004#89--e   
   PREPARE gen_ap_1_p43 FROM l_sql
   DECLARE gen_ap_1_c43 CURSOR FOR gen_ap_1_p43
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c43'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF   
   
   #付款單身貸方--(E)
                  #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apdedocno,apdadocdt,'2',apdeent,apdecomp,apdeld,apde010,apde016,         ",
               #币别/汇率/计价单位/計價單位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       apde100,apde101,'',0,0,'','',apde017,'','','',                           ",
               #营运据点/部门/利润中心/区域/交易客户/帐款客户/客群/产品类别/人员
               "       apdeorga,apde018,apde019,apde035,apde038,apde038,apde036,apde020,apde017, ",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
#               "       '',apde022,apde023,apde044,apde045,apde046,                              ",  #201217-00013#1----mark
               "       '',apde022,apde023,apde042,apde043,apde044,                              ",  #201217-00013#1---add
               "       apde051,apde052,apde053,apde054,apde055,                                 ", #自由核算項1~5
               "       apde056,apde057,apde058,apde059,apde060,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,apde119,apde109,apde121,0,apde129,apde131,0,apde139,                   ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       apdeseq,'apde','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',apde109,'',apde012,'' ",
               "  FROM apda_t,apde_t                                                            ",
               " WHERE apdeent   =  ",g_enterprise,"                                            ",
               "   AND apdeld    = '",p_ld CLIPPED,"'                                           ",
               "   AND apdedocno = ?                                                            ",
               "   AND apdaent   = apdeent AND apdald = apdeld AND apdadocno = apdedocno        ",
               "   AND apde015 = 'C'                                                            "               
   PREPARE gen_ap_1_p44 FROM l_sql
   DECLARE gen_ap_1_c44 CURSOR FOR gen_ap_1_p44
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c44'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 
   
   
   #資料範圍--(S)
   #aapt43*沖帳
   IF p_wc = "!#@" THEN
       #LET l_sql = "SELECT * FROM apda_t ",   #161208-00026#23   mark
       #161208-00026#23   add---s
       LET l_sql = "SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
                           apdasite,apda001,apda002,apda003,apda004,
                           apda005,apda006,apda007,apda008,apda009,
                           apda010,apda011,apda012,apda013,apda014,
                           apda015,apda016,apda017,apda018,apda019,
                           apda020,apda021,apda113,apda123,apda133,
                           apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
                           apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
                           apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
                           apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
                           apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
                           apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
                           apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
                           apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
                           apdaud029,apdaud030,apda104,apda105,apda114,
                           apda115,apda124,apda125,apda134,apda135,
                           apda022,apda023
                      FROM apda_t ",
       #161208-00026#23   add---e
                   " WHERE apdastus = 'Y' AND apda014 IS NULL ",
                   "   AND apdaent = ",g_enterprise, #160628-00002#2 add
                   "   AND apda001 = '43'", #190507-00025#1 add
                   "   AND apdald   = '",p_ld CLIPPED,"' AND apdadocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
   ELSE
      #LET l_sql = "SELECT * FROM apda_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
                          apdasite,apda001,apda002,apda003,apda004,
                          apda005,apda006,apda007,apda008,apda009,
                          apda010,apda011,apda012,apda013,apda014,
                          apda015,apda016,apda017,apda018,apda019,
                          apda020,apda021,apda113,apda123,apda133,
                          apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
                          apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
                          apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
                          apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
                          apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
                          apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
                          apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
                          apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
                          apdaud029,apdaud030,apda104,apda105,apda114,
                          apda115,apda124,apda125,apda134,apda135,
                          apda022,apda023
                     FROM apda_t ",
      #161208-00026#23   add---e
                  " WHERE apdastus = '",p_preview   ,"' AND apda014 IS NULL ",
                  "   AND apdaent = ",g_enterprise, #160628-00002#2 add
                  "   AND apdald   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF
   LET l_sql = l_sql," ORDER BY apdadocdt,apdadocno" #180808-00051#1 add
   PREPARE gen_ap_1_p45 FROM l_sql
   DECLARE gen_ap_1_c45 CURSOR FOR gen_ap_1_p45
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p45'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   #資料範圍--(E)
    
    #目的會計科目-借方
                #单号/日期/借/企业/法人/帐套/摘要/科目
    LET l_sql = "SELECT apdcdocno,apdadocdt,'1',apdcent,apdccomp,apdcld,apdc041,apdc007,           ",
                #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
                "       '',1,'',0,0,'','',apdc017,'','','',                                        ",
                #营运据点/部门/利润中心/区域/交易客户/帐款客户/客群/产品类别/人员
                #"       apdcorga,apdc018,apdc019,apdc024,apdc026,apdc026,apdc025,apdc020,apdc017,  ", #200408-00057#1 mark
                "       apdcorga,apdc018,apdc019,apdc024,apdc042,apdc026,apdc025,apdc020,apdc017,  ",  #200408-00057#1 add
                #预算编号/专案编号/WBS/經營方式/渠道/品牌
                "       '',apdc022,apdc023,apdc027,apdc028,apdc029,                                ",
                "       apdc031,apdc032,apdc033,apdc034,apdc035,                                   ", #自由核算項1~5
                "       apdc036,apdc037,apdc038,apdc039,apdc040,                                   ", #自由核算項6~10
                #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
                "       (apdc213-apdc113),0,0,1,(apdc223-apdc123),0,1,(apdc233-apdc133),0,         ",
                #項次/來源/--/會計檢核附件份數/正負值
                "       apdcseq,'apdc','','', '-1',                                                ", 
                #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
                "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',(apdc213-apdc113),'','','' ", 
                "  FROM apda_t,apdc_t                   ",
                " WHERE apdcent   =  ",g_enterprise,"   ",
                "   AND apdcld    = '",p_ld CLIPPED,"'  ",
                "   AND apdcdocno = ?                   ",
                "   AND apdaent   = apdcent             ",
                "   AND apdald    = apdcld              ",
                "   AND apdadocno = apdcdocno           ",
                "   AND apdc015 = 'D'                   " #180612-00075#1  mark    #180904-00075#1 cancel mark
               #"   AND apdc015   IN ('C','D')          " #180612-00075#1  add     #180904-00075#1 mark                         
    PREPARE gen_ap_1_p46 FROM l_sql
    DECLARE gen_ap_1_c46 CURSOR FOR gen_ap_1_p46
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'gen_ap_1_c46'
       LET g_errparam.popup = TRUE
       CALL cl_err()
       RETURN r_success
    END IF   
   
   #目的會計科目-貸方
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT apdcdocno,apdadocdt,'2',apdcent,apdccomp,apdcld,apdc041,apdc007,           ",
               #币别/汇率/计价单位/計價單位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "      '',1,'',0,0,'','',apdc017,'','','',                                         ",
               #营运据点/部门/利润中心/区域/交易客户/帐款客户/客群/产品类别/人员
               #"        apdcorga,apdc018,apdc019,apdc024,apdc026,apdc026,apdc025,apdc020,apdc017, ", #200408-00057#1 mark
               "        apdcorga,apdc018,apdc019,apdc024,apdc042,apdc026,apdc025,apdc020,apdc017, ",  #200408-00057#1 add
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',apdc022,apdc023,apdc027,apdc028,apdc029,                                ",
               "       apdc031,apdc032,apdc033,apdc034,apdc035,                                   ", #自由核算項1~5
               "       apdc036,apdc037,apdc038,apdc039,apdc040,                                   ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,(apdc213-apdc113),0,1,0,(apdc223-apdc123),1,0,(apdc233-apdc133),         ", 
               #項次/來源/--/會計檢核附件份數/正負值
               "       apdcseq,'apdc','','','1',                                                  ",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld3,l_ar[p_sum_type].feld4,",'1',(apdc213-apdc113),'','','' ",
               "  FROM apda_t,apdc_t                                                              ",
               " WHERE apdcent   =  ",g_enterprise,"                                              ",
               "   AND apdcld    = '",p_ld CLIPPED,"'                                             ",
               "   AND apdcdocno = ?                                                              ",
               "   AND apdaent   = apdcent AND apdald = apdcld AND apdadocno = apdcdocno          ",
               "   AND apdc015 = 'C'                                                              " 
   PREPARE gen_ap_1_p47 FROM l_sql
   DECLARE gen_ap_1_c47 CURSOR FOR gen_ap_1_p47
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c47'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   
   #aapt93X 
   IF p_wc = "!#@" THEN
      #LET l_sql = "SELECT * FROM xrem_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT xrement,xremownid,xremowndp,xremcrtid,xremcrtdp,
                          xremcrtdt,xremmodid,xremmoddt,xremcnfid,xremcnfdt,
                          xremstus,xremsite,xremld,xremcomp,xremdocno,
                          xremdocdt,xrem001,xrem002,xrem003,xrem004,
                          xrem005,xrem006,xremud001,xremud002,xremud003,
                          xremud004,xremud005,xremud006,xremud007,xremud008,
                          xremud009,xremud010,xremud011,xremud012,xremud013,
                          xremud014,xremud015,xremud016,xremud017,xremud018,
                          xremud019,xremud020,xremud021,xremud022,xremud023,
                          xremud024,xremud025,xremud026,xremud027,xremud028,
                          xremud029,xremud030
                     FROM xrem_t ",
      #161208-00026#23   add---e
                  " WHERE xremstus = '",p_preview   ,"' ",
                  "   AND xrement = ",g_enterprise, #160628-00002#2 add
                  "   AND xremld   = '",p_ld CLIPPED,"' AND xremdocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
      ELSE                                                            
         #LET l_sql = "SELECT * FROM xrem_t ",   #161208-00026#23   mark
         #161208-00026#23   add---s
         LET l_sql = "SELECT xrement,xremownid,xremowndp,xremcrtid,xremcrtdp,
                             xremcrtdt,xremmodid,xremmoddt,xremcnfid,xremcnfdt,
                             xremstus,xremsite,xremld,xremcomp,xremdocno,
                             xremdocdt,xrem001,xrem002,xrem003,xrem004,
                             xrem005,xrem006,xremud001,xremud002,xremud003,
                             xremud004,xremud005,xremud006,xremud007,xremud008,
                             xremud009,xremud010,xremud011,xremud012,xremud013,
                             xremud014,xremud015,xremud016,xremud017,xremud018,
                             xremud019,xremud020,xremud021,xremud022,xremud023,
                             xremud024,xremud025,xremud026,xremud027,xremud028,
                             xremud029,xremud030
                        FROM xrem_t ",
         #161208-00026#23   add---e
                     " WHERE xremstus = '",p_preview ,"' ", 
                     "   AND xrement = ",g_enterprise, #160628-00002#2 add
                     "   AND xremld   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF
   PREPARE gen_ap_1_p90  FROM l_sql
   DECLARE gen_ap_1_c90 CURSOR FOR gen_ap_1_p90
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c90'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF   


   #借：暂估費用/本幣暫估金額/暫估費用/暫估收入科目
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xremdocno,xremdocdt,'1',xrement,xremcomp,xremld,xren033,xren043,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xren100,xren101,'',0,0,'','',xrem004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       xremsite,xren011,xren012,xren013,xren010,xren009,xren014,xren015,xren016,",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xren017,xren018,xren020,xren021,xren022,                              ",
               "       xren023,xren024,xren025,xren026,xren027,                                 ", #自由核算項1~5
               "       xren028,xren029,xren030,xren031,xren032,                                 ", #自由核算項6~10
               #借/贷/原币稅額/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       xren113,0,xren103,'',0,0,'',0,0,                                         ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrenseq,'xrem','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld5,l_ar[p_sum_type].feld6,",'1',xren103,'','',''      ",
               #"       ,xren005 ",   #170213-00048#1 add
               "       ,xren005,xren004 ",   #170915-00038#10 add xren004
               "  FROM xrem_t,xren_t                                                            ",
               " WHERE xrement   =  ",g_enterprise,"                                            ",
               "   AND xremld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xremdocno = ?                                                            ",
               #"   AND xrement   = xrement AND xremdocno = xrendocno                            "    #181225-00037#1 mark
               "   AND xrement   = xrenent AND xremdocno = xrendocno                            "     #181225-00037#1 add              
   PREPARE gen_ap_1_p91 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p91'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c91 CURSOR FOR gen_ap_1_p91
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c91'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 


   #借：暫估稅額/本幣暫估稅額/稅別會科
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xremdocno,xremdocdt,'1',xrement,xremcomp,xremld,xren033,xren042,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xren100,xren101,'',0,0,'','',xrem004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       xremsite,xren011,xren012,xren013,xren010,xren009,xren014,xren015,xren016,",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xren017,xren018,xren020,xren021,xren022,                              ",
               "       xren023,xren024,xren025,xren026,xren027,                                 ", #自由核算項1~5
               "       xren028,xren029,xren030,xren031,xren032,                                 ", #自由核算項6~10
               #借/贷/原币稅額/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       xren114,0,xren104,'',0,0,'',0,0,                                         ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrenseq,'xrem','','','1',                                                ",               
                #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld5,l_ar[p_sum_type].feld6,",'1',xren104,'','',''      ",
               "        ,xren004 ", #170915-00038#10 add xren004
               "  FROM xrem_t,xren_t                                                            ",
               " WHERE xrement   =  ",g_enterprise,"                                            ",
               "   AND xremld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xremdocno = ?                                                            ",
               #"   AND xrement   = xrement AND xremdocno = xrendocno                            "     #181225-00037#1 mark
               "   AND xrement   = xrenent AND xremdocno = xrendocno                            "      #181225-00037#1 add               
   PREPARE gen_ap_1_p92 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p92'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c92 CURSOR FOR gen_ap_1_p92
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c92'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF  


   #贷：暂估應付/本幣暫估含稅金額/應收付科目
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xremdocno,xremdocdt,'1',xrement,xremcomp,xremld,xren033,xren019,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xren100,xren101,'',0,0,'','',xrem004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       xremsite,xren011,xren012,xren013,xren010,xren009,xren014,xren015,xren016,",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xren017,xren018,xren020,xren021,xren022,                              ",
               "       xren023,xren024,xren025,xren026,xren027,                                 ", #自由核算項1~5
               "       xren028,xren029,xren030,xren031,xren032,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,xren115,xren105,'',0,0,'',0,0,                                         ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrenseq,'xrem','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld5,l_ar[p_sum_type].feld6,",'1',xren105,'','',''      ",
               "       ,xren004 ", #170915-00038#10 add
               "  FROM xrem_t,xren_t                                                            ",
               " WHERE xrement   =  ",g_enterprise,"                                            ",
               "   AND xremld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xremdocno = ?                                                            ",
               #"   AND xrement   = xrement AND xremdocno = xrendocno                            "      #181225-00037#1 mark
               "   AND xrement   = xrenent AND xremdocno = xrendocno                            "       #181225-00037#1 add     
               
   PREPARE gen_ap_1_p93 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p93'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c93 CURSOR FOR gen_ap_1_p93
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c93'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 

   #aapt92X 
   IF p_wc = "!#@" THEN
      #LET l_sql = "SELECT * FROM xreg_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT xregent,xregcomp,xregsite,xregdocno,xregdocdt,
                          xregld,xreg001,xreg002,xreg003,xreg004,
                          xreg005,xregstus,xregownid,xregowndp,xregcrtid,
                          xregcrtdp,xregcrtdt,xregmodid,xregmoddt,xregcnfid,
                          xregcnfdt,xregud001,xregud002,xregud003,xregud004,
                          xregud005,xregud006,xregud007,xregud008,xregud009,
                          xregud010,xregud011,xregud012,xregud013,xregud014,
                          xregud015,xregud016,xregud017,xregud018,xregud019,
                          xregud020,xregud021,xregud022,xregud023,xregud024,
                          xregud025,xregud026,xregud027,xregud028,xregud029,
                          xregud030
                     FROM xreg_t ",
      #161208-00026#23   add---e
                  " WHERE xregstus = '",p_preview   ,"'",
                  "   AND xregent = ",g_enterprise, #160628-00002#2 add
                  "   AND xregld   = '",p_ld CLIPPED,"' AND xregdocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
   ELSE
      #LET l_sql = "SELECT * FROM xreg_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT xregent,xregcomp,xregsite,xregdocno,xregdocdt,
                          xregld,xreg001,xreg002,xreg003,xreg004,
                          xreg005,xregstus,xregownid,xregowndp,xregcrtid,
                          xregcrtdp,xregcrtdt,xregmodid,xregmoddt,xregcnfid,
                          xregcnfdt,xregud001,xregud002,xregud003,xregud004,
                          xregud005,xregud006,xregud007,xregud008,xregud009,
                          xregud010,xregud011,xregud012,xregud013,xregud014,
                          xregud015,xregud016,xregud017,xregud018,xregud019,
                          xregud020,xregud021,xregud022,xregud023,xregud024,
                          xregud025,xregud026,xregud027,xregud028,xregud029,
                          xregud030
                     FROM xreg_t ",
      #161208-00026#23   add---e
                  " WHERE xregstus = '",p_preview   ,"'",
                  "   AND xregent = ",g_enterprise, #160628-00002#2 add
                  "   AND xregld   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF
   PREPARE gen_ap_1_p94  FROM l_sql
   DECLARE gen_ap_1_c94 CURSOR FOR gen_ap_1_p94
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c94'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF

   #借：匯兌損失科目
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xregdocno,xregdocdt,'1',xregent,xregcomp,xregld,xreh033,xreh034,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xreh100,xreh101,'',0,0,'','',xreg004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               #"       xregsite,xreh011,xreh012,xreh013,xreh010,xreh009,xreh014,xreh015,xreh016,",    #170328-00116#1 mark
               "       xrehorga,xreh011,xreh012,xreh013,xreh010,xreh009,xreh014,xreh015,xreh016,",    #170328-00116#1
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xreh017,xreh018,xreh020,xreh021,xreh022,                              ",
               "       xreh023,xreh024,xreh025,xreh026,xreh027,                                 ", #自由核算項1~5
               "       xreh028,xreh029,xreh030,xreh031,xreh032,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               #"       xreh115,0,xreh115,xreh125,xreh124,0,xreh135,xreh134,0,                   ",  #150227 add
               "       xreh115,0,0,xreh125,xreh124,0,xreh135,xreh134,0,                          ",  #150227 add
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrehseq,'xreg','','','1',                                                ",
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld7,l_ar[p_sum_type].feld8,",'1',xreh115,'','',''      ",
               "  FROM xreg_t,xreh_t                                                            ",
               " WHERE xregent   =  ",g_enterprise,"                                            ",
               "   AND xregld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xregdocno = ?                                                            ",
               "   AND xregent   = xrehent AND xregdocno = xrehdocno                            "
   PREPARE gen_ap_1_p95 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p95'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c95 CURSOR FOR gen_ap_1_p95
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c95'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF


   #贷：應付科目
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xregdocno,xregdocdt,'2',xregent,xregcomp,xregld,xreh033,xreh019,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xreh100,xreh101,'',0,0,'','',xreg004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               #"       xregsite,xreh011,xreh012,xreh013,xreh010,xreh009,xreh014,xreh015,xreh016,",    #170328-00116#1 mark
               "       xrehorga,xreh011,xreh012,xreh013,xreh010,xreh009,xreh014,xreh015,xreh016,",     #170328-00116#1
               #预算编号/专案编号/WBS/經營方式/渠道/品牌 
               "       '',xreh017,xreh018,xreh020,xreh021,xreh022,                              ",     
               "       xreh023,xreh024,xreh025,xreh026,xreh027,                                 ", #自由核算項1~5
               "       xreh028,xreh029,xreh030,xreh031,xreh032,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               #"       0,xreh115,xreh115,xreh125,0,xreh124,xreh135,0,xreh134,                   ",   #150227 mark
               "       0,xreh115,0,xreh125,0,xreh124,xreh135,0,xreh134,                         ",    #150227 add   
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrehseq,'xreg','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld7,l_ar[p_sum_type].feld8,",'1',xreh115,'','',''     ",
               "  FROM xreg_t,xreh_t                                                            ",
               " WHERE xregent   =  ",g_enterprise,"                                            ",
               "   AND xregld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xregdocno = ?                                                            ",
               "   AND xregent   = xrehent AND xregdocno = xrehdocno                            "             
   PREPARE gen_ap_1_p96 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p96'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c96 CURSOR FOR gen_ap_1_p96
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c96'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   ###壞帳帳齡傳票###
   
   IF p_wc = "!#@" THEN
       #LET l_sql = "SELECT * FROM xrej_t ",   #161208-00026#23   mark
       #161208-00026#23   add---s
       LET l_sql = "SELECT xrejent,xrejownid,xrejowndp,xrejcrtid,xrejcrtdp,
                           xrejcrtdt,xrejmodid,xrejmoddt,xrejcnfid,xrejcnfdt,
                           xrejstus,xrejsite,xrejld,xrejcomp,xrejdocno,
                           xrejdocdt,xrej001,xrej002,xrej003,xrej004,
                           xrej005,xrejud001,xrejud002,xrejud003,xrejud004,
                           xrejud005,xrejud006,xrejud007,xrejud008,xrejud009,
                           xrejud010,xrejud011,xrejud012,xrejud013,xrejud014,
                           xrejud015,xrejud016,xrejud017,xrejud018,xrejud019,
                           xrejud020,xrejud021,xrejud022,xrejud023,xrejud024,
                           xrejud025,xrejud026,xrejud027,xrejud028,xrejud029,
                           xrejud030
                      FROM xrej_t ",
       #161208-00026#23   add---e
                   " WHERE xrejstus = '",p_preview   ,"' ",
                   "   AND xrejent = ",g_enterprise, #160628-00002#2 add
                   "   AND xrejld   = '",p_ld CLIPPED,"' AND xrejdocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
   ELSE           
      #LET l_sql = "SELECT * FROM xrej_t ",   #161208-00026#23   mark
      #161208-00026#23   add---s
      LET l_sql = "SELECT xrejent,xrejownid,xrejowndp,xrejcrtid,xrejcrtdp,
                          xrejcrtdt,xrejmodid,xrejmoddt,xrejcnfid,xrejcnfdt,
                          xrejstus,xrejsite,xrejld,xrejcomp,xrejdocno,
                          xrejdocdt,xrej001,xrej002,xrej003,xrej004,
                          xrej005,xrejud001,xrejud002,xrejud003,xrejud004,
                          xrejud005,xrejud006,xrejud007,xrejud008,xrejud009,
                          xrejud010,xrejud011,xrejud012,xrejud013,xrejud014,
                          xrejud015,xrejud016,xrejud017,xrejud018,xrejud019,
                          xrejud020,xrejud021,xrejud022,xrejud023,xrejud024,
                          xrejud025,xrejud026,xrejud027,xrejud028,xrejud029,
                          xrejud030
                     FROM xrej_t ",
      #161208-00026#23   add---e
                  " WHERE xrejstus = '",p_preview   ,"' ",
                  "   AND xrejent = ",g_enterprise, #160628-00002#2 add
                  "   AND xrejld   = '",p_ld CLIPPED,"' AND ",p_wc
   END IF            
   PREPARE gen_ap_1_p9401 FROM l_sql
   DECLARE gen_ap_1_c9401 CURSOR FOR gen_ap_1_p9401
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p9401'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET l_sql = "SELECT xrejdocno,xrejdocdt,'1',xrejent,xrejcomp,xrejld,xrek033,xrek019,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xrek100,xrek101,'',0,0,'','',xrej004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       xrejsite,xrek011,xrek012,xrek013,xrek010,xrek009,xrek014,xrek015,xrek016,",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xrek017,xrek018,xrek020,xrek021,xrek022,                              ",
               "       xrek023,xrek024,xrek025,xrek026,xrek027,                                 ", #自由核算項1~5
               "       xrek028,xrek029,xrek030,xrek031,xrek032,                                 ", #自由核算項6~10
               #借/贷/原币稅額/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       xrek117,0,xrek107,'',0,0,'',0,0,                                         ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrekseq,'xrej','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld9,l_ar[p_sum_type].felda,",'1',xrek107,'','',''     ",
               "  FROM xrej_t,xrek_t                                                            ",
               " WHERE xrejent   =  ",g_enterprise,"                                            ",
               "   AND xrejld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xrejdocno = ?                                                            ",
               #"   AND xrejent   = xrejent AND xrejdocno = xrekdocno                            "    #181225-00037#1 mark
               "   AND xrejent   = xrekent AND xrejdocno = xrekdocno                            "     #181225-00037#1 add              
   PREPARE gen_ap_1_p9a FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p9a'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c9a CURSOR FOR gen_ap_1_p9a
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c9a'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 
   
   #贷：暂估應付/本幣暫估含稅金額/應收付科目
               #单号/日期/借/企业/法人/帐套/摘要/科目
   LET l_sql = "SELECT xrejdocno,xrejdocdt,'1',xrejent,xrejcomp,xrejld,xrek033,xrek041,         ",
               #币别/汇率/计价单位/单价/票据编号/票据日期/申请人/银行帐号/结算方式/收支项目
               "       xrek100,xrek101,'',0,0,'','',xrej004,'','','',                           ",
               #营运据点/部门/利润中心/区域/收付款客户/帐款客户/客群/产品类别/人员
               "       xrejsite,xrek011,xrek012,xrek013,xrek010,xrek009,xrek014,xrek015,xrek016,",
               #预算编号/专案编号/WBS/經營方式/渠道/品牌
               "       '',xrek017,xrek018,xrek020,xrek021,xrek022,                              ",
               "       xrek023,xrek024,xrek025,xrek026,xrek027,                                 ", #自由核算項1~5
               "       xrek028,xrek029,xrek030,xrek031,xrek032,                                 ", #自由核算項6~10
               #借/贷/原币金额/本位幣二匯率/借方金額/貸方金額/本位幣三匯率/借方金額/貸方金額
               "       0,xrek117,xrek107,'',0,0,'',0,0,                                         ",        
               #項次/來源/--/會計檢核附件份數/正負值
               "       xrekseq,'xrej','','','1',                                                ",               
               #彙總方式1/彙總方式2/類型/原幣金額/暫估否/現金變動碼/紅沖否
               "       ",l_ar[p_sum_type].feld9,l_ar[p_sum_type].felda,",'1',xrek107,'','',''      ",
               "  FROM xrej_t,xrek_t                                                            ",
               " WHERE xrejent   =  ",g_enterprise,"                                            ",
               "   AND xrejld    = '",p_ld CLIPPED,"'                                           ",
               "   AND xrejdocno = ?                                                            ",
               #"   AND xrejent   = xrejent AND xrejdocno = xrekdocno                            "        #181225-00037#1 mark
               "   AND xrejent   = xrekent AND xrejdocno = xrekdocno                            "         #181225-00037#1 add               
   PREPARE gen_ap_1_p9b FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_p9b'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   DECLARE gen_ap_1_c9b CURSOR FOR gen_ap_1_p9b
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'gen_ap_1_c9b'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #190528-00007#1 add ---s
   #LET l_sql = " SELECT glaqseq,glaq002,(CASE WHEN glaq003 <> 0 THEN 1 ELSE 2 END) sw", #190806-00013#1 mark
   #190806-00013#1 add ---s
   LET l_sql = " SELECT glaqent,glaqcomp,glaqld,glaqdocno,glaqseq, ",
               "        glaq001,glaq002,glaq003,glaq004,glaq005,   ",
               "        glaq006,glaq007,glaq008,glaq009,glaq010,   ",
               "        glaq011,glaq012,glaq013,glaq014,glaq015,   ",
               "        glaq016,glaq017,glaq018,glaq019,glaq020,   ",
               "        glaq021,glaq022,glaq023,glaq024,glaq025,   ",
               "        glaq026,glaq027,glaq028,glaq029,glaq030,   ",
               "        glaq031,glaq032,glaq033,glaq034,glaq035,   ",
               "        glaq036,glaq037,glaq038,glaq039,glaq040,   ",
               "        glaq041,glaq042,glaq043,glaq044,glaq051,   ",
               "        glaq052,glaq053,                           ",
               "        glaqud001,glaqud002,glaqud003,glaqud004,glaqud005, ",
               "        glaqud006,glaqud007,glaqud008,glaqud009,glaqud010, ",
               "        glaqud011,glaqud012,glaqud013,glaqud014,glaqud015, ",
               "        glaqud016,glaqud017,glaqud018,glaqud019,glaqud020, ",
               "        glaqud021,glaqud022,glaqud023,glaqud024,glaqud025, ",
               "        glaqud026,glaqud027,glaqud028,glaqud029,glaqud030, ",  
               "        (CASE WHEN glaq003 <> 0 THEN 1 ELSE 2 END) sw",
   #190806-00013#1 add ---e               
               "   FROM glaq_t",
               "  WHERE glaqent=",g_enterprise," AND glaqld=? AND glaqdocno= ?",
               "  ORDER BY glaqseq"
   PREPARE s_aapp330_sel_glaq_p FROM l_sql
   DECLARE s_aapp330_sel_glaq_c CURSOR FOR s_aapp330_sel_glaq_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 's_aapp330_sel_glaq_c'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF   
   
   CASE p_acctype
      WHEN '1'
         LET l_field  = " glgb003,glgb004,"
         LET l_field1 = " glgb040,glgb041,"
         LET l_field2 = " glgb043,glgb044,"
         LET l_field3 = " "
         LET l_field4 = " ORDER BY glgbdocno,glgbseq"
      
      WHEN '2'
         LET l_field  = " glgb003,glgb004,"
         LET l_field1 = " glgb040,glgb041,"
         LET l_field2 = " glgb043,glgb044,"
         #LET l_field3 = " AND glgb002 = ? " #190806-00013#1 mark
         #190806-00013#1 add ---s
         LET l_field3 = " AND (glgb001  = ? OR glgb001 IS NULL OR glgb001 = ' ')",
                        " AND (glgb002  = ? OR glgb002 IS NULL OR glgb002 = ' ')",
                        " AND (glgb005  = ? OR glgb005 IS NULL OR glgb005 = ' ')",
                        " AND (glgb006  = ? OR glgb006 IS NULL)",
                        " AND (glgb039  = ? OR glgb039 IS NULL)",
                        " AND (glgb042  = ? OR glgb042 IS NULL)",
                        " AND (glgb018  = ? OR glgb018 IS NULL OR glgb018 = ' ')",
                        " AND (glgb019  = ? OR glgb019 IS NULL OR glgb019 = ' ')",
                        " AND (glgb020  = ? OR glgb020 IS NULL OR glgb020 = ' ')",
                        " AND (glgb023  = ? OR glgb023 IS NULL OR glgb023 = ' ')",
                        " AND (glgb024  = ? OR glgb024 IS NULL OR glgb024 = ' ')",
                        " AND (glgb025  = ? OR glgb025 IS NULL OR glgb025 = ' ')",
                        " AND (glgb027  = ? OR glgb027 IS NULL OR glgb027 = ' ')",
                        " AND (glgb028  = ? OR glgb028 IS NULL OR glgb028 = ' ')",
                        " AND (glgb051  = ? OR glgb051 IS NULL OR glgb051 = ' ')",
                        " AND (glgb052  = ? OR glgb052 IS NULL OR glgb052 = ' ')",
                        " AND (glgb053  = ? OR glgb053 IS NULL OR glgb053 = ' ')",
                        " AND (glgb029  = ? OR glgb029 IS NULL OR glgb029 = ' ')",
                        " AND (glgb030  = ? OR glgb030 IS NULL OR glgb030 = ' ')",
                        " AND (glgb031  = ? OR glgb031 IS NULL OR glgb031 = ' ')",
                        " AND (glgb032  = ? OR glgb032 IS NULL OR glgb032 = ' ')",
                        " AND (glgb033  = ? OR glgb033 IS NULL OR glgb033 = ' ')",
                        " AND (glgb034  = ? OR glgb034 IS NULL OR glgb034 = ' ')",
                        " AND (glgb035  = ? OR glgb035 IS NULL OR glgb035 = ' ')",
                        " AND (glgb036  = ? OR glgb036 IS NULL OR glgb036 = ' ')",
                        " AND (glgb037  = ? OR glgb037 IS NULL OR glgb037 = ' ')",
                        " AND (glgb038  = ? OR glgb038 IS NULL OR glgb038 = ' ')",
                        " AND (glgb007  = ? OR glgb007 IS NULL OR glgb007 = ' ')"
         #190806-00013#1 add ---e
         LET l_field4 = " "

      WHEN '3'
         LET l_field =  " SUM(glgb003),SUM(glgb004),"
         LET l_field1 = " SUM(glgb040),SUM(glgb041),"
         LET l_field2 = " SUM(glgb043),SUM(glgb044),"
         #LET l_field3 = " AND glgb002 = ? " #190806-00013#1 mark
         #190806-00013#1 add ---s
         LET l_field3 = " AND (glgb001  = ? OR glgb001 IS NULL OR glgb001 = ' ')",
                        " AND (glgb002  = ? OR glgb002 IS NULL OR glgb002 = ' ')",
                        " AND (glgb005  = ? OR glgb005 IS NULL OR glgb005 = ' ')",
                        " AND (glgb006  = ? OR glgb006 IS NULL)",
                        " AND (glgb039  = ? OR glgb039 IS NULL)",
                        " AND (glgb042  = ? OR glgb042 IS NULL)",
                        " AND (glgb018  = ? OR glgb018 IS NULL OR glgb018 = ' ')",
                        " AND (glgb019  = ? OR glgb019 IS NULL OR glgb019 = ' ')",
                        " AND (glgb020  = ? OR glgb020 IS NULL OR glgb020 = ' ')",
                        " AND (glgb023  = ? OR glgb023 IS NULL OR glgb023 = ' ')",
                        " AND (glgb024  = ? OR glgb024 IS NULL OR glgb024 = ' ')",
                        " AND (glgb025  = ? OR glgb025 IS NULL OR glgb025 = ' ')",
                        " AND (glgb027  = ? OR glgb027 IS NULL OR glgb027 = ' ')",
                        " AND (glgb028  = ? OR glgb028 IS NULL OR glgb028 = ' ')",
                        " AND (glgb051  = ? OR glgb051 IS NULL OR glgb051 = ' ')",
                        " AND (glgb052  = ? OR glgb052 IS NULL OR glgb052 = ' ')",
                        " AND (glgb053  = ? OR glgb053 IS NULL OR glgb053 = ' ')",
                        " AND (glgb029  = ? OR glgb029 IS NULL OR glgb029 = ' ')",
                        " AND (glgb030  = ? OR glgb030 IS NULL OR glgb030 = ' ')",
                        " AND (glgb031  = ? OR glgb031 IS NULL OR glgb031 = ' ')",
                        " AND (glgb032  = ? OR glgb032 IS NULL OR glgb032 = ' ')",
                        " AND (glgb033  = ? OR glgb033 IS NULL OR glgb033 = ' ')",
                        " AND (glgb034  = ? OR glgb034 IS NULL OR glgb034 = ' ')",
                        " AND (glgb035  = ? OR glgb035 IS NULL OR glgb035 = ' ')",
                        " AND (glgb036  = ? OR glgb036 IS NULL OR glgb036 = ' ')",
                        " AND (glgb037  = ? OR glgb037 IS NULL OR glgb037 = ' ')",
                        " AND (glgb038  = ? OR glgb038 IS NULL OR glgb038 = ' ')",
                        " AND (glgb007  = ? OR glgb007 IS NULL OR glgb007 = ' ')"
         #190806-00013#1 add ---e
         LET l_field4 = "GROUP BY (CASE WHEN glgb003 <> 0 THEN 1 ELSE 2 END),", 
                        "glgbdocno,glgadocdt,glgbcomp,glgbld, ", 
                        "glgbseq,glgb001,glgb002,glgb005,glgb006,",  
                        "glgb011,glgb012,glgb013,glgb014,glgb015,",
                        "glgb016,glgb017,glgb018,glgb019,glgb020,", 
                        "glgb021,glgb022,glgb023,glgb024,glgb025,", #190619-00013#1 mark #190806-00013#1 remark
                        #"glgb021,apca004,glgb023,glgb024,glgb025,", #190619-00013#1 add #190806-00013#1 mark
                        "glgb026,glgb027,glgb028,glgb051,glgb052,",  
                        "glgb053,glgb029,glgb030,glgb031,glgb032,", 
                        "glgb033,glgb034,glgb035,glgb036,glgb037,",  
                        "glgb038,glgb055,glgb007,glgb008,glgb009,",  
                        "glgb010,glgb039,glgb042"      
   END CASE
   LET l_sql = "SELECT (CASE WHEN glgb003 <> 0 THEN 1 ELSE 2 END),",
               "       glgbdocno,glgadocdt,glgbcomp,glgbld, ", 
               "       glgbseq,glgb001,glgb002,glgb005,glgb006,",  
               "       glgb011,glgb012,glgb013,glgb014,glgb015,",
               "       glgb016,glgb017,glgb018,glgb019,glgb020,", 
               "       glgb021,glgb022,glgb023,glgb024,glgb025,",  #190619-00013#1 mark #190806-00013#1 remark
              #"       glgb021,apca004,glgb023,glgb024,glgb025,",  #190619-00013#1 add #190806-00013#1 mark
               "       glgb026,glgb027,glgb028,glgb051,glgb052,",  
               "       glgb053,glgb029,glgb030,glgb031,glgb032,", 
               "       glgb033,glgb034,glgb035,glgb036,glgb037,",  
               "       glgb038,glgb055,glgb007,glgb008,glgb009,",  
               "       glgb010,",l_field,"glgb039,",l_field1,"glgb042,",l_field2, 
               "       '','','' ", 
              #"  FROM glga_t,glgb_t", #190619-00013#1 mark
               "  FROM glgb_t,glga_t", #190619-00013#1 add
              #"  LEFT JOIN apca_t ON apcaent = glgaent AND apcald = glgald AND apcadocno = glgadocno ", #190619-00013#1 add #190806-00013#1 mark
               " WHERE glgaent = glgbent AND glgadocno = glgbdocno ",
               "   AND glgbent = ",g_enterprise,
               "   AND glga007 = ? ",l_field3,l_field4      
   PREPARE s_aapp330_sel_glgb_p FROM l_sql
   DECLARE s_aapp330_sel_glgb_c CURSOR FOR s_aapp330_sel_glgb_p 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 's_aapp330_sel_glgb_c'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF   
   
   LET l_sql = " SELECT glgadocno FROM glga_t ",
               "  WHERE glgaent = ",g_enterprise," AND glgald = ? AND glga007 = ? "
   PREPARE s_aapp330_sel_glga_p FROM l_sql
   DECLARE s_aapp330_sel_glga_c CURSOR FOR s_aapp330_sel_glga_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 's_aapp330_sel_glga_c'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF  
   #190528-00007#1 add ---e
   
   #201207-00021#1 add ---s 取得來源單現變碼glgb055
   LET l_glaa004 = NULL
   SELECT glaa004 INTO l_glaa004 
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_ld
      AND glaa014 = 'Y'
   LET l_sql = " INSERT INTO s_pre_glbctmp ",
               " SELECT glgbdocno,glgbseq,glgb001,glgb002,glgb003,",
               "        glgb004,glgb005,glgb006,glgb007,glgb010,  ",
               "        glgb017,glgb018,glgb019,glgb020,glgb021,  ",
               "        glgb022,glgb023,glgb024,glgb025,glgb026,  ",
               "        glgb027,glgb028,glgb051,glgb052,glgb053,  ",
               "        glgb029,glgb030,glgb031,glgb032,glgb033,  ",
               "        glgb034,glgb035,glgb036,glgb037,glgb038,  ",
               "        glgb039,glgb040,glgb041,glgb042,glgb043,  ",
               "        glgb044,glgb055,                          ",
               "        (CASE WHEN glgb003<>0 THEN '1' ELSE '2' END) sw ", #借貸     
               "   FROM glgb_t ",
               "  WHERE glgbent = ",g_enterprise,
               "    AND glgbdocno = ? ",
               "    AND EXISTS (SELECT 1 FROM glac_t WHERE glacent=glgbent", #現金科目
               "                   AND glac001 = '",l_glaa004,"'",
               "                   AND glac002 = glgb002 AND glac016 = 'Y' AND glacstus = 'Y')",
               "    AND NOT EXISTS (SELECT 1 FROM s_pre_glbctmp t51 ", #避免重複寫入
               "                     WHERE glgb_t.glgbdocno = t51.docno AND glgb_t.glgbseq = t51.glgbseq)"
   PREPARE s_aapp330_ins_glbctmp FROM l_sql
   
   #210324-00039#1 mark(s)
#   LET l_sql = " SELECT docno,glgb002,glgb022,glgb055,      ",
#               "        SUM(glgb003),SUM(glgb004),SUM(glgb010), ",
#               "        SUM(glgb040),SUM(glgb041),SUM(glgb043),SUM(glgb044) ",
#               "   FROM s_pre_glbctmp ",
#               "  WHERE (glgb001  = ? OR glgb001 IS NULL OR glgb001 = ' ')",
#               "    AND (glgb002  = ? OR glgb002 IS NULL OR glgb002 = ' ')",
#               "    AND (glgb005  = ? OR glgb005 IS NULL OR glgb005 = ' ')",
#               "    AND (glgb006  = ? OR glgb006 IS NULL)                 ",
#               "    AND (glgb039  = ? OR glgb039 IS NULL)                 ",
#               "    AND (glgb042  = ? OR glgb042 IS NULL)                 ",               
#               "    AND (glgb017  = ? OR glgb017 IS NULL OR glgb017 = ' ')",
#               "    AND (glgb018  = ? OR glgb018 IS NULL OR glgb018 = ' ')",
#               "    AND (glgb019  = ? OR glgb019 IS NULL OR glgb019 = ' ')",
#               "    AND (glgb020  = ? OR glgb020 IS NULL OR glgb020 = ' ')",
#               "    AND (glgb021  = ? OR glgb021 IS NULL OR glgb021 = ' ' OR ?='N')",
#               "    AND (glgb022  = ? OR glgb022 IS NULL OR glgb022 = ' ' OR ?='N')",
#               "    AND (glgb023  = ? OR glgb023 IS NULL OR glgb023 = ' ')",
#               "    AND (glgb024  = ? OR glgb024 IS NULL OR glgb024 = ' ')",
#               "    AND (glgb025  = ? OR glgb025 IS NULL OR glgb025 = ' ')",
#               "    AND (glgb027  = ? OR glgb027 IS NULL OR glgb027 = ' ')",
#               "    AND (glgb028  = ? OR glgb028 IS NULL OR glgb028 = ' ')",
#               "    AND (glgb051  = ? OR glgb051 IS NULL OR glgb051 = ' ')",
#               "    AND (glgb052  = ? OR glgb052 IS NULL OR glgb052 = ' ')",
#               "    AND (glgb053  = ? OR glgb053 IS NULL OR glgb053 = ' ')",
#               "    AND (glgb029  = ? OR glgb029 IS NULL OR glgb029 = ' ')",
#               "    AND (glgb030  = ? OR glgb030 IS NULL OR glgb030 = ' ')",
#               "    AND (glgb031  = ? OR glgb031 IS NULL OR glgb031 = ' ')",
#               "    AND (glgb032  = ? OR glgb032 IS NULL OR glgb032 = ' ')",
#               "    AND (glgb033  = ? OR glgb033 IS NULL OR glgb033 = ' ')",
#               "    AND (glgb034  = ? OR glgb034 IS NULL OR glgb034 = ' ')",
#               "    AND (glgb035  = ? OR glgb035 IS NULL OR glgb035 = ' ')",
#               "    AND (glgb036  = ? OR glgb036 IS NULL OR glgb036 = ' ')",
#               "    AND (glgb037  = ? OR glgb037 IS NULL OR glgb037 = ' ')",
#               "    AND (glgb038  = ? OR glgb038 IS NULL OR glgb038 = ' ')",
#               "    AND (glgb007  = ? OR glgb007 IS NULL OR glgb007 = ' ')",
#               "    AND (sw = ? OR ?='2') ", #不分借貸合併不用借貸條件
#               "    AND (glgb055  = ? OR glgb055 IS NULL OR glgb055 = ' ' OR ?='N')", #以現變碼拆分科目為N不用glgb055               
#               "  GROUP BY docno,glgb002,glgb022,glgb055 ",
#               "  ORDER BY ABS(SUM(glgb010)) desc  " #金額大的先寫               
   #210324-00039#1 mark(e)
   #210324-00039#1 add(s)
   LET l_sql = " SELECT docno,glgb002,glgb022,glgb055,      ",
               "        SUM(glgb003),SUM(glgb004),SUM(glgb010), ",
               "        SUM(glgb040),SUM(glgb041),SUM(glgb043),SUM(glgb044) ",
               "   FROM s_pre_glbctmp ",
               "  WHERE (glgb001  = ? OR (? IS NULL AND glgb001 IS NULL) OR glgb001 = ' ')",
               "    AND (glgb002  = ? OR (? IS NULL AND glgb002 IS NULL) OR glgb002 = ' ')",
               "    AND (glgb005  = ? OR (? IS NULL AND glgb005 IS NULL) OR glgb005 = ' ')",
               "    AND (glgb006  = ? OR glgb006 IS NULL)                                 ",
               "    AND (glgb039  = ? OR glgb039 IS NULL)                                 ",
               "    AND (glgb042  = ? OR glgb042 IS NULL)                                 ",               
               "    AND (glgb017  = ? OR (? IS NULL AND glgb017 IS NULL) OR glgb017 = ' ')",
               "    AND (glgb018  = ? OR (? IS NULL AND glgb018 IS NULL) OR glgb018 = ' ')",
               "    AND (glgb019  = ? OR (? IS NULL AND glgb019 IS NULL) OR glgb019 = ' ')",
               "    AND (glgb020  = ? OR (? IS NULL AND glgb020 IS NULL) OR glgb020 = ' ')",
               "    AND (glgb021  = ? OR (? IS NULL AND glgb021 IS NULL) OR glgb021 = ' ' OR ?='N')",
               "    AND (glgb022  = ? OR (? IS NULL AND glgb022 IS NULL) OR glgb022 = ' ' OR ?='N')",
               "    AND (glgb023  = ? OR (? IS NULL AND glgb023 IS NULL) OR glgb023 = ' ')",
               "    AND (glgb024  = ? OR (? IS NULL AND glgb024 IS NULL) OR glgb024 = ' ')",
               "    AND (glgb025  = ? OR (? IS NULL AND glgb025 IS NULL) OR glgb025 = ' ')",
               "    AND (glgb027  = ? OR (? IS NULL AND glgb027 IS NULL) OR glgb027 = ' ')",
               "    AND (glgb028  = ? OR (? IS NULL AND glgb028 IS NULL) OR glgb028 = ' ')",
               "    AND (glgb051  = ? OR (? IS NULL AND glgb051 IS NULL) OR glgb051 = ' ')",
               "    AND (glgb052  = ? OR (? IS NULL AND glgb052 IS NULL) OR glgb052 = ' ')",
               "    AND (glgb053  = ? OR (? IS NULL AND glgb053 IS NULL) OR glgb053 = ' ')",
               "    AND (glgb029  = ? OR (? IS NULL AND glgb029 IS NULL) OR glgb029 = ' ')",
               "    AND (glgb030  = ? OR (? IS NULL AND glgb030 IS NULL) OR glgb030 = ' ')",
               "    AND (glgb031  = ? OR (? IS NULL AND glgb031 IS NULL) OR glgb031 = ' ')",
               "    AND (glgb032  = ? OR (? IS NULL AND glgb032 IS NULL) OR glgb032 = ' ')",
               "    AND (glgb033  = ? OR (? IS NULL AND glgb033 IS NULL) OR glgb033 = ' ')",
               "    AND (glgb034  = ? OR (? IS NULL AND glgb034 IS NULL) OR glgb034 = ' ')",
               "    AND (glgb035  = ? OR (? IS NULL AND glgb035 IS NULL) OR glgb035 = ' ')",
               "    AND (glgb036  = ? OR (? IS NULL AND glgb036 IS NULL) OR glgb036 = ' ')",
               "    AND (glgb037  = ? OR (? IS NULL AND glgb037 IS NULL) OR glgb037 = ' ')",
               "    AND (glgb038  = ? OR (? IS NULL AND glgb038 IS NULL) OR glgb038 = ' ')",
               "    AND (glgb007  = ? OR (? IS NULL AND glgb007 IS NULL) OR glgb007 = ' ')",
               "    AND (sw = ? OR ?='2') ", #不分借貸合併不用借貸條件
               "    AND (glgb055  = ? OR glgb055 IS NULL OR glgb055 = ' ' OR ?='N')", #以現變碼拆分科目為N不用glgb055               
               "  GROUP BY docno,glgb002,glgb022,glgb055 ",
               "  ORDER BY ABS(SUM(glgb010)) desc  " #金額大的先寫
   #210324-00039#1 add(e)               
   PREPARE sel_glgb055_pre FROM l_sql
   DECLARE sel_glgb055_cur CURSOR FOR sel_glgb055_pre

   LET l_sql = " SELECT DISTINCT glgb022 FROM s_pre_glbctmp ",
               "  WHERE docno = ? "
   PREPARE sel_glgb022 FROM l_sql
   #201207-00021#1 add ---e   
      
   #151203-00013#3 --s mark
   ##150825-00004#9 add ------
   ##从临时表中取科目+幣別
   #LET l_sql = " SELECT DISTINCT glaq002,glaq005,sw FROM s_voucher_tmp ",
   #            "  WHERE type = '1'"
   #PREPARE gen_ap_1_p9c FROM l_sql
   #DECLARE gen_ap_1_c9c CURSOR FOR gen_ap_1_p9c
   #
   ##从临时表中取該科目+幣別第一筆資訊
   #LET l_sql = " SELECT * FROM s_voucher_tmp ",
   #            "  WHERE glaq002 = ? AND glaq005 = ? AND type = '1' AND sw = ?",
   #            "  ORDER BY docno"
   #PREPARE gen_ap_1_p9d FROM l_sql
   #DECLARE gen_ap_1_c9d SCROLL CURSOR FOR gen_ap_1_p9d
   #
   ##从临时表中取該科目+幣別第一筆資訊
   #LET l_sql = " SELECT SUM(d),SUM(c),SUM(sum),SUM(glaq040),SUM(glaq041),",
   #            "        SUM(glaq043),SUM(glaq044)",
   #            "   FROM s_voucher_tmp ",
   #            "  WHERE glaq002 = ? AND glaq005 = ? AND type = '1' AND sw = ?",
   #            "  ORDER BY docno"
   #PREPARE gen_ap_1_p9e FROM l_sql
   #DECLARE gen_ap_1_c9e CURSOR FOR gen_ap_1_p9e
   ##150825-00004#9 add end---
   #151203-00013#3 --e mark
   LET r_success = TRUE
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 立帳傳票產生
# Memo...........: 180808-00051#1 add p_acctype
# Date & Author..: 14/07/18 By Belle
# Modify.........: 18/09/10 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt300(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_apca          RECORD LIKE apca_t.*    #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_apca RECORD  #應付憑單單頭
       apcaent LIKE apca_t.apcaent, #企業編號
       apcaownid LIKE apca_t.apcaownid, #資料所有者
       apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
       apcacrtid LIKE apca_t.apcacrtid, #資料建立者
       apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
       apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
       apcamodid LIKE apca_t.apcamodid, #資料修改者
       apcamoddt LIKE apca_t.apcamoddt, #最近修改日
       apcacnfid LIKE apca_t.apcacnfid, #資料確認者
       apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
       apcapstid LIKE apca_t.apcapstid, #資料過帳者
       apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
       apcastus LIKE apca_t.apcastus, #狀態碼
       apcald LIKE apca_t.apcald, #帳套
       apcacomp LIKE apca_t.apcacomp, #法人
       apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
       apcadocdt LIKE apca_t.apcadocdt, #帳款日期
       apcasite LIKE apca_t.apcasite, #帳務中心
       apca001 LIKE apca_t.apca001, #帳款單性質
       apca003 LIKE apca_t.apca003, #帳務人員
       apca004 LIKE apca_t.apca004, #帳款對象編號
       apca005 LIKE apca_t.apca005, #付款對象
       apca006 LIKE apca_t.apca006, #供應商分類
       apca007 LIKE apca_t.apca007, #帳款類別
       apca008 LIKE apca_t.apca008, #付款條件編號
       apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
       apca010 LIKE apca_t.apca010, #容許票據到期日
       apca011 LIKE apca_t.apca011, #稅別
       apca012 LIKE apca_t.apca012, #稅率
       apca013 LIKE apca_t.apca013, #含稅否
       apca014 LIKE apca_t.apca014, #人員編號
       apca015 LIKE apca_t.apca015, #部門編號
       apca016 LIKE apca_t.apca016, #來源作業類型
       apca017 LIKE apca_t.apca017, #產生方式
       apca018 LIKE apca_t.apca018, #來源參考單號
       apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
       apca020 LIKE apca_t.apca020, #信用狀付款否
       apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
       apca022 LIKE apca_t.apca022, #進口報單號碼
       apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
       apca026 LIKE apca_t.apca026, #原幣未稅差異
       apca027 LIKE apca_t.apca027, #原幣稅額差異
       apca028 LIKE apca_t.apca028, #本幣未稅差異
       apca029 LIKE apca_t.apca029, #本幣幣稅額差異
       apca030 LIKE apca_t.apca030, #差異科目
       apca031 LIKE apca_t.apca031, #產生之差異折讓單號
       apca032 LIKE apca_t.apca032, #發票類型
       apca033 LIKE apca_t.apca033, #專案編號
       apca034 LIKE apca_t.apca034, #責任中心
       apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
       apca036 LIKE apca_t.apca036, #費用(借方)科目編號
       apca037 LIKE apca_t.apca037, #產生傳票否
       apca038 LIKE apca_t.apca038, #拋轉傳票號碼
       apca039 LIKE apca_t.apca039, #會計檢核附件份數
       apca040 LIKE apca_t.apca040, #留置否
       apca041 LIKE apca_t.apca041, #留置理由碼
       apca042 LIKE apca_t.apca042, #留置設定日期
       apca043 LIKE apca_t.apca043, #留置解除日期
       apca044 LIKE apca_t.apca044, #留置原幣金額
       apca045 LIKE apca_t.apca045, #留置說明
       apca046 LIKE apca_t.apca046, #關係人否
       apca047 LIKE apca_t.apca047, #多角序號
       apca048 LIKE apca_t.apca048, #集團代付/代付單號
       apca049 LIKE apca_t.apca049, #來源營運中心編號
       apca050 LIKE apca_t.apca050, #交易原始單據份數
       apca051 LIKE apca_t.apca051, #作廢理由碼
       apca052 LIKE apca_t.apca052, #列印次數
       apca053 LIKE apca_t.apca053, #備註
       apca054 LIKE apca_t.apca054, #多帳期設定
       apca055 LIKE apca_t.apca055, #繳款優惠條件
       apca056 LIKE apca_t.apca056, #會計檢核附件狀態
       apca057 LIKE apca_t.apca057, #交易對象識別碼
       apca058 LIKE apca_t.apca058, #稅別交易類型
       apca059 LIKE apca_t.apca059, #預算編號
       apca060 LIKE apca_t.apca060, #發票開立方式
       apca061 LIKE apca_t.apca061, #預開發票基準日
       apca062 LIKE apca_t.apca062, #多角性質
       apca063 LIKE apca_t.apca063, #整帳批序號
       apca064 LIKE apca_t.apca064, #訂金序次
       apca065 LIKE apca_t.apca065, #發票編號
       apca066 LIKE apca_t.apca066, #發票號碼
       apca100 LIKE apca_t.apca100, #交易原幣別
       apca101 LIKE apca_t.apca101, #原幣匯率
       apca103 LIKE apca_t.apca103, #原幣未稅金額
       apca104 LIKE apca_t.apca104, #原幣稅額
       apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
       apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
       apca108 LIKE apca_t.apca108, #原幣應付金額
       apca113 LIKE apca_t.apca113, #本幣未稅金額
       apca114 LIKE apca_t.apca114, #本幣稅額
       apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
       apca117 LIKE apca_t.apca117, #NO USE
       apca118 LIKE apca_t.apca118, #本幣應付金額
       apca120 LIKE apca_t.apca120, #本位幣二幣別
       apca121 LIKE apca_t.apca121, #本位幣二匯率
       apca123 LIKE apca_t.apca123, #本位幣二未稅金額
       apca124 LIKE apca_t.apca124, #本位幣二稅額
       apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
       apca127 LIKE apca_t.apca127, #NO USE
       apca128 LIKE apca_t.apca128, #本位幣二應付金額
       apca130 LIKE apca_t.apca130, #本位幣三幣別
       apca131 LIKE apca_t.apca131, #本位幣三匯率
       apca133 LIKE apca_t.apca133, #本位幣三未稅金額
       apca134 LIKE apca_t.apca134, #本位幣三稅額
       apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
       apca137 LIKE apca_t.apca137, #NO USE
       apca138 LIKE apca_t.apca138, #本位幣三應付金額
       apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
       apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
       apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
       apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
       apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
       apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
       apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
       apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
       apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
       apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
       apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
       apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
       apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
       apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
       apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
       apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
       apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
       apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
       apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
       apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
       apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
       apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
       apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
       apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
       apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
       apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
       apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
       apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
       apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
       apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
       apca067 LIKE apca_t.apca067, #管理品類
       apca068 LIKE apca_t.apca068, #經營方式
       apca069 LIKE apca_t.apca069, #no use
       apca070 LIKE apca_t.apca070, #no use
       apca071 LIKE apca_t.apca071, #no use
       apca072 LIKE apca_t.apca072, #no use
       apca073 LIKE apca_t.apca073  #L/C No.
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別

DEFINE l_chr           LIKE type_t.chr1
DEFINE l_glaacomp      LIKE glaa_t.glaacomp
DEFINE l_cnt           LIKE type_t.num5         #160107-00001#1
DEFINE l_glaa120       LIKE glaa_t.glaa120      #160107-00001#1
DEFINE l_apcb116       LIKE apcb_t.apcb116      #160107-00001#1
#180410-00038#1 add-s
DEFINE l_glaq001       LIKE glaq_t.glaq001
DEFINE l_glaq002       LIKE glaq_t.glaq002
DEFINE l_sum           LIKE glaq_t.glaq003
DEFINE l_glaqseq       LIKE glaq_t.glaqseq
DEFINE l_red           LIKE type_t.chr1
#180410-00038#1 add-e
DEFINE l_sql           STRING   #181008-00028#1 add
DEFINE l_docno         LIKE apca_t.apcadocno   #190524-00012#1---add
   
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE

   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   DELETE FROM s_voucher_tmp WHERE type IN ('1','2');
   
   #1.定义CURSOR
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   IF NOT g_sub_success THEN RETURN r_success END IF
  #CALL s_ld_sel_glaa(p_ld,'glaacomp|glaa120')                               #170430-00006#2 mark
  #     RETURNING  g_sub_success,l_glaacomp,l_glaa120    ##160107-00001#1    #170430-00006#2 mark
   SELECT glaacomp,glaa120 INTO l_glaacomp,l_glaa120 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add
   #'Y'=迴轉(不要有apcf的資料)   'N'=不迴轉
  #CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING g_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-3011') RETURNING g_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-3012') RETURNING g_sfin3012   #160621-00026#1
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-3034') RETURNING g_sfin3034   #170821-00012#1 add
   
   #160107-00001#1--(S)
   LET g_xcat005 = 'N'
   IF NOT cl_null(l_glaa120) THEN
      #以帳套檢核, 該帳套是否有啟用"標準成本"處理，取agli010的設置成本計算類型glaa120，若在axci100的計價方式值為1.標準成本
      SELECT count(*) INTO l_cnt
        FROM xcat_t
       WHERE xcatent = g_enterprise AND xcat005 ='1'
         AND xcat001 = l_glaa120
      IF l_cnt > 0 THEN LET g_xcat005 = 'Y' END IF
   END IF   
   #160107-00001#1--(E)
   
   #LET g_sfin2011 = 'Y'
   #2.插入临时表
   #FOREACH gen_ap_1_c10 INTO l_apca.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c10 
      INTO l_apca.apcaent,l_apca.apcaownid,l_apca.apcaowndp,l_apca.apcacrtid,l_apca.apcacrtdp,
           l_apca.apcacrtdt,l_apca.apcamodid,l_apca.apcamoddt,l_apca.apcacnfid,l_apca.apcacnfdt,
           l_apca.apcapstid,l_apca.apcapstdt,l_apca.apcastus,l_apca.apcald,l_apca.apcacomp,
           l_apca.apcadocno,l_apca.apcadocdt,l_apca.apcasite,l_apca.apca001,l_apca.apca003,
           l_apca.apca004,l_apca.apca005,l_apca.apca006,l_apca.apca007,l_apca.apca008,
           l_apca.apca009,l_apca.apca010,l_apca.apca011,l_apca.apca012,l_apca.apca013,
           l_apca.apca014,l_apca.apca015,l_apca.apca016,l_apca.apca017,l_apca.apca018,
           l_apca.apca019,l_apca.apca020,l_apca.apca021,l_apca.apca022,l_apca.apca025,
           l_apca.apca026,l_apca.apca027,l_apca.apca028,l_apca.apca029,l_apca.apca030,
           l_apca.apca031,l_apca.apca032,l_apca.apca033,l_apca.apca034,l_apca.apca035,
           l_apca.apca036,l_apca.apca037,l_apca.apca038,l_apca.apca039,l_apca.apca040,
           l_apca.apca041,l_apca.apca042,l_apca.apca043,l_apca.apca044,l_apca.apca045,
           l_apca.apca046,l_apca.apca047,l_apca.apca048,l_apca.apca049,l_apca.apca050,
           l_apca.apca051,l_apca.apca052,l_apca.apca053,l_apca.apca054,l_apca.apca055,
           l_apca.apca056,l_apca.apca057,l_apca.apca058,l_apca.apca059,l_apca.apca060,
           l_apca.apca061,l_apca.apca062,l_apca.apca063,l_apca.apca064,l_apca.apca065,
           l_apca.apca066,l_apca.apca100,l_apca.apca101,l_apca.apca103,l_apca.apca104,
           l_apca.apca106,l_apca.apca107,l_apca.apca108,l_apca.apca113,l_apca.apca114,
           l_apca.apca116,l_apca.apca117,l_apca.apca118,l_apca.apca120,l_apca.apca121,
           l_apca.apca123,l_apca.apca124,l_apca.apca126,l_apca.apca127,l_apca.apca128,
           l_apca.apca130,l_apca.apca131,l_apca.apca133,l_apca.apca134,l_apca.apca136,
           l_apca.apca137,l_apca.apca138,l_apca.apcaud001,l_apca.apcaud002,l_apca.apcaud003,
           l_apca.apcaud004,l_apca.apcaud005,l_apca.apcaud006,l_apca.apcaud007,l_apca.apcaud008,
           l_apca.apcaud009,l_apca.apcaud010,l_apca.apcaud011,l_apca.apcaud012,l_apca.apcaud013,
           l_apca.apcaud014,l_apca.apcaud015,l_apca.apcaud016,l_apca.apcaud017,l_apca.apcaud018,
           l_apca.apcaud019,l_apca.apcaud020,l_apca.apcaud021,l_apca.apcaud022,l_apca.apcaud023,
           l_apca.apcaud024,l_apca.apcaud025,l_apca.apcaud026,l_apca.apcaud027,l_apca.apcaud028,
           l_apca.apcaud029,l_apca.apcaud030,l_apca.apca067,l_apca.apca068,l_apca.apca069,
           l_apca.apca070,l_apca.apca071,l_apca.apca072,l_apca.apca073
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c10'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      #檢查該單別是否可拋轉傳票
      CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      IF l_chr = 'N' THEN 
         #IF g_prog = 'aapp330' THEN   #170301-00021#1 by 09263 --mark
         IF g_prog MATCHES 'aapp330*' THEN   #170301-00021#1 by 09263 --add
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aap-00333'
            LET g_errparam.extend = l_apca.apcadocno
            CALL cl_err()
         END IF
         CONTINUE FOREACH
      END IF
      CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002
      IF cl_null(g_dfin1002) THEN LET g_dfin1002 = 'N' END IF
      #借:費用類科目 
      CALL s_aapp330_gen_ap_1_ins_tmp('11',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      #贷:收入科目
      CALL s_aapp330_gen_ap_1_ins_tmp('12',l_apca.apcald,l_apca.apcadocno,l_apca.apca036,l_apca.apca001,l_apca.apca007) RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      #進項稅額科目
      CALL s_aapp330_gen_ap_1_ins_tmp('13',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #直接沖帳
      CALL s_aapp330_gen_ap_1_ins_tmp('14',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #直接付款
      CALL s_aapp330_gen_ap_1_ins_tmp('15',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
      IF NOT g_sub_success THEN RETURN r_success END IF
      #沖暫估(#'Y'=迴轉(不要有apcf的資料)   'N'=不迴轉)
     #IF g_sfin2011 = 'N' THEN                  #160621-00026#1 mark 
     #不看迴轉否,有沖暫估信息就要依照他來產生分錄   #160621-00026#1
      IF g_sfin2011 = 'N' OR (g_sfin2011 = 'Y' AND g_sfin3034 = 'Y') THEN   #180226-00016#1 add
         CALL s_aapp330_gen_ap_1_ins_tmp('16',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
         IF NOT g_sub_success THEN RETURN r_success END IF
      END IF #180226-00016#1 add
         ##雜項
      IF g_sfin2011 = 'N' THEN #180226-00016#1 add
         CALL s_aapp330_gen_ap_1_ins_tmp('17',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
         IF NOT g_sub_success THEN RETURN r_success END IF
      END IF   #160621-00026#1 mark #180226-00016#1 remark
      #160621-00026#1--S
      #沖暫估稅額(若為含稅立暫估才做)
      IF g_sfin3012 = '2' THEN
         CALL s_aapp330_gen_ap_1_ins_tmp('171',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
         IF NOT g_sub_success THEN RETURN r_success END IF      
      END IF
      #160621-00026#1--E
      #160107-00001#1--(S)
      IF g_xcat005 = 'Y' AND (l_apca.apca001 MATCHES '1[3714]' OR l_apca.apca001 MATCHES '0[12]' OR l_apca.apca001 MATCHES '2[2]') THEN
         #SELECT SUM(apcb115-apcb116) INTO l_apcb116 #160706-00009#1 mark
         SELECT SUM(apcb113-apcb116) INTO l_apcb116  #160706-00009#1 add
           FROM apcb_t
          WHERE apcbent = g_enterprise
            AND apcbld  = l_apca.apcald AND apcbdocno = l_apca.apcadocno
         IF l_apcb116 <> 0 THEN
            CALL s_aapp330_gen_ap_1_ins_tmp('18',l_apca.apcald,l_apca.apcadocno,'',l_apca.apca001,l_apca.apca007) RETURNING g_sub_success 
            IF NOT g_sub_success THEN RETURN r_success END IF
         END IF
      END IF
      #160107-00001#1--(E)
   END FOREACH
   
   #181008-00028#1---add---begin
   LET l_sql = " SELECT DISTINCT glaq002,docno FROM s_voucher_tmp WHERE flag = '2' "    #190524-00012#1---add--->,docno
   PREPARE sel_glaq002_pre  FROM l_sql
   DECLARE cs_glaq002 CURSOR WITH HOLD FOR sel_glaq002_pre
   FOREACH cs_glaq002 INTO l_glaq002,l_docno                       #190524-00012#1---add--->,l_docno
   #181008-00028#1---add---end
   
   #180410-00038#1 add-s
   #将税额科目以净额方式产生，并显示在底
   #取最大金额
   SELECT CASE WHEN sum(d)-sum(c)>0 THEN max(d) ELSE max(c) END INTO l_sum    
     FROM s_voucher_tmp     
    WHERE flag='2'
      AND glaq002 = l_glaq002  #181008-00028#1 add  
      AND docno = l_docno  #190524-00012#1---add       
    #根据最大金额取对应资料
   #SELECT glaq001,glaq002,glaqseq,red INTO l_glaq001,l_glaq002,l_glaqseq,l_red
   #  FROM s_voucher_tmp     
   # WHERE flag='2' AND (d=l_sum OR c=l_sum)
   #   AND glaq002 = l_glaq002  #181008-00028#1 add 
   #   AND docno = l_docno  #190524-00012#1---add 
   #PGS(D)-10043-add-S-
   SELECT glaq001,glaq002,glaqseq,red INTO l_glaq001,l_glaq002,l_glaqseq,l_red
     FROM s_voucher_tmp     
    WHERE flag='2' AND (d=l_sum OR c=l_sum)
      AND glaq002 = l_glaq002 
      AND docno = l_docno  
      AND rownum = 1
   #PGS(D)-10043-add-E-
   #更新明细资料（汇总时自动将税额按净额产生）                    
   #UPDATE s_voucher_tmp SET (glaq001,glaq002,glaqseq,red)=(l_glaq001,l_glaq002,l_glaqseq,l_red) #190826-00030#1 mark
   UPDATE s_voucher_tmp SET (glaq002,glaqseq,red)=(l_glaq002,l_glaqseq,l_red) #190826-00030#1 add 因為更新摘要會導致無法按照摘要拆開
    WHERE flag='2'
      AND glaq002 = l_glaq002  #181008-00028#1 add 
      AND docno = l_docno  #190524-00012#1---add   
   IF SQLCA.sqlcode THEN
     INITIALIZE g_errparam TO NULL
     LET g_errparam.code = SQLCA.sqlcode
     LET g_errparam.extend = 'upd s_voucher_tmp'
     LET g_errparam.popup = TRUE
     CALL cl_err()
   END IF               
   #180410-00038#1 add-e
   END FOREACH   #181008-00028#1 add
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 應付沖帳產生傳票
# Memo...........: 180808-00051#1 add p_acctype
# Date & Author..: 14/10/20 By Belle
# Modify.........: 18/09/10 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt420(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_apda          RECORD LIKE apda_t.*    #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_apda RECORD  #付款核銷單單頭檔
       apdaent LIKE apda_t.apdaent, #企業編號
       apdacomp LIKE apda_t.apdacomp, #法人
       apdald LIKE apda_t.apdald, #帳套
       apdadocno LIKE apda_t.apdadocno, #單號
       apdadocdt LIKE apda_t.apdadocdt, #單據日期
       apdasite LIKE apda_t.apdasite, #帳務組織
       apda001 LIKE apda_t.apda001, #帳款單性質
       apda002 LIKE apda_t.apda002, #NO USE
       apda003 LIKE apda_t.apda003, #帳務人員
       apda004 LIKE apda_t.apda004, #帳款核銷對象
       apda005 LIKE apda_t.apda005, #付款對象
       apda006 LIKE apda_t.apda006, #一次性交易識別碼
       apda007 LIKE apda_t.apda007, #產生方式
       apda008 LIKE apda_t.apda008, #來源參考單號
       apda009 LIKE apda_t.apda009, #沖帳批序號
       apda010 LIKE apda_t.apda010, #集團代付付單號
       apda011 LIKE apda_t.apda011, #差異處理
       apda012 LIKE apda_t.apda012, #退款類型
       apda013 LIKE apda_t.apda013, #分錄底稿是否可重新產生
       apda014 LIKE apda_t.apda014, #拋轉傳票號碼
       apda015 LIKE apda_t.apda015, #作廢理由碼
       apda016 LIKE apda_t.apda016, #列印次數
       apda017 LIKE apda_t.apda017, #MEMO備註
       apda018 LIKE apda_t.apda018, #付款(攤銷)理由碼
       apda019 LIKE apda_t.apda019, #攤銷目的方式
       apda020 LIKE apda_t.apda020, #分攤金額方式
       apda021 LIKE apda_t.apda021, #目的成本要素
       apda113 LIKE apda_t.apda113, #應核銷本幣金額
       apda123 LIKE apda_t.apda123, #應核銷本幣二金額
       apda133 LIKE apda_t.apda133, #應核銷本幣三金額
       apdaownid LIKE apda_t.apdaownid, #資料所有者
       apdaowndp LIKE apda_t.apdaowndp, #資料所屬部門
       apdacrtid LIKE apda_t.apdacrtid, #資料建立者
       apdacrtdp LIKE apda_t.apdacrtdp, #資料建立部門
       apdacrtdt LIKE apda_t.apdacrtdt, #資料創建日
       apdamodid LIKE apda_t.apdamodid, #資料修改者
       apdamoddt LIKE apda_t.apdamoddt, #最近修改日
       apdacnfid LIKE apda_t.apdacnfid, #資料確認者
       apdacnfdt LIKE apda_t.apdacnfdt, #資料確認日
       apdapstid LIKE apda_t.apdapstid, #資料過帳者
       apdapstdt LIKE apda_t.apdapstdt, #資料過帳日
       apdastus LIKE apda_t.apdastus, #狀態碼
       apdaud001 LIKE apda_t.apdaud001, #自定義欄位(文字)001
       apdaud002 LIKE apda_t.apdaud002, #自定義欄位(文字)002
       apdaud003 LIKE apda_t.apdaud003, #自定義欄位(文字)003
       apdaud004 LIKE apda_t.apdaud004, #自定義欄位(文字)004
       apdaud005 LIKE apda_t.apdaud005, #自定義欄位(文字)005
       apdaud006 LIKE apda_t.apdaud006, #自定義欄位(文字)006
       apdaud007 LIKE apda_t.apdaud007, #自定義欄位(文字)007
       apdaud008 LIKE apda_t.apdaud008, #自定義欄位(文字)008
       apdaud009 LIKE apda_t.apdaud009, #自定義欄位(文字)009
       apdaud010 LIKE apda_t.apdaud010, #自定義欄位(文字)010
       apdaud011 LIKE apda_t.apdaud011, #自定義欄位(數字)011
       apdaud012 LIKE apda_t.apdaud012, #自定義欄位(數字)012
       apdaud013 LIKE apda_t.apdaud013, #自定義欄位(數字)013
       apdaud014 LIKE apda_t.apdaud014, #自定義欄位(數字)014
       apdaud015 LIKE apda_t.apdaud015, #自定義欄位(數字)015
       apdaud016 LIKE apda_t.apdaud016, #自定義欄位(數字)016
       apdaud017 LIKE apda_t.apdaud017, #自定義欄位(數字)017
       apdaud018 LIKE apda_t.apdaud018, #自定義欄位(數字)018
       apdaud019 LIKE apda_t.apdaud019, #自定義欄位(數字)019
       apdaud020 LIKE apda_t.apdaud020, #自定義欄位(數字)020
       apdaud021 LIKE apda_t.apdaud021, #自定義欄位(日期時間)021
       apdaud022 LIKE apda_t.apdaud022, #自定義欄位(日期時間)022
       apdaud023 LIKE apda_t.apdaud023, #自定義欄位(日期時間)023
       apdaud024 LIKE apda_t.apdaud024, #自定義欄位(日期時間)024
       apdaud025 LIKE apda_t.apdaud025, #自定義欄位(日期時間)025
       apdaud026 LIKE apda_t.apdaud026, #自定義欄位(日期時間)026
       apdaud027 LIKE apda_t.apdaud027, #自定義欄位(日期時間)027
       apdaud028 LIKE apda_t.apdaud028, #自定義欄位(日期時間)028
       apdaud029 LIKE apda_t.apdaud029, #自定義欄位(日期時間)029
       apdaud030 LIKE apda_t.apdaud030, #自定義欄位(日期時間)030
       apda104 LIKE apda_t.apda104, #原幣借方金額合計
       apda105 LIKE apda_t.apda105, #原幣貸方金額合計
       apda114 LIKE apda_t.apda114, #本幣借方金額合計
       apda115 LIKE apda_t.apda115, #本幣貸方金額合計
       apda124 LIKE apda_t.apda124, #本位幣二借方金額合計
       apda125 LIKE apda_t.apda125, #本位幣二貸方金額合計
       apda134 LIKE apda_t.apda134, #本位幣三借方金額合計
       apda135 LIKE apda_t.apda135, #本位幣三貸方金額合計
       apda022 LIKE apda_t.apda022, #經營方式
       apda023 LIKE apda_t.apda023  #請款單號
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1
   
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE

   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF

   #DELETE FROM s_voucher_tmp WHERE type IN ('1','2'); #190507-00025#1 mark
   #190507-00025#1 add ---s aapp330可合併拋轉,不刪除aapt3*的資料
   IF g_prog NOT MATCHES 'aapp330*' THEN
      DELETE FROM s_voucher_tmp WHERE type IN ('1','2');   
   ELSE
      DELETE FROM s_voucher_tmp WHERE type = '1' ;      
   END IF
   #190507-00025#1 add ---e
   
   #1.定义CURSOR
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   IF NOT g_sub_success THEN RETURN r_success END IF
 
   #2.插入临时表
   #FOREACH gen_ap_1_c40 INTO l_apda.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c40 
      INTO l_apda.apdaent,l_apda.apdacomp,l_apda.apdald,l_apda.apdadocno,l_apda.apdadocdt,
           l_apda.apdasite,l_apda.apda001,l_apda.apda002,l_apda.apda003,l_apda.apda004,
           l_apda.apda005,l_apda.apda006,l_apda.apda007,l_apda.apda008,l_apda.apda009,
           l_apda.apda010,l_apda.apda011,l_apda.apda012,l_apda.apda013,l_apda.apda014,
           l_apda.apda015,l_apda.apda016,l_apda.apda017,l_apda.apda018,l_apda.apda019,
           l_apda.apda020,l_apda.apda021,l_apda.apda113,l_apda.apda123,l_apda.apda133,
           l_apda.apdaownid,l_apda.apdaowndp,l_apda.apdacrtid,l_apda.apdacrtdp,l_apda.apdacrtdt,
           l_apda.apdamodid,l_apda.apdamoddt,l_apda.apdacnfid,l_apda.apdacnfdt,l_apda.apdapstid,
           l_apda.apdapstdt,l_apda.apdastus,l_apda.apdaud001,l_apda.apdaud002,l_apda.apdaud003,
           l_apda.apdaud004,l_apda.apdaud005,l_apda.apdaud006,l_apda.apdaud007,l_apda.apdaud008,
           l_apda.apdaud009,l_apda.apdaud010,l_apda.apdaud011,l_apda.apdaud012,l_apda.apdaud013,
           l_apda.apdaud014,l_apda.apdaud015,l_apda.apdaud016,l_apda.apdaud017,l_apda.apdaud018,
           l_apda.apdaud019,l_apda.apdaud020,l_apda.apdaud021,l_apda.apdaud022,l_apda.apdaud023,
           l_apda.apdaud024,l_apda.apdaud025,l_apda.apdaud026,l_apda.apdaud027,l_apda.apdaud028,
           l_apda.apdaud029,l_apda.apdaud030,l_apda.apda104,l_apda.apda105,l_apda.apda114,
           l_apda.apda115,l_apda.apda124,l_apda.apda125,l_apda.apda134,l_apda.apda135,
           l_apda.apda022,l_apda.apda023
   #161208-00026#23   add---s
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c40'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      #檢查該單別是否可拋轉傳票
      CALL s_aooi200_fin_get_slip(l_apda.apdadocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_apda.apdald,l_apda.apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      IF l_chr = 'N' THEN CONTINUE FOREACH END IF

      CALL s_fin_get_doc_para(l_apda.apdald,l_apda.apdacomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002 #190507-00025#3 add 
      IF cl_null(g_dfin1002) THEN LET g_dfin1002 = 'N' END IF  #190507-00025#3 add 

      #借:費用類科目 
      CALL s_aapp330_gen_ap_1_ins_tmp('41',l_apda.apdald,l_apda.apdadocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #贷:收入科目
      CALL s_aapp330_gen_ap_1_ins_tmp('42',l_apda.apdald,l_apda.apdadocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
   END FOREACH
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 費用分攤產生傳票
# Memo...........: 180808-00051#1 add p_acctype
# Date & Author..: 2014/12/25 By Reanna
# Modify.........: 2018/09/10 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt430(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_apda          RECORD LIKE apda_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_apda RECORD  #付款核銷單單頭檔
       apdaent LIKE apda_t.apdaent, #企業編號
       apdacomp LIKE apda_t.apdacomp, #法人
       apdald LIKE apda_t.apdald, #帳套
       apdadocno LIKE apda_t.apdadocno, #單號
       apdadocdt LIKE apda_t.apdadocdt, #單據日期
       apdasite LIKE apda_t.apdasite, #帳務組織
       apda001 LIKE apda_t.apda001, #帳款單性質
       apda002 LIKE apda_t.apda002, #NO USE
       apda003 LIKE apda_t.apda003, #帳務人員
       apda004 LIKE apda_t.apda004, #帳款核銷對象
       apda005 LIKE apda_t.apda005, #付款對象
       apda006 LIKE apda_t.apda006, #一次性交易識別碼
       apda007 LIKE apda_t.apda007, #產生方式
       apda008 LIKE apda_t.apda008, #來源參考單號
       apda009 LIKE apda_t.apda009, #沖帳批序號
       apda010 LIKE apda_t.apda010, #集團代付付單號
       apda011 LIKE apda_t.apda011, #差異處理
       apda012 LIKE apda_t.apda012, #退款類型
       apda013 LIKE apda_t.apda013, #分錄底稿是否可重新產生
       apda014 LIKE apda_t.apda014, #拋轉傳票號碼
       apda015 LIKE apda_t.apda015, #作廢理由碼
       apda016 LIKE apda_t.apda016, #列印次數
       apda017 LIKE apda_t.apda017, #MEMO備註
       apda018 LIKE apda_t.apda018, #付款(攤銷)理由碼
       apda019 LIKE apda_t.apda019, #攤銷目的方式
       apda020 LIKE apda_t.apda020, #分攤金額方式
       apda021 LIKE apda_t.apda021, #目的成本要素
       apda113 LIKE apda_t.apda113, #應核銷本幣金額
       apda123 LIKE apda_t.apda123, #應核銷本幣二金額
       apda133 LIKE apda_t.apda133, #應核銷本幣三金額
       apdaownid LIKE apda_t.apdaownid, #資料所有者
       apdaowndp LIKE apda_t.apdaowndp, #資料所屬部門
       apdacrtid LIKE apda_t.apdacrtid, #資料建立者
       apdacrtdp LIKE apda_t.apdacrtdp, #資料建立部門
       apdacrtdt LIKE apda_t.apdacrtdt, #資料創建日
       apdamodid LIKE apda_t.apdamodid, #資料修改者
       apdamoddt LIKE apda_t.apdamoddt, #最近修改日
       apdacnfid LIKE apda_t.apdacnfid, #資料確認者
       apdacnfdt LIKE apda_t.apdacnfdt, #資料確認日
       apdapstid LIKE apda_t.apdapstid, #資料過帳者
       apdapstdt LIKE apda_t.apdapstdt, #資料過帳日
       apdastus LIKE apda_t.apdastus, #狀態碼
       apdaud001 LIKE apda_t.apdaud001, #自定義欄位(文字)001
       apdaud002 LIKE apda_t.apdaud002, #自定義欄位(文字)002
       apdaud003 LIKE apda_t.apdaud003, #自定義欄位(文字)003
       apdaud004 LIKE apda_t.apdaud004, #自定義欄位(文字)004
       apdaud005 LIKE apda_t.apdaud005, #自定義欄位(文字)005
       apdaud006 LIKE apda_t.apdaud006, #自定義欄位(文字)006
       apdaud007 LIKE apda_t.apdaud007, #自定義欄位(文字)007
       apdaud008 LIKE apda_t.apdaud008, #自定義欄位(文字)008
       apdaud009 LIKE apda_t.apdaud009, #自定義欄位(文字)009
       apdaud010 LIKE apda_t.apdaud010, #自定義欄位(文字)010
       apdaud011 LIKE apda_t.apdaud011, #自定義欄位(數字)011
       apdaud012 LIKE apda_t.apdaud012, #自定義欄位(數字)012
       apdaud013 LIKE apda_t.apdaud013, #自定義欄位(數字)013
       apdaud014 LIKE apda_t.apdaud014, #自定義欄位(數字)014
       apdaud015 LIKE apda_t.apdaud015, #自定義欄位(數字)015
       apdaud016 LIKE apda_t.apdaud016, #自定義欄位(數字)016
       apdaud017 LIKE apda_t.apdaud017, #自定義欄位(數字)017
       apdaud018 LIKE apda_t.apdaud018, #自定義欄位(數字)018
       apdaud019 LIKE apda_t.apdaud019, #自定義欄位(數字)019
       apdaud020 LIKE apda_t.apdaud020, #自定義欄位(數字)020
       apdaud021 LIKE apda_t.apdaud021, #自定義欄位(日期時間)021
       apdaud022 LIKE apda_t.apdaud022, #自定義欄位(日期時間)022
       apdaud023 LIKE apda_t.apdaud023, #自定義欄位(日期時間)023
       apdaud024 LIKE apda_t.apdaud024, #自定義欄位(日期時間)024
       apdaud025 LIKE apda_t.apdaud025, #自定義欄位(日期時間)025
       apdaud026 LIKE apda_t.apdaud026, #自定義欄位(日期時間)026
       apdaud027 LIKE apda_t.apdaud027, #自定義欄位(日期時間)027
       apdaud028 LIKE apda_t.apdaud028, #自定義欄位(日期時間)028
       apdaud029 LIKE apda_t.apdaud029, #自定義欄位(日期時間)029
       apdaud030 LIKE apda_t.apdaud030, #自定義欄位(日期時間)030
       apda104 LIKE apda_t.apda104, #原幣借方金額合計
       apda105 LIKE apda_t.apda105, #原幣貸方金額合計
       apda114 LIKE apda_t.apda114, #本幣借方金額合計
       apda115 LIKE apda_t.apda115, #本幣貸方金額合計
       apda124 LIKE apda_t.apda124, #本位幣二借方金額合計
       apda125 LIKE apda_t.apda125, #本位幣二貸方金額合計
       apda134 LIKE apda_t.apda134, #本位幣三借方金額合計
       apda135 LIKE apda_t.apda135, #本位幣三貸方金額合計
       apda022 LIKE apda_t.apda022, #經營方式
       apda023 LIKE apda_t.apda023  #請款單號
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1
   
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE

   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #DELETE FROM s_voucher_tmp WHERE type IN ('1','2'); #190507-00025#1 mark
   #190507-00025#1 add ---s aapp330可合併拋轉,不刪除aapt3*的資料
   IF g_prog NOT MATCHES 'aapp330*' THEN
      DELETE FROM s_voucher_tmp WHERE type IN ('1','2');   
   ELSE
      DELETE FROM s_voucher_tmp WHERE type = '1' ;      
   END IF
   #190507-00025#1 add ---e
   
   #1.定义CURSOR
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   IF NOT g_sub_success THEN RETURN r_success END IF
 
   #2.插入临时表
   #FOREACH gen_ap_1_c45 INTO l_apda.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c45 
      INTO l_apda.apdaent,l_apda.apdacomp,l_apda.apdald,l_apda.apdadocno,l_apda.apdadocdt,
           l_apda.apdasite,l_apda.apda001,l_apda.apda002,l_apda.apda003,l_apda.apda004,
           l_apda.apda005,l_apda.apda006,l_apda.apda007,l_apda.apda008,l_apda.apda009,
           l_apda.apda010,l_apda.apda011,l_apda.apda012,l_apda.apda013,l_apda.apda014,
           l_apda.apda015,l_apda.apda016,l_apda.apda017,l_apda.apda018,l_apda.apda019,
           l_apda.apda020,l_apda.apda021,l_apda.apda113,l_apda.apda123,l_apda.apda133,
           l_apda.apdaownid,l_apda.apdaowndp,l_apda.apdacrtid,l_apda.apdacrtdp,l_apda.apdacrtdt,
           l_apda.apdamodid,l_apda.apdamoddt,l_apda.apdacnfid,l_apda.apdacnfdt,l_apda.apdapstid,
           l_apda.apdapstdt,l_apda.apdastus,l_apda.apdaud001,l_apda.apdaud002,l_apda.apdaud003,
           l_apda.apdaud004,l_apda.apdaud005,l_apda.apdaud006,l_apda.apdaud007,l_apda.apdaud008,
           l_apda.apdaud009,l_apda.apdaud010,l_apda.apdaud011,l_apda.apdaud012,l_apda.apdaud013,
           l_apda.apdaud014,l_apda.apdaud015,l_apda.apdaud016,l_apda.apdaud017,l_apda.apdaud018,
           l_apda.apdaud019,l_apda.apdaud020,l_apda.apdaud021,l_apda.apdaud022,l_apda.apdaud023,
           l_apda.apdaud024,l_apda.apdaud025,l_apda.apdaud026,l_apda.apdaud027,l_apda.apdaud028,
           l_apda.apdaud029,l_apda.apdaud030,l_apda.apda104,l_apda.apda105,l_apda.apda114,
           l_apda.apda115,l_apda.apda124,l_apda.apda125,l_apda.apda134,l_apda.apda135,
           l_apda.apda022,l_apda.apda023
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c45'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      #檢查該單別是否可拋轉傳票
      CALL s_aooi200_fin_get_slip(l_apda.apdadocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_apda.apdald,l_apda.apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      #180808-00013#7---add---(S)
      CALL s_fin_get_doc_para(l_apda.apdald,l_apda.apdacomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002
      IF cl_null(g_dfin1002) THEN LET g_dfin1002 = 'N' END IF
      #180808-00013#7---add---(E)
      IF l_chr = 'N' THEN CONTINUE FOREACH END IF
      #借:費用類科目 
      CALL s_aapp330_gen_ap_1_ins_tmp('43',l_apda.apdald,l_apda.apdadocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #贷:收入科目
      CALL s_aapp330_gen_ap_1_ins_tmp('44',l_apda.apdald,l_apda.apdadocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
   END FOREACH
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 應付各期重評價產生傳票
# Memo...........: 180808-00051#1 add p_acctype
# Usage..........: CALL s_aapp330_gen_ap_aapt920(p_ld,p_sum_type,p_wc,p_preview)

# Date & Author..: 2014/10/31 By Reanna
# Modify.........: 2018/09/10 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt920(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_xreg          RECORD LIKE xreg_t.*  #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_xreg RECORD  #重評價帳務主檔
       xregent LIKE xreg_t.xregent, #企業編號
       xregcomp LIKE xreg_t.xregcomp, #法人
       xregsite LIKE xreg_t.xregsite, #帳務中心
       xregdocno LIKE xreg_t.xregdocno, #單據號碼
       xregdocdt LIKE xreg_t.xregdocdt, #單據日期
       xregld LIKE xreg_t.xregld, #帳套
       xreg001 LIKE xreg_t.xreg001, #年度
       xreg002 LIKE xreg_t.xreg002, #期別
       xreg003 LIKE xreg_t.xreg003, #來源模組
       xreg004 LIKE xreg_t.xreg004, #帳務人員
       xreg005 LIKE xreg_t.xreg005, #傳票號碼
       xregstus LIKE xreg_t.xregstus, #狀態碼
       xregownid LIKE xreg_t.xregownid, #資料所有者
       xregowndp LIKE xreg_t.xregowndp, #資料所屬部門
       xregcrtid LIKE xreg_t.xregcrtid, #資料建立者
       xregcrtdp LIKE xreg_t.xregcrtdp, #資料建立部門
       xregcrtdt LIKE xreg_t.xregcrtdt, #資料創建日
       xregmodid LIKE xreg_t.xregmodid, #資料修改者
       xregmoddt LIKE xreg_t.xregmoddt, #最近修改日
       xregcnfid LIKE xreg_t.xregcnfid, #資料確認者
       xregcnfdt LIKE xreg_t.xregcnfdt, #資料確認日
       xregud001 LIKE xreg_t.xregud001, #自定義欄位(文字)001
       xregud002 LIKE xreg_t.xregud002, #自定義欄位(文字)002
       xregud003 LIKE xreg_t.xregud003, #自定義欄位(文字)003
       xregud004 LIKE xreg_t.xregud004, #自定義欄位(文字)004
       xregud005 LIKE xreg_t.xregud005, #自定義欄位(文字)005
       xregud006 LIKE xreg_t.xregud006, #自定義欄位(文字)006
       xregud007 LIKE xreg_t.xregud007, #自定義欄位(文字)007
       xregud008 LIKE xreg_t.xregud008, #自定義欄位(文字)008
       xregud009 LIKE xreg_t.xregud009, #自定義欄位(文字)009
       xregud010 LIKE xreg_t.xregud010, #自定義欄位(文字)010
       xregud011 LIKE xreg_t.xregud011, #自定義欄位(數字)011
       xregud012 LIKE xreg_t.xregud012, #自定義欄位(數字)012
       xregud013 LIKE xreg_t.xregud013, #自定義欄位(數字)013
       xregud014 LIKE xreg_t.xregud014, #自定義欄位(數字)014
       xregud015 LIKE xreg_t.xregud015, #自定義欄位(數字)015
       xregud016 LIKE xreg_t.xregud016, #自定義欄位(數字)016
       xregud017 LIKE xreg_t.xregud017, #自定義欄位(數字)017
       xregud018 LIKE xreg_t.xregud018, #自定義欄位(數字)018
       xregud019 LIKE xreg_t.xregud019, #自定義欄位(數字)019
       xregud020 LIKE xreg_t.xregud020, #自定義欄位(數字)020
       xregud021 LIKE xreg_t.xregud021, #自定義欄位(日期時間)021
       xregud022 LIKE xreg_t.xregud022, #自定義欄位(日期時間)022
       xregud023 LIKE xreg_t.xregud023, #自定義欄位(日期時間)023
       xregud024 LIKE xreg_t.xregud024, #自定義欄位(日期時間)024
       xregud025 LIKE xreg_t.xregud025, #自定義欄位(日期時間)025
       xregud026 LIKE xreg_t.xregud026, #自定義欄位(日期時間)026
       xregud027 LIKE xreg_t.xregud027, #自定義欄位(日期時間)027
       xregud028 LIKE xreg_t.xregud028, #自定義欄位(日期時間)028
       xregud029 LIKE xreg_t.xregud029, #自定義欄位(日期時間)029
       xregud030 LIKE xreg_t.xregud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002    #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1

   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add

   IF NOT g_sub_success THEN RETURN r_success END IF
   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   DELETE FROM s_voucher_tmp WHERE type IN ('1','2');     #Reanna 15/02/05 add  #150825-00004#9 mark #161102-00020#1 remark
  #DELETE FROM s_voucher_tmp WHERE type IN ('1','2','3'); #150825-00004#9 #151203-00013#3 mark
   
   #2.插入临时表
   #FOREACH gen_ap_1_c94 INTO l_xreg.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c94 
      INTO l_xreg.xregent,l_xreg.xregcomp,l_xreg.xregsite,l_xreg.xregdocno,l_xreg.xregdocdt,
           l_xreg.xregld,l_xreg.xreg001,l_xreg.xreg002,l_xreg.xreg003,l_xreg.xreg004,
           l_xreg.xreg005,l_xreg.xregstus,l_xreg.xregownid,l_xreg.xregowndp,l_xreg.xregcrtid,
           l_xreg.xregcrtdp,l_xreg.xregcrtdt,l_xreg.xregmodid,l_xreg.xregmoddt,l_xreg.xregcnfid,
           l_xreg.xregcnfdt,l_xreg.xregud001,l_xreg.xregud002,l_xreg.xregud003,l_xreg.xregud004,
           l_xreg.xregud005,l_xreg.xregud006,l_xreg.xregud007,l_xreg.xregud008,l_xreg.xregud009,
           l_xreg.xregud010,l_xreg.xregud011,l_xreg.xregud012,l_xreg.xregud013,l_xreg.xregud014,
           l_xreg.xregud015,l_xreg.xregud016,l_xreg.xregud017,l_xreg.xregud018,l_xreg.xregud019,
           l_xreg.xregud020,l_xreg.xregud021,l_xreg.xregud022,l_xreg.xregud023,l_xreg.xregud024,
           l_xreg.xregud025,l_xreg.xregud026,l_xreg.xregud027,l_xreg.xregud028,l_xreg.xregud029,
           l_xreg.xregud030
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c94'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      
      #Reanna 15/02/04 mark-------------------
      ##檢查該單別是否可拋轉傳票
      #CALL s_aooi200_fin_get_slip(l_xreg.xregdocno) RETURNING g_sub_success,l_ap_slip
      #CALL s_fin_get_doc_para(l_xreg.xregld,l_xreg.xregcomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      #IF l_chr = 'N' THEN CONTINUE FOREACH END IF
      #Reanna 15/02/04 mark end--------------
      
      #180808-00013#1---add---(S)
      CALL s_aooi200_fin_get_slip(l_xreg.xregdocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_xreg.xregld,l_xreg.xregcomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002
      IF cl_null(g_dfin1002) THEN LET g_dfin1002 = 'N' END IF
      #180808-00013#1---add---(E)
      #借:匯兌損失科目
      CALL s_aapp330_gen_ap_1_ins_tmp('95',l_xreg.xregld,l_xreg.xregdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #贷:應付科目
      CALL s_aapp330_gen_ap_1_ins_tmp('96',l_xreg.xregld,l_xreg.xregdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
   
   END FOREACH
   LET r_success = TRUE
   RETURN r_success


END FUNCTION

################################################################################
# Descriptions...: 應付各期暂估账务產生傳票
# Memo...........: 180808-00051#1 add p_acctype
# Usage..........: CALL s_aapp330_gen_ap_aapt930(p_ld,p_sum_type,p_wc,p_preview)
#                : RETURNING r_success
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#54  by 09505  
#                : 180910 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt930(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_xrem          RECORD LIKE xrem_t.*    #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_xrem RECORD  #暫估帳務主檔
       xrement LIKE xrem_t.xrement, #企業編號
       xremownid LIKE xrem_t.xremownid, #資料所有者
       xremowndp LIKE xrem_t.xremowndp, #資料所屬部門
       xremcrtid LIKE xrem_t.xremcrtid, #資料建立者
       xremcrtdp LIKE xrem_t.xremcrtdp, #資料建立部門
       xremcrtdt LIKE xrem_t.xremcrtdt, #資料創建日
       xremmodid LIKE xrem_t.xremmodid, #資料修改者
       xremmoddt LIKE xrem_t.xremmoddt, #最近修改日
       xremcnfid LIKE xrem_t.xremcnfid, #資料確認者
       xremcnfdt LIKE xrem_t.xremcnfdt, #資料確認日
       xremstus LIKE xrem_t.xremstus, #狀態碼
       xremsite LIKE xrem_t.xremsite, #營運據點
       xremld LIKE xrem_t.xremld, #帳套
       xremcomp LIKE xrem_t.xremcomp, #法人
       xremdocno LIKE xrem_t.xremdocno, #單據編號
       xremdocdt LIKE xrem_t.xremdocdt, #單據日期
       xrem001 LIKE xrem_t.xrem001, #年度
       xrem002 LIKE xrem_t.xrem002, #期別
       xrem003 LIKE xrem_t.xrem003, #來源模組
       xrem004 LIKE xrem_t.xrem004, #帳務人員
       xrem005 LIKE xrem_t.xrem005, #傳票號碼
       xrem006 LIKE xrem_t.xrem006, #暫估類型
       xremud001 LIKE xrem_t.xremud001, #自定義欄位(文字)001
       xremud002 LIKE xrem_t.xremud002, #自定義欄位(文字)002
       xremud003 LIKE xrem_t.xremud003, #自定義欄位(文字)003
       xremud004 LIKE xrem_t.xremud004, #自定義欄位(文字)004
       xremud005 LIKE xrem_t.xremud005, #自定義欄位(文字)005
       xremud006 LIKE xrem_t.xremud006, #自定義欄位(文字)006
       xremud007 LIKE xrem_t.xremud007, #自定義欄位(文字)007
       xremud008 LIKE xrem_t.xremud008, #自定義欄位(文字)008
       xremud009 LIKE xrem_t.xremud009, #自定義欄位(文字)009
       xremud010 LIKE xrem_t.xremud010, #自定義欄位(文字)010
       xremud011 LIKE xrem_t.xremud011, #自定義欄位(數字)011
       xremud012 LIKE xrem_t.xremud012, #自定義欄位(數字)012
       xremud013 LIKE xrem_t.xremud013, #自定義欄位(數字)013
       xremud014 LIKE xrem_t.xremud014, #自定義欄位(數字)014
       xremud015 LIKE xrem_t.xremud015, #自定義欄位(數字)015
       xremud016 LIKE xrem_t.xremud016, #自定義欄位(數字)016
       xremud017 LIKE xrem_t.xremud017, #自定義欄位(數字)017
       xremud018 LIKE xrem_t.xremud018, #自定義欄位(數字)018
       xremud019 LIKE xrem_t.xremud019, #自定義欄位(數字)019
       xremud020 LIKE xrem_t.xremud020, #自定義欄位(數字)020
       xremud021 LIKE xrem_t.xremud021, #自定義欄位(日期時間)021
       xremud022 LIKE xrem_t.xremud022, #自定義欄位(日期時間)022
       xremud023 LIKE xrem_t.xremud023, #自定義欄位(日期時間)023
       xremud024 LIKE xrem_t.xremud024, #自定義欄位(日期時間)024
       xremud025 LIKE xrem_t.xremud025, #自定義欄位(日期時間)025
       xremud026 LIKE xrem_t.xremud026, #自定義欄位(日期時間)026
       xremud027 LIKE xrem_t.xremud027, #自定義欄位(日期時間)027
       xremud028 LIKE xrem_t.xremud028, #自定義欄位(日期時間)028
       xremud029 LIKE xrem_t.xremud029, #自定義欄位(日期時間)029
       xremud030 LIKE xrem_t.xremud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1

 
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   
   IF NOT g_sub_success THEN RETURN r_success END IF
   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   DELETE FROM s_voucher_tmp WHERE type IN ('1','2'); #Reanna 15/02/05 add
   
   #2.插入临时表
   #FOREACH gen_ap_1_c90 INTO l_xrem.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c90 
      INTO l_xrem.xrement,l_xrem.xremownid,l_xrem.xremowndp,l_xrem.xremcrtid,l_xrem.xremcrtdp,
           l_xrem.xremcrtdt,l_xrem.xremmodid,l_xrem.xremmoddt,l_xrem.xremcnfid,l_xrem.xremcnfdt,
           l_xrem.xremstus,l_xrem.xremsite,l_xrem.xremld,l_xrem.xremcomp,l_xrem.xremdocno,
           l_xrem.xremdocdt,l_xrem.xrem001,l_xrem.xrem002,l_xrem.xrem003,l_xrem.xrem004,
           l_xrem.xrem005,l_xrem.xrem006,l_xrem.xremud001,l_xrem.xremud002,l_xrem.xremud003,
           l_xrem.xremud004,l_xrem.xremud005,l_xrem.xremud006,l_xrem.xremud007,l_xrem.xremud008,
           l_xrem.xremud009,l_xrem.xremud010,l_xrem.xremud011,l_xrem.xremud012,l_xrem.xremud013,
           l_xrem.xremud014,l_xrem.xremud015,l_xrem.xremud016,l_xrem.xremud017,l_xrem.xremud018,
           l_xrem.xremud019,l_xrem.xremud020,l_xrem.xremud021,l_xrem.xremud022,l_xrem.xremud023,
           l_xrem.xremud024,l_xrem.xremud025,l_xrem.xremud026,l_xrem.xremud027,l_xrem.xremud028,
           l_xrem.xremud029,l_xrem.xremud030
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c90'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      #判斷是否允許紅字發票 151020  ---s---
      CALL s_aooi200_fin_get_slip(l_xrem.xremdocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_xrem.xremld,l_xrem.xremcomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002
                         #151029  ---e---
      #Reanna 15/02/04 mark-------------------
      ##檢查該單別是否可拋轉傳票
      #CALL s_aooi200_fin_get_slip(l_xrem.xremdocno) RETURNING g_sub_success,l_ap_slip
      #CALL s_fin_get_doc_para(l_xrem.xremld,l_xrem.xremcomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      #IF l_chr = 'N' THEN CONTINUE FOREACH END IF
      ##Reanna 15/02/04 mark end--------------
      
      #借:費用類科目 
      CALL s_aapp330_gen_ap_1_ins_tmp('91',l_xrem.xremld,l_xrem.xremdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #贷:收入科目
      CALL s_aapp330_gen_ap_1_ins_tmp('92',l_xrem.xremld,l_xrem.xremdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
   END FOREACH
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: aapt931應付各期暂估账务產生傳票
# Memo...........: 180808-00051#1 add p_acctype
# Usage..........: CALL s_aapp330_gen_ap_aapt931(p_ld,p_sum_type,p_wc,p_preview)
#                  RETURNING r_success
# Input parameter: p_ld          账套
#                : p_sum_type    合计
#                : p_wc          查询条件
#                : p_preview     预设值
# Return code....: r_success     TRUE/FALSE
#                : 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#54  by 09505  
#                : 180910 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt931(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_xrem          RECORD LIKE xrem_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_xrem RECORD  #暫估帳務主檔
       xrement LIKE xrem_t.xrement, #企業編號
       xremownid LIKE xrem_t.xremownid, #資料所有者
       xremowndp LIKE xrem_t.xremowndp, #資料所屬部門
       xremcrtid LIKE xrem_t.xremcrtid, #資料建立者
       xremcrtdp LIKE xrem_t.xremcrtdp, #資料建立部門
       xremcrtdt LIKE xrem_t.xremcrtdt, #資料創建日
       xremmodid LIKE xrem_t.xremmodid, #資料修改者
       xremmoddt LIKE xrem_t.xremmoddt, #最近修改日
       xremcnfid LIKE xrem_t.xremcnfid, #資料確認者
       xremcnfdt LIKE xrem_t.xremcnfdt, #資料確認日
       xremstus LIKE xrem_t.xremstus, #狀態碼
       xremsite LIKE xrem_t.xremsite, #營運據點
       xremld LIKE xrem_t.xremld, #帳套
       xremcomp LIKE xrem_t.xremcomp, #法人
       xremdocno LIKE xrem_t.xremdocno, #單據編號
       xremdocdt LIKE xrem_t.xremdocdt, #單據日期
       xrem001 LIKE xrem_t.xrem001, #年度
       xrem002 LIKE xrem_t.xrem002, #期別
       xrem003 LIKE xrem_t.xrem003, #來源模組
       xrem004 LIKE xrem_t.xrem004, #帳務人員
       xrem005 LIKE xrem_t.xrem005, #傳票號碼
       xrem006 LIKE xrem_t.xrem006, #暫估類型
       xremud001 LIKE xrem_t.xremud001, #自定義欄位(文字)001
       xremud002 LIKE xrem_t.xremud002, #自定義欄位(文字)002
       xremud003 LIKE xrem_t.xremud003, #自定義欄位(文字)003
       xremud004 LIKE xrem_t.xremud004, #自定義欄位(文字)004
       xremud005 LIKE xrem_t.xremud005, #自定義欄位(文字)005
       xremud006 LIKE xrem_t.xremud006, #自定義欄位(文字)006
       xremud007 LIKE xrem_t.xremud007, #自定義欄位(文字)007
       xremud008 LIKE xrem_t.xremud008, #自定義欄位(文字)008
       xremud009 LIKE xrem_t.xremud009, #自定義欄位(文字)009
       xremud010 LIKE xrem_t.xremud010, #自定義欄位(文字)010
       xremud011 LIKE xrem_t.xremud011, #自定義欄位(數字)011
       xremud012 LIKE xrem_t.xremud012, #自定義欄位(數字)012
       xremud013 LIKE xrem_t.xremud013, #自定義欄位(數字)013
       xremud014 LIKE xrem_t.xremud014, #自定義欄位(數字)014
       xremud015 LIKE xrem_t.xremud015, #自定義欄位(數字)015
       xremud016 LIKE xrem_t.xremud016, #自定義欄位(數字)016
       xremud017 LIKE xrem_t.xremud017, #自定義欄位(數字)017
       xremud018 LIKE xrem_t.xremud018, #自定義欄位(數字)018
       xremud019 LIKE xrem_t.xremud019, #自定義欄位(數字)019
       xremud020 LIKE xrem_t.xremud020, #自定義欄位(數字)020
       xremud021 LIKE xrem_t.xremud021, #自定義欄位(日期時間)021
       xremud022 LIKE xrem_t.xremud022, #自定義欄位(日期時間)022
       xremud023 LIKE xrem_t.xremud023, #自定義欄位(日期時間)023
       xremud024 LIKE xrem_t.xremud024, #自定義欄位(日期時間)024
       xremud025 LIKE xrem_t.xremud025, #自定義欄位(日期時間)025
       xremud026 LIKE xrem_t.xremud026, #自定義欄位(日期時間)026
       xremud027 LIKE xrem_t.xremud027, #自定義欄位(日期時間)027
       xremud028 LIKE xrem_t.xremud028, #自定義欄位(日期時間)028
       xremud029 LIKE xrem_t.xremud029, #自定義欄位(日期時間)029
       xremud030 LIKE xrem_t.xremud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1

 
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   
   IF NOT g_sub_success THEN RETURN r_success END IF
   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   DELETE FROM s_voucher_tmp WHERE type IN ('1','2'); #Reanna 15/02/05 add
   
   #2.插入临时表
   #FOREACH gen_ap_1_c90 INTO l_xrem.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c90 
      INTO l_xrem.xrement,l_xrem.xremownid,l_xrem.xremowndp,l_xrem.xremcrtid,l_xrem.xremcrtdp,
           l_xrem.xremcrtdt,l_xrem.xremmodid,l_xrem.xremmoddt,l_xrem.xremcnfid,l_xrem.xremcnfdt,
           l_xrem.xremstus,l_xrem.xremsite,l_xrem.xremld,l_xrem.xremcomp,l_xrem.xremdocno,
           l_xrem.xremdocdt,l_xrem.xrem001,l_xrem.xrem002,l_xrem.xrem003,l_xrem.xrem004,
           l_xrem.xrem005,l_xrem.xrem006,l_xrem.xremud001,l_xrem.xremud002,l_xrem.xremud003,
           l_xrem.xremud004,l_xrem.xremud005,l_xrem.xremud006,l_xrem.xremud007,l_xrem.xremud008,
           l_xrem.xremud009,l_xrem.xremud010,l_xrem.xremud011,l_xrem.xremud012,l_xrem.xremud013,
           l_xrem.xremud014,l_xrem.xremud015,l_xrem.xremud016,l_xrem.xremud017,l_xrem.xremud018,
           l_xrem.xremud019,l_xrem.xremud020,l_xrem.xremud021,l_xrem.xremud022,l_xrem.xremud023,
           l_xrem.xremud024,l_xrem.xremud025,l_xrem.xremud026,l_xrem.xremud027,l_xrem.xremud028,
           l_xrem.xremud029,l_xrem.xremud030
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c90'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
    
    #判斷是否允許紅字發票 151020  ---s---
      CALL s_aooi200_fin_get_slip(l_xrem.xremdocno) RETURNING g_sub_success,l_ap_slip
      CALL s_fin_get_doc_para(l_xrem.xremld,l_xrem.xremcomp,l_ap_slip,'D-FIN-1002') RETURNING g_dfin1002
                         #151029  ---e---
      
      #Reanna 15/02/04 mark------------------
      ##檢查該單別是否可拋轉傳票
      #CALL s_aooi200_fin_get_slip(l_xrem.xremdocno) RETURNING g_sub_success,l_ap_slip
      #CALL s_fin_get_doc_para(l_xrem.xremld,l_xrem.xremcomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
      #IF l_chr = 'N' THEN CONTINUE FOREACH END IF
      #Reanna 15/02/04 mark end--------------
      
      #贷:費用類科目  #170515-00018#1 mod 借>>贷
      CALL s_aapp330_gen_ap_1_ins_tmp('93',l_xrem.xremld,l_xrem.xremdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #借:收入科目    #170515-00018#1 mod 贷>>借
      CALL s_aapp330_gen_ap_1_ins_tmp('94',l_xrem.xremld,l_xrem.xremdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
   END FOREACH
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 壞帳帳齡傳票
# Memo...........: 180808-00051#1 add p_acctype
# Date & Author..: 141105 By albireo
# Modify.........: 180910 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_aapt940(p_ld,p_sum_type,p_wc,p_preview,p_acctype)
DEFINE p_ld            LIKE glaa_t.glaald
DEFINE p_sum_type      LIKE type_t.chr1
DEFINE p_wc            LIKE type_t.chr1000
DEFINE p_preview       LIKE type_t.chr1
DEFINE p_acctype       LIKE type_t.chr1 #180808-00051#1 add
DEFINE r_success       LIKE type_t.num5
#DEFINE l_xrej          RECORD LIKE xrej_t.*    #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_xrej RECORD  #壞帳提列主檔
       xrejent LIKE xrej_t.xrejent, #企業編號
       xrejownid LIKE xrej_t.xrejownid, #資料所有者
       xrejowndp LIKE xrej_t.xrejowndp, #資料所屬部門
       xrejcrtid LIKE xrej_t.xrejcrtid, #資料建立者
       xrejcrtdp LIKE xrej_t.xrejcrtdp, #資料建立部門
       xrejcrtdt LIKE xrej_t.xrejcrtdt, #資料創建日
       xrejmodid LIKE xrej_t.xrejmodid, #資料修改者
       xrejmoddt LIKE xrej_t.xrejmoddt, #最近修改日
       xrejcnfid LIKE xrej_t.xrejcnfid, #資料確認者
       xrejcnfdt LIKE xrej_t.xrejcnfdt, #資料確認日
       xrejstus LIKE xrej_t.xrejstus, #狀態碼
       xrejsite LIKE xrej_t.xrejsite, #帳務中心
       xrejld LIKE xrej_t.xrejld, #帳套
       xrejcomp LIKE xrej_t.xrejcomp, #法人
       xrejdocno LIKE xrej_t.xrejdocno, #單號
       xrejdocdt LIKE xrej_t.xrejdocdt, #單據日期
       xrej001 LIKE xrej_t.xrej001, #年度
       xrej002 LIKE xrej_t.xrej002, #期別
       xrej003 LIKE xrej_t.xrej003, #來源模組
       xrej004 LIKE xrej_t.xrej004, #帳務人員
       xrej005 LIKE xrej_t.xrej005, #傳票號碼
       xrejud001 LIKE xrej_t.xrejud001, #自定義欄位(文字)001
       xrejud002 LIKE xrej_t.xrejud002, #自定義欄位(文字)002
       xrejud003 LIKE xrej_t.xrejud003, #自定義欄位(文字)003
       xrejud004 LIKE xrej_t.xrejud004, #自定義欄位(文字)004
       xrejud005 LIKE xrej_t.xrejud005, #自定義欄位(文字)005
       xrejud006 LIKE xrej_t.xrejud006, #自定義欄位(文字)006
       xrejud007 LIKE xrej_t.xrejud007, #自定義欄位(文字)007
       xrejud008 LIKE xrej_t.xrejud008, #自定義欄位(文字)008
       xrejud009 LIKE xrej_t.xrejud009, #自定義欄位(文字)009
       xrejud010 LIKE xrej_t.xrejud010, #自定義欄位(文字)010
       xrejud011 LIKE xrej_t.xrejud011, #自定義欄位(數字)011
       xrejud012 LIKE xrej_t.xrejud012, #自定義欄位(數字)012
       xrejud013 LIKE xrej_t.xrejud013, #自定義欄位(數字)013
       xrejud014 LIKE xrej_t.xrejud014, #自定義欄位(數字)014
       xrejud015 LIKE xrej_t.xrejud015, #自定義欄位(數字)015
       xrejud016 LIKE xrej_t.xrejud016, #自定義欄位(數字)016
       xrejud017 LIKE xrej_t.xrejud017, #自定義欄位(數字)017
       xrejud018 LIKE xrej_t.xrejud018, #自定義欄位(數字)018
       xrejud019 LIKE xrej_t.xrejud019, #自定義欄位(數字)019
       xrejud020 LIKE xrej_t.xrejud020, #自定義欄位(數字)020
       xrejud021 LIKE xrej_t.xrejud021, #自定義欄位(日期時間)021
       xrejud022 LIKE xrej_t.xrejud022, #自定義欄位(日期時間)022
       xrejud023 LIKE xrej_t.xrejud023, #自定義欄位(日期時間)023
       xrejud024 LIKE xrej_t.xrejud024, #自定義欄位(日期時間)024
       xrejud025 LIKE xrej_t.xrejud025, #自定義欄位(日期時間)025
       xrejud026 LIKE xrej_t.xrejud026, #自定義欄位(日期時間)026
       xrejud027 LIKE xrej_t.xrejud027, #自定義欄位(日期時間)027
       xrejud028 LIKE xrej_t.xrejud028, #自定義欄位(日期時間)028
       xrejud029 LIKE xrej_t.xrejud029, #自定義欄位(日期時間)029
       xrejud030 LIKE xrej_t.xrejud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE l_ap_slip       LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE l_chr           LIKE type_t.chr1

 
   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview) RETURNING g_sub_success            #180808-00051#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,p_wc,p_sum_type,p_preview,p_acctype) RETURNING g_sub_success  #180808-00051#1 add
   
   IF NOT g_sub_success THEN RETURN r_success END IF
   
   IF p_sum_type NOT MATCHES '[12345]' THEN #产生凭证的汇总方式仅可为1或2或3
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00337'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success
   END IF
   
   DELETE FROM s_voucher_tmp WHERE type IN ('1','2'); #Reanna 15/02/05 add
   
   #2.插入临时表
   #FOREACH gen_ap_1_c9401 INTO l_xrej.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   FOREACH gen_ap_1_c9401 
      INTO l_xrej.xrejent,l_xrej.xrejownid,l_xrej.xrejowndp,l_xrej.xrejcrtid,l_xrej.xrejcrtdp,
           l_xrej.xrejcrtdt,l_xrej.xrejmodid,l_xrej.xrejmoddt,l_xrej.xrejcnfid,l_xrej.xrejcnfdt,
           l_xrej.xrejstus,l_xrej.xrejsite,l_xrej.xrejld,l_xrej.xrejcomp,l_xrej.xrejdocno,
           l_xrej.xrejdocdt,l_xrej.xrej001,l_xrej.xrej002,l_xrej.xrej003,l_xrej.xrej004,
           l_xrej.xrej005,l_xrej.xrejud001,l_xrej.xrejud002,l_xrej.xrejud003,l_xrej.xrejud004,
           l_xrej.xrejud005,l_xrej.xrejud006,l_xrej.xrejud007,l_xrej.xrejud008,l_xrej.xrejud009,
           l_xrej.xrejud010,l_xrej.xrejud011,l_xrej.xrejud012,l_xrej.xrejud013,l_xrej.xrejud014,
           l_xrej.xrejud015,l_xrej.xrejud016,l_xrej.xrejud017,l_xrej.xrejud018,l_xrej.xrejud019,
           l_xrej.xrejud020,l_xrej.xrejud021,l_xrej.xrejud022,l_xrej.xrejud023,l_xrej.xrejud024,
           l_xrej.xrejud025,l_xrej.xrejud026,l_xrej.xrejud027,l_xrej.xrejud028,l_xrej.xrejud029,
           l_xrej.xrejud030
   #161208-00026#23   add---e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c9401'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF

      #借:費用類科目 
      CALL s_aapp330_gen_ap_1_ins_tmp('9a',l_xrej.xrejld,l_xrej.xrejdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
      #貸:收入科目
      CALL s_aapp330_gen_ap_1_ins_tmp('9b',l_xrej.xrejld,l_xrej.xrejdocno,'','','') RETURNING g_sub_success
      IF NOT g_sub_success THEN RETURN r_success END IF
      
   END FOREACH
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 寫入Temp檔
# Memo...........:
# Date & Author..: 14/07/18 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_1_ins_tmp(p_type,p_apcald,p_apcadocno,p_apca036,p_apca001,p_apca007)
DEFINE p_type           LIKE type_t.chr5        #類型
DEFINE p_apcald         LIKE apca_t.apcald      #帳別
DEFINE p_apcadocno      LIKE apca_t.apcadocno   #帳款編號
DEFINE p_apca036        LIKE apca_t.apca036     #
DEFINE p_apca001        LIKE apca_t.apca001     #帳款單性質
DEFINE p_apca007        LIKE apca_t.apca007
DEFINE r_success        LIKE type_t.num5
DEFINE l_apce015        LIKE apce_t.apce015
DEFINE l_n              LIKE type_t.num5
DEFINE l_xren004        LIKE xren_t.xren004     #帳款單性質
DEFINE l_xren005        LIKE xren_t.xren005     #170214 add 立帳單據號碼
DEFINE l_flag           LIKE type_t.chr1
DEFINE l_apca106        LIKE apca_t.apca106
DEFINE l_apca116        LIKE apca_t.apca116
DEFINE l_apca126        LIKE apca_t.apca126
DEFINE l_apca136        LIKE apca_t.apca136
DEFINE l_apca106_clac   LIKE apca_t.apca116
DEFINE l_apca116_clac   LIKE apca_t.apca116
DEFINE l_apca126_clac   LIKE apca_t.apca126
DEFINE l_apca136_clac   LIKE apca_t.apca136
DEFINE l_glaa001        LIKE glaa_t.glaa001
DEFINE l_apca001        LIKE apca_t.apca001
DEFINE l_apcf008        LIKE apcf_t.apcf008
#DEFINE l_glab011        LIKE glab_t.glab011    #150825-00004#9 #151203-00013#3 mark
DEFINE l_ap_slip        LIKE ooba_t.ooba002     #151029 應付帳款單單別
DEFINE l_glad034        LIKE glad_t.glad034     #151216-00008#3
DEFINE l_apca058        LIKE apca_t.apca058     #160107-00001#1
DEFINE l_apcb001        LIKE apcb_t.apcb011     #160107-00001#1
DEFINE l_apcb002        LIKE apcb_t.apcb002     #160107-00001#1
DEFINE l_apcb003        LIKE apcb_t.apcb003     #160107-00001#1
DEFINE l_apcb004        LIKE apcb_t.apcb004     #160107-00001#1
DEFINE l_apcb034        LIKE apcb_t.apcb034     #160107-00001#1
DEFINE l_apcb106        LIKE apcb_t.apcb106     #160107-00001#1
DEFINE l_apcb116        LIKE apcb_t.apcb116     #160107-00001#1
DEFINE l_apcb126        LIKE apcb_t.apcb126     #160107-00001#1
DEFINE l_apcb136        LIKE apcb_t.apcb136     #160107-00001#1
DEFINE l_pmdt016        LIKE pmdt_t.pmdt016     #160107-00001#1
DEFINE l_sql            STRING
#160628-00002#2--add--str--
DEFINE l_apce003        LIKE apce_t.apce003
DEFINE l_apca007        LIKE apca_t.apca007
DEFINE l_apca011        LIKE apca_t.apca011
#160628-00002#2--add--end
#160816-00022#4 --s add
DEFINE l_cross_mon      LIKE type_t.chr1
DEFINE l_apcadocdt      LIKE apca_t.apcadocdt
DEFINE l_cnt            LIKE type_t.num10
#160816-00022#4 --e add   
#albireo 170215 #170215-00043#1-----s
DEFINE l_xren103        LIKE xren_t.xren103
DEFINE l_xren113        LIKE xren_t.xren113
DEFINE l_apcb103sum        LIKE type_t.num20_6
DEFINE l_apcb113sum        LIKE type_t.num20_6
DEFINE l_apcb021max        LIKE apcb_t.apcb021
DEFINE l_apcb113diff       LIKE type_t.num20_6
DEFINE l_apcb103diff       LIKE type_t.num20_6
#albireo 170215 #170215-00043#1-----e
#170216-00006#1-----s
DEFINE l_tmp            type_g_tmp_d
DEFINE l_d              LIKE type_t.num20_6
DEFINE l_sum            LIKE type_t.num20_6
#170216-00006#1-----e
DEFINE l_prog           LIKE type_t.chr20   #170328-00075#1 add
#170515-00018#1---add---str--
DEFINE l_glaq025        LIKE glaq_t.glaq025
DEFINE l_glaq018        LIKE glaq_t.glaq018
DEFINE l_glaq019        LIKE glaq_t.glaq019
DEFINE l_glaq020        LIKE glaq_t.glaq020
DEFINE l_glaq024        LIKE glaq_t.glaq024
DEFINE l_glaq027        LIKE glaq_t.glaq027
DEFINE l_glaq028        LIKE glaq_t.glaq028
DEFINE l_glaq026        LIKE glaq_t.glaq026
DEFINE l_glaq051        LIKE glaq_t.glaq051
DEFINE l_glaq052        LIKE glaq_t.glaq052
DEFINE l_glaq053        LIKE glaq_t.glaq053
DEFINE l_glaq023        LIKE glaq_t.glaq023
DEFINE l_glaq022        LIKE glaq_t.glaq022
DEFINE l_glaq021        LIKE glaq_t.glaq021
DEFINE l_glaq029        LIKE glaq_t.glaq029
DEFINE l_glaq030        LIKE glaq_t.glaq030
DEFINE l_glaq031        LIKE glaq_t.glaq031
DEFINE l_glaq032        LIKE glaq_t.glaq032
DEFINE l_glaq033        LIKE glaq_t.glaq033
DEFINE l_glaq034        LIKE glaq_t.glaq034
DEFINE l_glaq035        LIKE glaq_t.glaq035
DEFINE l_glaq036        LIKE glaq_t.glaq036
DEFINE l_glaq037        LIKE glaq_t.glaq037
DEFINE l_glaq038        LIKE glaq_t.glaq038
#170515-00018#1---add---end--
DEFINE l_tot_d          LIKE xren_t.xren113   #170628-00052#1 add
DEFINE l_tot_sum        LIKE xren_t.xren103   #170628-00052#1 add
#170821-00012#1 --s add
DEFINE l_apch009        LIKE apch_t.apch009
DEFINE l_apch010        LIKE apch_t.apch010
DEFINE l_apch011        LIKE apch_t.apch011 
DEFINE l_apch0102       LIKE apch_t.apch010
DEFINE l_apch0103       LIKE apch_t.apch010
DEFINE l_nouse          LIKE apch_t.apch010
DEFINE l_flag2          LIKE type_t.chr1      #180227-00043#3 add '1'代表账款科目资料，‘2’代表重评价科目资料
#170821-00012#1 --e add
DEFINE l_apde002        LIKE apde_t.apde002   #180129-00027#1 add 
#180712-00002#1 --begin
DEFINE l_success        LIKE type_t.num5
DEFINE l_slip           STRING
DEFINE l_ooac004        LIKE ooac_t.ooac004
#180712-00002#1 --end
#180731-00017#7 Add By 06137  180814(S)               
DEFINE ld_date_b   LIKE type_t.dat
DEFINE ld_date_e   LIKE type_t.dat
#180731-00017#7 Add By 06137  180814(E)
DEFINE l_pmds011   LIKE pmds_t.pmds011  #200907-00035#1 add
DEFINE l_oobx004   LIKE oobx_t.oobx004  #201204-00019#1  add
DEFINE l_apcb115   LIKE apcb_t.apcb115  #201204-00019#1  add


   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   INITIALIZE g_tmp.* TO NULL
   
   #180124-00020#1 --s add AP科目名稱對應類型賦值
   #科目名稱		   /     紀錄科目類型
   -------------------------------------
   #借:費用類科目		       :   10
   #進項稅額		             :   20
   #成本		                :   40
   #沖暫估		             :   50
   #沖暫估DIFF		          :   60
   #直接沖賬		             :   65   
   #直接付款		             :   70
   #沖暫估稅額		          :   80
   #沖銷稅額		             :   90
   #贷 應付科目(處理直接沖帳) :  100
   #手動維護底稿輸入	       :  990
   #180124-00020#1 --e add
   
   #160816-00022#4 --s add
   #若期初回轉否=Y,沖暫估訊息中非diff單據,有沖非本月份的,則同一般費用處理
   LET l_cross_mon = 'N'
   #IF g_sfin2011 = 'Y' THEN                          #170821-00012#1 mark
   IF (g_sfin2011 = 'Y') AND (g_sfin3034 = 'N') THEN  #170821-00012#1 add
        #判斷該回轉 是否有跨月
      LET l_apcadocdt = ''
      SELECT apcadocdt INTO l_apcadocdt 
        FROM apca_t WHERE apcaent = g_enterprise AND apcald = p_apcald AND apcadocno = p_apcadocno
      IF NOT cl_null(l_apcadocdt) THEN #201209-00007#1---add  
         LET l_cnt = 0
         #180731-00017#7 Mark By 06137  180814(S)
         #SELECT COUNT(*) INTO l_cnt
         #  FROM apcf_t,apca_t
         # WHERE apcaent = apcfent AND apcald = apcfld AND apcadocno = apcf008
         #   AND apcfent = g_enterprise AND apcfld = p_apcald
         #   AND apcfdocno = p_apcadocno AND apcf008 <> 'DIFF' 
         #   AND apca001 IN ('01','02','03','04')
         #   AND (to_char(apcadocdt,'yyyy') = to_char(l_apcadocdt,'yyyy') AND to_char(apcadocdt,'mm') = to_char(l_apcadocdt,'mm'))
         #180731-00017#7 Mark By 06137  180814(E)
         #180731-00017#7 Add By 06137  180814(S)
         LET ld_date_b = s_date_get_first_date(l_apcadocdt)
         LET ld_date_e = s_date_get_last_date(l_apcadocdt)      
         LET l_sql = " SELECT COUNT(*) ", 
                     "   FROM apcf_t,apca_t ",
                     "  WHERE apcaent = apcfent AND apcald = apcfld AND apcadocno = apcf008 ",
                     "    AND apcfent = ",g_enterprise,
                     "    AND apcfld = '",p_apcald,"' ",
                     "    AND apcfdocno = '",p_apcadocno,"' AND apcf008 <> 'DIFF' ", 
                     "    AND apca001 IN ('01','02','03','04') ",
                     "    AND (apcadocdt BETWEEN ? AND ? ) " 
         PREPARE s_aapp330_apcf_cnt FROM l_sql
         EXECUTE s_aapp330_apcf_cnt USING ld_date_b,ld_date_e INTO l_cnt
         #180731-00017#7 Add By 06137  180814(E)   
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt = 0 THEN   #表示有沖非本月份的
            LET l_cross_mon = 'Y'
         END IF
      END IF  #201209-00007#1---add  
   END IF
   #160816-00022#4 --e add
   
   #170821-00012#1 --s add
   #DIFF 原幣價差金額/DIFF 本幣價差金額
   LET l_sql = " SELECT apch009,apch010,apch011 FROM apch_t ",
               "  WHERE apchent = ",g_enterprise," AND apchcomp = ?  ",
               "    AND apchdocno = ? AND apchseq = ? ",
               "    AND apch003||'-'||apch004 IN (SELECT apcb002||'-'||apcb003 FROM apcb_t  ",
               "                                   WHERE apcbent = ",g_enterprise," AND apcbld = ? ",
               "                                     AND apcbdocno = ? AND apcbseq = ? ) ", 
               #"    AND apch010 <> 0 AND apch009 <> 0  "                  #171011-00005#1 mark
               "    AND (apch010 <> 0 OR apch009 <> 0 OR apch011 <> 0)  "  #171011-00005#1 add
   PREPARE get_apchp FROM l_sql   
   #170821-00012#1 --e add

 
   CASE p_type
        WHEN '11' #借:費用類科目
               FOREACH gen_ap_1_c11 USING p_apcadocno INTO g_tmp.*,l_apcb001,l_apcb106,l_apcb116,l_apcb126,l_apcb136
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c11'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
                  
                  #190626-00054#1 add s---#餐饮烘焙，(存在内部暂估单的)外部暂估单存货科目客商核算项=stbcsite
                  LET l_cnt = 0
                  #是否存在内部暂估单
                  SELECT COUNT(1) INTO l_cnt FROM apca_t,apcb_t 
                   WHERE apcaent = apcbent AND apcald = apcbld AND apcadocno = apcbdocno AND apca001 IN('06','07') 
                     AND apcb002||apcb003 IN(SELECT apcb002||apcb003 FROM apca_t,apcb_t WHERE apcaent = apcbent AND apcald = apcbld 
                                                AND apcadocno = apcbdocno AND apcaent = g_enterprise AND apcadocno = p_apcadocno 
                                                AND apca001 IN('01','02'))  #限定apcadocno是外部暂估单
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt > 0 THEN #存在内部暂估单
                     SELECT ooef017 INTO g_tmp.glaq021
                       FROM ooef_t
                      WHERE ooef001 = (SELECT stbcsite FROM stbc_t WHERE stbcent = g_enterprise 
                                          AND stbc004||stbc005 IN(SELECT apcb002||apcb003 FROM apca_t,apcb_t WHERE apcaent = apcbent 
                                          AND apcald = apcbld AND apcadocno = apcbdocno AND apcaent = g_enterprise AND apcadocno = p_apcadocno))
                        AND ooefent = g_enterprise
                     LET g_tmp.glaq022 = g_tmp.glaq021
                  END IF
                  #190626-00054#1 add e---#餐饮烘焙，外部暂估单存货科目客商核算项=stbcsite                   
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  ##不迴轉(Y代表回转。N不回转:抓apcf資料
                 #IF g_sfin2011 = 'N' AND g_tmp.apcb023 = 'Y' THEN   #160621-00026#1 mark
                 #不看迴轉否,有沖暫估信息就要依照他來產生分錄            #160621-00026#1
                  #IF g_tmp.apcb023 = 'Y' THEN                        #160621-00026#1                               #160816-00022#4 mark
                  IF g_tmp.apcb023 = 'Y' AND (g_sfin2011 = 'N' OR (g_sfin2011 = 'Y' AND l_cross_mon = 'N')) THEN    #160816-00022#4 add  當為沖暫估單據,且(參數不回轉)或(參數回轉且沖暫估單據非跨月)
                     #沖暫估(apcf)
                     #---改為整張單沖的概念---(S)
                     #FOREACH gen_ap_1_c161 USING p_apcadocno,g_tmp.docseq INTO g_tmp.*
                     #   IF SQLCA.sqlcode THEN
                     #      INITIALIZE g_errparam TO NULL
                     #      LET g_errparam.code = SQLCA.sqlcode
                     #      LET g_errparam.extend = 'foreach gen_ap_1_c161'
                     #      LET g_errparam.popup = FALSE
                     #      CALL cl_err()
                     #      RETURN r_success
                     #   END IF
                     #   IF g_tmp.apcb022 = -1 THEN
                     #      LET g_tmp.sw = '2'
                     #      LET g_tmp.c = g_tmp.d
                     #      LET g_tmp.d = 0
                     #      LET g_tmp.glaq041 = g_tmp.glaq040
                     #      LET g_tmp.glaq040 = 0
                     #      LET g_tmp.glaq044 = g_tmp.glaq043
                     #      LET g_tmp.glaq043 = 0
                     #      
                     #      LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                     #   END IF
                     #   CALL s_aapp330_set_glaq002()
                     #   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                     #   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                     #   INSERT INTO s_voucher_tmp VALUES(g_tmp.*)      
                     #   IF SQLCA.sqlcode THEN
                     #      INITIALIZE g_errparam TO NULL
                     #      LET g_errparam.code = SQLCA.sqlcode
                     #      LET g_errparam.extend = 'insert s_voucher_tmp'
                     #      LET g_errparam.popup = FALSE
                     #      CALL cl_err()
                     #      RETURN r_success                   
                     #   END IF
                     #END FOREACH
                     #---改為整張單沖的概念---(E)
                     
                     #170821-00012#1 --s add
                     #如迴轉時參數是沖暫估時認列差異,如該筆單據有對應的沖暫估價差,則要將差異攤算到該筆存貨科目下,分錄才會正確
                     #DIFF 原幣價差金額/DIFF 本幣價差金額/DIFF 本幣匯差金額
                     #IF g_sfin2011 = 'Y' AND l_cross_mon = 'N' THEN #171011-00005#1 add #180226-00016#1 mark
                     IF g_sfin2011 = 'Y' AND g_sfin3034 = 'Y' THEN   #180226-00016#1 add
                        LET l_apch009 = 0 
                        LET l_apch010  = 0
                        LET l_apch011 = 0
                        EXECUTE get_apchp USING g_tmp.glaqcomp,g_tmp.docno,g_tmp.docseq,g_tmp.glaqld,g_tmp.docno,g_tmp.docseq 
                           INTO l_apch009,l_apch010,l_apch011                                
                        IF cl_null(l_apch009) THEN LET l_apch009 = 0 END IF
                        IF cl_null(l_apch010) THEN LET l_apch010 = 0 END IF
                        IF cl_null(l_apch011) THEN LET l_apch011 = 0 END IF        #171011-00005#1 add
                        #IF l_apch009 <> 0 AND l_apch010 <> 0 THEN                 #171011-00005#1 mark 
                        IF l_apch009 <> 0 OR l_apch010 <> 0 OR l_apch011 <> 0 THEN #171011-00005#1 add
                           LET g_tmp.d       = g_tmp.d - l_apch010 - l_apch011
                           #本位幣二差異金額/本位幣三差異金額
                           LET l_apch0102 = 0
                           LET l_apch0103 = 0
                           CALL s_afm_rate_money2(g_tmp.glaqld,g_tmp.glaq006,g_tmp.glaq039,g_tmp.glaq042,l_apch009,l_apch010)
                                 RETURNING l_nouse,l_apch0102,l_apch0103                                
                           IF cl_null(l_apch0102) THEN LET l_apch0102 = 0 END IF
                           IF cl_null(l_apch0103) THEN LET l_apch0103 = 0 END IF                              
                           LET g_tmp.glaq040 = g_tmp.glaq040 - l_apch0102
                           LET g_tmp.glaq043 = g_tmp.glaq043 - l_apch0103
                           LET g_tmp.glaq010 = g_tmp.glaq010 - l_apch009      
                           #171016-00014#1 mark(s)
                           #IF g_tmp.apcb022 = -1 THEN
                           #   LET g_tmp.sw = '2'
                           #   LET g_tmp.c = g_tmp.d
                           #   LET g_tmp.d = 0 
                           #   LET g_tmp.glaq041 = g_tmp.glaq040
                           #   LET g_tmp.glaq040 = 0
                           #   LET g_tmp.glaq044 = g_tmp.glaq043
                           #   LET g_tmp.glaq043 = 0
                           #END IF
                           #171016-00014#1 mark(e)                           
                        END IF   
                        #171016-00014#1 add(s)
                        IF g_tmp.apcb022 = -1 THEN
                           LET g_tmp.sw = '2'
                           LET g_tmp.c = g_tmp.d
                           LET g_tmp.d = 0 
                           LET g_tmp.glaq041 = g_tmp.glaq040
                           LET g_tmp.glaq040 = 0
                           LET g_tmp.glaq044 = g_tmp.glaq043
                           LET g_tmp.glaq043 = 0
#                           LET g_tmp.glaq008 = g_tmp.glaq008 * -1  #190711-00001#1---add  #190711-00019#1 mark
                        END IF
                        #171016-00014#1 add(e)
                        LET g_tmp.red = g_dfin1002
                        IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                        IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                        CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                               p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                               'glgb001')
                             RETURNING g_tmp.glaq001
                        CALL s_aapp330_set_glaq002()
                        #LET g_tmp.glaqseq = 1 #171225-00015#1 #180124-00020#1 mark
                        LET g_tmp.glaqseq = 10 #180124-00020#1 add
                        #180423-00029#1 add ------
                        IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                        IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                        #180423-00029#1 add end---
                        EXECUTE s_aapp330_ins_voucher_tmp_p USING
                               g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                               g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                               g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                               g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                               g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                               g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                               g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                               g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                               g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                               g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                               g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                               g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                               g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = SQLCA.sqlcode
                           LET g_errparam.extend = 'insert s_voucher_tmp'
                           LET g_errparam.popup = FALSE
                           CALL cl_err()
                           RETURN r_success
                        END IF
                     #180226-00016#1 --s add
                     ELSE
                        #不迴轉不認列時, 走一般存貨科目
                        IF g_sfin2011 = 'Y' AND g_sfin3034 = 'N' THEN
                           IF g_tmp.apcb022 = -1 THEN
                              LET g_tmp.sw = '2'
                              LET g_tmp.c = g_tmp.d
                              LET g_tmp.d = 0 
                              LET g_tmp.glaq041 = g_tmp.glaq040
                              LET g_tmp.glaq040 = 0
                              LET g_tmp.glaq044 = g_tmp.glaq043
                              LET g_tmp.glaq043 = 0
#                              LET g_tmp.glaq008 = g_tmp.glaq008 * -1  #190711-00001#1---add  #190711-00019#1 mark
                           END IF
                           LET g_tmp.red = g_dfin1002
                           IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                           IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                           CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                                  p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                                  'glgb001')
                                RETURNING g_tmp.glaq001
                           CALL s_aapp330_set_glaq002()
                           LET g_tmp.glaqseq = 10
                           #180423-00029#1 add ------
                           IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                           IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                           #180423-00029#1 add end---
                           EXECUTE s_aapp330_ins_voucher_tmp_p USING
                                  g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                                  g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                                  g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                                  g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                                  g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                                  g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                                  g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                                  g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                                  g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                                  g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                                  g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                                  g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                                  g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = 'insert s_voucher_tmp'
                              LET g_errparam.popup = FALSE
                              CALL cl_err()
                              RETURN r_success
                           END IF
                        END IF                      
                        #180226-00016#1 --e add                        
                        
                     END IF  #171011-00005#1 add
                     #170821-00012#1 --e add
                     
                  ELSE
                     #160107-00001#1--(S)
                     IF g_xcat005 = 'Y' AND (l_apcb001 = '11' OR l_apcb001 MATCHES '2[01]') THEN
                        LET g_tmp.d       = l_apcb116
                        LET g_tmp.glaq040 = l_apcb126
                        LET g_tmp.glaq043 = l_apcb136
                        LET g_tmp.glaq010 = l_apcb106
                     END IF
                     #160107-00001#1--(E)
                     #170509-00094#2---mark---start---
                     #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN
                     #   LET g_tmp.red = 'Y'
                     #ELSE
                     #170509-00094#2---mark---end---
                        IF g_tmp.apcb022 = -1 THEN
                           LET g_tmp.sw = '2'
                           LET g_tmp.c = g_tmp.d
                           LET g_tmp.d = 0 
                           LET g_tmp.glaq041 = g_tmp.glaq040
                           LET g_tmp.glaq040 = 0
                           LET g_tmp.glaq044 = g_tmp.glaq043
                           LET g_tmp.glaq043 = 0
                          #LET g_tmp.glaq010 = g_tmp.glaq010 * -1         #150909
#                          LET g_tmp.glaq008 = g_tmp.glaq008 * -1  #190711-00001#1---add   #190711-00019#1 mark
                        END IF
                    #END IF          #170509-00094#2 mark
                     LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                     IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                     IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                     CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                            p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                            'glgb001')          #170724-00032#1 change apcb047 to glgb001 lujh
                          RETURNING g_tmp.glaq001
                     CALL s_aapp330_set_glaq002()
                    #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                     #161111-00048#2 --s add
                    #170430-00006#2---mark---start---
                    #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                    #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                    #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                    #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                    #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                    #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                    #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                    #                          glaq030,glaq031,glaq032,glaq033,glaq034,
                    #                          glaq035,glaq036,glaq037,glaq038,d,
                    #                          c,sum,glaq039,glaq040,glaq041,
                    #                          glaq042,glaq043,glaq044,docseq,source,
                    #                          glaqseq,xrca039,apcb022,key1,key2,
                    #                          type,glaq010,apcb023,glgb055,red)
                    #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                    #g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                    #        g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                    #        g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                    #        g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                    #        g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                    #        g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                    #        g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                    #        g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                    #        g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                    #        g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                    #        g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                    #        g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                    #170430-00006#2---mark---end---
                    #LET g_tmp.glaqseq = 1 #171225-00015#1  #180124-00020#1 mark
                    LET g_tmp.glaqseq = 10 #180124-00020#1 add
                    #180423-00029#1 add ------
                    IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                    IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                    #180423-00029#1 add end---
                    #170430-00006#2---add---start---
                    EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                    #170430-00006#2---add---end---
                    #161111-00048#2 --e add
                    IF SQLCA.sqlcode THEN
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = SQLCA.sqlcode
                       LET g_errparam.extend = 'insert s_voucher_tmp'
                       LET g_errparam.popup = FALSE
                       CALL cl_err()
                       RETURN r_success
                    END IF
                 END IF
              END FOREACH
              
        WHEN '12'   #贷 應付科目(處理直接沖帳)
               LET l_apca116      = 0
               LET l_apca126      = 0
               LET l_apca136      = 0
               LET l_apca106_clac = 0
               LET l_apca116_clac = 0
               LET l_apca126_clac = 0
               LET l_apca136_clac = 0
               LET l_flag = 'N'
               FOREACH gen_ap_1_c12 USING p_apcadocno INTO g_tmp.*,l_apca106,l_apca116,l_apca126,l_apca136
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c12'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
                  
                  #201204-00019#1---add---str
                  #判断一下单号是不是aapt330.要是aapt330单据，原币需要是本币得值
                
                  CALL s_aooi200_fin_get_slip(p_apcadocno) RETURNING g_sub_success,l_ap_slip
                  SELECT oobx004 INTO l_oobx004
                    FROM oobx_t
                   WHERE oobxent = g_enterprise
                    AND oobx001 = l_ap_slip
                  IF l_oobx004 MATCHES 'MULTI' THEN
                     SELECT oobl002 INTO l_oobx004
                       FROM oobl_t
                      WHERE ooblent = g_enterprise
                       AND oobl001 = l_ap_slip
                       AND oobl002 = 'aapt330'
                    
                  END IF
                  IF l_oobx004 MATCHES 'aapt330*' THEN   
                     SELECT apcb115 INTO l_apcb115
                     FROM apcb_t
                     WHERE apcbent = g_enterprise
                     AND apcbdocno = p_apcadocno
                     AND apcbld = p_apcald
                     AND apcbseq = g_tmp.docseq   
                     IF cl_null(l_apcb115) THEN
                        LET l_apcb115 = 0
                     END IF 
                     LET g_tmp.sum = l_apcb115
                     LET g_tmp.glaq010 = l_apcb115               
                    
                  END IF
                  
                  #201204-00019#1---add---str
                  
#                  #200408-00070#1---mark---str 
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                   
                  #170509-00094#2---mark---start---
                  #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN
                  #   LET g_tmp.red = 'Y' 
                  #ELSE
                  #170509-00094#2---mark---end---
                     IF g_tmp.apcb022 = -1 THEN
                        LET g_tmp.sw = '1'
                        LET g_tmp.d = g_tmp.c
                        LET g_tmp.c = 0
                        LET g_tmp.glaq040 = g_tmp.glaq041
                        LET g_tmp.glaq041 = 0
                        LET g_tmp.glaq043 = g_tmp.glaq044
                        LET g_tmp.glaq044 = 0
                       #LET g_tmp.glaq010 = g_tmp.glaq010 * -1      #150909
#                        LET g_tmp.glaq008 = g_tmp.glaq008 * -1  #190711-00001#1---add  #190711-00019#1 mark
                     END IF
                  #END IF      #170509-00094#2 mark
                  LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                  IF cl_null(g_tmp.glaq001) THEN  #190909-00032#1 add
                     CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                            p_apcadocno,g_tmp.docseq,'AP','3',g_tmp.glaq002,         #150807-00010#2--p_chr由1修改為3
                                            'glgb001')     #170724-00032#1 change apcb047 to glgb001 lujh 
                          RETURNING g_tmp.glaq001
                  END IF                          #190909-00032#1 add 
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*)  #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 5 #171225-00015#1  #180124-00020#1 mark
                  LET g_tmp.glaqseq = 100 #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add                   
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success                   
                  END IF
                  #處理直接沖帳
                  IF l_apca106_clac = 0 THEN 
                     LET l_apca106_clac = l_apca106
                  END IF
                  IF l_apca116_clac = 0 THEN 
                     LET l_apca116_clac = l_apca116
                  END IF
                  IF l_apca126_clac = 0 THEN 
                     LET l_apca126_clac = l_apca126
                  END IF
                  IF l_apca136_clac = 0 THEN 
                     LET l_apca136_clac = l_apca136
                  END IF
                  
                  IF l_apca116_clac <> 0 AND l_flag = 'N' THEN   #有直接冲账金额或直接冲账金额没有分摊完
                     IF g_tmp.d > 0 THEN 
                       #IF l_apca116_clac >= g_tmp.c THEN   #直接冲账净额小于等于应收金额,直接分摊到金额最大的应收金额
                        IF l_apca116_clac <= g_tmp.d THEN   #直接冲账净额小于等于应收金额,直接分摊到金额最大的应收金额  151027(寫到對向之後NET掉)
                           LET g_tmp.sw = '1'
                           LET g_tmp.d       = 0
                           LET g_tmp.c       = l_apca116_clac
                           LET g_tmp.glaq040 = 0
                           LET g_tmp.glaq041 = l_apca126_clac
                           LET g_tmp.glaq043 = 0
                           LET g_tmp.glaq044 = l_apca136_clac
                           ##160707-00030#1 160707 albireo modify-----s
                           #LET g_tmp.sum     = l_apca106
                           #LET g_tmp.glaq010 = l_apca106
                           LET g_tmp.sum=l_apca116_clac/g_tmp.glaq006
                           LET g_tmp.glaq010=l_apca116_clac/g_tmp.glaq006
                           CALL s_curr_round_ld('1',g_tmp.glaqld,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                           CALL s_curr_round_ld('1',g_tmp.glaqld,g_tmp.glaq005,g_tmp.glaq010,2) RETURNING g_sub_success,g_errno,g_tmp.glaq010
                           ##160707-00030#1 160707 albireo modify-----e
                           LET l_flag = 'Y'    #直接冲账金额分摊完
                        ELSE                   #直接冲账净额大于应收金额,从最大金额开始依次拆分
                           LET g_tmp.sw      = '1'
                           LET g_tmp.d       = 0
                          #LET g_tmp.c       = g_tmp.c     #151027
                           LET g_tmp.c       = g_tmp.d     #151027 modify
                           LET g_tmp.glaq040 = 0
                           LET g_tmp.glaq041 = g_tmp.glaq041
                           LET g_tmp.glaq043 = 0
                           LET g_tmp.glaq044 = g_tmp.glaq044
                          #LET g_tmp.sum     = g_tmp.c     #151027
                           LET g_tmp.sum     = g_tmp.d     #151027 modify
                           LET l_apca116_clac= l_apca116_clac - g_tmp.d
                           LET l_apca126_clac= l_apca126_clac - g_tmp.glaq040
                           LET l_apca136_clac= l_apca136_clac - g_tmp.glaq043
                        END IF
                     ELSE
                       #IF l_apca116_clac >= g_tmp.d THEN   #直接冲账净额小于等于应收金额,直接分摊到金额最大的应收金额 #151027
                        IF l_apca116_clac <= g_tmp.c THEN   #直接冲账净额小于等于应收金额,直接分摊到金额最大的应收金额 #151027 mark(寫到對向之後NET掉)
                           LET g_tmp.sw      = '2'
                           LET g_tmp.d       = l_apca116_clac
                           LET g_tmp.c       = 0
                           LET g_tmp.glaq040 = l_apca126_clac
                           LET g_tmp.glaq041 = 0
                           LET g_tmp.glaq043 = l_apca136_clac
                           LET g_tmp.glaq044 = 0
                           ##160707-00030#1 albireo 160707-----s
                           #LET g_tmp.sum     = l_apca106
                           #LET g_tmp.glaq010 = l_apca106
                           LET g_tmp.sum=l_apca116_clac/g_tmp.glaq006
                           LET g_tmp.glaq010=l_apca116_clac/g_tmp.glaq006
                           CALL s_curr_round_ld('1',g_tmp.glaqld,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                           CALL s_curr_round_ld('1',g_tmp.glaqld,g_tmp.glaq005,g_tmp.glaq010,2) RETURNING g_sub_success,g_errno,g_tmp.glaq010
                           ##160707-00030#1 albireo 160707-----e
                           LET l_flag = 'Y'    #直接冲账金额分摊完
                        ELSE                   #直接冲账净额大于应收金额,从最大金额开始依次拆分
                           LET g_tmp.sw      = '2'
                           LET g_tmp.d       = g_tmp.c
                           LET g_tmp.c       = 0
                           LET g_tmp.glaq040 = g_tmp.glaq041
                           LET g_tmp.glaq041 = 0
                           LET g_tmp.glaq043 = g_tmp.glaq044
                           LET g_tmp.glaq044 = 0
                           LET g_tmp.sum     = g_tmp.c
                           
                          #LET l_apca116_clac = l_apca116 - g_tmp.d    #151027
                           LET l_apca116_clac = l_apca116_clac - g_tmp.d    #151027 modify
                           LET l_apca126_clac = l_apca126_clac - g_tmp.glaq040
                           LET l_apca136_clac = l_apca136_clac - g_tmp.glaq043
                        END IF
                     END IF
                     #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                     #161111-00048#2 --s add
                     #170430-00006#2---mark---start---
                     #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                     #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                     #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                     #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                     #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                     #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                     #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                     #                          glaq030,glaq031,glaq032,glaq033,glaq034,
                     #                          glaq035,glaq036,glaq037,glaq038,d,
                     #                          c,sum,glaq039,glaq040,glaq041,
                     #                          glaq042,glaq043,glaq044,docseq,source,
                     #                          glaqseq,xrca039,apcb022,key1,key2,
                     #                          type,glaq010,apcb023,glgb055,red)
                     #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                     #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                     #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                     #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                     #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                     #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                     #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                     #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                     #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                     #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                     #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                     #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                     #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                     #170430-00006#2---mark---end---
                     #LET g_tmp.glaqseq = 5 #171225-00015#1     #180124-00020#1 mark
                     LET g_tmp.glaqseq = 100 #180124-00020#1 add
                     #180423-00029#1 add ------
                     IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                     IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                     #180423-00029#1 add end---
                     #170430-00006#2---add--start---
                     EXECUTE s_aapp330_ins_voucher_tmp_p USING
                             g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                             g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                             g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                             g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                             g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                             g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                             g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                             g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                             g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                             g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                             g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                             g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                             g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                     #170430-00006#2---add---end---
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = 'insert s_voucher_tmp'
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        RETURN r_success
                     END IF
                  END IF
               END FOREACH
        
        WHEN '13'    #進項稅額
               FOREACH gen_ap_1_c13 USING p_apcadocno INTO g_tmp.*,l_flag   #180410-00038#1 add(l_flag)
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c13'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end 
                  #若借貸都是0，不需要在凭证预览中显示，也不需要产生到总账凭证中，只要科目的金额是0就不需要有
                  IF g_tmp.d = 0 AND g_tmp.c = 0 THEN
                     CONTINUE FOREACH
                  END IF
                  #170509-00094#2---mark---start---
                  #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN #151211:單據類行為負向者處理紅沖
                  #   LET g_tmp.red = 'Y' 
                  #ELSE
                  #170509-00094#2---mark---end---
                  IF g_tmp.apcb022 = -1 THEN
                     LET g_tmp.sw = '1'
                     LET g_tmp.c = g_tmp.d
                     LET g_tmp.d = 0
                     LET g_tmp.glaq041 = g_tmp.glaq040
                     LET g_tmp.glaq040 = 0
                     LET g_tmp.glaq044 = g_tmp.glaq043
                     LET g_tmp.glaq043 = 0
                    #LET g_tmp.glaq010 = g_tmp.glaq010 * -1      #150909
                    LET g_tmp.glaq008 = g_tmp.glaq008 * -1  #190711-00001#1---add
                  END IF
                  #END IF   #170509-00094#2 mark
                  LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #151013-00019#2 add ------
                  #傳票摘要彈性預設檔(agli050)
                  #类型/账套/科目编号/程序编号/目的字段/单据号/项次1/项次2
                  IF NOT cl_null(g_tmp.glaq002) THEN                                  #170829-00014#1 mark #180409-00059#1 cancel mark
                  #IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN       #170829-00014#1 add    #180409-00059#1 mark
                     CALL s_fin_get_scc_value('8502',p_apca001,'3')RETURNING l_prog   #170328-00075#1 add
                    #CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,g_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')   #170328-00075#1 mark
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')   #170328-00075#1 add
                          RETURNING g_tmp.glaq001
                  END IF  
                  #151013-00019#2 add end---
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,
                  #                          glaq035,glaq036,glaq037,glaq038,d,
                  #                          c,sum,glaq039,glaq040,glaq041,
                  #                          glaq042,glaq043,glaq044,docseq,source,
                  #                          glaqseq,xrca039,apcb022,key1,key2,
                  #                          type,glaq010,apcb023,glgb055,red)
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 2 #171225-00015#1 #180124-00020#1 mark
                  LET g_tmp.glaqseq = 20 #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,l_flag   #180410-00038#1 add(l_flag)
                  #170430-00006#2---add---end---
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
        
        WHEN '14'   #直接沖賬
#              FOREACH gen_ap_1_c14 USING p_apcadocno INTO g_tmp.* #160628-00002#2 mark
               FOREACH gen_ap_1_c14 USING p_apcadocno,p_apcadocno INTO g_tmp.*,l_apce003,l_flag #160628-00002#2 add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c14'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  #200213-00035#1--add--(S)
                  LET l_apca007 = ''
                  LET l_apca011 = ''
                  LET l_apca001 = ''
                  SELECT apca001 INTO l_apca001 FROM apca_t
                   WHERE apcaent=g_enterprise AND apcald=p_apcald
                     AND apcadocno=l_apce003 
                  IF l_apca001 = '26' THEN
                     SELECT apce038,apce038 INTO g_tmp.glaq021,g_tmp.glaq022
                       FROM apce_t
                      WHERE apceent=g_enterprise AND apceld=p_apcald 
                        AND apcedocno=p_apcadocno
                  END IF
                  #200213-00035#1--add--(E)
                  
                  LET g_tmp.glaqseq = 65 #180124-00020#1 add
                  #180409-00059#1---add---(S) 
                  CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                           p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                           'glgb001')
                         RETURNING g_tmp.glaq001
                  #180409-00059#1---add---(E)
                  #IF cl_null(g_tmp.glaq002) THEN #180129-00031#1 add #180327-00063#1 mark
                     #沒有維護再抓
                     #160628-00002#2--add--str--
                     #当税额分录时，按照以下顺序抓取科目
                     #先抓取税别对应科目aisi070，当没有抓到科目时，在通过账款类别抓取科目axri011
                     IF l_flag = '2' THEN
                        #200205-00019#1 add(s)
                        LET l_apca007 = ''
                        LET l_apca011 = ''
                        LET l_apca001 = ''
                        SELECT apca007,apca011,apca001 INTO l_apca007,l_apca011,l_apca001 FROM apca_t
                         WHERE apcaent=g_enterprise AND apcald=p_apcald
                           AND apcadocno=l_apce003 
                        
                        IF l_apca001 NOT MATCHES '2[29]' THEN #只有在直接沖帳裡沖預付待抵單時，才要取預付單的稅別跟帳款類別
                        #200205-00019#1 add(e)
                           SELECT apca007,apca011 INTO l_apca007,l_apca011 FROM apca_t
                            WHERE apcaent=g_enterprise AND apcald=p_apcald
                              #AND apcadocno=l_apce003 #180327-00063#1 mark
                              #180327-00063#1 add(s)
                              AND apcadocno IN(SELECT apca018 FROM apca_t WHERE apcaent=g_enterprise 
                                                  AND apcald=p_apcald AND apcadocno=l_apce003)
                              #180327-00063#1 add(e)
                        END IF #200205-00019#1 add      
                        LET g_tmp.glaq002 = ''   #160912-00002#1 Add
                        SELECT glab005 INTO g_tmp.glaq002 FROM glab_t
                         WHERE glabent=g_enterprise AND glabld=p_apcald
                           AND glab001='14' AND glab002='1'
                           AND glab003=l_apca011
                        IF cl_null(g_tmp.glaq002) THEN
                           SELECT glab005 INTO g_tmp.glaq002 FROM glab_t 
                            WHERE glabent=g_enterprise AND  glabld=p_apcald
                              AND glab001='13' AND glab003='8504_04'
                              AND glab002=l_apca007
                        END IF
                        LET g_tmp.glaqseq = 90 #180124-00020#1 add
                        #180409-00059#1---add---(S) 
                        IF NOT cl_null(g_tmp.glaq002) THEN
                           CALL s_fin_get_scc_value('8502',p_apca001,'3')RETURNING l_prog 
                           LET g_tmp.glaq001 = NULL
                           CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')   
                             RETURNING g_tmp.glaq001
                        END IF
                        #180409-00059#1---add---(E)
                     END IF
                     #160628-00002#2--add--end
                  #END IF #180129-00031#1 add #180327-00063#1 mark
                  #180129-00031#1 add(s)  #180409-00059#1---mark---(S) 改放到前面
                  #CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                  #                         p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                  #                         'glgb001')
                  #       RETURNING g_tmp.glaq001
                  #180129-00031#1 add(e)  #180409-00059#1---mark---(E)
                  #170509-00094#2---mark---start---
                  #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN #151211:單據類行為負向者處理紅沖
                  #   LET g_tmp.red = 'Y' 
                  #ELSE
                  #170509-00094#2---mark---end---
                  IF g_tmp.apcb022 = '-1' THEN
                     LET g_tmp.sw = '1'
                     LET g_tmp.c = g_tmp.d
                     LET g_tmp.d = 0
                     LET g_tmp.glaq041 = g_tmp.glaq040
                     LET g_tmp.glaq040 = 0
                     LET g_tmp.glaq044 = g_tmp.glaq043
                     LET g_tmp.glaq043 = 0
                    #LET g_tmp.glaq010 = g_tmp.glaq010 * -1   #150909
                  END IF
                  #END IF   #170509-00094#2 mark
                  LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 6 #171225-00015#1 #180124-00020#1 mark
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,l_flag   #180410-00038#1 add(l_flag)
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add 
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
        
        WHEN '15'    #直接付款
               FOREACH gen_ap_1_c15 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c15'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end 
                  #170509-00094#2---mark---start---
                  #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN #151211:單據類行為負向者處理紅沖
                  #   LET g_tmp.red = 'Y' 
                  #ELSE
                  #170509-00094#2---mark---end---
                  IF g_tmp.apcb022 = '-1' THEN
                     LET g_tmp.sw = '1'
                     LET g_tmp.c = g_tmp.d
                     LET g_tmp.d = 0
                     LET g_tmp.glaq041 = g_tmp.glaq040
                     LET g_tmp.glaq040 = 0
                     LET g_tmp.glaq044 = g_tmp.glaq043
                     LET g_tmp.glaq043 = 0
                    #LET g_tmp.glaq010 = g_tmp.glaq010 * -1      #150909
                  END IF
                  #END IF         #170509-00094#2 mark
                  LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                  CALL s_aapp330_set_glaq002()
                  #180129-00031#1 add(s)
                  CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                           p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                           'glgb001')
                         RETURNING g_tmp.glaq001
                  #180129-00031#1 add(e)
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 7 #171225-00015#1 #180124-00020#1 mark
                  LET g_tmp.glaqseq = 70 #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
        
        WHEN '16'    #沖暫估DIFF
               FOREACH gen_ap_1_c162 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c162'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  #170314-00066#1---mark---str--
                  #IF p_apca001 = '22' OR p_apca001 = '29' THEN  #aapt340时
                  #   LET l_n = 0 
                  #   SELECT COUNT(*) INTO l_n
                  #     FROM apcb_t
                  #    WHERE apcbent = g_enterprise
                  #      AND apcbld  = p_apcald AND xrcbdocno = p_apcadocno
                  #      AND (apcb001 = '11' OR apcb001 = '19')
                  #
                  #   IF l_n = 0 THEN  #如果单身只有销退/或其他减项,则借贷相反
                  #      LET g_tmp.sw = '1'
                  #      LET g_tmp.d = g_tmp.c
                  #      LET g_tmp.c = 0
                  #      LET g_tmp.glaq040 = g_tmp.glaq041
                  #      LET g_tmp.glaq041 = 0
                  #      LET g_tmp.glaq043 = g_tmp.glaq044
                  #      LET g_tmp.glaq044 = 0 
                  #   END IF
                  #END IF
                  #170314-00066#1---mark---end--
                  LET g_tmp.red = g_dfin1002   #180623-00004#1
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #170428-00026#1---add---str--
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8502',p_apca001,'3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #170428-00026#1---add---end--
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 13 #171225-00015#1 #180124-00020#1 mark
                  LET g_tmp.glaqseq = 60  #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH

        WHEN '17'    
               #沖暫估
               FOREACH gen_ap_1_c163 USING p_apcadocno INTO g_tmp.*,l_apcf008
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c163'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  SELECT apca001 INTO l_apca001
                    FROM apca_t
                   WHERE apcaent = g_enterprise
                     AND apcald  = p_apcald AND apcadocno = l_apcf008
                  IF l_apca001 MATCHES '0[24]' THEN
                     IF g_tmp.d > 0 THEN #200228-00020#1 add  
                        #LET g_tmp.sw = '1' #200228-00020#1 mark
                        LET g_tmp.sw = '2'  #200228-00020#1 add 
                        LET g_tmp.c = g_tmp.d
                        LET g_tmp.d = 0
                        LET g_tmp.glaq041 = g_tmp.glaq040
                        LET g_tmp.glaq040 = 0
                        LET g_tmp.glaq044 = g_tmp.glaq043
                        LET g_tmp.glaq043 = 0
                     END IF #200228-00020#1 add      
                  END IF
                  LET g_tmp.red = g_dfin1002   #180623-00004#1
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #170428-00026#1---add---str--
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8502',p_apca001,'3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #170428-00026#1---add---end--
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 11 #171225-00015#1 #180124-00020#1 mark
                  LET g_tmp.glaqseq = 50  #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF    
               END FOREACH         
        #160621-00026#1--S
        WHEN '171'    
               #沖暫估稅額
               FOREACH gen_ap_1_c164 USING p_apcadocno INTO g_tmp.*,l_apcf008
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c164'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  SELECT apca001 INTO l_apca001
                    FROM apca_t
                   WHERE apcaent = g_enterprise
                     AND apcald  = p_apcald AND apcadocno = l_apcf008
                  IF l_apca001 MATCHES '0[24]' THEN
                     LET g_tmp.sw = '1'
                     LET g_tmp.d = g_tmp.c
                     LET g_tmp.c = 0
                     LET g_tmp.glaq040 = g_tmp.glaq041
                     LET g_tmp.glaq041 = 0
                     LET g_tmp.glaq043 = g_tmp.glaq044
                     LET g_tmp.glaq044 = 0
                  END IF                     
                  
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #181127-00053#1---add---str--
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8502',p_apca001,'3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #181127-00053#1---add---end--
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #LET g_tmp.glaqseq = 12 #171225-00015#1 #180124-00020#1 mark
                  LET g_tmp.glaqseq = 80  #180124-00020#1 add
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     RETURN r_success
                  END IF    
               END FOREACH           
        #160621-00026#1--E               
        #160107-00001#1--(S)  标准成本
        WHEN '18'
            FOREACH gen_ap_1_c18 USING p_apcadocno INTO g_tmp.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'foreach gen_ap_1_c18'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  RETURN r_success
               END IF
#               #200408-00070#1---mark---str
#               #171221-00005#1---add---str
#               CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#               #科目未啟用多幣別管理
#               IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                  CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                  LET g_tmp.glaq006 = 1
#                  IF g_tmp.d <> 0 THEN
#                     LET g_tmp.sum = g_tmp.d
#                  END IF
#                  IF g_tmp.c <> 0 THEN
#                     LET g_tmp.sum = g_tmp.c
#                  END IF 
#                  LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#               END IF
#               #171221-00005#1---add---end
#              #200408-00070#1---mark---end
               IF NOT (l_apcb001 = '11' OR l_apcb001 MATCHES '2[01]') THEN
                  CONTINUE FOREACH
               END IF
               #170509-00094#2---mark---start---
               #IF g_dfin1002 = 'Y' AND (p_apca001 MATCHES '2[29]' OR p_apca001 MATCHES '0[24]') THEN
               #   LET g_tmp.red = 'Y'
               #ELSE
               #170509-00094#2---mark---end---
               IF g_tmp.d < 0 THEN
                  LET g_tmp.sw = '2'
                  LET g_tmp.c = s_math_abs(g_tmp.d)
                  LET g_tmp.d = 0 
                  IF cl_null(g_tmp.glaq040) THEN LET g_tmp.glaq040 = 0 END IF
                  LET g_tmp.glaq041 = s_math_abs(g_tmp.glaq040)
                  LET g_tmp.glaq040 = 0
                  IF cl_null(g_tmp.glaq043) THEN LET g_tmp.glaq043 = 0 END IF
                  LET g_tmp.glaq044 = s_math_abs(g_tmp.glaq043)
                  LET g_tmp.glaq043 = 0
               END IF
               #END IF         #170509-00094#2 mark
               #190711-00001#1---add----str---如果负向没有相反，会导致凭证借贷不平
               IF g_tmp.apcb022 = -1 THEN
                     LET g_tmp.c = g_tmp.d
                     LET g_tmp.d = 0
                     LET g_tmp.glaq041 = g_tmp.glaq040
                     LET g_tmp.glaq040 = 0
                     LET g_tmp.glaq044 = g_tmp.glaq043
                     LET g_tmp.glaq043 = 0
                     LET g_tmp.glaq008 = g_tmp.glaq008 * -1
               END IF
               #190711-00001#1---add----end
               LET g_tmp.red = g_dfin1002    #170509-00094#2 add
               
               SELECT apca058,
                      apcb001,apcb002,apcb003,apcb004,apcb034
                 INTO l_apca058,
                      l_apcb001,l_apcb002,l_apcb003,l_apcb004,l_apcb034
                 FROM apca_t,apcb_t
                WHERE apcaent = apcbent 
                  AND apcald  = apcbld AND apcadocno = apcbdocno
                  AND apcaent = g_enterprise  AND apcald  = p_apcald
                  AND apcadocno = g_tmp.docno AND apcbseq = g_tmp.docseq
               LET l_pmdt016 = ''
               EXECUTE pmdt016_pre USING l_apcb002,l_apcb003 INTO l_pmdt016
               CALL s_get_item_acc(p_apcald,'23',l_apcb004,l_apca058,l_apcb034,g_tmp.glaqcomp,l_pmdt016)
                    RETURNING g_sub_success,g_tmp.glaq002
               
               #200907-00035#1 add(s)
               #当是委外且为标准成本时,科目抓axci201中的委外标准成本差异科目
               LET l_pmds011 = ''
               SELECT pmds011 INTO l_pmds011 FROM pmds_t
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno = l_apcb002
               IF l_pmds011 = '2' AND g_xcat005 = 'Y' THEN
                  SELECT glab005 INTO g_tmp.glaq002
                    FROM glab_t 
                   WHERE glabent = g_enterprise
                     AND glab001 = '60' 
                     AND glab003 = '28' 
               END IF
               #200907-00035#1 add(e)
               
               IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF                  
               IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
               CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                      p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,
                                      'glgb001')       #170724-00032#1 change apcb047 to glgb001 lujh                  
                    RETURNING g_tmp.glaq001
               CALL s_aapp330_set_glaq002()
              #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
               #161111-00048#2 --s add
               #170430-00006#2---mark---start---
               #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
               #                          glaqld,glaq001,glaq002,glaq005,glaq006,
               #                          glaq007,glaq008,glaq009,glaq011,glaq012,
               #                          glaq013,glaq014,glaq015,glaq016,glaq017,
               #                          glaq018,glaq019,glaq020,glaq021,glaq022,
               #                          glaq023,glaq024,glaq025,glaq026,glaq027,
               #                          glaq028,glaq051,glaq052,glaq053,glaq029,
               #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
               #                          glaq035,glaq036,glaq037,glaq038,d,        
               #                          c,sum,glaq039,glaq040,glaq041,  
               #                          glaq042,glaq043,glaq044,docseq,source,   
               #                          glaqseq,xrca039,apcb022,key1,key2,     
               #                          type,glaq010,apcb023,glgb055,red)      
               #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
               #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
               #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
               #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
               #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
               #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
               #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
               #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
               #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
               #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
               #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
               #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
               #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
               #170430-00006#2---mark---end---
               #LET g_tmp.glaqseq = 20 #171225-00015#1 #180124-00020#1 mark
               LET g_tmp.glaqseq = 40  #180124-00020#1 add
               #180423-00029#1 add ------
               IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
               IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
               #180423-00029#1 add end---
               #170430-00006#2---add--start---
               EXECUTE s_aapp330_ins_voucher_tmp_p USING
                       g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''   #180410-00038#1 add('')
               #170430-00006#2---add---end---
               #161111-00048#2 --e add
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert s_voucher_tmp'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  RETURN r_success
               END IF
            END FOREACH       
        #160107-00001#1--(E)
        
        WHEN '41'
               FOREACH gen_ap_1_c41 USING p_apcadocno INTO g_tmp.*
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c41'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                  #200408-00070#1---mark---str 
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                   CALL s_aapp330_set_glaq002() 
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF                   
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                   CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                         #p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002, #150914 mark 
                                          p_apcadocno,g_tmp.docseq,'AP','2',g_tmp.glaq002, #150914 
                                         'glgb001')      #170724-00032#1 change apce010 to glgb001 lujh 
                        RETURNING g_tmp.glaq001
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #                          c,sum,glaq039,glaq040,glaq041,  
                   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #                          type,glaq010,apcb023,glgb055,red)      
                   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #170430-00006#2---mark---end---
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   LET g_tmp.red = g_dfin1002 #190507-00025#3 add
                   #170430-00006#2---add--start---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                          ,''                                                                   #180608-00039#1 add
                   #170430-00006#2---add---end---
                   #161111-00048#2 --e add
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
               END FOREACH
               FOREACH gen_ap_1_c43 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c43'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  #180129-00027#1--add--s--xul
#180712-00002#1 --begin
#获取单别
                  LET l_slip = ''
                  LET l_ooac004 = ''
                  CALL s_aooi200_fin_get_slip(p_apcadocno) RETURNING l_success,l_slip
#红冲否
                  CALL s_fin_get_doc_para(p_apcald,'',l_slip,'D-FIN-1002') RETURNING l_ooac004
                  IF l_ooac004='Y'  THEN
#180712-00002#1 --end
                     LET l_apde002 = ''
                     SELECT DISTINCT apde002 INTO l_apde002 
                       FROM apde_t
                      WHERE apdeent = g_enterprise
                        AND apdeld  = g_tmp.glaqld
                        AND apdeseq = g_tmp.docseq
                        AND apdedocno = g_tmp.docno
#                     IF l_apde002 MATCHES '1[1234]' THEN  #11.匯兌損失 12.匯兌收益 13.帳務處理 14.手續費            #191016-00040#1 mark
                     IF l_apde002 MATCHES '1[12345]' THEN  #11.匯兌損失 12.匯兌收益 13.帳務處理 14.手續費 15.现金折扣 #191016-00040#1 add
                        LET g_tmp.red = 'Y' 
                     END IF 
                     #181025-00068#1----add----str
                     #91.其他借项，92.其他贷项 也需要判斷紅字傳票原則
                     IF l_apde002 = '91' OR l_apde002 = '92' THEN  
                        LET g_tmp.red = 'Y' 
                     END IF
                     #181025-00068#1----add----end
                  END IF     #180712-00002#1
                  #180129-00027#1--add--e--xul
                  IF cl_null(g_tmp.glaq021) THEN
                     SELECT apda005 INTO g_tmp.glaq021
                       FROM apda_t
                      WHERE apdaent = g_enterprise
                        AND apdald = g_tmp.glaqld
                        AND apdadocno = g_tmp.docno
                     LET g_tmp.glaq022 = g_tmp.glaq021
                  END IF
                  #201014-00031#1 add(s)
                  IF g_prog = 'aapt420' THEN
                     SELECT apda005 INTO g_tmp.glaq021
                       FROM apda_t
                      WHERE apdaent = g_enterprise
                        AND apdald = g_tmp.glaqld
                        AND apdadocno = g_tmp.docno
                  END IF
                  #201014-00031#1 add(e)
                  CALL s_aapp330_set_glaq002()     
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF                  
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                        #p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002,  #150914 mark
                                         p_apcadocno,g_tmp.docseq,'AP','2',g_tmp.glaq002,  #150914 
                                        'glgb001')      #170724-00032#1 change apde010 to glgb001 lujh 
                       RETURNING g_tmp.glaq001
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---                        
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                         ,''                                                                   #180608-00039#1 add
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
               
        WHEN '42'
               FOREACH gen_ap_1_c42 USING p_apcadocno INTO g_tmp.*
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c42'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                  #200408-00070#1---mark---str 
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                   
                   CALL s_aapp330_set_glaq002()
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                   CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                         #p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002, #150914 mark                                
                                          p_apcadocno,g_tmp.docseq,'AP','2',g_tmp.glaq002, #150914  
                                         'glgb001')       #170724-00032#1 change apce010 to glgb001 lujh                                     
                        RETURNING g_tmp.glaq001
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #                          c,sum,glaq039,glaq040,glaq041,  
                   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #                          type,glaq010,apcb023,glgb055,red)      
                   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #170430-00006#2---mark---end---
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   
                   LET g_tmp.red = g_dfin1002 #190507-00025#3 add
                   #170430-00006#2---add--start---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                          ,''                                                                   #180608-00039#1 add
                   #170430-00006#2---add---end---
                   #161111-00048#2 --e add
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
               END FOREACH
               FOREACH gen_ap_1_c44 USING p_apcadocno INTO g_tmp.*
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c44'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                  #200408-00070#1---mark---str 
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
#180712-00002#1 --begin
#获取单别
                  LET l_slip = ''
                  LET l_ooac004 = ''
                  CALL s_aooi200_fin_get_slip(p_apcadocno) RETURNING l_success,l_slip
#红冲否
                  CALL s_fin_get_doc_para(p_apcald,'',l_slip,'D-FIN-1002') RETURNING l_ooac004
                  IF l_ooac004='Y'  THEN
#180712-00002#1 --end
                  #180129-00027#1--add--s--xul
                     LET l_apde002 = ''
                     SELECT DISTINCT apde002 INTO l_apde002 
                       FROM apde_t
                      WHERE apdeent = g_enterprise
                        AND apdeld  = g_tmp.glaqld
                        AND apdeseq = g_tmp.docseq
                        AND apdedocno = g_tmp.docno
#                     IF l_apde002 MATCHES '1[1234]' THEN  #11.匯兌損失 12.匯兌收益 13.帳務處理 14.手續費            #191016-00040#1 mark
                     IF l_apde002 MATCHES '1[12345]' THEN  #11.匯兌損失 12.匯兌收益 13.帳務處理 14.手續費 15.现金折扣 #191016-00040#1 add
                        LET g_tmp.red = 'Y' 
                     END IF
                     #181025-00068#1----add----str
                     #91.其他借项，92.其他贷项 也需要判斷紅字傳票原則
                     IF l_apde002 = '91' OR l_apde002 = '92' THEN  
                        LET g_tmp.red = 'Y' 
                     END IF
                     #181025-00068#1----add----end                     
                  END IF   #180712-00002#1 add
                  #180129-00027#1--add--e--xul 
                   IF cl_null(g_tmp.glaq021) THEN
                      SELECT apda005 INTO g_tmp.glaq021
                        FROM apda_t
                       WHERE apdaent = g_enterprise
                         AND apdald = g_tmp.glaqld
                         AND apdadocno = g_tmp.docno
                      LET g_tmp.glaq022 = g_tmp.glaq021
                   END IF                   
                   CALL s_aapp330_set_glaq002()
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                   CALL s_aap_get_glab010(g_tmp.glaqld,'13',p_apca007,'8504_01',g_tmp.glaq001,
                                         #p_apcadocno,g_tmp.docseq,'AP','1',g_tmp.glaq002, #150914 mark           
                                          p_apcadocno,g_tmp.docseq,'AP','2',g_tmp.glaq002, #150914 
                                          'glgb001')      #170724-00032#1 change apde010 to glgb001 lujh 
                                       
                        RETURNING g_tmp.glaq001
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #                          c,sum,glaq039,glaq040,glaq041,  
                   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #                          type,glaq010,apcb023,glgb055,red)      
                   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #170430-00006#2---mark---end---
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   #170430-00006#2---add--start---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                          ,''                                                                   #180608-00039#1 add
                   #170430-00006#2---add---end---
                   #161111-00048#2 --e add
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF  
               END FOREACH 
        
        WHEN '43'
               FOREACH gen_ap_1_c41 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c41'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  
                  CALL s_aapp330_set_glaq002() 
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                  #180109-00059#1---add---str--by jc
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8035','P30','3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #180109-00059#1---add---end--by jc
                  LET g_tmp.red = g_dfin1002 #180808-00013#7 add
                  #160506-00002#3 ---s---
                  #借方金額若為負數，做正數處理
                  IF g_tmp.d < 0 THEN
                     LET g_tmp.d = g_tmp.d * -1
                     LET g_tmp.glaq040 = g_tmp.glaq040 * -1
                     LET g_tmp.glaq044 = g_tmp.glaq044 * -1
                     LET g_tmp.sum = g_tmp.sum * -1   #190911-00001#1 add
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1   #190911-00001#1 add
                  END IF
                  #160506-00002#3 ---e---
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                         ,''           #180621-00040#1 add
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
               FOREACH gen_ap_1_c46 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c46'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  
                  IF cl_null(g_tmp.glaq021) THEN
                     SELECT apda005 INTO g_tmp.glaq021
                       FROM apda_t
                      WHERE apdaent = g_enterprise
                        AND apdald = g_tmp.glaqld
                        AND apdadocno = g_tmp.docno
                     LET g_tmp.glaq022 = g_tmp.glaq021
                  END IF
                 #CALL s_ld_sel_glaa(p_apcald,'glaa001') RETURNING g_sub_success,g_tmp.glaq005   #170430-00006#2 mark
                  #SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add #170723-00002#1 mark
                  SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_tmp.glaqld                #170723-00002#1 add
                 #180904-00075#1 cancel mark--s
                 LET g_tmp.red = g_dfin1002 #180808-00013#7 add
                 #180612-00075#1---s--
                  #借方金額若為負數，做正數處理
                  IF g_tmp.d < 0 THEN
                     LET g_tmp.d = g_tmp.d * -1
                     LET g_tmp.glaq040 = g_tmp.glaq040 * -1
                     LET g_tmp.glaq044 = g_tmp.glaq044 * -1
                     LET g_tmp.sum = g_tmp.sum * -1   #190911-00001#1 add
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1   #190911-00001#1 add
                  END IF
                 #180612-00075#1---e---
                 #180904-00075#1 cancel mark--e
                  CALL s_aapp330_set_glaq002()     
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                  #180109-00059#1---add---str--by jc
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8035','P30','3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #180109-00059#1---add---end--by jc
                  
                  #200807-00004#1 add(s)
                  IF g_tmp.glaq006 = 1 THEN
                     IF g_tmp.d <> 0 THEN
                        LET g_tmp.sum = g_tmp.d
                     END IF
                     IF g_tmp.c <> 0 THEN
                        LET g_tmp.sum = g_tmp.c
                     END IF
                     LET g_tmp.glaq010 = g_tmp.sum
                  END IF
                  #200807-00004#1 add(e)
                  
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                         ,''           #180621-00040#1 add
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
                  #現金科目要寫入現金變動碼--141209--(S)
                  #現金科目要寫入現金變動碼--141209--(E)
               END FOREACH

        
        WHEN '44'
               FOREACH gen_ap_1_c42 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c42'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                  #180109-00059#1---add---str--by jc
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8035','P30','3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #180109-00059#1---add---end--by jc
                  
                  LET g_tmp.red = g_dfin1002 #180808-00013#7 add
                  #160506-00002#3 ---s---
                  #貸方金額若為負數，做正數處理
                  IF g_tmp.c < 0 THEN
                     LET g_tmp.c = g_tmp.c * -1
                     LET g_tmp.glaq041 = g_tmp.glaq041 * -1
                     LET g_tmp.glaq043 = g_tmp.glaq043 * -1
                     LET g_tmp.sum = g_tmp.sum * -1   #190911-00001#1 add
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1   #190911-00001#1 add
                  END IF
                  #160506-00002#3 ---e---
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                         ,''           #180621-00040#1 add
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
               END FOREACH
               FOREACH gen_ap_1_c47 USING p_apcadocno INTO g_tmp.*
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'foreach gen_ap_1_c47'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
                  #EXIT FOREACH  #180612-00075#1 add  #180904-00075#1 mark
#                  #200408-00070#1---mark---str
#                  #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end
                  IF cl_null(g_tmp.glaq021) THEN
                     SELECT apda005 INTO g_tmp.glaq021
                       FROM apda_t
                      WHERE apdaent = g_enterprise
                        AND apdald = g_tmp.glaqld
                        AND apdadocno = g_tmp.docno
                     LET g_tmp.glaq022 = g_tmp.glaq021
                  END IF
                 #CALL s_ld_sel_glaa(p_apcald,'glaa001') RETURNING g_sub_success,g_tmp.glaq005 #170430-00006#2 mark
                  #SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add   #170907-00051#1 mark
                  SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_tmp.glaqld                  #170907-00051#1 add
                  LET g_tmp.red = g_dfin1002 #180808-00013#7 add
                  #貸方金額若為負數，做正數處理
                  IF g_tmp.c < 0 THEN
                     LET g_tmp.c = g_tmp.c * -1
                     LET g_tmp.glaq041 = g_tmp.glaq041 * -1
                     LET g_tmp.glaq043 = g_tmp.glaq043 * -1
                     LET g_tmp.sum = g_tmp.sum * -1   #190911-00001#1 add
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1   #190911-00001#1 add
                  END IF
                  CALL s_aapp330_set_glaq002()
                  IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                  IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  
                  #180109-00059#1---add---str--by jc
                  #傳票摘要彈性預設檔(agli050)
                  #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
                  IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                     CALL s_fin_get_scc_value('8035','P30','3')RETURNING l_prog
                     CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1')
                          RETURNING g_tmp.glaq001
                  END IF
                  #180109-00059#1---add---end--by jc
                  
                 #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                  #161111-00048#2 --s add
                  #170430-00006#2---mark---start---
                  #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                  #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                  #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                  #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                  #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                  #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                  #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                  #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                  #                          glaq035,glaq036,glaq037,glaq038,d,        
                  #                          c,sum,glaq039,glaq040,glaq041,  
                  #                          glaq042,glaq043,glaq044,docseq,source,   
                  #                          glaqseq,xrca039,apcb022,key1,key2,     
                  #                          type,glaq010,apcb023,glgb055,red)      
                  #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                  #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                  #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                  #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                  #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                  #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                  #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                  #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                  #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                  #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                  #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                  #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                  #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                  #170430-00006#2---mark---end---
                  #180423-00029#1 add ------
                  IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                  IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                  #180423-00029#1 add end---
                  #170430-00006#2---add--start---
                  EXECUTE s_aapp330_ins_voucher_tmp_p USING
                          g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                          g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                          g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                          g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                          g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                          g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                          g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                          g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                          g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                          g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                          g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                          g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                          g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                         ,''           #180621-00040#1 add
                  #170430-00006#2---add---end---
                  #161111-00048#2 --e add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'insert s_voucher_tmp'
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     RETURN r_success
                  END IF
                  #現金科目要寫入現金變動碼--141209--(S)
                  #現金科目要寫入現金變動碼--141209--(E)
               END FOREACH
               
         
         WHEN '91' 
                #FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.* #借：暂估費用   #170213-00048#1 mark
                #FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.*,l_xren005       #170213-00048#1 add #170915-00038#10 mark
                FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.*,l_xren005,l_xren004 #170915-00038#10 add l_xren004
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c91'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                   #200408-00070#1---mark---str
#                   #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end 
                   #170915-00038#10 --s mark 因在寫入aapt930 時, 已處理好金額來源,因此直接抓取寫入
                   ##170216-00006#1-----s
                   ##LET l_tmp.* = g_tmp.*   #170515-00030#1 mark
                   ##170216-00006#1-----e
                   #
                   #LET l_tot_d = 0     #170628-00052#1 add
                   #LET l_tot_sum = 0   #170628-00052#1 add
                   #
                   ##albireo 170215 #170215-00043#1-----s
                   #LET l_xren103 = g_tmp.sum
                   #LET l_xren113 = g_tmp.d
                   #
                   #LET l_apcb103diff = l_xren103
                   #LET l_apcb113diff = l_xren113
                   #LET l_apcb103sum = NULL   LET l_apcb113sum = NULL
                   #SELECT SUM(apcb103),SUM(apcb113) INTO l_apcb103sum,l_apcb113sum
                   #  FROM apcb_t
                   # WHERE apcbent = g_enterprise
                   #   AND apcbld = p_apcald
                   #   AND apcbdocno = l_xren005
                   #IF cl_null(l_apcb103sum)THEN LET l_apcb103sum = 0 END IF
                   #IF cl_null(l_apcb113sum)THEN LET l_apcb113sum = 0 END IF
                   #
                   #LET l_sql = "SELECT apcb021, ",
                   #            "       SUM(apcb113) apcb113sum, ",     
                   #            "       SUM(apcb103) apcb103sum ",
                   #            #170515-00030#1---add---str--
                   #            #       業務人員/業務部門/責任中心/區域/產品類別
                   #            "      ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            #       專案編號/WBS編號/預算細項/經營方式/通路
                   #            "       apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            #       品牌/客群/帳款對象/付款對象/自由核算項一
                   #            "       apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            #       自由核算項二~自由核算項六
                   #            "       apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            #       自由核算項七~自由核算項十
                   #            "       apcb043,apcb044,apcb045,apcb046 ",
                   #            #170515-00030#1---add---end--
                   #            "  FROM apcb_t ",
                   #            " WHERE apcbent= ",g_enterprise,
                   #            "   AND apcbld = '",p_apcald CLIPPED,"'",
                   #            "   AND apcbdocno = '",l_xren005,"'",
                   #            " GROUP BY apcb021  ",
                   #            #170515-00030#1---add---str--
                   #            "         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            "          apcb043,apcb044,apcb045,apcb046 ",
                   #            #170515-00030#1---add---end--
                   #            " ORDER BY apcb103sum DESC,apcb021 "  
                   #            #170515-00030#1---add---str--
                   #           ,"         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            "          apcb043,apcb044,apcb045,apcb046 "
                   #            #170515-00030#1---add---end--                               
                   #PREPARE gen_ap_1_papcb021_3 FROM l_sql
                   #DECLARE gen_ap_1_capcb021_3 CURSOR FOR gen_ap_1_papcb021_3
                   ##FOREACH gen_ap_1_capcb021_3 INTO l_apcb021max,g_tmp.d,g_tmp.sum   #170216-00006#1 mark
                   #FOREACH gen_ap_1_capcb021_3 INTO l_apcb021max,l_d,l_sum   #170216-00006#1
                   #                                ,l_glaq025,l_glaq018,l_glaq019,l_glaq020,l_glaq024,   #170515-00030#1 add
                   #                                 l_glaq027,l_glaq028,l_glaq026,l_glaq051,l_glaq052,   #170515-00030#1 add
                   #                                 l_glaq053,l_glaq023,l_glaq022,l_glaq021,l_glaq029,   #170515-00030#1 add
                   #                                 l_glaq030,l_glaq031,l_glaq032,l_glaq033,l_glaq034,   #170515-00030#1 add
                   #                                 l_glaq035,l_glaq036,l_glaq037,l_glaq038              #170515-00030#1 add
                   #   EXIT FOREACH
                   #END FOREACH                    
                   ##albireo 170215 #170215-00043#1-----e
                   #
                   ##170515-00030#1---add---str--
                   #IF cl_null(l_glaq025) THEN LET l_glaq025 = ' ' END IF
                   #IF cl_null(l_glaq018) THEN LET l_glaq018 = ' ' END IF
                   #IF cl_null(l_glaq019) THEN LET l_glaq019 = ' ' END IF
                   #IF cl_null(l_glaq020) THEN LET l_glaq020 = ' ' END IF
                   #IF cl_null(l_glaq024) THEN LET l_glaq024 = ' ' END IF
                   #IF cl_null(l_glaq027) THEN LET l_glaq027 = ' ' END IF
                   #IF cl_null(l_glaq028) THEN LET l_glaq028 = ' ' END IF
                   #IF cl_null(l_glaq026) THEN LET l_glaq026 = ' ' END IF
                   #IF cl_null(l_glaq051) THEN LET l_glaq051 = ' ' END IF
                   #IF cl_null(l_glaq052) THEN LET l_glaq052 = ' ' END IF
                   #IF cl_null(l_glaq053) THEN LET l_glaq053 = ' ' END IF
                   #IF cl_null(l_glaq023) THEN LET l_glaq023 = ' ' END IF
                   #IF cl_null(l_glaq022) THEN LET l_glaq022 = ' ' END IF
                   #IF cl_null(l_glaq021) THEN LET l_glaq021 = ' ' END IF
                   #IF cl_null(l_glaq029) THEN LET l_glaq029 = ' ' END IF
                   #IF cl_null(l_glaq030) THEN LET l_glaq030 = ' ' END IF
                   #IF cl_null(l_glaq031) THEN LET l_glaq031 = ' ' END IF
                   #IF cl_null(l_glaq032) THEN LET l_glaq032 = ' ' END IF
                   #IF cl_null(l_glaq033) THEN LET l_glaq033 = ' ' END IF
                   #IF cl_null(l_glaq034) THEN LET l_glaq034 = ' ' END IF
                   #IF cl_null(l_glaq035) THEN LET l_glaq035 = ' ' END IF
                   #IF cl_null(l_glaq036) THEN LET l_glaq036 = ' ' END IF
                   #IF cl_null(l_glaq037) THEN LET l_glaq037 = ' ' END IF
                   #IF cl_null(l_glaq038) THEN LET l_glaq038 = ' ' END IF
                   ##170515-00030#1---add---end--
                   #
                   ##170213-00048#1---add---str--
                   #LET l_sql = "SELECT apcb021, ",
                   #            "       SUM(apcb113) apcb113sum, ",    #170215-00049#1 apcb113別名>>apcb113sum
                   #            "       SUM(apcb103) apcb103sum ",     #170215-00049#1 apcb103別名>>apcb103sum
                   #            #170515-00030#1---add---str--
                   #            #       業務人員/業務部門/責任中心/區域/產品類別
                   #            "      ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            #       專案編號/WBS編號/預算細項/經營方式/通路
                   #            "       apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            #       品牌/客群/帳款對象/付款對象/自由核算項一
                   #            "       apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            #       自由核算項二~自由核算項六
                   #            "       apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            #       自由核算項七~自由核算項十
                   #            "       apcb043,apcb044,apcb045,apcb046 ",
                   #            #170515-00030#1---add---end--
                   #            "  FROM apcb_t ",
                   #            " WHERE apcbent= ",g_enterprise,
                   #            "   AND apcbld = '",p_apcald CLIPPED,"'",
                   #            "   AND apcbdocno = '",l_xren005,"'",
                   #            " GROUP BY apcb021  ",
                   #            #170515-00030#1---add---str--
                   #            "         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            "          apcb043,apcb044,apcb045,apcb046 ",
                   #            #170515-00030#1---add---end--
                   #            " ORDER BY apcb103sum,apcb021 DESC"       #170215-00043#1 add
                   #            #170515-00030#1---add---str--
                   #           ,"         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                   #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                   #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                   #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                   #            "          apcb043,apcb044,apcb045,apcb046 "
                   #            #170515-00030#1---add---end--
                   #PREPARE gen_ap_1_papcb021_2 FROM l_sql
                   #DECLARE gen_ap_1_capcb021_2 CURSOR FOR gen_ap_1_papcb021_2
                   ##FOREACH gen_ap_1_capcb021_2 INTO g_tmp.glaq002,g_tmp.d,g_tmp.sum   #170216-00006#1 mark
                   ##FOREACH gen_ap_1_capcb021_2 INTO g_tmp.glaq002,l_d,l_sum   #170216-00006#1   #170515-00030#1 mark
                   ##170515-00030#1---add---str--
                   #FOREACH gen_ap_1_capcb021_2 INTO g_tmp.glaq002,g_tmp.d,g_tmp.sum   
                   #                                ,g_tmp.glaq025,g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq024,
                   #                                 g_tmp.glaq027,g_tmp.glaq028,g_tmp.glaq026,g_tmp.glaq051,g_tmp.glaq052,
                   #                                 g_tmp.glaq053,g_tmp.glaq023,g_tmp.glaq022,g_tmp.glaq021,g_tmp.glaq029,
                   #                                 g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                   #                                 g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038
                   #                          
                   #170915-00038#10 --e mark 因在寫入aapt930 時, 已處理好金額來源,因此直接抓取寫入
                   
                     IF cl_null(g_tmp.glaq025) THEN LET g_tmp.glaq025 = ' ' END IF
                     IF cl_null(g_tmp.glaq018) THEN LET g_tmp.glaq018 = ' ' END IF
                     IF cl_null(g_tmp.glaq019) THEN LET g_tmp.glaq019 = ' ' END IF
                     IF cl_null(g_tmp.glaq020) THEN LET g_tmp.glaq020 = ' ' END IF
                     IF cl_null(g_tmp.glaq024) THEN LET g_tmp.glaq024 = ' ' END IF
                     IF cl_null(g_tmp.glaq027) THEN LET g_tmp.glaq027 = ' ' END IF
                     IF cl_null(g_tmp.glaq028) THEN LET g_tmp.glaq028 = ' ' END IF
                     IF cl_null(g_tmp.glaq026) THEN LET g_tmp.glaq026 = ' ' END IF
                     IF cl_null(g_tmp.glaq051) THEN LET g_tmp.glaq051 = ' ' END IF
                     IF cl_null(g_tmp.glaq052) THEN LET g_tmp.glaq052 = ' ' END IF
                     IF cl_null(g_tmp.glaq053) THEN LET g_tmp.glaq053 = ' ' END IF
                     IF cl_null(g_tmp.glaq023) THEN LET g_tmp.glaq023 = ' ' END IF
                     IF cl_null(g_tmp.glaq022) THEN LET g_tmp.glaq022 = ' ' END IF
                     IF cl_null(g_tmp.glaq021) THEN LET g_tmp.glaq021 = ' ' END IF
                     IF cl_null(g_tmp.glaq029) THEN LET g_tmp.glaq029 = ' ' END IF
                     IF cl_null(g_tmp.glaq030) THEN LET g_tmp.glaq030 = ' ' END IF
                     IF cl_null(g_tmp.glaq031) THEN LET g_tmp.glaq031 = ' ' END IF
                     IF cl_null(g_tmp.glaq032) THEN LET g_tmp.glaq032 = ' ' END IF
                     IF cl_null(g_tmp.glaq033) THEN LET g_tmp.glaq033 = ' ' END IF
                     IF cl_null(g_tmp.glaq034) THEN LET g_tmp.glaq034 = ' ' END IF
                     IF cl_null(g_tmp.glaq035) THEN LET g_tmp.glaq035 = ' ' END IF
                     IF cl_null(g_tmp.glaq036) THEN LET g_tmp.glaq036 = ' ' END IF
                     IF cl_null(g_tmp.glaq037) THEN LET g_tmp.glaq037 = ' ' END IF
                     IF cl_null(g_tmp.glaq038) THEN LET g_tmp.glaq038 = ' ' END IF 
                     
                   #170915-00038#10 --s mark 因在寫入aapt930 時, 已處理好金額來源,因此直接抓取寫入                     
                   ##170515-00030#1---add---end--
                   #
                   #   #170515-00030#1---mark---str--
                   #   ##170216-00006#1-----s
                   #   #LET g_tmp.* = l_tmp.*
                   #   #LET g_tmp.d = l_d
                   #   #LET g_tmp.sum = l_sum
                   #   ##170216-00006#1-----e
                   #   #170515-00030#1---mark---end--
                   #   #albireo 170215 #170215-00043#1-----s
                   #   #IF g_tmp.glaq002 = l_apcb021max THEN   #170515-00030#1 mark
                   #   #170515-00030#1---add---str--
                   #   IF g_tmp.glaq002 = l_apcb021max
                   #      AND g_tmp.glaq025 = l_glaq025 AND g_tmp.glaq018 = l_glaq018 AND g_tmp.glaq019 = l_glaq019 AND g_tmp.glaq020 = l_glaq020 AND g_tmp.glaq024 = l_glaq024
                   #      AND g_tmp.glaq027 = l_glaq027 AND g_tmp.glaq028 = l_glaq028 AND g_tmp.glaq026 = l_glaq026 AND g_tmp.glaq051 = l_glaq051 AND g_tmp.glaq052 = l_glaq052
                   #      AND g_tmp.glaq053 = l_glaq053 AND g_tmp.glaq023 = l_glaq023 AND g_tmp.glaq022 = l_glaq022 AND g_tmp.glaq021 = l_glaq021 AND g_tmp.glaq029 = l_glaq029
                   #      AND g_tmp.glaq030 = l_glaq030 AND g_tmp.glaq031 = l_glaq031 AND g_tmp.glaq032 = l_glaq032 AND g_tmp.glaq033 = l_glaq033 AND g_tmp.glaq034 = l_glaq034
                   #      AND g_tmp.glaq035 = l_glaq035 AND g_tmp.glaq036 = l_glaq036 AND g_tmp.glaq037 = l_glaq037 AND g_tmp.glaq038 = l_glaq038 THEN
                   #   #170515-00030#1---add---end--
                   #      #170606-00050#1---add---str--
                   #      IF l_xren113 = l_apcb113diff THEN
                   #         LET g_tmp.d = g_tmp.d / l_apcb113sum * l_xren113
                   #         CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.d,2) RETURNING g_sub_success,g_errno,g_tmp.d
                   #         LET l_apcb113diff = l_apcb113diff - g_tmp.d
                   #         LET g_tmp.sum = g_tmp.sum / l_apcb103sum * l_xren103
                   #         CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                   #         LET l_apcb103diff = l_apcb103diff - g_tmp.sum
                   #      ELSE
                   #      #170606-00050#1---add---end--
                   #         LET g_tmp.d = l_apcb113diff
                   #         LET g_tmp.sum = l_apcb103diff
                   #      END IF   #170606-00050#1 add
                   #   ELSE
                   #      LET g_tmp.d = g_tmp.d / l_apcb113sum * l_xren113
                   #      CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.d,2) RETURNING g_sub_success,g_errno,g_tmp.d
                   #      LET l_apcb113diff = l_apcb113diff - g_tmp.d
                   #      LET g_tmp.sum = g_tmp.sum / l_apcb103sum * l_xren103 
                   #      CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                   #      LET l_apcb103diff = l_apcb103diff - g_tmp.sum
                   #   END IF
                   #   #albireo 170215 #170215-00043#1-----e
                   #   #170628-00052#1---add---str--
                   #   LET l_tot_d = l_tot_d + g_tmp.d
                   #   LET l_tot_sum = l_tot_sum + g_tmp.sum
                   #   IF l_tot_d > l_xren113 THEN
                   #      LET g_tmp.d = g_tmp.d - (l_tot_d - l_xren113)
                   #   END IF
                   #   IF l_tot_sum > l_xren103 THEN
                   #      LET g_tmp.sum = g_tmp.sum - (l_tot_sum - l_xren103)
                   #   END IF
                   #   #170628-00052#1---add---end--
                   #   LET g_tmp.glaq010 = g_tmp.sum
                   ##170213-00048#1---add---end--
                   #   SELECT xren004 INTO l_xren004
                   #     FROM xren_t
                   #    WHERE xrenent   = g_enterprise
                   #      AND xrendocno = p_apcadocno
                   #      AND xrenseq   = g_tmp.docseq
                   # #170509-00094#2---mark---start---     
                   # # #151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
                   # # IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
                   # ##IF l_xren004 = '01' OR l_xren004 = '03' THEN
                   # # #LET g_tmp.c = g_tmp.c * -1
                   # ##   LET g_tmp.d = g_tmp.d * -1
                   # ##   LET g_tmp.glaq040 = g_tmp.glaq040 * -1
                   # ##   LET g_tmp.glaq043 = g_tmp.glaq043 * -1
                   # # LET g_tmp.red = 'Y'
                   # # LET g_tmp.apcb022 = '-1'
                   # # ELSE
                   # #170509-00094#2---mark---end---  
                   #   LET g_tmp.sw = '2'
                   #   LET g_tmp.c = g_tmp.d
                   #   LET g_tmp.d = 0 
                   #   LET g_tmp.glaq041 = g_tmp.glaq040
                   #   LET g_tmp.glaq040 = 0
                   #   LET g_tmp.glaq044 = g_tmp.glaq043
                   #   LET g_tmp.glaq043 = 0                  
                   #   #END IF         #170509-00094#2 mark
                   #   LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                   #   #151029   ---e---
                   #   CALL s_aapp330_set_glaq002()
                   #   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   #   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                   #  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #   #161111-00048#2 --s add
                   #   #170430-00006#2---mark---start---
                   #   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #   #                          c,sum,glaq039,glaq040,glaq041,  
                   #   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #   #                          type,glaq010,apcb023,glgb055,red)      
                   #   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #   #170430-00006#2---mark---end---
                   #   #170430-00006#2---add--start---
                   #   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                   #           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #   #170430-00006#2---add---end---
                   #   #161111-00048#2 --e add                   
                   #   IF SQLCA.sqlcode THEN
                   #      INITIALIZE g_errparam TO NULL
                   #      LET g_errparam.code = SQLCA.sqlcode
                   #      LET g_errparam.extend = 'insert s_voucher_tmp'
                   #      LET g_errparam.popup = FALSE
                   #      CALL cl_err()
                   #      RETURN r_success                   
                   #   END IF
                   #END FOREACH   #170213-00048#1 add
                   #170915-00038#10 --e mark 因在寫入aapt930 時, 已處理好金額來源,因此直接抓取寫入                   

                   #170915-00038#10 --s add
                   LET g_tmp.sw = '2'
                   LET g_tmp.c = g_tmp.d
                   LET g_tmp.d = 0 
                   LET g_tmp.glaq041 = g_tmp.glaq040
                   LET g_tmp.glaq040 = 0
                   LET g_tmp.glaq044 = g_tmp.glaq043
                   LET g_tmp.glaq043 = 0          
                  
                   #倉退/待抵性質者, 科目金額反轉
                   IF l_xren004 MATCHES '0[24]' THEN 
                      LET g_tmp.sw = '1'
                      LET g_tmp.d = g_tmp.c
                      LET g_tmp.c = 0 
                      LET g_tmp.glaq040 = g_tmp.glaq041
                      LET g_tmp.glaq041 = 0
                      LET g_tmp.glaq043 = g_tmp.glaq044
                      LET g_tmp.glaq044 = 0         
                   END IF
 
                   LET g_tmp.red = g_dfin1002   
                   CALL s_aapp330_set_glaq002()
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red     
                          ,''           #180621-00040#1 add          
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success                   
                   END IF
                   #170915-00038#10 --e add

                END FOREACH 
                
                #借：暫估稅額
                #FOREACH gen_ap_1_c92 USING p_apcadocno INTO g_tmp.*          #170915-00038#10 mark
                FOREACH gen_ap_1_c92 USING p_apcadocno INTO g_tmp.*,l_xren004 #170915-00038#10 add l_xren004
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c92'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                  #200408-00070#1---mark---str 
#                   #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end 
                   #170915-00038#10 --s mark
                   #SELECT xren004 INTO l_xren004
                   #  FROM xren_t
                   # WHERE xrenent   = g_enterprise
                   #   AND xrendocno = p_apcadocno
                   #   AND xrenseq   = g_tmp.docseq
                   #170915-00038#10 --e mark
                  #170509-00094#2---mark---start--- 
                  ##151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
                  # IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
                  # #IF l_xren004 = '01' OR l_xren004 = '03' THEN
                  # #   #LET g_tmp.c = g_tmp.c * -1
                  # #   LET g_tmp.d = g_tmp.d * -1
                  # #   LET g_tmp.glaq040 = g_tmp.glaq040 * -1
                  # #   LET g_tmp.glaq043 = g_tmp.glaq043 * -1
                  #    LET g_tmp.red = 'Y'
                  #    LET g_tmp.apcb022 = '-1'
                  # ELSE
                  #170509-00094#2---mark---end--- 
                   LET g_tmp.sw = '2'
                   LET g_tmp.c = g_tmp.d
                   LET g_tmp.d = 0 
                   LET g_tmp.glaq041 = g_tmp.glaq040
                   LET g_tmp.glaq040 = 0
                   LET g_tmp.glaq044 = g_tmp.glaq043
                   LET g_tmp.glaq043 = 0                  
                   #END IF         #170509-00094#2 mark
                   
                   #170915-00038#10 --s add 倉退/待抵性質者, 科目金額反轉
                   IF l_xren004 MATCHES '0[24]' THEN
                      LET g_tmp.sw = '1'
                      LET g_tmp.d = g_tmp.c
                      LET g_tmp.c = 0
                      LET g_tmp.glaq040 = g_tmp.glaq041
                      LET g_tmp.glaq041 = 0
                      LET g_tmp.glaq043 = g_tmp.glaq044
                      LET g_tmp.glaq044 = 0
                   END IF
                   #170915-00038#10 --e add                   
                   
                   LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                   #151029   ---e---
                   CALL s_aapp330_set_glaq002()
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*)  #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #                          c,sum,glaq039,glaq040,glaq041,  
                   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #                          type,glaq010,apcb023,glgb055,red)      
                   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #170430-00006#2---mark---end---
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   #170430-00006#2---add--start---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                          ,''           #180621-00040#1 add
                   #170430-00006#2---add---end---
                   #161111-00048#2 --e add                   
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success                   
                   END IF               
                END FOREACH   
         WHEN '92'
                #贷：暂估應付
                #FOREACH gen_ap_1_c93 USING p_apcadocno INTO g_tmp.*          #170915-00038#10 mark
                FOREACH gen_ap_1_c93 USING p_apcadocno INTO g_tmp.*,l_xren004 #170915-00038#10 add l_xren004
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'foreach gen_ap_1_c93'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success
                   END IF
#                   #200408-00070#1---mark---str
#                   #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                  #200408-00070#1---mark---end 
                   #170915-00038#10 --s mark
                   #SELECT xren004 INTO l_xren004
                   #  FROM xren_t
                   # WHERE xrenent   = g_enterprise
                   #   AND xrendocno = p_apcadocno
                   #   AND xrenseq   = g_tmp.docseq
                   #170915-00038#10 --e mark
                   #170509-00094#2---mark---start---   
                   ##151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
                   #IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
                   ##IF l_xren004 = '01' OR l_xren004 = '03' THEN
                   ##   LET g_tmp.c = g_tmp.c * -1
                   ##   LET g_tmp.glaq041 = g_tmp.glaq041 * -1
                   ##   LET g_tmp.glaq044 = g_tmp.glaq044 * -1
                   #   LET g_tmp.red = 'Y'
                   #   LET g_tmp.apcb022 = '-1'
                   #ELSE
                   #170509-00094#2---mark---end---
                   LET g_tmp.sw = '1'
                   LET g_tmp.d = g_tmp.c
                   LET g_tmp.c = 0 
                   LET g_tmp.glaq040 = g_tmp.glaq041
                   LET g_tmp.glaq041 = 0
                   LET g_tmp.glaq043 = g_tmp.glaq044
                   LET g_tmp.glaq044 = 0                  
                   #END IF         #170509-00094#2 mark
                   
                   #170915-00038#10 --s add 倉退/待抵性質者, 科目金額反轉
                   IF l_xren004 MATCHES '0[24]' THEN
                      LET g_tmp.glaq010 = g_tmp.sum
                      LET g_tmp.sw = '2'
                      LET g_tmp.c = g_tmp.d
                      LET g_tmp.d = 0
                      LET g_tmp.glaq041 = g_tmp.glaq040
                      LET g_tmp.glaq040 = 0
                      LET g_tmp.glaq044 = g_tmp.glaq043
                      LET g_tmp.glaq043 = 0
                   END IF  
                   #170915-00038#10 --e add                   
                   
                   LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                   #151029   ---e---
                   CALL s_aapp330_set_glaq002()
                   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                   #161111-00048#2 --s add
                   #170430-00006#2---mark---start---
                   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                   #                          glaq035,glaq036,glaq037,glaq038,d,        
                   #                          c,sum,glaq039,glaq040,glaq041,  
                   #                          glaq042,glaq043,glaq044,docseq,source,   
                   #                          glaqseq,xrca039,apcb022,key1,key2,     
                   #                          type,glaq010,apcb023,glgb055,red)      
                   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                   #170430-00006#2---mark---end---
                   #180423-00029#1 add ------
                   IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                   IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                   #180423-00029#1 add end---
                   #170430-00006#2---add--start---
                   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                          ,''           #180621-00040#1 add
                   #170430-00006#2---add---end---
                   #161111-00048#2 --e add                     
                   IF SQLCA.sqlcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = 'insert s_voucher_tmp'
                      LET g_errparam.popup = FALSE
                      CALL cl_err()
                      RETURN r_success                   
                   END IF               
                END FOREACH 
           
         WHEN '93'
             #FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.*            #170213-00048#1 mark
             #FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.*,l_xren005   #170213-00048#1 add #170915-00038#10 mark
             FOREACH gen_ap_1_c91 USING p_apcadocno INTO g_tmp.*,l_xren005,l_xren004 #170915-00038#10 add l_xren004
                IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = 'foreach gen_ap_1_c91'
                   LET g_errparam.popup = FALSE
                   CALL cl_err()
                   RETURN r_success
                END IF
#                #200408-00070#1---mark---str
#                #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                #200408-00070#1---mark---end
                #170216-00006#1-----s
                #LET l_tmp.* = g_tmp.*   #170515-00018#1 mark
                #170216-00006#1-----e
                
                #170915-00038#10 --s mark 因在寫入aapt931 時, 已處理好金額來源,因此直接抓取寫入
                #LET l_tot_d = 0     #170628-00052#1 add
                #LET l_tot_sum = 0   #170628-00052#1 add
                #   
                ##albireo 170215 #170215-00043#1-----s
                #LET l_xren103 = g_tmp.sum
                #LET l_xren113 = g_tmp.d
                #LET l_apcb103diff = l_xren103
                #LET l_apcb113diff = l_xren113
                #
                #LET l_apcb103sum = NULL   LET l_apcb113sum = NULL
                #SELECT SUM(apcb103),SUM(apcb113) INTO l_apcb103sum,l_apcb113sum
                #  FROM apcb_t
                # WHERE apcbent = g_enterprise
                #   AND apcbld = p_apcald
                #   AND apcbdocno = l_xren005
                #IF cl_null(l_apcb103sum)THEN LET l_apcb103sum = 0 END IF
                #IF cl_null(l_apcb113sum)THEN LET l_apcb113sum = 0 END IF
                #
                #LET l_sql = "SELECT apcb021, ",
                #            "       SUM(apcb113) apcb113sum, ",     
                #            "       SUM(apcb103) apcb103sum ",
                #            #170515-00018#1---add---str--
                #            #       業務人員/業務部門/責任中心/區域/產品類別
                #            "      ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            #       專案編號/WBS編號/預算細項/經營方式/通路
                #            "       apcb015,apcb016,apcb017,apcb033,apcb034, ",
                #            #       品牌/客群/帳款對象/付款對象/自由核算項一
                #            "       apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            #       自由核算項二~自由核算項六
                #            "       apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            #       自由核算項七~自由核算項十
                #            "       apcb043,apcb044,apcb045,apcb046 ",
                #            #170515-00018#1---add---end--
                #            "  FROM apcb_t ",
                #            " WHERE apcbent= ",g_enterprise,
                #            "   AND apcbld = '",p_apcald CLIPPED,"'",
                #            "   AND apcbdocno = '",l_xren005,"'",
                #            " GROUP BY apcb021  ",
                #            #170515-00018#1---add---str--
                #            "         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            "          apcb043,apcb044,apcb045,apcb046 ",
                #            #170515-00018#1---add---end--
                #            " ORDER BY apcb103sum DESC,apcb021"     
                #            #170515-00018#1---add---str--
                #           ,"         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ", 
                #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            "          apcb043,apcb044,apcb045,apcb046 "
                #            #170515-00018#1---add---end--                            
                #PREPARE gen_ap_1_papcb021_4 FROM l_sql
                ##DECLARE gen_ap_1_capcb021_4 CURSOR FOR gen_ap_1_papcb021_3   #170515-00018#1 mark
                #DECLARE gen_ap_1_capcb021_4 CURSOR FOR gen_ap_1_papcb021_4    #170515-00018#1 add
                ##FOREACH gen_ap_1_capcb021_4 INTO l_apcb021max,g_tmp.d,g_tmp.sum    #170216-00006#1 mark
                #FOREACH gen_ap_1_capcb021_4 INTO l_apcb021max,l_d,l_sum    #170216-00006#1
                #                                ,l_glaq025,l_glaq018,l_glaq019,l_glaq020,l_glaq024,   #170515-00018#1 add
                #                                 l_glaq027,l_glaq028,l_glaq026,l_glaq051,l_glaq052,   #170515-00018#1 add
                #                                 l_glaq053,l_glaq023,l_glaq022,l_glaq021,l_glaq029,   #170515-00018#1 add
                #                                 l_glaq030,l_glaq031,l_glaq032,l_glaq033,l_glaq034,   #170515-00018#1 add
                #                                 l_glaq035,l_glaq036,l_glaq037,l_glaq038              #170515-00018#1 add
                #   EXIT FOREACH
                #END FOREACH          
                ##albireo 170215 #170215-00043#1-----e
                #
                ##170515-00018#1---add---str--
                #IF cl_null(l_glaq025) THEN LET l_glaq025 = ' ' END IF
                #IF cl_null(l_glaq018) THEN LET l_glaq018 = ' ' END IF
                #IF cl_null(l_glaq019) THEN LET l_glaq019 = ' ' END IF
                #IF cl_null(l_glaq020) THEN LET l_glaq020 = ' ' END IF
                #IF cl_null(l_glaq024) THEN LET l_glaq024 = ' ' END IF
                #IF cl_null(l_glaq027) THEN LET l_glaq027 = ' ' END IF
                #IF cl_null(l_glaq028) THEN LET l_glaq028 = ' ' END IF
                #IF cl_null(l_glaq026) THEN LET l_glaq026 = ' ' END IF
                #IF cl_null(l_glaq051) THEN LET l_glaq051 = ' ' END IF
                #IF cl_null(l_glaq052) THEN LET l_glaq052 = ' ' END IF
                #IF cl_null(l_glaq053) THEN LET l_glaq053 = ' ' END IF
                #IF cl_null(l_glaq023) THEN LET l_glaq023 = ' ' END IF
                #IF cl_null(l_glaq022) THEN LET l_glaq022 = ' ' END IF
                #IF cl_null(l_glaq021) THEN LET l_glaq021 = ' ' END IF
                #IF cl_null(l_glaq029) THEN LET l_glaq029 = ' ' END IF
                #IF cl_null(l_glaq030) THEN LET l_glaq030 = ' ' END IF
                #IF cl_null(l_glaq031) THEN LET l_glaq031 = ' ' END IF
                #IF cl_null(l_glaq032) THEN LET l_glaq032 = ' ' END IF
                #IF cl_null(l_glaq033) THEN LET l_glaq033 = ' ' END IF
                #IF cl_null(l_glaq034) THEN LET l_glaq034 = ' ' END IF
                #IF cl_null(l_glaq035) THEN LET l_glaq035 = ' ' END IF
                #IF cl_null(l_glaq036) THEN LET l_glaq036 = ' ' END IF
                #IF cl_null(l_glaq037) THEN LET l_glaq037 = ' ' END IF
                #IF cl_null(l_glaq038) THEN LET l_glaq038 = ' ' END IF
                ##170515-00018#1---add---end--
                #
                ##170213-00048#1---add---str--
                #LET l_sql = "SELECT apcb021, ",
                #            "       SUM(apcb113) apcb113sum, ",   #170215-00043#1  apcb113別名>>>apcb113sum
                #            "       SUM(apcb103) apcb103sum ",    #170215-00043#1  apcb103別名>>>apcb103sum
                #            #170515-00018#1---add---str--
                #            #       業務人員/業務部門/責任中心/區域/產品類別
                #            "      ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            #       專案編號/WBS編號/預算細項/經營方式/通路
                #            "       apcb015,apcb016,apcb017,apcb033,apcb034, ",
                #            #       品牌/客群/帳款對象/付款對象/自由核算項一
                #            "       apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            #       自由核算項二~自由核算項六
                #            "       apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            #       自由核算項七~自由核算項十
                #            "       apcb043,apcb044,apcb045,apcb046 ",
                #            #170515-00018#1---add---end--
                #            "  FROM apcb_t ",
                #            " WHERE apcbent= ",g_enterprise,
                #            "   AND apcbld = '",p_apcald CLIPPED,"'",
                #            "   AND apcbdocno = '",l_xren005,"'",
                #            " GROUP BY apcb021  ",
                #            #170515-00018#1---add---str--
                #            "         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ",
                #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            "          apcb043,apcb044,apcb045,apcb046 ",
                #            #170515-00018#1---add---end--
                #            " ORDER BY apcb103sum,apcb021 DESC "   #170215-00043#1
                #            #170515-00018#1---add---str--
                #           ,"         ,apcb051,apcb010,apcb011,apcb024,apcb012, ",
                #            "          apcb015,apcb016,apcb017,apcb033,apcb034, ", 
                #            "          apcb035,apcb036,apcb054,apcb055,apcb037, ",
                #            "          apcb038,apcb039,apcb040,apcb041,apcb042, ",
                #            "          apcb043,apcb044,apcb045,apcb046 "
                #            #170515-00018#1---add---end--
                #PREPARE gen_ap_1_papcb021 FROM l_sql
                #DECLARE gen_ap_1_capcb021 CURSOR FOR gen_ap_1_papcb021
                ##FOREACH gen_ap_1_capcb021 INTO g_tmp.glaq002,g_tmp.d,g_tmp.sum   #170216-00006#1 mark
                ##FOREACH gen_ap_1_capcb021 INTO g_tmp.glaq002,l_d,l_sum   #170216-00006#1   #170515-00018#1 mark
                ##170515-00018#1---add---str--
                #FOREACH gen_ap_1_capcb021 INTO g_tmp.glaq002,g_tmp.d,g_tmp.sum   #170518 add            
                #                              ,g_tmp.glaq025,g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq024,
                #                               g_tmp.glaq027,g_tmp.glaq028,g_tmp.glaq026,g_tmp.glaq051,g_tmp.glaq052,
                #                               g_tmp.glaq053,g_tmp.glaq023,g_tmp.glaq022,g_tmp.glaq021,g_tmp.glaq029,
                #                               g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                #                               g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038 
                #170915-00038#10 --e mark 因在寫入aapt931 時, 已處理好金額來源,因此直接抓取寫入                
                   IF cl_null(g_tmp.glaq025) THEN LET g_tmp.glaq025 = ' ' END IF
                   IF cl_null(g_tmp.glaq018) THEN LET g_tmp.glaq018 = ' ' END IF
                   IF cl_null(g_tmp.glaq019) THEN LET g_tmp.glaq019 = ' ' END IF
                   IF cl_null(g_tmp.glaq020) THEN LET g_tmp.glaq020 = ' ' END IF
                   IF cl_null(g_tmp.glaq024) THEN LET g_tmp.glaq024 = ' ' END IF
                   IF cl_null(g_tmp.glaq027) THEN LET g_tmp.glaq027 = ' ' END IF
                   IF cl_null(g_tmp.glaq028) THEN LET g_tmp.glaq028 = ' ' END IF
                   IF cl_null(g_tmp.glaq026) THEN LET g_tmp.glaq026 = ' ' END IF
                   IF cl_null(g_tmp.glaq051) THEN LET g_tmp.glaq051 = ' ' END IF
                   IF cl_null(g_tmp.glaq052) THEN LET g_tmp.glaq052 = ' ' END IF
                   IF cl_null(g_tmp.glaq053) THEN LET g_tmp.glaq053 = ' ' END IF
                   IF cl_null(g_tmp.glaq023) THEN LET g_tmp.glaq023 = ' ' END IF
                   IF cl_null(g_tmp.glaq022) THEN LET g_tmp.glaq022 = ' ' END IF
                   IF cl_null(g_tmp.glaq021) THEN LET g_tmp.glaq021 = ' ' END IF
                   IF cl_null(g_tmp.glaq029) THEN LET g_tmp.glaq029 = ' ' END IF
                   IF cl_null(g_tmp.glaq030) THEN LET g_tmp.glaq030 = ' ' END IF
                   IF cl_null(g_tmp.glaq031) THEN LET g_tmp.glaq031 = ' ' END IF
                   IF cl_null(g_tmp.glaq032) THEN LET g_tmp.glaq032 = ' ' END IF
                   IF cl_null(g_tmp.glaq033) THEN LET g_tmp.glaq033 = ' ' END IF
                   IF cl_null(g_tmp.glaq034) THEN LET g_tmp.glaq034 = ' ' END IF
                   IF cl_null(g_tmp.glaq035) THEN LET g_tmp.glaq035 = ' ' END IF
                   IF cl_null(g_tmp.glaq036) THEN LET g_tmp.glaq036 = ' ' END IF
                   IF cl_null(g_tmp.glaq037) THEN LET g_tmp.glaq037 = ' ' END IF
                   IF cl_null(g_tmp.glaq038) THEN LET g_tmp.glaq038 = ' ' END IF
                #170515-00018#1---add---end--
                   #170515-00018#1---mark---str--
                   ##170216-00006#1-----s
                   #LET g_tmp.* = l_tmp.*
                   #LET g_tmp.d = l_d
                   #LET g_tmp.sum = l_sum
                   ##170216-00006#1-----e
                   #170515-00018#1---mark---end--
                   #albireo 170215 #170215-00043#1-----s
                   #IF g_tmp.glaq002 = l_apcb021max THEN   #170515-00018#1 mark
                   #170515-00018#1---add---str--
                #170915-00038#10 --s mark 因在寫入aapt931 時, 已處理好金額來源,因此直接抓取寫入
                #   IF g_tmp.glaq002 = l_apcb021max 
                #      AND g_tmp.glaq025 = l_glaq025 AND g_tmp.glaq018 = l_glaq018 AND g_tmp.glaq019 = l_glaq019 AND g_tmp.glaq020 = l_glaq020 AND g_tmp.glaq024 = l_glaq024
                #      AND g_tmp.glaq027 = l_glaq027 AND g_tmp.glaq028 = l_glaq028 AND g_tmp.glaq026 = l_glaq026 AND g_tmp.glaq051 = l_glaq051 AND g_tmp.glaq052 = l_glaq052
                #      AND g_tmp.glaq053 = l_glaq053 AND g_tmp.glaq023 = l_glaq023 AND g_tmp.glaq022 = l_glaq022 AND g_tmp.glaq021 = l_glaq021 AND g_tmp.glaq029 = l_glaq029
                #      AND g_tmp.glaq030 = l_glaq030 AND g_tmp.glaq031 = l_glaq031 AND g_tmp.glaq032 = l_glaq032 AND g_tmp.glaq033 = l_glaq033 AND g_tmp.glaq034 = l_glaq034
                #      AND g_tmp.glaq035 = l_glaq035 AND g_tmp.glaq036 = l_glaq036 AND g_tmp.glaq037 = l_glaq037 AND g_tmp.glaq038 = l_glaq038 THEN
                #   #170515-00018#1---add---end--
                #      #170606-00050#1---add---str--
                #      IF l_xren113 = l_apcb113diff THEN
                #         LET g_tmp.d = g_tmp.d / l_apcb113sum * l_xren113
                #         CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.d,2) RETURNING g_sub_success,g_errno,g_tmp.d
                #         LET l_apcb113diff = l_apcb113diff - g_tmp.d
                #         LET g_tmp.sum = g_tmp.sum / l_apcb103sum * l_xren103
                #         CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                #         LET l_apcb103diff = l_apcb103diff - g_tmp.sum
                #      ELSE
                #      #170606-00050#1---add---end--
                #         LET g_tmp.d = l_apcb113diff
                #         LET g_tmp.sum = l_apcb103diff
                #      END IF   #170606-00050#1 add
                #   ELSE
                #      LET g_tmp.d = g_tmp.d / l_apcb113sum * l_xren113
                #      CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.d,2) RETURNING g_sub_success,g_errno,g_tmp.d
                #      LET l_apcb113diff = l_apcb113diff - g_tmp.d
                #      LET g_tmp.sum = g_tmp.sum / l_apcb103sum * l_xren103 
                #      CALL s_curr_round_ld('1',p_apcald,g_tmp.glaq005,g_tmp.sum,2) RETURNING g_sub_success,g_errno,g_tmp.sum
                #      LET l_apcb103diff = l_apcb103diff - g_tmp.sum
                #   END IF         
                #   #albireo 170215 #170215-00043#1-----e
                #   #170628-00052#1---add---str--
                #   LET l_tot_d = l_tot_d + g_tmp.d
                #   LET l_tot_sum = l_tot_sum + g_tmp.sum
                #   IF l_tot_d > l_xren113 THEN
                #      LET g_tmp.d = g_tmp.d - (l_tot_d - l_xren113)
                #   END IF
                #   IF l_tot_sum > l_xren103 THEN
                #      LET g_tmp.sum = g_tmp.sum - (l_tot_sum - l_xren103)
                #   END IF
                #   #170628-00052#1---add---end--
                #   LET g_tmp.glaq010 = g_tmp.sum
                ##170213-00048#1---add---end--
                #   SELECT xren004 INTO l_xren004
                #     FROM xren_t
                #    WHERE xrenent   = g_enterprise
                #      AND xrendocno = p_apcadocno
                #      AND xrenseq   = g_tmp.docseq
                #   #170509-00094#2---mark---start---    
                #   ##151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
                #   #IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
                #   ##IF l_xren004 = '01' OR l_xren004 = '03' THEN
                #   ##LET g_tmp.c = g_tmp.c * -1
                #   ##   LET g_tmp.d = g_tmp.d * -1
                #   ##   LET g_tmp.glaq040 = g_tmp.glaq040 * -1
                #   ##   LET g_tmp.glaq043 = g_tmp.glaq043 * -1
                #   #   LET g_tmp.red = 'Y'
                #   #   LET g_tmp.apcb022 = '-1'
                #   #ELSE
                #   #170509-00094#2---mark---end---
                #      #170515-00018#1---mark---str--
                #      #LET g_tmp.sw = '2'                     
                #      #LET g_tmp.c = g_tmp.d   
                #      #LET g_tmp.d = 0 
                #      #170515-00018#1---mark---end--
                #   #170515-00018#1---add---str--
                #   LET g_tmp.sw = '1'
                #   LET g_tmp.d = g_tmp.d 
                #   LET g_tmp.c = 0
                #   #170515-00018#1---add---end--
                #   LET g_tmp.glaq041 = g_tmp.glaq040
                #   LET g_tmp.glaq040 = 0
                #   LET g_tmp.glaq044 = g_tmp.glaq043
                #   LET g_tmp.glaq043 = 0                  
                #   #END IF         #170509-00094#2 mark
                #   LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                #   #151029   ---e---
                #   CALL s_aapp330_set_glaq002()
                #   IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                #   IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                #  #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                #   #161111-00048#2 --s add
                #   #170430-00006#2---mark---start---
                #   #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                #   #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                #   #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                #   #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                #   #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                #   #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                #   #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                #   #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                #   #                          glaq035,glaq036,glaq037,glaq038,d,        
                #   #                          c,sum,glaq039,glaq040,glaq041,  
                #   #                          glaq042,glaq043,glaq044,docseq,source,   
                #   #                          glaqseq,xrca039,apcb022,key1,key2,     
                #   #                          type,glaq010,apcb023,glgb055,red)      
                #   #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                #   #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                #   #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                #   #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                #   #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                #   #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                #   #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                #   #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                #   #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                #   #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                #   #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                #   #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                #   #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                #   #170430-00006#2---mark---end---
                #   #170430-00006#2---add--start---
                #   EXECUTE s_aapp330_ins_voucher_tmp_p USING
                #           g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                #           g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                #           g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                #           g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                #           g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                #           g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                #           g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                #           g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                #           g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                #           g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                #           g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                #           g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                #           g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                #   #170430-00006#2---add---end---
                #   #161111-00048#2 --e add                 
                #   IF SQLCA.sqlcode THEN
                #      INITIALIZE g_errparam TO NULL
                #      LET g_errparam.code = SQLCA.sqlcode
                #      LET g_errparam.extend = 'insert s_voucher_tmp'
                #      LET g_errparam.popup = FALSE
                #      CALL cl_err()
                #      RETURN r_success                   
                #   END IF   
                #END FOREACH   #170213-00048#1 add
                #170915-00038#10 --e mark 因在寫入aapt931 時, 已處理好金額來源,因此直接抓取寫入
                #170915-00038#10 --s add
                LET g_tmp.sw = '1'
                LET g_tmp.d = g_tmp.d 
                LET g_tmp.c = 0
                LET g_tmp.glaq041 = g_tmp.glaq040
                LET g_tmp.glaq040 = 0
                LET g_tmp.glaq044 = g_tmp.glaq043
                LET g_tmp.glaq043 = 0                  
                
                #倉退/待抵性質者, 科目金額反轉
                IF l_xren004 MATCHES '0[24]' THEN 
                   LET g_tmp.sw = '2'
                   LET g_tmp.c = g_tmp.d
                   LET g_tmp.d = 0 
                   LET g_tmp.glaq041 = g_tmp.glaq040
                   LET g_tmp.glaq040 = 0
                   LET g_tmp.glaq044 = g_tmp.glaq043
                   LET g_tmp.glaq043 = 0       
                END IF
                 
                LET g_tmp.red = g_dfin1002   
                CALL s_aapp330_set_glaq002()
                IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
                #180423-00029#1 add ------
                IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                #180423-00029#1 add end---
                EXECUTE s_aapp330_ins_voucher_tmp_p USING
                        g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                        g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                        g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                        g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                        g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                        g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                        g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                        g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                        g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                        g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                        g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                        g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                        g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                       ,''           #180621-00040#1 add

                IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = 'insert s_voucher_tmp'
                   LET g_errparam.popup = FALSE
                   CALL cl_err()
                   RETURN r_success                   
                END IF   
                #170915-00038#10 --e add

             END FOREACH  
             
             #FOREACH gen_ap_1_c92 USING p_apcadocno INTO g_tmp.*           #170915-00038#10 mark
             FOREACH gen_ap_1_c92 USING p_apcadocno INTO g_tmp.*,l_xren004  #170915-00038#10 add l_xren004
                IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = 'foreach gen_ap_1_c92'
                   LET g_errparam.popup = FALSE
                   CALL cl_err()
                   RETURN r_success
                END IF
#                #200408-00070#1---mark---str
#                #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#                #200408-00070#1---mark---end
                #170915-00038#10 --s mark
                #SELECT xren004 INTO l_xren004
                #  FROM xren_t
                # WHERE xrenent   = g_enterprise
                #   AND xrendocno = p_apcadocno
                #   AND xrenseq   = g_tmp.docseq
                #170915-00038#10 --e mark
               #170509-00094#2---mark---start---    
               ##151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
               # IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
               # #IF l_xren004 = '01' OR l_xren004 = '03' THEN
               #    #LET g_tmp.c = g_tmp.c * -1
               # #   LET g_tmp.d = g_tmp.d * -1
               # #   LET g_tmp.glaq040 = g_tmp.glaq040 * -1
               # #   LET g_tmp.glaq043 = g_tmp.glaq043 * -1
               #    LET g_tmp.red = 'Y'
               #    LET g_tmp.apcb022 = '-1'
               # ELSE
               #170509-00094#2---mark---end---
                #170915-00038#6---mark---start---
                #LET g_tmp.sw = '2'
                #LET g_tmp.c = g_tmp.d
                #LET g_tmp.d = 0 
                #LET g_tmp.glaq041 = g_tmp.glaq040
                #LET g_tmp.glaq040 = 0
                #LET g_tmp.glaq044 = g_tmp.glaq043
                #LET g_tmp.glaq043 = 0     
                #170915-00038#6---mark---end---             
                #END IF         #170509-00094#2 mark
                
                #170915-00038#10 --s add
                #倉退/待抵性質者, 科目金額反轉
                IF l_xren004 MATCHES '0[24]' THEN 
                   LET g_tmp.sw = '2'
                   LET g_tmp.c = g_tmp.d
                   LET g_tmp.d = 0 
                   LET g_tmp.glaq041 = g_tmp.glaq040
                   LET g_tmp.glaq040 = 0
                   LET g_tmp.glaq044 = g_tmp.glaq043
                   LET g_tmp.glaq043 = 0       
                END IF                
                #170915-00038#10 --e add
                
                LET g_tmp.red = g_dfin1002    #170509-00094#2 add
                #151029   ---e---
                CALL s_aapp330_set_glaq002()
                IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
                IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
               #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
                #161111-00048#2 --s add
                #170430-00006#2---mark---start---
                #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
                #                          glaqld,glaq001,glaq002,glaq005,glaq006,
                #                          glaq007,glaq008,glaq009,glaq011,glaq012,
                #                          glaq013,glaq014,glaq015,glaq016,glaq017,
                #                          glaq018,glaq019,glaq020,glaq021,glaq022,
                #                          glaq023,glaq024,glaq025,glaq026,glaq027,
                #                          glaq028,glaq051,glaq052,glaq053,glaq029,
                #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
                #                          glaq035,glaq036,glaq037,glaq038,d,        
                #                          c,sum,glaq039,glaq040,glaq041,  
                #                          glaq042,glaq043,glaq044,docseq,source,   
                #                          glaqseq,xrca039,apcb022,key1,key2,     
                #                          type,glaq010,apcb023,glgb055,red)      
                #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                #170430-00006#2---mark---end---
                #180423-00029#1 add ------
                IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
                IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
                #180423-00029#1 add end---
                #170430-00006#2---add--start---
                EXECUTE s_aapp330_ins_voucher_tmp_p USING
                        g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                        g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                        g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                        g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                        g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                        g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                        g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                        g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                        g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                        g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                        g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                        g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                        g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                       ,''           #180621-00040#1 add
                #170430-00006#2---add---end---
                #161111-00048#2 --e add                
                IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = 'insert s_voucher_tmp'
                   LET g_errparam.popup = FALSE
                   CALL cl_err()
                   RETURN r_success                   
                END IF               
             END FOREACH   
            
       WHEN '94' #贷：暂估應付
          #FOREACH gen_ap_1_c93 USING p_apcadocno INTO g_tmp.*          #170915-00038#10 mark
          FOREACH gen_ap_1_c93 USING p_apcadocno INTO g_tmp.*,l_xren004 #170915-00038#10 add l_xren004
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'foreach gen_ap_1_c93'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
#             #200408-00070#1---mark---str
#             #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#             #200408-00070#1---mark---end
             #170915-00038#10 --s mark
             #SELECT xren004 INTO l_xren004
             #  FROM xren_t
             # WHERE xrenent   = g_enterprise
             #   AND xrendocno = p_apcadocno
             #   AND xrenseq   = g_tmp.docseq
             #170915-00038#10 --e mark
             #170509-00094#2---mark---start---   
             ##151029  ---e--- 當參數等於Y並且帳款單性質為01,03 則變負數否則 借貸相反  
             #IF g_dfin1002 = 'Y' AND l_xren004 MATCHES '0[13]' THEN                                 
             ##IF l_xren004 = '01' OR l_xren004 = '03' THEN
             ##   LET g_tmp.c = g_tmp.c * -1
             ##   LET g_tmp.glaq041 = g_tmp.glaq041 * -1
             ##   LET g_tmp.glaq044 = g_tmp.glaq044 * -1
             #   LET g_tmp.red = 'Y'
             #   LET g_tmp.apcb022 = '-1'
             #ELSE
             #170509-00094#2---mark---end---
                #170515-00018#1---mark---str--
                #LET g_tmp.sw = '1'
                #LET g_tmp.d = g_tmp.c
                #LET g_tmp.c = 0 
                #170515-00018#1---mark---end--
             #170515-00018#1---add---str--
             LET g_tmp.sw = '2' 
             LET g_tmp.c = g_tmp.c
             LET g_tmp.d = 0
             #170515-00018#1---add---end--
             LET g_tmp.glaq040 = g_tmp.glaq041
             LET g_tmp.glaq041 = 0
             LET g_tmp.glaq043 = g_tmp.glaq044
             LET g_tmp.glaq044 = 0                  
             #END IF         #170509-00094#2 mark
             
             #170915-00038#10 --s add 倉退/待抵性質者, 科目金額反轉
             IF l_xren004 MATCHES '0[24]' THEN
                LET g_tmp.sw = '1'
                LET g_tmp.d = g_tmp.c
                LET g_tmp.c = 0 
                LET g_tmp.glaq040 = g_tmp.glaq041
                LET g_tmp.glaq041 = 0
                LET g_tmp.glaq043 = g_tmp.glaq044
                LET g_tmp.glaq044 = 0                   
             END IF  
             #170915-00038#10 --e add               
             
             LET g_tmp.red = g_dfin1002    #170509-00094#2 add
             #151029   ---e---
             CALL s_aapp330_set_glaq002()
             IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
             IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
            #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
             #161111-00048#2 --s add
             #170430-00006#2---mark---start---
             #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
             #                          glaqld,glaq001,glaq002,glaq005,glaq006,
             #                          glaq007,glaq008,glaq009,glaq011,glaq012,
             #                          glaq013,glaq014,glaq015,glaq016,glaq017,
             #                          glaq018,glaq019,glaq020,glaq021,glaq022,
             #                          glaq023,glaq024,glaq025,glaq026,glaq027,
             #                          glaq028,glaq051,glaq052,glaq053,glaq029,
             #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
             #                          glaq035,glaq036,glaq037,glaq038,d,        
             #                          c,sum,glaq039,glaq040,glaq041,  
             #                          glaq042,glaq043,glaq044,docseq,source,   
             #                          glaqseq,xrca039,apcb022,key1,key2,     
             #                          type,glaq010,apcb023,glgb055,red)      
             #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
             #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
             #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
             #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
             #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
             #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
             #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
             #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
             #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
             #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
             #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
             #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
             #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
             #170430-00006#2---mark---end---
             #180423-00029#1 add ------
             IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
             IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
             #180423-00029#1 add end---
             #170430-00006#2---add--start---
             EXECUTE s_aapp330_ins_voucher_tmp_p USING
                     g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                     g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                     g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                     g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                     g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                     g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                     g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                     g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                     g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                     g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                     g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                     g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                     g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                    ,''           #180621-00040#1 add
             #170430-00006#2---add---end---
             #161111-00048#2 --e add
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'insert s_voucher_tmp'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
          END FOREACH
   
         WHEN '95' #借：匯兌損失科目
            #151203-00013#3 --s mark
            ##150825-00004#9 add ------
            ##抓取重評價設定(agli171)彙總方式
            #SELECT glab011 INTO l_glab011
            #  FROM glab_t
            # WHERE glabent = g_enterprise
            #   AND glabld  = p_ld
            #   AND glab001 = '25'
            #   AND glab002 = '8318'
            #   AND glab003 = '8318_11'
            ##150825-00004#9 add end---
            #151203-00013#3 --e mark
            FOREACH gen_ap_1_c95 USING p_apcadocno INTO g_tmp.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'foreach gen_ap_1_c95'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  RETURN r_success
               END IF
#              #200408-00070#1---mark---str 
#               #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#               #200408-00070#1---mark---end
               #SELECT xreh004 INTO l_xreh004
               #  FROM xreh_t
               # WHERE xrehent   = g_enterprise
               #   AND xrehdocno = p_apcadocno
               #   AND xrehseq   = g_tmp.docseq
               #IF l_xreh004 MATCHES '0[24]' THEN
               #   LET g_tmp.c = g_tmp.c * -1
               #END IF
               #20150227--add--str--
               #若為負數金額,則借貸方向要相反
               IF g_tmp.d < 0 THEN 
                  LET g_tmp.sw = '2'
                  LET g_tmp.c = g_tmp.d * -1
                  LET g_tmp.d = 0
                  LET g_tmp.glaq041 = g_tmp.glaq040 * -1
                  LET g_tmp.glaq040 = 0
                  LET g_tmp.glaq044 = g_tmp.glaq043 * -1
                  LET g_tmp.glaq043 = 0
               END IF
               #151216-00008#3 mark ------
               ###如果重評價設定(agli171)成依幣別彙總，彙總時幣別再給本幣這邊先不給
               ##IF l_glab011 <> '3' THEN  #3:依幣別匯總  #150825-00004#9 #151203-00013#3 mark
               #   CALL s_ld_sel_glaa(p_apcald,'glaa001') RETURNING g_sub_success,g_tmp.glaq005
               #   LET g_tmp.glaq006 = 1
               ##END IF  #150825-00004#9 #151203-00013#3 mark
               #151216-00008#3 mark end---
               #20150227--add--end--
               
               #151216-00008#3 add ------
               #agli031勾选多币别>>汇兑损益科目币别=外币/原币金额=0
               #agli031不勾选多币别>>汇兑损益科目币别=本币/原币金额=本币金额
               SELECT glad034 INTO l_glad034
                 FROM glad_t
                WHERE gladent = g_enterprise
                  AND gladld = p_apcald
                  AND glad001 = g_tmp.glaq002
               IF l_glad034 = 'Y' THEN
                  LET g_tmp.glaq010 = 0
               ELSE
                 #CALL s_ld_sel_glaa(p_apcald,'glaa001') RETURNING g_sub_success,g_tmp.glaq005  #170430-00006#2 mark
                  #SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add   #170907-00051#1 mark
                  SELECT glaa001 INTO g_tmp.glaq005 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_tmp.glaqld                  #170907-00051#1 add
                  LET g_tmp.glaq006 = 1
               END IF
               #151216-00008#3 add end---
               
               CALL s_aapp330_set_glaq002()
               IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
               IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
               
               #190522-00006#1 add(s)
               #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
               IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                  CALL s_fin_get_scc_value('8035','P40','3')RETURNING l_prog
                  CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1') RETURNING g_tmp.glaq001
               END IF
               #190522-00006#1 add(e)
               
              #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
               #161111-00048#2 --s add
               #170430-00006#2---mark---start---
               #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
               #                          glaqld,glaq001,glaq002,glaq005,glaq006,
               #                          glaq007,glaq008,glaq009,glaq011,glaq012,
               #                          glaq013,glaq014,glaq015,glaq016,glaq017,
               #                          glaq018,glaq019,glaq020,glaq021,glaq022,
               #                          glaq023,glaq024,glaq025,glaq026,glaq027,
               #                          glaq028,glaq051,glaq052,glaq053,glaq029,
               #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
               #                          glaq035,glaq036,glaq037,glaq038,d,        
               #                          c,sum,glaq039,glaq040,glaq041,  
               #                          glaq042,glaq043,glaq044,docseq,source,   
               #                          glaqseq,xrca039,apcb022,key1,key2,     
               #                          type,glaq010,apcb023,glgb055,red)      
               #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
               #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
               #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
               #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
               #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
               #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
               #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
               #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
               #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
               #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
               #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
               #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
               #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
               #170430-00006#2---mark---end---
               LET l_flag2 ='2'     #180227-00043#3  add
               #180423-00029#1 add ------
               IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
               IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
               #180423-00029#1 add end---
               LET g_tmp.red = g_dfin1002 #180808-00013#1 add
               #170430-00006#2---add--start---
               EXECUTE s_aapp330_ins_voucher_tmp_p USING
                       g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                      #g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red              #180227-00043#3 mark
                       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,l_flag2      #180227-00043#3 add                       
               #170430-00006#2---add---end---
               #161111-00048#2 --e add
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert s_voucher_tmp'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  RETURN r_success
               END IF
            END FOREACH
       
       WHEN '96' #貸：應付科目
          FOREACH gen_ap_1_c96 USING p_apcadocno INTO g_tmp.*
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'foreach gen_ap_1_c96'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
#             #200408-00070#1---mark---str
#             #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#             #200408-00070#1---mark---end
             #SELECT xreh004 INTO l_xreh004
             #  FROM xreh_t
             # WHERE xrehent   = g_enterprise
             #   AND xrehdocno = p_apcadocno
             #   AND xrehseq   = g_tmp.docseq
             #IF l_xreh004 MATCHES '0[24]' THEN
             #   LET g_tmp.d = g_tmp.d * -1
             #END IF
             #20150227--add--str--
             #若為負數金額,則借貸方向要相反
             IF g_tmp.c < 0 THEN 
                LET g_tmp.sw = '1'
                LET g_tmp.d = g_tmp.c * -1
                LET g_tmp.c = 0
                LET g_tmp.glaq040 = g_tmp.glaq041 * -1
                LET g_tmp.glaq041 = 0
                LET g_tmp.glaq043 = g_tmp.glaq044 * -1
                LET g_tmp.glaq044 = 0
             END IF
             ##如果重評價設定(agli171)成依幣別彙總，彙總時幣別再給本幣這邊先不給
             #IF l_glab011 <> '3' THEN  #3:依幣別匯總  #150825-00004#9 #151203-00013#3 mark
               #CALL s_ld_sel_glaa(p_apcald,'glaa001') RETURNING g_sub_success,l_glaa001        #170430-00006#2 mark
                #SELECT glaa001 INTO l_glaa001 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add   #170907-00051#1 mark
                SELECT glaa001 INTO l_glaa001 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_tmp.glaqld                  #170907-00051#1 add
               #LET g_tmp.glaq006 = 1 #151216-00008#3 mark
             #END IF  #150825-00004#9  #151203-00013#3 mark
             IF l_glaa001 <> g_tmp.glaq005 THEN 
                LET g_tmp.glaq010 = 0
             END IF 
             #20150227--add--end--
             CALL s_aapp330_set_glaq002()
             IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
             IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
             
             #190522-00006#1 add(s)
             #類型/賬套/科目編號/程序編號/目的字段/單據號/項次1/項次2
             IF NOT cl_null(g_tmp.glaq002) AND cl_null(g_tmp.glaq001) THEN
                CALL s_fin_get_scc_value('8035','P40','3')RETURNING l_prog
                CALL s_account_item('2',g_tmp.glaqld,g_tmp.glaq002,l_prog,'glgb001',p_apcadocno,g_tmp.docseq,'1') RETURNING g_tmp.glaq001
             END IF
             #190522-00006#1 add(e)
             
            #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
             #161111-00048#2 --s add
             #170430-00006#2---mark---start---
             #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
             #                          glaqld,glaq001,glaq002,glaq005,glaq006,
             #                          glaq007,glaq008,glaq009,glaq011,glaq012,
             #                          glaq013,glaq014,glaq015,glaq016,glaq017,
             #                          glaq018,glaq019,glaq020,glaq021,glaq022,
             #                          glaq023,glaq024,glaq025,glaq026,glaq027,
             #                          glaq028,glaq051,glaq052,glaq053,glaq029,
             #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
             #                          glaq035,glaq036,glaq037,glaq038,d,        
             #                          c,sum,glaq039,glaq040,glaq041,  
             #                          glaq042,glaq043,glaq044,docseq,source,   
             #                          glaqseq,xrca039,apcb022,key1,key2,     
             #                          type,glaq010,apcb023,glgb055,red)      
             #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
             #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
             #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
             #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
             #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
             #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
             #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
             #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
             #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
             #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
             #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
             #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
             #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
             #170430-00006#2---mark---end---
             LET l_flag2 ='1'     #180227-00043#3  add
             #180423-00029#1 add ------
             IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
             IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
             #180423-00029#1 add end---
             LET g_tmp.red = g_dfin1002 #180808-00013#1 add
             #170430-00006#2---add--start---
             EXECUTE s_aapp330_ins_voucher_tmp_p USING
                     g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                     g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                     g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                     g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                     g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                     g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                     g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                     g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                     g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                     g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                     g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                     g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                    #g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red              #180227-00043#3 mark         
                     g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,l_flag2      #180227-00043#3 add
             #170430-00006#2---add---end---
             #161111-00048#2 --e add
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'insert s_voucher_tmp'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
          END FOREACH
       WHEN '9a'
          FOREACH gen_ap_1_c9a USING p_apcadocno INTO g_tmp.*
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'foreach gen_ap_1_c9a'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
#            #200408-00070#1---mark---str 
#             #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#             #200408-00070#1---mark---end
             CALL s_aapp330_set_glaq002()  
             IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
             IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
            #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
             #161111-00048#2 --s add
             #170430-00006#2---mark---start---
             #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
             #                          glaqld,glaq001,glaq002,glaq005,glaq006,
             #                          glaq007,glaq008,glaq009,glaq011,glaq012,
             #                          glaq013,glaq014,glaq015,glaq016,glaq017,
             #                          glaq018,glaq019,glaq020,glaq021,glaq022,
             #                          glaq023,glaq024,glaq025,glaq026,glaq027,
             #                          glaq028,glaq051,glaq052,glaq053,glaq029,
             #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
             #                          glaq035,glaq036,glaq037,glaq038,d,        
             #                          c,sum,glaq039,glaq040,glaq041,  
             #                          glaq042,glaq043,glaq044,docseq,source,   
             #                          glaqseq,xrca039,apcb022,key1,key2,     
             #                          type,glaq010,apcb023,glgb055,red)      
             #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
             #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
             #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
             #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
             #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
             #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
             #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
             #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
             #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
             #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
             #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
             #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
             #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
             #170430-00006#2---mark---end---
             #180423-00029#1 add ------
             IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
             IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
             #180423-00029#1 add end---
             #170430-00006#2---add--start---
             EXECUTE s_aapp330_ins_voucher_tmp_p USING
                     g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                     g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                     g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                     g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                     g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                     g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                     g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                     g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                     g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                     g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                     g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                     g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                     g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                    ,''           #180621-00040#1 add
             #170430-00006#2---add---end---
             #161111-00048#2 --e add             
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'insert s_voucher_tmp'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success                   
             END IF               
          END FOREACH  
                     
       WHEN '9b'
          FOREACH gen_ap_1_c9b USING p_apcadocno INTO g_tmp.*
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'foreach gen_ap_1_c9b'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success
             END IF
#            #200408-00070#1---mark---str
#            #171221-00005#1---add---str
#                  CALL s_pre_voucher_glad034_get(g_tmp.glaqld,g_tmp.glaq002) RETURNING l_glad034
#                  #科目未啟用多幣別管理
#                  IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
#                     CALL s_ld_sel_glaa(g_tmp.glaqld,'glaa001') RETURNING r_success,g_tmp.glaq005
#                     LET g_tmp.glaq006 = 1
#                     IF g_tmp.d <> 0 THEN
#                        LET g_tmp.sum = g_tmp.d
#                     END IF
#                     IF g_tmp.c <> 0 THEN
#                        LET g_tmp.sum = g_tmp.c
#                     END IF 
#                     LET g_tmp.glaq010 = g_tmp.sum #180912-00033#1 add
#                  END IF
#                  #171221-00005#1---add---end
#            #200408-00070#1---mark---end
             CALL s_aapp330_set_glaq002()  
             IF cl_null(g_tmp.key1) THEN LET g_tmp.key1 = '#@!' END IF
             IF cl_null(g_tmp.key2) THEN LET g_tmp.key2 = '!@#' END IF
            #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
             #161111-00048#2 --s add
             #170430-00006#2---mark---start---
             #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
             #                          glaqld,glaq001,glaq002,glaq005,glaq006,
             #                          glaq007,glaq008,glaq009,glaq011,glaq012,
             #                          glaq013,glaq014,glaq015,glaq016,glaq017,
             #                          glaq018,glaq019,glaq020,glaq021,glaq022,
             #                          glaq023,glaq024,glaq025,glaq026,glaq027,
             #                          glaq028,glaq051,glaq052,glaq053,glaq029,
             #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
             #                          glaq035,glaq036,glaq037,glaq038,d,        
             #                          c,sum,glaq039,glaq040,glaq041,  
             #                          glaq042,glaq043,glaq044,docseq,source,   
             #                          glaqseq,xrca039,apcb022,key1,key2,     
             #                          type,glaq010,apcb023,glgb055,red)      
             #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
             #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
             #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
             #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
             #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
             #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
             #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
             #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
             #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
             #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
             #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
             #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
             #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
             #170430-00006#2---mark---end---
             #180423-00029#1 add ------
             IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
             IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
             #180423-00029#1 add end---
             #170430-00006#2---add--start---
             EXECUTE s_aapp330_ins_voucher_tmp_p USING
                     g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                     g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                     g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                     g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                     g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                     g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                     g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                     g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                     g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                     g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                     g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                     g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                     g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                    ,''           #180621-00040#1 add
             #170430-00006#2---add---end---
             #161111-00048#2 --e add               
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'insert s_voucher_tmp'
                LET g_errparam.popup = FALSE
                CALL cl_err()
                RETURN r_success                   
             END IF               
          END FOREACH         
   END CASE
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 寫入彙總資料
# Memo...........:
# Date & Author..: 14/07/18 By Belle
# Modify.........: 180808-00051#1 add p_acctype
#                : 201207-00021#1 add p_groupglbc
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_1_ins_group_tmp(p_ld,p_sum_type,p_acctype,p_groupglbc)
DEFINE p_ld             LIKE glaa_t.glaald
DEFINE p_sum_type       LIKE type_t.chr1
DEFINE p_acctype        LIKE type_t.chr1 #180808-00051#1 add
DEFINE p_groupglbc      LIKE type_t.chr1 #201207-00021#1 add
DEFINE r_success        LIKE type_t.num5
#DEFINE l_apca           RECORD LIKE apca_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_apca RECORD  #應付憑單單頭
       apcaent LIKE apca_t.apcaent, #企業編號
       apcaownid LIKE apca_t.apcaownid, #資料所有者
       apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
       apcacrtid LIKE apca_t.apcacrtid, #資料建立者
       apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
       apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
       apcamodid LIKE apca_t.apcamodid, #資料修改者
       apcamoddt LIKE apca_t.apcamoddt, #最近修改日
       apcacnfid LIKE apca_t.apcacnfid, #資料確認者
       apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
       apcapstid LIKE apca_t.apcapstid, #資料過帳者
       apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
       apcastus LIKE apca_t.apcastus, #狀態碼
       apcald LIKE apca_t.apcald, #帳套
       apcacomp LIKE apca_t.apcacomp, #法人
       apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
       apcadocdt LIKE apca_t.apcadocdt, #帳款日期
       apcasite LIKE apca_t.apcasite, #帳務中心
       apca001 LIKE apca_t.apca001, #帳款單性質
       apca003 LIKE apca_t.apca003, #帳務人員
       apca004 LIKE apca_t.apca004, #帳款對象編號
       apca005 LIKE apca_t.apca005, #付款對象
       apca006 LIKE apca_t.apca006, #供應商分類
       apca007 LIKE apca_t.apca007, #帳款類別
       apca008 LIKE apca_t.apca008, #付款條件編號
       apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
       apca010 LIKE apca_t.apca010, #容許票據到期日
       apca011 LIKE apca_t.apca011, #稅別
       apca012 LIKE apca_t.apca012, #稅率
       apca013 LIKE apca_t.apca013, #含稅否
       apca014 LIKE apca_t.apca014, #人員編號
       apca015 LIKE apca_t.apca015, #部門編號
       apca016 LIKE apca_t.apca016, #來源作業類型
       apca017 LIKE apca_t.apca017, #產生方式
       apca018 LIKE apca_t.apca018, #來源參考單號
       apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
       apca020 LIKE apca_t.apca020, #信用狀付款否
       apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
       apca022 LIKE apca_t.apca022, #進口報單號碼
       apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
       apca026 LIKE apca_t.apca026, #原幣未稅差異
       apca027 LIKE apca_t.apca027, #原幣稅額差異
       apca028 LIKE apca_t.apca028, #本幣未稅差異
       apca029 LIKE apca_t.apca029, #本幣幣稅額差異
       apca030 LIKE apca_t.apca030, #差異科目
       apca031 LIKE apca_t.apca031, #產生之差異折讓單號
       apca032 LIKE apca_t.apca032, #發票類型
       apca033 LIKE apca_t.apca033, #專案編號
       apca034 LIKE apca_t.apca034, #責任中心
       apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
       apca036 LIKE apca_t.apca036, #費用(借方)科目編號
       apca037 LIKE apca_t.apca037, #產生傳票否
       apca038 LIKE apca_t.apca038, #拋轉傳票號碼
       apca039 LIKE apca_t.apca039, #會計檢核附件份數
       apca040 LIKE apca_t.apca040, #留置否
       apca041 LIKE apca_t.apca041, #留置理由碼
       apca042 LIKE apca_t.apca042, #留置設定日期
       apca043 LIKE apca_t.apca043, #留置解除日期
       apca044 LIKE apca_t.apca044, #留置原幣金額
       apca045 LIKE apca_t.apca045, #留置說明
       apca046 LIKE apca_t.apca046, #關係人否
       apca047 LIKE apca_t.apca047, #多角序號
       apca048 LIKE apca_t.apca048, #集團代付/代付單號
       apca049 LIKE apca_t.apca049, #來源營運中心編號
       apca050 LIKE apca_t.apca050, #交易原始單據份數
       apca051 LIKE apca_t.apca051, #作廢理由碼
       apca052 LIKE apca_t.apca052, #列印次數
       apca053 LIKE apca_t.apca053, #備註
       apca054 LIKE apca_t.apca054, #多帳期設定
       apca055 LIKE apca_t.apca055, #繳款優惠條件
       apca056 LIKE apca_t.apca056, #會計檢核附件狀態
       apca057 LIKE apca_t.apca057, #交易對象識別碼
       apca058 LIKE apca_t.apca058, #稅別交易類型
       apca059 LIKE apca_t.apca059, #預算編號
       apca060 LIKE apca_t.apca060, #發票開立方式
       apca061 LIKE apca_t.apca061, #預開發票基準日
       apca062 LIKE apca_t.apca062, #多角性質
       apca063 LIKE apca_t.apca063, #整帳批序號
       apca064 LIKE apca_t.apca064, #訂金序次
       apca065 LIKE apca_t.apca065, #發票編號
       apca066 LIKE apca_t.apca066, #發票號碼
       apca100 LIKE apca_t.apca100, #交易原幣別
       apca101 LIKE apca_t.apca101, #原幣匯率
       apca103 LIKE apca_t.apca103, #原幣未稅金額
       apca104 LIKE apca_t.apca104, #原幣稅額
       apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
       apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
       apca108 LIKE apca_t.apca108, #原幣應付金額
       apca113 LIKE apca_t.apca113, #本幣未稅金額
       apca114 LIKE apca_t.apca114, #本幣稅額
       apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
       apca117 LIKE apca_t.apca117, #NO USE
       apca118 LIKE apca_t.apca118, #本幣應付金額
       apca120 LIKE apca_t.apca120, #本位幣二幣別
       apca121 LIKE apca_t.apca121, #本位幣二匯率
       apca123 LIKE apca_t.apca123, #本位幣二未稅金額
       apca124 LIKE apca_t.apca124, #本位幣二稅額
       apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
       apca127 LIKE apca_t.apca127, #NO USE
       apca128 LIKE apca_t.apca128, #本位幣二應付金額
       apca130 LIKE apca_t.apca130, #本位幣三幣別
       apca131 LIKE apca_t.apca131, #本位幣三匯率
       apca133 LIKE apca_t.apca133, #本位幣三未稅金額
       apca134 LIKE apca_t.apca134, #本位幣三稅額
       apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
       apca137 LIKE apca_t.apca137, #NO USE
       apca138 LIKE apca_t.apca138, #本位幣三應付金額
       apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
       apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
       apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
       apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
       apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
       apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
       apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
       apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
       apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
       apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
       apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
       apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
       apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
       apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
       apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
       apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
       apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
       apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
       apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
       apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
       apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
       apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
       apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
       apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
       apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
       apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
       apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
       apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
       apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
       apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
       apca067 LIKE apca_t.apca067, #管理品類
       apca068 LIKE apca_t.apca068, #經營方式
       apca069 LIKE apca_t.apca069, #no use
       apca070 LIKE apca_t.apca070, #no use
       apca071 LIKE apca_t.apca071, #no use
       apca072 LIKE apca_t.apca072, #no use
       apca073 LIKE apca_t.apca073  #L/C No.
END RECORD
#161111-00048#2 --e add
DEFINE l_sql            STRING
DEFINE l_glaq002        LIKE glaq_t.glaq002
DEFINE l_field          STRING
DEFINE l_field1         STRING
DEFINE l_str            STRING
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_glac016        LIKE glac_t.glac016
##160707-00030#1 albireo 160707-----s
#DEFINE l_glaa001        LIKE glaa_t.glaa001  #180208-00014#1 mark
DEFINE l_docno          LIKE apca_t.apcadocno
DEFINE l_apca100        LIKE apca_t.apca100
DEFINE l_apca108        LIKE apca_t.apca108
DEFINE l_apcc109sum     LIKE apcc_t.apcc109
DEFINE l_diff109        LIKE apcc_t.apcc109
DEFINE l_tmpsum         LIKE apcc_t.apcc109
DEFINE l_apcb029        LIKE apcb_t.apcb029
##160707-00030#1 albireo 160707-----e
DEFINE l_apce109        LIKE apce_t.apce109   #170117-00032#1 add
DEFINE l_glac008        LIKE glac_t.glac008   #170430-00006#2 add 
#180227-00043#3 add-s
DEFINE l_glca009       LIKE glca_t.glca009 
DEFINE l_sum           LIKE glaq_t.glaq003    
DEFINE l_glab005       LIKE glab_t.glab005   #收益科目
DEFINE l_glab005_2     LIKE glab_t.glab005   #损失科目
DEFINE l_flag2         LIKE type_t.chr1     #'1'账款科目资料，‘2’重评价科目资料
DEFINE l_glaa004       like glaa_t.glaa004  
DEFINE l_glaqdocno     LIKE glaq_t.glaqdocno #180808-00051#1 add
#180227-00043#3 add-e
DEFINE l_glad034       LIKE glad_t.glad034   #200408-00070#1--add
#200605-00130#2 --s add
DEFINE l_glaacomp  LIKE glaa_t.glaacomp
DEFINE l_sfin0003  LIKE type_t.chr1  
DEFINE l_count     LIKE type_t.num5
#200605-00130#2 --e add

   WHENEVER ERROR CONTINUE
   
   LET r_success  = FALSE
   DELETE FROM s_voucher_tmp WHERE type = '2';
   #170727-00005#1--mark--str--lujh
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010) * -1
   # WHERE d > 0 AND  type = '1'
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010)
   # WHERE c > 0 AND  type = '1'
   #170727-00005#1--mark--end--lujh 
   
   #170810-00013#1 mark-----s
   ##170727-00005#1--add--str--lujh
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010) * -1
   # WHERE d * apcb022 > 0 AND  type = '1'
   #
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010)
   # WHERE d * apcb022 < 0 AND  type = '1'
   #
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010)
   # WHERE c * apcb022 > 0 AND  type = '1'
   #
   #UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010) * -1
   # WHERE c * apcb022 < 0 AND  type = '1'
   ##170727-00005#1--add--end--lujh
   #170810-00013#1 mark-----e
   
   #170810-00013#1-----s
   UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010) * -1
    WHERE d > 0 AND  type = '1'
   
   UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010)
    WHERE d < 0 AND  type = '1'
   
   UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010)
    WHERE c > 0 AND  type = '1'
   
   UPDATE s_voucher_tmp SET glaq010 = ABS(glaq010) * -1
    WHERE c < 0 AND  type = '1'   
   #170810-00013#1-----e
   
   ##160707-00030#1 albireo 160707-----s
   LET l_diff109 = 0 
   #180208-00014#1-s mark
   #LET l_glaa001 = NULL
   #SELECT glaa001 INTO l_glaa001 FROM glaa_t
   # WHERE glaaent = g_enterprise
   #   AND glaald = p_ld
   #180208-00014#1-e mark
   LET l_docno = NULL
   SELECT DISTINCT docno INTO l_docno
     FROM s_voucher_tmp
    WHERE type = '1'
   LET l_apca100 = NULL   LET l_apca108 = NULL
   #161228-00064#1 add ------
   #IF g_prog = 'aapt330' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapt330*' THEN   #170301-00021#1 by 09263 --add
   #aapt330走這>>aapt330付款給員工，是用本幣支付，所以換算至本幣，尾差也要用本幣看
      SELECT apca100 ,apca118
        INTO l_apca100 ,l_apca108
        FROM apca_t
       WHERE apcaent = g_enterprise
         AND apcald = p_ld
         AND apcadocno = l_docno
   ELSE
   #161228-00064#1 add ------
      SELECT apca100 ,apca108
        INTO l_apca100 ,l_apca108
        FROM apca_t
       WHERE apcaent = g_enterprise
         AND apcald = p_ld
         AND apcadocno = l_docno
   END IF  #161228-00064#1
   IF cl_null(l_apca108)THEN LET l_apca108 = 0 END IF
   IF NOT cl_null(l_apca100)THEN
     #IF l_apca100 <> l_glaa001 THEN  #180208-00014#1 mark
      IF l_apca100 <> g_glaa001 THEN  #180208-00014#1
         #單頭幣別與本位幣不同時做
         LET l_apcc109sum = NULL
         #161228-00064#1 add ------
         #IF g_prog = 'aapt330' THEN   #170301-00021#1 by 09263 --mark
         IF g_prog MATCHES 'aapt330*' THEN #170301-00021#1 by 09263 --add
         #aapt330走這>>aapt330付款給員工，是用本幣支付，所以換算至本幣，尾差也要用本幣看
            SELECT SUM(apcc119) INTO l_apcc109sum FROM apcc_t
             WHERE apccent = g_enterprise
               AND apccld = p_ld
               AND apccdocno = l_docno
         ELSE
         #161228-00064#1 add ------
            SELECT SUM(apcc109) INTO l_apcc109sum FROM apcc_t
             WHERE apccent = g_enterprise
               AND apccld = p_ld
               AND apccdocno = l_docno
               
             #180813-00039#1 --s add 把存在已核銷金額加回來,讓該分錄僅呈現當下這張單據上的金額內容
             LET l_apce109= 0
             SELECT SUM(apce109) INTO l_apce109
               FROM apda_t,apce_t 
              WHERE apdaent = apceent AND apdald = apceld AND apdadocno = apcedocno 
                AND apdaent = g_enterprise AND apdald = p_ld
                AND apce003 =l_docno AND apdastus='Y' 
                AND apda001 <> '43'               
             IF cl_null(l_apce109)THEN LET l_apce109 = 0 END IF
             LET l_apca108 = l_apca108 +l_apce109
             #180813-00039#1 --e add               
               
         END IF #161228-00064#1
         IF cl_null(l_apcc109sum)THEN LET l_apcc109sum = 0 END IF
         
         LET l_diff109 = l_apca108 - l_apcc109sum 
         
         IF l_diff109 != 0 THEN   #161215-00064#1 add
            LET l_tmpsum = NULL
            #SELECT SUM(glaq010) INTO l_tmpsum       #161104-00038#1 mark
            SELECT ABS(SUM(glaq010)) INTO l_tmpsum   #161104-00038#1 add
              FROM s_voucher_tmp
             WHERE glaq002 IN(SELECT apcb029 FROM apcb_t WHERE apcbent = g_enterprise AND apcbld = p_ld AND apcbdocno = l_docno)
               AND source != 'apcf'   #180424-00003#1 add
               #AND c > 0  #200408-00070#1--add---防止单身同一个项次借贷科目一样 #200428-00028#1 mark
               AND glaqseq = '100' #200428-00028#1 add 避免直接付款有金額時 會導致分錄原幣金額錯誤
            IF cl_null(l_tmpsum)THEN LET l_tmpsum = 0 END IF
            
            #170117-00032#1---add---str--
            LET l_apcb029 = NULL
            SELECT DISTINCT apcb029 INTO l_apcb029 FROM apcb_t
             WHERE apcbent = g_enterprise
               AND apcbld = p_ld
               AND apcbdocno = l_docno
               
            LET l_apce109 = 0   
            SELECT SUM(apce109) INTO l_apce109
              FROM apce_t
             WHERE apceent = g_enterprise
               AND apceld = p_ld
               AND apcedocno = l_docno
               AND apce016 = l_apcb029
            IF cl_null(l_apce109) THEN LET l_apce109 = 0 END IF
               
            LET l_tmpsum = l_tmpsum - l_apce109
            #170117-00032#1---add---end--
            
            DISPLAY "l_tmpsum:",l_tmpsum
            LET l_diff109 = l_diff109 - l_tmpsum
         END IF   #161215-00064#1 add
         
         #170117-00032#1---mark---str--
         #LET l_apcb029 = NULL
         #SELECT DISTINCT apcb029 INTO l_apcb029 FROM apcb_t
         # WHERE apcbent = g_enterprise
         #   AND apcbld = p_ld
         #   AND apcbdocno = l_docno
         #170117-00032#1---mark---end--   
         
      END IF
   END IF
   ##160707-00030#1 albireo 160707-----e
    
   #170824-00024#1---add---str--
   LET l_cnt = 0
   SELECT COUNT(DISTINCT docno) INTO l_cnt
     FROM s_voucher_tmp
    WHERE type = '1'
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 1 THEN
      LET l_diff109 = 0
   END IF
   #170824-00024#1---add---end-- 
  
   
  #FOREACH gen_ap_1_c20 INTO l_glaq002              #180808-00051#1 mark
   FOREACH gen_ap_1_c20 INTO l_glaqdocno,l_glaq002  #180808-00051#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c20'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF  
     
      IF cl_null(l_glaq002) THEN CONTINUE FOREACH END IF
      
      #EXECUTE gen_ap_1_c01 USING l_glaq002 INTO g_glad.*   #161208-00026#23   mark
      #161208-00026#23   add---s
      EXECUTE gen_ap_1_c01 USING l_glaq002 
         INTO g_glad.gladent,g_glad.gladownid,g_glad.gladowndp,g_glad.gladcrtid,g_glad.gladcrtdp,
              g_glad.gladcrtdt,g_glad.gladmodid,g_glad.gladmoddt,g_glad.gladstus,g_glad.gladld,
              g_glad.glad001,g_glad.glad002,g_glad.glad003,g_glad.glad004,g_glad.glad005,
              g_glad.glad006,g_glad.glad007,g_glad.glad008,g_glad.glad009,g_glad.glad010,
              g_glad.glad011,g_glad.glad012,g_glad.glad013,g_glad.glad014,g_glad.glad015,
              g_glad.glad016,g_glad.glad017,g_glad.glad0171,g_glad.glad0172,g_glad.glad018,
              g_glad.glad0181,g_glad.glad0182,g_glad.glad019,g_glad.glad0191,g_glad.glad0192,
              g_glad.glad020,g_glad.glad0201,g_glad.glad0202,g_glad.glad021,g_glad.glad0211,
              g_glad.glad0212,g_glad.glad022,g_glad.glad0221,g_glad.glad0222,g_glad.glad023,
              g_glad.glad0231,g_glad.glad0232,g_glad.glad024,g_glad.glad0241,g_glad.glad0242,
              g_glad.glad025,g_glad.glad0251,g_glad.glad0252,g_glad.glad026,g_glad.glad0261,
              g_glad.glad0262,g_glad.glad027,g_glad.glad030,g_glad.glad031,g_glad.glad032,
              g_glad.glad033,g_glad.glad034,g_glad.gladud001,g_glad.gladud002,g_glad.gladud003,
              g_glad.gladud004,g_glad.gladud005,g_glad.gladud006,g_glad.gladud007,g_glad.gladud008,
              g_glad.gladud009,g_glad.gladud010,g_glad.gladud011,g_glad.gladud012,g_glad.gladud013,
              g_glad.gladud014,g_glad.gladud015,g_glad.gladud016,g_glad.gladud017,g_glad.gladud018,
              g_glad.gladud019,g_glad.gladud020,g_glad.gladud021,g_glad.gladud022,g_glad.gladud023,
              g_glad.gladud024,g_glad.gladud025,g_glad.gladud026,g_glad.gladud027,g_glad.gladud028,
              g_glad.gladud029,g_glad.gladud030,g_glad.glad035,g_glad.glad036
              ,l_glac016,l_glac008          #170430-00006#2 add
      #161208-00026#23   add---e
     #--170808-00064#1 mark start--
     #IF p_sum_type <> '5' THEN #170214-00042#1
     
     #180319-00030#1 add-s
     #取glca009参数
     SELECT glca009 INTO l_glca009 FROM glca_t 
      WHERE glcaent=g_enterprise AND glcald=p_ld AND glca001='AP'
     #取科目的flag 判断科目是否为重评价科目
     #PGS(D)-10043-mark-S-
     #SELECT DISTINCT flag INTO l_flag2 FROM s_voucher_tmp 
     # WHERE TYPE = '1' AND glaq002 =l_glaq002
     #PGS(D)-10043-mark-E-
     #PGS(D)-10043-add-S-
     SELECT flag INTO l_flag2 FROM s_voucher_tmp 
      WHERE TYPE = '1' AND glaq002 =l_glaq002 AND rownum = 1
     #PGS(D)-10043-add-E-
     #agli171勾选“汇差已净额产生分录”时，重评价科目若沒有勾客商碼,不要強制給
     IF g_prog MATCHES 'aapt920*' AND l_glca009='Y' and l_flag2='2' THEN
               
     ELSE 
     #180319-00030#1 add-e
       LET g_glad.glad010 = 'Y' #170918-00040#1 remark
       LET g_glad.glad027 = 'Y' #170918-00040#1 remark
     END IF #180319-00030#1 add
     #END IF  #170214-00042#1
     #--170808-00064 mark end--
      
      LET l_field1 = "key1" 
      IF g_glad.glad005 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq007" END IF   #数量/金额管理
      IF g_glad.glad007 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq018" END IF   #部门管理
      IF g_glad.glad008 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq019" END IF   #利润成本管理
      IF g_glad.glad009 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq020" END IF   #区域管理
      IF g_glad.glad010 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq021" END IF   #客群管理
      
      IF g_glad.glad027 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq022" END IF   #
      IF g_glad.glad011 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq023" END IF   #
      IF g_glad.glad012 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq024" END IF   #产品类别管理
      IF g_glad.glad013 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq025" END IF   #人员管理
      IF g_glad.glad015 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq027" END IF   #专案管理
      
      IF g_glad.glad016 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq028" END IF   #WBS管理
      IF g_glad.glad031 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq051" END IF   #經營方式
      IF g_glad.glad032 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq052" END IF   #渠道
      IF g_glad.glad033 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq053" END IF   #品牌
      
      IF g_glad.glad017 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq029" END IF   #自由核算项1
      IF g_glad.glad018 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq030" END IF   #自由核算项2
      IF g_glad.glad019 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq031" END IF   #自由核算项3
      IF g_glad.glad020 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq032" END IF   #自由核算项4
      IF g_glad.glad021 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq033" END IF   #自由核算项5
      
      IF g_glad.glad022 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq034" END IF   #自由核算项6
      IF g_glad.glad023 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq035" END IF   #自由核算项7
      IF g_glad.glad024 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq036" END IF   #自由核算项8
      IF g_glad.glad025 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq037" END IF   #自由核算项9
      IF g_glad.glad026 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq038" END IF   #自由核算项10
      #180208-00035#1-s
      IF g_glaa015 = 'Y'      THEN LET l_field1 = l_field1 CLIPPED,",glaq039" END IF   #匯率(本位幣二)
      IF g_glaa019 = 'Y'      THEN LET l_field1 = l_field1 CLIPPED,",glaq042" END IF   #匯率(本位幣三)
      #180208-00035#1-e
     #170430-00006#2---mark---start---
     ##150209-00008#2--(S)
     #SELECT glac016 INTO l_glac016 
     #  FROM glac_t
     # WHERE glacent = g_enterprise
     #   AND glac001 = g_glaa004
     #   AND glac002 = l_glaq002
     #170430-00006#2---mark---end---
     
      #IF l_glac016 = 'Y' THEN #201207-00021#1 mark
      IF l_glac016 = 'Y' AND p_groupglbc = 'Y' THEN #201207-00021#1 add
         LET l_field1 = l_field1 CLIPPED,",glgb055"
      END IF
      #150209-00008#2--(E)
      LET l_field = ""
      CALL s_aapp330_set_sqlstr(g_glad.glad005,'glaq007',l_field) RETURNING l_field
      CALL s_aapp330_set_sqlstr(g_glad.glad005,'SUM(glaq008)',l_field) RETURNING l_field
      LET l_field = l_field CLIPPED,"'','','','','','','',glaq017,"       #glaq009~glaq017  
      CALL s_aapp330_set_sqlstr(g_glad.glad007,'glaq018',l_field) RETURNING l_field  #部门管理
      CALL s_aapp330_set_sqlstr(g_glad.glad008,'glaq019',l_field) RETURNING l_field  #利润成本管理
      CALL s_aapp330_set_sqlstr(g_glad.glad009,'glaq020',l_field) RETURNING l_field  #区域管理
      CALL s_aapp330_set_sqlstr(g_glad.glad010,'glaq021',l_field) RETURNING l_field  #交易客商
      
      CALL s_aapp330_set_sqlstr(g_glad.glad027,'glaq022',l_field) RETURNING l_field  #
      CALL s_aapp330_set_sqlstr(g_glad.glad011,'glaq023',l_field) RETURNING l_field  #客群管理
      CALL s_aapp330_set_sqlstr(g_glad.glad012,'glaq024',l_field) RETURNING l_field  #产品类别管理
      CALL s_aapp330_set_sqlstr(g_glad.glad013,'glaq025',l_field) RETURNING l_field  #人员管理
      LET l_field = l_field CLIPPED,"'',"      
      CALL s_aapp330_set_sqlstr(g_glad.glad015,'glaq027',l_field) RETURNING l_field  #专案管理
      
      CALL s_aapp330_set_sqlstr(g_glad.glad016,'glaq028',l_field) RETURNING l_field  #WBS管理
      CALL s_aapp330_set_sqlstr(g_glad.glad031,'glaq051',l_field) RETURNING l_field  #經營方式
      CALL s_aapp330_set_sqlstr(g_glad.glad032,'glaq052',l_field) RETURNING l_field  #渠道
      CALL s_aapp330_set_sqlstr(g_glad.glad033,'glaq053',l_field) RETURNING l_field  #品牌  
      
      CALL s_aapp330_set_sqlstr(g_glad.glad017,'glaq029',l_field) RETURNING l_field  #自由核算项1
      CALL s_aapp330_set_sqlstr(g_glad.glad018,'glaq030',l_field) RETURNING l_field  #自由核算项2
      CALL s_aapp330_set_sqlstr(g_glad.glad019,'glaq031',l_field) RETURNING l_field  #自由核算项3
      CALL s_aapp330_set_sqlstr(g_glad.glad020,'glaq032',l_field) RETURNING l_field  #自由核算项4
      CALL s_aapp330_set_sqlstr(g_glad.glad021,'glaq033',l_field) RETURNING l_field  #自由核算项5
      
      CALL s_aapp330_set_sqlstr(g_glad.glad022,'glaq034',l_field) RETURNING l_field  #自由核算项6
      CALL s_aapp330_set_sqlstr(g_glad.glad023,'glaq035',l_field) RETURNING l_field  #自由核算项7
      CALL s_aapp330_set_sqlstr(g_glad.glad024,'glaq036',l_field) RETURNING l_field  #自由核算项8
      CALL s_aapp330_set_sqlstr(g_glad.glad025,'glaq037',l_field) RETURNING l_field  #自由核算项9
      CALL s_aapp330_set_sqlstr(g_glad.glad026,'glaq038',l_field) RETURNING l_field  #自由核算项10
      #180208-00014#1-s
      CALL s_aapp330_set_sqlstr(g_glaa015     ,'glaq039',l_field) RETURNING l_field  #匯率(本位幣二)
      CALL s_aapp330_set_sqlstr(g_glaa019     ,'glaq042',l_field) RETURNING l_field  #匯率(本位幣三)
      #180208-00014#1-e
      #CALL s_aapp330_set_sqlstr(l_glac016     ,'glgb055',l_field) RETURNING l_field  #現金變動碼 #201207-00021#1 mark
      #201207-00021#1 add ---s
      IF p_groupglbc = 'Y' THEN
         CALL s_aapp330_set_sqlstr(l_glac016     ,'glgb055',l_field) RETURNING l_field
      ELSE
         LET l_field = l_field,"'',"
      END IF
      #201207-00021#1 add ---e
            
      CASE p_sum_type
           WHEN '1'  
               LET l_sql = "SELECT docno,docdt,"
               LET l_field1 = l_field1,",docno,docdt"
           WHEN '2'  
               LET l_sql = "SELECT ''   ,docdt,"
               LET l_field1 = l_field1,",docdt "
           WHEN '3'  
               LET l_sql = "SELECT ''   ,''   ," 
           WHEN '4'
               LET l_sql = "SELECT ''   ,docdt ," 
               LET l_field1 = l_field1,",docdt  "
           WHEN '5'
               LET l_sql = "SELECT ''   ,''   ," 
               
      END CASE
      #180808-00051#1---add---(S)
#      IF p_acctype = '1' THEN
         LET l_sql = "SELECT docno,docdt,"
 #     END IF
      #180808-00051#1---add---(E)
      #170509-00094#2---mark---start---
      #LET l_sql = l_sql ,"     '',glaqent,glaqcomp,'',glaq001,",
      #                   "glaq002,glaq005, glaq006,",l_field CLIPPED,
      #                  #"  SUM(d),SUM(c),ABS(SUM(glaq010)),",    #150616--紅沖否 Mark
      #                  #"glaq039,SUM(glaq040),SUM(glaq041),",    #150616--紅沖否 Mark
      #                  #"glaq042,SUM(glaq043),SUM(glaq044),",    #150616--紅沖否 Mark
      #                   "  CASE WHEN red = 'Y' THEN SUM(d*apcb022) ELSE SUM(d) END ,",
      #                   "  CASE WHEN red = 'Y' THEN SUM(c*apcb022) ELSE SUM(c) END ,",
      #                   "  ABS(SUM(glaq010)),",
      #                   "  glaq039,",
      #                   "  CASE WHEN red = 'Y' THEN SUM(glaq040*apcb022) ELSE SUM(glaq040) END ,",
      #                   "  CASE WHEN red = 'Y' THEN SUM(glaq041*apcb022) ELSE SUM(glaq041) END ,",
      #                   "  glaq042,",
      #                   #170222-00025#1 mark-----s
      #                   #"  CASE WHEN red = 'Y' THEN SUM(glaq042*apcb022) ELSE SUM(glaq042) END ,",
      #                   #"  CASE WHEN red = 'Y' THEN SUM(glaq043*apcb022) ELSE SUM(glaq043) END ,",
      #                   #170222-00025#1 mark-----e
      #                   #170222-00025#1-----s
      #                   "  CASE WHEN red = 'Y' THEN SUM(glaq043*apcb022) ELSE SUM(glaq043) END ,",
      #                   "  CASE WHEN red = 'Y' THEN SUM(glaq044*apcb022) ELSE SUM(glaq044) END ,",
      #                   #170222-00025#1-----e
      #                   "     '',          '',          '','','',",
      #                   "  key1 ,        key2,          '2',",
      #                   "  ABS(SUM(glaq010)),",
      #                   "  red",
      #               "  FROM s_voucher_tmp ",
      #               " WHERE type = '1' AND glaq002 = '",l_glaq002,"'",
      #               " GROUP BY glaqent,glaqcomp,glaq001,glaq002,glaq005,",
      #               "          glaq006,glaq039,glaq042,glaq017,key2,red,",l_field1
      #170509-00094#2---mark---end---
      #170509-00094#2---mark---start---
      LET l_sql = l_sql ," '',glaqent,glaqcomp,'',glaq001,",  
                         " glaq002,glaq005, glaq006,",l_field CLIPPED,
                        #" SUM(d),SUM(c),ABS(SUM(glaq010)),glaq039,SUM(glaq040),",  #180208-00035#1 mark
                        #" SUM(glaq041),glaq042,SUM(glaq043),SUM(glaq044),",        #180208-00035#1 mark
                         " SUM(d),SUM(c),ABS(SUM(glaq010)),SUM(glaq040),",  #180208-00035#1
                         " SUM(glaq041),SUM(glaq043),SUM(glaq044),",        #180208-00035#1
                         #" '','','','','',",     #171225-00015#1 mark
                         " '','',glaqseq,'','',", #171225-00015#1
                         #" key1,key2,'2',ABS(SUM(glaq010)),red",   #180227-00043#3 mark
                         " key1,key2,'2',ABS(SUM(glaq010)),red,flag",   #180227-00043#3 add
                         "  FROM s_voucher_tmp ",
                        #" WHERE type = '1' AND glaq002 = '",l_glaq002,"'", #180808-00051#1 add
                         " WHERE type = '1' AND glaq002 = '",l_glaq002,"'"  #180808-00051#1 add
      #180808-00051#1---add---(S)
      IF p_acctype = '1' THEN
         LET l_sql = l_sql , " AND docno = '",l_glaqdocno,"'"
      END IF
      LET l_sql = l_sql ,
      #180808-00051#1---add---(E)
                         " GROUP BY glaqent,glaqcomp,glaq001,glaq002,glaq005,",
                        #"          glaq006,glaq039,glaq042,glaq017,key2,red,",l_field1  #180208-00014#1 mark
                        # "          glaq006,glaq017,key2,red,",l_field1                  #180208-00014#1  #180227-00043#3 mark
                        "          glaq006,glaq017,key2,red,flag,",l_field1      #180227-00043#3 add
                        ,"         ,glaqseq" #171225-00015#1
      #180808-00051#1---add---(S)
         LET l_sql = l_sql , " ,docno,docdt"
      #180808-00051#1---add---(E)
      #170509-00094#2---mark---end---
      PREPARE gen_ap_g_p01 FROM l_sql
      DECLARE gen_ap_g_c01 CURSOR FOR gen_ap_g_p01
      FOREACH gen_ap_g_c01 INTO g_tmp.docno   ,g_tmp.docdt   ,g_tmp.sw,
                                g_tmp.glaqent,g_tmp.glaqcomp,g_tmp.glaqld,
                                g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,g_tmp.glaq007,
                                g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,g_tmp.glaq013,
                                g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,g_tmp.glaq018,
                                g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,g_tmp.glaq023,
                                g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,g_tmp.glaq028,
                                g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,g_tmp.glaq030,
                                g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,g_tmp.glaq035,
                               #180208-00035#1-s
                               #g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.glgb055,
                               #g_tmp.d      ,g_tmp.c      ,g_tmp.sum    ,g_tmp.glaq039,g_tmp.glaq040,
                               #g_tmp.glaq041,g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,
                                g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.glaq039,g_tmp.glaq042,
                                g_tmp.glgb055,g_tmp.d      ,g_tmp.c      ,g_tmp.sum    ,g_tmp.glaq040,
                                g_tmp.glaq041,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,
                               #180208-00035#1-e
                                g_tmp.source ,g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,
                                #g_tmp.key2   ,g_tmp.type   ,g_tmp.glaq010,g_tmp.red #180227-00043#3 mark
                                g_tmp.key2   ,g_tmp.type   ,g_tmp.glaq010,g_tmp.red,l_flag2   #180227-00043#3 add
                                
         
         #170509-00094#2---mark---start---
         #IF g_tmp.red = 'Y' THEN
         #   #150616--紅沖否
         #   IF g_tmp.d <> 0 OR g_tmp.c <> 0 THEN      #借貸任一方有值就要計算
         #      IF s_math_abs(g_tmp.d) > s_math_abs(g_tmp.c) THEN
         #         LET g_tmp.d = g_tmp.d - g_tmp.c
         #         LET g_tmp.c = 0
         #         LET g_tmp.glaq010 = s_math_abs(g_tmp.glaq010)
         #         IF g_tmp.d < 0 THEN
         #            LET g_tmp.glaq010 = g_tmp.glaq010 * -1
         #         END IF
         #      ELSE
         #         LET g_tmp.c = g_tmp.c - g_tmp.d
         #         LET g_tmp.d = 0
         #         LET g_tmp.glaq010 = s_math_abs(g_tmp.glaq010)
         #         IF g_tmp.c < 0 THEN
         #            LET g_tmp.glaq010 = g_tmp.glaq010 * -1
         #         END IF
         #      END IF
         #      LET g_tmp.sum = g_tmp.glaq010
         #   END IF
         #   #150616--紅沖否
         #170509-00094#2---mark---end---   
         #170509-00094#2---add---start---
         IF g_tmp.red = 'Y' AND g_glad.glad002 = 'Y' THEN
            IF l_glac008 = '1' THEN
               LET g_tmp.d = g_tmp.d - g_tmp.c
               LET g_tmp.c = 0
               IF g_tmp.d < 0 THEN
                  LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                  LET g_tmp.sum = g_tmp.glaq010
               END IF
            ELSE
               LET g_tmp.c = g_tmp.c - g_tmp.d
               LET g_tmp.d = 0
               IF g_tmp.c < 0 THEN
                  LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                  LET g_tmp.sum = g_tmp.glaq010
               END IF
            END IF
         #170509-00094#2---add---end---
         ELSE
            IF (g_tmp.d - g_tmp.c) > 0 THEN
               LET g_tmp.d = g_tmp.d - g_tmp.c
               LET g_tmp.c = 0
            ELSE
               LET g_tmp.c = g_tmp.c - g_tmp.d
               LET g_tmp.d = 0
            END IF
         END IF
         IF g_tmp.c = 0 AND  g_tmp.d = 0 THEN
            CONTINUE FOREACH
         END IF
         
         #180124-00020#1 --s add
         IF g_tmp.c = 0 THEN
            LET g_tmp.sw = '1'
         ELSE
            LET g_tmp.sw = '2'
         END IF
         #180124-00020#1 --e add
         
         ##160707-00030#1 albireo 160707-----s
         IF l_apcb029 = g_tmp.glaq002 THEN
            IF l_diff109 = 0 THEN
            ELSE
               LET g_tmp.sum = g_tmp.sum + l_diff109
               LET g_tmp.glaq010 = g_tmp.glaq010 + l_diff109
               LET l_diff109 = 0
            END IF
         END IF
         ##160707-00030#1 albireo 160707-----e
         
        #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
         #161111-00048#2 --s add
         #170430-00006#2---mark---start---
         #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
         #                          glaqld,glaq001,glaq002,glaq005,glaq006,
         #                          glaq007,glaq008,glaq009,glaq011,glaq012,
         #                          glaq013,glaq014,glaq015,glaq016,glaq017,
         #                          glaq018,glaq019,glaq020,glaq021,glaq022,
         #                          glaq023,glaq024,glaq025,glaq026,glaq027,
         #                          glaq028,glaq051,glaq052,glaq053,glaq029,
         #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
         #                          glaq035,glaq036,glaq037,glaq038,d,        
         #                          c,sum,glaq039,glaq040,glaq041,  
         #                          glaq042,glaq043,glaq044,docseq,source,   
         #                          glaqseq,xrca039,apcb022,key1,key2,     
         #                          type,glaq010,apcb023,glgb055,red)      
         #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
         #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
         #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
         #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
         #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
         #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
         #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
         #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
         #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
         #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
         #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
         #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
         #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
         #170430-00006#2---mark---end---
         
         #171225-00015#1 add ------
         #尋找該科目在該單最小項次
         LET g_tmp.docseq = 0
         EXECUTE s_aapp330_sel_apcbseq_p1 USING l_glaq002 INTO g_tmp.docseq
         #171225-00015#1 add end---
         
         #180423-00029#1 add ------
         IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
         IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
         #180423-00029#1 add end---
         #170430-00006#2---add--start---
         #200408-00070#1---add---str
         CALL s_pre_voucher_glad034_get(p_ld,g_tmp.glaq002) RETURNING l_glad034
         #科目未啟用多幣別管理
         IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
            CALL s_ld_sel_glaa(p_ld,'glaa001') RETURNING r_success,g_tmp.glaq005
            LET g_tmp.glaq006 = 1
            IF g_tmp.d <> 0 THEN
               LET g_tmp.sum = g_tmp.d
            END IF
            IF g_tmp.c <> 0 THEN
               LET g_tmp.sum = g_tmp.c
            END IF 
            LET g_tmp.glaq010 = g_tmp.sum
         END IF
         #200408-00070#1---add---end
         #190711-00019#1 --s add
         IF g_tmp.glaq010 < 0 THEN
            LET g_tmp.glaq008 = g_tmp.glaq008 * -1
         END IF
         LET g_tmp.glaq009 = g_tmp.glaq010/g_tmp.glaq008  
         #190711-00019#1 --e add
         #180227-00043#3 add-s
         IF g_prog MATCHES 'aapt920*' THEN
            EXECUTE s_aapp330_ins_voucher_tmp_p USING
                    g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                    g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                    g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                    g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                    g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                    g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                    g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                    g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                    g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                    g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                    g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                    g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                    g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,l_flag2 
         ELSE         
         #180227-00043#3 add-e
            EXECUTE s_aapp330_ins_voucher_tmp_p USING
                    g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                    g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                    g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                    g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                    g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                    g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                    g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                    g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                    g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                    g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                    g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                    g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                    g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,''  #180410-00038#1 add('')            
         END IF #180227-00043#3 add         
         

         #170430-00006#2---add---end---
         #161111-00048#2 --e add         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert s_voucher_tmp#2'
            LET g_errparam.popup = FALSE
            CALL cl_err()
            RETURN r_success
         END IF
      END FOREACH
   END FOREACH
   #180227-00043#3 add-s
   IF g_prog MATCHES 'aapt920*' THEN
      SELECT glca009 INTO l_glca009 FROM glca_t 
       WHERE glcaent=g_enterprise AND glcald=p_ld AND glca001='AP'
       CALL s_fin_get_glca010(p_ld,'AP') RETURNING l_glab005,l_glab005_2 #190703-00001#2 add
       IF cl_null(l_glab005) THEN #190703-00001#2 add
          #收益科目
          SELECT glab005 INTO l_glab005 FROM glab_t
           WHERE glabent=g_enterprise AND glabld=p_ld AND glab001 = '25' AND glab002 = '8318' AND glab003='8318_11'
       END IF #190703-00001#2 add
       IF cl_null(l_glab005_2) THEN #190703-00001#2 add
          #损失科目
          SELECT glab005 INTO l_glab005_2 FROM glab_t
           WHERE glabent=g_enterprise AND glabld=p_ld AND glab001 = '25' AND glab002 = '8318' AND glab003='8318_12'
       END IF #190703-00001#2 add
      IF l_glca009='Y' THEN
         #将重评价科目的金额按照币别+核算项汇总
         LET l_sql=" SELECT docno,docdt, '',glaqent,glaqcomp,'',glaq001,'',glaq005,glaq006,'','','','','','','','','',",
                   " glaq017,glaq018,glaq019,glaq020,glaq021,glaq022,glaq023,glaq024,glaq025,'',",
                   " glaq027,glaq028,glaq051,glaq052,glaq053,",
                   " glaq029,glaq030,glaq031,glaq032,glaq033,glaq034,glaq035,glaq036,glaq037,glaq038,'','','',",
                   " SUM(d),SUM(c),ABS(SUM(glaq010)),SUM(glaq040),", 
                   " SUM(glaq041),SUM(glaq043),SUM(glaq044),",        
                   " '','','','','',", 
                   " key1,key2,'2',ABS(SUM(glaq010)),red",
                   
                   "  FROM s_voucher_tmp ",
                   " WHERE TYPE = '2' AND flag = '2' ",
                   " GROUP BY docno,docdt,glaqent,glaqcomp,glaq001,glaq005,glaq006,key1,key2,red,",
                   " glaq017,glaq018,glaq019,glaq020,glaq021,glaq022,glaq023,glaq024,glaq025,",
                   " glaq027,glaq028,glaq051,glaq052,glaq053,",
                   " glaq029,glaq030,glaq031,glaq032,glaq033,glaq034,glaq035,glaq036,glaq037,glaq038"
         PREPARE s_aapt330_pre FROM l_sql
         DECLARE s_aapt330_cur CURSOR FOR s_aapt330_pre
         
        
         FOREACH s_aapt330_cur INTO g_tmp.docno  ,g_tmp.docdt ,g_tmp.sw     ,g_tmp.glaqent,g_tmp.glaqcomp,
                                    g_tmp.glaqld ,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                                    g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                                    g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                                    g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                                    g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                                    g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                                    g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,
                                    g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.glaq039,
                                    g_tmp.glaq042,g_tmp.glgb055,g_tmp.d      ,g_tmp.c      ,g_tmp.sum    ,
                                    g_tmp.glaq040,g_tmp.glaq041,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq ,
                                    g_tmp.source ,g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1   ,
                                    g_tmp.key2   ,g_tmp.type   ,g_tmp.glaq010,g_tmp.red
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'foreach s_aapt330_cur'
               LET g_errparam.popup = FALSE
               CALL cl_err()
            END IF
            
            
            
            #贷方科目-借方科目金额>0，则取"收益科目"否则取"损失科目"
            LET l_sum=g_tmp.c-g_tmp.d
            IF l_sum>0 THEN
              LET g_tmp.glaq002=l_glab005
            ELSE 
              LET g_tmp.glaq002=l_glab005_2
            END IF
            #取参数
            SELECT glad002 INTO g_glad.glad002 FROM glad_t 
             WHERE gladent=g_enterprise AND gladld=p_ld AND glad001=g_tmp.glaq002
            #参照表号
            SELECT glaa004 INTO l_glaa004 FROM glaa_t 
             WHERE glaaent=g_enterprise AND glaald=p_ld 
            #余额形态
            SELECT glac008 INTO l_glac008 FROM glac_t 
             WHERE glacent=g_enterprise AND glac001=l_glaa004 AND glac002=g_tmp.glaq002
            #金额处理
            IF g_tmp.red = 'Y' AND g_glad.glad002 = 'Y' THEN
               IF l_glac008 = '1' THEN
                  LET g_tmp.d = g_tmp.d - g_tmp.c
                  LET g_tmp.c = 0
                  IF g_tmp.d < 0 THEN
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                     LET g_tmp.sum = g_tmp.glaq010
                  END IF
               ELSE
                  LET g_tmp.c = g_tmp.c - g_tmp.d
                  LET g_tmp.d = 0
                  IF g_tmp.c < 0 THEN
                     LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                     LET g_tmp.sum = g_tmp.glaq010
                  END IF
               END IF
            #170509-00094#2---add---end---
            ELSE
               IF (g_tmp.d - g_tmp.c) > 0 THEN
                  LET g_tmp.d = g_tmp.d - g_tmp.c
                  LET g_tmp.c = 0
               ELSE
                  LET g_tmp.c = g_tmp.c - g_tmp.d
                  LET g_tmp.d = 0
               END IF
            END IF
            IF g_tmp.c = 0 AND  g_tmp.d = 0 THEN
               CONTINUE FOREACH
            END IF
            
            #180124-00020#1 --s add
            IF g_tmp.c = 0 THEN
               LET g_tmp.sw = '1'
            ELSE
               LET g_tmp.sw = '2'
            END IF
            #180423-00029#1 add ------
            IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
            IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
            #180423-00029#1 add end---
            #200408-00070#1---add---str
            CALL s_pre_voucher_glad034_get(p_ld,g_tmp.glaq002) RETURNING l_glad034
            #科目未啟用多幣別管理
            IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
               CALL s_ld_sel_glaa(p_ld,'glaa001') RETURNING r_success,g_tmp.glaq005
               LET g_tmp.glaq006 = 1
               IF g_tmp.d <> 0 THEN
                  LET g_tmp.sum = g_tmp.d
               END IF
               IF g_tmp.c <> 0 THEN
                  LET g_tmp.sum = g_tmp.c
               END IF 
               LET g_tmp.glaq010 = g_tmp.sum
            END IF
            #200408-00070#1---add---end
            #再将“重评价科目”汇总后金额的数据重新保存到暂存档中
            EXECUTE s_aapp330_ins_voucher_tmp_p USING
                 g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                 g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                 g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                 g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                 g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                 g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                 g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                 g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                 g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                 g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                 g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                 g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                 g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red,'' 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert s_voucher_tmp'
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF                    
         END FOREACH
         ##当agli171作业glca009='Y'将暂存档“s_voucher_tmp”中flag=’2‘的“重评价科目”的汇总资料删除（因为上方的sql已经对重评价科目的金额根据币别+核算项进行合并，又合并后的资料保存到暂存表中，
         #所以要将flag=’2‘重评价科目的汇总资料删除，避免汇总资料重复）
         DELETE FROM  s_voucher_tmp WHERE glaqent=g_enterprise AND flag='2'
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'delete s_voucher_tmp'
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
      END  IF
   END IF
   #180227-00043#3 add-e 
   #200605-00130#2 --s add
   #现金流量表之数据源
   LET l_sfin0003 = NULL
   SELECT glaacomp,glaa004 INTO l_glaacomp,l_glaa004
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = p_ld
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-0003') RETURNING l_sfin0003
   #检查是否有现金科目
   LET l_count = 0
   SELECT COUNT(1) INTO l_count
     FROM s_voucher_tmp,glac_t
    WHERE glacent = g_enterprise
      AND glac001 = l_glaa004 
      AND glac002 = glaq002 
      AND glac016 = 'Y'
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   #底稿存在现金科目且总账系统科目设置现金变动码
   IF l_sfin0003 = '2' AND l_count > 0 THEN
      UPDATE s_voucher_tmp
         SET glgb055 = (CASE WHEN d <> 0 THEN (SELECT glad006 FROM glad_t WHERE gladent=g_enterprise AND gladld = p_ld AND glad001 = glaq002)
                        ELSE (SELECT glad036 FROM glad_t WHERE gladent=g_enterprise AND gladld = p_ld AND glad001 = glaq002) END)
       WHERE EXISTS (SELECT 1
                       FROM glac_t
                      WHERE glacent = g_enterprise
                        AND glac001 = l_glaa004 
                        AND glac002 = glaq002
                        AND glac016 = 'N')                 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd s_voucher_tmp'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
   END IF
   #200605-00130#2 --e add   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 寫入彙總資料
# Memo...........:
# Date & Author..: 14/10/31 By Belle
# Modify.........: 180808-00051#1 add p_acctype
#                : 201207-00021#1 add p_groupglbc
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_2_ins_group_tmp(p_ld,p_sum_type,p_acctype,p_groupglbc)
DEFINE p_ld             LIKE glaa_t.glaald
DEFINE p_sum_type       LIKE type_t.chr1
DEFINE p_acctype        LIKE type_t.chr1 #180808-00051#1 add
DEFINE p_groupglbc      LIKE type_t.chr1 #201207-00021#1 add
DEFINE r_success        LIKE type_t.num5
#DEFINE l_apca           RECORD LIKE apca_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_apca RECORD  #應付憑單單頭
       apcaent LIKE apca_t.apcaent, #企業編號
       apcaownid LIKE apca_t.apcaownid, #資料所有者
       apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
       apcacrtid LIKE apca_t.apcacrtid, #資料建立者
       apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
       apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
       apcamodid LIKE apca_t.apcamodid, #資料修改者
       apcamoddt LIKE apca_t.apcamoddt, #最近修改日
       apcacnfid LIKE apca_t.apcacnfid, #資料確認者
       apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
       apcapstid LIKE apca_t.apcapstid, #資料過帳者
       apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
       apcastus LIKE apca_t.apcastus, #狀態碼
       apcald LIKE apca_t.apcald, #帳套
       apcacomp LIKE apca_t.apcacomp, #法人
       apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
       apcadocdt LIKE apca_t.apcadocdt, #帳款日期
       apcasite LIKE apca_t.apcasite, #帳務中心
       apca001 LIKE apca_t.apca001, #帳款單性質
       apca003 LIKE apca_t.apca003, #帳務人員
       apca004 LIKE apca_t.apca004, #帳款對象編號
       apca005 LIKE apca_t.apca005, #付款對象
       apca006 LIKE apca_t.apca006, #供應商分類
       apca007 LIKE apca_t.apca007, #帳款類別
       apca008 LIKE apca_t.apca008, #付款條件編號
       apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
       apca010 LIKE apca_t.apca010, #容許票據到期日
       apca011 LIKE apca_t.apca011, #稅別
       apca012 LIKE apca_t.apca012, #稅率
       apca013 LIKE apca_t.apca013, #含稅否
       apca014 LIKE apca_t.apca014, #人員編號
       apca015 LIKE apca_t.apca015, #部門編號
       apca016 LIKE apca_t.apca016, #來源作業類型
       apca017 LIKE apca_t.apca017, #產生方式
       apca018 LIKE apca_t.apca018, #來源參考單號
       apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
       apca020 LIKE apca_t.apca020, #信用狀付款否
       apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
       apca022 LIKE apca_t.apca022, #進口報單號碼
       apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
       apca026 LIKE apca_t.apca026, #原幣未稅差異
       apca027 LIKE apca_t.apca027, #原幣稅額差異
       apca028 LIKE apca_t.apca028, #本幣未稅差異
       apca029 LIKE apca_t.apca029, #本幣幣稅額差異
       apca030 LIKE apca_t.apca030, #差異科目
       apca031 LIKE apca_t.apca031, #產生之差異折讓單號
       apca032 LIKE apca_t.apca032, #發票類型
       apca033 LIKE apca_t.apca033, #專案編號
       apca034 LIKE apca_t.apca034, #責任中心
       apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
       apca036 LIKE apca_t.apca036, #費用(借方)科目編號
       apca037 LIKE apca_t.apca037, #產生傳票否
       apca038 LIKE apca_t.apca038, #拋轉傳票號碼
       apca039 LIKE apca_t.apca039, #會計檢核附件份數
       apca040 LIKE apca_t.apca040, #留置否
       apca041 LIKE apca_t.apca041, #留置理由碼
       apca042 LIKE apca_t.apca042, #留置設定日期
       apca043 LIKE apca_t.apca043, #留置解除日期
       apca044 LIKE apca_t.apca044, #留置原幣金額
       apca045 LIKE apca_t.apca045, #留置說明
       apca046 LIKE apca_t.apca046, #關係人否
       apca047 LIKE apca_t.apca047, #多角序號
       apca048 LIKE apca_t.apca048, #集團代付/代付單號
       apca049 LIKE apca_t.apca049, #來源營運中心編號
       apca050 LIKE apca_t.apca050, #交易原始單據份數
       apca051 LIKE apca_t.apca051, #作廢理由碼
       apca052 LIKE apca_t.apca052, #列印次數
       apca053 LIKE apca_t.apca053, #備註
       apca054 LIKE apca_t.apca054, #多帳期設定
       apca055 LIKE apca_t.apca055, #繳款優惠條件
       apca056 LIKE apca_t.apca056, #會計檢核附件狀態
       apca057 LIKE apca_t.apca057, #交易對象識別碼
       apca058 LIKE apca_t.apca058, #稅別交易類型
       apca059 LIKE apca_t.apca059, #預算編號
       apca060 LIKE apca_t.apca060, #發票開立方式
       apca061 LIKE apca_t.apca061, #預開發票基準日
       apca062 LIKE apca_t.apca062, #多角性質
       apca063 LIKE apca_t.apca063, #整帳批序號
       apca064 LIKE apca_t.apca064, #訂金序次
       apca065 LIKE apca_t.apca065, #發票編號
       apca066 LIKE apca_t.apca066, #發票號碼
       apca100 LIKE apca_t.apca100, #交易原幣別
       apca101 LIKE apca_t.apca101, #原幣匯率
       apca103 LIKE apca_t.apca103, #原幣未稅金額
       apca104 LIKE apca_t.apca104, #原幣稅額
       apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
       apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
       apca108 LIKE apca_t.apca108, #原幣應付金額
       apca113 LIKE apca_t.apca113, #本幣未稅金額
       apca114 LIKE apca_t.apca114, #本幣稅額
       apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
       apca117 LIKE apca_t.apca117, #NO USE
       apca118 LIKE apca_t.apca118, #本幣應付金額
       apca120 LIKE apca_t.apca120, #本位幣二幣別
       apca121 LIKE apca_t.apca121, #本位幣二匯率
       apca123 LIKE apca_t.apca123, #本位幣二未稅金額
       apca124 LIKE apca_t.apca124, #本位幣二稅額
       apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
       apca127 LIKE apca_t.apca127, #NO USE
       apca128 LIKE apca_t.apca128, #本位幣二應付金額
       apca130 LIKE apca_t.apca130, #本位幣三幣別
       apca131 LIKE apca_t.apca131, #本位幣三匯率
       apca133 LIKE apca_t.apca133, #本位幣三未稅金額
       apca134 LIKE apca_t.apca134, #本位幣三稅額
       apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
       apca137 LIKE apca_t.apca137, #NO USE
       apca138 LIKE apca_t.apca138, #本位幣三應付金額
       apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
       apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
       apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
       apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
       apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
       apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
       apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
       apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
       apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
       apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
       apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
       apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
       apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
       apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
       apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
       apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
       apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
       apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
       apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
       apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
       apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
       apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
       apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
       apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
       apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
       apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
       apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
       apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
       apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
       apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
       apca067 LIKE apca_t.apca067, #管理品類
       apca068 LIKE apca_t.apca068, #經營方式
       apca069 LIKE apca_t.apca069, #no use
       apca070 LIKE apca_t.apca070, #no use
       apca071 LIKE apca_t.apca071, #no use
       apca072 LIKE apca_t.apca072, #no use
       apca073 LIKE apca_t.apca073  #L/C No.
END RECORD
#161111-00048#2 --e add
DEFINE l_sql            STRING
DEFINE l_glaq002        LIKE glaq_t.glaq002
DEFINE l_field          STRING
DEFINE l_field1         STRING
DEFINE l_field2         STRING
DEFINE l_str            STRING
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_glac016        LIKE glac_t.glac016
DEFINE l_glac008        LIKE glac_t.glac008   #170430-00006#2 add
#180228-00002#1---add--str
DEFINE l_docno          LIKE apca_t.apcadocno
DEFINE l_success        LIKE type_t.num5 
DEFINE l_slip           LIKE oobx_t.oobx001
DEFINE l_oobx004        LIKE oobx_t.oobx004
#180228-00002#1---add--str
DEFINE l_glaqdocno      LIKE glaq_t.glaqdocno #180808-00051#1 add
DEFINE l_glad034        LIKE glad_t.glad034   #200408-00070#1--add
#200605-00130#2 --s add
DEFINE l_glaa004        LIKE glaa_t.glaa004 
DEFINE l_glaacomp       LIKE glaa_t.glaacomp
DEFINE l_sfin0003       LIKE type_t.chr1  
DEFINE l_count          LIKE type_t.num5
#200605-00130#2 --e add
#190711-00019#1 --s add
DEFINE l_docno1         LIKE apca_t.apcadocno
DEFINE l_apce003        LIKE apce_t.apce003
DEFINE l_glaq008        LIKE glaq_t.glaq008     
#190711-00019#1 --e add

   WHENEVER ERROR CONTINUE
   
   LET r_success  = FALSE
   #DELETE FROM s_voucher_tmp WHERE type = '2'; #190507-00025#1 mark
   #190507-00025#1 add ---s aapp330可合併拋轉,不刪除aapt3*的資料
   IF g_prog NOT MATCHES 'aapp330*' THEN
      DELETE FROM s_voucher_tmp WHERE type = '2';
   END IF
   #190507-00025#1 add ---e
   #190711-00019#1 --s add
   LET l_docno1 = NULL
   SELECT DISTINCT docno INTO l_docno1
     FROM s_voucher_tmp
    WHERE type = '1'
    
   LET l_apce003 = NULL 
   SELECT apce003 INTO l_apce003
     FROM apce_t 
    WHERE apceent = g_enterprise 
      AND apceld = p_ld 
      AND apcedocno = l_docno1   
   
   LET l_glaq008 = NULL    
   SELECT SUM(apcb007) INTO l_glaq008
     FROM apcb_t 
    WHERE apcbent = g_enterprise 
      AND apcbld = p_ld
      AND apcbdocno = l_apce003
   #190711-00019#1 --e add
   
  #FOREACH gen_ap_1_c20 INTO l_glaq002              #180808-00051#1 mark
   FOREACH gen_ap_1_c20 INTO l_glaqdocno,l_glaq002  #180808-00051#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach gen_ap_1_c20'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF  
       
      IF cl_null(l_glaq002) THEN CONTINUE FOREACH END IF
      
      #EXECUTE gen_ap_1_c01 USING l_glaq002 INTO g_glad.*   #161208-00026#23   mark
      #161208-00026#23   add---s
      EXECUTE gen_ap_1_c01 USING l_glaq002 
         INTO g_glad.gladent,g_glad.gladownid,g_glad.gladowndp,g_glad.gladcrtid,g_glad.gladcrtdp,
              g_glad.gladcrtdt,g_glad.gladmodid,g_glad.gladmoddt,g_glad.gladstus,g_glad.gladld,
              g_glad.glad001,g_glad.glad002,g_glad.glad003,g_glad.glad004,g_glad.glad005,
              g_glad.glad006,g_glad.glad007,g_glad.glad008,g_glad.glad009,g_glad.glad010,
              g_glad.glad011,g_glad.glad012,g_glad.glad013,g_glad.glad014,g_glad.glad015,
              g_glad.glad016,g_glad.glad017,g_glad.glad0171,g_glad.glad0172,g_glad.glad018,
              g_glad.glad0181,g_glad.glad0182,g_glad.glad019,g_glad.glad0191,g_glad.glad0192,
              g_glad.glad020,g_glad.glad0201,g_glad.glad0202,g_glad.glad021,g_glad.glad0211,
              g_glad.glad0212,g_glad.glad022,g_glad.glad0221,g_glad.glad0222,g_glad.glad023,
              g_glad.glad0231,g_glad.glad0232,g_glad.glad024,g_glad.glad0241,g_glad.glad0242,
              g_glad.glad025,g_glad.glad0251,g_glad.glad0252,g_glad.glad026,g_glad.glad0261,
              g_glad.glad0262,g_glad.glad027,g_glad.glad030,g_glad.glad031,g_glad.glad032,
              g_glad.glad033,g_glad.glad034,g_glad.gladud001,g_glad.gladud002,g_glad.gladud003,
              g_glad.gladud004,g_glad.gladud005,g_glad.gladud006,g_glad.gladud007,g_glad.gladud008,
              g_glad.gladud009,g_glad.gladud010,g_glad.gladud011,g_glad.gladud012,g_glad.gladud013,
              g_glad.gladud014,g_glad.gladud015,g_glad.gladud016,g_glad.gladud017,g_glad.gladud018,
              g_glad.gladud019,g_glad.gladud020,g_glad.gladud021,g_glad.gladud022,g_glad.gladud023,
              g_glad.gladud024,g_glad.gladud025,g_glad.gladud026,g_glad.gladud027,g_glad.gladud028,
              g_glad.gladud029,g_glad.gladud030,g_glad.glad035,g_glad.glad036
              ,l_glac016,l_glac008    #170430-00006#2 add
      #161208-00026#23   add---e
     
      #180228-00002#1---add--str
       
      #判断aapp420做的事aapt430得抛传票，不需要强制给glad010 和 glad027 为 Y
      #IF g_prog MATCHES 'aapp420*' THEN  #190507-00025#1 mark
      IF g_prog MATCHES 'aapp420*' OR g_prog MATCHES 'aapp330*' THEN #190507-00025#1 add
         SELECT docno INTO l_docno
           FROM s_voucher_tmp 
            WHERE type = '1' 
             AND glaq002 = l_glaq002
         CALL s_aooi200_get_slip(l_docno) RETURNING l_success,l_slip
         SELECT oobx004 INTO l_oobx004
           FROM oobx_t
          WHERE oobxent = g_enterprise
            AND oobx001 = l_slip
         IF l_oobx004 <> 'aapt430' THEN
            LET g_glad.glad010 = 'Y'
            LET g_glad.glad027 = 'Y'
         END IF         
      ELSE   
      #180228-00002#1---add---end
         LET g_glad.glad010 = 'Y'
         LET g_glad.glad027 = 'Y'
      END IF  #180228-00002#1---add
      
      LET l_field1 = "key1" 
      IF g_glad.glad005 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq007" END IF   #数量/金额管理
      IF g_glad.glad007 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq018" END IF   #部门管理
      IF g_glad.glad008 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq019" END IF   #利润成本管理
      IF g_glad.glad009 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq020" END IF   #区域管理
      IF g_glad.glad010 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq021" END IF   #
      
      IF g_glad.glad027 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq022" END IF   #
      IF g_glad.glad011 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq023" END IF   #
      IF g_glad.glad012 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq024" END IF   #产品类别管理
      IF g_glad.glad013 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq025" END IF   #人员管理
      IF g_glad.glad015 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq027" END IF   #专案管理
      
      IF g_glad.glad016 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq028" END IF   #WBS管理
      IF g_glad.glad031 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq051" END IF   #經營方式
      IF g_glad.glad032 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq052" END IF   #渠道
      IF g_glad.glad033 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq053" END IF   #品牌
      
      IF g_glad.glad017 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq029" END IF   #自由核算项1
      IF g_glad.glad018 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq030" END IF   #自由核算项2
      IF g_glad.glad019 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq031" END IF   #自由核算项3
      IF g_glad.glad020 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq032" END IF   #自由核算项4
      IF g_glad.glad021 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq033" END IF   #自由核算项5
      
      IF g_glad.glad022 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq034" END IF   #自由核算项6
      IF g_glad.glad023 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq035" END IF   #自由核算项7
      IF g_glad.glad024 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq036" END IF   #自由核算项8
      IF g_glad.glad025 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq037" END IF   #自由核算项9
      IF g_glad.glad026 = 'Y' THEN LET l_field1 = l_field1 CLIPPED,",glaq038" END IF   #自由核算项10
      #180208-00035#1-s
      IF g_glaa015 = 'Y'      THEN LET l_field1 = l_field1 CLIPPED,",glaq039" END IF   #匯率(本位幣二)
      IF g_glaa019 = 'Y'      THEN LET l_field1 = l_field1 CLIPPED,",glaq042" END IF   #匯率(本位幣三)
      #180208-00035#1-e
     #170430-00006#2---mark---start---
     ###150209-00008#2--(S)
     #SELECT glac016 INTO l_glac016 
     #  FROM glac_t
     # WHERE glacent = g_enterprise
     #   AND glac001 = g_glaa004
     #   AND glac002 = l_glaq002
     #170430-00006#2---mark---end---
      
      #IF l_glac016 = 'Y' THEN  #201207-00021#1 mark
      IF l_glac016 = 'Y' AND p_groupglbc = 'Y' THEN #201207-00021#1 add
         LET l_field1 = l_field1 CLIPPED,",glgb055"
      END IF
      #150209-00008#2--(E)
  
      LET l_field = ""
      CALL s_aapp330_set_sqlstr(g_glad.glad005,'glaq007',l_field) RETURNING l_field
      CALL s_aapp330_set_sqlstr(g_glad.glad005,'SUM(glaq008)',l_field) RETURNING l_field
      LET l_field = l_field CLIPPED,"'','','','','','','',glaq017,"       #glaq009~glaq017
      CALL s_aapp330_set_sqlstr(g_glad.glad007,'glaq018',l_field) RETURNING l_field  #部门管理
      CALL s_aapp330_set_sqlstr(g_glad.glad008,'glaq019',l_field) RETURNING l_field  #利润成本管理
      CALL s_aapp330_set_sqlstr(g_glad.glad009,'glaq020',l_field) RETURNING l_field  #区域管理
      CALL s_aapp330_set_sqlstr(g_glad.glad010,'glaq021',l_field) RETURNING l_field  #交易客商
      
      CALL s_aapp330_set_sqlstr(g_glad.glad027,'glaq022',l_field) RETURNING l_field  #
      CALL s_aapp330_set_sqlstr(g_glad.glad011,'glaq023',l_field) RETURNING l_field  #客群管理
      CALL s_aapp330_set_sqlstr(g_glad.glad012,'glaq024',l_field) RETURNING l_field  #产品类别管理
      CALL s_aapp330_set_sqlstr(g_glad.glad013,'glaq025',l_field) RETURNING l_field  #人员管理
      LET l_field = l_field CLIPPED,"'',"      
      CALL s_aapp330_set_sqlstr(g_glad.glad015,'glaq027',l_field) RETURNING l_field  #专案管理
      
      CALL s_aapp330_set_sqlstr(g_glad.glad016,'glaq028',l_field) RETURNING l_field  #WBS管理
      CALL s_aapp330_set_sqlstr(g_glad.glad031,'glaq051',l_field) RETURNING l_field  #經營方式
      CALL s_aapp330_set_sqlstr(g_glad.glad032,'glaq052',l_field) RETURNING l_field  #渠道
      CALL s_aapp330_set_sqlstr(g_glad.glad033,'glaq053',l_field) RETURNING l_field  #品牌  
      
      CALL s_aapp330_set_sqlstr(g_glad.glad017,'glaq029',l_field) RETURNING l_field  #自由核算项1
      CALL s_aapp330_set_sqlstr(g_glad.glad018,'glaq030',l_field) RETURNING l_field  #自由核算项2
      CALL s_aapp330_set_sqlstr(g_glad.glad019,'glaq031',l_field) RETURNING l_field  #自由核算项3
      CALL s_aapp330_set_sqlstr(g_glad.glad020,'glaq032',l_field) RETURNING l_field  #自由核算项4
      CALL s_aapp330_set_sqlstr(g_glad.glad021,'glaq033',l_field) RETURNING l_field  #自由核算项5
      
      CALL s_aapp330_set_sqlstr(g_glad.glad022,'glaq034',l_field) RETURNING l_field  #自由核算项6
      CALL s_aapp330_set_sqlstr(g_glad.glad023,'glaq035',l_field) RETURNING l_field  #自由核算项7
      CALL s_aapp330_set_sqlstr(g_glad.glad024,'glaq036',l_field) RETURNING l_field  #自由核算项8
      CALL s_aapp330_set_sqlstr(g_glad.glad025,'glaq037',l_field) RETURNING l_field  #自由核算项9
      CALL s_aapp330_set_sqlstr(g_glad.glad026,'glaq038',l_field) RETURNING l_field  #自由核算项10
      #180208-00014#1-s
      CALL s_aapp330_set_sqlstr(g_glaa015     ,'glaq039',l_field) RETURNING l_field  #匯率(本位幣二)
      CALL s_aapp330_set_sqlstr(g_glaa019     ,'glaq042',l_field) RETURNING l_field  #匯率(本位幣三)
      #180208-00014#1-e
      #CALL s_aapp330_set_sqlstr(l_glac016     ,'glgb055',l_field) RETURNING l_field  #現金變動碼 #201207-00021#1 mark
      #201207-00021#1 add ---s
      IF p_groupglbc = 'Y' THEN
         CALL s_aapp330_set_sqlstr(l_glac016     ,'glgb055',l_field) RETURNING l_field
      ELSE
         LET l_field = l_field,"'',"
      END IF
      #201207-00021#1 add ---e
      
      CASE p_sum_type
           WHEN '1'  
               LET l_sql = "SELECT docno,docdt,"
               LET l_field1 = l_field1,",docno,docdt"
           WHEN '2'  
               LET l_sql = "SELECT ''   ,docdt,"
               LET l_field1 = l_field1,",docdt "
           WHEN '3'  
               LET l_sql = "SELECT ''   ,''   ," 
           WHEN '4'
               LET l_sql = "SELECT ''   ,docdt ," 
               LET l_field1 = l_field1,",docdt  "
           WHEN '5'
               LET l_sql = "SELECT ''   ,''   ," 
      END CASE
      #180808-00051#2---add---(S)
      #IF p_acctype = '1' THEN #190507-00025#1 mark
      LET l_sql = "SELECT docno,docdt,"
      #END IF #190507-00025#1 mark
      #180808-00051#2---add---(E)
      LET l_sql = l_sql ,"     sw,glaqent,glaqcomp,'',glaq001,",
                         "glaq002,glaq005, glaq006,",l_field CLIPPED,
                         "  SUM(d),SUM(c),ABS(SUM(glaq010)),",
                        #180208-00035#1-s
                        #"glaq039,SUM(glaq040),SUM(glaq041),",
                        #"glaq042,SUM(glaq043),SUM(glaq044),",
                         "SUM(glaq040),SUM(glaq041),SUM(glaq043),SUM(glaq044),",
                        #180208-00035#1-e
                        "     '',          '',          '','','',", 
                        #"key1   ,        key2,          '2',ABS(SUM(glaq010))", #180129-00027#1 mark 
                         "key1   ,        key2,          '2',ABS(SUM(glaq010)),apcb023,red ", #180129-00027#1 add
                 "  FROM s_voucher_tmp ",
                #" WHERE type = '1' AND glaq002 = '",l_glaq002,"'", #180808-00051#1 mark
                 " WHERE type = '1' AND glaq002 = '",l_glaq002,"'"  #180808-00051#1 add
      #180808-00051#1---add---(S)
      IF p_acctype = '1' THEN
         LET l_sql = l_sql , " AND docno = '",l_glaqdocno,"'"
      END IF
      LET l_sql = l_sql ,
      #180808-00051#1---add---(E)
                 " GROUP BY glaqent,glaqcomp,glaq001,glaq002,glaq005,",
                #"          glaq006,glaq039,glaq042,glaq017,sw,key2,",l_field1  #180208-00014#1 mark
                #"          glaq006,glaq017,sw,key2,",l_field1                  #180208-00014#1 #180129-00027#1 mark
                 "          glaq006,glaq017,sw,key2,apcb023,red,",l_field1      #180129-00027#1 add
      #180808-00051#1---add---(S)
      #IF p_acctype = '1' THEN #190507-00025#1 mark
      LET l_sql = l_sql , " ,docno,docdt"
      #END IF      #190507-00025#1 mark
      #180808-00051#1---add---(E)
      
      PREPARE gen_ap_g_p02 FROM l_sql
      DECLARE gen_ap_g_c02 CURSOR FOR gen_ap_g_p02
      LET l_cnt = 1
      FOREACH gen_ap_g_c02 INTO g_tmp.docno   ,g_tmp.docdt   ,g_tmp.sw,
                                g_tmp.glaqent,g_tmp.glaqcomp,g_tmp.glaqld,
                                g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,g_tmp.glaq007,
                                g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,g_tmp.glaq013,
                                g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,g_tmp.glaq018,
                                g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,g_tmp.glaq023,
                                g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,g_tmp.glaq028,
                                g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,g_tmp.glaq030,
                                g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,g_tmp.glaq035,
                               #180208-00035#1-s
                               #g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.glgb055,
                               #g_tmp.d      ,g_tmp.c      ,g_tmp.sum    ,g_tmp.glaq039,g_tmp.glaq040,
                               #g_tmp.glaq041,g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,
                                g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.glaq039,g_tmp.glaq042,
                                g_tmp.glgb055,g_tmp.d      ,g_tmp.c      ,g_tmp.sum    ,g_tmp.glaq040,
                                g_tmp.glaq041,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,
                               #180208-00035#1-e
                                g_tmp.source ,g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,
                               #g_tmp.key2   ,g_tmp.type   ,g_tmp.glaq010,g_tmp.apcb023             #180129-00027#1 mark 
                                g_tmp.key2   ,g_tmp.type   ,g_tmp.glaq010,g_tmp.apcb023,g_tmp.red    #180129-00027#1 add
         
              
         IF g_tmp.c = 0 AND  g_tmp.d = 0 THEN
            CONTINUE FOREACH
         END IF
         #180129-00027#1--add--s--xul
#        IF g_prog = 'aapt420' THEN   #180808-00051#2 mark
         IF g_tmp.red = 'Y' AND g_glad.glad002 = 'Y' THEN
            IF l_glac008 = '1' THEN
               LET g_tmp.d = g_tmp.d - g_tmp.c
               LET g_tmp.c = 0
               IF g_tmp.d < 0 THEN
                  LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                  LET g_tmp.sum = g_tmp.glaq010
               END IF
            ELSE
               LET g_tmp.c = g_tmp.c - g_tmp.d
               LET g_tmp.d = 0
               IF g_tmp.c < 0 THEN
                  LET g_tmp.glaq010 = g_tmp.glaq010 * -1
                  LET g_tmp.sum = g_tmp.glaq010
               END IF
            END IF        
         ELSE
            IF (g_tmp.d - g_tmp.c) > 0 THEN
               LET g_tmp.d = g_tmp.d - g_tmp.c
               LET g_tmp.c = 0
            ELSE
               LET g_tmp.c = g_tmp.c - g_tmp.d
               LET g_tmp.d = 0
            END IF
         END IF
#        END IF     #180808-00051#2 mark
         #180129-00027#1--add--e--xul
        
        #180904-00075#1 mark--s
        ##180612-00075#1---s---
        #IF g_prog = 'aapt430' THEN
        # IF (g_tmp.d - g_tmp.c) > 0 THEN
        #    LET g_tmp.d = g_tmp.d - g_tmp.c
        #    LET g_tmp.c = 0
        # ELSE
        #    LET g_tmp.c = g_tmp.c - g_tmp.d
        #    LET g_tmp.d = 0
        # END IF
        #END IF
        ##180612-00075#1---e--  
        #180904-00075#1 mark--e       
         
         
        #INSERT INTO s_voucher_tmp VALUES(g_tmp.*) #161111-00048#2 mark
         #161111-00048#2 --s add
         #170430-00006#2---mark---start---
         #INSERT INTO s_voucher_tmp(docno,docdt,sw,glaqent,glaqcomp,
         #                          glaqld,glaq001,glaq002,glaq005,glaq006,
         #                          glaq007,glaq008,glaq009,glaq011,glaq012,
         #                          glaq013,glaq014,glaq015,glaq016,glaq017,
         #                          glaq018,glaq019,glaq020,glaq021,glaq022,
         #                          glaq023,glaq024,glaq025,glaq026,glaq027,
         #                          glaq028,glaq051,glaq052,glaq053,glaq029,
         #                          glaq030,glaq031,glaq032,glaq033,glaq034,  
         #                          glaq035,glaq036,glaq037,glaq038,d,        
         #                          c,sum,glaq039,glaq040,glaq041,  
         #                          glaq042,glaq043,glaq044,docseq,source,   
         #                          glaqseq,xrca039,apcb022,key1,key2,     
         #                          type,glaq010,apcb023,glgb055,red)      
         #VALUES(g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
         #       g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
         #       g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
         #       g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
         #       g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
         #       g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
         #       g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
         #       g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
         #       g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
         #       g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
         #       g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
         #       g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
         #       g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
         #170430-00006#2---mark---end---
         #180423-00029#1 add ------
         IF g_glaa015 = 'N' THEN LET g_tmp.glaq039 = NULL END IF
         IF g_glaa019 = 'N' THEN LET g_tmp.glaq042 = NULL END IF
         #180423-00029#1 add end---
         #200408-00070#1---add---str
         CALL s_pre_voucher_glad034_get(p_ld,g_tmp.glaq002) RETURNING l_glad034
         #科目未啟用多幣別管理
         IF l_glad034 = 'N' OR cl_null(l_glad034) THEN    
            CALL s_ld_sel_glaa(p_ld,'glaa001') RETURNING r_success,g_tmp.glaq005
            LET g_tmp.glaq006 = 1
            IF g_tmp.d <> 0 THEN
               LET g_tmp.sum = g_tmp.d
            END IF
            IF g_tmp.c <> 0 THEN
               LET g_tmp.sum = g_tmp.c
            END IF 
            LET g_tmp.glaq010 = g_tmp.sum
         END IF
         #200408-00070#1---add---end
         #190711-00019#1 --s add
         IF g_tmp.glaq010 < 0 THEN
            LET g_tmp.glaq008 = l_glaq008 * -1
         ELSE
            LET g_tmp.glaq008 = l_glaq008
         END IF
         LET g_tmp.glaq009 = g_tmp.glaq010/g_tmp.glaq008
         #190711-00019#1 --e add
         #170430-00006#2---add--start---
         EXECUTE s_aapp330_ins_voucher_tmp_p USING
                 g_tmp.docno,g_tmp.docdt,g_tmp.sw,g_tmp.glaqent,g_tmp.glaqcomp,
                 g_tmp.glaqld,g_tmp.glaq001,g_tmp.glaq002,g_tmp.glaq005,g_tmp.glaq006,
                 g_tmp.glaq007,g_tmp.glaq008,g_tmp.glaq009,g_tmp.glaq011,g_tmp.glaq012,
                 g_tmp.glaq013,g_tmp.glaq014,g_tmp.glaq015,g_tmp.glaq016,g_tmp.glaq017,
                 g_tmp.glaq018,g_tmp.glaq019,g_tmp.glaq020,g_tmp.glaq021,g_tmp.glaq022,
                 g_tmp.glaq023,g_tmp.glaq024,g_tmp.glaq025,g_tmp.glaq026,g_tmp.glaq027,
                 g_tmp.glaq028,g_tmp.glaq051,g_tmp.glaq052,g_tmp.glaq053,g_tmp.glaq029,
                 g_tmp.glaq030,g_tmp.glaq031,g_tmp.glaq032,g_tmp.glaq033,g_tmp.glaq034,  
                 g_tmp.glaq035,g_tmp.glaq036,g_tmp.glaq037,g_tmp.glaq038,g_tmp.d,        
                 g_tmp.c,g_tmp.sum,g_tmp.glaq039,g_tmp.glaq040,g_tmp.glaq041,  
                 g_tmp.glaq042,g_tmp.glaq043,g_tmp.glaq044,g_tmp.docseq,g_tmp.source,   
                 g_tmp.glaqseq,g_tmp.xrca039,g_tmp.apcb022,g_tmp.key1,g_tmp.key2,     
                 g_tmp.type,g_tmp.glaq010,g_tmp.apcb023,g_tmp.glgb055,g_tmp.red
                ,''                                                                   #180608-00039#1 add
         #170430-00006#2---add---end---
         #161111-00048#2 --e add         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert s_voucher_tmp#2'
            LET g_errparam.popup = FALSE
            CALL cl_err()
            RETURN r_success
         END IF
      END FOREACH
   END FOREACH 
   #200605-00130#2 --s add
   #现金流量表之数据源
   LET l_sfin0003 = NULL
   SELECT glaacomp,glaa004 INTO l_glaacomp,l_glaa004
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = p_ld
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-0003') RETURNING l_sfin0003
   #检查是否有现金科目
   LET l_count = 0
   SELECT COUNT(1) INTO l_count
     FROM s_voucher_tmp,glac_t
    WHERE glacent = g_enterprise
      AND glac001 = l_glaa004 
      AND glac002 = glaq002 
      AND glac016 = 'Y'
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   #底稿存在现金科目且总账系统科目设置现金变动码
   IF l_sfin0003 = '2' AND l_count > 0 THEN
      UPDATE s_voucher_tmp
         SET glgb055 = (CASE WHEN d <> 0 THEN (SELECT glad006 FROM glad_t WHERE gladent=g_enterprise AND gladld = p_ld AND glad001 = glaq002)
                        ELSE (SELECT glad036 FROM glad_t WHERE gladent=g_enterprise AND gladld = p_ld AND glad001 = glaq002) END)
       WHERE EXISTS (SELECT 1
                       FROM glac_t
                      WHERE glacent = g_enterprise
                        AND glac001 = l_glaa004 
                        AND glac002 = glaq002
                        AND glac016 = 'N')                 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd s_voucher_tmp'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
   END IF
   #200605-00130#2 --e add
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 重評價依幣別彙總處理
# Memo...........: #150825-00004#9
# Usage..........: CALL s_aapp330_gen_ap_3_ins_group_tmp()
# Date & Author..: 2015/08/27 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_3_ins_group_tmp(p_ld)
DEFINE p_ld            LIKE glaa_t.glaald
#DEFINE l_glaq002       LIKE glaq_t.glaq002
#DEFINE l_glaq005       LIKE glaq_t.glaq005
#DEFINE l_sw            LIKE type_t.chr1   #1.借  2.貸
#DEFINE r_success       LIKE type_t.num5
#   WHENEVER ERROR CONTINUE
#   
#   LET r_success  = FALSE
#   INITIALIZE g_tmp.* TO NULL
#   DELETE FROM s_voucher_tmp WHERE type = '3';
#   
#   #先撈出科目+幣別
#   FOREACH gen_ap_1_c9c INTO l_glaq002,l_glaq005,l_sw
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'foreach gen_ap_1_c9c'
#         LET g_errparam.popup = FALSE
#         CALL cl_err()
#         RETURN r_success
#      END IF
#      
#      IF cl_null(l_glaq002) OR cl_null(l_glaq005) THEN CONTINUE FOREACH END IF
#      
#      #在依科目+幣別撈取第一筆
#      OPEN gen_ap_1_c9d USING l_glaq002,l_glaq005,l_sw
#      FETCH FIRST gen_ap_1_c9d INTO g_tmp.*
#      
#      #合計該科目+幣別的金額
#      EXECUTE gen_ap_1_c9e USING l_glaq002,l_glaq005,l_sw
#                            INTO g_tmp.d,g_tmp.c,g_tmp.sum,g_tmp.glaq040,g_tmp.glaq041,
#                                 g_tmp.glaq043,g_tmp.glaq044
#      #項次
#      SELECT MAX(glaqseq)+1 INTO g_tmp.glaqseq FROM s_voucher_tmp
#      IF cl_null(g_tmp.glaqseq) THEN LET g_tmp.glaqseq = 1 END IF
#      
#      CALL s_ld_sel_glaa(p_ld,'glaa001') RETURNING g_sub_success,g_tmp.glaq005
#      LET g_tmp.glaq006 = 1
#      LET g_tmp.type = '3'
#      
#      INSERT INTO s_voucher_tmp VALUES(g_tmp.*)
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'insert s_voucher_tmp'
#         LET g_errparam.popup = FALSE
#         CALL cl_err()
#         RETURN r_success
#      END IF
#   END FOREACH
#   
#   DELETE FROM s_voucher_tmp WHERE type = '1';
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'DELETE s_voucher_tmp'
#      LET g_errparam.popup = FALSE
#      CALL cl_err()
#      RETURN r_success
#   END IF
#   
#   UPDATE s_voucher_tmp SET type = '2' WHERE type = '3';
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'UPDATE s_voucher_tmp'
#      LET g_errparam.popup = FALSE
#      CALL cl_err()
#      RETURN r_success
#   END IF
#      
#   LET r_success = TRUE
#   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 處理字串
# Memo...........:
# Usage..........: 
# Date & Author..: 14/09/08 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_set_sqlstr(p_flag,p_field,p_str)
DEFINE p_flag     LIKE type_t.chr1
DEFINE p_field    LIKE type_t.chr20
DEFINE p_str      STRING
DEFINE r_str      STRING
DEFINE l_str      STRING

   LET l_str = ''
   IF p_flag = 'Y' THEN
      LET l_str = p_field,","
   ELSE
      LET l_str = "'',"
   END IF
   LET r_str = p_str CLIPPED,l_str
   RETURN r_str
END FUNCTION

################################################################################
# Descriptions...: 產生傳票
# Date & Author..: 14/10/20 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_generate_voucher(p_cate,p_slip,p_date,p_ld,p_sumtype,p_flag,p_glaa102,p_type)
DEFINE p_cate           LIKE gzza_t.gzza001
#DEFINE p_slip           LIKE ooba_t.ooba002    #160523-00023#1 mark
DEFINE p_slip           LIKE type_t.chr50       #160523-00023#1
DEFINE p_date           LIKE glap_t.glapdocdt
DEFINE p_ld             LIKE apca_t.apcald
DEFINE p_sumtype        LIKE type_t.chr1        #彙總方式
#DEFINE p_flag           LIKE type_t.chr1       #180808-00051#1 mark       
DEFINE p_flag           LIKE type_t.chr10       #180808-00051#1 add
DEFINE p_type           LIKE type_t.chr2        #前端來源類型(EX:AP)
DEFINE p_glaa102        LIKE glaa_t.glaa102
DEFINE r_success        LIKE type_t.num5
DEFINE r_str_no         LIKE glap_t.glapdocno
DEFINE r_end_no         LIKE glap_t.glapdocno
                        
DEFINE l_glaa  RECORD
                  glaa121   LIKE glaa_t.glaa121                  
                  END RECORD
DEFINE l_docno          LIKE glap_t.glapdocno
DEFINE l_docdt          LIKE glap_t.glapdocdt
DEFINE l_glaq002        LIKE glaq_t.glaq002 #會計科目
DEFINE l_glaq003        LIKE glaq_t.glaq003 #借方金額
DEFINE l_glaq004        LIKE glaq_t.glaq004 #貸方金額
DEFINE l_glaq022        LIKE glaq_t.glaq022 #帳款客戶
DEFINE l_glaq029        LIKE glaq_t.glaq029 #自由核算項1
DEFINE l_glaq030        LIKE glaq_t.glaq030 #自由核算項2
DEFINE l_glaq031        LIKE glaq_t.glaq031 #自由核算項3
DEFINE l_glaq032        LIKE glaq_t.glaq032 #自由核算項4
DEFINE l_glaq033        LIKE glaq_t.glaq033 #自由核算項5
DEFINE l_glaq034        LIKE glaq_t.glaq034 #自由核算項6
DEFINE l_glaq035        LIKE glaq_t.glaq035 #自由核算項7
DEFINE l_glaq036        LIKE glaq_t.glaq036 #自由核算項8
DEFINE l_glaq037        LIKE glaq_t.glaq037 #自由核算項9
DEFINE l_glaq038        LIKE glaq_t.glaq038 #自由核算項10

DEFINE l_wc             STRING
#DEFINE l_glad           RECORD LIKE glad_t.* #161111-00048#2  mark
#161111-00048#2 --s add
DEFINE l_glad RECORD  #帳套科目管理設定檔
       gladent LIKE glad_t.gladent, #企業編號
       gladownid LIKE glad_t.gladownid, #資料所有者
       gladowndp LIKE glad_t.gladowndp, #資料所屬部門
       gladcrtid LIKE glad_t.gladcrtid, #資料建立者
       gladcrtdp LIKE glad_t.gladcrtdp, #資料建立部門
       gladcrtdt LIKE glad_t.gladcrtdt, #資料創建日
       gladmodid LIKE glad_t.gladmodid, #資料修改者
       gladmoddt LIKE glad_t.gladmoddt, #最近修改日
       gladstus LIKE glad_t.gladstus, #狀態碼
       gladld LIKE glad_t.gladld, #帳套
       glad001 LIKE glad_t.glad001, #會計科目編號
       glad002 LIKE glad_t.glad002, #是否按餘額類型產生分錄
       glad003 LIKE glad_t.glad003, #啟用傳票項次細項立沖
       glad004 LIKE glad_t.glad004, #傳票項次異動別
       glad005 LIKE glad_t.glad005, #是否啟用數量金額式
       glad006 LIKE glad_t.glad006, #借方現金變動碼
       glad007 LIKE glad_t.glad007, #啟用部門管理
       glad008 LIKE glad_t.glad008, #啟用利潤成本管理
       glad009 LIKE glad_t.glad009, #啟用區域管理
       glad010 LIKE glad_t.glad010, #啟用收付款客商管理
       glad011 LIKE glad_t.glad011, #啟用客群管理
       glad012 LIKE glad_t.glad012, #啟用產品類別管理
       glad013 LIKE glad_t.glad013, #啟用人員管理
       glad014 LIKE glad_t.glad014, #no use
       glad015 LIKE glad_t.glad015, #啟用專案管理
       glad016 LIKE glad_t.glad016, #啟用WBS管理
       glad017 LIKE glad_t.glad017, #啟用自由核算項一
       glad0171 LIKE glad_t.glad0171, #自由核算項一類型編號
       glad0172 LIKE glad_t.glad0172, #自由核算項一控制方式
       glad018 LIKE glad_t.glad018, #啟用自由核算項二
       glad0181 LIKE glad_t.glad0181, #自由核算項二類型編號
       glad0182 LIKE glad_t.glad0182, #自由核算項二控制方式
       glad019 LIKE glad_t.glad019, #啟用自由核算項三
       glad0191 LIKE glad_t.glad0191, #自由核算項三類型編號
       glad0192 LIKE glad_t.glad0192, #自由核算項三控制方式
       glad020 LIKE glad_t.glad020, #啟用自由核算項四
       glad0201 LIKE glad_t.glad0201, #自由核算項四類型編號
       glad0202 LIKE glad_t.glad0202, #自由核算項四控制方式
       glad021 LIKE glad_t.glad021, #啟用自由核算項五
       glad0211 LIKE glad_t.glad0211, #自由核算項五類型編號
       glad0212 LIKE glad_t.glad0212, #自由核算項五控制方式
       glad022 LIKE glad_t.glad022, #啟用自由核算項六
       glad0221 LIKE glad_t.glad0221, #自由核算項六類型編號
       glad0222 LIKE glad_t.glad0222, #自由核算項六控制方式
       glad023 LIKE glad_t.glad023, #啟用自由核算項七
       glad0231 LIKE glad_t.glad0231, #自由核算項七類型編號
       glad0232 LIKE glad_t.glad0232, #自由核算項七控制方式
       glad024 LIKE glad_t.glad024, #啟用自由核算項八
       glad0241 LIKE glad_t.glad0241, #自由核算項八類型編號
       glad0242 LIKE glad_t.glad0242, #自由核算項八控制方式
       glad025 LIKE glad_t.glad025, #啟用自由核算項九
       glad0251 LIKE glad_t.glad0251, #自由核算項九類型編號
       glad0252 LIKE glad_t.glad0252, #自由核算項九控制方式
       glad026 LIKE glad_t.glad026, #啟用自由核算項十
       glad0261 LIKE glad_t.glad0261, #自由核算項十類型編號
       glad0262 LIKE glad_t.glad0262, #自由核算項十控制方式
       glad027 LIKE glad_t.glad027, #啟用帳款客商管理
       glad030 LIKE glad_t.glad030, #是否進行預算管控
       glad031 LIKE glad_t.glad031, #啟用經營方式管理
       glad032 LIKE glad_t.glad032, #啟用通路管理
       glad033 LIKE glad_t.glad033, #啟用品牌管理
       glad034 LIKE glad_t.glad034, #科目做多幣別管理
       gladud001 LIKE glad_t.gladud001, #自定義欄位(文字)001
       gladud002 LIKE glad_t.gladud002, #自定義欄位(文字)002
       gladud003 LIKE glad_t.gladud003, #自定義欄位(文字)003
       gladud004 LIKE glad_t.gladud004, #自定義欄位(文字)004
       gladud005 LIKE glad_t.gladud005, #自定義欄位(文字)005
       gladud006 LIKE glad_t.gladud006, #自定義欄位(文字)006
       gladud007 LIKE glad_t.gladud007, #自定義欄位(文字)007
       gladud008 LIKE glad_t.gladud008, #自定義欄位(文字)008
       gladud009 LIKE glad_t.gladud009, #自定義欄位(文字)009
       gladud010 LIKE glad_t.gladud010, #自定義欄位(文字)010
       gladud011 LIKE glad_t.gladud011, #自定義欄位(數字)011
       gladud012 LIKE glad_t.gladud012, #自定義欄位(數字)012
       gladud013 LIKE glad_t.gladud013, #自定義欄位(數字)013
       gladud014 LIKE glad_t.gladud014, #自定義欄位(數字)014
       gladud015 LIKE glad_t.gladud015, #自定義欄位(數字)015
       gladud016 LIKE glad_t.gladud016, #自定義欄位(數字)016
       gladud017 LIKE glad_t.gladud017, #自定義欄位(數字)017
       gladud018 LIKE glad_t.gladud018, #自定義欄位(數字)018
       gladud019 LIKE glad_t.gladud019, #自定義欄位(數字)019
       gladud020 LIKE glad_t.gladud020, #自定義欄位(數字)020
       gladud021 LIKE glad_t.gladud021, #自定義欄位(日期時間)021
       gladud022 LIKE glad_t.gladud022, #自定義欄位(日期時間)022
       gladud023 LIKE glad_t.gladud023, #自定義欄位(日期時間)023
       gladud024 LIKE glad_t.gladud024, #自定義欄位(日期時間)024
       gladud025 LIKE glad_t.gladud025, #自定義欄位(日期時間)025
       gladud026 LIKE glad_t.gladud026, #自定義欄位(日期時間)026
       gladud027 LIKE glad_t.gladud027, #自定義欄位(日期時間)027
       gladud028 LIKE glad_t.gladud028, #自定義欄位(日期時間)028
       gladud029 LIKE glad_t.gladud029, #自定義欄位(日期時間)029
       gladud030 LIKE glad_t.gladud030, #自定義欄位(日期時間)030
       glad035 LIKE glad_t.glad035, #是否是子系統科目
       glad036 LIKE glad_t.glad036  #貸方現金變動碼
END RECORD
#161111-00048#2 --e add
DEFINE l_sql            STRING
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_errno          LIKE gzze_t.gzze001 #錯誤訊息
DEFINE l_str            LIKE type_t.chr10     #180808-00051#1 add 
DEFINE l_acctype        LIKE type_t.chr1      #180808-00051#1 add 會科合併原則
DEFINE l_flag           LIKE type_t.chr1      #180808-00051#1 add 彙總方式
DEFINE l_tok            base.Stringtokenizer  #180808-00051#1 add 
DEFINE l_red_pn         LIKE type_t.chr1      #180808-00051#1 add
DEFINE l_success        LIKE type_t.num5      #180808-00051#1 add
DEFINE l_slip           LIKE type_t.chr20     #180808-00051#1 add
DEFINE l_groupglbc      LIKE type_t.chr1      #201207-00021#1 add 以現變碼拆分會科
   
   LET r_success = TRUE
   LET r_str_no  = ''
   LET r_end_no  = '' 
   LET l_cnt = 0
   #180808-00051#1---add---(S)拆解p_flag成l_flag和l_acctype
   LET l_flag = ''
   LET l_acctype = ''
   LET l_tok = base.StringTokenizer.create(p_flag,"@")
   WHILE l_tok.hasMoreTokens()
      IF cl_null(l_flag) THEN
         LET l_flag = l_tok.nextToken()
      ELSE
         #LET l_acctype = l_tok.nextToken() #201207-00021#1 mark
         #201207-00021#1 add ---s
         IF cl_null(l_acctype) THEN
            LET l_acctype = l_tok.nextToken()
         ELSE
            LET l_groupglbc = l_tok.nextToken()
         END IF         
         #201207-00021#1 add ---e
      END IF
   END WHILE
   LET p_flag = l_flag
   IF cl_null(l_acctype) THEN LET l_acctype = '3' END IF #沒有給會科合併原則的一律給3
   IF cl_null(l_groupglbc) THEN LET l_groupglbc = 'Y' END IF #201207-00021#1 add
   #180808-00051#1---add---(E)

   IF p_flag = 'N' AND p_sumtype = '2' THEN
      CALL cl_ask_pressanykey('axr-00061')
      LET r_success = FALSE
      RETURN r_success,r_str_no,r_end_no
   END IF

   #180208-00014#1-s
   ##CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING g_sub_success,l_glaa.*   #170430-00006#2 mark
   #SELECT glaa121 INTO l_glaa.glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld   #170430-00006#2 add
   SELECT glaa015,glaa019,glaa121
     INTO g_glaa015,g_glaa019,l_glaa.glaa121
     FROM glaa_t
    WHERE glaaent = g_enterprise AND glaald = p_ld
   #180208-00014#1-e

   #啟用分錄底稿時,走s_pre_voucher_ins_glap
   IF l_glaa.glaa121 = 'Y' THEN   
      LET l_wc =" glgbdocno IN (SELECT docno FROM s_voucher_tmp WHERE type = 0)"
     #LET l_str = p_sumtype,"@",l_acctype #180808-00051#1 add #201207-00021#1 mark
     LET l_str = p_sumtype,"@",l_acctype,"@",l_groupglbc  #201207-00021#1 add
     #CALL s_pre_voucher_ins_glap(p_type,p_cate,p_ld,p_date,p_slip,p_sumtype,l_wc)#180808-00051#1 mark
      CALL s_pre_voucher_ins_glap(p_type,p_cate,p_ld,p_date,p_slip,l_str,l_wc)    #180808-00051#1 add
           RETURNING r_success,r_str_no,r_end_no
   
   #不啟用分錄底稿時,走s_aapp330_gen_ap_1_ins_glap
   ELSE
      #會計科目不可為空
      SELECT count(*) INTO l_cnt FROM s_voucher_tmp
      LET l_sql = "SELECT COUNT(*) FROM s_voucher_tmp ",
                  " WHERE glaq002 IS NULL AND type = '2'"
      PREPARE chk_glaq002_pre FROM l_sql
      EXECUTE chk_glaq002_pre INTO l_cnt   
      IF l_cnt > 0 THEN  
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'axr-00068'
         LET g_errparam.extend = ''
         CALL cl_err()
      END IF
      SELECT SUM(CASE WHEN c IS NULL THEN 0 ELSE c END),
             SUM(CASE WHEN d IS NULL THEN 0 ELSE d END)
        INTO l_glaq003,l_glaq004
        FROM s_voucher_tmp 
       WHERE type = '2'
      #借貸金額
      IF cl_null(l_glaq003) THEN LET l_glaq003 = 0  END IF
      IF cl_null(l_glaq004) THEN LET l_glaq004 = 0  END IF
#      #180404-00011#1---mark---str 
#      #按余额类型生成分录 一个A科目设置为Y 一个B科目设置为N  
#      #例如A科目 d 得值为-100   c得是值为0 但是B科目d得值100  c得值为0
#      #當單別紅字傳票參數為'Y'且glad002='Y'時，傳票金額顯示在正常餘額方向且允許負數 这同样sum可能为0
#     #IF NOT (l_glaq003 > 0) THEN   #借方金額不可為0或為負數  #151120-00004#1
#      IF l_glaq003 = 0 THEN         #借方金額不可為0         #151120-00004#1
#         LET r_success = FALSE
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code   = 'aap-00076'
#         LET g_errparam.extend = ''
#         CALL cl_err()
#      END IF
#     #IF NOT (l_glaq004 > 0) THEN   #貸方金額不可為0或為負數  #151120-00004#1
#      IF l_glaq004 = 0 THEN         #貸方金額不可為0         #151120-00004#1
#         LET r_success = FALSE
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code   = 'aap-00076'
#         LET g_errparam.extend = ''
#         CALL cl_err()
#      END IF
#      #180404-00011#1---mark---end 
      IF l_glaq003 <> l_glaq004 THEN   #依據借貸不平衡時,若為 1.不能拋 2.拋過去由總帳修改
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'agl-00250'
         LET g_errparam.extend = ''
         CALL cl_err()
         IF p_glaa102 = '1' THEN 
            LET r_success = FALSE
         END IF
      END IF
           
      IF p_type = 3 AND cl_null(p_date)THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code   = 'acr-00045'
        LET g_errparam.extend = p_date
        CALL cl_err()
        LET r_success = FALSE
      END IF
   
      IF NOT r_success THEN
         RETURN r_success,r_str_no,r_end_no
      END IF   
      #180808-00051#1---add---(S) 檢視有無紅字傳票
      LET l_sql = "SELECT DISTINCT docno FROM s_voucher_tmp WHERE type = '1' "
      PREPARE s_aapp330_docno_p FROM l_sql
      DECLARE s_aapp330_docno_c CURSOR FOR s_aapp330_docno_p
      LET l_docno = ''
      LET g_red_pn = 'N'
      FOREACH s_aapp330_docno_c INTO l_docno
         IF cl_null(l_docno) THEN CONTINUE FOREACH END IF
         #获取单别
         CALL s_aooi200_fin_get_slip(l_docno) RETURNING l_success,l_slip
         #獲取單據別對應參數：紅字傳票否
         CALL s_fin_get_doc_para(p_ld,'',l_slip,'D-FIN-1002') RETURNING l_red_pn
         IF l_red_pn = 'Y' THEN LET g_red_pn = 'Y' END IF
      END FOREACH
      #是否設定按餘額類型產生分錄&借/貸
      LET l_sql = "SELECT glad002,glac008",
                  "  FROM glad_t,glac_t ",
                  " WHERE gladent = ",g_enterprise,
                  "   AND gladent = glacent AND glad001 = glac002", 
                  "   AND glac001 = (SELECT glaa004 FROM glaa_t WHERE glaaent = gladent AND glaald = gladld) AND gladld = ?",
                  "   AND glad001 = ? "
      PREPARE s_aapp330_p1 FROM l_sql
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 's_aapp330_p1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      #會科是否存在於單身沖銷類型為('11','12','13','14')的沖銷科目apde016中
      LET l_sql = "SELECT COUNT(1) FROM apde_t ",
                  " WHERE apdeent = ",g_enterprise, 
                  "   AND apdeld = ? ",
                 #"   AND apdedocno IN (SELECT DISTINCT glgbdocno FROM s_voucher_tmp WHERE type = '1')",#180808-00051#2 mark 
                  "   AND apdedocno IN (SELECT DISTINCT docno FROM s_voucher_tmp WHERE type = '1')",    #180808-00051#2 add  
                  "   AND apde002 IN ('11','12','13','14') ",
                  "   AND apde016 = ? "
      PREPARE s_aapp330_p2 FROM l_sql
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 's_aapp330_p2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      #180808-00051#1---add---(E)
      #1. 寫入傳票單頭/單身  2. p_cate:會影響寫入glap008
     #CALL s_aapp330_gen_ins_tmp(p_ld)           #170509-00094#1 add  #180208-00014#1 add p_ld #180808-00051#1 mark
      CALL s_aapp330_gen_ins_tmp(p_ld,p_cate,l_acctype) #180808-00051#1 add
     #CALL s_aapp330_gen_ap_1_ins_glap(p_cate,p_slip,p_date,p_ld,p_type)          #180808-00051#1 mark
     #CALL s_aapp330_gen_ap_1_ins_glap(p_cate,p_slip,p_date,p_ld,p_type,l_acctype)#180808-00051#1 add    #181015-00017#1 mark
     #CALL s_aapp330_gen_ap_1_ins_glap(p_cate,p_slip,p_date,p_ld,p_type,l_acctype,p_sumtype)             #181015-00017#1 add #201207-00021#1 mark
      CALL s_aapp330_gen_ap_1_ins_glap(p_cate,p_slip,p_date,p_ld,p_type,l_acctype,p_sumtype,l_groupglbc) #201207-00021#1 add
           RETURNING r_success,r_str_no,r_end_no           
   END IF   
   RETURN r_success,r_str_no,r_end_no
END FUNCTION

################################################################################
# Descriptions...: 傳票單頭
# Memo...........: 180808-00051#1 add p_acctype
# Memo...........: 181015-00017#1 add p_sumtype
# Memo...........: 201207-00021#1 add p_groupglbc
# Date & Author..: 14/07/21 By Belle
# Modify.........: 18/09/10 By 10554
# Modify.........: 18/10/15 By 10554
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_1_ins_glap(p_cate,p_slip,p_date,p_ld,p_type,p_acctype,p_sumtype,p_groupglbc)
DEFINE p_cate        LIKE gzza_t.gzza001
#DEFINE p_slip       LIKE ooba_t.ooba002    #160523-00023#1 mark
DEFINE p_slip        LIKE type_t.chr50      #160523-00023#1
DEFINE p_ld          LIKE glaa_t.glaald
DEFINE p_type        LIKE type_t.chr2
DEFINE p_date        LIKE glap_t.glapdocdt
DEFINE p_acctype     LIKE type_t.chr1       #180808-00051#1 add
DEFINE p_groupglbc   LIKE type_t.chr1       #201207-00021#1 add
DEFINE r_success     LIKE type_t.num5
DEFINE r_start_no    LIKE glap_t.glapdocno
DEFINE r_end_no      LIKE glap_t.glapdocno
DEFINE l_glaqcomp    LIKE glaq_t.glaqcomp
DEFINE l_glaa100     LIKE glaa_t.glaa100
DEFINE l_key1        LIKE type_t.chr80
DEFINE l_key2        LIKE type_t.chr80
DEFINE p_sumtype     LIKE type_t.chr2        #181015-00017#1 add
#DEFINE l_glap        RECORD LIKE glap_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_glap RECORD  #傳票憑證單頭檔
       glapent LIKE glap_t.glapent, #企業編號
       glapld LIKE glap_t.glapld, #帳套
       glapcomp LIKE glap_t.glapcomp, #法人
       glapdocno LIKE glap_t.glapdocno, #單號
       glapdocdt LIKE glap_t.glapdocdt, #單據日期
       glap001 LIKE glap_t.glap001, #傳票性質
       glap002 LIKE glap_t.glap002, #會計年度
       glap003 LIKE glap_t.glap003, #會計季別
       glap004 LIKE glap_t.glap004, #會計期別
       glap005 LIKE glap_t.glap005, #會計周別
       glap006 LIKE glap_t.glap006, #收支科目
       glap007 LIKE glap_t.glap007, #來源碼
       glap008 LIKE glap_t.glap008, #帳款類型
       glap009 LIKE glap_t.glap009, #總號
       glap010 LIKE glap_t.glap010, #借方總金額
       glap011 LIKE glap_t.glap011, #貸方總金額
       glap012 LIKE glap_t.glap012, #列印次數
       glap013 LIKE glap_t.glap013, #附件張數
       glap014 LIKE glap_t.glap014, #外幣憑證否
       glap015 LIKE glap_t.glap015, #原傳票編號
       glap016 LIKE glap_t.glap016, #來源帳套編號
       glap017 LIKE glap_t.glap017, #來源傳票編號
       glapownid LIKE glap_t.glapownid, #資料所有者
       glapowndp LIKE glap_t.glapowndp, #資料所屬部門
       glapcrtid LIKE glap_t.glapcrtid, #資料建立者
       glapcrtdp LIKE glap_t.glapcrtdp, #資料建立部門
       glapcrtdt LIKE glap_t.glapcrtdt, #資料創建日
       glapmodid LIKE glap_t.glapmodid, #資料修改者
       glapmoddt LIKE glap_t.glapmoddt, #最近修改日
       glapcnfid LIKE glap_t.glapcnfid, #資料確認者
       glapcnfdt LIKE glap_t.glapcnfdt, #資料確認日
       glappstid LIKE glap_t.glappstid, #資料過帳者
       glappstdt LIKE glap_t.glappstdt, #資料過帳日
       glapstus LIKE glap_t.glapstus, #狀態碼
       glapud001 LIKE glap_t.glapud001, #自定義欄位(文字)001
       glapud002 LIKE glap_t.glapud002, #自定義欄位(文字)002
       glapud003 LIKE glap_t.glapud003, #自定義欄位(文字)003
       glapud004 LIKE glap_t.glapud004, #自定義欄位(文字)004
       glapud005 LIKE glap_t.glapud005, #自定義欄位(文字)005
       glapud006 LIKE glap_t.glapud006, #自定義欄位(文字)006
       glapud007 LIKE glap_t.glapud007, #自定義欄位(文字)007
       glapud008 LIKE glap_t.glapud008, #自定義欄位(文字)008
       glapud009 LIKE glap_t.glapud009, #自定義欄位(文字)009
       glapud010 LIKE glap_t.glapud010, #自定義欄位(文字)010
       glapud011 LIKE glap_t.glapud011, #自定義欄位(數字)011
       glapud012 LIKE glap_t.glapud012, #自定義欄位(數字)012
       glapud013 LIKE glap_t.glapud013, #自定義欄位(數字)013
       glapud014 LIKE glap_t.glapud014, #自定義欄位(數字)014
       glapud015 LIKE glap_t.glapud015, #自定義欄位(數字)015
       glapud016 LIKE glap_t.glapud016, #自定義欄位(數字)016
       glapud017 LIKE glap_t.glapud017, #自定義欄位(數字)017
       glapud018 LIKE glap_t.glapud018, #自定義欄位(數字)018
       glapud019 LIKE glap_t.glapud019, #自定義欄位(數字)019
       glapud020 LIKE glap_t.glapud020, #自定義欄位(數字)020
       glapud021 LIKE glap_t.glapud021, #自定義欄位(日期時間)021
       glapud022 LIKE glap_t.glapud022, #自定義欄位(日期時間)022
       glapud023 LIKE glap_t.glapud023, #自定義欄位(日期時間)023
       glapud024 LIKE glap_t.glapud024, #自定義欄位(日期時間)024
       glapud025 LIKE glap_t.glapud025, #自定義欄位(日期時間)025
       glapud026 LIKE glap_t.glapud026, #自定義欄位(日期時間)026
       glapud027 LIKE glap_t.glapud027, #自定義欄位(日期時間)027
       glapud028 LIKE glap_t.glapud028, #自定義欄位(日期時間)028
       glapud029 LIKE glap_t.glapud029, #自定義欄位(日期時間)029
       glapud030 LIKE glap_t.glapud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_ooef008     LIKE ooef_t.ooef008
DEFINE l_ooef010     LIKE ooef_t.ooef010
DEFINE l_glaa001     LIKE glaa_t.glaa001     #帳簿幣別
DEFINE l_glaa024     LIKE glaa_t.glaa024
DEFINE l_glap010     LIKE glap_t.glap010     #金額
DEFINE l_glap011     LIKE glap_t.glap011     #金額
DEFINE l_glap013     LIKE glap_t.glap013     #附件張數
DEFINE l_glap014     LIKE glap_t.glap014     #外幣憑證否
DEFINE l_docno       LIKE glap_t.glapdocno   #前端來源單據號碼
DEFINE l_str         LIKE type_t.chr80
DEFINE l_sql         STRING
DEFINE l_date        LIKE glap_t.glapdocdt
DEFINE l_glap001     LIKE glap_t.glap001     #150416-00004#2
DEFINE l_prog        LIKE gzza_t.gzza001     #150416-00004#2
DEFINE l_ap_slip     LIKE apca_t.apcadocno
DEFINE l_dfin5002    LIKE type_t.chr1
DEFINE l_dfin0031      LIKE type_t.chr1       #181115-00027#1 Add
DEFINE l_success1      LIKE type_t.num5       #181115-00027#1 Add
DEFINE l_success       LIKE type_t.num5       #181115-00027#1 Add
#190510-00022#1---add---(S)
DEFINE l_glaa003       LIKE glaa_t.glaa003
DEFINE l_flag          LIKE type_t.chr1
DEFINE l_errno         LIKE type_t.chr100
DEFINE l_glav002       LIKE glav_t.glav002
DEFINE l_glav005       LIKE glav_t.glav005
DEFINE l_sdate_s       LIKE glav_t.glav004
DEFINE l_sdate_e       LIKE glav_t.glav004
DEFINE l_glav006       LIKE glav_t.glav006
DEFINE l_pdate_s       LIKE glav_t.glav004   #當期起始日
DEFINE l_pdate_e       LIKE glav_t.glav004   #當期截止日
DEFINE l_glav007       LIKE glav_t.glav007
DEFINE l_wdate_s       LIKE glav_t.glav004
DEFINE l_wdate_e       LIKE glav_t.glav004
#190510-00022#1---add---(E)
DEFINE l_wc            STRING #190528-00007#1 add
DEFINE l_sfin0003      LIKE type_t.chr1  #190528-00007#1 add #190619-00013#1 mark #190806-00013#1 remark
#190507-00025#1 add ---s
DEFINE l_tok           base.Stringtokenizer  
DEFINE l_cate          LIKE type_t.chr10  #原帳款類型 
DEFINE l_cate2         LIKE type_t.chr10  #沖銷類型 
DEFINE l_cate3         LIKE type_t.chr10  #沖銷類型   
DEFINE l_apda001       LIKE apda_t.apda001   
DEFINE l_apca001       LIKE apca_t.apca001
DEFINE l_glap008       LIKE glap_t.glap008
#190507-00025#1 add ---e
#201207-00021#1 add ---s
DEFINE l_glgbdocno     LIKE glgb_t.glgbdocno
DEFINE l_glgbseq       LIKE glgb_t.glgbseq
#201207-00021#1 add ---e

   WHENEVER ERROR CONTINUE
   LET r_success  = FALSE
   LET r_start_no = NULL
   LET r_end_no   = NULL
   LET l_glap001 = '1'
   
   #190507-00025#1 add ---s
   #拆解p_cate成l_cate和l_cate2和l_cate3
   LET l_cate = '' LET l_cate2 = '' LET l_cate3 = ''
   LET l_tok = base.StringTokenizer.create(p_cate,"@")
   WHILE l_tok.hasMoreTokens()
      IF cl_null(l_cate) THEN
         LET l_cate = l_tok.nextToken()
      ELSE
         IF cl_null(l_cate2) THEN
            LET l_cate2 = l_tok.nextToken()
         ELSE
            LET l_cate3 = l_tok.nextToken()
         END IF  
      END IF
   END WHILE
   LET p_cate = l_cate
   
   LET l_sql = " SELECT apdadocno FROM apda_t WHERE apdaent= ? AND apdald = ? AND apdadocno=? FOR UPDATE "
   DECLARE s_voucher_aplock_p2 CURSOR FROM l_sql
   #190507-00025#1 add ---e   
   
   CASE p_cate
        WHEN 'P10' LET l_sql = " SELECT apcadocno FROM apca_t WHERE apcaent= ? AND apcald = ? AND apcadocno=? FOR UPDATE "
                   
        WHEN 'P20' LET l_sql = " SELECT apdadocno FROM apda_t WHERE apdaent= ? AND apdald = ? AND apdadocno=? FOR UPDATE "
                   
        WHEN 'P30' LET l_sql = " SELECT apdadocno FROM apda_t WHERE apdaent= ? AND apdald = ? AND apdadocno=? FOR UPDATE "
                   
        WHEN 'P40' LET l_sql = " SELECT xregdocno FROM xreg_t WHERE xregent= ? AND xregld = ? AND xregdocno=? FOR UPDATE "
                   SELECT (CASE WHEN glca002 = '2' THEN '5' ELSE '1' END) INTO l_glap001
                     FROM glca_t
                    WHERE glcaent = g_enterprise
                      AND glcald  = p_ld AND glca001 = 'AP'
        WHEN 'P50' LET l_sql = " SELECT xremdocno FROM xrem_t WHERE xrement= ? AND xremld = ? AND xremdocno=? FOR UPDATE "
                       
        WHEN 'P51' LET l_sql = " SELECT xremdocno FROM xrem_t WHERE xrement= ? AND xremld = ? AND xremdocno=? FOR UPDATE "
                        
        WHEN 'P60' LET l_sql = " SELECT xrejdocno FROM xrej_t WHERE xrejent= ? AND xrejld = ? AND xrejdocno=? FOR UPDATE "
                   SELECT (CASE WHEN glcb002 = '2' THEN '5' ELSE '1' END) INTO l_glap001
                     FROM glcb_t
                    WHERE glcbent = g_enterprise
                      AND glcbld  = p_ld AND glcb001 = 'AP'
   END CASE
   IF cl_null(l_glap001) THEN LET l_glap001 = '1' END IF
   IF l_glap001 = '1' THEN
      LET l_prog = 'aglt310'
   ELSE
      LET l_prog = 'aglt350'
   END IF
   DECLARE s_voucher_aplock_p1 CURSOR FROM l_sql        
   
   IF cl_null(l_cate2) THEN #190507-00025#1 add
      LET l_sql = " SELECT DISTINCT docno FROM s_voucher_tmp WHERE type = 1"
      PREPARE s_voucher_tmp_p FROM l_sql
      DECLARE s_voucher_tmp_c CURSOR FOR s_voucher_tmp_p
      FOREACH s_voucher_tmp_c INTO l_docno       
         OPEN s_voucher_aplock_p1 USING g_enterprise,p_ld,l_docno            
         IF STATUS THEN
            RETURN r_success,r_start_no,r_end_no  
         END IF
      END FOREACH
   #190507-00025#1 add ---s
   ELSE
      LET l_cnt = 0
      LET l_sql = " SELECT DISTINCT docno, ",
                  "       (SELECT COUNT(1) FROM apda_t WHERE apdaent = ",g_enterprise,
                  "           AND apdald = '",p_ld,"' AND apdadocno = docno ) ",
                  "   FROM s_voucher_tmp WHERE type = 1 "
      PREPARE s_voucher_lock_pre FROM l_sql
      DECLARE s_voucher_lock_cur CURSOR FOR s_voucher_lock_pre
      FOREACH s_voucher_lock_cur INTO l_docno,l_cnt
         IF l_cnt = 0 THEN
            OPEN s_voucher_aplock_p1 USING g_enterprise,p_ld,l_docno  #aapt3*
         ELSE
            OPEN s_voucher_aplock_p2 USING g_enterprise,p_ld,l_docno  #aapt4*
         END IF
         IF STATUS THEN
            RETURN r_success,r_start_no,r_end_no  
         END IF
         LET l_cnt = 0
      END FOREACH 
   END IF
   #190507-00025#1 add ---e
  
   #1.定义CURSOR
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,'',1,'Y') RETURNING g_sub_success            #180808-00051#1 mark
  #CALL s_aapp330_gen_ap_1_def_cursor(p_ld,'',1,'Y',p_acctype) RETURNING g_sub_success  #180808-00051#1 add  #181015-00017#1 mark
   CALL s_aapp330_gen_ap_1_def_cursor(p_ld,'',p_sumtype,'Y',p_acctype) RETURNING g_sub_success  #181015-00017#1 add
   IF NOT g_sub_success THEN
      RETURN r_success,r_start_no,r_end_no  
   END IF
   
   #若p_date不为空时,则表示凭证日期均为p_date
   IF NOT cl_null(p_date) THEN
      UPDATE s_voucher_tmp SET docdt = p_date
       WHERE type = '2'
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'update docdt'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success,r_start_no,r_end_no  
      END IF
   END IF
   #帳套主幣別
   SELECT glaa001,glaacomp,glaa100,glaa024
         ,glaa003   #190510-00022#1 add
     INTO l_glaa001,l_glaqcomp,l_glaa100,l_glaa024
         ,l_glaa003 #190510-00022#1 add
     FROM glaa_t
    WHERE glaaent = g_enterprise AND glaald = p_ld
   
   SELECT ooef008,ooef010 INTO l_ooef008,l_ooef010
    FROM ooef_t
    WHERE ooefent = g_enterprise AND ooef001 = l_glaqcomp
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'sel ooef'
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN r_success,r_start_no,r_end_no
   END IF
   
   CALL s_fin_get_doc_para(p_ld,l_glaqcomp,p_slip,'D-FIN-0031') RETURNING l_dfin0031  #181115-00027#1---add
   
   #190806-00013#1 remark ---s
   #190619-00013#1 mark ---s   
   #190528-00007#1 add ---s
   LET l_sfin0003 = ''
   CALL cl_get_para(g_enterprise,l_glaqcomp,'S-FIN-0003') RETURNING l_sfin0003
   IF cl_null(l_sfin0003) THEN LET l_sfin0003 = '1' END IF   
   #190528-00007#1 add ---e
   #190619-00013#1 mark ---e
   #190806-00013#1 remark ---e
   
   #150126-00027#1---(S)
   IF l_glaa100 = 'Y' THEN
      DELETE FROM s_fin_tmp  #160727-00019#31  2016/08/10  By 08734    临时表长度超过15码的减少到15码以下 s_fin_tmp_conti_no ——> s_fin_tmp
      IF NOT cl_null(p_date) THEN   #彙總類型是3的 p_date必傳
         CALL s_fin_continue_no_ins(p_ld,l_glaa024,p_slip,p_date,'3') RETURNING g_sub_success,g_errno
      ELSE
         LET l_sql = " SELECT DISTINCT docdt FROM s_voucher_tmp WHERE type = '1' "
         PREPARE continue_no_pb2 FROM l_sql
         DECLARE continue_no_cs2 CURSOR FOR continue_no_pb2
         FOREACH continue_no_cs2 INTO l_date
            CALL s_fin_continue_no_ins(p_ld,l_glaa024,p_slip,l_date,'3') RETURNING g_sub_success,g_errno
         END FOREACH
      END IF
   END IF
   
   LET l_sql = " SELECT docno FROM s_fin_tmp WHERE isuse = 'N' ORDER BY docno"  #160727-00019#31  2016/08/10  By 08734    临时表长度超过15码的减少到15码以下 s_fin_tmp_conti_no ——> s_fin_tmp
   PREPARE continue_no_pb1 FROM l_sql
   DECLARE continue_no_cs1 CURSOR WITH HOLD FOR continue_no_pb1
   #150126-00027#1---(E)   
   
   #計算迴圈次數
   #IF g_prog = 'aapp330' OR g_prog = 'aapp420' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapp330*' OR g_prog MATCHES 'aapp420*' THEN   #170301-00021#1 by 09263 --add
      LET l_str = s_fin_get_colname('aglt310','glapdocno') CLIPPED,':' CLIPPED
      DISPLAY '' ,0 TO stagenow,stagecomplete
      SELECT count(*) INTO l_cnt
        FROM ( SELECT UNIQUE key1,key2 FROM s_voucher_tmp WHERE type = '2' )
      CALL cl_progress_bar_no_window(l_cnt)
   END IF
   #計算迴圈次數
   FOREACH gen_ap_1_c21 INTO l_key1,l_key2        
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'gen_ap_1_c21'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success,r_start_no,r_end_no
      END IF
      INITIALIZE l_glap.* TO NULL
      LET g_dfin1002 = ''
      IF p_cate = 'P51' THEN
        #aapt931是否允许红字传票 #IF N 則以正數抛轉至傳票 並且 借貸相反。
        CALL s_fin_get_doc_para(p_ld,l_glaqcomp,p_slip,'D-FIN-1002') RETURNING g_dfin1002
      END IF

      LET l_glap.glapent   =  g_enterprise  #企業代碼
      LET l_glap.glapld    =  p_ld          #帳別
      IF NOT cl_null(p_date) THEN
         LET l_glap.glapdocdt =  p_date     #單據日期
      ELSE
         SELECT DISTINCT docdt 
           INTO l_glap.glapdocdt
           FROM s_voucher_tmp
          WHERE key1 = l_key1 AND key2 =l_key2
      END IF
      
      #自动编号
      #150126-00027#1---(S)
      SELECT count(*) INTO l_cnt
        FROM s_fin_tmp #160727-00019#31  2016/08/10  By 08734    临时表长度超过15码的减少到15码以下 s_fin_tmp_conti_no ——> s_fin_tmp
       WHERE isuse = 'N'
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
      
      IF l_cnt > 0 THEN
         FOREACH continue_no_cs1 INTO l_glap.glapdocno
            UPDATE s_fin_tmp   #160727-00019#31  2016/08/10  By 08734    临时表长度超过15码的减少到15码以下 s_fin_tmp_conti_no ——> s_fin_tmp
               SET isuse = 'Y' 
             WHERE docno = l_glap.glapdocno
            #檢查是否號碼已被使用
            SELECT count(*) INTO l_cnt
              FROM glap_t
             WHERE glapent = g_enterprise AND glapld = p_ld
              AND glapdocno=l_glap.glapdocno
            IF l_cnt = 0 THEN
               EXIT FOREACH
            END IF
         END FOREACH
         #假設整個單號都已被取用還是透過s_aooi200_fin_gen_docno取單號
         IF l_cnt > 0 THEN
            CALL s_aooi200_fin_gen_docno(p_ld,'','',p_slip,l_glap.glapdocdt,l_prog) RETURNING g_sub_success,l_glap.glapdocno
         END IF
      ELSE
         CALL s_aooi200_fin_gen_docno(p_ld,'','',p_slip,l_glap.glapdocdt,l_prog) RETURNING g_sub_success,l_glap.glapdocno
      END IF
      
      #150126-00027#1---(E)
      IF NOT g_sub_success THEN RETURN r_success,r_start_no,r_end_no END IF
      #IF g_prog = 'aapp330' OR g_prog = 'aapp420' THEN   #170301-00021#1 by 09263 --mark
      IF g_prog MATCHES 'aapp330*' OR g_prog MATCHES 'aapp420*' THEN   #170301-00021#1 by 09263 --add
         CALL cl_progress_no_window_ing(l_str||l_glap.glapdocno)
      END IF
      #处理起始单号,截止单号
      IF cl_null(r_start_no) THEN LET r_start_no = l_glap.glapdocno END IF
      LET r_end_no   = l_glap.glapdocno 
      
      LET l_glap.glapcomp  = l_glaqcomp         #法人
      LET l_glap.glap001   = l_glap001          #傳票性質
      
      # 會計年度/會計期別/會計季別/會計周別
      #190510-00022#1---add---(S)
      CALL s_get_accdate(l_glaa003,l_glap.glapdocdt,'','')
           RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
                     l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e
      LET l_glap.glap002 = l_glav002
      LET l_glap.glap004 = l_glav006
      LET l_glap.glap003 = l_glav005
      LET l_glap.glap005 = l_glav007          
      #190510-00022#1---add---(E)
      #190510-00022#1---mark---(S)
      #SELECT oogc015,oogc006,oogc007,oogc008
      #  INTO l_glap.glap002,l_glap.glap004,l_glap.glap003,l_glap.glap005
      #  FROM oogc_t
      # WHERE oogcent = g_enterprise
      #   AND oogc001 = l_ooef008
      #   AND oogc002 = l_ooef010
      #   AND oogc003 = l_glap.glapdocdt
      #190510-00022#1---mark---(E)
      LET l_glap.glap006   =  ''                #收支科目
      #LET l_glap.glap007   =  p_type           #來源碼   #180402-00049#1 mark
      #180402-00049#1 add ------
      IF l_glap001 = '1' THEN
         LET l_glap.glap007 = p_type
      ELSE
         LET l_glap.glap007 = 'AC'
      END IF
      #180402-00049#1 add end---
      LET l_glap.glap008   =  p_cate            #帳款類型
      LET l_glap.glap009   =  0                 #總號
      LET l_glap.glap010   =  0                 #借方總金額
      LET l_glap.glap011   =  0                 #貸方總金額
      LET l_glap.glap012   =  0                 #列印次數
      LET l_glap.glap013   =  0                 #附件張數
      LET l_glap.glap014   =  'N'               #外幣憑證否(預設N)，若單身有一筆Y的用回寫的方式
      LET l_glap.glap015   =  ''                #原傳票編號
      LET l_glap.glap016   =  ''                #來源帳別編號
      LET l_glap.glap017   =  ''                #來源傳票編號
      LET l_glap.glapownid =  g_user            #資料所有者
      LET l_glap.glapowndp =  g_dept            #資料所屬部門
      LET l_glap.glapcrtid =  g_user            #資料建立者
      LET l_glap.glapcrtdp =  g_dept            #資料建立部門
      LET l_glap.glapcrtdt =  cl_get_current()  #資料創建日
      LET l_glap.glapmodid =  ''                #資料修改者
      LET l_glap.glapmoddt =  ''                #最近修改日
      LET l_glap.glapcnfid =  ''                #資料確認者
      LET l_glap.glapcnfdt =  ''                #資料確認日
      LET l_glap.glappstid =  ''                #資料過帳者
      LET l_glap.glappstdt =  ''                #資料過帳日
      LET l_glap.glapstus  =  'N'               #狀態碼

     #INSERT INTO glap_t VALUES(l_glap.*) #161111-00048#2 mark
      #161111-00048#2 --s add
      INSERT INTO glap_t(glapent,glapld,glapcomp,glapdocno,glapdocdt,
                         glap001,glap002,glap003,glap004,glap005,
                         glap006,glap007,glap008,glap009,glap010,
                         glap011,glap012,glap013,glap014,glap015,
                         glap016,glap017,glapownid,glapowndp,glapcrtid,
                         glapcrtdp,glapcrtdt,glapmodid,glapmoddt,glapcnfid,
                         glapcnfdt,glappstid,glappstdt,glapstus,glapud001,
                         glapud002,glapud003,glapud004,glapud005,glapud006,
                         glapud007,glapud008,glapud009,glapud010,glapud011,
                         glapud012,glapud013,glapud014,glapud015,glapud016,
                         glapud017,glapud018,glapud019,glapud020,glapud021,
                         glapud022,glapud023,glapud024,glapud025,glapud026,
                         glapud027,glapud028,glapud029,glapud030)
      VALUES(l_glap.glapent,l_glap.glapld,l_glap.glapcomp,l_glap.glapdocno,l_glap.glapdocdt,
             l_glap.glap001,l_glap.glap002,l_glap.glap003,l_glap.glap004,l_glap.glap005,
             l_glap.glap006,l_glap.glap007,l_glap.glap008,l_glap.glap009,l_glap.glap010,
             l_glap.glap011,l_glap.glap012,l_glap.glap013,l_glap.glap014,l_glap.glap015,
             l_glap.glap016,l_glap.glap017,l_glap.glapownid,l_glap.glapowndp,l_glap.glapcrtid,
             l_glap.glapcrtdp,l_glap.glapcrtdt,l_glap.glapmodid,l_glap.glapmoddt,l_glap.glapcnfid,
             l_glap.glapcnfdt,l_glap.glappstid,l_glap.glappstdt,l_glap.glapstus,l_glap.glapud001,
             l_glap.glapud002,l_glap.glapud003,l_glap.glapud004,l_glap.glapud005,l_glap.glapud006,
             l_glap.glapud007,l_glap.glapud008,l_glap.glapud009,l_glap.glapud010,l_glap.glapud011,
             l_glap.glapud012,l_glap.glapud013,l_glap.glapud014,l_glap.glapud015,l_glap.glapud016,
             l_glap.glapud017,l_glap.glapud018,l_glap.glapud019,l_glap.glapud020,l_glap.glapud021,
             l_glap.glapud022,l_glap.glapud023,l_glap.glapud024,l_glap.glapud025,l_glap.glapud026,
             l_glap.glapud027,l_glap.glapud028,l_glap.glapud029,l_glap.glapud030)
      #161111-00048#2 --e add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins glap'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         LET r_start_no = NULL
         LET r_end_no   = NULL
         RETURN r_success,r_start_no,r_end_no         
      END IF        
      
      #170116-00074#4 ---s--- aapp330不再作轉出動作
      #150703-00021#24 ---s--- 預算控管 整筆轉出
      #IF p_cate = 'P10' THEN
      #   FOREACH gen_ap_1_c23 USING l_key1,l_key2 INTO l_docno
      #      CALL s_aooi200_fin_get_slip(l_docno) RETURNING g_sub_success,l_ap_slip
      #      CALL s_fin_get_doc_para(p_ld,l_glap.glapcomp,l_ap_slip,'D-FIN-5002') RETURNING l_dfin5002
      #      IF l_dfin5002 ='Y' THEN  # 是否做預算控管
      #         CALL s_aapt300_bgbd_upd(l_docno,p_ld,'','UD','3') RETURNING g_sub_success,g_errno
      #         IF NOT g_sub_success THEN
      #            LET r_start_no = NULL
      #            LET r_end_no   = NULL
      #            RETURN r_success,r_start_no,r_end_no 
      #         END IF
      #      END IF  
      #   END FOREACH
      #END IF
      #150703-00021#24 ---e---
      #170116-00074#4 ---e---
      #190528-00007#1 add ---s
      #IF l_sfin0003 = '2' THEN #190619-00013#1 mark #190806-00013#1 remark #201207-00021#1 mark
      #更新底稿
      FOREACH gen_ap_1_c23 USING l_key1,l_key2 INTO l_docno
         LET l_wc = " glgadocno = '",l_docno,"'" 
         CALL s_pre_voucher_upd('AP',p_cate,p_ld,'',l_glap.glapdocno,l_glap.glapdocdt,l_wc) RETURNING g_sub_success 
      END FOREACH
      #END IF #190619-00013#1 mark #190806-00013#1 remark #201207-00021#1 mark
      #190528-00007#1 add ---e
            
      #产生凭证单身
      #CALL s_aapp330_gen_ap_1_ins_glaq(l_glap.glapdocno,p_ld,l_key1,l_key2) RETURNING g_sub_success #190528-00007#1 mark
      #CALL s_aapp330_gen_ap_1_ins_glaq(l_glap.glapdocno,p_ld,l_key1,l_key2,p_acctype) RETURNING g_sub_success  #190528-00007#1 add #201207-00021#1 mark
      CALL s_aapp330_gen_ap_1_ins_glaq(l_glap.glapdocno,p_ld,l_key1,l_key2,p_acctype,p_groupglbc) RETURNING g_sub_success #201207-00021#1 add      
      IF NOT g_sub_success THEN
         LET r_start_no = NULL
         LET r_end_no   = NULL
         RETURN r_success,r_start_no,r_end_no           
      END IF
      
      #190528-00007#1 add ---s
      #IF l_sfin0003 = '2' THEN #190619-00013#1 mark #190806-00013#1 remark #201207-00021#1 mark
      #刪除底稿
      FOREACH gen_ap_1_c23 USING l_key1,l_key2 INTO l_docno
         CALL s_pre_voucher_del('AP',p_cate,p_ld,l_docno) RETURNING g_sub_success
      END FOREACH
      #END IF #190619-00013#1 mark #190806-00013#1 remark #201207-00021#1 mark
      #190528-00007#1 add ---e
      
      #一笔凭证处理完毕后,对凭证单头进行更行
      #總:借/貸/附件張數
      SELECT SUM(glaq003),SUM(glaq004) INTO l_glap010,l_glap011
        FROM glaq_t
       WHERE glaqent = l_glap.glapent AND glaqld = p_ld AND glaqdocno = l_glap.glapdocno
      IF cl_null(l_glap010) THEN LET l_glap010 = 0 END IF
      IF cl_null(l_glap011) THEN LET l_glap011 = 0 END IF

      IF cl_null(l_glap013) THEN LET l_glap013 = 0 END IF
      LET l_cnt = 0
      LET l_glap014 = 'N'
      SELECT count(*) INTO l_cnt
        FROM glaq_t
       WHERE glaqent   = l_glap.glapent   AND glaqld  = l_glap.glapld
         AND glaqdocno = l_glap.glapdocno AND glaq005 <> l_glaa001
      IF l_cnt > 0 THEN LET l_glap014 = 'Y' END IF
      UPDATE glap_t SET glap010 = l_glap010,glap011 = l_glap011,
                        glap013 = l_glap013,glap014 = l_glap014
       WHERE glapent = l_glap.glapent AND glapld = l_glap.glapld AND glapdocno = l_glap.glapdocno
      IF SQLCA.sqlcode THEN
         LET r_start_no = NULL
         LET r_end_no   = NULL
         RETURN r_success,r_start_no,r_end_no
      END IF
      ##回寫單據性質
      FOREACH gen_ap_1_c23 USING l_key1,l_key2 INTO l_docno
         CASE p_cate
              WHEN 'P10'
                        #EXECUTE gen_ap_1_p24 USING l_glap.glapdocno,l_docno #190507-00025#1 mark
                        #190507-00025#1 add ---s
                        IF cl_null(l_cate2) THEN
                           EXECUTE gen_ap_1_p24 USING l_glap.glapdocno,l_docno
                        ELSE
                           LET l_cnt = 0
                           EXECUTE sel_apda_pre USING l_docno INTO l_cnt
                           IF l_cnt = 0 THEN
                              EXECUTE gen_ap_1_p24 USING l_glap.glapdocno,l_docno #aapt3*                              
                           ELSE
                              EXECUTE gen_ap_1_p25 USING l_glap.glapdocno,l_docno #aapt4*
                           END IF
                        END IF   
                        
                        #aapp330依來源單據個別產生時,帳款類型glap008要與原傳票拋轉相同
                        IF p_sumtype = '1' AND g_prog MATCHES 'aapp330*' THEN 
                           LET l_apca001 = '' LET l_glap008 = ''
                           EXECUTE sel_glap008_pre USING l_docno,l_docno INTO l_apca001
                           IF l_apca001 MATCHES '4*' THEN
                              CASE l_apca001
                                 WHEN '43'
                                    LET l_glap008 = 'P30'                                 
                                 OTHERWISE
                                    LET l_glap008 = 'P20'                                 
                              END CASE                                                                        
                              EXECUTE upd_glap008_pre USING l_glap008,l_glap.glapdocno                              
                           END IF
                        END IF
                        #190507-00025#1 add ---e
              WHEN 'P20'
                        EXECUTE gen_ap_1_p25 USING l_glap.glapdocno,l_docno
              WHEN 'P30'
                        EXECUTE gen_ap_1_p25 USING l_glap.glapdocno,l_docno
         END CASE                     
      END FOREACH
      
      #181115-00027#1----add-----str
      #单据别设置立即审核则产生总账资料时候也需要立即审核
      IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN
         CALL s_voucher_conf_chk(p_ld,l_glap.glapdocno) RETURNING l_success
         IF NOT l_success THEN
            LET r_start_no = ""
            LET r_end_no   = ""
         END IF
         #當aglt310、aglt320、aglt330時，判斷是否進行細項里沖帳，并進行檢查
         IF l_glap.glap001 MATCHES'[123]' THEN
            CALL s_aglt310_glax_and_glay_chk(p_ld,l_glap.glapdocno) RETURNING l_success1
            IF l_success = TRUE THEN
               LET l_success=l_success1
            END IF
         END IF

         IF l_success = TRUE THEN
            CALL s_voucher_conf_upd(p_ld,l_glap.glapdocno) RETURNING l_success
            #當aglt310、aglt320、aglt330時，更新細項立沖帳資料
            IF l_glap.glap001 MATCHES'[123]' AND l_success=TRUE THEN
               CALL s_aglt310_conf_upd_glax_glay(p_ld,l_glap.glapdocno) RETURNING l_success1
               LET l_success=l_success1
            END IF
         ELSE
            LET r_start_no = ""
            LET r_end_no   = ""
         END IF

         LET l_glap.glapmodid = g_user
         LET l_glap.glapmoddt = cl_get_current()
         LET l_glap.glapstus  = 'Y'
   
         #異動狀態碼欄位/修改人/修改日期
         UPDATE glap_t SET (glapstus,glapmodid,glapmoddt) = (l_glap.glapstus,l_glap.glapmodid,l_glap.glapmoddt)     
          WHERE glapent   = g_enterprise AND glapld = p_ld
            AND glapdocno = l_glap.glapdocno

         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            LET l_success = FALSE
            LET r_start_no = ""
            LET r_end_no   = ""
         END IF

         IF NOT l_success THEN
            LET r_start_no = ""
            LET r_end_no   = ""
            RETURN r_success,r_start_no,r_end_no
         END IF
      END IF
    
      #181115-00027#1----add-----end

   END FOREACH
      
   LET r_success = TRUE
   RETURN r_success,r_start_no,r_end_no
END FUNCTION

################################################################################
# Descriptions...: 傳票單身
# Memo...........: 
# Date & Author..: 14/07/21 By Belle
# Modify.........: #190528-00007#1 add by 10043 增加傳參 p_acctype
#                : #201207-00021#1 add by 10043 增加傳參 p_groupglbc
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ap_1_ins_glaq(p_glapdocno,p_glaqld,p_key1,p_key2,p_acctype,p_groupglbc)
DEFINE p_glapdocno      LIKE glap_t.glapdocno
DEFINE p_glaqld         LIKE glaq_t.glaqld
DEFINE p_key1           LIKE type_t.chr80
DEFINE p_key2           LIKE type_t.chr80
DEFINE p_acctype        LIKE type_t.chr1 #190528-00007#1 add
DEFINE p_groupglbc      LIKE type_t.chr1 #201207-00021#1 add
DEFINE r_success        LIKE type_t.num5
#DEFINE l_glaq           RECORD LIKE glaq_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_glaq RECORD  #傳票憑證單身檔
       glaqent LIKE glaq_t.glaqent, #企業編號
       glaqcomp LIKE glaq_t.glaqcomp, #法人
       glaqld LIKE glaq_t.glaqld, #帳套
       glaqdocno LIKE glaq_t.glaqdocno, #單號
       glaqseq LIKE glaq_t.glaqseq, #項次
       glaq001 LIKE glaq_t.glaq001, #摘要
       glaq002 LIKE glaq_t.glaq002, #科目編號
       glaq003 LIKE glaq_t.glaq003, #借方金額
       glaq004 LIKE glaq_t.glaq004, #貸方金額
       glaq005 LIKE glaq_t.glaq005, #交易幣別
       glaq006 LIKE glaq_t.glaq006, #匯率
       glaq007 LIKE glaq_t.glaq007, #計價單位
       glaq008 LIKE glaq_t.glaq008, #數量
       glaq009 LIKE glaq_t.glaq009, #單價
       glaq010 LIKE glaq_t.glaq010, #原幣金額
       glaq011 LIKE glaq_t.glaq011, #票據編碼
       glaq012 LIKE glaq_t.glaq012, #票據日期
       glaq013 LIKE glaq_t.glaq013, #申請人
       glaq014 LIKE glaq_t.glaq014, #銀行帳號
       glaq015 LIKE glaq_t.glaq015, #款別編號
       glaq016 LIKE glaq_t.glaq016, #收支專案
       glaq017 LIKE glaq_t.glaq017, #營運據點
       glaq018 LIKE glaq_t.glaq018, #部門
       glaq019 LIKE glaq_t.glaq019, #利潤/成本中心
       glaq020 LIKE glaq_t.glaq020, #區域
       glaq021 LIKE glaq_t.glaq021, #收付款客商
       glaq022 LIKE glaq_t.glaq022, #帳款客戶
       glaq023 LIKE glaq_t.glaq023, #客群
       glaq024 LIKE glaq_t.glaq024, #產品類別
       glaq025 LIKE glaq_t.glaq025, #人員
       glaq026 LIKE glaq_t.glaq026, #no use
       glaq027 LIKE glaq_t.glaq027, #專案編號
       glaq028 LIKE glaq_t.glaq028, #WBS
       glaq029 LIKE glaq_t.glaq029, #自由核算項一
       glaq030 LIKE glaq_t.glaq030, #自由核算項二
       glaq031 LIKE glaq_t.glaq031, #自由核算項三
       glaq032 LIKE glaq_t.glaq032, #自由核算項四
       glaq033 LIKE glaq_t.glaq033, #自由核算項五
       glaq034 LIKE glaq_t.glaq034, #自由核算項六
       glaq035 LIKE glaq_t.glaq035, #自由核算項七
       glaq036 LIKE glaq_t.glaq036, #自由核算項八
       glaq037 LIKE glaq_t.glaq037, #自由核算項九
       glaq038 LIKE glaq_t.glaq038, #自由核算項十
       glaq039 LIKE glaq_t.glaq039, #匯率(本位幣二)
       glaq040 LIKE glaq_t.glaq040, #借方金額(本位幣二)
       glaq041 LIKE glaq_t.glaq041, #貸方金額(本位幣二)
       glaq042 LIKE glaq_t.glaq042, #匯率(本位幣三)
       glaq043 LIKE glaq_t.glaq043, #借方金額(本位幣三)
       glaq044 LIKE glaq_t.glaq044, #貸方金額(本位幣三)
       glaq051 LIKE glaq_t.glaq051, #經營方式
       glaq052 LIKE glaq_t.glaq052, #通路
       glaq053 LIKE glaq_t.glaq053, #品牌
       glaqud001 LIKE glaq_t.glaqud001, #自定義欄位(文字)001
       glaqud002 LIKE glaq_t.glaqud002, #自定義欄位(文字)002
       glaqud003 LIKE glaq_t.glaqud003, #自定義欄位(文字)003
       glaqud004 LIKE glaq_t.glaqud004, #自定義欄位(文字)004
       glaqud005 LIKE glaq_t.glaqud005, #自定義欄位(文字)005
       glaqud006 LIKE glaq_t.glaqud006, #自定義欄位(文字)006
       glaqud007 LIKE glaq_t.glaqud007, #自定義欄位(文字)007
       glaqud008 LIKE glaq_t.glaqud008, #自定義欄位(文字)008
       glaqud009 LIKE glaq_t.glaqud009, #自定義欄位(文字)009
       glaqud010 LIKE glaq_t.glaqud010, #自定義欄位(文字)010
       glaqud011 LIKE glaq_t.glaqud011, #自定義欄位(數字)011
       glaqud012 LIKE glaq_t.glaqud012, #自定義欄位(數字)012
       glaqud013 LIKE glaq_t.glaqud013, #自定義欄位(數字)013
       glaqud014 LIKE glaq_t.glaqud014, #自定義欄位(數字)014
       glaqud015 LIKE glaq_t.glaqud015, #自定義欄位(數字)015
       glaqud016 LIKE glaq_t.glaqud016, #自定義欄位(數字)016
       glaqud017 LIKE glaq_t.glaqud017, #自定義欄位(數字)017
       glaqud018 LIKE glaq_t.glaqud018, #自定義欄位(數字)018
       glaqud019 LIKE glaq_t.glaqud019, #自定義欄位(數字)019
       glaqud020 LIKE glaq_t.glaqud020, #自定義欄位(數字)020
       glaqud021 LIKE glaq_t.glaqud021, #自定義欄位(日期時間)021
       glaqud022 LIKE glaq_t.glaqud022, #自定義欄位(日期時間)022
       glaqud023 LIKE glaq_t.glaqud023, #自定義欄位(日期時間)023
       glaqud024 LIKE glaq_t.glaqud024, #自定義欄位(日期時間)024
       glaqud025 LIKE glaq_t.glaqud025, #自定義欄位(日期時間)025
       glaqud026 LIKE glaq_t.glaqud026, #自定義欄位(日期時間)026
       glaqud027 LIKE glaq_t.glaqud027, #自定義欄位(日期時間)027
       glaqud028 LIKE glaq_t.glaqud028, #自定義欄位(日期時間)028
       glaqud029 LIKE glaq_t.glaqud029, #自定義欄位(日期時間)029
       glaqud030 LIKE glaq_t.glaqud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
#190528-00007#1 add ---s
DEFINE l_tmp2        RECORD 
    sw          LIKE type_t.chr1, 
    glgbdocno   LIKE glgb_t.glgbdocno,
    glgadocdt   LIKE glga_t.glgadocdt, 
    glgbcomp    LIKE glgb_t.glgbcomp,
    glgbld      LIKE glgb_t.glgbld,
    glgbseq     LIKE glgb_t.glgbseq,
    glgb001     LIKE glgb_t.glgb001,
    glgb002     LIKE glgb_t.glgb002,
    glgb005     LIKE glgb_t.glgb005,
    glgb006     LIKE glgb_t.glgb006,
    glgb011     LIKE glgb_t.glgb011,
    glgb012     LIKE glgb_t.glgb012,
    glgb013     LIKE glgb_t.glgb013,
    glgb014     LIKE glgb_t.glgb014,
    glgb015     LIKE glgb_t.glgb015,
    glgb016     LIKE glgb_t.glgb016,   
    glgb017     LIKE glgb_t.glgb017,
    glgb018     LIKE glgb_t.glgb018,
    glgb019     LIKE glgb_t.glgb019,
    glgb020     LIKE glgb_t.glgb020,
    glgb021     LIKE glgb_t.glgb021,
    glgb022     LIKE glgb_t.glgb022,
    glgb023     LIKE glgb_t.glgb023,
    glgb024     LIKE glgb_t.glgb024,
    glgb025     LIKE glgb_t.glgb025,
    glgb026     LIKE glgb_t.glgb026,  
    glgb027     LIKE glgb_t.glgb027,
    glgb028     LIKE glgb_t.glgb028,
    glgb051     LIKE glgb_t.glgb051,  #經營方式
    glgb052     LIKE glgb_t.glgb052,  #渠道 
    glgb053     LIKE glgb_t.glgb053,  #品牌
    glgb029     LIKE glgb_t.glgb029,
    glgb030     LIKE glgb_t.glgb030,
    glgb031     LIKE glgb_t.glgb031,
    glgb032     LIKE glgb_t.glgb032,
    glgb033     LIKE glgb_t.glgb033,
    glgb034     LIKE glgb_t.glgb034,
    glgb035     LIKE glgb_t.glgb035,
    glgb036     LIKE glgb_t.glgb036,
    glgb037     LIKE glgb_t.glgb037,
    glgb038     LIKE glgb_t.glgb038,
    glgb055     LIKE glgb_t.glgb055,
    glgb007     LIKE glgb_t.glgb007,
    glgb008     LIKE glgb_t.glgb008,
    glgb009     LIKE glgb_t.glgb009,
    glgb010     LIKE glgb_t.glgb010,
    glgb003     LIKE glgb_t.glgb003,
    glgb004     LIKE glgb_t.glgb004,
    glgb039     LIKE glgb_t.glgb039,
    glgb040     LIKE glgb_t.glgb040,
    glgb041     LIKE glgb_t.glgb041,
    glgb042     LIKE glgb_t.glgb042,
    glgb043     LIKE glgb_t.glgb043,
    glgb044     LIKE glgb_t.glgb044,
    b_glgb021   LIKE glgb_t.glgb021,
    type        LIKE type_t.chr1
END RECORD
DEFINE l_sw     LIKE type_t.chr1
#190528-00007#1 add ---e
DEFINE l_tmp            LIKE glaq_t.glaq003
DEFINE l_success        LIKE type_t.num5
DEFINE l_glapdocdt      LIKE glap_t.glapdocdt                         
DEFINE l_tran  RECORD             #150703-00021#24  ---s---
            act       LIKE type_t.chr10,   #[1].chr 動作
            site      LIKE ooef_t.ooef001, #[2].chr 預算組織
            dat       LIKE type_t.dat,     #[3].dat 日期
            bgae001   LIKE bgae_t.bgae001 #[4].chr 預算項目
END RECORD                        
DEFINE l_ap_slip     LIKE glap_t.glapdocno
DEFINE l_dfin5002    LIKE type_t.chr1
DEFINE ls_js  STRING
DEFINE l_count LIKE type_t.num5
DEFINE l_glac016        LIKE glac_t.glac016   #170430-00006#2 add      
DEFINE l_glac008        LIKE glac_t.glac008   #170430-00006#2 add
#150703-00021#24   ---e---
#180507-00035#6 add ---s
DEFINE l_sfin0003    LIKE type_t.chr1         
DEFINE l_glaacomp    LIKE glaa_t.glaacomp     
DEFINE l_flag        LIKE type_t.chr1
#180507-00035#6 add ---e
DEFINE l_glad002       LIKE glad_t.glad002  #191016-00040#1 add
DEFINE l_slip          LIKE type_t.chr20    #191016-00040#1 add
#201030-00021#1 add(s)
DEFINE l_sql         STRING
DEFINE l_glad010     LIKE glad_t.glad010
DEFINE l_glad027     LIKE glad_t.glad027
DEFINE l_field       STRING
DEFINE l_field1      STRING
DEFINE l_field2      STRING
DEFINE l_field3      STRING
DEFINE l_field4      STRING
#201030-00021#1 add(e)
#201207-00021#1 add ---s
DEFINE l_glgb RECORD
   docno   LIKE glgb_t.glgbdocno,#單號   
   glgbseq LIKE glgb_t.glgbseq,  #項次
   glgb002 LIKE glgb_t.glgb002,  #科目  
   glgb003 LIKE glgb_t.glgb003,  #借方金額
   glgb004 LIKE glgb_t.glgb004,  #貸方金額
   glgb010 LIKE glgb_t.glgb010,  #原幣    
   glgb022 LIKE glgb_t.glgb022,  #帳款客商
   glgb040 LIKE glgb_t.glgb040,  #借方金額(本位幣二)
   glgb041 LIKE glgb_t.glgb041,  #貸方金額(本位幣二)
   glgb043 LIKE glgb_t.glgb043,  #借方金額(本位幣三)
   glgb044 LIKE glgb_t.glgb044,  #貸方金額(本位幣三)
   glgb055 LIKE glgb_t.glgb055   #現金變動碼
   END RECORD
DEFINE l_docno LIKE glgb_t.glgbdocno
DEFINE l_totalamt LIKE glaq_t.glaq010
#201207-00021#1 add ---e



   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #190507-00025#3 mark ---s
   #191016-00040#1 add-s
   #CALL s_aooi200_fin_get_slip(p_glapdocno) RETURNING l_success,l_slip
   #CALL s_fin_get_doc_para(p_glaqld,'',l_slip,'D-FIN-1002') RETURNING g_dfin1002
   #191016-00040#1 add-e
   #190507-00025#3 mark ---e
      
   SELECT glapdocdt INTO l_glapdocdt
     FROM glap_t
    WHERE glapent = g_enterprise
      AND glapld  = p_glaqld AND glapdocno = p_glapdocno
   
   #190528-00007#1 add ---s
   LET l_glaacomp = '' LET l_sfin0003 = ''
   SELECT glaacomp INTO l_glaacomp 
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = p_glaqld
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-0003') RETURNING l_sfin0003   
   #190528-00007#1 add ---e   
   
   #201207-00021#1 add ---s
   DELETE FROM s_pre_glbctmp
   FOREACH gen_ap_1_c23 USING p_key1,p_key2 INTO l_docno        
      EXECUTE s_aapp330_ins_glbctmp USING l_docno      
   END FOREACH
   #201207-00021#1 add ---e   
   
   FOREACH gen_ap_1_c22 USING p_key1,p_key2 INTO g_tmp.*
      IF SQLCA.sqlcode THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'gen_ap_1_c22'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF   
      INITIALIZE l_glaq.* TO NULL
      IF g_tmp.c = 0 AND g_tmp.d = 0 THEN CONTINUE FOREACH END IF
      LET l_glaq.glaqent   = g_tmp.glaqent    #企業代碼
      LET l_glaq.glaqcomp  = g_tmp.glaqcomp   #法人
      LET l_glaq.glaqld    = p_glaqld         #帳別
      LET l_glaq.glaqdocno = p_glapdocno      #單號
      SELECT MAX(glaqseq) + 1 INTO l_glaq.glaqseq #项次
        FROM glaq_t
       WHERE glaqent   = l_glaq.glaqent AND glaqld = l_glaq.glaqld
         AND glaqdocno = l_glaq.glaqdocno
      IF cl_null(l_glaq.glaqseq) THEN LET l_glaq.glaqseq = 1 END IF
      
      #'D-FIN-1002' #IF N 則以正數抛轉至傳票 並且 借貸相反
      IF NOT cl_null(g_dfin1002) THEN 
         IF g_dfin1002 = 'N' THEN
            #變正數
#            #191219-00033#1---mark---str
#            IF g_tmp.d < 0 THEN LET g_tmp.d = g_tmp.d * -1 END IF
#            IF g_tmp.c < 0 THEN LET g_tmp.c = g_tmp.c * -1 END IF
#            LET l_tmp = g_tmp.d  #借貸相反
#            LET g_tmp.d = g_tmp.c
#            LET g_tmp.c = l_tmp
#            #191219-00033#1---mark---end
            #191219-00033#1---add---str
            IF g_tmp.d < 0 THEN 
               LET g_tmp.d = g_tmp.d * -1 
               LET l_tmp = g_tmp.d  #借貸相反
               LET g_tmp.d = g_tmp.c
               LET g_tmp.c = l_tmp
            END IF
            IF g_tmp.c < 0 THEN 
               LET g_tmp.c = g_tmp.c * -1 
               LET l_tmp = g_tmp.d  #借貸相反
               LET g_tmp.d = g_tmp.c
               LET g_tmp.c = l_tmp
            END IF
            #191219-00033#1---add---end
         #190507-00025#3 mark ---s
         #191016-00040#1 add-s
         #ELSE
         #   LET l_glad002 = 'N' 
         #   LET l_glac008 = '1'
         #   SELECT glad002,glac008 INTO l_glad002,l_glac008
         #     FROM glad_t,glac_t 
         #    WHERE gladent = g_enterprise
         #      AND gladent = glacent AND glad001 = glac002
         #      AND glac001 = (SELECT glaa004 FROM glaa_t WHERE glaaent = gladent AND glaald = gladld) 
         #      AND gladld = p_glaqld
         #      AND glad001 = g_tmp.glaq002 
         #   IF (p_acctype = '2' OR p_acctype = '3') AND l_glad002 = 'Y' THEN
         #      IF l_glac008 = '1' THEN #借方
         #         LET g_tmp.d = g_tmp.d - g_tmp.c 
         #         LET g_tmp.c = 0
         #         LET g_tmp.glaq040 = g_tmp.glaq040 - g_tmp.glaq041
         #         LET g_tmp.glaq041 = 0
         #         LET g_tmp.glaq043 = g_tmp.glaq043 - g_tmp.glaq044
         #         LET g_tmp.glaq044 = 0
         #      ELSE                    #貸方
         #         LET g_tmp.c = g_tmp.c - g_tmp.d 
         #         LET g_tmp.d = 0
         #         LET g_tmp.glaq041 = g_tmp.glaq041 - g_tmp.glaq040
         #         LET g_tmp.glaq040 = 0
         #         LET g_tmp.glaq044 = g_tmp.glaq044 - g_tmp.glaq043
         #         LET g_tmp.glaq043 = 0
         #      END IF
         #   END IF
         #191016-00040#1 add-e
         #190507-00025#3 mark ---e
         END IF
      END IF  
      LET l_glaq.glaq001 = g_tmp.glaq001    #摘要
      LET l_glaq.glaq002 = g_tmp.glaq002    #科目編號
      LET l_glaq.glaq003 = g_tmp.d          #借方金額
      LET l_glaq.glaq004 = g_tmp.c          #貸方金額
      LET l_glaq.glaq005 = g_tmp.glaq005    #交易幣別
      LET l_glaq.glaq006 = g_tmp.glaq006    #匯率
      LET l_glaq.glaq007 = g_tmp.glaq007    #計價單位
      LET l_glaq.glaq008 = g_tmp.glaq008    #數量
      LET l_glaq.glaq009 = g_tmp.glaq009    #單價
     #LET l_glaq.glaq010 = g_tmp.sum        #原幣金額     #170509-00094#1 mark
      LET l_glaq.glaq010 = g_tmp.glaq010    #原幣金額     #170509-00094#1 add
      LET l_glaq.glaq011 = g_tmp.glaq011    #票據編碼
      LET l_glaq.glaq012 = g_tmp.glaq012    #票據日期
      LET l_glaq.glaq013 = g_tmp.glaq013    #申請人
      LET l_glaq.glaq014 = g_tmp.glaq014    #銀行帳號
      LET l_glaq.glaq015 = g_tmp.glaq015    #結算方式
      LET l_glaq.glaq016 = g_tmp.glaq016    #收支項目
      LET l_glaq.glaq017 = g_tmp.glaq017    #營運據點
      LET l_glaq.glaq018 = g_tmp.glaq018    #部門
      LET l_glaq.glaq019 = g_tmp.glaq019    #利潤/成本中心
      LET l_glaq.glaq020 = g_tmp.glaq020    #區域
      
      LET l_glaq.glaq021 = g_tmp.glaq021
      LET l_glaq.glaq022 = g_tmp.glaq022
      #不論科目是否有使用"交易客商碼"核算項,皆須產生, 至產生傳票時,再依科目判斷是否需產生至傳票 
      #EXECUTE gen_ap_1_c01 USING g_tmp.glaq002 INTO g_glad.*   #161208-00026#23   mark
      #161208-00026#23   add---s
      EXECUTE gen_ap_1_c01 USING g_tmp.glaq002 
         INTO g_glad.gladent,g_glad.gladownid,g_glad.gladowndp,g_glad.gladcrtid,g_glad.gladcrtdp,
              g_glad.gladcrtdt,g_glad.gladmodid,g_glad.gladmoddt,g_glad.gladstus,g_glad.gladld,
              g_glad.glad001,g_glad.glad002,g_glad.glad003,g_glad.glad004,g_glad.glad005,
              g_glad.glad006,g_glad.glad007,g_glad.glad008,g_glad.glad009,g_glad.glad010,
              g_glad.glad011,g_glad.glad012,g_glad.glad013,g_glad.glad014,g_glad.glad015,
              g_glad.glad016,g_glad.glad017,g_glad.glad0171,g_glad.glad0172,g_glad.glad018,
              g_glad.glad0181,g_glad.glad0182,g_glad.glad019,g_glad.glad0191,g_glad.glad0192,
              g_glad.glad020,g_glad.glad0201,g_glad.glad0202,g_glad.glad021,g_glad.glad0211,
              g_glad.glad0212,g_glad.glad022,g_glad.glad0221,g_glad.glad0222,g_glad.glad023,
              g_glad.glad0231,g_glad.glad0232,g_glad.glad024,g_glad.glad0241,g_glad.glad0242,
              g_glad.glad025,g_glad.glad0251,g_glad.glad0252,g_glad.glad026,g_glad.glad0261,
              g_glad.glad0262,g_glad.glad027,g_glad.glad030,g_glad.glad031,g_glad.glad032,
              g_glad.glad033,g_glad.glad034,g_glad.gladud001,g_glad.gladud002,g_glad.gladud003,
              g_glad.gladud004,g_glad.gladud005,g_glad.gladud006,g_glad.gladud007,g_glad.gladud008,
              g_glad.gladud009,g_glad.gladud010,g_glad.gladud011,g_glad.gladud012,g_glad.gladud013,
              g_glad.gladud014,g_glad.gladud015,g_glad.gladud016,g_glad.gladud017,g_glad.gladud018,
              g_glad.gladud019,g_glad.gladud020,g_glad.gladud021,g_glad.gladud022,g_glad.gladud023,
              g_glad.gladud024,g_glad.gladud025,g_glad.gladud026,g_glad.gladud027,g_glad.gladud028,
              g_glad.gladud029,g_glad.gladud030,g_glad.glad035,g_glad.glad036
              ,l_glac016,l_glac008     #170430-00006#2 add
      #161208-00026#23   add---e
      IF g_glad.glad010 = 'N' THEN LET l_glaq.glaq021 = '' END IF   #交易客商
      IF g_glad.glad027 = 'N' THEN LET l_glaq.glaq022 = '' END IF   #帳款客商
      LET l_glaq.glaq023 = g_tmp.glaq023    #客群
      LET l_glaq.glaq024 = g_tmp.glaq024    #產品類別
      LET l_glaq.glaq025 = g_tmp.glaq025    #人員
      LET l_glaq.glaq026 = g_tmp.glaq026    #預算編號
      LET l_glaq.glaq027 = g_tmp.glaq027    #專案編號
      LET l_glaq.glaq028 = g_tmp.glaq028    #WBS
      LET l_glaq.glaq029 = g_tmp.glaq029    #自由核算項一
      LET l_glaq.glaq030 = g_tmp.glaq030    #自由核算項二
      LET l_glaq.glaq031 = g_tmp.glaq031    #自由核算項三
      LET l_glaq.glaq032 = g_tmp.glaq032    #自由核算項四
      LET l_glaq.glaq033 = g_tmp.glaq033    #自由核算項五
      LET l_glaq.glaq034 = g_tmp.glaq034    #自由核算項六
      LET l_glaq.glaq035 = g_tmp.glaq035    #自由核算項七
      LET l_glaq.glaq036 = g_tmp.glaq036    #自由核算項八
      LET l_glaq.glaq037 = g_tmp.glaq037    #自由核算項九
      LET l_glaq.glaq038 = g_tmp.glaq038    #自由核算項十
      LET l_glaq.glaq039 = g_tmp.glaq039
      LET l_glaq.glaq040 = g_tmp.glaq040
      LET l_glaq.glaq041 = g_tmp.glaq041
      LET l_glaq.glaq042 = g_tmp.glaq042
      LET l_glaq.glaq043 = g_tmp.glaq043
      LET l_glaq.glaq044 = g_tmp.glaq044
      LET l_glaq.glaq051 = g_tmp.glaq051
      LET l_glaq.glaq052 = g_tmp.glaq052
      LET l_glaq.glaq053 = g_tmp.glaq053
      
      IF cl_null(l_glaq.glaq017) THEN LET l_glaq.glaq017 = ' ' END IF
      IF cl_null(l_glaq.glaq018) THEN LET l_glaq.glaq018 = ' ' END IF
      IF cl_null(l_glaq.glaq019) THEN LET l_glaq.glaq019 = ' ' END IF
      IF cl_null(l_glaq.glaq020) THEN LET l_glaq.glaq020 = ' ' END IF
      IF cl_null(l_glaq.glaq021) THEN LET l_glaq.glaq021 = ' ' END IF
      IF cl_null(l_glaq.glaq022) THEN LET l_glaq.glaq022 = ' ' END IF
      IF cl_null(l_glaq.glaq023) THEN LET l_glaq.glaq023 = ' ' END IF
      IF cl_null(l_glaq.glaq024) THEN LET l_glaq.glaq024 = ' ' END IF
      IF cl_null(l_glaq.glaq025) THEN LET l_glaq.glaq025 = ' ' END IF
      IF cl_null(l_glaq.glaq026) THEN LET l_glaq.glaq026 = ' ' END IF
      IF cl_null(l_glaq.glaq027) THEN LET l_glaq.glaq027 = ' ' END IF
      IF cl_null(l_glaq.glaq028) THEN LET l_glaq.glaq028 = ' ' END IF
      IF cl_null(l_glaq.glaq051) THEN LET l_glaq.glaq051 = ' ' END IF
      IF cl_null(l_glaq.glaq052) THEN LET l_glaq.glaq052 = ' ' END IF
      IF cl_null(l_glaq.glaq053) THEN LET l_glaq.glaq053 = ' ' END IF
      
      IF cl_null(l_glaq.glaq029) THEN LET l_glaq.glaq029 = ' ' END IF
      IF cl_null(l_glaq.glaq030) THEN LET l_glaq.glaq030 = ' ' END IF
      IF cl_null(l_glaq.glaq031) THEN LET l_glaq.glaq031 = ' ' END IF
      IF cl_null(l_glaq.glaq032) THEN LET l_glaq.glaq032 = ' ' END IF
      IF cl_null(l_glaq.glaq033) THEN LET l_glaq.glaq033 = ' ' END IF
      IF cl_null(l_glaq.glaq034) THEN LET l_glaq.glaq034 = ' ' END IF
      IF cl_null(l_glaq.glaq035) THEN LET l_glaq.glaq035 = ' ' END IF
      IF cl_null(l_glaq.glaq036) THEN LET l_glaq.glaq036 = ' ' END IF
      IF cl_null(l_glaq.glaq037) THEN LET l_glaq.glaq037 = ' ' END IF
      IF cl_null(l_glaq.glaq038) THEN LET l_glaq.glaq038 = ' ' END IF
      #180130-00050#5---add by 10554---(S)
      IF cl_null(l_glaq.glaq003) THEN LET l_glaq.glaq003 = 0 END IF   #借方金額
      IF cl_null(l_glaq.glaq004) THEN LET l_glaq.glaq004 = 0 END IF   #貸方金額
      IF cl_null(l_glaq.glaq006) THEN LET l_glaq.glaq006 = 0 END IF   #匯率
      IF cl_null(l_glaq.glaq009) THEN LET l_glaq.glaq009 = 0 END IF   #單價
      IF cl_null(l_glaq.glaq010) THEN LET l_glaq.glaq010 = 0 END IF   #原幣金額
      IF cl_null(l_glaq.glaq039) THEN LET l_glaq.glaq039 = 0 END IF   #匯率(本位幣二)
      IF cl_null(l_glaq.glaq040) THEN LET l_glaq.glaq040 = 0 END IF   #借方金額(本位幣二)
      IF cl_null(l_glaq.glaq041) THEN LET l_glaq.glaq041 = 0 END IF   #貸方金額(本位幣二)
      IF cl_null(l_glaq.glaq042) THEN LET l_glaq.glaq042 = 0 END IF   #匯率(本位幣三)
      IF cl_null(l_glaq.glaq043) THEN LET l_glaq.glaq043 = 0 END IF   #借方金額(本位幣三)
      IF cl_null(l_glaq.glaq044) THEN LET l_glaq.glaq044 = 0 END IF   #貸方金額(本位幣三)
      #180130-00050#5---add by 10554---(E)
      #200309-00072#1 add(s)
      IF (l_glaq.glaq003 < 0 AND l_glaq.glaq010 > 0) OR (l_glaq.glaq004 < 0 AND l_glaq.glaq010 > 0) THEN
         LET l_glaq.glaq010 = l_glaq.glaq010 * -1
      END IF
      #200309-00072#1 add(e)
     #INSERT INTO glaq_t VALUES(l_glaq.*) #161111-00048#2 mark
      #161111-00048#2 --s add
      INSERT INTO glaq_t(glaqent,glaqcomp,glaqld,glaqdocno,glaqseq,
                         glaq001,glaq002,glaq003,glaq004,glaq005,
                         glaq006,glaq007,glaq008,glaq009,glaq010,
                         glaq011,glaq012,glaq013,glaq014,glaq015,
                         glaq016,glaq017,glaq018,glaq019,glaq020,
                         glaq021,glaq022,glaq023,glaq024,glaq025,
                         glaq026,glaq027,glaq028,glaq029,glaq030,
                         glaq031,glaq032,glaq033,glaq034,glaq035,
                         glaq036,glaq037,glaq038,glaq039,glaq040,
                         glaq041,glaq042,glaq043,glaq044,glaq051,
                         glaq052,glaq053,glaqud001,glaqud002,glaqud003,
                         glaqud004,glaqud005,glaqud006,glaqud007,glaqud008,
                         glaqud009,glaqud010,glaqud011,glaqud012,glaqud013,
                         glaqud014,glaqud015,glaqud016,glaqud017,glaqud018,
                         glaqud019,glaqud020,glaqud021,glaqud022,glaqud023,
                         glaqud024,glaqud025,glaqud026,glaqud027,glaqud028,
                         glaqud029,glaqud030)
      VALUES(l_glaq.glaqent,l_glaq.glaqcomp,l_glaq.glaqld,l_glaq.glaqdocno,l_glaq.glaqseq,
             l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq003,l_glaq.glaq004,l_glaq.glaq005,
             l_glaq.glaq006,l_glaq.glaq007,l_glaq.glaq008,l_glaq.glaq009,l_glaq.glaq010,
             l_glaq.glaq011,l_glaq.glaq012,l_glaq.glaq013,l_glaq.glaq014,l_glaq.glaq015,
             l_glaq.glaq016,l_glaq.glaq017,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
             l_glaq.glaq021,l_glaq.glaq022,l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,
             l_glaq.glaq026,l_glaq.glaq027,l_glaq.glaq028,l_glaq.glaq029,l_glaq.glaq030,
             l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
             l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq039,l_glaq.glaq040,
             l_glaq.glaq041,l_glaq.glaq042,l_glaq.glaq043,l_glaq.glaq044,l_glaq.glaq051,
             l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaqud001,l_glaq.glaqud002,l_glaq.glaqud003,
             l_glaq.glaqud004,l_glaq.glaqud005,l_glaq.glaqud006,l_glaq.glaqud007,l_glaq.glaqud008,
             l_glaq.glaqud009,l_glaq.glaqud010,l_glaq.glaqud011,l_glaq.glaqud012,l_glaq.glaqud013,
             l_glaq.glaqud014,l_glaq.glaqud015,l_glaq.glaqud016,l_glaq.glaqud017,l_glaq.glaqud018,
             l_glaq.glaqud019,l_glaq.glaqud020,l_glaq.glaqud021,l_glaq.glaqud022,l_glaq.glaqud023,
             l_glaq.glaqud024,l_glaq.glaqud025,l_glaq.glaqud026,l_glaq.glaqud027,l_glaq.glaqud028,
             l_glaq.glaqud029,l_glaq.glaqud030)
      #161111-00048#2 --e add
      IF SQLCA.sqlcode THEN      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins glaq'
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN r_success
      END IF
      #170103-00019#5 add ------
      #插入细项立冲账资料
      LET l_success = TRUE
      CALL s_pre_voucher_insert_glax(l_glaq.*) RETURNING l_success
      IF l_success = FALSE THEN
         RETURN r_success
      END IF
      #170103-00019#5 add end---
      
      #170116-00074#4---s---
      #檢查是否適用預算科目 #150703-00021#24  ---s---
      #CALL s_aooi200_fin_get_slip(l_glaq.glaqdocno) RETURNING g_sub_success,l_ap_slip
      #CALL s_fin_get_doc_para(p_glaqld,l_glaq.glaqcomp,l_ap_slip,'D-FIN-5002') RETURNING l_dfin5002
      #IF l_dfin5002 = 'Y' THEN
      #   #只有費用科目才寫入
      #   SELECT COUNT(*) INTO l_count FROM s_voucher_tmp,apcb_t
      #    WHERE apcbent = g_enterprise
      #      AND apcbld = l_glaq.glaqld 
      #      AND apcbdocno = docno  
      #      AND apcb021 = l_glaq.glaq002 AND type =1 
      #   IF cl_null(l_count) THEN LET l_count = 0 END IF
      #   IF l_count > 0 THEN     
      #      CALL s_aapp330_bgbd_upd(l_glaq.glaqdocno,p_glaqld,l_glaq.glaqseq,'','1')
      #             RETURNING g_sub_success,g_errno
      #      IF NOT g_sub_success THEN
      #         INITIALIZE g_errparam TO NULL
      #         LET g_errparam.code = g_errno
      #         LET g_errparam.extend = l_glaq.glaqdocno
      #         LET g_errparam.popup = TRUE
      #         CALL cl_err()
      #         LET r_success = FALSE
      #         RETURN r_success
      #      END IF              
      #      #檢查額度是否超過
      #      CALL s_aapp330_bgbd_upd(l_glaq.glaqdocno,p_glaqld,l_glaq.glaqseq,'','2')
      #             RETURNING g_sub_success,g_errno
      #      IF NOT g_sub_success THEN
      #         INITIALIZE g_errparam TO NULL
      #         LET g_errparam.code = g_errno
      #         LET g_errparam.extend = l_glaq.glaqdocno
      #         LET g_errparam.popup = TRUE
      #         CALL cl_err()
      #         LET r_success = FALSE
      #         RETURN r_success
      #      END IF                          
      #      #新增預算滾動檔
      #      CALL s_aapp330_bgbd_upd(l_glaq.glaqdocno,p_glaqld,l_glaq.glaqseq,'I','3')
      #             RETURNING g_sub_success,g_errno
      #      IF NOT g_sub_success THEN
      #         INITIALIZE g_errparam TO NULL
      #         LET g_errparam.code = g_errno
      #         LET g_errparam.extend = l_glaq.glaqdocno
      #         LET g_errparam.popup = TRUE
      #         CALL cl_err()
      #         LET r_success = FALSE
      #         RETURN r_success
      #      END IF     
      #   END IF            
      #END IF  
      #150703-00021#24  ---e---
      #170116-00074#4---e---
      #201207-00021#1 mark ---s
      ##190806-00013#1 remark ---s
      ##190619-00013#1 mark ---s
      #IF l_sfin0003 = '1' THEN #190528-00007#1 add
      #   CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,                      #1
      #                                           '',            '',            '',l_glaq.glaqcomp,           '',          #2
      #                                           '',            '',            '',l_glaq.glaq005,l_glaq.glaq006,          #3
      #                                           '',            '',            '',            '',            '',          #4
      #                                           '',            '',            '',            '',            '',          #5
      #                               #            '',                                                                     #180124-00020#1 add '' 目的tmp 有增加欄位 #180507-00035#6 mark 位置給錯導致關係人給值有誤
      #                               #l_glaq.glaq021,l_glaq.glaq022,            '',            '',            '',         #6  #190528-00007#1 mark
      #                               l_glaq.glaq021, g_tmp.glaq022,            '',            '',            '',          #190528-00007#1 add
      #                                           '',                                                                      #180507-00035#6 add
      #                                           '',            '',            '',            '',            '',          #7
      #                                           '',            '',            '',            '',            '',          #8
      #                                           '',            '',            '',            '',            '',          #9
      #                               g_tmp.glgb055,             '',            '',            '',l_glaq.glaq010,          #10
      #                               l_glaq.glaq003,l_glaq.glaq004,l_glaq.glaq039,l_glaq.glaq040,l_glaq.glaq041,          #11
      #                               l_glaq.glaq042,l_glaq.glaq043,l_glaq.glaq044,            '',            '')          #12
      #        RETURNING l_success
      #END IF #190528-00007#1 add
      ##190619-00013#1 mark ---e
      ##190806-00013#1 remark ---e
      #201207-00021#1 mark ---e
      
      #201207-00021#1 add ---s
      IF l_sfin0003 = '1' THEN
         LET l_totalamt = NULL
         IF p_acctype MATCHES '[23]' THEN                        
            INITIALIZE l_glgb.* TO NULL
            IF l_glaq.glaq003 <> 0 THEN LET l_sw = 1 ELSE LET l_sw = 2 END IF
            #210324-00039#1 mark(s)
#            FOREACH sel_glgb055_cur USING l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
#               l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq017,l_glaq.glaq018,l_glaq.glaq019,
#               l_glaq.glaq020,l_glaq.glaq021,g_glad.glad010,l_glaq.glaq022,g_glad.glad027,l_glaq.glaq023,
#               l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,l_glaq.glaq051,
#               l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,l_glaq.glaq031,
#               l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,l_glaq.glaq036,
#               l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007,l_sw,p_acctype,g_tmp.glgb055,p_groupglbc
            #210324-00039#1 mark(e)
            #210324-00039#1 add(s)
            FOREACH sel_glgb055_cur USING l_glaq.glaq001,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq005,
               l_glaq.glaq006,l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq017,l_glaq.glaq017,
               l_glaq.glaq018,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq019,l_glaq.glaq020,l_glaq.glaq020,l_glaq.glaq021,l_glaq.glaq021,
               g_glad.glad010,l_glaq.glaq022,l_glaq.glaq022,g_glad.glad027,l_glaq.glaq023,l_glaq.glaq023,
               l_glaq.glaq024,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq027,l_glaq.glaq028,l_glaq.glaq028,
               l_glaq.glaq051,l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq029,
               l_glaq.glaq030,l_glaq.glaq030,l_glaq.glaq031,l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq033,
               l_glaq.glaq034,l_glaq.glaq034,l_glaq.glaq035,l_glaq.glaq035,l_glaq.glaq036,l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq037,
               l_glaq.glaq038,l_glaq.glaq038,l_glaq.glaq007,l_glaq.glaq007,
               l_sw,p_acctype,g_tmp.glgb055,p_groupglbc
            #210324-00039#1 add(e)
               INTO l_glgb.docno,l_glgb.glgb002,l_glgb.glgb022,l_glgb.glgb055,l_glgb.glgb003,l_glgb.glgb004,
                    l_glgb.glgb010,l_glgb.glgb040,l_glgb.glgb041,l_glgb.glgb043,l_glgb.glgb044

               IF l_totalamt = 0 THEN
                  CONTINUE FOREACH
               END IF

               CALL s_pre_voucher_ins_glbc(p_glaqld,   l_glapdocdt,   p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002, #1
                                                 '',            '',            '',l_glaq.glaqcomp,           '', #2
                                                 '',            '',            '',l_glaq.glaq005,l_glaq.glaq006, #3
                                                 '',            '',            '',            '',            '', #4
                                                 '',            '',            '',            '',            '', #5
                                     l_glaq.glaq021, l_glgb.glgb022,           '',            '',            '', #6 
                                                 '',                                                             
                                                 '',            '',            '',            '',            '', #7
                                                 '',            '',            '',            '',            '', #8
                                                 '',            '',            '',            '',            '', #9
                                     l_glgb.glgb055,            '',            '',            '',l_glgb.glgb010, #10
                                     l_glgb.glgb003,l_glgb.glgb004,l_glaq.glaq039,l_glgb.glgb040,l_glgb.glgb041, #11
                                     l_glaq.glaq042,l_glgb.glgb043,l_glgb.glgb044,            '',            '') #12
               RETURNING l_success   
               
               IF cl_null(l_totalamt) THEN 
                  IF l_sw ='2' THEN #貸方金額*-1
                     LET l_glaq.glaq010 = l_glaq.glaq010 * -1
                  END IF
                  LET l_totalamt = l_glaq.glaq010
               END IF           
               IF l_glgb.glgb004<>0 THEN #貸方金額*-1
                  LET l_glgb.glgb010 = l_glgb.glgb010 * -1
               END IF           
               LET l_totalamt = l_totalamt - l_glgb.glgb010  
               
               INITIALIZE l_glgb.* TO NULL               
            END FOREACH
         ELSE             
            EXECUTE sel_glgb022 USING g_tmp.docno INTO l_glaq.glaq022        
            CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,                   #1
                                                 '',            '',            '',l_glaq.glaqcomp,           '',          #2
                                                 '',            '',            '',l_glaq.glaq005,l_glaq.glaq006,          #3
                                                 '',            '',            '',            '',            '',          #4
                                                 '',            '',            '',            '',            '',          #5
                                     l_glaq.glaq021,l_glaq.glaq022,            '',            '',            '',          #6
                                                 '',                                                                      
                                                 '',            '',            '',            '',            '',          #7
                                                 '',            '',            '',            '',            '',          #8
                                                 '',            '',            '',            '',            '',          #9
                                     g_tmp.glgb055,             '',            '',            '',l_glaq.glaq010,          #10
                                     l_glaq.glaq003,l_glaq.glaq004,l_glaq.glaq039,l_glaq.glaq040,l_glaq.glaq041,          #11
                                     l_glaq.glaq042,l_glaq.glaq043,l_glaq.glaq044,            '',            '')          #12
              RETURNING l_success
         END IF
      END IF
      #201207-00021#1 add ---e      
      
   END FOREACH
   
   #190528-00007#1 mark ---s
   #180507-00035#6 add ---s 判斷此張憑證是否有現金科目   
   #LET l_glaacomp = '' LET l_sfin0003 = ''
   #SELECT glaacomp INTO l_glaacomp 
   #  FROM glaa_t
   # WHERE glaaent = g_enterprise
   #   AND glaald  = p_glaqld
   #CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-0003') RETURNING l_sfin0003 
   #IF l_sfin0003 = '2' THEN      
   #   CALL s_pre_voucher_chk_glac016(p_glaqld,p_glapdocno) RETURNING l_flag
   #   IF l_flag = 'N' THEN
   #      DELETE FROM glbc_t WHERE glbcent = g_enterprise AND glbcdocno = p_glapdocno
   #      IF SQLCA.sqlcode THEN
   #         INITIALIZE g_errparam TO NULL
   #         LET g_errparam.code = SQLCA.sqlcode
   #         LET g_errparam.extend = 'DELETE glbc_t'
   #         LET g_errparam.popup = TRUE
   #         CALL cl_err()
   #         LET r_success = FALSE
   #         RETURN r_success
   #      END IF
   #   END IF
   #END IF
   #180507-00035#6 add ---e
   #190528-00007#1 mark ---e
   
   #190806-00013#1 mark ---s
   #190528-00007#1 add ---s
   #CALL s_pre_voucher_chk_glac016(p_glaqld,p_glapdocno) RETURNING l_flag
   ##IF l_sfin0003 = '2' AND l_flag = 'Y' THEN #190619-00013#1 mark #
   #IF l_flag = 'Y' THEN #190619-00013#1 add 
   #   INITIALIZE l_tmp2.* TO NULL      
   #   IF p_acctype MATCHES '[23]' THEN
   #      FOREACH s_aapp330_sel_glaq_c USING p_glaqld,p_glapdocno INTO l_glaq.glaqseq,l_glaq.glaq002,l_sw
   #         FOREACH s_aapp330_sel_glgb_c USING p_glapdocno,l_glaq.glaq002 INTO l_tmp2.*
   #190806-00013#1 mark ---e
   #190806-00013#1 add ---s
   CALL s_pre_voucher_chk_glac016(p_glaqld,p_glapdocno) RETURNING l_flag
   IF l_sfin0003 = '2' AND l_flag = 'Y' THEN
      INITIALIZE l_tmp2.* TO NULL 
      INITIALIZE l_glaq.* TO NULL      
      IF p_acctype MATCHES '[23]' THEN
         FOREACH s_aapp330_sel_glaq_c USING p_glaqld,p_glapdocno INTO l_glaq.*,l_sw
            #201030-00021#1 add(s)
            SELECT glad010,glad027 INTO l_glad010,l_glad027 FROM glad_t
             WHERE gladent = g_enterprise
               AND gladld = p_glaqld
               AND glad001 = l_glaq.glaq002
            IF cl_null(l_glad010) THEN LET l_glad010 = 'N' END IF  #收付款客商管理 glaq021
            IF cl_null(l_glad027) THEN LET l_glad027 = 'N' END IF  #账款客商管理 glaq022
            IF p_acctype = '2' THEN
            LET l_field  = " glgb003,glgb004,"
            LET l_field1 = " glgb040,glgb041,"
            LET l_field2 = " glgb043,glgb044,"
            LET l_field3 = " AND (glgb001  = ? OR glgb001 IS NULL OR glgb001 = ' ')",
                        " AND (glgb002  = ? OR glgb002 IS NULL OR glgb002 = ' ')",
                        " AND (glgb005  = ? OR glgb005 IS NULL OR glgb005 = ' ')",
                        " AND (glgb006  = ? OR glgb006 IS NULL)",
                        " AND (glgb039  = ? OR glgb039 IS NULL)",
                        " AND (glgb042  = ? OR glgb042 IS NULL)",
                        " AND (glgb018  = ? OR glgb018 IS NULL OR glgb018 = ' ')",
                        " AND (glgb019  = ? OR glgb019 IS NULL OR glgb019 = ' ')",
                        " AND (glgb020  = ? OR glgb020 IS NULL OR glgb020 = ' ')",
                        " AND (glgb023  = ? OR glgb023 IS NULL OR glgb023 = ' ')",
                        " AND (glgb024  = ? OR glgb024 IS NULL OR glgb024 = ' ')",
                        " AND (glgb025  = ? OR glgb025 IS NULL OR glgb025 = ' ')",
                        " AND (glgb027  = ? OR glgb027 IS NULL OR glgb027 = ' ')",
                        " AND (glgb028  = ? OR glgb028 IS NULL OR glgb028 = ' ')",
                        " AND (glgb051  = ? OR glgb051 IS NULL OR glgb051 = ' ')",
                        " AND (glgb052  = ? OR glgb052 IS NULL OR glgb052 = ' ')",
                        " AND (glgb053  = ? OR glgb053 IS NULL OR glgb053 = ' ')",
                        " AND (glgb029  = ? OR glgb029 IS NULL OR glgb029 = ' ')",
                        " AND (glgb030  = ? OR glgb030 IS NULL OR glgb030 = ' ')",
                        " AND (glgb031  = ? OR glgb031 IS NULL OR glgb031 = ' ')",
                        " AND (glgb032  = ? OR glgb032 IS NULL OR glgb032 = ' ')",
                        " AND (glgb033  = ? OR glgb033 IS NULL OR glgb033 = ' ')",
                        " AND (glgb034  = ? OR glgb034 IS NULL OR glgb034 = ' ')",
                        " AND (glgb035  = ? OR glgb035 IS NULL OR glgb035 = ' ')",
                        " AND (glgb036  = ? OR glgb036 IS NULL OR glgb036 = ' ')",
                        " AND (glgb037  = ? OR glgb037 IS NULL OR glgb037 = ' ')",
                        " AND (glgb038  = ? OR glgb038 IS NULL OR glgb038 = ' ')",
                        " AND (glgb007  = ? OR glgb007 IS NULL OR glgb007 = ' ')"
             IF l_glad010 = 'Y' THEN LET l_field3 = l_field3," AND glgb021 = ? " END IF
             IF l_glad027 = 'Y' THEN LET l_field3 = l_field3," AND glgb022 = ? " END IF                       
            LET l_field4 = " "
            ELSE
            #p_acctype=3
            LET l_field =  " SUM(glgb003),SUM(glgb004), "
            LET l_field1 = " SUM(glgb040),SUM(glgb041), "
            LET l_field2 = " SUM(glgb043),SUM(glgb044), "
            LET l_field3 = " AND (glgb001  = ? OR glgb001 IS NULL OR glgb001 = ' ')",
                           " AND (glgb002  = ? OR glgb002 IS NULL OR glgb002 = ' ')",
                           " AND (glgb005  = ? OR glgb005 IS NULL OR glgb005 = ' ')",
                           " AND (glgb006  = ? OR glgb006 IS NULL)",
                           " AND (glgb039  = ? OR glgb039 IS NULL)",
                           " AND (glgb042  = ? OR glgb042 IS NULL)",
                           " AND (glgb018  = ? OR glgb018 IS NULL OR glgb018 = ' ')",
                           " AND (glgb019  = ? OR glgb019 IS NULL OR glgb019 = ' ')",
                           " AND (glgb020  = ? OR glgb020 IS NULL OR glgb020 = ' ')",
                           " AND (glgb023  = ? OR glgb023 IS NULL OR glgb023 = ' ')",
                           " AND (glgb024  = ? OR glgb024 IS NULL OR glgb024 = ' ')",
                           " AND (glgb025  = ? OR glgb025 IS NULL OR glgb025 = ' ')",
                           " AND (glgb027  = ? OR glgb027 IS NULL OR glgb027 = ' ')",
                           " AND (glgb028  = ? OR glgb028 IS NULL OR glgb028 = ' ')",
                           " AND (glgb051  = ? OR glgb051 IS NULL OR glgb051 = ' ')",
                           " AND (glgb052  = ? OR glgb052 IS NULL OR glgb052 = ' ')",
                           " AND (glgb053  = ? OR glgb053 IS NULL OR glgb053 = ' ')",
                           " AND (glgb029  = ? OR glgb029 IS NULL OR glgb029 = ' ')",
                           " AND (glgb030  = ? OR glgb030 IS NULL OR glgb030 = ' ')",
                           " AND (glgb031  = ? OR glgb031 IS NULL OR glgb031 = ' ')",
                           " AND (glgb032  = ? OR glgb032 IS NULL OR glgb032 = ' ')",
                           " AND (glgb033  = ? OR glgb033 IS NULL OR glgb033 = ' ')",
                           " AND (glgb034  = ? OR glgb034 IS NULL OR glgb034 = ' ')",
                           " AND (glgb035  = ? OR glgb035 IS NULL OR glgb035 = ' ')",
                           " AND (glgb036  = ? OR glgb036 IS NULL OR glgb036 = ' ')",
                           " AND (glgb037  = ? OR glgb037 IS NULL OR glgb037 = ' ')",
                           " AND (glgb038  = ? OR glgb038 IS NULL OR glgb038 = ' ')",
                           " AND (glgb007  = ? OR glgb007 IS NULL OR glgb007 = ' ')"
            IF l_glad010 = 'Y' THEN LET l_field3 = l_field3," AND glgb021 = ? " END IF
             IF l_glad027 = 'Y' THEN LET l_field3 = l_field3," AND glgb022 = ? " END IF                        
         LET l_field4 = "GROUP BY (CASE WHEN glgb003 <> 0 THEN 1 ELSE 2 END),", 
                        "glgbdocno,glgadocdt,glgbcomp,glgbld, ", 
                        "glgbseq,glgb001,glgb002,glgb005,glgb006,",  
                        "glgb011,glgb012,glgb013,glgb014,glgb015,",
                        "glgb016,glgb017,glgb018,glgb019,glgb020,", 
                        "glgb021,glgb022,glgb023,glgb024,glgb025,",
                        "glgb026,glgb027,glgb028,glgb051,glgb052,",  
                        "glgb053,glgb029,glgb030,glgb031,glgb032,", 
                        "glgb033,glgb034,glgb035,glgb036,glgb037,",  
                        "glgb038,glgb055,glgb007,glgb008,glgb009,",  
                        "glgb010,glgb039,glgb042"
         END IF  
            LET l_sql = "  SELECT (CASE WHEN glgb003 <> 0 THEN 1 ELSE 2 END), ",
                        "       glgbdocno,glgadocdt,glgbcomp,glgbld, ", 
                        "       glgbseq,glgb001,glgb002,glgb005,glgb006, ",  
                        "       glgb011,glgb012,glgb013,glgb014,glgb015, ",
                        "       glgb016,glgb017,glgb018,glgb019,glgb020, ", 
                        "       glgb021,glgb022,glgb023,glgb024,glgb025, ",
                        "       glgb026,glgb027,glgb028,glgb051,glgb052,",  
                        "       glgb053,glgb029,glgb030,glgb031,glgb032,", 
                        "       glgb033,glgb034,glgb035,glgb036,glgb037,",  
                        "       glgb038,glgb055,glgb007,glgb008,glgb009,",  
                        "       glgb010,",l_field,"glgb039,",l_field1,"glgb042,",l_field2, 
                        "       '','','' ",
                        "    FROM glgb_t,glga_t ",
                        "   WHERE glgaent = glgbent AND glgadocno = glgbdocno ",
                        "     AND glgbent = ",g_enterprise,
                        "     AND glga007 = ? ",l_field3,l_field4
            PREPARE s_aapp330_sel_glgb_p2 FROM l_sql
            DECLARE s_aapp330_sel_glgb_c2 CURSOR FOR s_aapp330_sel_glgb_p2
            
            IF l_glad010 = 'Y' AND l_glad027 = 'N' THEN
               FOREACH s_aapp330_sel_glgb_c2 
                 USING p_glapdocno,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
                       l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
                       l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,
                       l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,
                       l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
                       l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007
                      ,l_glaq.glaq021                    
                  INTO l_tmp2.*
               
               IF p_acctype = '3' AND l_tmp2.sw <> l_sw THEN #借貸相反
                  CONTINUE FOREACH
               END IF             
               CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,l_tmp2.*) RETURNING l_success
               IF l_success = FALSE THEN
                  RETURN r_success
               END IF
               INITIALIZE l_tmp2.* TO NULL               
               
               END FOREACH
            END IF
            
            IF l_glad010 = 'N' AND l_glad027 = 'Y' THEN
               FOREACH s_aapp330_sel_glgb_c2 
                 USING p_glapdocno,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
                       l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
                       l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,
                       l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,
                       l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
                       l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007
                      ,l_glaq.glaq022                    
                  INTO l_tmp2.*
               
               IF p_acctype = '3' AND l_tmp2.sw <> l_sw THEN #借貸相反
                  CONTINUE FOREACH
               END IF             
               CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,l_tmp2.*) RETURNING l_success
               IF l_success = FALSE THEN
                  RETURN r_success
               END IF
               INITIALIZE l_tmp2.* TO NULL               
               
               END FOREACH
            END IF
            
            IF l_glad010 = 'Y' AND l_glad027 = 'Y' THEN
               FOREACH s_aapp330_sel_glgb_c2 
                 USING p_glapdocno,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
                       l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
                       l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,
                       l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,
                       l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
                       l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007
                      ,l_glaq.glaq021,l_glaq.glaq022                 
                  INTO l_tmp2.*
               
               IF p_acctype = '3' AND l_tmp2.sw <> l_sw THEN #借貸相反
                  CONTINUE FOREACH
               END IF             
               CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,l_tmp2.*) RETURNING l_success
               IF l_success = FALSE THEN
                  RETURN r_success
               END IF
               INITIALIZE l_tmp2.* TO NULL               
               
               END FOREACH
            END IF
            
            IF l_glad010 = 'N' AND l_glad027 = 'N' THEN
               FOREACH s_aapp330_sel_glgb_c2 
                 USING p_glapdocno,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
                       l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
                       l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,
                       l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,
                       l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
                       l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007                   
                  INTO l_tmp2.*
               
               IF p_acctype = '3' AND l_tmp2.sw <> l_sw THEN #借貸相反
                  CONTINUE FOREACH
               END IF             
               CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,l_tmp2.*) RETURNING l_success
               IF l_success = FALSE THEN
                  RETURN r_success
               END IF
               INITIALIZE l_tmp2.* TO NULL               
               
               END FOREACH
            END IF            
            #201030-00021#1 add(e)
            #201030-00021#1 mark(s)
#            FOREACH s_aapp330_sel_glgb_c 
#              USING p_glapdocno,l_glaq.glaq001,l_glaq.glaq002,l_glaq.glaq005,l_glaq.glaq006,
#                    l_glaq.glaq039,l_glaq.glaq042,l_glaq.glaq018,l_glaq.glaq019,l_glaq.glaq020,
#                    l_glaq.glaq023,l_glaq.glaq024,l_glaq.glaq025,l_glaq.glaq027,l_glaq.glaq028,
#                    l_glaq.glaq051,l_glaq.glaq052,l_glaq.glaq053,l_glaq.glaq029,l_glaq.glaq030,
#                    l_glaq.glaq031,l_glaq.glaq032,l_glaq.glaq033,l_glaq.glaq034,l_glaq.glaq035,
#                    l_glaq.glaq036,l_glaq.glaq037,l_glaq.glaq038,l_glaq.glaq007                    
#               INTO l_tmp2.*
#   #190806-00013#1 add ---e
#               IF p_acctype = '3' AND l_tmp2.sw <> l_sw THEN #借貸相反
#                  CONTINUE FOREACH
#               END IF             
#               CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_glaq.glaq002,l_tmp2.*) RETURNING l_success
#               IF l_success = FALSE THEN
#                  RETURN r_success
#               END IF
#               INITIALIZE l_tmp2.* TO NULL               
#            END FOREACH
            #201030-00021#1 mark(e)
            END FOREACH
      ELSE
         LET l_glaq.glaqseq = 0
         FOREACH s_aapp330_sel_glgb_c USING p_glapdocno INTO l_tmp2.*
            LET l_glaq.glaqseq = l_glaq.glaqseq + 1
            CALL s_pre_voucher_ins_glbc(p_glaqld,l_glapdocdt,p_glapdocno,l_glaq.glaqseq,l_tmp2.glgb002,l_tmp2.*) RETURNING l_success
            IF l_success = FALSE THEN 
               RETURN r_success
            END IF
            INITIALIZE l_tmp2.* TO NULL
         END FOREACH
      END IF
   END IF
   #190528-00007#1 add ---e
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 科目核算項處理
# Memo...........:
# Usage..........: 
# Date & Author..: 14/09/10 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_set_glaq002()
DEFINE l_glac016     LIKE glac_t.glac016
DEFINE l_glaq020     LIKE glaq_t.glaq020
DEFINE l_glaq021     LIKE glaq_t.glaq021
DEFINE l_glaq022     LIKE glaq_t.glaq022
DEFINE l_glaq023     LIKE glaq_t.glaq023
DEFINE l_glaq024     LIKE glaq_t.glaq024
DEFINE l_glaq051     LIKE glaq_t.glaq051
DEFINE l_glaq052     LIKE glaq_t.glaq052
DEFINE l_glaq053     LIKE glaq_t.glaq053
DEFINE l_glaq027     LIKE glaq_t.glaq027
DEFINE l_glaq028     LIKE glaq_t.glaq028
DEFINE l_glaq029     LIKE glaq_t.glaq029
DEFINE l_glaq030     LIKE glaq_t.glaq030
DEFINE l_glaq031     LIKE glaq_t.glaq031
DEFINE l_glaq032     LIKE glaq_t.glaq032
DEFINE l_glaq033     LIKE glaq_t.glaq033
DEFINE l_glaq034     LIKE glaq_t.glaq034
DEFINE l_glaq035     LIKE glaq_t.glaq035
DEFINE l_glaq036     LIKE glaq_t.glaq036
DEFINE l_glaq037     LIKE glaq_t.glaq037
DEFINE l_glaq038     LIKE glaq_t.glaq038
DEFINE l_glac008     LIKE glac_t.glac008
DEFINE l_glad006     LIKE glad_t.glad006
DEFINE l_glad036     LIKE glad_t.glad036

   WHENEVER ERROR CONTINUE
   INITIALIZE g_glad.* TO NULL
   #EXECUTE gen_ap_1_c01 USING g_tmp.glaq002 INTO g_glad.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   EXECUTE gen_ap_1_c01 USING g_tmp.glaq002 
      INTO g_glad.gladent,g_glad.gladownid,g_glad.gladowndp,g_glad.gladcrtid,g_glad.gladcrtdp,
           g_glad.gladcrtdt,g_glad.gladmodid,g_glad.gladmoddt,g_glad.gladstus,g_glad.gladld,
           g_glad.glad001,g_glad.glad002,g_glad.glad003,g_glad.glad004,g_glad.glad005,
           g_glad.glad006,g_glad.glad007,g_glad.glad008,g_glad.glad009,g_glad.glad010,
           g_glad.glad011,g_glad.glad012,g_glad.glad013,g_glad.glad014,g_glad.glad015,
           g_glad.glad016,g_glad.glad017,g_glad.glad0171,g_glad.glad0172,g_glad.glad018,
           g_glad.glad0181,g_glad.glad0182,g_glad.glad019,g_glad.glad0191,g_glad.glad0192,
           g_glad.glad020,g_glad.glad0201,g_glad.glad0202,g_glad.glad021,g_glad.glad0211,
           g_glad.glad0212,g_glad.glad022,g_glad.glad0221,g_glad.glad0222,g_glad.glad023,
           g_glad.glad0231,g_glad.glad0232,g_glad.glad024,g_glad.glad0241,g_glad.glad0242,
           g_glad.glad025,g_glad.glad0251,g_glad.glad0252,g_glad.glad026,g_glad.glad0261,
           g_glad.glad0262,g_glad.glad027,g_glad.glad030,g_glad.glad031,g_glad.glad032,
           g_glad.glad033,g_glad.glad034,g_glad.gladud001,g_glad.gladud002,g_glad.gladud003,
           g_glad.gladud004,g_glad.gladud005,g_glad.gladud006,g_glad.gladud007,g_glad.gladud008,
           g_glad.gladud009,g_glad.gladud010,g_glad.gladud011,g_glad.gladud012,g_glad.gladud013,
           g_glad.gladud014,g_glad.gladud015,g_glad.gladud016,g_glad.gladud017,g_glad.gladud018,
           g_glad.gladud019,g_glad.gladud020,g_glad.gladud021,g_glad.gladud022,g_glad.gladud023,
           g_glad.gladud024,g_glad.gladud025,g_glad.gladud026,g_glad.gladud027,g_glad.gladud028,
           g_glad.gladud029,g_glad.gladud030,g_glad.glad035,g_glad.glad036
           ,l_glac016,l_glac008      #170430-00006#2 add
   #161208-00026#23   add---e
   
   IF g_glad.glad005 = 'N' THEN  #数量/金额不管理
      LET g_tmp.glaq007 = ''
      LET g_tmp.glaq008 = 0
      LET g_tmp.glaq009 = 0 
   END IF
   CALL s_voucher_get_glas003(g_tmp.glaqld,g_tmp.glaq002) 
        RETURNING l_glaq020,l_glaq021,l_glaq022,l_glaq023,l_glaq024,l_glaq051,l_glaq052,l_glaq053,
                  l_glaq027,l_glaq028,l_glaq029,l_glaq030,l_glaq031,l_glaq032,l_glaq033,l_glaq034,
                  l_glaq035,l_glaq036,l_glaq037,l_glaq038
                             
   IF g_glad.glad007 = 'N' THEN LET g_tmp.glaq018 = '' END IF   #部门不管理
   IF g_glad.glad008 = 'N' THEN LET g_tmp.glaq019 = '' END IF   #利润成本不管理
   IF g_glad.glad009 = 'N' THEN     #区域不管理
      LET g_tmp.glaq020 = ''
   ELSE
      IF cl_null(g_tmp.glaq020) AND NOT cl_null(l_glaq020) THEN 
         LET g_tmp.glaq020 = l_glaq020
      END IF
   END IF   
  #不論科目是否有使用"交易客商碼"核算項,皆須產生, 至產生傳票時,再依科目判斷是否需產生至傳票 
  ##因为客户会看其他科目是在哪些交易对象身上发生的，以便和应收应付科目能有个对照，但又不会在总账做交易对象管理。
  #IF g_glad.glad010 = 'N' THEN LET g_tmp.glaq021 = '' END IF   #交易客商
  #IF g_glad.glad027 = 'N' THEN LET g_tmp.glaq022 = '' END IF   #帳款客商
   
   IF g_glad.glad011 = 'N' THEN     #客群
      LET g_tmp.glaq023 = '' 
   ELSE
      IF cl_null(g_tmp.glaq023) AND NOT cl_null(l_glaq023) THEN 
         LET g_tmp.glaq023 = l_glaq023
      END IF
   END IF   
   IF g_glad.glad012 = 'N' THEN     #产品类别不管理
      LET g_tmp.glaq024 = '' 
   ELSE
      IF cl_null(g_tmp.glaq024) AND NOT cl_null(l_glaq024) THEN 
         LET g_tmp.glaq024 = l_glaq024
      END IF
   END IF   
   IF g_glad.glad013 = 'N' THEN LET g_tmp.glaq025 = '' END IF   #人员不管理
   IF g_glad.glad030 = 'N' THEN LET g_tmp.glaq026 = '' END IF   #预算不管理
   IF g_glad.glad015 = 'N' THEN  #专案不管理
      LET g_tmp.glaq027 = '' 
   ELSE
      IF cl_null(g_tmp.glaq027) AND NOT cl_null(l_glaq027) THEN 
         LET g_tmp.glaq027 = l_glaq027
      END IF
   END IF   
   
   IF g_glad.glad016 = 'N' THEN  #WBS不管理 
      LET g_tmp.glaq028 = '' 
   ELSE
      IF cl_null(g_tmp.glaq028) AND NOT cl_null(l_glaq028) THEN 
         LET g_tmp.glaq028 = l_glaq028
      END IF
   END IF   
   
   IF g_glad.glad017 = 'N' THEN  #自由核算项1不管理
      LET g_tmp.glaq029 = '' 
   ELSE
      IF cl_null(g_tmp.glaq029) AND NOT cl_null(l_glaq029) THEN 
         LET g_tmp.glaq029 = l_glaq029
      END IF
   END IF   
   IF g_glad.glad018 = 'N' THEN  #自由核算项2不管理
      LET g_tmp.glaq030 = '' 
   ELSE
      IF cl_null(g_tmp.glaq030) AND NOT cl_null(l_glaq030) THEN 
         LET g_tmp.glaq030 = l_glaq030
      END IF
   END IF   
   IF g_glad.glad019 = 'N' THEN  #自由核算项3不管理
      LET g_tmp.glaq031 = '' 
   ELSE
      IF cl_null(g_tmp.glaq031) AND NOT cl_null(l_glaq031) THEN 
         LET g_tmp.glaq031 = l_glaq031
      END IF
   END IF   
   IF g_glad.glad020 = 'N' THEN  #自由核算项4不管理
      LET g_tmp.glaq032 = '' 
   ELSE
      IF cl_null(g_tmp.glaq032) AND NOT cl_null(l_glaq032) THEN 
         LET g_tmp.glaq031 = l_glaq032
      END IF
   END IF   
   IF g_glad.glad021 = 'N' THEN  #自由核算项5不管理
      LET g_tmp.glaq033 = '' 
   ELSE
      IF cl_null(g_tmp.glaq033) AND NOT cl_null(l_glaq033) THEN 
         LET g_tmp.glaq031 = l_glaq033
      END IF
   END IF   
   
   IF g_glad.glad022 = 'N' THEN  #自由核算项6不管理
      LET g_tmp.glaq034 = '' 
   ELSE
      IF cl_null(g_tmp.glaq034) AND NOT cl_null(l_glaq034) THEN 
         LET g_tmp.glaq031 = l_glaq034
      END IF
   END IF   
   IF g_glad.glad023 = 'N' THEN  #自由核算项7不管理
      LET g_tmp.glaq035 = '' 
   ELSE
      IF cl_null(g_tmp.glaq035) AND NOT cl_null(l_glaq035) THEN 
         LET g_tmp.glaq031 = l_glaq035
      END IF
   END IF   
   IF g_glad.glad024 = 'N' THEN  #自由核算项8不管理
      LET g_tmp.glaq036 = '' 
   ELSE
      IF cl_null(g_tmp.glaq036) AND NOT cl_null(l_glaq036) THEN 
         LET g_tmp.glaq036 = l_glaq036
      END IF
   END IF   
   IF g_glad.glad025 = 'N' THEN  #自由核算项9不管理
      LET g_tmp.glaq037 = '' 
   ELSE
      IF cl_null(g_tmp.glaq037) AND NOT cl_null(l_glaq037) THEN 
         LET g_tmp.glaq037 = l_glaq037
      END IF
   END IF   
   IF g_glad.glad026 = 'N' THEN  #自由核算项10不管理
      LET g_tmp.glaq038 = '' 
   ELSE
      IF cl_null(g_tmp.glaq038) AND NOT cl_null(l_glaq038) THEN 
         LET g_tmp.glaq038 = l_glaq038
      END IF
   END IF   
   
   IF g_glad.glad031 = 'N' THEN  #經營方式
      LET g_tmp.glaq051 = '' 
   ELSE
      IF cl_null(g_tmp.glaq051) AND NOT cl_null(l_glaq051) THEN 
         LET g_tmp.glaq051 = l_glaq051
      END IF
   END IF   
   IF g_glad.glad032 = 'N' THEN  #渠道
      LET g_tmp.glaq052 = '' 
   ELSE
      IF cl_null(g_tmp.glaq052) AND NOT cl_null(l_glaq052) THEN 
         LET g_tmp.glaq052 = l_glaq052
      END IF
   END IF   
   IF g_glad.glad033 = 'N' THEN  #品牌
      LET g_tmp.glaq053 = '' 
   ELSE
      IF cl_null(g_tmp.glaq053) AND NOT cl_null(l_glaq053) THEN 
         LET g_tmp.glaq053 = l_glaq053 
      END IF
   END IF   
   #170430-00006#2---mark---staret--
   #SELECT glac016,glac008 INTO l_glac016,l_glac008 
   #  FROM glac_t
   # WHERE glacent = g_enterprise
   #   AND glac001 = g_glaa004
   #   AND glac002 = g_tmp.glaq002
   #170430-00006#2---mark---end---
   
   #150209-00008#2--(S)--判斷是否為現金科目
   IF l_glac016 = 'Y' THEN 
      IF cl_null(g_tmp.glgb055) THEN 
#150814-00006#3--mod--str--
#         SELECT glad006 INTO g_tmp.glgb055 
         #SELECT glad006,glad0036 INTO l_glad006,l_glad036 #180130-00050#93 mark
         SELECT glad006,glad036 INTO l_glad006,l_glad036   #180130-00050#93 add glad0036修正->glad036
           FROM glad_t
          WHERE gladent = g_enterprise
            #AND gladld = g_ld         #180130-00050#93 mark
            AND gladld = g_tmp.glaqld  #180130-00050#93 add  g_ld是空值 改用g_tmp.glaqld 條件
            AND glad001 = g_tmp.glaq002
        IF g_tmp.d<>0 THEN #借方
           LET g_tmp.glgb055=l_glad006
        END IF
        IF g_tmp.c<>0 THEN #贷方
           LET g_tmp.glgb055=l_glad036
        END IF
        IF g_tmp.d=0 AND g_tmp.c=0 THEN
           IF l_glac008='1' THEN #借方
              LET g_tmp.glgb055=l_glad006
           ELSE #贷方
              LET g_tmp.glgb055=l_glad036
           END IF
        END IF
#150814-00006#3--mod--end
      END IF
   ELSE
      LET g_tmp.glgb055 = ''
   END IF
   #150209-00008#2--(E)
  ##150616--紅沖否
  #IF g_dfin1002 = 'Y' THEN 
  #   LET g_tmp.red = 'Y' 
  #   LET g_tmp.glaq010 = s_math_abs(g_tmp.glaq010)
  #   IF g_tmp.c <> 0 THEN
  #      LET g_tmp.glaq010 = g_tmp.glaq010 * -1
  #   END IF
  #END IF
  ##150616--紅沖否
END FUNCTION

################################################################################
# Descriptions...: 連接字串
# Memo...........:
# Usage..........: CALL s_aapp330_desc_conjunctive(p_str,p_desc)
#                  RETURNING r_desc
# Date & Author..: 14/09/15 By Belle
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_desc_conjunctive(p_str,p_desc)
DEFINE p_str      STRING
DEFINE p_desc     STRING
DEFINE r_desc     STRING

   WHENEVER ERROR CONTINUE
   IF cl_null(p_str) THEN
      RETURN p_desc
   END IF
   IF cl_null(p_desc) THEN
      LET r_desc = p_str
   ELSE
      LET r_desc = p_str,"-",p_desc
   END IF

   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 預算相關處理
# Memo...........:
# Usage..........: CALL s_aapp330_bgbd_upd(p_docno,p_ld,p_seq,p_act,p_type)
# Date & Author..: 2015/11/17 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapp330_bgbd_upd(p_docno,p_ld,p_seq,p_act,p_type)
DEFINE  l_tran  RECORD
            act       LIKE type_t.chr10,   #[1].chr 動作
            site      LIKE ooef_t.ooef001, #[2].chr 預算組織
            dat       LIKE type_t.dat,     #[3].dat 日期
            bgae001   LIKE bgae_t.bgae001, #[4].chr 預算項目
            bgbd013   LIKE bgbd_t.bgbd013, #[5].chr 部門
            bgbd014   LIKE bgbd_t.bgbd014, #[6].chr 利潤成本中心
            bgbd015   LIKE bgbd_t.bgbd015, #[7].chr 區域
            bgbd016   LIKE bgbd_t.bgbd016, #[8].chr 交易客商
            bgbd017   LIKE bgbd_t.bgbd017, #[9].chr 收款客商
            bgbd018   LIKE bgbd_t.bgbd018, #[10].chr 客群
            bgbd019   LIKE bgbd_t.bgbd019, #[11].chr 產品類別
            bgbd020   LIKE bgbd_t.bgbd020, #[12].chr 人員
            bgbd021   LIKE bgbd_t.bgbd021, #[13].chr 專案
            bgbd022   LIKE bgbd_t.bgbd022, #[14].chr WBS
            bgbd023   LIKE bgbd_t.bgbd023, #[15].chr 經營方式
            bgbd024   LIKE bgbd_t.bgbd024, #[16].chr 自由核算項一
            bgbd025   LIKE bgbd_t.bgbd025, #[17].chr 自由核算項二
            bgbd026   LIKE bgbd_t.bgbd026, #[18].chr 自由核算項三
            bgbd027   LIKE bgbd_t.bgbd027, #[19].chr 自由核算項四
            bgbd028   LIKE bgbd_t.bgbd028, #[20].chr 自由核算項五
            bgbd029   LIKE bgbd_t.bgbd029, #[21].chr 自由核算項六
            bgbd030   LIKE bgbd_t.bgbd030, #[22].chr 自由核算項七
            bgbd031   LIKE bgbd_t.bgbd031, #[23].chr 自由核算項八
            bgbd032   LIKE bgbd_t.bgbd032, #[24].chr 自由核算項九
            bgbd033   LIKE bgbd_t.bgbd033, #[25].chr 自由核算項十
            bgbd042   LIKE bgbd_t.bgbd042, #[26].chr 渠道
            bgbd043   LIKE bgbd_t.bgbd043, #[27].chr 品牌
            used036   LIKE bgbd_t.bgbd036, #[28].chr 使用程式
            used037   LIKE bgbd_t.bgbd037, #[29].chr 使用單號 
            used038   LIKE bgbd_t.bgbd038, #[30].chr 使用項次
            sour036   LIKE bgbd_t.bgbd036, #[31].chr 轉出程式
            sour037   LIKE bgbd_t.bgbd037, #[32].chr 轉出單號
            sour038   LIKE bgbd_t.bgbd038, #[33].chr 轉出項次
            curr      LIKE ooai_t.ooai001, #[34].chr 幣別
            account   LIKE type_t.num20_6 #[35].chr 金額
                    END RECORD

DEFINE ls_js        STRING                    
#DEFINE l_glap       RECORD LIKE glap_t.* #161111-00048#2 mark
#DEFINE l_glaq       RECORD LIKE glaq_t.* #161111-00048#2 mark
#161111-00048#2 --s add
DEFINE l_glap RECORD  #傳票憑證單頭檔
       glapent LIKE glap_t.glapent, #企業編號
       glapld LIKE glap_t.glapld, #帳套
       glapcomp LIKE glap_t.glapcomp, #法人
       glapdocno LIKE glap_t.glapdocno, #單號
       glapdocdt LIKE glap_t.glapdocdt, #單據日期
       glap001 LIKE glap_t.glap001, #傳票性質
       glap002 LIKE glap_t.glap002, #會計年度
       glap003 LIKE glap_t.glap003, #會計季別
       glap004 LIKE glap_t.glap004, #會計期別
       glap005 LIKE glap_t.glap005, #會計周別
       glap006 LIKE glap_t.glap006, #收支科目
       glap007 LIKE glap_t.glap007, #來源碼
       glap008 LIKE glap_t.glap008, #帳款類型
       glap009 LIKE glap_t.glap009, #總號
       glap010 LIKE glap_t.glap010, #借方總金額
       glap011 LIKE glap_t.glap011, #貸方總金額
       glap012 LIKE glap_t.glap012, #列印次數
       glap013 LIKE glap_t.glap013, #附件張數
       glap014 LIKE glap_t.glap014, #外幣憑證否
       glap015 LIKE glap_t.glap015, #原傳票編號
       glap016 LIKE glap_t.glap016, #來源帳套編號
       glap017 LIKE glap_t.glap017, #來源傳票編號
       glapownid LIKE glap_t.glapownid, #資料所有者
       glapowndp LIKE glap_t.glapowndp, #資料所屬部門
       glapcrtid LIKE glap_t.glapcrtid, #資料建立者
       glapcrtdp LIKE glap_t.glapcrtdp, #資料建立部門
       glapcrtdt LIKE glap_t.glapcrtdt, #資料創建日
       glapmodid LIKE glap_t.glapmodid, #資料修改者
       glapmoddt LIKE glap_t.glapmoddt, #最近修改日
       glapcnfid LIKE glap_t.glapcnfid, #資料確認者
       glapcnfdt LIKE glap_t.glapcnfdt, #資料確認日
       glappstid LIKE glap_t.glappstid, #資料過帳者
       glappstdt LIKE glap_t.glappstdt, #資料過帳日
       glapstus LIKE glap_t.glapstus, #狀態碼
       glapud001 LIKE glap_t.glapud001, #自定義欄位(文字)001
       glapud002 LIKE glap_t.glapud002, #自定義欄位(文字)002
       glapud003 LIKE glap_t.glapud003, #自定義欄位(文字)003
       glapud004 LIKE glap_t.glapud004, #自定義欄位(文字)004
       glapud005 LIKE glap_t.glapud005, #自定義欄位(文字)005
       glapud006 LIKE glap_t.glapud006, #自定義欄位(文字)006
       glapud007 LIKE glap_t.glapud007, #自定義欄位(文字)007
       glapud008 LIKE glap_t.glapud008, #自定義欄位(文字)008
       glapud009 LIKE glap_t.glapud009, #自定義欄位(文字)009
       glapud010 LIKE glap_t.glapud010, #自定義欄位(文字)010
       glapud011 LIKE glap_t.glapud011, #自定義欄位(數字)011
       glapud012 LIKE glap_t.glapud012, #自定義欄位(數字)012
       glapud013 LIKE glap_t.glapud013, #自定義欄位(數字)013
       glapud014 LIKE glap_t.glapud014, #自定義欄位(數字)014
       glapud015 LIKE glap_t.glapud015, #自定義欄位(數字)015
       glapud016 LIKE glap_t.glapud016, #自定義欄位(數字)016
       glapud017 LIKE glap_t.glapud017, #自定義欄位(數字)017
       glapud018 LIKE glap_t.glapud018, #自定義欄位(數字)018
       glapud019 LIKE glap_t.glapud019, #自定義欄位(數字)019
       glapud020 LIKE glap_t.glapud020, #自定義欄位(數字)020
       glapud021 LIKE glap_t.glapud021, #自定義欄位(日期時間)021
       glapud022 LIKE glap_t.glapud022, #自定義欄位(日期時間)022
       glapud023 LIKE glap_t.glapud023, #自定義欄位(日期時間)023
       glapud024 LIKE glap_t.glapud024, #自定義欄位(日期時間)024
       glapud025 LIKE glap_t.glapud025, #自定義欄位(日期時間)025
       glapud026 LIKE glap_t.glapud026, #自定義欄位(日期時間)026
       glapud027 LIKE glap_t.glapud027, #自定義欄位(日期時間)027
       glapud028 LIKE glap_t.glapud028, #自定義欄位(日期時間)028
       glapud029 LIKE glap_t.glapud029, #自定義欄位(日期時間)029
       glapud030 LIKE glap_t.glapud030  #自定義欄位(日期時間)030
END RECORD
DEFINE l_glaq RECORD  #傳票憑證單身檔
       glaqent LIKE glaq_t.glaqent, #企業編號
       glaqcomp LIKE glaq_t.glaqcomp, #法人
       glaqld LIKE glaq_t.glaqld, #帳套
       glaqdocno LIKE glaq_t.glaqdocno, #單號
       glaqseq LIKE glaq_t.glaqseq, #項次
       glaq001 LIKE glaq_t.glaq001, #摘要
       glaq002 LIKE glaq_t.glaq002, #科目編號
       glaq003 LIKE glaq_t.glaq003, #借方金額
       glaq004 LIKE glaq_t.glaq004, #貸方金額
       glaq005 LIKE glaq_t.glaq005, #交易幣別
       glaq006 LIKE glaq_t.glaq006, #匯率
       glaq007 LIKE glaq_t.glaq007, #計價單位
       glaq008 LIKE glaq_t.glaq008, #數量
       glaq009 LIKE glaq_t.glaq009, #單價
       glaq010 LIKE glaq_t.glaq010, #原幣金額
       glaq011 LIKE glaq_t.glaq011, #票據編碼
       glaq012 LIKE glaq_t.glaq012, #票據日期
       glaq013 LIKE glaq_t.glaq013, #申請人
       glaq014 LIKE glaq_t.glaq014, #銀行帳號
       glaq015 LIKE glaq_t.glaq015, #款別編號
       glaq016 LIKE glaq_t.glaq016, #收支專案
       glaq017 LIKE glaq_t.glaq017, #營運據點
       glaq018 LIKE glaq_t.glaq018, #部門
       glaq019 LIKE glaq_t.glaq019, #利潤/成本中心
       glaq020 LIKE glaq_t.glaq020, #區域
       glaq021 LIKE glaq_t.glaq021, #收付款客商
       glaq022 LIKE glaq_t.glaq022, #帳款客戶
       glaq023 LIKE glaq_t.glaq023, #客群
       glaq024 LIKE glaq_t.glaq024, #產品類別
       glaq025 LIKE glaq_t.glaq025, #人員
       glaq026 LIKE glaq_t.glaq026, #no use
       glaq027 LIKE glaq_t.glaq027, #專案編號
       glaq028 LIKE glaq_t.glaq028, #WBS
       glaq029 LIKE glaq_t.glaq029, #自由核算項一
       glaq030 LIKE glaq_t.glaq030, #自由核算項二
       glaq031 LIKE glaq_t.glaq031, #自由核算項三
       glaq032 LIKE glaq_t.glaq032, #自由核算項四
       glaq033 LIKE glaq_t.glaq033, #自由核算項五
       glaq034 LIKE glaq_t.glaq034, #自由核算項六
       glaq035 LIKE glaq_t.glaq035, #自由核算項七
       glaq036 LIKE glaq_t.glaq036, #自由核算項八
       glaq037 LIKE glaq_t.glaq037, #自由核算項九
       glaq038 LIKE glaq_t.glaq038, #自由核算項十
       glaq039 LIKE glaq_t.glaq039, #匯率(本位幣二)
       glaq040 LIKE glaq_t.glaq040, #借方金額(本位幣二)
       glaq041 LIKE glaq_t.glaq041, #貸方金額(本位幣二)
       glaq042 LIKE glaq_t.glaq042, #匯率(本位幣三)
       glaq043 LIKE glaq_t.glaq043, #借方金額(本位幣三)
       glaq044 LIKE glaq_t.glaq044, #貸方金額(本位幣三)
       glaq051 LIKE glaq_t.glaq051, #經營方式
       glaq052 LIKE glaq_t.glaq052, #通路
       glaq053 LIKE glaq_t.glaq053, #品牌
       glaqud001 LIKE glaq_t.glaqud001, #自定義欄位(文字)001
       glaqud002 LIKE glaq_t.glaqud002, #自定義欄位(文字)002
       glaqud003 LIKE glaq_t.glaqud003, #自定義欄位(文字)003
       glaqud004 LIKE glaq_t.glaqud004, #自定義欄位(文字)004
       glaqud005 LIKE glaq_t.glaqud005, #自定義欄位(文字)005
       glaqud006 LIKE glaq_t.glaqud006, #自定義欄位(文字)006
       glaqud007 LIKE glaq_t.glaqud007, #自定義欄位(文字)007
       glaqud008 LIKE glaq_t.glaqud008, #自定義欄位(文字)008
       glaqud009 LIKE glaq_t.glaqud009, #自定義欄位(文字)009
       glaqud010 LIKE glaq_t.glaqud010, #自定義欄位(文字)010
       glaqud011 LIKE glaq_t.glaqud011, #自定義欄位(數字)011
       glaqud012 LIKE glaq_t.glaqud012, #自定義欄位(數字)012
       glaqud013 LIKE glaq_t.glaqud013, #自定義欄位(數字)013
       glaqud014 LIKE glaq_t.glaqud014, #自定義欄位(數字)014
       glaqud015 LIKE glaq_t.glaqud015, #自定義欄位(數字)015
       glaqud016 LIKE glaq_t.glaqud016, #自定義欄位(數字)016
       glaqud017 LIKE glaq_t.glaqud017, #自定義欄位(數字)017
       glaqud018 LIKE glaq_t.glaqud018, #自定義欄位(數字)018
       glaqud019 LIKE glaq_t.glaqud019, #自定義欄位(數字)019
       glaqud020 LIKE glaq_t.glaqud020, #自定義欄位(數字)020
       glaqud021 LIKE glaq_t.glaqud021, #自定義欄位(日期時間)021
       glaqud022 LIKE glaq_t.glaqud022, #自定義欄位(日期時間)022
       glaqud023 LIKE glaq_t.glaqud023, #自定義欄位(日期時間)023
       glaqud024 LIKE glaq_t.glaqud024, #自定義欄位(日期時間)024
       glaqud025 LIKE glaq_t.glaqud025, #自定義欄位(日期時間)025
       glaqud026 LIKE glaq_t.glaqud026, #自定義欄位(日期時間)026
       glaqud027 LIKE glaq_t.glaqud027, #自定義欄位(日期時間)027
       glaqud028 LIKE glaq_t.glaqud028, #自定義欄位(日期時間)028
       glaqud029 LIKE glaq_t.glaqud029, #自定義欄位(日期時間)029
       glaqud030 LIKE glaq_t.glaqud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#2 --e add
DEFINE p_act        LIKE type_t.chr10
DEFINE p_ld         LIKE apca_t.apcald
DEFINE p_docno      LIKE apca_t.apcadocno
DEFINE p_seq        LIKE apcb_t.apcbseq
DEFINE p_type       LIKE type_t.chr1
DEFINE r_success    LIKE type_t.num5
DEFINE r_errno      LIKE gzze_t.gzze001
DEFINE l_bgaf016    LIKE bgaf_t.bgaf016
DEFINE l_slip       LIKE type_t.chr100    #使用單別
DEFINE l_ap_slip    LIKE type_t.chr100
DEFINE l_bgbd036    LIKE bgbd_t.bgbd036   #來源碼
DEFINE l_dfin5002   LIKE type_t.chr1
DEFINE l_acctype    LIKE type_t.chr1      #判斷科目借餘或貸餘
DEFINE l_bgaa001    LIKE bgaa_t.bgaa001   #目前使用預算編耗
DEFINE l_bgaf005    LIKE bgaf_t.bgaf005
DEFINE l_prog       LIKE type_t.chr100
DEFINE l_bgao004    LIKE bgao_t.bgao004 #161003-00014#15---s--- 
DEFINE l_glaq002    LIKE glaq_t.glaq002 #200529-00046#1 add #科目

   # type = 1  檢核預算項目
   # type = 2　檢核金額是否超過
   # type = 3　更新預算項目
   
   
   
   LET r_errno = NULL   LET r_success = TRUE
  
   #IF g_prog MATCHES 'aapp330' THEN　 RETURN r_success,r_errno END IF  #170116-00074#4   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapp330*' THEN　 RETURN r_success,r_errno END IF   #170301-00021#1 by 09263 --add
   #SELECT * INTO l_glap.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   SELECT glapent,glapld,glapcomp,glapdocno,glapdocdt,
          glap001,glap002,glap003,glap004,glap005,
          glap006,glap007,glap008,glap009,glap010,
          glap011,glap012,glap013,glap014,glap015,
          glap016,glap017,glapownid,glapowndp,glapcrtid,
          glapcrtdp,glapcrtdt,glapmodid,glapmoddt,glapcnfid,
          glapcnfdt,glappstid,glappstdt,glapstus,glapud001,
          glapud002,glapud003,glapud004,glapud005,glapud006,
          glapud007,glapud008,glapud009,glapud010,glapud011,
          glapud012,glapud013,glapud014,glapud015,glapud016,
          glapud017,glapud018,glapud019,glapud020,glapud021,
          glapud022,glapud023,glapud024,glapud025,glapud026,
          glapud027,glapud028,glapud029,glapud030
     INTO l_glap.*
   #161208-00026#23   add---e
     FROM glap_t 
    WHERE glapent = g_enterprise 
      AND glapdocno = p_docno AND glapld = p_ld
   
   #SELECT * INTO l_glaq.*   #161208-00026#23   mark
   #161208-00026#23   add---s
   SELECT glaqent,glaqcomp,glaqld,glaqdocno,glaqseq,
          glaq001,glaq002,glaq003,glaq004,glaq005,
          glaq006,glaq007,glaq008,glaq009,glaq010,
          glaq011,glaq012,glaq013,glaq014,glaq015,
          glaq016,glaq017,glaq018,glaq019,glaq020,
          glaq021,glaq022,glaq023,glaq024,glaq025,
          glaq026,glaq027,glaq028,glaq029,glaq030,
          glaq031,glaq032,glaq033,glaq034,glaq035,
          glaq036,glaq037,glaq038,glaq039,glaq040,
          glaq041,glaq042,glaq043,glaq044,glaq051,
          glaq052,glaq053,glaqud001,glaqud002,glaqud003,
          glaqud004,glaqud005,glaqud006,glaqud007,glaqud008,
          glaqud009,glaqud010,glaqud011,glaqud012,glaqud013,
          glaqud014,glaqud015,glaqud016,glaqud017,glaqud018,
          glaqud019,glaqud020,glaqud021,glaqud022,glaqud023,
          glaqud024,glaqud025,glaqud026,glaqud027,glaqud028,
          glaqud029,glaqud030
     INTO l_glaq.* 
   #161208-00026#23   add---e
     FROM glaq_t
    WHERE glaqent = g_enterprise
      AND glaqdocno = p_docno
      AND glaqld  = p_ld
      AND glaqseq = p_seq      
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_ap_slip
   CALL s_fin_get_doc_para(p_ld,l_glap.glapcomp,l_ap_slip,'D-FIN-5002') RETURNING l_dfin5002
   
   LET l_glaq002 = l_glaq.glaq002 #200529-00046#1 add
   
   #170427-00078#1 mark-----s
   ##是否適用科目預算
   #IF l_dfin5002 = 'N' THEN
   #170427-00078#1 mark-----e
   #170427-00078#1-----s
   #IF l_dfin5002 = 'Y' THEN                    #180424-00004#1 mark
   IF l_dfin5002 = 'Y' OR l_dfin5002 = 'C' THEN #180424-00004#1 add         
   ELSE
   #170427-00078#1-----e
      RETURN r_success,r_errno
   END IF
   #取得預算編號
   CALL s_abg_get_runtime_bg(l_glap.glapcomp,l_glap.glapdocdt)RETURNING l_bgaa001,l_bgaf005
   
   #取得科餘方向 #會計科目的科餘方向
   #CALL s_abg_bgae001_acctype(l_bgaa001,l_glaq.glaq002) RETURNING l_acctype #190122-00062#1 mark
   #190122-00062#1 add(s)
   #要用預算細項去抓科餘方向
   LET l_bgao004 = ''
   SELECT bgao004 INTO l_bgao004 FROM bgao_t 
    WHERE bgaoent = g_enterprise 
      AND bgao002 = (SELECT glaa004 FROM glaa_t WHERE glaaent = g_enterprise AND glaald  =  p_ld )
      AND bgao001 = (SELECT bgaa008 FROM bgaa_t WHERE bgaaent = g_enterprise AND bgaa001 = l_bgaa001 )  
      AND bgao003 = l_glaq.glaq002
   #預算係項可否被使用
   CALL s_abg_bgai_chk(l_bgaa001,l_glap.glapcomp,l_bgao004)
                        RETURNING g_sub_success,g_errno
   CALL s_abg_bgae001_acctype(l_bgaa001,l_bgao004) RETURNING l_acctype                        
   #190122-00062#1 add(e)
 
   #來源程式代碼
   SELECT oobx004 INTO l_prog
     FROM oobx_t
    WHERE oobxent = g_enterprise
      AND oobx001 = l_ap_slip
   
   #190122-00062#1 add(s)
   #要挪到取科餘方向前
   #161003-00014#15---s---  #取得對應的預算係項
   #LET l_bgao004 = ''
   #SELECT bgao004 INTO l_bgao004 FROM bgao_t 
   # WHERE bgaoent = g_enterprise 
   #   AND bgao002 = (SELECT glaa004 FROM glaa_t WHERE glaaent = g_enterprise AND glaald  =  p_ld )
   #   AND bgao001 = (SELECT bgaa008 FROM bgaa_t WHERE bgaaent = g_enterprise AND bgaa001 = l_bgaa001 )  
   #   AND bgao003 = l_glaq.glaq002
   ##預算係項可否被使用
   #CALL s_abg_bgai_chk(l_bgaa001,l_glap.glapcomp,l_bgao004)
   #                     RETURNING g_sub_success,g_errno
   #190122-00062#1 add(e)                        
   #180424-00004#1 ---s---                                           
   IF l_dfin5002 ='C' AND NOT g_sub_success THEN
      LET r_success = TRUE
      LET r_errno   =  ''   
      RETURN r_success,r_errno
   END IF
   #180424-00004#1 ---e---    
   IF NOT g_sub_success THEN
      LET r_success = FALSE
      LET r_errno   =  g_errno
      RETURN r_success,r_errno
   END IF
   LET l_glaq.glaq002  = l_bgao004
   #161003-00014#15---e---

   LET l_tran.act     = p_act
   LET l_tran.site    = l_glap.glapcomp
   LET l_tran.dat     = l_glap.glapdocdt
   LET l_tran.bgae001 = l_glaq.glaq002          #預算項目
   LET l_tran.bgbd013 = l_glaq.glaq018          #部門
   LET l_tran.bgbd014 = l_glaq.glaq019          #責任中心
   LET l_tran.bgbd015 = l_glaq.glaq020          #區域
   LET l_tran.bgbd016 = l_glaq.glaq021          #交易客商
   LET l_tran.bgbd017 = l_glaq.glaq022          #收款客商
   LET l_tran.bgbd018 = l_glaq.glaq023          #客群
   LET l_tran.bgbd019 = l_glaq.glaq024          #產品類別
   LET l_tran.bgbd020 = l_glaq.glaq025          #人員
   LET l_tran.bgbd021 = l_glaq.glaq027          #專案
   LET l_tran.bgbd022 = l_glaq.glaq028          #WBS
   LET l_tran.bgbd023 = l_glaq.glaq051          #經營方式
   LET l_tran.bgbd024 = l_glaq.glaq029          #自由核算項一
   LET l_tran.bgbd025 = l_glaq.glaq030
   LET l_tran.bgbd026 = l_glaq.glaq031
   LET l_tran.bgbd027 = l_glaq.glaq032
   LET l_tran.bgbd028 = l_glaq.glaq033
   LET l_tran.bgbd029 = l_glaq.glaq034
   LET l_tran.bgbd030 = l_glaq.glaq035
   LET l_tran.bgbd031 = l_glaq.glaq036
   LET l_tran.bgbd032 = l_glaq.glaq037
   LET l_tran.bgbd033 = l_glaq.glaq038          #自由核算項十
   LET l_tran.bgbd042 = l_glaq.glaq052          #渠道
   LET l_tran.bgbd043 = l_glaq.glaq053          #品牌
   #LET l_tran.used036 = 'aglt310' #200526-00009#1 mark
   LET l_tran.used036 = l_prog     #200526-00009#1 add 
   LET l_tran.used037 = l_glaq.glaqdocno
   LET l_tran.used038 = l_glaq.glaqseq 
   LET l_tran.sour036 = g_prog
   LET l_tran.sour037 = ''     
   LET l_tran.sour038 = ''
   LET l_tran.curr    = l_glaq.glaq005          
   #190122-00062#1 mark(s)
   #IF l_glaq.glaq003 > l_glaq.glaq004 THEN                #借貸方向
   #   IF l_acctype = '2' THEN #貸餘科目                    #科餘方向 當科餘方向是2 * -1
   #      LET l_tran.account = l_glaq.glaq003 * -1         #交易原幣未稅金額
   #   ELSE
   #      LET l_tran.account = l_glaq.glaq003
   #   END IF
   #ELSE
   #   IF l_acctype = '2' THEN
   #      LET l_tran.account = l_glaq.glaq004 
   #   ELSE
   #       LET l_tran.account = l_glaq.glaq004 * -1
   #    END IF
   #END IF
   #190122-00062#1 mark(e)
   #190122-00062#1 add(s)
   #因這段只有直接輸入aglt310時才會走，且借方金額跟貸方金額一定有一個為0
   #所以用是否為0來判斷取金額方向
   IF l_glaq.glaq003 <> 0 THEN                            #借貸方向
      IF l_acctype = '2' THEN #貸餘科目                    #科餘方向 當科餘方向是2 * -1
         LET l_tran.account = l_glaq.glaq003 * -1         #交易原幣未稅金額
      ELSE
         LET l_tran.account = l_glaq.glaq003
      END IF
   END IF
   IF l_glaq.glaq004 <> 0 THEN  
      IF l_acctype = '2' THEN
         LET l_tran.account = l_glaq.glaq004 
      ELSE
          LET l_tran.account = l_glaq.glaq004 * -1
       END IF
   END IF
   #190122-00062#1 add(e)
   
   LET ls_js = util.JSON.stringify(l_tran)
   
   CALL s_abg_get_bgbd013(ls_js) RETURNING l_tran.bgbd013 #200420-00042#1 add
   LET ls_js = util.JSON.stringify(l_tran) #200420-00042#1 add

   CASE p_type
      WHEN '1'
         CALL s_abg_bgae001_chk2(ls_js)RETURNING r_success,g_errno
         
         IF l_dfin5002 = 'C' THEN LET r_success = TRUE LET g_errno = '' END IF   #180424-00004#1 add        
      WHEN '2' #檢核預算額度   
         #161003-00014#15  ---s--- abgi260限額控管方式      
         #CALL s_abg_bg_used_chk(ls_js) RETURNING r_success,r_errno,l_bgaf016   
         IF l_tran.account > 0 THEN       #負數金額不控卡         
            #180424-00004#1 ---s---            
            IF l_dfin5002 = 'C' THEN
               CALL s_abg_bgbd_count(ls_js) RETURNING r_success,r_errno
               IF NOT g_sub_success THEN  
                  LET r_success = TRUE LET g_errno = ''
                  RETURN r_success,r_errno
               END IF
            END IF         
            #180424-00004#1 ---e---                  
             CALL s_abg_bg_used_chk(ls_js) RETURNING r_success,r_errno,l_bgaf016   
             CASE l_bgaf016 
               WHEN 1
                  LET r_success = TRUE LET r_errno = ''
               WHEN 2
                  LET r_success = TRUE
                  #180424-00004#1---s--- add 
                  IF NOT cl_null(r_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = r_errno
                     LET g_errparam.replace[1] = l_tran.bgae001 #200420-00042#1 add
                     #200529-00046#1 add ---s
                     LET g_errparam.coll_vals[1] = l_glaq.glaqdocno #傳票號碼
                     LET g_errparam.coll_vals[2] = l_glaq.glaqseq   #項次
                     LET g_errparam.coll_vals[3] = l_glaq002   #科目
                     LET g_errparam.coll_vals[4] = s_desc_get_account_desc(p_ld,l_glaq002)  #科目名稱
                     #200529-00046#1 add ---e  
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  END IF
                  #180424-00004#1---e---                    
                  #180424-00004#1---s--- mark
                  #INITIALIZE g_errparam TO NULL
                  #LET g_errparam.code = 'abg-00160'
                  #LET g_errparam.extend = ''
                  #LET g_errparam.popup = TRUE
                  #CALL cl_err()
                  #180424-00004#1---e---
            END CASE 

         END IF            
         #161003-00014#15 ---e---
      WHEN '3'
         #180424-00004#1 ---s---
         #CALL s_abg_bgbd_count(ls_js) RETURNING r_success,r_errno #200420-00042#1 mark
         #IF g_sub_success THEN #200420-00042#1 mark
         CALL s_abg_bgbd_upd(ls_js) RETURNING r_success,r_errno
         #END IF  #200420-00042#1 mark
         #180424-00004#1 ---e---
         #CALL s_abg_bgbd_upd(ls_js) RETURNING r_success,r_errno #180424-00004#1 mark
      
      #200420-00042#1 add ---s
      WHEN '4'         
         CALL s_abg_bgbd_count(ls_js) RETURNING r_success,r_errno 
      #200420-00042#1 add ---e

   END CASE

   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: s_aapp330_gen_ins_tmp(p_ld)
# Memo...........:
# Usage..........: CALL s_aapp330_gen_ins_tmp(p_ld,p_cate,p_acctype)
# Input parameter: 
# Return code....: 
# Date & Author..: #170509-00094#1   17/09/29   By 05488
# Modify.........: #180208-00014#1   add p_ld
#                : #180808-00051#1   add p_cate,p_acctype
################################################################################
PUBLIC FUNCTION s_aapp330_gen_ins_tmp(p_ld,p_cate,p_acctype)
DEFINE p_ld          LIKE glaa_t.glaald  #180208-00014#1
DEFINE p_cate        LIKE gzza_t.gzza001 #180808-00051#1 add
DEFINE p_acctype     LIKE type_t.chr1    #180808-00051#1 add
DEFINE l_sql         STRING
DEFINE l_c           LIKE glaq_t.glaq004
DEFINE l_glaq010     LIKE glaq_t.glaq010
DEFINE l_glaq041     LIKE glaq_t.glaq041
DEFINE l_glaq044     LIKE glaq_t.glaq044
DEFINE l_glaq0101    LIKE glaq_t.glaq010
DEFINE l_glad002     LIKE glad_t.glad002  #180808-00051#1 add
DEFINE l_glac008     LIKE glac_t.glac008  #180808-00051#1 add
DEFINE l_cnt         LIKE type_t.num5     #180808-00051#1 add
DEFINE l_glad010     LIKE glad_t.glad010  #181015-00017#1 add
DEFINE l_glad027     LIKE glad_t.glad027  #181015-00017#1 add
DEFINE l_glaq002     LIKE glaq_t.glaq002  #181015-00017#1 add
DEFINE l_glac016     LIKE glac_t.glac016  #190528-00007#1 add 
#190507-00025#1 add ---s
DEFINE l_tok         base.Stringtokenizer  
DEFINE l_cate        LIKE type_t.chr10  #原帳款類型 
DEFINE l_cate2       LIKE type_t.chr10  #沖銷類型 
DEFINE l_cate3       LIKE type_t.chr10  #沖銷類型  
#190507-00025#1 add ---e
DEFINE l_tmp         RECORD
                     docno    LIKE glaq_t.glaqdocno,     #01-彙總單號
                     docdt    LIKE glap_t.glapdocdt,     #02-彙總日期
                     sw       LIKE type_t.chr1,          #03-1.借  2.貸
                     glaqent  LIKE glaq_t.glaqent,       #04-
                     glaqcomp LIKE glaq_t.glaqcomp,      #05-
                     glaqld   LIKE glaq_t.glaqld,        #06-
                     glaq001  LIKE glaq_t.glaq001,       #07-摘要
                     glaq002  LIKE glaq_t.glaq002,       #08-科目編號
                     glaq005  LIKE glaq_t.glaq005,       #09-交易幣別
                     glaq006  LIKE glaq_t.glaq006,       #10-匯率
                     glaq007  LIKE glaq_t.glaq007,       #11-計價單位
                     glaq008  LIKE glaq_t.glaq008,       #12-數量
                     glaq009  LIKE glaq_t.glaq009,       #13-單價
                     glaq011  LIKE glaq_t.glaq011,       #14-票據編碼
                     glaq012  LIKE glaq_t.glaq012,       #15-票據日期
                     glaq013  LIKE glaq_t.glaq013,       #16-申請人
                     glaq014  LIKE glaq_t.glaq014,       #17-銀行帳號
                     glaq015  LIKE glaq_t.glaq015,       #18-結算方式
                     glaq016  LIKE glaq_t.glaq016,       #19-收支項目
                     glaq017  LIKE glaq_t.glaq017,       #20-營運據點
                     glaq018  LIKE glaq_t.glaq018,       #21-固定核算項-部門
                     glaq019  LIKE glaq_t.glaq019,       #22-固定核算項-利潤/成本中心
                     glaq020  LIKE glaq_t.glaq020,       #23-固定核算項-區域
                     glaq021  LIKE glaq_t.glaq021,       #24-固定核算項-交易客商
                     glaq022  LIKE glaq_t.glaq022,       #25-固定核算項-帳款客戶
                     glaq023  LIKE glaq_t.glaq023,       #26-固定核算項-客群
                     glaq024  LIKE glaq_t.glaq024,       #27-固定核算項-產品類別
                     glaq025  LIKE glaq_t.glaq025,       #28-固定核算項-人員
                     glaq026  LIKE glaq_t.glaq026,       #29-固定核算項-預算編號(NO USE)
                     glaq027  LIKE glaq_t.glaq027,       #30-固定核算項-專案編號
                     glaq028  LIKE glaq_t.glaq028,       #31-固定核算項-WBS        
                     glaq051  LIKE glaq_t.glaq051,       #32-固定核算項-經營方式   
                     glaq052  LIKE glaq_t.glaq052,       #33-固定核算項-渠道       
                     glaq053  LIKE glaq_t.glaq053,       #34-固定核算項-品牌       
                     glaq029  LIKE glaq_t.glaq029,       #35-自由核算項
                     glaq030  LIKE glaq_t.glaq030,       #36-自由核算項
                     glaq031  LIKE glaq_t.glaq031,       #37-自由核算項
                     glaq032  LIKE glaq_t.glaq032,       #38-自由核算項
                     glaq033  LIKE glaq_t.glaq033,       #39-自由核算項
                     glaq034  LIKE glaq_t.glaq034,       #40-自由核算項
                     glaq035  LIKE glaq_t.glaq035,       #41-自由核算項
                     glaq036  LIKE glaq_t.glaq036,       #42-自由核算項
                     glaq037  LIKE glaq_t.glaq037,       #43-自由核算項
                     glaq038  LIKE glaq_t.glaq038,       #44-自由核算項
                     d        LIKE glaq_t.glaq003,       #45-借方金額
                     c        LIKE glaq_t.glaq004,       #46-貸方金額
                     sum      LIKE glaq_t.glaq010,       #47-金額
                     glaq039  LIKE glaq_t.glaq039,       #48-本位幣二-匯率
                     glaq040  LIKE glaq_t.glaq040,       #49-本位幣二-借方金額
                     glaq041  LIKE glaq_t.glaq041,       #40-本位幣二-貸方金額
                     glaq042  LIKE glaq_t.glaq042,       #51-本位幣三-匯率
                     glaq043  LIKE glaq_t.glaq043,       #52-本位幣三-借方金額
                     glaq044  LIKE glaq_t.glaq044,       #53-本位幣三-貸方金額
                     docseq   LIKE glaq_t.glaqseq,       #54-來源單據項次
                     source   LIKE type_t.chr100,        #55-來源TABLE(回寫時,會依據來源資料回寫)
                     glaqseq  LIKE glaq_t.glaqseq,       #56-項次
                     xrca039  LIKE xrca_t.xrca039,       #57-會計檢核附件份數
                     apcb022  LIKE apcb_t.apcb022,       #58-正負值
                     key1     LIKE type_t.chr80,         #59-PK1
                     key2     LIKE type_t.chr80,         #60-PK2
                     type     LIKE type_t.chr1,          #61-彙總類型(1:清單,2:彙總)
                     glaq010  LIKE glaq_t.glaq010,       #62-原幣
                     apcb023  LIKE apcb_t.apcb023,       #63-暫估否
                     glgb055  LIKE glgb_t.glgb055,       #64-現金變動碼
                     red      LIKE type_t.chr1           #65-紅沖否
                     END RECORD                             

        UPDATE s_voucher_tmp
           SET glaq0101 = ABS(glaq010)
         WHERE c > 0
        UPDATE s_voucher_tmp
           SET glaq010 = 0
         WHERE c > 0 
        UPDATE s_voucher_tmp
           SET glaq010 = ABS(glaq010)
         WHERE d > 0  
        UPDATE s_voucher_tmp
           SET glaq0101 = 0
         WHERE d > 0           
         
        DELETE FROM s_voucher_tmp2
        #181015-00017#1---add---(S)因s_aapp330_gen_ac寫入tmp時有強迫寫入客商,所以在合併前要先把沒啟用的清掉
        SELECT glaa004
          INTO g_glaa004
          FROM glaa_t
         WHERE glaaent = g_enterprise AND glaald = p_ld
        LET l_sql = " SELECT DISTINCT glaq002",         
                    "   FROM s_voucher_tmp ",
                    "  WHERE type = '2'"
        PREPARE s_aapp330_glaq002_p FROM l_sql
        DECLARE s_aapp330_glaq002_c CURSOR FOR s_aapp330_glaq002_p
        #LET l_sql = " SELECT glad010,glad027", #190528-00007#1 mark
         LET l_sql = " SELECT glad010,glad027,glac016", #190528-00007#1 add        
                    "   FROM glad_t ",
                    "   LEFT JOIN glac_t ON glacent = gladent AND glad001 = glac002 AND glac001 = '",g_glaa004,"'", 
                    "  WHERE gladent = ",g_enterprise," AND gladld = '",p_ld CLIPPED,"'",
                    "    AND glad001 = ? "
        PREPARE s_aapp330_glad_p FROM l_sql
        FOREACH s_aapp330_glaq002_c INTO l_glaq002
           #EXECUTE s_aapp330_glad_p USING l_glaq002 INTO l_glad010,l_glad027 #190528-00007#1 mark
           EXECUTE s_aapp330_glad_p USING l_glaq002 INTO l_glad010,l_glad027,l_glac016 #190528-00007#1 add  
           IF l_glad010 = 'N' THEN #190528-00007#1 mark #190507-00025#1 remark
           #IF l_glad010 = 'N' AND l_glac016 <> 'Y' THEN #190528-00007#1 add #190507-00025#1 mark 
              UPDATE s_voucher_tmp SET glaq021 =' ' 
               WHERE type = '2'
                 AND glaq002 = l_glaq002
           END IF
                      
           IF l_glad027 = 'N' THEN #190528-00007#1 mark #190507-00025#1 remark
           #IF l_glad027 = 'N' AND l_glac016 <> 'Y' THEN #190528-00007#1 add #190507-00025#1 mark
              UPDATE s_voucher_tmp SET glaq022 =' ' 
               WHERE type = '2'
                 AND glaq002 = l_glaq002
           END IF
        END FOREACH
        #181015-00017#1---add---(E)
        
        #190507-00025#1 add ---s
        #拆解p_cate成l_cate和l_cate2和l_cate3
        LET l_cate = '' LET l_cate2 = '' LET l_cate3 = ''
        LET l_tok = base.StringTokenizer.create(p_cate,"@")
        WHILE l_tok.hasMoreTokens()
           IF cl_null(l_cate) THEN
              LET l_cate = l_tok.nextToken()
           ELSE
              IF cl_null(l_cate2) THEN
                 LET l_cate2 = l_tok.nextToken()
              ELSE
                 LET l_cate3 = l_tok.nextToken()
              END IF  
           END IF
        END WHILE
        LET p_cate = l_cate
        #190507-00025#1 add ---e        
                     
        #180808-00051#1---add---(S)
        CASE p_acctype
           WHEN '1'
              LET l_sql = "SELECT docno,docdt,",
                          "       CASE WHEN d<>0 THEN 1 ELSE 2 END sw,",
                          "       glaqent,glaqcomp,",
                          "       '',glaq001,glaq002,glaq005,glaq006,",
                          "       glaq007,glaq008,glaq009,glaq011,glaq012,",
                          "       glaq013,glaq014,glaq015,glaq016,glaq017,",
                          "       glaq018,glaq019,glaq020,glaq021,glaq022,",
                          "       glaq023,glaq024,glaq025,glaq026,glaq027,",
                          "       glaq028,glaq051,glaq052,glaq053,glaq029,",
                          "       glaq030,glaq031,glaq032,glaq033,glaq034,",
                          "       glaq035,glaq036,glaq037,glaq038,d,",
                          "       c,sum,glaq039,glaq040,glaq041,",
                          "       glaq042,glaq043,glaq044,'','',",
                          "       '','','',key1,key2,",
                          "       '2',glaq010,'',glgb055,'',glaq0101",  
                          "  FROM s_voucher_tmp",
                          " WHERE type = '2'",
                          " ORDER BY docdt,docno,sw,glaq002,d DESC,c DESC"
           WHEN '2'
              LET l_sql = "SELECT '','','',glaqent,glaqcomp,",
                          "       '',glaq001,glaq002,glaq005,glaq006,",
                          "       glaq007,glaq008,glaq009,glaq011,glaq012,",
                          "       glaq013,glaq014,glaq015,glaq016,glaq017,",
                          "       glaq018,glaq019,glaq020,glaq021,glaq022,",
                          "       glaq023,glaq024,glaq025,glaq026,glaq027,",
                          "       glaq028,glaq051,glaq052,glaq053,glaq029,",
                          "       glaq030,glaq031,glaq032,glaq033,glaq034,",
                          "       glaq035,glaq036,glaq037,glaq038,",
                          "       CASE WHEN SUM(d-c)>0 THEN SUM(d-c) ELSE 0 END ,",
                          "       CASE WHEN SUM(c-d)>0 THEN SUM(c-d) ELSE 0 END ,",
                          "       CASE WHEN SUM(d-c)>0 THEN SUM(d-c) ELSE SUM(c-d) END,glaq039,",
                          "       CASE WHEN SUM(glaq040-glaq041)>0 THEN SUM(glaq040-glaq041) ELSE 0 END,",
                          "       CASE WHEN SUM(glaq041-glaq040)>0 THEN SUM(glaq041-glaq040) ELSE 0 END,",
                          "       glaq042,",
                          "       CASE WHEN SUM(glaq043-glaq044)>0 THEN SUM(glaq043-glaq044) ELSE 0 END,",
                          "       CASE WHEN SUM(glaq044-glaq043)>0 THEN SUM(glaq044-glaq043) ELSE 0 END,'','',",
                         #"       '','','',key1,key2,   '2',ABS(SUM(d-c)),'',glgb055,'',''",   #191202-00027#1 mark
                          "       '','','',key1,key2,   '2',ABS(SUM(COALESCE(glaq010,0)-COALESCE(glaq0101,0))),'',glgb055,'',''",   #191202-00027#1 add                         
                          "  FROM s_voucher_tmp",
                          " WHERE type = '2'",
                          " GROUP BY glaqent,glaqcomp,glaq001,glaq002,glaq005, glaq006,glaq007,glaq008,glaq009,glaq011,",
                          "          glaq012,glaq013,glaq014,glaq015,glaq016,  glaq017,glaq018,glaq019,glaq020,glaq021,",
                          "          glaq022,glaq023,glaq024,glaq025,glaq026,  glaq027,glaq028,glaq051,glaq052,glaq053,",
                          "          glaq029,glaq030,glaq031,glaq032,glaq033,  glaq034,glaq035,glaq036,glaq037,glaq038,",
                          "          glaq039,glaq042,key1,key2,glgb055"  
           WHEN '3'
        #180808-00051#1---add---(E)
        LET l_sql = "SELECT '','','',glaqent,glaqcomp,",
                    "       '',glaq001,glaq002,glaq005,glaq006,",
                    "       glaq007,glaq008,glaq009,glaq011,glaq012,",
                    "       glaq013,glaq014,glaq015,glaq016,glaq017,",
                    "       glaq018,glaq019,glaq020,glaq021,glaq022,",
                    "       glaq023,glaq024,glaq025,glaq026,glaq027,",
                    "       glaq028,glaq051,glaq052,glaq053,glaq029,",
                    "       glaq030,glaq031,glaq032,glaq033,glaq034,",
                    "       glaq035,glaq036,glaq037,glaq038,SUM(d),",
                    "       SUM(c),SUM(sum),glaq039,SUM(glaq040),SUM(glaq041),",
                    "       glaq042,SUM(glaq043),SUM(glaq044),'','',",
                    #"       '','','',key1,key2,   '2',SUM(glaq010),'','','',  SUM(glaq0101)",       #180313-00016#1 mark
                    "       '','','',key1,key2,   '2',SUM(glaq010),'',glgb055,'',  SUM(glaq0101)",   #180313-00016#1 add 
                    "  FROM s_voucher_tmp",
                    " WHERE type = '2'",
                    " GROUP BY glaqent,glaqcomp,glaq001,glaq002,glaq005, glaq006,glaq007,glaq008,glaq009,glaq011,",
                    "          glaq012,glaq013,glaq014,glaq015,glaq016,  glaq017,glaq018,glaq019,glaq020,glaq021,",
                    "          glaq022,glaq023,glaq024,glaq025,glaq026,  glaq027,glaq028,glaq051,glaq052,glaq053,",
                    "          glaq029,glaq030,glaq031,glaq032,glaq033,  glaq034,glaq035,glaq036,glaq037,glaq038,",
                    "          glaq039,glaq042,key1,key2"  #180208-00014#1 mark  #180208-00035#1 remark
                   ,"         ,glgb055 "   #180313-00016#1 add
        END CASE   #180808-00051#1 add        
        #180208-00035#1-s mark
        ##180208-00014#1-s
        #            "          key1,key2"
        #IF g_glaa015 = 'Y' THEN
        #   LET l_sql = l_sql,",glaq039"
        #END IF
        #IF g_glaa019 = 'Y' THEN
        #   LET l_sql = l_sql,",glaq042"
        #END IF
        ##180208-00014#1-e
        #180208-00035#1-s mark
        PREPARE s_aapp330_tmp_p FROM l_sql
        DECLARE s_aapp330_tmp_c CURSOR FOR s_aapp330_tmp_p
        FOREACH s_aapp330_tmp_c INTO l_tmp.*,l_glaq0101

            IF l_tmp.d = 0 AND l_tmp.c = 0 THEN
               CONTINUE FOREACH
            END IF
            IF cl_null(l_tmp.glaq010) THEN LET l_tmp.glaq010 = 0 END IF
            IF cl_null(l_glaq0101) THEN LET l_glaq0101 = 0 END IF
            LET l_glaq010 = l_tmp.glaq010
              
            #180808-00051#1---add---(S) 借貸合併後方向判斷:若acctype=2時且有紅字傳票&設定依餘額類型呈現->抓glac008
            IF p_acctype = '2' AND g_red_pn = 'Y' THEN
               LET l_glad002 = 'N' 
               LET l_glac008 = '1'
               EXECUTE s_aapp330_p1 USING p_ld,l_tmp.glaq002
                  INTO l_glad002,l_glac008
               #若為沖銷類別P20/P30且會科存在於沖銷類型為(11~14)單據中才做紅字處理
              #IF l_glad002 = 'Y' AND (p_cate = 'P20' OR p_cate = 'P30') THEN #180808-00013#7 mark
               #IF l_glad002 = 'Y' AND p_cate = 'P20' THEN #180808-00013#7 add #190507-00025#1 mark
               IF l_glad002 = 'Y' AND (p_cate = 'P20' OR l_cate2 = 'P20') THEN #190507-00025#1 add
                  LET l_cnt = 0
                  EXECUTE s_aapp330_p2 USING p_ld,l_tmp.glaq002
                     INTO l_cnt
                  IF l_cnt <= 0 THEN
                     LET l_glad002 = 'N' 
                  END IF
               END IF   
               IF l_glad002 = 'Y' THEN #須按餘額類型呈現借貸
                  IF l_glac008 = '1' THEN #借方
                     LET l_tmp.d = l_tmp.d - l_tmp.c 
                     LET l_tmp.c = 0
                     LET l_tmp.glaq040 = l_tmp.glaq040 - l_tmp.glaq041
                     LET l_tmp.glaq041 = 0
                     LET l_tmp.glaq043 = l_tmp.glaq043 - l_tmp.glaq044
                     LET l_tmp.glaq044 = 0
                  ELSE                    #貸方
                     LET l_tmp.c = l_tmp.c - l_tmp.d 
                     LET l_tmp.d = 0
                     LET l_tmp.glaq041 = l_tmp.glaq041 - l_tmp.glaq040
                     LET l_tmp.glaq040 = 0
                     LET l_tmp.glaq044 = l_tmp.glaq044 - l_tmp.glaq043
                     LET l_tmp.glaq043 = 0
                  END IF
               END IF
            END IF
            #180808-00051#1---add---(E)
            #借貸都有金額則拆兩筆
            IF l_tmp.d != 0 AND l_tmp.c != 0 THEN
               LET l_c = l_tmp.c
               LET l_glaq041 = l_tmp.glaq041
               LET l_glaq044 = l_tmp.glaq044
               
               #借
               LET l_tmp.glaq010 = l_glaq010     
               LET l_tmp.c = 0
               LET l_tmp.glaq041 = 0
               LET l_tmp.glaq044 = 0
               LET l_tmp.sw = 1
               INSERT INTO s_voucher_tmp2 VALUES(l_tmp.*)  
               #貸
               LET l_tmp.glaq010 = l_glaq0101  
               LET l_tmp.d = 0
               LET l_tmp.glaq040 = 0
               LET l_tmp.glaq043 = 0
               LET l_tmp.c = l_c
               LET l_tmp.glaq041 = l_glaq041
               LET l_tmp.glaq044 = l_glaq044
               LET l_tmp.sw = 2
               INSERT INTO s_voucher_tmp2 VALUES(l_tmp.*)              
            ELSE
               IF l_tmp.d = 0 THEN
                  LET l_tmp.sw = 2
               ELSE
                  LET l_tmp.sw = 1
               END IF
               LET l_tmp.glaq010 = l_tmp.glaq010 + l_glaq0101
               INSERT INTO s_voucher_tmp2 VALUES(l_tmp.*)  
            END IF
        END FOREACH
END FUNCTION

 
{</section>}
 
