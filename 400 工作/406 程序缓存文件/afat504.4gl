#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="afat504.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0117(2020-11-17 15:51:12), PR版次:0117(2021-06-01 10:13:21)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000529
#+ Filename...: afat504
#+ Description: 資產出售維護作業
#+ Creator....: 02599(2014-08-04 22:31:20)
#+ Modifier...: 07804 -SD/PR- 08734
 
{</section>}
 
{<section id="afat504.global" type="s" >}
#應用 t01 樣板自動產生(Version:120)
#add-point:填寫註解說明 name="global.memo" 
#150922-00011#1   2015/09/23 BY 02291    數量調整后，金額沒有重新計算
#151022-00001#1   BY yangtt  20151022    新增列印功能
#151125-00001#1   2015/11/27 BY fionchen 執行[作廢]作業時,增加詢問「是否執行作廢？」
#150916-00015#1   2015/12/7  BY Xiaozg   1.快捷带出类似科目编号 2.当有账套时，科目检查改为检查是否存在于glad_t中
#151210-00006#1   2015/12/10 BY yangtt   单据作业动态设定打印报表元件
#151125-00006#2   2015/12/11 BY 06421    添加自动审核和自动抛转凭证功能
#151130-00015#2   2015/12/21 BY taozf    判断 是否可以更改單據日期 設定開放單據日期修改
#160310-00013#1   2016/03/10 BY fengmy   给营运中心fabo031赋默认值为faajsite
#160318-00005#11  2016/03/25 BY 07675    將重複內容的錯誤訊息置換為公用錯誤訊息
#160405-00007#1   2016/04/05 BY 02599    增加建立临时表
#160318-00025#5   2016/04/14 BY 07675    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160414-00015#1   2016/04/25 BY 07673    复制时清空特定栏位
#141208-00020#1   2016/05/11 BY 01531    BMP簽核流程调整
#160616-00005#3   2016/06/20 BY 02599    帳款還原檢核:1 axrt330 有憑證, 單據日期小於關帳日期則不可還原
#                                                   2.账款还原时判断若axrt330已确认，则先调用axrt330取消确认段逻辑
#160616-00005#3   2016/06/21 BY 01531    #141208-00022#1BUG修复
#160426-00014#7   2016/07/24 BY 01531    免税不可以出售(faah036)，免税为1为可免税的不可以出售，自动产生单身+单身栏位检核修改
#160727-00019#2   2016/08/01 BY 08742    系统中定义的临时表名称超过15码在执行时会出错,所以需要将系统中定义的临时表长度超过15码的全部改掉	 	
#                                        MOD   afap280_01_group -->afap280_tmp02
#                                        MOD   afap280_01_fa_tmp -->afap280_tmp01
#160125-00005#7   2016/08/09 BY 02599    查詢時加上帳套人員權限條件過濾
#160426-00014#33  2016/08/17 BY 02114    修改权限的问题
#160812-00017#7   2016/08/22 By 06137    在satatchange( )的FUNCTION中，有RETURN指令但沒有加上transaction_end( ) 造成transaction沒有結束就直接RETURN
#160818-00017#10  2016/08/25 By 07900    删除修改未重新判断状态码
#160905-00007#2   2016/09/05 by 08742    调整系统中无ENT的SQL条件增加ent ,count(*) --> count(1)
#160426-00014#23  2016/09/12 By 07900    固定资产的t作业的单身都增加名称与规格二个栏位，取值来源为afai100的faah012,faah013,各单身表栏位直接按现有表依序增加
#160913-00017#1   2016/09/23 By 07900    AFA模组调整交易客商开窗
#161017-00023#1   2016/10/26 By 02114    增加控制组
#161024-00008#4   2016/10/27 By Hans     AFA組織類型與職能開窗清單調整。
#161024-00008#6   2016/10/28 By Hans     AFA組織類型與職能開窗清單調整。
#161028-00042#1   2016/10/28 By 02114    afat504新增时，整批产生单身，科目与核算项明细页签的资料显示不出来，需要重新查询才会显示
#161111-00049#12  2016/11/28 By 01531     二阶段FA问题7~14 调整作业:afat450/afat500/afat501/afat502/afat503/afat504/afat505/afat506
#161127-00005#1   2016/11/30 By 01727    税别栏位离开时抓取法人SQL错误
#161215-00044#1   2016/12/16 by 02481    标准程式定义采用宣告模式,弃用.*写
#161229-00032#1   2016/12/30 By 02114    不启用分录底稿时,凭证预览无限弹窗报传入的科目不可为空的错
#161104-00046#22  2017/01/05 By Reanna   單別預設值;資料依照單別user dept權限過濾單號
#161228-00013#1   2017/01/10 By 07900    对确定的一笔出售单，通过整单操作的“生成账款”，调出afap270未将单号显示在单身的符合条件的单据，需要点击“对勾”才能查询出
#160920-00025#1   2017/01/11 By 07900    测试afat504发现诸多问题，如下：
#                                        1.打开afat504作业，点击新增，鼠标直接移到单别开窗，选择单号，然后选择账款客户，然后选择税种，开窗无任何资料，检查发现fabgcomp未给值，g_ooef019无值，
#                                        税别开窗开不出来。
#                                        2.当输入完单头单身资料保存后，单头税别改变（由含税改零税或零税改其他，只要税率有变），单身税额等栏位没有联动
#                                          （注意:修正时还应结合含税否属性给单身单价、金额、税额等的联动）
#                                        3.如将含税改成零税时，单身原已有税额，即使手动点进单身，修改单价，也没有修正税额等
#                                        4.单身的税前单价、金额、税额都可以任意输入，没有任何管控，以致会有单价*数量不等于金额的情况
#                                          也因为税额栏位开放可以任意输入，会有即使选择单头零税率，单身有税额的情况，或者单头选择含税率，单身无税额或税额值不对的情况
#                                        5.单身的原币金额和本币金额也没有任何联动管控，上面的币种汇率也形同虚设
#                                        6.单头的币种没有自动带出汇率，修改也跟税种汇率一样，单身没有联动
#                                        7.同一个财产编号可以在两笔出售单中输入（不管是自动产生还是手工个输入），而且可以在一个审核过账后，另一个也可以审核过账，造成一个财产编号被卖出两次
#                                        8.建议录入财产编号的时候，如果卡片编号唯一，能自动带出来
#                                        9.18主机1区DSCNJ据点，单身输入AIQQTEST这个财产编号，回车经过税种的时候会报传入参数为空或传入值不正确的提示，而且会跳很多次，点多次才关闭
#                                        10.原来单身只有一笔项次为2的资料，现将项次2改成项次1，点确定，会提示：fabo_t请重新审核查询条件，更新时并无找到符合条件的资料，然后保存不成功
#                                        11.146主机5区AJ0据点，单号AJ0-YD1-161000000003，单身为空白的时候点击单身自动产生单身，产生出来的财产编号ZLLTEST的出售数量为-1。
#                                           再点进单身修改，将数量改成1，提示afa-00159的错误提示“出售数量不可大于总数量”，实际该料有数量1的。
#                                           此财产编号是在afai100中新从E3035004这个编号复制来的，可能将不该复制的如已出售数量的也复制了，导致的这个现象
#170111-00030#1   2017/01/16 By 07900    修改出售单价，单身【科目与核算项明细】页签的“异动科目”未依据【异动明细】页签的处分损益而变化，分录底稿的科目是正确的
#170301-00027#8   2017/03/03 by 08172    单别参照表调整
#161219-00009#3   2017/03/06 By 01531    q_fabgdocno,q_fabg008开窗增加账套权限
#170308-00010#2   2017/03/16 By 09042    整批調整ooed007失效日期, SQL條件中若寫到ooed007 >= l_date，需要改成ooed007 > l_date
#170322-00011#2   170325     By albireo  單頭的{幣別}更改時, 重新取匯率
#170315-00043#3   2017/03/27 By 09263    單據作業增加關帳日期控卡整批調整
#170412-00050#1   2017/04/14 By 07900    1.5区，SCUD1002据点，单号：SC2-YD1-170400000001：【收款客户】栏位没有跟着【账款客户】变，BUG重现操作：step1[账款客户]栏位录入V1001,【收款客户】自动带V1001,再将[账款客户]改为S1001,收款客户仍然V1001,并且存档成功没有报错
#                                        2.5区，SCUD1002据点，单号：SC2-YD1-170400000001，凭证预览里的摘要没有根据设置自动产生。详见附件。（170412-00051并入）
#                                        3.5区，SCUD1002据点，单号：SC2-YD1-170400000001 执行整单操作>生成账款，产生到axrt330里的单价变掉了，详见附件。(170412-00053并入)
#                                        4.5区，SCUD1002据点，单号：SC2-YD1-170400000001，税的科目未获取，详见附件。
#170411-00031#31  2017/04/19 BY 09232   整批調整，員工姓名，若抓oofa011顯示的，都改成抓ooag011
#170420-00007#1   170517     By albireo 帳款  收款客戶用帳套法人pmab限制範圍
---和SA确认一下是不是从aisi070抓----(170412-00052并入)
#170524-00099#1   2017/05/25  By 05795   在afat504,應該在輸入時, 就要先檢核該對象,有沒有存在交易对象据点档中
#170603-00027#1   2017/06/08 By 09232   已被抵押資產不可被出售抵押='1' 未抵押才可出售, 其他狀態不可出售
#170620-00072#1   2017/06/20 By 01531   1.應收帳款編號(fabg011)請增加串查。
#                                       2.單據輸入時未自動帶入"科目與核算項明細"，故自動產生分錄底稿時，會提示缺少核算項.
#170627-00040#1 2017/06/28 By 05795        自动带入单身或复制财产编码至单身时，是不会存入单身，
#                                          并报错“异动前需要提折旧”，
#                                          但是在单身 直接开窗挑选固定资产卡片时，则失去了这种管控，没有报错，可以直接写入保存
#170509-00070#4   2017/07/25  By 06189     凭证还原的时候增加提示 
#170704-00052#1    2017/08/07 By 09773     新增检查财产编号是否在盘点中的判断
#170112-00040#1   2017/08/11  by 08172  1.单身数量单价金额之间要相互换算，税额修改时要管控税前金额和应收金额之间的关系
#                                       2.单头币种汇率修改时更新单身币种汇率,原币和本币金额之间添加联动管控
#                                       3.当原币=本币时关闭本币，当税率为0时关闭税额栏位
#170814-00012#35  2017/09/06  By 10044  開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#170825-00034#1   2017/09/07  By 09505  新增时没有卡控现行年度期别，但审核和删除做了卡控，导致可以新增单据，但无法删除和审核]
#170823-00023#1   2017/09/05  By 09771  修改单据日期栏位，使其根据aooi200的单据别编号停在那个栏位
#170901-00039#1   2017/09/15  By 08729  Afap270 出現錯誤訊息 當第一筆有單價 第二筆單價為0時 會有更新錯誤的問題
#170915-00031#6   2017/09/21  by 09767  修改单身项次栏位值后，将原项次对应的xrcd资料删除，否则会出现单头金额与单身总金额差异  
#170425-00037#7   2017/09/26  By 09772  ooea_t整批调整成ooef_t
#170921-00026#1   2017/10/10  by 09232  1.收款客户同账款客户一样时不需检核交易伙伴关系
#                                       2.根据账款客户去查询对应的收款客户，如果未查到收款客户则“收款客户”的值默认为“账款客户”的值
#171017-00037#1   2017/10/19  By 05016  收款客戶，可以是自己，不一定要是關係夥伴-->開窗。
#170512-00045#30  2017/10/20  By 09232  1.当单身手动录入资料时，若科目与核算项在不同的页签，根据科目判断启用的核算项，单身是否都有维护值，若存在没有值的核算项，打开核算项维护画面，已经有值的核算项带出默认值，若启用的核算项都有值，则不需打开子画面
#                                         (可复制aglt310_02做一个子画面，使用JSON的方式传参，因为单身同一行会有2个科目的情况，采用并集的方式显示启用的核算项)
#                                       2.若科目与核算项在同一个页签，则采用让栏位变为required的方式进行控制
#171023-00004#1   2017/10/23  By 05016  新增時若启用的核算项有值，應帶入核算項值。
#171023-00004#15  2017/11/23  By 09505  T作业单身维护科目后，若启用的核算项都有值，则不需打开核算项子画面
#171201-00004#1   2017/12/01  By 07900  增加一次性交易对象功能
#170421-00027#5   2017/12/04  By 09505  检核科目是否满足agli061限制条件。
#170617-00439#1   2017/12/25  By 09232 【整單操作】增加【重計帳面價值】針對[未確認]單據，可重新捉取帳面價值及出售損益，並且重新產生分錄。
#170330-00057#7   2018/01/02  By 10461  專編編號(項目編號)的開窗改為將開窗換成 q_pjab001_1
#170606-00033#8   2018/01/01  By 09232  財務系統相關 帳務人員,業務人員 開窗規格調整,帳務人員: 依據點所屬法人的所有據點人員(含 ALL)
#180111-00025#1   2018/01/11  By 08729  調整fabo007型態，改的跟faah018一樣(只有修改規格，程式只有簽出上傳)
#171006-00010#13  2018/01/12  By 10500  将事务的关闭提到cl_err()之前
#170606-00033#17  2018/01/16  By 09232  对账务人员默认值进行检核，是否属于据点对应的法人下
#180123-00057#1   2018/01/25  By 08525  对g_sql_ctrl1需要重新取值
#180111-00043#12  2018/02/22  By 07900  s_aooi150_ins说明修改
#180326-00032#1   2018/04/17  By 09505  1.开放单据日期可以是现行年月月初之后的日期,修改后日期月份若大于现行年月,当下提示"未来若账面价值有变动时请务必进单身做调整".
#                                       2.于单据确认时判断"最近修改日期与单据日期不在同一月份"
#                                       3.经过单身财编一律带出资产现况,不要再做新旧值的判断,因资产现况是一定要更新的.
#180503-00018#1   2018/05/03  By 09505  延续180326-00032#1 afat504 当日起大于现行年度提示sql表抓取错误
#180531-00043#1   2018/05/31  By 05634  計算處置相關金額依幣別取位
#180604-00010#1   2018/06/04  By 05634  1.處置預留殘值（fabo025)=(afai100預留殘值/未出售量）*本次出售量
#                                       2.原本afat504過帳以及過帳還原沒有回寫afai100的預留殘值(faaj019),應該要回寫
#                                       3.afat504單身呈現處置預留殘值（fabo025),僅呈現,不開放維護(DISPLAY ONLY)
#180508-00051#1   2018/06/12  By 09505  在品名规格后面加上取得日期（faah014）栏位，不可录入，直接带出，并在报表上打印
#180613-00008#3   2018/06/20  By 09773  调整单身的财产的取得日期(faah014)不可大于单头的申请日期和单据日期
#180613-00008#5   2018/06/27  By 09773  调整#180613-00008#3bug,当输入取得日期在单头日期之前的也报错了
#180614-00039#9   2018/07/05  By 07556  BPM整合功能修正:
#                                       1.提交前檢核，錯誤應回覆False
#                                       2.cl_bpm_set_detail_data()，需加「科目與核算項明細」子畫面單身afat504_01(s_detail1_afat504_01)
#                                       3.單據狀態為D/R時，修改、刪除紐為灰底無法操作
#                                       4.單據狀態為D/R時，修改資料時會報錯"資料狀態碼不為'N:未確認',不可異動該筆資料！"
#                                       5.單據狀態為D/R時，點statechange後，全部按鈕皆變成灰底無法操作
#180718-00057#1   2018/07/19  By 01531  1.税额科目未带出
#180802-00035#1   2018/08/02  By 05795  應收帳款編號若是空白，不需要串查
#180806-00027#1   2018/08/06  By 08729  還原帳款時要先將應收單的狀態碼改成N才能刪除
#180809-00012#1   2018/08/09  By 08729  要根據aoos020單據是否連號參數決定帳款單要刪除還是作廢。
#180821-00049#1   2018/08/22  By 05795  修改异动明细后点击保存，数据会被还原
#181001-00015#52  2018/10/30  By 05016  財務模組ENT修正
#181102-00020#4   2018/11/12  By 11384  单据类程式串接报表SQL写法调整
#181219-00017#1   2018/12/19  By 07491  BPM抽單失敗未提示訊息
#190107-00067#1   2019/01/08  By 05634  在afat504的单身加入判断，如果是列管资产，单身的成本与未折减额栏位赋值为0
#180531-00059#1   2019/02/27  By 09232  单价要取位
#180828-00006#2   2019/03/06  By 11384  关闭复制功能
#190322-00005#18  2019/03/27  By 12132  匯出EXCEL，改為POI方式
#190408-00001#1   2019/04/12  by 08172  还原#190107-00067#1，列管资产处置等各栏位取值方式同列账资产
#180920-00029#3   2019/04/10  By 11384  1.aooi200產生交易賬務分錄否(D-FIN-0030)为N时,整單操作[產生分錄底稿],[分錄底稿預覽],[傳票產生或查詢]需分別提示报错
#                                       2.增加凭证查询功能
#181015-00013#3   2019/09/25  By 10500  核算项页签部门预设，当分摊方式=1时，给afai100中财产编号的分摊部门，分摊方式=2和4时，给afat504单头的申请部门
#190218-00033#1   2019/09/29  By 10500 【财产编号】【附号】【卡片编号】栏位检核报错汇总显示
#180525-00007#1   2019/10/10  By 01531  部門核算項默认值修改，若分攤方式為單一部門,則取帳套對應的分攤部門，分攤方式非單一部門,則取固資單頭的保管部門.
#200116-00002#7   2020/02/21  By 13656  取汇率改为调用s_fin_get_curr_rate(传入参数)
#200116-00002#16  2020/03/12  By 13656  调整本位币二三的汇率
#200402-00035#1   2020/04/03  By 11234  核算项为null时写入数据库前给空格
#200407-00006#1   2020/04/08  By 11234  列管资产出售时处置成本金额为0，还原#190408-00001#1此单
#200414-00077#1   2020/04/16  By 13067  修正串查axrt330画面无资料显示的问题
#200506-00018#4   2020/05/13  By 11234  抛总账以及凭证还原操作简化
#200514-00005#1   2020/05/19  By 05795  先检查是否有xrcd，如果没有就不需要更新
#200605-00045#1   2020/06/23  By 13656  将g_glaa004改成g_glaa.glaa004  
#201028-00078#1   2020/10/29  By 13067  修改faah018没有取值的问题
#190723-00011#5   2020/11/09  By 13656  aooi200 D-FIN-0033是否可以更改单据日期=N;新增时单据日期是可以编辑的状态，只有修改是不可编辑的状态。
#201116-00024#1   2020/11/17  By 07804  1.afat504 畫面[異動明細]、[科目與核算項頁簽]增加:產品分類 2.調整產品分類相關邏輯與分錄底稿
#200813-00026#1   2020/08/14  By 11234  修改afat504账款客户开窗报错问题
#201230-00067#12  2021/01/12  By 14740  单据别维护了限定部门后，仍然能查到数据
#201109-00009#171 2021/02/17  By 14586  模糊查詢功能，將使用者輸入的字串自動補入*
#210419-00007#1   2021/04/19  By 11234  原币金额应用单头币种取位
#190906-00040#9   2021/04/23  By 14586  部門和責任中心的所属法人應與單頭帳套歸屬法人相同
#210531-00045#1   2021/06/01  By 08734  还原200414-00077#1此单修改，目前会导致串查不到资料
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
IMPORT FGL afa_afat504_01  #科目與核算項
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
PRIVATE type type_g_fabg_m        RECORD
       fabgsite LIKE fabg_t.fabgsite, 
   fabgsite_desc LIKE ooefl_t.ooefl003, 
   fabg001 LIKE fabg_t.fabg001, 
   fabg001_desc LIKE ooag_t.ooag011, 
   fabgld LIKE fabg_t.fabgld, 
   fabgld_desc LIKE glaal_t.glaal002, 
   fabgcomp LIKE fabg_t.fabgcomp, 
   fabg002 LIKE fabg_t.fabg002, 
   fabg002_desc LIKE ooag_t.ooag011, 
   fabg003 LIKE fabg_t.fabg003, 
   fabg003_desc LIKE ooefl_t.ooefl003, 
   fabg004 LIKE fabg_t.fabg004, 
   fabg005 LIKE fabg_t.fabg005, 
   fabgdocno LIKE fabg_t.fabgdocno, 
   fabgdocdt LIKE fabg_t.fabgdocdt, 
   fabg006 LIKE fabg_t.fabg006, 
   fabg006_desc LIKE pmaal_t.pmaal004, 
   fabg007 LIKE fabg_t.fabg007, 
   fabg007_desc LIKE pmaal_t.pmaal004, 
   fabg021 LIKE fabg_t.fabg021, 
   fabg013 LIKE fabg_t.fabg013, 
   fabg014 LIKE fabg_t.fabg014, 
   fabg015 LIKE fabg_t.fabg015, 
   fabg016 LIKE fabg_t.fabg016, 
   fabg008 LIKE fabg_t.fabg008, 
   fabg011 LIKE fabg_t.fabg011, 
   fabgstus LIKE fabg_t.fabgstus, 
   fabgownid LIKE fabg_t.fabgownid, 
   fabgownid_desc LIKE ooag_t.ooag011, 
   fabgowndp LIKE fabg_t.fabgowndp, 
   fabgowndp_desc LIKE ooefl_t.ooefl003, 
   fabgcrtid LIKE fabg_t.fabgcrtid, 
   fabgcrtid_desc LIKE ooag_t.ooag011, 
   fabgcrtdp LIKE fabg_t.fabgcrtdp, 
   fabgcrtdp_desc LIKE ooefl_t.ooefl003, 
   fabgcrtdt LIKE fabg_t.fabgcrtdt, 
   fabgmodid LIKE fabg_t.fabgmodid, 
   fabgmodid_desc LIKE ooag_t.ooag011, 
   fabgmoddt LIKE fabg_t.fabgmoddt, 
   fabgcnfid LIKE fabg_t.fabgcnfid, 
   fabgcnfid_desc LIKE ooag_t.ooag011, 
   fabgcnfdt LIKE fabg_t.fabgcnfdt, 
   fabgpstid LIKE fabg_t.fabgpstid, 
   fabgpstid_desc LIKE ooag_t.ooag011, 
   fabgpstdt LIKE fabg_t.fabgpstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_fabo_d        RECORD
       faboseq LIKE fabo_t.faboseq, 
   fabo001 LIKE fabo_t.fabo001, 
   fabo002 LIKE fabo_t.fabo002, 
   fabo003 LIKE fabo_t.fabo003, 
   faah012 LIKE type_t.chr500, 
   faah013 LIKE type_t.chr500, 
   faah014 LIKE type_t.dat, 
   fabo000 LIKE fabo_t.fabo000, 
   fabo008 LIKE fabo_t.fabo008, 
   fabo053 LIKE fabo_t.fabo053, 
   fabo009 LIKE fabo_t.fabo009, 
   fabo005 LIKE fabo_t.fabo005, 
   fabo007 LIKE fabo_t.fabo007, 
   fabo006 LIKE fabo_t.fabo006, 
   fabo010 LIKE fabo_t.fabo010, 
   fabo011 LIKE fabo_t.fabo011, 
   fabo012 LIKE fabo_t.fabo012, 
   fabo013 LIKE fabo_t.fabo013, 
   fabo014 LIKE fabo_t.fabo014, 
   fabo015 LIKE fabo_t.fabo015, 
   fabo016 LIKE fabo_t.fabo016, 
   fabo017 LIKE fabo_t.fabo017, 
   fabo020 LIKE fabo_t.fabo020, 
   fabo018 LIKE fabo_t.fabo018, 
   fabo019 LIKE fabo_t.fabo019, 
   fabo021 LIKE fabo_t.fabo021, 
   fabo022 LIKE fabo_t.fabo022, 
   fabo049 LIKE fabo_t.fabo049, 
   fabo025 LIKE fabo_t.fabo025, 
   fabo023 LIKE fabo_t.fabo023, 
   fabo023_desc LIKE oocql_t.oocql004, 
   fabo031 LIKE fabo_t.fabo031, 
   fabo032 LIKE fabo_t.fabo032, 
   fabo033 LIKE fabo_t.fabo033, 
   fabo034 LIKE fabo_t.fabo034, 
   fabo035 LIKE fabo_t.fabo035, 
   fabo036 LIKE fabo_t.fabo036, 
   fabo037 LIKE fabo_t.fabo037, 
   fabo0554 LIKE type_t.chr500, 
   fabo055 LIKE fabo_t.fabo055, 
   fabo056 LIKE fabo_t.fabo056, 
   fabo038 LIKE fabo_t.fabo038, 
   fabo039 LIKE fabo_t.fabo039, 
   fabo040 LIKE fabo_t.fabo040, 
   fabo057 LIKE fabo_t.fabo057, 
   fabo060 LIKE fabo_t.fabo060, 
   fabo061 LIKE fabo_t.fabo061, 
   fabo062 LIKE fabo_t.fabo062, 
   fabo063 LIKE fabo_t.fabo063, 
   fabo064 LIKE fabo_t.fabo064, 
   fabo065 LIKE fabo_t.fabo065, 
   fabo066 LIKE fabo_t.fabo066, 
   fabo067 LIKE fabo_t.fabo067, 
   fabo068 LIKE fabo_t.fabo068, 
   fabo069 LIKE fabo_t.fabo069
       END RECORD
PRIVATE TYPE type_g_fabo3_d RECORD
       xrcdseq LIKE xrcd_t.xrcdseq, 
   xrcdseq2 LIKE xrcd_t.xrcdseq2, 
   fabo001 LIKE fabo_t.fabo001, 
   xrcd007 LIKE xrcd_t.xrcd007, 
   xrcd002 LIKE xrcd_t.xrcd002, 
   xrcd002_desc LIKE type_t.chr500, 
   xrcd003 LIKE xrcd_t.xrcd003, 
   xrcd006 LIKE xrcd_t.xrcd006, 
   xrcd100 LIKE xrcd_t.xrcd100, 
   xrcd005 LIKE xrcd_t.xrcd005, 
   xrcd104 LIKE xrcd_t.xrcd104, 
   xrcd103 LIKE xrcd_t.xrcd103, 
   xrcd105 LIKE xrcd_t.xrcd105, 
   xrcd009 LIKE xrcd_t.xrcd009, 
   xrcd009_desc LIKE type_t.chr500, 
   xrcd113 LIKE xrcd_t.xrcd113, 
   xrcd114 LIKE xrcd_t.xrcd114, 
   xrcd115 LIKE xrcd_t.xrcd115
       END RECORD
PRIVATE TYPE type_g_fabo4_d RECORD
       faboseq LIKE fabo_t.faboseq, 
   faaj103 LIKE type_t.num25_6, 
   fabo107 LIKE type_t.num25_6, 
   fabo101 LIKE fabo_t.fabo101, 
   fabo102 LIKE fabo_t.fabo102, 
   fabo103 LIKE fabo_t.fabo103, 
   fabo104 LIKE fabo_t.fabo104, 
   fabo105 LIKE fabo_t.fabo105, 
   fabo106 LIKE fabo_t.fabo106, 
   fabo108 LIKE fabo_t.fabo108, 
   fabo109 LIKE fabo_t.fabo109, 
   fabo110 LIKE fabo_t.fabo110, 
   fabo111 LIKE fabo_t.fabo111, 
   fabo112 LIKE fabo_t.fabo112, 
   faaj153 LIKE type_t.num25_6, 
   fabo156 LIKE type_t.num25_6, 
   fabo150 LIKE fabo_t.fabo150, 
   fabo151 LIKE fabo_t.fabo151, 
   fabo152 LIKE fabo_t.fabo152, 
   fabo153 LIKE fabo_t.fabo153, 
   fabo154 LIKE fabo_t.fabo154, 
   fabo155 LIKE fabo_t.fabo155, 
   fabo157 LIKE fabo_t.fabo157, 
   fabo158 LIKE fabo_t.fabo158, 
   fabo159 LIKE fabo_t.fabo159, 
   fabo160 LIKE fabo_t.fabo160, 
   fabo161 LIKE fabo_t.fabo161
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_fabgld LIKE fabg_t.fabgld,
      b_fabgdocno LIKE fabg_t.fabgdocno
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
GLOBALS
   DEFINE p_prog             LIKE type_t.chr20
   DEFINE g_wc_subject       STRING
   DEFINE g_wc_d             STRING
   DEFINE g_fabgld           LIKE fabg_t.fabgld
   DEFINE g_fabgdocno        LIKE fabg_t.fabgdocno
   DEFINE g_fabhseq          LIKE fabh_t.fabhseq 
   DEFINE g_fabgld_o         LIKE fabg_t.fabgld
   DEFINE g_fabgdocno_o      LIKE fabg_t.fabgdocno
   DEFINE g_faboseq_o        LIKE fabo_t.faboseq
   DEFINE g_detail_insert    LIKE type_t.num5   #單身的新增權限
   DEFINE g_detail_delete    LIKE type_t.num5   #單身的刪除權限
   
   TYPE type_g_fabo_d3        RECORD
       faboseq LIKE fabo_t.faboseq, 
   fabo024 LIKE fabo_t.fabo024, 
   fabo024_desc LIKE type_t.chr500, 
   fabo042 LIKE fabo_t.fabo042, 
   fabo031 LIKE fabo_t.fabo031, 
   fabo031_desc LIKE type_t.chr500, 
   fabo032 LIKE fabo_t.fabo032, 
   fabo032_desc LIKE type_t.chr500, 
   fabo033 LIKE fabo_t.fabo033, 
   fabo033_desc LIKE type_t.chr500, 
   fabo034 LIKE fabo_t.fabo034, 
   fabo034_desc LIKE type_t.chr500, 
   fabo035 LIKE fabo_t.fabo035, 
   fabo035_desc LIKE type_t.chr500, 
   fabo036 LIKE fabo_t.fabo036, 
   fabo036_desc LIKE type_t.chr500, 
   fabo037 LIKE fabo_t.fabo037, 
   fabo037_desc LIKE type_t.chr500, 
   fabo038 LIKE fabo_t.fabo038, 
   fabo038_desc LIKE type_t.chr500, 
   fabo039 LIKE fabo_t.fabo039, 
   fabo039_desc LIKE type_t.chr500, 
   fabo040 LIKE fabo_t.fabo040, 
   fabo040_desc LIKE type_t.chr500, 
   fabo054 LIKE fabo_t.fabo054, 
   fabo055 LIKE fabo_t.fabo055, 
   fabo055_desc LIKE type_t.chr500, 
   fabo056 LIKE fabo_t.fabo056, 
   fabo056_desc LIKE type_t.chr500, 
   #201116-00024#1-(S) add
   fabo057 LIKE fabo_t.fabo057, 
   fabo057_desc LIKE type_t.chr500,
   #201116-00024#1-(E) add
   fabo060 LIKE fabo_t.fabo060, 
   fabo060_desc LIKE type_t.chr500, 
   fabo061 LIKE fabo_t.fabo061, 
   fabo061_desc LIKE type_t.chr500, 
   fabo062 LIKE fabo_t.fabo062, 
   fabo062_desc LIKE type_t.chr500, 
   fabo063 LIKE fabo_t.fabo063, 
   fabo063_desc LIKE type_t.chr500, 
   fabo064 LIKE fabo_t.fabo064, 
   fabo064_desc LIKE type_t.chr500, 
   fabo065 LIKE fabo_t.fabo065, 
   fabo065_desc LIKE type_t.chr500, 
   fabo066 LIKE fabo_t.fabo066, 
   fabo066_desc LIKE type_t.chr500, 
   fabo067 LIKE fabo_t.fabo067, 
   fabo067_desc LIKE type_t.chr500, 
   fabo068 LIKE fabo_t.fabo068, 
   fabo068_desc LIKE type_t.chr500, 
   fabo069 LIKE fabo_t.fabo069, 
   fabo069_desc LIKE type_t.chr500
   END RECORD
   DEFINE g_fabo_d2          DYNAMIC ARRAY OF type_g_fabo_d3
END GLOBALS
DEFINE g_detail_id           STRING             #紀錄當前提留在那個單身Page上
#161215-00044#1---modify----begin-----------------
#DEFINE g_glaa      RECORD LIKE glaa_t.* 
DEFINE g_glaa RECORD  #帳套資料檔
        glaaent LIKE glaa_t.glaaent, #企业编号
        glaaownid LIKE glaa_t.glaaownid, #资料所有者
        glaaowndp LIKE glaa_t.glaaowndp, #资料所有部门
        glaacrtid LIKE glaa_t.glaacrtid, #资料录入者
        glaacrtdp LIKE glaa_t.glaacrtdp, #资料录入部门
        glaacrtdt LIKE glaa_t.glaacrtdt, #资料创建日
        glaamodid LIKE glaa_t.glaamodid, #资料更改者
        glaamoddt LIKE glaa_t.glaamoddt, #最近更改日
        glaastus LIKE glaa_t.glaastus, #状态码
        glaald LIKE glaa_t.glaald, #账套编号
        glaacomp LIKE glaa_t.glaacomp, #归属法人
        glaa001 LIKE glaa_t.glaa001, #使用币种
        glaa002 LIKE glaa_t.glaa002, #汇率参照表号
        glaa003 LIKE glaa_t.glaa003, #会计周期参照表号
        glaa004 LIKE glaa_t.glaa004, #会计科目参照表号
        glaa005 LIKE glaa_t.glaa005, #现金变动参照表号
        glaa006 LIKE glaa_t.glaa006, #月结方式
        glaa007 LIKE glaa_t.glaa007, #年结方式
        glaa008 LIKE glaa_t.glaa008, #平行记账否
        glaa009 LIKE glaa_t.glaa009, #凭证登录方式
        glaa010 LIKE glaa_t.glaa010, #现行年度
        glaa011 LIKE glaa_t.glaa011, #现行期别
        glaa012 LIKE glaa_t.glaa012, #最后过账日期
        glaa013 LIKE glaa_t.glaa013, #关账日期
        glaa014 LIKE glaa_t.glaa014, #主账套
        glaa015 LIKE glaa_t.glaa015, #启用本位币二
        glaa016 LIKE glaa_t.glaa016, #本位币二
        glaa017 LIKE glaa_t.glaa017, #本位币二换算基准
        glaa018 LIKE glaa_t.glaa018, #本位币二汇率采用
        glaa019 LIKE glaa_t.glaa019, #启用本位币三
        glaa020 LIKE glaa_t.glaa020, #本位币三
        glaa021 LIKE glaa_t.glaa021, #本位币三换算基准
        glaa022 LIKE glaa_t.glaa022, #本位币三汇率采用
        glaa023 LIKE glaa_t.glaa023, #次账套账务生成时机
        glaa024 LIKE glaa_t.glaa024, #单据别参照表号
        glaa025 LIKE glaa_t.glaa025, #本位币一汇率采用
        glaa026 LIKE glaa_t.glaa026, #币种参照表号
        glaa100 LIKE glaa_t.glaa100, #凭证录入时自动按缺号生成
        glaa101 LIKE glaa_t.glaa101, #凭证总号录入时机
        glaa102 LIKE glaa_t.glaa102, #凭证成立时,借贷不平衡的处理方式
        glaa103 LIKE glaa_t.glaa103, #未打印的凭证可否进行过账
        glaa111 LIKE glaa_t.glaa111, #应计调整单别
        glaa112 LIKE glaa_t.glaa112, #期末结转单别
        glaa113 LIKE glaa_t.glaa113, #年底结转单别
        glaa120 LIKE glaa_t.glaa120, #成本计算类型
        glaa121 LIKE glaa_t.glaa121, #子模块启用分录底稿
        glaa122 LIKE glaa_t.glaa122, #总账可维护资金异动明细
        glaa027 LIKE glaa_t.glaa027, #单据据点编号
        glaa130 LIKE glaa_t.glaa130, #合并账套否
        glaa131 LIKE glaa_t.glaa131, #分层合并
        glaa132 LIKE glaa_t.glaa132, #平均汇率计算方式
        glaa133 LIKE glaa_t.glaa133, #非T100公司导入余额类型
        glaa134 LIKE glaa_t.glaa134, #合并科目转换依据异动码设置值
        glaa135 LIKE glaa_t.glaa135, #现流表间接法群组参照表号
        glaa136 LIKE glaa_t.glaa136, #应收账款核销限定己立账凭证
        glaa137 LIKE glaa_t.glaa137, #应付账款核销限定已立账凭证
        glaa138 LIKE glaa_t.glaa138, #合并报表编制期别
        glaa139 LIKE glaa_t.glaa139, #递延收入(负债)管理生成否
        glaa140 LIKE glaa_t.glaa140, #无原出货单的递延负债减项者,是否仍立递延收入管理?
        glaa123 LIKE glaa_t.glaa123, #应收帐款核销可维护资金异动明细
        glaa124 LIKE glaa_t.glaa124, #应付帐款核销可维护资金异动明细
        glaa028 LIKE glaa_t.glaa028  #汇率来源
        END RECORD
 #161215-00044#1---modify----end-----------------
DEFINE g_ooef019             LIKE ooef_t.ooef019
DEFINE g_faah018             LIKE faah_t.faah018
DEFINE g_fabg019             LIKE fabg_t.fabg019
DEFINE g_bookno              LIKE glaa_t.glaald
DEFINE g_wc_fabg019          STRING #20141112
DEFINE g_fabo031             LIKE fabo_t.fabo031   #160310-00013#1
DEFINE g_faajsite            LIKE faaj_t.faajsite  #160310-00013#1
DEFINE g_wc_cs_ld            STRING                #160125-00005#7
DEFINE g_site_str            STRING                #160125-00005#7
DEFINE g_sql_ctrl            STRING                #161017-00023#1  add lujh
DEFINE g_glaacomp            LIKE glaa_t.glaacomp  #161111-00049#12
#161104-00046#22 add ------
DEFINE g_user_dept_wc        STRING
DEFINE g_user_dept_wc_q      STRING
DEFINE g_user_slip_wc        STRING
DEFINE g_ap_slip             LIKE ooba_t.ooba002
#161104-00046#22 add end---
DEFINE g_ld_str              STRING #161219-00009#3 
DEFINE l_glaa013   LIKE glaa_t.glaa013     #170315-00043#3 by 09263 --add
DEFINE l_glapdocdt LIKE glap_t.glapdocdt   #170315-00043#3 by 09263 --add
#170420-00007#1-----s
DEFINE g_sql_ctrl1           STRING
DEFINE g_sqlcomp             STRING
#170420-00007#1-----e
DEFINE g_dfin0033     LIKE type_t.chr1             #  170823-00023#1  2017/9/05 By 09771 ADD
DEFINE l_seq         LIKE fabo_t.faboseq      #170915-00031#6  add by 09767
DEFINE g_seq2         LIKE fabo_t.faboseq     #170915-00031#6  add by 09767

#170512-00045#30 add-s
DEFINE g_glaq_s            DYNAMIC ARRAY OF RECORD
          glaq017             LIKE glaq_t.glaq017,
          glaq018             LIKE glaq_t.glaq018,
          glaq019             LIKE glaq_t.glaq019,
          glaq020             LIKE glaq_t.glaq020,
          glaq021             LIKE glaq_t.glaq021,
          glaq022             LIKE glaq_t.glaq022,
          glaq023             LIKE glaq_t.glaq023,
          glaq024             LIKE glaq_t.glaq024,
          glaq051             LIKE glaq_t.glaq051,
          glaq052             LIKE glaq_t.glaq052,
          glaq053             LIKE glaq_t.glaq053,
          glaq025             LIKE glaq_t.glaq025,
          glaq027             LIKE glaq_t.glaq027,
          glaq028             LIKE glaq_t.glaq028,
          glaq029             LIKE glaq_t.glaq029,
          glaq030             LIKE glaq_t.glaq030,
          glaq031             LIKE glaq_t.glaq031,
          glaq032             LIKE glaq_t.glaq032,
          glaq033             LIKE glaq_t.glaq033,
          glaq034             LIKE glaq_t.glaq034,
          glaq035             LIKE glaq_t.glaq035,
          glaq036             LIKE glaq_t.glaq036,
          glaq037             LIKE glaq_t.glaq037,
          glaq038             LIKE glaq_t.glaq038,
          glbc004             LIKE glbc_t.glbc004
                          END RECORD         
DEFINE    ls_js              STRING	
DEFINE    la_param           RECORD	
          glaq0021      LIKE glaq_t.glaq021,	#科目1  
          glaq0022	   LIKE glaq_t.glaq022, #科目2
          glaq0023	   LIKE glaq_t.glaq023,  #科目3
          glaq0024	   LIKE glaq_t.glaq024  #科目3
 	
                         END RECORD	
#170512-00045#30 add-e

#end add-point
       
#模組變數(Module Variables)
DEFINE g_fabg_m          type_g_fabg_m
DEFINE g_fabg_m_t        type_g_fabg_m
DEFINE g_fabg_m_o        type_g_fabg_m
DEFINE g_fabg_m_mask_o   type_g_fabg_m #轉換遮罩前資料
DEFINE g_fabg_m_mask_n   type_g_fabg_m #轉換遮罩後資料
 
   DEFINE g_fabgld_t LIKE fabg_t.fabgld
DEFINE g_fabgdocno_t LIKE fabg_t.fabgdocno
 
 
DEFINE g_fabo_d          DYNAMIC ARRAY OF type_g_fabo_d
DEFINE g_fabo_d_t        type_g_fabo_d
DEFINE g_fabo_d_o        type_g_fabo_d
DEFINE g_fabo_d_mask_o   DYNAMIC ARRAY OF type_g_fabo_d #轉換遮罩前資料
DEFINE g_fabo_d_mask_n   DYNAMIC ARRAY OF type_g_fabo_d #轉換遮罩後資料
DEFINE g_fabo3_d          DYNAMIC ARRAY OF type_g_fabo3_d
DEFINE g_fabo3_d_t        type_g_fabo3_d
DEFINE g_fabo3_d_o        type_g_fabo3_d
DEFINE g_fabo3_d_mask_o   DYNAMIC ARRAY OF type_g_fabo3_d #轉換遮罩前資料
DEFINE g_fabo3_d_mask_n   DYNAMIC ARRAY OF type_g_fabo3_d #轉換遮罩後資料
DEFINE g_fabo4_d          DYNAMIC ARRAY OF type_g_fabo4_d
DEFINE g_fabo4_d_t        type_g_fabo4_d
DEFINE g_fabo4_d_o        type_g_fabo4_d
DEFINE g_fabo4_d_mask_o   DYNAMIC ARRAY OF type_g_fabo4_d #轉換遮罩前資料
DEFINE g_fabo4_d_mask_n   DYNAMIC ARRAY OF type_g_fabo4_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
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
 
{<section id="afat504.main" type="s" >}
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
   CALL cl_ap_init("afa","")
 
   #add-point:作業初始化 name="main.init"
   #161017-00023#1--add--str--lujh
   LET g_sql_ctrl = NULL
   CALL s_control_get_customer_sql('2',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   #161017-00023#1--add--end--lujh
   #161104-00046#22 add ------
   #建立與單頭array相同的temptable
   CALL s_aooi200def_create('','g_fabg_m','','','','','','')RETURNING g_sub_success
   #單別控制組
   LET g_user_dept_wc = ''
   CALL s_fin_get_user_dept_control('','fabgld','fabgent','fabgdocno') RETURNING g_user_dept_wc
   #開窗使用
   #LET g_user_dept_wc_q = g_user_dept_wc   #201230-00067#12  14740   mark  --s 
   CALL s_control_get_docno_sql(g_user,g_dept) RETURNING g_sub_success,g_user_slip_wc
   #161104-00046#22 add end---
   #161219-00009#3 add s---
   CALL s_axrt300_get_site(g_user,'','2') RETURNING g_ld_str                    
   CALL cl_replace_str(g_ld_str,'glaald','fabgld') RETURNING g_ld_str   
   #161219-00009#3 add e---     
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT fabgsite,'',fabg001,'',fabgld,'',fabgcomp,fabg002,'',fabg003,'',fabg004,fabg005,fabgdocno,fabgdocdt,fabg006,'',fabg007,'',fabg021,fabg013,fabg014,fabg015,fabg016,fabg008,fabg011,fabgstus,fabgownid,'',fabgowndp,'',fabgcrtid,'',fabgcrtdp,'',fabgcrtdt,fabgmodid,'',fabgmoddt, 
       fabgcnfid,'',fabgcnfdt,fabgpstid,'',fabgpstdt", 
                      " FROM fabg_t",
                      " WHERE fabgent= ? AND fabgld=? AND fabgdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE afat504_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
   CALL afat504_chk_data_exist(g_forupd_sql)   #190806-00019
 
   LET g_sql = " SELECT DISTINCT t0.fabgsite,t0.fabg001,t0.fabgld,t0.fabgcomp,t0.fabg002,t0.fabg003,t0.fabg004,t0.fabg005,t0.fabgdocno,t0.fabgdocdt,t0.fabg006,t0.fabg007,t0.fabg021,t0.fabg013,t0.fabg014,t0.fabg015,t0.fabg016,t0.fabg008,t0.fabg011,t0.fabgstus,t0.fabgownid,t0.fabgowndp,t0.fabgcrtid,t0.fabgcrtdp, 
       t0.fabgcrtdt,t0.fabgmodid,t0.fabgmoddt,t0.fabgcnfid,t0.fabgcnfdt,t0.fabgpstid,t0.fabgpstdt,t1.ooefl003 ,t2.ooag011 ,t3.glaal002 ,t4.ooag011 ,t5.ooefl003 ,t6.pmaal004 ,t7.pmaal004 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 ,t11.ooefl003 ,t12.ooag011 ,t13.ooag011 ,t14.ooag011",
               " FROM fabg_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.fabgsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.fabg001  ",
               " LEFT JOIN glaal_t t3 ON t3.glaalent="||g_enterprise||" AND t3.glaalld=t0.fabgld AND t3.glaal001='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.fabg002  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.fabg003 AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t6 ON t6.pmaalent="||g_enterprise||" AND t6.pmaal001=t0.fabg006 AND t6.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t7 ON t7.pmaalent="||g_enterprise||" AND t7.pmaal001=t0.fabg007 AND t7.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.fabgownid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.fabgowndp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.fabgcrtid  ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.fabgcrtdp AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.fabgmodid  ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.fabgcnfid  ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.fabgpstid  ",
 
               " WHERE t0.fabgent = " ||g_enterprise|| " AND t0.fabgld = ? AND t0.fabgdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE afat504_master_referesh FROM g_sql
 
    
 
 
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
  
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      #190108-00038 ---modify start---
      OPEN WINDOW w_afat504 WITH FORM cl_ap_formpath('afa',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL afat504_init()   
 
      #進入選單 Menu (="N")
      CALL afat504_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_afat504
      
   END IF 
   
   CLOSE afat504_cl
   
   
 
   #add-point:作業離開前 name="main.exit"


   DROP TABLE afap280_tmp01 #160405-00007#1 add  #160727-00019#2 Mod   afap280_01_fa_tmp -->afap280_tmp02 #ODI-ORA#


   DROP TABLE afap280_tmp02  #160405-00007#1 add  #160727-00019#2 Mod   afap280_01_group -->afap280_tmp02 #ODI-ORA#

   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="afat504.init" type="s" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION afat504_init()
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
   DEFINE l_fabg019   LIKE fabg_t.fabg019
   DEFINE l_success     LIKE type_t.num5 #160405-00007#1 add
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   LET g_err_rec = "N"   #161130-00056
      CALL cl_set_combo_scc_part('fabgstus','13','A,D,N,R,W,Y,Z,S,X')
 
      CALL cl_set_combo_scc('fabg005','9910') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   LET g_wc2_extend = " 1=1" #清空查詢方案條件 #190730-00003#4 add
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1','3',","1")
   CALL g_idx_group.addAttribute("'2',","1")
   CALL g_idx_group.addAttribute("","1")
 
 
   #190108-00038 ---start---
   CALL gfrm_curr.setElementHidden('ui_change',1)   #隱藏畫面切換action
   #190108-00038 --- end ---
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('fabg005','9910','4') 
   #子程式畫面取代主程式元件
   CALL cl_ui_replace_sub_window(cl_ap_formpath("afa", "afat504_01"), "grid_subject", "Table", "s_detail1_afat504_01")
   LET p_prog=g_prog

#20141120 mod--str--
#调拨规格在调整，此处先mark
#   #20141111 add--str--
#   LET l_fabg019 = NULL
#   SELECT fabg019 INTO l_fabg019 FROM fabg_t 
#    WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld AND fabgdocno = g_fabg_m.fabgdocno
#   IF NOT cl_null(l_fabg019) THEN
#      CALL cl_set_act_visible("open_afap270",FALSE) 
#   ELSE
#      CALL cl_set_act_visible("open_afap270",TRUE) 
#   END IF
#   #20141111 add--end---
    IF g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S' THEN 
       IF cl_null(g_fabg_m.fabg011) THEN 
          CALL cl_set_act_visible("open_afap270",TRUE) 
       ELSE
          CALL cl_set_act_visible("open_afap270",FALSE) 
       END IF
    END IF   
#20141120 mod--end---
   CALL afap280_01_cre_fa_tmp_table() RETURNING l_success #160405-00007#1 add
   CALL s_fin_create_account_center_tmp()  
   #end add-point
   
   #第一次進入init段時才跑default_search()，以避免後續作畫面轉換時因為重複執行init()段而導致g_wc條件值被異動
   IF cl_null(gs_first_time) OR gs_first_time <> "N" THEN   #190108-00038
      #初始化搜尋條件
      CALL afat504_default_search()
   END IF   #190108-00038
    
END FUNCTION
 
{</section>}
 
{<section id="afat504.chk_data_exist" type="s" >}
#+ 異動前先確認該筆資料是否存在
PRIVATE FUNCTION afat504_chk_data_exist(ps_sql)
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
 
   #200220-00002 (210511-00011 代追單)---modify start---
   #因應多資料庫，需依照各資料庫的語法做截取
   #ORACLE
   &ifdef is_ora
      LET ls_table = ""
      LET ls_wc = ""
      LET ls_b = ps_sql.getIndexOf("FROM",1)+5
      LET ls_e = ps_sql.getIndexOf("WHERE",ls_b)-1
      LET ls_table = ps_sql.subString(ls_b,ls_e)
 
      LET ls_b = ps_sql.getIndexOf("WHERE",1)
      LET ls_e = ps_sql.getIndexOf(" FOR ",ls_b)
      LET ls_wc = ps_sql.subString(ls_b,ls_e)
   &endif
 
   #MSV
   &ifdef is_msv
      LET ls_table = ""
      LET ls_wc = ""
      LET ls_b = ps_sql.getIndexOf("FROM",1)+5
      LET ls_e = ps_sql.getIndexOf("WITH",ls_b)-1
      LET ls_table = ps_sql.subString(ls_b,ls_e)
 
      LET ls_b = ps_sql.getIndexOf("WHERE",1)
      LET ls_e = ps_sql.getLength()
      LET ls_wc = ps_sql.subString(ls_b,ls_e)
   &endif
 
   #POSTGRE
   &ifdef is_pgs
      LET ls_table = ""
      LET ls_wc = ""
      LET ls_b = ps_sql.getIndexOf("FROM",1)+5
      LET ls_e = ps_sql.getIndexOf("WHERE",ls_b)-1
      LET ls_table = ps_sql.subString(ls_b,ls_e)
 
      LET ls_b = ps_sql.getIndexOf("WHERE",1)
      LET ls_e = ps_sql.getIndexOf(" FOR ",ls_b)
      LET ls_wc = ps_sql.subString(ls_b,ls_e)
   &endif
   #200220-00002 (210511-00011 代追單)--- modify end ---
 
   LET ls_sql = "SELECT COUNT(1) FROM ",ls_table," ",ls_wc
   PREPARE afat504_chk_data_exist_pre FROM ls_sql
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'PREPARE afat504_chk_data_exist_pre ERROR'
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.ui_dialog" type="s" >}
#+ 功能選單
PRIVATE FUNCTION afat504_ui_dialog()
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
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_n        LIKE type_t.num5
   DEFINE l_ooba002  LIKE ooba_t.ooba002
   DEFINE l_str1     LIKE type_t.chr1
   DEFINE l_fabg019  LIKE fabg_t.fabg019 #20141111
   DEFINE l_slip     LIKE type_t.chr20
   DEFINE l_ooac004  LIKE ooac_t.ooac004   
   DEFINE l_xrcadocdt  LIKE xrca_t.xrcadocdt #20150130 add by chenying
   DEFINE l_wc       STRING    #151022-00001#1 
   #151125-00006#2 add ---s 
   DEFINE l_cn              LIKE type_t.num5
   #151125-00006#2 add ---e
   DEFINE l_glapdocno       LIKE glap_t.glapdocno  #200506-00018#4 add  
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL afat504_insert()
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
         INITIALIZE g_fabg_m.* TO NULL
         CALL g_fabo_d.clear()
         CALL g_fabo3_d.clear()
         CALL g_fabo4_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL afat504_init()
      END IF
   
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
 
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
    
         DISPLAY ARRAY g_fabo_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL afat504_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1','3',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1','3',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL afat504_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_fabo3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL afat504_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body3.before_row"
 
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 2
               #顯示單身筆數
               CALL afat504_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body3.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_fabo4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL afat504_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("",l_ac)
               
               #add-point:page3, before row動作 name="ui_dialog.body4.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 3
               #顯示單身筆數
               CALL afat504_idx_chk()
               #add-point:page3自定義行為 name="ui_dialog.body4.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_3)
            
         
            #add-point:page3自定義行為 name="ui_dialog.body4.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         SUBDIALOG afa_afat504_01.afat504_01_display
         #end add-point
         
      
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1 
            #先填充browser資料
            #190108-00038 ---modify start---
         #  CALL afat504_browser_fill("")   #190114-00003 mark
         #  IF g_action_choice <> "ui_change" THEN   #190114-00003
            IF g_action_choice = "ui_change" THEN
               DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
               DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數
               DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
               DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數
               DISPLAY g_detail_idx  TO FORMONLY.idx       #單身當下筆數
               DISPLAY g_detail_cnt  TO FORMONLY.cnt       #單身總筆數
            ELSE
               CALL afat504_browser_fill("")
            END IF
            #190108-00038 --- modify end ---
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            
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
               CALL afat504_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL afat504_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL afat504_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            IF g_current_page = 1 THEN
               NEXT FIELD faboseq
            END IF
            
         ON ACTION detail_page
            LET g_detail_id = "detail_page"
            NEXT FIELD faboseq
         ON ACTION subject_page
            LET g_detail_id = "subject_page"
            NEXT FIELD fabo024
         ON ACTION tax_page
            LET g_detail_id = "tax_page"
            NEXT FIELD xrcd104
         ON ACTION curr_page
            LET g_detail_id = "curr_page"
            NEXT FIELD fabo103 
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL afat504_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL afat504_set_act_visible()   
            CALL afat504_set_act_no_visible()
            IF NOT (g_fabg_m.fabgld IS NULL
              OR g_fabg_m.fabgdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " fabgent = " ||g_enterprise|| " AND",
                                  " fabgld = '", g_fabg_m.fabgld, "' "
                                  ," AND fabgdocno = '", g_fabg_m.fabgdocno, "' "
 
               #填到對應位置
               CALL afat504_browser_fill("")
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
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "fabg_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "fabo_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "xrcd_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) 
                                                   AND NOT g_wc2.getIndexOf(g_wc2_table2,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2     #200917-00047
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
               CALL afat504_browser_fill("F")   #browser_fill()會將notice區塊清空
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
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE   
                     WHEN la_wc[li_idx].tableid = "fabg_t"                   
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "fabo_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "xrcd_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) 
                                                   AND NOT g_wc2.getIndexOf(g_wc2_table2,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2       #200917-00047
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend)
                                            AND NOT g_wc2.getIndexOf(g_wc2_extend,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend              #200917-00047
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL afat504_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL afat504_fetch("F")
                  END IF
                  LET g_wc2_extend = " 1=1" #190730-00003#4 add
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
          
         
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL afat504_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL afat504_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL afat504_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL afat504_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL afat504_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL afat504_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL afat504_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL afat504_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL afat504_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL afat504_idx_chk()
          
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
                        LET l_arr_len = g_fabo_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_fabo_d[l_arr_cnt]
                        END FOR
 
                        LET l_arr_len = g_fabo3_d.getLength()
                        LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[2] = "s_detail3"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[2][l_arr_cnt] = g_fabo3_d[l_arr_cnt]
                        END FOR
                        LET l_arr_len = g_fabo4_d.getLength()
                        LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[3] = "s_detail4"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[3][l_arr_cnt] = g_fabo4_d[l_arr_cnt]
                        END FOR
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                        #190322-00005#18 2019/03/27 By 12132 add ---s
                        LET l_arr_len = g_fabo_d2.getLength()
                        LET g_export_tag[4] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[4] = "s_detail1_afat504_01"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[4][l_arr_cnt] = g_fabo_d2[l_arr_cnt]
                        END FOR
                        #190322-00005#18 2019/03/27 By 12132 add ---e
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
                        LET g_export_node[1] = base.typeInfo.create(g_fabo_d)
                        LET g_export_id[1]   = "s_detail1"
                        LET g_export_node[2] = base.typeInfo.create(g_fabo3_d)
                        LET g_export_id[2]   = "s_detail3"
                        LET g_export_node[3] = base.typeInfo.create(g_fabo4_d)
                        LET g_export_id[3]   = "s_detail4"
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                        LET g_export_node[1] = base.typeInfo.create(g_fabo_d)
                        LET g_export_id[1]   = "s_detail1"
                        #190322-00005#18 2019/04/01 By 12132 mark ---s
                        #LET g_export_node[2] = base.typeInfo.create(g_fabo_d2)
                        #LET g_export_id[2]   = "s_detail1_afat504_01"  
                        #190322-00005#18 2019/04/01 By 12132 mark ---e                        
                        LET g_export_node[2] = base.typeInfo.create(g_fabo3_d)
                        LET g_export_id[2]   = "s_detail3"
                        LET g_export_node[3] = base.typeInfo.create(g_fabo4_d)
                        LET g_export_id[3]   = "s_detail4"
                        #190322-00005#18 2019/04/01 By 12132 add ---s
                        LET g_export_node[4] = base.typeInfo.create(g_fabo_d2)
                        LET g_export_id[4]   = "s_detail1_afat504_01"  
                        #190322-00005#18 2019/04/01 By 12132 add ---e
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
         #180226-00040 --- modify end ---
            
       
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
               CALL afat504_modify()
               #add-point:ON ACTION modify name="menu.modify"
               #add 151125-00006#2 --s
               LET l_cn = 0 
               SELECT COUNT(1) INTO l_cn FROM fabg_t     #160905-00007#2 count(*) --> count(1)
               WHERE fabgld  = g_fabg_m.fabgld  AND fabgdocno = g_fabg_m.fabgdocno AND fabgent = g_enterprise
               IF l_cn > 0 AND NOT cl_null (g_current_idx) THEN
                  CALL afat504_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL afat504_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               #add 151125-00006#2 --s
               LET l_cn = 0 
               SELECT COUNT(1) INTO l_cn FROM fabg_t   #160905-00007#2 count(*) --> count(1)
               WHERE fabgld  = g_fabg_m.fabgld  AND fabgdocno = g_fabg_m.fabgdocno AND fabgent = g_enterprise
               IF l_cn > 0 AND NOT cl_null (g_current_idx) THEN
                  CALL afat504_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_pre
            LET g_action_choice="open_pre"
            IF cl_auth_chk_act("open_pre") THEN
               
               #add-point:ON ACTION open_pre name="menu.open_pre"
               #20150104 add by chenying
               IF NOT cl_null(g_fabg_m.fabgdocno) AND g_fabg_m.fabgstus = 'N' THEN
                  #获取单别
                  CALL s_aooi200_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_slip

                  #是否抛傳票
                  #161215-00044#1---modify----begin-----------------
                  #SELECT * INTO g_glaa.* 
                  SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                         glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                         glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                         glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                         glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                         glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
                  #161215-00044#1---modify----end-----------------
                  FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld  
                  CALL s_fin_get_doc_para(g_fabg_m.fabgld,g_fabg_m.fabgcomp,l_slip,'D-FIN-0030') RETURNING l_ooac004

                  IF l_ooac004 = 'N' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_slip
                     LET g_errparam.code   = 'axr-00225'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()

                     EXIT DIALOG
                  END IF

                  CALL s_transaction_begin()
                  CALL s_pre_voucher_ins('FA','F40',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'4')
                     RETURNING l_success
                  IF l_success THEN
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                  END IF
               END IF               
               #20150104 add by chenying
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION set_back
            LET g_action_choice="set_back"
            IF cl_auth_chk_act("set_back") THEN
               
               #add-point:ON ACTION set_back name="menu.set_back"
               #160616-00005#3--add--str--
               IF NOT cl_null(g_fabg_m.fabgld) AND NOT cl_null(g_fabg_m.fabgdocno) THEN
                  SELECT fabgdocdt,fabg011 INTO g_fabg_m.fabgdocdt,g_fabg_m.fabg011 FROM fabg_t
                   WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
                     AND fabgdocno = g_fabg_m.fabgdocno
                  #存在应收账款资料
                  IF NOT cl_null(g_fabg_m.fabg011) THEN
                     #单据日期大于关账日期
                     IF s_afa_date_chk(g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN 
               #160616-00005#3--add--end                     
                        IF cl_ask_confirm('afa-00243') THEN
                           #20150130 mod by chenying
                           #CALL afat504_set_back()
                           CALL s_transaction_begin()
                           CALL cl_err_collect_init()  
                           LET g_success = TRUE
                           LET l_success = TRUE    
#160616-00005#3--mark--str--                  
#                           LET l_xrcadocdt = NULL
#                           SELECT xrcadocdt INTO l_xrcadocdt FROM xrca_t 
#                            WHERE xrcaent = g_enterprise AND xrcald = g_fabg_m.fabgld
#                              AND xrcadocno = g_fabg_m.fabg011
#160616-00005#3--mark--end                     
                           CALL afat504_set_back() RETURNING l_success  
                           IF l_success = FALSE THEN
                              LET g_success = FALSE
                           END IF
#160616-00005#3--mark--str--                        
#                           LET g_prog = 'axrt330'
#                        
#                           CALL s_aooi200_fin_del_docno(g_fabg_m.fabgld,g_fabg_m.fabg011,l_xrcadocdt) RETURNING l_success
#                           IF l_success = FALSE THEN   
#                              LET g_success = FALSE  
#                           END IF      
#                           LET g_prog  = 'afat504' 
#160616-00005#3--mark--end
                           IF g_success = TRUE THEN              
                              CALL cl_err_collect_init() 
                              CALL s_transaction_end('Y','0')         #171006-00010#13   add
                              CALL cl_err_collect_show()
                              #CALL s_transaction_end('Y','0')        #171006-00010#13   mask 
                           ELSE
                              CALL s_transaction_end('N','0')         #171006-00010#13   add
                              CALL cl_err_collect_show()
                              #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                           END IF                  
                        END IF
                     END IF #160616-00005#3 add
                  END IF #160616-00005#3 add
                  SELECT fabg011 INTO g_fabg_m.fabg011 FROM fabg_t
                   WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
                     AND fabgdocno = g_fabg_m.fabgdocno                 
                  DISPLAY g_fabg_m.fabg011 TO fabg011               
                  #20141223 add  by chenying
                  IF g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S' THEN 
                     IF cl_null(g_fabg_m.fabg011) THEN 
                        CALL cl_set_act_visible("open_afap270",TRUE) 
                     ELSE
                        CALL cl_set_act_visible("open_afap270",FALSE) 
                     END IF
                  END IF 
               END IF  #160616-00005#3 add                  
               #20141223 add  by chenying               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL afat504_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL afat504_insert()
               #add-point:ON ACTION insert name="menu.insert"
               #add 151125-00006#2 --s
               LET l_cn = 0 
               SELECT COUNT(1) INTO l_cn FROM fabg_t #160905-00007#2 count(*) --> count(1)
               WHERE fabgld  = g_fabg_m.fabgld  AND fabgdocno = g_fabg_m.fabgdocno AND fabgent = g_enterprise
               IF l_cn > 0 AND NOT cl_null (g_current_idx) THEN
                  CALL afat504_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afat440_01
            LET g_action_choice="open_afat440_01"
            IF cl_auth_chk_act("open_afat440_01") THEN
               
               #add-point:ON ACTION open_afat440_01 name="menu.open_afat440_01"
               IF l_ac>0 THEN
                  CALL afat440_01('',g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,
                                  g_fabo_d[l_ac].fabo003,g_fabg_m.fabg005,g_fabg_m.fabgdocno,
                                  g_fabo_d[l_ac].fabo007)
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afat504_02
            LET g_action_choice="open_afat504_02"
            IF cl_auth_chk_act("open_afat504_02") THEN
               
               #add-point:ON ACTION open_afat504_02 name="menu.open_afat504_02"
#               IF NOT cl_null(g_fabg_m.fabgdocno) AND l_ac>0 THEN 
#                  CALL afat504_02(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].faboseq)
#               END IF
              CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_ooba002
#              CALL cl_get_doc_para(g_enterprise,g_fabg_m.fabgdocno,l_ooba002,'D-FIN-0030') RETURNING l_str1 #20141224 mark by chenying
              CALL s_fin_get_doc_para(g_fabg_m.fabgld,'',l_ooba002,'D-FIN-0030') RETURNING l_str1  #20141224 add by chenying
              IF cl_null(l_str1) THEN LET l_str1 = 'Y' END IF
              IF l_str1 = 'Y' THEN 
                 #20150104 add by chenying
                 IF g_glaa.glaa121 = 'Y' THEN
                    CALL s_pre_voucher('FA','F40',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt)
                 ELSE
                 #20150104 add by chenying  
#                    CALL afap280_01_cre_fa_tmp_table() RETURNING l_success #20151223 add by 06421  #160405-00007#1 mark
                    CALL s_transaction_begin()           #20151223 add by 06421 
                    #161229-00032#1--add--str--lujh
                    CALL cl_err_collect_init()      
                    LET l_wc = " fabgdocno = '",g_fabg_m.fabgdocno,"'"
                    #161229-00032#1--add--end--lujh              
                    CALL afap280_01_gen_ar('4',g_fabg_m.fabgld,'',' ','1',l_wc,'Y','afat504') RETURNING l_success    #161229-00032#1 change '' to l_wc lujh
                    IF l_success THEN
                       CALL s_transaction_end('Y','0')
                    ELSE
                       CALL s_transaction_end('N','0')
                    END IF
                    CALL cl_err_collect_show()     #161229-00032#1 add lujh
                    CALL axrt300_13('FA',g_fabg_m.fabgld,g_fabg_m.fabgdocno,'')
                 END IF #20150104 add by chenying   
              #180920-00029#3 add_S
              ELSE
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = l_ooba002
                 LET g_errparam.code   = 'axr-00225'
                 LET g_errparam.popup  = TRUE
                 CALL cl_err()            
              #180920-00029#3 add_E                  
               END IF
               
               LET g_action_choice=''
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afat504_s01
            LET g_action_choice="open_afat504_s01"
            IF cl_auth_chk_act("open_afat504_s01") THEN
               
               #add-point:ON ACTION open_afat504_s01 name="menu.open_afat504_s01"
               CALL afat504_open_afat504_s01()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               #151210-00006#1---add----str--
#181102-00020#4  mark_S By 11384               
#               LET g_rep_wc = " fabgsite ='"||g_fabg_m.fabgsite||"' AND fabg005 = '"||
#                              g_fabg_m.fabg005||"' AND fabgstus = '"||g_fabg_m.fabgstus||"' AND fabgld = '"||g_fabg_m.fabgld||
#                              "' AND fabgdocno = '"||g_fabg_m.fabgdocno||"'"
#181102-00020#4  mark_D By 11384
#181102-00020#4  mod_S By 11384
               LET g_rep_wc = " fabgsite ='",g_fabg_m.fabgsite,"' AND fabg005 = '",
                              g_fabg_m.fabg005,"' AND fabgstus = '",g_fabg_m.fabgstus,"' AND fabgld = '",g_fabg_m.fabgld,
                              "' AND fabgdocno = '",g_fabg_m.fabgdocno,"'"
#181102-00020#4  mod_D By 11384
               #151210-00006#1---add----end--
               #END add-point
               &include "erp/afa/afat504_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
#151210-00006#1---mark----str--
#               #151022-00001#1---add---str
#               LET l_wc = " fabgdocno = '",g_fabg_m.fabgdocno,"'"
#               CALL afar500_g05(l_wc,g_fabg_m.fabgsite,g_fabg_m.fabg005,g_fabg_m.fabgstus,g_fabg_m.fabgld)
#               #151022-00001#1---add---end
#151210-00006#1---mark----end--
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               #151210-00006#1---add----str--
#181102-00020#4  mark_S By 11384               
#               LET g_rep_wc = " fabgsite ='"||g_fabg_m.fabgsite||"' AND fabg005 = '"||
#                              g_fabg_m.fabg005||"' AND fabgstus = '"||g_fabg_m.fabgstus||"' AND fabgld = '"||g_fabg_m.fabgld||
#                              "' AND fabgdocno = '"||g_fabg_m.fabgdocno||"'"
#181102-00020#4  mark_D By 11384
#181102-00020#4  mod_S By 11384
               LET g_rep_wc = " fabgsite ='",g_fabg_m.fabgsite,"' AND fabg005 = '",
                              g_fabg_m.fabg005,"' AND fabgstus = '",g_fabg_m.fabgstus,"' AND fabgld = '",g_fabg_m.fabgld,
                              "' AND fabgdocno = '",g_fabg_m.fabgdocno,"'"
#181102-00020#4  mod_D By 11384
               #151210-00006#1---add----end--
               #END add-point
               &include "erp/afa/afat504_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL afat504_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               #add 151125-00006#2 --s
               LET l_cn = 0 
               SELECT COUNT(1) INTO l_cn FROM fabg_t #160905-00007#2 count(*) --> count(1)
               WHERE fabgld  = g_fabg_m.fabgld  AND fabgdocno = g_fabg_m.fabgdocno AND fabgent = g_enterprise
               IF l_cn > 0 AND NOT cl_null (g_current_idx) THEN
                  CALL afat504_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_detail_sum
            LET g_action_choice="update_detail_sum"
            IF cl_auth_chk_act("update_detail_sum") THEN
               
               #add-point:ON ACTION update_detail_sum name="menu.update_detail_sum"
               #170617-00439#1 add-s
               SELECT count(1) INTO l_cn FROM fabo_t 
                WHERE faboent=g_enterprise AND fabold =g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno               
               IF g_fabg_m.fabgstus='N' AND l_cn>0 THEN
                  #更新单身栏位值
                  LET g_success=TRUE
                  CALL afat504_update_detail_sum()
                  #重新产生分录
                  IF g_success=TRUE THEN
                    #获取单别
                    CALL s_aooi200_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_slip
                    CALL s_fin_get_doc_para(g_fabg_m.fabgld,g_fabg_m.fabgcomp,l_slip,'D-FIN-0030') RETURNING l_ooac004
                     IF l_ooac004 = 'N' THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = l_slip
                        LET g_errparam.code   = 'axr-00225'
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        EXIT DIALOG
                     END IF
                     
                     CALL s_transaction_begin()
                     CALL s_pre_voucher_ins('FA','F40',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'4')
                        RETURNING l_success
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                     
                  END IF
               END IF 
               #170617-00439#1 add-e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afap280
            LET g_action_choice="open_afap280"
            IF cl_auth_chk_act("open_afap280") THEN
               
               #add-point:ON ACTION open_afap280 name="menu.open_afap280"
               #150916--s
               CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING g_sub_success,l_ooba002
               CALL s_fin_get_doc_para(g_fabg_m.fabgld,'',l_ooba002,'D-FIN-0030') RETURNING l_str1  
               IF cl_null(l_str1) THEN LET l_str1 = 'Y' END IF    
               IF l_str1 = 'Y' THEN               
               #150916--e 
                  IF cl_null(g_fabg_m.fabg008) THEN           #180920-00029#3 add
#                    IF NOT  cl_null(g_fabg_m.fabgdocno) AND g_fabg_m.fabgstus='S' THEN #20141106
                     #20141106 add--str--
                     CALL s_afat503_afap280_chk(g_fabg_m.fabgdocno,g_fabg_m.fabg008,g_fabg_m.fabgstus) RETURNING l_success 
                     IF l_success = TRUE THEN 
                     #20141106 add--end--                  
                        LET la_param.prog = 'afap280'
                        LET la_param.param[1] = g_fabg_m.fabgld
                        LET la_param.param[2] = g_fabg_m.fabgdocno
                        LET la_param.param[3] = g_fabg_m.fabg005
                        #200506-00018#4 add(s)
                        CALL s_fin_get_doc_para(g_fabg_m.fabgld,'',l_ooba002,'D-FIN-2002') RETURNING l_glapdocno
                        IF NOT cl_null(l_glapdocno) THEN
                           LET la_param.param[4] = l_glapdocno
                           LET la_param.param[5] = 'Y'
                        END IF
                        #200506-00018#4 add(e)
                        LET ls_js = util.JSON.stringify(la_param)
                        CALL cl_cmdrun_wait(ls_js)
                        CURRENT WINDOW IS w_afat504
                        SELECT fabg008 INTO g_fabg_m.fabg008 FROM fabg_t
                         WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
                           AND fabgdocno = g_fabg_m.fabgdocno
                        DISPLAY BY NAME g_fabg_m.fabg008
                        CALL afat504_ui_headershow()   #20141106                                
                     END IF #20141106 
                  #180920-00029#3 add_S                     
                  ELSE
                     INITIALIZE la_param.* TO NULL
                     LET la_param.prog     = 'aglt310'
                     LET la_param.param[1] = g_fabg_m.fabgld  
                     LET la_param.param[2] = g_fabg_m.fabg008
                     
                     LET ls_js = util.JSON.stringify(la_param)
                     CALL cl_cmdrun_wait(ls_js)
                  END IF
                  #180920-00029#3 add_E
#20141106
#                 ELSE
#                    IF g_fabg_m.fabgstus<> 'S' THEN 
#                       INITIALIZE g_errparam TO NULL 
#                       LET g_errparam.extend = "" 
#                       LET g_errparam.code   = "ain-00227" 
#                       LET g_errparam.popup  = TRUE 
#                       CALL cl_err()
#                       
#                    END IF
#                 END IF
#20141106               
               #150916--s
               ELSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_slip
                  LET g_errparam.code   = 'axr-00225'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()          
               END IF  
               #150916--e      
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afap290
            LET g_action_choice="open_afap290"
            IF cl_auth_chk_act("open_afap290") THEN
               
               #add-point:ON ACTION open_afap290 name="menu.open_afap290"
               #180920-00029#3  add_S
               IF cl_null(g_fabg_m.fabg008) THEN                
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'anm-00186'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF                
               #180920-00029#3  add_E               
#               IF NOT  cl_null(g_fabg_m.fabgdocno) AND g_fabg_m.fabgstus='S' THEN #20141106 mark
               #170315-00043#3   By 09263   add---s
               #傳票還原單據日期不可小於等於過帳日期     
               SELECT glapdocdt INTO l_glapdocdt
                 FROM glap_t
                WHERE glapent = g_enterprise
                  AND glapld = g_fabg_m.fabgld AND glapdocno = g_fabg_m.fabg008
                  
               SELECT glaa013 INTO l_glaa013
                 FROM glaa_t
                WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
               
               IF l_glapdocdt <= l_glaa013 THEN                
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'afm-00130'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF  
               #170315-00043#3   By 09263   add---e 
               #20141106 --add--str--
               CALL s_afat503_afap290_chk(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabg_m.fabg008) RETURNING l_success
               IF l_success = TRUE THEN 
               #20141106 --add--end--  
                  #add by geza 20170725 #170509-00070#4(S) 
                  IF NOT cl_ask_confirm('aap-00239') THEN
                     EXIT DIALOG
                  ELSE
                  #add by geza 20170725 #170509-00070#4(E) 
                     LET la_param.prog = 'afap290'
                     LET la_param.param[1] = g_fabg_m.fabgld
                     LET la_param.param[2] = g_fabg_m.fabgdocno
                     LET la_param.param[3] = g_fabg_m.fabg005
                     LET la_param.param[5] = 'Y'  #200506-00018#4 add
                     LET ls_js = util.JSON.stringify(la_param)
                     CALL cl_cmdrun_wait(ls_js)
                     CURRENT WINDOW IS w_afat504
                     SELECT fabg008 INTO g_fabg_m.fabg008 FROM fabg_t
                      WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
                        AND fabgdocno = g_fabg_m.fabgdocno
                     DISPLAY BY NAME g_fabg_m.fabg008
                     CALL afat504_ui_headershow()   #20141106 
                  END IF #add by geza 20170725 #170509-00070#4           
               END IF #20141106  
                           
#20141106 
#               ELSE 
#                  IF g_fabg_m.fabgstus<> 'S' THEN 
#                     INITIALIZE g_errparam TO NULL 
#                     LET g_errparam.extend = "" 
#                     LET g_errparam.code   = "ain-00227" 
#                     LET g_errparam.popup  = TRUE 
#                     CALL cl_err()
#                  END IF
#               END IF
#20141106
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL afat504_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
               CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afap270
            LET g_action_choice="open_afap270"
            IF cl_auth_chk_act("open_afap270") THEN
               
               #add-point:ON ACTION open_afap270 name="menu.open_afap270"
#20141120 mark--str--by chenying
#调拨规格在调整，此处先mark
#               #20141111 add--str--
#               #来源单号不为空，则不可生成账款
#               LET l_fabg019 = NULL
#               SELECT fabg019 INTO l_fabg019 FROM fabg_t 
#                WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld AND fabgdocno = g_fabg_m.fabgdocno
#               IF NOT cl_null(l_fabg019) THEN
#                  CALL cl_set_act_visible("open_afap270",FALSE) 
#               ELSE
#                  CALL cl_set_act_visible("open_afap270",TRUE) 
#               #20141111 add--end--
#20141120 mark--end--

#20141120 mod--str---by chenying
#                  IF NOT  cl_null(g_fabg_m.fabgdocno) AND g_fabg_m.fabgstus='Y' THEN 
#                     LET la_param.prog = 'afap270'
#                     LET la_param.param[1] = g_fabg_m.fabgld
#                     LET la_param.param[2] = g_fabg_m.fabgdocno
#                     LET la_param.param[3] = g_fabg_m.fabg005
#                     LET ls_js = util.JSON.stringify(la_param)
#                     CALL cl_cmdrun_wait(ls_js)
#                    #CURRENT WINDOW IS w_afat504
#                     SELECT fabg011 INTO g_fabg_m.fabg011 FROM fabg_t
#                      WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
#                        AND fabgdocno = g_fabg_m.fabgdocno
#                     DISPLAY BY NAME g_fabg_m.fabg011
#                  ELSE 
#                     #应收账款为空时，不控管状态
#                     IF g_fabg_m.fabgstus<> 'Y'  THEN 
#                        INITIALIZE g_errparam TO NULL 
#                        LET g_errparam.extend = "" 
#                        LET g_errparam.code   = "afa-00265" 
#                        LET g_errparam.popup  = TRUE 
#                        CALL cl_err()
#                     END IF
#                  END IF
#               END IF #20141111 add   #20141120 mark
               #现行日期与关账日期检查
               IF s_afat503_sys_chk(g_fabg_m.fabgld,g_fabg_m.fabgsite,g_fabg_m.fabgdocdt) THEN
                 CALL cl_set_act_visible("open_afap270",TRUE)
                 #调整状态为S时，应收账款为空，也可生成账款 
                 IF cl_null(g_fabg_m.fabg011) AND (g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S') THEN 
                    CALL cl_set_act_visible("open_afap270",TRUE) 
                    LET la_param.prog = 'afap270'
                    LET la_param.param[1] = g_fabg_m.fabgld
                    LET la_param.param[2] = g_fabg_m.fabgdocno
                    LET la_param.param[3] = g_fabg_m.fabg005
                    #161228-00013#1--add--s--
                    LET la_param.param[5] = "T"
                    #161228-00013#1--add--e--
                    LET ls_js = util.JSON.stringify(la_param)
                    CALL cl_cmdrun_wait(ls_js)
                   #CURRENT WINDOW IS w_afat504
                    SELECT fabg011 INTO g_fabg_m.fabg011 FROM fabg_t
                     WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
                       AND fabgdocno = g_fabg_m.fabgdocno
                    DISPLAY BY NAME g_fabg_m.fabg011
                 ELSE 
                    #单据状态为N，不可生成账款
                    IF g_fabg_m.fabgstus = 'N'  THEN 
                       INITIALIZE g_errparam TO NULL 
                       LET g_errparam.extend = "" 
                       LET g_errparam.code   = "afa-00265" 
                       LET g_errparam.popup  = TRUE 
                       CALL cl_err()
                    END IF               
                 END IF
                 IF NOT cl_null(g_fabg_m.fabg011) AND (g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S') THEN 
                    CALL cl_set_act_visible("open_afap270",FALSE) 
                 END IF
            END IF     
#20141120 --mod--end--
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afat502_03
            LET g_action_choice="open_afat502_03"
            IF cl_auth_chk_act("open_afat502_03") THEN
               
               #add-point:ON ACTION open_afat502_03 name="menu.open_afat502_03"
               IF NOT cl_null(g_fabg_m.fabgdocno) THEN
                  LET l_n = 0
                  SELECT COUNT(1) INTO l_n FROM fabo_t  #160905-00007#2 count(*) --> count(1)
                   WHERE faboent = g_enterprise AND fabodocno = g_fabg_m.fabgdocno AND fabold = g_fabg_m.fabgld
                   IF l_n = 0 THEN
                      CALL afat502_03(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabg_m.fabg005)
                      CALL afat504_b_fill() 
                      CALL afat504_show()
                   END IF
               END IF    
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_fabg001
            LET g_action_choice="prog_fabg001"
            IF cl_auth_chk_act("prog_fabg001") THEN
               
               #add-point:ON ACTION prog_fabg001 name="menu.prog_fabg001"
               #應用 a41 樣板自動產生(Version:2)
               #使用JSON格式組合參數與作業編號(串查)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_fabg_m.fabg001)


               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_fabg002
            LET g_action_choice="prog_fabg002"
            IF cl_auth_chk_act("prog_fabg002") THEN
               
               #add-point:ON ACTION prog_fabg002 name="menu.prog_fabg002"
               #應用 a41 樣板自動產生(Version:2)
               #使用JSON格式組合參數與作業編號(串查)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_fabg_m.fabg002)
 


               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_fabg008
            LET g_action_choice="prog_fabg008"
            IF cl_auth_chk_act("prog_fabg008") THEN
               
               #add-point:ON ACTION prog_fabg008 name="menu.prog_fabg008"
               #應用 a41 樣板自動產生(Version:2)
               #使用JSON格式組合參數與作業編號(串查)
               IF NOT cl_null(g_fabg_m.fabg008) THEN
                  INITIALIZE la_param.* TO NULL
                  LET la_param.prog     = 'aglt310'
                  LET la_param.param[1] = g_fabg_m.fabgld  #150727-00004#1 add
                  LET la_param.param[2] = g_fabg_m.fabg008 #150727-00004#1 mod
                  
                  LET ls_js = util.JSON.stringify(la_param)
                  CALL cl_cmdrun_wait(ls_js)
               END IF


               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_fabg011
            LET g_action_choice="prog_fabg011"
            IF cl_auth_chk_act("prog_fabg011") THEN
               
               #add-point:ON ACTION prog_fabg011 name="menu.prog_fabg011"
               #應用 a41 樣板自動產生(Version:3)
               #使用JSON格式組合參數與作業編號(串查)
               IF NOT cl_null(g_fabg_m.fabg011) THEN #180802-00035#1---add-
                  INITIALIZE la_param.* TO NULL
                  LET la_param.prog     = 'axrt330'
                  LET la_param.param[1] = g_fabg_m.fabgld   #170620-00072#1 add     #200414-00077#1  mark #210531-00045#1 remark
                  LET la_param.param[2] = g_fabg_m.fabg011  #170620-00072#1 add     #200414-00077#1  mark #210531-00045#1 remark
                  #LET la_param.param[4] = g_fabg_m.fabgld        #200414-00077#1   add #210531-00045#1 mark
                  #LET la_param.param[5] = g_fabg_m.fabg011       #200414-00077#1   add #210531-00045#1 mark
                  LET ls_js = util.JSON.stringify(la_param)
                  CALL cl_cmdrun_wait(ls_js)
               END IF #180802-00035#1---add-



               #END add-point
               
            END IF
 
 
 
 
 
            #180611-00048
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL afat504_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL afat504_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL afat504_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_fabg_m.fabgdocdt)
 
 
 
         
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
 
{<section id="afat504.browser_fill" type="s" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION afat504_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_ld_str          STRING #160125-00005#7
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
   LET l_wc=l_wc," AND fabg005='4' "
   #20141112--add--str--
   IF NOT cl_null(g_wc_fabg019) THEN 
       LET l_wc=l_wc," AND ",g_wc_fabg019 CLIPPED
       LET g_wc_fabg019 = ''
   END IF
   #20141112--add--end--
   #160125-00005#7--add--str--
   #账套范围
   CALL s_axrt300_get_site(g_user,'','2')  RETURNING g_wc_cs_ld 
   IF NOT cl_null(g_wc_cs_ld) THEN   
      LET l_ld_str = cl_replace_str(g_wc_cs_ld,"glaald","fabgld")
      LET l_wc = l_wc , " AND ",l_ld_str
   END IF
   #160125-00005#7--add--end
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT fabgld,fabgdocno ",
                      " FROM fabg_t ",
                      " ",
                      " LEFT JOIN fabo_t ON faboent = fabgent AND fabgld = fabold AND fabgdocno = fabodocno ", "  ",
                      #add-point:browser_fill段sql(fabo_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN xrcd_t ON xrcdent = fabgent AND fabgld = xrcdld AND fabgdocno = xrcddocno", "  ",
                      #add-point:browser_fill段sql(xrcd_t1) name="browser_fill.cnt.join.xrcd_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE fabgent = " ||g_enterprise|| " AND faboent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("fabg_t") 
                      ," AND ", g_wc2_extend #190730-00003#4 add
 
  ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT fabgld,fabgdocno ",
                      " FROM fabg_t ", 
                      "  ",
                      "  ",
                      " WHERE fabgent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("fabg_t")
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
      INITIALIZE g_fabg_m.* TO NULL
      CALL g_fabo_d.clear()        
      CALL g_fabo3_d.clear() 
      CALL g_fabo4_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.fabgld,t0.fabgdocno Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.fabgstus,t0.fabgld,t0.fabgdocno ",
                    " FROM fabg_t t0",
                  "  ",
                  "  LEFT JOIN fabo_t ON faboent = fabgent AND fabgld = fabold AND fabgdocno = fabodocno ", "  ", 
                  #add-point:browser_fill段sql(fabo_t1) name="browser_fill.join.fabo_t1"
                  
                  #end add-point
                  "  LEFT JOIN xrcd_t ON xrcdent = fabgent AND fabgld = xrcdld AND fabgdocno = xrcddocno", "  ", 
                  #add-point:browser_fill段sql(xrcd_t1) name="browser_fill.join.xrcd_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                  
                  " WHERE t0.fabgent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("fabg_t")
                  ," AND ",g_wc2_extend #190730-00003#4 add 
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.fabgstus,t0.fabgld,t0.fabgdocno ",
                  " FROM fabg_t t0",
                  "  ",
                  
                  " WHERE t0.fabgent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("fabg_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   #161017-00023#1--add--str--lujh
   IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
      LET g_sql = g_sql," AND EXISTS (SELECT 1 FROM pmaa_t ",
                        "              WHERE pmaaent = ",g_enterprise,
                        "                AND ",g_sql_ctrl,
                        "                AND pmaaent = fabgent ",
                        "                AND pmaa001 = fabg006 )"
   END IF
   #161017-00023#1--add--end--lujh
   #end add-point
   LET g_sql = g_sql," ORDER BY fabgld,fabgdocno ",g_order       #200917-00047 mark   #201005-00006 remark
#  LET g_sql = " SELECT * FROM (",g_sql,") t01_eff ORDER BY fabgld,fabgdocno ",g_order   #200917-00047   #201005-00006 mark
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"fabg_t") #WC重組
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
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_fabgld,g_browser[g_cnt].b_fabgdocno
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
      
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_fabgld) THEN
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
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.ui_headershow" type="s" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION afat504_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
 
   IF g_browser.getLength() > 0 AND g_current_idx > 0 THEN   #200828-00027檢查後進入,避免資料溢位 (代追單)
      LET g_fabg_m.fabgld = g_browser[g_current_idx].b_fabgld   
      LET g_fabg_m.fabgdocno = g_browser[g_current_idx].b_fabgdocno   
 
      EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
          g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt, 
          g_fabg_m.fabgpstid,g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
          g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
      
      CALL afat504_fabg_t_mask()
      CALL afat504_show()
   END IF   #200828-00027
      
END FUNCTION
 
{</section>}
 
{<section id="afat504.ui_detailshow" type="s" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION afat504_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail4",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail1_afat504_01",g_detail_idx)       
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail4",g_detail_idx)
 
   END IF
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.ui_browser_refresh" type="s" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION afat504_ui_browser_refresh()
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
      IF g_browser[l_i].b_fabgld = g_fabg_m.fabgld 
         AND g_browser[l_i].b_fabgdocno = g_fabg_m.fabgdocno 
 
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
 
{<section id="afat504.construct" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION afat504_construct()
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
   DEFINE l_comp_str  STRING  #161111-00049#12 add 
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_fabg_m.* TO NULL
   CALL g_fabo_d.clear()        
   CALL g_fabo3_d.clear() 
   CALL g_fabo4_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   LET g_site_str = NULL #160125-00005#7
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON fabgsite,fabg001,fabgld,fabgcomp,fabg002,fabg003,fabg004,fabg005,fabgdocno,fabgdocdt,fabg006,fabg007,fabg021,fabg013,fabg014,fabg015,fabg016,fabg008,fabg011,fabgstus,fabgownid,fabgowndp,fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,fabgpstdt 
 
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<fabgcrtdt>>----
         AFTER FIELD fabgcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<fabgmoddt>>----
         AFTER FIELD fabgmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<fabgcnfdt>>----
         AFTER FIELD fabgcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<fabgpstdt>>----
         AFTER FIELD fabgpstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.fabgsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgsite
            #add-point:ON ACTION controlp INFIELD fabgsite name="construct.c.fabgsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef207 = 'Y' "
            #CALL q_ooef001()                           #呼叫開窗        #161024-00008#4 
            CALL q_ooef001_47()                                         #161024-00008#4 
            DISPLAY g_qryparam.return1 TO fabgsite  #顯示到畫面上
            NEXT FIELD fabgsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgsite
            #add-point:BEFORE FIELD fabgsite name="construct.b.fabgsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgsite
            
            #add-point:AFTER FIELD fabgsite name="construct.a.fabgsite"
            CALL FGL_DIALOG_GETBUFFER() RETURNING g_site_str #160125-00005#7
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabg001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg001
            #add-point:ON ACTION controlp INFIELD fabg001 name="construct.c.fabg001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #170606-00033#8 add-s
            LET g_qryparam.where = "(ooag004 IN (SELECT ooef001 FROM ooef_t 
                                                  WHERE ooefent=",g_enterprise, 
                                                  " AND ooef017 IN (SELECT ooef017 FROM ooef_t 
                                                                     WHERE ooefent=",g_enterprise, 
                                                                     " AND ooef001='",g_site,"')
                                                    AND ooef201='Y'
                                                 )
                                     OR ooag004='ALL' )"
                                                
            #170606-00033#8 add-e
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg001  #顯示到畫面上
            NEXT FIELD fabg001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg001
            #add-point:BEFORE FIELD fabg001 name="construct.b.fabg001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg001
            
            #add-point:AFTER FIELD fabg001 name="construct.a.fabg001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabgld
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgld
            #add-point:ON ACTION controlp INFIELD fabgld name="construct.c.fabgld"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #160125-00005#7--add--str--
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept
            #账套范围
            CALL s_axrt300_get_site(g_user,g_site_str,'2')  RETURNING g_wc_cs_ld 
            IF NOT cl_null(g_wc_cs_ld) THEN   
               LET g_qryparam.where = g_wc_cs_ld
            END IF
            #160125-00005#7--add--end
            CALL q_authorised_ld()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgld  #顯示到畫面上
            NEXT FIELD fabgld                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgld
            #add-point:BEFORE FIELD fabgld name="construct.b.fabgld"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgld
            
            #add-point:AFTER FIELD fabgld name="construct.a.fabgld"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcomp
            #add-point:BEFORE FIELD fabgcomp name="construct.b.fabgcomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgcomp
            
            #add-point:AFTER FIELD fabgcomp name="construct.a.fabgcomp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabgcomp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgcomp
            #add-point:ON ACTION controlp INFIELD fabgcomp name="construct.c.fabgcomp"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg002
            #add-point:ON ACTION controlp INFIELD fabg002 name="construct.c.fabg002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg002  #顯示到畫面上
            NEXT FIELD fabg002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg002
            #add-point:BEFORE FIELD fabg002 name="construct.b.fabg002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg002
            
            #add-point:AFTER FIELD fabg002 name="construct.a.fabg002"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabg003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg003
            #add-point:ON ACTION controlp INFIELD fabg003 name="construct.c.fabg003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_9()                           #呼叫開窗  #161024-00008#6
            #CALL q_ooeg001_4()                                      #161024-00008#6        #170814-00012#35  170906 By 10044 mark
            CALL q_ooeg001()                                                                #170814-00012#35  170906 By 10044 add
            DISPLAY g_qryparam.return1 TO fabg003  #顯示到畫面上
            NEXT FIELD fabg003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg003
            #add-point:BEFORE FIELD fabg003 name="construct.b.fabg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg003
            
            #add-point:AFTER FIELD fabg003 name="construct.a.fabg003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg004
            #add-point:BEFORE FIELD fabg004 name="construct.b.fabg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg004
            
            #add-point:AFTER FIELD fabg004 name="construct.a.fabg004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabg004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg004
            #add-point:ON ACTION controlp INFIELD fabg004 name="construct.c.fabg004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg005
            #add-point:BEFORE FIELD fabg005 name="construct.b.fabg005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg005
            
            #add-point:AFTER FIELD fabg005 name="construct.a.fabg005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabg005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg005
            #add-point:ON ACTION controlp INFIELD fabg005 name="construct.c.fabg005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabgdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgdocno
            #add-point:ON ACTION controlp INFIELD fabgdocno name="construct.c.fabgdocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " fabg005='4' "
            #161017-00023#1--add--str--lujh
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND EXISTS (SELECT 1 FROM pmaa_t ",
                                                       "              WHERE pmaaent = ",g_enterprise,
                                                       "                AND ",g_sql_ctrl,
                                                       "                AND pmaaent = fabgent ",
                                                       "                AND pmaa001 = fabg004 )"
            END IF
            #161017-00023#1--add--end--lujh
            #161104-00046#22 add ------
            #單別權限控管
            #201230-00067#12    14740  mark --s
            #IF NOT cl_null(g_user_dept_wc_q) AND NOT g_user_dept_wc_q = ' 1=1'  THEN
            #   LET g_qryparam.where = g_qryparam.where," AND ",g_user_dept_wc_q CLIPPED
            #END IF
            #201230-00067#12    14740  mark --e
            #161104-00046#22 add end---
            #161219-00009#3 add s---
            IF NOT cl_null(g_ld_str) AND NOT g_ld_str = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_ld_str CLIPPED 
            END IF
            #161219-00009#3 add e---               
            CALL q_fabgdocno()
            DISPLAY g_qryparam.return1 TO fabgdocno
            NEXT FIELD fabgdocno
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgdocno
            #add-point:BEFORE FIELD fabgdocno name="construct.b.fabgdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgdocno
            
            #add-point:AFTER FIELD fabgdocno name="construct.a.fabgdocno"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgdocdt
            #add-point:BEFORE FIELD fabgdocdt name="construct.b.fabgdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgdocdt
            
            #add-point:AFTER FIELD fabgdocdt name="construct.a.fabgdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabgdocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgdocdt
            #add-point:ON ACTION controlp INFIELD fabgdocdt name="construct.c.fabgdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabg006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg006
            #add-point:ON ACTION controlp INFIELD fabg006 name="construct.c.fabg006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161017-00023#1--add--str--lujh
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_sql_ctrl
            END IF
            #161017-00023#1--add--end--lujh
            
            # CALL q_pmaa001()   #160913-00017#1  mark                  #呼叫開窗
            #160913-00017#1--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#1--ADD(E)- 
            DISPLAY g_qryparam.return1 TO fabg006  #顯示到畫面上
            NEXT FIELD fabg006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg006
            #add-point:BEFORE FIELD fabg006 name="construct.b.fabg006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg006
            
            #add-point:AFTER FIELD fabg006 name="construct.a.fabg006"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabg007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg007
            #add-point:ON ACTION controlp INFIELD fabg007 name="construct.c.fabg007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161017-00023#1--add--str--lujh
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = pmacent ",
                                      "            AND pmaa001 = pmac002 )"
            END IF
            #161017-00023#1--add--end--lujh
            CALL q_pmac002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg007  #顯示到畫面上
            NEXT FIELD fabg007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg007
            #add-point:BEFORE FIELD fabg007 name="construct.b.fabg007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg007
            
            #add-point:AFTER FIELD fabg007 name="construct.a.fabg007"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg021
            #add-point:BEFORE FIELD fabg021 name="construct.b.fabg021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg021
            
            #add-point:AFTER FIELD fabg021 name="construct.a.fabg021"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabg021
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg021
            #add-point:ON ACTION controlp INFIELD fabg021 name="construct.c.fabg021"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabg013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg013
            #add-point:ON ACTION controlp INFIELD fabg013 name="construct.c.fabg013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_ooef019
            CALL q_oodb002_5()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg013  #顯示到畫面上
            NEXT FIELD fabg013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg013
            #add-point:BEFORE FIELD fabg013 name="construct.b.fabg013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg013
            
            #add-point:AFTER FIELD fabg013 name="construct.a.fabg013"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg014
            #add-point:BEFORE FIELD fabg014 name="construct.b.fabg014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg014
            
            #add-point:AFTER FIELD fabg014 name="construct.a.fabg014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabg014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg014
            #add-point:ON ACTION controlp INFIELD fabg014 name="construct.c.fabg014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabg015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg015
            #add-point:ON ACTION controlp INFIELD fabg015 name="construct.c.fabg015"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg015  #顯示到畫面上
            NEXT FIELD fabg015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg015
            #add-point:BEFORE FIELD fabg015 name="construct.b.fabg015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg015
            
            #add-point:AFTER FIELD fabg015 name="construct.a.fabg015"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg016
            #add-point:BEFORE FIELD fabg016 name="construct.b.fabg016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg016
            
            #add-point:AFTER FIELD fabg016 name="construct.a.fabg016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabg016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg016
            #add-point:ON ACTION controlp INFIELD fabg016 name="construct.c.fabg016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabg008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg008
            #add-point:ON ACTION controlp INFIELD fabg008 name="construct.c.fabg008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161219-00009#3 add s---
            IF NOT cl_null(g_ld_str) AND NOT g_ld_str = ' 1=1'  THEN
               LET g_qryparam.where = g_ld_str 
            END IF
            #161219-00009#3 add e---              
            CALL q_fabg008()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg008  #顯示到畫面上
            NEXT FIELD fabg008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg008
            #add-point:BEFORE FIELD fabg008 name="construct.b.fabg008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg008
            
            #add-point:AFTER FIELD fabg008 name="construct.a.fabg008"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg011
            #add-point:BEFORE FIELD fabg011 name="construct.b.fabg011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg011
            
            #add-point:AFTER FIELD fabg011 name="construct.a.fabg011"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabg011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg011
            #add-point:ON ACTION controlp INFIELD fabg011 name="construct.c.fabg011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgstus
            #add-point:BEFORE FIELD fabgstus name="construct.b.fabgstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgstus
            
            #add-point:AFTER FIELD fabgstus name="construct.a.fabgstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.fabgstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgstus
            #add-point:ON ACTION controlp INFIELD fabgstus name="construct.c.fabgstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabgownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgownid
            #add-point:ON ACTION controlp INFIELD fabgownid name="construct.c.fabgownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgownid  #顯示到畫面上
            NEXT FIELD fabgownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgownid
            #add-point:BEFORE FIELD fabgownid name="construct.b.fabgownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgownid
            
            #add-point:AFTER FIELD fabgownid name="construct.a.fabgownid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabgowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgowndp
            #add-point:ON ACTION controlp INFIELD fabgowndp name="construct.c.fabgowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgowndp  #顯示到畫面上
            NEXT FIELD fabgowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgowndp
            #add-point:BEFORE FIELD fabgowndp name="construct.b.fabgowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgowndp
            
            #add-point:AFTER FIELD fabgowndp name="construct.a.fabgowndp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabgcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgcrtid
            #add-point:ON ACTION controlp INFIELD fabgcrtid name="construct.c.fabgcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgcrtid  #顯示到畫面上
            NEXT FIELD fabgcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcrtid
            #add-point:BEFORE FIELD fabgcrtid name="construct.b.fabgcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgcrtid
            
            #add-point:AFTER FIELD fabgcrtid name="construct.a.fabgcrtid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.fabgcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgcrtdp
            #add-point:ON ACTION controlp INFIELD fabgcrtdp name="construct.c.fabgcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgcrtdp  #顯示到畫面上
            NEXT FIELD fabgcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcrtdp
            #add-point:BEFORE FIELD fabgcrtdp name="construct.b.fabgcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgcrtdp
            
            #add-point:AFTER FIELD fabgcrtdp name="construct.a.fabgcrtdp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcrtdt
            #add-point:BEFORE FIELD fabgcrtdt name="construct.b.fabgcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabgmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgmodid
            #add-point:ON ACTION controlp INFIELD fabgmodid name="construct.c.fabgmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgmodid  #顯示到畫面上
            NEXT FIELD fabgmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgmodid
            #add-point:BEFORE FIELD fabgmodid name="construct.b.fabgmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgmodid
            
            #add-point:AFTER FIELD fabgmodid name="construct.a.fabgmodid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgmoddt
            #add-point:BEFORE FIELD fabgmoddt name="construct.b.fabgmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabgcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgcnfid
            #add-point:ON ACTION controlp INFIELD fabgcnfid name="construct.c.fabgcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgcnfid  #顯示到畫面上
            NEXT FIELD fabgcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcnfid
            #add-point:BEFORE FIELD fabgcnfid name="construct.b.fabgcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgcnfid
            
            #add-point:AFTER FIELD fabgcnfid name="construct.a.fabgcnfid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcnfdt
            #add-point:BEFORE FIELD fabgcnfdt name="construct.b.fabgcnfdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.fabgpstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgpstid
            #add-point:ON ACTION controlp INFIELD fabgpstid name="construct.c.fabgpstid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabgpstid  #顯示到畫面上
            NEXT FIELD fabgpstid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgpstid
            #add-point:BEFORE FIELD fabgpstid name="construct.b.fabgpstid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgpstid
            
            #add-point:AFTER FIELD fabgpstid name="construct.a.fabgpstid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgpstdt
            #add-point:BEFORE FIELD fabgpstdt name="construct.b.fabgpstdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON faboseq,fabo001,fabo002,fabo003,faah013,faah014,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035, 
          fabo036,fabo037,fabo0554,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,faboseq_3,faaj103,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,faaj153,fabo156,fabo150, 
          fabo151,fabo152,fabo153,fabo154,fabo155,fabo157,fabo158,fabo159,fabo160,fabo161
           FROM s_detail1[1].faboseq,s_detail1[1].fabo001,s_detail1[1].fabo002,s_detail1[1].fabo003,s_detail1[1].faah013,s_detail1[1].faah014,s_detail1[1].fabo000,s_detail1[1].fabo008,s_detail1[1].fabo053,s_detail1[1].fabo009,s_detail1[1].fabo005,s_detail1[1].fabo007,s_detail1[1].fabo006,s_detail1[1].fabo010, 
               s_detail1[1].fabo011,s_detail1[1].fabo012,s_detail1[1].fabo013,s_detail1[1].fabo014,s_detail1[1].fabo015,s_detail1[1].fabo016,s_detail1[1].fabo017,s_detail1[1].fabo020,s_detail1[1].fabo018,s_detail1[1].fabo019,s_detail1[1].fabo021,s_detail1[1].fabo022,s_detail1[1].fabo049,s_detail1[1].fabo025, 
               s_detail1[1].fabo023,s_detail1[1].fabo031,s_detail1[1].fabo032,s_detail1[1].fabo033,s_detail1[1].fabo034,s_detail1[1].fabo035,s_detail1[1].fabo036,s_detail1[1].fabo037,s_detail1[1].fabo0554,s_detail1[1].fabo055,s_detail1[1].fabo056,s_detail1[1].fabo038,s_detail1[1].fabo039,s_detail1[1].fabo040, 
               s_detail1[1].fabo057,s_detail1[1].fabo060,s_detail1[1].fabo061,s_detail1[1].fabo062,s_detail1[1].fabo063,s_detail1[1].fabo064,s_detail1[1].fabo065,s_detail1[1].fabo066,s_detail1[1].fabo067,s_detail1[1].fabo068,s_detail1[1].fabo069,s_detail4[1].faboseq_3,s_detail4[1].faaj103,s_detail4[1].fabo107, 
               s_detail4[1].fabo101,s_detail4[1].fabo102,s_detail4[1].fabo103,s_detail4[1].fabo104,s_detail4[1].fabo105,s_detail4[1].fabo106,s_detail4[1].fabo108,s_detail4[1].fabo109,s_detail4[1].fabo110,s_detail4[1].fabo111,s_detail4[1].fabo112,s_detail4[1].faaj153,s_detail4[1].fabo156,s_detail4[1].fabo150, 
               s_detail4[1].fabo151,s_detail4[1].fabo152,s_detail4[1].fabo153,s_detail4[1].fabo154,s_detail4[1].fabo155,s_detail4[1].fabo157,s_detail4[1].fabo158,s_detail4[1].fabo159,s_detail4[1].fabo160,s_detail4[1].fabo161
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faboseq
            #add-point:BEFORE FIELD faboseq name="construct.b.page1.faboseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faboseq
            
            #add-point:AFTER FIELD faboseq name="construct.a.page1.faboseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.faboseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faboseq
            #add-point:ON ACTION controlp INFIELD faboseq name="construct.c.page1.faboseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.fabo001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo001
            #add-point:ON ACTION controlp INFIELD fabo001 name="construct.c.page1.fabo001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161111-00049#12 add s---
			   CALL s_axrt300_get_site(g_user,'','3') RETURNING l_comp_str 
			   LET l_comp_str = cl_replace_str(l_comp_str ,"ooef017","faah032")
			   LET g_qryparam.where = " faah032 IN (SELECT ooef017 FROM ooef_t WHERE ooefent = ",g_enterprise," AND ooef001 = '",g_site,"') AND ",l_comp_str             
            #161111-00049#12 add e---                 
            CALL q_faah003_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo001  #顯示到畫面上
            NEXT FIELD fabo001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo001
            #add-point:BEFORE FIELD fabo001 name="construct.b.page1.fabo001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo001
            
            #add-point:AFTER FIELD fabo001 name="construct.a.page1.fabo001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo002
            #add-point:ON ACTION controlp INFIELD fabo002 name="construct.c.page1.fabo002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161111-00049#12 add s---
			   CALL s_axrt300_get_site(g_user,'','3') RETURNING l_comp_str 
			   LET l_comp_str = cl_replace_str(l_comp_str ,"ooef017","faah032")
			   LET g_qryparam.where = " faah032 IN (SELECT ooef017 FROM ooef_t WHERE ooefent = ",g_enterprise," AND ooef001 = '",g_site,"') AND ",l_comp_str             
            #161111-00049#12 add e---              
            CALL q_faah003_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo002  #顯示到畫面上
            NEXT FIELD fabo002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo002
            #add-point:BEFORE FIELD fabo002 name="construct.b.page1.fabo002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo002
            
            #add-point:AFTER FIELD fabo002 name="construct.a.page1.fabo002"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo003
            #add-point:ON ACTION controlp INFIELD fabo003 name="construct.c.page1.fabo003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161111-00049#12 add s---
			   CALL s_axrt300_get_site(g_user,'','3') RETURNING l_comp_str 
			   LET l_comp_str = cl_replace_str(l_comp_str ,"ooef017","faah032")
			   LET g_qryparam.where = " faah032 IN (SELECT ooef017 FROM ooef_t WHERE ooefent = ",g_enterprise," AND ooef001 = '",g_site,"') AND ",l_comp_str             
            #161111-00049#12 add e---              
            CALL q_faah003_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo003  #顯示到畫面上
            NEXT FIELD fabo003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo003
            #add-point:BEFORE FIELD fabo003 name="construct.b.page1.fabo003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo003
            
            #add-point:AFTER FIELD fabo003 name="construct.a.page1.fabo003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah013
            #add-point:BEFORE FIELD faah013 name="construct.b.page1.faah013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faah013
            
            #add-point:AFTER FIELD faah013 name="construct.a.page1.faah013"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.faah013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faah013
            #add-point:ON ACTION controlp INFIELD faah013 name="construct.c.page1.faah013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah014
            #add-point:BEFORE FIELD faah014 name="construct.b.page1.faah014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faah014
            
            #add-point:AFTER FIELD faah014 name="construct.a.page1.faah014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.faah014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faah014
            #add-point:ON ACTION controlp INFIELD faah014 name="construct.c.page1.faah014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo000
            #add-point:BEFORE FIELD fabo000 name="construct.b.page1.fabo000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo000
            
            #add-point:AFTER FIELD fabo000 name="construct.a.page1.fabo000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo000
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo000
            #add-point:ON ACTION controlp INFIELD fabo000 name="construct.c.page1.fabo000"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo008
            #add-point:BEFORE FIELD fabo008 name="construct.b.page1.fabo008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo008
            
            #add-point:AFTER FIELD fabo008 name="construct.a.page1.fabo008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo008
            #add-point:ON ACTION controlp INFIELD fabo008 name="construct.c.page1.fabo008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo053
            #add-point:BEFORE FIELD fabo053 name="construct.b.page1.fabo053"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo053
            
            #add-point:AFTER FIELD fabo053 name="construct.a.page1.fabo053"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo053
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo053
            #add-point:ON ACTION controlp INFIELD fabo053 name="construct.c.page1.fabo053"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.fabo009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo009
            #add-point:ON ACTION controlp INFIELD fabo009 name="construct.c.page1.fabo009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_ooef019
            CALL q_oodb002_5()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo009  #顯示到畫面上
            NEXT FIELD fabo009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo009
            #add-point:BEFORE FIELD fabo009 name="construct.b.page1.fabo009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo009
            
            #add-point:AFTER FIELD fabo009 name="construct.a.page1.fabo009"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo005
            #add-point:BEFORE FIELD fabo005 name="construct.b.page1.fabo005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo005
            
            #add-point:AFTER FIELD fabo005 name="construct.a.page1.fabo005"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo005
            #add-point:ON ACTION controlp INFIELD fabo005 name="construct.c.page1.fabo005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo007
            #add-point:BEFORE FIELD fabo007 name="construct.b.page1.fabo007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo007
            
            #add-point:AFTER FIELD fabo007 name="construct.a.page1.fabo007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo007
            #add-point:ON ACTION controlp INFIELD fabo007 name="construct.c.page1.fabo007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo006
            #add-point:BEFORE FIELD fabo006 name="construct.b.page1.fabo006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo006
            
            #add-point:AFTER FIELD fabo006 name="construct.a.page1.fabo006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo006
            #add-point:ON ACTION controlp INFIELD fabo006 name="construct.c.page1.fabo006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.fabo010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo010
            #add-point:ON ACTION controlp INFIELD fabo010 name="construct.c.page1.fabo010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo010  #顯示到畫面上
            NEXT FIELD fabo010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo010
            #add-point:BEFORE FIELD fabo010 name="construct.b.page1.fabo010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo010
            
            #add-point:AFTER FIELD fabo010 name="construct.a.page1.fabo010"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo011
            #add-point:BEFORE FIELD fabo011 name="construct.b.page1.fabo011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo011
            
            #add-point:AFTER FIELD fabo011 name="construct.a.page1.fabo011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo011
            #add-point:ON ACTION controlp INFIELD fabo011 name="construct.c.page1.fabo011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo012
            #add-point:BEFORE FIELD fabo012 name="construct.b.page1.fabo012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo012
            
            #add-point:AFTER FIELD fabo012 name="construct.a.page1.fabo012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo012
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo012
            #add-point:ON ACTION controlp INFIELD fabo012 name="construct.c.page1.fabo012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo013
            #add-point:BEFORE FIELD fabo013 name="construct.b.page1.fabo013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo013
            
            #add-point:AFTER FIELD fabo013 name="construct.a.page1.fabo013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo013
            #add-point:ON ACTION controlp INFIELD fabo013 name="construct.c.page1.fabo013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo014
            #add-point:BEFORE FIELD fabo014 name="construct.b.page1.fabo014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo014
            
            #add-point:AFTER FIELD fabo014 name="construct.a.page1.fabo014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo014
            #add-point:ON ACTION controlp INFIELD fabo014 name="construct.c.page1.fabo014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo015
            #add-point:BEFORE FIELD fabo015 name="construct.b.page1.fabo015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo015
            
            #add-point:AFTER FIELD fabo015 name="construct.a.page1.fabo015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo015
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo015
            #add-point:ON ACTION controlp INFIELD fabo015 name="construct.c.page1.fabo015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo016
            #add-point:BEFORE FIELD fabo016 name="construct.b.page1.fabo016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo016
            
            #add-point:AFTER FIELD fabo016 name="construct.a.page1.fabo016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo016
            #add-point:ON ACTION controlp INFIELD fabo016 name="construct.c.page1.fabo016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo017
            #add-point:BEFORE FIELD fabo017 name="construct.b.page1.fabo017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo017
            
            #add-point:AFTER FIELD fabo017 name="construct.a.page1.fabo017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo017
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo017
            #add-point:ON ACTION controlp INFIELD fabo017 name="construct.c.page1.fabo017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo020
            #add-point:BEFORE FIELD fabo020 name="construct.b.page1.fabo020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo020
            
            #add-point:AFTER FIELD fabo020 name="construct.a.page1.fabo020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo020
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo020
            #add-point:ON ACTION controlp INFIELD fabo020 name="construct.c.page1.fabo020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo018
            #add-point:BEFORE FIELD fabo018 name="construct.b.page1.fabo018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo018
            
            #add-point:AFTER FIELD fabo018 name="construct.a.page1.fabo018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo018
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo018
            #add-point:ON ACTION controlp INFIELD fabo018 name="construct.c.page1.fabo018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo019
            #add-point:BEFORE FIELD fabo019 name="construct.b.page1.fabo019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo019
            
            #add-point:AFTER FIELD fabo019 name="construct.a.page1.fabo019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo019
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo019
            #add-point:ON ACTION controlp INFIELD fabo019 name="construct.c.page1.fabo019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo021
            #add-point:BEFORE FIELD fabo021 name="construct.b.page1.fabo021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo021
            
            #add-point:AFTER FIELD fabo021 name="construct.a.page1.fabo021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo021
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo021
            #add-point:ON ACTION controlp INFIELD fabo021 name="construct.c.page1.fabo021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo022
            #add-point:BEFORE FIELD fabo022 name="construct.b.page1.fabo022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo022
            
            #add-point:AFTER FIELD fabo022 name="construct.a.page1.fabo022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo022
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo022
            #add-point:ON ACTION controlp INFIELD fabo022 name="construct.c.page1.fabo022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo049
            #add-point:BEFORE FIELD fabo049 name="construct.b.page1.fabo049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo049
            
            #add-point:AFTER FIELD fabo049 name="construct.a.page1.fabo049"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo049
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo049
            #add-point:ON ACTION controlp INFIELD fabo049 name="construct.c.page1.fabo049"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo025
            #add-point:BEFORE FIELD fabo025 name="construct.b.page1.fabo025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo025
            
            #add-point:AFTER FIELD fabo025 name="construct.a.page1.fabo025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.fabo025
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo025
            #add-point:ON ACTION controlp INFIELD fabo025 name="construct.c.page1.fabo025"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.fabo023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo023
            #add-point:ON ACTION controlp INFIELD fabo023 name="construct.c.page1.fabo023"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " oocq019='4' "
            CALL q_oocq002_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo023  #顯示到畫面上
            NEXT FIELD fabo023                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo023
            #add-point:BEFORE FIELD fabo023 name="construct.b.page1.fabo023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo023
            
            #add-point:AFTER FIELD fabo023 name="construct.a.page1.fabo023"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo031
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo031
            #add-point:ON ACTION controlp INFIELD fabo031 name="construct.c.page1.fabo031"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo031  #顯示到畫面上
            NEXT FIELD fabo031                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo031
            #add-point:BEFORE FIELD fabo031 name="construct.b.page1.fabo031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo031
            
            #add-point:AFTER FIELD fabo031 name="construct.a.page1.fabo031"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo032
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo032
            #add-point:ON ACTION controlp INFIELD fabo032 name="construct.c.page1.fabo032"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo032  #顯示到畫面上
            NEXT FIELD fabo032                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo032
            #add-point:BEFORE FIELD fabo032 name="construct.b.page1.fabo032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo032
            
            #add-point:AFTER FIELD fabo032 name="construct.a.page1.fabo032"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo033
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo033
            #add-point:ON ACTION controlp INFIELD fabo033 name="construct.c.page1.fabo033"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo033  #顯示到畫面上
            NEXT FIELD fabo033                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo033
            #add-point:BEFORE FIELD fabo033 name="construct.b.page1.fabo033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo033
            
            #add-point:AFTER FIELD fabo033 name="construct.a.page1.fabo033"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo034
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo034
            #add-point:ON ACTION controlp INFIELD fabo034 name="construct.c.page1.fabo034"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo034  #顯示到畫面上
            NEXT FIELD fabo034                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo034
            #add-point:BEFORE FIELD fabo034 name="construct.b.page1.fabo034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo034
            
            #add-point:AFTER FIELD fabo034 name="construct.a.page1.fabo034"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo035
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo035
            #add-point:ON ACTION controlp INFIELD fabo035 name="construct.c.page1.fabo035"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo035  #顯示到畫面上
            NEXT FIELD fabo035                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo035
            #add-point:BEFORE FIELD fabo035 name="construct.b.page1.fabo035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo035
            
            #add-point:AFTER FIELD fabo035 name="construct.a.page1.fabo035"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo036
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo036
            #add-point:ON ACTION controlp INFIELD fabo036 name="construct.c.page1.fabo036"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo036  #顯示到畫面上
            NEXT FIELD fabo036                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo036
            #add-point:BEFORE FIELD fabo036 name="construct.b.page1.fabo036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo036
            
            #add-point:AFTER FIELD fabo036 name="construct.a.page1.fabo036"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo037
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo037
            #add-point:ON ACTION controlp INFIELD fabo037 name="construct.c.page1.fabo037"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo037  #顯示到畫面上
            NEXT FIELD fabo037                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo037
            #add-point:BEFORE FIELD fabo037 name="construct.b.page1.fabo037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo037
            
            #add-point:AFTER FIELD fabo037 name="construct.a.page1.fabo037"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo0554
            #add-point:BEFORE FIELD fabo0554 name="construct.b.page1.fabo0554"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo0554
            
            #add-point:AFTER FIELD fabo0554 name="construct.a.page1.fabo0554"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo0554
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo0554
            #add-point:ON ACTION controlp INFIELD fabo0554 name="construct.c.page1.fabo0554"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo055
            #add-point:BEFORE FIELD fabo055 name="construct.b.page1.fabo055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo055
            
            #add-point:AFTER FIELD fabo055 name="construct.a.page1.fabo055"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo055
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo055
            #add-point:ON ACTION controlp INFIELD fabo055 name="construct.c.page1.fabo055"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo056
            #add-point:BEFORE FIELD fabo056 name="construct.b.page1.fabo056"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo056
            
            #add-point:AFTER FIELD fabo056 name="construct.a.page1.fabo056"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo056
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo056
            #add-point:ON ACTION controlp INFIELD fabo056 name="construct.c.page1.fabo056"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.fabo038
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo038
            #add-point:ON ACTION controlp INFIELD fabo038 name="construct.c.page1.fabo038"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo038  #顯示到畫面上
            NEXT FIELD fabo038                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo038
            #add-point:BEFORE FIELD fabo038 name="construct.b.page1.fabo038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo038
            
            #add-point:AFTER FIELD fabo038 name="construct.a.page1.fabo038"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo039
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo039
            #add-point:ON ACTION controlp INFIELD fabo039 name="construct.c.page1.fabo039"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
         #   CALL q_pjba001()                           #呼叫開窗    #170330-00057#7  mark
            CALL q_pjab001_1()                   #170330-00057#7  add
            DISPLAY g_qryparam.return1 TO fabo039  #顯示到畫面上
            NEXT FIELD fabo039                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo039
            #add-point:BEFORE FIELD fabo039 name="construct.b.page1.fabo039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo039
            
            #add-point:AFTER FIELD fabo039 name="construct.a.page1.fabo039"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo040
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo040
            #add-point:ON ACTION controlp INFIELD fabo040 name="construct.c.page1.fabo040"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pjbb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo040  #顯示到畫面上
            NEXT FIELD fabo040                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo040
            #add-point:BEFORE FIELD fabo040 name="construct.b.page1.fabo040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo040
            
            #add-point:AFTER FIELD fabo040 name="construct.a.page1.fabo040"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo057
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo057
            #add-point:ON ACTION controlp INFIELD fabo057 name="construct.c.page1.fabo057"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo057  #顯示到畫面上
            NEXT FIELD fabo057                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo057
            #add-point:BEFORE FIELD fabo057 name="construct.b.page1.fabo057"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo057
            
            #add-point:AFTER FIELD fabo057 name="construct.a.page1.fabo057"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo060
            #add-point:BEFORE FIELD fabo060 name="construct.b.page1.fabo060"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo060
            
            #add-point:AFTER FIELD fabo060 name="construct.a.page1.fabo060"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo060
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo060
            #add-point:ON ACTION controlp INFIELD fabo060 name="construct.c.page1.fabo060"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo061
            #add-point:BEFORE FIELD fabo061 name="construct.b.page1.fabo061"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo061
            
            #add-point:AFTER FIELD fabo061 name="construct.a.page1.fabo061"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo061
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo061
            #add-point:ON ACTION controlp INFIELD fabo061 name="construct.c.page1.fabo061"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo062
            #add-point:BEFORE FIELD fabo062 name="construct.b.page1.fabo062"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo062
            
            #add-point:AFTER FIELD fabo062 name="construct.a.page1.fabo062"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo062
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo062
            #add-point:ON ACTION controlp INFIELD fabo062 name="construct.c.page1.fabo062"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo063
            #add-point:BEFORE FIELD fabo063 name="construct.b.page1.fabo063"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo063
            
            #add-point:AFTER FIELD fabo063 name="construct.a.page1.fabo063"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo063
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo063
            #add-point:ON ACTION controlp INFIELD fabo063 name="construct.c.page1.fabo063"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo064
            #add-point:BEFORE FIELD fabo064 name="construct.b.page1.fabo064"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo064
            
            #add-point:AFTER FIELD fabo064 name="construct.a.page1.fabo064"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo064
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo064
            #add-point:ON ACTION controlp INFIELD fabo064 name="construct.c.page1.fabo064"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo065
            #add-point:BEFORE FIELD fabo065 name="construct.b.page1.fabo065"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo065
            
            #add-point:AFTER FIELD fabo065 name="construct.a.page1.fabo065"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo065
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo065
            #add-point:ON ACTION controlp INFIELD fabo065 name="construct.c.page1.fabo065"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo066
            #add-point:BEFORE FIELD fabo066 name="construct.b.page1.fabo066"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo066
            
            #add-point:AFTER FIELD fabo066 name="construct.a.page1.fabo066"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo066
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo066
            #add-point:ON ACTION controlp INFIELD fabo066 name="construct.c.page1.fabo066"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo067
            #add-point:BEFORE FIELD fabo067 name="construct.b.page1.fabo067"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo067
            
            #add-point:AFTER FIELD fabo067 name="construct.a.page1.fabo067"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo067
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo067
            #add-point:ON ACTION controlp INFIELD fabo067 name="construct.c.page1.fabo067"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo068
            #add-point:BEFORE FIELD fabo068 name="construct.b.page1.fabo068"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo068
            
            #add-point:AFTER FIELD fabo068 name="construct.a.page1.fabo068"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo068
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo068
            #add-point:ON ACTION controlp INFIELD fabo068 name="construct.c.page1.fabo068"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo069
            #add-point:BEFORE FIELD fabo069 name="construct.b.page1.fabo069"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo069
            
            #add-point:AFTER FIELD fabo069 name="construct.a.page1.fabo069"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.fabo069
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo069
            #add-point:ON ACTION controlp INFIELD fabo069 name="construct.c.page1.fabo069"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faboseq_3
            #add-point:BEFORE FIELD faboseq_3 name="construct.b.page4.faboseq_3"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faboseq_3
            
            #add-point:AFTER FIELD faboseq_3 name="construct.a.page4.faboseq_3"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.faboseq_3
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faboseq_3
            #add-point:ON ACTION controlp INFIELD faboseq_3 name="construct.c.page4.faboseq_3"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faaj103
            #add-point:BEFORE FIELD faaj103 name="construct.b.page4.faaj103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faaj103
            
            #add-point:AFTER FIELD faaj103 name="construct.a.page4.faaj103"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.faaj103
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faaj103
            #add-point:ON ACTION controlp INFIELD faaj103 name="construct.c.page4.faaj103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo107
            #add-point:BEFORE FIELD fabo107 name="construct.b.page4.fabo107"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo107
            
            #add-point:AFTER FIELD fabo107 name="construct.a.page4.fabo107"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo107
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo107
            #add-point:ON ACTION controlp INFIELD fabo107 name="construct.c.page4.fabo107"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page4.fabo101
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo101
            #add-point:ON ACTION controlp INFIELD fabo101 name="construct.c.page4.fabo101"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo101  #顯示到畫面上
            NEXT FIELD fabo101                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo101
            #add-point:BEFORE FIELD fabo101 name="construct.b.page4.fabo101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo101
            
            #add-point:AFTER FIELD fabo101 name="construct.a.page4.fabo101"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo102
            #add-point:BEFORE FIELD fabo102 name="construct.b.page4.fabo102"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo102
            
            #add-point:AFTER FIELD fabo102 name="construct.a.page4.fabo102"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo102
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo102
            #add-point:ON ACTION controlp INFIELD fabo102 name="construct.c.page4.fabo102"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo103
            #add-point:BEFORE FIELD fabo103 name="construct.b.page4.fabo103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo103
            
            #add-point:AFTER FIELD fabo103 name="construct.a.page4.fabo103"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo103
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo103
            #add-point:ON ACTION controlp INFIELD fabo103 name="construct.c.page4.fabo103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo104
            #add-point:BEFORE FIELD fabo104 name="construct.b.page4.fabo104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo104
            
            #add-point:AFTER FIELD fabo104 name="construct.a.page4.fabo104"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo104
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo104
            #add-point:ON ACTION controlp INFIELD fabo104 name="construct.c.page4.fabo104"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo105
            #add-point:BEFORE FIELD fabo105 name="construct.b.page4.fabo105"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo105
            
            #add-point:AFTER FIELD fabo105 name="construct.a.page4.fabo105"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo105
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo105
            #add-point:ON ACTION controlp INFIELD fabo105 name="construct.c.page4.fabo105"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo106
            #add-point:BEFORE FIELD fabo106 name="construct.b.page4.fabo106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo106
            
            #add-point:AFTER FIELD fabo106 name="construct.a.page4.fabo106"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo106
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo106
            #add-point:ON ACTION controlp INFIELD fabo106 name="construct.c.page4.fabo106"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo108
            #add-point:BEFORE FIELD fabo108 name="construct.b.page4.fabo108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo108
            
            #add-point:AFTER FIELD fabo108 name="construct.a.page4.fabo108"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo108
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo108
            #add-point:ON ACTION controlp INFIELD fabo108 name="construct.c.page4.fabo108"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo109
            #add-point:BEFORE FIELD fabo109 name="construct.b.page4.fabo109"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo109
            
            #add-point:AFTER FIELD fabo109 name="construct.a.page4.fabo109"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo109
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo109
            #add-point:ON ACTION controlp INFIELD fabo109 name="construct.c.page4.fabo109"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo110
            #add-point:BEFORE FIELD fabo110 name="construct.b.page4.fabo110"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo110
            
            #add-point:AFTER FIELD fabo110 name="construct.a.page4.fabo110"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo110
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo110
            #add-point:ON ACTION controlp INFIELD fabo110 name="construct.c.page4.fabo110"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo111
            #add-point:BEFORE FIELD fabo111 name="construct.b.page4.fabo111"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo111
            
            #add-point:AFTER FIELD fabo111 name="construct.a.page4.fabo111"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo111
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo111
            #add-point:ON ACTION controlp INFIELD fabo111 name="construct.c.page4.fabo111"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo112
            #add-point:BEFORE FIELD fabo112 name="construct.b.page4.fabo112"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo112
            
            #add-point:AFTER FIELD fabo112 name="construct.a.page4.fabo112"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo112
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo112
            #add-point:ON ACTION controlp INFIELD fabo112 name="construct.c.page4.fabo112"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faaj153
            #add-point:BEFORE FIELD faaj153 name="construct.b.page4.faaj153"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faaj153
            
            #add-point:AFTER FIELD faaj153 name="construct.a.page4.faaj153"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.faaj153
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faaj153
            #add-point:ON ACTION controlp INFIELD faaj153 name="construct.c.page4.faaj153"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo156
            #add-point:BEFORE FIELD fabo156 name="construct.b.page4.fabo156"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo156
            
            #add-point:AFTER FIELD fabo156 name="construct.a.page4.fabo156"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo156
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo156
            #add-point:ON ACTION controlp INFIELD fabo156 name="construct.c.page4.fabo156"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page4.fabo150
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo150
            #add-point:ON ACTION controlp INFIELD fabo150 name="construct.c.page4.fabo150"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabo150  #顯示到畫面上
            NEXT FIELD fabo150                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo150
            #add-point:BEFORE FIELD fabo150 name="construct.b.page4.fabo150"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo150
            
            #add-point:AFTER FIELD fabo150 name="construct.a.page4.fabo150"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo151
            #add-point:BEFORE FIELD fabo151 name="construct.b.page4.fabo151"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo151
            
            #add-point:AFTER FIELD fabo151 name="construct.a.page4.fabo151"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo151
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo151
            #add-point:ON ACTION controlp INFIELD fabo151 name="construct.c.page4.fabo151"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo152
            #add-point:BEFORE FIELD fabo152 name="construct.b.page4.fabo152"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo152
            
            #add-point:AFTER FIELD fabo152 name="construct.a.page4.fabo152"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo152
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo152
            #add-point:ON ACTION controlp INFIELD fabo152 name="construct.c.page4.fabo152"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo153
            #add-point:BEFORE FIELD fabo153 name="construct.b.page4.fabo153"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo153
            
            #add-point:AFTER FIELD fabo153 name="construct.a.page4.fabo153"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo153
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo153
            #add-point:ON ACTION controlp INFIELD fabo153 name="construct.c.page4.fabo153"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo154
            #add-point:BEFORE FIELD fabo154 name="construct.b.page4.fabo154"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo154
            
            #add-point:AFTER FIELD fabo154 name="construct.a.page4.fabo154"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo154
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo154
            #add-point:ON ACTION controlp INFIELD fabo154 name="construct.c.page4.fabo154"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo155
            #add-point:BEFORE FIELD fabo155 name="construct.b.page4.fabo155"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo155
            
            #add-point:AFTER FIELD fabo155 name="construct.a.page4.fabo155"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo155
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo155
            #add-point:ON ACTION controlp INFIELD fabo155 name="construct.c.page4.fabo155"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo157
            #add-point:BEFORE FIELD fabo157 name="construct.b.page4.fabo157"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo157
            
            #add-point:AFTER FIELD fabo157 name="construct.a.page4.fabo157"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo157
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo157
            #add-point:ON ACTION controlp INFIELD fabo157 name="construct.c.page4.fabo157"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo158
            #add-point:BEFORE FIELD fabo158 name="construct.b.page4.fabo158"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo158
            
            #add-point:AFTER FIELD fabo158 name="construct.a.page4.fabo158"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo158
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo158
            #add-point:ON ACTION controlp INFIELD fabo158 name="construct.c.page4.fabo158"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo159
            #add-point:BEFORE FIELD fabo159 name="construct.b.page4.fabo159"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo159
            
            #add-point:AFTER FIELD fabo159 name="construct.a.page4.fabo159"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo159
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo159
            #add-point:ON ACTION controlp INFIELD fabo159 name="construct.c.page4.fabo159"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo160
            #add-point:BEFORE FIELD fabo160 name="construct.b.page4.fabo160"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo160
            
            #add-point:AFTER FIELD fabo160 name="construct.a.page4.fabo160"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo160
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo160
            #add-point:ON ACTION controlp INFIELD fabo160 name="construct.c.page4.fabo160"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo161
            #add-point:BEFORE FIELD fabo161 name="construct.b.page4.fabo161"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo161
            
            #add-point:AFTER FIELD fabo161 name="construct.a.page4.fabo161"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.fabo161
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo161
            #add-point:ON ACTION controlp INFIELD fabo161 name="construct.c.page4.fabo161"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON xrcdseq,xrcdseq2,fabo001_1,xrcd007,xrcd002,xrcd002_desc,xrcd003,xrcd006,xrcd100,xrcd005,xrcd009,xrcd009_desc
           FROM s_detail3[1].xrcdseq,s_detail3[1].xrcdseq2,s_detail3[1].fabo001_1,s_detail3[1].xrcd007,s_detail3[1].xrcd002,s_detail3[1].xrcd002_desc,s_detail3[1].xrcd003,s_detail3[1].xrcd006,s_detail3[1].xrcd100,s_detail3[1].xrcd005,s_detail3[1].xrcd009,s_detail3[1].xrcd009_desc
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdseq
            #add-point:BEFORE FIELD xrcdseq name="construct.b.page3.xrcdseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcdseq
            
            #add-point:AFTER FIELD xrcdseq name="construct.a.page3.xrcdseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcdseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcdseq
            #add-point:ON ACTION controlp INFIELD xrcdseq name="construct.c.page3.xrcdseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdseq2
            #add-point:BEFORE FIELD xrcdseq2 name="construct.b.page3.xrcdseq2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcdseq2
            
            #add-point:AFTER FIELD xrcdseq2 name="construct.a.page3.xrcdseq2"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcdseq2
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcdseq2
            #add-point:ON ACTION controlp INFIELD xrcdseq2 name="construct.c.page3.xrcdseq2"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo001_1
            #add-point:BEFORE FIELD fabo001_1 name="construct.b.page3.fabo001_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo001_1
            
            #add-point:AFTER FIELD fabo001_1 name="construct.a.page3.fabo001_1"
            #201109-00009#171---add---(S) 
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str 
            IF NOT cl_null(lp_str) THEN 
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能 
               CALL FGL_DIALOG_SETBUFFER(lp_str) 
            END IF 
            #201109-00009#171---add---(E)
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.fabo001_1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo001_1
            #add-point:ON ACTION controlp INFIELD fabo001_1 name="construct.c.page3.fabo001_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd007
            #add-point:BEFORE FIELD xrcd007 name="construct.b.page3.xrcd007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd007
            
            #add-point:AFTER FIELD xrcd007 name="construct.a.page3.xrcd007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd007
            #add-point:ON ACTION controlp INFIELD xrcd007 name="construct.c.page3.xrcd007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.xrcd002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd002
            #add-point:ON ACTION controlp INFIELD xrcd002 name="construct.c.page3.xrcd002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_xrcd002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrcd002  #顯示到畫面上
            NEXT FIELD xrcd002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002
            #add-point:BEFORE FIELD xrcd002 name="construct.b.page3.xrcd002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd002
            
            #add-point:AFTER FIELD xrcd002 name="construct.a.page3.xrcd002"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002_desc
            #add-point:BEFORE FIELD xrcd002_desc name="construct.b.page3.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd002_desc
            
            #add-point:AFTER FIELD xrcd002_desc name="construct.a.page3.xrcd002_desc"
            #201109-00009#171---add---(S) 
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str 
            IF NOT cl_null(lp_str) THEN 
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能 
               CALL FGL_DIALOG_SETBUFFER(lp_str) 
            END IF 
            #201109-00009#171---add---(E)
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd002_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd002_desc
            #add-point:ON ACTION controlp INFIELD xrcd002_desc name="construct.c.page3.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd003
            #add-point:BEFORE FIELD xrcd003 name="construct.b.page3.xrcd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd003
            
            #add-point:AFTER FIELD xrcd003 name="construct.a.page3.xrcd003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd003
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd003
            #add-point:ON ACTION controlp INFIELD xrcd003 name="construct.c.page3.xrcd003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd006
            #add-point:BEFORE FIELD xrcd006 name="construct.b.page3.xrcd006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd006
            
            #add-point:AFTER FIELD xrcd006 name="construct.a.page3.xrcd006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd006
            #add-point:ON ACTION controlp INFIELD xrcd006 name="construct.c.page3.xrcd006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd100
            #add-point:BEFORE FIELD xrcd100 name="construct.b.page3.xrcd100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd100
            
            #add-point:AFTER FIELD xrcd100 name="construct.a.page3.xrcd100"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page3.xrcd100
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd100
            #add-point:ON ACTION controlp INFIELD xrcd100 name="construct.c.page3.xrcd100"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd005
            #add-point:BEFORE FIELD xrcd005 name="construct.b.page3.xrcd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd005
            
            #add-point:AFTER FIELD xrcd005 name="construct.a.page3.xrcd005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd005
            #add-point:ON ACTION controlp INFIELD xrcd005 name="construct.c.page3.xrcd005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.xrcd009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009
            #add-point:ON ACTION controlp INFIELD xrcd009 name="construct.c.page3.xrcd009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL aglt310_04()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrcd009  #顯示到畫面上
            NEXT FIELD xrcd009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009
            #add-point:BEFORE FIELD xrcd009 name="construct.b.page3.xrcd009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd009
            
            #add-point:AFTER FIELD xrcd009 name="construct.a.page3.xrcd009"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009_desc
            #add-point:BEFORE FIELD xrcd009_desc name="construct.b.page3.xrcd009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd009_desc
            
            #add-point:AFTER FIELD xrcd009_desc name="construct.a.page3.xrcd009_desc"
            #201109-00009#171---add---(S) 
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str 
            IF NOT cl_null(lp_str) THEN 
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能 
               CALL FGL_DIALOG_SETBUFFER(lp_str) 
            END IF 
            #201109-00009#171---add---(E)
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrcd009_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd009_desc
            #add-point:ON ACTION controlp INFIELD xrcd009_desc name="construct.c.page3.xrcd009_desc"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      SUBDIALOG afa_afat504_01.afat504_01_construct
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
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
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "fabg_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "fabo_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "xrcd_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
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
   IF g_wc2_table2 <> " 1=1" AND NOT g_wc2.getIndexOf(g_wc2_table2,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2         #200917-00047
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   IF g_wc_subject <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc_subject
   END IF
   LET g_wc_d=g_wc2
   #161104-00046#22 add ------
   IF cl_null(g_user_dept_wc)THEN
      LET g_user_dept_wc = ' 1=1'
   END IF
   #201230-00067#12  14740 mark  --s
   #IF g_user_dept_wc <>  " 1=1" THEN
   #   LET g_wc = g_wc ," AND ", g_user_dept_wc CLIPPED
   #END IF
   #201230-00067#12  14740 mark  --e
   #161104-00046#22 add end---
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.query" type="s" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION afat504_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_fabo_d.clear()
   CALL g_fabo3_d.clear()
   CALL g_fabo4_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index 
   DISPLAY '' TO FORMONLY.h_count
   
   LET g_wc2_extend = " 1=1" #清空查詢方案條件 #190730-00003#4 add
   
   CALL afat504_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL afat504_browser_fill("")
      CALL afat504_fetch("")
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
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
   CALL afat504_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL afat504_fetch("F") 
      #顯示單身筆數
      CALL afat504_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.fetch" type="s" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION afat504_fetch(p_flag)
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
   LET g_pagestart = g_current_idx
   DISPLAY g_pagestart TO FORMONLY.b_index   #當下筆數
   DISPLAY g_pagestart TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_pagestart, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_fabg_m.fabgld = g_browser[g_current_idx].b_fabgld
   LET g_fabg_m.fabgdocno = g_browser[g_current_idx].b_fabgdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
       g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid, 
       g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
       g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
   
   #遮罩相關處理
   LET g_fabg_m_mask_o.* =  g_fabg_m.*
   CALL afat504_fabg_t_mask()
   LET g_fabg_m_mask_n.* =  g_fabg_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL afat504_set_act_visible()   
   CALL afat504_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_fabg_m.fabgstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #170617-00439#1 add-s
   IF g_fabg_m.fabgstus<>'N' THEN
      CALL cl_set_act_visible('update_detail_sum',FALSE)   
   ELSE
      CALL cl_set_act_visible('update_detail_sum',TRUE)
   END IF
  #170617-00439#1 add-e
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   LET g_fabgld=g_fabg_m.fabgld
   LET g_fabgdocno=g_fabg_m.fabgdocno
   #end add-point
   
   #保存單頭舊值
   LET g_fabg_m_t.* = g_fabg_m.*
   LET g_fabg_m_o.* = g_fabg_m.*
   
   LET g_data_owner = g_fabg_m.fabgownid      
   LET g_data_dept  = g_fabg_m.fabgowndp
   LET g_data_crtid = g_fabg_m.fabgcrtid   #180201-00054
   LET g_data_crtdp = g_fabg_m.fabgcrtdp   #180201-00054
   
   #重新顯示   
   CALL afat504_show()
 
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
 
{<section id="afat504.insert" type="s" >}
#+ 資料新增
PRIVATE FUNCTION afat504_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_fabo_d.clear()   
   CALL g_fabo3_d.clear()  
   CALL g_fabo4_d.clear()  
 
 
   INITIALIZE g_fabg_m.* TO NULL             #DEFAULT 設定
   
   LET g_fabgld_t = NULL
   LET g_fabgdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_fabg_m.fabgownid = g_user
      LET g_fabg_m.fabgowndp = g_dept
      LET g_fabg_m.fabgcrtid = g_user
      LET g_fabg_m.fabgcrtdp = g_dept 
      LET g_fabg_m.fabgcrtdt = cl_get_current()
      LET g_fabg_m.fabgmodid = g_user
      LET g_fabg_m.fabgmoddt = cl_get_current()
      LET g_fabg_m.fabgstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_fabg_m.fabg005 = "8"
      LET g_fabg_m.fabgstus = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
      CALL afat504_set_default()
      LET g_fabgld_o=NULL
      LET g_fabgdocno_o=NULL
      LET g_fabgld=NULL
      LET g_fabgdocno=NULL
      LET g_fabg_m.fabg005 = "4"
      LET g_fabg_m_t.* = g_fabg_m.* #20141213 add by chenying
      CALL afat504_01_b_fill()
      
      #160826-00013#1 add s---
      #交易稅區
      SELECT ooef019 INTO g_ooef019 FROM ooef_t 
      WHERE ooefent = g_enterprise AND ooef001 = g_fabg_m.fabgcomp      
      #160826-00013#1 add e---
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_fabg_m_t.* = g_fabg_m.*
      LET g_fabg_m_o.* = g_fabg_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_fabg_m.fabgstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL afat504_input("a")
      
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
         INITIALIZE g_fabg_m.* TO NULL
         INITIALIZE g_fabo_d TO NULL
         INITIALIZE g_fabo3_d TO NULL
         INITIALIZE g_fabo4_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL afat504_show()
         CALL afat504_idx_chk()   #(ver:83)
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_fabo_d.clear()
      #CALL g_fabo3_d.clear()
      #CALL g_fabo4_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL afat504_set_act_visible()   
   CALL afat504_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_fabgld_t = g_fabg_m.fabgld
   LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " fabgent = " ||g_enterprise|| " AND",
                      " fabgld = '", g_fabg_m.fabgld, "' "
                      ," AND fabgdocno = '", g_fabg_m.fabgdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
   
   LET g_wc2_extend = " 1=1" #191129-00016#1 add 
   
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   LET g_current_row = g_browser.getLength() + 1 #190108-00038 add
   CALL afat504_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE afat504_cl
   
   CALL afat504_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
       g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid, 
       g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
       g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
   
   
   #遮罩相關處理
   LET g_fabg_m_mask_o.* =  g_fabg_m.*
   CALL afat504_fabg_t_mask()
   LET g_fabg_m_mask_n.* =  g_fabg_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt, 
       g_fabg_m.fabg006,g_fabg_m.fabg006_desc,g_fabg_m.fabg007,g_fabg_m.fabg007_desc,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp,g_fabg_m.fabgowndp_desc, 
       g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmodid_desc,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstid_desc,g_fabg_m.fabgpstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_fabg_m.fabgownid      
   LET g_data_dept  = g_fabg_m.fabgowndp
   LET g_data_crtid = g_fabg_m.fabgcrtid   #180201-00054
   LET g_data_crtdp = g_fabg_m.fabgcrtdp   #180201-00054
   
   
   #功能已完成,通報訊息中心
   CALL afat504_msgcentre_notify('insert')
   
   CALL afat504_idx_chk()   #(ver:83)
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.modify" type="s" >}
#+ 資料修改
PRIVATE FUNCTION afat504_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE lp_cnt       LIKE type_t.num5   #190806-00019
   DEFINE l_wc2_table2   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   #190723-00011#5 --s add 
   DEFINE l_success   LIKE type_t.chr1  
   DEFINE l_slip      LIKE type_t.chr80  
   DEFINE l_fabgcomp  LIKE type_t.chr80
   #190723-00011#5 --e add
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_fabg_m_t.* = g_fabg_m.*
   LET g_fabg_m_o.* = g_fabg_m.*
   
   IF g_fabg_m.fabgld IS NULL
   OR g_fabg_m.fabgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_fabgld_t = g_fabg_m.fabgld
   LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
   CALL s_transaction_begin()
   
   #191101-00032 ---modify start---
   #190806-00019 ---start---
   #修改前須先確認資料是否存在
   IF g_action_choice = "modify" OR g_action_choice = "modify_detail" THEN   #191114-00036
      LET lp_cnt = 0
      EXECUTE afat504_chk_data_exist_pre INTO lp_cnt USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
      IF cl_null(lp_cnt) OR lp_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code = "-100"
         LET g_errparam.popup = TRUE
         CLOSE afat504_cl
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
   END IF
   #190806-00019 --- end ---
   #191101-00032 --- modify end ---
 
   OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE afat504_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #200804-00006 ---start---
   FETCH afat504_cl
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "FETCH afat504_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CLOSE afat504_cl
      #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
      CALL s_transaction_end('N','0')
      CALL s_transaction_begin()
      CALL cl_err()
      RETURN
   END IF
   #200804-00006 --- end ---
 
   #顯示最新的資料
   EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
       g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid, 
       g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
       g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
   
   #檢查是否允許此動作
   IF NOT afat504_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_fabg_m_mask_o.* =  g_fabg_m.*
   CALL afat504_fabg_t_mask()
   LET g_fabg_m_mask_n.* =  g_fabg_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   #180614-00039#9 mark-S
   #IF g_fabg_m.fabgstus<>'N' THEN
   #   INITIALIZE g_errparam TO NULL 
   #   LET g_errparam.extend = '' 
   #   LET g_errparam.code   = 'aim-00090'
   #   LET g_errparam.popup  = FALSE 
   #   CALL cl_err()
   #   RETURN
   #END IF
   #180614-00039#9 mark-E
   #190723-00011#5 --s add 
   #获取单别
   CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_slip
   #判断是否可以修改单据日期
   SELECT ooef017 INTO l_fabgcomp
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_fabg_m.fabgsite
      AND ooefstus = 'Y'
   CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_slip,'D-FIN-0033') RETURNING g_dfin0033
   IF g_dfin0033 = "N"  THEN   
   #190723-00011#5 --e add
      #151231-00005#3--add--str--lujh
      IF NOT cl_null(g_fabg_m.fabgdocdt) THEN 
         IF NOT s_afa_date_chk(g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN 
            CLOSE afat504_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF 
      END IF 
      #151231-00005#3--add--end--lujh
   END IF      #190723-00011#5 add
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL afat504_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_fabgld_t = g_fabg_m.fabgld
      LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_fabg_m.fabgmodid = g_user 
LET g_fabg_m.fabgmoddt = cl_get_current()
LET g_fabg_m.fabgmodid_desc = cl_get_username(g_fabg_m.fabgmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      LET g_fabgld_o=g_fabgld_t
      LET g_fabgdocno_o=g_fabgdocno_t
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_fabg_m.fabgstus MATCHES "[DR]" THEN 
         LET g_fabg_m.fabgstus = "N"
      END IF       
      IF g_fabg_m.fabgstus<>'N' THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code   = 'aim-00090'
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL afat504_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE fabg_t SET (fabgstus,fabgmodid,fabgmoddt) = (g_fabg_m.fabgstus,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt)
          WHERE fabgent = g_enterprise AND fabgld = g_fabgld_t
            AND fabgdocno = g_fabgdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_fabg_m.* = g_fabg_m_t.*
         #  CALL afat504_show()   #(ver:83)
         END IF
         CALL afat504_show()   #(ver:83)
         CALL afat504_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_fabg_m.fabgld != g_fabg_m_t.fabgld
      OR g_fabg_m.fabgdocno != g_fabg_m_t.fabgdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE fabo_t SET fabold = g_fabg_m.fabgld
                                       ,fabodocno = g_fabg_m.fabgdocno
 
          WHERE faboent = g_enterprise AND fabold = g_fabg_m_t.fabgld
            AND fabodocno = g_fabg_m_t.fabgdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "fabo_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update2"
         
         #end add-point
         
         UPDATE xrcd_t
            SET xrcdld = g_fabg_m.fabgld
               ,xrcddocno = g_fabg_m.fabgdocno
 
          WHERE xrcdent = g_enterprise AND
                xrcdld = g_fabgld_t
            AND xrcddocno = g_fabgdocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "xrcd_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
            #161130-00056 add
         
            #161130-00056 add
         
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
   CALL afat504_set_act_visible()   
   CALL afat504_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " fabgent = " ||g_enterprise|| " AND",
                      " fabgld = '", g_fabg_m.fabgld, "' "
                      ," AND fabgdocno = '", g_fabg_m.fabgdocno, "' "
 
   #填到對應位置
   CALL afat504_browser_fill("")
 
   CLOSE afat504_cl
   
   CALL s_transaction_end('Y','0')
 
   #180720-00009 ---start---
   #add-point:modify段結束前 name="modify.before_end"
   
   #end add-point
   #180720-00009 --- end ---
 
   #功能已完成,通報訊息中心
   CALL afat504_msgcentre_notify('modify')
   
   CALL afat504_idx_chk() #ver:83
 
END FUNCTION 
 
{</section>}
 
{<section id="afat504.input" type="s" >}
#+ 資料輸入
PRIVATE FUNCTION afat504_input(p_cmd)
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
   DEFINE  l_para_data           LIKE ooab_t.ooab002
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_ooef016             LIKE ooef_t.ooef016
   DEFINE  l_oobastus            LIKE ooba_t.oobastus
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_oodbl004            LIKE oodbl_t.oodbl004
   DEFINE  l_oodb005             LIKE oodb_t.oodb005
   DEFINE  l_oodb006             LIKE oodb_t.oodb006
   DEFINE  l_oodb011             LIKE oodb_t.oodb011
   DEFINE  l_oocq019             LIKE oocq_t.oocq019
   DEFINE  l_n4                  LIKE type_t.num5
   DEFINE  l_n5                  LIKE type_t.num5
   DEFINE  l_n6                  LIKE type_t.num5
   DEFINE  l_sql                 STRING
   DEFINE  l_fabo001             LIKE fabo_t.fabo001
   DEFINE  l_fabo002             LIKE fabo_t.fabo002
   DEFINE  l_fabo003             LIKE fabo_t.fabo003
   DEFINE  l_origin_str           STRING   #組織範圍 #20141111
   DEFINE  l_glab002              LIKE glab_t.glab002 #20141119 
   DEFINE  l_year                LIKE type_t.num5   #20141213 add by chenying
   DEFINE  l_month               LIKE type_t.num5   #20141213 add by chenying
   DEFINE  l_oocq009             LIKE oocq_t.oocq009 #20141219 add by chenying  
   DEFINE  r_success             LIKE type_t.num5   #20141224 add by chenying
   DEFINE  l_ooba002             LIKE ooba_t.ooba002   #150916
   DEFINE  l_str1                LIKE type_t.chr1      #150916 
   DEFINE  l_ooab002             LIKE ooab_t.ooab002   #170825-00034#1

   DEFINE l_glaa004              LIKE  glaa_t.glaa004   #20151202
   #151125-00006#2-add-s
   #DEFINE  l_ooba002             LIKE ooba_t.ooba002
   DEFINE  l_dfin0031            LIKE type_t.chr1
   DEFINE  l_dfin0032            LIKE type_t.chr1
   DEFINE  l_fabgcomp            LIKE fabg_t.fabgcomp
   DEFINE  l_ld                  LIKE fabg_t.fabgld
   #151125-00006#2-add-e
   DEFINE  l_flag                LIKE type_t.num5      #161104-00046#22
   #170111-00030#1--ADD--S--
   DEFINE  l_fabo024             LIKE fabo_t.fabo024
   DEFINE  l_scccode             LIKE gzcb_t.gzcb002
   DEFINE  l_fabo049             LIKE fabo_t.fabo049
   #170111-00030#1--ADD--E--
   
   #170322-00011#2-----s
   DEFINE ls_js         STRING
   DEFINE lc_param      RECORD
            apca004     LIKE apca_t.apca004,
            ooib001     LIKE ooib_t.ooib001
                    END RECORD
   DEFINE l_apca121 LIKE apca_t.apca121
   DEFINE l_apca131 LIKE apca_t.apca131
   #170322-00011#2-----e
   #170412-00050#1--add--s--xul
   DEFINE l_fabo009     LIKE fabo_t.fabo009
   DEFINE l_glab005     LIKE glab_t.glab005
   DEFINE l_fabg006     LIKE fabg_t.fabg006
   DEFINE l_fabgsite    LIKE fabg_t.fabgsite
   DEFINE l_pmab105     LIKE pmab_t.pmab105
   #170412-00050#1--add--e--xul
   DEFINE l_errno               LIKE type_t.chr1000  #170704-00052#1   add
   #170512-00045#30 add-s
   DEFINE l_faaj023     LIKE faaj_t.faaj023
   DEFINE l_faaj024     LIKE faaj_t.faaj024
   DEFINE l_faaj026     LIKE faaj_t.faaj026
   DEFINE l_glaacomp    LIKE glaa_t.glaacomp 
   #170512-00045#30 add-e
   DEFINE l_pmaa004    LIKE pmaa_t.pmaa004
   #170421-00027#5 By 09505 --(S)-- 
   
   DEFINE l_glbi_sql       STRING 
   DEFINE lc_param2  RECORD
       glbi001   LIKE glbi_t.glbi001,   #作业编号 
       glbild    LIKE glbi_t.glbild,    #账套
       docno     LIKE xrca_t.xrcadocno, #单号OR单别
       glbi003   LIKE glbi_t.glbi003    #科目编号  
             END RECORD
   #170421-00027#5 By 09505 --(E)--
   DEFINE l_date                 LIKE fabg_t.fabgdocdt  #180326-00032#1 add
   DEFINE l_date2                LIKE fabg_t.fabgdocdt  #180326-00032#1 add
   DEFINE l_faaj006              LIKE faaj_t.faaj006     #181015-00013#3 add
   DEFINE l_faaj007              LIKE faaj_t.faaj007     #181015-00013#3 add
   DEFINE l_faah026              LIKE faah_t.faah026     #180525-00007#1 add 
   DEFINE l_xrcds                LIKE type_t.num10      #200514-00005#1 add
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
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt, 
       g_fabg_m.fabg006,g_fabg_m.fabg006_desc,g_fabg_m.fabg007,g_fabg_m.fabg007_desc,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp,g_fabg_m.fabgowndp_desc, 
       g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmodid_desc,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstid_desc,g_fabg_m.fabgpstdt
   
   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "
   LET g_wc2_table2 = " 1=1 "
 
 
   #CALL afat504_b_fill()
   #ver:82
   
   #切換畫面
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035,fabo036,fabo037, 
       fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,faboseq,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo157, 
       fabo158,fabo159,fabo160,fabo161 FROM fabo_t WHERE faboent=? AND fabold=? AND fabodocno=? AND faboseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE afat504_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcd113,xrcd114,xrcd115 FROM xrcd_t WHERE xrcdent=? AND xrcdld=? AND xrcddocno=? AND xrcdseq=? AND xrcdseq2=? AND xrcd007=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE afat504_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL afat504_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL afat504_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016, 
       g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   LET g_errshow = 1
   LET g_detail_insert = cl_auth_detail_input("insert")
   LET g_detail_delete = cl_auth_detail_input("delete")
   LET r_success = TRUE #20141224 add by chenying   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="afat504.input.head" type="s" >}
      #單頭段
      INPUT BY NAME g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016, 
          g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE afat504_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
 
            #200804-00006 ---start---
            FETCH afat504_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH afat504_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE afat504_cl
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
            CALL afat504_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                   glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                   glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                   glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                   glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                   glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld #20141213 add by chenying
            CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9003') RETURNING l_para_data
            #end add-point
            CALL afat504_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgsite
            
            #add-point:AFTER FIELD fabgsite name="input.a.fabgsite"
#160426-00014#33--mark--str--lujh
#            IF NOT cl_null(g_fabg_m.fabgsite) THEN
#               IF p_cmd = 'a'  OR (g_fabg_m.fabgsite <> g_fabg_m_t.fabgsite OR cl_null(g_fabg_m_t.fabgsite)) THEN
#                #检查组织资料的合理性             
#               IF NOT s_afat502_site_chk(g_fabg_m.fabgsite ) THEN
#                  LET g_fabg_m.fabgsite = g_fabg_m_t.fabgsite
#                  CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
#                  DISPLAY BY NAME g_fabg_m.fabgsite_desc
#                  NEXT FIELD CURRENT
#               END IF 
#               #帳務人員不為空需要檢查和資產中心的權限
#               IF NOT cl_null(g_fabg_m.fabg001) THEN
#                  IF NOT s_afat502_site_user_chk(g_fabg_m.fabgsite,g_fabg_m.fabg001) THEN
#                     LET g_fabg_m.fabgsite = g_fabg_m_t.fabgsite
#                     CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
#                     DISPLAY BY NAME g_fabg_m.fabgsite_desc
#                     NEXT FIELD CURRENT  
#                  END IF
#               END IF   
#               #帐套不为空检查法人归属是否相同
#               IF NOT cl_null(g_fabg_m.fabgld) THEN
#                  IF NOT s_afat502_site_ld_chk(g_fabg_m.fabgsite,g_fabg_m.fabgld) THEN
#                     LET g_fabg_m.fabgsite = g_fabg_m_t.fabgsite
#                     CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
#                     DISPLAY BY NAME g_fabg_m.fabgsite_desc
#                     NEXT FIELD CURRENT  
#                  END IF
#               END IF                
#               #####################################mark by huangtao
#                 
#               ######################################mark by huangtao   
#               END IF        
#            END IF
#            CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
#160426-00014#33--mark--end--lujh

#160426-00014#33--add--str--lujh
            IF NOT cl_null(g_fabg_m.fabgsite) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_fabg_m.fabgsite != g_fabg_m_t.fabgsite OR g_fabg_m_t.fabgsite IS NULL )) THEN

                  CALL s_afa_site_chk(g_fabg_m.fabgsite,g_fabg_m_t.fabgsite,'',g_fabg_m.fabgld,g_fabg_m.fabgdocdt)
                  RETURNING l_success,g_glaa.glaacomp,g_fabg_m.fabgld
                  
                  IF l_success = FALSE THEN 
                     LET g_fabg_m.fabgsite = g_fabg_m_t.fabgsite
                     LET g_fabg_m.fabgld = g_fabg_m_t.fabgld
                     CALL s_desc_get_department_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
                     DISPLAY BY NAME g_fabg_m.fabgsite_desc
                     NEXT FIELD CURRENT
                  END IF
                  
                  #人员不为空
                  IF NOT cl_null(g_fabg_m.fabg001) THEN
                     CALL s_afa_person_chk(g_fabg_m.fabgsite,g_fabg_m.fabg001)
                     RETURNING l_success
                     IF l_success = FALSE THEN
                        LET g_fabg_m.fabgsite = g_fabg_m_t.fabgsite
                        CALL s_desc_get_department_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
                        DISPLAY BY NAME g_fabg_m.fabgsite_desc
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
            END IF
            CALL s_fin_account_center_sons_query('5',g_fabg_m.fabgsite,g_today,'1')
            LET g_fabg_m_t.fabgsite = g_fabg_m.fabgsite
            LET g_fabg_m_t.fabgld = g_fabg_m.fabgld
            CALL s_desc_get_department_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
            CALL s_desc_get_ld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
            DISPLAY BY NAME g_fabg_m.fabgsite_desc,g_fabg_m.fabgld_desc
#160426-00014#33--add--end--lujh
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgsite
            #add-point:BEFORE FIELD fabgsite name="input.b.fabgsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgsite
            #add-point:ON CHANGE fabgsite name="input.g.fabgsite"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabgsite
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabgsite',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg001
            
            #add-point:AFTER FIELD fabg001 name="input.a.fabg001"
#160426-00014#33--mark--str--lujh
#            IF NOT cl_null(g_fabg_m.fabg001) THEN 
#               IF p_cmd = 'a'  OR (g_fabg_m.fabg001 <> g_fabg_m_t.fabg001 OR cl_null(g_fabg_m_t.fabg001)) THEN
##此段落由子樣板a19產生
#                  #校驗代值
#                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#                  INITIALIZE g_chkparam.* TO NULL
#                  
#                  #設定g_chkparam.*的參數
#                  LET g_chkparam.arg1=g_fabg_m.fabg001
#                  #160318-00025#5--add--str
#                  LET g_errshow = TRUE 
#                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
#                  #160318-00025#5--add--end  
#                  #呼叫檢查存在並帶值的library
#                  IF cl_chk_exist("v_ooag001") THEN
#                    #資產中心不為空的情況下
#                    IF NOT cl_null(g_fabg_m.fabgsite) THEN 
#                      IF NOT s_afat502_site_user_chk(g_fabg_m.fabgsite,g_fabg_m.fabg001) THEN
#                         LET g_fabg_m.fabg001 = g_fabg_m_t.fabg001
#                         CALL afat504_fabg001_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
#                         DISPLAY BY NAME g_fabg_m.fabg001_desc
#                         NEXT FIELD CURRENT
#                      END IF
#                    END IF
#                    #帳套不為空時
#                    IF NOT cl_null(g_fabg_m.fabgld) THEN
#                       IF NOT s_ld_chk_authorization(g_fabg_m.fabg001,g_fabg_m.fabgld) THEN
#                          INITIALIZE g_errparam TO NULL
#                          LET g_errparam.code = 'axr-00022'     
#                          LET g_errparam.extend = ''
#                          LET g_errparam.popup = TRUE
#                          CALL cl_err() 
#                          LET g_fabg_m.fabg001 = g_fabg_m_t.fabg001
#                          CALL afat504_fabg001_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
#                          DISPLAY BY NAME g_fabg_m.fabg001_desc
#                          NEXT FIELD CURRENT
#                       END IF  
#                    END IF
#                    #########################################mark by huangtao
#                  ELSE
#                     #檢查失敗時後續處理
#                     LET g_fabg_m.fabgsite = g_fabg_m_t.fabg001
#                     NEXT FIELD CURRENT
#                  END IF
#               END IF
#            END IF 
#            CALL afat504_fabg001_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
#            DISPLAY BY NAME g_fabg_m.fabg001_desc
#160426-00014#33--mark--end--lujh

#160426-00014#33--add--str--lujh
            IF NOT cl_null(g_fabg_m.fabg001) THEN 
#應用 a19 樣板自動產生(Version:2)
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_fabg_m.fabg001
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
                  IF NOT cl_null(g_fabg_m.fabgsite) THEN 
                     CALL s_afa_person_chk(g_fabg_m.fabgsite,g_fabg_m.fabg001) RETURNING l_success
                     
                     IF l_success = FALSE THEN
                        LET g_fabg_m.fabg001 = g_fabg_m_t.fabg001
                        CALL s_desc_get_person_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
                        DISPLAY BY NAME g_fabg_m.fabg001_desc  
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  #170606-00033#8 add-s 
                  #检查该人员是否存在当前据点法人下
                  CALL s_afa_ooag001_chk(g_site,g_fabg_m.fabg001,'',1) RETURNING l_success
                  IF l_success=FALSE THEN
                    LET g_fabg_m.fabg001 = g_fabg_m_t.fabg001
                    NEXT FIELD CURRENT
                  END IF 
                  #170606-00033#8 add-e
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            CALL s_desc_get_person_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
            DISPLAY BY NAME g_fabg_m.fabg001_desc  
#160426-00014#33--add--end--lujh

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg001
            #add-point:BEFORE FIELD fabg001 name="input.b.fabg001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg001
            #add-point:ON CHANGE fabg001 name="input.g.fabg001"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg001
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg001',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgld
            
            #add-point:AFTER FIELD fabgld name="input.a.fabgld"
#160426-00014#33--mark--str--lujh
#            IF NOT cl_null(g_fabg_m.fabgld) THEN 
##20141111 --mark--str--              
##               IF p_cmd = 'a'  OR (g_fabg_m.fabgld <> g_fabg_m_t.fabgld OR cl_null(g_fabg_m_t.fabgld)) THEN
###此段落由子樣板a19產生
##20141111 --mark--end--  
#                  #校驗代值
#                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#                  INITIALIZE g_chkparam.* TO NULL
#                  
#                  #設定g_chkparam.*的參數
#                  LET g_chkparam.arg1=g_fabg_m.fabgld
#                  #160318-00025#5--add--str
#                  LET g_errshow = TRUE 
#                  LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
#                  #160318-00025#5--add--end  
#                  #呼叫檢查存在並帶值的library
#                  IF cl_chk_exist("v_fabgld") THEN
#                  ELSE
#                     #檢查失敗時後續處理
#                     LET g_fabg_m.fabgld = g_fabg_m_t.fabgld
#                     CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc  #20141111 add
#                     NEXT FIELD CURRENT
#                  END IF   
#                  #帐套人员不为空时
#                  IF NOT cl_null(g_fabg_m.fabg001) THEN
#                     IF NOT s_ld_chk_authorization(g_fabg_m.fabg001,g_fabg_m.fabgld) THEN
#                        INITIALIZE g_errparam TO NULL
#                        LET g_errparam.code = 'axr-00022'
#                        LET g_errparam.extend = g_fabg_m.fabgld
#                        LET g_errparam.popup = FALSE
#                        CALL cl_err()
#                        LET g_fabg_m.fabgld = g_fabg_m_t.fabgld
#                        CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
#                        DISPLAY BY NAME g_fabg_m.fabgld_desc
#                        NEXT FIELD CURRENT
#                     END IF
#                  END IF
#                  #资产中心不为空时
#                  IF NOT cl_null(g_fabg_m.fabgsite) THEN
#                     IF NOT s_afat502_site_ld_chk(g_fabg_m.fabgsite,g_fabg_m.fabgld) THEN
#                        LET g_fabg_m.fabgld = g_fabg_m_t.fabgld
#                        CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
#                        DISPLAY BY NAME g_fabg_m.fabgld_desc
#                        NEXT FIELD CURRENT
#                     END IF
#                  END IF
#            END IF 
#            
#            
#            CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
#160426-00014#33--mark--end--lujh

#20141111 --add--str--            
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                   glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                   glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                   glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                   glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                   glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            LET g_fabg_m.fabgcomp=g_glaa.glaacomp
            
            #170420-00007#1-----s
            #取帳套法人控制組
            CALL s_fin_get_wc_str(g_glaa.glaacomp) RETURNING g_sqlcomp
            CALL s_control_get_supplier_sql_pmab('2',g_site,g_user,g_dept,'',g_sqlcomp) RETURNING g_sub_success,g_sql_ctrl1
            #170420-00007#1-----e
            #交易稅區
            SELECT ooef019 INTO g_ooef019 FROM ooef_t 
            WHERE ooefent = g_enterprise AND ooef001 = g_fabg_m.fabgcomp
            CALL afat504_set_curr() #設置本位幣二三的顯示 
#20141111 --add--end--            
            DISPLAY BY NAME g_fabg_m.fabgld_desc

            #此段落由子樣板a05產生
            #確認資料無重複
            IF  NOT cl_null(g_fabg_m.fabgld) AND NOT cl_null(g_fabg_m.fabgdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t  OR g_fabg_m.fabgdocno != g_fabgdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM fabg_t WHERE "||"fabgent = '" ||g_enterprise|| "' AND "||"fabgld = '"||g_fabg_m.fabgld ||"' AND "|| "fabgdocno = '"||g_fabg_m.fabgdocno ||"'",'std-00004',0) THEN  #160905-00007#2 count(*) --> count(1)
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

#160426-00014#33--add--str--lujh
            IF NOT cl_null(g_fabg_m.fabgld) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_fabg_m.fabgld != g_fabg_m_t.fabgld OR g_fabg_m_t.fabgld IS NULL )) THEN
                  CALL s_afa_ld_chk(g_fabg_m.fabgsite,g_fabg_m.fabgld)
                  RETURNING l_success,g_glaa.glaacomp
                  
                  IF l_success = FALSE THEN 
                     LET g_fabg_m.fabgld = g_fabg_m_t.fabgld
                     CALL s_desc_get_ld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
                     DISPLAY BY NAME g_fabg_m.fabgld_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_fabg_m_t.fabgld = g_fabg_m.fabgld
            CALL s_desc_get_ld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
            DISPLAY BY NAME g_fabg_m.fabgld_desc
#160426-00014#33--add--end--lujh 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgld
            #add-point:BEFORE FIELD fabgld name="input.b.fabgld"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgld
            #add-point:ON CHANGE fabgld name="input.g.fabgld"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabgld
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabgld',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgcomp
            #add-point:BEFORE FIELD fabgcomp name="input.b.fabgcomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgcomp
            
            #add-point:AFTER FIELD fabgcomp name="input.a.fabgcomp"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgcomp
            #add-point:ON CHANGE fabgcomp name="input.g.fabgcomp"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabgcomp
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabgcomp',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg002
            
            #add-point:AFTER FIELD fabg002 name="input.a.fabg002"
            IF NOT cl_null(g_fabg_m.fabg002) THEN 
               IF p_cmd = 'a'  OR (g_fabg_m.fabg002 <> g_fabg_m_t.fabg002 OR cl_null(g_fabg_m_t.fabg002)) THEN
#此段落由子樣板a19產生
                  #校驗代值
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1=g_fabg_m.fabg002
                  #160318-00025#5--add--str
                  LET g_errshow = TRUE 
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#5--add--end  
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  ELSE
                     #檢查失敗時後續處理
                     LET g_fabg_m.fabg002=g_fabg_m_t.fabg002
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #add by yangxf ----
               SELECT ooag003 INTO g_fabg_m.fabg003
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = g_fabg_m.fabg002
               CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc           
               DISPLAY BY NAME g_fabg_m.fabg003_desc
               #add by yangxf ---
            END IF 
            CALL afat504_fabg001_desc(g_fabg_m.fabg002) RETURNING g_fabg_m.fabg002_desc
            DISPLAY BY NAME g_fabg_m.fabg002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg002
            #add-point:BEFORE FIELD fabg002 name="input.b.fabg002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg002
            #add-point:ON CHANGE fabg002 name="input.g.fabg002"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg002
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg002',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg003
            
            #add-point:AFTER FIELD fabg003 name="input.a.fabg003"
            IF NOT cl_null(g_fabg_m.fabg003) THEN
               IF p_cmd = 'a'  OR (g_fabg_m.fabg003 <> g_fabg_m_t.fabg003 OR cl_null(g_fabg_m_t.fabg003)) THEN            
#此段落由子樣板a19產生
                  #190906-00040#9 add---s#檢核部門的所屬法人必須與單據所屬法人相同              
                  CALL s_aapt300_department_chk(g_fabg_m.fabgcomp,g_fabg_m.fabg003) RETURNING g_sub_success,g_errno
                  IF cl_null(g_errno) THEN 
                  #190906-00040#9 add---e 
                     #校驗代值
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1=g_fabg_m.fabg003
                     #160318-00025#5--add--str
                     LET g_errshow = TRUE 
                     LET g_chkparam.err_str[1] = "aoo-00095:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
                     #160318-00025#5--add--end  
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_ooef001_14") THEN
                        #檢查成功時後續處理
                        #LET  = g_chkparam.return1
                        #DISPLAY BY NAME 
                        #add by yangxf ---
                        IF NOT cl_null(g_fabg_m.fabg002) THEN 
                           INITIALIZE g_chkparam.* TO NULL
                           #161024-00008#6---s---
                           #設定g_chkparam.*的參數
                           #LET g_chkparam.arg1 = g_fabg_m.fabg002
                           #LET g_chkparam.arg2 = g_fabg_m.fabg003
                              
                           #呼叫檢查存在並帶值的library
                           #IF cl_chk_exist("v_ooag003") THEN
                           LET g_chkparam.arg1 = g_fabg_m.fabg003
                           LET g_chkparam.arg2 = g_fabg_m.fabg004
                           IF cl_chk_exist("v_ooeg001_8") THEN
                           #161024-00008#6---e---
                           ELSE
                              #檢查失敗時後續處理
                              LET g_fabg_m.fabg003 = g_fabg_m_t.fabg003
                              CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc           
                              DISPLAY BY NAME g_fabg_m.fabg003_desc
                              NEXT FIELD CURRENT
                           END IF
                        END IF 
                        #add by yangxf ---
                     ELSE
                        #檢查失敗時後續處理
                        LET g_fabg_m.fabg003=g_fabg_m_t.fabg003
                        NEXT FIELD CURRENT
                     END IF
                  #190906-00040#9 add---s   
                  ELSE
                     #檢查失敗時後續處理
                     LET g_fabg_m.fabg003 = g_fabg_m_t.fabg003 
                     CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc      
                     DISPLAY BY NAME g_fabg_m.fabg003_desc                      
                     NEXT FIELD CURRENT
                  END IF  
                  #190906-00040#9 add---e                   
               END IF
            END IF 
            CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc           
            DISPLAY BY NAME g_fabg_m.fabg003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg003
            #add-point:BEFORE FIELD fabg003 name="input.b.fabg003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg003
            #add-point:ON CHANGE fabg003 name="input.g.fabg003"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg003
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg003',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg004
            #add-point:BEFORE FIELD fabg004 name="input.b.fabg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg004
            
            #add-point:AFTER FIELD fabg004 name="input.a.fabg004"
#            IF NOT cl_null(g_fabg_m.fabg004) THEN
#               IF p_cmd = 'a'  OR (g_fabg_m.fabg004 <> g_fabg_m_t.fabg004 OR cl_null(g_fabg_m_t.fabg004)) THEN
#                  IF NOT cl_null(l_para_data) AND g_fabg_m.fabg004<=l_para_data THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = "afa-00060"
#                     LET g_errparam.extend = g_fabg_m.fabg004
#                     LET g_errparam.popup = FALSE
#                     CALL cl_err()
#                     
#                     LET g_fabg_m.fabg004 = g_fabg_m_t.fabg004
#                     NEXT FIELD fabg004
#                  END IF
#               END IF
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg004
            #add-point:ON CHANGE fabg004 name="input.g.fabg004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg005
            #add-point:BEFORE FIELD fabg005 name="input.b.fabg005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg005
            
            #add-point:AFTER FIELD fabg005 name="input.a.fabg005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg005
            #add-point:ON CHANGE fabg005 name="input.g.fabg005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgdocno
            #add-point:BEFORE FIELD fabgdocno name="input.b.fabgdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgdocno
            
            #add-point:AFTER FIELD fabgdocno name="input.a.fabgdocno"
            #此段落由子樣板a05產生
#            IF NOT cl_null(g_fabg_m.fabgdocno) THEN
#               IF p_cmd = 'a'  OR (g_fabg_m.fabgdocno <> g_fabg_m_t.fabgdocno OR cl_null(g_fabg_m_t.fabgdocno)) THEN
#                  SELECT ooef004 INTO l_ooef004 FROM ooef_t 
#                  WHERE ooefent = g_enterprise AND ooef001 = g_fabg_m.fabgdocno
#                  SELECT oobastus INTO l_oobastus FROM ooba_t
#                   WHERE ooba001 = l_ooef004 AND ooba002 = g_fabg_m.fabgdocno AND ooba004 = 'afat504'
#                   
#                  LET g_errno = ' '
#                  CASE
#                     WHEN SQLCA.SQLCODE = 100    LET g_errno = 'abm-00066'
#                     WHEN l_oobastus = 'N'       LET g_errno = 'sub-00114'
#                  END CASE
#                  IF NOT cl_null(g_errno) THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = g_errno
#                     LET g_errparam.extend = g_fabg_m.fabgdocno
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#                     LET g_fabg_m.fabgdocno=g_fabg_m_t.fabgdocno
#                     NEXT FIELD fabgdocno
#                  END IF
#               END IF
#            END IF
            #確認資料無重複
            IF  NOT cl_null(g_fabg_m.fabgld) AND NOT cl_null(g_fabg_m.fabgdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t  OR g_fabg_m.fabgdocno != g_fabgdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM fabg_t WHERE "||"fabgent = '" ||g_enterprise|| "' AND "||"fabgld = '"||g_fabg_m.fabgld ||"' AND "|| "fabgdocno = '"||g_fabg_m.fabgdocno ||"'",'std-00004',0) THEN #160905-00007#2 count(*) --> count(1)
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

            IF NOT cl_null(g_fabg_m.fabgdocno) THEN
               #161215-00044#1---modify----begin-----------------
               #SELECT * INTO g_glaa.* 
               SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                      glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                      glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                      glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                      glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                      glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
               #161215-00044#1---modify----end-----------------
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld 
               IF NOT s_aooi200_fin_chk_slip(g_fabg_m.fabgld,g_glaa.glaa024,g_fabg_m.fabgdocno,'afat504') THEN
                  LET g_fabg_m.fabgdocno = g_fabg_m_t.fabgdocno
                  NEXT FIELD CURRENT
               END IF
               #161104-00046#22 add ------
#               CALL s_control_chk_doc('1',g_fabg_m.fabgdocno,'4',g_user,g_dept,'','') RETURNING g_sub_success,l_flag #170301-00027#8 20170303 mark by 08172
               CALL s_control_chk_doc('1',g_fabg_m.fabgdocno,'4',g_user,g_dept,g_fabg_m.fabgld,'') RETURNING g_sub_success,l_flag #170301-00027#8 20170303 add by 08172
               IF g_sub_success AND l_flag THEN
               ELSE
                  LET g_fabg_m.fabgdocno = g_fabg_m_t.fabgdocno
                  NEXT FIELD CURRENT
               END IF
               CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING g_sub_success,g_ap_slip
               #刪除單別預設temptable
               DELETE FROM s_aooi200def1
               #以目前畫面資訊新增temp資料   #請勿調整.*
               INSERT INTO s_aooi200def1 VALUES(g_fabg_m.*)
               #依單別預設取用資訊
               CALL s_aooi200def_get('','',g_fabg_m.fabgsite,'2',g_ap_slip,'','',g_fabg_m.fabgld)
               #依單別預設值TEMP內容 給予到畫面上   #請勿調整.*
               SELECT * INTO g_fabg_m.* FROM s_aooi200def1
               #161104-00046#22 add end---
            END IF
            CALL afat504_set_entry(p_cmd)         #  170823-00023#1  2017/9/05 By 09771 ADD
            CALL afat504_set_no_entry(p_cmd)      #  170823-00023#1  2017/9/05 By 09771 ADD

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgdocno
            #add-point:ON CHANGE fabgdocno name="input.g.fabgdocno"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabgdocno
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabgdocno',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgdocdt
            #add-point:BEFORE FIELD fabgdocdt name="input.b.fabgdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgdocdt
            
            #add-point:AFTER FIELD fabgdocdt name="input.a.fabgdocdt"
            #170825-00034#1  By 09505 --(s)--
            IF NOT cl_null(g_fabg_m.fabgdocdt) THEN
               SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                      glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                      glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                      glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                      glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                      glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
               #161215-00044#1---modify----end----------------- 
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooab001 = 'S-FIN-9003'
                  AND ooabsite = g_glaa.glaacomp 
                 IF g_fabg_m.fabgdocdt <= l_ooab002 THEN 
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'afa-00060'
                    LET g_errparam.extend = ''
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
   
                    LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
                    NEXT FIELD fabgdocdt
                 END IF
                 #170825-00034#1  By 09505 --(e)--
               IF p_cmd = 'a'  OR (g_fabg_m.fabgdocdt <> g_fabg_m_t.fabgdocdt OR cl_null(g_fabg_m_t.fabgdocdt)) THEN
                  IF NOT cl_null(l_para_data) AND g_fabg_m.fabgdocdt<=l_para_data THEN  #20141119 <--><=
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "afa-00060"
                     LET g_errparam.extend = g_fabg_m.fabgdocdt
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     
                     LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
                     NEXT FIELD fabgdocdt
                  END IF
               
                  #20141213 add by chenying
                  #现行年月检查
                  CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9018') RETURNING l_year
                  CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9019') RETURNING l_month
                  #180326-00032#1 By 09505 mark --(S)--
#                  IF l_year <> YEAR(g_fabg_m.fabgdocdt) OR l_month <> MONTH(g_fabg_m.fabgdocdt) THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = 'afa-00283'
#                     LET g_errparam.extend = ''
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#                     LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
#                     NEXT FIELD fabgdocdt
#                  END IF
#                  #20141213 add by chenying              
                  #180326-00032#1 By 09505 mark --(E)--   
                  #180326-00032#1 By 09505 add --(S)--
                  LET l_date = MDY(l_month,1,l_year)
                  CALL s_date_get_last_date(l_date) RETURNING l_date2
                  IF g_fabg_m.fabgdocdt < l_date  THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'afa-00480'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
                     NEXT FIELD fabgdocdt
                  ELSE
                     IF p_cmd = 'u' THEN
                        LET l_cnt = 0
                        #180503-00018#1 mark --(S)--
#                        SELECT count(1) INTO l_cnt FROM fabh_t
#                         WHERE fabhent = g_enterprise
#                           AND fabhld  = g_fabg_m.fabgld
#                           AND fabhdocno = g_fabg_m.fabgdocno
                        #180503-00018#1 mark  --(E)--
                        #180503-00018#1 add   --(S)--
                        SELECT count(1) INTO l_cnt FROM fabo_t
                         WHERE faboent = g_enterprise
                           AND fabold  = g_fabg_m.fabgld
                           AND fabodocno = g_fabg_m.fabgdocno
                        #180503-00018#1 add   --(E)--
                        IF l_cnt <> 0 THEN  
                           IF g_fabg_m.fabgdocdt > l_date2  THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'afa-00481'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                           END IF
                        END IF
                     END IF
                  END IF
                  #180326-00032#1 By 09505 add --(E)--                  
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgdocdt
            #add-point:ON CHANGE fabgdocdt name="input.g.fabgdocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg006
            
            #add-point:AFTER FIELD fabg006 name="input.a.fabg006"
            CALL cl_set_comp_entry('fabg016',TRUE)   #170112-00040#1 add by 08172
            IF NOT cl_null(g_fabg_m.fabg006) THEN
               IF p_cmd = 'a'  OR (g_fabg_m.fabg006 <> g_fabg_m_t.fabg006 OR cl_null(g_fabg_m_t.fabg006)) THEN            
#此段落由子樣板a19產生
                  #校驗代值
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_fabg_m.fabg006
                  #160318-00025#5--add--str
                  LET g_errshow = TRUE 
                  LET g_chkparam.err_str[1] = "apm-00201:sub-01302|axmm200|",cl_get_progname("axmm200",g_lang,"2"),"|:EXEPROGaxmm200"
                  #160318-00025#5--add--end
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_pmaa001_7") THEN    #160913-00017#1 mod v_pmaa001_10 -> v_pmaa001_7
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                     
                     #170524-00099#1-----add-----str
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_fabg_m.fabgsite
                     LET g_chkparam.arg2 = g_fabg_m.fabg006
                     LET g_errshow = TRUE 
                     LET g_chkparam.err_str[1] = "ais-00056:sub-01302|apmm102|",cl_get_progname("apmm102",g_lang,"2"),"|:EXEPROGaapmm102"
                     IF NOT cl_chk_exist("v_pmab001") THEN 
                        #axmm202中不存在
                        LET g_fabg_m.fabg006 = g_fabg_m_t.fabg006
                        NEXT FIELD CURRENT
                     END IF
                     #170524-00099#1-----add-----end
                     
                     #161017-00023#1--add--str--lujh
                     IF NOT s_control_check_customer(g_fabg_m.fabg006,'2',g_site,g_user,g_dept,'') THEN
                        LET g_fabg_m.fabg006 = g_fabg_m_t.fabg006
                        CALL afat504_fabg006_desc(g_fabg_m.fabg006) RETURNING g_fabg_m.fabg006_desc  
                        DISPLAY BY NAME g_fabg_m.fabg006_desc
                        NEXT FIELD CURRENT
		    	         END IF
		    	         #161017-00023#1--add--end--lujh
		    	         CALL s_fin_get_wc_str(g_glaa.glaacomp) RETURNING g_sqlcomp  #200813-00026#1 add
		    	         CALL s_control_get_supplier_sql_pmab('2',g_site,g_user,g_dept,'',g_sqlcomp) RETURNING g_sub_success,g_sql_ctrl1  #180123-00057#1 add
		    	         #170420-00007#1-----s
                     LET l_cnt = 0
                     LET l_sql = "SELECT COUNT(1) FROM pmaa_t WHERE pmaaent = ",g_enterprise," AND pmaa001 ='",g_fabg_m.fabg006,"' AND ",g_sql_ctrl1
                     PREPARE fmbg006pre FROM l_sql
                     EXECUTE fmbg006pre INTO l_cnt
                     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'axr-01047'
                        LET g_errparam.extend = g_fabg_m.fabg006 
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD CURRENT
                     END IF
                     #170420-00007#1-----e
                     #171201-00004#1--add--s--xul
                     SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = g_fabg_m.fabg006 
                     IF l_pmaa004 = '2' THEN   #一次性交易對象
                        CALL apmi004_01('1',g_fabg_m.fabg021,g_fabg_m.fabg006,g_fabg_m.fabgdocno) RETURNING g_fabg_m.fabg021
                     END IF
                     IF l_pmaa004 = '4' THEN   #內部員工
                        CALL apmi004_01('2',g_fabg_m.fabg021,g_fabg_m.fabg006,g_fabg_m.fabgdocno) RETURNING g_fabg_m.fabg021
                     END IF
                     #171201-00004#1--add--s--xul
                     #從交易對象稅務基本資料檔中撈取慣用銷項稅別
                     IF cl_null(g_fabg_m.fabg013) THEN
#                        SELECT isak002 INTO g_fabg_m.fabg013 FROM isak_t
#                         WHERE isakent=g_enterprise AND isaksite=g_fabg_m.fabgcomp AND isak001=g_fabg_m.fabg006
#                        
#                        SELECT oodb006 INTO g_fabg_m.fabg014 FROM oodb_t
#                         WHERE oodbent=g_enterprise AND oodb001=g_ooef019 AND oodb002=g_fabg_m.fabg013

                        CALL s_apmm101_sel_pmab(g_fabg_m.fabgcomp,g_fabg_m.fabg006,'pmab083|pmab084')
                         RETURNING l_success,g_errno,g_fabg_m.fabg015,g_fabg_m.fabg013
                        #170112-00040#1 -s add by 08172
                        IF g_fabg_m.fabg015 = g_glaa.glaa001 THEN
                           LET g_fabg_m.fabg016 = 1
                           CALL cl_set_comp_entry('fabg016',FALSE)
                        ELSE
                           CALL cl_set_comp_entry('fabg016',TRUE)
                        END IF
                        #170112-00040#1 -e add by 08172
                        CALL s_tax_chk(g_fabg_m.fabgcomp,g_fabg_m.fabg013)
                           RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                        IF l_success=FALSE THEN
                           LET g_fabg_m.fabg013 = g_fabg_m_t.fabg013
                          #NEXT FIELD fabg013
                        END IF
                        LET g_fabg_m.fabg014=l_oodb006
                        DISPLAY BY NAME g_fabg_m.fabg014
                        DISPLAY BY NAME g_fabg_m.fabg013,g_fabg_m.fabg015
                        DISPLAY BY NAME g_fabg_m.fabg016    #170112-00040#1 add by 08172
                        
                        ########################################
                        IF p_cmd = 'u' THEN
                           UPDATE fabh_t SET fabh031=g_fabg_m.fabg013
                            WHERE fabhld=g_fabg_m.fabgld AND fabhdocno=g_fabg_m.fabgdocno AND fabhent=g_enterprise
                        END IF
                        ########################################
                     END IF
                  ELSE
                     #檢查失敗時後續處理
                     LET g_fabg_m.fabg006 = g_fabg_m_t.fabg006
                     NEXT FIELD CURRENT
                  END IF
                  
                  #170921-00026#1 add(s)
                  CALL afat504_fabg006_desc(g_fabg_m.fabg006) RETURNING g_fabg_m.fabg006_desc   
                  DISPLAY BY NAME g_fabg_m.fabg006_desc
                  #收款客戶   
                  LET g_fabg_m.fabg007 = ''                                      #171017-00037#1 add 
                  SELECT pmac002 INTO g_fabg_m.fabg007 FROM pmac_t
                   #WHERE pmacent = g_enterprise AND pmac001 = p_xrca004         #171017-00037#1 mark
                   WHERE pmacent = g_enterprise AND pmac001 = g_fabg_m.fabg006   #171017-00037#1 add                    
                     AND pmac003 = '1' AND pmac004 = 'Y' AND pmacstus = 'Y'
                  IF cl_null(g_fabg_m.fabg007) THEN
                     LET g_fabg_m.fabg007=g_fabg_m.fabg006
                     LET g_fabg_m.fabg007_desc=g_fabg_m.fabg006_desc
                     DISPLAY BY NAME g_fabg_m.fabg007,g_fabg_m.fabg007_desc
                  END IF
                  #170921-00026#1 add(e)
                  CALL afat504_fabg006_desc(g_fabg_m.fabg007) RETURNING g_fabg_m.fabg007_desc    #171017-00037#1 add
                  DISPLAY BY NAME g_fabg_m.fabg007_desc                                          #171017-00037#1 add
               END IF
               
            END IF
            #171201-00004#1--add--s--xul
            #一次性交易对象
            IF cl_null(g_fabg_m.fabg006) THEN
               LET g_fabg_m.fabg021 = ''
            END IF
            IF NOT cl_null(g_fabg_m.fabg021) THEN              
               CALL s_axrt300_xrca_ref('xrca057',g_fabg_m.fabg006,g_fabg_m.fabg021,'') RETURNING l_success,g_fabg_m.fabg006_desc 
               IF g_fabg_m.fabg006 = g_fabg_m.fabg007 THEN
                  LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
                  DISPLAY BY NAME g_fabg_m.fabg007_desc
               END IF
               DISPLAY BY NAME g_fabg_m.fabg006_desc
            END IF
            #171201-00004#1--add--e--xul
            #170921-00026#1 mark(s)
            #CALL afat504_fabg006_desc(g_fabg_m.fabg006) RETURNING g_fabg_m.fabg006_desc  
                    
            #DISPLAY BY NAME g_fabg_m.fabg006_desc
            #IF cl_null(g_fabg_m.fabg007) THEN        #170412-00050#1 mark xul
            #   LET g_fabg_m.fabg007=g_fabg_m.fabg006
            #   LET g_fabg_m.fabg007_desc=g_fabg_m.fabg006_desc
            #   DISPLAY BY NAME g_fabg_m.fabg007,g_fabg_m.fabg007_desc
            #END IF  #170412-00050#1 mark xul
            #170921-00026#1 mark(e)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg006
            #add-point:BEFORE FIELD fabg006 name="input.b.fabg006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg006
            #add-point:ON CHANGE fabg006 name="input.g.fabg006"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg006
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg006',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg007
            
            #add-point:AFTER FIELD fabg007 name="input.a.fabg007"
            IF NOT cl_null(g_fabg_m.fabg007) THEN
               IF p_cmd = 'a'  OR (g_fabg_m.fabg007 <> g_fabg_m_t.fabg007 OR cl_null(g_fabg_m_t.fabg007)) THEN
                  #CALL afat504_fabg007_chk()      #170921-00026#1 mark
                  #171017-00037#1---s--- mark
                  ##170921-00026#1 add(s)
                  #IF g_fabg_m.fabg006<>g_fabg_m.fabg007 THEN
                  #   CALL afat504_fabg007_chk()
                  #END IF
                  ##170921-00026#1 add(e)
                  #IF NOT cl_null(g_errno) THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = g_errno
                  #   LET g_errparam.extend = g_fabg_m.fabg007
                  #   #160318-00005#11   --add--str
                  #   LET g_errparam.replace[1] ='apmm100'
                  #   LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                  #   LET g_errparam.exeprog    ='apmm100'
                  #   #160318-00005#11  --add--end
                  #   LET g_errparam.popup = FALSE
                  #   CALL cl_err()
                  #   
                  #   LET g_fabg_m.fabg007 = g_fabg_m_t.fabg007
                  #   NEXT FIELD fabg007
                  #END IF
                  #171017-00037#1---e---
                  #170524-00099#1-----add-----str
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_fabg_m.fabgsite
                  LET g_chkparam.arg2 = g_fabg_m.fabg007
                  LET g_errshow = TRUE 
                  LET g_chkparam.err_str[1] = "ais-00056:sub-01302|apmm102|",cl_get_progname("apmm102",g_lang,"2"),"|:EXEPROGaapmm102"
                  IF NOT cl_chk_exist("v_pmab001") THEN 
                     #交易对象据点档中不存在
                     LET g_fabg_m.fabg007 = g_fabg_m_t.fabg007
                     NEXT FIELD fabg007
                  END IF
                  #170524-00099#1-----add-----end
                  CALL s_fin_get_wc_str(g_glaa.glaacomp) RETURNING g_sqlcomp  #200813-00026#1 add
                  CALL s_control_get_supplier_sql_pmab('2',g_site,g_user,g_dept,'',g_sqlcomp) RETURNING g_sub_success,g_sql_ctrl1  #180123-00057#1 add
                  #170420-00007#1-----s
                  LET l_cnt = 0
                  LET l_sql = "SELECT COUNT(1) FROM pmaa_t WHERE pmaaent = ",g_enterprise," AND pmaa001 ='",g_fabg_m.fabg007,"' AND ",g_sql_ctrl1
                  PREPARE fmbg007pre FROM l_sql
                  EXECUTE fmbg007pre INTO l_cnt
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-01047'
                     LET g_errparam.extend = g_fabg_m.fabg007
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabg_m.fabg007 = g_fabg_m_t.fabg007
                     NEXT FIELD CURRENT
                  END IF
                  #170420-00007#1-----e
                  #171017-00037#1 ---s---
                  CALL s_aapt300_partner_chk(g_fabg_m.fabg006,g_fabg_m.fabg007) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabg_m.fabg007 = g_fabg_m_t.fabg007
                     CALL s_desc_get_trading_partner_abbr_desc(g_fabg_m_t.fabg007) RETURNING g_fabg_m.fabg007_desc
                     IF g_fabg_m.fabg007 = g_fabg_m.fabg006 THEN
                        LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
                     END IF
                     DISPLAY BY NAME g_fabg_m.fabg007_desc
                     NEXT FIELD CURRENT
                  END IF                  
                  #171017-00037#1 ---e---                                                      
               END IF
            END IF
            CALL afat504_fabg006_desc(g_fabg_m.fabg007) RETURNING g_fabg_m.fabg007_desc
            #171201-00004#1--add--s--xul
            IF g_fabg_m.fabg006 = g_fabg_m.fabg007 THEN
               LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
            END IF
            #171201-00004#1--add--e--xul
            DISPLAY BY NAME g_fabg_m.fabg007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg007
            #add-point:BEFORE FIELD fabg007 name="input.b.fabg007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg007
            #add-point:ON CHANGE fabg007 name="input.g.fabg007"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg007
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg007',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg021
            #add-point:BEFORE FIELD fabg021 name="input.b.fabg021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg021
            
            #add-point:AFTER FIELD fabg021 name="input.a.fabg021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg021
            #add-point:ON CHANGE fabg021 name="input.g.fabg021"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg021
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg021',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg013
            
            #add-point:AFTER FIELD fabg013 name="input.a.fabg013"
            IF NOT cl_null(g_fabg_m.fabg013) THEN 
               IF p_cmd = 'a'  OR (g_fabg_m.fabg013 <> g_fabg_m_t.fabg013 OR cl_null(g_fabg_m_t.fabg013)) THEN
                  CALL s_tax_chk(g_fabg_m.fabgcomp,g_fabg_m.fabg013)
                  RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                  IF l_success=FALSE THEN
                     LET g_fabg_m.fabg013 = g_fabg_m_t.fabg013
                     NEXT FIELD fabg013
                  END IF
                  LET g_fabg_m.fabg014=l_oodb006
                  DISPLAY BY NAME g_fabg_m.fabg014
               END IF
               #160920-00025#1--add--s--
               IF g_fabg_m.fabg013 <> g_fabg_m_t.fabg013 THEN
                  CALL afat504_tax_upd()
               END IF                
               #160920-00025#1--add--e--
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg013
            #add-point:BEFORE FIELD fabg013 name="input.b.fabg013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg013
            #add-point:ON CHANGE fabg013 name="input.g.fabg013"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg013
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg013',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg014
            #add-point:BEFORE FIELD fabg014 name="input.b.fabg014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg014
            
            #add-point:AFTER FIELD fabg014 name="input.a.fabg014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg014
            #add-point:ON CHANGE fabg014 name="input.g.fabg014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg015
            
            #add-point:AFTER FIELD fabg015 name="input.a.fabg015"
            CALL cl_set_comp_entry('fabg016',TRUE)   #170112-00040#1 add by 08172
            IF NOT cl_null(g_fabg_m.fabg015) THEN 
               IF p_cmd = 'a'  OR (g_fabg_m.fabg015 <> g_fabg_m_t.fabg015 OR cl_null(g_fabg_m_t.fabg015)) THEN
#此段落由子樣板a19產生
                  #校驗代值
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_fabg_m.fabg015
                  #160318-00025#5--add--str
                  LET g_errshow = TRUE 
                  LET g_chkparam.err_str[1] = "aoo-00011:sub-01302|aooi140|",cl_get_progname("aooi140",g_lang,"2"),"|:EXEPROGaooi140"
                  #160318-00025#5--add--end
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooai001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  ELSE
                     #檢查失敗時後續處理
                     LET g_fabg_m.fabg015 = g_fabg_m_t.fabg015
                     NEXT FIELD CURRENT
                  END IF
                  
                  #170322-00011#2-----s
                  LET lc_param.apca004 = g_fabg_m.fabg006
                  LET ls_js = util.JSON.stringify(lc_param)
                  CALL s_fin_get_curr_rate(g_fabg_m.fabgcomp,g_fabg_m.fabgld,g_fabg_m.fabgdocdt,g_fabg_m.fabg015,ls_js)
                          RETURNING g_fabg_m.fabg016,l_apca121,l_apca131
                  DISPLAY BY NAME g_fabg_m.fabg016
                  #170322-00011#2-----e
                  
                  
               END IF
               #170112-00040#1 -s add by 08172
               IF g_fabg_m.fabg015 = g_glaa.glaa001 THEN
                  LET g_fabg_m.fabg016 = 1
                  CALL cl_set_comp_entry('fabg016',FALSE)
               ELSE
                  CALL cl_set_comp_entry('fabg016',TRUE)
               END IF
               IF p_cmd = 'u' AND (g_fabg_m.fabg015 <> g_fabg_m_t.fabg015 OR cl_null(g_fabg_m_t.fabg015)) THEN
                  CALL afat504_rate_upd()
               END IF
               #170112-00040#1 -e add by 08172
            END IF 
            LET g_fabg_m_t.fabg015 = g_fabg_m.fabg015  #170112-00040#1 add by 08172
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg015
            #add-point:BEFORE FIELD fabg015 name="input.b.fabg015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg015
            #add-point:ON CHANGE fabg015 name="input.g.fabg015"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg015
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg015',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg016
            #add-point:BEFORE FIELD fabg016 name="input.b.fabg016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg016
            
            #add-point:AFTER FIELD fabg016 name="input.a.fabg016"
            #170112-00040#1 -s add by 08172
            IF p_cmd = 'u' AND (g_fabg_m.fabg016 <> g_fabg_m_t.fabg016 OR cl_null(g_fabg_m_t.fabg016)) THEN
               CALL afat504_rate_upd()
            END IF
            LET g_fabg_m_t.fabg016 = g_fabg_m.fabg016
            #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg016
            #add-point:ON CHANGE fabg016 name="input.g.fabg016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg008
            #add-point:BEFORE FIELD fabg008 name="input.b.fabg008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg008
            
            #add-point:AFTER FIELD fabg008 name="input.a.fabg008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg008
            #add-point:ON CHANGE fabg008 name="input.g.fabg008"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabg_m.fabg008
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabg008',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabg011
            #add-point:BEFORE FIELD fabg011 name="input.b.fabg011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabg011
            
            #add-point:AFTER FIELD fabg011 name="input.a.fabg011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabg011
            #add-point:ON CHANGE fabg011 name="input.g.fabg011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabgstus
            #add-point:BEFORE FIELD fabgstus name="input.b.fabgstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabgstus
            
            #add-point:AFTER FIELD fabgstus name="input.a.fabgstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabgstus
            #add-point:ON CHANGE fabgstus name="input.g.fabgstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.fabgsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgsite
            #add-point:ON ACTION controlp INFIELD fabgsite name="input.c.fabgsite"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabgsite             #給予default值
            LET g_qryparam.where = " ooef207 = 'Y' "
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            #CALL q_ooef001()                                #呼叫開窗
            CALL q_ooef001_47()                                         #161024-00008#4 

            LET g_fabg_m.fabgsite = g_qryparam.return1              

            DISPLAY g_fabg_m.fabgsite TO fabgsite              #
            CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
            DISPLAY BY NAME g_fabg_m.fabgsite_desc
            NEXT FIELD fabgsite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg001
            #add-point:ON ACTION controlp INFIELD fabg001 name="input.c.fabg001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg001             #給予default值
            #170606-00033#8 add-s
            LET g_qryparam.where = "(ooag004 IN (SELECT ooef001 FROM ooef_t 
                                                WHERE ooefent=",g_enterprise, 
                                                " AND ooef017 IN (SELECT ooef017 FROM ooef_t 
                                                                    WHERE ooefent=",g_enterprise, 
                                                                    " AND ooef001='",g_site,"')
                                                  AND ooef201='Y'
                                                )
                                     OR ooag004='ALL')"
                                                
            #170606-00033#8 add-e
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_fabg_m.fabg001 = g_qryparam.return1              

            DISPLAY g_fabg_m.fabg001 TO fabg001              #
            CALL afat504_fabg001_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
            DISPLAY BY NAME g_fabg_m.fabg001_desc
            NEXT FIELD fabg001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabgld
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgld
            #add-point:ON ACTION controlp INFIELD fabgld name="input.c.fabgld"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabgld             #給予default值
#20141111 add--str--
            #取得资产組織下所屬成員
            CALL s_fin_account_center_sons_query('5',g_fabg_m.fabgsite,g_fabg_m.fabgdocdt,'1')
            #取得资产中心下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING l_origin_str
            #將取回的字串轉換為SQL條件
            CALL afat504_change_to_sql(l_origin_str) RETURNING l_origin_str  
            
            LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN (",l_origin_str," )"

#20141111 add--end--
            #給予arg
            LET g_qryparam.arg1 = g_user #
            LET g_qryparam.arg2 = g_dept #
            
            CALL q_authorised_ld()                                #呼叫開窗

            LET g_fabg_m.fabgld = g_qryparam.return1              

            DISPLAY g_fabg_m.fabgld TO fabgld              #
            CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
            DISPLAY BY NAME g_fabg_m.fabgld_desc
            NEXT FIELD fabgld                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabgcomp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgcomp
            #add-point:ON ACTION controlp INFIELD fabgcomp name="input.c.fabgcomp"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg002
            #add-point:ON ACTION controlp INFIELD fabg002 name="input.c.fabg002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_fabg_m.fabg002 = g_qryparam.return1              

            DISPLAY g_fabg_m.fabg002 TO fabg002              #
            CALL afat504_fabg001_desc(g_fabg_m.fabg002) RETURNING g_fabg_m.fabg002_desc
            DISPLAY BY NAME g_fabg_m.fabg002_desc
            NEXT FIELD fabg002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg003
            #add-point:ON ACTION controlp INFIELD fabg003 name="input.c.fabg003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg003             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = "" #

            
            #LET g_qryparam.arg1 = g_fabg_m.fabg004                  #161024-00008#6    #190906-00040#9 mark
            LET g_qryparam.arg1 = g_fabg_m.fabgcomp     #法人組織   #190906-00040#9 add
            LET g_qryparam.arg2 = g_fabg_m.fabg004                  #190906-00040#9 add
            #CALL q_ooef001_9()                                     #呼叫開窗161024-00008#6
            #CALL q_ooeg001_4()                                      #161024-00008#6        #170814-00012#35  170906 By 10044 mark
            #CALL q_ooeg001()                                                                #170814-00012#35  170906 By 10044 add    #190906-00040#9 mark   
            CALL q_ooeg001_25()         #190906-00040#9 add

            LET g_fabg_m.fabg003 = g_qryparam.return1              

            DISPLAY g_fabg_m.fabg003 TO fabg003              #
            CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc
            DISPLAY BY NAME g_fabg_m.fabg003_desc
            NEXT FIELD fabg003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg004
            #add-point:ON ACTION controlp INFIELD fabg004 name="input.c.fabg004"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg005
            #add-point:ON ACTION controlp INFIELD fabg005 name="input.c.fabg005"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabgdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabgdocno
            #add-point:ON ACTION controlp INFIELD fabgdocno name="input.c.fabgdocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_fabg_m.fabgdocno
#            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001=g_fabg_m.fabgcomp
#            LET g_qryparam.arg1 = l_ooef004 #
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                   glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                   glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                   glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                   glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                   glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            #161215-00044#1---modify----end----------------- 
              FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld 
            LET g_qryparam.arg1 = g_glaa.glaa024 #
            #LET g_qryparam.arg2 = "afat504" #   #160705-00042#1 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#1 160711 by sakura add
            #161104-00046#22 add ------
            IF NOT cl_null(g_user_slip_wc)THEN
               LET g_qryparam.where = g_user_slip_wc
            END IF
            #161104-00046#22 add end---
            CALL q_ooba002_1()
            LET g_fabg_m.fabgdocno = g_qryparam.return1
            DISPLAY g_fabg_m.fabgdocno TO fabgdocno
            NEXT FIELD fabgdocno
            #END add-point
 
 
         #Ctrlp:input.c.fabgdocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgdocdt
            #add-point:ON ACTION controlp INFIELD fabgdocdt name="input.c.fabgdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg006
            #add-point:ON ACTION controlp INFIELD fabg006 name="input.c.fabg006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg006             #給予default值
            
            #170420-00007#1 mark-----s
            ##161017-00023#1--add--str--lujh
            #IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
            #   LET g_qryparam.where = g_qryparam.where CLIPPED," AND ",g_sql_ctrl
            #END IF
            ##161017-00023#1--add--end--lujh
            #170420-00007#1 mark-----e
            #170420-00007#1-----s
            IF NOT cl_null(g_sql_ctrl1) AND NOT g_sql_ctrl1 = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED," ",g_sql_ctrl1
            END IF
            #170420-00007#1-----e

            # CALL q_pmaa001()   #160913-00017#1  mark                  #呼叫開窗
            #160913-00017#1--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#1--ADD(E)- 

            LET g_fabg_m.fabg006 = g_qryparam.return1              

            DISPLAY g_fabg_m.fabg006 TO fabg006              #
            CALL afat504_fabg006_desc(g_fabg_m.fabg006) RETURNING g_fabg_m.fabg006_desc
            DISPLAY BY NAME g_fabg_m.fabg006_desc
            NEXT FIELD fabg006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg007
            #add-point:ON ACTION controlp INFIELD fabg007 name="input.c.fabg007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg007             #給予default值
            LET g_qryparam.default2 = "" #g_fabg_m.pmac002 #交易夥伴編號
            #170420-00007#1 mark-----s
            ##161017-00023#1--add--str--lujh
            #IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
            #   LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
            #                          "          WHERE pmaaent = ",g_enterprise,
            #                          "            AND ",g_sql_ctrl,
            #                          "            AND pmaaent = pmacent ",                                   
            #                          "            AND pmaa001 = pmac002 )"
            #   END IF
            ##161017-00023#1--add--end--lujh
            #170420-00007#1 mark-----e
            #171017-00037#1---s---
            LET l_cnt = 0
            SELECT COUNT (1) INTO l_cnt FROM pmac_t WHERE pmacent = g_enterprise AND pmac001 = g_fabg_m.fabg006
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt = 0 THEN
               LET g_qryparam.where = " pmaa001 = '",g_fabg_m.fabg006,"' "
               LET g_qryparam.arg1="('2','3')"
               CALL q_pmaa001_1()
            ELSE            
            #171017-00037#1---e---
               #170420-00007#1-----s
               IF NOT cl_null(g_sql_ctrl1) AND NOT g_sql_ctrl1 = ' 1=1'  THEN
                  LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                         "          WHERE pmaaent = ",g_enterprise,
                                         "            AND ",g_sql_ctrl1,
                                         "            AND pmaaent = pmacent ",                                   
                                         "            AND pmaa001 = pmac002 )"
                  END IF
               #170420-00007#1-----e
               #給予arg
               LET g_qryparam.arg1 = g_fabg_m.fabg006
               LET g_qryparam.arg2 = "1"  
               
               CALL q_pmac002_1()                                #呼叫開窗
            END IF #171017-00037#1 add
            LET g_fabg_m.fabg007 = g_qryparam.return1              
            #LET g_fabg_m.pmac002 = g_qryparam.return2 
            DISPLAY g_fabg_m.fabg007 TO fabg007              #
            #DISPLAY g_fabg_m.pmac002 TO pmac002 #交易夥伴編號
            CALL afat504_fabg006_desc(g_fabg_m.fabg007) RETURNING g_fabg_m.fabg007_desc
            DISPLAY BY NAME g_fabg_m.fabg007_desc
            NEXT FIELD fabg007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg021
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg021
            #add-point:ON ACTION controlp INFIELD fabg021 name="input.c.fabg021"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg013
            #add-point:ON ACTION controlp INFIELD fabg013 name="input.c.fabg013"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg013             #給予default值
            LET g_qryparam.default2 = "" #g_fabg_m.oodb002 #稅別代碼
            LET g_qryparam.default3 = "" #g_fabg_m.oodb005 #含稅否
            LET g_qryparam.default4 = "" #g_fabg_m.oodb006 #稅率
            #給予arg
            LET g_qryparam.arg1 = g_ooef019 #

            
            CALL q_oodb002_5()                                #呼叫開窗

            LET g_fabg_m.fabg013 = g_qryparam.return1              
            #LET g_fabg_m.oodb002 = g_qryparam.return2 
            #LET g_fabg_m.oodb005 = g_qryparam.return3 
            #LET g_fabg_m.oodb006 = g_qryparam.return4 
            DISPLAY g_fabg_m.fabg013 TO fabg013              #
            #DISPLAY g_fabg_m.oodb002 TO oodb002 #稅別代碼
            #DISPLAY g_fabg_m.oodb005 TO oodb005 #含稅否
            #DISPLAY g_fabg_m.oodb006 TO oodb006 #稅率
            NEXT FIELD fabg013                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg014
            #add-point:ON ACTION controlp INFIELD fabg014 name="input.c.fabg014"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabg015
            #add-point:ON ACTION controlp INFIELD fabg015 name="input.c.fabg015"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabg_m.fabg015             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooai001()                                #呼叫開窗

            LET g_fabg_m.fabg015 = g_qryparam.return1              

            DISPLAY g_fabg_m.fabg015 TO fabg015              #

            NEXT FIELD fabg015                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.fabg016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg016
            #add-point:ON ACTION controlp INFIELD fabg016 name="input.c.fabg016"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg008
            #add-point:ON ACTION controlp INFIELD fabg008 name="input.c.fabg008"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabg011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabg011
            #add-point:ON ACTION controlp INFIELD fabg011 name="input.c.fabg011"
            
            #END add-point
 
 
         #Ctrlp:input.c.fabgstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabgstus
            #add-point:ON ACTION controlp INFIELD fabgstus name="input.c.fabgstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_fabg_m.fabgld,g_fabg_m.fabgdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            #170825-00034#1   By 09505  Add --(S)--
            IF NOT cl_null(g_fabg_m.fabgdocdt) THEN 
               #單據日期不能小於關賬日期
               SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                      glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                      glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                      glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                      glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                      glaa140,glaa123,glaa124,glaa028 INTO g_glaa.*              
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
               #S-FIN-9003
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooab001 = 'S-FIN-9003'
                  AND ooabsite = g_glaa.glaacomp
              IF g_fabg_m.fabgdocdt <= l_ooab002 THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'afa-00060'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                #  170823-00023#1  2017/9/05 By 09771--s 
                 IF g_dfin0033 = "Y" THEN
                    NEXT FIELD fabgdocdt   
                 ELSE 
                    NEXT FIELD fabgdocno  
                 END IF 
                #  170823-00023#1  2017/9/05 By 09771--e
                 LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
               #  NEXT FIELD fabgdocdt      #  170823-00023#1  2017/9/05 By 09771  mark
              END IF
              IF NOT cl_null(g_fabg_m.fabgdocdt) THEN 
                 IF NOT s_afat503_sys_chk(g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN
                    LET g_fabg_m.fabgdocdt = g_fabg_m_t.fabgdocdt
                    #  170823-00023#1  2017/9/05 By 09771--s 
                  IF g_dfin0033 = "Y" THEN
                       NEXT FIELD fabgdocdt   
                    ELSE 
                       NEXT FIELD fabgdocno  
                    END IF
                   #  170823-00023#1  2017/9/05 By 09771--e
                  #  NEXT FIELD fabgdocdt        #  170823-00023#1  2017/9/05 By 09771   mark 
                    NEXT FIELD fabgdocdt
                 END IF
              END IF
            END IF 
            #170825-00034#1   By 09505  Add --(E)--
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               
               CALL s_aooi200_fin_gen_docno(g_fabg_m.fabgld,'','',g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_prog)
               RETURNING l_success,g_fabg_m.fabgdocno
               IF l_success  = 0  THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_fabg_m.fabgdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD fabgdocno
               END IF
               DISPLAY BY NAME g_fabg_m.fabgdocno
               #171201-00004#1--add--s--xul
               IF cl_null(g_fabg_m.fabg021) THEN 
                  LET g_fabg_m.fabg021 = g_fabg_m.fabg006    #交易識別碼=帳款對象
                  DISPLAY BY NAME g_fabg_m.fabg021
               END IF
               #供应商的一次交易对象或内部员工时，单头新增后，需更新pmak中的参考单号为单头完整单号
               UPDATE pmak_t SET pmak006 = g_fabg_m.fabgdocno WHERE pmakent = g_enterprise AND pmak001 = g_fabg_m.fabg021
               #171201-00004#1--add--e--xul
               #end add-point
               
               #190412-00022 ---start---
               #資料所有者與資料所有部門改為呼叫FUNCTION取得
               LET lp_js = util.JSON.stringify(g_fabg_m)
               CALL cl_auth_belong_data(lp_js,"fabg_t") RETURNING g_fabg_m.fabgownid,g_fabg_m.fabgowndp
               #190412-00022 --- end ---
 
               INSERT INTO fabg_t (fabgent,fabgsite,fabg001,fabgld,fabgcomp,fabg002,fabg003,fabg004,fabg005,fabgdocno,fabgdocdt,fabg006,fabg007,fabg021,fabg013,fabg014,fabg015,fabg016,fabg008,fabg011,fabgstus,fabgownid,fabgowndp,fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid, 
                   fabgpstdt)
               VALUES (g_enterprise,g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015, 
                   g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_fabg_m:",SQLERRMESSAGE 
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
               IF cl_ask_conf("afa-00132") THEN
                  #CALL s_afat500()
               END IF
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL afat504_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL afat504_b_fill()
                  CALL afat504_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               LET p_cmd = 'u'
               CALL afat504_set_entry(p_cmd)
               CALL afat504_set_no_entry(p_cmd)
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               #171201-00004#1--add--s--xul
               IF cl_null(g_fabg_m.fabg021) THEN 
                  LET g_fabg_m.fabg021 = g_fabg_m.fabg006    #交易識別碼=帳款對象
                  DISPLAY BY NAME g_fabg_m.fabg021
               END IF
               #供应商的一次交易对象或内部员工时，单头新增后，需更新pmak中的参考单号为单头完整单号
               UPDATE pmak_t SET pmak006 = g_fabg_m.fabgdocno WHERE pmakent = g_enterprise AND pmak001 = g_fabg_m.fabg021
               #171201-00004#1--add--e--xul
               #end add-point
               
               #將遮罩欄位還原
               CALL afat504_fabg_t_mask_restore('restore_mask_o')
               
               UPDATE fabg_t SET (fabgsite,fabg001,fabgld,fabgcomp,fabg002,fabg003,fabg004,fabg005,fabgdocno,fabgdocdt,fabg006,fabg007,fabg021,fabg013,fabg014,fabg015,fabg016,fabg008,fabg011,fabgstus,fabgownid,fabgowndp,fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid, 
                   fabgpstdt) = (g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015, 
                   g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstdt)
                WHERE fabgent = g_enterprise AND fabgld = g_fabgld_t
                  AND fabgdocno = g_fabgdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "fabg_t:",SQLERRMESSAGE 
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
               CALL afat504_fabg_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_fabg_m_t)
               LET g_log2 = util.JSON.stringify(g_fabg_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_fabgld_t = g_fabg_m.fabgld
            LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="afat504.input.body" type="s" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_fabo_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_afat440_01
            LET g_action_choice="open_afat440_01"
            IF cl_auth_chk_act("open_afat440_01") THEN
               
               #add-point:ON ACTION open_afat440_01 name="input.detail_input.page1.open_afat440_01"
               IF l_ac>0 THEN
                  #20141118 add--str--
                  LET l_n = 0
                  SELECT COUNT(1) INTO l_n FROM faai_t   #160905-00007#2 count(*) --> count(1)
                   WHERE faaient = g_enterprise AND faai001 = g_fabo_d[l_ac].fabo003
                     AND faai002 = g_fabo_d[l_ac].fabo001 AND faai003 = g_fabo_d[l_ac].fabo002
                  IF l_n > 0 THEN                  
                  #20141118 add--end--
                     CALL afat440_01(l_cmd,g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,
                                  g_fabo_d[l_ac].fabo003,g_fabg_m.fabg005,g_fabg_m.fabgdocno,
                                  g_fabo_d[l_ac].fabo007)
                  END IF #20141118 add                  
               END IF
               #END add-point
            END IF
 
 
 
 
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
             LET l_n = 0
            SELECT COUNT(1) INTO l_n FROM fabo_t #160905-00007#2 count(*) --> count(1)
             WHERE faboent = g_enterprise AND fabodocno = g_fabg_m.fabgdocno AND fabold = g_fabg_m.fabgld
            IF l_n = 0 THEN
               IF cl_ask_confirm('afa-00249') THEN
                  CALL afat502_03(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabg_m.fabg005)
               END IF
            END IF 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_fabo_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL afat504_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1','3',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_fabo_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            CALL cl_set_act_visible("controlo",FALSE ) #180828-00006#2 add            
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                   glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                   glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                   glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                   glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                   glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            CALL afat504_set_curr() #設置本位幣二三的顯示
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            
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
            OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE afat504_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
 
            #200804-00006 ---start---
            FETCH afat504_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH afat504_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE afat504_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
            
            LET g_rec_b = g_fabo_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_fabo_d[l_ac].faboseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_fabo_d_t.* = g_fabo_d[l_ac].*  #BACKUP
               LET g_fabo_d_o.* = g_fabo_d[l_ac].*  #BACKUP
               CALL afat504_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               LET l_seq = g_fabo_d[l_ac].faboseq  #170915-00031#6  add by 09767               
               #end add-point  
               CALL afat504_set_no_entry_b(l_cmd)
               IF NOT afat504_lock_b("fabo_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH afat504_bcl INTO g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,g_fabo_d[l_ac].fabo009,g_fabo_d[l_ac].fabo005,g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo010, 
                      g_fabo_d[l_ac].fabo011,g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019,g_fabo_d[l_ac].fabo021,g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049, 
                      g_fabo_d[l_ac].fabo025,g_fabo_d[l_ac].fabo023,g_fabo_d[l_ac].fabo031,g_fabo_d[l_ac].fabo032,g_fabo_d[l_ac].fabo033,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo055,g_fabo_d[l_ac].fabo056,g_fabo_d[l_ac].fabo038,g_fabo_d[l_ac].fabo039, 
                      g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo060,g_fabo_d[l_ac].fabo061,g_fabo_d[l_ac].fabo062,g_fabo_d[l_ac].fabo063,g_fabo_d[l_ac].fabo064,g_fabo_d[l_ac].fabo065,g_fabo_d[l_ac].fabo066,g_fabo_d[l_ac].fabo067,g_fabo_d[l_ac].fabo068,g_fabo_d[l_ac].fabo069,g_fabo4_d[l_ac].faboseq, 
                      g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,g_fabo4_d[l_ac].fabo106,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,g_fabo4_d[l_ac].fabo110,g_fabo4_d[l_ac].fabo111,g_fabo4_d[l_ac].fabo112, 
                      g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo151,g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154,g_fabo4_d[l_ac].fabo155,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,g_fabo4_d[l_ac].fabo159,g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo161 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_fabo_d_t.faboseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_fabo_d_mask_o[l_ac].* =  g_fabo_d[l_ac].*
                  CALL afat504_fabo_t_mask()
                  LET g_fabo_d_mask_n[l_ac].* =  g_fabo_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL afat504_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            IF l_cmd = 'u' THEN
               CALL afat504_get_faah018()
            END IF
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
            #其他table進行lock
            
 
 
            CALL afat504_idx_chk()   #(ver:83)
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL afat504_idx_chk()   #(ver:83)
            INITIALIZE g_fabo_d[l_ac].* TO NULL 
            INITIALIZE g_fabo_d_t.* TO NULL 
            INITIALIZE g_fabo_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
            
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*     #新輸入資料
            LET g_fabo_d_o.* = g_fabo_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL afat504_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL afat504_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_fabo_d[li_reproduce_target].* = g_fabo_d[li_reproduce].*
               LET g_fabo4_d[li_reproduce_target].* = g_fabo4_d[li_reproduce].*
 
               LET g_fabo_d[li_reproduce_target].faboseq = NULL
 
            END IF
            
 
 
            #add-point:modify段before insert name="input.body.before_insert"
            #項次
            IF g_fabo_d[l_ac].faboseq IS NULL OR g_fabo_d[l_ac].faboseq = 0 THEN
               SELECT max(faboseq)+1 INTO g_fabo_d[l_ac].faboseq
                 FROM fabo_t
                WHERE faboent = g_enterprise  AND fabold = g_fabg_m.fabgld
                  AND fabodocno = g_fabg_m.fabgdocno
               IF cl_null(g_fabo_d[l_ac].faboseq) THEN
                  LET g_fabo_d[l_ac].faboseq = 1
               END IF
            END IF
            #########################add by huangtao
            LET g_fabo_d[l_ac].fabo006=0
            LET g_fabo_d[l_ac].fabo007=0
            LET g_fabo_d[l_ac].fabo012=0
            LET g_fabo_d[l_ac].fabo013=0
            LET g_fabo_d[l_ac].fabo014=0
            LET g_fabo_d[l_ac].fabo015=0
            LET g_fabo_d[l_ac].fabo016=0
            LET g_fabo_d[l_ac].fabo017=0
            LET g_fabo_d[l_ac].fabo020=0
            LET g_fabo_d[l_ac].fabo018=0
            LET g_fabo_d[l_ac].fabo019=0
            LET g_fabo_d[l_ac].fabo022=0
            LET g_fabo_d[l_ac].fabo049=0
            #########################add by huangtao
            LET g_fabo_d[l_ac].fabo009=g_fabg_m.fabg013 #稅別
            LET g_fabo_d[l_ac].fabo010=g_fabg_m.fabg015 #幣別
            LET g_fabo_d[l_ac].fabo011=g_fabg_m.fabg016 #匯率
            CALL afat504_get_rate()
            
            #20141119 --add--str--
            IF NOT cl_null(g_fabo_d[l_ac].fabo009) THEN
               CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
                  RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
               CALL cl_set_comp_entry('fabo012,fabo014',TRUE)
               IF l_oodb005 = 'Y' THEN
                  CALL cl_set_comp_entry('fabo012',FALSE)
               ELSE
                  CALL cl_set_comp_entry('fabo014',FALSE)
               END IF
            END IF            
            #20141119 --add--end--
            
            #20150513--add--str--lujh
            IF cl_null(g_fabo_d[l_ac].fabo002) THEN 
               LET g_fabo_d[l_ac].fabo002=' ' 
            END IF
            #20150513--add--end--lujh
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
            SELECT COUNT(1) INTO l_count FROM fabo_t 
             WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
               AND fabodocno = g_fabg_m.fabgdocno
 
               AND faboseq = g_fabo_d[l_ac].faboseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               #170512-00045#30 add-s
               IF l_cmd='a'  THEN
                  #取科目
                  SELECT faaj023,faaj024,faaj026 INTO l_faaj023,l_faaj024,l_faaj026 FROM faaj_t
                   WHERE faajent = g_enterprise AND faajld = g_fabg_m.fabgld
                     AND faaj001 = g_fabo_d[g_detail_idx].fabo001 AND faaj002 = g_fabo_d[g_detail_idx].fabo002
                     AND faaj037 = g_fabo_d[g_detail_idx].fabo003
                  #异动科目
                  SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
                  CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-9017') RETURNING l_para_data
                  IF l_para_data = 'Y' THEN           
                     LET l_scccode='9902_12'
                     LET l_glab002='25'
                  ELSE 
                     #资产处置不转入清理科目，判断‘处分损益fabo049’是否大于零 如果大于零，
                     #则取出售收益科目作为异动科目，否则取出售损失科目作为异动科目
                     IF l_fabo049>0 THEN  
                        LET l_scccode='9902_06' 
                        LET l_glab002='41'            
                     ELSE 
                        LET l_scccode='9902_07'
                        LET l_glab002='42'            
                     END IF                     
                  END IF    
                 SELECT glab005 INTO l_fabo024 FROM glab_t
                  WHERE glabent=g_enterprise AND glabld=g_fabgld AND glab001='90' AND glab002=l_glab002 AND glab003=l_scccode
                     
                  LET la_param.glaq0021=l_faaj023
                  LET la_param.glaq0022=l_faaj024
                  LET la_param.glaq0023=l_faaj026
                  LET la_param.glaq0024=l_fabo024
                  LET ls_js=util.JSON.stringify(la_param)
                  INITIALIZE g_glaq_s[1].* TO NULL
                  INITIALIZE g_fabo_d2[l_ac].* TO NULL
                  #171023-00004#1 ---s----
#180525-00007#1 mod s---
#                  SELECT faaj042,faaj043,faaj006,faaj007 INTO g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,l_faaj006,l_faaj007   #181015-00013#3 add faaj006,faaj007   
#                    FROM faaj_t      
#                    WHERE faajent=g_enterprise AND faajld=g_fabgld
#                     AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002               
#                     AND faaj037=g_fabo_d[l_ac].fabo003  
                  LET l_faah026 = ''
                  #SELECT faaj042,faaj043,faaj006,faaj007,faah026 INTO g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,l_faaj006,l_faaj007,l_faah026   #201116-00024#1 mark
                  #201116-00024#1-(S) add
                  #從afai100預帶核算項
                  SELECT faaj042,faaj043,faaj006,faaj007,faah026
                        ,faaj041,faaj044,faaj045,faaj046,faaj051,faaj052,faaj053,faaj054   #區域/客群/專案編號/WBS/產品分類/經營方式/通路/品牌
                    INTO g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,l_faaj006,l_faaj007,l_faah026
                        ,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo039,g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo0554,g_fabo_d[l_ac].fabo055,g_fabo_d[l_ac].fabo056
                  #201116-00024#1-(E) add                  
                    FROM faaj_t,faah_t      
                   WHERE faajent = faahent AND faaj037 = faah001
                     AND faaj001 = faah003 AND faaj002 = faah004
                     AND faajent=g_enterprise AND faajld=g_fabgld
                     AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002               
                     AND faaj037=g_fabo_d[l_ac].fabo003     
#180525-00007#1 mod e---                     
                  LET  g_glaq_s[l_ac].glaq017 = g_fabo_d[l_ac].fabo031
                  LET  g_glaq_s[l_ac].glaq018 = g_fabo_d[l_ac].fabo032
                  #181015-00013#3   add-S
                  IF cl_null(g_glaq_s[l_ac].glaq018) THEN
                     CASE l_faaj006
                        WHEN '1'  #单一部门分摊 
                             LET g_glaq_s[l_ac].glaq018 = l_faaj007      
                        WHEN '2'  #多部门分摊
                             #LET g_glaq_s[l_ac].glaq018 = g_fabg_m.fabg003   #180525-00007#1 mark
                             LET g_glaq_s[l_ac].glaq018 = l_faah026 #180525-00007#1 add 
                        WHEN '4'  #依标签部门分摊
                             #LET g_glaq_s[l_ac].glaq018 = g_fabg_m.fabg003   #180525-00007#1 mark
                             LET g_glaq_s[l_ac].glaq018 = l_faah026 #180525-00007#1 add 
                     END CASE
                  END IF 
                  #181015-00013#3   add-E 
                  
                  LET  g_glaq_s[l_ac].glaq019 = g_fabo_d[l_ac].fabo033
                  LET  g_glaq_s[l_ac].glaq020 = g_fabo_d[l_ac].fabo034
                  LET  g_glaq_s[l_ac].glaq021 = g_fabo_d[l_ac].fabo035
                  LET  g_glaq_s[l_ac].glaq022 = g_fabo_d[l_ac].fabo036
                  LET  g_glaq_s[l_ac].glaq023 = g_fabo_d[l_ac].fabo037
                  #LET  g_glaq_s[l_ac].glaq051 = g_fabo_d[l_ac].fabo055   #201116-00024#1 mark
                  LET  g_glaq_s[l_ac].glaq051 = g_fabo_d[l_ac].fabo0554   #201116-00024#1 add                  
                  LET  g_glaq_s[l_ac].glaq052 = g_fabo_d[l_ac].fabo055
                  LET  g_glaq_s[l_ac].glaq053 = g_fabo_d[l_ac].fabo056
                  LET  g_glaq_s[l_ac].glaq024 = g_fabo_d[l_ac].fabo057   #201116-00024#1 add
                  LET  g_glaq_s[l_ac].glaq025 = g_fabo_d[l_ac].fabo038
                  LET  g_glaq_s[l_ac].glaq027 = g_fabo_d[l_ac].fabo039
                  LET  g_glaq_s[l_ac].glaq028 = g_fabo_d[l_ac].fabo040
                  LET  g_glaq_s[l_ac].glaq029 = g_fabo_d[l_ac].fabo060
                  LET  g_glaq_s[l_ac].glaq030 = g_fabo_d[l_ac].fabo061
                  LET  g_glaq_s[l_ac].glaq031 = g_fabo_d[l_ac].fabo062
                  LET  g_glaq_s[l_ac].glaq032 = g_fabo_d[l_ac].fabo063
                  LET  g_glaq_s[l_ac].glaq033 = g_fabo_d[l_ac].fabo064
                  LET  g_glaq_s[l_ac].glaq034 = g_fabo_d[l_ac].fabo065
                  LET  g_glaq_s[l_ac].glaq035 = g_fabo_d[l_ac].fabo066
                  LET  g_glaq_s[l_ac].glaq036 = g_fabo_d[l_ac].fabo067
                  LET  g_glaq_s[l_ac].glaq037 = g_fabo_d[l_ac].fabo068
                  LET  g_glaq_s[l_ac].glaq038 = g_fabo_d[l_ac].fabo069
                  #171023-00004#1 ---e---          
                  #CALL aglt310_08('',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabo3_d[l_ac].xrcdseq,'afat504',g_glaq_s[1].*,ls_js)   #171023-00004#1 mark
                  CALL aglt310_08('',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabo3_d[l_ac].xrcdseq,'afat504',g_glaq_s[l_ac].*,ls_js) #171023-00004#1 add                                    
                  RETURNING g_glaq_s[1].glaq017,g_glaq_s[1].glaq018,g_glaq_s[1].glaq019,g_glaq_s[1].glaq020,g_glaq_s[1].glaq021,
                            g_glaq_s[1].glaq022,g_glaq_s[1].glaq023,g_glaq_s[1].glaq024,g_glaq_s[1].glaq051,g_glaq_s[1].glaq052,
                            g_glaq_s[1].glaq053,g_glaq_s[1].glaq025,g_glaq_s[1].glaq027,g_glaq_s[1].glaq028,g_glaq_s[1].glaq029,
                            g_glaq_s[1].glaq030,g_glaq_s[1].glaq031,g_glaq_s[1].glaq032,g_glaq_s[1].glaq033,g_glaq_s[1].glaq034,
                            g_glaq_s[1].glaq035,g_glaq_s[1].glaq036,g_glaq_s[1].glaq037,g_glaq_s[1].glaq038,g_glaq_s[1].glbc004
                

                  IF g_glaq_s[1].glaq017 <> ' ' THEN LET g_fabo_d[l_ac].fabo031  = g_glaq_s[1].glaq017 END IF
                  IF g_glaq_s[1].glaq018 <> ' ' THEN LET g_fabo_d[l_ac].fabo032  = g_glaq_s[1].glaq018 END IF 
                  IF g_glaq_s[1].glaq019 <> ' ' THEN LET g_fabo_d[l_ac].fabo033  = g_glaq_s[1].glaq019 END IF
                  IF g_glaq_s[1].glaq020 <> ' ' THEN LET g_fabo_d[l_ac].fabo034  = g_glaq_s[1].glaq020 END IF
                  IF g_glaq_s[1].glaq021 <> ' ' THEN LET g_fabo_d[l_ac].fabo035  = g_glaq_s[1].glaq021 END IF
                  IF g_glaq_s[1].glaq022 <> ' ' THEN LET g_fabo_d[l_ac].fabo036  = g_glaq_s[1].glaq022 END IF
                  IF g_glaq_s[1].glaq023 <> ' ' THEN LET g_fabo_d[l_ac].fabo037  = g_glaq_s[1].glaq023 END IF
                  IF g_glaq_s[1].glaq051 <> ' ' THEN LET g_fabo_d[l_ac].fabo0554 = g_glaq_s[1].glaq051 END IF
                  IF g_glaq_s[1].glaq052 <> ' ' THEN LET g_fabo_d[l_ac].fabo055  = g_glaq_s[1].glaq052 END IF
                  IF g_glaq_s[1].glaq053 <> ' ' THEN LET g_fabo_d[l_ac].fabo056  = g_glaq_s[1].glaq053 END IF
                  IF g_glaq_s[1].glaq024 <> ' ' THEN LET g_fabo_d[l_ac].fabo057  = g_glaq_s[1].glaq024 END IF   #產品分類 #201116-00024#1 add
                  IF g_glaq_s[1].glaq025 <> ' ' THEN LET g_fabo_d[l_ac].fabo038  = g_glaq_s[1].glaq025 END IF
                  IF g_glaq_s[1].glaq027 <> ' ' THEN LET g_fabo_d[l_ac].fabo039  = g_glaq_s[1].glaq027 END IF
                  IF g_glaq_s[1].glaq028 <> ' ' THEN LET g_fabo_d[l_ac].fabo040  = g_glaq_s[1].glaq028 END IF
                  IF g_glaq_s[1].glaq029 <> ' ' THEN LET g_fabo_d[l_ac].fabo060  = g_glaq_s[1].glaq029 END IF
                  IF g_glaq_s[1].glaq030 <> ' ' THEN LET g_fabo_d[l_ac].fabo061  = g_glaq_s[1].glaq030 END IF
                  IF g_glaq_s[1].glaq031 <> ' ' THEN LET g_fabo_d[l_ac].fabo062  = g_glaq_s[1].glaq031 END IF
                  IF g_glaq_s[1].glaq032 <> ' ' THEN LET g_fabo_d[l_ac].fabo063  = g_glaq_s[1].glaq032 END IF
                  IF g_glaq_s[1].glaq033 <> ' ' THEN LET g_fabo_d[l_ac].fabo064  = g_glaq_s[1].glaq033 END IF
                  IF g_glaq_s[1].glaq034 <> ' ' THEN LET g_fabo_d[l_ac].fabo065  = g_glaq_s[1].glaq034 END IF
                  IF g_glaq_s[1].glaq035 <> ' ' THEN LET g_fabo_d[l_ac].fabo066  = g_glaq_s[1].glaq035 END IF
                  IF g_glaq_s[1].glaq036 <> ' ' THEN LET g_fabo_d[l_ac].fabo067  = g_glaq_s[1].glaq036 END IF
                  IF g_glaq_s[1].glaq037 <> ' ' THEN LET g_fabo_d[l_ac].fabo068  = g_glaq_s[1].glaq037 END IF
                  IF g_glaq_s[1].glaq038 <> ' ' THEN LET g_fabo_d[l_ac].fabo069  = g_glaq_s[1].glaq038 END IF                    
                     
                END IF
                #170512-00045#30 add-e  
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys[3] = g_fabo_d[g_detail_idx].faboseq
               CALL afat504_insert_b('fabo_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_fabo_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL afat504_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:input段-after_insert name="input.body.a_insert2"
               #20141118 add--str--
               LET l_n = 0
               SELECT COUNT(1) INTO l_n FROM faai_t  #160905-00007#2 count(*) --> count(1)
                WHERE faaient = g_enterprise AND faai001 = g_fabo_d[l_ac].fabo003
                  AND faai002 = g_fabo_d[l_ac].fabo001 AND faai003 = g_fabo_d[l_ac].fabo002
               IF l_n > 0 THEN                  
               #20141118 add--end--
                  CALL afat440_01(l_cmd,g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,
                               g_fabo_d[l_ac].fabo003,g_fabg_m.fabg005,g_fabg_m.fabgdocno,
                               g_fabo_d[l_ac].fabo007)
               END IF #20141118 

               #预设afai090摘要
               IF NOT cl_null(g_fabo_d[l_ac].fabo023) THEN
                  #150916--s
                  #有維護摘要就不取設定的摘要
                  LET l_oocq009 = ''
                  SELECT fabo042 INTO l_oocq009 FROM fabo_t 
                   WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
                     AND fabodocno = g_fabg_m.fabgdocno               
                     AND faboseq = g_fabo_d_t.faboseq
                  IF cl_null(l_oocq009) THEN
                  #150916--e            
                     LET l_oocq009 = ''
                     SELECT oocq009 INTO l_oocq009 FROM oocq_t 
                      WHERE oocqent=g_enterprise AND oocq001='3902' AND oocq002=g_fabo_d[l_ac].fabo023
                  END IF   #150916 
                  UPDATE fabo_t SET fabo042 = l_oocq009
                   WHERE faboent = g_enterprise 
                     AND fabold  = g_fabg_m.fabgld 
                     AND fabodocno = g_fabg_m.fabgdocno 
                     AND faboseq = g_fabo_d[l_ac].faboseq #項次 
                  CASE
                     WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "fabo_t" 
                        LET g_errparam.code   = "std-00009" 
                        LET g_errparam.popup  = TRUE 
                        CALL s_transaction_end('N','0')         #171006-00010#13   add
                        CALL cl_err()
                        #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                        CANCEL INSERT
                     WHEN SQLCA.sqlcode #其他錯誤
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "fabo_t" 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL s_transaction_end('N','0')         #171006-00010#13   add
                        CALL cl_err()
                        #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                        CANCEL INSERT
                  END CASE 
               END IF        
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
               LET gs_keys[01] = g_fabg_m.fabgld
               LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_fabo_d_t.faboseq
 
            
               #刪除同層單身
               IF NOT afat504_delete_b('fabo_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT afat504_key_delete_b(gs_keys,'fabo_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
 
               
 
   #161130-00056 add
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE afat504_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                   DELETE FROM xrcd_t
                   WHERE xrcdent = g_enterprise AND xrcdld = g_fabg_m.fabgld AND
                                             xrcddocno = g_fabg_m.fabgdocno AND
                         xrcdseq = g_fabo_d_t.faboseq 
               #end add-point
               LET l_count = g_fabo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_fabo_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faboseq
            #add-point:BEFORE FIELD faboseq name="input.b.page1.faboseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faboseq
            
            #add-point:AFTER FIELD faboseq name="input.a.page1.faboseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_fabg_m.fabgld IS NOT NULL AND g_fabg_m.fabgdocno IS NOT NULL AND g_fabo_d[g_detail_idx].faboseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t OR g_fabg_m.fabgdocno != g_fabgdocno_t OR g_fabo_d[g_detail_idx].faboseq != g_fabo_d_t.faboseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM fabo_t WHERE "||"faboent = '" ||g_enterprise|| "' AND "||"fabold = '"||g_fabg_m.fabgld ||"' AND "|| "fabodocno = '"||g_fabg_m.fabgdocno ||"' AND "|| "faboseq = '"||g_fabo_d[g_detail_idx].faboseq ||"'",'std-00004',0) THEN #160905-00007#2 count(*) --> count(1)
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faboseq
            #add-point:ON CHANGE faboseq name="input.g.page1.faboseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo001
            
            #add-point:AFTER FIELD fabo001 name="input.a.page1.fabo001"
             
#               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#               INITIALIZE g_chkparam.* TO NULL
#               #設定g_chkparam.*的參數
#               LET g_chkparam.arg1 = g_fabo_d[l_ac].fabo001
#               #呼叫檢查存在並帶值的library
#               IF NOT cl_chk_exist("v_faah003") THEN
#                  #檢查失敗時後續處理
#                  LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
#                  NEXT FIELD CURRENT
#               END IF
##               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_fabo_d[l_ac].fabo001 != g_fabo_d_t.fabo001)) THEN
##                  LET g_fabo_d[l_ac].fabo003 = ' '
##                  CALL afat504_faid_def()
##                  DISPLAY g_fabo_d[l_ac].fabo003 TO s_detail1[l_ac].fabo003
##               END IF
#               IF  NOT cl_null(g_fabo_d[l_ac].fabo003) THEN
#               IF g_fabh_d[l_ac].fabh002 IS NOT NULL AND NOT cl_null(g_fabh_d[l_ac].fabh000) THEN
               
               IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND g_fabo_d[l_ac].fabo002 IS NOT NULL AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_fabo_d[l_ac].fabo001
                  LET g_chkparam.arg2 = g_fabo_d[l_ac].fabo002
                  LET g_chkparam.arg3 = g_fabo_d[l_ac].fabo003
                  #160318-00025#5--add--str
                  LET g_errshow = TRUE 
                  LET g_chkparam.err_str[1] = "afa-00264:sub-01313|afai100|",cl_get_progname("afai100",g_lang,"2"),"|:EXEPROGafai100"
                  #160318-00025#5--add--end
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_faah003_3") THEN
                     #檢查失敗時後續處理
                     LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                     LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
                     LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                     NEXT FIELD CURRENT
                  #20141213 add by chenying      
                  ELSE
                     
                     IF NOT s_afat503_fixed_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,"afat504",g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN
                        LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                        LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002 #170627-00040#1
                        LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003 #170627-00040#1
                        NEXT FIELD CURRENT 
                     END IF
                     
                     #20141224 add by chening
                     #检查是否存在未审核异动单据
                     CALL cl_err_collect_init()  
                     CALL s_afat503_conf_ins_tab_chk(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003) RETURNING r_success
                     IF r_success = FALSE THEN
                        CALL cl_err_collect_show() 
                        NEXT FIELD CURRENT 
                     ELSE
                        CALL cl_err_collect_init()  
                        CALL cl_err_collect_show()                      
                     END IF
                     #20141224 add by chening  

                     CALL afat504_faid_chk() RETURNING l_success
                     IF NOT l_success THEN
                        NEXT FIELD CURRENT
                     END IF
                      #180613-00008#3 add--s
                      SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld #180613-00008#5 add
                      #CALL afat504_fabh014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003)  #180613-00008#5 mark
                      CALL s_afa_faah014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_glaacomp,g_fabg_m.fabg004,g_fabg_m.fabgdocdt)  #180613-00008#5 mod
                      RETURNING l_success
                      IF l_success = FALSE THEN 
                         INITIALIZE g_errparam TO NULL 
                         LET g_errparam.extend = ''
                         LET g_errparam.code   = 'afa-01205'
                         LET g_errparam.popup  = TRUE 
                         CALL cl_err()
                         LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                         LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002 
                         LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                         NEXT FIELD CURRENT
                      END IF
                      #180613-00008#3 add--e
                     #20150608--add--str--lujh
                     IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND g_fabo_d[l_ac].fabo002 IS NOT NULL AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN 
                        CALL s_afa_faan_chk(g_fabg_m.fabgdocdt,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabg_m.fabgld) 
                        RETURNING l_success
                        
                        IF l_success = FALSE THEN 
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = ''
                           LET g_errparam.code   = 'afa-01026'
                           LET g_errparam.popup  = TRUE 
                           CALL cl_err()
                           LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                           NEXT FIELD CURRENT
                        END IF
                        #170704-00052#1   add--S
                        #如果该财产编号在afat512中存在未审核的单据，则提示报错
                        CALL s_afa_faah003_chk(g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002) RETURNING l_success,l_errno
                        IF NOT l_success THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = l_errno
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           LET g_errparam.replace[1] = g_fabo_d[l_ac].fabo003
                           LET g_errparam.replace[2] = g_fabo_d[l_ac].fabo001
                           LET g_errparam.replace[3] = g_fabo_d[l_ac].fabo002
                           CALL cl_err()
                           NEXT FIELD CURRENT
                        END IF
                        #170704-00052#1   add--E 
                     END IF
                     #20150608--add--end--lujh
                  END IF
                  
               END IF
                         
#               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_fabo_d[l_ac].fabo001 != g_fabo_d_t.fabo001 OR g_fabo_d[l_ac].fabo002 != g_fabo_d_t.fabo002 OR g_fabo_d[l_ac].fabo000 != g_fabo_d_t.fabo000)) THEN  #180326-00032#1 mark
                  CALL cl_err_collect_init()   #190218-00033#1 add
                  CALL afat504_get_faah()
                  CALL cl_err_collect_show()   #190218-00033#1 add
#               END IF              #180326-00032#1 mark

#            IF NOT cl_null(g_fabo_d[l_ac].fabo001) THEN
#               IF l_cmd = 'a' OR ( g_fabo_d[l_ac].fabo001 <> g_fabo_d_t.fabo001 OR cl_null(g_fabo_d_t.fabo001)) THEN
##此段落由子樣板a19產生
#                  #校驗代值
#                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#                  INITIALIZE g_chkparam.* TO NULL
#                  
#                  #設定g_chkparam.*的參數
#                  LET g_chkparam.arg1=g_fabo_d[l_ac].fabo001
#                     
#                  #呼叫檢查存在並帶值的library
#                  IF cl_chk_exist("v_faah003") THEN
#                     #檢查成功時後續處理
#                     #LET  = g_chkparam.return1
#                     #DISPLAY BY NAME
#                     CALL afat504_fabo001_chk()
#                     IF NOT cl_null(g_errno) THEN
#                        INITIALIZE g_errparam TO NULL
#                        LET g_errparam.code = g_errno
#                        LET g_errparam.extend = g_fabo_d[l_ac].fabo001
#                        LET g_errparam.popup = FALSE
#                        CALL cl_err()
#                        LET g_fabo_d[l_ac].fabo001=g_fabo_d_t.fabo001
#                        LET g_fabo_d[l_ac].fabo002=g_fabo_d_t.fabo002
#                        LET g_fabo_d[l_ac].fabo003=g_fabo_d_t.fabo003
#                        NEXT FIELD fabo001
#                     ELSE
#                        CALL afat504_get_faah()
#                     END IF
#                  ELSE
#                     #檢查失敗時後續處理
#                     LET g_fabo_d[l_ac].fabo001=g_fabo_d_t.fabo001
#                     LET g_fabo_d[l_ac].fabo002=g_fabo_d_t.fabo002
#                     LET g_fabo_d[l_ac].fabo003=g_fabo_d_t.fabo003
#                     NEXT FIELD CURRENT
#                  END IF
#               END IF
#            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo001
            #add-point:BEFORE FIELD fabo001 name="input.b.page1.fabo001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo001
            #add-point:ON CHANGE fabo001 name="input.g.page1.fabo001"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo001
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo001',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo002
            
            #add-point:AFTER FIELD fabo002 name="input.a.page1.fabo002"

#            IF NOT cl_null(g_fabo_d[l_ac].fabo001) THEN
##               LET g_fabo_d[l_ac].fabo003 = ''
##               CALL afat504_faid_def()
##               DISPLAY g_fabo_d[l_ac].fabo003 TO s_detail1[l_ac].fabo003
#               #若不是開窗，直接輸入欄位時，需帶出當前停用單中未使用的資料
#                 LET l_n6 = 1
#                 LET l_n5 = 0
#		          
#                 SELECT COUNT(*) INTO l_n5 FROM faah_t    #符合條件的筆數
#                  WHERE faahent = g_enterprise
#                    AND faah004 = g_fabo_d[l_ac].fabo002
#                 LET l_sql = " SELECT faah001,faah003,faah004 FROM faah_t ",
#                             "  WHERE faahent = '",g_enterprise,"'",
#                             "    AND faah003 = '",g_fabo_d[l_ac].fabo001,"'",
#                             "    AND faah004 = '",g_fabo_d[l_ac].fabo002,"'",
#                             "    AND faah015 NOT IN ('0','5','6','8','10') ",
#                             "    AND faahstus = 'Y' ",
#                             "  ORDER BY faah001,faah003,faah004 "
#                 PREPARE afat504_pb7 FROM l_sql
#                 DECLARE afat504_cs7 CURSOR FOR afat504_pb7
#                 FOREACH afat504_cs7 INTO l_fabo003,l_fabo001,l_fabo002
#		          
#                   IF SQLCA.sqlcode THEN
#                      INITIALIZE g_errparam TO NULL
#                      LET g_errparam.code = SQLCA.sqlcode
#                      LET g_errparam.extend = "afat504_cs7"
#                      LET g_errparam.popup = TRUE
#                      CALL cl_err()
#               
#                      EXIT FOREACH
#                   END IF
#		          
#                   LET l_n4 = 0
#                   SELECT COUNT(*) INTO l_n4 FROM fabh_t
#                    WHERE fabhent = g_enterprise
#                      AND fabhdocno = g_fabg_m.fabgdocno
#                      AND fabh001 = l_fabo001
#                      AND fabh002 = l_fabo002
#                      AND fabh000 = l_fabo003
#                   IF l_n4 >=1 THEN
#                      LET l_n6 = l_n6 + 1  #存在重複資料時，繼續下一筆
#                      CONTINUE FOREACH
#                   ELSE
#                      LET g_fabo_d[l_ac].fabo003 = l_fabo003
#                      LET g_fabo_d[l_ac].fabo001 = l_fabo001
#                      LET g_fabo_d[l_ac].fabo002 = l_fabo002
#                      EXIT FOREACH
#                   END IF
#               END FOREACH 
#            END IF
            IF cl_null(g_fabo_d[l_ac].fabo002) THEN 
               LET g_fabo_d[l_ac].fabo002=' ' 
            END IF
            
            IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_fabo_d[l_ac].fabo001
               LET g_chkparam.arg2 = g_fabo_d[l_ac].fabo002
               LET g_chkparam.arg3 = g_fabo_d[l_ac].fabo003
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "afa-00264:sub-01313|afai100|",cl_get_progname("afai100",g_lang,"2"),"|:EXEPROGafai100"
               #160318-00025#5--add--end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_faah003_3") THEN
                  #檢查失敗時後續處理
                  LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                  LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
                  LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                  NEXT FIELD CURRENT
                #20141213 add by chenying      
                ELSE
                  
                  IF NOT s_afat503_fixed_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,"afat504",g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN
                     LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
                     LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001 #170627-00040#1
                     LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003 #170627-00040#1
                     NEXT FIELD CURRENT 
                  END IF
                #20141213 add by chenying

                  #20141224 add by chening
                  #检查是否存在未审核异动单据
                  CALL cl_err_collect_init()
                  CALL s_afat503_conf_ins_tab_chk(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003) RETURNING r_success
                  IF r_success = FALSE THEN
                     CALL cl_err_collect_show() 
                     NEXT FIELD CURRENT 
                  ELSE
                     CALL cl_err_collect_init()  
                     CALL cl_err_collect_show()                   
                  END IF
                  #20141224 add by chening 
                  
                  CALL afat504_faid_chk() RETURNING l_success
                  IF NOT l_success THEN
                     NEXT FIELD CURRENT
                  END IF
                  #180613-00008#3 add--s
                  SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld #180613-00008#5 add
                  #CALL afat504_fabh014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003)  #180613-00008#5 mark
                  CALL s_afa_faah014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_glaacomp,g_fabg_m.fabg004,g_fabg_m.fabgdocdt)  #180613-00008#5 mod
                  RETURNING l_success
                  IF l_success = FALSE THEN 
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = 'afa-01205'
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                     LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002 
                     LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                     NEXT FIELD CURRENT
                  END IF
                  #180613-00008#3 add--e
                  #20150608--add--str--lujh
                  IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND g_fabo_d[l_ac].fabo002 IS NOT NULL AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN 
                     CALL s_afa_faan_chk(g_fabg_m.fabgdocdt,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabg_m.fabgld) 
                     RETURNING l_success
                     
                     IF l_success = FALSE THEN 
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = ''
                        LET g_errparam.code   = 'afa-01026'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
                        NEXT FIELD CURRENT
                     END IF
                     #170704-00052#1   add--S
                     #如果该财产编号在afat512中存在未审核的单据，则提示报错
                     CALL s_afa_faah003_chk(g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        LET g_errparam.replace[1] = g_fabo_d[l_ac].fabo003
                        LET g_errparam.replace[2] = g_fabo_d[l_ac].fabo001
                        LET g_errparam.replace[3] = g_fabo_d[l_ac].fabo002
                        CALL cl_err()
                        NEXT FIELD CURRENT
                     END IF
                     #170704-00052#1   add--E 
                  END IF
                  #20150608--add--end--lujh
               END IF
            END IF

#            IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_fabo_d[l_ac].fabo001 != g_fabo_d_t.fabo001 OR g_fabo_d[l_ac].fabo002 != g_fabo_d_t.fabo002 OR g_fabo_d[l_ac].fabo003 != g_fabo_d_t.fabo003)) THEN #180326-00032#1 mark
               CALL cl_err_collect_init()   #190218-00033#1 add
               CALL afat504_get_faah()
               CALL cl_err_collect_show()   #190218-00033#1 add
#            END IF               #180326-00032#1 mark

           
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo002
            #add-point:BEFORE FIELD fabo002 name="input.b.page1.fabo002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo002
            #add-point:ON CHANGE fabo002 name="input.g.page1.fabo002"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo002
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo002',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo003
            
            #add-point:AFTER FIELD fabo003 name="input.a.page1.fabo003"
#            IF (l_cmd = 'a' AND NOT cl_null(g_fabo_d[l_ac].fabo003) AND NOT cl_null(g_fabo_d[l_ac].fabo001)) 
#               OR (l_cmd = 'u' AND (g_fabo_d[l_ac].fabo003 != g_fabo_d_t.fabo003)) THEN
#                 #若不是開窗，直接輸入欄位時，需帶出當前停用單中未使用的資料
#                 LET l_n6 = 1
#                 LET l_n5 = 0
#		          
#                 SELECT COUNT(*) INTO l_n5 FROM faah_t    #符合條件的筆數
#                  WHERE faahent = g_enterprise
#                    AND faah004 = g_fabo_d[l_ac].fabo002
#                 LET l_sql = " SELECT faah001,faah003,faah004 FROM faah_t ",
#                             "  WHERE faahent = '",g_enterprise,"'",
#                             "    AND faah003 = '",g_fabo_d[l_ac].fabo001,"'",
#                             "    AND faah001 = '",g_fabo_d[l_ac].fabo003,"'",
#                             "    AND faah015 NOT IN ('0','5','6','8','10') ",
#                             "    AND faahstus = 'Y' ",
#                             "  ORDER BY faah001,faah003,faah004 "
#                 PREPARE afat504_pb8 FROM l_sql
#                 DECLARE afat504_cs8 CURSOR FOR afat504_pb8
#                 FOREACH afat504_cs8 INTO l_fabo003,l_fabo001,l_fabo002
#		          
#                   IF SQLCA.sqlcode THEN
#                      INITIALIZE g_errparam TO NULL
#                      LET g_errparam.code = SQLCA.sqlcode
#                      LET g_errparam.extend = "afat504_cs8"
#                      LET g_errparam.popup = TRUE
#                      CALL cl_err()
#               
#                      EXIT FOREACH
#                   END IF
#		          
#                   LET l_n4 = 0
#                   SELECT COUNT(*) INTO l_n4 FROM fabh_t
#                    WHERE fabhent = g_enterprise
#                      AND fabhdocno = g_fabg_m.fabgdocno
#                      AND fabh001 = l_fabo001
#                      AND fabh002 = l_fabo002
#                      AND fabh000 = l_fabo003
#                   IF l_n4 >=1 THEN
#                      LET l_n6 = l_n6 + 1  #存在重複資料時，繼續下一筆
#                      CONTINUE FOREACH
#                   ELSE
#                      LET g_fabo_d[l_ac].fabo003 = l_fabo003
#                      LET g_fabo_d[l_ac].fabo001 = l_fabo001
#                      LET g_fabo_d[l_ac].fabo002 = l_fabo002
#                      EXIT FOREACH
#                   END IF
#               END FOREACH 
#            END IF
            IF NOT cl_null(g_fabo_d[l_ac].fabo003) AND NOT cl_null(g_fabo_d[l_ac].fabo001) AND g_fabo_d[l_ac].fabo002 IS NOT NULL THEN
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_fabo_d[l_ac].fabo001
               LET g_chkparam.arg2 = g_fabo_d[l_ac].fabo002
               LET g_chkparam.arg3 = g_fabo_d[l_ac].fabo003
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "afa-00264:sub-01313|afai100|",cl_get_progname("afai100",g_lang,"2"),"|:EXEPROGafai100"
               #160318-00025#5--add--end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_faah003_3") THEN
                  #檢查失敗時後續處理
                  LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                  NEXT FIELD CURRENT
                #20141213 add by chenying      
                ELSE
                  
                  IF NOT s_afat503_fixed_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,"afat504",g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN
                     LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                     LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002 #170627-00040#1
                     LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001 #170627-00040#1
                     NEXT FIELD CURRENT 
                  END IF
                #20141213 add by chenying  

                  #20141224 add by chening
                  #检查是否存在未审核异动单据
                  CALL cl_err_collect_init() 
                  CALL s_afat503_conf_ins_tab_chk(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003) RETURNING r_success
                  IF r_success = FALSE THEN
                     CALL cl_err_collect_show() 
                     NEXT FIELD CURRENT 
                  ELSE
                     CALL cl_err_collect_init()  
                     CALL cl_err_collect_show()
                  END IF
                  #20141224 add by chening
                  
                  CALL afat504_faid_chk() RETURNING l_success
                  IF NOT l_success THEN
                     NEXT FIELD CURRENT
                  END IF 
                  #180613-00008#3 add--s
                  SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld #180613-00008#5 add
                  #CALL afat504_fabh014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003)  #180613-00008#5 mark
                  CALL s_afa_faah014_chk(g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_glaacomp,g_fabg_m.fabg004,g_fabg_m.fabgdocdt)  #180613-00008#5 mod
                  RETURNING l_success
                  IF l_success = FALSE THEN 
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = 'afa-01205'
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
                     LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002 
                     LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                     NEXT FIELD CURRENT
                  END IF
                  #180613-00008#3 add--e
                  #20150608--add--str--lujh
                  IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND g_fabo_d[l_ac].fabo002 IS NOT NULL AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN 
                     CALL s_afa_faan_chk(g_fabg_m.fabgdocdt,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabg_m.fabgld) 
                     RETURNING l_success
                     
                     IF l_success = FALSE THEN 
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = ''
                        LET g_errparam.code   = 'afa-01026'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
                        NEXT FIELD CURRENT
                     END IF
                     #170704-00052#1   add--S
                     #如果该财产编号在afat512中存在未审核的单据，则提示报错
                     CALL s_afa_faah003_chk(g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        LET g_errparam.replace[1] = g_fabo_d[l_ac].fabo003
                        LET g_errparam.replace[2] = g_fabo_d[l_ac].fabo001
                        LET g_errparam.replace[3] = g_fabo_d[l_ac].fabo002
                        CALL cl_err()
                        NEXT FIELD CURRENT
                     END IF
                     #170704-00052#1   add--E 
                  END IF
                  #20150608--add--end--lujh
               END IF
            END IF
 
#            IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_fabo_d[l_ac].fabo001 != g_fabo_d_t.fabo001 OR g_fabo_d[l_ac].fabo002 != g_fabo_d_t.fabo002 OR g_fabo_d[l_ac].fabo003 != g_fabo_d_t.fabo003 )) THEN #180326-00032#1 mark 
               CALL cl_err_collect_init()   #190218-00033#1 add
               CALL afat504_get_faah()
               CALL cl_err_collect_show()   #190218-00033#1 add
#            END IF            #180326-00032#1 mark
             
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo003
            #add-point:BEFORE FIELD fabo003 name="input.b.page1.fabo003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo003
            #add-point:ON CHANGE fabo003 name="input.g.page1.fabo003"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo003
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo003',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah013
            #add-point:BEFORE FIELD faah013 name="input.b.page1.faah013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faah013
            
            #add-point:AFTER FIELD faah013 name="input.a.page1.faah013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah013
            #add-point:ON CHANGE faah013 name="input.g.page1.faah013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah014
            #add-point:BEFORE FIELD faah014 name="input.b.page1.faah014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faah014
            
            #add-point:AFTER FIELD faah014 name="input.a.page1.faah014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah014
            #add-point:ON CHANGE faah014 name="input.g.page1.faah014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo000
            #add-point:BEFORE FIELD fabo000 name="input.b.page1.fabo000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo000
            
            #add-point:AFTER FIELD fabo000 name="input.a.page1.fabo000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo000
            #add-point:ON CHANGE fabo000 name="input.g.page1.fabo000"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo008
            #add-point:BEFORE FIELD fabo008 name="input.b.page1.fabo008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo008
            
            #add-point:AFTER FIELD fabo008 name="input.a.page1.fabo008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo008
            #add-point:ON CHANGE fabo008 name="input.g.page1.fabo008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo053
            #add-point:BEFORE FIELD fabo053 name="input.b.page1.fabo053"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo053
            
            #add-point:AFTER FIELD fabo053 name="input.a.page1.fabo053"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo053
            #add-point:ON CHANGE fabo053 name="input.g.page1.fabo053"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo009
            
            #add-point:AFTER FIELD fabo009 name="input.a.page1.fabo009"
            IF NOT cl_null(g_fabo_d[l_ac].fabo009) THEN 
               IF l_cmd = 'a' OR ( g_fabo_d[l_ac].fabo009 <> g_fabo_d_t.fabo009 OR cl_null(g_fabo_d_t.fabo009)) THEN
                  CALL s_tax_chk(g_fabg_m.fabgcomp,g_fabo_d[l_ac].fabo009)
                  RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                  IF l_success=FALSE THEN
                     LET g_fabo_d[l_ac].fabo009 = g_fabo_d_t.fabo009
                     NEXT FIELD fabo009
                  END IF
                  IF NOT cl_null(g_fabo_d[l_ac].fabo007) AND NOT cl_null(g_fabo_d[l_ac].fabo014) THEN
                     CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,0,g_fabg_m.fabgcomp,
                                    g_fabo_d[l_ac].fabo006*g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo009,
                                    g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,
                                    g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151)
                       RETURNING g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                 g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                 g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                 g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154  
                     DISPLAY BY NAME g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                 g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                 g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                 g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154 
                   
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  #160905-00007#2 mark
                       #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld AND glaent = g_enterprise   #160905-00007#2 add #161127-00005#1 Mark
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld AND glaaent = g_enterprise   #161127-00005#1 Add
                     END IF
#                     LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                     #210419-00007#1 mark(s)
#                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 mark(e)
                     #210419-00007#1 add(s)
                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 add(e)
                     LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)                     
                  END IF 
                  #處置相關金額
                  CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
                  LET g_fabo_d_t.fabo009 = g_fabo_d[l_ac].fabo009  #150922-00011#1 add
               END IF
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo009
            #add-point:BEFORE FIELD fabo009 name="input.b.page1.fabo009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo009
            #add-point:ON CHANGE fabo009 name="input.g.page1.fabo009"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo009
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo009',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo005
            #add-point:BEFORE FIELD fabo005 name="input.b.page1.fabo005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo005
            
            #add-point:AFTER FIELD fabo005 name="input.a.page1.fabo005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo005
            #add-point:ON CHANGE fabo005 name="input.g.page1.fabo005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo007
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_fabo_d[l_ac].fabo007,"0","1","","","azz-00079",1) THEN
               NEXT FIELD fabo007
            END IF 
 
 
 
            #add-point:AFTER FIELD fabo007 name="input.a.page1.fabo007"
            IF NOT cl_null(g_fabo_d[l_ac].fabo007) THEN 
               #IF g_fabo_d[l_ac].fabo007>0 THEN 
                 #IF l_cmd = 'a' OR ( g_fabo_d[l_ac].fabo007 <> g_fabo_d_t.fabo007 OR cl_null(g_fabo_d_t.fabo007)) THEN
                 #IF l_cmd = 'a' OR (cl_null(g_fabo_d_t.fabo007)) THEN    #150922-00011#1  mark
                  IF l_cmd = 'a' OR (g_fabo_d[l_ac].fabo007 <> g_fabo_d_t.fabo007 OR cl_null(g_fabo_d_t.fabo007)) THEN  #150922-00011#1  add
                     IF g_fabo_d[l_ac].fabo007>g_faah018 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'afa-00159'
                        LET g_errparam.extend = g_fabo_d[l_ac].fabo007
                        LET g_errparam.popup = FALSE
                        CALL cl_err()
                        
                        LET g_fabo_d[l_ac].fabo007 = g_fabo_d_t.fabo007
                        NEXT FIELD fabo007
                     END IF
                     
                     IF NOT cl_null(g_fabo_d[l_ac].fabo009) AND NOT cl_null(g_fabo_d[l_ac].fabo006) THEN
                        CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,0,g_fabg_m.fabgcomp,
                                       g_fabo_d[l_ac].fabo006*g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo009,
                                       g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,
                                       g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151)
                          RETURNING g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                    g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                    g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                    g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154  
                        DISPLAY BY NAME g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                    g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                    g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                    g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154 
                     
                        #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                        IF NOT cl_null( g_fabg_m.fabgld) THEN
                           #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld    #160905-00007#2 mark
                           SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   #160905-00007#2 add
                        END IF
#                        LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                        #210419-00007#1 mark(s)
#                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 mark(e)
                        #210419-00007#1 add(s)
                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 add(e)
                        LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                        LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                        LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                     END IF
                     #處置相關金額
                     CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
                     LET g_fabo_d_t.fabo007 = g_fabo_d[l_ac].fabo007  #150922-00011#1 add
                  END IF
#               ELSE 
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'ade-00016'
#                  LET g_errparam.extend = g_fabo_d[l_ac].fabo007
#                  LET g_errparam.popup = FALSE
#                  CALL cl_err()
#                  NEXT FIELD CURRENT
#               END IF
            END IF 
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo007
            #add-point:BEFORE FIELD fabo007 name="input.b.page1.fabo007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo007
            #add-point:ON CHANGE fabo007 name="input.g.page1.fabo007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo006
            #add-point:BEFORE FIELD fabo006 name="input.b.page1.fabo006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo006
            
            #add-point:AFTER FIELD fabo006 name="input.a.page1.fabo006"
            IF NOT cl_null(g_fabo_d[l_ac].fabo006) THEN
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo006 <> g_fabo_d_t.fabo006 OR cl_null(g_fabo_d_t.fabo006)) THEN
                  IF NOT cl_null(g_fabo_d[l_ac].fabo007) AND NOT cl_null(g_fabo_d[l_ac].fabo009) THEN
                  LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo006,1) #180531-00059#1 add         
                     CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,0,g_fabg_m.fabgcomp,
                                    g_fabo_d[l_ac].fabo006*g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo009,
                                    g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,
                                    g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151)
                     RETURNING g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                               g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                               g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                               g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154                         
                     DISPLAY BY NAME g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                 g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                 g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                 g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154 
                  
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld    #160905-00007#2 mark
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   #160905-00007#2 add
                     END IF
#                     LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                     #210419-00007#1 mark(s)
#                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 mark(e)
                     #210419-00007#1 add(s)
                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 add(e)
                     LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                  END IF
                  #處置相關金額
                  CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
                  LET g_fabo_d_t.fabo006 = g_fabo_d[l_ac].fabo006  #150922-00011#1 add
               END IF
            END IF  
            CALL afat504_set_no_entry_b('u')  #20141119
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo006
            #add-point:ON CHANGE fabo006 name="input.g.page1.fabo006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo010
            
            #add-point:AFTER FIELD fabo010 name="input.a.page1.fabo010"
            IF NOT cl_null(g_fabo_d[l_ac].fabo010) THEN 
#此段落由子樣板a19產生
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "aoo-00011:sub-01302|aooi140|",cl_get_progname("aooi140",g_lang,"2"),"|:EXEPROGaooi140"
               #160318-00025#5--add--end
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist_and_ref_val("v_ooai001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo010
            #add-point:BEFORE FIELD fabo010 name="input.b.page1.fabo010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo010
            #add-point:ON CHANGE fabo010 name="input.g.page1.fabo010"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo010
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo010',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo011
            #add-point:BEFORE FIELD fabo011 name="input.b.page1.fabo011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo011
            
            #add-point:AFTER FIELD fabo011 name="input.a.page1.fabo011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo011
            #add-point:ON CHANGE fabo011 name="input.g.page1.fabo011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo012
            #add-point:BEFORE FIELD fabo012 name="input.b.page1.fabo012"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo012
            
            #add-point:AFTER FIELD fabo012 name="input.a.page1.fabo012"
            IF NOT cl_null(g_fabo_d[l_ac].fabo012) THEN
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo012 <> g_fabo_d_t.fabo012 OR cl_null(g_fabo_d_t.fabo012)) THEN
                  #170112-00040#1 -s add by 08172
                  IF g_fabo_d[l_ac].fabo012 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo012
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo012 = g_fabo_d_t.fabo012
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'N' THEN  
                  #170112-00040#1 -e add by 08172
                     IF NOT cl_null(g_fabo_d[l_ac].fabo007) AND NOT cl_null(g_fabo_d[l_ac].fabo009) THEN 
                        CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,0,g_fabg_m.fabgcomp,
                                       g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo009,
                                       g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,
                                       g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151)
                        RETURNING g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                  g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                  g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                  g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154                         
                        DISPLAY BY NAME g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                    g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                    g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                    g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154 
                     
                        #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                        IF NOT cl_null( g_fabg_m.fabgld) THEN
                           #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld   #160905-00007#2 mark
                           SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   #160905-00007#2 add                        
                        END IF
#                        LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                        #210419-00007#1 mark(s)
#                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 mark(e)
                        #210419-00007#1 add(s)
                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 add(e)
                        LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                        LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                        LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                     END IF
                  #170112-00040#1 -s add by 08172
                     IF g_fabo_d[l_ac].fabo011 = 1 THEN
                        LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo012
                        LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo013
                        LET g_fabo_d[l_ac].fabo017 = g_fabo_d[l_ac].fabo014
                        UPDATE fabo_t SET fabo015 = fabo012,
                                          fabo016 = fabo013,
                                          fabo017 = fabo014
                         WHERE faboent = g_enterprise
                           AND fabodocno = g_fabg_m.fabgdocno
                           AND fabold = g_fabg_m.fabgld
                     END IF
                  ELSE
                     IF l_oodb006 <> 0 THEN  #税率不为0时，税额的计算
                        LET g_fabo_d[l_ac].fabo013 = g_fabo_d[l_ac].fabo014 - g_fabo_d[l_ac].fabo012
                        LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo013 * g_fabo_d[l_ac].fabo011
                     ELSE
                        LET g_fabo_d[l_ac].fabo014 = g_fabo_d[l_ac].fabo012  #税率为0 税前与应收金额相等
                        LET g_fabo_d[l_ac].fabo013 = 0                       #税率为0 原币税额为0
                     END IF
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   
                     END IF
#                     LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                     #210419-00007#1 mark(s)
#                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 mark(e)
                     #210419-00007#1 add(s)
                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 add(e)
                     LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                     UPDATE fabo_t SET fabo012 = g_fabo_d[l_ac].fabo012,
                                       fabo013 = g_fabo_d[l_ac].fabo013,
                                       fabo014 = g_fabo_d[l_ac].fabo014,
                                       fabo015 = g_fabo_d[l_ac].fabo015,
                                       fabo016 = g_fabo_d[l_ac].fabo016,
                                       fabo017 = g_fabo_d[l_ac].fabo017
                      WHERE faboent = g_enterprise
                        AND fabodocno = g_fabg_m.fabgdocno
                        AND fabold = g_fabg_m.fabgld
                        AND faboseq = g_fabo_d[l_ac].faboseq  #180821-00049#1---add
                  END IF
                  IF l_oodb005 = 'N' THEN
                     LET g_fabo_d[l_ac].fabo006 = g_fabo_d[l_ac].fabo012 / g_fabo_d[l_ac].fabo007
                  ELSE
                     LET g_fabo_d[l_ac].fabo006 = g_fabo_d[l_ac].fabo014 / g_fabo_d[l_ac].fabo007
                  END IF
                  #170112-00040#1 -e add by 08172
                  #處置相關金額
                  CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
                  LET g_fabo_d_t.fabo012 = g_fabo_d[l_ac].fabo012  #150922-00011#1 add
#                  IF NOT cl_null(g_fabo_d[l_ac].fabo013) THEN
#                     LET g_fabo_d[l_ac].fabo014=g_fabo_d[l_ac].fabo013+g_fabo_d[l_ac].fabo012
#                  END IF
#                  IF g_glaa.glaa015='Y' AND g_glaa.glaa017='1' THEN
#                     LET g_fabo4_d[l_ac].fabo103=g_fabo_d[l_ac].fabo012*g_fabo4_d[l_ac].fabo102
#                     LET g_fabo4_d[l_ac].fabo105=g_fabo_d[l_ac].fabo014*g_fabo4_d[l_ac].fabo102
#                  END IF
#                  IF g_glaa.glaa019='Y' AND g_glaa.glaa021='1' THEN
#                     LET g_fabo4_d[l_ac].fabo152=g_fabo_d[l_ac].fabo012*g_fabo4_d[l_ac].fabo151
#                     LET g_fabo4_d[l_ac].fabo154=g_fabo_d[l_ac].fabo014*g_fabo4_d[l_ac].fabo151
#                  END IF
               END IF
            END IF 
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo012
            #add-point:ON CHANGE fabo012 name="input.g.page1.fabo012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo013
            #add-point:BEFORE FIELD fabo013 name="input.b.page1.fabo013"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo013
            
            #add-point:AFTER FIELD fabo013 name="input.a.page1.fabo013"
            IF NOT cl_null(g_fabo_d[l_ac].fabo013) THEN
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo013 <> g_fabo_d_t.fabo013 OR cl_null(g_fabo_d_t.fabo013)) THEN
#                  IF NOT cl_null(g_fabo_d[l_ac].fabo012) THEN  #170112-00040#1 20170811 mark by 08172
                  #170112-00040#1 -s add by 08172
                  IF g_fabo_d[l_ac].fabo013 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo013
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo013 = g_fabo_d_t.fabo013
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'Y' THEN
                     LET g_fabo_d[l_ac].fabo012 = g_fabo_d[l_ac].fabo014 - g_fabo_d[l_ac].fabo013
                     LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo013 * g_fabo_d[l_ac].fabo011
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   
                     END IF
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo017 - g_fabo_d[l_ac].fabo016
                  ELSE
                  #170112-00040#1 -e add by 08172
                     LET g_fabo_d[l_ac].fabo014=g_fabo_d[l_ac].fabo013+g_fabo_d[l_ac].fabo012
                  #170112-00040#1 -s add by 08172
                     LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo013 * g_fabo_d[l_ac].fabo011
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   
                     END IF
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo017 = g_fabo_d[l_ac].fabo016 + g_fabo_d[l_ac].fabo015
                  END IF
                  UPDATE fabo_t SET fabo012 = g_fabo_d[l_ac].fabo012,
                                    fabo013 = g_fabo_d[l_ac].fabo013,
                                    fabo014 = g_fabo_d[l_ac].fabo014,
                                    fabo015 = g_fabo_d[l_ac].fabo015,
                                    fabo016 = g_fabo_d[l_ac].fabo016,
                                    fabo017 = g_fabo_d[l_ac].fabo017
                   WHERE faboent = g_enterprise
                     AND fabodocno = g_fabg_m.fabgdocno
                     AND fabold = g_fabg_m.fabgld
                     AND faboseq = g_fabo_d[l_ac].faboseq  #180821-00049#1---add
                  #170112-00040#1 -e add by 08172
#                  END IF  #170112-00040#1 20170811 mark by 08172
                  IF g_glaa.glaa015='Y' AND g_glaa.glaa017='1' THEN
                     LET g_fabo4_d[l_ac].fabo104=g_fabo_d[l_ac].fabo013*g_fabo4_d[l_ac].fabo102
                     LET g_fabo4_d[l_ac].fabo105=g_fabo_d[l_ac].fabo014*g_fabo4_d[l_ac].fabo102
                  END IF
                  IF g_glaa.glaa019='Y' AND g_glaa.glaa021='1' THEN
                     LET g_fabo4_d[l_ac].fabo153=g_fabo_d[l_ac].fabo013*g_fabo4_d[l_ac].fabo151
                     LET g_fabo4_d[l_ac].fabo154=g_fabo_d[l_ac].fabo014*g_fabo4_d[l_ac].fabo151
                  END IF
                  #處置相關金額 #180821-00049#1---add
                  CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007) #180821-00049#1---add
                  LET g_fabo_d_t.fabo013 = g_fabo_d[l_ac].fabo013  #150922-00011#1 add
               END IF  
            END IF 
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo013
            #add-point:ON CHANGE fabo013 name="input.g.page1.fabo013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo014
            #add-point:BEFORE FIELD fabo014 name="input.b.page1.fabo014"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo014
            
            #add-point:AFTER FIELD fabo014 name="input.a.page1.fabo014"
            IF NOT cl_null(g_fabo_d[l_ac].fabo014) THEN
               #IF l_cmd='a' OR (g_fabo_d[l_ac].fabo014 <> g_fabo_d_t.fabo014 OR cl_null(g_fabo_d_t.fabo014)) THEN  #180531-00059#1 mark
               IF g_fabo_d[l_ac].fabo014 <> g_fabo_d_t.fabo014 OR cl_null(g_fabo_d_t.fabo014) THEN  #180531-00059#1 add
                  #170112-00040#1 -s add by 08172
                  IF g_fabo_d[l_ac].fabo014 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo014
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo014 = g_fabo_d_t.fabo014
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'Y' THEN    
                  #170112-00040#1 -e add by 08172
                     IF NOT cl_null(g_fabo_d[l_ac].fabo007) AND NOT cl_null(g_fabo_d[l_ac].fabo009) THEN 
                        CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,0,g_fabg_m.fabgcomp,
                                       g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo009,
                                       g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,
                                       g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151)
                        RETURNING g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                  g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                  g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                  g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154                         
                        DISPLAY BY NAME g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,
                                    g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,
                                    g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,
                                    g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154 
                     
                        #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                        IF NOT cl_null( g_fabg_m.fabgld) THEN
                           #SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  #160905-00007#2
                           SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   #160905-00007#2 add                                   
                        END IF
#                        LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                        #210419-00007#1 mark(s)
#                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 mark(e)
                        #210419-00007#1 add(s)
                        LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                        LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                        LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                        #210419-00007#1 add(e)
                        LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                        LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                        LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                     END IF
                  #170112-00040#1 -s add by 08172
                     IF g_fabo_d[l_ac].fabo011 = 1 THEN
                        LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo012
                        LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo013
                        LET g_fabo_d[l_ac].fabo017 = g_fabo_d[l_ac].fabo014
                        UPDATE fabo_t SET fabo015 = fabo012,
                                          fabo016 = fabo013,
                                          fabo017 = fabo014
                         WHERE faboent = g_enterprise
                           AND fabodocno = g_fabg_m.fabgdocno
                           AND fabold = g_fabg_m.fabgld
                     END IF
                  ELSE
                     LET g_fabo_d[l_ac].fabo012 = g_fabo_d[l_ac].fabo014 - g_fabo_d[l_ac].fabo013
                     LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo012 * g_fabo_d[l_ac].fabo011
                     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
                     IF NOT cl_null( g_fabg_m.fabgld) THEN
                        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld  AND glaaent = g_enterprise   
                     END IF
#                     LET g_fabo_d[l_ac].fabo006 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)       #180531-00059#1 add
                     #210419-00007#1 mark(s)
#                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo012,2)
#                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo013,2)
#                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 mark(e)
                     #210419-00007#1 add(s)
                     LET g_fabo_d[l_ac].fabo012 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo012,2)
                     LET g_fabo_d[l_ac].fabo013 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo013,2)
                     LET g_fabo_d[l_ac].fabo014 = s_curr_round(g_fabg_m.fabgcomp,g_fabg_m.fabg015,g_fabo_d[l_ac].fabo014,2)
                     #210419-00007#1 add(e)
                     LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo015,2)
                     LET g_fabo_d[l_ac].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo016,2)
                     LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_ac].fabo017,2)
                     UPDATE fabo_t SET fabo012 = g_fabo_d[l_ac].fabo012,
                                       fabo013 = g_fabo_d[l_ac].fabo013,
                                       fabo014 = g_fabo_d[l_ac].fabo014,
                                       fabo015 = g_fabo_d[l_ac].fabo015,
                                       fabo016 = g_fabo_d[l_ac].fabo016,
                                       fabo017 = g_fabo_d[l_ac].fabo017
                      WHERE faboent = g_enterprise
                        AND fabodocno = g_fabg_m.fabgdocno
                        AND fabold = g_fabg_m.fabgld
                        AND faboseq = g_fabo_d[l_ac].faboseq  #180821-00049#1---add
                  END IF
                  IF l_oodb005 = 'N' THEN
                     LET g_fabo_d[l_ac].fabo006 = g_fabo_d[l_ac].fabo012 / g_fabo_d[l_ac].fabo007
                  ELSE
                     LET g_fabo_d[l_ac].fabo006 = g_fabo_d[l_ac].fabo014 / g_fabo_d[l_ac].fabo007
                  END IF
                  #170112-00040#1 -e add by 08172
                  #處置相關金額
                  CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
                  LET g_fabo_d_t.fabo014 = g_fabo_d[l_ac].fabo014  #150922-00011#1 add
               END IF
            END IF
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo014
            #add-point:ON CHANGE fabo014 name="input.g.page1.fabo014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo015
            #add-point:BEFORE FIELD fabo015 name="input.b.page1.fabo015"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo015
            
            #add-point:AFTER FIELD fabo015 name="input.a.page1.fabo015"
            IF NOT cl_null(g_fabo_d[l_ac].fabo015) THEN
               LET g_fabo_d[l_ac].fabo015 = s_curr_round(g_fabg_m.fabgcomp,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo015,2)
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo015 <> g_fabo_d_t.fabo015 OR cl_null(g_fabo_d_t.fabo015)) THEN
                  #170112-00040#1 -s add by 08172
                  IF g_fabo_d[l_ac].fabo015 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo015
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo015 = g_fabo_d_t.fabo015
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb006 <> 0 THEN  #税率不为0时，本币税额的计算
                     LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo017 - g_fabo_d[l_ac].fabo015
                  ELSE
                     LET g_fabo_d[l_ac].fabo017 = g_fabo_d[l_ac].fabo015  #税率为0 本币含税金额等于本币应收金额
                     LET g_fabo_d[l_ac].fabo016 = 0                       #税率为0 本币税额为0
                  END IF
                  UPDATE fabo_t SET fabo015 = g_fabo_d[l_ac].fabo015,
                                    fabo016 = g_fabo_d[l_ac].fabo016,
                                    fabo017 = g_fabo_d[l_ac].fabo017
                   WHERE faboent   = g_enterprise
                     AND fabodocno = g_fabg_m.fabgdocno
                     AND faboseq   = g_fabo_d[l_ac].faboseq
                     AND fabold    = g_fabg_m.fabgld 
                  #170112-00040#1 -e add by 08172
                  #170112-00040#1 -s 20170811 mark by 08172
#                  IF NOT cl_null(g_fabo_d[l_ac].fabo016) THEN
#                     LET g_fabo_d[l_ac].fabo017=g_fabo_d[l_ac].fabo016+g_fabo_d[l_ac].fabo015
#                  END IF
                  #170112-00040#1 -e 20170811 mark by 08172
                  IF g_glaa.glaa015='Y' AND g_glaa.glaa017='2' THEN
                     LET g_fabo4_d[l_ac].fabo103=g_fabo_d[l_ac].fabo015*g_fabo4_d[l_ac].fabo102
                     LET g_fabo4_d[l_ac].fabo105=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo102
                  END IF
                  IF g_glaa.glaa019='Y' AND g_glaa.glaa021='2' THEN
                     LET g_fabo4_d[l_ac].fabo152=g_fabo_d[l_ac].fabo015*g_fabo4_d[l_ac].fabo151
                     LET g_fabo4_d[l_ac].fabo154=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo151
                  END IF
                  LET g_fabo_d_t.fabo015 = g_fabo_d[l_ac].fabo015  #150922-00011#1 add
               END IF
            END IF
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo015
            #add-point:ON CHANGE fabo015 name="input.g.page1.fabo015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo016
            #add-point:BEFORE FIELD fabo016 name="input.b.page1.fabo016"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo016
            
            #add-point:AFTER FIELD fabo016 name="input.a.page1.fabo016"
            IF NOT cl_null(g_fabo_d[l_ac].fabo016) THEN
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo016 <> g_fabo_d_t.fabo016 OR cl_null(g_fabo_d_t.fabo016)) THEN
                  #170112-00040#1 -s add by 08172
                  IF g_fabo_d[l_ac].fabo016 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo016
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo016 = g_fabo_d_t.fabo016
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'Y' THEN  
                     LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo017 - g_fabo_d[l_ac].fabo016
                  ELSE
                     LET g_fabo_d[l_ac].fabo017 = g_fabo_d[l_ac].fabo015 + g_fabo_d[l_ac].fabo016
                  END IF
                  UPDATE fabo_t SET fabo015 = g_fabo_d[l_ac].fabo015,
                                    fabo016 = g_fabo_d[l_ac].fabo016,
                                    fabo017 = g_fabo_d[l_ac].fabo017
                   WHERE faboent   = g_enterprise
                     AND fabodocno = g_fabg_m.fabgdocno
                     AND faboseq   = g_fabo_d[l_ac].faboseq
                     AND fabold    = g_fabg_m.fabgld 
                  #170112-00040#1 -e add by 08172
                  #170112-00040#1 -s 20170811 mark by 08172
#                  IF NOT cl_null(g_fabo_d[l_ac].fabo016) THEN
#                     LET g_fabo_d[l_ac].fabo017=g_fabo_d[l_ac].fabo016+g_fabo_d[l_ac].fabo015
#                  END IF  
                  #170112-00040#1 -e 20170811 mark by 08172
                  IF g_glaa.glaa015='Y' AND g_glaa.glaa017='2' THEN
                     LET g_fabo4_d[l_ac].fabo104=g_fabo_d[l_ac].fabo016*g_fabo4_d[l_ac].fabo102
                     LET g_fabo4_d[l_ac].fabo105=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo102
                  END IF
                  IF g_glaa.glaa019='Y' AND g_glaa.glaa021='2' THEN
                     LET g_fabo4_d[l_ac].fabo153=g_fabo_d[l_ac].fabo016*g_fabo4_d[l_ac].fabo151
                     LET g_fabo4_d[l_ac].fabo154=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo151
                  END IF
                  LET g_fabo_d_t.fabo016 = g_fabo_d[l_ac].fabo016  #150922-00011#1 add
               END IF
            END IF
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo016
            #add-point:ON CHANGE fabo016 name="input.g.page1.fabo016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo017
            #add-point:BEFORE FIELD fabo017 name="input.b.page1.fabo017"
            #170112-00040#1 -s add by 08172
            CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
               RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            #170112-00040#1 -e add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo017
            
            #add-point:AFTER FIELD fabo017 name="input.a.page1.fabo017"
            #170112-00040#1 -s add by 08172
            IF NOT cl_null(g_fabo_d[l_ac].fabo017) THEN
               LET g_fabo_d[l_ac].fabo017 = s_curr_round(g_fabg_m.fabgcomp,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo017,2)
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo017 <> g_fabo_d_t.fabo017 OR cl_null(g_fabo_d_t.fabo017)) THEN
                  
                  IF g_fabo_d[l_ac].fabo017 < 0 THEN    
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00224'  
                     LET g_errparam.extend = g_fabo_d[l_ac].fabo017
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_fabo_d[l_ac].fabo017 = g_fabo_d_t.fabo017
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb006 <> 0 THEN  #税率不为0时，本币税额的计算
                     LET g_fabo_d[l_ac].fabo016 = g_fabo_d[l_ac].fabo017 - g_fabo_d[l_ac].fabo015
                  ELSE
                     LET g_fabo_d[l_ac].fabo015 = g_fabo_d[l_ac].fabo017  #税率为0 本币含税金额等于本币应收金额
                     LET g_fabo_d[l_ac].fabo016 = 0                       #税率为0 本币税额为0
                  END IF
                  UPDATE fabo_t SET fabo015 = g_fabo_d[l_ac].fabo015,
                                    fabo016 = g_fabo_d[l_ac].fabo016,
                                    fabo017 = g_fabo_d[l_ac].fabo017
                   WHERE faboent   = g_enterprise
                     AND fabodocno = g_fabg_m.fabgdocno
                     AND faboseq   = g_fabo_d[l_ac].faboseq
                     AND fabold    = g_fabg_m.fabgld 
                  IF g_glaa.glaa015='Y' AND g_glaa.glaa017='2' THEN
                     LET g_fabo4_d[l_ac].fabo103=g_fabo_d[l_ac].fabo015*g_fabo4_d[l_ac].fabo102
                     LET g_fabo4_d[l_ac].fabo105=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo102
                  END IF
                  IF g_glaa.glaa019='Y' AND g_glaa.glaa021='2' THEN
                     LET g_fabo4_d[l_ac].fabo152=g_fabo_d[l_ac].fabo015*g_fabo4_d[l_ac].fabo151
                     LET g_fabo4_d[l_ac].fabo154=g_fabo_d[l_ac].fabo017*g_fabo4_d[l_ac].fabo151
                  END IF
                  LET g_fabo_d_t.fabo017 = g_fabo_d[l_ac].fabo017 
               END IF
            END IF
            LET g_fabo_d_t.* = g_fabo_d[l_ac].*   
            #170112-00040#1 -e add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo017
            #add-point:ON CHANGE fabo017 name="input.g.page1.fabo017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo020
            #add-point:BEFORE FIELD fabo020 name="input.b.page1.fabo020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo020
            
            #add-point:AFTER FIELD fabo020 name="input.a.page1.fabo020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo020
            #add-point:ON CHANGE fabo020 name="input.g.page1.fabo020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo018
            #add-point:BEFORE FIELD fabo018 name="input.b.page1.fabo018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo018
            
            #add-point:AFTER FIELD fabo018 name="input.a.page1.fabo018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo018
            #add-point:ON CHANGE fabo018 name="input.g.page1.fabo018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo019
            #add-point:BEFORE FIELD fabo019 name="input.b.page1.fabo019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo019
            
            #add-point:AFTER FIELD fabo019 name="input.a.page1.fabo019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo019
            #add-point:ON CHANGE fabo019 name="input.g.page1.fabo019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo021
            #add-point:BEFORE FIELD fabo021 name="input.b.page1.fabo021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo021
            
            #add-point:AFTER FIELD fabo021 name="input.a.page1.fabo021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo021
            #add-point:ON CHANGE fabo021 name="input.g.page1.fabo021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo022
            #add-point:BEFORE FIELD fabo022 name="input.b.page1.fabo022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo022
            
            #add-point:AFTER FIELD fabo022 name="input.a.page1.fabo022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo022
            #add-point:ON CHANGE fabo022 name="input.g.page1.fabo022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo049
            #add-point:BEFORE FIELD fabo049 name="input.b.page1.fabo049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo049
            
            #add-point:AFTER FIELD fabo049 name="input.a.page1.fabo049"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo049
            #add-point:ON CHANGE fabo049 name="input.g.page1.fabo049"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo025
            #add-point:BEFORE FIELD fabo025 name="input.b.page1.fabo025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo025
            
            #add-point:AFTER FIELD fabo025 name="input.a.page1.fabo025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo025
            #add-point:ON CHANGE fabo025 name="input.g.page1.fabo025"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo023
            
            #add-point:AFTER FIELD fabo023 name="input.a.page1.fabo023"
            IF NOT cl_null(g_fabo_d[l_ac].fabo023) THEN 
               IF l_cmd='a' OR (g_fabo_d[l_ac].fabo023 <> g_fabo_d_t.fabo023 OR cl_null(g_fabo_d_t.fabo023)) THEN
#此段落由子樣板a19產生
                  #校驗代值
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1=g_fabo_d[l_ac].fabo023
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_3902") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME
                     SELECT oocq019 INTO l_oocq019 FROM oocq_t 
                     WHERE oocqent=g_enterprise AND oocq001='3902' AND oocq002=g_fabo_d[l_ac].fabo023
                     IF l_oocq019<>'4' THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "afa-00160"
                        LET g_errparam.extend = g_fabo_d[l_ac].fabo023
                        LET g_errparam.popup = FALSE
                        CALL cl_err()
                        
                        LET g_fabo_d[l_ac].fabo023=g_fabo_d_t.fabo023
                        NEXT FIELD fabo023
                     END IF                     
                  ELSE
                     #檢查失敗時後續處理
                     LET g_fabo_d[l_ac].fabo023=g_fabo_d_t.fabo023
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL afat504_fabo023_desc(g_fabo_d[l_ac].fabo023) RETURNING g_fabo_d[l_ac].fabo023_desc
            DISPLAY BY NAME g_fabo_d[l_ac].fabo023_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo023
            #add-point:BEFORE FIELD fabo023 name="input.b.page1.fabo023"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo023
            #add-point:ON CHANGE fabo023 name="input.g.page1.fabo023"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo_d[l_ac].fabo023
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo023',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo031
            #add-point:BEFORE FIELD fabo031 name="input.b.page1.fabo031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo031
            
            #add-point:AFTER FIELD fabo031 name="input.a.page1.fabo031"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo031
            #add-point:ON CHANGE fabo031 name="input.g.page1.fabo031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo032
            #add-point:BEFORE FIELD fabo032 name="input.b.page1.fabo032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo032
            
            #add-point:AFTER FIELD fabo032 name="input.a.page1.fabo032"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo032
            #add-point:ON CHANGE fabo032 name="input.g.page1.fabo032"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo033
            #add-point:BEFORE FIELD fabo033 name="input.b.page1.fabo033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo033
            
            #add-point:AFTER FIELD fabo033 name="input.a.page1.fabo033"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo033
            #add-point:ON CHANGE fabo033 name="input.g.page1.fabo033"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo034
            #add-point:BEFORE FIELD fabo034 name="input.b.page1.fabo034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo034
            
            #add-point:AFTER FIELD fabo034 name="input.a.page1.fabo034"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo034
            #add-point:ON CHANGE fabo034 name="input.g.page1.fabo034"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo035
            #add-point:BEFORE FIELD fabo035 name="input.b.page1.fabo035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo035
            
            #add-point:AFTER FIELD fabo035 name="input.a.page1.fabo035"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo035
            #add-point:ON CHANGE fabo035 name="input.g.page1.fabo035"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo036
            #add-point:BEFORE FIELD fabo036 name="input.b.page1.fabo036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo036
            
            #add-point:AFTER FIELD fabo036 name="input.a.page1.fabo036"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo036
            #add-point:ON CHANGE fabo036 name="input.g.page1.fabo036"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo037
            #add-point:BEFORE FIELD fabo037 name="input.b.page1.fabo037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo037
            
            #add-point:AFTER FIELD fabo037 name="input.a.page1.fabo037"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo037
            #add-point:ON CHANGE fabo037 name="input.g.page1.fabo037"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo0554
            #add-point:BEFORE FIELD fabo0554 name="input.b.page1.fabo0554"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo0554
            
            #add-point:AFTER FIELD fabo0554 name="input.a.page1.fabo0554"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo0554
            #add-point:ON CHANGE fabo0554 name="input.g.page1.fabo0554"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo055
            #add-point:BEFORE FIELD fabo055 name="input.b.page1.fabo055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo055
            
            #add-point:AFTER FIELD fabo055 name="input.a.page1.fabo055"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo055
            #add-point:ON CHANGE fabo055 name="input.g.page1.fabo055"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo056
            #add-point:BEFORE FIELD fabo056 name="input.b.page1.fabo056"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo056
            
            #add-point:AFTER FIELD fabo056 name="input.a.page1.fabo056"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo056
            #add-point:ON CHANGE fabo056 name="input.g.page1.fabo056"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo038
            #add-point:BEFORE FIELD fabo038 name="input.b.page1.fabo038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo038
            
            #add-point:AFTER FIELD fabo038 name="input.a.page1.fabo038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo038
            #add-point:ON CHANGE fabo038 name="input.g.page1.fabo038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo039
            #add-point:BEFORE FIELD fabo039 name="input.b.page1.fabo039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo039
            
            #add-point:AFTER FIELD fabo039 name="input.a.page1.fabo039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo039
            #add-point:ON CHANGE fabo039 name="input.g.page1.fabo039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo040
            #add-point:BEFORE FIELD fabo040 name="input.b.page1.fabo040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo040
            
            #add-point:AFTER FIELD fabo040 name="input.a.page1.fabo040"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo040
            #add-point:ON CHANGE fabo040 name="input.g.page1.fabo040"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo057
            #add-point:BEFORE FIELD fabo057 name="input.b.page1.fabo057"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo057
            
            #add-point:AFTER FIELD fabo057 name="input.a.page1.fabo057"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo057
            #add-point:ON CHANGE fabo057 name="input.g.page1.fabo057"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo060
            #add-point:BEFORE FIELD fabo060 name="input.b.page1.fabo060"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo060
            
            #add-point:AFTER FIELD fabo060 name="input.a.page1.fabo060"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo060
            #add-point:ON CHANGE fabo060 name="input.g.page1.fabo060"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo061
            #add-point:BEFORE FIELD fabo061 name="input.b.page1.fabo061"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo061
            
            #add-point:AFTER FIELD fabo061 name="input.a.page1.fabo061"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo061
            #add-point:ON CHANGE fabo061 name="input.g.page1.fabo061"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo062
            #add-point:BEFORE FIELD fabo062 name="input.b.page1.fabo062"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo062
            
            #add-point:AFTER FIELD fabo062 name="input.a.page1.fabo062"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo062
            #add-point:ON CHANGE fabo062 name="input.g.page1.fabo062"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo063
            #add-point:BEFORE FIELD fabo063 name="input.b.page1.fabo063"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo063
            
            #add-point:AFTER FIELD fabo063 name="input.a.page1.fabo063"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo063
            #add-point:ON CHANGE fabo063 name="input.g.page1.fabo063"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo064
            #add-point:BEFORE FIELD fabo064 name="input.b.page1.fabo064"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo064
            
            #add-point:AFTER FIELD fabo064 name="input.a.page1.fabo064"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo064
            #add-point:ON CHANGE fabo064 name="input.g.page1.fabo064"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo065
            #add-point:BEFORE FIELD fabo065 name="input.b.page1.fabo065"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo065
            
            #add-point:AFTER FIELD fabo065 name="input.a.page1.fabo065"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo065
            #add-point:ON CHANGE fabo065 name="input.g.page1.fabo065"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo066
            #add-point:BEFORE FIELD fabo066 name="input.b.page1.fabo066"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo066
            
            #add-point:AFTER FIELD fabo066 name="input.a.page1.fabo066"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo066
            #add-point:ON CHANGE fabo066 name="input.g.page1.fabo066"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo067
            #add-point:BEFORE FIELD fabo067 name="input.b.page1.fabo067"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo067
            
            #add-point:AFTER FIELD fabo067 name="input.a.page1.fabo067"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo067
            #add-point:ON CHANGE fabo067 name="input.g.page1.fabo067"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo068
            #add-point:BEFORE FIELD fabo068 name="input.b.page1.fabo068"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo068
            
            #add-point:AFTER FIELD fabo068 name="input.a.page1.fabo068"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo068
            #add-point:ON CHANGE fabo068 name="input.g.page1.fabo068"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo069
            #add-point:BEFORE FIELD fabo069 name="input.b.page1.fabo069"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo069
            
            #add-point:AFTER FIELD fabo069 name="input.a.page1.fabo069"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo069
            #add-point:ON CHANGE fabo069 name="input.g.page1.fabo069"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.faboseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faboseq
            #add-point:ON ACTION controlp INFIELD faboseq name="input.c.page1.faboseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo001
            #add-point:ON ACTION controlp INFIELD fabo001 name="input.c.page1.fabo001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo001 #財產編號
            LET g_qryparam.default2 = g_fabo_d[l_ac].fabo002 #附號
            LET g_qryparam.default3 = g_fabo_d[l_ac].fabo003 #卡號
            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = " faajld = '",g_fabg_m.fabgld,"' AND faah015 NOT IN ('0','5','6','8','10') ",
                                   " AND faah036 != '1' " #160426-00014#7
#                                   " AND faah032 IN (SELECT ooef017 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef001 = '",g_fabg_m.fabgsite,"')"
            #161111-00049#12 mod s---
            SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            LET g_qryparam.where =  g_qryparam.where," AND faah032 = '",g_glaacomp,"' AND faah037 = '1' " #170603-00027#1  add faah037
            #161111-00049#12 mod s---   
            LET g_qryparam.where = g_qryparam.where," AND (faah014 <= '",g_fabg_m.fabg004,"' AND faah014 <= '",g_fabg_m.fabgdocdt,"')"  #180613-00008#3 add    
            CALL q_faah003_5()                                #呼叫開窗

            LET g_fabo_d[l_ac].fabo001 = g_qryparam.return1              
            LET g_fabo_d[l_ac].fabo002 = g_qryparam.return2 
            LET g_fabo_d[l_ac].fabo003 = g_qryparam.return3 
            DISPLAY g_fabo_d[l_ac].fabo001 TO fabo001  #財產編號
            DISPLAY g_fabo_d[l_ac].fabo002 TO faao002  #附號
            DISPLAY g_fabo_d[l_ac].fabo003 TO faao003  #卡號

            NEXT FIELD fabo001                          #返回原欄位

#            #此段落由子樣板a07產生            
#            #開窗i段
#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'i'
#            LET g_qryparam.reqry = FALSE
#
#            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo001 #財產編號
#            LET g_qryparam.default2 = g_fabo_d[l_ac].fabo002 #附號
#            LET g_qryparam.default3 = g_fabo_d[l_ac].fabo003 #卡號
#            #給予arg
#            LET g_qryparam.arg1 = "" #
#
#            
#            CALL q_faah003_3()                                #呼叫開窗
#
#            LET g_fabo_d[l_ac].fabo001 = g_qryparam.return1              
#            LET g_fabo_d[l_ac].fabo002 = g_qryparam.return2 
#            LET g_fabo_d[l_ac].fabo003 = g_qryparam.return3 
#            DISPLAY g_fabo_d[l_ac].fabo001 TO fabo001 #財產編號             #
#            DISPLAY g_fabo_d[l_ac].fabo002 TO fabo002 #附號
#            DISPLAY g_fabo_d[l_ac].fabo003 TO fabo003 #卡號
#            NEXT FIELD fabo001                          #返回原欄位
#

            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo002
            #add-point:ON ACTION controlp INFIELD fabo002 name="input.c.page1.fabo002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo001 #財產編號
            LET g_qryparam.default2 = g_fabo_d[l_ac].fabo002 #附號
            LET g_qryparam.default3 = g_fabo_d[l_ac].fabo003 #卡號
            
            LET g_qryparam.where = " faajld = '",g_fabg_m.fabgld,"'"
            IF NOT cl_null(g_fabo_d[l_ac].fabo001) THEN
               LET g_qryparam.where = g_qryparam.where," AND faaj001 = '",g_fabo_d[l_ac].fabo001,"' AND faah015 NOT IN ('0','5','6','8','10') ",
                                                       " AND faah036 != '1' " #160426-00014#7
            END IF
            #給予arg
            LET g_qryparam.arg1 = "" #

            #161111-00049#12 mod s---
            SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            LET g_qryparam.where =  g_qryparam.where," AND faah032 = '",g_glaacomp,"' AND faah037 = '1' "  #170603-00027#1 add faah037
            #161111-00049#12 mod s--- 
            LET g_qryparam.where = g_qryparam.where," AND (faah014 <= '",g_fabg_m.fabg004,"' AND faah014 <= '",g_fabg_m.fabgdocdt,"')"  #180613-00008#3 add    
                    
            CALL q_faah003_6()                                #呼叫開窗

            LET g_fabo_d[l_ac].fabo002 = g_qryparam.return2              
            #LET g_fabh_d[l_ac].faah003 = g_qryparam.return2 
            #LET g_fabh_d[l_ac].faah004 = g_qryparam.return3 
            DISPLAY g_fabo_d[l_ac].fabo002 TO fabo002              #
            #DISPLAY g_fabh_d[l_ac].faah003 TO faah003 #財產編號
            #DISPLAY g_fabh_d[l_ac].faah004 TO faah004 #附號
            NEXT FIELD fabo002                          #返回原欄位

#            #此段落由子樣板a07產生            
#            #開窗i段
#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'i'
#            LET g_qryparam.reqry = FALSE
#
#            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo002             #給予default值
#            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].faah003 #財產編號
#            LET g_qryparam.default3 = "" #g_fabo_d[l_ac].faah004 #附號
#            #給予arg
#            LET g_qryparam.arg1 = "" #
#
#            
#            CALL q_faah003_3()                                #呼叫開窗
#
#            LET g_fabo_d[l_ac].fabo002 = g_qryparam.return1              
#            #LET g_fabo_d[l_ac].faah003 = g_qryparam.return2 
#            #LET g_fabo_d[l_ac].faah004 = g_qryparam.return3 
#            DISPLAY g_fabo_d[l_ac].fabo002 TO fabo002              #
#            #DISPLAY g_fabo_d[l_ac].faah003 TO faah003 #財產編號
#            #DISPLAY g_fabo_d[l_ac].faah004 TO faah004 #附號
#            NEXT FIELD fabo002                          #返回原欄位
#
#
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo003
            #add-point:ON ACTION controlp INFIELD fabo003 name="input.c.page1.fabo003"
           #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            IF cl_null(g_fabo_d[l_ac].fabo002) THEN LET g_fabo_d[l_ac].fabo002=' ' END IF
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo001 #財產編號
            LET g_qryparam.default2 = g_fabo_d[l_ac].fabo002 #附號
            LET g_qryparam.default3 = g_fabo_d[l_ac].fabo003 #卡號
            LET g_qryparam.where = " faajld = '",g_fabg_m.fabgld,"' AND faah015 NOT IN ('0','5','6','8','10') ",
                                   " AND faah036 != '1' " #160426-00014#7
            #IF g_fabh_d[l_ac].fabh002 IS NOT NULL THEN
            LET g_qryparam.where = g_qryparam.where," AND faaj002 = '",g_fabo_d[l_ac].fabo002,"'"
            #END IF
            IF NOT cl_null(g_fabo_d[l_ac].fabo001) THEN
               LET g_qryparam.where = g_qryparam.where," AND faaj001 = '",g_fabo_d[l_ac].fabo001,"'"
            END IF
            #給予arg
            LET g_qryparam.arg1 = "" #

            #161111-00049#12 mod s---
            SELECT glaacomp INTO g_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            LET g_qryparam.where =  g_qryparam.where," AND faah032 = '",g_glaacomp,"' AND faah037 = '1' " #170603-00027#1 add faah037 
            #161111-00049#12 mod s---
            LET g_qryparam.where = g_qryparam.where," AND (faah014 <= '",g_fabg_m.fabg004,"' AND faah014 <= '",g_fabg_m.fabgdocdt,"')"  #180613-00008#3 add    
            
             CALL q_faah003_7()                              #呼叫開窗

            LET g_fabo_d[l_ac].fabo003 = g_qryparam.return3              
            #LET g_fabh_d[l_ac].faah003 = g_qryparam.return2 
            #LET g_fabh_d[l_ac].faah004 = g_qryparam.return3 
            DISPLAY g_fabo_d[l_ac].fabo003 TO fabo003              #
            #DISPLAY g_fabh_d[l_ac].faah003 TO faah003 #財產編號
            #DISPLAY g_fabh_d[l_ac].faah004 TO faah004 #附號
            NEXT FIELD fabo003                          #返回原欄位


#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'i'
#            LET g_qryparam.reqry = FALSE
#
#            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo003             #給予default值
#            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].faah003 #財產編號
#            LET g_qryparam.default3 = "" #g_fabo_d[l_ac].faah004 #附號
#            #給予arg
#            LET g_qryparam.arg1 = "" #
#
#            
#            CALL q_faah003_3()                                #呼叫開窗
#
#            LET g_fabo_d[l_ac].fabo003 = g_qryparam.return1              
#            #LET g_fabo_d[l_ac].faah003 = g_qryparam.return2 
#            #LET g_fabo_d[l_ac].faah004 = g_qryparam.return3 
#            DISPLAY g_fabo_d[l_ac].fabo003 TO fabo003              #
#            #DISPLAY g_fabo_d[l_ac].faah003 TO faah003 #財產編號
#            #DISPLAY g_fabo_d[l_ac].faah004 TO faah004 #附號
#            NEXT FIELD fabo003                          #返回原欄位
#

            #END add-point
 
 
         #Ctrlp:input.c.page1.faah013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faah013
            #add-point:ON ACTION controlp INFIELD faah013 name="input.c.page1.faah013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.faah014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faah014
            #add-point:ON ACTION controlp INFIELD faah014 name="input.c.page1.faah014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo000
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo000
            #add-point:ON ACTION controlp INFIELD fabo000 name="input.c.page1.fabo000"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo008
            #add-point:ON ACTION controlp INFIELD fabo008 name="input.c.page1.fabo008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo053
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo053
            #add-point:ON ACTION controlp INFIELD fabo053 name="input.c.page1.fabo053"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo009
            #add-point:ON ACTION controlp INFIELD fabo009 name="input.c.page1.fabo009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo009             #給予default值
            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].oodb002 #稅別代碼
            LET g_qryparam.default3 = "" #g_fabo_d[l_ac].oodb005 #含稅否
            LET g_qryparam.default4 = "" #g_fabo_d[l_ac].oodb006 #稅率
            #給予arg
            LET g_qryparam.arg1 = g_ooef019

            
            CALL q_oodb002_5()                                #呼叫開窗

            LET g_fabo_d[l_ac].fabo009 = g_qryparam.return1              
            #LET g_fabo_d[l_ac].oodb002 = g_qryparam.return2 
            #LET g_fabo_d[l_ac].oodb005 = g_qryparam.return3 
            #LET g_fabo_d[l_ac].oodb006 = g_qryparam.return4 
            DISPLAY g_fabo_d[l_ac].fabo009 TO fabo009              #
            #DISPLAY g_fabo_d[l_ac].oodb002 TO oodb002 #稅別代碼
            #DISPLAY g_fabo_d[l_ac].oodb005 TO oodb005 #含稅否
            #DISPLAY g_fabo_d[l_ac].oodb006 TO oodb006 #稅率
            NEXT FIELD fabo009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo005
            #add-point:ON ACTION controlp INFIELD fabo005 name="input.c.page1.fabo005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo007
            #add-point:ON ACTION controlp INFIELD fabo007 name="input.c.page1.fabo007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo006
            #add-point:ON ACTION controlp INFIELD fabo006 name="input.c.page1.fabo006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo010
            #add-point:ON ACTION controlp INFIELD fabo010 name="input.c.page1.fabo010"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_aooi001_1()                                #呼叫開窗

            LET g_fabo_d[l_ac].fabo010 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo010 TO fabo010              #

            NEXT FIELD fabo010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo011
            #add-point:ON ACTION controlp INFIELD fabo011 name="input.c.page1.fabo011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo012
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo012
            #add-point:ON ACTION controlp INFIELD fabo012 name="input.c.page1.fabo012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo013
            #add-point:ON ACTION controlp INFIELD fabo013 name="input.c.page1.fabo013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo014
            #add-point:ON ACTION controlp INFIELD fabo014 name="input.c.page1.fabo014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo015
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo015
            #add-point:ON ACTION controlp INFIELD fabo015 name="input.c.page1.fabo015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo016
            #add-point:ON ACTION controlp INFIELD fabo016 name="input.c.page1.fabo016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo017
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo017
            #add-point:ON ACTION controlp INFIELD fabo017 name="input.c.page1.fabo017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo020
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo020
            #add-point:ON ACTION controlp INFIELD fabo020 name="input.c.page1.fabo020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo018
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo018
            #add-point:ON ACTION controlp INFIELD fabo018 name="input.c.page1.fabo018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo019
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo019
            #add-point:ON ACTION controlp INFIELD fabo019 name="input.c.page1.fabo019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo021
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo021
            #add-point:ON ACTION controlp INFIELD fabo021 name="input.c.page1.fabo021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo022
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo022
            #add-point:ON ACTION controlp INFIELD fabo022 name="input.c.page1.fabo022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo049
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo049
            #add-point:ON ACTION controlp INFIELD fabo049 name="input.c.page1.fabo049"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo025
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo025
            #add-point:ON ACTION controlp INFIELD fabo025 name="input.c.page1.fabo025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo023
            #add-point:ON ACTION controlp INFIELD fabo023 name="input.c.page1.fabo023"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo023             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = " oocq019='4' "
            
            CALL q_oocq002_18()                                #呼叫開窗

            LET g_fabo_d[l_ac].fabo023 = g_qryparam.return1              
            #LET g_fabo_d[l_ac].oocq002 = g_qryparam.return2 
            DISPLAY g_fabo_d[l_ac].fabo023 TO fabo023              #
            #DISPLAY g_fabo_d[l_ac].oocq002 TO oocq002 #應用分類碼
            CALL afat504_fabo023_desc(g_fabo_d[l_ac].fabo023) RETURNING g_fabo_d[l_ac].fabo023_desc
            DISPLAY g_fabo_d[l_ac].fabo023_desc TO fabo023_desc  
            NEXT FIELD fabo023                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo031
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo031
            #add-point:ON ACTION controlp INFIELD fabo031 name="input.c.page1.fabo031"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo031             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooed004_1()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo031 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo031 TO fabo031              #

            NEXT FIELD fabo031                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo032
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo032
            #add-point:ON ACTION controlp INFIELD fabo032 name="input.c.page1.fabo032"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo032             #給予default值
            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].ooefl003 #說明(簡稱)
            #給予arg
            #LET g_qryparam.arg1 = "" #s    #190906-00040#9 mark
            LET g_qryparam.arg1 = g_fabg_m.fabgcomp     #法人組織    #190906-00040#9 add
            LET g_qryparam.arg2 = g_today                           #190906-00040#9 add

 
            #CALL q_ooeg001()                                #呼叫開窗   #190906-00040#9 mark   
            CALL q_ooeg001_25()         #190906-00040#9 add
 
            LET g_fabo_d[l_ac].fabo032 = g_qryparam.return1              
            #LET g_fabo_d[l_ac].ooefl003 = g_qryparam.return2 
            DISPLAY g_fabo_d[l_ac].fabo032 TO fabo032              #
            #DISPLAY g_fabo_d[l_ac].ooefl003 TO ooefl003 #說明(簡稱)
            NEXT FIELD fabo032                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo033
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo033
            #add-point:ON ACTION controlp INFIELD fabo033 name="input.c.page1.fabo033"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo033             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooed004_1()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo033 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo033 TO fabo033              #

            NEXT FIELD fabo033                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo034
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo034
            #add-point:ON ACTION controlp INFIELD fabo034 name="input.c.page1.fabo034"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo034             #給予default值
            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].oocql004 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_oocq002()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo034 = g_qryparam.return1              
            #LET g_fabo_d[l_ac].oocql004 = g_qryparam.return2 
            DISPLAY g_fabo_d[l_ac].fabo034 TO fabo034              #
            #DISPLAY g_fabo_d[l_ac].oocql004 TO oocql004 #說明
            NEXT FIELD fabo034                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo035
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo035
            #add-point:ON ACTION controlp INFIELD fabo035 name="input.c.page1.fabo035"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo035             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_pmaa001()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo035 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo035 TO fabo035              #

            NEXT FIELD fabo035                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo036
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo036
            #add-point:ON ACTION controlp INFIELD fabo036 name="input.c.page1.fabo036"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo036             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_pmaa001()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo036 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo036 TO fabo036              #

            NEXT FIELD fabo036                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo037
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo037
            #add-point:ON ACTION controlp INFIELD fabo037 name="input.c.page1.fabo037"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo037             #給予default值
            LET g_qryparam.default2 = "" #g_fabo_d[l_ac].oocql004 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_oocq002()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo037 = g_qryparam.return1              
            #LET g_fabo_d[l_ac].oocql004 = g_qryparam.return2 
            DISPLAY g_fabo_d[l_ac].fabo037 TO fabo037              #
            #DISPLAY g_fabo_d[l_ac].oocql004 TO oocql004 #說明
            NEXT FIELD fabo037                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo0554
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo0554
            #add-point:ON ACTION controlp INFIELD fabo0554 name="input.c.page1.fabo0554"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo055
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo055
            #add-point:ON ACTION controlp INFIELD fabo055 name="input.c.page1.fabo055"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo056
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo056
            #add-point:ON ACTION controlp INFIELD fabo056 name="input.c.page1.fabo056"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo038
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo038
            #add-point:ON ACTION controlp INFIELD fabo038 name="input.c.page1.fabo038"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo038             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo038 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo038 TO fabo038              #

            NEXT FIELD fabo038                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo039
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo039
            #add-point:ON ACTION controlp INFIELD fabo039 name="input.c.page1.fabo039"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo039             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
        #    CALL q_pjba001()                                #呼叫開窗     #170330-00057#7  mark
             CALL q_pjab001_1()                                        #170330-00057#7  add
           
            LET g_fabo_d[l_ac].fabo039 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo039 TO fabo039              #

            NEXT FIELD fabo039                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo040
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo040
            #add-point:ON ACTION controlp INFIELD fabo040 name="input.c.page1.fabo040"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo040             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_pjbb002()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo040 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo040 TO fabo040              #

            NEXT FIELD fabo040                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo057
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo057
            #add-point:ON ACTION controlp INFIELD fabo057 name="input.c.page1.fabo057"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_fabo_d[l_ac].fabo057             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_rtax001()                                #呼叫開窗
 
            LET g_fabo_d[l_ac].fabo057 = g_qryparam.return1              

            DISPLAY g_fabo_d[l_ac].fabo057 TO fabo057              #

            NEXT FIELD fabo057                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo060
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo060
            #add-point:ON ACTION controlp INFIELD fabo060 name="input.c.page1.fabo060"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo061
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo061
            #add-point:ON ACTION controlp INFIELD fabo061 name="input.c.page1.fabo061"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo062
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo062
            #add-point:ON ACTION controlp INFIELD fabo062 name="input.c.page1.fabo062"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo063
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo063
            #add-point:ON ACTION controlp INFIELD fabo063 name="input.c.page1.fabo063"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo064
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo064
            #add-point:ON ACTION controlp INFIELD fabo064 name="input.c.page1.fabo064"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo065
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo065
            #add-point:ON ACTION controlp INFIELD fabo065 name="input.c.page1.fabo065"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo066
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo066
            #add-point:ON ACTION controlp INFIELD fabo066 name="input.c.page1.fabo066"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo067
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo067
            #add-point:ON ACTION controlp INFIELD fabo067 name="input.c.page1.fabo067"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo068
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo068
            #add-point:ON ACTION controlp INFIELD fabo068 name="input.c.page1.fabo068"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.fabo069
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo069
            #add-point:ON ACTION controlp INFIELD fabo069 name="input.c.page1.fabo069"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_fabo_d[l_ac].* = g_fabo_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE afat504_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_fabo_d[l_ac].faboseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_fabo_d[l_ac].* = g_fabo_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               LET g_seq2 = g_fabo_d_t.faboseq  #170915-00031#6  add by 09767
               LET g_fabo_d_t.faboseq = l_seq   #170915-00031#6  add by 09767
               #200514-00005#1--add---str
               LET l_xrcds = 0
               SELECT COUNT(*) INTO l_xrcds
                 FROM xrcd_t
                WHERE xrcdent = g_enterprise
                  AND xrcdld  =   g_fabg_m.fabgld 
                  AND xrcddocno = g_fabg_m.fabgdocno 
                  AND xrcdseq =   g_fabo_d[l_ac].faboseq 
               #200514-00005#1--add---end
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL afat504_fabo_t_mask_restore('restore_mask_o')
      
               UPDATE fabo_t SET (fabold,fabodocno,faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035, 
                   fabo036,fabo037,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154, 
                   fabo155,fabo157,fabo158,fabo159,fabo160,fabo161) = (g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,g_fabo_d[l_ac].fabo009,g_fabo_d[l_ac].fabo005, 
                   g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019, 
                   g_fabo_d[l_ac].fabo021,g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049,g_fabo_d[l_ac].fabo025,g_fabo_d[l_ac].fabo023,g_fabo_d[l_ac].fabo031,g_fabo_d[l_ac].fabo032,g_fabo_d[l_ac].fabo033,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo055, 
                   g_fabo_d[l_ac].fabo056,g_fabo_d[l_ac].fabo038,g_fabo_d[l_ac].fabo039,g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo060,g_fabo_d[l_ac].fabo061,g_fabo_d[l_ac].fabo062,g_fabo_d[l_ac].fabo063,g_fabo_d[l_ac].fabo064,g_fabo_d[l_ac].fabo065,g_fabo_d[l_ac].fabo066,g_fabo_d[l_ac].fabo067, 
                   g_fabo_d[l_ac].fabo068,g_fabo_d[l_ac].fabo069,g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,g_fabo4_d[l_ac].fabo106,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,g_fabo4_d[l_ac].fabo110, 
                   g_fabo4_d[l_ac].fabo111,g_fabo4_d[l_ac].fabo112,g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo151,g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154,g_fabo4_d[l_ac].fabo155,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,g_fabo4_d[l_ac].fabo159, 
                   g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo161)
                WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld 
                  AND fabodocno = g_fabg_m.fabgdocno 
 
                  AND faboseq = g_fabo_d_t.faboseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               LET g_fabo_d_t.faboseq = g_seq2   #170915-00031#6 add by 09767
               IF l_xrcds > 0 THEN  #有值得请况下才更新   #200514-00005#1--add
                  #180821-00049#1----add----str
                  UPDATE xrcd_t SET xrcd005 = g_fabo_d[l_ac].fabo007,
                                    xrcd102 = g_fabo_d[l_ac].fabo006, 
                                    xrcd103 = g_fabo_d[l_ac].fabo012,
                                    xrcd104 = g_fabo_d[l_ac].fabo013,
                                    xrcd105 = g_fabo_d[l_ac].fabo014,
                                    xrcd112 = g_fabo_d[l_ac].fabo006 * g_fabg_m.fabg016,                                 
                                    xrcd113 = g_fabo_d[l_ac].fabo015,
                                    xrcd114 = g_fabo_d[l_ac].fabo016, 
                                    xrcd115 = g_fabo_d[l_ac].fabo017
                  WHERE xrcdent = g_enterprise
                    AND xrcdld  =   g_fabg_m.fabgld 
                    AND xrcddocno = g_fabg_m.fabgdocno 
                    AND xrcdseq =   g_fabo_d[l_ac].faboseq          
                  #180821-00049#1----add----end
               END IF  #200514-00005#1--add
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_fabo_d[l_ac].* = g_fabo_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_fabo_d[l_ac].* = g_fabo_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys_bak[1] = g_fabgld_t
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys_bak[2] = g_fabgdocno_t
               LET gs_keys[3] = g_fabo_d[g_detail_idx].faboseq
               LET gs_keys_bak[3] = g_fabo_d_t.faboseq
               CALL afat504_update_b('fabo_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL afat504_fabo_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_fabo_d[g_detail_idx].faboseq = g_fabo_d_t.faboseq 
 
                  ) THEN
                  LET gs_keys[01] = g_fabg_m.fabgld
                  LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_fabo_d_t.faboseq
 
                  CALL afat504_key_update_b(gs_keys,'fabo_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo_d_t)
               LET g_log2 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               #170412-00050#1--add--s--xul
               ##################交易税科目  
               SELECT fabo009 INTO l_fabo009 FROM fabo_t
                WHERE fabold=g_fabg_m.fabgld  AND fabodocno=g_fabg_m.fabgdocno  
                  AND faboseq=g_fabo_d[l_ac].faboseq AND faboent=g_enterprise     
                 #171023-00004#1---s--- mark
                 #應收有帳套時要取帳套慣用稅別設定會科
                 #SELECT glab005 INTO l_glab005
                 #  FROM glab_t
                 # WHERE glabent = g_enterprise
                 #   AND glabld = g_fabg_m.fabgld
                 #   AND glab001 = '14'
                 #   AND glab002 = '2'  # 銷項
                 #   AND glab003 = l_fabo009
                 ##取不到會科時表示以常用會科設定
                 #IF cl_null(l_glab005) THEN
                 #   SELECT glab005 INTO l_glab005
                 #     FROM glab_t
                 #    WHERE glabent = g_enterprise
                 #      AND glabld = g_fabg_m.fabgld
                 #      AND glab001 ='12'
                 #      AND glab002  ='9711'
                 #      AND glab003 = '9711_91'
                 #END IF
                 #171023-00004#1---e---
                 #171023-00004#1---s---
                 SELECT fabo030 INTO l_glab005
                   FROM fabo_t
                   WHERE fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno
                     AND faboseq=g_fabo_d[l_ac].faboseq AND faboent=g_enterprise
                 #171023-00004#1---e---                 
                 #再取不到，取帐款客户对应的账款类别设定的科目axri011
                 IF cl_null(l_glab005) THEN
                    #SELECT fabg006 INTO l_fabg006,l_fabgsite FROM fabg_t               #171023-00004#1 mark
                    # WHERE fabgent = g_enterprise AND fabgdocno = g_fabg_m.fabgdocno   #171023-00004#1 mark
                    SELECT pmab105 INTO l_pmab105 FROM pmab_t
                     WHERE pmabent = g_enterprise AND pmabsite = g_fabg_m.fabgsite AND pmab001 = g_fabg_m.fabg007   #171023-00004#1 add                                     
                     #WHERE pmabent = g_enterprise AND pmabsite = l_fabgsite AND pmab001 =l_fabg006                 #171023-00004#1 mark
                     SELECT glab005 INTO l_glab005 FROM glab_t 
                      WHERE glabld = g_fabg_m.fabgld
                        #AND glab001 = '14'  #171023-00004#1 mark
                        AND glab001 = '13'   #171023-00004#1 add                        
                        AND glab003 = '8304_29'
                        AND glabent = g_enterprise
                        AND glab002 =  l_pmab105      
                     #171023-00004#1---s---                     
                     UPDATE fabo_t SET  fabo030=l_glab005
                      WHERE fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno 
                        AND faboseq=g_fabo_d[l_ac].faboseq AND faboent=g_enterprise
                     #171023-00004#1---e---
                  END IF   
                 #171023-00004#1---s--- mark
                 #UPDATE fabo_t SET  fabo030=l_glab005
                 # WHERE fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno 
                 #   AND faboseq=g_fabo_d[l_ac].faboseq AND faboent=g_enterprise       
                 #170412-00050#1--add--e--xul
                 #171023-00004#1---e---                 
               #20141219 add by chenying
               #150916--s
               #有維護摘要就不取設定的摘要
               LET l_oocq009 = ''
               SELECT fabo042 INTO l_oocq009 FROM fabo_t 
                WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
                  AND fabodocno = g_fabg_m.fabgdocno               
                  AND faboseq = g_fabo_d_t.faboseq
               IF cl_null(l_oocq009) THEN
               #150916--e   
               #预设afai090摘要
                  LET l_oocq009 = ''
                  SELECT oocq009 INTO l_oocq009 FROM oocq_t 
                   WHERE oocqent=g_enterprise AND oocq001='3902' AND oocq002=g_fabo_d[l_ac].fabo023
               END IF   #150916 
               UPDATE fabo_t SET fabo042 = l_oocq009
                WHERE faboent = g_enterprise 
                  AND fabold  = g_fabg_m.fabgld 
                  AND fabodocno = g_fabg_m.fabgdocno 
                  AND faboseq = g_fabo_d[l_ac].faboseq   #項次 #160920-00025#1  mod xul  g_fabo_d_t.faboseq -> g_fabo_d[l_ac].faboseq
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t" 
                     LET g_errparam.code   = "std-00009" 
                     LET g_errparam.popup  = TRUE 
                     CALL s_transaction_end('N','0')         #171006-00010#13   add
                     CALL cl_err()
                     #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                     LET g_fabo_d[l_ac].* = g_fabo_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t" 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL s_transaction_end('N','0')         #171006-00010#13   add
                     CALL cl_err()
                     #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                     LET g_fabo_d[l_ac].* = g_fabo_d_t.* 
               END CASE              
               #20141219 add by chenying
               #170111-00030#1--add--s--xul
                  SELECT fabo049 INTO l_fabo049 
                    FROM fabo_t 
                   WHERE fabold= g_fabg_m.fabgld  AND fabodocno=g_fabg_m.fabgdocno 
                     AND faboseq= g_fabo_d[l_ac].faboseq AND faboent= g_enterprise
                  CALL cl_get_para(g_enterprise,g_fabg_m.fabgcomp,'S-FIN-9017') RETURNING l_para_data
                  IF l_para_data = 'Y' THEN           
                    LET l_scccode='9902_12'
                    LET l_glab002='25'
                  ELSE 
                    #资产处置不转入清理科目，判断‘处分损益fabo049’是否大于零 如果大于零，
                    #则取出售收益科目作为异动科目，否则取出售损失科目作为异动科目
                    IF l_fabo049 > 0 THEN  
                       LET l_scccode='9902_06' 
                       LET l_glab002='41'            
                    ELSE 
                       LET l_scccode='9902_07'
                       LET l_glab002='42'            
                    END IF                     
                  END IF
                  SELECT glab005 INTO l_fabo024 FROM glab_t
                   WHERE glabent=g_enterprise AND glabld = g_fabg_m.fabgld AND glab001='90' AND glab002=l_glab002 AND glab003=l_scccode
                   IF l_ac > 0 THEN                      
                      UPDATE fabo_t SET fabo024=l_fabo024
                       WHERE fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno  
                         AND faboseq=g_fabo_d[l_ac].faboseq AND faboent= g_enterprise
                      CASE
                         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                            LET g_fabo_d[l_ac].* = g_fabo_d_t.*
                            INITIALIZE g_errparam TO NULL 
                            LET g_errparam.extend = "UPDATE fabo024" 
                            LET g_errparam.code = "std-00009" 
                            LET g_errparam.popup = TRUE 
                            CALL s_transaction_end('N','0')
                            CALL cl_err()
                            
                         WHEN SQLCA.SQLCODE #其他錯誤
                            LET g_fabo_d[l_ac].* = g_fabo_d_t.*  
                            INITIALIZE g_errparam TO NULL 
                            LET g_errparam.extend = "UPDATE fabo024:",SQLERRMESSAGE 
                            LET g_errparam.code = SQLCA.SQLCODE 
                            LET g_errparam.popup = TRUE 
                            CALL s_transaction_end('N','0')
                            CALL cl_err() 
                         END CASE    
                   END IF
               #170111-00030#1--add--e--xul
               IF g_fabo_d[l_ac].fabo001 <> g_fabo_d_t.fabo001 OR g_fabo_d[l_ac].fabo002 <> g_fabo_d_t.fabo002
                  OR g_fabo_d[l_ac].fabo003 <> g_fabo_d_t.fabo003 OR g_fabo_d[l_ac].faboseq <> g_fabo_d_t.faboseq 
                  OR g_fabo_d[l_ac].fabo007 <> g_fabo_d_t.fabo007 THEN   
                  
                  IF g_fabo_d[l_ac].fabo001 <> g_fabo_d_t.fabo001 OR g_fabo_d[l_ac].fabo002 <> g_fabo_d_t.fabo002
                  OR g_fabo_d[l_ac].fabo003 <> g_fabo_d_t.fabo003 OR g_fabo_d[l_ac].faboseq <> g_fabo_d_t.faboseq THEN
                    DELETE FROM fabi_t
                     WHERE fabient = g_enterprise AND fabidocno = g_fabg_m.fabgdocno 
                       AND fabi000 = g_fabg_m.fabg005 AND fabiseq = g_fabo_d_t.faboseq
                  END IF 
                  
                  SELECT COUNT(1) INTO l_n FROM faai_t   #160905-00007#2 count(*) --> count(1)
                   WHERE faaient = g_enterprise AND faai001 = g_fabo_d[l_ac].fabo003
                     AND faai002 = g_fabo_d[l_ac].fabo001 AND faai003 = g_fabo_d[l_ac].fabo002
                  IF l_n > 0 THEN 
                     CALL afat440_01(l_cmd,g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,
                                  g_fabo_d[l_ac].fabo003,g_fabg_m.fabg005,g_fabg_m.fabgdocno,
                                  g_fabo_d[l_ac].fabo007)                                  
                  END IF              
               END IF
               
               
               #170915-00031#6  add by 09767-->s
               IF g_fabo_d[l_ac].faboseq != l_seq THEN
                 LET l_cnt = 0
                 SELECT COUNT(1) INTO l_cnt
                   FROM xrcd_t
                  WHERE xrcdent = g_enterprise
                    AND xrcddocno = g_fabg_m.fabgdocno
                    AND xrcdseq = g_fabo_d[l_ac].faboseq
                 IF l_cnt > 0 THEN
                    DELETE FROM xrcd_t
                     WHERE xrcdent = g_enterprise
                        AND xrcddocno = g_fabg_m.fabgdocno
                        AND xrcdseq = l_seq
                    IF SQLCA.sqlcode THEN
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.extend = "DELETE xrcd_t"
                       LET g_errparam.code   = SQLCA.sqlcode
                       LET g_errparam.popup  = FALSE
                       CALL s_transaction_end('N','0')         #171006-00010#13   add
                       CALL cl_err()
                       #CALL s_transaction_end('N','0')        #171006-00010#13   mask
                    END IF
                 ELSE 
                  UPDATE xrcd_t SET xrcdseq = g_fabo_d[l_ac].faboseq
                      WHERE xrcdent = g_enterprise AND xrcddocno = g_fabg_m.fabgdocno AND xrcdseq = l_seq
                 END IF
               END IF
               #170915-00031#6  add by 09767-->e
               
               
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL afat504_unlock_b("fabo_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
#            IF l_cmd <> 'd' AND l_ac > 0 THEN 
#               CALL afat504_01_set_default_value(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].faboseq)  #设定afat504_01默认值
#            END IF 
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
#            CALL afat504_b_fill()
#            IF l_cmd <> 'd' AND l_ac > 0 THEN 
#               CALL afat504_01_set_default_value(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].faboseq)  #设定afat504_01默认值
#            END IF
            IF g_fabg_m.fabg013 <> g_fabo_d[l_ac].fabo009 THEN  #180821-00049#1----add
               CALL afat504_tax_upd() #170901-00039#1 add
            END IF   #180821-00049#1----add
            CALL afat504_show()  #20141118
            #180718-00057#1 add s---
            UPDATE fabo_t SET fabo030=g_fabo3_d[l_ac].xrcd009
             WHERE faboent=g_enterprise AND fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo_d[l_ac].faboseq            
            #180718-00057#1 add e---
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
                  LET g_fabo_d[li_reproduce_target].* = g_fabo_d[li_reproduce].*
               LET g_fabo4_d[li_reproduce_target].* = g_fabo4_d[li_reproduce].*
 
                  LET g_fabo_d[li_reproduce_target].faboseq = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_fabo_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_fabo_d.getLength()+1
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
      
      INPUT ARRAY g_fabo3_d FROM s_detail3.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效!
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body3.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_fabo3_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL afat504_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_fabo3_d.getLength()
            #add-point:資料輸入前 name="input.body3.before_input"
            CALL cl_set_act_visible("controlo",FALSE ) #180828-00006#2 add
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            CALL afat504_idx_chk()   #(ver:83)
            LET l_cmd = 'a'
            INITIALIZE g_fabo3_d[l_ac].* TO NULL 
            INITIALIZE g_fabo3_d_t.* TO NULL 
            INITIALIZE g_fabo3_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_fabo3_d[l_ac].xrcd006 = "N"
      LET g_fabo3_d[l_ac].xrcd005 = "1"
 
            #add-point:modify段before備份 name="input.body3.insert.before_bak"
            
            #end add-point
            LET g_fabo3_d_t.* = g_fabo3_d[l_ac].*     #新輸入資料
            LET g_fabo3_d_o.* = g_fabo3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL afat504_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body3.insert.after_set_entry_b"
            
            #end add-point
            CALL afat504_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_fabo3_d[li_reproduce_target].* = g_fabo3_d[li_reproduce].*
 
               LET g_fabo3_d[li_reproduce_target].xrcdseq = NULL
               LET g_fabo3_d[li_reproduce_target].xrcdseq2 = NULL
               LET g_fabo3_d[li_reproduce_target].xrcd007 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body3.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body3.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[2] = l_ac   #210121-00015 modify
            LET g_current_page = 2
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE afat504_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 ---start---
            FETCH afat504_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH afat504_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE afat504_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
            
            LET g_rec_b = g_fabo3_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_fabo3_d[l_ac].xrcdseq IS NOT NULL
               AND g_fabo3_d[l_ac].xrcdseq2 IS NOT NULL
               AND g_fabo3_d[l_ac].xrcd007 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_fabo3_d_t.* = g_fabo3_d[l_ac].*  #BACKUP
               LET g_fabo3_d_o.* = g_fabo3_d[l_ac].*  #BACKUP
               CALL afat504_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body3.after_set_entry_b"
               
               #end add-point  
               CALL afat504_set_no_entry_b(l_cmd)
               IF NOT afat504_lock_b("xrcd_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH afat504_bcl2 INTO g_fabo3_d[l_ac].xrcdseq,g_fabo3_d[l_ac].xrcdseq2,g_fabo3_d[l_ac].xrcd007,g_fabo3_d[l_ac].xrcd002,g_fabo3_d[l_ac].xrcd003,g_fabo3_d[l_ac].xrcd006,g_fabo3_d[l_ac].xrcd100,g_fabo3_d[l_ac].xrcd005,g_fabo3_d[l_ac].xrcd104,g_fabo3_d[l_ac].xrcd103,g_fabo3_d[l_ac].xrcd105, 
                      g_fabo3_d[l_ac].xrcd009,g_fabo3_d[l_ac].xrcd113,g_fabo3_d[l_ac].xrcd114,g_fabo3_d[l_ac].xrcd115
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_fabo3_d_mask_o[l_ac].* =  g_fabo3_d[l_ac].*
                  CALL afat504_xrcd_t_mask()
                  LET g_fabo3_d_mask_n[l_ac].* =  g_fabo3_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL afat504_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body3.before_row"
            #科目
            IF cl_null(g_fabo3_d[l_ac].xrcd009) THEN 
               SELECT glab005 INTO g_fabo3_d[l_ac].xrcd009 FROM glab_t
                WHERE glabent=g_enterprise AND glabld= g_fabg_m.fabgld 
                  AND glab001='14' AND glab002='2' AND glab003=g_fabo3_d[l_ac].xrcd002
               IF SQLCA.SQLCODE=100 THEN
                  SELECT glab005 INTO g_fabo3_d[l_ac].xrcd009 FROM glab_t 
                   WHERE glabent=g_enterprise AND glabld = g_fabg_m.fabgld 
                     AND glab001 ='12' AND glab002  ='9711'  AND glab003 = '9711_91' 
               END IF
               CALL afat504_xrcd009_desc(g_fabo3_d[l_ac].xrcd009) RETURNING g_fabo3_d[l_ac].xrcd009_desc
               DISPLAY BY NAME g_fabo3_d[l_ac].xrcd009,g_fabo3_d[l_ac].xrcd009_desc
            END IF
            CALL afat504_get_fabo001()
            CALL afat504_xrcd002_desc(g_fabo3_d[l_ac].xrcd002) RETURNING g_fabo3_d[l_ac].xrcd002_desc
            #20141119 add--str-- by chenying
            #预设税别科目（aisi070中获取）
            #根据账款客户抓取账款类别
            #IF cl_null(g_fabo3_d[l_ac].xrcd009) THEN 
            #   SELECT pmab105 INTO l_glab002 FROM pmab_t
            #    WHERE pmabent = g_enterprise AND pmabsite = g_fabg_m.fabgsite AND pmab001 = g_fabg_m.fabg006
            #   
            #   SELECT glab005 INTO g_fabo3_d[l_ac].xrcd009 FROM glab_t 
            #    WHERE glabld = g_fabg_m.fabgld 
            #      AND glab001 = '14'               # 税别会计科目设置
            #      AND glab003 = g_fabg_m.fabg013   # 税别
            #      AND glabent = g_enterprise                  
            #END IF      
         #20141119 add--end--    
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            CALL afat504_idx_chk()   #(ver:83)
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body3.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body3.b_delete_ask"
               
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
               
               #add-point:單身2刪除前 name="input.body3.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_fabg_m.fabgld
               LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
               LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcdseq
               LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcdseq2
               LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcd007
            
               #刪除同層單身
               IF NOT afat504_delete_b('xrcd_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT afat504_key_delete_b(gs_keys,'xrcd_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
   #161130-00056 add
               
               #add-point:單身2刪除中 name="input.body3.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE afat504_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body3.a_delete"
               
               #end add-point
               LET l_count = g_fabo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body3.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_fabo3_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
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
               
            #add-point:單身2新增前 name="input.body3.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM xrcd_t 
             WHERE xrcdent = g_enterprise AND xrcdld = g_fabg_m.fabgld
               AND xrcddocno = g_fabg_m.fabgdocno
               AND xrcdseq = g_fabo3_d[l_ac].xrcdseq
               AND xrcdseq2 = g_fabo3_d[l_ac].xrcdseq2
               AND xrcd007 = g_fabo3_d[l_ac].xrcd007
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body3.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys[3] = g_fabo3_d[g_detail_idx].xrcdseq
               LET gs_keys[4] = g_fabo3_d[g_detail_idx].xrcdseq2
               LET gs_keys[5] = g_fabo3_d[g_detail_idx].xrcd007
               CALL afat504_insert_b('xrcd_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body3.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_fabo_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL afat504_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:單身新增後 name="input.body3.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_fabo3_d[l_ac].* = g_fabo3_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE afat504_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_fabo3_d[l_ac].* = g_fabo3_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body3.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL afat504_xrcd_t_mask_restore('restore_mask_o')
                              
               UPDATE xrcd_t SET (xrcdld,xrcddocno,xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcd113,xrcd114,xrcd115) = (g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabo3_d[l_ac].xrcdseq,g_fabo3_d[l_ac].xrcdseq2,g_fabo3_d[l_ac].xrcd007,g_fabo3_d[l_ac].xrcd002, 
                   g_fabo3_d[l_ac].xrcd003,g_fabo3_d[l_ac].xrcd006,g_fabo3_d[l_ac].xrcd100,g_fabo3_d[l_ac].xrcd005,g_fabo3_d[l_ac].xrcd104,g_fabo3_d[l_ac].xrcd103,g_fabo3_d[l_ac].xrcd105,g_fabo3_d[l_ac].xrcd009,g_fabo3_d[l_ac].xrcd113,g_fabo3_d[l_ac].xrcd114,g_fabo3_d[l_ac].xrcd115) #自訂欄位頁簽 
 
                WHERE xrcdent = g_enterprise AND xrcdld = g_fabg_m.fabgld
                  AND xrcddocno = g_fabg_m.fabgdocno
                  AND xrcdseq = g_fabo3_d_t.xrcdseq #項次 
                  AND xrcdseq2 = g_fabo3_d_t.xrcdseq2
                  AND xrcd007 = g_fabo3_d_t.xrcd007
                  
               #add-point:單身page2修改中 name="input.body3.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_fabo3_d[l_ac].* = g_fabo3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrcd_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_fabo3_d[l_ac].* = g_fabo3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys_bak[1] = g_fabgld_t
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys_bak[2] = g_fabgdocno_t
               LET gs_keys[3] = g_fabo3_d[g_detail_idx].xrcdseq
               LET gs_keys_bak[3] = g_fabo3_d_t.xrcdseq
               LET gs_keys[4] = g_fabo3_d[g_detail_idx].xrcdseq2
               LET gs_keys_bak[4] = g_fabo3_d_t.xrcdseq2
               LET gs_keys[5] = g_fabo3_d[g_detail_idx].xrcd007
               LET gs_keys_bak[5] = g_fabo3_d_t.xrcd007
               CALL afat504_update_b('xrcd_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL afat504_xrcd_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_fabo3_d[g_detail_idx].xrcdseq = g_fabo3_d_t.xrcdseq 
                  AND g_fabo3_d[g_detail_idx].xrcdseq2 = g_fabo3_d_t.xrcdseq2 
                  AND g_fabo3_d[g_detail_idx].xrcd007 = g_fabo3_d_t.xrcd007 
                  ) THEN
                  LET gs_keys[01] = g_fabg_m.fabgld
                  LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcdseq
                  LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcdseq2
                  LET gs_keys[gs_keys.getLength()+1] = g_fabo3_d_t.xrcd007
                  CALL afat504_key_update_b(gs_keys,'xrcd_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo3_d_t)
               LET g_log2 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo3_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body3.a_update"
               #170512-00045#30 add-s
               IF g_fabo3_d[l_ac].xrcd009<>g_fabo3_d_t.xrcd009 OR cl_null(g_fabo3_d_t.xrcd009)  THEN
                  #更新核算项
                  UPDATE fabo_t SET (fabo031,fabo032,fabo033,fabo034,fabo035,fabo036,fabo037,fabo054,fabo055,fabo056,fabo038,fabo039,fabo040,
                                     fabo057,   #201116-00024#1 add                  
                            fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069)=(g_fabo_d2[l_ac].fabo031,
                            g_fabo_d2[l_ac].fabo032,g_fabo_d2[l_ac].fabo033,g_fabo_d2[l_ac].fabo034,g_fabo_d2[l_ac].fabo035,g_fabo_d2[l_ac].fabo036,
                            g_fabo_d2[l_ac].fabo037,g_fabo_d2[l_ac].fabo054,g_fabo_d2[l_ac].fabo055,g_fabo_d2[l_ac].fabo056,g_fabo_d2[l_ac].fabo038,
                           #g_fabo_d2[l_ac].fabo039,g_fabo_d2[l_ac].fabo040,g_fabo_d2[l_ac].fabo060,g_fabo_d2[l_ac].fabo061,g_fabo_d2[l_ac].fabo062,   #201116-00024#1 mark
                            g_fabo_d2[l_ac].fabo039,g_fabo_d2[l_ac].fabo040,g_fabo_d2[l_ac].fabo057,g_fabo_d2[l_ac].fabo060,g_fabo_d2[l_ac].fabo061,g_fabo_d2[l_ac].fabo062,   #201116-00024#1 add
                            g_fabo_d2[l_ac].fabo063,g_fabo_d2[l_ac].fabo064,g_fabo_d2[l_ac].fabo065,g_fabo_d2[l_ac].fabo066,g_fabo_d2[l_ac].fabo067,
                            g_fabo_d2[l_ac].fabo068,g_fabo_d2[l_ac].fabo069)
                            
                   WHERE faboent=g_enterprise AND fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo3_d[l_ac].xrcdseq
               END IF
               #170512-00045#30 add-e
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdseq
            #add-point:BEFORE FIELD xrcdseq name="input.b.page3.xrcdseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcdseq
            
            #add-point:AFTER FIELD xrcdseq name="input.a.page3.xrcdseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_fabg_m.fabgld IS NOT NULL AND g_fabg_m.fabgdocno IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq2 IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcd007 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t OR g_fabg_m.fabgdocno != g_fabgdocno_t OR g_fabo3_d[g_detail_idx].xrcdseq != g_fabo3_d_t.xrcdseq OR g_fabo3_d[g_detail_idx].xrcdseq2 != g_fabo3_d_t.xrcdseq2 OR g_fabo3_d[g_detail_idx].xrcd007 != g_fabo3_d_t.xrcd007)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM xrcd_t WHERE "||"xrcdent = '" ||g_enterprise|| "' AND "||"xrcdld = '"||g_fabg_m.fabgld ||"' AND "|| "xrcddocno = '"||g_fabg_m.fabgdocno ||"' AND "|| "xrcdseq = '"||g_fabo3_d[g_detail_idx].xrcdseq ||"' AND "|| "xrcdseq2 = '"||g_fabo3_d[g_detail_idx].xrcdseq2 ||"' AND "|| "xrcd007 = '"||g_fabo3_d[g_detail_idx].xrcd007 ||"'",'std-00004',0) THEN #160905-00007#2 count(*) --> count(1)
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcdseq
            #add-point:ON CHANGE xrcdseq name="input.g.page3.xrcdseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdseq2
            #add-point:BEFORE FIELD xrcdseq2 name="input.b.page3.xrcdseq2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcdseq2
            
            #add-point:AFTER FIELD xrcdseq2 name="input.a.page3.xrcdseq2"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_fabg_m.fabgld IS NOT NULL AND g_fabg_m.fabgdocno IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq2 IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcd007 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t OR g_fabg_m.fabgdocno != g_fabgdocno_t OR g_fabo3_d[g_detail_idx].xrcdseq != g_fabo3_d_t.xrcdseq OR g_fabo3_d[g_detail_idx].xrcdseq2 != g_fabo3_d_t.xrcdseq2 OR g_fabo3_d[g_detail_idx].xrcd007 != g_fabo3_d_t.xrcd007)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM xrcd_t WHERE "||"xrcdent = '" ||g_enterprise|| "' AND "||"xrcdld = '"||g_fabg_m.fabgld ||"' AND "|| "xrcddocno = '"||g_fabg_m.fabgdocno ||"' AND "|| "xrcdseq = '"||g_fabo3_d[g_detail_idx].xrcdseq ||"' AND "|| "xrcdseq2 = '"||g_fabo3_d[g_detail_idx].xrcdseq2 ||"' AND "|| "xrcd007 = '"||g_fabo3_d[g_detail_idx].xrcd007 ||"'",'std-00004',0) THEN #160905-00007#2 count(*) --> count(1) 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcdseq2
            #add-point:ON CHANGE xrcdseq2 name="input.g.page3.xrcdseq2"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo001_1
            #add-point:BEFORE FIELD fabo001_1 name="input.b.page3.fabo001_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo001_1
            
            #add-point:AFTER FIELD fabo001_1 name="input.a.page3.fabo001_1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo001_1
            #add-point:ON CHANGE fabo001_1 name="input.g.page3.fabo001_1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd007
            #add-point:BEFORE FIELD xrcd007 name="input.b.page3.xrcd007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd007
            
            #add-point:AFTER FIELD xrcd007 name="input.a.page3.xrcd007"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_fabg_m.fabgld IS NOT NULL AND g_fabg_m.fabgdocno IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcdseq2 IS NOT NULL AND g_fabo3_d[g_detail_idx].xrcd007 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t OR g_fabg_m.fabgdocno != g_fabgdocno_t OR g_fabo3_d[g_detail_idx].xrcdseq != g_fabo3_d_t.xrcdseq OR g_fabo3_d[g_detail_idx].xrcdseq2 != g_fabo3_d_t.xrcdseq2 OR g_fabo3_d[g_detail_idx].xrcd007 != g_fabo3_d_t.xrcd007)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM xrcd_t WHERE "||"xrcdent = '" ||g_enterprise|| "' AND "||"xrcdld = '"||g_fabg_m.fabgld ||"' AND "|| "xrcddocno = '"||g_fabg_m.fabgdocno ||"' AND "|| "xrcdseq = '"||g_fabo3_d[g_detail_idx].xrcdseq ||"' AND "|| "xrcdseq2 = '"||g_fabo3_d[g_detail_idx].xrcdseq2 ||"' AND "|| "xrcd007 = '"||g_fabo3_d[g_detail_idx].xrcd007 ||"'",'std-00004',0) THEN #160905-00007#2 count(*) --> count(1) 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd007
            #add-point:ON CHANGE xrcd007 name="input.g.page3.xrcd007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd002
            
            #add-point:AFTER FIELD xrcd002 name="input.a.page3.xrcd002"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002
            #add-point:BEFORE FIELD xrcd002 name="input.b.page3.xrcd002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd002
            #add-point:ON CHANGE xrcd002 name="input.g.page3.xrcd002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002_desc
            #add-point:BEFORE FIELD xrcd002_desc name="input.b.page3.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd002_desc
            
            #add-point:AFTER FIELD xrcd002_desc name="input.a.page3.xrcd002_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd002_desc
            #add-point:ON CHANGE xrcd002_desc name="input.g.page3.xrcd002_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd003
            #add-point:BEFORE FIELD xrcd003 name="input.b.page3.xrcd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd003
            
            #add-point:AFTER FIELD xrcd003 name="input.a.page3.xrcd003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd003
            #add-point:ON CHANGE xrcd003 name="input.g.page3.xrcd003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd006
            #add-point:BEFORE FIELD xrcd006 name="input.b.page3.xrcd006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd006
            
            #add-point:AFTER FIELD xrcd006 name="input.a.page3.xrcd006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd006
            #add-point:ON CHANGE xrcd006 name="input.g.page3.xrcd006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd100
            #add-point:BEFORE FIELD xrcd100 name="input.b.page3.xrcd100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd100
            
            #add-point:AFTER FIELD xrcd100 name="input.a.page3.xrcd100"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd100
            #add-point:ON CHANGE xrcd100 name="input.g.page3.xrcd100"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd005
            #add-point:BEFORE FIELD xrcd005 name="input.b.page3.xrcd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd005
            
            #add-point:AFTER FIELD xrcd005 name="input.a.page3.xrcd005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd005
            #add-point:ON CHANGE xrcd005 name="input.g.page3.xrcd005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd009
            
            #add-point:AFTER FIELD xrcd009 name="input.a.page3.xrcd009"
            IF NOT cl_null(g_fabo3_d[l_ac].xrcd009) THEN   
                #  150916-00015#1 BEGIN    快捷带出类似科目编号     ADD BY XZG201511202
               
             LET l_sql = " "
             IF  s_aglt310_getlike_lc_subject(g_fabg_m.fabgld,g_fabo3_d[l_ac].xrcd009,l_sql) THEN
                INITIALIZE g_qryparam.* TO NULL
                SELECT glaa004 INTO l_glaa004
                 FROM glaa_t
                WHERE glaaent = g_enterprise
                  AND glaald = g_fabg_m.fabgld
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = 'FALSE'
               LET g_qryparam.default1 = g_fabo3_d[l_ac].xrcd009
               
               LET g_qryparam.arg1 = l_glaa004
               LET g_qryparam.arg2 = g_fabo3_d[l_ac].xrcd009
               LET g_qryparam.arg3 = g_fabg_m.fabgld
               LET g_qryparam.arg4 = "1 AND glac001 = '",g_glaa.glaa004,"' AND glac003 <> 1 AND glac006 = '1'"
               CALL q_glac002_6()
               LET g_fabo3_d[l_ac].xrcd009 = g_qryparam.return1              
          
               CALL afat504_xrcd009_desc(g_fabo3_d[l_ac].xrcd009) RETURNING g_fabo3_d[l_ac].xrcd009_desc
            
#              DISPLAY g_fabo3_d[l_ac].xrcd009 TO xrcd009  #160616-00005#3 mark

             END IF
              IF  NOT s_aglt310_lc_subject(g_fabg_m.fabgld,g_fabo3_d[l_ac].xrcd009,'N') THEN
                  LET g_fabo3_d[l_ac].xrcd009 = g_fabo3_d_t.xrcd009
                  NEXT FIELD xrcd009 
              END IF
           
              #  150916-00015#1 END            
               CALL afat504_xrcd009_chk(g_fabo3_d[l_ac].xrcd009)
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_fabo3_d[l_ac].xrcd009
                  #160318-00005#11   --add--str
                  LET g_errparam.replace[1] ='agli020'
                  LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                  LET g_errparam.exeprog    ='agli020'
                  #160318-00005#11  --add--end
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET g_fabo3_d[l_ac].xrcd009 = g_fabo3_d_t.xrcd009
                  NEXT FIELD xrcd009                  
               END IF
               #170421-00027#5  By 09505   --(S)--
               LET lc_param2.glbi001 = g_prog
               LET lc_param2.glbild  = g_fabg_m.fabgld
               LET lc_param2.docno   = g_fabg_m.fabgdocno
               LET lc_param2.glbi003 = g_fabo3_d[l_ac].xrcd009
               LET ls_js = util.JSON.stringify(lc_param2)
               CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
               IF NOT l_success THEN
                  LET g_fabo3_d[l_ac].xrcd009 = g_fabo3_d_t.xrcd009               
                  NEXT FIELD xrcd009
               END IF  
               #170421-00027#5  By 09505   --(E)-- 
               #170512-00045#30 add-s 
               IF g_fabo3_d[l_ac].xrcd009<>g_fabo3_d_t.xrcd009 OR cl_null(g_fabo3_d_t.xrcd009)  THEN
                  INITIALIZE la_param.* TO NULL
                  LET la_param.glaq0021=g_fabo3_d[l_ac].xrcd009
                  LET ls_js=util.JSON.stringify(la_param)
                  INITIALIZE g_glaq_s[1].* TO NULL
                  #171023-00004#15 ---s----
                                                                                         
                  LET  g_glaq_s[l_ac].glaq017 = g_fabo_d2[l_ac].fabo031
                  LET  g_glaq_s[l_ac].glaq018 = g_fabo_d2[l_ac].fabo032
                  #181015-00013#3   add-S
                  IF cl_null(g_glaq_s[l_ac].glaq018) THEN  
                     LET l_faaj006 = ''
                     LET l_faaj007 = ''
                     SELECT faaj006,faaj007 INTO l_faaj006,l_faaj007
                       FROM faaj_t
                      WHERE faajent = g_enterprise
                        AND faajld  = g_fabg_m.fabgld
                        AND faaj001 = g_fabo_d[l_ac].fabo001
                        AND faaj002 = g_fabo_d[l_ac].fabo002
                        AND faaj037 = g_fabo_d[l_ac].fabo003
                     CASE l_faaj006
                        WHEN '1'  #单一部门分摊 
                             LET g_glaq_s[l_ac].glaq018 = l_faaj007      
                        WHEN '2'  #多部门分摊
                             LET g_glaq_s[l_ac].glaq018 = g_fabg_m.fabg003  
                        WHEN '4'  #依标签部门分摊
                             LET g_glaq_s[l_ac].glaq018 = g_fabg_m.fabg003  
                     END CASE
                  END IF 
                  #181015-00013#3   add-E
                  LET  g_glaq_s[l_ac].glaq019 = g_fabo_d2[l_ac].fabo033
                  LET  g_glaq_s[l_ac].glaq020 = g_fabo_d2[l_ac].fabo034
                  LET  g_glaq_s[l_ac].glaq021 = g_fabo_d2[l_ac].fabo035
                  LET  g_glaq_s[l_ac].glaq022 = g_fabo_d2[l_ac].fabo036
                  LET  g_glaq_s[l_ac].glaq023 = g_fabo_d2[l_ac].fabo037
                  LET  g_glaq_s[l_ac].glaq051 = g_fabo_d2[l_ac].fabo055
                  LET  g_glaq_s[l_ac].glaq052 = g_fabo_d2[l_ac].fabo055
                  LET  g_glaq_s[l_ac].glaq053 = g_fabo_d2[l_ac].fabo056
                  LET  g_glaq_s[l_ac].glaq024 = g_fabo_d2[l_ac].fabo057   #201116-00024#1 add                  
                  LET  g_glaq_s[l_ac].glaq025 = g_fabo_d2[l_ac].fabo038
                  LET  g_glaq_s[l_ac].glaq027 = g_fabo_d2[l_ac].fabo039
                  LET  g_glaq_s[l_ac].glaq028 = g_fabo_d2[l_ac].fabo040
                  LET  g_glaq_s[l_ac].glaq029 = g_fabo_d2[l_ac].fabo060
                  LET  g_glaq_s[l_ac].glaq030 = g_fabo_d2[l_ac].fabo061
                  LET  g_glaq_s[l_ac].glaq031 = g_fabo_d2[l_ac].fabo062
                  LET  g_glaq_s[l_ac].glaq032 = g_fabo_d2[l_ac].fabo063
                  LET  g_glaq_s[l_ac].glaq033 = g_fabo_d2[l_ac].fabo064
                  LET  g_glaq_s[l_ac].glaq034 = g_fabo_d2[l_ac].fabo065
                  LET  g_glaq_s[l_ac].glaq035 = g_fabo_d2[l_ac].fabo066
                  LET  g_glaq_s[l_ac].glaq036 = g_fabo_d2[l_ac].fabo067
                  LET  g_glaq_s[l_ac].glaq037 = g_fabo_d2[l_ac].fabo068
                  LET  g_glaq_s[l_ac].glaq038 = g_fabo_d2[l_ac].fabo069
                  #171023-00004#15 ---e---          
                  #CALL aglt310_08('',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabo3_d[l_ac].xrcdseq,'afat504',g_glaq_s[1].*,ls_js)   #171023-00004#15 mark
                  CALL aglt310_08('',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabo3_d[l_ac].xrcdseq,'afat504',g_glaq_s[l_ac].*,ls_js) #171023-00004#15 add
                  RETURNING g_glaq_s[1].glaq017,g_glaq_s[1].glaq018,g_glaq_s[1].glaq019,g_glaq_s[1].glaq020,g_glaq_s[1].glaq021,
                            g_glaq_s[1].glaq022,g_glaq_s[1].glaq023,g_glaq_s[1].glaq024,g_glaq_s[1].glaq051,g_glaq_s[1].glaq052,
                            g_glaq_s[1].glaq053,g_glaq_s[1].glaq025,g_glaq_s[1].glaq027,g_glaq_s[1].glaq028,g_glaq_s[1].glaq029,
                            g_glaq_s[1].glaq030,g_glaq_s[1].glaq031,g_glaq_s[1].glaq032,g_glaq_s[1].glaq033,g_glaq_s[1].glaq034,
                            g_glaq_s[1].glaq035,g_glaq_s[1].glaq036,g_glaq_s[1].glaq037,g_glaq_s[1].glaq038,g_glaq_s[1].glbc004
                  
                  #取已维护好的核算项值
                  SELECT fabo031,fabo032,fabo033,fabo034,fabo035,fabo036,fabo037,fabo054,fabo055,fabo056,fabo038,fabo039,fabo040,                        
                         fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069 
                        ,fabo057   #201116-00024#1 add
                    INTO g_glaq_s[2].glaq017,g_glaq_s[2].glaq018,g_glaq_s[2].glaq019,g_glaq_s[2].glaq020,g_glaq_s[2].glaq021,
                         g_glaq_s[2].glaq022,g_glaq_s[2].glaq023,g_glaq_s[2].glaq051,g_glaq_s[2].glaq052,g_glaq_s[2].glaq053,
                         g_glaq_s[2].glaq025,g_glaq_s[2].glaq027,g_glaq_s[2].glaq028,g_glaq_s[2].glaq029,g_glaq_s[2].glaq030,
                         g_glaq_s[2].glaq031,g_glaq_s[2].glaq032,g_glaq_s[2].glaq033,g_glaq_s[2].glaq034,g_glaq_s[2].glaq035,
                         g_glaq_s[2].glaq036,g_glaq_s[2].glaq037,g_glaq_s[2].glaq038
                        ,g_glaq_s[2].glaq024   #201116-00024#1 add                         
                    FROM fabo_t
                   WHERE faboent=g_enterprise AND fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo3_d[l_ac].xrcdseq
                  
                   CASE WHEN g_glaq_s[1].glaq017 <> ' '  LET g_fabo_d2[l_ac].fabo031  = g_glaq_s[1].glaq017   WHEN g_glaq_s[2].glaq017 <> ' ' LET g_fabo_d2[l_ac].fabo031  = g_glaq_s[2].glaq017 END CASE              
                   CASE WHEN g_glaq_s[1].glaq018 <> ' '  LET g_fabo_d2[l_ac].fabo032  = g_glaq_s[1].glaq018   WHEN g_glaq_s[2].glaq018 <> ' ' LET g_fabo_d2[l_ac].fabo032  = g_glaq_s[2].glaq018 END CASE
                   CASE WHEN g_glaq_s[1].glaq019 <> ' '  LET g_fabo_d2[l_ac].fabo033  = g_glaq_s[1].glaq019   WHEN g_glaq_s[2].glaq019 <> ' ' LET g_fabo_d2[l_ac].fabo033  = g_glaq_s[2].glaq019 END CASE              
                   CASE WHEN g_glaq_s[1].glaq020 <> ' '  LET g_fabo_d2[l_ac].fabo034  = g_glaq_s[1].glaq020   WHEN g_glaq_s[2].glaq020 <> ' ' LET g_fabo_d2[l_ac].fabo034  = g_glaq_s[2].glaq020 END CASE
                   CASE WHEN g_glaq_s[1].glaq021 <> ' '  LET g_fabo_d2[l_ac].fabo035  = g_glaq_s[1].glaq021   WHEN g_glaq_s[2].glaq021 <> ' ' LET g_fabo_d2[l_ac].fabo035  = g_glaq_s[2].glaq021 END CASE              
                   CASE WHEN g_glaq_s[1].glaq022 <> ' '  LET g_fabo_d2[l_ac].fabo036  = g_glaq_s[1].glaq022   WHEN g_glaq_s[2].glaq022 <> ' ' LET g_fabo_d2[l_ac].fabo036  = g_glaq_s[2].glaq022 END CASE
                   CASE WHEN g_glaq_s[1].glaq023 <> ' '  LET g_fabo_d2[l_ac].fabo037  = g_glaq_s[1].glaq023   WHEN g_glaq_s[2].glaq023 <> ' ' LET g_fabo_d2[l_ac].fabo037  = g_glaq_s[2].glaq023 END CASE              
                   CASE WHEN g_glaq_s[1].glaq051 <> ' '  LET g_fabo_d2[l_ac].fabo054  = g_glaq_s[1].glaq051   WHEN g_glaq_s[2].glaq051 <> ' ' LET g_fabo_d2[l_ac].fabo054  = g_glaq_s[2].glaq051 END CASE
                   CASE WHEN g_glaq_s[1].glaq052 <> ' '  LET g_fabo_d2[l_ac].fabo055  = g_glaq_s[1].glaq052   WHEN g_glaq_s[2].glaq052 <> ' ' LET g_fabo_d2[l_ac].fabo055  = g_glaq_s[2].glaq052 END CASE              
                   CASE WHEN g_glaq_s[1].glaq053 <> ' '  LET g_fabo_d2[l_ac].fabo056  = g_glaq_s[1].glaq053   WHEN g_glaq_s[2].glaq053 <> ' ' LET g_fabo_d2[l_ac].fabo056  = g_glaq_s[2].glaq053 END CASE
                   CASE WHEN g_glaq_s[1].glaq024 <> ' '  LET g_fabo_d2[l_ac].fabo057  = g_glaq_s[1].glaq024   WHEN g_glaq_s[2].glaq024 <> ' ' LET g_fabo_d2[l_ac].fabo057  = g_glaq_s[2].glaq024 END CASE  #產品分類 #201116-00024#1 add                   
                   CASE WHEN g_glaq_s[1].glaq025 <> ' '  LET g_fabo_d2[l_ac].fabo038  = g_glaq_s[1].glaq025   WHEN g_glaq_s[2].glaq025 <> ' ' LET g_fabo_d2[l_ac].fabo038  = g_glaq_s[2].glaq025 END CASE              
                   CASE WHEN g_glaq_s[1].glaq027 <> ' '  LET g_fabo_d2[l_ac].fabo039  = g_glaq_s[1].glaq027   WHEN g_glaq_s[2].glaq027 <> ' ' LET g_fabo_d2[l_ac].fabo039  = g_glaq_s[2].glaq027 END CASE
                   CASE WHEN g_glaq_s[1].glaq028 <> ' '  LET g_fabo_d2[l_ac].fabo040  = g_glaq_s[1].glaq028   WHEN g_glaq_s[2].glaq028 <> ' ' LET g_fabo_d2[l_ac].fabo040  = g_glaq_s[2].glaq028 END CASE              
                   CASE WHEN g_glaq_s[1].glaq029 <> ' '  LET g_fabo_d2[l_ac].fabo060  = g_glaq_s[1].glaq029   WHEN g_glaq_s[2].glaq029 <> ' ' LET g_fabo_d2[l_ac].fabo060  = g_glaq_s[2].glaq029 END CASE
                   CASE WHEN g_glaq_s[1].glaq030 <> ' '  LET g_fabo_d2[l_ac].fabo061  = g_glaq_s[1].glaq030   WHEN g_glaq_s[2].glaq030 <> ' ' LET g_fabo_d2[l_ac].fabo061  = g_glaq_s[2].glaq030 END CASE              
                   CASE WHEN g_glaq_s[1].glaq031 <> ' '  LET g_fabo_d2[l_ac].fabo062  = g_glaq_s[1].glaq031   WHEN g_glaq_s[2].glaq031 <> ' ' LET g_fabo_d2[l_ac].fabo062  = g_glaq_s[2].glaq031 END CASE
                   CASE WHEN g_glaq_s[1].glaq032 <> ' '  LET g_fabo_d2[l_ac].fabo063  = g_glaq_s[1].glaq032   WHEN g_glaq_s[2].glaq032 <> ' ' LET g_fabo_d2[l_ac].fabo063  = g_glaq_s[2].glaq032 END CASE              
                   CASE WHEN g_glaq_s[1].glaq033 <> ' '  LET g_fabo_d2[l_ac].fabo064  = g_glaq_s[1].glaq033   WHEN g_glaq_s[2].glaq033 <> ' ' LET g_fabo_d2[l_ac].fabo064  = g_glaq_s[2].glaq033 END CASE
                   CASE WHEN g_glaq_s[1].glaq034 <> ' '  LET g_fabo_d2[l_ac].fabo065  = g_glaq_s[1].glaq034   WHEN g_glaq_s[2].glaq034 <> ' ' LET g_fabo_d2[l_ac].fabo065  = g_glaq_s[2].glaq034 END CASE              
                   CASE WHEN g_glaq_s[1].glaq035 <> ' '  LET g_fabo_d2[l_ac].fabo066  = g_glaq_s[1].glaq035   WHEN g_glaq_s[2].glaq035 <> ' ' LET g_fabo_d2[l_ac].fabo066  = g_glaq_s[2].glaq035 END CASE
                   CASE WHEN g_glaq_s[1].glaq036 <> ' '  LET g_fabo_d2[l_ac].fabo067  = g_glaq_s[1].glaq036   WHEN g_glaq_s[2].glaq036 <> ' ' LET g_fabo_d2[l_ac].fabo067  = g_glaq_s[2].glaq036 END CASE              
                   CASE WHEN g_glaq_s[1].glaq037 <> ' '  LET g_fabo_d2[l_ac].fabo068  = g_glaq_s[1].glaq037   WHEN g_glaq_s[2].glaq037 <> ' ' LET g_fabo_d2[l_ac].fabo068  = g_glaq_s[2].glaq037 END CASE
                   CASE WHEN g_glaq_s[1].glaq038 <> ' '  LET g_fabo_d2[l_ac].fabo069  = g_glaq_s[1].glaq038   WHEN g_glaq_s[2].glaq038 <> ' ' LET g_fabo_d2[l_ac].fabo069  = g_glaq_s[2].glaq038 END CASE              
 
               END IF
               #170512-00045#30 add-e 
                
            END IF 
            
            CALL afat504_xrcd009_desc(g_fabo3_d[l_ac].xrcd009) RETURNING g_fabo3_d[l_ac].xrcd009_desc
            DISPLAY BY NAME g_fabo3_d[l_ac].xrcd009_desc 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009
            #add-point:BEFORE FIELD xrcd009 name="input.b.page3.xrcd009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd009
            #add-point:ON CHANGE xrcd009 name="input.g.page3.xrcd009"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo3_d[l_ac].xrcd009
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'xrcd009',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009_desc
            #add-point:BEFORE FIELD xrcd009_desc name="input.b.page3.xrcd009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcd009_desc
            
            #add-point:AFTER FIELD xrcd009_desc name="input.a.page3.xrcd009_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd009_desc
            #add-point:ON CHANGE xrcd009_desc name="input.g.page3.xrcd009_desc"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page3.xrcdseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcdseq
            #add-point:ON ACTION controlp INFIELD xrcdseq name="input.c.page3.xrcdseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcdseq2
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcdseq2
            #add-point:ON ACTION controlp INFIELD xrcdseq2 name="input.c.page3.xrcdseq2"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.fabo001_1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo001_1
            #add-point:ON ACTION controlp INFIELD fabo001_1 name="input.c.page3.fabo001_1"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd007
            #add-point:ON ACTION controlp INFIELD xrcd007 name="input.c.page3.xrcd007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd002
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd002
            #add-point:ON ACTION controlp INFIELD xrcd002 name="input.c.page3.xrcd002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd002_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd002_desc
            #add-point:ON ACTION controlp INFIELD xrcd002_desc name="input.c.page3.xrcd002_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd003
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd003
            #add-point:ON ACTION controlp INFIELD xrcd003 name="input.c.page3.xrcd003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd006
            #add-point:ON ACTION controlp INFIELD xrcd006 name="input.c.page3.xrcd006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd100
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd100
            #add-point:ON ACTION controlp INFIELD xrcd100 name="input.c.page3.xrcd100"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd005
            #add-point:ON ACTION controlp INFIELD xrcd005 name="input.c.page3.xrcd005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009
            #add-point:ON ACTION controlp INFIELD xrcd009 name="input.c.page3.xrcd009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo3_d[l_ac].xrcd009             #給予default值

            #給予arg
            LET g_qryparam.where = " glac001 = '",g_glaa.glaa004,"' AND glac003 <> 1 AND glac006 = '1'",
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                   " AND gladld='",g_fabg_m.fabgld,"' AND gladent='",g_enterprise,"'",
                                   " AND gladent = glacent  ", #181001-00015#52 add                                                                                                         
                                   " AND gladstus = 'Y' )"

            
            #170421-00027#5 By 09505  --(S)--
            LET lc_param2.glbi001 = g_prog
            LET lc_param2.glbild  = g_fabg_m.fabgld
            LET lc_param2.docno   = g_fabg_m.fabgdocno
            LET lc_param2.glbi003 = ''
            LET ls_js = util.JSON.stringify(lc_param2)
            CALL s_voucher_get_glbi_sql(ls_js) RETURNING l_glbi_sql 
            LET g_qryparam.where  = g_qryparam.where," AND ",l_glbi_sql
            #170421-00027#5 By 09505  --(E)--
            CALL aglt310_04()                                #呼叫開窗

            LET g_fabo3_d[l_ac].xrcd009 = g_qryparam.return1              
            
            CALL afat504_xrcd009_desc(g_fabo3_d[l_ac].xrcd009) RETURNING g_fabo3_d[l_ac].xrcd009_desc

            DISPLAY g_fabo3_d[l_ac].xrcd009 TO xrcd009              #

            NEXT FIELD xrcd009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcd009_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcd009_desc
            #add-point:ON ACTION controlp INFIELD xrcd009_desc name="input.c.page3.xrcd009_desc"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body3.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_fabo3_d[l_ac].* = g_fabo3_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE afat504_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL afat504_unlock_b("xrcd_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body3.after_row2"
            UPDATE fabo_t SET fabo030=g_fabo3_d[l_ac].xrcd009
                        WHERE faboent=g_enterprise AND
                   fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo_d[l_ac].faboseq
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body3.after_input"
            
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
                  LET g_fabo3_d[li_reproduce_target].* = g_fabo3_d[li_reproduce].*
 
                  LET g_fabo3_d[li_reproduce_target].xrcdseq = NULL
                  LET g_fabo3_d[li_reproduce_target].xrcdseq2 = NULL
                  LET g_fabo3_d[li_reproduce_target].xrcd007 = NULL
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_fabo3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_fabo3_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body3.controlo"
            
            #end add-point
            #(ver:84) --- end ---
            
      END INPUT
      INPUT ARRAY g_fabo4_d FROM s_detail4.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = FALSE, #此頁面insert功能由產生器控制, 手動之設定無效!
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_3)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body4.before_input2"
            
            #end add-point
            
            CALL afat504_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_fabo4_d.getLength()
            #add-point:資料輸入前 name="input.body4.before_input"
            CALL cl_set_act_visible("controlo",FALSE ) #180828-00006#2 add
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            CALL afat504_idx_chk()   #(ver:83)
            LET l_cmd = 'a'
            INITIALIZE g_fabo4_d[l_ac].* TO NULL 
            INITIALIZE g_fabo4_d_t.* TO NULL 
            INITIALIZE g_fabo4_d_o.* TO NULL 
            #公用欄位給值(單身3)
            
            #自定義預設值(單身3)
            
            #add-point:modify段before備份 name="input.body4.insert.before_bak"
            
            #end add-point
            LET g_fabo4_d_t.* = g_fabo4_d[l_ac].*     #新輸入資料
            LET g_fabo4_d_o.* = g_fabo4_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL afat504_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body4.insert.after_set_entry_b"
            
            #end add-point
            CALL afat504_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_fabo_d[li_reproduce_target].* = g_fabo_d[li_reproduce].*
               LET g_fabo4_d[li_reproduce_target].* = g_fabo4_d[li_reproduce].*
 
               LET g_fabo4_d[li_reproduce_target].faboseq = NULL
            END IF
            
 
 
            #add-point:modify段before insert name="input.body4.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body4.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[3] = l_ac   #210121-00015 modify
            LET g_current_page = 3
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE afat504_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 ---start---
            FETCH afat504_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH afat504_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE afat504_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
            
            LET g_rec_b = g_fabo4_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_fabo4_d[l_ac].faboseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_fabo4_d_t.* = g_fabo4_d[l_ac].*  #BACKUP
               LET g_fabo4_d_o.* = g_fabo4_d[l_ac].*  #BACKUP
               CALL afat504_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body4.after_set_entry_b"
               
               #end add-point  
               CALL afat504_set_no_entry_b(l_cmd)
               IF NOT afat504_lock_b("fabo_t","'3'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH afat504_bcl INTO g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,g_fabo_d[l_ac].fabo009,g_fabo_d[l_ac].fabo005,g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo010, 
                      g_fabo_d[l_ac].fabo011,g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019,g_fabo_d[l_ac].fabo021,g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049, 
                      g_fabo_d[l_ac].fabo025,g_fabo_d[l_ac].fabo023,g_fabo_d[l_ac].fabo031,g_fabo_d[l_ac].fabo032,g_fabo_d[l_ac].fabo033,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo055,g_fabo_d[l_ac].fabo056,g_fabo_d[l_ac].fabo038,g_fabo_d[l_ac].fabo039, 
                      g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo060,g_fabo_d[l_ac].fabo061,g_fabo_d[l_ac].fabo062,g_fabo_d[l_ac].fabo063,g_fabo_d[l_ac].fabo064,g_fabo_d[l_ac].fabo065,g_fabo_d[l_ac].fabo066,g_fabo_d[l_ac].fabo067,g_fabo_d[l_ac].fabo068,g_fabo_d[l_ac].fabo069,g_fabo4_d[l_ac].faboseq, 
                      g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,g_fabo4_d[l_ac].fabo106,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,g_fabo4_d[l_ac].fabo110,g_fabo4_d[l_ac].fabo111,g_fabo4_d[l_ac].fabo112, 
                      g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo151,g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154,g_fabo4_d[l_ac].fabo155,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,g_fabo4_d[l_ac].fabo159,g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo161 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_fabo4_d_mask_o[l_ac].* =  g_fabo4_d[l_ac].*
                  CALL afat504_fabo_t_mask()
                  LET g_fabo4_d_mask_n[l_ac].* =  g_fabo4_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL afat504_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body4.before_row"
            SELECT faaj103,faaj153
              INTO g_fabo4_d[l_ac].faaj103,g_fabo4_d[l_ac].faaj153
              FROM faaj_t
             WHERE faajent=g_enterprise AND faajld=g_fabg_m.fabgld
               AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002
               AND faaj037=g_fabo_d[l_ac].fabo003
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
            #其他table進行lock
            
 
 
            CALL afat504_idx_chk()   #(ver:83)
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body4.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body4.b_delete_ask"
               
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
               
               #add-point:單身3刪除前 name="input.body4.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_fabg_m.fabgld
               LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
               LET gs_keys[gs_keys.getLength()+1] = g_fabo4_d_t.faboseq
            
               #刪除同層單身
               IF NOT afat504_delete_b('fabo_t',gs_keys,"'3'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT afat504_key_delete_b(gs_keys,'fabo_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE afat504_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
 
               
 
   #161130-00056 add
               
               #add-point:單身3刪除中 name="input.body4.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE afat504_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身3刪除後 name="input.body4.a_delete"
               
               #end add-point
               LET l_count = g_fabo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body4.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_fabo4_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
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
               
            #add-point:單身3新增前 name="input.body4.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM fabo_t 
             WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
               AND fabodocno = g_fabg_m.fabgdocno
               AND faboseq = g_fabo4_d[l_ac].faboseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身3新增前 name="input.body4.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys[3] = g_fabo4_d[g_detail_idx].faboseq
               CALL afat504_insert_b('fabo_t',gs_keys,"'3'")
                           
               #add-point:單身新增後3 name="input.body4.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_fabo_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL afat504_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:單身新增後 name="input.body4.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_fabo4_d[l_ac].* = g_fabo4_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE afat504_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_fabo4_d[l_ac].* = g_fabo4_d_t.*
            ELSE
               #add-point:單身page3修改前 name="input.body4.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身3)
               
               
               #將遮罩欄位還原
               CALL afat504_fabo_t_mask_restore('restore_mask_o')
                              
               UPDATE fabo_t SET (fabold,fabodocno,faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035, 
                   fabo036,fabo037,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154, 
                   fabo155,fabo157,fabo158,fabo159,fabo160,fabo161) = (g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,g_fabo_d[l_ac].fabo009,g_fabo_d[l_ac].fabo005, 
                   g_fabo_d[l_ac].fabo007,g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019, 
                   g_fabo_d[l_ac].fabo021,g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049,g_fabo_d[l_ac].fabo025,g_fabo_d[l_ac].fabo023,g_fabo_d[l_ac].fabo031,g_fabo_d[l_ac].fabo032,g_fabo_d[l_ac].fabo033,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo055, 
                   g_fabo_d[l_ac].fabo056,g_fabo_d[l_ac].fabo038,g_fabo_d[l_ac].fabo039,g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo060,g_fabo_d[l_ac].fabo061,g_fabo_d[l_ac].fabo062,g_fabo_d[l_ac].fabo063,g_fabo_d[l_ac].fabo064,g_fabo_d[l_ac].fabo065,g_fabo_d[l_ac].fabo066,g_fabo_d[l_ac].fabo067, 
                   g_fabo_d[l_ac].fabo068,g_fabo_d[l_ac].fabo069,g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,g_fabo4_d[l_ac].fabo106,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,g_fabo4_d[l_ac].fabo110, 
                   g_fabo4_d[l_ac].fabo111,g_fabo4_d[l_ac].fabo112,g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo151,g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154,g_fabo4_d[l_ac].fabo155,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,g_fabo4_d[l_ac].fabo159, 
                   g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo161) #自訂欄位頁簽
                WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
                  AND fabodocno = g_fabg_m.fabgdocno
                  AND faboseq = g_fabo4_d_t.faboseq #項次 
                  
               #add-point:單身page3修改中 name="input.body4.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_fabo4_d[l_ac].* = g_fabo4_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_fabo4_d[l_ac].* = g_fabo4_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_fabg_m.fabgld
               LET gs_keys_bak[1] = g_fabgld_t
               LET gs_keys[2] = g_fabg_m.fabgdocno
               LET gs_keys_bak[2] = g_fabgdocno_t
               LET gs_keys[3] = g_fabo4_d[g_detail_idx].faboseq
               LET gs_keys_bak[3] = g_fabo4_d_t.faboseq
               CALL afat504_update_b('fabo_t',gs_keys,gs_keys_bak,"'3'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL afat504_fabo_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_fabo4_d[g_detail_idx].faboseq = g_fabo4_d_t.faboseq 
                  ) THEN
                  LET gs_keys[01] = g_fabg_m.fabgld
                  LET gs_keys[gs_keys.getLength()+1] = g_fabg_m.fabgdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_fabo4_d_t.faboseq
                  CALL afat504_key_update_b(gs_keys,'fabo_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo4_d_t)
               LET g_log2 = util.JSON.stringify(g_fabg_m),util.JSON.stringify(g_fabo4_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page3修改後 name="input.body4.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faboseq_3
            #add-point:BEFORE FIELD faboseq_3 name="input.b.page4.faboseq_3"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faboseq_3
            
            #add-point:AFTER FIELD faboseq_3 name="input.a.page4.faboseq_3"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_fabg_m.fabgld IS NOT NULL AND g_fabg_m.fabgdocno IS NOT NULL AND g_fabo4_d[g_detail_idx].faboseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_fabg_m.fabgld != g_fabgld_t OR g_fabg_m.fabgdocno != g_fabgdocno_t OR g_fabo4_d[g_detail_idx].faboseq != g_fabo4_d_t.faboseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM fabo_t WHERE "||"faboent = '" ||g_enterprise|| "' AND "||"fabold = '"||g_fabg_m.fabgld ||"' AND "|| "fabodocno = '"||g_fabg_m.fabgdocno ||"' AND "|| "faboseq = '"||g_fabo4_d[g_detail_idx].faboseq ||"'",'std-00004',0) THEN  #160905-00007#2 count(*) --> count(1) 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faboseq_3
            #add-point:ON CHANGE faboseq_3 name="input.g.page4.faboseq_3"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faaj103
            #add-point:BEFORE FIELD faaj103 name="input.b.page4.faaj103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faaj103
            
            #add-point:AFTER FIELD faaj103 name="input.a.page4.faaj103"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faaj103
            #add-point:ON CHANGE faaj103 name="input.g.page4.faaj103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo107
            #add-point:BEFORE FIELD fabo107 name="input.b.page4.fabo107"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo107
            
            #add-point:AFTER FIELD fabo107 name="input.a.page4.fabo107"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo107
            #add-point:ON CHANGE fabo107 name="input.g.page4.fabo107"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo101
            #add-point:BEFORE FIELD fabo101 name="input.b.page4.fabo101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo101
            
            #add-point:AFTER FIELD fabo101 name="input.a.page4.fabo101"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo101
            #add-point:ON CHANGE fabo101 name="input.g.page4.fabo101"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_fabo4_d[l_ac].fabo101
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'fabo101',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo102
            #add-point:BEFORE FIELD fabo102 name="input.b.page4.fabo102"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo102
            
            #add-point:AFTER FIELD fabo102 name="input.a.page4.fabo102"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo102
            #add-point:ON CHANGE fabo102 name="input.g.page4.fabo102"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo103
            #add-point:BEFORE FIELD fabo103 name="input.b.page4.fabo103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo103
            
            #add-point:AFTER FIELD fabo103 name="input.a.page4.fabo103"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo103
            #add-point:ON CHANGE fabo103 name="input.g.page4.fabo103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo104
            #add-point:BEFORE FIELD fabo104 name="input.b.page4.fabo104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo104
            
            #add-point:AFTER FIELD fabo104 name="input.a.page4.fabo104"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo104
            #add-point:ON CHANGE fabo104 name="input.g.page4.fabo104"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo105
            #add-point:BEFORE FIELD fabo105 name="input.b.page4.fabo105"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo105
            
            #add-point:AFTER FIELD fabo105 name="input.a.page4.fabo105"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo105
            #add-point:ON CHANGE fabo105 name="input.g.page4.fabo105"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo106
            #add-point:BEFORE FIELD fabo106 name="input.b.page4.fabo106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo106
            
            #add-point:AFTER FIELD fabo106 name="input.a.page4.fabo106"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo106
            #add-point:ON CHANGE fabo106 name="input.g.page4.fabo106"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo108
            #add-point:BEFORE FIELD fabo108 name="input.b.page4.fabo108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo108
            
            #add-point:AFTER FIELD fabo108 name="input.a.page4.fabo108"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo108
            #add-point:ON CHANGE fabo108 name="input.g.page4.fabo108"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo109
            #add-point:BEFORE FIELD fabo109 name="input.b.page4.fabo109"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo109
            
            #add-point:AFTER FIELD fabo109 name="input.a.page4.fabo109"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo109
            #add-point:ON CHANGE fabo109 name="input.g.page4.fabo109"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo110
            #add-point:BEFORE FIELD fabo110 name="input.b.page4.fabo110"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo110
            
            #add-point:AFTER FIELD fabo110 name="input.a.page4.fabo110"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo110
            #add-point:ON CHANGE fabo110 name="input.g.page4.fabo110"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo111
            #add-point:BEFORE FIELD fabo111 name="input.b.page4.fabo111"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo111
            
            #add-point:AFTER FIELD fabo111 name="input.a.page4.fabo111"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo111
            #add-point:ON CHANGE fabo111 name="input.g.page4.fabo111"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo112
            #add-point:BEFORE FIELD fabo112 name="input.b.page4.fabo112"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo112
            
            #add-point:AFTER FIELD fabo112 name="input.a.page4.fabo112"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo112
            #add-point:ON CHANGE fabo112 name="input.g.page4.fabo112"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faaj153
            #add-point:BEFORE FIELD faaj153 name="input.b.page4.faaj153"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD faaj153
            
            #add-point:AFTER FIELD faaj153 name="input.a.page4.faaj153"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faaj153
            #add-point:ON CHANGE faaj153 name="input.g.page4.faaj153"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo156
            #add-point:BEFORE FIELD fabo156 name="input.b.page4.fabo156"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo156
            
            #add-point:AFTER FIELD fabo156 name="input.a.page4.fabo156"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo156
            #add-point:ON CHANGE fabo156 name="input.g.page4.fabo156"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo150
            #add-point:BEFORE FIELD fabo150 name="input.b.page4.fabo150"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo150
            
            #add-point:AFTER FIELD fabo150 name="input.a.page4.fabo150"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo150
            #add-point:ON CHANGE fabo150 name="input.g.page4.fabo150"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo151
            #add-point:BEFORE FIELD fabo151 name="input.b.page4.fabo151"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo151
            
            #add-point:AFTER FIELD fabo151 name="input.a.page4.fabo151"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo151
            #add-point:ON CHANGE fabo151 name="input.g.page4.fabo151"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo152
            #add-point:BEFORE FIELD fabo152 name="input.b.page4.fabo152"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo152
            
            #add-point:AFTER FIELD fabo152 name="input.a.page4.fabo152"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo152
            #add-point:ON CHANGE fabo152 name="input.g.page4.fabo152"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo153
            #add-point:BEFORE FIELD fabo153 name="input.b.page4.fabo153"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo153
            
            #add-point:AFTER FIELD fabo153 name="input.a.page4.fabo153"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo153
            #add-point:ON CHANGE fabo153 name="input.g.page4.fabo153"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo154
            #add-point:BEFORE FIELD fabo154 name="input.b.page4.fabo154"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo154
            
            #add-point:AFTER FIELD fabo154 name="input.a.page4.fabo154"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo154
            #add-point:ON CHANGE fabo154 name="input.g.page4.fabo154"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo155
            #add-point:BEFORE FIELD fabo155 name="input.b.page4.fabo155"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo155
            
            #add-point:AFTER FIELD fabo155 name="input.a.page4.fabo155"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo155
            #add-point:ON CHANGE fabo155 name="input.g.page4.fabo155"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo157
            #add-point:BEFORE FIELD fabo157 name="input.b.page4.fabo157"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo157
            
            #add-point:AFTER FIELD fabo157 name="input.a.page4.fabo157"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo157
            #add-point:ON CHANGE fabo157 name="input.g.page4.fabo157"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo158
            #add-point:BEFORE FIELD fabo158 name="input.b.page4.fabo158"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo158
            
            #add-point:AFTER FIELD fabo158 name="input.a.page4.fabo158"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo158
            #add-point:ON CHANGE fabo158 name="input.g.page4.fabo158"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo159
            #add-point:BEFORE FIELD fabo159 name="input.b.page4.fabo159"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo159
            
            #add-point:AFTER FIELD fabo159 name="input.a.page4.fabo159"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo159
            #add-point:ON CHANGE fabo159 name="input.g.page4.fabo159"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo160
            #add-point:BEFORE FIELD fabo160 name="input.b.page4.fabo160"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo160
            
            #add-point:AFTER FIELD fabo160 name="input.a.page4.fabo160"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo160
            #add-point:ON CHANGE fabo160 name="input.g.page4.fabo160"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD fabo161
            #add-point:BEFORE FIELD fabo161 name="input.b.page4.fabo161"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD fabo161
            
            #add-point:AFTER FIELD fabo161 name="input.a.page4.fabo161"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE fabo161
            #add-point:ON CHANGE fabo161 name="input.g.page4.fabo161"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page4.faboseq_3
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faboseq_3
            #add-point:ON ACTION controlp INFIELD faboseq_3 name="input.c.page4.faboseq_3"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.faaj103
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faaj103
            #add-point:ON ACTION controlp INFIELD faaj103 name="input.c.page4.faaj103"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo107
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo107
            #add-point:ON ACTION controlp INFIELD fabo107 name="input.c.page4.fabo107"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo101
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo101
            #add-point:ON ACTION controlp INFIELD fabo101 name="input.c.page4.fabo101"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo4_d[l_ac].fabo101             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooai001()                                #呼叫開窗

            LET g_fabo4_d[l_ac].fabo101 = g_qryparam.return1              

            DISPLAY g_fabo4_d[l_ac].fabo101 TO fabo101              #

            NEXT FIELD fabo101                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo102
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo102
            #add-point:ON ACTION controlp INFIELD fabo102 name="input.c.page4.fabo102"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo103
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo103
            #add-point:ON ACTION controlp INFIELD fabo103 name="input.c.page4.fabo103"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo104
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo104
            #add-point:ON ACTION controlp INFIELD fabo104 name="input.c.page4.fabo104"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo105
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo105
            #add-point:ON ACTION controlp INFIELD fabo105 name="input.c.page4.fabo105"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo106
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo106
            #add-point:ON ACTION controlp INFIELD fabo106 name="input.c.page4.fabo106"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo108
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo108
            #add-point:ON ACTION controlp INFIELD fabo108 name="input.c.page4.fabo108"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo109
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo109
            #add-point:ON ACTION controlp INFIELD fabo109 name="input.c.page4.fabo109"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo110
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo110
            #add-point:ON ACTION controlp INFIELD fabo110 name="input.c.page4.fabo110"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo111
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo111
            #add-point:ON ACTION controlp INFIELD fabo111 name="input.c.page4.fabo111"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo112
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo112
            #add-point:ON ACTION controlp INFIELD fabo112 name="input.c.page4.fabo112"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.faaj153
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD faaj153
            #add-point:ON ACTION controlp INFIELD faaj153 name="input.c.page4.faaj153"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo156
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo156
            #add-point:ON ACTION controlp INFIELD fabo156 name="input.c.page4.fabo156"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo150
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD fabo150
            #add-point:ON ACTION controlp INFIELD fabo150 name="input.c.page4.fabo150"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_fabo4_d[l_ac].fabo150             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooai001()                                #呼叫開窗

            LET g_fabo4_d[l_ac].fabo150 = g_qryparam.return1              

            DISPLAY g_fabo4_d[l_ac].fabo150 TO fabo150              #

            NEXT FIELD fabo150                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo151
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo151
            #add-point:ON ACTION controlp INFIELD fabo151 name="input.c.page4.fabo151"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo152
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo152
            #add-point:ON ACTION controlp INFIELD fabo152 name="input.c.page4.fabo152"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo153
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo153
            #add-point:ON ACTION controlp INFIELD fabo153 name="input.c.page4.fabo153"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo154
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo154
            #add-point:ON ACTION controlp INFIELD fabo154 name="input.c.page4.fabo154"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo155
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo155
            #add-point:ON ACTION controlp INFIELD fabo155 name="input.c.page4.fabo155"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo157
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo157
            #add-point:ON ACTION controlp INFIELD fabo157 name="input.c.page4.fabo157"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo158
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo158
            #add-point:ON ACTION controlp INFIELD fabo158 name="input.c.page4.fabo158"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo159
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo159
            #add-point:ON ACTION controlp INFIELD fabo159 name="input.c.page4.fabo159"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo160
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo160
            #add-point:ON ACTION controlp INFIELD fabo160 name="input.c.page4.fabo160"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.fabo161
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD fabo161
            #add-point:ON ACTION controlp INFIELD fabo161 name="input.c.page4.fabo161"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page3 after_row name="input.body4.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_fabo4_d[l_ac].* = g_fabo4_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE afat504_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL afat504_unlock_b("fabo_t","'3'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page3 after_row2 name="input.body4.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body4.after_input"
            
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
                  LET g_fabo_d[li_reproduce_target].* = g_fabo_d[li_reproduce].*
               LET g_fabo4_d[li_reproduce_target].* = g_fabo4_d[li_reproduce].*
 
                  LET g_fabo4_d[li_reproduce_target].faboseq = NULL
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_fabo4_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_fabo4_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body4.controlo"
            
            #end add-point
            #(ver:84) --- end ---
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="afat504.input.other" type="s" >}
      
      #add-point:自定義input name="input.more_input"
      SUBDIALOG afa_afat504_01.afat504_01_input
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         IF p_cmd <> 'a' AND g_aw="s_detail1_afat504_01" THEN
            NEXT FIELD fabo024
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1','3',"))      
         CALL DIALOG.setCurrentRow("s_detail3",g_idx_group.getValue("'2',"))
         CALL DIALOG.setCurrentRow("s_detail4",g_idx_group.getValue(""))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            NEXT FIELD fabgsite   #160426-00014#33 add lujh
            #end add-point  
            NEXT FIELD fabgld #170906-00011#1
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD faboseq #170906-00011#1
               WHEN "s_detail3"
                  NEXT FIELD xrcdseq #170906-00011#1
               WHEN "s_detail4"
                  NEXT FIELD faboseq_3 #170906-00011#1
 
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
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
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
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   #20150104 add by chenying
   IF g_glaa.glaa121 = 'Y' AND INT_FLAG = 0 THEN 
      #150916--s
      CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING g_sub_success,l_ooba002
      CALL s_fin_get_doc_para(g_fabg_m.fabgld,'',l_ooba002,'D-FIN-0030') RETURNING l_str1  
      IF cl_null(l_str1) THEN LET l_str1 = 'Y' END IF    
      IF l_str1 = 'Y' THEN               
      #150916--e      
         CALL s_transaction_begin()
         CALL cl_err_collect_init()
         
         CALL s_pre_voucher_ins('FA','F40',g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'4') RETURNING l_success
         
         IF l_success THEN
            CALL cl_err_collect_init() 
            CALL s_transaction_end('Y','1')         #171006-00010#13   add           
            CALL cl_err_collect_show() 
            #CALL s_transaction_end('Y','1')        #171006-00010#13   mask
         ELSE
            CALL s_transaction_end('N','1')         #171006-00010#13   add
            CALL cl_err_collect_show()
            #CALL s_transaction_end('N','1')        #171006-00010#13   mask 
         END IF
      
      END IF   #150916
      
   END IF
   #20150104 add by chenying
   #151125-00006#2--add--s
   IF NOT INT_FLAG THEN
      CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_ooba002
      CALL s_fin_orga_get_comp_ld(g_fabg_m.fabgsite) RETURNING g_sub_success,g_errno,l_fabgcomp,l_ld
      CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
      CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
      IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
         IF cl_ask_confirm('aap-00403') THEN
            CALL s_transaction_begin()
            CALL s_afat503_immediately_conf_1(g_fabg_m.fabgdocno,l_fabgcomp,g_fabg_m.fabgld,g_fabg_m.fabgdocdt,g_prog) RETURNING l_success

            IF l_success THEN 
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()     #180326-00032#1 add
            ELSE
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
            END IF
         END IF 
      END IF
   END IF
   #151125-00006#2--add--e
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.show" type="s" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION afat504_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_fabg019  LIKE fabg_t.fabg019
   DEFINE l_success  LIKE type_t.num5 
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   #若無資料則關閉相關功能
   #IF g_fabg_m.fabgstus<>'N' THEN                #180614-00039#9 mark
   IF g_fabg_m.fabgstus NOT MATCHES "[NDR]" THEN  #180614-00039#9 add
      CALL cl_set_act_visible("modify,delete", FALSE)
   ELSE
      CALL cl_set_act_visible("modify,delete", TRUE)
   END IF
   #161215-00044#1---modify----begin-----------------
   #SELECT * INTO g_glaa.* 
   SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
          glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
          glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
          glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
          glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
          glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161215-00044#1---modify----end-----------------
   FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
   CALL afat504_set_curr() #設置本位幣二三的顯示
   SELECT ooef019 INTO g_ooef019 FROM ooef_t 
   WHERE ooefent = g_enterprise AND ooef001 = g_fabg_m.fabgcomp
   
   
#20141120 mod--str--
#调拨规格在调整，此处先mark
#   #20141111 add--str--
#   LET l_fabg019 = NULL
#   SELECT fabg019 INTO l_fabg019 FROM fabg_t 
#    WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld AND fabgdocno = g_fabg_m.fabgdocno
#   IF NOT cl_null(l_fabg019) THEN
#      CALL cl_set_act_visible("open_afap270",FALSE) 
#   ELSE
#      CALL cl_set_act_visible("open_afap270",TRUE) 
#   END IF
#   #20141111 add--end---
    IF g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S'THEN 
       IF cl_null(g_fabg_m.fabg011) THEN 
          CALL cl_set_act_visible("open_afap270",TRUE) 
       ELSE
          CALL cl_set_act_visible("open_afap270",FALSE) 
       END IF
    END IF   
#20141120 mod--end---
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL afat504_b_fill() #單身填充
      CALL afat504_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL afat504_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   #171201-00004#1--add--s--xul
   IF NOT cl_null(g_fabg_m.fabg021) THEN
      CALL s_axrt300_xrca_ref('xrca057',g_fabg_m.fabg006,g_fabg_m.fabg021,'') RETURNING l_success,g_fabg_m.fabg006_desc
      IF g_fabg_m.fabg007 = g_fabg_m.fabg006 THEN
         LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
      END IF
   END IF
   #171201-00004#1--add--e--xul
   #end add-point
   
   #遮罩相關處理
   LET g_fabg_m_mask_o.* =  g_fabg_m.*
   CALL afat504_fabg_t_mask()
   LET g_fabg_m_mask_n.* =  g_fabg_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt, 
       g_fabg_m.fabg006,g_fabg_m.fabg006_desc,g_fabg_m.fabg007,g_fabg_m.fabg007_desc,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp,g_fabg_m.fabgowndp_desc, 
       g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmodid_desc,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstid_desc,g_fabg_m.fabgpstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_fabg_m.fabgstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_fabo_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_fabo3_d.getLength()
      #add-point:show段單身reference name="show.body3.reference"

#   INITIALIZE g_ref_fields TO NULL 
#   LET g_ref_fields[1] = g_fabg_m.fabgld
#   LET g_ref_fields[2] = g_fabg_m.fabgdocno
#   LET g_ref_fields[3] = g_fabo_d[l_ac].faboseq
#   CALL ap_ref_array2(g_ref_fields," SELECT xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009 FROM xrcd_t WHERE xrcdent = '"||g_enterprise||"' AND ","") RETURNING g_rtn_fields 
#   LET g_fabo3_d[l_ac].xrcdseq = g_rtn_fields[1] 
#   LET g_fabo3_d[l_ac].xrcdseq2 = g_rtn_fields[2] 
#   LET g_fabo3_d[l_ac].xrcd007 = g_rtn_fields[3] 
#   LET g_fabo3_d[l_ac].xrcd002 = g_rtn_fields[4] 
#   LET g_fabo3_d[l_ac].xrcd003 = g_rtn_fields[5] 
#   LET g_fabo3_d[l_ac].xrcd006 = g_rtn_fields[6] 
#   LET g_fabo3_d[l_ac].xrcd100 = g_rtn_fields[7] 
#   LET g_fabo3_d[l_ac].xrcd005 = g_rtn_fields[8] 
#   LET g_fabo3_d[l_ac].xrcd104 = g_rtn_fields[9] 
#   LET g_fabo3_d[l_ac].xrcd103 = g_rtn_fields[10] 
#   LET g_fabo3_d[l_ac].xrcd105 = g_rtn_fields[11] 
#   LET g_fabo3_d[l_ac].xrcd009 = g_rtn_fields[12] 
#   LET g_fabo3_d[l_ac].xrcdseq = g_rtn_fields[13] 
#   LET g_fabo3_d[l_ac].xrcdseq2 = g_rtn_fields[14] 
#   LET g_fabo3_d[l_ac].xrcd007 = g_rtn_fields[15] 
#   LET g_fabo3_d[l_ac].xrcd002 = g_rtn_fields[16] 
#   LET g_fabo3_d[l_ac].xrcd003 = g_rtn_fields[17] 
#   LET g_fabo3_d[l_ac].xrcd006 = g_rtn_fields[18] 
#   LET g_fabo3_d[l_ac].xrcd100 = g_rtn_fields[19] 
#   LET g_fabo3_d[l_ac].xrcd005 = g_rtn_fields[20] 
#   LET g_fabo3_d[l_ac].xrcd104 = g_rtn_fields[21] 
#   LET g_fabo3_d[l_ac].xrcd103 = g_rtn_fields[22] 
#   LET g_fabo3_d[l_ac].xrcd105 = g_rtn_fields[23] 
#   LET g_fabo3_d[l_ac].xrcd009 = g_rtn_fields[24] 
#   DISPLAY BY NAME g_fabo3_d[l_ac].xrcdseq,g_fabo3_d[l_ac].xrcdseq2,g_fabo3_d[l_ac].xrcd007,g_fabo3_d[l_ac].xrcd002,g_fabo3_d[l_ac].xrcd003,g_fabo3_d[l_ac].xrcd006,g_fabo3_d[l_ac].xrcd100,g_fabo3_d[l_ac].xrcd005,g_fabo3_d[l_ac].xrcd104,g_fabo3_d[l_ac].xrcd103,g_fabo3_d[l_ac].xrcd105,g_fabo3_d[l_ac].xrcd009,g_fabo3_d[l_ac].xrcdseq,g_fabo3_d[l_ac].xrcdseq2,g_fabo3_d[l_ac].xrcd007,g_fabo3_d[l_ac].xrcd002,g_fabo3_d[l_ac].xrcd003,g_fabo3_d[l_ac].xrcd006,g_fabo3_d[l_ac].xrcd100,g_fabo3_d[l_ac].xrcd005,g_fabo3_d[l_ac].xrcd104,g_fabo3_d[l_ac].xrcd103,g_fabo3_d[l_ac].xrcd105,g_fabo3_d[l_ac].xrcd009
      #end add-point
   END FOR
   FOR l_ac = 1 TO g_fabo4_d.getLength()
      #add-point:show段單身reference name="show.body4.reference"
 
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL afat504_detail_show()
 
   #add-point:show段之後 name="show.after"
   #20150104 add by chenying
   #161215-00044#1---modify----begin-----------------
   #SELECT * INTO g_glaa.* 
   SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
          glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
          glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
          glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
          glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
          glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161215-00044#1---modify----end----------------- 
   FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = g_fabg_m.fabgld
 
   IF g_glaa.glaa121 = 'Y' THEN
      CALL cl_set_toolbaritem_visible('open_pre',TRUE)
   ELSE
      CALL cl_set_toolbaritem_visible('open_pre',FALSE)
   END IF
   #20150104 add by chenyings
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.detail_show" type="s" >}
#+ 第二階單身reference
PRIVATE FUNCTION afat504_detail_show()
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
 
{<section id="afat504.reproduce" type="s" >}
#+ 資料複製
PRIVATE FUNCTION afat504_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE fabg_t.fabgld 
   DEFINE l_oldno     LIKE fabg_t.fabgld 
   DEFINE l_newno02     LIKE fabg_t.fabgdocno 
   DEFINE l_oldno02     LIKE fabg_t.fabgdocno 
 
   DEFINE l_master    RECORD LIKE fabg_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE fabo_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE xrcd_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET g_master_insert = FALSE
   
   IF g_fabg_m.fabgld IS NULL
   OR g_fabg_m.fabgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_fabgld_t = g_fabg_m.fabgld
   LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
    
   LET g_fabg_m.fabgld = ""
   LET g_fabg_m.fabgdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_fabg_m.fabgownid = g_user
      LET g_fabg_m.fabgowndp = g_dept
      LET g_fabg_m.fabgcrtid = g_user
      LET g_fabg_m.fabgcrtdp = g_dept 
      LET g_fabg_m.fabgcrtdt = cl_get_current()
      LET g_fabg_m.fabgmodid = g_user
      LET g_fabg_m.fabgmoddt = cl_get_current()
      LET g_fabg_m.fabgstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_fabgld_o=g_fabgld_t
   LET g_fabgdocno_o=g_fabgdocno_t
   #160414-00015#1 add -str
   LET g_fabg_m.fabg008  =  NULL
   LET g_fabg_m.fabg011  =  NULL
   LET g_fabg_m.fabgdocdt = g_today 
   LET g_fabg_m.fabgcnfdt = NULL
   LET g_fabg_m.fabgpstid  = NULL
   LET g_fabg_m.fabgpstid_desc  = NULL   
   LET g_fabg_m.fabgpstdt  = NULL
   LET g_fabg_m.fabgcnfid  = NULL
   LET g_fabg_m.fabgcnfid_desc  = NULL 
   #160414-00015#1 add -end 
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_fabg_m.fabgstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_fabg_m.fabgld_desc = ''
   DISPLAY BY NAME g_fabg_m.fabgld_desc
 
   
   CALL afat504_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_fabg_m.* TO NULL
      INITIALIZE g_fabo_d TO NULL
      INITIALIZE g_fabo3_d TO NULL
      INITIALIZE g_fabo4_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL afat504_show()
      CALL afat504_idx_chk()   #(ver:83)
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
   CALL afat504_set_act_visible()   
   CALL afat504_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_fabgld_t = g_fabg_m.fabgld
   LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " fabgent = " ||g_enterprise|| " AND",
                      " fabgld = '", g_fabg_m.fabgld, "' "
                      ," AND fabgdocno = '", g_fabg_m.fabgdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL afat504_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL afat504_idx_chk()
   
   LET g_data_owner = g_fabg_m.fabgownid      
   LET g_data_dept  = g_fabg_m.fabgowndp
   LET g_data_crtid = g_fabg_m.fabgcrtid   #180201-00054
   LET g_data_crtdp = g_fabg_m.fabgcrtdp   #180201-00054
   
   #功能已完成,通報訊息中心
   CALL afat504_msgcentre_notify('reproduce')
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.detail_reproduce" type="s" >}
#+ 單身自動複製
PRIVATE FUNCTION afat504_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE fabo_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE xrcd_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE afat504_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM fabo_t
    WHERE faboent = g_enterprise AND fabold = g_fabgld_t
     AND fabodocno = g_fabgdocno_t
 
    INTO TEMP afat504_detail
 
   #將key修正為調整後   
   UPDATE afat504_detail 
      #更新key欄位
      SET fabold = g_fabg_m.fabgld
          , fabodocno = g_fabg_m.fabgdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO fabo_t SELECT * FROM afat504_detail
   
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
   DROP TABLE afat504_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM xrcd_t 
    WHERE xrcdent = g_enterprise AND xrcdld = g_fabgld_t
      AND xrcddocno = g_fabgdocno_t   
 
    INTO TEMP afat504_detail
 
   #將key修正為調整後   
   UPDATE afat504_detail SET xrcdld = g_fabg_m.fabgld
                                       , xrcddocno = g_fabg_m.fabgdocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO xrcd_t SELECT * FROM afat504_detail
 
   #180110-00034 ---start---
   IF SQLCA.SQLCODE THEN
      #add-point:錯誤時處理 name="detail_reproduce.body.table2.rollback"
      
      #end add-point
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "Reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   #180110-00034 --- end ---
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE afat504_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_fabgld_t = g_fabg_m.fabgld
   LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.delete" type="s" >}
#+ 資料刪除
PRIVATE FUNCTION afat504_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE l_success    LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_fabg_m.fabgld IS NULL
   OR g_fabg_m.fabgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE afat504_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
       g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid, 
       g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
       g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
   
   
   #檢查是否允許此動作
   IF NOT afat504_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_fabg_m_mask_o.* =  g_fabg_m.*
   CALL afat504_fabg_t_mask()
   LET g_fabg_m_mask_n.* =  g_fabg_m.*
   
   CALL afat504_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   #151231-00005#3--add--str--lujh
   IF NOT cl_null(g_fabg_m.fabgdocdt) THEN 
      IF NOT s_afa_date_chk(g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN 
         CLOSE afat504_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF 
   END IF 
   #151231-00005#3--add--end--lujh
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL afat504_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_fabgld_t = g_fabg_m.fabgld
      LET g_fabgdocno_t = g_fabg_m.fabgdocno
 
 
      DELETE FROM fabg_t
       WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
         AND fabgdocno = g_fabg_m.fabgdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_fabg_m.fabgld,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_fin_del_docno(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM fabo_t
       WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld
         AND fabodocno = g_fabg_m.fabgdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
      #add-point:單身刪除前 name="delete.body.b_delete2"
      
      #end add-point
      DELETE FROM xrcd_t
       WHERE xrcdent = g_enterprise AND
             xrcdld = g_fabg_m.fabgld AND xrcddocno = g_fabg_m.fabgdocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      #20150104 add by chenying
      IF g_glaa.glaa121 = 'Y' THEN
         CALL s_pre_voucher_del('FA','F40',g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
         
         IF l_success = FALSE THEN 
            CALL s_transaction_end('N','0')
            RETURN
         END IF
      END IF
      #20150104 add by chenying
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_fabg_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE afat504_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_fabo_d.clear() 
      CALL g_fabo3_d.clear()       
      CALL g_fabo4_d.clear()       
 
     
      CALL afat504_ui_browser_refresh()  
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
         #161130-00056 add
      
      #單身多語言刪除
      
         #161130-00056 add
      
         #161130-00056 add
      
         #161130-00056 add
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      #清空單頭資料
      INITIALIZE g_fabg_m.* TO NULL   #180420-00043
 
      IF g_browser_cnt > 0 THEN 
         #CALL afat504_browser_fill("")
         CALL afat504_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE afat504_cl
 
   #功能已完成,通報訊息中心
   CALL afat504_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="afat504.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION afat504_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_glab002  LIKE glab_t.glab002 #20141119
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_fabo_d.clear()
   CALL g_fabo3_d.clear()
   CALL g_fabo4_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF afat504_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR 
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035,fabo036, 
             fabo037,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,faboseq,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154, 
             fabo155,fabo157,fabo158,fabo159,fabo160,fabo161 ,t1.oocql004 FROM fabo_t",   
                     " INNER JOIN fabg_t ON fabgent = " ||g_enterprise|| " AND fabgld = fabold ",
                     " AND fabgdocno = fabodocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN oocql_t t1 ON t1.oocqlent="||g_enterprise||" AND t1.oocql001='3902' AND t1.oocql002=fabo023 AND t1.oocql003='"||g_dlang||"' ",
 
                     " WHERE faboent=? AND fabold=? AND fabodocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
 
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY fabo_t.faboseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE afat504_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR afat504_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
      FOREACH b_fill_cs USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabo_d[l_ac].faboseq,g_fabo_d[l_ac].fabo001,g_fabo_d[l_ac].fabo002,g_fabo_d[l_ac].fabo003,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,g_fabo_d[l_ac].fabo009,g_fabo_d[l_ac].fabo005,g_fabo_d[l_ac].fabo007, 
          g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo011,g_fabo_d[l_ac].fabo012,g_fabo_d[l_ac].fabo013,g_fabo_d[l_ac].fabo014,g_fabo_d[l_ac].fabo015,g_fabo_d[l_ac].fabo016,g_fabo_d[l_ac].fabo017,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019,g_fabo_d[l_ac].fabo021, 
          g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049,g_fabo_d[l_ac].fabo025,g_fabo_d[l_ac].fabo023,g_fabo_d[l_ac].fabo031,g_fabo_d[l_ac].fabo032,g_fabo_d[l_ac].fabo033,g_fabo_d[l_ac].fabo034,g_fabo_d[l_ac].fabo035,g_fabo_d[l_ac].fabo036,g_fabo_d[l_ac].fabo037,g_fabo_d[l_ac].fabo055,g_fabo_d[l_ac].fabo056, 
          g_fabo_d[l_ac].fabo038,g_fabo_d[l_ac].fabo039,g_fabo_d[l_ac].fabo040,g_fabo_d[l_ac].fabo057,g_fabo_d[l_ac].fabo060,g_fabo_d[l_ac].fabo061,g_fabo_d[l_ac].fabo062,g_fabo_d[l_ac].fabo063,g_fabo_d[l_ac].fabo064,g_fabo_d[l_ac].fabo065,g_fabo_d[l_ac].fabo066,g_fabo_d[l_ac].fabo067,g_fabo_d[l_ac].fabo068, 
          g_fabo_d[l_ac].fabo069,g_fabo4_d[l_ac].faboseq,g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo103,g_fabo4_d[l_ac].fabo104,g_fabo4_d[l_ac].fabo105,g_fabo4_d[l_ac].fabo106,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,g_fabo4_d[l_ac].fabo110,g_fabo4_d[l_ac].fabo111, 
          g_fabo4_d[l_ac].fabo112,g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo151,g_fabo4_d[l_ac].fabo152,g_fabo4_d[l_ac].fabo153,g_fabo4_d[l_ac].fabo154,g_fabo4_d[l_ac].fabo155,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,g_fabo4_d[l_ac].fabo159,g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo161, 
          g_fabo_d[l_ac].fabo023_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         SELECT faaj103,faaj153
           INTO g_fabo4_d[l_ac].faaj103,g_fabo4_d[l_ac].faaj153
           FROM faaj_t
          WHERE faajent=g_enterprise AND faajld=g_fabg_m.fabgld
            AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002
            AND faaj037=g_fabo_d[l_ac].fabo003          
         SELECT faah012,faah013,faah014  #160426-00014#23 add faah013
           INTO g_fabo_d[l_ac].faah012,g_fabo_d[l_ac].faah013,g_fabo_d[l_ac].faah014  #160426-00014#23 add g_fabo_d[l_ac].faah013   #180531-00059#1 add g_fabo_d[l_ac].faah014
           FROM faah_t
          WHERE faahent=g_enterprise AND faah001=g_fabo_d[l_ac].fabo003
            AND faah003=g_fabo_d[l_ac].fabo001 AND faah004=g_fabo_d[l_ac].fabo002 
            
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
    
   #判斷是否填充
   IF afat504_fill_chk(2) THEN
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcd113,xrcd114,xrcd115  FROM xrcd_t",   
                     " INNER JOIN  fabg_t ON fabgent = " ||g_enterprise|| " AND fabgld = xrcdld ",
                     " AND fabgdocno = xrcddocno ",
 
                     "",
                     
                     
                     " WHERE xrcdent=? AND xrcdld=? AND xrcddocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY xrcd_t.xrcdseq,xrcd_t.xrcdseq2,xrcd_t.xrcd007"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE afat504_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR afat504_pb2
      END IF
    
      LET l_ac = 1
      
      FOREACH b_fill_cs2 USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabo3_d[l_ac].xrcdseq,g_fabo3_d[l_ac].xrcdseq2,g_fabo3_d[l_ac].xrcd007,g_fabo3_d[l_ac].xrcd002,g_fabo3_d[l_ac].xrcd003,g_fabo3_d[l_ac].xrcd006,g_fabo3_d[l_ac].xrcd100,g_fabo3_d[l_ac].xrcd005,g_fabo3_d[l_ac].xrcd104, 
          g_fabo3_d[l_ac].xrcd103,g_fabo3_d[l_ac].xrcd105,g_fabo3_d[l_ac].xrcd009,g_fabo3_d[l_ac].xrcd113,g_fabo3_d[l_ac].xrcd114,g_fabo3_d[l_ac].xrcd115   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         CALL afat504_get_fabo001()
         CALL afat504_xrcd002_desc(g_fabo3_d[l_ac].xrcd002) RETURNING g_fabo3_d[l_ac].xrcd002_desc
         CALL afat504_xrcd009_desc(g_fabo3_d[l_ac].xrcd009) RETURNING g_fabo3_d[l_ac].xrcd009_desc
         #20141119 add--str-- by chenying
         #预设税别科目（aisi070中获取）
         #根据账款客户抓取账款类别
         IF cl_null(g_fabo3_d[l_ac].xrcd009) THEN 
            SELECT pmab105 INTO l_glab002 FROM pmab_t
             WHERE pmabent = g_enterprise AND pmabsite = g_fabg_m.fabgsite AND pmab001 = g_fabg_m.fabg006
            SELECT glab005 INTO g_fabo3_d[l_ac].xrcd009 FROM glab_t 
             WHERE glabld = g_fabg_m.fabgld 
               AND glab001 = '14'               # 税别会计科目设置
               AND glab003 = g_fabg_m.fabg013   # 税别 
               AND glabent = g_enterprise                
         END IF      
         #20141119 add--end--         
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            #若是因為切換畫面的話，不用再次顯示超過最大顯示筆數的訊息
            IF cl_null(g_action_choice) OR g_action_choice <> "ui_change" THEN   #190108-00038
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF   #190108-00038
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   #161028-00042#1--add--str--lujh
   LET g_fabgld=g_fabg_m.fabgld
   LET g_fabgdocno=g_fabg_m.fabgdocno
   #161028-00042#1--add--end--lujh
   CALL afat504_01_b_fill()
   #end add-point
   
   CALL g_fabo_d.deleteElement(g_fabo_d.getLength())
   CALL g_fabo3_d.deleteElement(g_fabo3_d.getLength())
   CALL g_fabo4_d.deleteElement(g_fabo4_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE afat504_pb
   FREE afat504_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_fabo_d.getLength()
      LET g_fabo_d_mask_o[l_ac].* =  g_fabo_d[l_ac].*
      CALL afat504_fabo_t_mask()
      LET g_fabo_d_mask_n[l_ac].* =  g_fabo_d[l_ac].*
   END FOR
   
   LET g_fabo3_d_mask_o.* =  g_fabo3_d.*
   FOR l_ac = 1 TO g_fabo3_d.getLength()
      LET g_fabo3_d_mask_o[l_ac].* =  g_fabo3_d[l_ac].*
      CALL afat504_xrcd_t_mask()
      LET g_fabo3_d_mask_n[l_ac].* =  g_fabo3_d[l_ac].*
   END FOR
   LET g_fabo4_d_mask_o.* =  g_fabo4_d.*
   FOR l_ac = 1 TO g_fabo4_d.getLength()
      LET g_fabo4_d_mask_o[l_ac].* =  g_fabo4_d[l_ac].*
      CALL afat504_fabo_t_mask()
      LET g_fabo4_d_mask_n[l_ac].* =  g_fabo4_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.delete_b" type="s" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION afat504_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
#  LET g_update = TRUE  #200610-00021 mark
   
   #判斷是否是同一群組的table
   LET ls_group = "'1','3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM fabo_t
       WHERE faboent = g_enterprise AND
         fabold = ps_keys_bak[1] AND fabodocno = ps_keys_bak[2] AND faboseq = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
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
         CALL g_fabo_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'3'" THEN 
         CALL g_fabo4_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM xrcd_t
       WHERE xrcdent = g_enterprise AND
             xrcdld = ps_keys_bak[1] AND xrcddocno = ps_keys_bak[2] AND xrcdseq = ps_keys_bak[3] AND xrcdseq2 = ps_keys_bak[4] AND xrcd007 = ps_keys_bak[5]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_fabo3_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   LET g_update = TRUE  #200610-00021
 
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.insert_b" type="s" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION afat504_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   DEFINE l_fabo029   LIKE fabo_t.fabo029
   DEFINE l_faaj026   LIKE faaj_t.faaj026
   DEFINE l_faaj023   LIKE faaj_t.faaj023
   DEFINE l_faaj024   LIKE faaj_t.faaj024
   DEFINE l_para_data LIKE ooab_t.ooab002
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   #200402-00035#1 add(s)
   IF cl_null(g_fabo_d[g_detail_idx].fabo033) THEN LET g_fabo_d[g_detail_idx].fabo033 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo034) THEN LET g_fabo_d[g_detail_idx].fabo034 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo035) THEN LET g_fabo_d[g_detail_idx].fabo035 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo036) THEN LET g_fabo_d[g_detail_idx].fabo036 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo037) THEN LET g_fabo_d[g_detail_idx].fabo037 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo038) THEN LET g_fabo_d[g_detail_idx].fabo038 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo039) THEN LET g_fabo_d[g_detail_idx].fabo039 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo040) THEN LET g_fabo_d[g_detail_idx].fabo040 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo055) THEN LET g_fabo_d[g_detail_idx].fabo055 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo056) THEN LET g_fabo_d[g_detail_idx].fabo056 = ' ' END IF
   #IF cl_null(g_fabo_d[g_detail_idx].fabo057) THEN LET g_fabo_d[g_detail_idx].fabo057 = ' ' END IF   #201116-00024#1 add
   IF cl_null(g_fabo_d[g_detail_idx].fabo060) THEN LET g_fabo_d[g_detail_idx].fabo060 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo061) THEN LET g_fabo_d[g_detail_idx].fabo061 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo062) THEN LET g_fabo_d[g_detail_idx].fabo062 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo063) THEN LET g_fabo_d[g_detail_idx].fabo063 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo064) THEN LET g_fabo_d[g_detail_idx].fabo064 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo065) THEN LET g_fabo_d[g_detail_idx].fabo065 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo066) THEN LET g_fabo_d[g_detail_idx].fabo066 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo067) THEN LET g_fabo_d[g_detail_idx].fabo067 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo068) THEN LET g_fabo_d[g_detail_idx].fabo068 = ' ' END IF
   IF cl_null(g_fabo_d[g_detail_idx].fabo069) THEN LET g_fabo_d[g_detail_idx].fabo069 = ' ' END IF
   #200402-00035#1 add(e)
   #end add-point
   
#  LET g_update = TRUE   #200610-00021 mark
   
   #判斷是否是同一群組的table
   LET ls_group = "'1','3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO fabo_t
                  (faboent,
                   fabold,fabodocno,
                   faboseq
                   ,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035,fabo036,fabo037,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo157,fabo158,fabo159,fabo160,fabo161) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_fabo_d[g_detail_idx].fabo001,g_fabo_d[g_detail_idx].fabo002,g_fabo_d[g_detail_idx].fabo003,g_fabo_d[g_detail_idx].fabo000,g_fabo_d[g_detail_idx].fabo008,g_fabo_d[g_detail_idx].fabo053,g_fabo_d[g_detail_idx].fabo009,g_fabo_d[g_detail_idx].fabo005,g_fabo_d[g_detail_idx].fabo007,g_fabo_d[g_detail_idx].fabo006, 
                       g_fabo_d[g_detail_idx].fabo010,g_fabo_d[g_detail_idx].fabo011,g_fabo_d[g_detail_idx].fabo012,g_fabo_d[g_detail_idx].fabo013,g_fabo_d[g_detail_idx].fabo014,g_fabo_d[g_detail_idx].fabo015,g_fabo_d[g_detail_idx].fabo016,g_fabo_d[g_detail_idx].fabo017,g_fabo_d[g_detail_idx].fabo020, 
                       g_fabo_d[g_detail_idx].fabo018,g_fabo_d[g_detail_idx].fabo019,g_fabo_d[g_detail_idx].fabo021,g_fabo_d[g_detail_idx].fabo022,g_fabo_d[g_detail_idx].fabo049,g_fabo_d[g_detail_idx].fabo025,g_fabo_d[g_detail_idx].fabo023,g_fabo_d[g_detail_idx].fabo031,g_fabo_d[g_detail_idx].fabo032, 
                       g_fabo_d[g_detail_idx].fabo033,g_fabo_d[g_detail_idx].fabo034,g_fabo_d[g_detail_idx].fabo035,g_fabo_d[g_detail_idx].fabo036,g_fabo_d[g_detail_idx].fabo037,g_fabo_d[g_detail_idx].fabo055,g_fabo_d[g_detail_idx].fabo056,g_fabo_d[g_detail_idx].fabo038,g_fabo_d[g_detail_idx].fabo039, 
                       g_fabo_d[g_detail_idx].fabo040,g_fabo_d[g_detail_idx].fabo057,g_fabo_d[g_detail_idx].fabo060,g_fabo_d[g_detail_idx].fabo061,g_fabo_d[g_detail_idx].fabo062,g_fabo_d[g_detail_idx].fabo063,g_fabo_d[g_detail_idx].fabo064,g_fabo_d[g_detail_idx].fabo065,g_fabo_d[g_detail_idx].fabo066, 
                       g_fabo_d[g_detail_idx].fabo067,g_fabo_d[g_detail_idx].fabo068,g_fabo_d[g_detail_idx].fabo069,g_fabo4_d[g_detail_idx].fabo107,g_fabo4_d[g_detail_idx].fabo101,g_fabo4_d[g_detail_idx].fabo102,g_fabo4_d[g_detail_idx].fabo103,g_fabo4_d[g_detail_idx].fabo104,g_fabo4_d[g_detail_idx].fabo105, 
                       g_fabo4_d[g_detail_idx].fabo106,g_fabo4_d[g_detail_idx].fabo108,g_fabo4_d[g_detail_idx].fabo109,g_fabo4_d[g_detail_idx].fabo110,g_fabo4_d[g_detail_idx].fabo111,g_fabo4_d[g_detail_idx].fabo112,g_fabo4_d[g_detail_idx].fabo156,g_fabo4_d[g_detail_idx].fabo150,g_fabo4_d[g_detail_idx].fabo151, 
                       g_fabo4_d[g_detail_idx].fabo152,g_fabo4_d[g_detail_idx].fabo153,g_fabo4_d[g_detail_idx].fabo154,g_fabo4_d[g_detail_idx].fabo155,g_fabo4_d[g_detail_idx].fabo157,g_fabo4_d[g_detail_idx].fabo158,g_fabo4_d[g_detail_idx].fabo159,g_fabo4_d[g_detail_idx].fabo160,g_fabo4_d[g_detail_idx].fabo161) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      CALL afat504_01_set_default_value(g_fabg_m.fabgdocno,g_fabg_m.fabgld,g_fabo_d[l_ac].faboseq)  #设定afat504_01默认值
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_fabo_d.insertElement(li_idx) 
      END IF 
      IF ps_page <> "'3'" THEN 
         CALL g_fabo4_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      #應收賬款科目為afai071對應的出售應收科目
#20141109 mod--str--      
#      SELECT glab005 INTO l_fabo029 FROM glab_t
#               WHERE glabent=g_enterprise AND glabld=g_fabg_m.fabgld AND glab001='90' AND glab002='40' AND glab003='9902_05'
#参数设置资产清理科目则抓取afai071对应的资产清理科目
       CALL cl_get_para(g_enterprise,g_fabg_m.fabgcomp,'S-FIN-9017') RETURNING l_para_data
       IF l_para_data = 'Y' THEN        
          SELECT glab005 INTO l_fabo029 FROM glab_t
           WHERE glabent=g_enterprise AND glabld=g_fabg_m.fabgld
             AND glab002='25' AND glab001='90' AND glab003='9902_12'
       ELSE
          SELECT glab005 INTO l_fabo029 FROM glab_t
           WHERE glabent=g_enterprise AND glabld=g_fabg_m.fabgld
             AND glab002='40' AND glab001='90' AND glab003='9902_05'       
       END IF       
#20141109 mod--end--
      SELECT faaj023,faaj024,faaj026 INTO l_faaj023,l_faaj024,l_faaj026  FROM faaj_t  
       WHERE faajent = g_enterprise AND faajld = g_fabg_m.fabgld
         AND faaj001 = g_fabo_d[g_detail_idx].fabo001 AND faaj002 = g_fabo_d[g_detail_idx].fabo002
         AND faaj037 = g_fabo_d[g_detail_idx].fabo003         
      UPDATE fabo_t SET fabo029=l_fabo029,
                        fabo026=l_faaj024,
                        fabo027=l_faaj026,
                       #fabo032=g_fabg_m.fabg003, #170620-00072#1 add    #181015-00013#3 mark   
                        fabo028=l_faaj023
                  WHERE faboent=g_enterprise AND fabold=ps_keys[1] 
                    AND fabodocno=ps_keys[2] AND faboseq=ps_keys[3]
      #160310-00013#1-----b
      #营运中心没值，带afai100默认
      SELECT fabo031 INTO g_fabo031 FROM fabo_t 
      WHERE faboent=g_enterprise AND fabold=ps_keys[1] 
        AND fabodocno=ps_keys[2] AND faboseq=ps_keys[3]
      IF cl_null(g_fabo031) THEN 
         SELECT faajsite INTO g_faajsite
           FROM faaj_t
          WHERE faajent = g_enterprise AND faajld = g_fabg_m.fabgld
            AND faaj001 = g_fabo_d[g_detail_idx].fabo001 AND faaj002 = g_fabo_d[g_detail_idx].fabo002
            AND faaj037 = g_fabo_d[g_detail_idx].fabo003
         UPDATE fabo_t SET fabo031 = g_faajsite
          WHERE faboent=g_enterprise AND fabold=ps_keys[1] 
            AND fabodocno=ps_keys[2] AND faboseq=ps_keys[3]
      END IF
      #160310-00013#1-----e   
      #200402-00035#1 add(s)
      IF cl_null(g_fabo_d[l_ac].fabo0554) THEN
         LET g_fabo_d[l_ac].fabo0554 = ' '
      END IF
      #200402-00035#1 add(e)
      #170512-00045#30 add-s
      #更新经营方式
      UPDATE fabo_t set fabo054=g_fabo_d[l_ac].fabo0554 
      WHERE faboent=g_enterprise AND fabold=g_fabg_m.fabgld AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo_d[l_ac].faboseq
      #170512-00045#30 add-e
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO xrcd_t
                  (xrcdent,
                   xrcdld,xrcddocno,
                   xrcdseq,xrcdseq2,xrcd007
                   ,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcd113,xrcd114,xrcd115) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
                   ,g_fabo3_d[g_detail_idx].xrcd002,g_fabo3_d[g_detail_idx].xrcd003,g_fabo3_d[g_detail_idx].xrcd006,g_fabo3_d[g_detail_idx].xrcd100,g_fabo3_d[g_detail_idx].xrcd005,g_fabo3_d[g_detail_idx].xrcd104,g_fabo3_d[g_detail_idx].xrcd103,g_fabo3_d[g_detail_idx].xrcd105,g_fabo3_d[g_detail_idx].xrcd009, 
                       g_fabo3_d[g_detail_idx].xrcd113,g_fabo3_d[g_detail_idx].xrcd114,g_fabo3_d[g_detail_idx].xrcd115)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_fabo3_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      CALL afat504_b_fill()
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
   LET g_update = TRUE   #200610-00021
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.update_b" type="s" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION afat504_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   LET ls_group = "'1','3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "fabo_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL afat504_fabo_t_mask_restore('restore_mask_o')
               
      UPDATE fabo_t 
         SET (fabold,fabodocno,
              faboseq
              ,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053,fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016,fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo025,fabo023,fabo031,fabo032,fabo033,fabo034,fabo035,fabo036,fabo037,fabo055,fabo056,fabo038,fabo039,fabo040,fabo057,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,fabo068,fabo069,fabo107,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo112,fabo156,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo157,fabo158,fabo159,fabo160,fabo161) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_fabo_d[g_detail_idx].fabo001,g_fabo_d[g_detail_idx].fabo002,g_fabo_d[g_detail_idx].fabo003,g_fabo_d[g_detail_idx].fabo000,g_fabo_d[g_detail_idx].fabo008,g_fabo_d[g_detail_idx].fabo053,g_fabo_d[g_detail_idx].fabo009,g_fabo_d[g_detail_idx].fabo005,g_fabo_d[g_detail_idx].fabo007,g_fabo_d[g_detail_idx].fabo006, 
                  g_fabo_d[g_detail_idx].fabo010,g_fabo_d[g_detail_idx].fabo011,g_fabo_d[g_detail_idx].fabo012,g_fabo_d[g_detail_idx].fabo013,g_fabo_d[g_detail_idx].fabo014,g_fabo_d[g_detail_idx].fabo015,g_fabo_d[g_detail_idx].fabo016,g_fabo_d[g_detail_idx].fabo017,g_fabo_d[g_detail_idx].fabo020,g_fabo_d[g_detail_idx].fabo018, 
                  g_fabo_d[g_detail_idx].fabo019,g_fabo_d[g_detail_idx].fabo021,g_fabo_d[g_detail_idx].fabo022,g_fabo_d[g_detail_idx].fabo049,g_fabo_d[g_detail_idx].fabo025,g_fabo_d[g_detail_idx].fabo023,g_fabo_d[g_detail_idx].fabo031,g_fabo_d[g_detail_idx].fabo032,g_fabo_d[g_detail_idx].fabo033,g_fabo_d[g_detail_idx].fabo034, 
                  g_fabo_d[g_detail_idx].fabo035,g_fabo_d[g_detail_idx].fabo036,g_fabo_d[g_detail_idx].fabo037,g_fabo_d[g_detail_idx].fabo055,g_fabo_d[g_detail_idx].fabo056,g_fabo_d[g_detail_idx].fabo038,g_fabo_d[g_detail_idx].fabo039,g_fabo_d[g_detail_idx].fabo040,g_fabo_d[g_detail_idx].fabo057,g_fabo_d[g_detail_idx].fabo060, 
                  g_fabo_d[g_detail_idx].fabo061,g_fabo_d[g_detail_idx].fabo062,g_fabo_d[g_detail_idx].fabo063,g_fabo_d[g_detail_idx].fabo064,g_fabo_d[g_detail_idx].fabo065,g_fabo_d[g_detail_idx].fabo066,g_fabo_d[g_detail_idx].fabo067,g_fabo_d[g_detail_idx].fabo068,g_fabo_d[g_detail_idx].fabo069,g_fabo4_d[g_detail_idx].fabo107, 
                  g_fabo4_d[g_detail_idx].fabo101,g_fabo4_d[g_detail_idx].fabo102,g_fabo4_d[g_detail_idx].fabo103,g_fabo4_d[g_detail_idx].fabo104,g_fabo4_d[g_detail_idx].fabo105,g_fabo4_d[g_detail_idx].fabo106,g_fabo4_d[g_detail_idx].fabo108,g_fabo4_d[g_detail_idx].fabo109,g_fabo4_d[g_detail_idx].fabo110, 
                  g_fabo4_d[g_detail_idx].fabo111,g_fabo4_d[g_detail_idx].fabo112,g_fabo4_d[g_detail_idx].fabo156,g_fabo4_d[g_detail_idx].fabo150,g_fabo4_d[g_detail_idx].fabo151,g_fabo4_d[g_detail_idx].fabo152,g_fabo4_d[g_detail_idx].fabo153,g_fabo4_d[g_detail_idx].fabo154,g_fabo4_d[g_detail_idx].fabo155, 
                  g_fabo4_d[g_detail_idx].fabo157,g_fabo4_d[g_detail_idx].fabo158,g_fabo4_d[g_detail_idx].fabo159,g_fabo4_d[g_detail_idx].fabo160,g_fabo4_d[g_detail_idx].fabo161) 
         WHERE faboent = g_enterprise AND fabold = ps_keys_bak[1] AND fabodocno = ps_keys_bak[2] AND faboseq = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "fabo_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL afat504_fabo_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "xrcd_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL afat504_xrcd_t_mask_restore('restore_mask_o')
               
      UPDATE xrcd_t 
         SET (xrcdld,xrcddocno,
              xrcdseq,xrcdseq2,xrcd007
              ,xrcd002,xrcd003,xrcd006,xrcd100,xrcd005,xrcd104,xrcd103,xrcd105,xrcd009,xrcd113,xrcd114,xrcd115) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
              ,g_fabo3_d[g_detail_idx].xrcd002,g_fabo3_d[g_detail_idx].xrcd003,g_fabo3_d[g_detail_idx].xrcd006,g_fabo3_d[g_detail_idx].xrcd100,g_fabo3_d[g_detail_idx].xrcd005,g_fabo3_d[g_detail_idx].xrcd104,g_fabo3_d[g_detail_idx].xrcd103,g_fabo3_d[g_detail_idx].xrcd105,g_fabo3_d[g_detail_idx].xrcd009, 
                  g_fabo3_d[g_detail_idx].xrcd113,g_fabo3_d[g_detail_idx].xrcd114,g_fabo3_d[g_detail_idx].xrcd115) 
         WHERE xrcdent = g_enterprise AND xrcdld = ps_keys_bak[1] AND xrcddocno = ps_keys_bak[2] AND xrcdseq = ps_keys_bak[3] AND xrcdseq2 = ps_keys_bak[4] AND xrcd007 = ps_keys_bak[5]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrcd_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL afat504_xrcd_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
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
 
{<section id="afat504.key_update_b" type="s" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION afat504_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="afat504.key_delete_b" type="s" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION afat504_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="afat504.lock_b" type="s" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION afat504_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL afat504_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1','3',"
   #僅鎖定自身table
   LET ls_group = "fabo_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN afat504_bcl USING g_enterprise,
                                       g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabo_d[g_detail_idx].faboseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "afat504_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "xrcd_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN afat504_bcl2 USING g_enterprise,
                                             g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabo3_d[g_detail_idx].xrcdseq,g_fabo3_d[g_detail_idx].xrcdseq2,g_fabo3_d[g_detail_idx].xrcd007
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "afat504_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.unlock_b" type="s" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION afat504_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1','3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE afat504_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE afat504_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_entry" type="s" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION afat504_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("fabgdocno,fabgld",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("fabgld,fabgdocno",TRUE)
      CALL cl_set_comp_entry("fabgdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("fabgdocdt",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_no_entry" type="s" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION afat504_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_dfin0033  LIKE type_t.chr1  #151130-00015#2
   DEFINE l_success   LIKE type_t.chr1  #151130-00015#2
   DEFINE l_slip      LIKE type_t.chr80 #151130-00015#2 
   DEFINE l_fabgcomp  LIKE type_t.chr80 #151130-00015#2 
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("fabgld,fabgdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("fabgdocno,fabgld",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("fabgdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #151130-00015#2  -add -str
   IF NOT cl_null(g_fabg_m.fabgdocno) THEN  
      #获取单别
      CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_slip
      #判断是否可以修改单据日期
      SELECT ooef017 INTO l_fabgcomp
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_fabg_m.fabgsite
         AND ooefstus = 'Y'
  #   CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_slip,'D-FIN-0033') RETURNING l_dfin0033      #  170823-00023#1  2017/9/05 By 09771 mark
      CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_slip,'D-FIN-0033') RETURNING g_dfin0033       #  170823-00023#1  2017/9/05 By 09771 add
      #    IF l_dfin0033 = "Y"  THEN      #  170823-00023#1  2017/9/05 By 09771  mark
#      IF g_dfin0033 = "Y"  THEN       #  170823-00023#1  2017/9/05 By 09771  add    #190723-00011#5 mark
      IF (g_dfin0033 = "Y") OR (p_cmd = 'a') THEN    #190723-00011#5 add (p_cmd = 'a') 新增時不受D-FIN-0033限制
         CALL cl_set_comp_entry("fabgdocdt,fabg004",TRUE)    #190723-00011#5 add fabg004
    #  170823-00023#1  2017/9/05 By 09771--s  
      ELSE   
          CALL cl_set_comp_entry("fabgdocdt,fabg004",FALSE)  #190723-00011#5 add fabg004
    #  170823-00023#1  2017/9/05 By 09771--e       
      END IF          
   END IF 
   #151130-00015#2  -end -str
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_entry_b" type="s" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION afat504_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry('fabo013,fabo015,fabo016,fabo017',TRUE)   #170112-00040#1 add by 08172 
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_no_entry_b" type="s" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION afat504_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   #20141119 add--str--
   DEFINE  l_oodb006             LIKE oodb_t.oodb006
   DEFINE  l_oodb011             LIKE oodb_t.oodb011
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
   DEFINE  l_oodb005             LIKE oodb_t.oodb005
   DEFINE  l_oodbl004            LIKE oodbl_t.oodbl004
   DEFINE  l_success             LIKE type_t.chr1
   #20141119 add--end--
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   #20141119 add--str-- by chenying
   IF NOT cl_null(g_fabo_d[l_ac].fabo009) THEN
      CALL s_tax_chk(g_glaa.glaacomp,g_fabo_d[l_ac].fabo009)
         RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
      CALL cl_set_comp_entry('fabo012,fabo014',TRUE)
      IF l_oodb005 = 'Y' THEN
         CALL cl_set_comp_entry('fabo012',FALSE)
      ELSE
         CALL cl_set_comp_entry('fabo014',FALSE)
      END IF
      #170112-00040#1 -s add by 08172
      IF l_oodb006 = 0 THEN
         CALL cl_set_comp_entry('fabo013,fabo016',FALSE)
      END IF
      #170112-00040#1 -e add by 08172
   END IF
   #20141119 add--end-- 
   #170112-00040#1 -s add by 08172
   IF g_fabo_d[l_ac].fabo011 = 1 THEN
      CALL cl_set_comp_entry('fabo015,fabo016,fabo017',FALSE)
   END IF 
   #170112-00040#1 -e add by 08172      
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_act_visible" type="s" >}
#+ 單頭權限開啟
PRIVATE FUNCTION afat504_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_act_no_visible" type="s" >}
#+ 單頭權限關閉
PRIVATE FUNCTION afat504_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_fabg_m.fabgstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   CALL cl_set_act_visible("reproduce",FALSE ) #180828-00006#2 add

   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_act_visible_b" type="s" >}
#+ 單身權限開啟
PRIVATE FUNCTION afat504_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="afat504.set_act_no_visible_b" type="s" >}
#+ 單身權限關閉
PRIVATE FUNCTION afat504_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="afat504.default_search" type="s" >}
#+ 外部參數搜尋
PRIVATE FUNCTION afat504_default_search()
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
      LET ls_wc = ls_wc, " fabgld = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " fabgdocno = '", g_argv[02], "' AND "
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
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "fabg_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "fabo_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "xrcd_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                  WHEN la_wc[li_idx].tableid = "EXTENDWC"
                     LET g_wc2_extend = la_wc[li_idx].wc
               END CASE
            END FOR
            IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
               OR NOT cl_null(g_wc2_table2)
 
 
               OR NOT cl_null(g_wc2_extend)
               THEN
               #組合g_wc2
               IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                  LET g_wc2 = g_wc2_table1
               END IF
               IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2)
                                                AND NOT g_wc2.getIndexOf(g_wc2_table2,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                  LET g_wc2 = g_wc2 ," AND ", g_wc2_table2           #200917-00047
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
 
{<section id="afat504.state_change" type="s" >}
   #應用 a09 樣板自動產生(Version:24)
#+ 確認碼變更 
PRIVATE FUNCTION afat504_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_fabg011    LIKE fabg_t.fabg011
   DEFINE l_wc         STRING  
   #20150608--add--str--lujh
   DEFINE  l_gzzd005   LIKE gzzd_t.gzzd005
   DEFINE  l_colname   STRING
   DEFINE  l_comment   STRING
   #20150608--add--end--lujh    
   #151125-00006#2-s
   DEFINE l_dfin0032    LIKE type_t.chr1
   DEFINE l_ooba002     LIKE ooba_t.ooba002
   DEFINE l_fabgcomp    LIKE fabg_t.fabgcomp
   DEFINE l_ld          LIKE fabg_t.fabgld
   #151125-00006#2-e
   DEFINE l_n           LIKE type_t.num10
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   #180130-00006 ---start---
   #保存單頭舊值
   LET g_fabg_m_t.* = g_fabg_m.*
   LET g_fabg_m_o.* = g_fabg_m.*
   #180130-00006 --- end ---
 
   IF g_fabg_m.fabgld IS NULL
      OR g_fabg_m.fabgdocno IS NULL
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN afat504_cl USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno
   IF SQLCA.SQLCODE THEN
      CLOSE afat504_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN afat504_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
       g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid, 
       g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
       g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
   
 
   #檢查是否允許此動作
   IF NOT afat504_action_chk() THEN
      CLOSE afat504_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt, 
       g_fabg_m.fabg006,g_fabg_m.fabg006_desc,g_fabg_m.fabg007,g_fabg_m.fabg007_desc,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp,g_fabg_m.fabgowndp_desc, 
       g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmodid_desc,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstid_desc,g_fabg_m.fabgpstdt
 
   CASE g_fabg_m.fabgstus
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   #151231-00005#3--add--str--lujh
   IF NOT cl_null(g_fabg_m.fabgdocdt) THEN 
      IF NOT s_afa_date_chk(g_fabg_m.fabgld,'',g_fabg_m.fabgdocdt) THEN 
         CLOSE afat504_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF 
   END IF 
   #151231-00005#3--add--end--lujh
   #171201-00004#1--add--s--xul
   #一次性交易对象
   IF NOT cl_null(g_fabg_m.fabg021) THEN              
      CALL s_axrt300_xrca_ref('xrca057',g_fabg_m.fabg006,g_fabg_m.fabg021,'') RETURNING l_success,g_fabg_m.fabg006_desc 
      IF g_fabg_m.fabg006 = g_fabg_m.fabg007 THEN
         LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
         DISPLAY BY NAME g_fabg_m.fabg007_desc
      END IF
      DISPLAY BY NAME g_fabg_m.fabg006_desc
   END IF
   #171201-00004#1--add--e--xul
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_fabg_m.fabgstus
            
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
         #181128-00048 ---start---
         #181211 SA說暫時先mark此段功能
      #  #BPM功能
      #  CALL cl_set_act_visible("reunconfirmed",FALSE)
      #  CASE g_fabg_m.fabgstus
      #      WHEN "A"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "D"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "R"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #  END CASE
         #181128-00048 --- end ---
 
      #add-point:menu前 name="statechange.before_menu"
      #approved    已核准(不卡)
      #rejection   已拒絕(不卡)
      #signing     提交
      #withdraw    抽單

      #confirmed   確認
      #unconfirmed 取消確認
      #posted      過帳
      #unposted    取消過帳
      #invalid     作廢
      #unhold      取消留置
      #hold        留置

#chenying add--str-
         #将一些不能切换的状态给隐藏掉，比如post时只能切confimed，不可切unconfirmed和invalid 
         IF g_fabg_m.fabgstus = 'X' THEN
            CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822
            RETURN
         END IF
         #HIDE OPTION "signing"
         #HIDE OPTION "withdraw"
         #HIDE OPTION "closed"
         #HIDE OPTION "hold"
#chenying add--end--



      CALL cl_set_act_visible("signing,withdraw",FALSE)
      #CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted,invalid,unhold,hold",FALSE)   #180614-00039#9 mark
      CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted,invalid,unhold,hold",TRUE)     #180614-00039#9 add

      CASE g_fabg_m.fabgstus
         WHEN "N"   #未確認

            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            #CALL cl_set_act_visible("invalid,confirmed",TRUE)                                      #180614-00039#9 mark
            CALL cl_set_act_visible("unconfirmed,posted,unposted,unhold,hold",FALSE)                #180614-00039#9 add

            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            
            END IF
            
         WHEN "X"   #作廢
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE) #141208-00022#1 add
            CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822
            RETURN

         WHEN "Y"   #已確認
            CALL cl_set_act_visible("unconfirmed,posted,hold",TRUE)  #141208-00022#1 mark  #160616-00005#3 remark
            #CALL cl_set_act_visible("invalid,confirmed,hold",FALSE)   #141208-00022#1 add #160616-00005#3 mark   
            CALL cl_set_act_visible("confirmed,unposted,invalid,unhold",FALSE)                      #180614-00039#9 add

         WHEN "S"   #已過帳
            CALL cl_set_act_visible("unposted",TRUE)
            CALL cl_set_act_visible("confirmed,unconfirmed,posted,invalid,unhold,hold",FALSE)       #180614-00039#9 add

         WHEN "A"   #已核准
            CALL cl_set_act_visible("confirmed ",TRUE)
            CALL cl_set_act_visible("unconfirmed,posted,unposted,invalid,unhold,hold",FALSE)        #180614-00039#9 add

         WHEN "R"   #已拒絕
#141208-00022#1 mod--str--         
#            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
#            CALL cl_set_act_visible("invalid,confirmed",TRUE)
#
#            IF cl_bpm_chk() THEN
#               CALL cl_set_act_visible("signing",TRUE)
#               CALL cl_set_act_visible("confirmed",FALSE)
#            END IF
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            #CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)                                 #180614-00039#9 mark
            CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted",FALSE)                  #180614-00039#9 add
#141208-00022#1 mod--end--            

         WHEN "D"   #抽單
#141208-00022#1 mod--str--           
#            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
#            CALL cl_set_act_visible("invalid,confirmed",TRUE)
#
#            IF cl_bpm_chk() THEN
#               CALL cl_set_act_visible("signing",TRUE)
#               CALL cl_set_act_visible("confirmed",FALSE)
#            END IF

            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            #CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)             #180614-00039#9 mark
            CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted",FALSE)   #180614-00039#9 add
#141208-00022#1 mod--end--  
         WHEN "W"   #送簽中
            CALL cl_set_act_visible("withdraw",TRUE)
            ##只能顯示抽單;其餘應用功能皆隱藏
            #CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE) #141208-00022#1 add     #180614-00039#9 mark
            CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted,invalid,unhold,hold",FALSE)   #180614-00039#9 add            

         WHEN "H"  #留置
            CALL cl_set_act_visible("unhold",TRUE)   

#         WHEN "UH" #取消留置
#         WHEN "Z"  #扣帳還原

      END CASE
      
       
      LET l_success=TRUE
      CALL s_transaction_begin()
      CALL cl_err_collect_init()
      #end add-point
      
      #應用 a36 樣板自動產生(Version:6)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT afat504_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE afat504_cl
             RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT afat504_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE afat504_cl
             RETURN
         END IF
 
      #181128-00048 ---start---
      #181211 SA說暫時先mark此段功能
      #還原為未確認
   #  ON ACTION reunconfirmed
   #     IF cl_auth_chk_act("reunconfirmed") THEN
   #        LET lc_state = "N"
   #        IF g_fabg_m.fabgstus = "A" THEN   #當狀態已核准寫入log
   #           CALL cl_bpm_write_status_log("RN")   #寫入log
   #        END IF
   #        #add-point:action控制 name="statechange.reunconfirmed"
   #        
   #        #end add-point
   #     END IF
   #     EXIT MENU
      #181128-00048 --- end ---
 
 
 
	  
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
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            #20150608--add--str--lujh
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
            LET g_coll_title[1] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
            LET g_coll_title[2] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
            LET g_coll_title[3] = l_colname
            
            CALL s_afa_p_faan_chk(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'fabo_t','fabo003','fabo001','fabo002') RETURNING l_success
            IF l_success = FALSE THEN 
               CALL s_transaction_end('N','0')                                            #171006-00010#13   add
               CALL cl_err_collect_show()
               #CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822     #171006-00010#13   mask
               RETURN 
            END IF
            #20150608--add--end--lujh
            
            CALL s_afat503_unconf_chk_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            IF l_success = TRUE THEN
               CALL s_afat503_unconf_upd_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success 
            END IF
            #end add-point
         END IF
         EXIT MENU
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
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            #20150608--add--str--lujh
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
            LET g_coll_title[1] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
            LET g_coll_title[2] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
            LET g_coll_title[3] = l_colname
            
            CALL s_afa_p_faan_chk(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'fabo_t','fabo003','fabo001','fabo002') RETURNING l_success
            IF l_success = FALSE THEN 
               CALL s_transaction_end('N','0')                                            #171006-00010#13   add
               CALL cl_err_collect_show()
               #CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822     #171006-00010#13   mask
               RETURN 
            END IF
            #20150608--add--end--lujh
            
            CALL s_afat503_conf_chk_fabo(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            IF l_success = TRUE THEN
               CALL s_afat503_conf_upd_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success 
            END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
            LET lc_state = "Y"  #chenying add
            
            #20150608--add--str--lujh
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
            LET g_coll_title[1] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
            LET g_coll_title[2] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
            LET g_coll_title[3] = l_colname
            
            CALL s_afa_p_faan_chk(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'fabo_t','fabo003','fabo001','fabo002') RETURNING l_success
            IF l_success = FALSE THEN 
               CALL s_transaction_end('N','0')                                            #171006-00010#13   add
               CALL cl_err_collect_show()
               #CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822     #171006-00010#13   mask
               RETURN 
            END IF
            #20150608--add--end--lujh
            
            CALL s_afat503_unpost_chk_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            IF l_success = TRUE THEN
               CALL s_afat503_unpost_upd_fabo(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
            #20150608--add--str--lujh
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
            LET g_coll_title[1] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
            LET g_coll_title[2] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
            LET g_coll_title[3] = l_colname
            
            CALL s_afa_p_faan_chk(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'fabo_t','fabo003','fabo001','fabo002') RETURNING l_success
            IF l_success = FALSE THEN 
               CALL s_transaction_end('N','0')                                            #171006-00010#13   add
               CALL cl_err_collect_show()
               #CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822     #171006-00010#13   mask
               RETURN 
            END IF
            #20150608--add--end--lujh
            
            SELECT fabg011 INTO l_fabg011 FROM fabg_t WHERE fabgent = g_enterprise
               AND fabgdocno = g_fabg_m.fabgdocno AND fabgld = g_fabg_m.fabgld
            IF cl_null(l_fabg011) THEN
               IF NOT cl_ask_confirm("afa-00266") THEN
                  CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822
                  RETURN
               END IF
            END IF
            CALL s_afat503_post_chk_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            IF l_success = TRUE THEN
               CALL s_afat503_post_upd_fabo(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success 
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            #20150608--add--str--lujh
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
            LET g_coll_title[1] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
            LET g_coll_title[2] = l_colname
            CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
            LET g_coll_title[3] = l_colname
            
            CALL s_afa_p_faan_chk(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,'fabo_t','fabo003','fabo001','fabo002') RETURNING l_success
            IF l_success = FALSE THEN 
               CALL s_transaction_end('N','0')                                            #171006-00010#13   add
               CALL cl_err_collect_show()
               #CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822     #171006-00010#13   mask
               RETURN 
            END IF
            #20150608--add--end--lujh
            
            CALL s_afat503_void_chk_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
            IF l_success = TRUE THEN
               #151125-00001#1 add start ------------------
               IF NOT cl_ask_confirm('aim-00109') THEN
                  CALL s_transaction_end('N','0')     #160812-00017#7 Add By Ken 160822
                  RETURN
               ELSE
               #151125-00001#1 add end   ------------------
                  CALL s_afat503_void_upd_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success 
               END IF   #151125-00001#1 add   
            END IF
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
#      ON ACTION undeduct
#         LET lc_state = "Y"
#         CALL s_afat503_unpost_chk_fabg(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
#         IF l_success = TRUE THEN
#            CALL s_afat503_unpost_upd_fabo(g_fabg_m.fabgld,g_fabg_m.fabgdocno) RETURNING l_success
#         END IF 
#         
#         EXIT MENU
      #end add-point
      
   END MENU
   LET INT_FLAG=FALSE  #(ver.18)
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "A" 
      AND lc_state <> "D"
      AND lc_state <> "N"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "Y"
      AND lc_state <> "Z"
      AND lc_state <> "S"
      AND lc_state <> "X"
      ) OR 
      g_fabg_m.fabgstus = lc_state OR cl_null(lc_state) THEN
      CLOSE afat504_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #20150104 add by chenying
   IF l_success = TRUE THEN   
      IF g_glaa.glaa121 = 'Y' THEN 
         LET l_wc = "glgadocno = '",g_fabg_m.fabgdocno,"'"
         CALL s_pre_voucher_upd('FA','F40',g_fabg_m.fabgld,lc_state,'','',l_wc) RETURNING l_success
      END IF
   END IF   
   #20150104 add by chenying    
   IF l_success = FALSE  THEN
      CALL s_transaction_end('N','0')         #171006-00010#13   add
      CALL cl_err_collect_show() 
      #CALL s_transaction_end('N','0')        #171006-00010#13   mask 
      RETURN    
   ELSE
#      CALL cl_err_collect_init()              #180326-00032#1 mark
      CALL s_transaction_end('Y','0')         #171006-00010#13   add
      CALL cl_err_collect_show()    
      #CALL s_transaction_end('Y','0')        #171006-00010#13   mask    
   END IF
   
   #end add-point
   
   LET g_fabg_m.fabgmodid = g_user
   LET g_fabg_m.fabgmoddt = cl_get_current()
   LET g_fabg_m.fabgstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE fabg_t 
      SET (fabgstus,fabgmodid,fabgmoddt) 
        = (g_fabg_m.fabgstus,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt)     
    WHERE fabgent = g_enterprise AND fabgld = g_fabg_m.fabgld
      AND fabgdocno = g_fabg_m.fabgdocno
    
   IF SQLCA.SQLCODE THEN
      #171011-00030 ---start---
      CLOSE afat504_cl
      CALL s_transaction_end('N','0')
      #171011-00030 --- end ---
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      #170801-00033 ---start---
   #  CLOSE afat504_cl   #171011-00030 mark
   #  CALL s_transaction_end('N','0')   #171011-00030 mark
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
      #180130-00006 ---start---
      #修改歷程記錄(狀態碼修改)
      LET g_log1 = util.JSON.stringify(g_fabg_m_t)
      LET g_log2 = util.JSON.stringify(g_fabg_m)
      IF NOT cl_log_modified_record(g_log1,g_log2) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #180130-00006 --- end ---
    
      #撈取異動後的資料
      EXECUTE afat504_master_referesh USING g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO g_fabg_m.fabgsite,g_fabg_m.fabg001,g_fabg_m.fabgld,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg003,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt,g_fabg_m.fabg006,g_fabg_m.fabg007,g_fabg_m.fabg021, 
          g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgowndp,g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfdt, 
          g_fabg_m.fabgpstid,g_fabg_m.fabgpstdt,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001_desc,g_fabg_m.fabgld_desc,g_fabg_m.fabg002_desc,g_fabg_m.fabg003_desc,g_fabg_m.fabg006_desc,g_fabg_m.fabg007_desc,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp_desc,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgmodid_desc, 
          g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgpstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabgcomp,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabg005,g_fabg_m.fabgdocno,g_fabg_m.fabgdocdt, 
          g_fabg_m.fabg006,g_fabg_m.fabg006_desc,g_fabg_m.fabg007,g_fabg_m.fabg007_desc,g_fabg_m.fabg021,g_fabg_m.fabg013,g_fabg_m.fabg014,g_fabg_m.fabg015,g_fabg_m.fabg016,g_fabg_m.fabg008,g_fabg_m.fabg011,g_fabg_m.fabgstus,g_fabg_m.fabgownid,g_fabg_m.fabgownid_desc,g_fabg_m.fabgowndp,g_fabg_m.fabgowndp_desc, 
          g_fabg_m.fabgcrtid,g_fabg_m.fabgcrtid_desc,g_fabg_m.fabgcrtdp,g_fabg_m.fabgcrtdp_desc,g_fabg_m.fabgcrtdt,g_fabg_m.fabgmodid,g_fabg_m.fabgmodid_desc,g_fabg_m.fabgmoddt,g_fabg_m.fabgcnfid,g_fabg_m.fabgcnfid_desc,g_fabg_m.fabgcnfdt,g_fabg_m.fabgpstid,g_fabg_m.fabgpstid_desc,g_fabg_m.fabgpstdt 
 
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   #171201-00004#1--add--s--xul
   #一次性交易对象
   IF NOT cl_null(g_fabg_m.fabg021) THEN              
      CALL s_axrt300_xrca_ref('xrca057',g_fabg_m.fabg006,g_fabg_m.fabg021,'') RETURNING l_success,g_fabg_m.fabg006_desc 
      IF g_fabg_m.fabg006 = g_fabg_m.fabg007 THEN
         LET g_fabg_m.fabg007_desc = g_fabg_m.fabg006_desc
         DISPLAY BY NAME g_fabg_m.fabg007_desc
      END IF
      DISPLAY BY NAME g_fabg_m.fabg006_desc
   END IF
   #171201-00004#1--add--e--xul
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   #150916--s
   IF g_fabg_m.fabgstus='Y' OR g_fabg_m.fabgstus = 'S' THEN 
      IF cl_null(g_fabg_m.fabg011) THEN 
         CALL cl_set_act_visible("open_afap270",TRUE) 
      ELSE
         CALL cl_set_act_visible("open_afap270",FALSE) 
      END IF
   END IF  
   #150916--e
   #151125-00006#2-add-s
   IF g_fabg_m.fabgstus = 'S' THEN 
      CALL s_aooi200_fin_get_slip(g_fabg_m.fabgdocno) RETURNING l_success,l_ooba002
      CALL s_fin_orga_get_comp_ld(g_fabg_m.fabgsite) RETURNING g_sub_success,g_errno,l_fabgcomp,l_ld
      CALL s_fin_get_doc_para(g_fabg_m.fabgld,l_fabgcomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
      IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN 
         IF cl_ask_confirm('axr-00888') THEN              
            CALL s_afat503_fabg_immediately_gen(g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m.fabgstus,g_fabg_m.fabg005,g_fabg_m.fabg008)
            CALL afat504_ui_headershow()
         END IF 
      END IF 
   END IF
   #151125-00006#2-add-e
   #end add-point  
 
   CLOSE afat504_cl
   CALL s_transaction_end('Y','0')
   
   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"
   
   #end add-point  
   #(ver:20) --- end --- 
 
   #功能已完成,通報訊息中心
   CALL afat504_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="afat504.idx_chk" type="s" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION afat504_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_fabo_d.getLength() THEN
         LET g_detail_idx = g_fabo_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_fabo_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_fabo_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_fabo3_d.getLength() THEN
         LET g_detail_idx = g_fabo3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_fabo3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_fabo3_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_fabo4_d.getLength() THEN
         LET g_detail_idx = g_fabo4_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_fabo4_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_fabo4_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.b_fill2" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION afat504_b_fill2(pi_idx)
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
   
   CALL afat504_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.fill_chk" type="s" >}
#+ 單身填充確認
PRIVATE FUNCTION afat504_fill_chk(ps_idx)
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
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="afat504.status_show" type="s" >}
PRIVATE FUNCTION afat504_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="afat504.mask_functions" type="s" >}
&include "erp/afa/afat504_mask.4gl"
 
{</section>}
 
{<section id="afat504.signature" type="s" >}
   #應用 a39 樣板自動產生(Version:12)
#+ BPM提交
PRIVATE FUNCTION afat504_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
 
 
   CALL afat504_show()
   CALL afat504_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   IF NOT s_afat503_conf_chk_fabo(g_fabg_m.fabgld,g_fabg_m.fabgdocno) THEN
      #180614-00039#9-S
      #RETURN  
      CALL cl_err_collect_show()
      RETURN FALSE 
      #180614-00039#9-S
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_fabg_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_fabo_d))
   CALL cl_bpm_set_detail_data("s_detail3", util.JSONArray.fromFGL(g_fabo3_d))
   CALL cl_bpm_set_detail_data("s_detail4", util.JSONArray.fromFGL(g_fabo4_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   #180614-00039#9-S
   CALL cl_bpm_set_detail_data("s_detail1_afat504_01", util.JSONArray.fromFGL(g_fabo_d2))  
   CALL cl_err_collect_show()
   #180614-00039#9-E
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL afat504_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL afat504_ui_headershow()
   CALL afat504_ui_detailshow()
 
 
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:10)
#+ BPM抽單
PRIVATE FUNCTION afat504_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   CALL cl_err_collect_show()  #181219-00017#1 add
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL afat504_ui_headershow()  
   CALL afat504_ui_detailshow()
 
 
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="afat504.set_pk_array" type="s" >}
   #應用 a51 樣板自動產生(Version:10)
#+ 給予pk_array內容
PRIVATE FUNCTION afat504_set_pk_array()
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
   IF cl_null(g_fabg_m.fabgld) THEN
      RETURN
   END IF
   #210120-00006 --- modify end ---
   #181105-00036 --- modify end ---
   
   LET g_pk_array[1].values = g_fabg_m.fabgld
   LET g_pk_array[1].column = 'fabgld'
   LET g_pk_array[2].values = g_fabg_m.fabgdocno
   LET g_pk_array[2].column = 'fabgdocno'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="afat504.other_dialog" readonly="Y" type="s" >}
   
 
{</section>}
 
{<section id="afat504.msgcentre_notify" type="s" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION afat504_msgcentre_notify(lc_state)
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
   CALL afat504_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_fabg_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="afat504.action_chk" type="s" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION afat504_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#10  2016/08/25 By 07900 --add--s--
    SELECT fabgstus  INTO g_fabg_m.fabgstus
     FROM fabg_t
    WHERE fabgent = g_enterprise
      AND fabgdocno = g_fabg_m.fabgdocno
      AND fabgld  = g_fabg_m.fabgld

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
      LET g_errno = NULL
      CASE g_fabg_m.fabgstus
        WHEN 'Z'
           LET g_errno = 'sub-01351'
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
        LET g_errparam.extend = g_fabg_m.fabgdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL afat504_set_act_visible()
        CALL afat504_set_act_no_visible()
        CALL afat504_show()
        RETURN FALSE
     END IF
   END IF
   
   #160818-00017#10  2016/08/25 By 07900 --add--e--
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="afat504.other_function" readonly="Y" type="s" >}
#此段落由子樣板a06產生
#次要單頭table相關處理
PRIVATE FUNCTION afat504_xrcd_t(ps_type)
 
 
   DEFINE li_cnt    LIKE type_t.num10
   DEFINE ps_type   STRING  
   DEFINE ls_sql    STRING  
 
   IF ps_type = "s" THEN 
            LET ls_sql = 'SELECT  FROM xrcd_t WHERE xrcdent= ? AND xrcdld=? AND xrcddocno=? AND xrcdseq=? AND xrcdseq2=? AND xrcd007=? ' 
      DECLARE xrcd_t_cl CURSOR FROM ls_sql 
      OPEN xrcd_t_cl USING g_enterprise,g_site,g_fabg_m.fabgld,g_fabg_m.fabgdocno
#      FETCH xrcd_t_cl INTO g_fabg_m. 

      IF SQLCA.sqlcode THEN
#                  LET g_fabg_m.  = NULL 

      END IF 
      RETURN 
   END IF 
 
      SELECT COUNT(1) INTO li_cnt FROM xrcd_t WHERE xrcdent = g_enterprise AND xrcdsite = g_site AND xrcdld = g_fabgld_t AND xrcddocno = g_fabgdocno_t AND xrcdseq = g__t AND xrcdseq2 = g__t AND xrcd007 = g__t  #160905-00007#2 count(*) --> count(1)
   
   IF li_cnt = 0 AND ps_type = "u" THEN 
#            INSERT INTO xrcd_t 
#      (xrcdent,xrcdsite,xrcdld,xrcddocno,xrcdseq,xrcdseq2,xrcd007, )
#      VALUES (g_enterprise,g_site,g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m. )
   END IF 
 
   IF li_cnt > 0 AND ps_type = "u" THEN 
#            UPDATE xrcd_t SET 
#      (xrcdld,xrcddocno,xrcdseq,xrcdseq2,xrcd007, ) = 
#      (g_fabg_m.fabgld,g_fabg_m.fabgdocno,g_fabg_m. ) 
#      WHERE xrcdent = g_enterprise AND xrcdsite = g_site AND xrcdld = g_fabgld_t AND xrcddocno = g_fabgdocno_t AND xrcdseq = g__t AND xrcdseq2 = g__t AND xrcd007 = g__t

   END IF 
 
   IF li_cnt > 0 AND ps_type = "d" THEN 
            DELETE FROM xrcd_t
      WHERE xrcdent = g_enterprise AND xrcdsite = g_site AND xrcdld = g_fabgld_t AND xrcddocno = g_fabgdocno_t AND xrcdseq = g__t AND xrcdseq2 = g__t AND xrcd007 = g__t
   END IF 
 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "afat504" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()

   END IF 
 
END FUNCTION

################################################################################
# Descriptions...: 新增設置默認值
# Memo...........:
# Usage..........: CALL afat504_set_default()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_set_default()
   DEFINE l_sql          STRING
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_success      LIKE type_t.chr1
   DEFINE l_para_data    LIKE ooab_t.ooab002
 
#20141106 --mark--str-- 
#   LET l_sql = " SELECT DISTINCT faab002 FROM faab_t ",
#               "  WHERE faab004 IN(SELECT ooag004 FROM ooag_t WHERE ooag001 = '",g_user,"' AND ooagstus = 'Y')",
#               "    AND faab007 ='Y'",
#               "    AND faabstus ='Y'",
#               "    AND faab001 = '4'",
#               "  ORDER BY faab002"
#   PREPARE afat504_def_prep FROM l_sql
#   DECLARE afat504_def_curs CURSOR FOR afat504_def_prep
#   
#   LET g_fabg_m.fabg001 = g_user         #帳務人員
#   
#   #抓取員工所屬營運據點對應的所有帳務中心
#   FOREACH afat504_def_curs INTO g_fabg_m.fabgsite    
#      #根據人員抓取對應法人的主帳套
#      SELECT DISTINCT glaald INTO g_fabg_m.fabgld
#        FROM glaa_t,ooef_t,ooag_t
#       WHERE ooag004 = ooef001
#         AND ooagent = ooefent
#         AND glaacomp = ooef017
#         AND ooefent = glaaent
#         AND glaa014 = 'Y'
#         AND ooag001 = g_user
#         AND glaaent = g_enterprise
#
#      IF cl_null(g_fabg_m.fabgld) THEN 
#         LET g_fabg_m.fabgld = NULL
#         CONTINUE FOREACH 
#      END IF
#   
#      #根據帳套檢查該員工是否有使用權限
#	   CALL s_ld_chk_authorization(g_fabg_m.fabg001,g_fabg_m.fabgld) RETURNING l_success
#	   IF l_success = 'N' THEN
#	      LET g_fabg_m.fabgsite = NULL
#	      LET g_fabg_m.fabgld   = NULL
#	      CONTINUE FOREACH
#	   ELSE
#	      EXIT FOREACH
#      END IF
#
#      SELECT COUNT(*) INTO l_cnt FROM glaa_t,ooef_t,faab_t 
#      WHERE glaald   = fabgld
#        AND glaacomp = ooef017 
#        AND glaaent  = ooefent 
#        AND ooef001  = faab004 
#        AND ooefent  = faabent 
#        AND faab002  = fabgsite
#        AND faab001  = 1
#	  IF l_cnt < 1 THEN
#	     LET g_fabg_m.fabgsite = NULL
#	     LET g_fabg_m.fabgld   = NULL
#	     CONTINUE FOREACH
#	  ELSE
#	     EXIT FOREACH
#      END IF
#
#   END FOREACH
#20141106 --mark--end--

#20141106 --add--str--
   CALL s_afat503_default(g_bookno) RETURNING l_success,g_fabg_m.fabgsite,g_fabg_m.fabgld,g_fabg_m.fabgcomp
#20141106 --add--end--
   #161215-00044#1---modify----begin-----------------
   #SELECT * INTO g_glaa.* 
   SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
          glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
          glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
          glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
          glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
          glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161215-00044#1---modify----end----------------- 
   FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
   IF cl_null(g_fabg_m.fabgsite) THEN
      LET g_fabg_m.fabg001 = NULL
   ELSE
      IF NOT s_afat502_site_user_chk(g_fabg_m.fabgsite,g_fabg_m.fabg001) THEN 
         LET g_fabg_m.fabg001 = NULL
      END IF 
   END IF
   LET g_fabg_m.fabg001 = g_user #20141106 
   #170606-00033#17 add-s
   #检核该人员是否属于账套对应法人下 
   CALL s_afa_ooag001_def_chk(g_site,g_fabg_m.fabg001,'',1) RETURNING g_errno 
   IF NOT cl_null(g_errno) THEN
      LET g_fabg_m.fabg001 = NULL
   END IF 
   #170606-00033#17 add-e
   IF NOT cl_null(g_fabg_m.fabgsite) AND NOT cl_null(g_fabg_m.fabgld) THEN
      CALL afat504_fabgsite_desc(g_fabg_m.fabgsite) RETURNING g_fabg_m.fabgsite_desc
      CALL afat504_fabgld_desc(g_fabg_m.fabgld) RETURNING g_fabg_m.fabgld_desc
   END IF
#20141106    
#   #法人
#   LET g_fabg_m.fabgcomp=g_glaa.glaacomp
#20141106
   #人員名稱
   CALL afat504_fabg001_desc(g_fabg_m.fabg001) RETURNING g_fabg_m.fabg001_desc
   
   #申請人員、部門
   LET g_fabg_m.fabg002=g_user
#   LET g_fabg_m.fabg003=g_dept     #mark by yangxf
   #add by yangxf ----
   SELECT ooag003 INTO g_fabg_m.fabg003
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_fabg_m.fabg002
   CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc 
   #add by yangxf ---
   CALL afat504_fabg001_desc(g_fabg_m.fabg002) RETURNING g_fabg_m.fabg002_desc 
   CALL afat504_fabgsite_desc(g_fabg_m.fabg003) RETURNING g_fabg_m.fabg003_desc 
   
   #161215-00044#1---modify----begin-----------------
   #SELECT * INTO g_glaa.* 
   SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
          glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
          glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
          glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
          glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
          glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161215-00044#1---modify----end-----------------
   FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9003') RETURNING l_para_data
   IF g_today>=l_para_data THEN
      #单据日期
      LET g_fabg_m.fabgdocdt=g_today
      #申請時間
      LET g_fabg_m.fabg004=g_today
   END IF
   #幣別、匯率
   LET g_fabg_m.fabg015=g_glaa.glaa001
   LET g_fabg_m.fabg016=1
   CALL cl_set_comp_entry('fabg016',FALSE)   #170112-00040#1 add by 08172
   #170420-00007#1-----s
   CALL s_fin_get_wc_str(g_glaa.glaacomp) RETURNING g_sqlcomp
   #取帳套法人控制組
   
   CALL s_control_get_supplier_sql_pmab('2',g_site,g_user,g_dept,'',g_sqlcomp) RETURNING g_sub_success,g_sql_ctrl1
   #170420-00007#1-----e
   DISPLAY BY NAME g_fabg_m.fabgsite,g_fabg_m.fabgsite_desc,g_fabg_m.fabg001,g_fabg_m.fabg001_desc,
                   g_fabg_m.fabgld,g_fabg_m.fabgld_desc,g_fabg_m.fabg002,g_fabg_m.fabg002_desc,
                   g_fabg_m.fabg003,g_fabg_m.fabg003_desc,g_fabg_m.fabg004,g_fabg_m.fabgdocdt
END FUNCTION

################################################################################
# Descriptions...: 組織說明
# Memo...........:
# Usage..........: CALL afat504_fabgsite_desc(p_ooef001)
#                  RETURNING r_desc
# Input parameter: p_ooef001      組織編號
# Return code....: r_desc         說明
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabgsite_desc(p_ooef001)
   DEFINE p_ooef001         LIKE ooef_t.ooef001
   DEFINE r_desc           LIKE ooefl_t.ooefl003
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_ooef001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 資產中心檢查
# Memo...........:
# Usage..........: CALL afat504_fabgsite_chk(p_fabgsite)
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabgsite_chk(p_site)
DEFINE p_site    LIKE fabg_t.fabgsite
DEFINE l_n       LIKE type_t.num5
DEFINE l_ooef003 LIKE ooef_t.ooef003

    #检查是否存在ooef 组织档
    SELECT COUNT(1) INTO l_n FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = p_site  #160905-00007#2 count(*) --> count(1)
    IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aoo-00094'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
    END IF
    #检查是否有效
    SELECT COUNT(1) INTO l_n FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = p_site AND ooefstus = 'Y' #160905-00007#2 count(*) --> count(1)
    IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00105'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
    END IF
    #检查是否是资产中心
    SELECT COUNT(1) INTO l_n FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = p_site AND ooefstus = 'Y' AND ooef207 = 'Y'  #160905-00007#2 count(*) --> count(1)
    IF l_n = 0 THEN
       SELECT ooef003 INTO l_ooef003 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = p_site
       IF l_ooef003 = 'N' THEN #法人可作为资产中心
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'afa-00004'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN FALSE
       END IF
    END IF
    
    #检查资产中心的合理性ooed
    SELECT COUNT(1) INTO l_n FROM ooed_t WHERE ooedent = g_enterprise AND ooed004 = g_fabg_m.fabgsite  #160905-00007#2 count(*) --> count(1)
    IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'amm-00201'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
    END IF
    #检查是否资产中心类型
    SELECT COUNT(1) INTO l_n FROM ooed_t WHERE ooedent = g_enterprise AND ooed004 = g_fabg_m.fabgsite AND ooed001 = '5'  #160905-00007#2 count(*) --> count(1)
    IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00290' 
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
    END IF
     
    #检查ooed是否过期
    SELECT COUNT(1) INTO l_n FROM ooed_t WHERE ooedent = g_enterprise    #160905-00007#2 count(*) --> count(1)
       #AND ooed004 = g_fabg_m.fabgsite AND ooed001 = '5' AND ((ooed006 <= g_today AND ooed007 >= g_today) OR ooed007 IS NULL)   #170308-00010#2  by 09042  mark
       AND ooed004 = g_fabg_m.fabgsite AND ooed001 = '5' AND ((ooed006 <= g_today AND ooed007 > g_today) OR ooed007 IS NULL)     #170308-00010#2  by 09042  add 
    IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'amm-00202' 
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
    END IF
    RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 帳套說明
# Memo...........:
# Usage..........: CALL afat504_fabgld_desc(p_fabgld)
#                  RETURNING r_desc
# Input parameter: p_fabgld       帳套編號
# Return code....: r_desc         說明
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabgld_desc(p_fabgld)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE r_desc              LIKE glaal_t.glaal002
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_fabgld
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 員工姓名
# Memo...........:
# Usage..........: CALL afat504_fabg001_desc(p_fabg001)
#                  RETURNING r_desc
# Input parameter: p_fabg001      員工編號
# Return code....: r_desc         姓名
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabg001_desc(p_fabg001)
   DEFINE p_fabg001        LIKE fabg_t.fabg001
#   DEFINE r_desc           LIKE oofa_t.oofa011        #170411-00031#31  2017/04/19 BY 09232 mark
   DEFINE r_desc           LIKE ooag_t.ooag011        #170411-00031#31  2017/04/19 BY 09232 add
   
   LET r_desc=""
   SELECT ooag011 INTO r_desc FROM ooag_t 
   WHERE ooagent=g_enterprise AND ooag001=p_fabg001
   
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 資產中心、帳務人員、帳套之間的關聯檢查
# Memo...........:
# Usage..........: CALL afat504_site_ld_chk(p_site,p_user,p_ld)
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_site_ld_chk(p_site,p_user,p_ld)
   DEFINE p_site         LIKE fabg_t.fabgsite
   DEFINE p_user      LIKE fabg_t.fabg001
   DEFINE p_ld           LIKE fabg_t.fabgld
   #DEFINE l_ooeastus     LIKE ooea_t.ooeastus       #170425-00037#7 mark by wnaghaoz 2017/09/26
   DEFINE l_faabstus     LIKE faab_t.faabstus
   DEFINE l_faab007      LIKE faab_t.faab007
   DEFINE l_ooagstus     LIKE ooag_t.ooagstus
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5
   
   LET g_errno = ' '
   
   #帳套下屬於法人否檢查 
   SELECT COUNT(1) INTO l_cnt FROM glaa_t,ooef_t,faab_t    #160905-00007#2 count(*) --> count(1)
    WHERE glaald   = p_ld
      AND glaacomp = ooef017 
      AND glaaent  = ooefent 
      AND ooef001  = faab004 
      AND ooefent  = faabent 
      AND faab002  = p_site
      AND faab001  = '4'
      AND glaaent = g_enterprise
      
   IF l_cnt < 1 OR cl_null(l_cnt) THEN
      LET g_errno = 'axr-00089' RETURN
   END IF
      
   #人員對應帳套使用權限檢查
   IF NOT cl_null(p_ld) AND NOT cl_null(p_user) THEN
      CALL s_ld_chk_authorization(p_user,p_ld) RETURNING l_success
      IF l_success = FALSE THEN
         LET g_errno = 'axr-00022' 
         RETURN
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 原因碼說明
# Memo...........:
# Usage..........: CALL afat504_fabo023_desc(p_fabo023)
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabo023_desc(p_fabo023)
   DEFINE p_fabo023     LIKE fabo_t.fabo023
   DEFINE r_desc        LIKE oocql_t.oocql004
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_fabo023
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='3902' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 財產編號檢查
# Memo...........:
# Usage..........: CALL afat504_fabo001_chk()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabo001_chk()
   DEFINE l_cnt       LIKE type_t.num5
   DEFINE l_faah015   LIKE faah_t.faah015
   DEFINE l_fabo003   LIKE fabo_t.fabo003
   DEFINE l_fabo001   LIKE fabo_t.fabo001
   DEFINE l_fabo002   LIKE fabo_t.fabo002
   DEFINE l_flag      LIKE type_t.num5
   DEFINE l_sql       STRING
   
   LET g_errno=""
   IF NOT cl_null(g_fabo_d[l_ac].fabo001) AND NOT cl_null(g_fabo_d[l_ac].fabo002) 
      AND NOT cl_null(g_fabo_d[l_ac].fabo003) THEN 
      #卡片+财编+附號需存在於faah_t固定資產基礎資料檔中   
      SELECT faah015 INTO l_faah015 FROM faah_t
       WHERE faahent = g_enterprise
         AND faah003 = g_fabo_d[l_ac].fabo001
         AND faah004 = g_fabo_d[l_ac].fabo002 
         AND faah001 = g_fabo_d[l_ac].fabo003
         
      IF SQLCA.SQLCODE = 100 THEN 
         LET g_errno= 'afa-00076'
      END IF 
      #財產狀態不可為0：取得、5：出售、6：銷賬、10：被資本化
      IF l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10' OR l_faah015 = '8' THEN
         LET g_errno='afa-00135'
      END IF
      #卡片+财编+附號需存在於faaj_t固定資產帳套折舊明細資料檔中   
      LET l_cnt = 0 
      SELECT COUNT(1) INTO l_cnt FROM faaj_t  #160905-00007#2 count(*) --> count(1)
       WHERE faajent = g_enterprise
         AND faajld  = g_fabg_m.fabgld 
         AND faaj001 = g_fabo_d[l_ac].fabo001
         AND faaj002 = g_fabo_d[l_ac].fabo002 
         AND faaj037 = g_fabo_d[l_ac].fabo003
      IF l_cnt = 0 THEN 
         LET g_errno= 'afa-00134'
      END IF
      
      #當前重估單，卡片+財產編號+附號不可重複
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt FROM fabo_t   #160905-00007#2 count(*) --> count(1)
       WHERE faboent = g_enterprise
         AND fabodocno = g_fabg_m.fabgdocno
         AND fabo001 = g_fabo_d[l_ac].fabo001 
         AND fabo002 = g_fabo_d[l_ac].fabo002
         AND fabo003 = g_fabo_d[l_ac].fabo003
         AND faboseq <> g_fabo_d[l_ac].faboseq
      IF l_cnt>0 THEN
         LET g_errno= 'afa-00078'
      END IF 
   END IF  
   
   #若不是開窗，直接輸入欄位時，需默認帶出相應的卡片+附號
   #當前重估單中未使用的資料                  
   IF cl_null(g_fabo_d[l_ac].fabo003) AND cl_null(g_fabo_d[l_ac].fabo002) 
      AND NOT cl_null(g_fabo_d[l_ac].fabo001) THEN 
      LET l_sql = " SELECT faah001,faah003,faah004 FROM faah_t,faaj_t ",
                  "  WHERE faahent = faajent AND faah000 = faaj000 ",
                  "    AND faah001 = faaj037 AND faah003 = faaj001 ",
                  "    AND faah004 = faaj002 AND faajld='",g_fabg_m.fabgld,"' ",
                  "    AND faahent = '",g_enterprise,"'",
                  "    AND faah003 = '",g_fabo_d[l_ac].fabo001,"'", 
                  "    AND faah015 NOT IN ('0','5','6','8','10') ",
                  "  ORDER BY faah001,faah003,faah004 "
      PREPARE afat504_pb4 FROM l_sql
      DECLARE afat504_cs4 CURSOR FOR afat504_pb4
      LET l_flag=FALSE #記錄是否抓取到合適資料  
      
      FOREACH afat504_cs4 INTO l_fabo003,l_fabo001,l_fabo002 
         IF SQLCA.sqlcode THEN
            LET g_errno=SQLCA.sqlcode
            EXIT FOREACH
         END IF             
         LET l_cnt = 0
         SELECT COUNT(1) INTO l_cnt FROM fabo_t   #160905-00007#2 count(*) --> count(1)
          WHERE faboent = g_enterprise
            AND fabold  = g_fabg_m.fabgld
            AND fabodocno = g_fabg_m.fabgdocno
            AND fabo001 = l_fabo001 
            AND fabo002 = l_fabo002
            AND fabo003 = l_fabo003
            AND faboseq <>g_fabo_d[l_ac].faboseq
         IF l_cnt>0 THEN 
            CONTINUE FOREACH
         ELSE 
            LET l_flag=TRUE
            LET g_fabo_d[l_ac].fabo003 = l_fabo003
            LET g_fabo_d[l_ac].fabo002 = l_fabo002
            EXIT FOREACH
         END IF 
      END FOREACH  
      IF l_flag=FALSE THEN  #排除輸入的不符合條件的資料
         LET g_errno = 'afa-00079'
      END IF    
   END IF  
END FUNCTION

################################################################################
# Descriptions...: 根据卡片+財產編號+附號自動帶出成本等相关资料
# Memo...........:
# Usage..........: CALL afat504_get_faah()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_get_faah()
   DEFINE l_faaj033    LIKE faaj_t.faaj033
   DEFINE l_faah018    LIKE faah_t.faah018
   DEFINE l_faaj006        LIKE faaj_t.faaj006   #181015-00013#3 remark
   DEFINE l_faaj007        LIKE faaj_t.faaj007   #181015-00013#3 remark
   DEFINE l_faah026        LIKE faah_t.faah026   #180525-00007#1 add 
   
   SELECT faah017,faah015,faah012,faah013,faah014  #160426-00014#23 add faah013
          ,faah026                                  #180525-00007#1 add faah026
     INTO g_fabo_d[l_ac].fabo005,g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].faah012,g_fabo_d[l_ac].faah013,g_fabo_d[l_ac].faah014  #160426-00014#23 add g_fabo_d[l_ac].faah013   #180531-00059#1 add g_fabo_d[l_ac].faah014  
          ,l_faah026                                #180525-00007#1 add l_faah026
     FROM faah_t
    WHERE faahent=g_enterprise AND faah001=g_fabo_d[l_ac].fabo003
      AND faah003=g_fabo_d[l_ac].fabo001 AND faah004=g_fabo_d[l_ac].fabo002
      
   SELECT faaj016,faaj021,faaj103,faaj153,faaj006,faaj007        #181015-00013#3 add faaj006,faaj007
     INTO g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,
          g_fabo4_d[l_ac].faaj103,g_fabo4_d[l_ac].faaj153
         ,l_faaj006,l_faaj007                                    #181015-00013#3 remark
     FROM faaj_t
    WHERE faajent=g_enterprise AND faajld=g_fabg_m.fabgld
      AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002
      AND faaj037=g_fabo_d[l_ac].fabo003
   
  #IF cl_null(l_faaj033) THEN LET l_faaj033=0 END IF   #已出售數量
  #IF cl_null(l_faah018) THEN LET l_faah018=0 END IF   #總數量
  #
  ##數量=總數量 - 已出售數量
  #LET g_faah018 =l_faah018-l_faaj033
   CALL afat504_get_faah018()
   
   #出售數量=數量
   LET g_fabo_d[l_ac].fabo007=g_faah018
   
   CALL afat504_get_amt(g_faah018,g_fabo_d[l_ac].fabo007)
   #181015-00013#3   remark-S
   IF l_faaj006 = '1' THEN
      LET g_fabo_d[l_ac].fabo032 = l_faaj007
   ELSE
      #LET g_fabo_d[l_ac].fabo032 = g_fabg_m.fabg003   #181015-00013#3 mod l_faah026->g_fabg_m.fabg003 #180525-00007#1 mark
      LET g_fabo_d[l_ac].fabo032 =  l_faah026 #180525-00007#1 add 
   END IF
   #181015-00013#3   remark-E
   DISPLAY BY NAME g_fabo_d[l_ac].fabo000,g_fabo_d[l_ac].fabo005,g_fabo_d[l_ac].fabo006,g_fabo_d[l_ac].fabo007,
                   g_fabo_d[l_ac].fabo008,g_fabo_d[l_ac].fabo053,
                   g_fabo4_d[l_ac].faaj103,g_fabo4_d[l_ac].faaj153,g_fabo_d[l_ac].faah012
                  ,g_fabo_d[l_ac].fabo032                            #180525-00007#1 add   #181015-00013#3 remark
END FUNCTION

################################################################################
# Descriptions...: 获取本位币二三幣別和汇率
# Memo...........:
# Usage..........: CALL afat504_get_rate()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_get_rate()
   DEFINE l_curr       LIKE glaa_t.glaa001 #來源幣別
   
   #200116-00002#7 --s add
   DEFINE l_rate       LIKE fabo_t.fabo011
   DEFINE lc_param1    RECORD
          type         LIKE type_t.chr1,       #類型
          apca004      LIKE apca_t.apca004,
          sfin3009     LIKE type_t.chr1        #汇率基本    
                       END RECORD
   DEFINE ls_js1       STRING 
   #200116-00002#7 --e add
   
   #200116-00002#16 --s add
   IF g_glaa.glaa015 = 'Y' OR g_glaa.glaa019 = 'Y' THEN
      IF g_glaa.glaa017='1' OR g_glaa.glaa021='1' THEN #依交易原幣轉換
         LET l_curr=g_fabo_d[l_ac].fabo010
      ELSE
         LET l_curr=g_glaa.glaa001
      END IF
      LET lc_param1.apca004 = g_fabg_m.fabg006
      LET ls_js1 = util.JSON.stringify(lc_param1)
      CALL s_fin_get_curr_rate(g_glaa.glaacomp,g_glaa.glaald,g_fabg_m.fabgdocdt,l_curr,ls_js1)
          RETURNING  l_rate,g_fabo4_d[l_ac].fabo102,g_fabo4_d[l_ac].fabo151
   END IF
   #200116-00002#16 --e add
   
   IF g_glaa.glaa015 = 'Y' THEN 
      #帳套本位幣二幣別 
      LET g_fabo4_d[l_ac].fabo101 = g_glaa.glaa016  
      #200116-00002#16 --s mark      
#      IF g_glaa.glaa017='1' THEN #依交易原幣轉換
#         LET l_curr=g_fabo_d[l_ac].fabo010
#      ELSE
#         LET l_curr=g_glaa.glaa001
#      END IF
#      #主帳套本位幣二匯率
#      #200116-00002#7 --s mark
#                               #匯率參照表;帳套;           日期;      來源幣別
##      CALL s_aooi160_get_exrate('2',g_glaa.glaald,g_fabg_m.fabgdocdt,l_curr,
##                                #目的幣別;          交易金額; 匯類類型
##                                g_glaa.glaa016 ,0,g_glaa.glaa018)
##      RETURNING g_fabo4_d[l_ac].fabo102 
#      #200116-00002#7 --e mark
#      #200116-00002#7 --s add
#      LET lc_param1.apca004 = g_fabg_m.fabg006
#      LET ls_js1 = util.JSON.stringify(lc_param1)
#      CALL s_fin_get_curr_rate(g_glaa.glaacomp,g_glaa.glaald,g_fabg_m.fabgdocdt,l_curr,ls_js1)
#          RETURNING  l_rate1,g_fabo4_d[l_ac].fabo102,l_rate3
#      #200116-00002#7 --e add
      #200116-00002#16 --e mark
   END IF
   IF g_glaa.glaa019 = 'Y' THEN 
      #帳套本位幣三幣別 
      LET g_fabo4_d[l_ac].fabo150 = g_glaa.glaa020       
      #200116-00002#16 --s mark
#      IF g_glaa.glaa021='1' THEN #依交易原幣轉換
#         LET l_curr=g_fabo_d[l_ac].fabo010
#      ELSE
#         LET l_curr=g_glaa.glaa001
#      END IF
#      #主帳套本位幣三匯率
#      #200116-00002#7 --s mark
#                               #匯率參照表;帳套;           日期;      來源幣別
##      CALL s_aooi160_get_exrate('2',g_glaa.glaald,g_fabg_m.fabgdocdt,l_curr,
##                                #目的幣別;          交易金額; 匯類類型
##                                g_glaa.glaa020 ,0,g_glaa.glaa022)
##      RETURNING g_fabo4_d[l_ac].fabo151 
#      #200116-00002#7 --e mark
#      #200116-00002#7 --s add
#      LET lc_param1.apca004 = g_fabg_m.fabg006
#      LET ls_js1 = util.JSON.stringify(lc_param1)
#      CALL s_fin_get_curr_rate(g_glaa.glaacomp,g_glaa.glaald,g_fabg_m.fabgdocdt,l_curr,ls_js1)
#          RETURNING  l_rate1,l_rate2,g_fabo4_d[l_ac].fabo151
#      #200116-00002#7 --e add
      #200116-00002#16 --e mark
   END IF
    
END FUNCTION

################################################################################
# Descriptions...: 設置其他本位幣頁簽的顯示
# Memo...........:
# Usage..........: CALL afat504_set_curr()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_set_curr()
   IF g_glaa.glaa015='Y' THEN
      CALL cl_set_comp_visible("fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo107",TRUE)   
   ELSE 
      CALL cl_set_comp_visible("fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo107",FALSE)  
   END IF
   IF g_glaa.glaa019='Y' THEN
      CALL cl_set_comp_visible("fabo152,fabo153,fabo154,fabo155,fabo150,fabo151,fabo156",TRUE)  #20141119 add fabo150/151    
   ELSE
      CALL cl_set_comp_visible("fabo152,fabo153,fabo154,fabo155,fabo150,fabo151,fabo156",FALSE) #20141119 add fabo150/151   
   END IF
   IF g_glaa.glaa015='Y' OR g_glaa.glaa019='Y' THEN
      CALL cl_set_comp_visible("page_4",TRUE)
   ELSE
      CALL cl_set_comp_visible("page_4",FALSE)
   END IF
END FUNCTION

################################################################################
# Descriptions...: 客戶簡稱
# Memo...........:
# Usage..........: CALL afat504_fabg006_desc(p_fabg006)
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabg006_desc(p_fabg006)
   DEFINE p_fabg006      LIKE fabg_t.fabg006
   DEFINE r_desc         LIKE pmaal_t.pmaal004
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_fabg006
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 收款客戶檢查
# Memo...........:
# Usage..........: CALL afat504_fabg007_chk()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_fabg007_chk()
   DEFINE l_pmacstus   LIKE pmac_t.pmacstus
   DEFINE l_pmac003    LIKE pmac_t.pmac003

   LET g_errno = ''
   SELECT pmacstus,pmac003 INTO l_pmacstus,l_pmac003
     FROM pmac_t 
    WHERE pmacent = g_enterprise
      AND pmac001 = g_fabg_m.fabg006
      AND pmac002 = g_fabg_m.fabg007 
   CASE
      WHEN SQLCA.SQLCODE =100  LET g_errno = 'axr-00048'
      WHEN l_pmacstus = 'N'    LET g_errno = 'sub-01302' #'axr-00049'#160318-00005#11 mod 
      WHEN l_pmac003 <> '1'    LET g_errno = 'axr-00050'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 更新單身稅別，并重新計算稅額
# Memo...........: #180111-00043#12
# Usage..........: CALL afat504_tax_upd()                
# Date & Author..: 日期 By 作者
# Modify.........: #160920-00025#1 mod xul
################################################################################
PRIVATE FUNCTION afat504_tax_upd()
#160920-00025#1--add--s--
DEFINE l_i          LIKE type_t.num10
DEFINE l_ooef016    LIKE ooef_t.ooef016
  FOR l_i=1 TO g_fabo_d.getLength()
     LET g_fabo_d[l_i].fabo009 = g_fabg_m.fabg013 #稅別
     IF NOT cl_null(g_fabo_d[l_i].fabo007) AND NOT cl_null(g_fabo_d[l_i].fabo014) THEN
        CALL s_tax_ins(g_fabg_m.fabgdocno,g_fabo_d[l_i].faboseq,0,g_fabg_m.fabgcomp,
                       g_fabo_d[l_i].fabo006*g_fabo_d[l_i].fabo007,g_fabo_d[l_i].fabo009,
                       g_fabo_d[l_i].fabo007,g_fabo_d[l_i].fabo010,g_fabo_d[l_i].fabo011,
                       g_fabg_m.fabgld,g_fabo4_d[l_i].fabo102,g_fabo4_d[l_i].fabo151)
          RETURNING g_fabo_d[l_i].fabo012,g_fabo_d[l_i].fabo013,g_fabo_d[l_i].fabo014,
                    g_fabo_d[l_i].fabo015,g_fabo_d[l_i].fabo016,g_fabo_d[l_i].fabo017,
                    g_fabo4_d[l_i].fabo103,g_fabo4_d[l_i].fabo104,g_fabo4_d[l_i].fabo105,
                    g_fabo4_d[l_i].fabo152,g_fabo4_d[l_i].fabo153,g_fabo4_d[l_i].fabo154  
        DISPLAY BY NAME g_fabo_d[l_i].fabo012,g_fabo_d[l_i].fabo013,g_fabo_d[l_i].fabo014,
                    g_fabo_d[l_i].fabo015,g_fabo_d[l_i].fabo016,g_fabo_d[l_i].fabo017,
                    g_fabo4_d[l_i].fabo103,g_fabo4_d[l_i].fabo104,g_fabo4_d[l_i].fabo105,
                    g_fabo4_d[l_i].fabo152,g_fabo4_d[l_i].fabo153,g_fabo4_d[l_i].fabo154 
      
        #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
        IF NOT cl_null( g_fabg_m.fabgld) THEN             
           SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld AND glaaent = g_enterprise   
        END IF
        LET g_fabo_d[l_i].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo012,2)
        LET g_fabo_d[l_i].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo013,2)
        LET g_fabo_d[l_i].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo014,2)
        LET g_fabo_d[l_i].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo015,2)
        LET g_fabo_d[l_i].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo016,2)
        LET g_fabo_d[l_i].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo017,2) 
        
        CALL afat504_get_faah018()   #201028-00078#1 add        
     END IF 
     
     #處置相關金額
     LET l_ac = l_i
     CALL afat504_get_amt(g_faah018,g_fabo_d[l_i].fabo007)
     LET g_fabo_d_t.fabo009 = g_fabo_d[l_i].fabo009  
     
     CALL s_transaction_begin()
     #將遮罩欄位還原
     CALL afat504_fabo_t_mask_restore('restore_mask_o')
      
     UPDATE fabo_t SET (fabold,fabodocno,faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053, 
         fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016, 
         fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo023,fabo025,fabo107,fabo101, 
         fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo156,fabo150, 
         fabo151,fabo152,fabo153,fabo154,fabo155,fabo157,fabo158,fabo159,fabo160) = (g_fabg_m.fabgld, 
         g_fabg_m.fabgdocno,g_fabo_d[l_i].faboseq,g_fabo_d[l_i].fabo001,g_fabo_d[l_i].fabo002, 
         g_fabo_d[l_i].fabo003,g_fabo_d[l_i].fabo000,g_fabo_d[l_i].fabo008,g_fabo_d[l_i].fabo053, 
         g_fabo_d[l_i].fabo009,g_fabo_d[l_i].fabo005,g_fabo_d[l_i].fabo007,g_fabo_d[l_i].fabo006, 
         g_fabo_d[l_i].fabo010,g_fabo_d[l_i].fabo011,g_fabo_d[l_i].fabo012,g_fabo_d[l_i].fabo013, 
         g_fabo_d[l_i].fabo014,g_fabo_d[l_i].fabo015,g_fabo_d[l_i].fabo016,g_fabo_d[l_i].fabo017, 
         g_fabo_d[l_i].fabo020,g_fabo_d[l_i].fabo018,g_fabo_d[l_i].fabo019,g_fabo_d[l_i].fabo021, 
         g_fabo_d[l_i].fabo022,g_fabo_d[l_i].fabo049,g_fabo_d[l_i].fabo023,g_fabo_d[l_i].fabo025, 
         g_fabo4_d[l_i].fabo107,g_fabo4_d[l_i].fabo101,g_fabo4_d[l_i].fabo102,g_fabo4_d[l_i].fabo103, 
         g_fabo4_d[l_i].fabo104,g_fabo4_d[l_i].fabo105,g_fabo4_d[l_i].fabo106,g_fabo4_d[l_i].fabo108, 
         g_fabo4_d[l_i].fabo109,g_fabo4_d[l_i].fabo110,g_fabo4_d[l_i].fabo111,g_fabo4_d[l_i].fabo156, 
         g_fabo4_d[l_i].fabo150,g_fabo4_d[l_i].fabo151,g_fabo4_d[l_i].fabo152,g_fabo4_d[l_i].fabo153, 
         g_fabo4_d[l_i].fabo154,g_fabo4_d[l_i].fabo155,g_fabo4_d[l_i].fabo157,g_fabo4_d[l_i].fabo158, 
         g_fabo4_d[l_i].fabo159,g_fabo4_d[l_i].fabo160)
      WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld 
        AND fabodocno = g_fabg_m.fabgdocno       
        AND faboseq = g_fabo_d[l_i].faboseq #項次 
                    
       IF SQLCA.sqlcode THEN #其他錯誤
          LET g_fabo_d[l_i].* = g_fabo_d_t.*  
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = TRUE 
          CALL s_transaction_end('N','0')
          CALL cl_err() 
       END IF 
       
   END FOR
   CALL afat504_set_entry_b("")
   CALL afat504_set_no_entry_b("") 
   CALL afat504_show()   
#160920-00025#1--add--e--
END FUNCTION

################################################################################
# Descriptions...: 科目說明
# Memo...........:
# Usage..........: CALL afat504_xrcd009_desc(p_xrcd009)
# Input parameter: p_xrcd009      科目編號
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_xrcd009_desc(p_xrcd009)
   DEFINE p_xrcd009  LIKE xrcd_t.xrcd009
   DEFINE r_desc     LIKE glacl_t.glacl004
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaa.glaa004
   LET g_ref_fields[2] = p_xrcd009
   CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001=? AND glacl002=? AND glacl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 科目檢查
# Memo...........:
# Usage..........: CALL afat504_xrcd009_chk(p_xrcd009)
#                  RETURNING g_errno
# Input parameter: p_xrcd009    科目編號
# Return code....: g_errno      錯誤編號
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_xrcd009_chk(p_xrcd009)
   DEFINE p_xrcd009    LIKE xrcd_t.xrcd009
   DEFINE l_glacstus   LIKE glac_t.glacstus
   DEFINE l_glac003    LIKE glac_t.glac003
   DEFINE l_glac006    LIKE glac_t.glac006
   
   LET g_errno = ''
   SELECT glacstus,glac003,glac006 INTO l_glacstus,l_glac003,l_glac006 FROM glac_t
    WHERE glacent = g_enterprise
#      AND glac001 = g_glaa004  #会计科目参照表号     #200605-00045#1 mark
      AND glac001 = g_glaa.glaa004  #会计科目参照表号     #200605-00045#1 add
      AND glac002 = p_xrcd009
       
   CASE
      WHEN SQLCA.SQLCODE = 100   LET g_errno = 'agl-00011'
      WHEN l_glacstus = 'N'      LET g_errno = 'sub-01302' #'agl-00012'   #160318-00005#11 mod  
      WHEN l_glac003 = '1'       LET g_errno = 'agl-00013'  #必须为非统治类科目
      WHEN l_glac006 <>'1'       LET g_errno = 'agl-00030'  #须为账户性质   
   END CASE   
END FUNCTION

################################################################################
# Descriptions...: 計算處置相關金額
# Memo...........:
# Usage..........: CALL afat504_get_amt(p_fah018,p_fabo007)
# Input parameter: p_faah018      未出售數量
#                : p_fabo007      出售數量
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_get_amt(p_faah018,p_fabo007)
   DEFINE p_faah018              LIKE faah_t.faah018
   DEFINE p_fabo007              LIKE fabo_t.fabo007
   DEFINE l_faah005              LIKE faah_t.faah005
   DEFINE l_faaj020              LIKE faaj_t.faaj020
   DEFINE l_faaj034              LIKE faaj_t.faaj034
   DEFINE l_faaj017              LIKE faaj_t.faaj017
   DEFINE l_faaj035              LIKE faaj_t.faaj035
   DEFINE l_faaj027              LIKE faaj_t.faaj027
   DEFINE l_faaj018              LIKE faaj_t.faaj018
   DEFINE l_faaj032              LIKE faaj_t.faaj032
   DEFINE l_faaj028              LIKE faaj_t.faaj028
   DEFINE l_faaj048              LIKE faaj_t.faaj048   #190107-00067#1 add  #190408-00001#1 mark  #200407-00006#1 remark
   DEFINE l_faaj117              LIKE faaj_t.faaj117
   DEFINE l_faaj113              LIKE faaj_t.faaj113
   DEFINE l_faaj104              LIKE faaj_t.faaj104
   DEFINE l_faaj105              LIKE faaj_t.faaj105   #180604-00010#1 add
   DEFINE l_faaj114              LIKE faaj_t.faaj114
   DEFINE l_faaj112              LIKE faaj_t.faaj112
   DEFINE l_faaj110              LIKE faaj_t.faaj110
   DEFINE l_faaj111              LIKE faaj_t.faaj111
   DEFINE l_faaj115              LIKE faaj_t.faaj115
   DEFINE l_faaj108              LIKE faaj_t.faaj108
   DEFINE l_faaj167              LIKE faaj_t.faaj167
   DEFINE l_faaj163              LIKE faaj_t.faaj163
   DEFINE l_faaj154              LIKE faaj_t.faaj154
   DEFINE l_faaj155              LIKE faaj_t.faaj155   #180604-00010#1 add
   DEFINE l_faaj164              LIKE faaj_t.faaj164
   DEFINE l_faaj162              LIKE faaj_t.faaj162
   DEFINE l_faaj160              LIKE faaj_t.faaj160
   DEFINE l_faaj161              LIKE faaj_t.faaj161
   DEFINE l_faaj165              LIKE faaj_t.faaj165
   DEFINE l_faaj158              LIKE faaj_t.faaj158
   DEFINE l_fabo049              LIKE fabo_t.fabo049
   DEFINE l_fabo106              LIKE fabo_t.fabo106
   DEFINE l_fabo155              LIKE fabo_t.fabo155
   DEFINE l_faaj019              LIKE faaj_t.faaj019  #20141118 add
   DEFINE l_success              LIKE type_t.chr1      #180531-00043#1 add
   
   SELECT faah005 INTO l_faah005
     FROM faah_t
    WHERE faahent=g_enterprise AND faah001=g_fabo_d[l_ac].fabo003
      AND faah003=g_fabo_d[l_ac].fabo001 AND faah004=g_fabo_d[l_ac].fabo002
      
   SELECT faaj016,faaj020,faaj034,faaj017,faaj035,faaj021,
          faaj027,faaj018,faaj032,faaj028,
          faaj103,faaj117,faaj113,faaj104,faaj114,faaj112,
          faaj110,faaj111,faaj115,faaj108,
          faaj153,faaj167,faaj163,faaj154,faaj164,faaj162,
          faaj160,faaj161,faaj165,faaj158,faaj019   #20141118 add faaj019预留残值
         ,faaj105,faaj155   #180604-00010#1 add 
         ,faaj048   #190107-00067#1 add  #190408-00001#1 mark  #200407-00006#1 remark
     INTO g_fabo_d[l_ac].fabo008,l_faaj020,l_faaj034,l_faaj017,l_faaj035,g_fabo_d[l_ac].fabo053,
          l_faaj027,l_faaj018,l_faaj032,l_faaj028,
          g_fabo4_d[l_ac].faaj103,l_faaj117,l_faaj113,l_faaj104,l_faaj114,l_faaj112,
          l_faaj110,l_faaj111,l_faaj115,l_faaj108,
          g_fabo4_d[l_ac].faaj153,l_faaj167,l_faaj163,l_faaj154,l_faaj164,l_faaj162,
          l_faaj160,l_faaj161,l_faaj165,l_faaj158,l_faaj019 #20141118 add  
         ,l_faaj105,l_faaj155   #180604-00010#1 add
         ,l_faaj048   #190107-00067#1 add  #190408-00001#1 mark  #200407-00006#1 remark
     FROM faaj_t
    WHERE faajent=g_enterprise AND faajld=g_fabg_m.fabgld
      AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002
      AND faaj037=g_fabo_d[l_ac].fabo003
   
   IF cl_null(g_fabo_d[l_ac].fabo008) THEN LET g_fabo_d[l_ac].fabo008=0 END IF #成本
   IF cl_null(l_faaj020) THEN LET l_faaj020=0 END IF   #调整成本
   IF cl_null(l_faaj034) THEN LET l_faaj034=0 END IF   #处置成本
   IF cl_null(l_faaj017) THEN LET l_faaj017=0 END IF   #累折
   IF cl_null(l_faaj035) THEN LET l_faaj035=0 END IF   #处置累折
   IF cl_null(g_fabo_d[l_ac].fabo053) THEN LET g_fabo_d[l_ac].fabo053=0 END IF #已提列減值準備
   IF cl_null(l_faaj027) THEN LET l_faaj027=0 END IF   #處置減值準備
   IF cl_null(l_faaj018) THEN LET l_faaj018=0 END IF   #本年累折
   IF cl_null(l_faaj032) THEN LET l_faaj032=0 END IF   #本年处置折舊
   IF cl_null(l_faaj028) THEN LET l_faaj028=0 END IF   #未折減額
   IF cl_null(l_faaj019) THEN LET l_faaj019= 0 END IF  #预留残值 #20141118 add
   
   #处置成本=(本幣成本 + 調整成本 -处置成本)/(數量-处置數量) * 單據出售量
   IF l_faaj048 <> '1' THEN   #190107-00067#1 add  #190408-00001#1 mark  #200407-00006#1 remark
   LET g_fabo_d[l_ac].fabo018=(g_fabo_d[l_ac].fabo008 + l_faaj020 - l_faaj034) / p_faah018 *p_fabo007
   
   #200407-00006#1 remark(s)
   #190408-00001#1 mark -s
   #190107-00067#1---add---str--
   ELSE
      LET g_fabo_d[l_ac].fabo018 = 0
   END IF
   #190107-00067#1---add---end--
   #190408-00001#1 mark -e
   #200407-00006#1 remark(e)
   
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo018,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo018
   #180531-00043#1---add---end--
   
   #处置累折=(累折 - 处置累折) / (數量-处置數量) * 單據出售量
   LET g_fabo_d[l_ac].fabo019=(l_faaj017 - l_faaj035) / p_faah018 *p_fabo007
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo019,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo019
   #180531-00043#1---add---end--
   
   #处置減值準備= (已提列減值準備 - 处置減值準備) / (faah總數量-处置數量) * 單據出售量
   LET g_fabo_d[l_ac].fabo020=(g_fabo_d[l_ac].fabo053 - l_faaj027) / p_faah018 *p_fabo007
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo020,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo020
   #180531-00043#1---add---end--
   
   #本年处置折舊=(本年累折-本年处置折舊)/(數量-处置數量)*處份量
   LET g_fabo_d[l_ac].fabo021=(l_faaj018 - l_faaj032) / p_faah018 *p_fabo007
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo021,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo021
   #180531-00043#1---add---end--
   
   #未折減額=（未折減額/（faah總 數量-faaj处置数量) * 出售量
   IF l_faaj048 <> '1' THEN   #190107-00067#1 add  #190408-00001#1 mark  #200407-00006#1 remark
   LET g_fabo_d[l_ac].fabo022=l_faaj028 / p_faah018 *p_fabo007
   
   #200407-00006#1 remark(s)
   #190408-00001#1 mark -s
   #190107-00067#1---add---str--
   ELSE
      LET g_fabo_d[l_ac].fabo022 = 0
   END IF
   #190107-00067#1---add---end--
   #190408-00001#1 mark -e
   #200407-00006#1 remark(e)
   
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo022,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo022
   #180531-00043#1---add---end--
   
   #20141118 add--str--
   #处置预留残值=预留残值-出售量
   #LET g_fabo_d[l_ac].fabo025 = l_faaj019 - p_fabo007               #180604-00010#1 mark
   LET g_fabo_d[l_ac].fabo025 = (l_faaj019 / p_faah018) *p_fabo007   #180604-00010#1 add
   #20141118 add--end--
   #180531-00043#1---add---str--
   CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo025,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo025
   #180531-00043#1---add---end--
   
   #本位币二
   IF g_glaa.glaa015='Y' THEN
      IF cl_null(g_fabo4_d[l_ac].faaj103) THEN LET g_fabo4_d[l_ac].faaj103=0 END IF
      IF cl_null(l_faaj117) THEN LET l_faaj117=0 END IF
      IF cl_null(l_faaj113) THEN LET l_faaj113=0 END IF
      IF cl_null(l_faaj104) THEN LET l_faaj104=0 END IF
      IF cl_null(l_faaj105) THEN LET l_faaj105=0 END IF   #180604-00010#1 add
      IF cl_null(l_faaj114) THEN LET l_faaj114=0 END IF
      IF cl_null(l_faaj112) THEN LET l_faaj112=0 END IF
      IF cl_null(l_faaj110) THEN LET l_faaj110=0 END IF
      IF cl_null(l_faaj111) THEN LET l_faaj111=0 END IF
      IF cl_null(l_faaj115) THEN LET l_faaj115=0 END IF
      IF cl_null(l_faaj108) THEN LET l_faaj108=0 END IF
      
      LET g_fabo4_d[l_ac].fabo107= (g_fabo4_d[l_ac].faaj103 + l_faaj117 - l_faaj113) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo107,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo107
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo108= (l_faaj104 - l_faaj114) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo108,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo108
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo109= (l_faaj112 - l_faaj110) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo109,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo109
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo110= (l_faaj111 - l_faaj115) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo110,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo110
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo111= l_faaj108 / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo111,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo111
      #180531-00043#1---add---end--
      #180604-00010#1---add---str--
      LET g_fabo4_d[l_ac].fabo112 = (l_faaj105 / p_faah018) *p_fabo007
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo112,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo112      
      #180604-00010#1---add---end--
   END IF
  

   #本位三
   IF g_glaa.glaa019='Y' THEN
      IF cl_null(g_fabo4_d[l_ac].faaj153) THEN LET g_fabo4_d[l_ac].faaj153=0 END IF
      IF cl_null(l_faaj167) THEN LET l_faaj167=0 END IF
      IF cl_null(l_faaj163) THEN LET l_faaj163=0 END IF
      IF cl_null(l_faaj154) THEN LET l_faaj154=0 END IF
      IF cl_null(l_faaj155) THEN LET l_faaj155=0 END IF   #180604-00010#1 add
      IF cl_null(l_faaj164) THEN LET l_faaj164=0 END IF
      IF cl_null(l_faaj162) THEN LET l_faaj162=0 END IF
      IF cl_null(l_faaj160) THEN LET l_faaj160=0 END IF
      IF cl_null(l_faaj161) THEN LET l_faaj161=0 END IF
      IF cl_null(l_faaj165) THEN LET l_faaj165=0 END IF
      IF cl_null(l_faaj158) THEN LET l_faaj158=0 END IF
      
      LET g_fabo4_d[l_ac].fabo156= (g_fabo4_d[l_ac].faaj153 + l_faaj167 - l_faaj163) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo156,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo156
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo157= (l_faaj154 - l_faaj164) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo157,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo157
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo158= (l_faaj162 - l_faaj160) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo158,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo158
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo159= (l_faaj161 - l_faaj165) / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo159,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo159
      #180531-00043#1---add---end--
      LET g_fabo4_d[l_ac].fabo160= l_faaj158 / p_faah018 *p_fabo007
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo160,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo160
      #180531-00043#1---add---end--
      #180604-00010#1---add---str--
      LET g_fabo4_d[l_ac].fabo161 = (l_faaj155 / p_faah018) *p_fabo007
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo161,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo161      
      #180604-00010#1---add---end--
   END IF
   
   IF cl_null(g_fabo_d[l_ac].fabo015) THEN LET g_fabo_d[l_ac].fabo015 = 0 END IF
   IF cl_null(g_fabo_d[l_ac].fabo019) THEN LET g_fabo_d[l_ac].fabo019 = 0 END IF
   IF cl_null(g_fabo_d[l_ac].fabo020) THEN LET g_fabo_d[l_ac].fabo020 = 0 END IF
   IF cl_null(g_fabo_d[l_ac].fabo008) THEN LET g_fabo_d[l_ac].fabo008 = 0 END IF
   #處置損益
   IF l_faah005 <> '5' THEN #資產性質不為5：費用
      #處置損益=(本币成本+调整成本-处置成本)/(数量-处置数量)* 单身出售数量
      LET l_fabo049=(g_fabo_d[l_ac].fabo008 + l_faaj020 - l_faaj034) / p_faah018 *p_fabo007    #20141119 add l_faaj020
      #处份损益=本币出售税前金额+累折-处分损益1+减值准备
      LET g_fabo_d[l_ac].fabo049 = g_fabo_d[l_ac].fabo015 + g_fabo_d[l_ac].fabo019 - l_fabo049 + g_fabo_d[l_ac].fabo020
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo049,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo049
      #180531-00043#1---add---end--      
      #本位幣二
      IF g_glaa.glaa015='Y' THEN
         LET l_fabo106=(g_fabo4_d[l_ac].faaj103 + l_faaj117 - l_faaj113) / p_faah018 *p_fabo007  #20141119 add l_faaj117
         IF cl_null(l_fabo106) THEN LET l_fabo106 = 0 END IF #180525-00007#1 add
        #LET g_fabo4_d[l_ac].fabo106=(g_fabo4_d[l_ac].faaj103 - l_faaj113) / p_faah018 *p_fabo007
         LET g_fabo4_d[l_ac].fabo106 = g_fabo4_d[l_ac].fabo103 + g_fabo4_d[l_ac].fabo108 - l_fabo106 + g_fabo4_d[l_ac].fabo109
         IF cl_null(g_fabo4_d[l_ac].fabo106) THEN LET g_fabo4_d[l_ac].fabo106 = 0 END IF #180525-00007#1 add
         #180531-00043#1---add---str--
         CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo106,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo106
         #180531-00043#1---add---end--
      END IF
      
      #本位幣三
      IF g_glaa.glaa019='Y' THEN
         LET l_fabo155=(g_fabo4_d[l_ac].faaj153 + l_faaj167 - l_faaj163) / p_faah018 *p_fabo007   #20141119 add l_faaj167
         IF cl_null(l_fabo155) THEN LET l_fabo155 = 0 END IF #180525-00007#1 add
        #LET g_fabo4_d[l_ac].fabo155=(g_fabo4_d[l_ac].faaj153 - l_faaj163) / p_faah018 *p_fabo007
         LET g_fabo4_d[l_ac].fabo155 = g_fabo4_d[l_ac].fabo152 + g_fabo4_d[l_ac].fabo157 - l_fabo155 + g_fabo4_d[l_ac].fabo158
         IF cl_null(g_fabo4_d[l_ac].fabo155) THEN LET g_fabo4_d[l_ac].fabo155 = 0 END IF #180525-00007#1 add
         #180531-00043#1---add---str--
         CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo155,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo155
         #180531-00043#1---add---end--
      END IF      
   ELSE #費用類計算時不抓本幣成本
      #處置損益=(调整成本-处置成本)/(数量-处置数量)* 单身出售数量
#      LET g_fabo_d[l_ac].fabo049=(l_faaj020 - l_faaj034) / p_faah018 *p_fabo007
      LET l_fabo049=(l_faaj020 - l_faaj034) / p_faah018 *p_fabo007
      #处置累折=(累计折旧faaj017-处置累折faaj035)/(数量-处置数量)*出售数量
      LET g_fabo_d[l_ac].fabo049 = g_fabo_d[l_ac].fabo015 + g_fabo_d[l_ac].fabo019 - l_fabo049 + g_fabo_d[l_ac].fabo020
      #180531-00043#1---add---str--
      CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo_d[l_ac].fabo010,g_fabo_d[l_ac].fabo049,2) RETURNING l_success,g_errno,g_fabo_d[l_ac].fabo049
      #180531-00043#1---add---end--
      #本位幣二
      IF g_glaa.glaa015='Y' THEN
        #LET g_fabo4_d[l_ac].fabo106=(l_faaj117 - l_faaj113) / p_faah018 *p_fabo007
         LET l_fabo106=(l_faaj117 - l_faaj113) / p_faah018 *p_fabo007
         LET g_fabo4_d[l_ac].fabo106 = g_fabo4_d[l_ac].fabo103 + g_fabo4_d[l_ac].fabo108 - l_fabo106 + g_fabo4_d[l_ac].fabo109
         #180531-00043#1---add---str--
         CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo101,g_fabo4_d[l_ac].fabo106,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo106
         #180531-00043#1---add---end--
      END IF


      #本位幣三
      IF g_glaa.glaa019='Y' THEN
        #LET g_fabo4_d[l_ac].fabo155=(l_faaj167 - l_faaj163) / p_faah018 *p_fabo007
        LET l_fabo155=(l_faaj167 - l_faaj163) / p_faah018 *p_fabo007
         LET g_fabo4_d[l_ac].fabo155 = g_fabo4_d[l_ac].fabo152 + g_fabo4_d[l_ac].fabo157 - l_fabo155 + g_fabo4_d[l_ac].fabo158
         #180531-00043#1---add---str--
         CALL s_curr_round_ld('1',g_fabg_m.fabgld,g_fabo4_d[l_ac].fabo150,g_fabo4_d[l_ac].fabo155,2) RETURNING l_success,g_errno,g_fabo4_d[l_ac].fabo155
         #180531-00043#1---add---end--
      END IF
   END IF
   DISPLAY BY NAME g_fabo_d[l_ac].fabo018,g_fabo_d[l_ac].fabo019,g_fabo_d[l_ac].fabo020,g_fabo_d[l_ac].fabo021,
                   g_fabo_d[l_ac].fabo022,g_fabo_d[l_ac].fabo049,
                   g_fabo4_d[l_ac].fabo107,g_fabo4_d[l_ac].fabo108,g_fabo4_d[l_ac].fabo109,
                   g_fabo4_d[l_ac].fabo110,g_fabo4_d[l_ac].fabo111,g_fabo4_d[l_ac].fabo106,
                   g_fabo4_d[l_ac].fabo156,g_fabo4_d[l_ac].fabo157,g_fabo4_d[l_ac].fabo158,
                   g_fabo4_d[l_ac].fabo159,g_fabo4_d[l_ac].fabo160,g_fabo4_d[l_ac].fabo155
                  ,g_fabo_d[l_ac].fabo025,g_fabo4_d[l_ac].fabo112,g_fabo4_d[l_ac].fabo161   #180604-00010#1 add 
END FUNCTION

################################################################################
# Descriptions...: 抓取财产编号
# Memo...........:
# Usage..........: CALL afat504_get_fabo001()
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_get_fabo001()
   SELECT fabo001 INTO g_fabo3_d[l_ac].fabo001 FROM fabo_t
    WHERE faboent=g_enterprise AND fabold=g_fabg_m.fabgld 
      AND fabodocno=g_fabg_m.fabgdocno AND faboseq=g_fabo3_d[l_ac].xrcdseq
   
END FUNCTION

################################################################################
# Descriptions...: 税别说明
# Memo...........:
# Usage..........: CALL afat504_xrcd002_desc(xrcd002)
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_xrcd002_desc(p_xrcd002)
   DEFINE p_xrcd002       LIKE xrcd_t.xrcd002
   DEFINE r_desc          LIKE oodbl_t.oodbl004
  
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_ooef019
   LET g_ref_fields[2] = p_xrcd002
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 還款單還原
################################################################################
PRIVATE FUNCTION afat504_set_back()
DEFINE l_xrcastus    LIKE xrca_t.xrcastus 
DEFINE r_success     LIKE type_t.num5    #20150130 add by chenying
DEFINE l_sql         STRING              #20150204 add by chenying
DEFINE l_xrcald      LIKE xrca_t.xrcald  #20150204 add by chenying
DEFINE l_xrcadocno   LIKE xrca_t.xrcadocno  #20150204 add by chenying
#160616-00005#3--add--str--
DEFINE l_xrcadocdt   LIKE xrca_t.xrcadocdt
DEFINE l_xrca038     LIKE xrca_t.xrca038
DEFINE l_xrcasite    LIKE xrca_t.xrcasite
DEFINE l_clo_date    LIKE type_t.dat
DEFINE l_success     LIKE type_t.chr1
DEFINE l_flag        LIKE type_t.num5
DEFINE l_dfin0030    LIKE type_t.chr1
DEFINE l_ooba002     LIKE ooba_t.ooba002
#160616-00005#3--add--end
#180809-00012#1 add(s)
DEFINE l_isafdocno   LIKE isaf_t.isafdocno
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_slip        LIKE type_t.chr20
DEFINE l_isao006     LIKE isao_t.isao006
DEFINE l_scom0002    LIKE type_t.chr10 
DEFINE l_ld_type     LIKE type_t.chr1
#180809-00012#1 add(e)

   LET r_success = TRUE #20150130 add by chenying
   
   IF NOT cl_null(g_fabg_m.fabg011) AND NOT cl_null(g_fabg_m.fabgdocno) THEN
      #160616-00005#3--mod--str--
#      SELECT xrcastus INTO l_xrcastus FROM xrca_t 
#       WHERE xrcadocno=g_fabg_m.fabg011 AND xrcaent = g_enterprise 
#         AND xrcald = g_fabg_m.fabgld 
#      IF l_xrcastus='Y' THEN 
#          INITIALIZE g_errparam TO NULL 
#          LET g_errparam.extend = "" 
#          LET g_errparam.code   = "afa-00244" 
#          LET g_errparam.popup  = TRUE 
#          CALL cl_err()
#          LET r_success = FALSE #20150130 add by chenying
#      ELSE 
      SELECT xrcastus,xrcadocdt,xrca038,xrcasite
        INTO l_xrcastus,l_xrcadocdt,l_xrca038,l_xrcasite
        FROM xrca_t 
       WHERE xrcadocno=g_fabg_m.fabg011 AND xrcaent = g_enterprise 
         AND xrcald = g_fabg_m.fabgld 
      #检查日期是否小于应收关账日期，如果小于不可还原
      CALL cl_get_para(g_enterprise,l_xrcasite,'S-FIN-2007') RETURNING l_clo_date 
      IF l_xrcadocdt <= l_clo_date THEN 
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = l_xrcadocdt||'<='||l_clo_date
         LET g_errparam.code   = "afa-00474" 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE 
      END IF 
      #应收账款已抛转凭证，不可还原
      IF NOT cl_null(l_xrca038) THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = l_xrca038
         LET g_errparam.code   = "afa-00475" 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE 
      END IF 
      #当应收账款已审核时，先执行取消审核，在删除应该账款资料
      IF r_success = TRUE THEN
         IF l_xrcastus='Y' THEN 
            CALL s_axrt300_unconfirm(g_fabg_m.fabgld,g_fabg_m.fabg011) RETURNING l_success
            IF l_success <>'Y' THEN LET r_success = FALSE END IF
         END IF
      END IF
      IF r_success = TRUE THEN   
         #180806-00027#1 add(s)
         UPDATE xrca_t 
            SET xrcastus = 'N' 
          WHERE xrcaent = g_enterprise AND xrcald = g_fabg_m.fabgld
            AND xrcadocno = g_fabg_m.fabg011
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = sqlca.sqlcode
            LET g_errparam.extend = g_fabg_m.fabg011
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE  
         END IF
         #180806-00027#1 add(e)
         #180809-00012#1 mark(s)
      #160616-00005#3--mod--end
         #移到最後再處理
         #UPDATE fabg_t SET fabg011="" 
#        #  WHERE fabgdocno = g_fabg_m.fabgdocno AND fabgent = g_enterprise #20150204 mark by chenying
         # WHERE fabg011 = g_fabg_m.fabg011 AND fabgent = g_enterprise  #20150204 add by chenying 根据生成账款更新多笔      
         #   AND fabgld = g_fabg_m.fabgld
         ##20150130 add by chenying
         #IF SQLCA.SQLCODE THEN
         #   INITIALIZE g_errparam TO NULL
         #   LET g_errparam.code = sqlca.sqlcode
         #   LET g_errparam.extend = g_fabg_m.fabg011
         #   LET g_errparam.popup = TRUE
         #   CALL cl_err()
         #   LET r_success = FALSE  
         #END IF
         #20150130 add by chenying
         #180809-00012#1 mark(e)
         #180809-00012#1 add(s)
         CALL cl_get_para(g_enterprise,g_fabg_m.fabgcomp,'S-COM-0002') RETURNING l_scom0002
         CALL s_fin_get_ld_type(g_fabg_m.fabgld) RETURNING l_ld_type
         SELECT isao006 INTO l_isao006 FROM isao_t WHERE isaoent = g_enterprise AND isaosite = g_fabg_m.fabgsite 
         IF l_scom0002 = 'Y' THEN
         #因為參數設定要連號，所以將應收單作廢
            UPDATE xrca_t 
               SET xrcastus = 'X',
                   xrcacnfid = '',
                   xrcacnfdt = ''
             WHERE xrcaent = g_enterprise AND xrcald = g_fabg_m.fabgld
               AND xrcadocno = g_fabg_m.fabg011
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = sqlca.sqlcode
               LET g_errparam.extend = g_fabg_m.fabg011
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE  
            END IF
            #子系统是否启用分录底稿
            SELECT glaa121 INTO g_glaa.glaa121 FROM glaa_t
             WHERE glaaent = g_enterprise AND glaald = g_fabg_m.fabgld
            #获取单别l_slip
            CALL s_aooi200_fin_get_slip(g_fabg_m.fabg011) RETURNING l_success,l_slip
            #是否产生分录l_dfin0030
            CALL s_fin_get_doc_para(g_fabg_m.fabgld,g_fabg_m.fabgcomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
            #是否有存在分录底稿
            SELECT count(1) INTO l_cnt
              FROM glga_t
             WHERE glgaent = g_enterprise
               AND glgald  = g_fabg_m.fabgld AND glgadocno =g_fabg_m.fabgdocno 
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' AND l_cnt > 0 THEN
               UPDATE glga_t SET glgastus = 'X'
                WHERE glgaent = g_enterprise
                  AND glgald  = g_fabg_m.fabgld
                  AND glgadocno = g_fabg_m.fabgdocno 
            END IF
            IF l_isao006 = 'Y' THEN    
               #抓单身对账单
               LET l_sql = " SELECT DISTINCT xrcb049 FROM xrcb_t WHERE xrcbent = ",g_enterprise," AND xrcbdocno = '",g_fabg_m.fabgdocno,"'",
                           "    AND xrcbld = '",g_fabg_m.fabgld,"'"
               PREPARE afat504_get_xrcb_prep1 FROM l_sql
               DECLARE afat504_get_xrcb_curs1 CURSOR FOR afat504_get_xrcb_prep1
               
               #是否对账单存在其他应收单 
               LET l_sql = " SELECT COUNT(1) FROM xrcb_t,xrca_t WHERE xrcadocno = xrcbdocno AND xrcbld = xrcald and xrcbent = xrcaent ",
                           "    AND xrcastus <> 'X' AND xrcbent = ",g_enterprise," AND xrcbdocno <> '",g_fabg_m.fabgdocno,"'",
                           "    AND xrcb049 = ? "
               PREPARE afat504_count_xrcb_prep1 FROM l_sql            
                           
               LET l_isafdocno = "" 
               FOREACH afat504_get_xrcb_curs1 INTO l_isafdocno
                  EXECUTE afat504_count_xrcb_prep1 USING l_isafdocno INTO l_cnt 
                  IF l_cnt = 0 THEN 
                     CASE
                         WHEN '1' 
                                 UPDATE isaf_t SET isaf035 = '' 
                                  WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp
                                    AND isaf035 = "MULTI"
                                    AND isafdocno = l_isafdocno
                         WHEN '2' 
                                 UPDATE isaf_t SET isaf048 = '' 
                                  WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp 
                                    AND isaf048 = "MULTI"
                                    AND isafdocno = l_isafdocno
                         WHEN '3' 
                                 UPDATE isaf_t SET isaf049 = '' 
                                  WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp 
                                    AND isaf049 = "MULTI"
                                    AND isafdocno = l_isafdocno
                     END CASE               
                  END IF
               END FOREACH                  
            ELSE         
               CASE
                   WHEN '1' 
                           UPDATE isaf_t SET isaf035 = '' 
                            WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp
                              AND isaf035 = g_fabg_m.fabg011
                   WHEN '2' 
                           UPDATE isaf_t SET isaf048 = '' 
                            WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp 
                              AND isaf048 = g_fabg_m.fabg011
                   WHEN '3' 
                           UPDATE isaf_t SET isaf049 = '' 
                            WHERE isafent = g_enterprise AND isafcomp = g_fabg_m.fabgcomp 
                              AND isaf049 = g_fabg_m.fabg011
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = SQLCA.sqlcode
                     LET g_errparam.popup  = FALSE
                     CALL cl_err()
                  END IF
               END CASE
            END IF 
         ELSE
         #180809-00012#1 add(e)
            #20150204 add by chenying
            #生成账款考虑平行帐套，还原时平行帐套也需删除
            LET l_sql = "SELECT glaald FROM glaa_t WHERE glaaent = '",g_enterprise,"' AND (glaald = '",g_fabg_m.fabgld,"'",
                        " OR glaald IN (SELECT glaald FROM glaa_t WHERE glaaent = '",g_enterprise,"' AND glaa008 = 'Y' AND glaacomp = '",g_fabg_m.fabgcomp,"' )) ORDER BY glaa023 "
            PREPARE pre_glaald FROM l_sql
            DECLARE sel_glaald CURSOR FOR pre_glaald
             
            
            #通过xrcb单身资料获取账款单据
            LET l_sql = "SELECT DISTINCT xrcadocno FROM xrca_t LEFT OUTER JOIN xrcb_t ON xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
                        " WHERE xrcbent = '",g_enterprise,"' ",
                        "   AND xrcbld = ? AND xrcb002 = '",g_fabg_m.fabgdocno,"' ",
                        "   AND xrcastus = 'N' ",
                        "  ORDER BY xrcadocno "
            PREPARE pre_xrcadocno FROM l_sql
            DECLARE sel_xrcadocno CURSOR FOR pre_xrcadocno
            
            LET g_prog = 'axrt330'  #160616-00005#3 add
            
            FOREACH sel_glaald INTO l_xrcald        
               FOREACH sel_xrcadocno USING l_xrcald INTO l_xrcadocno
            #20150204 add by chenying
                  
                  DELETE FROM xrca_t 
                  WHERE xrcadocno=l_xrcadocno AND xrcaent = g_enterprise #20150204 mod g_fabg_m.fabg011 -->l_xrcadocno
                    AND xrcald = l_xrcald   #20150204 mod g_fabg_m.fabgld -->l_xrcald 
                    AND xrcastus = 'N'
                  #20150130 add by chenying
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = sqlca.sqlcode
                     LET g_errparam.extend =l_xrcadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()            
                     LET r_success = FALSE  
                  END IF
                  #20150130 add by chenying
               
                  DELETE FROM xrcb_t 
                  WHERE xrcbdocno=l_xrcadocno AND xrcbent = g_enterprise #20150204 mod g_fabg_m.fabg011 -->l_xrcadocno 
                    AND xrcbld = l_xrcald   #20150204 mod g_fabg_m.fabgld -->l_xrcald 
                  #20150130 add by chenying
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = sqlca.sqlcode
                     LET g_errparam.extend = g_fabg_m.fabg011
                     LET g_errparam.popup = TRUE
                     CALL cl_err()              
                     LET r_success = FALSE  
                  END IF
               
                  DELETE FROM xrcc_t 
                  WHERE xrccent = g_enterprise AND xrccdocno = l_xrcadocno #20150204 mod g_fabg_m.fabg011 -->l_xrcadocno
                    AND xrccld = l_xrcald   #20150204 mod g_fabg_m.fabgld -->l_xrcald  
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = sqlca.sqlcode
                     LET g_errparam.extend = g_fabg_m.fabg011
                     LET g_errparam.popup = TRUE
                     CALL cl_err()              
                     LET r_success = FALSE  
                  END IF           
               
                  DELETE FROM xrcd_t 
                  WHERE xrcdent = g_enterprise AND xrcddocno = l_xrcadocno #20150204 mod g_fabg_m.fabg011 -->l_xrcadocno
                    AND xrcdld = l_xrcald   #20150204 mod g_fabg_m.fabgld -->l_xrcald 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = sqlca.sqlcode
                     LET g_errparam.extend = g_fabg_m.fabg011
                     LET g_errparam.popup = TRUE
                     CALL cl_err()              
                     LET r_success = FALSE  
                  END IF
                  
                  #160616-00005#3--add--str--
                  #删除分录底稿资料
                  CALL s_aooi200_fin_get_slip(l_xrcadocno) RETURNING l_flag,l_ooba002
                  CALL s_fin_get_doc_para(l_xrcald,g_fabg_m.fabgcomp,l_ooba002,'D-FIN-0030') RETURNING l_dfin0030
                  IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
                     IF s_axrt300_xrcb105_chk(l_xrcald,l_xrcadocno) THEN 
                        CALL s_pre_voucher_del('AR','R10',l_xrcald,l_xrcadocno) RETURNING l_flag
                        IF NOT l_flag THEN
                           LET r_success = FALSE
                        END IF
                     END IF 
                  END IF
                  
                  #刪除單號
                  IF NOT s_aooi200_fin_del_docno(l_xrcald,l_xrcadocno,l_xrcadocdt) THEN
                     LET r_success = FALSE
                  END IF
                  #160616-00005#3--add--end
                  
               #20150130 add by chenying
               END FOREACH  #20150204 add by chenying  
            END FOREACH  #20150204 add by chenying 
         END IF #180809-00012#1 add
         LET g_prog = 'afat504'  #160616-00005#3 add
         #180809-00012#1 add(s)
         #移到此處處理
         #UPDATE fabg_t SET fabg011=""  #PGS(D)-01531 mark
         UPDATE fabg_t SET fabg011=NULL #PGS(D)-01531 add
          WHERE fabg011 = g_fabg_m.fabg011 AND fabgent = g_enterprise
            AND fabgld = g_fabg_m.fabgld
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = sqlca.sqlcode
            LET g_errparam.extend = g_fabg_m.fabg011
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE  
         END IF
         #180809-00012#1 add(s)
#         LET g_fabg_m.fabg011=""                   #20150130 mark
#         DISPLAY g_fabg_m.fabg011 TO fabg011       #20150130 mark   
      END IF
   END IF
   RETURN r_success  #20150130 add by chenying
END FUNCTION

################################################################################
# Descriptions...: 描述说明
################################################################################
PRIVATE FUNCTION afat504_s01_construct()
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING
   DEFINE l_ooef004   LIKE ooef_t.ooef004
   DEFINE lp_str      STRING   #201109-00009#171 add
   
   CLEAR FORM                
   INITIALIZE g_fabg_m.* TO NULL
   CALL g_fabo_d.clear()        
   CALL g_fabo3_d.clear() 
   CALL g_fabo4_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前

   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
#      CONSTRUCT BY NAME g_wc ON fabg019           #20141112
      CONSTRUCT BY NAME g_wc_fabg019 ON fabg019    #20141112
 
         BEFORE CONSTRUCT

         AFTER FIELD fabg019
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            #201109-00009#171---add---(S) 
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str 
            IF NOT cl_null(lp_str) THEN 
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能 
               CALL FGL_DIALOG_SETBUFFER(lp_str) 
            END IF 
            #201109-00009#171---add---(E)   
            
#            IF NOT cl_null(ls_result) THEN
#               IF NOT cl_chk_date_symbol(ls_result) THEN
#                  LET ls_result = cl_add_date_extra_cond(ls_result)
#               END IF
#            END IFj
#            CALL FGL_DIALOG_SETBUFFER(ls_result)
            
         ON ACTION controlp INFIELD fabg019 
             INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "fabg005 = '17'"
            #161219-00009#3 add s---
            IF NOT cl_null(g_ld_str) AND NOT g_ld_str = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_ld_str CLIPPED 
            END IF
            #161219-00009#3 add e---               
            CALL q_fabgdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO fabg019  #顯示到畫面上
            #NEXT FIELD fabg019   
         END CONSTRUCT
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog

         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
      ON ACTION accept
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
    
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION

################################################################################
# Descriptions...: 查詢來源調撥單號
################################################################################
PRIVATE FUNCTION afat504_01_query()
 DEFINE ls_wc STRING
   #add-point:query段define

   #end add-point   
 
   #切換畫面
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_fabo_d.clear()
   CALL g_fabo3_d.clear()
   CALL g_fabo4_d.clear()
 
   
   #add-point:query段other

   #end add-point   
   
   DISPLAY ' ' TO FORMONLY.idx
   DISPLAY ' ' TO FORMONLY.cnt
   DISPLAY ' ' TO FORMONLY.b_index
   DISPLAY ' ' TO FORMONLY.b_count
   DISPLAY ' ' TO FORMONLY.h_index
   DISPLAY ' ' TO FORMONLY.h_count
   
   CALL afat504_s01_construct()
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
   
   CALL afat504_browser_fill("F") 
   
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "-100" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()

   ELSE
      CALL afat504_fetch("F") 

   END IF

END FUNCTION

################################################################################
# Descriptions...: 調撥單號查詢
################################################################################
PRIVATE FUNCTION afat504_open_afat504_s01()
OPEN WINDOW w_afat504_s01 WITH FORM cl_ap_formpath("afa",'afat504_s01') 
   
   DISPLAY BY NAME  g_fabg019

   CALL afat504_01_query()
   CALL cl_set_act_visible("accept,cancel", TRUE)
   CLOSE WINDOW w_afat504_s01
#20141112   
#   IF g_browser_cnt = 0 THEN
#      INITIALIZE g_errparam TO NULL 
#      LET g_errparam.extend = "" 
#      LET g_errparam.code   = "-100" 
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err()
#   ELSE
       CALL afat504_fetch("F") 
       CALL afat504_show()
#   END IF  
#20141112
 
   #CALL afat504_fetch("F") 
END FUNCTION

################################################################################
# Descriptions...: 財產編號、附號、卡片編號檢查
# Memo...........:
# Usage..........: CALL afat504_faid_chk()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      執行成功否     TRUE/FALSE
# Date & Author..: 2014/10/20 By liuym
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_faid_chk()
   DEFINE l_faah015         LIKE faah_t.faah015
   DEFINE l_n1              LIKE type_t.num5 
   DEFINE r_success         LIKE type_t.num5
   DEFINE l_n               LIKE type_t.num5
    ########################################add by huangtao
   DEFINE l_faah006         LIKE faah_t.faah006 
   DEFINE l_faah032         LIKE faah_t.faah032 
   DEFINE l_ooef017         LIKE ooef_t.ooef017 
   DEFINE l_faal003         LIKE faal_t.faal003 
   DEFINE l_year            LIKE type_t.num5
   DEFINE l_month           LIKE type_t.num5
   #########################################add by huangtao
   
   LET r_success = TRUE

#   #無財編、卡片編號則不需要做檢查，無附號則便是類型為'1.主件'所以不需要考慮附號值否有
#   IF cl_null(g_fabo_d[l_ac].fabo001) THEN RETURN r_success END IF
#
#  #####################################mark by huangtao
#  ##若財編、附號不為空，卡片編號為空，可自動帶出
#  #IF g_fabo_d[l_ac].fabo002 IS NOT NULL AND cl_null(g_fabo_d[l_ac].fabo003) THEN
#  #   CALL afat504_faid_def()
#  #END IF
#  #IF cl_null(g_fabo_d[l_ac].fabo003) THEN RETURN r_success END IF
#  IF g_fabo_d[l_ac].fabo002 IS NULL THEN RETURN r_success END IF
#   #若卡片不为空。检查财编，附号，卡片是否存在afai100
#  IF NOT cl_null(g_fabo_d[l_ac].fabo003) THEN
#  #####################################mark by huangtao
#      LET l_n = 0
#      SELECT COUNT(*) INTO l_n
#        FROM faaj_t
#       WHERE faajent = g_enterprise
#         AND faaj037 = g_fabo_d[l_ac].fabo003
#         AND faaj001 = g_fabo_d[l_ac].fabo001
#         AND faaj002 = g_fabo_d[l_ac].fabo002
#      
#      IF l_n = 0 THEN 
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'afa-00178'
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#      
#         LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
#         LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
#         LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#   ############################add by huangtao
#   #卡片为空,根据财编，附号带出预设卡片
#   ELSE
#      SELECT faah001 INTO g_fabo_d[l_ac].fabo003 FROM faah_t
#       WHERE faahent = g_enterprise AND faah003 = g_fabo_d[l_ac].fabo001  AND faah004 = g_fabo_d[l_ac].fabo002 
#   
#   END IF   
#   ############################add by huangtao
#   SELECT faah006,faah015,faah032 INTO l_faah006,l_faah015,l_faah032 FROM faah_t
#    WHERE faahent = g_enterprise
#      AND faah003 = g_fabo_d[l_ac].fabo001
#      AND faah004 = g_fabo_d[l_ac].fabo002
#      AND faah001 = g_fabo_d[l_ac].fabo003
#   #財產狀態不可為0：取得、5：出售、6：銷賬、10：被資本化
#   IF l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10' OR l_faah015 = '8' THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'afa-00135'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
#      LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
#      LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
#      LET r_success = FALSE
#      RETURN r_success
#   END IF 

   #當前折畢再單，卡片+財產編號+附號不可重複
   LET l_n1 = 0
   SELECT COUNT(1) INTO l_n1 FROM fabo_t  #160905-00007#2 count(*) --> count(1)
    WHERE faboent = g_enterprise
      AND fabodocno = g_fabg_m.fabgdocno
      AND fabo001 = g_fabo_d[l_ac].fabo001
      AND fabo002 = g_fabo_d[l_ac].fabo002
      AND fabo003 = g_fabo_d[l_ac].fabo003
      AND faboseq <> g_fabo_d[l_ac].faboseq
   IF l_n1 > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00142'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()


      LET g_fabo_d[l_ac].fabo001 = g_fabo_d_t.fabo001
      LET g_fabo_d[l_ac].fabo002 = g_fabo_d_t.fabo002
      LET g_fabo_d[l_ac].fabo003 = g_fabo_d_t.fabo003
      LET r_success = FALSE
      RETURN r_success
   END IF
##################################add by huangtao
##mark by yangxf 
#   IF NOT s_afat502_site_comp_chk(g_fabg_m.fabgsite,l_faah032) THEN 
#      LET r_success = FALSE
#      RETURN r_success
#   END IF 
#   #根据财编，附号 检查是否和单头资产中心帐套同一法人
##   SELECT ooef017 INTO l_ooef017 FROM ooef_t
##    WHERE ooefent = g_enterprise AND ooef001 =g_fabg_m.fabgsite
##   
##   IF l_ooef017 <> l_faah032 THEN
##      INITIALIZE g_errparam TO NULL
##      LET g_errparam.code = 'axr-00122'      #过单
##      LET g_errparam.extend = ''
##      LET g_errparam.popup = TRUE
##      CALL cl_err()
##      RETURN FALSE
##   END IF
##mark by yangxf 
##检查是否存在afai021 不存在报错，存在的话，检查是否先计提折旧
#   SELECT faal003 INTO l_faal003 FROM faal_t 
#    WHERE faalent = g_enterprise AND faalld = g_fabg_m.fabgld AND faal001 = l_faah006
#
#   IF STATUS =100 OR cl_null(l_faal003) THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'afa-00183'      #过单
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      RETURN FALSE
#   ELSE
#      LET l_year = YEAR(g_today) 
#      LET l_month = MONTH(g_today)
#      IF l_faal003 = 'Y' THEN   
#         SELECT COUNT(*) INTO l_n FROM faam_t
#           WHERE faament = g_enterprise AND faamld = g_fabg_m.fabgld
#             AND faam000 = g_fabo_d[l_ac].fabo003 AND faam001 = g_fabo_d[l_ac].fabo001 AND faam002= g_fabo_d[l_ac].fabo002
#             AND faam004 = l_year AND faam005 = l_month
#          IF l_n = 0 THEN
#             INITIALIZE g_errparam TO NULL
#             LET g_errparam.code = 'afa-00280'
#             LET g_errparam.extend = ''
#             LET g_errparam.popup = TRUE
#             CALL cl_err()
#             RETURN FALSE
#          END IF
#      END IF
#   END IF
##################################add by huangtao

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 財產編號、附號、卡片編號檢查
# Memo...........:
# Usage..........: CALL afat504_faid_chk()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      執行成功否     TRUE/FALSE
# Date & Author..: 2014/10/20 By liuym
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_faid_def()
   DEFINE l_fabo003         LIKE fabo_t.fabo003
   DEFINE l_sql             STRING
   DEFINE l_faah015         LIKE faah_t.faah015

   LET l_sql = " SELECT faaj037, faaj002, faaj001 FROM faaj_t WHERE faajent = '",g_enterprise,"'",
               "   AND NOT EXISTS (SELECT fabo003 FROM fabo_t WHERE faboent = '",g_enterprise,"'",
               "   AND fabodocno = '",g_fabg_m.fabgdocno,"'                                     ",
               "   AND fabo001 = faaj001                                                        ",
               "   AND fabo002 = faaj002                                                        ",
               "   AND fabo003 = faaj037)                                                       ",
               "   AND faaj001 = '",g_fabo_d[l_ac].fabo001,"'                                   ",
               "   AND faaj002 = '",g_fabo_d[l_ac].fabo002,"'                                   "
   PREPARE afat504_pb5 FROM l_sql
   DECLARE afat504_cs5 CURSOR FOR afat504_pb5 

      FOREACH afat504_cs5 INTO l_fabo003
         SELECT faah015 INTO l_faah015 FROM faah_t
          WHERE faahent = g_enterprise
            AND faah003 = g_fabo_d[l_ac].fabo001
            AND faah004 = g_fabo_d[l_ac].fabo002 
            AND faah001 = l_fabo003
         #財產狀態不可為0：取得、5：出售、6：銷賬、10：被資本化
         IF l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10' OR l_faah015 = '8' THEN
            CONTINUE FOREACH
         ELSE
            LET g_fabo_d[l_ac].fabo003 = l_fabo003
            EXIT FOREACH
         END IF 
      END FOREACH

END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL change_to_sql(p_wc)
# Input parameter:  
# Date & Author..:2014/11/11 By 01531
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_change_to_sql(p_wc)
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
   LET r_wc = "'",l_str,"'"

   RETURN r_wc

END FUNCTION

################################################################################
# Descriptions...: 取得固资未处置数量
# Memo...........: #180111-00043#12
# Usage..........: CALL afat504_get_faah018()
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_get_faah018()
DEFINE l_faaj033    LIKE faaj_t.faaj033
DEFINE l_faah018    LIKE faah_t.faah018
   
   SELECT faah018 INTO l_faah018
     FROM faah_t
    WHERE faahent=g_enterprise AND faah001=g_fabo_d[l_ac].fabo003
      AND faah003=g_fabo_d[l_ac].fabo001 AND faah004=g_fabo_d[l_ac].fabo002
      
   SELECT faaj033 INTO  l_faaj033
     FROM faaj_t
    WHERE faajent=g_enterprise AND faajld=g_fabg_m.fabgld
      AND faaj001=g_fabo_d[l_ac].fabo001 AND faaj002=g_fabo_d[l_ac].fabo002
      AND faaj037=g_fabo_d[l_ac].fabo003
   
   IF cl_null(l_faaj033) THEN LET l_faaj033=0 END IF   #已出售數量
   IF cl_null(l_faah018) THEN LET l_faah018=0 END IF   #總數量
   
   #數量=總數量 - 已出售數量
   LET g_faah018 =l_faah018-l_faaj033
END FUNCTION

################################################################################
# Descriptions...: 更新单身币种汇率并重新计算本币金额
# Memo...........:
# Usage..........: CALL afat504_rate_upd()
# Date & Author..: #170112-00040#1 20170811 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_rate_upd()
DEFINE l_i          LIKE type_t.num10
DEFINE l_ooef016    LIKE ooef_t.ooef016
  FOR l_i=1 TO g_fabo_d.getLength()
     LET g_fabo_d[l_i].fabo010 = g_fabg_m.fabg015 #币种
     LET g_fabo_d[l_i].fabo011 = g_fabg_m.fabg016 #汇率
     LET g_fabo_d[l_i].fabo015 = g_fabo_d[l_i].fabo012 * g_fabo_d[l_i].fabo011
     LET g_fabo_d[l_i].fabo016 = g_fabo_d[l_i].fabo013 * g_fabo_d[l_i].fabo011
     LET g_fabo_d[l_i].fabo017 = g_fabo_d[l_i].fabo014 * g_fabo_d[l_i].fabo011
      
     #若傳入帳別，表示是由財務端再引用元件，因此 應該以財務端的帳套本幣為取用基準
     IF NOT cl_null( g_fabg_m.fabgld) THEN             
        SELECT glaa001 INTO l_ooef016 FROM glaa_t WHERE glaald = g_fabg_m.fabgld AND glaaent = g_enterprise   
     END IF
     LET g_fabo_d[l_i].fabo012 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo012,2)
     LET g_fabo_d[l_i].fabo013 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo013,2)
     LET g_fabo_d[l_i].fabo014 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo014,2)
     LET g_fabo_d[l_i].fabo015 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo015,2)
     LET g_fabo_d[l_i].fabo016 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo016,2)
     LET g_fabo_d[l_i].fabo017 = s_curr_round(g_fabg_m.fabgcomp,l_ooef016,g_fabo_d[l_i].fabo017,2)                     
    
     CALL afat504_get_faah018()   #201028-00078#1 add 
     
     #處置相關金額
     LET l_ac = l_i
     CALL afat504_get_amt(g_faah018,g_fabo_d[l_i].fabo007)
     LET g_fabo_d_t.fabo010 = g_fabo_d[l_i].fabo010 
     LET g_fabo_d_t.fabo011 = g_fabo_d[l_i].fabo011      
     
     CALL s_transaction_begin()
     #將遮罩欄位還原
     CALL afat504_fabo_t_mask_restore('restore_mask_o')
      
     UPDATE fabo_t SET (fabold,fabodocno,faboseq,fabo001,fabo002,fabo003,fabo000,fabo008,fabo053, 
         fabo009,fabo005,fabo007,fabo006,fabo010,fabo011,fabo012,fabo013,fabo014,fabo015,fabo016, 
         fabo017,fabo020,fabo018,fabo019,fabo021,fabo022,fabo049,fabo023,fabo025,fabo107,fabo101, 
         fabo102,fabo103,fabo104,fabo105,fabo106,fabo108,fabo109,fabo110,fabo111,fabo156,fabo150, 
         fabo151,fabo152,fabo153,fabo154,fabo155,fabo157,fabo158,fabo159,fabo160) = (g_fabg_m.fabgld, 
         g_fabg_m.fabgdocno,g_fabo_d[l_i].faboseq,g_fabo_d[l_i].fabo001,g_fabo_d[l_i].fabo002, 
         g_fabo_d[l_i].fabo003,g_fabo_d[l_i].fabo000,g_fabo_d[l_i].fabo008,g_fabo_d[l_i].fabo053, 
         g_fabo_d[l_i].fabo009,g_fabo_d[l_i].fabo005,g_fabo_d[l_i].fabo007,g_fabo_d[l_i].fabo006, 
         g_fabo_d[l_i].fabo010,g_fabo_d[l_i].fabo011,g_fabo_d[l_i].fabo012,g_fabo_d[l_i].fabo013, 
         g_fabo_d[l_i].fabo014,g_fabo_d[l_i].fabo015,g_fabo_d[l_i].fabo016,g_fabo_d[l_i].fabo017, 
         g_fabo_d[l_i].fabo020,g_fabo_d[l_i].fabo018,g_fabo_d[l_i].fabo019,g_fabo_d[l_i].fabo021, 
         g_fabo_d[l_i].fabo022,g_fabo_d[l_i].fabo049,g_fabo_d[l_i].fabo023,g_fabo_d[l_i].fabo025, 
         g_fabo4_d[l_i].fabo107,g_fabo4_d[l_i].fabo101,g_fabo4_d[l_i].fabo102,g_fabo4_d[l_i].fabo103, 
         g_fabo4_d[l_i].fabo104,g_fabo4_d[l_i].fabo105,g_fabo4_d[l_i].fabo106,g_fabo4_d[l_i].fabo108, 
         g_fabo4_d[l_i].fabo109,g_fabo4_d[l_i].fabo110,g_fabo4_d[l_i].fabo111,g_fabo4_d[l_i].fabo156, 
         g_fabo4_d[l_i].fabo150,g_fabo4_d[l_i].fabo151,g_fabo4_d[l_i].fabo152,g_fabo4_d[l_i].fabo153, 
         g_fabo4_d[l_i].fabo154,g_fabo4_d[l_i].fabo155,g_fabo4_d[l_i].fabo157,g_fabo4_d[l_i].fabo158, 
         g_fabo4_d[l_i].fabo159,g_fabo4_d[l_i].fabo160)
      WHERE faboent = g_enterprise AND fabold = g_fabg_m.fabgld 
        AND fabodocno = g_fabg_m.fabgdocno       
        AND faboseq = g_fabo_d[l_i].faboseq #項次 
                    
       IF SQLCA.sqlcode THEN #其他錯誤
          LET g_fabo_d[l_i].* = g_fabo_d_t.*  
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = "fabo_t:",SQLERRMESSAGE 
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = TRUE 
          CALL s_transaction_end('N','0')
          CALL cl_err() 
       END IF 
       
   END FOR
   CALL afat504_set_entry_b("")
   CALL afat504_set_no_entry_b("") 
   CALL afat504_show()   
END FUNCTION

################################################################################
# Descriptions...: 更新单身栏位值 
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/12/25 By 09232
# Modify.........:
################################################################################
PRIVATE FUNCTION afat504_update_detail_sum()
   DEFINE l_fabo RECORD
      fabold    LIKE fabo_t.fabold,
      fabodocno LIKE fabo_t.fabodocno,
      faboseq   LIKE fabo_t.faboseq,
      fabo001   LIKE fabo_t.fabo001,
      fabo002   LIKE fabo_t.fabo002,
      fabo003   LIKE fabo_t.fabo003,
      fabo007   LIKE fabo_t.fabo007
   END RECORD 
   DEFINE l_faah018 LIKE faah_t.faah018
   
   
   CALL s_transaction_begin()
        
   LET g_sql=" SELECT fabold,fabodocno,faboseq,fabo001,fabo002,fabo003,fabo007 ",
             "   FROM fabo_t ",
             "  WHERE faboent=? AND fabold=? AND fabodocno=? ORDER BY faboseq "
   PREPARE afat504_sel_detail_sum FROM g_sql
   DECLARE afat504_cur_detail_sum CURSOR WITH HOLD FOR afat504_sel_detail_sum
   LET l_ac=1
   FOREACH afat504_cur_detail_sum USING g_enterprise,g_fabg_m.fabgld,g_fabg_m.fabgdocno INTO l_fabo.*
      IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
      END IF
      
      #获取出售数量
      CALL afat504_get_faah018()
       
       CALL afat504_get_amt(g_faah018,l_fabo.fabo007)
       #更新栏位值
       UPDATE fabo_t SET (fabo019,fabo049)=(g_fabo_d[l_ac].fabo019,g_fabo_d[l_ac].fabo049)
        WHERE faboent=g_enterprise AND fabold=l_fabo.fabold AND fabodocno=l_fabo.fabodocno AND faboseq=l_fabo.faboseq
        IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "update:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE        
            LET g_success=FALSE
            CALL cl_err()
            EXIT FOREACH
       END IF
       
       LET l_ac=l_ac+1
   END FOREACH 
   IF g_success= TRUE THEN
      CALL s_transaction_end('Y','')
   ELSE
      CALL s_transaction_end('N','')
   END IF
END FUNCTION

################################################################################
# Descriptions...: 财产获取日期检核
# Memo...........:
# Usage..........: CALL afat504_fabh014_chk(p_fabo001,p_fabo002,p_fabo003)
#                  RETURNING r_success
# Input parameter: p_fabd001      财产编号
#                : p_fabd002      附号
#                : p_fabd003      卡片编号
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2018/06/20 By 09773
# Modify.........: #180613-00008#3 add
################################################################################
PRIVATE FUNCTION afat504_fabh014_chk(p_fabo001,p_fabo002,p_fabo003)
DEFINE  p_fabo001     LIKE fabo_t.fabo001
DEFINE  p_fabo002     LIKE fabo_t.fabo002
DEFINE  p_fabo003     LIKE fabo_t.fabo003
DEFINE  l_n            LIKE type_t.num5
DEFINE  r_success      LIKE type_t.num5

   LET r_success = TRUE
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM fabo_t
     LEFT JOIN faah_t ON faahent = faboent AND faah003 = fabo001 AND faah004 = fabo002 AND faah001 = fabo003
    WHERE faboent = g_enterprise
      AND fabo001 = p_fabo001
      AND fabo002 = p_fabo002
      AND fabo003 = p_fabo003
      AND faahstus = 'Y'
      AND faah014 <= g_fabg_m.fabg004
      AND faah014 <= g_fabg_m.fabgdocdt
      
   IF l_n = 0 THEN 
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
