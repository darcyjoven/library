#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="s_asft335.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0169(1900-01-01 00:00:00), PR版次:0169(2021-06-02 17:36:56)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000744
#+ Filename...: s_asft335
#+ Description: 報工單元件
#+ Creator....: 00537(2013-12-11 13:28:44)
#+ Modifier...: 00000 -SD/PR- 00272
 
{</section>}
 
{<section id="s_asft335.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#151110-00002#2  2015/11/17 BY fionchen 1.增加function,提供報工時若該工單+Rucnard+作業編號+製程序需PQC,則需控管良品數量不可大於PQC合格數量-已報工良品量
#                                       2.調整s_asft335_set_qty,報工時,若需PQC時,待處理數量應為PQC檢驗合格量
#160129-00002#7  2016/03/03 By Jessica  此資料來源為MES抛轉，不可取消確認！
#160328-00029#3  2016/04/01 By Jessy    將重複內容的錯誤訊息置換為公用錯誤訊息
#160730-00003#1  2016/07/30 By zhangllc 修正批次報工報工順序如不照工單製程相同順序打，報工結果回寫工單製程資料的在製數量、良品轉入會錯誤
#160801-00021#1  2016/08/01 By dorislai 接續 #160730-00003#1 ，此單先修正了順序
#                                       接著 修正asft330按確認後，asft301再製量、良品轉入量，錯誤的問題。(問題點：SQL抓取資料，WHERE狀態碼)
#                                            修正asft330取消確認，asft301再製量、良品轉入量，錯誤的問題。(問題點：取消確認，應該從後面的站倒著算回來)
#160804-00029#1  2016/08/04 By dorislai D-MFG-0045(允許報工)='Y，良品數量+報廢數量+當站下線+回收數量不可大於(標準產出-已轉量)
#160920-00024#1  2016/09/26 By Sarah    asf-00754的檢查SQL漏過濾作業序條件,導致同一工單編號+RunCard+作業編號+不同作業序的報工單無法確認
#161103-00007#1  2016/11/03 By shiun    调整PQC与报工的顺序，目前系统是先PQC再报工，要调整为先报工再PQC
#                                       1、目前有勾选PQC的制程站，asft335报工时会检查该站PQC合格量，合格多少才可报工多少，这个逻辑拿掉
#                                       2、asft335报工类别为3.报工时，单据审核回写asft301的逻辑要增加（类似checkout、moveout的写法）
#                                         a.如果asft301对应制程站PQC有勾选，应将本次报工数量追加到待PQC数量；取消审核时恢复待PQC数量
#                                         b.单据取消审核时需先检查此报工单是否有对应的PQC检验单（aqct300），若有则不可取消审核
#161114-00018#1  2016/11/14 By liuym    报工单取消审核的时候判断如果是最后一站，要控管取消审核后的报工数量不可小于工单完工入库数量
#160826-00025#1  2016/11/18 By dorislai 新增FUNCTION：「產生完工入庫單」、「最後一站的最後一個報工點」
#161109-00085#55 2016/11/18 By lienjunqi   整批調整系統星號寫法
#161212-00048#1  2016/12/09 By 04441    单号160826-00025增加的功能进行调整
#161212-00020#1  2016/12/09 By 04441    取消审核检查[單據日期]和[完成日期]是否小于等于关账日期
#161212-00033#1  2016/12/14 By 04441    工單結案其他相關單據不可以異動
#161214-00011#1  2016/12/15 By liuym    抛转到asft337的单据必须是未审核状态，报工单asft335才能取消审核
#161215-00047#1  2016/12/15 By 04441    調用s_asft335_sffbtmp前先清空
#161215-00055#1  2016/12/19 By 04441    狀態碼變更使用彙總訊息
#161230-00005#1  2016/12/30 By Sarah    修正160920-00024寫錯的欄位代號
#170106-00022#1  2017/01/06 By 04441    取消#160512-00034
#170109-00024#1  2017/01/09 By shiun    修正asft335確認時報錯"EXECUTE s_asft335_ins_sfcb_next"找不到游标或叙述
#170112-00049#1  2017/01/12 By 04441    修正報工超交之後，在製數量為負情況
#170110-00056#1  2017/01/17 By PQC下站未设置报工点，PQC单审核时仍回写到下站转入数量，应调用报工单写入下站的逻辑（s_asft335_upd_next_station）
#170117-00038#1  2017/01/18 By 04441    報工的可超交率判斷s_asft335_chk_qty()
#170120-00043#1  2017/01/23 By 04441    s_asft335_chk_qty()增加傳入參數報工類別
#170210-00017#3  2017/02/10 by 06814    修正SQL語句沒有ENT條件
#170213-00031#1  2017/02/15 By shiun    修正報工數量對應處理數量抓取問題
#170213-00027#1  2017/02/15 By shiun    修正重工報工回寫錯誤
#170210-00014#1  2017/02/21 By shiun    修正回收站回收轉入及在制量問題
#170224-00011#1  2017/02/24 By shiun    修正當前站已有超交情況，當站報工會超過原工單超交情形
#170209-00041#1  2017/02/24 By shiun    修正s_asft335_del_sfha()
#                                       1.SELECT COUNT(1) FROM sfha_t的條件sfhastus<>'N'調整為sfhastus NOT IN ('N','X')
#                                       2.DELETE FROM sfha_t的條件增加sfhastus='N'
#                                       3.除了刪除sfha_t也要刪除對應的sfhb_t、sfhc_t
#170215-00051#1  2017/03/03 By 04441    判斷製程報工做PQC不回寫下站，要增加判斷本次報工為報工站
#170306-00002#1  2017/03/06 By shiun    判斷如果報工後超過剩餘在制量但未超過超交率時，在制量為0
#170228-00022#1  2017/03/08 By shiun    修改自動產生完工入庫單，sfeb002預設錯誤問題
#170309-00043#1  2017/03/13 By shiun    修正若允許事後報工時，若跨站報工時，在制異常問題
#161031-00014#1  2017/03/16 By xujing   产生倒扣领料单逻辑
#170322-00016#1  2017/03/25 By wuxja    1.制程设置有勾选了PQC，本站move in、check in、check out、move out无法向下流转
#                                       2.设置了move in，check in，报工，PQC，check out，move out。发料后，写入了待move in数和良品转入数，但是还没有做move in动作，去做asft335报工的也能报了，应该要按照上面的顺序进行流转。
#                                       3.做一张check out报工单，数量为0，审核后制程待check out数量变成有值
#170405-00004#1  2017/04/06 By wuxja    报工设定转入转出比例，标准产出量与可报工数量不对问题调整
#170410-00029#1  2017/04/19 By 04441    s_asft335_set_sfeb008()回傳0導致無法產生完工入庫單
#170420-00028#1  2017/04/21 By 04441    修正161104-00032 sql -217
#170421-00073#1  2017/04/21 By xujing   单身数量不可超过单头的良品+报废加下线数量
#170420-00018#1  2017/04/24 By xujing   增加回写工单单头报废数量,下线数量,考虑平行工艺
#170419-00052#1  2017/04/26 By xujing   取上一站报工时间,取最小日期
#170507-00012#1  2017/05/12 By liuym    添加管控，报工日期不可小于工单开立日期
#170515-00084#1  2017/05/15 By liuym    调整170507-00012修改内容，批次报工和单笔式报工使用的日期栏位不一样，会导致批次报工正常管控，单笔式报工卡死的情况
#170517-00009#1  2017/05/17 By xujing   产生完工入库单获取入库数量的时候,考虑超交率,所以传入参数'1'改为'2'
#170517-00007#1  2017/05/18 By 04441    增加單別參數D-MFG-0092
#170523-00038#1  2017/05/24 By xujing   1.自动产生完工入库单的时候,如果料件不使用参考单位则不预设
#                                       2.工单参数完工入库检查报工数='Y' 需检查报工最后一站数量取消审核以后是否足够入库数量
#170524-00031#1  2017/05/24 By xujing   输入数量判断不可大于工单生产数量*超交率
#170617-00355#1  2017/06/19 By fionchen 取消確認撿核報工單是否已有PQC單時,不需串參考單號
#170618-00349#1  2017/06/19 By fionchen 調整更新原重工转出制程段,判斷是否為最後一報工站的邏輯
#170621-00025#1  2017/06/22 By liuym    报工单在判断报工数与完工数关系时只考虑了本站转出量，未考虑本站已报工单尚未转出量（待move in、待check in等）
#170618-00096#1  2017/06/26 By lixh     拿掉"asf-00014"错误信息
#170618-00375#1  2017/06/28 By xujing   取PQC数量把qcba027改为qcba023,并且考虑单位转换
#170617-00274#1  2017/07/04 By lixh     在制量的计算需要扣除工单+当前RUNCARD的在制量，不需要考虑工单其他RUNCARD在制量
#170618-00518#1  2017/07/10 By lixh     报工数量控管没有考虑替代群组,替代群組首站SUM報工數量不可大於 標準產出*(1+生產超交率/100)
#170527-00031#1  2017/07/12 By fionchen 調整170210-00014,回收數也要写入到在制数
#170713-00049#1  2017/07/14 By 04441    單據日期或是完工日期小於過帳日期則控卡該單據不允許做確認或是取消確認
#170524-00070#1  2017/07/17 By fionchen 調整平行製程重工報工更新重出轉入時數量會重複的問題
#170712-00022#1  2017/07/20 By chenssz  SQL调整
#170718-00078#1  2017/07/25 By liuym    调整批量报工切换上一笔后取消审核回写制程档异常
#170228-00018#1  2017/08/04 By fionchen 調整170213-00031,扣除本身在製量應該是重工RUN CARD報工時才執行
#170228-00018#2  2017/08/09 By zhujing  调整170618-00375,当g_prog是aqct300时，资料还在未审核状态。故加上g_prog的判断
#170804-00054#1  2017/08/21 By fionchen 可事後報工時,若本站先報工時,在製量會更新為負數,再上站報工後,將上站報工取消確認,本站在製量不會還原為原有的負在製量
#170712-00013#1  2017/08/22 By fionchen 調整替代製程報工時,確認與取消確認在製量更新錯誤問題
#170618-00156#1  2017/08/30 By zhujing  报工单日期不可小于工单日期
#170919-00020#1  2017/09/19 By 05423    #170804-00054#1修改处增加判断，若g_prog为aqct300，则走原先的逻辑。
#170920-00052#1  2017/09/27 By 07423    1.修正当站已全部报工，PQC转回当站在制的量不能重新报工問題
#                                       2.調整當PQC當站轉回量,再次報工時,轉入下站數量錯誤問題
#170928-00041#1  2017/10/17 By 07423    允许事后报工=Y，pqc下一个报工点为check out,pqc取消审核在制量有誤的問題
#171030-00006#1  2017/10/30 By 08525    报工单作废时，对应的下线单从直接删除调整为作废
#171108-00027#1  2017/11/09 By 08525    修改s_asft335_upd_sfha，导致asft330修改下线数量报资料重复
#171113-00002#1  2017/11/13 By 05423    增加BPM签核相关逻辑
#                                       1.s_asft335_conf()，裡面做了檢核和审核的工作，應拆分成檢核段s_asft335_conf_chk()及审核段s_asft335_conf_upd()，然後s_asft335_ws_confirm()中應分別呼叫這二個function
#                                       2.BPM审核回寫ERP時，call s_asft335_ws_confirm() 自動审核報錯 "afa-00024 狀態不是未审核"。這裡原本只允許狀態N才能审核，應該狀態A也要能审核 
#                                       3.审核段有用到temp table，但BPM回寫是背景作業沒有先建立temp table，報錯 "sffbtmp(s_asft335_sffbtmp 指定的表格不在資料庫中.)"。請新增二個function: s_asft335_ws_preprocess()、s_asft335_ws_postprocess() 在裡面create, drop temp table。
#171114-00033#1  2017/11/15 By 08525    若报工单取消审核时，下线单也有可能是作废状态，导致无法取消审核。
#171120-00009#1  2017/11/20 By 07491    在ERP確認時原本有控卡單據狀態N才能確認，調整成狀態A(BPM簽核用到)也允許確認
#170921-00006#1  2017/11/15 By 10046    若工單的作業編號、作業序不為空,取工單備料倒扣料資料時,增加過濾作業編號、作業序條件
#171208-00039#1  2017/12/11 By 04441    檢查报工数量是否小于完工入库数量增加項次條件
#170512-00039#1  2017/12/19 By 01534    报工单最终站审核自动产生工单完工入库单，取消审核时应自动作废已产生的完工入库单
#180327-00060#1  2018/03/28 By 04441    允許報工數要考慮上站報廢和當站下線數量
#180427-00045#1  2018/04/28 By 06021    asft337过账产生asft335时,以及过账还原时不应该更新在制量
#180502-00020#1  2018/05/03 By 07423    處理审核和取消审核的时候会报错多余的截取单据别为空的错误讯息 
#180111-00043#57 2018/06/26 by 09773    维护方法说明
#180716-00017#1  2018/07/16 By 10130    入庫批號自動編碼產生(料件批號須有批號且自動編碼而批號為空就自動編碼)
#180403-00003#2  2018/07/17 By 01366    asft337增加D-MFG-0080參數後，asft337過帳還原走到asft335取消確認段會取到asft337的參數導致asft335無法取消確認
#180716-00043#1  2018/08/06 By 10046    更改計算邏輯:倒扣領料單的領料數量=報工數量/工單開單數量*總應發量；
#                                       如果是最後一張報工單，領料數量=總應發量-已發量
#180427-00032#1  2018/08/07 By 10046    取得PQC轉回當站量的計算，應把判定區分為5:PQC破壞性檢驗下線的資料納入
#180726-00026#1  2018/08/16 By 02111    改抓 sfaa061 判斷是否製程。
#180817-00009#2  2018/08/17 By 10046    確認段及過帳段移到主程式處理
#180831-00001#1  2018/08/31 By 01534    s_asft335_ins_sfha()变量g_sfhadocno没有初始化，造成asft335/asft300输入当战下线数量，产生asft337资料之后，然后删除当笔资料（asft337没有删除，而是作废），
#.......................................然后重新输入资料，再次维护当站资料再次产生asft337,单号g_sfhadocno还是原来的单号，單號没有重新编码報錯資料重複
#180910-00080#1  2018/9/12  By 07804    修正報工單報工量、報廢數量都是取轉出單位數量，因此換算成生產單位要用除上當站轉出分/轉出分母
#180801-00034#1  2018/09/17 By 07423    1.若為事後報工時,檢查報工數量要多考慮标准产出量用生产数量-已入库数量计算
#.......................................2.還原#180427-00032#1調整
#180907-00053#1  2018/09/21 By 07423    新增工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
#181008-00005#1  2018/10/12 By 07423    調整倒扣料在判斷報工總數量是否大餘生產數量,計算總報工數時,應只判斷該工單該作業編號作業序的所有報工數
#181009-00068#1  2018/10/17 By 07423    調整批次報工,有相同工單作業編號作業序資料時,取消確認後,製程移轉量更新錯誤
#180904-00078#1  2018/09/21 By 02111    拆件工單因為入庫數量不受控卡以及不會回寫工單單頭，所以取消確認不檢查數量。
#181026-00002#1  2018/10/26 By 07423    是否全倒扣料的判斷需排除參考材料
#181031-00068#1  2018/11/02 By 07804    修正判斷邏輯:若第一次報工量超過在制量，第二次報工量等於在制量，應屬於同一個計算方式
#181112-00037#1  2018/11/13 By 07804    調整asf-00934報工審核時管控邏輯
#181203-00048#1  2018/12/04 By 02295    取替代制程逻辑里面,需要抓取公用总数量的字段做扣除,应将在制数量也算在内
#181210-00009#1  2018/12/18 By 07423    修正取替代製程報工後,製程移轉量更新錯誤問題
#181120-00037#1  2018/12/24 By 07423    修正重工最後一站轉入後,若最後站是替代製程,在製量只更新當下報工站
#190123-00063#1  2019/01/29 By 07423    修正報工單取消確認時,若最終製程報工站為PQC時,會出現'asf-00809'錯誤問題
#190228-00027#1  2019/03/04 By 10983    修正报工单取消审核时，若临时表项次重排之后与实体表不一致，无法取消的问题。
#180917-00042#1  2019/03/11 By 01366    當站下線數量，在取得PQC轉回當站量的地方，原本只抓6:轉回當站在製，增加5:PQC破壞性檢驗下線
#                                       此單還原180801-00034#1做了還原#180427-00032#1的調整
#190215-00009#1  2019/03/11 By 02159    調整報工s_asft335_upd_sfcb()中在製數邏輯修正，當RUN CARD編號=0時需做分子分母計算,否則不需要轉換
#190422-00047#1  2019/04/22 By 02111    製程委外數量 SQL 條件要到 作業編號+作業序，避免抓到其他站的數量。
#190429-00028#1  2019/04/30 By 02111    排除已完工數量入庫類型非 1:一般 的數量。
#190513-00010#1  2019/05/14 By 02111    調整 180327-00060#1  asft336 報廢數量控卡只考慮當站數量計算。
#190515-00002#1  2019/05/15 By 02111    允許事後報工 把其他站的報廢數量也納入計算造成錯誤。
#190520-00018#1  2019/05/20 By 02111    還原 190515-00002、190513-00010 調整。
#190520-00046#1  2019/05/28 By 02111    工單單別參數 允許事後報工設置 N 也要考慮當站報廢數量不可以超過剩餘可入庫量。
#190529-00017#1  2019/05/30 By 02111    修正剩餘可以報廢的數量沒有扣除其他報廢的數量。
#190531-00016#1  2019/05/31 By 02111    asft330 報廢數量重複計算。
#190620-00051#1  2019/07/02 By 10046    修正允許事後報工(D-MFG-0045=Y)，在製量計算錯誤的問題。已報廢、已下線數量應加總本站(含)之前的數量
#190709-00006#1  2019/07/10 By 07423    修正當有平行製程時,回寫工單單頭sfaa055(下線量),sfaa056(報廢量)數量錯誤問題
#190806-00055#1  2019/08/07 By 07423    修正報工時,當下個報工站有重工轉出與重工轉入時,下個報工站的在制量更新錯誤問題
#190801-00003#1  2019/08/29 By 07423    自動產生倒扣領料備料時,過濾掉參考材料
#171129-00035#2  2019/08/19 By 07423    1.增加单别参数‘可报工数只考虑良品数’，适用于有报废后可同工单补料继续生产
#                                       2.修正若製程中有報廢數量時,報工會出現錯誤訊息問題
#                                       3.計算工單下線量與報廢量的部份,增加考慮替代製程
#190702-00010#14 2019/09/03 By 10042    PQC確認後與取消確認前因應sQMS所做的調整
#190916-00003#1  2019/09/16 By 07423    修正#171129-00035#2報工時,沒考慮超交率問題
#190920-00019#1  2019/09/24 By 00272    非製程工單,在asft336 報廢後,回寫的sfaa056報廢數量異常情况。
#190924-00035#2  2019/09/25 By 07556    sQMS整合測試問題調整
#190917-00002#1  2019/09/24 By 00272    製程工單,使用製程替代群組,流程A,一個作業(末站PQC),流程B,二個作業(末站PQC),
#                                       asft335 報工[確認]後,寫入的在製數(sfcb050),待PQC數(sfcb051)錯誤,[取消確認]亦會錯誤
#190724-00015#1  2019/10/08 By 05423    修正取消审核后，完工入库单号未清空的问题   
#191030-00006#1  2019/11/01 By 00272    製程工單,未走群組替代,asft336 報廢後,更新回asft300的sfaa056 報廢量不正確,導致後續asft301在製量,良品轉入異常
#191107-00026#1  2019/11/07 By 00272    (1)#191030-00006#1 不能用未群組替代來判斷,是要用該張工單是否走平行製程來判斷
#                                       (2)參數設報工數只考慮良品數(D-MFG-0105='Y')時,
#                                          有做發料=>asft339報廢=>asft312單顆超領=>asft336當站報廢
#                                          後續再做asft330 or asft335報工時,預帶的良品數量錯誤
#190927-00022#1  2019/11/11 By 00272    製程三站,走PQC,報工含可能含有PQC 6:轉回當站在製,再重新報工的量,
#                                       導致報工確認後在製數(sfcb050),良品轉入(sfcb028)錯誤,[取消確認]亦會錯誤
#191111-00013#1  2019/11/13 By 00593    D-MFG-0045(允許事後報工)=N時,asft330單身對同工單、同作業編號多次報工沒有控卡asf-00010(良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於良品轉入數量%5)
#191125-00048#1  2019/11/27 By 00272    (1)#191107-00026#1 工單若有拆RUNCARD asft336 報廢回寫的工單頭報廢數量(sfaa056)錯誤
#                                       (2)QC測試問題調整(#191111-00013#1 影響),事後報工:N,單純的asft335 線性報工,分二次,第二次報工[確認]不了,出現asf-00010
#191129-00041#1  2019/12/03 By 00272    asft335生產料件有設定生產超交率imae020且允許事後報工,在製量sfcb050回寫錯誤
#191202-00028#1  2019/12/04 By 00272    apmt571委外入庫[過帳],出現asf-0010 異常
#                                       情境是在:若參數D-MFG-0045=N,不允許事後報工,依順序報工,委外站轉入的量 < 委外加工量(sfcb041) 時
#191128-00064#1  2019/12/11 By 00272    [生成完工入庫單] 當下的日期 < 報工單的單據日期(sffbdocdt)時,產生入庫單的單據日期,都用報工單的單據日期
#200106-00022#1  2019/01/10 By 00272    不允許事後報工,依順序報工,已有委外加工數sfcb041,就應將此量先做apmt571委外完工入庫,不應先做asft335廠內報工,導致後續委外加工數無法做apmt571委外完工入庫[過帳]
#200116-00010#1  2019/01/16 By 01996    默认带出良品数量时,当工单允许事后报工,计算良品数量 不要加上在制量
#191231-00011#1  2020/02/03 By 00272    #170524-00031#1 原 asf-00870 的控卡應拿掉,改用 s_asft335_chk_qty(),否則將導致製程轉出/轉入單位和生產單位不一致時,良品數量計算錯誤,而被控卡住了
#180724-00011#1  2020/03/10 By 00593    報工單確認後自動產生的入庫單，當入庫類型為多產出時，帶出的數量應該要依據多產出的比例來計算
#200326-00028#1  2020/03/30 By 02295    传参错误,应传工单单号+RUNCARD
#181120-00025#1  2020/04/17 By 12427    报工单删除时，对应的下线单也应直接删除
#200422-00203#1  2020/04/23 By 10983    若存在未审核和送签的工艺变更单则报工单不允许取消审核。
#191108-00034#1  2020/04/30 By 12290    平行工艺在asft330批次报工，在制量回写错误
#190813-00015#1  2020/05/07 By 11515    修正：工单单别工艺委外数量=2：依当站转入量时，下一站标准产出量错误
#200505-00012#1  2020/05/12 By 10983    调整创建s_asft335_sffbtmp的写法。
#200319-00035#1  2020/05/15 By 00272    一個工藝（B）的上階有多個平行工藝（A1...An），並且其中至少有一個不走PQC時，
#                                       先將不走PQC的工藝報工完畢，再對走PQC的工藝進行報工和PQC,
#                                       aqct300(PQC)[確認]後回寫的在製數和良品轉入數錯誤,[取消確認]亦一併考量
#200615-00010#1  2020/06/15 By 00272    #180716-00017#1 增加的SQL條件錯誤,導致工單若有做變更,變更版本(sfaa001)<>0,asft335 報工確認自動產生入庫單時,入庫料號批號要自動編碼,卻沒有產生
#200605-00064#1  2020/06/22 By 13589    子查询回传多笔资料问题调整
#200708-00073#1  2020/07/08 By 00272    產生當站倒扣領料單時，加控卡當總應發量皆發滿就不產生單據
#200715-00062#1  2020/07/17 By 08734    修正做完asft336，asft337，asft339后再打asft335报工单时，输入工单带出良品数量错误问题
#200827-00049#1  2020/08/27 By 12133    OPENDB問題，s_asft335_tmp04 數字欄位單引號改為0
#201021-00059#1  2020/10/22 By 13132    修正36p运行时log档报错问题
#201109-00025#1  2020/11/09 By 10167    回追PGS內容
#201127-00013#1  2020/12/01 By 00272    asft335報工時,製程替代群組且替代群組內有做Checn in 時,在製量(sfcb050)和待Check in數(sfcb047) 回寫錯誤
#                                       [確認/取消確認]皆需check OK
#201202-00011#1  2020/12/08 By 00272    s_asft335_chk_qty() 參數增加popup(彈出錯誤訊息視窗否),以應用在呼叫s_asft335_chk_qty()時,可以僅做資料正確性的檢查,而不彈窗.
#                                       後續是否彈窗,依傳入的變數popup來決定,當無傳入popup時,讓popup為TRUE
#201229-00031#1  2020/12/30 By 00272    asft330批次報工時:"同一筆工單+Run Card+作業編號+作業序"在同一張報工單分兩個項次報工[確認]時,未控卡住asf-00010,應要卡住
#210105-00023#1  2021/01/05 By 00272    asft336 當依報工站檢查齊套數(D-MFG-0104='Y')時,報廢量超出時,改顯示asf-00937 的訊息
#201013-00010#1  2021/01/11 By 00272    非製程工單，無工作站,工單有成本中心(sfaa068)不為空時,改預帶工單的成本中心
#210330-00049#1  2021/04/15 By 00272    依報工站檢查齊套數(D-MFG-0104)設Y,允許事後報工(D-MFG-0045)設N時,前站皆未報工,卻可以報工後站
#210429-00003#1  2021/06/01 By 00272    (A)s_asft335_check_time()的檢查,判斷參數'D-MFG-0045'若不允許事後報工,照原控卡. 
#                                          若允許事後報工時,控卡:#asf-01079:報工完工日期的成本年/期(%1/%2) 已小於 前段製程報工的成本年/期(%3/%4),成本年/期需>=前段製程報工的成本年/期 !
#                                       (B)s_asft335_conf_chk()增加報工日期的控卡:
#                                         (1)報工日期不可小於工單的單據日期(sfaadocdt)
#                                         (2)報工日期不可小於=庫存關帳日期 'S-MFG-0031'
#                                         (3)報工日期不可小於=成本關帳日期 'S-FIN-6012'

#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util  #170117-00038#1
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_asft335.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#160730-00003#1 add--s
GLOBALS
DEFINE g_count         LIKE type_t.num10   #sffb批次报工单的总笔数——注意！！！此g_count就是用于判断已重排和未重排的依据，不可另作他用
DEFINE g_seq           LIKE sffb_t.sffbseq #报工单重排的项次
DEFINE g_mfg0045       LIKE type_t.chr1    #210429-00003#1 add

END GLOBALS
#160730-00003#1 add--e
#end add-point
 
{</section>}
 
{<section id="s_asft335.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
   PRIVATE type type_sfcb_next  RECORD    #用来存放审核报工当站的下一站资料 
                             chk          LIKE type_t.chr1,       #去除重复使用的，N是没去过重复的，Y是去重之后的结果
                             sfcbdocno    LIKE sfcb_t.sfcbdocno,
                             sfcb001      LIKE sfcb_t.sfcb001,
                             sfcb003      LIKE sfcb_t.sfcb003,
                             sfcb004      LIKE sfcb_t.sfcb004,
                             sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
                             sfcb006      LIKE sfcb_t.sfcb006,     #群组
                             type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
                             sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
                             sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
                             amt          LIKE sfcb_t.sfcb050,     #与上面匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
                             sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
                             sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
                             END RECORD
 
   PRIVATE type type_sfcb_prev  RECORD    #用来存放g_sfcb_next所有报工的上站资料，所存的资料计算后得出下站应该有多少数量
                             chk          LIKE type_t.chr1,   #去除重复使用的，N是没去过重复的，Y是去重之后的结果   
                             sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工单单号
                             sfcb001      LIKE sfcb_t.sfcb001,     #RunCard单号
                             sfcb003      LIKE sfcb_t.sfcb003,     #作业编号
                             sfcb004      LIKE sfcb_t.sfcb004,     #制程序
                             sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
                             sfcb006      LIKE sfcb_t.sfcb006,     #群组
                             type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
                             sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
                             sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
                             amt          LIKE sfcb_t.sfcb050,     #与上面type匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
                             sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
                             sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
                             END RECORD  
   #170420-00018#1 add(s)
   PRIVATE type type_sfcb_prev2  RECORD    #用来存放g_sfcb_next所有报工的上站资料，所存的资料计算后得出下站应该有多少数量
                             chk          LIKE type_t.chr1,   #去除重复使用的，N是没去过重复的，Y是去重之后的结果   
                             sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工单单号
                             sfcb001      LIKE sfcb_t.sfcb001,     #RunCard单号
                             sfcb003      LIKE sfcb_t.sfcb003,     #作业编号
                             sfcb004      LIKE sfcb_t.sfcb004,     #制程序
                             sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
                             sfcb006      LIKE sfcb_t.sfcb006,     #群组
                             type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
                             sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
                             sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
                             amt1         LIKE sfcb_t.sfcb050,     #与上面type匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
                             amt2         LIKE sfcb_t.sfcb050,       
                             sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
                             sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
                             END RECORD  
   #170420-00018#1 add(e)

      DEFINE g_sfcb_next          DYNAMIC ARRAY OF type_sfcb_next 
      DEFINE g_s_prevprev         DYNAMIC ARRAY OF type_sfcb_prev 
      DEFINE g_sel_sfcb_next_sql  STRING                           #存s_asft335_get_next_station递归时cursor的sql  
      DEFINE g_sel_sfcb_prev_sql  STRING                           #存s_asft335_get_prev_station递归时cursor的sql
      #170420-00018#1 add(s)
      DEFINE g_sel_sfcb_prev_sql2 STRING                           
      #170420-00018#1 add(e)
      DEFINE g_sel_sfcb_prev_sql3 STRING                           #170524-00070#1 add
      DEFINE g_doc_slip           LIKE sfaa_t.sfaadocno
      DEFINE g_sfhadocno          LIKE sfha_t.sfhadocno            #160511-00020#1
      DEFINE g_sffadocno          LIKE sffa_t.sffadocno            #160801-00021#1-add
      DEFINE g_sffbseq            LIKE sffb_t.sffbseq              #160804-00029#1-add
      DEFINE g_sffbdocno          LIKE sffb_t.sffbdocno            #170524-00070#1 add
      DEFINE g_sffbseq1           LIKE sffb_t.sffbseq              #170524-00070#1 add
#170117-00038#1-s
PRIVATE TYPE type_sffb_parameter RECORD
    sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
    sffbseq    LIKE sffb_t.sffbseq,    #項次
    sffb001    LIKE sffb_t.sffb001,    #報工類別  #170120-00043#1
    sffb005    LIKE sffb_t.sffb005,    #工單單號
    sffb006    LIKE sffb_t.sffb006,    #Run Card
    sffb007    LIKE sffb_t.sffb007,    #作業編號
    sffb008    LIKE sffb_t.sffb008,    #製程式
    sffb017    LIKE sffb_t.sffb017,    #良品數量
    sffb018    LIKE sffb_t.sffb018,    #報廢數量
    sffb019    LIKE sffb_t.sffb019,    #當站下線數量
    sffb020    LIKE sffb_t.sffb020     #回收數量
   ,popup      LIKE type_t.num5        #彈出錯誤訊息視窗否 #201202-00011#1
                END RECORD
#170117-00038#1-e
#end add-point
 
{</section>}
 
{<section id="s_asft335.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_asft335.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 定义寻找下一站和上一站等cursor
# Memo...........:
# Usage..........: CALL s_asft335_declare_sfcb()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/14 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_declare_sfcb()
   DEFINE l_sql    STRING
   DEFINE l_sql1   STRING
   DEFINE l_sql2   STRING
   DEFINE l_sql3   STRING
   DEFINE l_sql4   STRING
   DEFINE l_sql5   STRING

   WHENEVER ERROR CONTINUE
   LET l_sql = " INSERT INTO s_asft335_tmp01 "
   
   LET l_sql1= " SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,",
               "        CASE WHEN sfcb014 ='Y' THEN 1 WHEN sfcb015 ='Y' THEN 2 WHEN sfcb016 ='Y' THEN 3 WHEN sfcb018 ='Y' THEN 4 WHEN sfcb019 ='Y' THEN 5 ELSE 0 END,",
               "        sfcb021,sfcb022,0,sfcb053,sfcb054 ",      
               "   FROM sfcb_t,sfcc_t ",
               "  WHERE sfcbent   = ",g_enterprise,
               "    AND sfcbsite  = '",g_site CLIPPED,"'",
               "    AND sfcbdocno = sfccdocno ",
               "    AND sfcb001   = sfcc001 ",
               "    AND sfcb002   = sfcc002 ",
#              "    AND sfccent   = sfccent",      #170712-00022#1 mark 
#              "    AND sfccsite  = sfccsite",     #170712-00022#1 mark 
               "    AND sfcbent   = sfccent",      #170712-00022#1 modify
               "    AND sfcbsite  = sfccsite",     #170712-00022#1 modify
               "    AND sfccdocno = ? ",
               "    AND sfcc001   = ? ",
               "    AND sfcc003   = ? ",
               "    AND sfcc004   = ? " 
               
   LET l_sql2= "    AND (sfcb014  = 'Y' ",
               "    OR  sfcb015   = 'Y' ",
               "    OR  sfcb016   = 'Y' ",
               "    OR  sfcb018   = 'Y' ",
               "    OR  sfcb019   = 'Y')",
               " ORDER BY sfcb003,sfcb004 "
               
   LET l_sql3= "    AND (sfcb014  = 'N' ",
               "    AND sfcb015   = 'N' ",
               "    AND sfcb016   = 'N' ",
               "    AND sfcb018   = 'N' ",
               "    AND sfcb019   = 'N')",
               " ORDER BY sfcb003,sfcb004 "

#有报工的直接插入临时表
   LET l_sql4=l_sql,l_sql1,l_sql2
   PREPARE s_asft335_ins_sfcb_next_pb FROM l_sql4
   DECLARE s_asft335_ins_sfcb_next CURSOR FOR s_asft335_ins_sfcb_next_pb
   
#没报工的也选出来，继续找下下站
   LET l_sql5=l_sql1,l_sql3
   LET g_sel_sfcb_next_sql = l_sql5
#cursor的定义放到s_asft335_get_next_station递归时，不然foreach会关闭cursor，造成下一层递归无法使用cursor
#   PREPARE s_asft335_sel_sfcb_next_pb FROM l_sql5
#   DECLARE s_asft335_sel_sfcb_next CURSOR FOR s_asft335_sel_sfcb_next_pb

   LET l_sql = " INSERT INTO s_asft335_tmp02 "


   LET l_sql1= " SELECT 'N',A.sfcbdocno,A.sfcb001,A.sfcb003,A.sfcb004,A.sfcb005,A.sfcb006,",
               "        CASE WHEN A.sfcb019 ='Y' THEN 5 WHEN A.sfcb018 ='Y' THEN 4 WHEN A.sfcb016 ='Y' THEN 3 WHEN A.sfcb015 ='Y' THEN 2 WHEN A.sfcb014 ='Y' THEN 1 ELSE 0 END,",
               "        A.sfcb021,A.sfcb022,0,",
               "        A.sfcb053,A.sfcb054 ",
               "   FROM sfcb_t B,sfcb_t A,sfcc_t ",   #A是上一站，B是当前站，sql是要找到B站所有的上一站,接受传入参数的是B站
               "  WHERE B.sfcbent   = ",g_enterprise,
               "    AND B.sfcbsite  = '",g_site CLIPPED,"'",
               "    AND B.sfcbdocno = ? ",
               "    AND B.sfcb001   = ? ",
               "    AND B.sfcb003   = ? ",
               "    AND B.sfcb004   = ? ",
               "    AND B.sfcbent   = sfccent ",
               "    AND B.sfcbsite  = sfccsite ",
               "    AND B.sfcbdocno = sfccdocno ",
               "    AND B.sfcb001   = sfcc001 ",
               "    AND B.sfcb002   = sfcc002 ",
               "    AND A.sfcbent   = sfccent ",
               "    AND A.sfcbsite  = sfccsite ",
               "    AND A.sfcbdocno = sfccdocno ",
               "    AND A.sfcb001   = sfcc001 ",
               "    AND A.sfcb003   = sfcc003 ",
               "    AND A.sfcb004   = sfcc004 "

               
   LET l_sql2= "    AND (A.sfcb014  = 'Y' ",
               "    OR  A.sfcb015   = 'Y' ",
               "    OR  A.sfcb016   = 'Y' ",
               "    OR  A.sfcb018   = 'Y' ",
               "    OR  A.sfcb019   = 'Y')",
               " ORDER BY A.sfcb003,A.sfcb004 "
               
   LET l_sql3= "    AND (A.sfcb014  = 'N' ",
               "    AND A.sfcb015   = 'N' ",
               "    AND A.sfcb016   = 'N' ",
               "    AND A.sfcb018   = 'N' ",
               "    AND A.sfcb019   = 'N')",
               " ORDER BY A.sfcb003,A.sfcb004 "

#有报工的直接插入临时表
   LET l_sql4=l_sql,l_sql1,l_sql2

                    
   PREPARE s_asft335_ins_sfcb_prev_pb FROM l_sql4
   DECLARE s_asft335_ins_sfcb_prev CURSOR FOR s_asft335_ins_sfcb_prev_pb 
#没报工的也选出来，继续找上上站
   LET l_sql5=l_sql1,l_sql3
   LET g_sel_sfcb_prev_sql = l_sql5
#cursor的定义放到s_asft335_get_prev_station递归时，不然foreach会关闭cursor，造成下一层递归无法使用cursor
#   PREPARE s_asft335_sel_sfcb_prev_pb FROM l_sql5
#   DECLARE s_asft335_sel_sfcb_prev CURSOR FOR s_asft335_sel_sfcb_prev_pb
   
   #170420-00018#1 add(s)
   LET l_sql = " INSERT INTO s_asft335_tmp03 "
   
   LET l_sql1= " SELECT 'N',A.sfcbdocno,A.sfcb001,A.sfcb003,A.sfcb004,A.sfcb005,A.sfcb006,",
               "        CASE WHEN A.sfcb019 ='Y' THEN 5 WHEN A.sfcb018 ='Y' THEN 4 WHEN A.sfcb016 ='Y' THEN 3 WHEN A.sfcb015 ='Y' THEN 2 WHEN A.sfcb014 ='Y' THEN 1 ELSE 0 END,",
               "        A.sfcb021,A.sfcb022,0,0,",
               "        A.sfcb053,A.sfcb054 ",
               "   FROM sfcb_t B,sfcb_t A,sfcc_t ",   #A是上一站，B是当前站，sql是要找到B站所有的上一站,接受传入参数的是B站
               "  WHERE B.sfcbent   = ",g_enterprise,
               "    AND B.sfcbsite  = '",g_site CLIPPED,"'",
               "    AND B.sfcbdocno = ? ",
               "    AND B.sfcb001   = ? ",
               "    AND B.sfcb003   = ? ",
               "    AND B.sfcb004   = ? ",
               "    AND B.sfcbent   = sfccent ",
               "    AND B.sfcbsite  = sfccsite ",
               "    AND B.sfcbdocno = sfccdocno ",
               "    AND B.sfcb001   = sfcc001 ",
               "    AND B.sfcb002   = sfcc002 ",
               "    AND A.sfcbent   = sfccent ",
               "    AND A.sfcbsite  = sfccsite ",
               "    AND A.sfcbdocno = sfccdocno ",
               "    AND A.sfcb001   = sfcc001 ",
               "    AND A.sfcb003   = sfcc003 ",
               "    AND A.sfcb004   = sfcc004 "

               
   LET l_sql2= "    AND (A.sfcb014  = 'Y' ",
               "    OR  A.sfcb015   = 'Y' ",
               "    OR  A.sfcb016   = 'Y' ",
               "    OR  A.sfcb018   = 'Y' ",
               "    OR  A.sfcb019   = 'Y')",
               " ORDER BY A.sfcb003,A.sfcb004 "
               
   LET l_sql3= "    AND (A.sfcb014  = 'N' ",
               "    AND A.sfcb015   = 'N' ",
               "    AND A.sfcb016   = 'N' ",
               "    AND A.sfcb018   = 'N' ",
               "    AND A.sfcb019   = 'N')",
               " ORDER BY A.sfcb003,A.sfcb004 "

#有报工的直接插入临时表
   LET l_sql4=l_sql,l_sql1,l_sql2

                    
   PREPARE s_asft335_ins_sfcb_prev_pb2 FROM l_sql4
   DECLARE s_asft335_ins_sfcb_prev2 CURSOR FOR s_asft335_ins_sfcb_prev_pb2

   LET l_sql5=l_sql1,l_sql3
   LET g_sel_sfcb_prev_sql2 = l_sql5
   #170420-00018#1 add(e)         

   #170524-00070#1 add --(S)--
   #找出重工轉入前的最終報工站
   LET l_sql = " INSERT INTO s_asft335_tmp04 "

   LET l_sql1= " SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,",
               "        CASE WHEN sfcb019 ='Y' THEN 5 WHEN sfcb018 ='Y' THEN 4 WHEN sfcb016 ='Y' THEN 3 WHEN sfcb015 ='Y' THEN 2 WHEN sfcb014 ='Y' THEN 1 ELSE 0 END,",
               "        sfcb021,sfcb022,0,",
               "        sfcb053,sfcb054 ",
               "   FROM sfcb_t ",   
               "  WHERE sfcbent   = ",g_enterprise,
               "    AND sfcbsite  = '",g_site CLIPPED,"'",
               "    AND sfcbdocno = ? ",
               "    AND sfcb001   = ? ",
               "    AND sfcb009   = 'END' "
               
   LET l_sql2= "    AND (sfcb014  = 'Y' ",
               "    OR  sfcb015   = 'Y' ",
               "    OR  sfcb016   = 'Y' ",
               "    OR  sfcb018   = 'Y' ",
               "    OR  sfcb019   = 'Y')",
               " ORDER BY sfcb003,sfcb004 "
               
   LET l_sql3= "    AND (sfcb014  = 'N' ",
               "    AND sfcb015   = 'N' ",
               "    AND sfcb016   = 'N' ",
               "    AND sfcb018   = 'N' ",
               "    AND sfcb019   = 'N')",
               " ORDER BY sfcb003,sfcb004 "

#有报工的直接插入临时表
   LET l_sql4=l_sql,l_sql1,l_sql2
                
   PREPARE s_asft335_ins_sfcb_prev_pb3 FROM l_sql4
   DECLARE s_asft335_ins_sfcb_prev3 CURSOR FOR s_asft335_ins_sfcb_prev_pb3 
#没报工的也选出来，继续找上上站
   LET l_sql5=l_sql1,l_sql3
   LET g_sel_sfcb_prev_sql3 = l_sql5

   #170524-00070#1 add --(E)--
END FUNCTION
################################################################################
# Descriptions...: 删除临时表
# Memo...........: 必须用于事务外
#                  与s_asft335_cre_tmp_table对应
# Usage..........: CALL s_asft335_drop_tmp_table()
#                  RETURNING 
# Input parameter: 
# Return code....: 
# Date & Author..: 2014/01/15 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_drop_tmp_table()
   WHENEVER ERROR CONTINUE

   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      RETURN 
   END IF
   
   #刪除TEMP TABLE

   DROP TABLE s_asft335_tmp01 #ODI-ORA#

   DROP TABLE s_asft335_tmp02 #ODI-ORA#

   DROP TABLE s_asft335_tmp03 #170420-00018 add #ODI-ORA#

   DROP TABLE s_asft335_tmp04 #170524-00070#1 add #ODI-ORA#

   DROP TABLE s_asft335_tmp05 #190709-00006#1 add #ODI-ORA#

   DROP TABLE s_asft335_tmp06 #190709-00006#1 add #ODI-ORA#
END FUNCTION
################################################################################
# Descriptions...: 抓取同一站里下一个勾选的步骤
# Memo...........:
# Usage..........: CALL s_asft335_get_next_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success,r_errmsg
# Input parameter: p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      回传参数变量说明1
#                : r_errmsg       回传参数变量说明2
# Date & Author..: 2014/01/21 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_next_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE r_success           LIKE type_t.num5
   DEFINE r_errmsg            STRING
   DEFINE l_sfcb014           LIKE sfcb_t.sfcb014
   DEFINE l_sfcb015           LIKE sfcb_t.sfcb015
   DEFINE l_sfcb016           LIKE sfcb_t.sfcb016
   DEFINE l_sfcb018           LIKE sfcb_t.sfcb018
   DEFINE l_sfcb019           LIKE sfcb_t.sfcb019
   
   LET r_success = TRUE
   LET r_errmsg  = NULL
   CASE p_sffb001
      WHEN '0'   #从上站Move Out过来的，到下下站找第一个勾选的步骤
        SELECT sfcb014,sfcb015,sfcb016,sfcb018,sfcb019 
          INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '1'   #Move In
        SELECT sfcb015,sfcb016,sfcb018,sfcb019 
          INTO l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF        
      WHEN '2'   #check In
        SELECT sfcb016,sfcb018,sfcb019 
          INTO l_sfcb016,l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '3'   #报工
        SELECT sfcb018,sfcb019 
          INTO l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '4'   #check Out
        SELECT sfcb019 
          INTO l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp01
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '5'   #Move Out
#Move Out的下一步就是下一站了，所以本函数里不做运算了,回传FALSE才会继续去走抓取下一站的函数
         LET r_success = FALSE
         RETURN r_success,r_errmsg
   END CASE  
#如果走到这里，说明一个Y都没抓到，那就是失败了，返回FALSE
   LET r_success = FALSE
   RETURN r_success,r_errmsg
END FUNCTION
################################################################################
# Descriptions...: 计算各报工站综合对下一站点的影响，合并替代群组，其余取最小值
# Memo...........:step1:根据作业编号+制程序将对应的数量写到s_asft335_tmp02里，考虑转换率
#                :step2:以替代群组为group做sum
#                :step3:全体都有，取最小值，作为传给下一站的数量
# Usage..........: CALL s_asft335_calculate()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/14 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_calculate()
   DEFINE l_sfcb_prev         type_sfcb_prev  
   DEFINE l_sffb017           LIKE sffb_t.sffb017
   DEFINE r_success           LIKE type_t.num5
#   DEFINE l_sfcb017           LIKE sfcb_t.sfcb017   #170110-00056#1 add
   DEFINE l_sfcb051           LIKE sfcb_t.sfcb051    #170322-00016#1 add  
   DEFINE l_qcba027           LIKE qcba_t.qcba027    #170322-00016#1 add  
   #170618-00375#1 add(s)
   DEFINE l_qcba010           LIKE qcba_t.qcba010       
   DEFINE l_qcba009           LIKE qcba_t.qcba009
   DEFINE l_qcba016           LIKE qcba_t.qcba016
   DEFINE l_qcba023           LIKE qcba_t.qcba023
   DEFINE l_qcba023_sum       LIKE qcba_t.qcba023
   DEFINE l_success           LIKE type_t.num5
   #170618-00375#1 add(e)
   DEFINE l_sql               STRING   #170228-00018#2 add
   
   LET r_success = TRUE
   WHENEVER ERROR CONTINUE
   #DECLARE s_asft335_sel_sfcb_prev_tmp CURSOR FOR SELECT * FROM s_asft335_tmp02 ORDER BY sfcb003,sfcb004  #161109-00085#55  MARK
   #FOREACH s_asft335_sel_sfcb_prev_tmp INTO l_sfcb_prev.*   #161109-00085#55  MARK
   #161109-00085#55-s
   DECLARE s_asft335_sel_sfcb_prev_tmp CURSOR FOR SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                                                         sfcb005,sfcb006,type,sfcb021,sfcb022,
                                                         amt,sfcb053,sfcb054    
                                                    FROM s_asft335_tmp02 ORDER BY sfcb003,sfcb004         
   FOREACH s_asft335_sel_sfcb_prev_tmp 
      INTO l_sfcb_prev.chk,l_sfcb_prev.sfcbdocno,l_sfcb_prev.sfcb001,l_sfcb_prev.sfcb003,l_sfcb_prev.sfcb004, 
           l_sfcb_prev.sfcb005,l_sfcb_prev.sfcb006,l_sfcb_prev.type,l_sfcb_prev.sfcb021,l_sfcb_prev.sfcb022,
           l_sfcb_prev.amt,l_sfcb_prev.sfcb053,l_sfcb_prev.sfcb054
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF  

      IF l_sfcb_prev.sfcb021 IS NULL OR l_sfcb_prev.sfcb022 IS NULL OR l_sfcb_prev.sfcb053 IS NULL OR l_sfcb_prev.sfcb054 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00345'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      #170110-00056#1 add(s)
#      SELECT sfcb017 INTO l_sfcb017 FROM sfcb_t
#       WHERE sfcbent = g_enterprise
#         AND sfcbdocno = l_sfcb_prev.sfcbdocno
#         AND sfcb001 = l_sfcb_prev.sfcb001
#         AND sfcb003 = l_sfcb_prev.sfcb003
#         AND sfcb004 = l_sfcb_prev.sfcb004
#      IF l_sfcb_prev.type='3' AND l_sfcb017 = 'Y' THEN
#         SELECT SUM(qcba023) INTO l_sffb017
#           FROM qcba_t
#          WHERE qcbaent = g_enterprise
#            AND qcbasite = g_site
#            AND qcba003 = l_sfcb_prev.sfcbdocno
#            AND qcba029 = l_sfcb_prev.sfcb001
#            AND qcba006 = l_sfcb_prev.sfcb003
#            AND qcba007 = l_sfcb_prev.sfcb004
#            AND qcbastus = 'Y'
#      ELSE
      #170110-00056 add(e)
#选取报工单数量
         
         SELECT SUM(sffb017) INTO l_sffb017 
           FROM sffb_t
          WHERE sffbent   = g_enterprise
            AND sffbsite  = g_site
            AND sffb001   = l_sfcb_prev.type
            AND sffb005   = l_sfcb_prev.sfcbdocno
            AND sffb006   = l_sfcb_prev.sfcb001
            AND sffb007   = l_sfcb_prev.sfcb003
            AND sffb008   = l_sfcb_prev.sfcb004
            AND sffbstus  = 'Y' 
         #170322-00016#1 add  --begin--
         #pqc处理
         IF l_sfcb_prev.type = '3' THEN
            SELECT sfcb051 INTO l_sfcb051 FROM sfcb_t
             WHERE sfcbent = g_enterprise 
               AND sfcbdocno = l_sfcb_prev.sfcbdocno
               AND sfcb001   = l_sfcb_prev.sfcb001
               AND sfcb003   = l_sfcb_prev.sfcb003
               AND sfcb004   = l_sfcb_prev.sfcb004
            #170618-00375#1 mark(s)
#            SELECT SUM(qcba027) INTO l_qcba027 FROM qcba_t
#             WHERE qcbaent = g_enterprise AND qcbasite = g_site
#               AND qcba003 = l_sfcb_prev.sfcbdocno AND qcba029 = l_sfcb_prev.sfcb001
#               AND qcba006 = l_sfcb_prev.sfcb003 AND qcba007 = l_sfcb_prev.sfcb004
#               AND qcbastus = 'Y'
            #170618-00375#1 mark(e)
            
            #170618-00375#1 add(s) 
            #170228-00018#2 add-S aqct300审核的时候 计算转入数量应当是良品数量sffb017-待PQC数量sfcb051-不良数qcba027，不应该是qcba023合格量
            #下一个报工点的数量应当等于原数量+合格量 
           #IF g_prog MATCHES 'aqct300_conf*' THEN #在PQC单据审核的时候，由于状态码还未更新，故判断状态码为'N'的，取消审核反之   #170920-00052#1 mark #因為aqct300已先將審核碼先更新
            IF g_prog MATCHES 'aqct300*' THEN   #170920-00052#1 add                      
              #LET l_sql = " SELECT qcba010,qcba009,qcba016,NVL(qcba027,0) FROM qcba_t ",   #170920-00052#1 mark
               LET l_sql = " SELECT qcba010,qcba009,qcba016,NVL(qcba023,0) FROM qcba_t ",   #170920-00052#1 add
                           "  WHERE qcbaent = ",g_enterprise," AND qcbasite = '",g_site,"' ",
                           "    AND qcba003 = '",l_sfcb_prev.sfcbdocno,"' AND qcba029 = '",l_sfcb_prev.sfcb001,"' ",
                           "    AND qcba006 = '",l_sfcb_prev.sfcb003,"' AND qcba007 = '",l_sfcb_prev.sfcb004,"' "
              #LET l_sql = l_sql CLIPPED,"   AND qcbastus = 'N' "  #170920-00052#1 mark
               LET l_sql = l_sql CLIPPED,"   AND qcbastus = 'Y'"   #170920-00052#1 add
            ELSE     #取消审核的时候用合格量进行冲减
               LET l_sql = " SELECT qcba010,qcba009,qcba016,NVL(qcba027,0) FROM qcba_t ",
                           "  WHERE qcbaent = ",g_enterprise," AND qcbasite = '",g_site,"' ",
                           "    AND qcba003 = '",l_sfcb_prev.sfcbdocno,"' AND qcba029 = '",l_sfcb_prev.sfcb001,"' ",
                           "    AND qcba006 = '",l_sfcb_prev.sfcb003,"' AND qcba007 = '",l_sfcb_prev.sfcb004,"' "
               LET l_sql = l_sql CLIPPED,"   AND qcbastus = 'Y' "   
            END IF
            PREPARE sel_qcba023_pre FROM l_sql
            DECLARE sel_qcba023_curs CURSOR FOR sel_qcba023_pre
            #170228-00018#2 add-E
                       
            #170228-00018#2 mark-S   
#            DECLARE sel_qcba023_curs CURSOR FOR
#            SELECT qcba010,qcba009,qcba016,NVL(qcba023,0) FROM qcba_t
#             WHERE qcbaent = g_enterprise AND qcbasite = g_site
#               AND qcba003 = l_sfcb_prev.sfcbdocno AND qcba029 = l_sfcb_prev.sfcb001
#               AND qcba006 = l_sfcb_prev.sfcb003 AND qcba007 = l_sfcb_prev.sfcb004
#               AND qcbastus = 'Y'   
            #170228-00018#2 mark-E
        
            LET l_qcba023_sum = 0
            FOREACH sel_qcba023_curs INTO l_qcba010,l_qcba009,l_qcba016,l_qcba023
               IF NOT cl_null(l_qcba009) AND NOT cl_null(l_qcba016) AND l_qcba009 != l_qcba016 THEN
                  CALL s_aooi250_convert_qty1(l_qcba010,l_qcba016,l_qcba009,l_qcba023) RETURNING l_success,l_qcba023
               END IF
               LET l_qcba023_sum = l_qcba023_sum + l_qcba023
            END FOREACH
            #170618-00375#1 add(e)
            
            IF cl_null(l_sfcb051) THEN
               LET l_sfcb051 = 0
            END IF
            #170618-00375#1 mark(s)
#            IF cl_null(l_qcba027) THEN
#               LET l_qcba027 = 0
#            END IF
#            LET l_sffb017 = l_sffb017 - l_sfcb051 - l_qcba027
            #170618-00375#1 mark(e)
            #170920-00052#1 add --(S)--
            IF g_prog MATCHES 'aqct300*' THEN
               LET l_sffb017 = l_qcba023_sum
            ELSE
            #170920-00052#1 add --(E)--
               LET l_sffb017 = l_sffb017 - l_sfcb051 - l_qcba023_sum   #170618-00375#1 add   
            #170920-00052#1 add --(S)--
            END IF   #170920-00052#1 add            
         END IF
         #170322-00016#1 add  --end--
             
#      END IF
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate SELECT SUM(sffb017)'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 

      IF l_sffb017 IS NULL THEN LET l_sffb017 = 0 END IF
      
#Move In，Check In用转入单位分子/分母
      IF l_sfcb_prev.type MATCHES '[12]' THEN
        #LET l_sfcb_prev.amt = l_sffb017/l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054     #170405-00004#1 mark
         LET l_sfcb_prev.amt = l_sffb017/(l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054)   #170405-00004#1 add
      END IF
#Move Out，Check Out，报工用转出单位分子/分母
      IF l_sfcb_prev.type MATCHES '[345]' THEN
        #LET l_sfcb_prev.amt = l_sffb017/l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022       #170405-00004#1 mark
         LET l_sfcb_prev.amt = l_sffb017/(l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022)     #170405-00004#1 mark
      END IF
	
      UPDATE s_asft335_tmp02
         SET amt = l_sfcb_prev.amt
       WHERE type      = l_sfcb_prev.type
         AND sfcbdocno = l_sfcb_prev.sfcbdocno
         AND sfcb001   = l_sfcb_prev.sfcb001
         AND sfcb003   = l_sfcb_prev.sfcb003
         AND sfcb004   = l_sfcb_prev.sfcb004
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate update s_asft335_tmp02'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 
   END FOREACH

#将相同替代群组的累加起来
   UPDATE s_asft335_tmp02 SET chk = 'N'
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL

#其他不是替代群组的不能删掉，也要改成chk=Y
   UPDATE s_asft335_tmp02 SET chk = 'Y'
    WHERE sfcb005 != '2'


   INSERT INTO s_asft335_tmp02 
#   SELECT 'Y','','','','','',sfcb006,'','','',SUM(amt),'','' #201021-00059#1 mark
   SELECT 'Y','',0,'','','',sfcb006,'',0,0,SUM(amt),0,0  #201021-00059#1 add
     FROM s_asft335_tmp02
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL
    GROUP BY sfcb006


    
   DELETE FROM s_asft335_tmp02 WHERE chk = 'N'   

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 检查良品数量，报废数量，当站下线数量和回收数量的逻辑
# Memo...........:
# Usage..........: CALL s_asft335_chk_qty(ls_js)
#                  RETURNING r_success
# Input parameter: ls_js
# Return code....: r_success      检查通过否
# Date & Author..: 2014/01/26 By wujie
# Modify.........: #170117-00038#1 將傳入參數調整為字串，報工的可超交率判斷，
#                : 在依順序報工時，應用良品轉入的數量判斷，且總數不可大於標準產出量*（1+允許超交率/100)
#                : 如不照順序報工，則判斷報工總量不可超過，標準產出量*(1+允許超交率）
################################################################################
PUBLIC FUNCTION s_asft335_chk_qty(ls_js)
#170117-00038#1-s
DEFINE ls_js        STRING
DEFINE lc_param     type_sffb_parameter
DEFINE r_success    LIKE type_t.num5
DEFINE l_sfaa010    LIKE sfaa_t.sfaa010
DEFINE l_sfaa013    LIKE sfaa_t.sfaa013   #180801-00034#1 add
DEFINE l_imae020    LIKE imae_t.imae020
DEFINE l_success    LIKE type_t.num5
DEFINE l_sql        STRING
DEFINE l_qty        LIKE sfcb_t.sfcb050
DEFINE l_sfcb027    LIKE sfcb_t.sfcb027
DEFINE l_sfcb028    LIKE sfcb_t.sfcb028
DEFINE l_sfcb_chk   LIKE sfcb_t.sfcb028   #170213-00031#1   add
DEFINE l_sfca005    LIKE sfca_t.sfca005   #170213-00031#1   add
DEFINE l_sfcb_chk1  LIKE sfcb_t.sfcb028   #170224-00011#1   add   已報工項目
DEFINE l_sfcb007    LIKE sfcb_t.sfcb007   #170306-00002#1   add   上站作業
DEFINE l_sfcb029    LIKE sfcb_t.sfcb029   #170322-00016#1   add
DEFINE l_sfcb046    LIKE sfcb_t.sfcb046   #170322-00016#1   add
DEFINE l_sfcb047    LIKE sfcb_t.sfcb047   #170322-00016#1   add
DEFINE l_sfcb048    LIKE sfcb_t.sfcb048   #170322-00016#1   add
DEFINE l_sfcb049    LIKE sfcb_t.sfcb049   #170322-00016#1   add
DEFINE l_sfcb051    LIKE sfcb_t.sfcb051   #170322-00016#1   add
DEFINE l_sfcb_chk2  LIKE sfcb_t.sfcb047   #170322-00016#1   add
DEFINE l_sfcb021    LIKE sfcb_t.sfcb021   #170405-00004#1   add
DEFINE l_sfcb022    LIKE sfcb_t.sfcb022   #170405-00004#1   add
DEFINE l_sfcb053    LIKE sfcb_t.sfcb053   #170405-00004#1   add
DEFINE l_sfcb054    LIKE sfcb_t.sfcb054   #170405-00004#1   add
#170618-00518#1-S add
DEFINE l_sfcb002         LIKE sfcb_t.sfcb002
DEFINE l_sfcb005         LIKE sfcb_t.sfcb005   
DEFINE l_sfcb006         LIKE sfcb_t.sfcb006  
DEFINE l_new_sfcb002     LIKE sfcb_t.sfcb002
DEFINE l_new_sfcb003     LIKE sfcb_t.sfcb003
DEFINE l_new_sfcb004     LIKE sfcb_t.sfcb004
DEFINE l_td_sum          LIKE sfcb_t.sfcb027
DEFINE l_qty2            LIKE sfcb_t.sfcb027
DEFINE l_qty3            LIKE sfcb_t.sfcb027  #180327-00060#1  報廢+下線
DEFINE l_qty4            LIKE sfaa_t.sfaa050  #180801-00034#1  完工入庫量(完工入库单中存在(不管过帐还是未审核等状态))
DEFINE r_type            LIKE type_t.chr2 
DEFINE l_cnt             LIKE type_t.num10
DEFINE l_sql2            STRING
DEFINE l_flag            LIKE type_t.num5
#170618-00518#1-E add
DEFINE l_sfga016         LIKE sfga_t.sfga016     #来源PQC单号   #170228-00018#2 add
#170920-00052#1 add --(S)--
DEFINE l_sfcb030         LIKE sfcb_t.sfcb030   #回收转入
DEFINE l_qcbc009         LIKE qcbc_t.qcbc009   #PQC轉回當站量
#170920-00052#1 add --(E)--
#180907-00053#1 add --(S)--
DEFINE l_ooba002         LIKE ooba_t.ooba002  #单别
DEFINE l_d_mfg_0104      LIKE type_t.chr1     #依报工站检查齐套(D-MFG-0104)
DEFINE l_fullflag        LIKE type_t.num5     #是否要控管齊套數
DEFINE l_n1              LIKE type_t.num10
DEFINE l_n2              LIKE type_t.num10
DEFINE l_fullqty         LIKE sfcb_t.sfcb027
#180907-00053#1 add --(E)--
DEFINE l_sfcb041         LIKE sfcb_t.sfcb041 #190422-00047#1
DEFINE l_sfcb042         LIKE sfcb_t.sfcb042 #190422-00047#1
DEFINE l_sfcb008         LIKE sfcb_t.sfcb008 #190620-00051#1 add
#171129-00035#2 add --(S)--
DEFINE l_qty5            LIKE sfcb_t.sfcb027 #下線量
DEFINE l_sfcb036         LIKE sfcb_t.sfcb036 #當站已報廢量
DEFINE l_sfcb050         LIKE sfcb_t.sfcb050 #在製量
DEFINE l_d_mfg_0105      LIKE type_t.chr1    #可報工數只考慮良品數(D-MFG-0105)
DEFINE l_oversets        LIKE type_t.num26_10 #超領套數
#171129-00035#2 add --(E)--

   CALL util.JSON.parse(ls_js,lc_param)

   LET r_success = TRUE
   IF lc_param.sffb005 IS NULL OR
      lc_param.sffb006 IS NULL OR
      lc_param.sffb007 IS NULL OR
      lc_param.sffb008 IS NULL THEN
      RETURN r_success
   END IF
   
   #201202-00011#1--add---str---
   IF lc_param.popup IS NULL THEN
       LET lc_param.popup = TRUE
   END IF
   #201202-00011#1--add---end---
  
   #170228-00018#2 add-S
   IF NOT cl_null(lc_param.sffbdocno) THEN #来源pqc的不需要考虑
      LET l_sfga016 = NULL
      SELECT sfga016 INTO l_sfga016
        FROM sfga_t
       WHERE sfgadocno = lc_param.sffbdocno
         AND sfgaent = g_enterprise
      IF NOT cl_null(l_sfga016) THEN
         RETURN r_success
      END IF
   END IF
   #170228-00018#2 add-E
   IF cl_null(lc_param.sffb017) THEN LET lc_param.sffb017 = 0 END IF
   IF cl_null(lc_param.sffb018) THEN LET lc_param.sffb018 = 0 END IF
   IF cl_null(lc_param.sffb019) THEN LET lc_param.sffb019 = 0 END IF
   IF cl_null(lc_param.sffb020) THEN LET lc_param.sffb020 = 0 END IF
   LET l_flag = FALSE   #170618-00518#1
   #抓取當站製程資料
   LET l_sfcb027 = 0
   LET l_sfcb028 = 0
   LET l_sfcb_chk = 0   #170213-00031#1 add
   LET l_sfcb_chk1 = 0  #170224-00011#1 add
   LET l_sfcb_chk2 = 0  #170322-00016#1 add
   #170213-00031#1-s-mod
#   SELECT sfcb027,sfcb028
#     INTO l_sfcb027,l_sfcb028
#  SELECT sfcb027,((sfcb028+sfcb029+sfcb030+sfcb031+sfcb032)-(sfcb033+sfcb034+sfcb035+sfcb036+sfcb037+sfcb038+sfcb039))   #170322-00016#1 mark
   SELECT sfcb027,(sfcb028+sfcb029+sfcb030+sfcb031+sfcb032),(sfcb033+sfcb034+sfcb035+sfcb036+sfcb037+sfcb038+sfcb039)     #170322-00016#1 add             
     #170224-00011#1-s-mod
#     INTO l_sfcb027,l_sfcb_chk
         ,(sfcb033+sfcb034+sfcb035+sfcb036+sfcb037)           
        #,sfcb007,sfcb028   #170306-00002#1 add   #190620-00051#1 mark
         ,sfcb007,sfcb008,sfcb028                 #190620-00051#1 add
         ,sfcb029,sfcb046,sfcb047,sfcb048,sfcb049,sfcb051   #170322-00016#1 add
         ,sfcb021,sfcb022,sfcb053,sfcb054,sfcb030           #170405-00004#1 add  #170920-00052#1 add sfcb030
         ,sfcb041,sfcb042                                   #190422-00047#1 add
         ,sfcb036,sfcb050                                   #171129-00035#2 add         
     INTO l_sfcb027,l_sfcb_chk,l_sfcb_chk2,l_sfcb_chk1   #170322-00016#1 add l_sfcb_chk2
        #,l_sfcb007,l_sfcb028   #170306-00002#1   #190620-00051#1 mark
         ,l_sfcb007,l_sfcb008,l_sfcb028           #190620-00051#1 add
         ,l_sfcb029,l_sfcb046,l_sfcb047,l_sfcb048,l_sfcb049,l_sfcb051    #170322-00016#1 add
         ,l_sfcb021,l_sfcb022,l_sfcb053,l_sfcb054,l_sfcb030         #170405-00004#1 add  #170920-00052#1 add sfcb030
         ,l_sfcb041,l_sfcb042                                       #190422-00047#1 add         
         ,l_sfcb036,l_sfcb050                                       #171129-00035#2 add
     #170224-00011#1-e-mod
   #170213-00031#1-e-mod
     FROM sfcb_t
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = lc_param.sffb005     #單號
      AND sfcb001   = lc_param.sffb006     #RUN CARD
      AND sfcb003   = lc_param.sffb007     #本站作業
      AND sfcb004   = lc_param.sffb008     #作業序
   IF cl_null(l_sfcb027) THEN LET l_sfcb027 = 0 END IF
#   IF cl_null(l_sfcb028) THEN LET l_sfcb028 = 0 END IF   #170213-00031#1 mark
   #170213-00031#1-s-add
   
   IF cl_null(l_sfcb_chk) THEN LET l_sfcb_chk = 0 END IF
   IF cl_null(l_sfcb_chk1) THEN LET l_sfcb_chk1 = 0 END IF   #170322-00016#1 add
   IF cl_null(l_sfcb_chk2) THEN LET l_sfcb_chk2 = 0 END IF   #170322-00016#1 add
   
   #180327-00060#1-s
   LET l_qty3 = 0
   #190620-00051#1 mark --s
   #SELECT SUM((sfcb036+sfcb037)*sfcb054/sfcb053*sfcb021/sfcb022) INTO l_qty3 FROM sfcb_t
   # WHERE sfcbent   = g_enterprise
   #   AND sfcbsite  = g_site
   #   AND sfcbdocno = lc_param.sffb005     #單號
   #   AND sfcb001   = lc_param.sffb006     #RUN CARD
   #   AND NOT (sfcb003 = lc_param.sffb007 AND sfcb004 = lc_param.sffb008)
   #190620-00051#1 mark --e
  #171129-00035#2 mark --(S)-- 
  ##190620-00051#1 add --s
  ##找出本站作業(含)以前的報廢數量及當站下線加總，使用CONNECT BY語法找出上站報廢、下線數量
  #LET l_sql = "SELECT SUM((sfcb036+sfcb037)*sfcb054/sfcb053*sfcb021/sfcb022)", 
  #            " FROM ",
  #            "   (SELECT DISTINCT sfcb002,sfcb003,sfcb004,sfcb021,sfcb022,",
  #            "                    sfcb036,sfcb037,sfcb053,sfcb054,sfcbent,",
  #            "                    sfcbdocno",
  #            "      FROM sfcb_t",
  #            "     WHERE sfcbent = ",g_enterprise, 
  #            "       AND sfcbdocno = '",lc_param.sffb005,"'",
  #            "       AND sfcb001   = '",lc_param.sffb006,"'",   #RUN CARD
  #            "      START WITH sfcb007 = '",l_sfcb007,"' AND sfcb008 = '",l_sfcb008,"'",  #作業編號/作業序
  #            "    CONNECT BY NOCYCLE PRIOR  sfcbent = sfcbent",
  #            "       AND PRIOR sfcbdocno = sfcbdocno   ",
  #            "       AND PRIOR sfcb007 = sfcb003",   #上站作業編號
  #            "       AND PRIOR sfcb008 = sfcb004",   #上站作業序
  #            "    )"
  #PREPARE s_asft335_chk_qty_p1 FROM l_sql
  #EXECUTE s_asft335_chk_qty_p1 INTO l_qty3
  # 
  ##190620-00051#1 add --e
  #171129-00035#2 mark --(E)--
   #171129-00035#2 add --(S)--
   #l_qty3 = 本站作業前的報廢量, l_qty5 = 本站作業前的下線量
   CALL s_asft335_calculate_scrap_qty(2,lc_param.sffb005,lc_param.sffb006,lc_param.sffb007,lc_param.sffb008)
      RETURNING l_success,l_qty3,l_qty5      
   #171129-00035#2 add --(E)--   
   IF cl_null(l_qty3) THEN LET l_qty3 = 0 END IF
   #180327-00060#1-e
  
   #171129-00035#2 add --(S)--
   CALL s_aooi200_get_slip(lc_param.sffb005) RETURNING l_success,g_doc_slip
   #若[可报工数只考虑良品数]=Y,則可报工数量=转入量*(1+超交率)-除报废外的转出量,因此轉出量需扣除報廢量
   LET l_d_mfg_0105 = cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0105')
   IF cl_null(l_d_mfg_0105) THEN LET l_d_mfg_0105 = 'N' END IF
   IF l_d_mfg_0105 = 'Y' THEN
      LET l_sfcb_chk2 = l_sfcb_chk2 - l_sfcb036
      LET l_sfcb_chk1 = l_sfcb_chk1 - l_sfcb036
      LET l_qty3 = 0
   END IF   
   #171129-00035#2 add --(E)--
   
  #170322-00016#1 mark  --begin-- 
  #LET l_sfca005 = ''
  #SELECT sfca005 INTO l_sfca005
  #  FROM sfca_t
  # WHERE sfcaent = g_enterprise
  #   AND sfcadocno = lc_param.sffb005
  #   AND sfca001 = lc_param.sffb006
  #
  #IF l_sfca005 = '2' THEN
  #   IF cl_null(lc_param.sffb017) THEN LET lc_param.sffb017 = 0 END IF
  #   IF cl_null(lc_param.sffb018) THEN LET lc_param.sffb018 = 0 END IF
  #   IF cl_null(lc_param.sffb019) THEN LET lc_param.sffb019 = 0 END IF
  #   IF cl_null(lc_param.sffb020) THEN LET lc_param.sffb020 = 0 END IF
  #   LET l_sfcb_chk = l_sfcb_chk + (lc_param.sffb017+lc_param.sffb018+lc_param.sffb019+lc_param.sffb020)
  #END IF
  ##170213-00031#1-e-add
  #170322-00016#1 mark  --end--
   
   LET l_sfaa010 = ''
  #SELECT sfaa010 INTO l_sfaa010   #180801-00034#1 mark
   #180801-00034#1 add --(S)--
   LET l_sfaa013 = ''
   SELECT sfaa010,sfaa013 
     INTO l_sfaa010,l_sfaa013
   #180801-00034#1 add --(E)--
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = lc_param.sffb005
   #容许误差率
   LET l_imae020 = 0
   SELECT imae020 INTO l_imae020
     FROM imae_t
    WHERE imaeent  = g_enterprise
      AND imaesite = g_site
      AND imae001  = l_sfaa010
   IF cl_null(l_imae020) THEN LET l_imae020 = 0 END IF
   
   LET l_fullflag = FALSE   #180907-00053#1 add
   LET l_fullqty = 0        #180907-00053#1 add
  
   #170322-00016#1 add   --begin--
   #转入*（1+超交率）-转出-待做的
  #IF lc_param.sffb001 = '3' THEN   #171129-00035#2 mark   #不應限定只有報工的時候才要控管
      #180907-00053#1 add --(S)--
      #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
      CALL s_aooi200_get_slip(lc_param.sffb005) RETURNING l_success,l_ooba002
      LET l_d_mfg_0104 = cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0104')
      
      IF l_d_mfg_0104 = 'Y' THEN
         #備料是否有該作業編號備料      
         LET l_cnt = 0   
         SELECT COUNT(1) INTO l_cnt
           FROM sfba_t
          WHERE sfbaent = g_enterprise
            AND sfbadocno = lc_param.sffb005
            AND sfba003 = lc_param.sffb007
            AND sfba004 = lc_param.sffb008
            AND sfba008 IN ('1','2')       #181026-00002#1 add  #需排除間接材料與參考材料
         
         #是否該作業編號備料都是倒扣料
         LET l_n1 = 0
         SELECT COUNT(1) INTO l_n1
           FROM sfba_t
          WHERE sfbaent = g_enterprise
            AND sfbadocno = lc_param.sffb005
            AND sfba003 = lc_param.sffb007
            AND sfba004 = lc_param.sffb008
            AND sfba009 = 'N'
            AND sfba008 IN ('1','2','3')   #181026-00002#1 add  #是否全倒扣料的判斷需排除參考材料
            
         #是否所有備料都是倒扣料
         LET l_n2 = 0
         SELECT COUNT(1) INTO l_n2
           FROM sfba_t
          WHERE sfbaent = g_enterprise
            AND sfbadocno = lc_param.sffb005
            AND sfba009 = 'N' 
            AND sfba008 IN ('1','2','3')   #181026-00002#1 add  #是否全倒扣料的判斷需排除參考材料            
            
         IF (l_cnt > 0 AND l_n1 > 0) THEN
            #可報工數量須用該作業編號/作業序的齊套數控管          
            CALL s_asft340_full_sets(lc_param.sffb005,lc_param.sffb007,lc_param.sffb008,'') 
              #RETURNING l_success,l_sfcb_chk   #210330-00049#1 mark
               RETURNING l_success,l_fullqty    #210330-00049#1 add
            IF l_success THEN
              #LET l_fullflag = TRUE        #210330-00049#1 mark
              #LET l_fullqty = l_sfcb_chk   #210330-00049#1 mark            
              #210330-00049#1---add---str---
              #l_sfcb_chk 和 l_fullqyt 取小的
               IF l_sfcb_chk > l_fullqty THEN
                   LET l_sfcb_chk = l_fullqty
                   LET l_fullflag = TRUE
               END IF
              #210330-00049#1---add---str---
            END IF               
         END IF   
      END IF
      #180907-00053#1 add --(E)--
      #171129-00035#2 add --(S)--
      IF lc_param.sffb001 = '1' THEN 
         LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 - l_sfcb051
         IF l_sfcb_chk > l_sfcb046 THEN LET l_sfcb_chk = l_sfcb046 END IF         
      END IF
      IF lc_param.sffb001 = '2' THEN 
         LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 - l_sfcb051
         IF l_sfcb_chk > l_sfcb047 THEN LET l_sfcb_chk = l_sfcb047 END IF         
      END IF
      IF lc_param.sffb001 = '3' OR cl_null(lc_param.sffb001) THEN 
         LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 - l_sfcb051
        #IF l_sfcb_chk > l_sfcb050 THEN LET l_sfcb_chk = l_sfcb050 END IF   #190916-00003#1 mark         
      END IF
      IF lc_param.sffb001 = '4' THEN 
         LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb049 - l_sfcb051
         IF l_sfcb_chk > l_sfcb048 THEN LET l_sfcb_chk = l_sfcb048 END IF         
      END IF
      IF lc_param.sffb001 = '5' THEN 
         LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb051
         IF l_sfcb_chk > l_sfcb049 THEN LET l_sfcb_chk = l_sfcb049 END IF         
      END IF
      #171129-00035#2 add --(E)--
     #LET l_sfcb_chk = l_sfcb_chk*(1+l_imae020/100) - l_sfcb_chk2 - l_sfcb046 - l_sfcb047 - l_sfcb048 - l_sfcb049 - l_sfcb051
     #LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 - l_sfcb051  #170405-00004#1 add   #171129-00035#2 mark  
  #END IF   #171129-00035#2 mark
   #170322-00016#1 add   --end--
   
   LET l_qty = 0
   LET l_sql = "   FROM sffb_t ",
               "  WHERE sffbent  = ",g_enterprise,
               "    AND sffbsite = '",g_site,"' ",
               "    AND sffb005  = '",lc_param.sffb005,"' ",
               "    AND sffb006  = '",lc_param.sffb006,"' ",
               "    AND sffb007  = '",lc_param.sffb007,"' ",
               "    AND sffb008  = '",lc_param.sffb008,"' ",
               "    AND sffbstus <> 'X' "
   IF NOT cl_null(lc_param.sffbdocno) THEN
      IF cl_null(lc_param.sffbseq) THEN
         LET l_sql = l_sql," AND NOT (sffbdocno = '",lc_param.sffbdocno,"')"
      ELSE
         LET l_sql = l_sql," AND NOT (sffbdocno = '",lc_param.sffbdocno,"' AND sffbseq = '",lc_param.sffbseq,"')"
      END IF
   END IF
   #170120-00043#1-s
   #191107-00026#1(2)----add----str---
   IF l_d_mfg_0105 = 'Y' THEN
       #可報工收只考慮良品數(D-MFG-0105='Y')
       #l_qty 不含報廢數量sffb018
       IF cl_null(lc_param.sffb001) THEN  #報廢
#          LET l_sql = " SELECT MAX(SUM(sffb017+sffb019+sffb020)) ",l_sql," GROUP BY sffb001 " #PGS(D)-13066 mark
          LET l_sql = " SELECT MAX(s) FROM SELECT (SUM(sffb017+sffb019+sffb020) as s ",l_sql," GROUP BY sffb001 ) t51 " #PGS(D)-13066 add
       ELSE
          LET l_sql = " SELECT SUM(sffb017+sffb019+sffb020) ",l_sql," AND sffb001 = '",lc_param.sffb001,"' "
       END IF
   ELSE
   #191107-00026#1(2)----add----end---
       IF cl_null(lc_param.sffb001) THEN  #報廢
#          LET l_sql = " SELECT MAX(SUM(sffb017+sffb018+sffb019+sffb020)) ",l_sql," GROUP BY sffb001 " #PGS(D)-13066 mark
          LET l_sql = " SELECT MAX(s) FROM ( SELECT SUM(sffb017+sffb018+sffb019+sffb020) as s ",l_sql," GROUP BY sffb001 ) t51" #PGS(D)-13066 add
       ELSE
          LET l_sql = " SELECT SUM(sffb017+sffb018+sffb019+sffb020) ",l_sql," AND sffb001 = '",lc_param.sffb001,"' "
       END IF
   END IF #191107-00026#1(2) add
   #170120-00043#1-e
   PREPARE s_asft335_sffb_qty FROM l_sql
   EXECUTE s_asft335_sffb_qty INTO l_qty
   IF cl_null(l_qty) THEN LET l_qty = 0 END IF
   
   #170920-00052#1 add --(S)--
   #取得PQC轉回當站量
   LET l_qcbc009 = 0
   #PGS(D)  13070 add -s-
   IF lc_param.sffb005 IS NULL THEN
      LET lc_param.sffb005 = NULL
   END IF
   
   IF lc_param.sffb006 IS NULL THEN
      LET lc_param.sffb006 = NULL
   END IF
   
   IF lc_param.sffb007 IS NULL THEN 
      LET lc_param.sffb007 = NULL
   END IF

   IF CL_NULL(lc_param.sffb008) THEN
      LET lc_param.sffb008 = NULL
   END IF
   #PGS(D)  13070 add -e-
   
   SELECT SUM(qcbc009) INTO l_qcbc009
     FROM qcba_t,qcbc_t
    WHERE qcbaent = qcbcent AND qcbadocno = qcbcdocno
      AND qcbaent = g_enterprise
      AND qcba003 = lc_param.sffb005  #工單單號
      AND qcba006 = lc_param.sffb007 AND qcba007 = lc_param.sffb008  #作業編號,作業序
      AND qcba029 = lc_param.sffb006  #RUN CARD
      AND qcbastus = 'Y'
     #AND qcbc012 = '6'          #180427-00032#1 mark   #180801-00034#1 remark #180917-00042#1 mark
      AND qcbc012 IN ('5','6')   #180427-00032#1 add    #180801-00034#1 mark   #180917-00042#1 remark
      
   IF cl_null(l_qcbc009) THEN LET l_qcbc009 = 0 END IF 
   IF cl_null(l_sfcb030) THEN LET l_sfcb030 = 0 END IF   
   #170920-00052#1 add --(E)--
   
#   #170224-00011#1-s-add
#   IF l_sfcb_chk > l_sfcb027 THEN
#      LET l_sfcb_chk = l_sfcb027
#   END IF
#   #170224-00011#1-e-add
  #CALL s_aooi200_get_slip(lc_param.sffb005) RETURNING l_success,g_doc_slip   #171129-00035#2 mark #因為前面有需要,因此移到前面段
   
   #依順序報工
   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
      #190520-00046#1 add start -----
      #取得已完工入庫量
      LET l_qty4 = 0
      #定义取入库量的CURSOR
      #CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb005,'1',l_sfaa010,'','') RETURNING l_success  #200326-00028#1 mark
      CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb006,'1',l_sfaa010,'','') RETURNING l_success   #200326-00028#1
      IF NOT l_success THEN
         LET l_qty4 = 0
      ELSE
         #取入库量
        #CALL s_asft340_stored_in_qty('1',l_sfaa013) RETURNING l_qty4      #PGS(D)-00902-mark
         CALL s_asft340_stored_in_qty('1',l_sfaa013,'') RETURNING l_qty4   #PGS(D)-00902-add #201109-00025#1 By 10167
         LET l_qty4 = l_qty4 *l_sfcb021/l_sfcb022    #將入庫量轉換為轉出數量  
      END IF

      #190531-00016#1 mark start -----
      ##報廢量+當站下線量不可大於标准产出量用生产数量-已入库数量计算
      ##IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) - l_qty4) THEN        #190529-00017#1 mark
      #IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) - l_qty4 - l_qty) THEN #190529-000177#1 add
      #   #報廢數量%1+當站下線數量%2不可大於其剩餘的標準產量%3
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.code = 'asf-01013'
      #   LET g_errparam.popup = TRUE
      #   LET g_errparam.replace[1] = lc_param.sffb018
      #   LET g_errparam.replace[2] = lc_param.sffb019
      #   #LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4)        #190529-00017#1 mark
      #   LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4 - l_qty) #190529-00017#1 add
      #   CALL cl_err()
      #   LET r_success = FALSE
      #END IF
      #190531-00016#1 mark end    -----      
      #190520-00046#1 add end    -----   
      #良品数量 + 报废数量 + 当站下线数量 + 回收数量 > 良品轉入*(1+容許誤差率)
      #170213-00031#1-s-mod
#      IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > l_sfcb028*(1+l_imae020/100) THEN
      #170224-00011#1-s-mod
#      IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > l_sfcb_chk*(1+l_imae020/100) THEN
      #170306-00002#1-s-mod
       #當有報工過時
       IF l_sfcb_chk1 > 0 THEN
         #LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) - l_sfcb_chk1  #170322-00016#1 mark
         #170322-00016#1 add   --begin--
          IF l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk1 < l_sfcb_chk THEN
            #LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk1   #170920-00052#1 mark
             LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022                 #170920-00052#1 add
                            + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009 - l_sfcb_chk1                     #170920-00052#1 add
          #                  - l_qty3  #180327-00060#1 #190513-00010#1 mark #190520-00018#1 remove # #200715-00062#1 mark
          END IF
         #170322-00016#1 add   --end--
       ELSE
         #170322-00016#1 mod   --begin--
         #IF l_sfcb_chk > l_sfcb027 THEN
         #   LET l_sfcb_chk = l_sfcb027
         #END IF
         #LET l_sfcb_chk = l_sfcb_chk*(1+l_imae020/100)
         #IF l_sfcb_chk > l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 THEN   #170920-00052#1 mark
         #   LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022    #170920-00052#1 mark
          IF l_sfcb_chk > l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009 THEN   #170920-00052#1 add
             LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009    #170920-00052#1 add
             #               - l_qty3  #180327-00060#1 #190513-00010#1 mark #190520-00018#1 remove # #200715-00062#1 mark
          END IF
         #170322-00016#1 mod   --end--
       END IF
#     #當為第一站時，報工數量可以為原需求量*(1+超交率)；當不為第一站時，報工數量至多為良品轉入(上站轉入數量)
#     IF l_sfcb007 = 'INIT' THEN
#        #當有報工過時
#        IF l_sfcb_chk1 > 0 THEN
#           LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) - l_sfcb_chk1
#        ELSE
#           IF l_sfcb_chk > l_sfcb027 THEN
#              LET l_sfcb_chk = l_sfcb027
#           END IF
#           LET l_sfcb_chk = l_sfcb_chk*(1+l_imae020/100)
#        END IF
#     ELSE
#        #當有報工過時
#        IF l_sfcb_chk1 > 0 THEN
#           LET l_sfcb_chk = l_sfcb028 - l_sfcb_chk1
#        ELSE
#           LET l_sfcb_chk = l_sfcb028
#        END IF
#     END IF
#     #170306-00002#1-e-mod
      #191202-00028#1---add----str---
      #備註:
      #若參數D-MFG-0045=N,不允許事後報工,依順序報工
      #委外站轉入的量 < 委外加工量
      #EX:
      #工單線性製程三站,第二站委外,委外10套,
      #第一站僅報良品數6,故轉入第二站良品轉入6
      #此時再做asft571 入庫5[過帳],便會出錯
      #故加上if 判斷
      #200106-00022#1---add----str---
      #這段程式內的邏輯,另一種狀況也需考量到
      #EX:(1)工單10套,第二站委外10套(有委外加工數10),順序上:第1站先報工6,第2站報工5 要能卡住
      #   (2)剩餘的第二批:4PCS,從第一站開始報工,第二站理應只能委外收貨,若用asft335 先報工,也要能卡住     
      #sfcb041:委外加工數
      #sfcb042:委外委工數 
      #200106-00022#1---add----end---     
      IF g_prog[1,3] = 'apm' THEN #200106-00022 add if 判妡      
          IF l_sfcb_chk - l_sfcb041 > 0 THEN #191202-00028#1 add if         
              LET l_sfcb_chk = l_sfcb_chk - l_sfcb041 + l_sfcb042 #190422-00047#1 add
          END IF #191202-00028#1 add 
      #200106-00022#1---add----srt---
      ELSE
          #g_prog[1,3] = 'asf'
          LET l_sfcb_chk = l_sfcb_chk - l_sfcb041 + l_sfcb042
      END IF      
      #200106-00022#1---add----end---
      IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > l_sfcb_chk THEN  #180327-00060#1
      #170224-00011#1-e-mod
      #170213-00031#1-e-mod
         #180907-00053#1 add --(S)--
         #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
        #IF lc_param.sffb001 = '3' AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN                                #210105-00023#1 mark
         IF (lc_param.sffb001 = '3' OR cl_null(lc_param.sffb001)) AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN #210105-00023#1 add
         #當前作業站齊套數量為%1，良品數量%2+報廢數量%3+當站下線數量%4+回收數量%5不可大於%6（含超交量）
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00937'
              #LET g_errparam.popup = TRUE           #201202-00011#1 mark
               LET g_errparam.popup = lc_param.popup #201202-00011#1 add
               LET g_errparam.replace[1] = l_fullqty
               LET g_errparam.replace[2] = lc_param.sffb017
               LET g_errparam.replace[3] = lc_param.sffb018
               LET g_errparam.replace[4] = lc_param.sffb019
               LET g_errparam.replace[5] = lc_param.sffb020
               LET g_errparam.replace[6] = l_sfcb_chk
         ELSE
         #180907-00053#1 add --(E)--      
            #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於良品轉入數量(含容許誤差率)%5！
            INITIALIZE g_errparam TO NULL
            #191111-00013#1 -s add
            #工單單號:XXXX,作業編號:YYYY,作業序:ZZZZ
            LET g_errparam.extend = cl_getmsg('axc-00397',g_dlang),":",lc_param.sffb005,",",cl_getmsg('azz-01034',g_dlang),":",lc_param.sffb007,",",cl_getmsg('axc-00603',g_dlang),":",lc_param.sffb008
            IF g_prog MATCHES 'asft330*' THEN
               #項次:WW,工單單號:XXXX,作業編號:YYYY,作業序:ZZZZ
               LET g_errparam.extend = cl_getmsg('lib-00153',g_dlang),":",lc_param.sffbseq,",",g_errparam.extend
            END IF
            #191111-00013#1 -e add
            LET g_errparam.code = 'asf-00010'
           #LET g_errparam.popup = TRUE           #201202-00011#1 mark
            LET g_errparam.popup = lc_param.popup #201202-00011#1 add
            LET g_errparam.replace[1] = lc_param.sffb017
            LET g_errparam.replace[2] = lc_param.sffb018
            LET g_errparam.replace[3] = lc_param.sffb019
            LET g_errparam.replace[4] = lc_param.sffb020
            #170213-00031#1-s-mod
#           LET g_errparam.replace[5] = l_sfcb028*(1+l_imae020/100)
            #170224-00011#1-s-mod
#           LET g_errparam.replace[5] = l_sfcb_chk*(1+l_imae020/100)
            LET g_errparam.replace[5] = l_sfcb_chk
            #170224-00011#1-e-mod
         END IF   #180907-00053#1 add
         #170213-00031#1-e-mod
         CALL cl_err()
         LET r_success = FALSE
      ELSE
         #190531-00016#1 add start -----
         IF cl_null(lc_param.sffb001) THEN  #報廢
           #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) - l_qty4 - l_qty) THEN   #171129-00035#2 mark
            IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) - l_qty4) THEN           #171129-00035#2 add
               #報廢數量%1+當站下線數量%2不可大於其剩餘的標準產量%3
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-01013'
              #LET g_errparam.popup = TRUE           #201202-00011#1 mark
               LET g_errparam.popup = lc_param.popup #201202-00011#1 add
               LET g_errparam.replace[1] = lc_param.sffb018
               LET g_errparam.replace[2] = lc_param.sffb019
              #LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4 - l_qty)                                                        #171129-00035#2 mark
               LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4)                                                                #171129-00035#2 add
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
         #190531-00016#1 add end    -----      
#         #170213-00031#1-s-mod
##         IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb028*(1+l_imae020/100) - l_qty) THEN
#         IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb_chk*(1+l_imae020/100) - l_qty) THEN
#         #170213-00031#1-e-mod
#            #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於良品轉入數量(含容許誤差率)%5！
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'asf-00010'
#            LET g_errparam.popup = TRUE
#            LET g_errparam.replace[1] = lc_param.sffb017
#            LET g_errparam.replace[2] = lc_param.sffb018
#            LET g_errparam.replace[3] = lc_param.sffb019
#            LET g_errparam.replace[4] = lc_param.sffb020
#            #170213-00031#1-s-mod
##            LET g_errparam.replace[5] = l_sfcb028*(1+l_imae020/100) - l_qty
#            LET g_errparam.replace[5] = l_sfcb_chk*(1+l_imae020/100) - l_qty
#            #170213-00031#1-e-mod
#            CALL cl_err()
#            LET r_success = FALSE
#         END IF
         #170213-00031#1-e-mark
      END IF
   ELSE  #允许事后报工
      #180801-00034#1 add --(S)--
      #取得已完工入庫量
      LET l_qty4 = 0
      #定义取入库量的CURSOR
      #CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb005,'1',l_sfaa010,'','')     #200326-00028#1 mark
      CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb006,'1',l_sfaa010,'','')      #200326-00028#1      
         RETURNING l_success
      IF NOT l_success THEN
         LET l_qty4 = 0
      ELSE
         #取入库量
        #CALL s_asft340_stored_in_qty('1',l_sfaa013)      #PGS(D)-00902-mark
         CALL s_asft340_stored_in_qty('1',l_sfaa013,'')   #PGS(D)-00902-add
            RETURNING l_qty4
         LET l_qty4 = l_qty4 *l_sfcb021/l_sfcb022    #將入庫量轉換為轉出數量  
      END IF      
      #180801-00034#1 add --(E)--
      #170618-00518#1-S add
      SELECT sfcb002,sfcb005,sfcb006 INTO l_sfcb002,l_sfcb005,l_sfcb006 FROM sfcb_t 
       WHERE sfcbent = g_enterprise
         AND sfcbdocno = lc_param.sffb005
         AND sfcb001 = lc_param.sffb006
         AND sfcb003 = lc_param.sffb007
         AND sfcb004 = lc_param.sffb008
      IF l_sfcb005 = '2' THEN  #替代群组
         SELECT COUNT(1) INTO l_cnt FROM sfcc_t 
          WHERE sfccent = g_enterprise
            AND sfccdocno = lc_param.sffb005
            AND sfcc001 = lc_param.sffb006
            AND sfcc002 = l_sfcb002
            AND sfcc003||sfcc004 NOT IN (SELECT sfcb003||sfcb004 FROM sfcb_t WHERE sfcbent = g_enterprise AND sfcbdocno =  lc_param.sffb005
                                                                               AND sfcb001 = lc_param.sffb006 AND sfcb005 = l_sfcb005 AND sfcb006 = l_sfcb006)
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF           
      END IF  
      IF l_cnt = 0 THEN      
      #170618-00518#1-E add   
        #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) - l_qty) THEN                                       #170920-00052#1 mark
        #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty) THEN   #170920-00052#1 add  #180327-00060#1 mark
        #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3) THEN  #180327-00060#1 #190515-00002#1 mark #190520-00018#1 remove # #200715-00062#1 mark
        IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty) THEN  #180327-00060#1 #190515-00002#1 add #190520-00018#1 mark #200715-00062#1 remark        
            #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於其剩餘的標準產量%5
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00754'
           #LET g_errparam.popup = TRUE           #201202-00011#1 mark
            LET g_errparam.popup = lc_param.popup #201202-00011#1 add
            LET g_errparam.replace[1] = lc_param.sffb017
            LET g_errparam.replace[2] = lc_param.sffb018
            LET g_errparam.replace[3] = lc_param.sffb019
            LET g_errparam.replace[4] = lc_param.sffb020
           #LET g_errparam.replace[5] = (l_sfcb027*(1+l_imae020/100) - l_qty)  #180327-00060#1 mark
            #LET g_errparam.replace[5] = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3)  #180327-00060#1 #190515-00002#1 mark #190520-00018#1 remove # #200715-00062#1 mark
            LET g_errparam.replace[5] = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty)  #190515-00002#1 add #190520-00018#1 mark #200715-00062#1 remark          
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #180801-00034#1 add --(S)--
         #報廢量+當站下線量不可大於标准产出量用生产数量-已入库数量计算
         #IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3 - l_qty4) THEN   #181112-00037#1 mark
         IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) - l_qty4) THEN   #181112-00037#1 add
            #報廢數量%1+當站下線數量%2不可大於其剩餘的標準產量%3-已完工入庫量%4
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00934'
           #LET g_errparam.popup = TRUE           #201202-00011#1 mark
            LET g_errparam.popup = lc_param.popup #201202-00011#1 add
            LET g_errparam.replace[1] = lc_param.sffb018
            LET g_errparam.replace[2] = lc_param.sffb019
           #LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3)   #181112-00037#1 mark
            LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4)  #181112-00037#1 add
            LET g_errparam.replace[4] = l_qty4
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #180801-00034#1 add --(E)--
         #180907-00053#1 add --(S)--
         #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
         IF lc_param.sffb001 = '3' AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN
            IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020> (l_sfcb_chk + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3) THEN
               #當前作業站齊套數量為%1，良品數量%2+報廢數量%3+當站下線數量%4+回收數量%5不可大於%6（含超交量）
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00937'
              #LET g_errparam.popup = TRUE           #201202-00011#1 mark
               LET g_errparam.popup = lc_param.popup #201202-00011#1 add
               LET g_errparam.replace[1] = l_fullqty
               LET g_errparam.replace[2] = lc_param.sffb017
               LET g_errparam.replace[3] = lc_param.sffb018
               LET g_errparam.replace[4] = lc_param.sffb019
               LET g_errparam.replace[5] = lc_param.sffb020
               LET g_errparam.replace[6] = l_sfcb_chk
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
         #180907-00053#1 add --(E)--      
      #170618-00518#1-S add
      ELSE
         #替代群組首站
         DECLARE s_asft335_sel_sfcb003 CURSOR FOR
            SELECT sfcb002,sfcb003,sfcb004 FROM sfcc_t,sfcb_t 
             WHERE sfcbent = sfccent 
               AND sfcbdocno = sfccdocno
               AND sfcb001 = sfcc001
               AND sfcb002 = sfcc002
               AND sfccent = g_enterprise
               AND sfccdocno = lc_param.sffb005
               AND sfcc001 = lc_param.sffb006
               AND sfcb005 = l_sfcb005
               AND sfcb006 = l_sfcb006           
               AND sfcc003||sfcc004 NOT IN (SELECT sfcb003||sfcb004 FROM sfcb_t WHERE sfcbent = g_enterprise AND sfcbdocno =  lc_param.sffb005
                                                                                  AND sfcb001 = lc_param.sffb006 AND sfcb005 = l_sfcb005 AND sfcb006 = l_sfcb006)
             ORDER BY sfcb002,sfcb003,sfcb004                                                                                
         
         LET l_sql2 = "   FROM sffb_t ",
                      "  WHERE sffbent  = ",g_enterprise,
                      "    AND sffbsite = '",g_site,"' ",
                      "    AND sffb005  = '",lc_param.sffb005,"' ",
                      "    AND sffb006  = ",lc_param.sffb006,
                      "    AND sffb007  = ? ",
                      "    AND sffb008  = ? ",
                      "    AND sffbstus <> 'X' "
         IF NOT cl_null(lc_param.sffbdocno) THEN
            IF cl_null(lc_param.sffbseq) THEN
               LET l_sql2 = l_sql2," AND NOT (sffbdocno = '",lc_param.sffbdocno,"')"
            ELSE
               LET l_sql2 = l_sql2," AND NOT (sffbdocno = '",lc_param.sffbdocno,"' AND sffbseq = ",lc_param.sffbseq,")"
            END IF
         END IF
        
         IF cl_null(lc_param.sffb001) THEN  #報廢
            LET l_sql2 = " SELECT MAX(SUM(sffb017+sffb018+sffb019+sffb020)) ",l_sql2," GROUP BY sffb001 "
         ELSE
            LET l_sql2 = " SELECT SUM(sffb017+sffb018+sffb019+sffb020) ",l_sql2," AND sffb001 = ? "
         END IF         
         PREPARE s_asft335_sffb_qty2 FROM l_sql2
       
         LET l_td_sum = 0 
         LET r_type = ''         
         FOREACH s_asft335_sel_sfcb003 INTO l_new_sfcb002,l_new_sfcb003,l_new_sfcb004

             IF l_new_sfcb003 = lc_param.sffb007 AND l_new_sfcb004 = lc_param.sffb008 THEN
                CONTINUE FOREACH
             END IF 
             #找作业编号+作业序的第一个报工点
             CALL s_asft335_get_first_action(lc_param.sffb005,lc_param.sffb006,l_new_sfcb003,l_new_sfcb004)
                RETURNING r_success,r_type 
                
             #r_type = '1':move in 2:check in 3:报工站 4:check out 5:move out
             EXECUTE s_asft335_sffb_qty2 USING l_new_sfcb003,l_new_sfcb004,r_type INTO l_qty2

             LET l_td_sum = l_td_sum + l_qty2
             
         END FOREACH 
         IF cl_null(l_td_sum) THEN LET l_td_sum = 0 END IF 
        #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) - l_qty - l_td_sum) THEN                                       #170920-00052#1 mark
        #IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum) THEN   #170920-00052#1 add  #180327-00060#1 mark
         IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3) THEN  #180327-00060#1   
            #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於其剩餘的標準產量%5
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00754'
           #LET g_errparam.popup = TRUE           #201202-00011#1 mark
            LET g_errparam.popup = lc_param.popup #201202-00011#1 add
            LET g_errparam.replace[1] = lc_param.sffb017
            LET g_errparam.replace[2] = lc_param.sffb018
            LET g_errparam.replace[3] = lc_param.sffb019
            LET g_errparam.replace[4] = lc_param.sffb020
           #LET g_errparam.replace[5] = (l_sfcb027*(1+l_imae020/100) - l_qty)  #180327-00060#1 mark
            LET g_errparam.replace[5] = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3)  #180327-00060#1   
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #180801-00034#1 add --(S)--
         #報廢量+當站下線量不可大於标准产出量用生产数量-已入库数量计算
         #IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3 - l_qty4) THEN   #181112-00037#1 mark
         IF lc_param.sffb018 + lc_param.sffb019 > (l_sfcb027*(1+l_imae020/100) - l_qty4) THEN   #181112-00037#1 add
            #報廢數量%1+當站下線數量%2不可大於其剩餘的標準產量%3-已完工入庫量%4
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00934'
           #LET g_errparam.popup = TRUE           #201202-00011#1 mark
            LET g_errparam.popup = lc_param.popup #201202-00011#1 add
            LET g_errparam.replace[1] = lc_param.sffb018
            LET g_errparam.replace[2] = lc_param.sffb019
           #LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3)   #181112-00037#1 mark
           #LET g_errparam.replace[3] = (l_sfcb027*(1+l_imae020/100) - l_qty4)   #181112-00037#1 add   #171129-00035#2 mark
            LET g_errparam.replace[3] = l_sfcb027*(1+l_imae020/100)                                    #171129-00035#2 add
            LET g_errparam.replace[4] = l_qty4
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #180801-00034#1 add --(E)--   
         #180907-00053#1 add --(S)--
         #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
         IF lc_param.sffb001 = '3' AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN
            IF lc_param.sffb017 + lc_param.sffb018 + lc_param.sffb019 + lc_param.sffb020> (l_sfcb_chk + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3) THEN
               #當前作業站齊套數量為%1，良品數量%2+報廢數量%3+當站下線數量%4+回收數量%5不可大於%6（含超交量）
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00937'
              #LET g_errparam.popup = TRUE           #201202-00011#1 mark
               LET g_errparam.popup = lc_param.popup #201202-00011#1 add
               LET g_errparam.replace[1] = l_fullqty
               LET g_errparam.replace[2] = lc_param.sffb017
               LET g_errparam.replace[3] = lc_param.sffb018
               LET g_errparam.replace[4] = lc_param.sffb019
               LET g_errparam.replace[5] = lc_param.sffb020
               LET g_errparam.replace[6] = l_sfcb_chk
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
         #180907-00053#1 add --(E)--         
      END IF 
      #170618-00518#1-E add         
   END IF
   
   FREE s_asft335_sffb_qty
   RETURN r_success
   #170117-00038#1-e
#170117-00038#1-s
#   DEFINE p_sffb005     LIKE sffb_t.sffb005
#   DEFINE p_sffb006     LIKE sffb_t.sffb006
#   DEFINE p_sffb007     LIKE sffb_t.sffb007
#   DEFINE p_sffb008     LIKE sffb_t.sffb008
#   DEFINE p_sffb017     LIKE sffb_t.sffb017
#   DEFINE p_sffb018     LIKE sffb_t.sffb018
#   DEFINE p_sffb019     LIKE sffb_t.sffb019
#   DEFINE p_sffb020     LIKE sffb_t.sffb020
#   DEFINE p_qty         LIKE sffb_t.sffb017
#   DEFINE r_success     LIKE type_t.num5
#   DEFINE l_qty         LIKE sfcb_t.sfcb050
#   DEFINE l_sfaa010     LIKE sfaa_t.sfaa010
#   DEFINE l_imae020     LIKE imae_t.imae020
#   DEFINE l_success     LIKE type_t.num5
#   DEFINE l_sfcb021     LIKE sfcb_t.sfcb021
#   DEFINE l_sfcb022     LIKE sfcb_t.sfcb022
#   #160804-00029#1-add-(S)
#   DEFINE l_sfcb027     LIKE sfcb_t.sfcb027  
#   DEFINE l_amt         LIKE type_t.num20_6  
#   DEFINE l_sql         STRING 
#   #160804-00029#1-add-(E)
#   
#   LET r_success = TRUE
#   LET l_qty = 0
#   IF p_qty IS NULL THEN LET p_qty = 0 END IF
#   IF p_sffb005 IS NULL THEN RETURN r_success END IF
#   IF p_sffb006 IS NULL THEN RETURN r_success END IF
#   IF p_sffb007 IS NULL THEN RETURN r_success END IF
#   IF p_sffb008 IS NULL THEN RETURN r_success END IF
#   IF p_sffb017 IS NULL THEN LET p_sffb017 = 0 END IF
#   IF p_sffb018 IS NULL THEN LET p_sffb018 = 0 END IF
#   IF p_sffb019 IS NULL THEN LET p_sffb019 = 0 END IF
#   IF p_sffb020 IS NULL THEN LET p_sffb020 = 0 END IF
#   
##抓工单对应数量和容许误差率
#   SELECT sfaa012,sfaa010 INTO l_qty,l_sfaa010
#     FROM sfaa_t
#    WHERE sfaaent = g_enterprise
#      AND sfaasite = g_site
#      AND sfaadocno = p_sffb005
#   IF l_qty IS NULL THEN 
#      LET l_qty = 0
#   END IF
#   SELECT imae020 INTO l_imae020
#     FROM imae_t
#    WHERE imaeent  = g_enterprise
#      AND imaesite = g_site
#      AND imae001  = l_sfaa010
#   IF l_imae020 IS NULL THEN
#      LET l_imae020 = 0
#   END IF
#   
#   CALL s_aooi200_get_slip(p_sffb005) RETURNING l_success,g_doc_slip
#   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN   #允许事后报工 ='N'      
#      #良品数量 + 报废数量 + 当站下线数量 + 回收数量 > 在制数量*(1+容許誤差率)
#      IF p_sffb017 + p_sffb018 + p_sffb019 + p_sffb020 > p_qty*(1+l_imae020/100) THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00010'  #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於待處理數量(含容許誤差率)%5！
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         LET g_errparam.replace[1] = p_sffb017
#         LET g_errparam.replace[2] = p_sffb018
#         LET g_errparam.replace[3] = p_sffb019
#         LET g_errparam.replace[4] = p_sffb020
#         LET g_errparam.replace[5] = p_qty*(1+l_imae020/100)
#         CALL cl_err()
#
#         LET r_success = FALSE
#      END IF      
#   ELSE
#      #160804-00029#1-add-(S)
#      #抓取當站標準產出量   
#      SELECT sfcb027 INTO l_sfcb027
#        FROM sfcb_t
#       WHERE sfcbent = g_enterprise
#         AND sfcbsite = g_site
#         AND sfcbdocno = p_sffb005   #單號
#         AND sfcb001 = p_sffb006     #RUN CARD
#         AND sfcb003 = p_sffb007     #本站作業
#         AND sfcb004 = p_sffb008     #作業序   #160920-00024#1 add
#      #抓取當站已轉良品量(抓其他張<>'X' & 抓當張+排除正在輸入的項次)
#      LET l_amt = 0
#      LET l_sql = " SELECT SUM(sffb017) + SUM(sffb018) + SUM(sffb019) + SUM(sffb020) ",
#                  "   FROM sffb_t ",
#                  "  WHERE sffbent = '",g_enterprise,"'",
#                  "    AND sffbsite = '",g_site,"'",
#                  "    AND sffb005 = '",p_sffb005,"'",
#                  "    AND sffb006 = '",p_sffb006,"'",
#                  "    AND sffb007 = '",p_sffb007,"'",
#                 #"    AND sfcb004 = '",p_sffb008,"'",   #160920-00024#1 add  #161230-00005#1 mark
#                  "    AND sffb008 = '",p_sffb008,"'",                        #161230-00005#1 mod
#                  "    AND sffbstus <> 'X'"
#      IF g_prog MATCHES 'asft330' THEN
#         #如果是按確認的話，會沒有項次，此時只需排除自己這張單就好
#         #如果是單身的部分，需要排除當下輸入的那一行項次
#         IF NOT cl_null(g_sffbseq) AND g_sffbseq = 0 THEN
#           LET l_sql = l_sql CLIPPED , " AND (sffbdocno <> '",g_sffadocno,"') "
#         ELSE
#           LET l_sql = l_sql CLIPPED , " AND ( (sffbdocno <> '",g_sffadocno,"' ) OR (sffbdocno = '",g_sffadocno,"'  AND sffbseq <> '",g_sffbseq,"') ) "
#         END IF
#      ELSE
#         #除了asft330以外的程式，都是單一報工，排除自己的單子就好
#         LET l_sql = l_sql CLIPPED , " AND (sffbdocno <> '",g_sffadocno,"') "
#      END IF
#      PREPARE s_asft335_sffb_qty FROM l_sql
#      EXECUTE s_asft335_sffb_qty INTO l_amt
#      IF cl_null(l_amt) THEN
#         LET l_amt = 0
#      END IF
#      #asft330(良品數量+報廢數量+當站下線+回收數量) > asft301(標準產出量)
#      #170112-00049#1-s
#      #IF p_sffb017 + p_sffb018 + p_sffb019 + p_sffb020 > (l_sfcb027 - l_amt) THEN
#      IF p_sffb017 + p_sffb018 + p_sffb019 + p_sffb020 > (l_sfcb027*(1+l_imae020/100) - l_amt) THEN
#      #170112-00049#1-e
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00754'  #良品數量%1+報廢數量%2+當站下線數量%3+回收數量%4不可大於其剩餘的標準產量%5
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         LET g_errparam.replace[1] = p_sffb017
#         LET g_errparam.replace[2] = p_sffb018
#         LET g_errparam.replace[3] = p_sffb019
#         LET g_errparam.replace[4] = p_sffb020
#         LET g_errparam.replace[5] = (l_sfcb027 - l_amt)
#         CALL cl_err()
#     
#         LET r_success = FALSE
#      END IF
#      FREE s_asft335_sffb_qty
#      #160804-00029#1-add-(E)
#      
#      #抓工单的生产数量
#      #把生产数量按制程的转换率分子分母转成这一站的数量
#      #固定这里是报工sffb001 =3，所以只需要抓转出单位分子分母
#      LET l_sfcb021 = NULL
#      LET l_sfcb022 = NULL
#      SELECT sfcb021,sfcb022 INTO l_sfcb021,l_sfcb022 
#        FROM sfcb_t
#       WHERE sfcbent  = g_enterprise
#         AND sfcbdocno = p_sffb005
#         AND sfcb001  = p_sffb006
#         AND sfcb003  = p_sffb007
#         AND sfcb004  = p_sffb008         
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 's_asft335_chk_qty_sel_sfcb021_sfcb022'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE
#         RETURN r_success
#      END IF 
#
#      LET p_qty = l_qty*l_sfcb021/l_sfcb022
#      
#      IF p_sffb017 + p_sffb018 + p_sffb019 + p_sffb020 > p_qty*(1+l_imae020/100) THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00011'  #良品數量+報廢數量+當站下線數量+回收數量不可大於工單生產數量！
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         LET r_success = FALSE
#      END IF 
#   END IF
#   RETURN r_success
#170117-00038#1-e
END FUNCTION
################################################################################
# Descriptions...: 建立临时表
# Memo...........: 必须用于事务外
# Usage..........: CALL s_asft335_cre_tmp_table()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      临时表建立成功否
# Date & Author..: 2014/01/15 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_cre_tmp_table()
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_sql           STRING    #160730-00003#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
 
 #用来存放审核报工当站的下一站资料  

   DROP TABLE s_asft335_tmp01; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp01(
      chk          LIKE type_t.chr1,       #去除重复使用的，N是没去过重复的，Y是去重之后的结果
      sfcbdocno    LIKE sfcb_t.sfcbdocno,
      sfcb001      LIKE sfcb_t.sfcb001,
      sfcb003      LIKE sfcb_t.sfcb003,
      sfcb004      LIKE sfcb_t.sfcb004,
      sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
      sfcb006      LIKE sfcb_t.sfcb006,     #群组
      type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
      sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
      sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
      amt          LIKE sfcb_t.sfcb050,     #与上面匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
      sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
      sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母 
   );
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp01'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF

#用来_prevsfcb_next所有报工的上站资料，所存_prev算后得出下站应该有多少数量

   DROP TABLE s_asft335_tmp02; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp02(
      chk          LIKE type_t.chr1,   #去除重复使用的，N是没去过重复的，Y是去重之后的结果   
      sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工单单号
      sfcb001      LIKE sfcb_t.sfcb001,     #RunCard单号
      sfcb003      LIKE sfcb_t.sfcb003,     #作业编号
      sfcb004      LIKE sfcb_t.sfcb004,     #制程序
      sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
      sfcb006      LIKE sfcb_t.sfcb006,     #群组
      type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
      sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
      sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
      amt          LIKE sfcb_t.sfcb050,     #与上面type匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
      sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
      sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
   );
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp02'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
#170420-00018#1 add(s)
#用来_prevsfcb_next所有报工的上站资料，所存_prev算后得出需要回写工单单头报废,下线多少数量

   DROP TABLE s_asft335_tmp03; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp03(
      chk          LIKE type_t.chr1,   #去除重复使用的，N是没去过重复的，Y是去重之后的结果   
      sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工单单号
      sfcb001      LIKE sfcb_t.sfcb001,     #RunCard单号
      sfcb003      LIKE sfcb_t.sfcb003,     #作业编号
      sfcb004      LIKE sfcb_t.sfcb004,     #制程序
      sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
      sfcb006      LIKE sfcb_t.sfcb006,     #群组
      type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
      sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
      sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
      amt1          LIKE sfcb_t.sfcb050,     #与上面type匹配的sfcb036,sfcb037
      amt2         LIKE sfcb_t.sfcb050,
      sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
      sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
   );
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp03'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF   
#170420-00018 add(e) 
   
   #170524-00070#1 add --(S)--
   #用来_prevsfcb_next所有重工轉入前报工的上站资料，所存_prev算后得出下站应该有多少数量

   DROP TABLE s_asft335_tmp04; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp04(
      chk          LIKE type_t.chr1,   #去除重复使用的，N是没去过重复的，Y是去重之后的结果   
      sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工单单号
      sfcb001      LIKE sfcb_t.sfcb001,     #RunCard单号
      sfcb003      LIKE sfcb_t.sfcb003,     #作业编号
      sfcb004      LIKE sfcb_t.sfcb004,     #制程序
      sfcb005      LIKE sfcb_t.sfcb005,     #群组性质
      sfcb006      LIKE sfcb_t.sfcb006,     #群组
      type         LIKE sffb_t.sffb001,     #报工类型，用12345对应sfcb014，sfcb015，sfcb016，sfcb018，sfcb019
      sfcb021      LIKE sfcb_t.sfcb021,     #转出单位换算率分子
      sfcb022      LIKE sfcb_t.sfcb022,     #转出单位换算率分母
      amt          LIKE sfcb_t.sfcb050,     #与上面type匹配的sfcb046，sfcb047，sfcb048，sfcb049，sfcb050
      sfcb053      LIKE sfcb_t.sfcb053,     #转入单位换算率分子
      sfcb054      LIKE sfcb_t.sfcb054      #转入单位换算率分母
   );
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp04'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   #170524-00070#1 add --(E)--
   
   #160730-00003#1 --s

   DROP TABLE s_asft335_sffbtmp; #ODI-ORA#
   # LET l_sql = " SELECT * FROM sffb_t ",
    LET l_sql = " 
                 SELECT sffbent,sffbsite,sffbdocno,sffbseq,
                        sffbdocdt,sffb001,sffb002,sffb003,sffb004,
                        sffb005,sffb006,sffb007,sffb008,sffb009,
                        sffb010,sffb011,sffb012,sffb013,sffb014,
                        sffb015,sffb016,sffb017,sffb018,sffb019,
                        sffb020,sffb021,sffb022,sffb023,sffb024,
                        sffb025,sffb026,sffb027,sffb028,sffbownid,
                        sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
                        sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
                        sffb030
                   FROM sffb_t ",
               "  WHERE sffbent = ",g_enterprise,
               #200505-00012#1 ---mark---s
#               "    AND sffbdocno  = 'xx'  ",
#               "    AND sffbseq = 0 ",
               #200505-00012#1 ---mark---e
               "    AND 1=2 ",   #200505-00012#1---add
               "   INTO TEMP s_asft335_sffbtmp "
   PREPARE s_asft335_cre_tmp_table_p1 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "PREPARE s_asft335_cre_tmp_table_p1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   EXECUTE s_asft335_cre_tmp_table_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asft335_cre_tmp_table_p1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   FREE s_asft335_cre_tmp_table_p1
   #160730-00003#1 --e
   
   #190709-00006#1 add --(S)--
   #存放製程展開後,本站作業/作業序與上站作業與作業序資料

   DROP TABLE s_asft335_tmp05; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp05(   
      sfcbdocno    LIKE sfcb_t.sfcbdocno,   #工單單號
      sfcb001      LIKE sfcb_t.sfcb001,     #RunCard單號
      sfcb002      LIKE sfcb_t.sfcb002,     #項次
      sfcb003      LIKE sfcb_t.sfcb003,     #本站作業
      sfcb004      LIKE sfcb_t.sfcb004,     #作業序
      sfcb005      LIKE sfcb_t.sfcb005,     #群組性質            #171129-00035#2 add
      sfcb006      LIKE sfcb_t.sfcb006,     #群組                #171129-00035#2 add
      sfcc003      LIKE sfcc_t.sfcc003,     #上站作業
      sfcc004      LIKE sfcc_t.sfcc004,     #上站作業序          #171129-00035#2 add ,
      sfcb005_1    LIKE sfcb_t.sfcb005,     #上站作業的群組性質   #171129-00035#2 add
      sfcb006_1    LIKE sfcb_t.sfcb006      #上站作業的群組       #171129-00035#2 add
   ); 
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp05'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #存放各路徑的報廢量/下線量資料資料

   DROP TABLE s_asft335_tmp06; #ODI-ORA#
   CREATE TEMP TABLE s_asft335_tmp06(   
      sfcb036      LIKE sfcb_t.sfcb036,    #報廢量
      sfcb037      LIKE sfcb_t.sfcb037     #下線量
   );
   
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create tmp06'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   #190709-00006#1 add --(E)--
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 获得下一站的所有上一站报工
# Memo...........:
# Usage..........: CALL s_asft335_get_prev_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success
# Input parameter: p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/10 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_prev_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE l_sfcb_prev         DYNAMIC ARRAY OF type_sfcb_prev
   DEFINE l_sfcb_prev1        DYNAMIC ARRAY OF RECORD
                              sfcb003  LIKE sfcb_t.sfcb003,
                              sfcb004  LIKE sfcb_t.sfcb004
                              END RECORD
   DEFINE l_sfcc003           DYNAMIC ARRAY OF LIKE sfcc_t.sfcc003       
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE j                   LIKE type_t.num5
   DEFINE l_sfcb002           LIKE sfcb_t.sfcb002
   DEFINE l_sfcb006           LIKE sfcb_t.sfcb006
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_errmsg            STRING
   
   LET r_success = TRUE
   LET l_errmsg = NULL
#先看本站里前续步骤是否有勾选的，有的话插入临时表，本站没有勾选前续步骤再找上上一站
   CALL s_asft335_get_prev_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004) RETURNING l_success,l_errmsg
   IF l_success THEN
      LET r_success = TRUE
      RETURN r_success
   ELSE
      IF l_errmsg IS NOT NULL THEN
         LET r_success = l_success
         RETURN r_success
      END IF
   END IF   

#找上一站参考s_asft335_get_next_station()的逻辑，先考虑sfcc里存的是明细的作业编号+作业序，再考虑存的是群组代号
   EXECUTE s_asft335_ins_sfcb_prev USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'EXECUTE s_asft335_ins_sfcb_prev'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF 

   PREPARE s_asft335_sel_sfcb_prev_pb FROM g_sel_sfcb_prev_sql
   DECLARE s_asft335_sel_sfcb_prev CURSOR FOR s_asft335_sel_sfcb_prev_pb
   OPEN s_asft335_sel_sfcb_prev USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   LET i = 1
   CALL l_sfcb_prev.clear()
   #FOREACH s_asft335_sel_sfcb_prev INTO l_sfcb_prev[i].*
   #161109-00085#55-s
   FOREACH s_asft335_sel_sfcb_prev 
      INTO l_sfcb_prev[i].chk,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004, 
           l_sfcb_prev[i].sfcb005,l_sfcb_prev[i].sfcb006,l_sfcb_prev[i].type,l_sfcb_prev[i].sfcb021,l_sfcb_prev[i].sfcb022,
           l_sfcb_prev[i].amt,l_sfcb_prev[i].sfcb053,l_sfcb_prev[i].sfcb054
   #161109-00085#55-e           
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      LET i = i + 1 
   END FOREACH
   FREE s_asft335_sel_sfcb_prev
   CLOSE s_asft335_sel_sfcb_prev 
   CALL l_sfcb_prev.deleteElement(l_sfcb_prev.getLength())
   IF l_sfcb_prev.getLength() > 0 THEN  
      FOR i = 1 TO l_sfcb_prev.getLength()
#这站没报工，递归去找上上一站(l_sfcb_prev.*的其他变量没用到，但还是都选出来，预留可能以后会用)
         IF NOT s_asft335_get_prev_station(0,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF  
      END FOR
   END IF
#以上是基于sfcc里上站作业编号存的是明细的作业编号，接下来考虑存的是群组 
#先把sfcc里存的群组都找出来（sfcc004 = 0 AND sfcc003 <> 'INIT'）
#再按每个群组包含的明细作业编号+作业序找出来，这些就是我们要找的上一站
#每一个上一站都先检查是否有勾选步骤，没有的话继续找上上站
   SELECT sfcb002,sfcb006 INTO l_sfcb002,l_sfcb006 
     FROM sfcb_t
    WHERE sfcbent    = g_enterprise
      AND sfcbdocno  = p_sfcbdocno
      AND sfcb001    = p_sfcb001
      AND sfcb003    = p_sfcb003
      AND sfcb004    = p_sfcb004
      
     
   DECLARE s_asft335_sel_sfcc003 CURSOR FOR
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是具体的作业编号
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = p_sfcb003
      AND sfcb010   = p_sfcb004
   UNION
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是下站所在的群组
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = l_sfcb006   #即使l_sfcb006是null也没关系，如果是null，那这段sql本来就不该选出资料来
  

   LET i = 1  #群组用
   LET j = 1  #明细作业编号用
   CALL l_sfcc003.clear()
   CALL l_sfcb_prev1.clear()
   FOREACH s_asft335_sel_sfcc003 INTO l_sfcc003[i]   #找到群组
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      DECLARE s_asft335_sel_sfcb_prev1 CURSOR FOR
      SELECT sfcb003,sfcb004 FROM sfcb_t
       WHERE sfcbent    = g_enterprise
         AND sfcbdocno  = p_sfcbdocno
         AND sfcb001    = p_sfcb001
         AND sfcb005    <> '1'
         AND sfcb006    = l_sfcc003[i]

      #FOREACH s_asft335_sel_sfcb_prev1 INTO l_sfcb_prev1[j].*  #找到明细作业编号+作业序
      #161109-00085#55-s
      FOREACH s_asft335_sel_sfcb_prev1 
         INTO l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004 #找到明细作业编号+作业序
      #161109-00085#55-e         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
         LET j = j + 1
      END FOREACH
         
      LET i = i + 1   
   END FOREACH
   
   CALL l_sfcb_prev1.deleteElement(l_sfcb_prev1.getLength())
   IF l_sfcb_prev1.getLength() > 0 THEN
      FOR j = 1 TO l_sfcb_prev1.getLength()
#先看明细作业编号里前续步骤是否有勾选的，有的话插入临时表，本站没有勾选前续步骤再找上上一站
         LET l_errmsg = NULL
         CALL s_asft335_get_prev_action(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) RETURNING l_success,l_errmsg
         IF l_success THEN         
            LET r_success = TRUE
            CONTINUE FOR   #这笔有勾选，继续处理下一笔
         ELSE              #这笔没勾选，找他的上上站
            IF l_errmsg IS NOT NULL THEN
               LET r_success = l_success
               RETURN r_success
            END IF         
            IF NOT s_asft335_get_prev_station(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END FOR
   END IF
   
   RETURN r_success   
END FUNCTION
################################################################################
# Descriptions...: 找到下一站
# Memo...........:
# Usage..........: CALL s_asft335_get_next_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success
# Input parameter: p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/10 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_next_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE l_sfcb_next         DYNAMIC ARRAY OF type_sfcb_next
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE l_sfcc002           DYNAMIC ARRAY OF LIKE sfcc_t.sfcc002
   DEFINE l_sfcb006           LIKE sfcb_t.sfcb006
   DEFINE l_sfcb003           LIKE sfcb_t.sfcb003        
   DEFINE l_sfcb004           LIKE sfcb_t.sfcb004 
   DEFINE l_sfcb009           LIKE sfcb_t.sfcb009
   DEFINE l_sfcb010           LIKE sfcb_t.sfcb010
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_errmsg            STRING
      
   
   LET r_success = TRUE
   LET l_errmsg = NULL
   #170109-00024#1-s-add
   #为后续查找上下站做cursor定义
   CALL s_asft335_declare_sfcb()
   #170109-00024#1-e-add
#先看本站里后续步骤是否有勾选的，有的话插入临时表，本站没有勾选后续步骤再找下一站
   CALL s_asft335_get_next_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004) RETURNING l_success,l_errmsg
   IF l_success THEN
      LET r_success = TRUE
      RETURN r_success
   ELSE
      IF l_errmsg IS NOT NULL THEN
         LET r_success = l_success
         RETURN r_success
      END IF
   END IF

#本站没有后续勾选步骤，找传入参数的所有下一站的第一个勾选步骤插入临时表
#找下一站分2种情况，假设本站是A，下一站是B
#1：A的作业编号+作业序在B的上站档sfcc里存在，用sfcc003=A AND sfcc004 = A的作业序 AND B有勾选步骤，就能找到B并插入临时表,
   EXECUTE s_asft335_ins_sfcb_next USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'EXECUTE s_asft335_ins_sfcb_next'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF 

#同上查询条件，但是5个步骤都没勾选的B站点找出来，继续找他们的下下站 
   PREPARE s_asft335_sel_sfcb_next_pb FROM g_sel_sfcb_next_sql
   DECLARE s_asft335_sel_sfcb_next CURSOR FOR s_asft335_sel_sfcb_next_pb
   OPEN s_asft335_sel_sfcb_next USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   LET i = 1
   #FOREACH s_asft335_sel_sfcb_next INTO l_sfcb_next[i].*  #161109-00085#55 MARK
   #161109-00085#55-s
   FOREACH s_asft335_sel_sfcb_next 
      INTO l_sfcb_next[i].chk,l_sfcb_next[i].sfcbdocno,l_sfcb_next[i].sfcb001,l_sfcb_next[i].sfcb003,l_sfcb_next[i].sfcb004,
           l_sfcb_next[i].sfcb005,l_sfcb_next[i].sfcb006,l_sfcb_next[i].type,l_sfcb_next[i].sfcb021,l_sfcb_next[i].sfcb022,
           l_sfcb_next[i].amt,l_sfcb_next[i].sfcb053,l_sfcb_next[i].sfcb054         
   #161109-00085#55-e           
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      LET i = i + 1
   END FOREACH
   FREE s_asft335_sel_sfcb_next
   CLOSE s_asft335_sel_sfcb_next
   CALL l_sfcb_next.deleteElement(l_sfcb_next.getLength())
   IF l_sfcb_next.getLength() > 0  THEN  
      FOR i = 1 TO l_sfcb_next.getLength()
#这站没报工，递归去找下下一站(l_sfcb_next.*的其他变量没用到，但还是都选出来，预留可能以后会用)
         IF NOT s_asft335_get_next_station(0,l_sfcb_next[i].sfcbdocno,l_sfcb_next[i].sfcb001,l_sfcb_next[i].sfcb003,l_sfcb_next[i].sfcb004) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END FOR
   END IF
#2：（忘了情况2的请往上看几十行） 
#A存在于一个叫T1的群组之内，那有可能B的sfcc里没有记录具体的A，而是记录了群组T1
#这时候就要先找到A处于哪个群组，然后用群组+0去sfcc里找，才能找到A的所有的下一站B（可能存在多个B）
#更新一点，还要加个条件，同时A的下站作业sfcb009要是B或者B所在的群组
   LET l_sfcb006 = NULL
   SELECT sfcb006,sfcb009,sfcb010 INTO l_sfcb006,l_sfcb009,l_sfcb010
     FROM sfcb_t
    WHERE sfcbent = g_enterprise
      AND sfcbdocno = p_sfcbdocno
      AND sfcb001   = p_sfcb001
      AND sfcb003   = p_sfcb003
      AND sfcb004   = p_sfcb004
      AND sfcb005   <> '1'   #要有群组,没群组的不要
    
   IF l_sfcb006 IS NOT NULL THEN  #有群组，按群组到sfcc里去找B
      DECLARE s_asft335_sel_sfcc_next_mult CURSOR FOR 
       SELECT sfcc002                    #A的下一站存的是B本身作业编号
         FROM sfcc_t,sfcb_t
        WHERE sfccent = g_enterprise
          AND sfccdocno = p_sfcbdocno
          AND sfcc001   = p_sfcb001  
          AND sfcc003   = l_sfcb006
          AND sfcc004   = '0'
          AND sfcbent   = sfccent
          AND sfcbsite  = sfccsite
          AND sfcbdocno = sfccdocno
          AND sfcb001   = sfcc001
          AND sfcb002   = sfcc002
          AND sfcb003   = l_sfcb009
          AND sfcb004   = l_sfcb010   
      UNION
       SELECT sfcc002                     #A的下一站存的是B所在的群组
         FROM sfcc_t,sfcb_t
        WHERE sfccent = g_enterprise
          AND sfccdocno = p_sfcbdocno
          AND sfcc001   = p_sfcb001  
          AND sfcc003   = l_sfcb006
          AND sfcc004   = '0'
          AND sfcbent   = sfccent
          AND sfcbsite  = sfccsite
          AND sfcbdocno = sfccdocno
          AND sfcb001   = sfcc001
          AND sfcb002   = sfcc002
          AND sfcb005 <> '1'             
          AND sfcb006   = l_sfcb009
          
      CALL l_sfcc002.clear() 
      LET i = 1
#l_sfcc002就是A的下一站B的项次，然后先找B站的每一个步骤，看是否有勾选Y，没勾选，再递归找B的下一站
      FOREACH s_asft335_sel_sfcc_next_mult INTO l_sfcc002[i]
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
         LET i = i + 1
      END FOREACH
      FREE s_asft335_sel_sfcc_next_mult
      CLOSE s_asft335_sel_sfcc_next_mult
      CALL l_sfcc002.deleteElement(l_sfcc002.getLength())
      IF l_sfcc002.getLength() > 0  THEN       
         FOR i = 1 TO l_sfcc002.getLength()
#先找B的每一个步骤
            LET l_sfcb003 = NULL
            LET l_sfcb004 = NULL
            SELECT sfcb003,sfcb004 INTO l_sfcb003,l_sfcb004
              FROM sfcb_t
             WHERE sfcbent = g_enterprise
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb002   = l_sfcc002[i]
             
            LET l_errmsg = NULL 
            CALL s_asft335_get_next_action(0,p_sfcbdocno,p_sfcb001,l_sfcb003,l_sfcb004) RETURNING l_success,l_errmsg
            IF l_success THEN
               LET r_success = TRUE
               CONTINUE FOR   #这里不能return，因为可能有多个下一站，这行找到了勾选步骤，还要接着找下一笔的
            ELSE              #这里就是没勾选步骤，接着找下下站
               IF l_errmsg IS NOT NULL THEN    #有错误了，不做了，直接返回
                  LET r_success = l_success
                  RETURN r_success
               END IF
               IF NOT s_asft335_get_next_station(0,p_sfcbdocno,p_sfcb001,l_sfcb003,l_sfcb004) THEN
                  LET r_success = FALSE
                  RETURN r_success
               END IF            
            END IF
         END FOR 
      END IF         
   END IF   
   RETURN r_success   
END FUNCTION
################################################################################
# Descriptions...: 报工单中工单+runcard栏位带来的预设值（生产料号，工单使用制程否，RunCard单号，作业，制程序，工作站）
# Memo...........:
# Usage..........: CALL s_asft335_default_sffb056(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
#                  RETURNING r_sfaa010,r_sffb007,r_sffb008
# Input parameter: p_sffb001      报工类型
#                : p_sffb005      工单单号
#                : p_sffb006      runcard单号
#                : p_sffb007      作业编号
#                : p_sffb008      作业序
# Return code....: r_sffa010      生产料号
#                : r_sffa061      工单使用制程否
#                : r_sffb006      runcard单号
#                : r_sffb007      作业编号
#                : r_sffb008      制程序
#                : r_sffb009      工作站
# Date & Author..: 2014/01/05  By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_default_sffb056(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
   DEFINE p_sffb001       LIKE sffb_t.sffb001
   DEFINE p_sffb005       LIKE sffb_t.sffb005
   DEFINE p_sffb006       LIKE sffb_t.sffb006 
   DEFINE p_sffb007       LIKE sffb_t.sffb007
   DEFINE p_sffb008       LIKE sffb_t.sffb008
   DEFINE r_sfaa010       LIKE sfaa_t.sfaa010  
   DEFINE r_sffb006       LIKE sffb_t.sffb006   
   DEFINE r_sffb007       LIKE sffb_t.sffb007 
   DEFINE r_sffb008       LIKE sffb_t.sffb008 
   DEFINE r_sffb009       LIKE sffb_t.sffb009   
   DEFINE l_cnt           LIKE type_t.num5 
   DEFINE l_sfca001       LIKE sfca_t.sfca001   
   DEFINE l_sfcb003       LIKE sfcb_t.sfcb003 
   DEFINE l_sfcb004       LIKE sfcb_t.sfcb004
   DEFINE l_sfcb011       LIKE sfcb_t.sfcb011  
   DEFINE l_sfaa010       LIKE sfaa_t.sfaa010
   DEFINE l_sfaa061       LIKE sfaa_t.sfaa061
   DEFINE r_sffb030       LIKE sffb_t.sffb030   #fengmy151013 add
   DEFINE l_sfaa068       LIKE sfaa_t.sfaa068   #201013-00010#1 add
   
   WHENEVER ERROR CONTINUE
 #抓取工单号对应的料号  
   LET r_sfaa010  = NULL  
   LET r_sffb006  = NULL   
   LET r_sffb007  = NULL 
   LET r_sffb008  = NULL 
   LET r_sffb009  = NULL   
   LET l_cnt      = 0 
   LET l_sfca001  = NULL   
   LET l_sfcb003  = NULL 
   LET l_sfcb004  = NULL
   LET l_sfcb011  = NULL  
   LET l_sfaa010  = NULL
   LET l_sfaa061  = NULL  
   LET r_sffb030  = NULL  #fengmy151016
   LET l_sfaa068  = NULL  #201013-00010#1 add
   
   IF p_sffb005 IS NULL THEN
      RETURN r_sfaa010,r_sffb006,r_sffb007,r_sffb008,r_sffb009,r_sffb030  #fengmy151016 add r_sffb030
   END IF
   
  #SELECT sfaa010,sfaa061 INTO l_sfaa010,l_sfaa061 FROM sfaa_t                   #201013-00010#1 mark
   SELECT sfaa010,sfaa061,sfaa068 INTO l_sfaa010,l_sfaa061,l_sfaa068 FROM sfaa_t #201013-00010#1 add
    WHERE sfaaent   = g_enterprise
      AND sfaasite  = g_site
      AND sfaadocno = p_sffb005

#如果使用制程，传入的作业编号，作业序是空格，就清空，可能是上次工单号是不使用制程给了空格的
   IF l_sfaa061 = 'Y' THEN
      IF p_sffb007 = ' ' THEN LET p_sffb007 = NULL END IF
      IF p_sffb008 = ' ' THEN LET p_sffb008 = NULL END IF
   END IF
 #如果传入的p_sffb006是null，则判断当工单号对应的run card是唯一的时，预设run card值
   LET l_sfca001 = NULL
   IF p_sffb006 IS NULL THEN
      SELECT COUNT(sfca001) INTO l_cnt FROM sfca_t
       WHERE sfcaent  = g_enterprise
         AND sfcasite = g_site
         AND sfcadocno= p_sffb005
      IF l_cnt = 1 THEN 
         SELECT sfca001 INTO l_sfca001 FROM sfca_t
          WHERE sfcaent  = g_enterprise
            AND sfcasite = g_site
            AND sfcadocno= p_sffb005
            
      END IF
   ELSE
      LET l_sfca001 = p_sffb006
   END IF
#若有工单和Run Card，则根据作业类别选择不同的作业编号预设值
   IF l_sfca001 IS NOT NULL AND l_sfaa061 = 'Y' AND p_sffb001 IS NOT NULL THEN
#作业编号为空
      IF p_sffb007 IS NULL THEN
         LET p_sffb006 = l_sfca001
#带出作业编号+制程序
         LET l_cnt = 0
         LET l_sfcb003 = NULL
         LET l_sfcb004 = NULL
         LET l_sfcb011 = NULL
         CASE p_sffb001
           WHEN '1'   #Move In
              SELECT COUNT(sfcb003) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb046 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb003 INTO l_sfcb003
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb046 > 0
              END IF
                 
           WHEN '2'   #Check In
              SELECT COUNT(sfcb003) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb047 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb003 INTO l_sfcb003
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb047 > 0
              END IF
           WHEN '3'   #报工
              SELECT COUNT(sfcb003) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb050 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb003 INTO l_sfcb003
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb050 > 0
              END IF
           WHEN '4'   #Check Out
              SELECT COUNT(sfcb003) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb048 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb003 INTO l_sfcb003
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb048 > 0
              END IF
           WHEN '5'   #Move Out
              SELECT COUNT(sfcb003) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb049 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb003 INTO l_sfcb003
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb049 > 0
              END IF
         END CASE
         IF l_cnt = 1 THEN
            IF p_sffb007 IS NOT NULL THEN
               LET l_sfcb003 = p_sffb007
            END IF
            LET l_cnt = 0
            SELECT COUNT(sfcb004) INTO l_cnt
              FROM sfcb_t
             WHERE sfcbent  = g_enterprise
               AND sfcbsite = g_site
               AND sfcbdocno= p_sffb005
               AND sfcb001  = p_sffb006
               AND sfcb003  = l_sfcb003
         
            IF l_cnt = 1 THEN
               LET l_sfcb004 = NULL
               LET l_sfcb011 = NULL
               SELECT sfcb004,sfcb011 INTO l_sfcb004,l_sfcb011
                 FROM sfcb_t
                WHERE sfcbent  = g_enterprise
                  AND sfcbsite = g_site
                  AND sfcbdocno= p_sffb005
                  AND sfcb001  = p_sffb006
                  AND sfcb003  = l_sfcb003
            END IF
         END IF
      END IF
#作业编号不为空
      IF p_sffb007 IS NOT NULL THEN
         LET p_sffb006 = l_sfca001
#带出制程序
         LET l_cnt = 0
         LET l_sfcb003 = NULL
         LET l_sfcb004 = NULL
         LET l_sfcb011 = NULL
         CASE p_sffb001
           WHEN '1'   #Move In
              SELECT COUNT(sfcb004) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb003  = p_sffb007
                 AND sfcb046 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb004 INTO l_sfcb004
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb003  = p_sffb007
                    AND sfcb046 > 0
              END IF
                 
           WHEN '2'   #Check In
              SELECT COUNT(sfcb004) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb003  = p_sffb007
                 AND sfcb047 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb004 INTO l_sfcb004
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb003  = p_sffb007
                    AND sfcb047 > 0
              END IF
           WHEN '3'   #报工
              SELECT COUNT(sfcb004) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb003  = p_sffb007
                 AND sfcb050 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb004 INTO l_sfcb004
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb003  = p_sffb007
                    AND sfcb050 > 0
              END IF
           WHEN '4'   #Check Out
              SELECT COUNT(sfcb004) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb003  = p_sffb007
                 AND sfcb048 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb004 INTO l_sfcb004
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb003  = p_sffb007
                    AND sfcb048 > 0
              END IF
           WHEN '5'   #Move Out
              SELECT COUNT(sfcb004) INTO l_cnt
                FROM sfcb_t
               WHERE sfcbent  = g_enterprise
                 AND sfcbsite = g_site
                 AND sfcbdocno= p_sffb005
                 AND sfcb001  = p_sffb006
                 AND sfcb003  = p_sffb007
                 AND sfcb049 > 0
              IF l_cnt = 1 THEN   
                 SELECT sfcb004 INTO l_sfcb004
                   FROM sfcb_t
                  WHERE sfcbent  = g_enterprise
                    AND sfcbsite = g_site
                    AND sfcbdocno= p_sffb005
                    AND sfcb001  = p_sffb006
                    AND sfcb003  = p_sffb007
                    AND sfcb049 > 0
              END IF
         END CASE
      END IF
   END IF 
  
   LET r_sfaa010  = l_sfaa010 
   LET r_sffb006  = l_sfca001 
   IF p_sffb007 IS NOT NULL THEN LET l_sfcb003 = p_sffb007 END IF
   IF p_sffb008 IS NOT NULL THEN LET l_sfcb004 = p_sffb008 END IF
   IF l_sfaa061 = 'Y' THEN   
      LET r_sffb007  = l_sfcb003
      LET r_sffb008  = l_sfcb004
   ELSE
      LET r_sffb007  = ' '
      LET r_sffb008  = ' '   
   END IF
   IF l_sfcb011 IS NULL THEN
      SELECT sfcb011 INTO l_sfcb011
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = r_sffb007
         AND sfcb004  = r_sffb008
   END IF
   LET r_sffb009  = l_sfcb011
   
   CALL s_asft335_default_sffb030(r_sffb009) RETURNING r_sffb030 #fengmy151013 add
   
   #201013-00010#1---add---str---
   IF cl_null(r_sffb030) AND NOT cl_null(l_sfaa068) THEN
       LET r_sffb030 = l_sfaa068
   END IF
   #201013-00010#1---add---end---
   
   RETURN r_sfaa010,r_sffb006,r_sffb007,r_sffb008,r_sffb009,r_sffb030

END FUNCTION
################################################################################
# Descriptions...: 找到当前作业编号+制程序的下一站中第一个勾选的步骤并更新它的待xx数量
# Memo...........:
# Usage..........: CALL s_asft335_upd_next_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success
# Input parameter: p_cmd          审核1/取消审核-1
#                : p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2013/12/24 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_next_station(p_cmd,p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_cmd               LIKE type_t.num5             #审核 1/取消审核 -1   
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型 0 表示从发料过来的
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE j                   LIKE type_t.num5
   DEFINE l_sfcb_next         type_sfcb_next    
   DEFINE l_amt               LIKE sffb_t.sffb017    
   DEFINE l_sfcb046           LIKE sfcb_t.sfcb046
   DEFINE l_sfcb047           LIKE sfcb_t.sfcb047
   DEFINE l_sfcb048           LIKE sfcb_t.sfcb048
   DEFINE l_sfcb049           LIKE sfcb_t.sfcb049
   DEFINE l_sfcb050           LIKE sfcb_t.sfcb050
#为后续查找上下站做cursor定义
   CALL s_asft335_declare_sfcb()
   LET r_success = TRUE
#先找到所有的下一站（但是数量栏位都是原始的未改过的，最后计算了才累加上去）
   DELETE FROM s_asft335_tmp01
   IF NOT s_asft335_get_next_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#去除重复站点
   INSERT INTO s_asft335_tmp01 
   SELECT DISTINCT 'Y',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,type,sfcb021,sfcb022,amt,sfcb053,sfcb054
     FROM s_asft335_tmp01
   DELETE FROM s_asft335_tmp01 WHERE chk = 'N'
#再根据每一个下一站，找到它的所有的上站报工，也就是和现在正在审核的一个阶层的站，综合这一阶层站的数量，更新下一站的数量
   #DECLARE s_asft335_sel_sfcb_next_tmp CURSOR FOR SELECT * FROM s_asft335_tmp01 ORDER BY sfcb003,sfcb004 #161109-00085#55 MARK
   #FOREACH s_asft335_sel_sfcb_next_tmp INTO l_sfcb_next.*  #161109-00085#55 MARK
   #161109-00085#55-s
   DECLARE s_asft335_sel_sfcb_next_tmp CURSOR FOR SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                                                         sfcb005,sfcb006,type,sfcb021,sfcb022,
                                                         amt,sfcb053,sfcb054   
                                                    FROM s_asft335_tmp01 ORDER BY sfcb003,sfcb004
   FOREACH s_asft335_sel_sfcb_next_tmp INTO l_sfcb_next.chk,l_sfcb_next.sfcbdocno,l_sfcb_next.sfcb001,l_sfcb_next.sfcb003,l_sfcb_next.sfcb004,
                                            l_sfcb_next.sfcb005,l_sfcb_next.sfcb006,l_sfcb_next.type,l_sfcb_next.sfcb021,l_sfcb_next.sfcb022,
                                            l_sfcb_next.amt,l_sfcb_next.sfcb053,l_sfcb_next.sfcb054
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      DELETE FROM s_asft335_tmp02
      IF NOT s_asft335_get_prev_station(l_sfcb_next.type,l_sfcb_next.sfcbdocno,l_sfcb_next.sfcb001,l_sfcb_next.sfcb003,l_sfcb_next.sfcb004) THEN
         LET r_success = FALSE
         RETURN r_success      
      END IF
#同样去除重复
      INSERT INTO s_asft335_tmp02 
      SELECT DISTINCT 'Y',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,type,
                      sfcb021,sfcb022,amt,sfcb053,sfcb054 
        FROM s_asft335_tmp02
      DELETE FROM s_asft335_tmp02 WHERE chk = 'N'
      IF NOT s_asft335_calculate()  THEN   #计算数量，用来更新到对应的下一站点数量（含合并同一替代群组的数量）  
         LET r_success = FALSE
         RETURN r_success      
      END IF
      #200319-00035#1---add----str---
      IF g_prog MATCHES 'aqct300*' THEN
          LET l_amt = NULL
          SELECT MIN(amt) INTO l_amt FROM s_asft335_tmp02 a,sfcb_t b
           WHERE a.sfcbdocno = b.sfcbdocno
             AND a.sfcb001   = b.sfcb001
             AND a.sfcb003   = b.sfcb003
             AND a.sfcb004   = b.sfcb004
             AND b.sfcbent   = g_enterprise
             AND b.sfcbsite  = g_site
             AND b.sfcb017 = 'Y'  #PQC='Y'
          IF l_amt IS NULL THEN LET l_amt = 0 END IF
      ELSE
      #200319-00035#1---add----end---
          #上一站的数据都更新进去了，该取个最小值更新到下一站了
          LET l_amt = NULL
          SELECT MIN(amt) INTO l_amt FROM s_asft335_tmp02
          IF l_amt IS NULL THEN LET l_amt = 0 END IF
      END IF #200319-00035#1 add      
#更新下一站数量到sfcb实体表
      IF NOT s_asft335_upd_sfcb(p_cmd,l_sfcb_next.*,l_amt) THEN
         LET r_success = FALSE
         RETURN r_success 
      END IF

   END FOREACH
   FREE s_asft335_sel_sfcb_next_tmp
   CLOSE s_asft335_sel_sfcb_next_tmp
   
   RETURN r_success
   
 

END FUNCTION
################################################################################
# Descriptions...: 取得上一次的完成日期时间，回传空值表示找不到上一站或者出错了
# Memo...........:
# Usage..........: CALL s_asft335_get_prev_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
#                  RETURNING r_prev_date,r_prev_time
# Input parameter: p_sffb001      传入作业类别
#                : p_sffb005      传入工单单号
#                : p_sffb006      传入Run Card单号
#                : p_sffb007      传入作业编号
#                : p_sffb008      传入制程序
# Return code....: r_prev_sffb007      回传作业编号
#                : r_prev_sffb008      回传制程序
#                : r_prev_date    回传上次完成日期
#                : r_prev_time    回传上次完成时间
# Date & Author..: 2013/12/03 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_prev_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
   DEFINE p_sffb001        LIKE sffb_t.sffb001  #如果传‘6’进来，表示是下一站进来找上一站最后一步勾选步骤的
   DEFINE p_sffb005        LIKE sffb_t.sffb005
   DEFINE p_sffb006        LIKE sffb_t.sffb006
   DEFINE p_sffb007        LIKE sffb_t.sffb007
   DEFINE p_sffb008        LIKE sffb_t.sffb008
   DEFINE r_prev_sffb007   LIKE sffb_t.sffb007
   DEFINE r_prev_sffb008   LIKE sffb_t.sffb008
   DEFINE r_prev_date      LIKE sffb_t.sffb012
   DEFINE r_prev_time      LIKE sffb_t.sffb013
   DEFINE l_prev_step      LIKE sffb_t.sffb001   
   #161109-00085#55-s
   #DEFINE l_sfcb           RECORD LIKE sfcb_t.*  
   DEFINE l_sfcb RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e
   #161109-00085#55-s
   #DEFINE l_prev_sfcb DYNAMIC ARRAY OF RECORD LIKE sfcb_t.*
      DEFINE l_prev_sfcb DYNAMIC ARRAY OF RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e   
   DEFINE l_stus           LIKE type_t.chr5   #报工有5个状态 
   DEFINE i                LIKE type_t.num5
   DEFINE l_prev_sffb001   LIKE sffb_t.sffb001
   DEFINE l_prev_sffb007   LIKE sffb_t.sffb007
   DEFINE l_prev_sffb008   LIKE sffb_t.sffb008   
   DEFINE l_prev_date      LIKE sffb_t.sffb012
   DEFINE l_prev_time      LIKE sffb_t.sffb013
   
#先获取当前这笔制程单身的状态sfcb014,sfcb015,sfcb016,sfcb018,sfcb019哪些步骤是需要做的，当前在哪一步，从而对应的上一步是什么
#若已经是当前站第一步，比如是Move In，则去找上一站，按asft301制程单身的上一站作业编号+上一站制程序去找
#同理对上一站分析有几步需要做，取最后一步
#根据取得的第几步骤资料，去找对应的报工单资料，然后取时间 
   WHENEVER ERROR CONTINUE   
   INITIALIZE l_sfcb.* TO NULL
   CALL l_prev_sfcb.clear()
   LET l_prev_step = NULL
   LET r_prev_sffb007 = NULL
   LET r_prev_sffb008 = NULL
   LET r_prev_date = NULL
   LET r_prev_time = NULL  


   
#工单，Run Card，作业，制程序不能为空   
   IF p_sffb001 IS NULL OR p_sffb005 IS NULL OR p_sffb006 IS NULL OR p_sffb007 IS NULL OR p_sffb008 IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00012'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()

      RETURN r_prev_sffb007,r_prev_sffb008,r_prev_date,r_prev_time
   END IF

 WHILE TRUE   #210429-00003#1 add
    #161109-00085#55-s
    #SELECT * INTO l_sfcb.* FROM sfcb_t
    SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
           sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
           sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
           sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
           sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
           sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
           sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
           sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
           sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
           sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
           sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
           sfcb053,sfcb054,sfcb055
      INTO l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
           l_sfcb.sfcb003,l_sfcb.sfcb004,l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.sfcb007,
           l_sfcb.sfcb008,l_sfcb.sfcb009,l_sfcb.sfcb010,l_sfcb.sfcb011,l_sfcb.sfcb012,
           l_sfcb.sfcb013,l_sfcb.sfcb014,l_sfcb.sfcb015,l_sfcb.sfcb016,l_sfcb.sfcb017,
           l_sfcb.sfcb018,l_sfcb.sfcb019,l_sfcb.sfcb020,l_sfcb.sfcb021,l_sfcb.sfcb022,
           l_sfcb.sfcb023,l_sfcb.sfcb024,l_sfcb.sfcb025,l_sfcb.sfcb026,l_sfcb.sfcb027,
           l_sfcb.sfcb028,l_sfcb.sfcb029,l_sfcb.sfcb030,l_sfcb.sfcb031,l_sfcb.sfcb032,
           l_sfcb.sfcb033,l_sfcb.sfcb034,l_sfcb.sfcb035,l_sfcb.sfcb036,l_sfcb.sfcb037,
           l_sfcb.sfcb038,l_sfcb.sfcb039,l_sfcb.sfcb040,l_sfcb.sfcb041,l_sfcb.sfcb042,
           l_sfcb.sfcb043,l_sfcb.sfcb044,l_sfcb.sfcb045,l_sfcb.sfcb046,l_sfcb.sfcb047,
           l_sfcb.sfcb048,l_sfcb.sfcb049,l_sfcb.sfcb050,l_sfcb.sfcb051,l_sfcb.sfcb052,
           l_sfcb.sfcb053,l_sfcb.sfcb054,l_sfcb.sfcb055     
      FROM sfcb_t
    #161109-00085#55-e     
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = p_sffb005
      AND sfcb001   = p_sffb006
      AND sfcb003   = p_sffb007
      AND sfcb004   = p_sffb008
   
   IF sqlca.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00013'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()

      RETURN r_prev_sffb007,r_prev_sffb008,r_prev_date,r_prev_time
   END IF 
   
#l_stus一共有5位，每一位是Y/N，表示这一站里，move in/check in/报工/check out/move out是否勾选   
   LET l_stus = null    
   IF l_sfcb.sfcb014 = 'Y' THEN
      LET l_stus = 'Y'
   ELSE
      LET l_stus = 'N'
   END IF
   IF l_sfcb.sfcb015 = 'Y' THEN
      LET l_stus = l_stus CLIPPED,'Y'
   ELSE
      LET l_stus = l_stus CLIPPED,'N'
   END IF
   IF l_sfcb.sfcb016 = 'Y' THEN
      LET l_stus = l_stus CLIPPED,'Y'
   ELSE
      LET l_stus = l_stus CLIPPED,'N'
   END IF
   IF l_sfcb.sfcb018 = 'Y' THEN
      LET l_stus = l_stus CLIPPED,'Y'
   ELSE
      LET l_stus = l_stus CLIPPED,'N'
   END IF
   IF l_sfcb.sfcb019 = 'Y' THEN
      LET l_stus = l_stus CLIPPED,'Y'
   ELSE
      LET l_stus = l_stus CLIPPED,'N'
   END IF

#根据本张报工单的sffb001状态，定位处于l_stus第几位，然后去找之前最近的一个Y，就是上一步骤
   IF p_sffb001 > 1 THEN     #Move In步骤没有上一步骤
      FOR i = 1 TO p_sffb001 - 1
          IF l_stus[p_sffb001-i,p_sffb001-i] = 'Y' THEN   #有步骤是被勾选的
             CASE p_sffb001-i    #写这个是因为l_prev_step 如果等于‘1.0’这样的，会在sffb里找不到
              WHEN 1
                LET l_prev_step = '1'
                EXIT FOR
              WHEN 2
                LET l_prev_step = '2'
                EXIT FOR
              WHEN 3
                LET l_prev_step = '3'
                EXIT FOR
              WHEN 4
                LET l_prev_step = '4'
                EXIT FOR
              WHEN 5
                LET l_prev_step = '5'
                EXIT FOR
             END CASE
          END IF    
      END FOR
   END IF

#本站内当前步骤之前没有步骤被勾选，则去找上一站的最后一个勾选步骤，如果再没有，继续上一站，递归了。。。
   IF l_prev_step IS NOT NULL THEN
#抓上一工单报工时间


#抓上一工单报工时间,可能多次报工，需要抓最大的时间
      DECLARE s_asft335_sel_max_prev_time CURSOR FOR
      SELECT sffb007,sffb008,sffb012,sffb013 
        FROM sffb_t
       #WHERE sffb001 = l_prev_step   #170210-00017#3 20170210 mark by beckxie
       WHERE sffbent = g_enterprise   #170210-00017#3 20170210 add by beckxie
         AND sffb001 = l_prev_step    #170210-00017#3 20170210 add by beckxie
         AND sffb005 = p_sffb005
         AND sffb006 = p_sffb006
         AND sffb007 = p_sffb007
         AND sffb008 = p_sffb008
         AND sffbstus <> 'X'

      FOREACH s_asft335_sel_max_prev_time INTO l_prev_sffb007,l_prev_sffb008,l_prev_date,l_prev_time 
#第一次循环
         IF r_prev_date IS NULL THEN 
            LET r_prev_date = l_prev_date 
            LET r_prev_sffb007 = l_prev_sffb007
            LET r_prev_sffb008 = l_prev_sffb008
         END IF
         IF r_prev_time IS NULL THEN 
            LET r_prev_time = l_prev_time 
            LET r_prev_sffb007 = l_prev_sffb007
            LET r_prev_sffb008 = l_prev_sffb008
         END IF
#每次比大小，取大的保留
#日期大，就是大
#         IF l_prev_date > r_prev_date THEN  #170419-00052#1 mark 
          IF l_prev_date < r_prev_date THEN  #170419-00052#1 add
            LET r_prev_sffb007 = l_prev_sffb007 
            LET r_prev_sffb008 = l_prev_sffb008                  
            LET r_prev_date = l_prev_date
            LET r_prev_time = l_prev_time
         END IF
#日期一样，再比时间,时间大，才是真的大
         IF l_prev_date = r_prev_date THEN
#            IF l_prev_time > r_prev_time THEN  #170419-00052#1 mark 
             IF l_prev_time < r_prev_time THEN  #170419-00052#1 add
               LET r_prev_sffb007 = l_prev_sffb007 
               LET r_prev_sffb008 = l_prev_sffb008
               LET r_prev_date = l_prev_date
               LET r_prev_time = l_prev_time
            END IF
         END IF
      END FOREACH
      FREE s_asft335_sel_max_prev_time
      CLOSE s_asft335_sel_max_prev_time
      IF r_prev_sffb007 IS NULL THEN
         #170618-00096#1-S mark
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00014'
#         LET g_errparam.extend = l_sfcb.sfcb002
#         LET g_errparam.popup = FALSE
#         CALL cl_err()
         #170618-00096#1-E mark
    #报上站资料未报工
         LET r_prev_sffb007 = NULL
         LET r_prev_sffb008 = NULL
         LET r_prev_date = NULL
         LET r_prev_time = NULL
      END IF   
   END IF                         #210429-00003#1 add    
  #ELSE                           #210429-00003#1 mark
   IF r_prev_sffb007 IS NULL THEN #210429-00003#1 add
#本站没有找到上一步骤，去上一站找
      LET l_prev_sffb001 = '6'     #这里写6，这样才能将上一站里5个状态都遍历一次（l_stus做for那段，6-1=5）      
      CASE l_sfcb.sfcb007
        WHEN 'INIT'    #本站是第一站，再找不到，就回传空值吧
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'asf-00015'
          LET g_errparam.extend = ''
          LET g_errparam.popup = FALSE
          CALL cl_err()
          LET r_prev_sffb007='INIT' #210429-00003#1 add

        OTHERWISE      #把所有上站都遍历一次，找到的时间取最大的那个
          DECLARE s_asft335_sel_sfcb_prev_time CURSOR FOR             #抓出上一站点
           SELECT B.* FROM sfcb_t A,sfcb_t B,sfcc_t                   #上站群组存的是具体作业编号的  A是本站，B是上站
            WHERE A.sfcbent   = g_enterprise 
              AND A.sfcbsite  = g_site 
              AND A.sfcbdocno = p_sffb005
              AND A.sfcb001   = p_sffb006
              AND A.sfcb003   = p_sffb007
              AND A.sfcb004   = p_sffb008
              AND A.sfcbent   = sfccent
              AND A.sfcbsite  = sfccsite
              AND A.sfcbdocno = sfccdocno
              AND A.sfcb001   = sfcc001
              AND A.sfcb002   = sfcc002
              AND B.sfcbent   = sfccent
              AND B.sfcbsite  = sfccsite
              AND B.sfcbdocno = sfccdocno 
              AND B.sfcb001   = sfcc001              
              AND B.sfcb003   = sfcc003
              AND B.sfcb004   = sfcc004
            UNION
           SELECT B.* FROM sfcb_t A,sfcb_t B,sfcc_t                   #上站群组存的是群组的  A是本站，B是上站
            WHERE A.sfcbent   = g_enterprise 
              AND A.sfcbsite  = g_site 
              AND A.sfcbdocno = p_sffb005
              AND A.sfcb001   = p_sffb006
              AND A.sfcb003   = p_sffb007
              AND A.sfcb004   = p_sffb008
              AND A.sfcbent   = sfccent
              AND A.sfcbsite  = sfccsite
              AND A.sfcbdocno = sfccdocno
              AND A.sfcb001   = sfcc001
              AND A.sfcb002   = sfcc002
              AND B.sfcbent   = sfccent
              AND B.sfcbsite  = sfccsite
              AND B.sfcbdocno = sfccdocno 
              AND B.sfcb001   = sfcc001              
              AND B.sfcb006   = sfcc003
              AND sfcc004     = '0'             

           LET r_prev_sffb007 = null
           LET r_prev_sffb008 = null
           LET r_prev_time = null 
           LET r_prev_date = null
           LET r_prev_time = null  
           LET i = 1           
           #FOREACH s_asft335_sel_sfcb_prev_time INTO l_prev_sfcb[i].*  #161109-00085#55 MARK
           #161109-00085#55-s
           FOREACH s_asft335_sel_sfcb_prev_time 
              INTO l_prev_sfcb[i].sfcbent,l_prev_sfcb[i].sfcbsite,l_prev_sfcb[i].sfcbdocno,l_prev_sfcb[i].sfcb001,l_prev_sfcb[i].sfcb002,
                   l_prev_sfcb[i].sfcb003,l_prev_sfcb[i].sfcb004,l_prev_sfcb[i].sfcb005,l_prev_sfcb[i].sfcb006,l_prev_sfcb[i].sfcb007,
                   l_prev_sfcb[i].sfcb008,l_prev_sfcb[i].sfcb009,l_prev_sfcb[i].sfcb010,l_prev_sfcb[i].sfcb011,l_prev_sfcb[i].sfcb012,
                   l_prev_sfcb[i].sfcb013,l_prev_sfcb[i].sfcb014,l_prev_sfcb[i].sfcb015,l_prev_sfcb[i].sfcb016,l_prev_sfcb[i].sfcb017,
                   l_prev_sfcb[i].sfcb018,l_prev_sfcb[i].sfcb019,l_prev_sfcb[i].sfcb020,l_prev_sfcb[i].sfcb021,l_prev_sfcb[i].sfcb022,
                   l_prev_sfcb[i].sfcb023,l_prev_sfcb[i].sfcb024,l_prev_sfcb[i].sfcb025,l_prev_sfcb[i].sfcb026,l_prev_sfcb[i].sfcb027,
                   l_prev_sfcb[i].sfcb028,l_prev_sfcb[i].sfcb029,l_prev_sfcb[i].sfcb030,l_prev_sfcb[i].sfcb031,l_prev_sfcb[i].sfcb032,
                   l_prev_sfcb[i].sfcb033,l_prev_sfcb[i].sfcb034,l_prev_sfcb[i].sfcb035,l_prev_sfcb[i].sfcb036,l_prev_sfcb[i].sfcb037,
                   l_prev_sfcb[i].sfcb038,l_prev_sfcb[i].sfcb039,l_prev_sfcb[i].sfcb040,l_prev_sfcb[i].sfcb041,l_prev_sfcb[i].sfcb042,
                   l_prev_sfcb[i].sfcb043,l_prev_sfcb[i].sfcb044,l_prev_sfcb[i].sfcb045,l_prev_sfcb[i].sfcb046,l_prev_sfcb[i].sfcb047,
                   l_prev_sfcb[i].sfcb048,l_prev_sfcb[i].sfcb049,l_prev_sfcb[i].sfcb050,l_prev_sfcb[i].sfcb051,l_prev_sfcb[i].sfcb052,
                   l_prev_sfcb[i].sfcb053,l_prev_sfcb[i].sfcb054,l_prev_sfcb[i].sfcb055
           #161109-00085#55-e
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'foreach:'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 RETURN 
              END IF 
           
              LET i = i + 1
           END FOREACH
           FREE s_asft335_sel_sfcb_prev_time
           CLOSE s_asft335_sel_sfcb_prev_time
           CALL l_prev_sfcb.deleteElement(l_prev_sfcb.getLength())
           
           IF l_prev_sfcb.getLength() >0 THEN
              FOR i = 1 TO l_prev_sfcb.getLength()
                 CALL s_asft335_get_prev_time(l_prev_sffb001,p_sffb005,p_sffb006,l_prev_sfcb[i].sfcb003,l_prev_sfcb[i].sfcb004) 
                 RETURNING l_prev_sffb007,l_prev_sffb008,l_prev_date,l_prev_time
#第一次循环       
                 #210429-00003#1---add---str---
                 IF l_prev_sffb007 = 'INIT' THEN
                     LET r_prev_sffb007 = 'INIT'
                     EXIT WHILE
                 END IF
                 #210429-00003#1---add---end---
                 IF r_prev_date IS NULL THEN 
                    LET r_prev_date = l_prev_date 
                    LET r_prev_sffb007 = l_prev_sffb007
                    LET r_prev_sffb008 = l_prev_sffb008
                 END IF
                 IF r_prev_time IS NULL THEN 
                    LET r_prev_time = l_prev_time 
                    LET r_prev_sffb007 = l_prev_sffb007
                    LET r_prev_sffb008 = l_prev_sffb008
                 END IF
#每次比大小，取大的保留
#日期大，就是大
#                 IF l_prev_date > r_prev_date THEN  #170419-00052#1 mark
                 IF l_prev_date < r_prev_date THEN  #170419-00052#1 add
                    LET r_prev_sffb007 = l_prev_sffb007 
                    LET r_prev_sffb008 = l_prev_sffb008                  
                    LET r_prev_date = l_prev_date
                    LET r_prev_time = l_prev_time
                 END IF
#日期一样，再比时间,时间大，才是真的大
                 IF l_prev_date = r_prev_date THEN
#                    IF l_prev_time > r_prev_time THEN   #170419-00052#1 mark
                     IF l_prev_time < r_prev_time THEN   #170419-00052#1 add
                       LET r_prev_sffb007 = l_prev_sffb007 
                       LET r_prev_sffb008 = l_prev_sffb008
                       LET r_prev_date = l_prev_date
                       LET r_prev_time = l_prev_time
                    END IF
                 END IF
              END FOR
              IF r_prev_sffb007 IS NULL THEN
                 #170618-00096#1-S mark
#                 INITIALIZE g_errparam TO NULL
#                 LET g_errparam.code = 'asf-00014'
#                 LET g_errparam.extend = l_sfcb.sfcb002
#                 LET g_errparam.popup = FALSE
#                 CALL cl_err()
                 #170618-00096#1-E mark
    #报上站资料未报工
                 LET r_prev_sffb007 = NULL
                 LET r_prev_sffb008 = NULL
                 LET r_prev_date = NULL
                 LET r_prev_time = NULL
              END IF              
           END IF             
      END CASE
   END IF
 #210429-00003#1---add---str---  
   IF g_mfg0045 = 'N' THEN
       EXIT WHILE
   ELSE
       IF l_sfcb.sfcb007 = 'INIT' THEN
           EXIT WHILE
       END IF       
       IF NOT cl_null(r_prev_date) THEN
           EXIT WHILE
       END IF
       CONTINUE WHILE
   END IF
 END WHILE 
 #210429-00003#1---add---end--- 
         
#不放心，再做一次格式化
   LET r_prev_time = r_prev_time[1,5]
   
   RETURN r_prev_sffb007,r_prev_sffb008,r_prev_date,r_prev_time
END FUNCTION
################################################################################
# Descriptions...: 抓取同一站里上一个勾选的步骤
# Memo...........:
# Usage..........: CALL s_asft335_get_prev_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success,r_errmsg
# Input parameter: p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      回传参数变量说明1
#                : r_errmsg       回传参数变量说明2
# Date & Author..: 2014/01/21 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_prev_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE r_success           LIKE type_t.num5
   DEFINE r_errmsg            STRING
   DEFINE l_sfcb014           LIKE sfcb_t.sfcb014
   DEFINE l_sfcb015           LIKE sfcb_t.sfcb015
   DEFINE l_sfcb016           LIKE sfcb_t.sfcb016
   DEFINE l_sfcb018           LIKE sfcb_t.sfcb018
   DEFINE l_sfcb019           LIKE sfcb_t.sfcb019

   LET r_success = TRUE
   LET r_errmsg = NULL
   CASE p_sffb001
      WHEN '0'   #从下站Move In过来的，到上上站找第一个勾选的步骤1～5个步骤都要找
        SELECT sfcb014,sfcb015,sfcb016,sfcb018,sfcb019 
          INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF  

         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '1'   #Move In
#Move In是第一个步骤，它的上一步就是要到上一站了，不是这里处理的，给个赞，离开吧
         LET r_success = FALSE
         RETURN r_success,r_errmsg       
      WHEN '2'   #check In
        SELECT sfcb014
          INTO l_sfcb014
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '3'   #报工
        SELECT sfcb014,sfcb015
          INTO l_sfcb014,l_sfcb015
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '4'   #check Out
        SELECT sfcb014,sfcb015,sfcb016
          INTO l_sfcb014,l_sfcb015,l_sfcb016
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '5'   #Move Out
        SELECT sfcb014,sfcb015,sfcb016,sfcb018
          INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp02
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
   END CASE  
#如果走到这里，说明一个Y都没抓到，那就是失败了，返回FALSE
   LET r_success = FALSE
   RETURN r_success,r_errmsg
END FUNCTION
################################################################################
# Descriptions...: 根据完成日期和时间以及上次完成日期和时间推算本次的机时
# Memo...........:
# Usage..........: CALL s_asft335_get_working_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008,p_sffb012,p_sffb013)
#                  RETURNING r_sffb014,r_sffb015
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_sffb015      机时
# Date & Author..: 2013/12/10 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_working_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008,p_sffb012,p_sffb013)
   DEFINE p_sffb001        LIKE sffb_t.sffb001
   DEFINE p_sffb005        LIKE sffb_t.sffb005
   DEFINE p_sffb006        LIKE sffb_t.sffb006
   DEFINE p_sffb007        LIKE sffb_t.sffb007
   DEFINE p_sffb008        LIKE sffb_t.sffb008
   DEFINE p_sffb012        LIKE sffb_t.sffb012
   DEFINE p_sffb013        LIKE sffb_t.sffb013
   DEFINE r_sffb015        LIKE sffb_t.sffb015
   DEFINE l_prev_date      LIKE sffb_t.sffb012
   DEFINE l_prev_time      LIKE sffb_t.sffb013
   DEFINE l_time           LIKE sffb_t.sffb015   #最小单位分
   DEFINE l_minute         LIKE type_t.chr8
   DEFINE l_prev_minute    LIKE type_t.chr8
   DEFINE l_sffb007        LIKE sffb_t.sffb007
   DEFINE l_sffb008        LIKE sffb_t.sffb008

   WHENEVER ERROR CONTINUE
   CALL s_asft335_get_prev_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
        RETURNING l_sffb007,l_sffb008,l_prev_date,l_prev_time
   IF l_prev_date IS NOT NULL AND l_prev_time IS NOT NULL 
      AND p_sffb012 IS NOT NULL AND p_sffb013 IS NOT NULL THEN     
#全换算成分钟 
      LET l_minute = p_sffb013
      LET l_prev_minute = l_prev_time
      LET l_minute = l_minute[1,2]*60 + l_minute[4,5]
      LET l_prev_minute = l_prev_minute[1,2]*60 + l_prev_minute[4,5]
      LET l_time = (p_sffb012 - l_prev_date)*1440 + l_minute - l_prev_minute
      LET r_sffb015 = l_time
   ELSE
      LET r_sffb015 = 0
   END IF
   RETURN r_sffb015
END FUNCTION

################################################################################
# Descriptions...: 更新待XX数量到实体表sfcb_t
# Memo...........:
# Usage..........: CALL s_asft335_upd_sfcb(p_cmd,p_sfcb,p_amt)
#                  RETURNING r_success
# Input parameter: p_cmd          审核：1，取消审核：-1
#                : p_sfcb         传入需要取数的制程资料
#                : p_amt          上站传来的数量
# Return code....: r_success      成功否
# Date & Author..: 2014/03/29 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_sfcb(p_cmd,p_sfcb,p_amt)
   DEFINE p_cmd               LIKE type_t.num5             #审核 1/取消审核 -1
   DEFINE p_sfcb              type_sfcb_next         
   DEFINE p_amt               LIKE sfcb_t.sfcb050
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_sfcb              type_sfcb_next
   DEFINE l_sfcb046           LIKE sfcb_t.sfcb046
   DEFINE l_sfcb047           LIKE sfcb_t.sfcb047
   DEFINE l_sfcb048           LIKE sfcb_t.sfcb048
   DEFINE l_sfcb049           LIKE sfcb_t.sfcb049
   DEFINE l_sfcb050           LIKE sfcb_t.sfcb050
   DEFINE l_sfcb029           LIKE sfcb_t.sfcb029
   DEFINE l_sfcb034           LIKE sfcb_t.sfcb034
   DEFINE l_msg               STRING 
   DEFINE l_amt               LIKE sfcb_t.sfcb050
   DEFINE l_amt1              LIKE sfcb_t.sfcb050
   DEFINE l_sfca005           LIKE sfca_t.sfca005
   DEFINE l_sfcb046_t         LIKE sfcb_t.sfcb046
   DEFINE l_sfcb047_t         LIKE sfcb_t.sfcb047
   DEFINE l_sfcb048_t         LIKE sfcb_t.sfcb048
   DEFINE l_sfcb049_t         LIKE sfcb_t.sfcb049
   DEFINE l_sfcb050_t         LIKE sfcb_t.sfcb050
   DEFINE l_sfcb028_add       LIKE sfcb_t.sfcb028
   DEFINE l_type              LIKE sfcb_t.sfcb001
   DEFINE l_sql               STRING    #160801-00021#1-add
   #170112-00049#1-s
   DEFINE l_sfcb021           LIKE sfcb_t.sfcb021
   DEFINE l_sfcb022           LIKE sfcb_t.sfcb022
   DEFINE l_sfcb027           LIKE sfcb_t.sfcb027
   DEFINE l_sfcb028           LIKE sfcb_t.sfcb028
   DEFINE l_sfcb053           LIKE sfcb_t.sfcb053
   DEFINE l_sfcb054           LIKE sfcb_t.sfcb054
   #170112-00049#1-e
   #170213-00031#1-s-add
   DEFINE l_sfcb_chk          LIKE sfcb_t.sfcb050   
   DEFINE l_sfcb007           LIKE sfcb_t.sfcb007
   DEFINE l_sfcb008           LIKE sfcb_t.sfcb008
   #170213-00031#1-e-add
   DEFINE l_sfcb030           LIKE sfcb_t.sfcb030   #170210-00014
   DEFINE l_imae020           LIKE imae_t.imae020   #170322-00016#1 add
   DEFINE l_sfaa010           LIKE sfaa_t.sfaa010   #170322-00016#1 add
   DEFINE l_mfg0045           LIKE type_t.chr1      #170804-00054#1 add
   DEFINE l_qcbc009_sum       LIKE qcbc_t.qcbc009   #190927-00022#1 add
   #190813-00015#1 add s
   DEFINE l_sfcb002           LIKE sfcb_t.sfcb002    
   DEFINE upd_sfcb027         LIKE sfcb_t.sfcb027
   #190813-00015#1 add e                                                 
   
#更新到实体表sfcb_t,这里的做法是效率低的，高效的可用s_asft335_tmp01和sfcb_t做merge，但是只有oracle下可用
      LET l_sfcb046 = 0
      LET l_sfcb047 = 0
      LET l_sfcb048 = 0
      LET l_sfcb049 = 0
      LET l_sfcb050 = 0
      LET l_sfcb028_add = 0
      LET l_amt      = 0
      LET l_amt1     = 0
      LET r_success = TRUE

#更新前，先把这一站原来每个步骤的待XX数量取出来，因为最后upd sfcb046~sfcb050只是更新其中一个，其他还是要保持不变的，这里不抓一次，其他就都是0了
      SELECT sfcb046,sfcb047,sfcb048,sfcb049,sfcb050,sfcb029,sfcb034
            ,sfcb021,sfcb022,sfcb027,sfcb028,sfcb053,sfcb054  #170112-00049#1
            ,sfcb002,sfcb007,sfcb008     #190813-00015#1 add
        INTO l_sfcb046,l_sfcb047,l_sfcb048,l_sfcb049,l_sfcb050,l_sfcb029,l_sfcb034
            ,l_sfcb021,l_sfcb022,l_sfcb027,l_sfcb028,l_sfcb053,l_sfcb054  #170112-00049#1
            ,l_sfcb002,l_sfcb007,l_sfcb008   #190813-00015#1 add
        FROM sfcb_t
       WHERE sfcbent   = g_enterprise
         AND sfcbsite  = g_site
         AND sfcbdocno = p_sfcb.sfcbdocno
         AND sfcb001   = p_sfcb.sfcb001
         AND sfcb003   = p_sfcb.sfcb003
         AND sfcb004   = p_sfcb.sfcb004
   
   #170112-00049#1-s
   #標準產出量
   IF p_sfcb.type MATCHES '[12]' THEN
      LET l_sfcb027 = l_sfcb027*l_sfcb022/l_sfcb021*l_sfcb053/l_sfcb054
   END IF
   #170112-00049#1-e
   
  
   
   #170804-00054#1 add --(S)--
   #是否允許事後報工
   CALL s_aooi200_get_slip(p_sfcb.sfcbdocno) RETURNING l_success,g_doc_slip
   CALL cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') RETURNING l_mfg0045
   IF cl_null(l_mfg0045) THEN LET l_mfg0045 = 'N' END IF
   #170804-00054#1 add --(E)--

#旧值用来计算变化量，变化量用来累计良品转入量
#l_sfcb028_add = l_xxx-l_xxx_t
#sfcb028 = sfcb028 + l_sfcb028_add
       LET l_sfcb046_t = l_sfcb046
       LET l_sfcb047_t = l_sfcb047
       LET l_sfcb048_t = l_sfcb048
       LET l_sfcb049_t = l_sfcb049
       LET l_sfcb050_t = l_sfcb050
       
#上站综合群组等因素后最后传到本站的数量，并不是直接更新成本站的待XX数量
#还要扣除本站的良品转出，重工转出，回收转出，当站报废，当站下线，以及加上回收数量（如果是回收站的话）
#如果此站处于替代群组内，要减去群组内这些数量的总和
       IF p_sfcb.sfcb005 MATCHES '[13]' THEN    #非替代群组只考虑本站
          #160801-00021#1-mod-(S)
#          SELECT SUM(sffb017) + SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_amt1    #重工转出等写完重工再来写这里(总算写完了，看下面case when '3')  这里的l_amt1是本站元件数量
#            FROM sffb_t
#           WHERE sffbent   = g_enterprise
#             AND sffbsite  = g_site
#             AND sffb005   = p_sfcb.sfcbdocno
#             AND sffb006   = p_sfcb.sfcb001
#             AND sffb007   = p_sfcb.sfcb003
#             AND sffb008   = p_sfcb.sfcb004
#             AND sffb001   = p_sfcb.type
#             AND sffbstus  = 'Y'     
          #重工转出等写完重工再来写这里(总算写完了，看下面case when '3')  这里的l_amt1是本站元件数量
          LET l_sql = " SELECT SUM(sffb017) + SUM(sffb018) + SUM(sffb019) + SUM(sffb020) ",
                      "   FROM sffb_t",
                      "  WHERE sffbent   = '",g_enterprise,"'",
                      "    AND sffbsite  = '",g_site,"'",
                      "    AND sffb005   = '",p_sfcb.sfcbdocno,"'",
                      "    AND sffb006   = '",p_sfcb.sfcb001,"'",
                      "    AND sffb007   = '",p_sfcb.sfcb003,"'",
                      "    AND sffb008   = '",p_sfcb.sfcb004,"'",
                      "    AND sffb001   = '",p_sfcb.type,"'",
                      "    AND sffbstus  = 'Y'  "
          #排除掉自己那張單
          IF g_prog MATCHES 'asft330*' THEN
             LET l_sql = l_sql CLIPPED," AND sffbdocno <> '",g_sffadocno,"'"
          END IF           
          PREPARE s_asft335_sffb_pre FROM l_sql
          EXECUTE s_asft335_sffb_pre INTO l_amt1
          #160801-00021#1-mod-(E)
          #170213-00031#1-s-add
          IF cl_null(l_amt1) AND g_prog ='asft335' THEN
             #170228-00018#1 add --(S)--
             #若為重工RUNCARD才需執行下列動作
             SELECT sfca005 INTO l_sfca005 
               FROM sfca_t
              WHERE sfcaent = g_enterprise 
                AND sfcadocno = p_sfcb.sfcbdocno
                #201021-00059#1 mark -s-
#                AND sfcb001 = p_sfcb.sfcb001      
#                AND sfcb003 = p_sfcb.sfcb003
#                AND sfcb004 = p_sfcb.sfcb004
                #201021-00059#1 mark -e-
             IF l_sfca005 = '2' THEN   
             #170228-00018#1 add --(E)--
             SELECT sfcb050 INTO l_amt1
               FROM sfcb_t
              WHERE sfcbent = g_enterprise
                AND sfcbdocno = p_sfcb.sfcbdocno
                #AND sfcb001 <> p_sfcb.sfcb001    #170617-00274#1 mark
                AND sfcb001 = p_sfcb.sfcb001      #170617-00274#1 add
                AND sfcb003 = p_sfcb.sfcb003
                AND sfcb004 = p_sfcb.sfcb004
             END IF          #170228-00018#2 add  
          END IF
          #170213-00031#1-e-add
          IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF  #170228-00018#1 add 
          #170112-00049#1-s
          #IF p_sfcb.type MATCHES '[12]' THEN   #换算成主件数量
          #    LET l_amt = l_amt * p_sfcb.sfcb054/p_sfcb.sfcb053
          #END IF
          #IF p_sfcb.type MATCHES '[345]' THEN
          #    LET l_amt = l_amt * p_sfcb.sfcb022/p_sfcb.sfcb021
          #END IF 
          IF p_sfcb.type MATCHES '[12]' THEN   #换算成主件数量
              LET l_amt1 = l_amt1 * p_sfcb.sfcb054/p_sfcb.sfcb053
          END IF
          IF p_sfcb.type MATCHES '[345]' THEN
              LET l_amt1 = l_amt1 * p_sfcb.sfcb022/p_sfcb.sfcb021
          END IF
          #170112-00049#1-e
#回收数量等写完回收作业再来写这里
       END IF
       
       IF p_sfcb.sfcb005 ='2' THEN    #同一替代群组的需要都扣除
          DECLARE s_asft335_sel_tmp01 CURSOR FOR
          #161109-00085#55-s
          #SELECT * FROM s_asft335_tmp01
          SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                 sfcb005,sfcb006,type,sfcb021,sfcb022,
                 amt,sfcb053,sfcb054                 
            FROM s_asft335_tmp01
          #161109-00085#55-e
           WHERE sfcbdocno = p_sfcb.sfcbdocno
             AND sfcb001   = p_sfcb.sfcb001
             AND sfcb006   = p_sfcb.sfcb006 
                   
          #161109-00085#55-s
          #FOREACH s_asft335_sel_tmp01 INTO l_sfcb.*
          FOREACH s_asft335_sel_tmp01 INTO l_sfcb.chk,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb003,l_sfcb.sfcb004,
                                           l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.type,l_sfcb.sfcb021,l_sfcb.sfcb022,
                                           l_sfcb.amt,l_sfcb.sfcb053,l_sfcb.sfcb054 
          #161109-00085#55-e
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'foreach:'
                LET g_errparam.popup = TRUE
                CALL cl_err()

                RETURN 
             END IF 
             LET l_amt = 0 
             SELECT SUM(sffb017) + SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_amt
               FROM sffb_t
              WHERE sffbent   = g_enterprise
                AND sffbsite  = g_site
                AND sffb005   = l_sfcb.sfcbdocno
                AND sffb006   = l_sfcb.sfcb001
                AND sffb007   = l_sfcb.sfcb003
                AND sffb008   = l_sfcb.sfcb004
                AND sffb001   = l_sfcb.type
                AND sffbstus  = 'Y' 
                
             IF l_amt IS NULL THEN LET l_amt = 0 END IF 
#同一群组的不同站勾选的步骤也是不同的，所以统一翻成主件数量才好合计
             IF l_sfcb.type MATCHES '[12]' THEN
                 LET l_amt = l_amt * l_sfcb.sfcb054/l_sfcb.sfcb053
             END IF
             IF l_sfcb.type MATCHES '[345]' THEN
                 LET l_amt = l_amt * l_sfcb.sfcb022/l_sfcb.sfcb021
             END IF             
             LET l_amt1 = l_amt1 + l_amt            #这里的l_amt1是主件数量    
          END FOREACH
          FREE s_asft335_sel_tmp01
          CLOSE s_asft335_sel_tmp01          
       END IF
         
      IF l_amt1 IS NULL THEN LET l_amt1 = 0 END IF      
      LET l_sfcb028_add = p_amt  #170112-00049#1
      LET p_amt = p_amt - l_amt1   #待XX数量需要扣除的本站已报工数量
      #190927-00022#1---add----str---
      #EXECUTE s_asft335_sffb_pre INTO l_amt1 的量,可能含有PQC 6:轉回當站在製,再重新報工的量
      #所以需考慮aqct300(PQC)=>6:轉回當站在製量,
      #否則導致報工確認後在製數(sfcb050),良品轉入(sfcb028)錯誤,[取消確認]亦會錯誤
      #故需加上aqct300(PQC)=>6:轉回當站在製量
      LET l_qcbc009_sum = 0
      SELECT SUM(qcbc009)
        INTO l_qcbc009_sum
        FROM qcba_t,qcbc_t
       WHERE qcbaent = qcbcent
         AND qcbadocno = qcbcdocno
         AND qcbaent = g_enterprise
         AND qcba003 = p_sfcb.sfcbdocno  #工單單號
         AND qcba029 = p_sfcb.sfcb001    #RUN CARD
         AND qcba006 = p_sfcb.sfcb003    #作業編號
         AND qcba007 = p_sfcb.sfcb004    #作業序
         AND qcba000 = '3'               #PQC
         AND qcbastus = 'Y'
         AND qcbc012 = '6'               #6:轉回當站在製
      IF NOT cl_null(l_qcbc009_sum) THEN
          LET p_amt = p_amt + l_qcbc009_sum
      END IF
      #190927-00022#1---add----end---      
      #170112-00049#1-s
      IF p_amt < 0 THEN
         #170322-00016#1 add  --begin--
         LET l_sfaa010 = ''
         SELECT sfaa010 INTO l_sfaa010
           FROM sfaa_t
          WHERE sfaaent = g_enterprise
            AND sfaasite = g_site
            AND sfaadocno = p_sfcb.sfcbdocno
         #容许误差率
         LET l_imae020 = 0
         SELECT imae020 INTO l_imae020
           FROM imae_t
          WHERE imaeent  = g_enterprise
            AND imaesite = g_site
            AND imae001  = l_sfaa010
         IF cl_null(l_imae020) THEN LET l_imae020 = 0 END IF
         #170322-00016#1 add  --end--
         #170322-00016#1 mod  --begin--
         #IF p_amt < l_sfcb027 * (-1) THEN
         #   LET p_amt = l_sfcb027 * (-1)
         IF p_amt < l_sfcb027 * (l_imae020 / 100) * (-1) THEN
           #LET p_amt = l_sfcb027 * (l_imae020 / 100) * (-1)  #170407-00046#1 mark
         #170322-00016#1 mod  --end--
         ELSE
            IF l_amt1 > l_sfcb027 THEN
               LET p_amt = 0
            END IF
         END IF
      END IF
      #170112-00049#1-e
      #170210-00014-s-add
      #若本站為回收站，需增加回收轉入數量至在制量上
      LET l_sfcb030 = 0
      SELECT sfcb030 INTO l_sfcb030
        FROM sfcb_t
       WHERE sfcbent = g_enterprise
         AND sfcbdocno = p_sfcb.sfcbdocno
         AND sfcb001 = p_sfcb.sfcb001
         AND sfcb003 = p_sfcb.sfcb003
         AND sfcb004 = p_sfcb.sfcb004
         AND sfcb055 = 'Y'
      
      IF cl_null(l_sfcb030) THEN LET l_sfcb030 = 0 END IF
      LET p_amt = p_amt + l_sfcb030
      #170210-00014-e-add
      CALL s_aooi200_get_slip(p_sfcb.sfcbdocno) RETURNING l_success,g_doc_slip
      CASE p_sfcb.type 
         WHEN '1'    #Move In
            LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb053/p_sfcb.sfcb054  #170112-00049#1
            LET l_sfcb046 = p_amt * p_sfcb.sfcb053/p_sfcb.sfcb054
           #170928-00041#1 mark --(S)-- 
           ##170228-00018#2 add-S 仅更新下一站待处理数量
           ##这样处理的原因是：当PQC判定为当站在制，若下一个报工点为同一站，当站在制数量在s_aqct300中已经回写，若这边不给0，会造成重复叠加
           ##例：A站报工10颗料，PQC转良品9个，转当站在制1个
           ##工作站   报工 PQC MOVE OUT   待PQC数量  --->转当站在制  在制量                   待MOVE OUT数量
           ##  A      √    √    √           10                       1(s_aqct300_sfcb_upd)        9
           ##由于在制量前面已经有资料，此处仅需更新下一个报工点MOVE OUT的待MOVE OUT数即可
           ##前文中提到若不抓出所有的字段，会导致更新后其他数量都为0，这点后面update改写成update 数量 = 数量 + p_cmd*异动数量
           #IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
           #LET l_sfcb047 = 0
           #LET l_sfcb048 = 0
           #LET l_sfcb049 = 0
           #LET l_sfcb050 = 0
           #END IF                    #170804-00054#1 add
           ##170228-00018#2 add-E
           #170928-00041#1 mark --(E)-- 
#170213-00031#1-s-remark
#170112-00049#1-s
#sel语句是在取消审核时,判断更新到下一站的量是否超出可更新的 
            IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
               IF l_sfcb046 < 0 THEN
                  LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',p_sfcb.sfcb003,'|',p_sfcb.sfcb004
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00095'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success               
               END IF
            END IF            
#170112-00049#1-e
#170213-00031#1-e-remark
         WHEN '2'    #Check In
            LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb053/p_sfcb.sfcb054  #170112-00049#1
            LET l_sfcb047 = p_amt * p_sfcb.sfcb053/p_sfcb.sfcb054
           #170928-00041#1 mark --(S)-- 
           ##170228-00018#2 add-S 仅更新下一站待处理数量
           #IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
           #LET l_sfcb046 = 0
           #LET l_sfcb048 = 0
           #LET l_sfcb049 = 0
           #LET l_sfcb050 = 0
           #END IF                    #170804-00054#1 add
           ##170228-00018#2 add-E
           #170928-00041#1 mark --(E)-- 
#170213-00031#1-s-remark
#170112-00049#1-s
#sel语句是在取消审核时,判断更新到下一站的量是否超出可更新的 
            IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
               IF l_sfcb047 < 0 THEN
                  LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',p_sfcb.sfcb003,'|',p_sfcb.sfcb004
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00095'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success               
               END IF
            END IF
#170112-00049#1-e
#170213-00031#1-e-remark
         WHEN '3'    #报工
           #LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb021/p_sfcb.sfcb022  #170112-00049#1  #170405-00004#1 mark
            LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb053/p_sfcb.sfcb054  #170405-00004#1 add
           #LET l_sfcb050 = p_amt * p_sfcb.sfcb021/p_sfcb.sfcb022   #190215-00009#1 by 02159 mark
            #190215-00009#1 by 02159 add(S)
            #RUN CARD編號=0時需做分子分母計算,否則不需要轉換
            IF p_sfcb.sfcb001 = 0 THEN
               LET l_sfcb050 = p_amt * p_sfcb.sfcb021/p_sfcb.sfcb022
            ELSE
               IF g_prog = 'asft338' THEN  #因asft338 傳入的值為已處理分子分母
                  LET l_sfcb050 = p_amt
               ELSE
                  LET l_sfcb050 = p_amt * p_sfcb.sfcb021/p_sfcb.sfcb022
               END IF
            END IF
            #190215-00009#1 by 02159 add(E)
           #LET l_sfcb050 = l_sfcb050 - l_sfcb034   #170322-00016#1 add 重工转出不写入sffb表，故需扣除   #190806-00055#1 mark
            LET l_sfcb050 = l_sfcb050 - l_sfcb034 + l_sfcb029   #190806-00055#1 add 因為重工轉入是寫入到重工報工的sffb_t裡面,故須加回
           #170928-00041#1 mark --(S)-- 
           ##170228-00018#2 add-S 仅更新下一站待处理数量
           #IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
           #LET l_sfcb046 = 0 
           #LET l_sfcb047 = 0
           #LET l_sfcb048 = 0
           #LET l_sfcb049 = 0
           #END IF                    #170804-00054#1 add
           ##170228-00018#2 add-E
           #170928-00041#1 mark --(E)-- 
#这个有问题，先mark
##重工转出来了，举例ABCD四站，C站原来在制60，做重工转出4，asft338审核后，可以看到制程里，在制量56，重工转出4，重工转入0
##                          当C的重工转入制程完成后，要重新回写到C站，这时候C的在制量在制量60，重工转出4，重工转入4
##其实我想说的是，B站报工审核时更新C站的在制量，需要考虑-重工转出+重工转入
#           LET l_sfcb050 = l_sfcb050 + l_sfcb029 - l_sfcb034    
#170213-00031#1-s-remark
#170112-00049#1-s
#sel语句是在取消审核时,判断更新到下一站的量是否超出可更新的 
            IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
               IF l_sfcb050 < 0 THEN
                  LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',p_sfcb.sfcb003,'|',p_sfcb.sfcb004
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00095'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success               
               END IF               
            END IF  
#170112-00049#1-e
#170213-00031#1-e-remark
         WHEN '4'    #Check Out
           #LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb021/p_sfcb.sfcb022  #170112-00049#1  #170405-00004#1 mark
            LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb053/p_sfcb.sfcb054  #170405-00004#1 add
            LET l_sfcb048 = p_amt * p_sfcb.sfcb021/p_sfcb.sfcb022
           #170928-00041#1 mark --(S)-- 
           ##170228-00018#2 add-S 仅更新下一站待处理数量
           #IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
           #LET l_sfcb046 = 0
           #LET l_sfcb047 = 0
           #LET l_sfcb049 = 0
           #LET l_sfcb050 = 0
           #END IF                    #170804-00054#1 add
           ##170228-00018#2 add-E
           #170928-00041#1 mark --(E)-- 
#170213-00031#1-s-remark
#170112-00049#1-s
#sel语句是在取消审核时,判断更新到下一站的量是否超出可更新的 
            IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
               IF l_sfcb048 < 0 THEN
                  LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',p_sfcb.sfcb003,'|',p_sfcb.sfcb004
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00095'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success               
               END IF
            END IF  
#170112-00049#1-e
#170213-00031#1-e-remark
         WHEN '5'    #Move Out
           #LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb021/p_sfcb.sfcb022  #170112-00049#1   #170405-00004#1 mark
            LET l_sfcb028_add = l_sfcb028_add * p_sfcb.sfcb053/p_sfcb.sfcb054  #170405-00004#1 add 
            LET l_sfcb049 = p_amt * p_sfcb.sfcb021/p_sfcb.sfcb022
           #170928-00041#1 mark --(S)-- 
           ##170228-00018#2 add-S 仅更新下一站待处理数量
           #IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
           #LET l_sfcb046 = 0
           #LET l_sfcb047 = 0
           #LET l_sfcb048 = 0
           #LET l_sfcb050 = 0
           #END IF                    #170804-00054#1 add
           ##170228-00018#2 add-E
           #170928-00041#1 mark --(E)-- 
#170213-00031#1-s-remark
#170112-00049#1-s
#sel语句是在取消审核时,判断更新到下一站的量是否超出可更新的 
            IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
               IF l_sfcb049 < 0 THEN
                  LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',p_sfcb.sfcb003,'|',p_sfcb.sfcb004
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00095'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success               
               END IF
            END IF  
#170112-00049#1-e
#170213-00031#1-e-remark
      END CASE   
      
      #170213-00031#1-s-add
      #170309-00043#1-s-mod
#      IF p_cmd = -1 THEN-
    # IF p_cmd = -1 AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
    # #170309-00043#1-e-mod
    #    LET l_sfcb_chk = 0
    #   #170322-00016#1 add  --begin--
    #   #SELECT COALESCE(sfcb034,0) + COALESCE(sfcb035,0) + COALESCE(sfcb036,0) + 
    #   #       COALESCE(sfcb037,0) + COALESCE(sfcb038,0) + COALESCE(sfcb039,0),
    #    SELECT COALESCE(sfcb028,0) + COALESCE(sfcb029,0) + COALESCE(sfcb030,0) + 
    #           COALESCE(sfcb031,0) + COALESCE(sfcb032,0) - COALESCE(sfcb033,0) -
    #           COALESCE(sfcb034,0) - COALESCE(sfcb035,0) - COALESCE(sfcb036,0) - 
    #           COALESCE(sfcb037,0) - COALESCE(sfcb038,0) - COALESCE(sfcb039,0),
    #   #170322-00016#1 add  --end--
    #           sfcb007,sfcb008
    #      INTO l_sfcb_chk,l_sfcb007,l_sfcb008
    #      FROM sfcb_t
    #     WHERE sfcbent = g_enterprise
    #       AND sfcbdocno = p_sfcb.sfcbdocno
    #       AND sfcb001 = p_sfcb.sfcb001
    #       AND sfcb003 = p_sfcb.sfcb003
    #       AND sfcb004 = p_sfcb.sfcb004
    #       
    #   #IF l_sfcb_chk > 0 THEN     #170322-00016#1 mark
    #    IF l_sfcb_chk > p_amt THEN #170322-00016#1 add
    #       LET l_msg = p_sfcb.sfcbdocno,'|',p_sfcb.sfcb001,'|',l_sfcb007,'|',l_sfcb008
    #       INITIALIZE g_errparam TO NULL
    #       LET g_errparam.code = 'asf-00833'
    #       LET g_errparam.extend = l_msg
    #       LET g_errparam.popup = TRUE
    #       CALL cl_err()
    #       LET r_success = FALSE
    #       RETURN r_success              
    #    END IF
    # END IF
      #170213-00031#1-e-add
#判断本次是否是当站的首动作，如果是，再用对应的旧值和新值计算出本次良品转入量的变化量
      CALL s_asft335_get_first_action(p_sfcb.sfcbdocno,p_sfcb.sfcb001,p_sfcb.sfcb003,p_sfcb.sfcb004) RETURNING l_success,l_type
      
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      #170112-00049#1-s
      #IF l_type = p_sfcb.type THEN
      #   CASE p_sfcb.type 
      #      WHEN '1'    #Move In
      #         LET l_sfcb028_add = l_sfcb046 - l_sfcb046_t                     
      #      WHEN '2'    #Check In
      #         LET l_sfcb028_add = l_sfcb047 - l_sfcb047_t                
      #      WHEN '3'    #报工
      #         LET l_sfcb028_add = l_sfcb050 - l_sfcb050_t    
      #      WHEN '4'    #Check Out
      #         LET l_sfcb028_add = l_sfcb048 - l_sfcb048_t                
      #      WHEN '5'    #Move Out
      #         LET l_sfcb028_add = l_sfcb049 - l_sfcb049_t              
      #   END CASE         
      #END IF
      IF l_type <> p_sfcb.type THEN
         LET l_sfcb028_add = l_sfcb028
     #170920-00052#1 mark --(S)--    
#      #170228-00018#2 add-S 若是首站，需根据动作变动良品转入量
#      ELSE
#         IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断   
#         LET l_sfcb028_add = l_sfcb028 + p_cmd * l_sfcb028_add
#         END IF                    #170804-00054#1 add   
#      #170228-00018#2 add-E
     #170920-00052#1 mark --(S)-- 
      END IF
      #170112-00049#1-e
      
      IF l_mfg0045 = 'N' OR g_prog = 'aqct300' THEN   #170804-00054#1 add   #170919-00020#1 add aqct300判断
      #170322-00016#1 add  --begin--
      IF l_sfcb046 < 0 THEN
         LET l_sfcb046 = 0
      END IF
      IF l_sfcb047 < 0 THEN
         LET l_sfcb047 = 0
      END IF
      IF l_sfcb048 < 0 THEN
         LET l_sfcb048 = 0
      END IF
      IF l_sfcb049 < 0 THEN
         LET l_sfcb049 = 0
      END IF
      IF l_sfcb050 < 0 THEN
         LET l_sfcb050 = 0
      END IF
      IF l_sfcb028_add < 0 THEN
         LET l_sfcb028_add = 0
      END IF
      #170322-00016#1 add  --end--
      #170804-00054#1 add --(S)--
      #不依顺序报工：若转入-转出<-标准产出量，在制=-标准产出量
      ELSE
         IF l_sfcb046 <= l_sfcb027*(-1) THEN
            LET l_sfcb046 = l_sfcb027*(-1)            
         END IF
         IF l_sfcb047 <= l_sfcb027*(-1) THEN
            LET l_sfcb047 = l_sfcb027*(-1)   
         END IF
         IF l_sfcb048 <= l_sfcb027*(-1) THEN
            LET l_sfcb048 = l_sfcb027*(-1)   
         END IF
         IF l_sfcb049 <= l_sfcb027*(-1) THEN
            LET l_sfcb049 = l_sfcb027*(-1)   
         END IF
         IF l_sfcb050 <= l_sfcb027*(-1) THEN
            LET l_sfcb050 = l_sfcb027*(-1)   
         END IF
         IF l_sfcb028_add <= l_sfcb027*(-1) THEN
            LET l_sfcb028_add = l_sfcb027*(-1)   
         END IF
      END IF
     #IF l_mfg0045 = 'Y' AND g_prog <> 'aqct300' THEN    #170919-00020#1 add aqct300判断 #170920-00052#1 mark
         UPDATE sfcb_t
            SET sfcb046 = l_sfcb046,
                sfcb047 = l_sfcb047,
                sfcb048 = l_sfcb048,
                sfcb049 = l_sfcb049,
                sfcb050 = l_sfcb050,
                sfcb028 = l_sfcb028_add
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = p_sfcb.sfcbdocno
            AND sfcb001   = p_sfcb.sfcb001
            AND sfcb003   = p_sfcb.sfcb003
            AND sfcb004   = p_sfcb.sfcb004
            
    #190813-00015#1  add -s
     CALL s_aooi200_get_slip(p_sfcb.sfcbdocno) RETURNING l_success,g_doc_slip
    IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0101') = '2'  THEN
      IF p_cmd = 1 THEN             
        #报工单审核时    
         #更新之后项次的标准产出量为良品转入量
          UPDATE sfcb_t
               SET sfcb027 = l_sfcb028_add
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcb.sfcbdocno
               AND sfcb001   = p_sfcb.sfcb001
               AND (sfcb002  = l_sfcb002 OR sfcb002 > l_sfcb002)
        ELSE
         #报工单取消审核，找回上一站的标准产出量还原回原来的数量
         SELECT sfcb027 INTO upd_sfcb027 FROM sfcb_t 
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = p_sfcb.sfcbdocno
            AND sfcb001   = p_sfcb.sfcb001
            AND sfcb003   = l_sfcb007
            AND sfcb004   = l_sfcb008
          UPDATE sfcb_t
               SET sfcb027 = upd_sfcb027
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcb.sfcbdocno
               AND sfcb001   = p_sfcb.sfcb001
               AND (sfcb002  = l_sfcb002 OR sfcb002 > l_sfcb002)
        END IF            
     END IF 
  
    #190813-00015#1  add -e
    
     #170920-00052#1 mark --(S)--            
#      ELSE      
#      #170804-00054#1 add --(E)--
#      #170228-00018#2 mod-S
##      UPDATE sfcb_t
##         SET sfcb046 = l_sfcb046,
##             sfcb047 = l_sfcb047,
##             sfcb048 = l_sfcb048,
##             sfcb049 = l_sfcb049,
##             sfcb050 = l_sfcb050,
##            #170112-00049#1-s
##            #sfcb028 = sfcb028 + l_sfcb028_add
##             sfcb028 = l_sfcb028_add
##            #170112-00049#1-e
#      UPDATE sfcb_t
#         SET sfcb046 = sfcb046 + p_cmd*l_sfcb046,
#             sfcb047 = sfcb047 + p_cmd*l_sfcb047,
#             sfcb048 = sfcb048 + p_cmd*l_sfcb048,
#             sfcb049 = sfcb049 + p_cmd*l_sfcb049,
#             sfcb050 = sfcb050 + p_cmd*l_sfcb050,
#             sfcb028 = l_sfcb028_add
#       #170228-00018#2 mod-E     
#       WHERE sfcbent   = g_enterprise
#         AND sfcbsite  = g_site
#         AND sfcbdocno = p_sfcb.sfcbdocno
#         AND sfcb001   = p_sfcb.sfcb001
#         AND sfcb003   = p_sfcb.sfcb003
#         AND sfcb004   = p_sfcb.sfcb004
#      END IF  #170804-00054#1 add  
     #170920-00052#1 mark --(E)--      

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'EXECUTE s_asft335_upd_sfcb_next'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      FREE s_asft335_sffb_pre   #160801-00021#1-add
      
      RETURN r_success
#若要把更新sfcb_t优化成megre，则放开以下2个update的mark
#      UPDATE s_asft335_tmp01 SET amt = p_amt *sfcb053/sfcb054
#       WHERE sfcbdocno = p_sfcb.sfcbdocno
#         AND sfcb001   = p_sfcb.sfcb001
#         AND sfcb003   = p_sfcb.sfcb003
#         AND sfcb004   = p_sfcb.sfcb004
#         AND type      = p_sfcb.type
#         AND (type     = '1' OR type = '2')
#
#      IF SQLCA.sqlcode THEN
#         CALL cl_err('upd_s_asft335_tmp01:',SQLCA.sqlcode,1)
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      
#      UPDATE s_asft335_tmp01 SET amt = p_amt *sfcb021/sfcb022
#       WHERE sfcbdocno = p_sfcb.sfcbdocno
#         AND sfcb001   = p_sfcb.sfcb001
#         AND sfcb003   = p_sfcb.sfcb003
#         AND sfcb004   = p_sfcb.sfcb004
#         AND type      = p_sfcb.type
#         AND (type     = '3' OR type = '4' OR type = '5')
#
#      IF SQLCA.sqlcode THEN
#         CALL cl_err('upd_s_asft335_tmp01:',SQLCA.sqlcode,1)
#         LET r_success = FALSE
#         RETURN r_success
#      END IF

END FUNCTION
################################################################################
# Descriptions...: 检查完成日期和时间不得小于上一步骤的完成日期时间
# Memo...........:
# Usage..........: CALL s_asft335_check_time(p_sffb012,p_sffb013,p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
#                  RETURNING 回传参数
# Input parameter: p_sffb012      待检查日期
#                : p_sffb013      待检查时间
#                : p_sffb001      报工类别
#                : p_sffb005      工单号码
#                : p_sffb006      RunCard
#                : p_sffb007      作业编号
#                : p_sffb008      作业序
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/17 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_check_time(p_sffb012,p_sffb013,p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
   DEFINE p_sffb012        LIKE sffb_t.sffb012
   DEFINE p_sffb013        LIKE sffb_t.sffb013
   DEFINE p_sffb001        LIKE sffb_t.sffb001
   DEFINE p_sffb005        LIKE sffb_t.sffb005
   DEFINE p_sffb006        LIKE sffb_t.sffb006
   DEFINE p_sffb007        LIKE sffb_t.sffb007
   DEFINE p_sffb008        LIKE sffb_t.sffb008  
   DEFINE l_prev_date      LIKE sffb_t.sffb012
   DEFINE l_prev_time      LIKE sffb_t.sffb013
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_sffb007        LIKE sffb_t.sffb007
   DEFINE l_sffb008        LIKE sffb_t.sffb008    
   #210429-00003#1---add----str---
   DEFINE l_yy_prev        LIKE xref_t.xref001  #前站報工日期的年
   DEFINE l_pp_prev        LIKE xref_t.xref002  #前站報工日期的期
   DEFINE l_yy_sffb012     LIKE xref_t.xref001  #本次報工日期的年
   DEFINE l_pp_sffb012     LIKE xref_t.xref002  #本次報工日期的期
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_comp           LIKE ooef_t.ooef017  #法人
   DEFINE l_ld             LIKE glaa_t.glaald   #帳套
   #210429-00003#1---add----end---
  
   LET r_success = TRUE
   
   #210429-00003#1----add----str---
   CALL s_aooi200_get_slip(p_sffb005) RETURNING l_success,g_doc_slip   
   CALL cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') RETURNING g_mfg0045 
   IF cl_null(g_mfg0045) THEN LET g_mfg0045 = 'N' END IF     
   #210429-00003#1----add----end---
   CALL s_asft335_get_prev_time(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
        RETURNING l_sffb007,l_sffb008,l_prev_date,l_prev_time
   IF g_mfg0045 = 'N' THEN #不允許事後報工,才需做下面的檢查 #210429-00003#1 add
       IF l_prev_date IS NOT NULL AND l_prev_time IS NOT NULL THEN     
          #日期大，就是大
          IF l_prev_date > p_sffb012 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = 'asf-00030'
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE
             CALL cl_err()
       
             LET r_success = FALSE
             RETURN r_success
          END IF
          #日期一样，再比时间,时间大，才是真的大
          IF l_prev_date = p_sffb012 THEN
             IF l_prev_time > p_sffb013 THEN
                INITIALIZE g_errparam TO NULL
             LET g_errparam.code = 'asf-00030'
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE
             CALL cl_err()
       
                LET r_success = FALSE
                RETURN r_success
             END IF
          END IF  
       END IF
   #210429-00003#1 add---str----    
   ELSE
       DISPLAY "l_prev_date:",l_prev_date       
       IF NOT cl_null(l_prev_date) THEN
           #1.取法人编号
           SELECT ooef017 INTO l_comp FROM ooef_t
            WHERE ooefent = g_enterprise
              AND ooef001 = g_site
           
           #2.取法人所属的主帐套值
           CALL s_axcp500_get_ld(l_comp)
                  RETURNING l_success,l_ld
            
           #前站的年/期
           CALL s_fin_date_get_period_value('',l_ld,l_prev_date) RETURNING l_success,l_yy_prev,l_pp_prev
           
           #本站的年/期
           CALL s_fin_date_get_period_value('',l_ld,p_sffb012) RETURNING l_success,l_yy_sffb012,l_pp_sffb012
           
           IF (l_yy_sffb012 < l_yy_prev) OR
              (l_yy_sffb012 = l_yy_prev AND l_pp_sffb012 < l_pp_prev) THEN
               #asf-01079:報工完工日期的成本年/期(%1/%2) 已小於 前段製程報工的成本年/期(%3/%4),成本年/期需>=前段製程報工的成本年/期 !
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code  = 'asf-01079'     
               LET g_errparam.replace[1] = l_yy_sffb012
               LET g_errparam.replace[2] = l_pp_sffb012
               LET g_errparam.replace[3] = l_yy_prev
               LET g_errparam.replace[4] = l_pp_prev
               LET g_errparam.extend= p_sffb005
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
           END IF
       END IF
   END IF
   #210429-00003#1 add---end---- 
 
   RETURN r_success   
END FUNCTION
################################################################################
# Descriptions...: 报工单取消审核元件
# Memo...........:
# Usage..........: CALL s_asft335_unconf(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno        审核单号
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2013/12/25 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_unconf(p_docno)
   DEFINE p_docno     LIKE sffb_t.sffbdocno    #审核单号
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_sffbstus  LIKE sffb_t.sffbstus
   DEFINE l_cnt       LIKE type_t.num5
   DEFINE l_success   LIKE type_t.num5      #160129-00002#7 add
   DEFINE l_slip      LIKE ooba_t.ooba002   #160129-00002#7 add 
   #add--161103-00007#1 By shiun--(S)
   DEFINE l_sffb005   LIKE sffb_t.sffb005
   DEFINE l_sffb006   LIKE sffb_t.sffb006
   DEFINE l_sffb007   LIKE sffb_t.sffb007
   DEFINE l_sffb008   LIKE sffb_t.sffb008
   #add--161103-00007#1 By shiun--(E)
   DEFINE l_sffb012   LIKE sffb_t.sffb012    #161212-00020#1
   DEFINE l_sffbdocdt LIKE sffb_t.sffbdocdt  #161212-00020#1
   DEFINE l_sffbseq   LIKE sffb_t.sffbseq    #161215-00055#1
   DEFINE l_cnt1      LIKE type_t.num5       #161215-00055#1
   DEFINE l_cnt2      LIKE type_t.num5       #161215-00055#1
   #161114-00018#1 add-------------s------
   DEFINE l_sfeb009     LIKE sfeb_t.sfeb009  #完工入库数量
   DEFINE l_sfeb008     LIKE sfeb_t.sfeb008  #完工入库申請数量   #170213-00031#1
   DEFINE l_sffb017     LIKE sffb_t.sffb017  #本站作业所有报工数量
   DEFINE l_sffb017_1   LIKE sffb_t.sffb017  #本站作业此次报工数量
   
   #161114-00018#1 add-------------e------
   DEFINE l_sum         LIKE type_t.num10    #170621-00025#1 add
#170512-00039#1-S add   
   DEFINE l_sffb032     LIKE sffb_t.sffb032  
   DEFINE l_time        DATETIME YEAR TO SECOND
   DEFINE l_sfea001     LIKE sfea_t.sfea001  
   DEFINE l_sfeastus    LIKE sfea_t.sfeastus
   DEFINE l_count       LIKE type_t.num10
#170512-00039#1-E add   
   DEFINE l_sfaa003     LIKE sfaa_t.sfaa003 #180904-00078#1 add
   DEFINE l_cnt3        LIKE type_t.num10    #190123-00063#1 add   
   #190702-00010#14 -S add
   DEFINE l_qcbadocno   LIKE qcba_t.qcbadocno
   DEFINE l_qcba037     LIKE qcba_t.qcba037
   DEFINE l_sql         STRING
   #190702-00010#14 -E add
   DEFINE l_qcbamoddt   LIKE qcba_t.qcbamoddt   #190924-00035#2 add 

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   LET g_sffadocno=p_docno    #170718-00078#1 add
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00036'
      LET g_errparam.extend = 's_asft335_unconf'  #161215-00055#1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #200422-00203#1---add---s
   IF g_prog MATCHES 'asft335*' THEN
      SELECT sffb005,sffb006 INTO l_sffb005,l_sffb006 FROM sffb_t
       WHERE sffbent = g_enterprise
         AND sffbdocno = p_docno
         AND sffbseq = 0
      LET l_count = 0
      SELECT COUNT(1) INTO l_count FROM sfoa_t
       WHERE sfoaent = g_enterprise 
         AND sfoadocno = l_sffb005
         AND sfoa001 = l_sffb006
         AND sfoastus IN ('N','W')
      IF l_count > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-01039'
         LET g_errparam.extend = 's_asft335_unconf'  
         LET g_errparam.popup = TRUE
         CALL cl_err()      
         LET r_success = FALSE
         RETURN r_success
      END IF 
   END IF
   #200422-00203#1---add---e
   
#170512-00039#1-S add
   IF g_prog MATCHES 'asft335*' THEN
      LET l_count = 0 
      SELECT COUNT(1) INTO l_count FROM pmdt_t
       WHERE pmdtent = g_enterprise
         AND pmdt222 = p_docno
      IF cl_null(l_count) THEN LET l_cnt = 0 END IF 
      IF l_count > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-01241'
         LET g_errparam.extend = 's_asft335_unconf2'  
         LET g_errparam.popup = TRUE
         CALL cl_err()      
         LET r_success = FALSE
         RETURN r_success
      END IF 
   END IF 
#170512-00039#1-E add
 
#若是asft336抛转过来的，不许取消审核，必须在asft336里取消扣帐
   SELECT COUNT(1) INTO l_cnt FROM sfga_t  #161212-00020#1 星號調整
    WHERE sfgaent   = g_enterprise
      AND sfgasite  = g_site
      AND sfgadocno = p_docno
   #IF l_cnt > 0 AND g_prog <> 'asft336' THEN   #asft336取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --mark
   IF l_cnt > 0 AND g_prog NOT MATCHES 'asft336*' THEN   #asft336取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00274'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      #RETURN r_success  #161215-00055#1
   END IF   

#若是asft337抛转过来的，不许取消审核，必须在asft337里取消扣帐
   SELECT COUNT(1) INTO l_cnt FROM sfha_t  #161212-00020#1 星號調整
    WHERE sfhaent   = g_enterprise
      AND sfhasite  = g_site
      AND sfhadocno = p_docno
#   IF l_cnt > 0 AND g_prog <> 'asft337' THEN   #asft337取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --mark
   IF l_cnt > 0 AND g_prog NOT MATCHES 'asft337*' THEN   #asft337取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00295'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      #RETURN r_success  #161215-00055#1
   END IF 
   #161214-00011#1 add-------s--------
   #若报工单有下线数量，则判断下线单据asft337单据状态，审核或者过账状态报工单不许取消审核
   SELECT COUNT(sfha010) INTO l_cnt FROM sfha_t  
    WHERE sfhaent = g_enterprise
      AND sfha010 = p_docno
      #AND sfhastus <> 'N'               #不会存在asft335是有效单据，asft337是作废的情况，所以只排除未审核  #171114-00033#1 mark
      AND sfhastus NOT IN ('N','X')       #171114-00033#1 add
#   IF l_cnt > 0 AND g_prog <> 'asft337' THEN   #asft337取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --mark
   IF l_cnt > 0 AND g_prog NOT MATCHES 'asft337*' THEN   #asft337取消扣帐也会调用这个元件，这种情况需要排除   #170301-00021#9 by 09263 --add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00821'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      #RETURN r_success  #161215-00055#1
   END IF       
   #161214-00011#1 add-------e----------
   #161215-00055#1-s add
   DECLARE sel_sffb_c CURSOR FOR
      SELECT sffbstus,sffbdocdt,sffbseq,sffb005,sffb006,sffb007,sffb008,sffb012,sffb017,sffb032  #171208-00039#1 ,sffb017  #170512-00039#1 add sffb032
        FROM sffb_t
       WHERE sffbent  = g_enterprise
         AND sffbsite = g_site
         AND sffbdocno= p_docno
   FOREACH sel_sffb_c INTO l_sffbstus,l_sffbdocdt,l_sffbseq,l_sffb005,l_sffb006,l_sffb007,l_sffb008,l_sffb012,l_sffb017_1,l_sffb032  #171208-00039#1 ,l_sffb017_1 #170512-00039#1 add sffb032 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'sel_sffb_c'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_cnt1 = g_errcollect.getLength()
      
      #170713-00049#1-s
      #[單據日期]和[完成日期]是否小于等于关账日期
      IF l_sffb012 > l_sffbdocdt THEN
         IF NOT s_date_chk_close(l_sffbdocdt,'1') THEN
            LET r_success = FALSE
         END IF
      ELSE
         IF NOT s_date_chk_close(l_sffb012,'1') THEN
            LET r_success = FALSE
         END IF
      END IF
      #170713-00049#1-e
      
      #检查为已审核的才可以
      IF l_sffbstus != 'Y' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'anm-00056'
         LET g_errparam.extend = l_sffbstus
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      #工單結案其他相關單據不可以異動
      IF NOT s_asft335_sfaastus_chk(l_sffb005) THEN
         LET r_success = FALSE
      END IF
      
      #若此報工單存在於aqct300，不得取消確認
      LET l_cnt = 0
      #PGS(D)  13070 add -s-
      IF CL_NULL(l_sffb006) THEN
         LET l_sffb006 = NULL
      END IF
      IF CL_NULL(l_sffb007) THEN
         LET l_sffb007 = NULL
      END IF
      IF CL_NULL(l_sffb008) THEN
         LET l_sffb008 = NULL
      END IF
      #PGS(D)  13070 add -e-
      SELECT COUNT (1) INTO l_cnt
        FROM qcba_t
       WHERE qcbaent  = g_enterprise
         AND qcbasite = g_site
         AND qcba000  = '3'                     #PQC
         AND qcba001  = p_docno                 #來源單據
         AND qcba002  = l_sffbseq
        #AND qcba003  = l_sffb005               #參考單據     #170617-00355#1 mark
         AND qcba029  = l_sffb006               #RunCard
         AND qcba006  = l_sffb007               #作業編號
         AND qcba007  = l_sffb008               #製程序
         AND qcbastus <> 'X'
         AND qcba036 <> 'Y'  #190702-00010#14 add  #不檢查已拋轉sQMS的單
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00806'
         LET g_errparam.extend = l_sffb005
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
     #170512-00039#1-S add
      #報工單取消審核
      IF NOT cl_null(l_sffb032) THEN #完工入庫單號
         SELECT sfeastus,sfea001 INTO l_sfeastus,l_sfea001 FROM sfea_t 
          WHERE sfeaent = g_enterprise
            AND sfeadocno = l_sffb032
         #完工過賬單過賬還原  
         IF l_sfeastus = 'S' THEN
            CALL s_asft340_unpost(l_sffb032,l_sfea001)
                 RETURNING l_success
            IF NOT l_success THEN
               LET r_success = FALSE
            ELSE
               #完工入庫單取消審核
               CALL s_asft340_unconf(l_sffb032)
                    RETURNING l_success     
               IF NOT l_success THEN
                  LET r_success = FALSE
               ELSE 
                  #完工入庫單作廢
                  IF NOT s_inventory_del_inao(l_sffb032) THEN
                     LET r_success = FALSE
                  ELSE
                     LET l_time = cl_get_current()
                     UPDATE sfea_t SET sfeastus = 'X',
                                       sfeamodid = g_user,
                                       sfeamoddt = l_time
                      WHERE sfeaent = g_enterprise 
                        AND sfeadocno = l_sffb032              
                  END IF               
               END IF                
            END IF 
         END IF             
         #完工入庫單取消審核
         IF l_sfeastus = 'Y' THEN
            CALL s_asft340_unconf(l_sffb032)
                 RETURNING l_success     
            IF NOT l_success THEN
               LET r_success = FALSE
            ELSE 
               #完工入庫單作廢
               IF NOT s_inventory_del_inao(l_sffb032) THEN
                  LET r_success = FALSE
               ELSE
                  LET l_time = cl_get_current()
                  UPDATE sfea_t SET sfeastus = 'X',
                                    sfeamodid = g_user,
                                    sfeamoddt = l_time
                   WHERE sfeaent = g_enterprise 
                     AND sfeadocno = l_sffb032          
               END IF               
            END IF 
         END IF
         #190724-00015#1 add-S
         UPDATE sffb_t SET sffb032 = ''
          WHERE sffbent = g_enterprise
            AND sffbdocno = p_docno
            AND sffbseq = l_sffbseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'upd_sffb_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE    
         END IF
         #190724-00015#1 add-E                        
      END IF 
     #170512-00039#1-E add
      #180904-00078#1 add start -----
      SELECT sfaa003 INTO l_sfaa003
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaasite = g_site
         AND sfaadocno = l_sffb005 
      IF l_sfaa003 <> '3' THEN 
      #180904-00078#1 add end    -----     
         #190123-00063#1 add --(S)--
         #若最後一站報工點為PQC時,不需執行以下控卡,因為最後良品轉出量為PQC檢驗結果
         LET l_cnt3 = 0
         SELECT COUNT(1) INTO l_cnt3
           FROM sfcb_t
          WHERE sfcbent=g_enterprise AND sfcbsite=g_site 
            AND sfcbdocno=l_sffb005 AND sfcb001=l_sffb006 
            AND sfcb003=l_sffb007 AND sfcb004=l_sffb008
            AND sfcb017 = 'Y' AND sfcb018 = 'N' AND sfcb019 = 'N'
         IF cl_null(l_cnt3) THEN LET l_cnt3 = 0 END IF
         IF l_cnt3 = 0 THEN         
         #190123-00063#1 add --(E)--
         #更新制程进度元件有做判断当站是否存在下一站已报工且审核的报工单，如果不是最后一站报工单取消审核，不会走到这边的逻辑，所及不用再判断
         CALL s_aooi200_get_slip(l_sffb005) RETURNING l_success,g_doc_slip
         IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N'  #不允许事后报工的工单才要检查  
         AND cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0044') ='Y' THEN  #170523-00038#1 #并且工单完工入库检查报工数,需检查  add D-MFG-0044
            #170213-00031#1-s-mod
            #检查当前工单已完工入库数量，包括已审核与已过账入库单
#            LET l_sfeb009=0
#            SELECT SUM (sfeb009) INTO l_sfeb009 FROM sfeb_t,sfea_t
#             WHERE sfeaent=sfebent AND sfeasite=sfebsite AND sfebdocno=sfeadocno
#               AND sfebent=g_enterprise AND sfebsite=g_site  AND sfeb001=l_sffb005
#               AND sfeb026=l_sffb006 AND sfeastus IN ('N','Y','S')
#            IF cl_null(l_sfeb009) THEN LET l_sfeb009=0 END IF
#            IF l_sfeb009 > 0 THEN
            LET l_sfeb008=0
            SELECT SUM (sfeb008) INTO l_sfeb008 FROM sfeb_t,sfea_t
             WHERE sfeaent=sfebent AND sfeasite=sfebsite AND sfebdocno=sfeadocno
               AND sfebent=g_enterprise AND sfebsite=g_site  AND sfeb001=l_sffb005
               AND sfeb026=l_sffb006 AND sfeastus IN ('N','Y','S')
               AND sfeb003 = '1' #190429-00028#1 add
            IF cl_null(l_sfeb008) THEN LET l_sfeb008=0 END IF
            IF l_sfeb008 > 0 THEN
            #170213-00031#1-e-mod
               #存在完工入库单，那就要判断当前取消审核后剩余报工数量是否不小于完工入库数量
               #1、取本站所有报工数量
               #2、所有报工数量-此次报工数量是否小于完工入库数量
               LET l_sffb017=0
              #170322-00016#1 mark  --begin-
              #SELECT SUM(sffb017) INTO l_sffb017 FROM sffb_t
              # WHERE sffbent=g_enterprise AND sffbsite=g_site AND sffb005=l_sffb005 
              #   AND sffb006=l_sffb006 AND sffb007=l_sffb007 AND sffb008=l_sffb008
              #   AND sffbstus='Y'
              #170322-00016#1 mark   --end--
              #170322-00016#1 add    --begin-
              #只抓最后一个报工点的转出量
               SELECT SUM(sffb017) INTO l_sffb017 FROM sffb_t,sfcb_t
                WHERE sffbent=sfcbent AND sffb005=sfcbdocno AND sffb006=sfcb001 AND sffb007=sfcb003 AND sffb008=sfcb004
                  AND sffbent=g_enterprise AND sffbsite=g_site AND sffb005=l_sffb005 
                  AND sffb006=l_sffb006 AND sffb007=l_sffb007 AND sffb008=l_sffb008
                  AND sffbstus='Y'
                  AND ((sffb001='1' AND sfcb015='N' AND sfcb016='N' AND sfcb017='N' AND sfcb018='N' AND sfcb019='N') OR
                       (sffb001='2' AND sfcb016='N' AND sfcb017='N' AND sfcb018='N' AND sfcb019='N') OR
                       (sffb001='3' AND sfcb017='N' AND sfcb018='N' AND sfcb019='N') OR
                       (sffb001='4' AND sfcb019='N') OR
                       (sffb001='5'))                    
              #170322-00016#1 mark   --end--
#               IF cl_null(l_sffb007) THEN LET l_sffb007=0 END IF #170523-00038#1  mark
               #170621-00025#1 add---------s-----
               #加上本站待转数量
               SELECT (sfcb046+sfcb047+sfcb048+sfcb049+sfcb051) INTO l_sum FROM sfcb_t WHERE sfcbent=g_enterprise AND sfcbdocno=l_sffb005 AND sfcb001=l_sffb006 AND sfcb003=l_sffb007 AND sfcb004=l_
               LET l_sffb017=l_sffb017+l_sum            
               #170621-00025#1 add---------s-----
               IF cl_null(l_sffb017) THEN LET l_sffb017=0 END IF #170523-00038#1  add
               #171208-00039#1-s mark
               #LET l_sffb017_1 = 0
               #SELECT sffb017 INTO l_sffb017_1 FROM sffb_t
               # WHERE sffbent=g_enterprise AND sffbsite=g_site AND sffbdocno=p_docno
               #171208-00039#1-e mark
               IF cl_null(l_sffb017_1) THEN LET l_sffb017_1=0 END IF
               #170213-00031#1-s-mod
#               IF l_sffb017-l_sffb017_1 < l_sfeb009 THEN
               IF l_sffb017-l_sffb017_1 < l_sfeb008 THEN
               #170213-00031#1-e-mod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00809'
                  LET g_errparam.extend = l_sffb005,"#",l_sffb006
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
               END IF
            END IF
         END IF
         END IF   #190123-00063#1 add
      END IF #180904-00078#1 add         
      
      LET l_cnt2 = g_errcollect.getLength()
      IF l_cnt1 < l_cnt2 THEN
         FOR l_cnt = l_cnt1+1 TO l_cnt2
            LET g_errcollect[l_cnt].extra[1] = l_sffbseq
         END FOR
      END IF
   END FOREACH
   #161215-00055#1-e add
   
   #190702-00010#14 -S add
   #是否有與sQMS或SPC整合
   IF s_aqct300_is_sqms() THEN
      SELECT COUNT(1)
        INTO l_cnt
        FROM qcba_t
       WHERE qcbaent = g_enterprise
         AND qcba001 = p_docno
         AND qcba037 IN ('4')
      IF l_cnt > 0 THEN
         #對應的QC資料有已為4.檢驗完成QMS拋轉狀態，不可做取消確認！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aqc-00185'
         LET g_errparam.extend = p_docno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      ELSE
         LET l_sql = " SELECT qcbadocno,qcba037",
                     "   FROM qcba_t",
                     "  WHERE qcbaent = ",g_enterprise,
                     "    AND qcba001 = '",p_docno,"'"
         PREPARE s_asft335_qcbadocno_pre FROM l_sql
         DECLARE s_asft335_qcbadocno_cur CURSOR FOR s_asft335_qcbadocno_pre
         FOREACH s_asft335_qcbadocno_cur INTO l_qcbadocno,l_qcba037
            IF cl_null(l_qcba037) THEN LET l_qcba037 = '1' END IF
            #若檢驗單sQMS狀態=2.已拋轉(檢驗中),則需先將sQMS單據還原
            IF l_qcba037 = '2' THEN
               IF NOT s_aqct300_redu_qc_to_sqms(l_qcbadocno) THEN
                  #還原sQMS檢驗單據失敗，不可取消確認！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aqc-00187'
                  LET g_errparam.extend = l_qcbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  EXIT FOREACH
               ELSE
                  #更新QC單據拋轉狀態
                  UPDATE qcba_t
                     SET qcba037 = '1'
                   WHERE qcbaent = g_enterprise
                     AND qcbadocno = l_qcbadocno
                  IF sqlca.sqlcode OR sqlca.sqlerrd[3] = 0 THEN                        
                     #更新檢驗單據[QMS拋轉狀態]失敗，不可取消確認！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'aqc-00188'
                     LET g_errparam.extend = l_qcbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET r_success = FALSE
                     EXIT FOREACH                   
                  END IF                  
               END IF
            END IF
            LET l_qcbamoddt = cl_get_current()  #190924-00035#2 add
            UPDATE qcba_t
               SET qcbastus = 'X',
                   qcbamodid = g_user,
                  #qcbamoddt = cl_get_current() #190924-00035#2 mark 
                   qcbamoddt = l_qcbamoddt      #190924-00035#2 add 
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
         END FOREACH
      END IF
   END IF
   #190702-00010#14 -E add
   
#161215-00055#1-s mark
#搬到FOREACH sel_sffb_c
#   #161212-00020#1-s
#   SELECT sffbstus,sffbdocdt,sffb005,sffb006,sffb007,sffb008,sffb012
#     INTO l_sffbstus,l_sffbdocdt,l_sffb005,l_sffb006,l_sffb007,l_sffb008,l_sffb012
#     FROM sffb_t
#    WHERE sffbent  = g_enterprise
#      AND sffbsite = g_site
#      AND sffbdocno= p_docno
#   IF NOT s_date_chk_close(l_sffbdocdt,'1') THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF NOT s_date_chk_close(l_sffb012,'1') THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #161212-00020#1-e
#   
##检查为已审核的才可以
#   #161212-00020#1-s
#   #SELECT DISTINCT(sffbstus) INTO l_sffbstus 
#   #  FROM sffb_t
#   # WHERE sffbent  = g_enterprise
#   #   AND sffbsite = g_site
#   #   AND sffbdocno= p_docno
#   #161212-00020#1-e
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'select sffb_t'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF l_sffbstus != 'Y' THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   
#   #161212-00033#1-s
#   IF NOT s_asft335_sfaastus_chk(l_sffb005) THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #161212-00033#1-e
#   
##检查检查下一站的数量是否够本站取消审核还原的
##例如本張為報工數量100，下一動作為需Check out，則檢查待Check out數量是否大於等於100，足夠才允許取消
#   #add--161103-00007#1 By shiun--(S)
#   #若此報工單存在於aqct300，不得取消確認
#   #161212-00020#1-s
#   #SELECT sffb005,sffb006,sffb007,sffb008
#   #  INTO l_sffb005,l_sffb006,l_sffb007,l_sffb008
#   #  FROM sffb_t
#   # WHERE sffbent  = g_enterprise
#   #   AND sffbsite = g_site
#   #   AND sffbdocno= p_docno
#   #161212-00020#1-e
#   #---mod-161103-00007#1 by dorislai--(S) (改原來161103-00007#1寫的部分)
#   #SELECT COUNT (*) INTO l_cnt
#   #  FROM qcba_t
#   # WHERE qcbaent  = g_enterprise
#   #   AND qcbasite = g_site
#   #   AND qcba000  = '3'                     #PQC
#   #   AND qcba001  = l_sffb005               #來源單據
#   #   AND qcba029  = l_sffb006               #RunCard
#   #   AND qcba006  = l_sffb007               #作業編號
#   #   AND qcba007  = l_sffb008               #製程序
#   #   AND qcbastus <> 'X'
#   LET l_cnt = 0
#   SELECT COUNT (1) INTO l_cnt
#     FROM qcba_t
#    WHERE qcbaent  = g_enterprise
#      AND qcbasite = g_site
#      AND qcba000  = '3'                     #PQC
#      AND qcba001  = p_docno                 #來源單據
#      AND qcba003  = l_sffb005               #參考單據
#      AND qcba029  = l_sffb006               #RunCard
#      AND qcba006  = l_sffb007               #作業編號
#      AND qcba007  = l_sffb008               #製程序
#      AND qcbastus <> 'X'
#   #---mod-161103-00007#1 by dorislai--(E)
#   IF l_cnt > 0 THEN      
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00806'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #add--161103-00007#1 By shiun--(E)
#161215-00055#1-e mark
#开始取消审核的干活
#先更新状态码为N
   #181009-00068#1 add --(S)--
   #若不是批次報工的作業,先更新狀態碼為N
   #若是批次報工於執行s_asft335_upd_routing()裡,依執行確認還原的項次依序更新狀態碼為N
   IF g_prog NOT MATCHES 'asft330*' AND g_prog NOT MATCHES 'asft331*' AND
      g_prog NOT MATCHES 'asft332*' AND g_prog NOT MATCHES 'asft333*' AND 
      g_prog NOT MATCHES 'asft334*' THEN
   #181009-00068#1 add --(E)--  
      UPDATE sffb_t SET sffbstus = 'N',
                        sffbcnfdt = NULL,
                        sffbcnfid = NULL
       WHERE sffbent = g_enterprise
         AND sffbsite = g_site
         AND sffbdocno = p_docno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'updsffbstus'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         #RETURN r_success  #161215-00055#1
      END IF 
      IF SQLCA.sqlerrd[3] = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00038'
         LET g_errparam.extend = 'select'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         #RETURN r_success  #161215-00055#1
      END IF
   END IF   #181009-00068#1 add
#若是asft330调用，则多更新一个单头档   
#   IF g_prog = 'asft330' OR g_prog = 'asft331' OR g_prog = 'asft332' OR g_prog = 'asft333' OR g_prog = 'asft334' THEN   #170301-00021#9 by 09263 --mark
   IF g_prog MATCHES 'asft330*' OR g_prog MATCHES 'asft331*' OR g_prog MATCHES 'asft332*' OR g_prog MATCHES 'asft333*' OR g_prog MATCHES 'asft334*' THEN   #170301-00021#9 by 09263 --add
      UPDATE sffa_t SET sffastus = 'N',
                        sffacnfdt = NULL,
                        sffacnfid = NULL
       WHERE sffaent = g_enterprise
         AND sffasite = g_site
         AND sffadocno = p_docno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'updsffastus'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         #RETURN r_success  #161215-00055#1
      END IF 
      IF SQLCA.sqlerrd[3] = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00038'
         LET g_errparam.extend = 'select'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         #RETURN r_success  #161215-00055#1
      END IF   
   END IF
#调用更新工单制程进度元件
   IF NOT s_asft335_upd_routing(-1,p_docno) THEN
      LET r_success = FALSE
      #RETURN r_success  #161215-00055#1
   END IF
#161215-00055#1-s mark
#搬到FOREACH sel_sffb_c
##161114-00018#1 add-------------s------
#   #更新制程进度元件有做判断当站是否存在下一站已报工且审核的报工单，如果不是最后一站报工单取消审核，不会走到这边的逻辑，所及不用再判断
#   CALL s_aooi200_get_slip(l_sffb005) RETURNING l_success,g_doc_slip
#   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN  #不允许事后报工的工单才要检查
#      #检查当前工单已完工入库数量，包括已审核与已过账入库单
#      LET l_sfeb009=0
#      SELECT SUM (sfeb009) INTO l_sfeb009 FROM sfeb_t,sfea_t WHERE sfeaent=sfebent AND sfeasite=sfebsite AND sfebdocno=sfeadocno 
#                                                          AND sfebent=g_enterprise AND sfebsite=g_site  AND sfeb001=l_sffb005
#                                                         #161212-00048#1-s
#                                                         #AND sfeb026=l_sffb006 AND sfeastus IN ('Y','S')
#                                                          AND sfeb026=l_sffb006 AND sfeastus IN ('N','Y','S')
#                                                         #161212-00048#1-e
#      IF cl_null(l_sfeb009) THEN LET l_sfeb009=0 END IF
#      IF l_sfeb009 > 0 THEN      
#         #存在完工入库单，那就要判断当前取消审核后剩余报工数量是否不小于完工入库数量
#         #1、取本站所有报工数量
#         #2、所有报工数量-此次报工数量是否小于完工入库数量
#         LET l_sffb017=0
#         SELECT SUM(sffb017) INTO l_sffb017 FROM sffb_t WHERE sffbent=g_enterprise AND sffbsite=g_site AND sffb005=l_sffb005 
#                                                           AND sffb006=l_sffb006 AND sffb007=l_sffb007 AND sffb008=l_sffb008
#                                                           AND sffbstus='Y'
#         IF cl_null(l_sffb007) THEN LET l_sffb007=0 END IF                                                           
#         SELECT sffb017 INTO l_sffb017_1 FROM sffb_t WHERE sffbent=g_enterprise AND sffbsite=g_site AND sffbdocno=p_docno
#         IF l_sffb017-l_sffb017_1 < l_sfeb009 THEN            
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'asf-00809'
#            LET g_errparam.extend = p_docno
#            LET g_errparam.popup = TRUE
#            CALL cl_err()            
#            LET r_success = FALSE
#            RETURN r_success
#         END IF
#                                                                     
#      END IF
#   END IF                                                          
##161114-00018#1 add-------------e--------
#161215-00055#1-e mark
   #160129-00002#7 ---(S)---   
   IF r_success THEN
      CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
     #IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' AND cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0080') = 'Y' THEN #180403-00003#2 mark
     #180403-00003#2 add --start--
      IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y'
         AND (cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0080') = 'Y' AND g_prog NOT MATCHES 'asft337*' ) THEN
     #180403-00003#2 add --end--         
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'wss-00263'
         LET g_errparam.extend = '此資料來源為MES抛轉，不可取消確認！'
         LET g_errparam.popup  = TRUE  
         CALL cl_err()      
         LET r_success = FALSE
         #RETURN r_success  #161215-00055#1
      END IF
   END IF
   #160129-00002#7 ---(E)---
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 报工单审核元件
# Memo...........:
# Usage..........: CALL s_asft335_conf(p_docno)
#                  RETURNING r_success
# Input parameter: p_codno        审核单号
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_success   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2013/12/11 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_conf(p_docno)
   DEFINE p_docno       LIKE sffb_t.sffbdocno    #审核单号
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sffbstus    LIKE sffb_t.sffbstus
   DEFINE l_sffbseq     LIKE sffb_t.sffbseq      #161215-00055#1
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE g_time1       DATETIME YEAR TO SECOND
   #170421-00073#1-s
   DEFINE l_sffd002_sum LIKE sffd_t.sffd002
   DEFINE l_sffb017     LIKE sffb_t.sffb017
   DEFINE l_sffb018     LIKE sffb_t.sffb018
   DEFINE l_sffb019     LIKE sffb_t.sffb019
   #170421-00073#1-e
   DEFINE l_sffb012     LIKE sffb_t.sffb012    #170713-00049#1
   DEFINE l_sffbdocdt   LIKE sffb_t.sffbdocdt  #170713-00049#1
   #170507-00012#1-s
   DEFINE l_sffb005     LIKE sffb_t.sffb005
   DEFINE l_sfaadocdt   LIKE sfaa_t.sfaadocdt
   DEFINE l_sffadocdt   LIKE sffa_t.sffadocdt
   #170507-00012#1-e
   #170517-00007#1-s
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_slip        LIKE ooba_t.ooba002
   DEFINE l_flag        LIKE type_t.chr1
   DEFINE l_sffb014     LIKE sffb_t.sffb014
   DEFINE l_sffe002     LIKE sffe_t.sffe002
   DEFINE l_sffe003     LIKE sffe_t.sffe003
   #170517-00007#1-e
  
   WHENEVER ERROR CONTINUE
   
   #191111-00013#1 -s add
   #FUNCTION s_asft335_conf整段內容包含確認前的檢查s_asft335_conf_chk與單據確認s_asft335_conf_upd的內容,直接改CALL這兩個FUNCTION就好
   CALL s_asft335_conf_chk(p_docno) RETURNING r_success
   IF r_success THEN
      CALL s_asft335_conf_upd(p_docno) RETURNING r_success
   END IF
   
   RETURN r_success
   #191111-00013#1 -e add
   
#191111-00013#1 -s mark
#   LET r_success = TRUE
#   
#   LET g_time1 = cl_get_current()
#   
#   #检查是否在事务中
#   IF NOT s_transaction_chk('Y',1) THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF p_docno IS NULL THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00036'
#      LET g_errparam.extend = 's_asft335_conf'  #161215-00055#1
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
##检查为未审核的才可以
#   #161215-00055#1-s mark
#   #SELECT DISTINCT(sffbstus) INTO l_sffbstus 
#   #  FROM sffb_t
#   # WHERE sffbent  = g_enterprise
#   #   AND sffbsite = g_site
#   #   AND sffbdocno= p_docno
#   #IF SQLCA.sqlcode THEN
#   #   INITIALIZE g_errparam TO NULL
#   #   LET g_errparam.code = SQLCA.sqlcode
#   #   LET g_errparam.extend = 'select sffb_t'
#   #   LET g_errparam.popup = TRUE
#   #   CALL cl_err()
#   #   LET r_success = FALSE
#   #   RETURN r_success
#   #END IF
#   #IF l_sffbstus != 'N' THEN
#   #   LET r_success = FALSE
#   #   RETURN r_success      
#   #END IF   
#   #161215-00055#1-e mark
#   
#   #170517-00007#1-s
#   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
#   LET l_flag = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0092')
#   #170517-00007#1-e
#   
#   #161215-00055#1-s add
#   DECLARE sel_sffbstus_c CURSOR FOR
#      SELECT sffbseq,sffbstus,sffbdocdt,sffb012,sffb014,sffb017,sffb018,sffb019,sffb005   #170421-00073#1 add sffb017,sffb018,sffb019    #170507-00012#1 add sffb005  #170517-00007#1 add ,sffb014  #170713-00049#1 add sffbdocdt,sffb012,
#             ,(SELECT sfaadocdt FROM sfaa_t WHERE sfaadocno = sffb005 AND sfaaent = g_enterprise) sfaadocdt #170618-00156#1 add 工单日期
#        FROM sffb_t
#       WHERE sffbent   = g_enterprise
#         AND sffbsite  = g_site
#         AND sffbdocno = p_docno
#   FOREACH sel_sffbstus_c INTO l_sffbseq,l_sffbstus,l_sffbdocdt,l_sffb012,l_sffb014,l_sffb017,l_sffb018,l_sffb019,l_sffb005,l_sfaadocdt   #170421-00073#1 add sffb017,sffb018,sffb019   #170507-00012#1 add l_sffb005  #170517-00007#1 add ,l_sffb014  #170713-00049#1 add l_sffbdocdt,l_sffb012, #170618-00156#1 add l_sfaadocdt
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'sel_sffbstus'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF
#      #IF l_sffbstus != 'N' THEN  #171120-00009#1 mark
#      IF l_sffbstus NOT MATCHES '[NA]' THEN  #171120-00009#1 add
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'afa-00024'
#         LET g_errparam.extend = l_sffbstus
#         LET g_errparam.coll_vals[1] = l_sffbseq
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#      END IF
#      #170618-00156#1 add-S 如果是批次报工单，检核的日期为sffadocdt
#      IF g_prog='asft330' THEN 
#         SELECT sffadocdt INTO l_sffbdocdt FROM sffa_t WHERE sffaent=g_enterprise AND sffadocno=p_docno 
#      END IF 
#      #170618-00156#1 add-E
#      #170713-00049#1-s
#      #[單據日期]和[完成日期]是否小于等于关账日期
#      IF l_sffb012 > l_sffbdocdt THEN
#         IF NOT s_date_chk_close(l_sffbdocdt,'1') THEN
#            LET r_success = FALSE
#         END IF
#      ELSE
#         IF NOT s_date_chk_close(l_sffb012,'1') THEN
#            LET r_success = FALSE
#         END IF
#      END IF
#      #170713-00049#1-e
#      #170517-00007#1-s
#      IF l_flag = 'Y' THEN
#         LET l_sffe002 = 0
#         LET l_sffe003 = 0
#         SELECT SUM(sffe002),SUM(sffe003) INTO l_sffe002,l_sffe003
#           FROM sffe_t
#          WHERE sffeent = g_enterprise
#            AND sffedocno = p_docno
#            AND sffeseq = l_sffbseq
#         IF cl_null(l_sffe002) THEN LET l_sffe002 = 0 END IF
#         IF cl_null(l_sffe003) THEN LET l_sffe003 = 0 END IF
#         IF l_sffb014 <> l_sffe002 THEN
#            INITIALIZE g_errparam TO NULL 
#            LET g_errparam.extend = l_sffbseq 
#            LET g_errparam.code   = "asf-00751"
#            LET g_errparam.replace[1] = l_sffb014
#            LET g_errparam.replace[2] = l_sffe002
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()
#            LET r_success = FALSE
#         END IF
#         IF l_sffb017 <> l_sffe003 THEN
#            INITIALIZE g_errparam TO NULL 
#            LET g_errparam.extend = l_sffbseq 
#            LET g_errparam.code   = "asf-00752"
#            LET g_errparam.replace[1] = l_sffb017
#            LET g_errparam.replace[2] = l_sffe003
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()
#            LET r_success = FALSE
#         END IF
#      END IF
#      #170517-00007#1-e
#      #170421-00073#1 add(s)
#      LET l_sffd002_sum = 0
#      SELECT SUM(sffd002) INTO l_sffd002_sum
#        FROM sffd_t
#       WHERE sffdent = g_enterprise
#         AND sffddocno = p_docno
#         AND sffdseq = l_sffbseq
#      IF cl_null(l_sffd002_sum) THEN LET l_sffd002_sum = 0 END IF
#      IF l_sffd002_sum > l_sffb017+l_sffb018+l_sffb019 THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = ""
#         LET g_errparam.code = 'asf-00856'
#         LET g_errparam.popup = TRUE 
#         CALL cl_err() 
#         LET r_success = FALSE        
#      END IF
#      #170421-00073#1 add(e)
#      #170507-00012#1 add------s--------
#      SELECT sfaadocdt INTO l_sfaadocdt FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sffb005
#      #170515-00084#1 add-----s-----
#      SELECT sffbdocdt INTO l_sffadocdt FROM sffb_t WHERE sffbent=g_enterprise AND  sffbdocno=p_docno
#      IF g_prog='asft330' THEN 
#      #170515-00084#1 add-----e-----
#         SELECT sffadocdt INTO l_sffadocdt FROM sffa_t WHERE sffaent=g_enterprise AND sffadocno=p_docno 
#      END IF      #170515-00084#1 add
#      IF l_sfaadocdt>l_sffadocdt THEN
#         INITIALIZE g_errparam TO NULL
##         LET g_errparam.code = 'asf-00815'   #170618-00156#1 mark
#         LET g_errparam.code = 'asf-00894'   #170618-00156#1 add  #單據日期不可小於工單單據日期！
#         LET g_errparam.extend = p_docno,'/',l_sffbseq
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE  
#      END IF
#      #170507-00012#1 add--------e--------
#   END FOREACH
#   #161215-00055#1-e add
##检查check in/check out必要项目都填了
#   LET l_cnt = 0
#   SELECT COUNT(1) INTO l_cnt  #161212-00020#1 星號調整
#     FROM sffc_t
#    WHERE sffcent   = g_enterprise
#      AND sffcsite  = g_site
#      AND sffcdocno = p_docno
#      AND sffc006   = 'Y'
#      AND sffc005 IS NULL
#   IF l_cnt > 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00037'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      #RETURN r_success  #161215-00055#1
#   END IF 
# 
##开始审核的干活
##先更新状态码为Y
#   UPDATE sffb_t SET sffbstus  = 'Y',
#                     sffbcnfdt = g_time1,
#                     sffbcnfid = g_user
#    WHERE sffbent = g_enterprise
#      AND sffbsite = g_site
#      AND sffbdocno = p_docno
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'updsffbstus'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      #RETURN r_success  #161215-00055#1
#   END IF 
#   IF SQLCA.sqlerrd[3] = 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00038'
#      LET g_errparam.extend = 'select'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      #RETURN r_success  #161215-00055#1
#   END IF
##若是asft330调用，则多更新一个单头档   
##   IF g_prog = 'asft330' OR g_prog = 'asft331' OR g_prog = 'asft332' OR g_prog = 'asft333' OR g_prog = 'asft334' THEN   #170301-00021#9 by 09263 --mark
#   IF g_prog MATCHES 'asft330*' OR g_prog MATCHES 'asft331*' OR g_prog MATCHES 'asft332*' OR g_prog MATCHES 'asft333*' OR g_prog MATCHES 'asft334*' THEN   #170301-00021#9 by 09263 --add
#      UPDATE sffa_t SET sffastus = 'Y',
#                        sffacnfdt = g_time1,
#                        sffacnfid = g_user
#       WHERE sffaent = g_enterprise
#         AND sffasite = g_site
#         AND sffadocno = p_docno
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'updsffastus'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         #RETURN r_success  #161215-00055#1
#      END IF 
#      IF SQLCA.sqlerrd[3] = 0 THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00038'
#         LET g_errparam.extend = 'select'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         #RETURN r_success  #161215-00055#1
#      END IF   
#   END IF
#   LET g_sffadocno = p_docno #160804-00029#1-add
##调用更新工单制程进度元件
#   IF NOT s_asft335_upd_routing(1,p_docno) THEN
#      LET r_success = FALSE
#      #RETURN r_success  #161215-00055#1
#   END IF
#
#   RETURN r_success
#191111-00013#1 -e mark
   
END FUNCTION

################################################################################
# Descriptions...: 根据工单制程资料产生预设的Check in/Check out资料
# Memo...........:
# Usage..........: CALL s_asft335_ins_sffc(p_sffbdocno,p_sffbseq)
#                  RETURNING r_success
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/04/29 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_ins_sffc(p_sffbdocno,p_sffbseq)
   DEFINE p_sffbdocno   LIKE sffb_t.sffbdocno
   DEFINE p_sffbseq     LIKE sffb_t.sffbseq
   DEFINE r_success     LIKE type_t.num5
   #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e
      #161109-00085#55-s
   #DEFINE l_sfcb           RECORD LIKE sfcb_t.*  
   DEFINE l_sfcb RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e
   #161109-00085#55-s
   #DEFINE l_sfcd        RECORD LIKE sfcd_t.*
   DEFINE l_sfcd RECORD  #工單製程check in/out專案資料
       sfcdent LIKE sfcd_t.sfcdent, #企業編號
       sfcdsite LIKE sfcd_t.sfcdsite, #營運據點
       sfcddocno LIKE sfcd_t.sfcddocno, #單號
       sfcd001 LIKE sfcd_t.sfcd001, #RUN CARD
       sfcd002 LIKE sfcd_t.sfcd002, #項次
       sfcd003 LIKE sfcd_t.sfcd003, #專案
       sfcd004 LIKE sfcd_t.sfcd004, #型態
       sfcd005 LIKE sfcd_t.sfcd005, #下限
       sfcd006 LIKE sfcd_t.sfcd006, #上限
       sfcd007 LIKE sfcd_t.sfcd007, #預設值
       sfcd008 LIKE sfcd_t.sfcd008, #必要
       sfcd009 LIKE sfcd_t.sfcd009  #check in/check out
   END RECORD
   #161109-00085#55-e
   #161109-00085#55-s
   #DEFINE l_sffc        RECORD LIKE sffc_t.*
   DEFINE l_sffc RECORD  #報工Check in/Check out專案檔
          sffcent LIKE sffc_t.sffcent, #企業編號
          sffcsite LIKE sffc_t.sffcsite, #營運據點
          sffcdocno LIKE sffc_t.sffcdocno, #報工單號
          sffcseq LIKE sffc_t.sffcseq, #項次
          sffc001 LIKE sffc_t.sffc001, #專案
          sffc002 LIKE sffc_t.sffc002, #型態
          sffc003 LIKE sffc_t.sffc003, #下限
          sffc004 LIKE sffc_t.sffc004, #上限
          sffc005 LIKE sffc_t.sffc005, #預設值
          sffc006 LIKE sffc_t.sffc006, #必要
          sffcud001 LIKE sffc_t.sffcud001, #自定義欄位(文字)001
          sffcud002 LIKE sffc_t.sffcud002, #自定義欄位(文字)002
          sffcud003 LIKE sffc_t.sffcud003, #自定義欄位(文字)003
          sffcud004 LIKE sffc_t.sffcud004, #自定義欄位(文字)004
          sffcud005 LIKE sffc_t.sffcud005, #自定義欄位(文字)005
          sffcud006 LIKE sffc_t.sffcud006, #自定義欄位(文字)006
          sffcud007 LIKE sffc_t.sffcud007, #自定義欄位(文字)007
          sffcud008 LIKE sffc_t.sffcud008, #自定義欄位(文字)008
          sffcud009 LIKE sffc_t.sffcud009, #自定義欄位(文字)009
          sffcud010 LIKE sffc_t.sffcud010, #自定義欄位(文字)010
          sffcud011 LIKE sffc_t.sffcud011, #自定義欄位(數字)011
          sffcud012 LIKE sffc_t.sffcud012, #自定義欄位(數字)012
          sffcud013 LIKE sffc_t.sffcud013, #自定義欄位(數字)013
          sffcud014 LIKE sffc_t.sffcud014, #自定義欄位(數字)014
          sffcud015 LIKE sffc_t.sffcud015, #自定義欄位(數字)015
          sffcud016 LIKE sffc_t.sffcud016, #自定義欄位(數字)016
          sffcud017 LIKE sffc_t.sffcud017, #自定義欄位(數字)017
          sffcud018 LIKE sffc_t.sffcud018, #自定義欄位(數字)018
          sffcud019 LIKE sffc_t.sffcud019, #自定義欄位(數字)019
          sffcud020 LIKE sffc_t.sffcud020, #自定義欄位(數字)020
          sffcud021 LIKE sffc_t.sffcud021, #自定義欄位(日期時間)021
          sffcud022 LIKE sffc_t.sffcud022, #自定義欄位(日期時間)022
          sffcud023 LIKE sffc_t.sffcud023, #自定義欄位(日期時間)023
          sffcud024 LIKE sffc_t.sffcud024, #自定義欄位(日期時間)024
          sffcud025 LIKE sffc_t.sffcud025, #自定義欄位(日期時間)025
          sffcud026 LIKE sffc_t.sffcud026, #自定義欄位(日期時間)026
          sffcud027 LIKE sffc_t.sffcud027, #自定義欄位(日期時間)027
          sffcud028 LIKE sffc_t.sffcud028, #自定義欄位(日期時間)028
          sffcud029 LIKE sffc_t.sffcud029, #自定義欄位(日期時間)029
          sffcud030 LIKE sffc_t.sffcud030  #自定義欄位(日期時間)030
   END RECORD
   #161109-00085#55-e
   DEFINE l_type        LIKE sfcd_t.sfcd009

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#必须有报工单资料   
   IF p_sffbdocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF p_sffbseq IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_sffc.* TO NULL
   INITIALIZE l_sfcb.* TO NULL
   INITIALIZE l_sfcd.* TO NULL
   INITIALIZE l_sffb.* TO NULL
   
   #161109-00085#55-s
   #SELECT * INTO l_sffb.*
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
   #161109-00085#55-e
     FROM sffb_t
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_sffbdocno
      AND sffbseq   = p_sffbseq
      
#只有check in和check out可以产生
   IF l_sffb.sffb001 NOT MATCHES '[24]' THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
 
   IF l_sffb.sffb001 = '2' THEN
      LET l_type ='1'     
   END IF
 
   IF l_sffb.sffb001 = '4' THEN
      LET l_type ='2'     
   END IF
   

    #161109-00085#55-s
    #SELECT * INTO l_sfcb.* FROM sfcb_t
    SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
           sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
           sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
           sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
           sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
           sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
           sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
           sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
           sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
           sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
           sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
           sfcb053,sfcb054,sfcb055
      INTO l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
           l_sfcb.sfcb003,l_sfcb.sfcb004,l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.sfcb007,
           l_sfcb.sfcb008,l_sfcb.sfcb009,l_sfcb.sfcb010,l_sfcb.sfcb011,l_sfcb.sfcb012,
           l_sfcb.sfcb013,l_sfcb.sfcb014,l_sfcb.sfcb015,l_sfcb.sfcb016,l_sfcb.sfcb017,
           l_sfcb.sfcb018,l_sfcb.sfcb019,l_sfcb.sfcb020,l_sfcb.sfcb021,l_sfcb.sfcb022,
           l_sfcb.sfcb023,l_sfcb.sfcb024,l_sfcb.sfcb025,l_sfcb.sfcb026,l_sfcb.sfcb027,
           l_sfcb.sfcb028,l_sfcb.sfcb029,l_sfcb.sfcb030,l_sfcb.sfcb031,l_sfcb.sfcb032,
           l_sfcb.sfcb033,l_sfcb.sfcb034,l_sfcb.sfcb035,l_sfcb.sfcb036,l_sfcb.sfcb037,
           l_sfcb.sfcb038,l_sfcb.sfcb039,l_sfcb.sfcb040,l_sfcb.sfcb041,l_sfcb.sfcb042,
           l_sfcb.sfcb043,l_sfcb.sfcb044,l_sfcb.sfcb045,l_sfcb.sfcb046,l_sfcb.sfcb047,
           l_sfcb.sfcb048,l_sfcb.sfcb049,l_sfcb.sfcb050,l_sfcb.sfcb051,l_sfcb.sfcb052,
           l_sfcb.sfcb053,l_sfcb.sfcb054,l_sfcb.sfcb055     
      FROM sfcb_t
    #161109-00085#55-e 
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = l_sffb.sffb005
      AND sfcb001   = l_sffb.sffb006
      AND sfcb003   = l_sffb.sffb007
      AND sfcb004   = l_sffb.sffb008
 
   IF sqlca.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00013'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success 
   END IF 

   DECLARE s_asft335_sel_sfcd CURSOR FOR
   #161109-00085#55-s
   SELECT sfcdent,sfcdsite,sfcddocno,sfcd001,sfcd002,
          sfcd003,sfcd004,sfcd005,sfcd006,sfcd007,
          sfcd008,sfcd009 
   FROM sfcd_t
   #161109-00085#55-e
    WHERE sfcdent   = g_enterprise
      AND sfcdsite  = g_site
      AND sfcddocno = l_sfcb.sfcbdocno
      AND sfcd001   = l_sfcb.sfcb001
      AND sfcd002   = l_sfcb.sfcb002
      AND sfcd009   = l_type

   IF sqlca.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = sqlca.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success 
   END IF 
      
   #161109-00085#55-s
   #FOREACH s_asft335_sel_sfcd INTO l_sfcd.*
   FOREACH s_asft335_sel_sfcd 
   INTO l_sfcd.sfcdent,l_sfcd.sfcdsite,l_sfcd.sfcddocno,l_sfcd.sfcd001,l_sfcd.sfcd002,
        l_sfcd.sfcd003,l_sfcd.sfcd004,l_sfcd.sfcd005,l_sfcd.sfcd006,l_sfcd.sfcd007,
        l_sfcd.sfcd008,l_sfcd.sfcd009
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         RETURN r_success 
      END IF
      LET l_sffc.sffcent   = l_sffb.sffbent
      LET l_sffc.sffcsite  = l_sffb.sffbsite
      LET l_sffc.sffcdocno = l_sffb.sffbdocno
      LET l_sffc.sffcseq   = l_sffb.sffbseq
      LET l_sffc.sffc001   = l_sfcd.sfcd003
      LET l_sffc.sffc002   = l_sfcd.sfcd004
      LET l_sffc.sffc003   = l_sfcd.sfcd005
      LET l_sffc.sffc004   = l_sfcd.sfcd006
      LET l_sffc.sffc005   = l_sfcd.sfcd007
      LET l_sffc.sffc006   = l_sfcd.sfcd008

      #161109-00085#55-s
      #INSERT INTO sffc_t VALUES (l_sffc.*)
      INSERT INTO sffc_t ( sffcent,sffcsite,sffcdocno,sffcseq,sffc001,
                           sffc002,sffc003,sffc004,sffc005,sffc006,
                           sffcud001,sffcud002,sffcud003,sffcud004,sffcud005,
                           sffcud006,sffcud007,sffcud008,sffcud009,sffcud010,
                           sffcud011,sffcud012,sffcud013,sffcud014,sffcud015,
                           sffcud016,sffcud017,sffcud018,sffcud019,sffcud020,
                           sffcud021,sffcud022,sffcud023,sffcud024,sffcud025,
                           sffcud026,sffcud027,sffcud028,sffcud029,sffcud030)
         VALUES (l_sffc.sffcent,l_sffc.sffcsite,l_sffc.sffcdocno,l_sffc.sffcseq,l_sffc.sffc001,
                 l_sffc.sffc002,l_sffc.sffc003,l_sffc.sffc004,l_sffc.sffc005,l_sffc.sffc006,
                 l_sffc.sffcud001,l_sffc.sffcud002,l_sffc.sffcud003,l_sffc.sffcud004,l_sffc.sffcud005,
                 l_sffc.sffcud006,l_sffc.sffcud007,l_sffc.sffcud008,l_sffc.sffcud009,l_sffc.sffcud010,
                 l_sffc.sffcud011,l_sffc.sffcud012,l_sffc.sffcud013,l_sffc.sffcud014,l_sffc.sffcud015,
                 l_sffc.sffcud016,l_sffc.sffcud017,l_sffc.sffcud018,l_sffc.sffcud019,l_sffc.sffcud020,
                 l_sffc.sffcud021,l_sffc.sffcud022,l_sffc.sffcud023,l_sffc.sffcud024,l_sffc.sffcud025,
                 l_sffc.sffcud026,l_sffc.sffcud027,l_sffc.sffcud028,l_sffc.sffcud029,l_sffc.sffcud030)
      #161109-00085#55-e      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins sffc_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success 
      END IF 
   END FOREACH
   
   RETURN r_success

END FUNCTION
################################################################################
# Descriptions...: 工单单号，RUNCARD，作业编号，制程序共用检查逻辑
# Memo...........:
# Usage..........: CALL s_asft335_chk_sffb0078(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
#                  RETURNING r_success
# Input parameter: p_sffb001      作业类别
#                : p_sffb005      工单单号
#                : p_sffb006      Runcard单号
#                : p_sffb007      作业编号
#                : p_sffb008      制程序
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2013/11/27 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_chk_sffb0078(p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
   DEFINE r_success     LIKE type_t.num5
   DEFINE p_sffb001     LIKE sffb_t.sffb001
   DEFINE p_sffb005     LIKE sffb_t.sffb005
   DEFINE p_sffb006     LIKE sffb_t.sffb006
   DEFINE p_sffb007     LIKE sffb_t.sffb007
   DEFINE p_sffb008     LIKE sffb_t.sffb008
   DEFINE l_sfcb014     LIKE sfcb_t.sfcb014
   DEFINE l_sfcb015     LIKE sfcb_t.sfcb015
   DEFINE l_sfcb016     LIKE sfcb_t.sfcb016
   DEFINE l_sfcb018     LIKE sfcb_t.sfcb018
   DEFINE l_sfcb019     LIKE sfcb_t.sfcb019
   
#检查的组合有以下几种：
#1：工单号为空
#      不检查
#2：作业编号+作业序为空
#  2.1:RUNCARD为空
#      只检查工单号是否为已审核未结案
#  2.2:RUNCARD不为空
#      检查工单+RUNCARD是否存在工单制程档内
#3：工单单号+RUNCARD不为空，作业编号OR作业序不为空
#  3.1:作业编号不为空，作业序为空
#  3.2:作业序不为空，作业编号为空
#  3.3:作业编号+作业序都不为空
#   检查工单单号+RUNCARD+作业编号（OR作业序）的组合是否存在于工单制程档内
#4：其他情况不检查
  
  
  
    WHENEVER ERROR CONTINUE
    LET r_success = TRUE
    #此段落由子樣板a19產生,检查合法性
    #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
    INITIALIZE g_chkparam.* TO NULL
#如果传入的作业编号+作业序是空的，则只检查工单+runcard
    IF p_sffb005 IS NULL THEN    #没工单，不做检查
       LET r_success = TRUE
       RETURN r_success
    END IF
    IF p_sffb007 IS NULL AND p_sffb008 IS NULL THEN   #只需要检查工单+RUNCARD
       IF p_sffb006 IS NULL THEN  #只需要检查工单,存在工单资料内，且已审核未结案
#          #設定g_chkparam.*的參數
#          LET g_chkparam.arg1 = g_site
#          LET g_chkparam.arg2 = p_sffb005
#                     
#          #呼叫檢查存在並帶值的library
#          IF cl_chk_exist("v_sfaadocno") THEN
#             #檢查成功時後續處理
#             #LET  = g_chkparam.return1
#             #DISPLAY BY NAME 
#          ELSE
#             LET r_success = FALSE
#             RETURN r_success
#          END IF
        IF NOT s_asft300_chk_stus(p_sffb005,'F') THEN
           LET r_success = FALSE
           RETURN r_success
        END IF
     ELSE                      #工单和Runcard联动检查
       #設定g_chkparam.*的參數
          LET g_chkparam.arg1 = g_site
          LET g_chkparam.arg2 = p_sffb005
          LET g_chkparam.arg3 = p_sffb006

          
       #呼叫檢查存在並帶值的library
          IF cl_chk_exist("v_sfca001") THEN
          #檢查成功時後續處理
          #LET  = g_chkparam.return1
          #DISPLAY BY NAME 

          ELSE
          #檢查失敗時後續處理
             LET r_success = FALSE
             RETURN r_success
          END IF
       END IF
    END IF
    IF p_sffb005 IS NOT NULL AND p_sffb006 IS NOT NULL AND (p_sffb007 IS NOT NULL OR p_sffb008 IS NOT NULL) THEN
       IF p_sffb007 IS NOT NULL AND p_sffb008 IS NULL THEN   #作业编号不为空，作业序为空
          #設定g_chkparam.*的參數
          LET g_chkparam.arg1 = g_site
          LET g_chkparam.arg2 = p_sffb005
          LET g_chkparam.arg3 = p_sffb006
          LET g_chkparam.arg4 = p_sffb007
          
                        
          #呼叫檢查存在並帶值的library
          IF cl_chk_exist("v_sfcb003") THEN
             #檢查成功時後續處理
             #LET  = g_chkparam.return1
             #DISPLAY BY NAME 
	      
          ELSE
             #檢查失敗時後續處理
             LET r_success = FALSE
             RETURN r_success
          END IF          
       END IF
       IF p_sffb007 IS NULL AND p_sffb008 IS NOT NULL THEN   #作业序不为空，作业编号为空
          #設定g_chkparam.*的參數
          LET g_chkparam.arg1 = g_site
          LET g_chkparam.arg2 = p_sffb005
          LET g_chkparam.arg3 = p_sffb006
          LET g_chkparam.arg4 = p_sffb008
          
                        
          #呼叫檢查存在並帶值的library
          IF cl_chk_exist("v_sfcb004") THEN
             #檢查成功時後續處理
             #LET  = g_chkparam.return1
             #DISPLAY BY NAME 
	      
          ELSE
             #檢查失敗時後續處理
             LET r_success = FALSE
             RETURN r_success
          END IF       
       END IF
       IF p_sffb007 IS NOT NULL AND p_sffb008 IS NOT NULL THEN   #作业编号+作业序都不为空
          #設定g_chkparam.*的參數
          LET g_chkparam.arg1 = g_site
          LET g_chkparam.arg2 = p_sffb005
          LET g_chkparam.arg3 = p_sffb006
          LET g_chkparam.arg4 = p_sffb007
          LET g_chkparam.arg5 = p_sffb008 
          
                        
          #呼叫檢查存在並帶值的library
          IF cl_chk_exist("v_sfcb004_1") THEN
             #檢查成功時後續處理
             #LET  = g_chkparam.return1
             #DISPLAY BY NAME 
	      
          ELSE
             #檢查失敗時後續處理
             LET r_success = FALSE
             RETURN r_success
          END IF
          #检查报工单的作业类别与对应工单制程单身状态是否一致
          SELECT sfcb014,sfcb015,sfcb016,sfcb018,sfcb019
            INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019 
            FROM sfcb_t
           WHERE sfcbent  = g_enterprise
             AND sfcbsite = g_site
             AND sfcbdocno= p_sffb005
             AND sfcb001  = p_sffb006
             AND sfcb003  = p_sffb007
             AND sfcb004  = p_sffb008
	      
          CASE p_sffb001
             WHEN '1'    #Move In
               IF l_sfcb014 <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00009'
                  LET g_errparam.extend = p_sffb005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET r_success = FALSE
               END IF
             WHEN '2'    #Check In
               IF l_sfcb015 <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00009'
                  LET g_errparam.extend = p_sffb005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET r_success = FALSE
               END IF
             WHEN '3'    #报工
               IF l_sfcb016 <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00009'
                  LET g_errparam.extend = p_sffb005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET r_success = FALSE
               END IF       
             WHEN '4'    #Check Out
                IF l_sfcb018 <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00009'
                  LET g_errparam.extend = p_sffb005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET r_success = FALSE
               END IF      
             WHEN '5'    #Move Out
                IF l_sfcb019 <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00009'
                  LET g_errparam.extend = p_sffb005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET r_success = FALSE
               END IF      
          END CASE
          IF NOT r_success THEN RETURN r_success END IF
       END IF
    END IF
    
    RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 删除对应报工单对应项次的检查项目sffc
# Memo...........:
# Usage..........: CALL s_asft335_del_sffc(p_sffbdocno,p_sffbseq)
#                  RETURNING r_success
# Input parameter: p_sffbdocno    报工单
#                : p_sffbseq      报工单项次
# Return code....: r_success      回传参数变量说明1
# Date & Author..: 2014/04/29 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_del_sffc(p_sffbdocno,p_sffbseq)
   DEFINE r_success       LIKE type_t.num5
   DEFINE p_sffbdocno     LIKE sffb_t.sffbdocno
   DEFINE p_sffbseq       LIKE sffb_t.sffbseq
      #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e
      
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#必须有报工单资料   
   IF p_sffbdocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF p_sffbseq IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_sffb.* TO NULL
   
   #161109-00085#55-s
   #SELECT * INTO l_sffb.*
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
   #161109-00085#55-e
     FROM sffb_t
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_sffbdocno
      AND sffbseq   = p_sffbseq
      
#只有check in和check out可以产生
   IF l_sffb.sffb001 NOT MATCHES '[24]' THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
   
   DELETE FROM sffc_t
    WHERE sffcent   = g_enterprise
      AND sffcsite  = g_site
      AND sffcdocno = p_sffbdocno
      AND sffcseq   = p_sffbseq
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sffc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 报工单审核/取消审核时更新工单制程进度
# Memo...........:
# Usage..........: CALL s_asft335_upd_routing(p_cmd,p_docno)
#                  RETURNING r_success
# Input parameter: p_cmd          审核1/取消审核-1
#                : p_codno        报工单单号
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2013/12/17 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_routing(p_cmd,p_docno)
   DEFINE p_cmd          LIKE type_t.num5         #审核 1/取消审核 -1
   DEFINE p_docno        LIKE sffb_t.sffbdocno    #审核单号
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5  #160730-00003#1 add
     #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e
   #161109-00085#55-s
   #DEFINE l_sfcb           RECORD LIKE sfcb_t.*  
   DEFINE l_sfcb RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e   
   #161109-00085#55-s
   #DEFINE l_sfcb_group   RECORD LIKE sfcb_t.*
   DEFINE l_sfcb_group RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e
   DEFINE l_sum          LIKE sffb_t.sffb017  #170112-00049#1
   DEFINE l_type         LIKE sffb_t.sffb001
   DEFINE l_qty          LIKE sffb_t.sffb017
   DEFINE l_sffb016      LIKE sffb_t.sffb016
#  DEFINE l_sffb017      LIKE sffb_t.sffb017  #160512-00034#1  #170106-00022#1
   DEFINE l_sql          STRING   #160801-00021#1-add
   DEFINE l_sfcb033      LIKE sfcb_t.sfcb033  #add-161103-00007#1 By dorislai
   #170117-00038#1-s
   DEFINE ls_js        STRING
   DEFINE lc_param     type_sffb_parameter
   #170117-00038#1-e
   #170213-00031#1-s-add
   DEFINE l_sfcb_chk   LIKE sfcb_t.sfcb028
   DEFINE l_sfcb_group_chk LIKE  sfcb_t.sfcb028
   DEFINE l_sfca005    LIKE sfca_t.sfca005
   #170213-00031#1-e-add
   DEFINE l_sfcb050    LIKE sfcb_t.sfcb050 ##170322-00016#1 add
   DEFINE l_sfcb_chk1  LIKE sfcb_t.sfcb028 #170405-00004#1 add
   #170524-00031#1 add(s)
   DEFINE l_sfaa010  LIKE sfaa_t.sfaa010
   DEFINE l_sfaa012  LIKE sfaa_t.sfaa012
   DEFINE l_imae020  LIKE imae_t.imae020
   DEFINE l_slip     STRING
   #170524-00031#1 add(e)
   DEFINE l_sfcb003  LIKE sfcb_t.sfcb003   #170527-00031#1 add
   DEFINE l_sfcb004  LIKE sfcb_t.sfcb004   #170527-00031#1 add
   DEFINE l_sfcb055  LIKE sfcb_t.sfcb055   #170527-00031#1 add
   DEFINE l_sfga016  LIKE sfga_t.sfga016   #170228-00018#2 add 若来源为pqc，则不更新在制量
   #170712-00013#1 add --(S)--
   DEFINE l_sfcb_group_sum RECORD  #工單製程單身檔
       #181210-00009#1 add --(S)--
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       #181210-00009#1 add --(E)--
       sfcb050 LIKE sfcb_t.sfcb050, #在制数   #181203-00048#1 add
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數  #181210-00009#1 add
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039  #合併轉出
   END RECORD 
   #170712-00013#1 add --(E)--
    #180427-00045#1---add---begin---
DEFINE l_sffb023       LIKE sffb_t.sffb023 
DEFINE  l_oobx003  LIKE oobx_t.oobx003  
DEFINE  l_oobx001  LIKE oobx_t.oobx001  
 #180427-00045#1---add----end---
DEFINE l_sfcb_group_chk1 LIKE  sfcb_t.sfcb028   #181210-00009#1 add
DEFINE l_sffbseq_t  LIKE sffb_t.sffbseq         #190228-00027#1---add
DEFINE l_sfaa055    LIKE sfaa_t.sfaa055         #190709-00006#1 add
DEFINE l_sfaa056    LIKE sfaa_t.sfaa056         #190709-00006#1 add
DEFINE l_sfaa061    LIKE sfaa_t.sfaa061         #190920-00019#1 add
DEFINE l_add_sffb017 LIKE sffb_t.sffb017        #190917-00002#1 add
DEFINE l_0_sum       LIKE type_t.num10          #190917-00002#1 add 記錄執行替代群組內FOREACH s_asft335_sel_sfcb 的次數
DEFINE l_first_sfcb050  LIKE sfcb_t.sfcb050     #190917-00002#1 add 記錄執行替代群組內FOREACH s_asft335_sel_sfcb 內第一筆的在製數
DEFINE l_cnt         LIKE type_t.num5  #191030-00006#1 add
DEFINE l_sfcb027_chk LIKE sfcb_t.sfcb027        #191129-00041#1 add 

   LET r_success = TRUE
   INITIALIZE l_sffb.* TO NULL
   INITIALIZE l_sfcb.* TO NULL
   INITIALIZE l_sfcb_group.* TO NULL
   
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00036'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF p_cmd IS NULL OR (p_cmd != 1 AND p_cmd != -1) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00041'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170228-00018#2 add-S
   LET l_sfga016 = NULL
   SELECT sfga016 INTO l_sfga016
     FROM sfga_t
    WHERE sfgadocno = p_docno AND sfgaent = g_enterprise
   #170228-00018#2 add-E
   
   #170120-00043#1-s
   #每个报工单量最后做一次检查
   IF p_cmd = '1' THEN
      DECLARE sel_sffb_for_chk_cur CURSOR FOR
         SELECT sffbdocno,sffbseq,sffb001,sffb005,sffb006,sffb007,sffb008,sffb017,sffb018,sffb019,sffb020
           FROM sffb_t
          WHERE sffbent = g_enterprise AND sffbsite = g_site AND sffbdocno = p_docno
      FOREACH sel_sffb_for_chk_cur 
         INTO l_sffb.sffbdocno,l_sffb.sffbseq,l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,
              l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
              l_sffb.sffb020
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH sel_sffb_for_chk_cur'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
         IF l_sffb.sffb017 IS NULL THEN LET l_sffb.sffb017 = 0 END IF
         IF l_sffb.sffb018 IS NULL THEN LET l_sffb.sffb018 = 0 END IF
         IF l_sffb.sffb019 IS NULL THEN LET l_sffb.sffb019 = 0 END IF
         IF l_sffb.sffb020 IS NULL THEN LET l_sffb.sffb020 = 0 END IF
         CALL s_asft335_set_qty(l_sffb.sffbdocno,l_sffb.sffbseq,l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008)
              RETURNING l_qty,l_sffb016
         IF l_sffb.sffb001 MATCHES '[1245]' THEN
           #191231-00011#1---mark---str---
           ##170524-00031#1 add(s)
           ##判断良品数量不可大于工单生产数量*超交率
           #SELECT sfaa010,sfaa012 INTO l_sfaa010,l_sfaa012
           #  FROM sfaa_t
           # WHERE sfaaent = g_enterprise
           #   AND sfaadocno = l_sffb.sffb005
           #IF NOT cl_null(l_sfaa010) AND NOT cl_null(l_sfaa012) THEN
           #   SELECT imae020 INTO l_imae020 
           #     FROM imae_t 
           #    WHERE imaeent = g_enterprise
           #      AND imaesite = g_site
           #      AND imae001 = l_sfaa010
           #   IF cl_null(l_imae020) THEN LET l_imae020 = 0 END IF
           #   IF l_sffb.sffb017 > l_sfaa012 * (1 + l_imae020 / 100) THEN
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = 'asf-00870'
           #      LET g_errparam.extend = l_sfaa012 * (1 + l_imae020 / 100)
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #      LET r_success = FALSE
           #      RETURN r_success
           #   END IF
           #END IF
           #191231-00011#1---mark---end---
            CALL s_aooi200_get_slip(l_sffb.sffb005) RETURNING l_success,l_slip
            #依順序報工
            IF cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0045') ='N' THEN
            #170524-00031#1 add(e)
               IF l_sffb.sffb017 > l_qty THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00187'
                  LET g_errparam.extend = l_sffb.sffbdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF
            END IF  #170524-00031#1 add
         END IF
        #IF l_sffb.sffb001 = '3' THEN             #191231-00011#1 mark
         IF l_sffb.sffb001 MATCHES '[12345]' THEN #191231-00011#1 add
            #191231-00011#1---add----str---
            #asft330:sffb001:3:報工
            #asft331:sffb001:1:Move in
            #asft332:sffb001:5:Move out
            #asft333:sffb001:2:Check in
            #asft334:sffb001:4:Check out
            #191231-00011#1---add----end---
            LET lc_param.sffbdocno = l_sffb.sffbdocno  #報工單號
            LET lc_param.sffbseq   = l_sffb.sffbseq    #項次
            LET lc_param.sffb001   = l_sffb.sffb001    #報工類別
            LET lc_param.sffb005   = l_sffb.sffb005    #工單單號
            LET lc_param.sffb006   = l_sffb.sffb006    #Run Card
            LET lc_param.sffb007   = l_sffb.sffb007    #作業編號
            LET lc_param.sffb008   = l_sffb.sffb008    #製程式
            LET lc_param.sffb017   = l_sffb.sffb017    #良品數量
            LET lc_param.sffb018   = l_sffb.sffb018    #報廢數量
            LET lc_param.sffb019   = l_sffb.sffb019    #當站下線數量
            LET lc_param.sffb020   = l_sffb.sffb020    #回收數量
            LET ls_js = util.JSON.stringify(lc_param)
            IF NOT s_asft335_chk_qty(ls_js) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END FOREACH
   END IF
   #170120-00043#1-e
    #180427-00045#1---add---begin---
   #来源为pqc的不需求考虑    
#   SELECT  sffb023 INTO l_sffb023 FROM sffb_t WHERE sffbent = g_enterprise AND sffbdocno = p_docno#200605-00064#1 mark

   SELECT  sffb023 INTO l_sffb023 FROM sffb_t WHERE sffbent = g_enterprise AND sffbdocno = p_docno AND rownum = 1#200605-00064#1 add #ODI-ORA#
   IF NOT cl_null(l_sffb023) THEN   #180502-00020#1 add
      CALL s_aooi200_get_slip(l_sffb023) RETURNING g_success,l_oobx001
      SELECT oobx003 INTO l_oobx003 FROM oobx_t WHERE oobxent = g_enterprise AND oobx001 = l_oobx001
   END IF                           #180502-00020#1 add  
   #180427-00045#1---add----end---

   #160730-00003#1 --s
#   DECLARE s_asft335_sel_sffb CURSOR FOR
#   SELECT sffb_t.* 
#     FROM sffb_t
#    WHERE sffbent  = g_enterprise
#      AND sffbsite = g_site
#      AND sffbdocno= p_docno
   CALL s_asft335_deal_sffbtmp(p_docno) RETURNING l_success  #s_asft335_sffbtmp临时表对sffb表的各项次重新按报工的顺序排序
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #---160801-00021#1-mod-(S)
#   DECLARE s_asft335_sel_sffb CURSOR FOR
#   SELECT s_asft335_sffbtmp.*
#     FROM s_asft335_sffbtmp
#    WHERE sffbent  = g_enterprise
#      AND sffbsite = g_site
#      AND sffbdocno= p_docno
#    ORDER BY sffb005,sffb006,sffbseq
   #LET l_sql  = " SELECT s_asft335_sffbtmp.* ",
   #161109-00085#55-s
   LET l_sql  = " SELECT sffbent,sffbsite,sffbdocno,sffbseq,
                         sffbdocdt,sffb001,sffb002,sffb003,sffb004,
                         sffb005,sffb006,sffb007,sffb008,sffb009,
                         sffb010,sffb011,sffb012,sffb013,sffb014,
                         sffb015,sffb016,sffb017,sffb018,sffb019,
                         sffb020,sffb021,sffb022,sffb023,sffb024,
                         sffb025,sffb026,sffb027,sffb028,sffbownid,
                         sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
                         sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
                         sffb030 ",
   #161109-00085#55-e                        
                "   FROM s_asft335_sffbtmp ",
                "  WHERE sffbent  = '",g_enterprise,"'",
                "    AND sffbsite = '",g_site,"'",
                "    AND sffbdocno= '",p_docno,"'"
   CASE p_cmd
      WHEN '1'   #確認 (從前往後)
         LET l_sql = l_sql CLIPPED," ORDER BY sffb005,sffb006,sffbseq "
      WHEN '-1'  #取消確認 (從後往前)
         LET l_sql = l_sql CLIPPED," ORDER BY sffb005,sffb006,sffbseq DESC "
   END CASE
   PREPARE s_asft335_sel_sffb_pre  FROM l_sql
   DECLARE s_asft335_sel_sffb CURSOR FOR s_asft335_sel_sffb_pre 
   #---160801-00021#1-mod-(E) 
   #160730-00003#1 --e

   #161109-00085#55-s
   #FOREACH s_asft335_sel_sffb INTO l_sffb.*
   FOREACH s_asft335_sel_sffb 
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      IF l_sffb.sffb017 IS NULL THEN LET l_sffb.sffb017 = 0 END IF
      IF l_sffb.sffb018 IS NULL THEN LET l_sffb.sffb018 = 0 END IF
      IF l_sffb.sffb019 IS NULL THEN LET l_sffb.sffb019 = 0 END IF
      IF l_sffb.sffb020 IS NULL THEN LET l_sffb.sffb020 = 0 END IF
      #191129-00041#1----add----str---
      LET l_imae020 = 0
      SELECT imae020 INTO l_imae020
        FROM imae_t
       WHERE imaeent  = g_enterprise
         AND imaesite = g_site
         AND imae001  = l_sffb.sffb029
      IF cl_null(l_imae020) THEN
          LET l_imae020 = 0
      END IF
      #191129-00041#1----add----end---            

      #181009-00068#1 add --(S)--
      #若是批次報工的確認還原,須在此將該項次的報工資料更新狀態碼=N
      IF p_cmd = '-1' AND 
         (g_prog MATCHES 'asft330*' OR g_prog MATCHES 'asft331*' OR 
          g_prog MATCHES 'asft332*' OR g_prog MATCHES 'asft333*' OR 
          g_prog MATCHES 'asft334*') THEN
          
         #190228-00027#1---add---s
         LET l_sffbseq_t = l_sffb.sffbseq
         LET l_sql  = " SELECT sffbseq ",                     
                      "   FROM sffb_t ",
                    "  WHERE sffbent  = '",g_enterprise,"'",
                      "    AND sffbsite = '",g_site,"'",
                      "    AND sffbdocno= '",l_sffb.sffbdocno,"'",
                      "    AND sffb005 =  '",l_sffb.sffb005,"'"

           PREPARE s_asft335_sel_sffbseq_pre  FROM l_sql
           DECLARE s_asft335_sel_sffbseq CURSOR FOR s_asft335_sel_sffbseq_pre 
           FOREACH s_asft335_sel_sffbseq INTO  l_sffb.sffbseq
      

          #190228-00027#1---add---e
         UPDATE sffb_t SET sffbstus = 'N',
                           sffbcnfdt = NULL,
                           sffbcnfid = NULL
          WHERE sffbent = l_sffb.sffbent
            AND sffbsite = l_sffb.sffbsite
            AND sffbdocno = l_sffb.sffbdocno
            AND sffbseq = l_sffb.sffbseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'updsffbstus'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success  
         END IF 
         IF SQLCA.sqlerrd[3] = 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00038'
            LET g_errparam.extend = 'select'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success  
         END IF
         END FOREACH                        #190228-00027#1---add
         LET l_sffb.sffbseq = l_sffbseq_t   #190228-00027#1---add
      END IF   
      #181009-00068#1 add --(E)--

     
#170120-00043#1-s
#往前搬
##每个报工单量最后做一次检查
#      IF p_cmd = '1' THEN
#         CALL s_asft335_set_qty(p_docno,l_sffb.sffbseq,l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008) RETURNING l_qty,l_sffb016
#                  
#         IF l_sffb.sffb001 MATCHES '[1245]' THEN
#            IF l_sffb.sffb017 > l_qty THEN  #160512-00034#1 mark  #170106-00022#1 remark
#            #170106-00022#1-s
#            ##160512-00034#1-s
#            #LET l_sffb017 = 0
#            #SELECT SUM(sffb017) INTO l_sffb017
#            #  FROM sffb_t
#            # WHERE sffbent = g_enterprise
#            #   AND sffb001 = l_sffb.sffb001
#            #   AND sffb005 = l_sffb.sffb005
#            #   AND sffb006 = l_sffb.sffb006
#            #   AND sffb007 = l_sffb.sffb007
#            #   AND sffb008 = l_sffb.sffb008
#            #IF l_sffb017 > l_qty THEN
#            ##160512-00034#1-e
#            #170106-00022#1-e
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'asf-00187'
#               LET g_errparam.extend = l_sffb.sffbdocno
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#               LET r_success = FALSE
#               RETURN r_success
#            END IF
#         END IF
#         IF l_sffb.sffb001 = '3' THEN
#            #170117-00038#1-s
#            #IF NOT s_asft335_chk_qty(l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,l_sffb.sffb020,l_qty) THEN
#            LET lc_param.sffbdocno = l_sffb.sffbdocno  #報工單號
#            LET lc_param.sffbseq   = l_sffb.sffbseq    #項次
#            LET lc_param.sffb001   = l_sffb.sffb001    #報工類別  #170120-00043#1
#            LET lc_param.sffb005   = l_sffb.sffb005    #工單單號
#            LET lc_param.sffb006   = l_sffb.sffb006    #Run Card
#            LET lc_param.sffb007   = l_sffb.sffb007    #作業編號
#            LET lc_param.sffb008   = l_sffb.sffb008    #製程式
#            LET lc_param.sffb017   = l_sffb.sffb017    #良品數量
#            LET lc_param.sffb018   = l_sffb.sffb018    #報廢數量
#            LET lc_param.sffb019   = l_sffb.sffb019    #當站下線數量
#            LET lc_param.sffb020   = l_sffb.sffb020    #回收數量
#            LET ls_js = util.JSON.stringify(lc_param)
#            IF NOT s_asft335_chk_qty(ls_js) THEN
#            #170117-00038#1-e
#               LET r_success = FALSE
#               RETURN r_success
#            END IF
#         END IF
#      END IF
#170120-00043#1-e
      
    #161109-00085#55-s
    #SELECT * INTO l_sfcb.* FROM sfcb_t
    SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
           sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
           sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
           sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
           sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
           sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
           sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
           sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
           sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
           sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
           sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
           sfcb053,sfcb054,sfcb055
      INTO l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
           l_sfcb.sfcb003,l_sfcb.sfcb004,l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.sfcb007,
           l_sfcb.sfcb008,l_sfcb.sfcb009,l_sfcb.sfcb010,l_sfcb.sfcb011,l_sfcb.sfcb012,
           l_sfcb.sfcb013,l_sfcb.sfcb014,l_sfcb.sfcb015,l_sfcb.sfcb016,l_sfcb.sfcb017,
           l_sfcb.sfcb018,l_sfcb.sfcb019,l_sfcb.sfcb020,l_sfcb.sfcb021,l_sfcb.sfcb022,
           l_sfcb.sfcb023,l_sfcb.sfcb024,l_sfcb.sfcb025,l_sfcb.sfcb026,l_sfcb.sfcb027,
           l_sfcb.sfcb028,l_sfcb.sfcb029,l_sfcb.sfcb030,l_sfcb.sfcb031,l_sfcb.sfcb032,
           l_sfcb.sfcb033,l_sfcb.sfcb034,l_sfcb.sfcb035,l_sfcb.sfcb036,l_sfcb.sfcb037,
           l_sfcb.sfcb038,l_sfcb.sfcb039,l_sfcb.sfcb040,l_sfcb.sfcb041,l_sfcb.sfcb042,
           l_sfcb.sfcb043,l_sfcb.sfcb044,l_sfcb.sfcb045,l_sfcb.sfcb046,l_sfcb.sfcb047,
           l_sfcb.sfcb048,l_sfcb.sfcb049,l_sfcb.sfcb050,l_sfcb.sfcb051,l_sfcb.sfcb052,
           l_sfcb.sfcb053,l_sfcb.sfcb054,l_sfcb.sfcb055     
      FROM sfcb_t
    #161109-00085#55-e 
       WHERE sfcbent   = g_enterprise
         AND sfcbsite  = g_site
         AND sfcbdocno = l_sffb.sffb005
         AND sfcb001   = l_sffb.sffb006
         AND sfcb003   = l_sffb.sffb007
         AND sfcb004   = l_sffb.sffb008
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'sel_sfcb'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success        
      END IF
     
     #170322-00016#1 mark  --begin--     
     ##170213-00031#1-s-add
     #LET l_sfca005 = ''
     #SELECT sfca005 INTO l_sfca005
     #  FROM sfca_t
     # WHERE sfcaent = g_enterprise
     #   AND sfcadocno = l_sfcb.sfcbdocno
     #   AND sfca001 = l_sfcb.sfcb001
     #IF l_sfca005 <> '2' AND p_cmd = -1 THEN
     #   IF l_sfcb.sfcb017 <> 'Y' THEN
     #      LET l_sfcb.sfcb033 = l_sfcb.sfcb033 + p_cmd * l_sffb.sffb017
     #   END IF
     #   LET l_sfcb.sfcb035 = l_sfcb.sfcb035 + p_cmd * l_sffb.sffb020
     #   LET l_sfcb.sfcb036 = l_sfcb.sfcb036 + p_cmd * l_sffb.sffb018
     #   LET l_sfcb.sfcb037 = l_sfcb.sfcb037 + p_cmd * l_sffb.sffb019
     #END IF
     ##170213-00031#1-e-add
     #170322-00016#1 mark  --end--

#如果是在对重工制程做报工，则要判断是否是最后一站最后一个步骤，是的话，要更新asft338里记录的重工转出制程那一站的在制量和重工转入量
#审核时这个不和其他更新sfcb，sfaa一样放在后面，是因为需要用到更新之前的sfcb046～sfcb050
      IF p_cmd ='1' THEN
         #161109-00085#55-s
         #IF NOT s_asft335_upd_rework_routing(-1,l_sfcb.*) THEN
         #170213-00027#1-s-mod
#         IF NOT s_asft335_upd_rework_routing(-1,l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
         #170322-00016#1 add  --begin--
         #最后1个报工点时才需要做
         IF ((l_sffb.sffb001 = '1' AND l_sfcb.sfcb015 = 'N' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '2' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '3' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '4' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '5')) THEN
         #170322-00016#1 add  --end--
             #170618-00349#1 add --(S)--
             #判斷此報工點是否為最後一站
             DELETE FROM s_asft335_tmp01
             CALL s_asft335_get_next_station(l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008) RETURNING l_success
             #170618-00349#1 add --(E)--
             LET g_sffbdocno = l_sffb.sffbdocno    #170524-00070#1 add
             LET g_sffbseq1  = l_sffb.sffbseq      #170524-00070#1 add
             IF NOT s_asft335_upd_rework_routing(1,l_sffb.sffb017,l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
             #170213-00027#1-e-mod
                                                    l_sfcb.sfcb003,l_sfcb.sfcb004,l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.sfcb007,
                                                    l_sfcb.sfcb008,l_sfcb.sfcb009,l_sfcb.sfcb010,l_sfcb.sfcb011,l_sfcb.sfcb012,
                                                    l_sfcb.sfcb013,l_sfcb.sfcb014,l_sfcb.sfcb015,l_sfcb.sfcb016,l_sfcb.sfcb017,
                                                    l_sfcb.sfcb018,l_sfcb.sfcb019,l_sfcb.sfcb020,l_sfcb.sfcb021,l_sfcb.sfcb022,
                                                    l_sfcb.sfcb023,l_sfcb.sfcb024,l_sfcb.sfcb025,l_sfcb.sfcb026,l_sfcb.sfcb027,
                                                    l_sfcb.sfcb028,l_sfcb.sfcb029,l_sfcb.sfcb030,l_sfcb.sfcb031,l_sfcb.sfcb032,
                                                    l_sfcb.sfcb033,l_sfcb.sfcb034,l_sfcb.sfcb035,l_sfcb.sfcb036,l_sfcb.sfcb037,
                                                    l_sfcb.sfcb038,l_sfcb.sfcb039,l_sfcb.sfcb040,l_sfcb.sfcb041,l_sfcb.sfcb042,
                                                    l_sfcb.sfcb043,l_sfcb.sfcb044,l_sfcb.sfcb045,l_sfcb.sfcb046,l_sfcb.sfcb047,
                                                    l_sfcb.sfcb048,l_sfcb.sfcb049,l_sfcb.sfcb050,l_sfcb.sfcb051,l_sfcb.sfcb052,
                                                    l_sfcb.sfcb053,l_sfcb.sfcb054,l_sfcb.sfcb055 ) THEN
             #161109-00085#55-e
                LET r_success = FALSE
                RETURN r_success        
             END IF 
         END IF   #170322-00016#1 add 
      END IF
      
#检查本站是否处于替代性群组中，若是的话，同群组的其他上一站和本站相同的作业编号+制程序也要减去相同的数量
#                            若不是，则只更新本站即可
      IF l_sfcb.sfcb005 = '2' THEN
        #181120-00037#1 mark --(S)--
        #因為下面會更新製程移轉量,因此需移到下面,每次都要重新算最新的移轉量        
        ##170712-00013#1 add --(S)--
        ##取得該替代群組所有轉出量
        #SELECT SUM(sfcb033),SUM(sfcb034),SUM(sfcb035),SUM(sfcb036),SUM(sfcb037),SUM(sfcb038),SUM(sfcb039)
        #     #,SUM(sfcb050)   #181203-00048#1 add                                                                     #181210-00009#1 mark
        #      ,SUM(sfcb048),SUM(sfcb049),SUM(sfcb050),SUM(sfcb051)                                                    #181210-00009#1 add
        #  INTO l_sfcb_group_sum.sfcb033,l_sfcb_group_sum.sfcb034,l_sfcb_group_sum.sfcb035,l_sfcb_group_sum.sfcb036,
        #       l_sfcb_group_sum.sfcb037,l_sfcb_group_sum.sfcb038,l_sfcb_group_sum.sfcb039
        #      #,l_sfcb_group_sum.sfcb050   #181203-00048#1  add                                                       #181210-00009#1 mark 
        #       ,l_sfcb_group_sum.sfcb048,l_sfcb_group_sum.sfcb049,l_sfcb_group_sum.sfcb050,l_sfcb_group_sum.sfcb051   #181210-00009#1 add
        #  FROM sfcb_t     
        # WHERE sfcbent   = g_enterprise
        #   AND sfcbsite  = g_site
        #   AND sfcbdocno = l_sfcb.sfcbdocno
        #   AND sfcb001   = l_sfcb.sfcb001
        #   AND sfcb005   = '2'
        #   AND sfcb006   = l_sfcb.sfcb006
        #   AND sfcb007   = l_sfcb.sfcb007
        #   AND sfcb008   = l_sfcb.sfcb008
        ##170712-00013#1 add --(E)--
        #181120-00037#1 mark --(E)-- 
         DECLARE s_asft335_sel_sfcb CURSOR FOR

            SELECT * FROM sfcb_t     
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = l_sfcb.sfcbdocno
               AND sfcb001   = l_sfcb.sfcb001
               AND sfcb005   = '2'
               AND sfcb006   = l_sfcb.sfcb006
               AND sfcb007   = l_sfcb.sfcb007
               AND sfcb008   = l_sfcb.sfcb008
         
         LET l_0_sum = 1 #190917-00002#1 add
         #FOREACH s_asft335_sel_sfcb INTO l_sfcb_group.*  #161109-00085#55 MARK
         #161109-00085#55-s
         FOREACH s_asft335_sel_sfcb 
            INTO l_sfcb_group.sfcbent,l_sfcb_group.sfcbsite,l_sfcb_group.sfcbdocno,l_sfcb_group.sfcb001,l_sfcb_group.sfcb002,
                 l_sfcb_group.sfcb003,l_sfcb_group.sfcb004,l_sfcb_group.sfcb005,l_sfcb_group.sfcb006,l_sfcb_group.sfcb007,
                 l_sfcb_group.sfcb008,l_sfcb_group.sfcb009,l_sfcb_group.sfcb010,l_sfcb_group.sfcb011,l_sfcb_group.sfcb012,
                 l_sfcb_group.sfcb013,l_sfcb_group.sfcb014,l_sfcb_group.sfcb015,l_sfcb_group.sfcb016,l_sfcb_group.sfcb017,
                 l_sfcb_group.sfcb018,l_sfcb_group.sfcb019,l_sfcb_group.sfcb020,l_sfcb_group.sfcb021,l_sfcb_group.sfcb022,
                 l_sfcb_group.sfcb023,l_sfcb_group.sfcb024,l_sfcb_group.sfcb025,l_sfcb_group.sfcb026,l_sfcb_group.sfcb027,
                 l_sfcb_group.sfcb028,l_sfcb_group.sfcb029,l_sfcb_group.sfcb030,l_sfcb_group.sfcb031,l_sfcb_group.sfcb032,
                 l_sfcb_group.sfcb033,l_sfcb_group.sfcb034,l_sfcb_group.sfcb035,l_sfcb_group.sfcb036,l_sfcb_group.sfcb037,
                 l_sfcb_group.sfcb038,l_sfcb_group.sfcb039,l_sfcb_group.sfcb040,l_sfcb_group.sfcb041,l_sfcb_group.sfcb042,
                 l_sfcb_group.sfcb043,l_sfcb_group.sfcb044,l_sfcb_group.sfcb045,l_sfcb_group.sfcb046,l_sfcb_group.sfcb047,
                 l_sfcb_group.sfcb048,l_sfcb_group.sfcb049,l_sfcb_group.sfcb050,l_sfcb_group.sfcb051,l_sfcb_group.sfcb052,
                 l_sfcb_group.sfcb053,l_sfcb_group.sfcb054,l_sfcb_group.sfcb055
         #161109-00085#55-e        
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF        
 
            #181120-00037#1 add --(S)--
            #取得該替代群組所有轉出量
            SELECT SUM(sfcb033),SUM(sfcb034),SUM(sfcb035),SUM(sfcb036),SUM(sfcb037),SUM(sfcb038),SUM(sfcb039),
                   SUM(sfcb048),SUM(sfcb049),SUM(sfcb050),SUM(sfcb051)                                                    
              INTO l_sfcb_group_sum.sfcb033,l_sfcb_group_sum.sfcb034,l_sfcb_group_sum.sfcb035,l_sfcb_group_sum.sfcb036,
                   l_sfcb_group_sum.sfcb037,l_sfcb_group_sum.sfcb038,l_sfcb_group_sum.sfcb039, 
                   l_sfcb_group_sum.sfcb048,l_sfcb_group_sum.sfcb049,l_sfcb_group_sum.sfcb050,l_sfcb_group_sum.sfcb051   
              FROM sfcb_t     
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = l_sfcb.sfcbdocno
               AND sfcb001   = l_sfcb.sfcb001
               AND sfcb005   = '2'
               AND sfcb006   = l_sfcb.sfcb006   
               AND sfcb007   = l_sfcb.sfcb007
               AND sfcb008   = l_sfcb.sfcb008
            #181120-00037#1 add --(E)-- 
        
#更新同群组的数量
#正在审核的本站有报工类型，知道勾选了哪个步骤的
            LET l_type = NULL
            IF l_sfcb_group.sfcbdocno = l_sffb.sffb005 AND l_sfcb_group.sfcb001 = l_sffb.sffb006 AND
               l_sfcb_group.sfcb003 = l_sffb.sffb007 AND l_sfcb_group.sfcb004 = l_sffb.sffb008 THEN
               LET l_type = l_sffb.sffb001
            ELSE     #其他同群组非本站的，更新那站里第一个勾选的步骤的待XX数量,一定会有一个步骤是勾选的，asft301那里要控制
                     #而且当前审核的步骤，必须是这站第一个步骤！
               IF l_sfcb_group.sfcb019 = 'Y' THEN
                  LET l_type = '5'
               END IF
               IF l_sfcb_group.sfcb018 = 'Y' THEN
                  LET l_type = '4'
               END IF
               IF l_sfcb_group.sfcb016 = 'Y' THEN
                  LET l_type = '3'
               END IF
               IF l_sfcb_group.sfcb015 = 'Y' THEN
                  LET l_type = '2'
               END IF
               IF l_sfcb_group.sfcb014 = 'Y' THEN
                  LET l_type = '1'
               END IF      
            END IF
            IF l_type IS NULL THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00200'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF          
            #170112-00049#1-s
            #CASE l_type
            #   WHEN '1'   #Move In
            #      LET l_sfcb_group.sfcb046 = l_sfcb_group.sfcb046 - p_cmd*l_sffb.sffb017
            #   WHEN '2'   #check In
            #      LET l_sfcb_group.sfcb047 = l_sfcb_group.sfcb047 - p_cmd*l_sffb.sffb017
            #   WHEN '3'   #报工
            #      #mod--161103-00007#1 By shiun--(S)
            #      #LET l_sfcb_group.sfcb050 = l_sfcb_group.sfcb050 - (p_cmd*l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)                  
            #      IF l_sfcb_group.sfcb017 = 'Y' THEN
            #         LET l_sfcb_group.sfcb051 = l_sfcb_group.sfcb051 + p_cmd*l_sffb.sffb017
            #      ELSE
            #         LET l_sfcb_group.sfcb050 = l_sfcb_group.sfcb050 - (p_cmd*l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)
            #      END IF
            #      #mod--161103-00007#1 By shiun--(E)
            #   WHEN '4'   #check Out
            #      LET l_sfcb_group.sfcb048 = l_sfcb_group.sfcb048 - p_cmd*l_sffb.sffb017
            #   WHEN '5'   #Move Out
            #      LET l_sfcb_group.sfcb049 = l_sfcb_group.sfcb049 - p_cmd*l_sffb.sffb017
            #END CASE 
            #標準產出量
            IF l_type MATCHES '[12]' THEN
               LET l_sfcb_group.sfcb027 = l_sfcb_group.sfcb027*l_sfcb_group.sfcb022/l_sfcb_group.sfcb021*l_sfcb_group.sfcb053/l_sfcb_group.sfcb054
            END IF
            #同張工單同站同動作的報工量加總
            LET l_sum = 0
            #170213-00031#1-s-mod
#            SELECT SUM(sffb017+sffb018+sffb019+sffb020) INTO l_sum
#              FROM sffb_t
#             WHERE sffbent   = g_enterprise
#               AND sffbsite  = g_site
#               AND sffb005   = l_sfcb_group.sfcbdocno
#               AND sffb006   = l_sfcb_group.sfcb001
#               AND sffb007   = l_sfcb_group.sfcb003
#               AND sffb008   = l_sfcb_group.sfcb004
#               AND sffb001   = l_type
#               AND sffbstus  = 'Y'
           #181120-00037#1 mark --(S)--
           #LET l_sfca005 = ''
           #SELECT sfca005 INTO l_sfca005
           #  FROM sfca_t
           # WHERE sfcaent = g_enterprise
           #   AND sfcadocno = l_sfcb_group.sfcbdocno
           #   AND sfca001 = l_sfcb_group.sfcb001
           #IF l_sfca005 = '2' THEN       
           #   SELECT SUM(sffb017+sffb018+sffb019+sffb020) INTO l_sum
           #     FROM sffb_t
           #    WHERE sffbent   = g_enterprise
           #      AND sffbsite  = g_site
           #      AND sffb005   = l_sfcb_group.sfcbdocno
           #      AND sffb006   = l_sfcb_group.sfcb001
           #      AND sffb007   = l_sfcb_group.sfcb003
           #      AND sffb008   = l_sfcb_group.sfcb004
           #      AND sffb001   = l_type
           #      AND sffbstus  = 'Y'    
           #ELSE
           #181120-00037#1 mark --(E)-- 
               IF p_cmd = 1 THEN
                  LET l_sum = (l_sffb.sffb017+l_sffb.sffb018+l_sffb.sffb019+l_sffb.sffb020)
               #170712-00013#1 add --(S)--
               ELSE
                  LET l_sum = (l_sffb.sffb017+l_sffb.sffb018+l_sffb.sffb019+l_sffb.sffb020)*(-1)
               #170712-00013#1 add --(E)--
               END IF
           #END IF   #181120-00037#1 mark
            #170213-00031#1-e-mod
            IF cl_null(l_sum) THEN LET l_sum = 0 END IF
            #181210-00009#1 add --(S)--
            #若非報工的作業站與更新狀態與報工單不同,則l_sum設定為0
            IF l_type <> l_sffb.sffb001 THEN
               LET l_sum = 0            
            END IF
            #181210-00009#1 add --(E)-- 
            #170213-00031#1-s-add
            IF cl_null(l_sfcb_group.sfcb028) THEN LET l_sfcb_group.sfcb028 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb029) THEN LET l_sfcb_group.sfcb029 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb030) THEN LET l_sfcb_group.sfcb030 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb031) THEN LET l_sfcb_group.sfcb031 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb032) THEN LET l_sfcb_group.sfcb032 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb033) THEN LET l_sfcb_group.sfcb033 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb034) THEN LET l_sfcb_group.sfcb034 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb035) THEN LET l_sfcb_group.sfcb035 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb036) THEN LET l_sfcb_group.sfcb036 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb037) THEN LET l_sfcb_group.sfcb037 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb038) THEN LET l_sfcb_group.sfcb038 = 0 END IF
            IF cl_null(l_sfcb_group.sfcb039) THEN LET l_sfcb_group.sfcb039 = 0 END IF
            LET l_sfcb_group_chk = (l_sfcb_group.sfcb028+l_sfcb_group.sfcb029+l_sfcb_group.sfcb030+l_sfcb_group.sfcb031+l_sfcb_group.sfcb032)
            #181210-00009#1 add --(S)--
            LET l_sfcb_group_chk1 = l_sfcb_group_sum.sfcb033+l_sfcb_group_sum.sfcb034+l_sfcb_group_sum.sfcb035+l_sfcb_group_sum.sfcb036+l_sfcb_group_sum.sfcb037+l_sfcb_group_sum.sfcb038+l_sfcb_group_sum.sfcb039   #181210-00009#1 add              
            #超交情況
            IF cl_null(l_sfga016) THEN   
               IF (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - l_sfcb_group_sum.sfcb048 - l_sfcb_group_sum.sfcb049 -l_sfcb_group_sum.sfcb051 - l_sfcb_group_chk1 < l_sfcb_group_sum.sfcb050 THEN       
                   LET l_sfcb050 = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - l_sfcb_group.sfcb048 - l_sfcb_group.sfcb049 -l_sfcb_group.sfcb051 - l_sfcb_group_chk1
               ELSE
                  LET l_sfcb050 = l_sfcb_group_sum.sfcb050
               END IF
            END IF  
            #181210-00009#1 add --(E)--
           #181210-00009#1 mark --(S)--
           #因為已新增l_sfcb_group_chk1處理,因此此段mark           
           #IF l_sfca005 <> '2' THEN                    
           #  #LET l_sfcb_group_chk = l_sfcb_group_chk - (l_sfcb_group.sfcb033+l_sfcb_group.sfcb034+l_sfcb_group.sfcb035+l_sfcb_group.sfcb036+l_sfcb_group.sfcb037+l_sfcb_group.sfcb038+l_sfcb_group.sfcb039)  #170712-00013#1 mark
           #   LET l_sfcb_group_chk = l_sfcb_group_chk - (l_sfcb_group_sum.sfcb033+l_sfcb_group_sum.sfcb034+l_sfcb_group_sum.sfcb035+l_sfcb_group_sum.sfcb036+l_sfcb_group_sum.sfcb037+l_sfcb_group_sum.sfcb038+l_sfcb_group_sum.sfcb039)  #170712-00013#1 add
           #   LET l_sfcb_group_chk = l_sfcb_group_chk - l_sfcb_group_sum.sfcb050   #181203-00048#1 add   
           #END IF
           #181210-00009#1 mark --(E)-- 
            CASE l_type
               WHEN '1'   #Move In
                  LET l_sfcb_group_chk = l_sfcb_group_chk - l_sfcb_group.sfcb047 - (l_sfcb_group_sum.sfcb048 + l_sfcb_group_sum.sfcb049 + l_sfcb050 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)   #没有回转到下站或者已经流转到下站的的待报工数量应扣除  #181210-00009#1 add 
                  IF (l_sfcb_group.sfcb046 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                     IF (l_sfcb_group.sfcb046 + l_sum) >= l_sfcb_group.sfcb027 THEN
                        LET l_sfcb_group.sfcb046 = 0
                     ELSE
                        IF (l_sfcb_group.sfcb046 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb_group.sfcb027*(-1)) THEN
                           LET l_sfcb_group.sfcb046 = l_sfcb_group.sfcb027*(-1)
                        ELSE
                           #170213-00031#1-s-mod
#                           LET l_sfcb_group.sfcb046 = l_sfcb_group.sfcb028 - l_sum
                           LET l_sfcb_group.sfcb046 = l_sfcb_group_chk - l_sum
                           #170213-00031#1-e-mod
                        END IF
                     END IF
                  ELSE
                     LET l_sfcb_group.sfcb046 = l_sfcb_group.sfcb028 - l_sum
                  END IF
               WHEN '2'   #check In
                  LET l_sfcb_group_chk = l_sfcb_group_chk - l_sfcb_group.sfcb046 - (l_sfcb_group_sum.sfcb048 + l_sfcb_group_sum.sfcb049 + l_sfcb050 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)   #没有回转到下站或者已经流转到下站的的待报工数量应扣除  #181210-00009#1 add                  
                  #201127-00013#1--add---str---
                  IF l_sffb.sffb001 = '3' AND l_type = '2'
                      AND l_sfcb_group.sfcb015 = 'Y' THEN #Check in
                       LET l_sfcb_group_chk = l_sfcb_group.sfcb047 #當站的待Check in數
                  END IF
                  #201127-00013#1--add---end---
                  IF (l_sfcb_group.sfcb047 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                     IF (l_sfcb_group.sfcb047 + l_sum) >= l_sfcb_group.sfcb027 THEN
                        LET l_sfcb_group.sfcb047 = 0
                     ELSE
                        IF (l_sfcb_group.sfcb047 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb_group.sfcb027*(-1)) THEN
                           LET l_sfcb_group.sfcb047 = l_sfcb_group.sfcb027*(-1)
                        ELSE
                           #170213-00031#1-s-mod
#                           LET l_sfcb_group.sfcb047 = l_sfcb_group.sfcb028 - l_sum
                           LET l_sfcb_group.sfcb047 = l_sfcb_group_chk - l_sum
                           #170213-00031#1-e-mod
                        END IF
                     END IF
                  ELSE
                     #170213-00031#1-s-mod
#                     LET l_sfcb_group.sfcb047 = l_sfcb_group.sfcb028 - l_sum
                     LET l_sfcb_group.sfcb047 = l_sfcb_group_chk - l_sum
                     #170213-00031#1-e-mod
                  END IF
               WHEN '3'   #报工
                  IF cl_null(l_sfga016) OR l_oobx003 <> 'aqct300'  THEN #170228-00018#2 add-S 来源为pqc时，不更新在制量  #180427-00045#1 add 'OR l_oobx003 <> 'aqct300' '
                 #LET l_sfcb_group_chk = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - (l_sfcb_group_sum.sfcb048 + l_sfcb_group_sum.sfcb049 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)  #没有回转到下站或者已经流转到下站的的待报工数量应扣除  #181210-00009#1 add #190917-00002#1 mark  
                  #190917-00002#1---add----str---
                  IF l_sfcb_group.sfcb017 = 'Y' THEN
                      LET l_sfcb_group_chk = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - (l_sfcb_group_sum.sfcb048 + l_sfcb_group_sum.sfcb049 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)
                  ELSE
                      LET l_sfcb_group_chk = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - (l_sfcb_group_sum.sfcb048 + l_sfcb_group_sum.sfcb049 +                            l_sfcb_group_chk1)
                  END IF
                  #190917-00002#1---add----end---                 
                  #201127-00013#1--add---str---
                  IF l_sffb.sffb001 = '3' AND l_type = '3'
                      AND l_sfcb_group.sfcb015 = 'Y' THEN #Check in
                       LET l_sfcb_group_chk = l_sfcb_group.sfcb050 #當站的在製量
                  END IF
                  #201127-00013#1--add---end---
                  IF l_sfcb_group.sfcb017 = 'Y' THEN
                    #LET l_sfcb_group.sfcb051 = l_sfcb_group.sfcb051 + p_cmd*l_sffb.sffb017 #190917-00002#1 mark
                    #190917-00002#1---add----str---
                     LET l_add_sffb017 = p_cmd*l_sffb.sffb017
                     IF l_sffb.sffb001 = '3' AND l_type = '3' THEN
                         IF (l_sffb.sffb007 <> l_sfcb_group.sfcb003) OR
                            (l_sffb.sffb008 <> l_sfcb_group.sfcb004) THEN
                             LET l_add_sffb017 = 0
                         END IF
                     END IF
                     LET l_sfcb_group.sfcb051 = l_sfcb_group.sfcb051 + l_add_sffb017
                    #190917-00002#1---add----end---
                  END IF
                  IF (l_sfcb_group.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                     IF (l_sfcb_group.sfcb050 + l_sum) >= l_sfcb_group.sfcb027 THEN
                        LET l_sfcb_group.sfcb050 = 0
                     ELSE
                        IF (l_sfcb_group.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb_group.sfcb027*(-1)) THEN
                           LET l_sfcb_group.sfcb050 = l_sfcb_group.sfcb027*(-1)
                        ELSE
                           #170213-00031#1-s-mod
#                           LET l_sfcb_group.sfcb050 = l_sfcb_group.sfcb028 - l_sum
                           LET l_sfcb_group.sfcb050 = l_sfcb_group_chk - l_sum
                           #170213-00031#1-e-mod
                        END IF
                     END IF
                  ELSE
                     #170213-00031#1-s-mod
#                     LET l_sfcb_group.sfcb050 = l_sfcb_group.sfcb028 - l_sum
                     LET l_sfcb_group.sfcb050 = l_sfcb_group_chk - l_sum
                     #170213-00031#1-e-mod
                  END IF
                  END IF   #170228-00018#2 add-E
                  #190917-00002#1---add----str---
                  IF l_sffb.sffb001 = '3' AND l_type = '3' THEN
                      IF l_0_sum <> 1 THEN #190919 add
                          LET l_sfcb_group.sfcb050 = l_first_sfcb050
                      ELSE
                          LET l_first_sfcb050      = l_sfcb_group.sfcb050
                      END IF
                      LET l_0_sum = l_0_sum + 1
                  END IF
                  #190917-00002#1---add----end---
               WHEN '4'   #check Out
                  LET l_sfcb_group_chk = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - (l_sfcb_group_sum.sfcb049 + l_sfcb050 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)   #没有回转到下站或者已经流转到下站的的待报工数量应扣除  #181210-00009#1 add
                  IF (l_sfcb_group.sfcb048 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                     IF (l_sfcb_group.sfcb048 + l_sum) >= l_sfcb_group.sfcb027 THEN
                        LET l_sfcb_group.sfcb048 = 0
                     ELSE
                        IF (l_sfcb_group.sfcb048 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb_group.sfcb027*(-1)) THEN
                           LET l_sfcb_group.sfcb048 = l_sfcb_group.sfcb027*(-1)
                        ELSE
                           #170213-00031#1-s-mod
#                           LET l_sfcb_group.sfcb048 = l_sfcb_group.sfcb028 - l_sum
                           LET l_sfcb_group.sfcb048 = l_sfcb_group_chk - l_sum
                           #170213-00031#1-e-mod
                        END IF
                     END IF
                  ELSE
                     #170213-00031#1-s-mod
#                     LET l_sfcb_group.sfcb048 = l_sfcb_group.sfcb028 - l_sum
                     LET l_sfcb_group.sfcb048 = l_sfcb_group_chk - l_sum
                     #170213-00031#1-e-mod
                  END IF
               WHEN '5'   #Move Out
                  LET l_sfcb_group_chk = (l_sfcb_group_chk - l_sfcb_group.sfcb046 - l_sfcb_group.sfcb047) - (l_sfcb_group_sum.sfcb048 + l_sfcb050 + l_sfcb_group_sum.sfcb051 + l_sfcb_group_chk1)   #没有回转到下站或者已经流转到下站的的待报工数量应扣除  #181210-00009#1 add 
                  IF (l_sfcb_group.sfcb049 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                     IF (l_sfcb_group.sfcb049 + l_sum) >= l_sfcb_group.sfcb027 THEN
                        LET l_sfcb_group.sfcb049 = 0
                     ELSE
                        IF (l_sfcb_group.sfcb049 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb_group.sfcb027*(-1)) THEN
                           LET l_sfcb_group.sfcb049 = l_sfcb_group.sfcb027*(-1)
                        ELSE
                           #170213-00031#1-s-mod
#                           LET l_sfcb_group.sfcb049 = l_sfcb_group.sfcb028 - l_sum
                           LET l_sfcb_group.sfcb049 = l_sfcb_group_chk - l_sum
                           #170213-00031#1-e-mod
                        END IF
                     END IF
                  ELSE
                     #170213-00031#1-s-mod
#                     LET l_sfcb_group.sfcb049 = l_sfcb_group.sfcb028 - l_sum
                     LET l_sfcb_group.sfcb049 = l_sfcb_group_chk - l_sum
                     #170213-00031#1-e-mod
                  END IF
            END CASE 
            #170112-00049#1-e
            IF l_sfcb_group.sfcb046 IS NULL THEN LET l_sfcb_group.sfcb046 = 0 END IF
            IF l_sfcb_group.sfcb047 IS NULL THEN LET l_sfcb_group.sfcb047 = 0 END IF
            IF l_sfcb_group.sfcb050 IS NULL THEN LET l_sfcb_group.sfcb050 = 0 END IF
            IF l_sfcb_group.sfcb048 IS NULL THEN LET l_sfcb_group.sfcb048 = 0 END IF
            IF l_sfcb_group.sfcb049 IS NULL THEN LET l_sfcb_group.sfcb049 = 0 END IF 
            
            UPDATE sfcb_t SET sfcb046 = l_sfcb_group.sfcb046,
                              sfcb047 = l_sfcb_group.sfcb047,
                              sfcb050 = l_sfcb_group.sfcb050,
                              sfcb051 = l_sfcb_group.sfcb051,  #add--161103-00007#1 By shiun
                              sfcb048 = l_sfcb_group.sfcb048,
                              sfcb049 = l_sfcb_group.sfcb049
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = l_sfcb_group.sfcbdocno
               AND sfcb001   = l_sfcb_group.sfcb001
               AND sfcb003   = l_sfcb_group.sfcb003
               AND sfcb004   = l_sfcb_group.sfcb004
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd_sfcb'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success        
            END IF
      
            IF SQLCA.sqlerrd[3] = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00046'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success        
            END IF   
         END FOREACH     
         FREE s_asft335_sel_sfcb         
      ELSE
#更新当前站的数量
         #170112-00049#1-s
         #CASE l_sffb.sffb001
         #   WHEN '1'   #Move In
         #     LET l_sfcb.sfcb046 = l_sfcb.sfcb046 - p_cmd*l_sffb.sffb017
         #   WHEN '2'   #check In
         #      LET l_sfcb.sfcb047 = l_sfcb.sfcb047 - p_cmd*l_sffb.sffb017
         #   WHEN '3'   #报工
         #      #mod-161103-00007#1 By dorislai--(S) 不用把原本寫的地方，搬至else中，修改回來
         #      ##mod--161103-00007#1 By shiun--(S)
         #      ##LET l_sfcb.sfcb050 = l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)               
         #      #IF l_sfcb.sfcb017 = 'Y' THEN
         #      #   LET l_sfcb.sfcb051 = l_sfcb.sfcb051 + p_cmd*l_sffb.sffb017
         #      #ELSE
         #      #   LET l_sfcb.sfcb050 = l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)               
         #      #END IF
         #      ##mod--161103-00007#1 By shiun--(E)
         #      IF l_sfcb.sfcb017 = 'Y' THEN
         #         LET l_sfcb.sfcb051 = l_sfcb.sfcb051 + p_cmd*l_sffb.sffb017
         #      END IF
         #      LET l_sfcb.sfcb050 = l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)               
         #      #mod-161103-00007#1 By dorislai--(E)
         #   WHEN '4'   #check Out
         #      LET l_sfcb.sfcb048 = l_sfcb.sfcb048 - p_cmd*l_sffb.sffb017
         #   WHEN '5'   #Move Out
         #      LET l_sfcb.sfcb049 = l_sfcb.sfcb049 - p_cmd*l_sffb.sffb017
         #END CASE
         #標準產出量
         IF l_sffb.sffb001 MATCHES '[12]' THEN
            LET l_sfcb.sfcb027 = l_sfcb.sfcb027*l_sfcb.sfcb022/l_sfcb.sfcb021*l_sfcb.sfcb053/l_sfcb.sfcb054
         END IF
         #同張工單同站同動作的報工量加總
         LET l_sum = 0
         #170213-00031#1-s-mod
#         SELECT SUM(sffb017+sffb018+sffb019+sffb020) INTO l_sum
#           FROM sffb_t
#          WHERE sffbent   = g_enterprise
#            AND sffbsite  = g_site
#            AND sffb005   = l_sfcb.sfcbdocno
#            AND sffb006   = l_sfcb.sfcb001
#            AND sffb007   = l_sfcb.sfcb003
#            AND sffb008   = l_sfcb.sfcb004
#            AND sffb001   = l_sffb.sffb001
#            AND sffbstus  = 'Y'
        #170322-00016#1 mark  --begin--
        #LET l_sfca005 = ''
        #SELECT sfca005 INTO l_sfca005
        #  FROM sfca_t
        # WHERE sfcaent = g_enterprise
        #   AND sfcadocno = l_sfcb.sfcbdocno
        #   AND sfca001 = l_sfcb.sfcb001
        #IF l_sfca005 = '2' THEN
        #   SELECT SUM(sffb017+sffb018+sffb019+sffb020) INTO l_sum
        #     FROM sffb_t
        #    WHERE sffbent   = g_enterprise
        #      AND sffbsite  = g_site
        #      AND sffb005   = l_sfcb.sfcbdocno
        #      AND sffb006   = l_sfcb.sfcb001
        #      AND sffb007   = l_sfcb.sfcb003
        #      AND sffb008   = l_sfcb.sfcb004
        #      AND sffb001   = l_sffb.sffb001
        #      AND sffbstus  = 'Y'                           
        #ELSE  
        #   IF p_cmd = 1 THEN   
        #      LET l_sum = (l_sffb.sffb017+l_sffb.sffb018+l_sffb.sffb019+l_sffb.sffb020)
        #   END IF
        #
        #END IF
        ##170213-00031#1-e-add
        #IF cl_null(l_sum) THEN LET l_sum = 0 END IF
        #170322-00016#1 mark   --end--
         LET l_sum = (l_sffb.sffb017+l_sffb.sffb018+l_sffb.sffb019+l_sffb.sffb020) * p_cmd     #170322-00016#1  add
         
         #170213-00031#1-s-add
         IF cl_null(l_sfcb.sfcb028) THEN LET l_sfcb.sfcb028 = 0 END IF
         IF cl_null(l_sfcb.sfcb029) THEN LET l_sfcb.sfcb029 = 0 END IF
         IF cl_null(l_sfcb.sfcb030) THEN LET l_sfcb.sfcb030 = 0 END IF
         IF cl_null(l_sfcb.sfcb031) THEN LET l_sfcb.sfcb031 = 0 END IF
         IF cl_null(l_sfcb.sfcb032) THEN LET l_sfcb.sfcb032 = 0 END IF
         IF cl_null(l_sfcb.sfcb033) THEN LET l_sfcb.sfcb033 = 0 END IF
         IF cl_null(l_sfcb.sfcb034) THEN LET l_sfcb.sfcb034 = 0 END IF
         IF cl_null(l_sfcb.sfcb035) THEN LET l_sfcb.sfcb035 = 0 END IF
         IF cl_null(l_sfcb.sfcb036) THEN LET l_sfcb.sfcb036 = 0 END IF
         IF cl_null(l_sfcb.sfcb037) THEN LET l_sfcb.sfcb037 = 0 END IF
         IF cl_null(l_sfcb.sfcb038) THEN LET l_sfcb.sfcb038 = 0 END IF
         IF cl_null(l_sfcb.sfcb039) THEN LET l_sfcb.sfcb039 = 0 END IF
         LET l_sfcb_chk = (l_sfcb.sfcb028+l_sfcb.sfcb029+l_sfcb.sfcb030+l_sfcb.sfcb031+l_sfcb.sfcb032)
         
        #IF l_sfca005 <> '2' THEN  #170322-00016#1  mark
           #LET l_sfcb_chk = l_sfcb_chk - (l_sfcb.sfcb033+l_sfcb.sfcb034+l_sfcb.sfcb035+l_sfcb.sfcb036+l_sfcb.sfcb037+l_sfcb.sfcb038+l_sfcb.sfcb039)  #170405-00004#1 mark
            LET l_sfcb_chk1 = l_sfcb.sfcb033+l_sfcb.sfcb034+l_sfcb.sfcb035+l_sfcb.sfcb036+l_sfcb.sfcb037+l_sfcb.sfcb038+l_sfcb.sfcb039   #170405-00004#1 add
        #END IF                    #170322-00016#1  mark
        
        #170322-00016#1 add  --begin--
        #超交情况
       #170405-00004#1 mod --begin--
       #IF l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047 - l_sfcb.sfcb048 - l_sfcb.sfcb049 -l_sfcb.sfcb051 < l_sfcb.sfcb050 THEN
       #   LET l_sfcb050 = l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047 - l_sfcb.sfcb048 - l_sfcb.sfcb049 -l_sfcb.sfcb051  
        IF cl_null(l_sfga016) THEN   #170228-00018#2 add-S
        IF (l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047) * l_sfcb.sfcb054 / l_sfcb.sfcb053 * l_sfcb.sfcb021 / l_sfcb.sfcb022  - l_sfcb.sfcb048 - l_sfcb.sfcb049 -l_sfcb.sfcb051 - l_sfcb_chk1 < l_sfcb.sfcb050 THEN       
           LET l_sfcb050 = (l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047) * l_sfcb.sfcb054 / l_sfcb.sfcb053 * l_sfcb.sfcb021 / l_sfcb.sfcb022  - l_sfcb.sfcb048 - l_sfcb.sfcb049 -l_sfcb.sfcb051 - l_sfcb_chk1
       # 170405-00004#1 mod --end--
        ELSE
           LET l_sfcb050 = l_sfcb.sfcb050
        END IF
        END IF   #170228-00018#2 add-E
        #170322-00016#1 add   --end--
        
         #170213-00031#1-e-add
         CASE l_sffb.sffb001
            WHEN '1'   #Move In
              #LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb047 - l_sfcb.sfcb048 - l_sfcb.sfcb049 - l_sfcb050 -l_sfcb.sfcb051    #170322-00016#1 add 没有回转到下站或者已经流转到下站的的待报工数量应扣除
               LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb047 - (l_sfcb.sfcb048 + l_sfcb.sfcb049 + l_sfcb050 + l_sfcb.sfcb051 + l_sfcb_chk1) * l_sfcb.sfcb022 / l_sfcb.sfcb021 * l_sfcb.sfcb053 / l_sfcb.sfcb054  #170405-00004 #1 add
               IF (l_sfcb.sfcb046 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                  IF (l_sfcb.sfcb046 + l_sum) >= l_sfcb.sfcb027 THEN
                     LET l_sfcb.sfcb046 = 0
                  ELSE
                     IF (l_sfcb.sfcb046 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb.sfcb027*(-1)) THEN
                        LET l_sfcb.sfcb046 = l_sfcb.sfcb027*(-1)
                     ELSE
                        #170213-00031#1-s-mod
#                        LET l_sfcb.sfcb046 = l_sfcb.sfcb028 - l_sum
                        LET l_sfcb.sfcb046 = l_sfcb_chk - l_sum
                        #170213-00031#1-e-mod
                     END IF
                  END IF
               ELSE
                  #170213-00031#1-s-mod
#                  LET l_sfcb.sfcb046 = l_sfcb.sfcb028 - l_sum
                  LET l_sfcb.sfcb046 = l_sfcb_chk - l_sum
                  #170213-00031#1-e-mod
               END IF
            WHEN '2'   #check In
              #LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb048 - l_sfcb.sfcb049 - l_sfcb050 -l_sfcb.sfcb051    #170322-00016#1 add 没有回转到下站或者已经流转到下站的的待报工数量应扣除
               LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb046 - (l_sfcb.sfcb048 + l_sfcb.sfcb049 + l_sfcb050 + l_sfcb.sfcb051 + l_sfcb_chk1) * l_sfcb.sfcb022 / l_sfcb.sfcb021 * l_sfcb.sfcb053 / l_sfcb.sfcb054  #170405-00004 #1 add
               IF (l_sfcb.sfcb047 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                  IF (l_sfcb.sfcb047 + l_sum) >= l_sfcb.sfcb027 THEN
                     LET l_sfcb.sfcb047 = 0
                  ELSE
                     IF (l_sfcb.sfcb047 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb.sfcb027*(-1)) THEN
                        LET l_sfcb.sfcb047 = l_sfcb.sfcb027*(-1)
                     ELSE
                        #170213-00031#1-s-mod
#                        LET l_sfcb.sfcb047 = l_sfcb.sfcb028 - l_sum
                        LET l_sfcb.sfcb047 = l_sfcb_chk - l_sum
                        #170213-00031#1-e-mod
                     END IF
                  END IF
               ELSE
                  #170213-00031#1-s-mod
#                  LET l_sfcb.sfcb047 = l_sfcb.sfcb028 - l_sum
                  LET l_sfcb.sfcb047 = l_sfcb_chk - l_sum
                  #170213-00031#1-e-mod
               END IF
            WHEN '3'   #报工
               #170228-00018#2 add-S
               IF NOT cl_null(l_sfga016) OR l_oobx003 ='aqct300'  THEN   #来源为pqc时，不更新在制量  #180427-00045#1 add 'OR l_oobx003 <> 'aqct300' '
               ELSE
               
               #170228-00018#2 add-E
              #LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047 - l_sfcb.sfcb048 - l_sfcb.sfcb049 -l_sfcb.sfcb051    #170322-00016#1 add 没有回转到下站或者已经流转到下站的的待报工数量应扣除
               LET l_sfcb_chk = (l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047) * l_sfcb.sfcb054 / l_sfcb.sfcb053 * l_sfcb.sfcb021 / l_sfcb.sfcb022 - (l_sfcb.sfcb048 + l_sfcb.sfcb049 + l_sfcb.sfcb051 + l_sfcb_chk1)   #170405-00004 #1 add
               IF l_sfcb.sfcb017 = 'Y' THEN
                  LET l_sfcb.sfcb051 = l_sfcb.sfcb051 + p_cmd*l_sffb.sffb017
               END IF
               #IF (l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN   #181031-00068#1 mark
               IF (l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) <= 0 THEN   #181031-00068#1 add
                  #170309-00043#1-s-mod
#                  IF (l_sfcb.sfcb050 + l_sum) >= l_sfcb.sfcb027 THEN                  
#                     LET l_sfcb.sfcb050 = 0
                  IF (l_sfcb.sfcb050 + l_sum) >= l_sfcb.sfcb027 AND (l_sfcb.sfcb028+l_sfcb.sfcb029+l_sfcb.sfcb030+l_sfcb.sfcb031+l_sfcb.sfcb032) - l_sum > 0 THEN          
                     LET l_sfcb.sfcb050 = 0
                  #170309-00043#1-e-mod
                  ELSE
                     IF (l_sfcb.sfcb050 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb.sfcb027*(-1)) THEN
                        LET l_sfcb.sfcb050 = l_sfcb.sfcb027*(-1)
                     ELSE
                        #170213-00031#1-s-mod
#                        LET l_sfcb.sfcb050 = l_sfcb.sfcb028 - l_sum
                        #170306-00002#1-s-mod
                        LET l_sfcb.sfcb050 = l_sfcb_chk - l_sum
                        IF l_sfcb_chk - l_sum < 0 THEN
                           #170309-00043#1-s-mod
                           LET l_sfcb.sfcb050 = 0    #170322-00016#1 remark
                           CALL s_aooi200_get_slip(l_sffb.sffb005) RETURNING l_success,g_doc_slip                                 #170322-00016#1 add
                           IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='Y' THEN  #允许事后报工的工单才要检查    #170322-00016#1 add
                               LET l_sfcb027_chk = l_sfcb.sfcb027*(1+l_imae020/100) #191129-00041#1 add
                              #IF (l_sfcb.sfcb033+l_sfcb.sfcb034+l_sfcb.sfcb035+l_sfcb.sfcb036+l_sfcb.sfcb037+l_sfcb.sfcb038+l_sfcb.sfcb039 + p_cmd*l_sum) < l_sfcb.sfcb027 THEN #191129-00041#1 mark
                               IF (l_sfcb.sfcb033+l_sfcb.sfcb034+l_sfcb.sfcb035+l_sfcb.sfcb036+l_sfcb.sfcb037+l_sfcb.sfcb038+l_sfcb.sfcb039 + p_cmd*l_sum) < l_sfcb027_chk THEN  #191129-00041#a add
                                  LET l_sfcb.sfcb050 = l_sfcb_chk - l_sum
                                 #191129-00041#1---add----str---
                                 IF l_sfcb.sfcb050 < 0 THEN
                                     LET l_sfcb.sfcb050 = 0
                                 END IF
                                 #191129-00041#1---add----end---
                               ELSE
                                  LET l_sfcb.sfcb050 = l_sfcb_chk - l_sum + ((l_sfcb.sfcb033+l_sfcb.sfcb034+l_sfcb.sfcb035+l_sfcb.sfcb036+l_sfcb.sfcb037+l_sfcb.sfcb038+l_sfcb.sfcb039 + p_cmd*l_sum)-l_sfcb.sfcb027) 
                               END IF
                           END IF  #170322-00016#1 add
                           #170309-00043#1-e-mod
                        ELSE
                           LET l_sfcb.sfcb050 = l_sfcb_chk - l_sum
                        END IF
                        #170306-00002#1-e-mod
                        #170213-00031#1-e-mod
                     END IF
                  END IF
               ELSE
                  #170213-00031#1-s-mod
#                  LET l_sfcb.sfcb050 = l_sfcb.sfcb028 - l_sum
                  LET l_sfcb.sfcb050 = l_sfcb_chk - l_sum
                  #170213-00031#1-e-mod
               END IF
               END IF #170228-00018#2 add
            WHEN '4'   #check Out
              #LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047 - l_sfcb.sfcb049 - l_sfcb050 -l_sfcb.sfcb051    #170322-00016#1 add 没有回转到下站或者已经流转到下站的的待报工数量应扣除
               LET l_sfcb_chk = (l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047) * l_sfcb.sfcb054 / l_sfcb.sfcb053 * l_sfcb.sfcb021 / l_sfcb.sfcb022 - (l_sfcb.sfcb049 + l_sfcb050 + l_sfcb.sfcb051 + l_sfcb_chk1)   #170405-00004 #1 add
               IF (l_sfcb.sfcb048 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN  
                  IF (l_sfcb.sfcb048 + l_sum) >= l_sfcb.sfcb027 THEN
                     LET l_sfcb.sfcb048 = 0
                  ELSE
                     IF (l_sfcb.sfcb048 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb.sfcb027*(-1)) THEN
                        LET l_sfcb.sfcb048 = l_sfcb.sfcb027*(-1)
                     ELSE
                        #170213-00031#1-s-mod
#                        LET l_sfcb.sfcb048 = l_sfcb.sfcb028 - l_sum
                        LET l_sfcb.sfcb048 = l_sfcb_chk - l_sum
                        #170213-00031#1-e-mod
                     END IF
                  END IF
               ELSE
                  #170213-00031#1-s-mod
#                  LET l_sfcb.sfcb048 = l_sfcb.sfcb028 - l_sum
                  LET l_sfcb.sfcb048 = l_sfcb_chk - l_sum
                  #170213-00031#1-e-mod
               END IF
            WHEN '5'   #Move Out
              #LET l_sfcb_chk = l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047 - l_sfcb.sfcb048 - l_sfcb050 -l_sfcb.sfcb051    #170322-00016#1 add 没有回转到下站或者已经流转到下站的的待报工数量应扣除
               LET l_sfcb_chk = (l_sfcb_chk - l_sfcb.sfcb046 - l_sfcb.sfcb047) * l_sfcb.sfcb054 / l_sfcb.sfcb053 * l_sfcb.sfcb021 / l_sfcb.sfcb022 - (l_sfcb.sfcb048 + l_sfcb050 + l_sfcb.sfcb051 + l_sfcb_chk1)   #170405-00004 #1 add
               IF (l_sfcb.sfcb049 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < 0 THEN
                  IF (l_sfcb.sfcb049 + l_sum) >= l_sfcb.sfcb027 THEN
                     LET l_sfcb.sfcb049 = 0
                  ELSE
                     IF (l_sfcb.sfcb049 - p_cmd*(l_sffb.sffb017 + l_sffb.sffb018 + l_sffb.sffb019 + l_sffb.sffb020)) < (l_sfcb.sfcb027*(-1)) THEN
                        LET l_sfcb.sfcb049 = l_sfcb.sfcb027*(-1)
                     ELSE
                        #170213-00031#1-s-mod
#                        LET l_sfcb.sfcb049 = l_sfcb.sfcb028 - l_sum
                        LET l_sfcb.sfcb049 = l_sfcb_chk - l_sum
                        #170213-00031#1-e-mod
                     END IF
                  END IF
               ELSE
                  #170213-00031#1-s-mod
#                  LET l_sfcb.sfcb049 = l_sfcb.sfcb028 - l_sum
                  LET l_sfcb.sfcb049 = l_sfcb_chk - l_sum
                  #170213-00031#1-e-mod
               END IF
         END CASE
         #170112-00049#1-e

         IF l_sfcb.sfcb046 IS NULL THEN LET l_sfcb.sfcb046 = 0 END IF
         IF l_sfcb.sfcb047 IS NULL THEN LET l_sfcb.sfcb047 = 0 END IF
         IF l_sfcb.sfcb050 IS NULL THEN LET l_sfcb.sfcb050 = 0 END IF
         IF l_sfcb.sfcb048 IS NULL THEN LET l_sfcb.sfcb048 = 0 END IF
         IF l_sfcb.sfcb049 IS NULL THEN LET l_sfcb.sfcb049 = 0 END IF
         
         UPDATE sfcb_t SET sfcb046 = l_sfcb.sfcb046,
                           sfcb047 = l_sfcb.sfcb047,
                           sfcb050 = l_sfcb.sfcb050,
                           sfcb051 = l_sfcb.sfcb051,  #add--161103-00007#1 By shiun
                           sfcb048 = l_sfcb.sfcb048,
                           sfcb049 = l_sfcb.sfcb049
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001   = l_sffb.sffb006
            AND sfcb003   = l_sffb.sffb007
            AND sfcb004   = l_sffb.sffb008
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd_sfcb'
               LET g_errparam.popup = TRUE
               CALL cl_err()

            LET r_success = FALSE
            RETURN r_success        
         END IF
   
         IF SQLCA.sqlerrd[3] = 0 THEN
            INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00046'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

            LET r_success = FALSE
            RETURN r_success        
         END IF      
      END IF   

#sffb001=3时，更新本站的sfcb的良品转出数量，回收转出数量,当站报废，当站下线（重工有另外作业处理回写）
     #IF l_sffb.sffb001 = '3' THEN    #170322-00016#1 add mark
     #170322-00016#1 add  --begin--
     #最后1个报工点时才回写转出
      IF ((l_sffb.sffb001 = '1' AND l_sfcb.sfcb015 = 'N' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
          (l_sffb.sffb001 = '2' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
          (l_sffb.sffb001 = '3' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
          (l_sffb.sffb001 = '4' AND l_sfcb.sfcb019 = 'N') OR
          (l_sffb.sffb001 = '5')) THEN
     #170322-00016#1 add  --end--
         #mod-161103-00007#1 By dorislai---(S)
#         UPDATE sfcb_t SET sfcb033 = sfcb033 + p_cmd * l_sffb.sffb017,  #因为只有sffb001=3的情况，所以不用换算了
#                           sfcb035 = sfcb035 + p_cmd * l_sffb.sffb020,
#                           sfcb036 = sfcb036 + p_cmd * l_sffb.sffb018,
#                           sfcb037 = sfcb037 + p_cmd * l_sffb.sffb019                        
#          WHERE sfcbent   = g_enterprise
#            AND sfcbsite  = g_site
#            AND sfcbdocno = l_sffb.sffb005
#            AND sfcb001   = l_sffb.sffb006
#            AND sfcb003   = l_sffb.sffb007
#            AND sfcb004   = l_sffb.sffb008
        #IF l_sfcb.sfcb017 = 'Y' THEN     #170322-00016#1 mark
        #   LET l_sfcb033 = 0             #170322-00016#1 mark
        #ELSE                             #170322-00016#1 mark
            LET l_sfcb033 = p_cmd * l_sffb.sffb017
        #END IF                           #170322-00016#1 mark
        #170322-00016#1  add   --begin--
         UPDATE sfcb_t SET sfcb033 = sfcb033 + l_sfcb033  #因为只有sffb001=3的情况，所以不用换算了
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001   = l_sffb.sffb006
            AND sfcb003   = l_sffb.sffb007
            AND sfcb004   = l_sffb.sffb008
     END IF
     IF l_sffb.sffb001 = '3' THEN
     #170322-00016#1  add   --end--
        #UPDATE sfcb_t SET sfcb033 = sfcb033 + l_sfcb033,  #因为只有sffb001=3的情况，所以不用换算了  #170322-00016#1 mark
        #                  sfcb035 = sfcb035 + p_cmd * l_sffb.sffb020,                            #170322-00016#1 mark
         UPDATE sfcb_t SET sfcb035 = sfcb035 + p_cmd * l_sffb.sffb020,                            #170322-00016#1 add
                           sfcb036 = sfcb036 + p_cmd * l_sffb.sffb018,
                           sfcb037 = sfcb037 + p_cmd * l_sffb.sffb019                        
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001   = l_sffb.sffb006
            AND sfcb003   = l_sffb.sffb007
            AND sfcb004   = l_sffb.sffb008
         #mod-161103-00007#1 By dorislai---(E)
         
	     
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'upd_sfcb033'
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success        
         END IF
#更新回收转入数量
         #170210-00014#1-s-mod
#         UPDATE sfcb_t SET sfcb030 = sfcb030 + p_cmd * l_sffb.sffb017   #因为只有sffb001=3的情况，所以不用换算了
         UPDATE sfcb_t SET sfcb030 = sfcb030 + p_cmd * l_sffb.sffb020   #因为只有sffb001=3的情况，所以不用换算了
         #170210-00014#1-e-mod
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001   = l_sffb.sffb006
            AND sfcb055   = 'Y' 
	     
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'upd_sfcb030'
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success        
         END IF
         #170527-00031#1 add --(S)--
         #判斷此報工點的下一站是否為回收站
         DELETE FROM s_asft335_tmp01
         CALL s_asft335_get_next_station(l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008) RETURNING l_success
         #找到下一站製程資料
         DECLARE s_asft335_sel_next_tmp1 SCROLL CURSOR FOR SELECT sfcb003,sfcb004   
                                                          FROM s_asft335_tmp01 ORDER BY sfcb003,sfcb004
         OPEN s_asft335_sel_next_tmp1                                                
         FETCH FIRST s_asft335_sel_next_tmp1 INTO l_sfcb003,l_sfcb004
         CLOSE s_asft335_sel_next_tmp1 
         LET l_sfcb055 = ''
         SELECT sfcb055 INTO l_sfcb055
           FROM sfcb_t
          WHERE sfcbent   = g_enterprise
            AND sfcbsite  = g_site
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001   = l_sffb.sffb006
            AND sfcb003   = l_sfcb003
            AND sfcb004   = l_sfcb004
         #若下一站製程不是回收站,則更新在製量   
         IF l_sfcb055 <> 'Y' OR cl_null(l_sfcb055) THEN
            UPDATE sfcb_t SET sfcb050 = sfcb050 + p_cmd * l_sffb.sffb020   
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = l_sffb.sffb005
               AND sfcb001   = l_sffb.sffb006
               AND sfcb055   = 'Y' 
	     
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd_sfcb050'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success        
            END IF
         END IF         
         #170527-00031#1 add --(E)--
      END IF
      
#取消审核时这个需要放在更新sfcb之后，是因为需要用到更新之后的sfcb046～sfcb050
      IF p_cmd ='-1' THEN
         #161109-00085#55-s
         #IF NOT s_asft335_upd_rework_routing(-1,l_sfcb.*) THEN
         #170213-00027#1-s-mod
#         IF NOT s_asft335_upd_rework_routing(-1,l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
         #170322-00016#1 add  --begin--
         #最后1个报工点时才需要做
         IF ((l_sffb.sffb001 = '1' AND l_sfcb.sfcb015 = 'N' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '2' AND l_sfcb.sfcb016 = 'N' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '3' AND l_sfcb.sfcb017 = 'N' AND l_sfcb.sfcb018 = 'N' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '4' AND l_sfcb.sfcb019 = 'N') OR
             (l_sffb.sffb001 = '5')) THEN
         #170322-00016#1 add  --end--
             #170618-00349#1 add --(S)--
             #判斷此報工點是否為最後一站
             DELETE FROM s_asft335_tmp01
             CALL s_asft335_get_next_station(l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008) RETURNING l_success
             #170618-00349#1 add --(E)--
            LET g_sffbdocno = l_sffb.sffbdocno    #170524-00070#1 add
            LET g_sffbseq1  = l_sffb.sffbseq      #170524-00070#1 add
            IF NOT s_asft335_upd_rework_routing(-1,l_sffb.sffb017,l_sfcb.sfcbent,l_sfcb.sfcbsite,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb002,
            #170213-00027#1-e-mod
                                                   l_sfcb.sfcb003,l_sfcb.sfcb004,l_sfcb.sfcb005,l_sfcb.sfcb006,l_sfcb.sfcb007,
                                                   l_sfcb.sfcb008,l_sfcb.sfcb009,l_sfcb.sfcb010,l_sfcb.sfcb011,l_sfcb.sfcb012,
                                                   l_sfcb.sfcb013,l_sfcb.sfcb014,l_sfcb.sfcb015,l_sfcb.sfcb016,l_sfcb.sfcb017,
                                                   l_sfcb.sfcb018,l_sfcb.sfcb019,l_sfcb.sfcb020,l_sfcb.sfcb021,l_sfcb.sfcb022,
                                                   l_sfcb.sfcb023,l_sfcb.sfcb024,l_sfcb.sfcb025,l_sfcb.sfcb026,l_sfcb.sfcb027,
                                                   l_sfcb.sfcb028,l_sfcb.sfcb029,l_sfcb.sfcb030,l_sfcb.sfcb031,l_sfcb.sfcb032,
                                                   l_sfcb.sfcb033,l_sfcb.sfcb034,l_sfcb.sfcb035,l_sfcb.sfcb036,l_sfcb.sfcb037,
                                                   l_sfcb.sfcb038,l_sfcb.sfcb039,l_sfcb.sfcb040,l_sfcb.sfcb041,l_sfcb.sfcb042,
                                                   l_sfcb.sfcb043,l_sfcb.sfcb044,l_sfcb.sfcb045,l_sfcb.sfcb046,l_sfcb.sfcb047,
                                                   l_sfcb.sfcb048,l_sfcb.sfcb049,l_sfcb.sfcb050,l_sfcb.sfcb051,l_sfcb.sfcb052,
                                                   l_sfcb.sfcb053,l_sfcb.sfcb054,l_sfcb.sfcb055 ) THEN
            #161109-00085#55-e
               LET r_success = FALSE
               RETURN r_success        
            END IF 
         END IF     #170322-00016#1 add
      END IF
#170420-00018#1 mark(s)      
#更新下站的良品转入，参考更新下站的待XX数量逻辑，有多上站时要考虑成套，区别是途径没有勾选5个步骤的下一站时，良品转入也要写进去
#更新工单单头当站下线量和已报废量(先累加计算，不考虑平行工艺下的情况)

      IF l_sffb.sffb001 MATCHES '[12]' THEN
         UPDATE sfaa_t SET sfaa055 = sfaa055 + p_cmd*l_sffb.sffb019*l_sfcb.sfcb054/l_sfcb.sfcb053,
                           sfaa056 = sfaa056 + p_cmd*l_sffb.sffb018*l_sfcb.sfcb054/l_sfcb.sfcb053
          WHERE sfaaent   = g_enterprise
            AND sfaasite  = g_site
            AND sfaadocno = l_sffb.sffb005
      END IF
      IF l_sffb.sffb001 MATCHES '[345]' THEN
         #UPDATE sfaa_t SET sfaa055 = sfaa055 + p_cmd*l_sffb.sffb019*l_sfcb.sfcb021/l_sfcb.sfcb022,   #180910-00080#1 mark
         #                  sfaa056 = sfaa056 + p_cmd*l_sffb.sffb018*l_sfcb.sfcb021/l_sfcb.sfcb022    #180910-00080#1 mark
         UPDATE sfaa_t SET sfaa055 = sfaa055 + p_cmd*l_sffb.sffb019/(l_sfcb.sfcb021/l_sfcb.sfcb022),  #180910-00080#1 add
                           sfaa056 = sfaa056 + p_cmd*l_sffb.sffb018/(l_sfcb.sfcb021/l_sfcb.sfcb022)   #180910-00080#1 add
          WHERE sfaaent   = g_enterprise
            AND sfaasite  = g_site
            AND sfaadocno = l_sffb.sffb005
      END IF        
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd_sfaa'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success        
      END IF
   
      IF SQLCA.sqlerrd[3] = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00097'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success        
      END IF 
#170420-00018#1 mark(e)    
#170420-00018#1 add(s)
#      IF NOT s_asft335_upd_scrap(p_cmd,l_sffb.sffb001,l_sffb.sffb005,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb003,l_sfcb.sfcb004) THEN
#         LET r_success = FALSE
#         RETURN r_success    
#      END IF
#170420-00018#1 add(e)      
      #190920-00019#1----add----str---
      #說明:
      #190709-00006#1 其s_asft335_calculate_scrap_qty()主要是計算有使用製程的
      #故需增加判斷"製程sfaa061='Y'",才走#190709-00006#1
      LET l_sfaa061 = NULL
      SELECT sfaa061 INTO l_sfaa061
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_sffb.sffb005
      #190920-00019#1----add----end---
     #191107-00026#1(1)----mark---str---
     ##191030-00006#1---add----str---
     ##有替代群組(sfcb005='2')再走
     #LET l_cnt = 0
     #SELECT COUNT(1) INTO l_cnt
     #  FROM sfcb_t
     # WHERE sfcbent  = g_enterprise
     #   AND sfcbsite = g_site
     #   AND sfcbdocno= l_sffb.sffb005
     #   AND sfcb005 = '2' #2:替代群組
     ##191030-00006#1---add----end---
     #191107-00026#1(1)----mark---end---
     #191107-00026#1(1)----add----str---
     #有平行製程的再走
     #如何判斷工單有走平行製程
     #=>上站作業有都是相同l_cnt>=2的且sfcb005 = '1' #一般
      LET l_cnt = 0
      LET l_sql =
                  "SELECT MAX(B) FROM (",
                  "  SELECT sfcb007 A,COUNT(1) B FROM sfcb_t ",
                  "   WHERE sfcbent = '",g_enterprise,"'",
                  "     AND sfcbsite = '",g_site,"'",
                  "     AND sfcbdocno = '",l_sffb.sffb005,"'",
                  "     AND sfcb005 = '1' ", #1:一般
                  "     AND sfcb001 = ",l_sfcb.sfcb001, #191125-00048#1(1) add RUNCARD 條件
                  "  GROUP BY sfcb007 ) tsed"
     PREPARE s_asft335_sfcb007_p1 FROM l_sql
     EXECUTE s_asft335_sfcb007_p1 INTO l_cnt
     FREE s_asft335_sfcb007_p1
     #191107-00026#1(1)----add----end---
     #IF l_sfaa061 = 'Y' THEN #190920-00019#1 add if 判斷
     #IF l_sfaa061 = 'Y' AND l_cnt >=1 THEN  #191030-00006#1 add #191107-00026#1(1) mark
      IF l_sfaa061 = 'Y' AND l_cnt >=2 THEN                      #191107-00026#1(1) add      
          #190709-00006#1 add --(S)--
          #更新工單單頭的報廢量與下線量
          IF l_sffb.sffb019 <> 0 OR l_sffb.sffb018 <> 0 THEN
             #要計算整張工單的報廢下線量,所以作業編號要傳入最終站[END],因為是從傳入的作業編號往前至[INIT]累加計算
             CALL s_asft335_calculate_scrap_qty('2',l_sffb.sffb005,l_sffb.sffb006,'END',0)   
                RETURNING l_success,l_sfaa056,l_sfaa055
             UPDATE sfaa_t SET sfaa055 = l_sfaa055,    #下線量
                               sfaa056 = l_sfaa056     #報廢量
              WHERE sfaaent   = g_enterprise
                AND sfaasite  = g_site
                AND sfaadocno = l_sffb.sffb005
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = 'upd_sfaa'
                LET g_errparam.popup = TRUE
                CALL cl_err()
          
                LET r_success = FALSE
                RETURN r_success
             END IF   
          
          
             IF SQLCA.sqlerrd[3] = 0 THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = 'asf-00097'
                LET g_errparam.extend = ''
                LET g_errparam.popup = TRUE
                CALL cl_err()
          
                LET r_success = FALSE
                RETURN r_success
             END IF            
          END IF          
          #190709-00006#1 add --(E)--
      END IF #190920-00019#1 add    
#更新下一动作的数量
#step1：找到当前站（命名为A）的下一个报工站（命名为B），遇到END停止
#step2：找到B站的所有上一报工站，含A站
#step3：处于相同的替代群组的站，相加合并
#step4：无顺序群组里的，取最小的出线
#step5：step3，step4的结果，与step2中剩余无群组的站，取最小数量传给B站
#
#每一站的数量为工单+Runcard+作业+制程序去找已审核报工单数量的SUM

#      LET g_sffadocno = p_docno  #160801-00021#1-add 160804-00029#1-mark
      #170215-00051#1-s
      #IF l_sfcb.sfcb017 = 'N' THEN  #add-161103-00007#1 By dorislai
     #IF (l_sfcb.sfcb017 = 'Y' AND (l_sffb.sffb001 = '1' AND (l_sfcb.sfcb015='Y' OR l_sfcb.sfcb016='Y')) OR (l_sffb.sffb001 = '2' AND l_sfcb.sfcb016='Y') OR l_sffb.sffb001 = '4' OR l_sffb.sffb001 = '5') OR  #170322-00016#1 mark
     #   l_sfcb.sfcb017 = 'N' THEN  #170322-00016#1 mark
      #170215-00051#1-e
      IF NOT(l_sffb.sffb001 = '3' AND l_sfcb.sfcb017 = 'Y') THEN   #170322-00016#1 add
         IF NOT s_asft335_upd_next_station(p_cmd,l_sffb.sffb001,l_sfcb.sfcbdocno,l_sfcb.sfcb001,l_sfcb.sfcb003,l_sfcb.sfcb004) THEN
            LET r_success = FALSE
            RETURN r_success 
         END IF  
      END IF  #add-161103-00007#1 By dorislai      
   END FOREACH

   FREE s_asft335_sel_sffb
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新sffc的项次sffcseq
# Memo...........:
# Usage..........: CALL s_asft335_upd_sffc(p_sffbdocno,p_sffbseq,p_sffbseq_t)
#                  RETURNING r_success
# Input parameter: p_sffbseq      报工单项次
#                : p_sffbseq_t    报工单项次旧值
#                : p_sffb019      当站下线数量
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/04/29 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_sffc(p_sffbdocno,p_sffbseq,p_sffbseq_t)
   DEFINE r_success       LIKE type_t.num5
   DEFINE p_sffbdocno     LIKE sffb_t.sffbdocno
   DEFINE p_sffbseq       LIKE sffb_t.sffbseq
   DEFINE p_sffbseq_t     LIKE sffb_t.sffbseq
      #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e
      
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#必须有报工单资料   
   IF p_sffbdocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF p_sffbseq IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF p_sffbseq_t IS NULL THEN LET p_sffbseq_t = p_sffbseq END IF
   
   INITIALIZE l_sffb.* TO NULL
   
    #161109-00085#55-s
   #SELECT * INTO l_sffb.*
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
   #161109-00085#55-e
     FROM sffb_t
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_sffbdocno
      AND sffbseq   = p_sffbseq_t
      
#只有check in和check out可以产生
   IF l_sffb.sffb001 NOT MATCHES '[24]' THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
   
   UPDATE sffc_t SET sffcseq = p_sffbseq
    WHERE sffcent   = g_enterprise
      AND sffcsite  = g_site
      AND sffcdocno = p_sffbdocno
      AND sffcseq   = p_sffbseq_t
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd sffc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF

   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 删除工单工艺上站资料
# Memo...........:
# Usage..........: CALL s_asft335_del_sffc_all(p_sffadocno)
#                  RETURNING r_success
# Input parameter: p_sffadocno    报工单
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2014/04/29 By wujie
# Modify.........: #180111-00043#57 by 09773 mod
################################################################################
PUBLIC FUNCTION s_asft335_del_sffc_all(p_sffadocno)
   DEFINE r_success       LIKE type_t.num5
   #161109-00085#55-s
   #DEFINE l_sffa          RECORD LIKE sffa_t.*
   DEFINE l_sffa RECORD  #製程報工單頭檔
       sffaent LIKE sffa_t.sffaent, #企業編號
       sffasite LIKE sffa_t.sffasite, #營運據點
       sffadocno LIKE sffa_t.sffadocno, #報工單號
       sffadocdt LIKE sffa_t.sffadocdt, #報工日期
       sffa001 LIKE sffa_t.sffa001, #作業類別
       sffa002 LIKE sffa_t.sffa002, #報工人員
       sffa003 LIKE sffa_t.sffa003, #部門
       sffa004 LIKE sffa_t.sffa004, #報工班別
       sffa005 LIKE sffa_t.sffa005, #作業編號
       sffa006 LIKE sffa_t.sffa006, #報工組別
       sffaownid LIKE sffa_t.sffaownid, #資料所有者
       sffaowndp LIKE sffa_t.sffaowndp, #資料所屬部門
       sffacrtid LIKE sffa_t.sffacrtid, #資料建立者
       sffacrtdp LIKE sffa_t.sffacrtdp, #資料建立部門
       sffacrtdt LIKE sffa_t.sffacrtdt, #資料創建日
       sffamodid LIKE sffa_t.sffamodid, #資料修改者
       sffamoddt LIKE sffa_t.sffamoddt, #最近修改日
       sffacnfid LIKE sffa_t.sffacnfid, #資料確認者
       sffacnfdt LIKE sffa_t.sffacnfdt, #資料確認日
       sffastus LIKE sffa_t.sffastus    #狀態碼
   END RECORD
   #161109-00085#55-e
   DEFINE p_sffadocno     LIKE sffa_t.sffadocno
      
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#必须有报工单资料   
   IF p_sffadocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_sffa.* TO NULL
   
   #161109-00085#55-s
   #SELECT * INTO l_sffa.* 
   SELECT sffaent,sffasite,sffadocno,sffadocdt,sffa001,
          sffa002,sffa003,sffa004,sffa005,sffa006,
          sffaownid,sffaowndp,sffacrtid,sffacrtdp,sffacrtdt,
          sffamodid,sffamoddt,sffacnfid,sffacnfdt,sffastus
     INTO l_sffa.sffaent,l_sffa.sffasite,l_sffa.sffadocno,l_sffa.sffadocdt,l_sffa.sffa001,
          l_sffa.sffa002,l_sffa.sffa003,l_sffa.sffa004,l_sffa.sffa005,l_sffa.sffa006,
          l_sffa.sffaownid,l_sffa.sffaowndp,l_sffa.sffacrtid,l_sffa.sffacrtdp,l_sffa.sffacrtdt,
          l_sffa.sffamodid,l_sffa.sffamoddt,l_sffa.sffacnfid,l_sffa.sffacnfdt,l_sffa.sffastus
   #161109-00085#55-e
     FROM sffa_t
    WHERE sffaent   = g_enterprise
      AND sffasite  = g_site
      AND sffadocno = p_sffadocno
      
#只有check in和check out可以产生
   IF l_sffa.sffa001 NOT MATCHES '[24]' THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
   
   DELETE FROM sffc_t
    WHERE sffcent   = g_enterprise
      AND sffcsite  = g_site
      AND sffcdocno = p_sffadocno
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sffc_t_all"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF

   RETURN r_success 
END FUNCTION
################################################################################
# Descriptions...: 根据工单，Run Card，作业，制程序从工单制程单身抓取待处理数量
# Memo...........:
# Usage..........: CALL s_asft335_set_qty(p_sffbdocno,p_sffbseq,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
#                  RETURNING r_qty,r_sffb016
# Input parameter: p_sffbdocno    报工单号
#                : p_sffbseq      报工单项次
#                : p_sffb001      报工状态
#                : p_sffb005      工单 
#                : p_sffb006      Run Card
#                : p_sffb007      作业
#                : p_sffb008      制程序
# Return code....: r_qty          待处理数量
#                : r_sffb016      数量对应的单位
# Date & Author..: 2013/11/28 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_set_qty(p_sffbdocno,p_sffbseq,p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008)
   DEFINE p_sffbdocno   LIKE sffb_t.sffbdocno  #非报工单调用时可以传NULL进来
   DEFINE p_sffbseq     LIKE sffb_t.sffbseq
   DEFINE p_sffb001     LIKE sffb_t.sffb001
   DEFINE p_sffb005     LIKE sffb_t.sffb005
   DEFINE p_sffb006     LIKE sffb_t.sffb006
   DEFINE p_sffb007     LIKE sffb_t.sffb007
   DEFINE p_sffb008     LIKE sffb_t.sffb008
   DEFINE r_qty         LIKE sfcb_t.sfcb050
   DEFINE r_sffb016     LIKE sffb_t.sffb016
   DEFINE l_qty1        LIKE sfcb_t.sfcb050
   DEFINE l_qty2        LIKE sfcb_t.sfcb050
   DEFINE l_qty3        LIKE sfcb_t.sfcb050
   DEFINE l_qty4        LIKE sfcb_t.sfcb050
   DEFINE l_sfcb017     LIKE sfcb_t.sfcb017    #是否PQC  #151110-00002#2 add
   #DEFINE l_sfaa057     LIKE sfaa_t.sfaa057    #160613-00020#1 #180726-00026#1 mark
   DEFINE l_pmdo006     LIKE pmdo_t.pmdo006    #160613-00020#1
   DEFINE l_success     LIKE type_t.num5       #160727-00022#1
   DEFINE l_sfaa061     LIKE sfaa_t.sfaa061    #180726-00026#1 add
   
   WHENEVER ERROR CONTINUE
   LET r_qty = 0
   LET r_sffb016 = NULL
   LET l_sfcb017 = NULL       #151110-00002#2 add
   LET l_qty1 = 0
   LET l_qty2 = 0
   LET l_qty3 = 0
   LET l_qty4 = 0
   
   IF p_sffb001 IS NULL OR p_sffb005 IS NULL OR p_sffb006 IS NULL OR p_sffb007 IS NULL OR p_sffb008 IS NULL THEN
      RETURN r_qty,r_sffb016
   END IF
#从工单制程单身里抓取待处理数量
    CASE p_sffb001
    WHEN '1' #Move In
      SELECT sfcb046,sfcb052 INTO r_qty,r_sffb016
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = p_sffb007
         AND sfcb004  = p_sffb008
      IF r_qty IS NULL THEN LET r_qty = 0 END IF
    WHEN '2' #Check In
      SELECT sfcb047,sfcb052 INTO r_qty,r_sffb016
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = p_sffb007
         AND sfcb004  = p_sffb008
      IF r_qty IS NULL THEN LET r_qty = 0 END IF
    WHEN '3' #报工
      SELECT sfcb050,sfcb020,sfcb017 INTO r_qty,r_sffb016,l_sfcb017   #151110-00002#2 add #增加取得sfcb017 是否PQC   
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = p_sffb007
         AND sfcb004  = p_sffb008
         
      #mark--161103-00007#1 By shiun--(S)
#      #151110-00002#2 add start ----------------------
#      #若有PQC,則待處理數量應取PQC檢驗合格量
#      IF l_sfcb017 = 'Y' THEN
#      
#         #160128-00010#1-s
#         IF g_prog = 'asft338' THEN
#            SELECT SUM(qcba027) INTO r_qty   #不良數
#              From qcba_t
#             WHERE qcbaent  = g_enterprise
#               AND qcbasite = g_site
#               AND qcba000  = '3'            #PQC
#               AND qcba001  = p_sffb005      #來源單據
#               AND qcba029  = p_sffb006      #RunCard
#               AND qcba006  = p_sffb007      #作業編號
#               AND qcba007  = p_sffb008      #製程序
#               AND qcba022 = '3'             #判定結果(3.重工)
#               AND qcbastus = 'Y'
#         ELSE
#         #160128-00010#1-e
#         
#            #PQC檢驗合格量
#            Select SUM(qcba023) INTO r_qty            #合格量
#              From qcba_t
#             WHERE qcbaent  = g_enterprise
#               AND qcbasite = g_site
#               AND qcba000  = '3'                     #PQC
#               AND qcba001  = p_sffb005               #來源單據
#               AND qcba029  = p_sffb006               #RunCard
#               AND qcba006  = p_sffb007               #作業編號
#               AND qcba007  = p_sffb008               #製程序
#               AND (qcba022 = '1' or qcba022 = '4')   #判定結果(1.合格 4.特採)
#               AND qcbastus = 'Y'                     #狀態碼
#
#         END IF  #160128-00010#1
#
#         #报工类型要多扣除当站下线，作废和回收，但是不能扣除本站的，本站的会显示在画面对应栏位上   
#         SELECT SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_qty1 
#           FROM sffb_t
#          WHERE sffbent  = g_enterprise
#            AND sffbsite = g_site
#            AND sffb001  = p_sffb001
#            AND sffb005  = p_sffb005
#            AND sffb006  = p_sffb006
#            AND sffb007  = p_sffb007
#            AND sffb008  = p_sffb008
#            AND sffbstus <> 'X'           
#
#         SELECT SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_qty3    #本站的
#           FROM sffb_t
#          WHERE sffbent  = g_enterprise
#            AND sffbsite = g_site
#            AND sffb001  = p_sffb001
#            AND sffb005  = p_sffb005
#            AND sffb006  = p_sffb006
#            AND sffb007  = p_sffb007
#            AND sffb008  = p_sffb008
#            AND sffbdocno = p_sffbdocno 
#            AND sffbseq  = p_sffbseq
#            AND sffbstus <> 'X'            
#      ELSE
#      #151110-00002#2 add end   ----------------------
      #mark--161103-00007#1 By shiun--(E)
      
         #报工类型要多扣除当站下线，作废和回收，但是不能扣除本站的，本站的会显示在画面对应栏位上
         SELECT SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_qty1 
           FROM sffb_t
          WHERE sffbent  = g_enterprise
            AND sffbsite = g_site
            AND sffb001  = p_sffb001
            AND sffb005  = p_sffb005
            AND sffb006  = p_sffb006
            AND sffb007  = p_sffb007
            AND sffb008  = p_sffb008
            AND sffbstus = 'N'           

         SELECT SUM(sffb018) + SUM(sffb019) + SUM(sffb020) INTO l_qty3    #本站的
           FROM sffb_t
          WHERE sffbent  = g_enterprise
            AND sffbsite = g_site
            AND sffb001  = p_sffb001
            AND sffb005  = p_sffb005
            AND sffb006  = p_sffb006
            AND sffb007  = p_sffb007
            AND sffb008  = p_sffb008
            AND sffbdocno = p_sffbdocno 
            AND sffbseq  = p_sffbseq
            AND sffbstus = 'N'    
#      END IF   #151110-00002#2 add   #mark--161103-00007#1 By shiun
      IF l_qty1 IS NULL THEN LET l_qty1 = 0 END IF
      IF l_qty3 IS NULL THEN LET l_qty3 = 0 END IF
      IF r_qty IS NULL THEN LET r_qty = 0 END IF
    WHEN '4' #Check Out
      SELECT sfcb048,sfcb020 INTO r_qty,r_sffb016
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = p_sffb007
         AND sfcb004  = p_sffb008
      IF r_qty IS NULL THEN LET r_qty = 0 END IF
    WHEN '5' #Move Out
      SELECT sfcb049,sfcb020 INTO r_qty,r_sffb016
        FROM sfcb_t
       WHERE sfcbent  = g_enterprise
         AND sfcbsite = g_site
         AND sfcbdocno= p_sffb005
         AND sfcb001  = p_sffb006
         AND sfcb003  = p_sffb007
         AND sfcb004  = p_sffb008
      IF r_qty IS NULL THEN LET r_qty = 0 END IF 
    END CASE
#扣除其他未审核报工单的良品转出量，不含本站良品转出，本站的显示在画面sffb017上
    #mod-161103-00007#1--(S) By dorislai 抓取未確認的就好
    ##151110-00002#2 add start ----------------------
    #IF p_sffb001 = '3' AND l_sfcb017 = 'Y' THEN
    #   SELECT SUM(sffb017) INTO l_qty2
    #     FROM sffb_t
    #    WHERE sffbent  = g_enterprise
    #      AND sffbsite = g_site
    #      AND sffb001  = p_sffb001
    #      AND sffb005  = p_sffb005
    #      AND sffb006  = p_sffb006
    #      AND sffb007  = p_sffb007
    #      AND sffb008  = p_sffb008
    #      AND sffbstus <> 'X'  
    #   
    #   SELECT SUM(sffb017) INTO l_qty4
    #     FROM sffb_t
    #    WHERE sffbent  = g_enterprise
    #      AND sffbsite = g_site
    #      AND sffb001  = p_sffb001
    #      AND sffb005  = p_sffb005
    #      AND sffb006  = p_sffb006
    #      AND sffb007  = p_sffb007
    #      AND sffb008  = p_sffb008
    #      AND sffbdocno = p_sffbdocno 
    #      AND sffbseq = p_sffbseq
    #      AND sffbstus <> 'X'  
    #      
    #ELSE
    ##151110-00002#2 add end   ----------------------
    #   SELECT SUM(sffb017) INTO l_qty2
    #     FROM sffb_t
    #    WHERE sffbent  = g_enterprise
    #      AND sffbsite = g_site
    #      AND sffb001  = p_sffb001
    #      AND sffb005  = p_sffb005
    #      AND sffb006  = p_sffb006
    #      AND sffb007  = p_sffb007
    #      AND sffb008  = p_sffb008
    #      AND sffbstus = 'N'             
    #   
    #   SELECT SUM(sffb017) INTO l_qty4
    #     FROM sffb_t
    #    WHERE sffbent  = g_enterprise
    #      AND sffbsite = g_site
    #      AND sffb001  = p_sffb001
    #      AND sffb005  = p_sffb005
    #      AND sffb006  = p_sffb006
    #      AND sffb007  = p_sffb007
    #      AND sffb008  = p_sffb008
    #      AND sffbdocno = p_sffbdocno 
    #      AND sffbseq = p_sffbseq
    #      AND sffbstus = 'N'                
    #END IF   #151110-00002#2 add
    SELECT SUM(sffb017) INTO l_qty2
      FROM sffb_t
     WHERE sffbent  = g_enterprise
       AND sffbsite = g_site
       AND sffb001  = p_sffb001
       AND sffb005  = p_sffb005
       AND sffb006  = p_sffb006
       AND sffb007  = p_sffb007
       AND sffb008  = p_sffb008
       AND sffbstus = 'N'  
    
    SELECT SUM(sffb017) INTO l_qty4
      FROM sffb_t
     WHERE sffbent  = g_enterprise
       AND sffbsite = g_site
       AND sffb001  = p_sffb001
       AND sffb005  = p_sffb005
       AND sffb006  = p_sffb006
       AND sffb007  = p_sffb007
       AND sffb008  = p_sffb008
       AND sffbdocno = p_sffbdocno 
       AND sffbseq = p_sffbseq
       AND sffbstus = 'N'  
    #mod-161103-00007#1--(E) By dorislai
    IF l_qty2 IS NULL THEN LET l_qty2 = 0 END IF 
    IF l_qty4 IS NULL THEN LET l_qty4 = 0 END IF    
    LET r_qty = r_qty - l_qty1 + l_qty3 - l_qty2 + l_qty4
    
    #160613-00020#1-s
    #委外製程站報工時，良品數量=原邏輯-已轉委外採購數量+委外入庫數量
    #180726-00026#1 mark start -----
    #LET l_sfaa057 = ''
    #SELECT sfaa057 INTO l_sfaa057
    #180726-00026#1 mark end    -----
    #180726-00026#1 add start ----
    LET l_sfaa061 = ''
    SELECT sfaa061 INTO l_sfaa061
    #180726-00026#1 add end   ----
      FROM sfaa_t
     WHERE sfaaent = g_enterprise
       AND sfaadocno = p_sffb005
    #IF l_sfaa057 = 'Y' THEN #180726-00026#1 mark
    IF l_sfaa061 = 'Y' THEN #180726-00026#1 add
       LET l_pmdo006 = 0
       #190422-00047#1 mark start -----                
       #SELECT (pmdo006-pmdo019) INTO l_pmdo006
       #  FROM pmdl_t,pmdo_t
       #190422-00047#1 mark end   -----         
       #190422-00047#1 add start -----         
       SELECT SUM(pmdo006-pmdo019) INTO l_pmdo006
         FROM pmdl_t,pmdo_t,pmdn_t
       #190422-00047#1 add end   -----                  
        WHERE pmdoent = g_enterprise
          AND pmdoent = pmdlent
          AND pmdodocno = pmdldocno
          AND pmdl008 = p_sffb005
          AND pmdlstus <> 'X'
          #190422-00047#1 add start -----
          AND pmdnent = pmdlent
          AND pmdndocno = pmdldocno
          AND pmdnseq = pmdoseq
          AND pmdn004 = p_sffb007
          AND pmdn005 = p_sffb008
          #190422-00047#1 add end   -----          
       IF cl_null(l_pmdo006) THEN LET l_pmdo006 = 0 END IF
       LET r_qty = r_qty - l_pmdo006
    END IF
    #160613-00020#1-e
    IF NOT cl_null(r_sffb016) AND NOT cl_null(r_qty) THEN
       CALL s_aooi250_take_decimals(r_sffb016,r_qty) RETURNING l_success,r_qty #160727-00022#1
    END IF
    RETURN r_qty,r_sffb016
END FUNCTION
################################################################################
# Descriptions...: 新增当站下线单头资料
# Memo...........:
# Usage..........: CALL s_asft335_ins_sfha(p_docno,p_seq,p_amt)
#                  RETURNING r_success
# Input parameter: p_docno        报工单号
#                : p_seq          报工单项次
#                : p_amt          当站下线数量
# Return code....: TRUE OR FALSE
# Date & Author..: 2014/05/25 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_ins_sfha(p_docno,p_seq,p_amt)
DEFINE p_docno      LIKE sffb_t.sffbdocno
DEFINE p_seq        LIKE sffb_t.sffbseq
DEFINE p_amt        LIKE sffb_t.sffb019
DEFINE r_success    LIKE type_t.num5
#161109-00085#55-s
#DEFINE l_sfha       RECORD LIKE sfha_t.*
DEFINE l_sfha RECORD  #當站下線單頭檔
       sfhaent LIKE sfha_t.sfhaent, #企業編號
       sfhasite LIKE sfha_t.sfhasite, #營運據點
       sfhadocno LIKE sfha_t.sfhadocno, #單據編號
       sfhadocdt LIKE sfha_t.sfhadocdt, #單據日期
       sfha001 LIKE sfha_t.sfha001, #過帳日期
       sfha002 LIKE sfha_t.sfha002, #申請人員
       sfha003 LIKE sfha_t.sfha003, #部門
       sfha004 LIKE sfha_t.sfha004, #工單單號
       sfha005 LIKE sfha_t.sfha005, #Run Card
       sfha006 LIKE sfha_t.sfha006, #作業編號
       sfha007 LIKE sfha_t.sfha007, #製程式
       sfha008 LIKE sfha_t.sfha008, #當站下線數量
       sfha009 LIKE sfha_t.sfha009, #備註
       sfha010 LIKE sfha_t.sfha010, #來源單號
       sfha011 LIKE sfha_t.sfha011, #來源單號項次
       sfha012 LIKE sfha_t.sfha012, #生產計畫
       sfha013 LIKE sfha_t.sfha013, #生產料號
       sfha014 LIKE sfha_t.sfha014, #BOM特性
       sfha015 LIKE sfha_t.sfha015, #產品特徵
       sfhaownid LIKE sfha_t.sfhaownid, #資料所有者
       sfhaowndp LIKE sfha_t.sfhaowndp, #資料所屬部門
       sfhacrtid LIKE sfha_t.sfhacrtid, #資料建立者
       sfhacrtdp LIKE sfha_t.sfhacrtdp, #資料建立部門
       sfhacrtdt LIKE sfha_t.sfhacrtdt, #資料創建日
       sfhamodid LIKE sfha_t.sfhamodid, #資料修改者
       sfhamoddt LIKE sfha_t.sfhamoddt, #最近修改日
       sfhacnfid LIKE sfha_t.sfhacnfid, #資料確認者
       sfhacnfdt LIKE sfha_t.sfhacnfdt, #資料確認日
       sfhapstid LIKE sfha_t.sfhapstid, #資料過帳者
       sfhapstdt LIKE sfha_t.sfhapstdt, #資料過帳日
       sfhastus LIKE sfha_t.sfhastus, #狀態碼
       sfha016 LIKE sfha_t.sfha016, #原因碼
       sfhaud001 LIKE sfha_t.sfhaud001, #自定義欄位(文字)001
       sfhaud002 LIKE sfha_t.sfhaud002, #自定義欄位(文字)002
       sfhaud003 LIKE sfha_t.sfhaud003, #自定義欄位(文字)003
       sfhaud004 LIKE sfha_t.sfhaud004, #自定義欄位(文字)004
       sfhaud005 LIKE sfha_t.sfhaud005, #自定義欄位(文字)005
       sfhaud006 LIKE sfha_t.sfhaud006, #自定義欄位(文字)006
       sfhaud007 LIKE sfha_t.sfhaud007, #自定義欄位(文字)007
       sfhaud008 LIKE sfha_t.sfhaud008, #自定義欄位(文字)008
       sfhaud009 LIKE sfha_t.sfhaud009, #自定義欄位(文字)009
       sfhaud010 LIKE sfha_t.sfhaud010, #自定義欄位(文字)010
       sfhaud011 LIKE sfha_t.sfhaud011, #自定義欄位(數字)011
       sfhaud012 LIKE sfha_t.sfhaud012, #自定義欄位(數字)012
       sfhaud013 LIKE sfha_t.sfhaud013, #自定義欄位(數字)013
       sfhaud014 LIKE sfha_t.sfhaud014, #自定義欄位(數字)014
       sfhaud015 LIKE sfha_t.sfhaud015, #自定義欄位(數字)015
       sfhaud016 LIKE sfha_t.sfhaud016, #自定義欄位(數字)016
       sfhaud017 LIKE sfha_t.sfhaud017, #自定義欄位(數字)017
       sfhaud018 LIKE sfha_t.sfhaud018, #自定義欄位(數字)018
       sfhaud019 LIKE sfha_t.sfhaud019, #自定義欄位(數字)019
       sfhaud020 LIKE sfha_t.sfhaud020, #自定義欄位(數字)020
       sfhaud021 LIKE sfha_t.sfhaud021, #自定義欄位(日期時間)021
       sfhaud022 LIKE sfha_t.sfhaud022, #自定義欄位(日期時間)022
       sfhaud023 LIKE sfha_t.sfhaud023, #自定義欄位(日期時間)023
       sfhaud024 LIKE sfha_t.sfhaud024, #自定義欄位(日期時間)024
       sfhaud025 LIKE sfha_t.sfhaud025, #自定義欄位(日期時間)025
       sfhaud026 LIKE sfha_t.sfhaud026, #自定義欄位(日期時間)026
       sfhaud027 LIKE sfha_t.sfhaud027, #自定義欄位(日期時間)027
       sfhaud028 LIKE sfha_t.sfhaud028, #自定義欄位(日期時間)028
       sfhaud029 LIKE sfha_t.sfhaud029, #自定義欄位(日期時間)029
       sfhaud030 LIKE sfha_t.sfhaud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#55-e
   #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE sffb_t.sffbdocno

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET g_sfhadocno = ''    #180831-00001#1 add
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00300'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_sfha.* TO NULL
   INITIALIZE l_sffb.* TO NULL
   #161109-00085#55-s
   #SELECT * INTO l_sffb.* FROM sffb_t
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
     FROM sffb_t     
   #161109-00085#55-e
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_docno
      AND sffbseq   = p_seq
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sel sffb_t",SQLERRMESSAGE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF l_sffb.sffb001 <> '3' OR p_amt IS NULL OR p_amt = 0 THEN
      RETURN r_success
   END IF
   
   LET l_sfha.sfhadocno = NULL
   IF cl_null(g_sfhadocno) THEN  #160511-00020#1
      CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      LET l_sfha.sfhadocno = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0061')
      IF cl_null(l_sfha.sfhadocno) THEN
         #报工单别对应的当站下线单别没有维护，请至aooi200中维护报工单别（1%）的对应当站下线单别（参数D-MFG-0061）
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00680'
         LET g_errparam.extend = "GET D-MFG-0061 ERROR"
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_slip
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   #160511-00020#1-s
   ELSE
      LET l_sfha.sfhadocno = g_sfhadocno
   END IF
   #160511-00020#1-e
   
   LET l_sfha.sfhadocdt = l_sffb.sffbdocdt  #單據日期
   
   CALL s_aooi200_gen_docno(g_site,l_sfha.sfhadocno,l_sfha.sfhadocdt,'asft337') RETURNING l_success,l_sfha.sfhadocno
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET g_sfhadocno = l_sfha.sfhadocno
   
   LET l_sfha.sfhaent   = g_enterprise      #企業代碼
   LET l_sfha.sfhasite  = g_site
   LET l_sfha.sfha001   = l_sffb.sffbdocdt  #過帳日期
   LET l_sfha.sfha002   = l_sffb.sffb002    #申請人員
   LET l_sfha.sfha003   = l_sffb.sffb003    #申請部門
   LET l_sfha.sfha004   = l_sffb.sffb005    #工單單號
   LET l_sfha.sfha005   = l_sffb.sffb006    #Run Card
   LET l_sfha.sfha006   = l_sffb.sffb007    #作業編號
   LET l_sfha.sfha007   = l_sffb.sffb008    #製程序
   LET l_sfha.sfha008   = p_amt             #當站下線數量
   LET l_sfha.sfha010   = p_docno           #来源单号
   LET l_sfha.sfha011   = p_seq             #来源单号项次
   LET l_sfha.sfhaownid = g_user
   LET l_sfha.sfhaowndp = g_dept
   LET l_sfha.sfhacrtid = g_user
   LET l_sfha.sfhacrtdp = g_dept
   LET l_sfha.sfhacrtdt = cl_get_current()
   LET l_sfha.sfhamodid = ""
   LET l_sfha.sfhamoddt = ""
   LET l_sfha.sfhastus  = 'N'
   
   #161109-00085#55-s
   #INSERT INTO sfha_t VALUES(l_sfha.*)
   INSERT INTO sfha_t( sfhaent,sfhasite,sfhadocno,sfhadocdt,sfha001,
                       sfha002,sfha003,sfha004,sfha005,sfha006,
                       sfha007,sfha008,sfha009,sfha010,sfha011,
                       sfha012,sfha013,sfha014,sfha015,sfhaownid,
                       sfhaowndp,sfhacrtid,sfhacrtdp,sfhacrtdt,sfhamodid,
                       sfhamoddt,sfhacnfid,sfhacnfdt,sfhapstid,sfhapstdt,
                       sfhastus,sfha016,sfhaud001,sfhaud002,sfhaud003,
                       sfhaud004,sfhaud005,sfhaud006,sfhaud007,sfhaud008,
                       sfhaud009,sfhaud010,sfhaud011,sfhaud012,sfhaud013,
                       sfhaud014,sfhaud015,sfhaud016,sfhaud017,sfhaud018,
                       sfhaud019,sfhaud020,sfhaud021,sfhaud022,sfhaud023,
                       sfhaud024,sfhaud025,sfhaud026,sfhaud027,sfhaud028,
                       sfhaud029,sfhaud030)
      VALUES(l_sfha.sfhaent,l_sfha.sfhasite,l_sfha.sfhadocno,l_sfha.sfhadocdt,l_sfha.sfha001,
             l_sfha.sfha002,l_sfha.sfha003,l_sfha.sfha004,l_sfha.sfha005,l_sfha.sfha006,
             l_sfha.sfha007,l_sfha.sfha008,l_sfha.sfha009,l_sfha.sfha010,l_sfha.sfha011,
             l_sfha.sfha012,l_sfha.sfha013,l_sfha.sfha014,l_sfha.sfha015,l_sfha.sfhaownid,
             l_sfha.sfhaowndp,l_sfha.sfhacrtid,l_sfha.sfhacrtdp,l_sfha.sfhacrtdt,l_sfha.sfhamodid,
             l_sfha.sfhamoddt,l_sfha.sfhacnfid,l_sfha.sfhacnfdt,l_sfha.sfhapstid,l_sfha.sfhapstdt,
             l_sfha.sfhastus,l_sfha.sfha016,l_sfha.sfhaud001,l_sfha.sfhaud002,l_sfha.sfhaud003,
             l_sfha.sfhaud004,l_sfha.sfhaud005,l_sfha.sfhaud006,l_sfha.sfhaud007,l_sfha.sfhaud008,
             l_sfha.sfhaud009,l_sfha.sfhaud010,l_sfha.sfhaud011,l_sfha.sfhaud012,l_sfha.sfhaud013,
             l_sfha.sfhaud014,l_sfha.sfhaud015,l_sfha.sfhaud016,l_sfha.sfhaud017,l_sfha.sfhaud018,
             l_sfha.sfhaud019,l_sfha.sfhaud020,l_sfha.sfhaud021,l_sfha.sfhaud022,l_sfha.sfhaud023,
             l_sfha.sfhaud024,l_sfha.sfhaud025,l_sfha.sfhaud026,l_sfha.sfhaud027,l_sfha.sfhaud028,
             l_sfha.sfhaud029,l_sfha.sfhaud030)
   #161109-00085#55-e
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins sfha_t",SQLERRMESSAGE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 同步删除sfha
# Memo...........:
# Usage..........: CALL s_asft335_del_sfha(p_docno,p_seq)
#                  RETURNING r_success
# Input parameter: p_docno        报工单号
#                : p_seq          报工单项次
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/05/25 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_del_sfha(p_docno,p_seq)
   DEFINE p_docno         LIKE sffb_t.sffbdocno
   DEFINE p_seq           LIKE sffb_t.sffbseq
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_cnt           LIKE type_t.num5
      #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e

   LET r_success = TRUE

   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00300'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   INITIALIZE l_sffb.* TO NULL

   #161109-00085#55-s
   #SELECT * INTO l_sffb.* FROM sffb_t
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
     FROM sffb_t     
   #161109-00085#55-e
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_docno
      AND sffbseq   = p_seq
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sel_sffb"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
      
   IF l_sffb.sffb001 <> '3' OR l_sffb.sffb019 IS NULL OR l_sffb.sffb019 = 0 THEN
      LET r_success = TRUE 
      RETURN r_success
   END IF

   
   SELECT COUNT(1) INTO l_cnt  #161212-00020#1 星號調整
     FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfha010 = p_docno
      AND sfha011 = p_seq
      #170209-00041#1-s-mod
#      AND sfhastus<> 'N'
      AND sfhastus NOT IN ('N','X')
      #170209-00041#1-e-mod
    
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00245'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF     
   
#171030-00006#1 mark -s   
#   DELETE FROM sfha_t 
#    WHERE sfhaent = g_enterprise
#      AND sfha010 = p_docno
#      AND sfha011 = p_seq  
#      #170209-00041#1-s-add
#      AND sfhastus = 'N'
#      #170209-00041#1-e-add
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "del sfha_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
#   
#   #170209-00041#1-s-add
#   #刪除sfha_t也要刪除對應的sfhb_t、sfhc_t
#   DELETE FROM sfhb_t 
#    WHERE sfhbent = g_enterprise
#      AND sfhbdocno = (SELECT sfhadocno 
#                         FROM sfha_t
#                        WHERE sfhaent = g_enterprise
#                          AND sfha010 = p_docno
#                          AND sfha011 = p_seq  
#                          AND sfhastus = 'N')
#      
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "del sfhb_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
#   
#   DELETE FROM sfhc_t 
#    WHERE sfhcent = g_enterprise
#      AND sfhcdocno = (SELECT sfhadocno 
#                         FROM sfha_t
#                        WHERE sfhaent = g_enterprise
#                          AND sfha010 = p_docno
#                          AND sfha011 = p_seq  
#                          AND sfhastus = 'N')
#      
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "del sfhc_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
#   #170209-00041#1-e-add
#171030-00006#1 mark -e
#171030-00006#1 add -s
   UPDATE sfha_t 
      SET sfhastus = 'X'
    WHERE sfhaent = g_enterprise
      AND sfha010 = p_docno
      AND sfha011 = p_seq  
      AND sfhastus = 'N'

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "update sfha_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
#171030-00006#1 add -e

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 更新当站下线单对应的项次和数量
# Memo...........:
# Usage..........: CALL s_asft335_upd_sfha(p_docno,p_seq,p_seq_t,p_amt)
#                  RETURNING r_success
# Input parameter: p_docno        报工单号
#                : p_seq          报工单项次
#                : p_seq_t        报工单项次旧值
#                : p_amt          当站下线数量
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/05/25 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_sfha(p_docno,p_seq,p_seq_t,p_amt)
   DEFINE p_docno         LIKE sffb_t.sffbdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE p_seq           LIKE sffb_t.sffbseq
   DEFINE p_seq_t         LIKE sffb_t.sffbseq
   DEFINE p_amt           LIKE sffb_t.sffb019
   DEFINE l_cnt           LIKE type_t.num5
   #171108-00027#1-s
   DEFINE l_sffb001       LIKE sffb_t.sffb001
   DEFINE l_sffb019       LIKE sffb_t.sffb019
   
   LET g_sfhadocno = ''
   LET r_success = TRUE

   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00300'
      LET g_errparam.extend = 's_asft335_upd_sfha'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_amt) THEN LET p_amt = 0 END IF
   IF cl_null(p_seq_t) THEN LET p_seq_t = p_seq END IF

   LET l_sffb001 = ''
   LET l_sffb019 = ''
   SELECT sffb001,sffb019 INTO l_sffb001,l_sffb019
     FROM sffb_t
    WHERE sffbent = g_enterprise
      AND sffbsite = g_site
      AND sffbdocno = p_docno
      AND sffbseq = p_seq_t
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = "SELECT sffb_t",SQLERRMESSAGE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF l_sffb001 <> '3' OR p_amt = l_sffb019 THEN
      RETURN r_success
   END IF

   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfhasite = g_site
      AND sfha010 = p_docno
      AND sfha011 = p_seq_t
      AND sfhastus NOT IN ('X','N')
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00246'
      LET g_errparam.extend = p_docno,"#",p_seq_t
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfhasite = g_site
      AND sfha010 = p_docno
      AND sfha011 = p_seq_t
      AND sfhastus = 'N'
   CASE
      WHEN (l_cnt > 0 AND p_amt > 0)
         UPDATE sfha_t
            SET sfha011 = p_seq,
                sfha008 = p_amt
          WHERE sfhaent = g_enterprise
            AND sfhasite = g_site
            AND sfha010 = p_docno
            AND sfha011 = p_seq_t
            AND sfhastus = 'N'
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.extend = "UPDATE sfha_t",SQLERRMESSAGE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      WHEN (l_cnt > 0 AND p_amt = 0)
         #如果传入下线数量为0，则要删除原来那笔当站下线资料
         #IF NOT s_asft335_del_sfha(p_docno,p_seq_t) THEN      #181120-00025#1 mark
         IF NOT s_asft335_del_sfha_1(p_docno,p_seq_t) THEN     #181120-00025#1 add
            LET r_success = FALSE
         END IF
      WHEN (l_cnt = 0 AND p_amt > 0)
         #更新不到，可能是原来没有下线数量，现在有了，需要新增
         IF NOT s_asft335_ins_sfha(p_docno,p_seq,p_amt) THEN
            LET r_success = FALSE
         END IF 
   END CASE
   #171108-00027#1-e
   #171108-00027#1 mark -s
   #161109-00085#55-s
#   #DEFINE l_sffb        RECORD LIKE sffb_t.*
#   DEFINE l_sffb RECORD  #單筆製程報工檔
#       sffbent LIKE sffb_t.sffbent, #企業編號
#       sffbsite LIKE sffb_t.sffbsite, #營運據點
#       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
#       sffbseq LIKE sffb_t.sffbseq, #項次
#       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
#       sffb001 LIKE sffb_t.sffb001, #報工類別
#       sffb002 LIKE sffb_t.sffb002, #報工人員
#       sffb003 LIKE sffb_t.sffb003, #部門
#       sffb004 LIKE sffb_t.sffb004, #報工班別
#       sffb005 LIKE sffb_t.sffb005, #工單單號
#       sffb006 LIKE sffb_t.sffb006, #Run Card
#       sffb007 LIKE sffb_t.sffb007, #作業編號
#       sffb008 LIKE sffb_t.sffb008, #製程式
#       sffb009 LIKE sffb_t.sffb009, #工作站
#       sffb010 LIKE sffb_t.sffb010, #機器編號
#       sffb011 LIKE sffb_t.sffb011, #作業人數
#       sffb012 LIKE sffb_t.sffb012, #完成日期
#       sffb013 LIKE sffb_t.sffb013, #完成時間
#       sffb014 LIKE sffb_t.sffb014, #工時
#       sffb015 LIKE sffb_t.sffb015, #機時
#       sffb016 LIKE sffb_t.sffb016, #單位
#       sffb017 LIKE sffb_t.sffb017, #良品數量
#       sffb018 LIKE sffb_t.sffb018, #報廢數量
#       sffb019 LIKE sffb_t.sffb019, #當站下線數量
#       sffb020 LIKE sffb_t.sffb020, #回收數量
#       sffb021 LIKE sffb_t.sffb021, #no use
#       sffb022 LIKE sffb_t.sffb022, #no use
#       sffb023 LIKE sffb_t.sffb023, #備註
#       sffb024 LIKE sffb_t.sffb024, #報工組別
#       sffb025 LIKE sffb_t.sffb025, #生產計畫
#       sffb026 LIKE sffb_t.sffb026, #生產料號
#       sffb027 LIKE sffb_t.sffb027, #BOM特性
#       sffb028 LIKE sffb_t.sffb028, #產品特徵
#       sffbownid LIKE sffb_t.sffbownid, #資料所有者
#       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
#       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
#       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
#       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
#       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
#       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
#       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
#       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
#       sffbstus LIKE sffb_t.sffbstus, #狀態碼
#       sffb029 LIKE sffb_t.sffb029, #報工料號
#       sffb030 LIKE sffb_t.sffb030  #成本中心
#   END RECORD
#   #161109-00085#55-e
#
#   LET r_success = TRUE
#
#   IF p_docno IS NULL THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00300'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE

#      RETURN r_success
#   END IF
#
#   INITIALIZE l_sffb.* TO NULL
#
#   #161109-00085#55-s
#   #SELECT * INTO l_sffb.* FROM sffb_t
#   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
#          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
#          sffb005,sffb006,sffb007,sffb008,sffb009,
#          sffb010,sffb011,sffb012,sffb013,sffb014,
#          sffb015,sffb016,sffb017,sffb018,sffb019,
#          sffb020,sffb021,sffb022,sffb023,sffb024,
#          sffb025,sffb026,sffb027,sffb028,sffbownid,
#          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
#          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
#          sffb030
#     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
#          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
#          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
#          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
#          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
#          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
#          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
#          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
#          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
#          l_sffb.sffb030
#     FROM sffb_t     
#   #161109-00085#55-e
#    WHERE sffbent   = g_enterprise
#      AND sffbsite  = g_site
#      AND sffbdocno = p_docno
#      AND sffbseq   = p_seq_t
#      
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "sel_sffb"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
#      
#   IF l_sffb.sffb001 <> '3' OR p_amt IS NULL OR p_amt = l_sffb.sffb019 THEN
#      LET r_success = TRUE 
#      RETURN r_success
#   END IF
#
#   SELECT COUNT(1) INTO l_cnt  #161212-00020#1 星號調整
#     FROM sfha_t
#    WHERE sfhaent = g_enterprise
#      AND sfha010 = p_docno
#      AND sfha011 = p_seq_t
#      AND sfhastus<> 'N'
#    
#   IF l_cnt > 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00246'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   
#   IF p_seq_t IS NULL THEN LET p_seq_t = p_seq END IF
##如果传入下线数量为0，则要删除原来那笔当站下线资料
#   IF p_amt = 0 THEN
#      IF NOT s_asft335_del_sfha(p_docno,p_seq_t) THEN
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#   END IF
#   UPDATE sfha_t SET sfha011 = p_seq,
#                     sfha008 = p_amt
#    WHERE sfhaent = g_enterprise
#      AND sfha010 = p_docno
#      AND sfha011 = p_seq_t
#      
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "upd sfha_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
##更新不到，可能是原来没有下线数量，现在有了，需要新增
#   IF SQLCA.sqlerrd[3] = 0 THEN
#      IF NOT s_asft335_ins_sfha(p_docno,p_seq,p_amt) THEN
#         LET r_success = FALSE
#         RETURN r_success 
#      END IF 
#   END IF 
#171108-00027#1 mark -e
   RETURN r_success  
END FUNCTION

################################################################################
# Descriptions...: 若制程是重工制程，则更新原重工转出制程里那一站的在制量和重工转入量
# Memo...........:
# Usage..........: CALL s_asft335_upd_rework_routing(p_cmd,p_sfcb)
#                  RETURNING r_success
# Input parameter: p_cmd          审核1/取消审核-1
#                : p_qty          數量   #170213-00031#1 add
#                : p_sfcb         当站制程资料
# Return code....: r_success  回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/05/27 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_upd_rework_routing(p_cmd,p_qty,p_sfcb)
   DEFINE p_cmd          LIKE type_t.num5         #审核 1/取消审核 -1
   DEFINE p_qty          LIKE sffb_t.sffb017   #170213-00031#1 add
   DEFINE r_success      LIKE type_t.num5
   #161109-00085#55-s
   #DEFINE p_sfcb           RECORD LIKE sfcb_t.*  
   DEFINE p_sfcb RECORD  #工單製程單身檔
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
   END RECORD   
   #161109-00085#55-e
   DEFINE l_sfca005      LIKE sfca_t.sfca005
   DEFINE l_qty          LIKE sfia_t.sfia007
   DEFINE l_qty1         LIKE sfia_t.sfia007
   DEFINE l_qty2         LIKE sfia_t.sfia007
   DEFINE l_sfia003      LIKE sfia_t.sfia003
   DEFINE l_sfia004      LIKE sfia_t.sfia004
   DEFINE l_sfia005      LIKE sfia_t.sfia005
   DEFINE l_sfia006      LIKE sfia_t.sfia006
   DEFINE l_sfcb021      LIKE sfcb_t.sfcb021
   DEFINE l_sfcb022      LIKE sfcb_t.sfcb022
   DEFINE l_n            LIKE type_t.num5     #170618-00349#1 add
   #170524-00070#1 add --(S)--
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008  #製程式
   END RECORD     
   DEFINE l_amt          LIKE sfia_t.sfia007  
   DEFINE l_amt1         LIKE sfia_t.sfia007 
   #170524-00070#1 add --(E)--
   
#首先要判断是否是重工制程：sfca005=2 
#然后看是否是最后一站：sfcb009 = ‘END’
#再然后看本站是否处于群组
#  a：替代群组，数量取合计，注意sfcb006相同，且sfcb009 = END
#  b：无顺序群组和其他，取同是“END”的最小数量
#通过asft338的资料，找到需要更新的那个重工转出制程站
#call s_asft338_upd_routing(p_cmd,p_sfia003,p_sfia004,p_sfia005,p_sfia006,p_sfia007)更新之
   LET r_success = TRUE
   #170213-00031#1-s-mod
#   LET l_qty     = 0
   LET l_qty = p_qty
   #170213-00031#1-e-mod
   
   SELECT sfca005 INTO l_sfca005 
     FROM sfca_t
    WHERE sfcaent   = g_enterprise
      AND sfcasite  = g_site
      AND sfcadocno = p_sfcb.sfcbdocno
      AND sfca001   = p_sfcb.sfcb001
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'sel sfca005'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF l_sfca005 <> '2' THEN
      LET r_success = TRUE
      RETURN r_success
   END IF   

  #170618-00349#1 mark --(S)-- 
  #IF p_sfcb.sfcb009 <> 'END' THEN
  #   LET r_success = TRUE
  #   RETURN r_success
  #END IF
  #170618-00349#1 mark --(E)-- 
   
   #170618-00349#1 add --(S)--
   #判斷此報工點是否為最後一站
   LET l_n = 0
   SELECT COUNT(1) INTO l_n FROM s_asft335_tmp01
   IF l_n > 0 THEN
      LET r_success = TRUE
      RETURN r_success
   END IF   
   #170618-00349#1 add --(E)--
   
   #170213-00031#1-s-mark
##先取除替代群组外最小的数量
##再把同一替代群组的累积，然后取所有替代群组中最小的数量
##以上两者内再取最小的
#
#   SELECT MIN(qty) INTO l_qty1 FROM
#     (SELECT CASE WHEN sfcb019 ='Y' THEN sfcb049*sfcb022/sfcb021 WHEN sfcb018 ='Y' THEN sfcb048*sfcb022/sfcb021 WHEN sfcb016 ='Y' THEN sfcb050*sfcb022/sfcb021 WHEN sfcb015 ='Y' THEN sfcb047*sfcb054/sfcb053 WHEN sfcb014 ='Y' THEN sfcb046*sfcb054/sfcb053 ELSE 0 END qty
#        FROM sfcb_t   #这是取除替代群组外最小的数量
#       WHERE sfcbent   = p_sfcb.sfcbent
#         AND sfcbsite  = p_sfcb.sfcbsite
#         AND sfcbdocno = p_sfcb.sfcbdocno
#         AND sfcb001   = p_sfcb.sfcb001
#         AND sfcb005   <> '2'
#         AND sfcb009   = 'END')
#         
#   SELECT MIN(qty) INTO l_qty2 FROM #同一替代群组的累积，然后取所有替代群组中最小的数量
#      (SELECT SUM(CASE WHEN sfcb019 ='Y' THEN sfcb049*sfcb022/sfcb021 WHEN sfcb018 ='Y' THEN sfcb048*sfcb022/sfcb021 WHEN sfcb016 ='Y' THEN sfcb050*sfcb022/sfcb021 WHEN sfcb015 ='Y' THEN sfcb047*sfcb054/sfcb053 WHEN sfcb014 ='Y' THEN sfcb046*sfcb054/sfcb053 ELSE 0 END) qty,sfcb006
#        FROM sfcb_t   
#       WHERE sfcbent   = p_sfcb.sfcbent
#         AND sfcbsite  = p_sfcb.sfcbsite
#         AND sfcbdocno = p_sfcb.sfcbdocno
#         AND sfcb001   = p_sfcb.sfcb001
#         AND sfcb005   = '2'
#         AND sfcb009   = 'END'
#       GROUP BY sfcb006)
#   
#   IF l_qty1 IS NULL THEN LET l_qty1 = 0 END IF
#   IF l_qty2 IS NULL THEN LET l_qty2 = 0 END IF
#   IF l_qty1 > l_qty2 THEN
#      LET l_qty = l_qty1
#   ELSE
#      LET l_qty = l_qty2
#   END IF
   #170213-00031#1-e-mark
   #170213-00031#1-s-add
#   SELECT SUM(sffb017) INTO l_qty
#     FROM sffb_t
#    WHERE sffbent = g_enterprise
#      AND sffbsite  = g_site
#      AND sffb005   = p_sfcb.sfcbdocno
#      AND sffb006   = p_sfcb.sfcb001
#      AND sffb007   = p_sfcb.sfcb003
#      AND sffb008   = p_sfcb.sfcb004
#      AND sffb001   = p_type
#      AND sffbstus  = 'Y'
   #170213-00031#1-e-add
   IF l_qty IS NULL THEN LET l_qty = 0 END IF

#根据参数传入的重工转入制程去找到那笔asft338资料，关联到原来的重工转出制程站，由于转入runcard是自动编号的，应该不会存在重复资料，理论上，应该是这样的。。。
   SELECT sfia003,sfia004,sfia005,sfia006
     INTO l_sfia003,l_sfia004,l_sfia005,l_sfia006
     FROM sfia_t
    WHERE sfiaent  = g_enterprise
      AND sfiasite = g_site
      AND sfia003  = p_sfcb.sfcbdocno
      AND sfia008  = p_sfcb.sfcb001

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'sel sfia'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
#再把数量从主件单位数量换算回在制数量
   SELECT sfcb021,sfcb022 INTO l_sfcb021,l_sfcb022
     FROM sfcb_t
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = l_sfia003
      AND sfcb001   = l_sfia004
      AND sfcb003   = l_sfia005
      AND sfcb004   = l_sfia006

   #170524-00070#1 add --(S)--
   #若是平行製程需取最小的重工報工量更新
   SELECT sffb001,sffb005,sffb006,sffb007,sffb008
     INTO l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008
     FROM sffb_t
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = g_sffbdocno
      AND sffbseq   = g_sffbseq1  
      
   LET l_qty1 = l_qty * l_sfcb021/l_sfcb022
   #取得重工轉入前最後報工資料
   DELETE FROM s_asft335_tmp04
   IF NOT s_asft335_get_prev_station_rework(l_sffb.sffb001,l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008) THEN
      LET r_success = FALSE
      RETURN r_success      
   END IF
   #同样去除重复
   INSERT INTO s_asft335_tmp04 
   SELECT DISTINCT 'Y',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,type,
                   sfcb021,sfcb022,amt,sfcb053,sfcb054 
     FROM s_asft335_tmp04
   DELETE FROM s_asft335_tmp04 WHERE chk = 'N'
  
   IF NOT s_asft335_calculate_rework()  THEN   #计算数量，用来更新到对应的下一站点数量（含合并同一替代群组的数量）  
      LET r_success = FALSE
      RETURN r_success      
   END IF
   #上一站的数据都更新进去了，该取个最小值更新到下一站了
   LET l_amt = NULL
   SELECT MIN(amt) INTO l_amt FROM s_asft335_tmp04   #執行後的結果
   SELECT COUNT(1) INTO l_n FROM s_asft335_tmp04     #是否為平行製程
   #取得執行前的結果
   UPDATE s_asft335_tmp04
      SET amt = amt - p_cmd * l_qty1
    WHERE sfcb003   = l_sffb.sffb007
      AND sfcb004   = l_sffb.sffb008  
   SELECT MIN(amt) INTO l_amt1 FROM s_asft335_tmp04  #執行前的結果 
   IF l_amt IS NULL THEN LET l_amt = 0 END IF
   IF l_amt1 IS NULL THEN LET l_amt1 = 0 END IF
   #表示有平行製程
   IF l_n > 1 THEN   
      #取差異值更新重工轉出站的重工轉入量
      IF p_cmd = '1' THEN          
         IF l_amt > l_amt1 THEN
            LET l_qty = l_amt-l_amt1
         ELSE
            LET l_qty = 0         
         END IF   
      ELSE                         
         IF l_amt1 > l_amt THEN      
            LET l_qty = l_amt1 - l_amt
         ELSE
            LET l_qty = 0            
         END IF            
     END IF    
   END IF      
   #170524-00070#1 add --(E)--

   #LET l_qty = l_qty * l_sfcb021/l_sfcb022   #190215-00009#1 by 02159 mark 
   
   IF NOT s_asft338_upd_routing(p_cmd,l_sfia003,l_sfia004,l_sfia005,l_sfia006,l_qty) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 找出当前站的第一个动作是哪一个
# Memo...........:
# Usage..........: CALL s_asft335_get_first_action(p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success,r_type
# Input parameter: p_sfcbdocno    传入工单编号
#                : p_sfcb001      传入RunCard
#                : p_sfcb003      传入作业编号
#                : p_sfcb004      传入作业序
# Return code....: r_success      
#                : r_type         回传1：move in 2：check in 3：报工 4：check out 5：move out
# Date & Author..: 2014/11/23 By wujie
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_first_action(p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sfcbdocno  LIKE sfcb_t.sfcbdocno   
   DEFINE p_sfcb001    LIKE sfcb_t.sfcb001
   DEFINE p_sfcb003    LIKE sfcb_t.sfcb003
   DEFINE p_sfcb004    LIKE sfcb_t.sfcb004
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_type       LIKE type_t.num5
   DEFINE l_sfcb014    LIKE sfcb_t.sfcb014
   DEFINE l_sfcb015    LIKE sfcb_t.sfcb015
   DEFINE l_sfcb016    LIKE sfcb_t.sfcb016
   DEFINE l_sfcb018    LIKE sfcb_t.sfcb018
   DEFINE l_sfcb019    LIKE sfcb_t.sfcb019
   
   
   LET r_type = 0
   LET r_success = TRUE
   IF p_sfcbdocno IS NULL OR p_sfcb001 IS NULL OR p_sfcb003 IS NULL OR p_sfcb004 IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00456'
      LET g_errparam.extend = 'get first action'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      LET r_type = 0
      RETURN r_success,r_type
   END IF
   
   SELECT sfcb014,sfcb015,sfcb016,sfcb018,sfcb019 INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019 
     FROM sfcb_t
    WHERE sfcbent   = g_enterprise
      AND sfcbdocno = p_sfcbdocno
      AND sfcb001   = p_sfcb001
      AND sfcb003   = p_sfcb003
      AND sfcb004   = p_sfcb004

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00457'
      LET g_errparam.extend = 'get first action'
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = p_sfcbdocno
      LET g_errparam.replace[2] = p_sfcb001
      LET g_errparam.replace[3] = p_sfcb003
      LET g_errparam.replace[4] = p_sfcb004
      CALL cl_err()
      LET r_success = FALSE
      LET r_type = 0
      RETURN r_success,r_type
   END IF
   
   IF l_sfcb019 = 'Y' THEN LET r_type = '5' END IF
   IF l_sfcb018 = 'Y' THEN LET r_type = '4' END IF
   IF l_sfcb016 = 'Y' THEN LET r_type = '3' END IF
   IF l_sfcb015 = 'Y' THEN LET r_type = '2' END IF
   IF l_sfcb014 = 'Y' THEN LET r_type = '1' END IF
   
   RETURN r_success,r_type
END FUNCTION

PUBLIC FUNCTION s_asft335_ws_confirm(p_sffbdocno)
DEFINE p_sffbdocno     LIKE sffb_t.sffbdocno
DEFINE r_success       LIKE type_t.num5

   #確認前檢核段
#   CALL s_asft335_conf(p_sffbdocno) RETURNING r_success  #171113-00002#1 mark
   #171113-00002#1 add-S
   CALL s_asft335_conf_chk(p_sffbdocno) RETURNING r_success
   IF r_success THEN
      CALL s_asft335_conf_upd(p_sffbdocno) RETURNING r_success
   END IF
   #171113-00002#1 add-E

RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 依工作站抓取默認成本中心
# Memo...........:
# Usage..........: CALL s_asft335_default_sffb030(p_sffb009)
#                  RETURNING r_sffb030
# Input parameter: p_sffb009 工作站
# Return code....: r_sffb030 成本中心
# Date & Author..: 151013 By fengmy
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_default_sffb030(p_sffb009)
DEFINE p_sffb009 LIKE sffb_t.sffb009
DEFINE r_sffb030 LIKE sffb_t.sffb030

   SELECT ecaa003 INTO r_sffb030 FROM ecaa_t 
    WHERE ecaaent = g_enterprise AND ecaasite =  g_site
      AND ecaa001 = p_sffb009
   IF cl_null(r_sffb030) THEN LET r_sffb030 = '' END IF
    
   RETURN r_sffb030
END FUNCTION

################################################################################
# Descriptions...: 成本中心檢查
# Memo...........:
# Usage..........: CALL s_asft335_sffb030_chk(p_sffb030)
#                  RETURNING r_success,r_sffb030
# Input parameter: p_sffb030 成本中心
# Return code....: r_success 成功否
#                  r_sffb030 成本中心
# Date & Author..: 151013 By fengmy
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_sffb030_chk(p_sffb030)
DEFINE p_sffb030 LIKE sffb_t.sffb030
DEFINE r_success LIKE type_t.num5
DEFINE r_sffb030 LIKE sffb_t.sffb030

   LET r_success = TRUE
   IF NOT cl_null(p_sffb030) THEN 
   #應用 a17 樣板自動產生(Version:2)
      #欄位存在檢查
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL
    
      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = p_sffb030
      LET g_errshow = TRUE                                                                                                #160328-00029#3 add
      LET g_chkparam.err_str[1] = "aoo-00095:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125" #160328-00029#3 add
         
      #呼叫檢查存在並帶值的library
      IF cl_chk_exist("v_ooef001") THEN
         #檢查成功時後續處理
         LET r_sffb030 = p_sffb030
      ELSE
         LET r_success = FALSE
      END IF
   ELSE 
      LET r_sffb030 = ''
   END IF

   RETURN r_success,r_sffb030

END FUNCTION

################################################################################
# Descriptions...: 若有PQC,則需控管 良品數量不可大於該工單+Rucnard+作業編號+製程序的PQC合格數量-已報工良品量
# Memo...........:
# Usage..........: CALL s_asft335_chk_sffb017 (p_sffbdocno,p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008,p_sffb017)
#                  RETURNING r_success,r_sffb017
# Input parameter: p_sffbdocno   報工單號
#                : p_sffb001     作業型態
#                : p_sffb005     工單單號
#                : p_sffb006     RunCard
#                : p_sffb007     作業編號
#                : p_sffb008     製程序
#                : p_sffb017     報工良品量
# Return code....: r_success     報工量是否有超過PQC合格量
# Date & Author..: 15/11/17 By fionchen
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_chk_sffb017(p_sffbdocno,p_sffb001,p_sffb005,p_sffb006,p_sffb007,p_sffb008,p_sffb017)
   DEFINE p_sffbdocno         LIKE sffb_t.sffbdocno        #報工單號
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作業型態
   DEFINE p_sffb005           LIKE sffb_t.sffb005          #單據單號
   DEFINE p_sffb006           LIKE sffb_t.sffb006          #RunCard
   DEFINE p_sffb007           LIKE sffb_t.sffb007          #作業編號
   DEFINE p_sffb008           LIKE sffb_t.sffb008          #製程序
   DEFINE p_sffb017           LIKE sffb_t.sffb017          #報工良品量
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_sfcb017           LIKE sfcb_t.sfcb017          #是否PQC
   DEFINE l_PQC_Qty           LIKE qcba_t.qcba023          #合計PQC合格量
   DEFINE l_sffb017_Qty       LIKE sffb_t.sffb017          #合計報工良品量
   
   LET r_success = TRUE
   
   IF p_sffb017 IS NULL THEN LET p_sffb017 = 0 END IF

   IF p_sffb001 <> '3' THEN
      RETURN r_success
   END IF
   
   IF p_sffb001 IS NULL OR p_sffb005 IS NULL OR p_sffb006 IS NULL OR p_sffb007 IS NULL OR p_sffb008 IS NULL THEN
      RETURN r_success
   END IF
   
   SELECT sfcb017                          #是否PQC
     INTO l_sfcb017                       
     FROM sfcb_t
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = p_sffb005            #單據單號
      AND sfcb001   = p_sffb006            #RunCard
      AND sfcb003   = p_sffb007            #作業編號
      AND sfcb004   = p_sffb008            #製程序
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #若有PQC,則需控管 良品數量不可大於該工單+Rucnard+作業編號+作業序的PQC合格數量-已報工良品量
   IF l_sfcb017 = 'Y' THEN 
   
      #PQC檢驗合格量
      Select SUM(qcba023) INTO l_PQC_Qty        #合格量
        From qcba_t
       WHERE qcbaent  = g_enterprise
         AND qcbasite = g_site
         AND qcba000  = '3'                     #PQC
         AND qcba001  = p_sffb005               #來源單據
         AND qcba029  = p_sffb006               #RunCard
         AND qcba006  = p_sffb007               #作業編號
         AND qcba007  = p_sffb008               #製程序
         AND (qcba022 = '1' or qcba022 = '4')   #判定結果(1.合格 4.特採)
         AND qcbastus = 'Y'                     #狀態碼
   
      IF l_PQC_Qty IS NULL THEN LET l_PQC_Qty = 0 END IF
      
      #已報工良品量      
      Select SUM(sffb017) INTO l_sffb017_Qty
        From sffb_t
       WHERE sffbent   =  g_enterprise 
         AND sffbsite  =  g_site
         AND sffbdocno <> p_sffbdocno           #報工單號(其他報工單)
         AND sffb001   = '3'                    #報工類別
         AND sffb005   =  p_sffb005             #來源單號
         AND sffb006   =  p_sffb006             #RunCard 
         AND sffb007   =  p_sffb007             #作業編號
         AND sffb008   =  p_sffb008             #製程序
         AND sffbstus  <> 'X'                   #狀態碼
      
      IF l_sffb017_Qty IS NULL THEN LET l_sffb017_Qty = 0 END IF
      
      IF p_sffb017 > l_PQC_Qty - l_sffb017_Qty THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00701'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 新增單站下線檔
# Memo...........:
# Usage..........: CALL s_asft335_ins_shf(p_slip,p_sfha010,p_sfha011,p_sfhb003,p_sfhb004,p_sfhb)
#                  RETURNING r_success
# Input parameter: p_slip         下線單別
#                : p_sfha010      報工單號
#                : p_sfha011      報工項次
#                : p_sfhb003      下線庫別
#                : p_sfhb004      下線儲位
#                : p_sfhb.sfhb001 下線料號
#                : p_sfhb.sfhb002 產品特徵
#                : p_sfhb.sfhb008 下線數量
# Return code....: TRUE OR FALSE
# Date & Author..: #160511-00020#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_ins_shf(p_slip,p_sfha010,p_sfha011,p_sfhb003,p_sfhb004,p_sfhb)
DEFINE p_slip       LIKE sfha_t.sfhadocno
DEFINE p_sfha010    LIKE sfha_t.sfha010
DEFINE p_sfha011    LIKE sfha_t.sfha011
DEFINE p_sfhb003    LIKE sfhb_t.sfhb003
DEFINE p_sfhb004    LIKE sfhb_t.sfhb004
DEFINE p_sfhb  DYNAMIC ARRAY OF RECORD
    sfhb001    LIKE sfhb_t.sfhb001,
    sfhb002    LIKE sfhb_t.sfhb002,
    sfhb008    LIKE sfhb_t.sfhb008
           END RECORD
DEFINE r_success    LIKE type_t.num5
DEFINE l_sfha008    LIKE sfha_t.sfha008
#161109-00085#55-s
#DEFINE l_sfhb       RECORD LIKE sfhb_t.*
DEFINE l_sfhb RECORD  #工單當站下線入庫申請檔
       sfhbent LIKE sfhb_t.sfhbent, #企業編號
       sfhbsite LIKE sfhb_t.sfhbsite, #營運據點
       sfhbdocno LIKE sfhb_t.sfhbdocno, #單號
       sfhbseq LIKE sfhb_t.sfhbseq, #項次
       sfhb001 LIKE sfhb_t.sfhb001, #料件編號
       sfhb002 LIKE sfhb_t.sfhb002, #產品特徵
       sfhb003 LIKE sfhb_t.sfhb003, #庫位
       sfhb004 LIKE sfhb_t.sfhb004, #儲位
       sfhb005 LIKE sfhb_t.sfhb005, #批號
       sfhb006 LIKE sfhb_t.sfhb006, #庫存管理特徵
       sfhb007 LIKE sfhb_t.sfhb007, #單位
       sfhb008 LIKE sfhb_t.sfhb008, #數量
       sfhb009 LIKE sfhb_t.sfhb009, #參考單位
       sfhb010 LIKE sfhb_t.sfhb010, #參考數量
       sfhb011 LIKE sfhb_t.sfhb011, #生效日期
       sfhb012 LIKE sfhb_t.sfhb012, #存貨備註
       sfhbud001 LIKE sfhb_t.sfhbud001, #自定義欄位(文字)001
       sfhbud002 LIKE sfhb_t.sfhbud002, #自定義欄位(文字)002
       sfhbud003 LIKE sfhb_t.sfhbud003, #自定義欄位(文字)003
       sfhbud004 LIKE sfhb_t.sfhbud004, #自定義欄位(文字)004
       sfhbud005 LIKE sfhb_t.sfhbud005, #自定義欄位(文字)005
       sfhbud006 LIKE sfhb_t.sfhbud006, #自定義欄位(文字)006
       sfhbud007 LIKE sfhb_t.sfhbud007, #自定義欄位(文字)007
       sfhbud008 LIKE sfhb_t.sfhbud008, #自定義欄位(文字)008
       sfhbud009 LIKE sfhb_t.sfhbud009, #自定義欄位(文字)009
       sfhbud010 LIKE sfhb_t.sfhbud010, #自定義欄位(文字)010
       sfhbud011 LIKE sfhb_t.sfhbud011, #自定義欄位(數字)011
       sfhbud012 LIKE sfhb_t.sfhbud012, #自定義欄位(數字)012
       sfhbud013 LIKE sfhb_t.sfhbud013, #自定義欄位(數字)013
       sfhbud014 LIKE sfhb_t.sfhbud014, #自定義欄位(數字)014
       sfhbud015 LIKE sfhb_t.sfhbud015, #自定義欄位(數字)015
       sfhbud016 LIKE sfhb_t.sfhbud016, #自定義欄位(數字)016
       sfhbud017 LIKE sfhb_t.sfhbud017, #自定義欄位(數字)017
       sfhbud018 LIKE sfhb_t.sfhbud018, #自定義欄位(數字)018
       sfhbud019 LIKE sfhb_t.sfhbud019, #自定義欄位(數字)019
       sfhbud020 LIKE sfhb_t.sfhbud020, #自定義欄位(數字)020
       sfhbud021 LIKE sfhb_t.sfhbud021, #自定義欄位(日期時間)021
       sfhbud022 LIKE sfhb_t.sfhbud022, #自定義欄位(日期時間)022
       sfhbud023 LIKE sfhb_t.sfhbud023, #自定義欄位(日期時間)023
       sfhbud024 LIKE sfhb_t.sfhbud024, #自定義欄位(日期時間)024
       sfhbud025 LIKE sfhb_t.sfhbud025, #自定義欄位(日期時間)025
       sfhbud026 LIKE sfhb_t.sfhbud026, #自定義欄位(日期時間)026
       sfhbud027 LIKE sfhb_t.sfhbud027, #自定義欄位(日期時間)027
       sfhbud028 LIKE sfhb_t.sfhbud028, #自定義欄位(日期時間)028
       sfhbud029 LIKE sfhb_t.sfhbud029, #自定義欄位(日期時間)029
       sfhbud030 LIKE sfhb_t.sfhbud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#55-e
#161109-00085#55-s
#DEFINE l_sfhc       RECORD LIKE sfhc_t.*
DEFINE l_sfhc RECORD  #工單當站下線入庫明細檔
       sfhcent LIKE sfhc_t.sfhcent, #企業編號
       sfhcsite LIKE sfhc_t.sfhcsite, #營運據點
       sfhcdocno LIKE sfhc_t.sfhcdocno, #單號
       sfhcseq LIKE sfhc_t.sfhcseq, #項次
       sfhcseq1 LIKE sfhc_t.sfhcseq1, #項序
       sfhc001 LIKE sfhc_t.sfhc001, #料件編號
       sfhc002 LIKE sfhc_t.sfhc002, #產品特徵
       sfhc003 LIKE sfhc_t.sfhc003, #庫位
       sfhc004 LIKE sfhc_t.sfhc004, #儲位
       sfhc005 LIKE sfhc_t.sfhc005, #批號
       sfhc006 LIKE sfhc_t.sfhc006, #庫存管理特徵
       sfhc007 LIKE sfhc_t.sfhc007, #單位
       sfhc008 LIKE sfhc_t.sfhc008, #數量
       sfhc009 LIKE sfhc_t.sfhc009, #參考單位
       sfhc010 LIKE sfhc_t.sfhc010, #參考數量
       sfhc011 LIKE sfhc_t.sfhc011, #生效日期
       sfhc012 LIKE sfhc_t.sfhc012, #存貨備註
       sfhcud001 LIKE sfhc_t.sfhcud001, #自定義欄位(文字)001
       sfhcud002 LIKE sfhc_t.sfhcud002, #自定義欄位(文字)002
       sfhcud003 LIKE sfhc_t.sfhcud003, #自定義欄位(文字)003
       sfhcud004 LIKE sfhc_t.sfhcud004, #自定義欄位(文字)004
       sfhcud005 LIKE sfhc_t.sfhcud005, #自定義欄位(文字)005
       sfhcud006 LIKE sfhc_t.sfhcud006, #自定義欄位(文字)006
       sfhcud007 LIKE sfhc_t.sfhcud007, #自定義欄位(文字)007
       sfhcud008 LIKE sfhc_t.sfhcud008, #自定義欄位(文字)008
       sfhcud009 LIKE sfhc_t.sfhcud009, #自定義欄位(文字)009
       sfhcud010 LIKE sfhc_t.sfhcud010, #自定義欄位(文字)010
       sfhcud011 LIKE sfhc_t.sfhcud011, #自定義欄位(數字)011
       sfhcud012 LIKE sfhc_t.sfhcud012, #自定義欄位(數字)012
       sfhcud013 LIKE sfhc_t.sfhcud013, #自定義欄位(數字)013
       sfhcud014 LIKE sfhc_t.sfhcud014, #自定義欄位(數字)014
       sfhcud015 LIKE sfhc_t.sfhcud015, #自定義欄位(數字)015
       sfhcud016 LIKE sfhc_t.sfhcud016, #自定義欄位(數字)016
       sfhcud017 LIKE sfhc_t.sfhcud017, #自定義欄位(數字)017
       sfhcud018 LIKE sfhc_t.sfhcud018, #自定義欄位(數字)018
       sfhcud019 LIKE sfhc_t.sfhcud019, #自定義欄位(數字)019
       sfhcud020 LIKE sfhc_t.sfhcud020, #自定義欄位(數字)020
       sfhcud021 LIKE sfhc_t.sfhcud021, #自定義欄位(日期時間)021
       sfhcud022 LIKE sfhc_t.sfhcud022, #自定義欄位(日期時間)022
       sfhcud023 LIKE sfhc_t.sfhcud023, #自定義欄位(日期時間)023
       sfhcud024 LIKE sfhc_t.sfhcud024, #自定義欄位(日期時間)024
       sfhcud025 LIKE sfhc_t.sfhcud025, #自定義欄位(日期時間)025
       sfhcud026 LIKE sfhc_t.sfhcud026, #自定義欄位(日期時間)026
       sfhcud027 LIKE sfhc_t.sfhcud027, #自定義欄位(日期時間)027
       sfhcud028 LIKE sfhc_t.sfhcud028, #自定義欄位(日期時間)028
       sfhcud029 LIKE sfhc_t.sfhcud029, #自定義欄位(日期時間)029
       sfhcud030 LIKE sfhc_t.sfhcud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#55-e
DEFINE l_success    LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
DEFINE l_imaf061    LIKE imaf_t.imaf061
DEFINE l_imaf032    LIKE imaf_t.imaf032

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET g_sfhadocno = p_slip
   
   LET l_sfha008 = 0
   FOR l_n = 1 TO p_sfhb.getLength()
      IF cl_null(p_sfhb[l_n].sfhb001) THEN
         CONTINUE FOR
      END IF
      IF cl_null(p_sfhb[l_n].sfhb008) THEN
         LET p_sfhb[l_n].sfhb008 = 0
      END IF
      LET l_sfha008 = l_sfha008 + p_sfhb[l_n].sfhb008
   END FOR
   
   IF NOT s_asft335_ins_sfha(p_sfha010,p_sfha011,l_sfha008) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   FOR l_n = 1 TO p_sfhb.getLength()
      IF cl_null(p_sfhb[l_n].sfhb001) THEN
         CONTINUE FOR
      END IF
      INITIALIZE l_sfhb.* TO NULL
      LET l_sfhb.sfhbent   = g_enterprise        #企業代碼
      LET l_sfhb.sfhbsite  = g_site              #營運據點
      LET l_sfhb.sfhbdocno = g_sfhadocno         #單號
      LET l_sfhb.sfhbseq   = l_n
      LET l_sfhb.sfhb001   = p_sfhb[l_n].sfhb001
      LET l_sfhb.sfhb002   = p_sfhb[l_n].sfhb002
      LET l_sfhb.sfhb003   = p_sfhb003  #庫位
      LET l_sfhb.sfhb004   = p_sfhb004  #儲位
      LET l_sfhb.sfhb008   = p_sfhb[l_n].sfhb008
      IF NOT cl_null(l_sfhb.sfhb001) THEN
         #單位
         SELECT imaa006 INTO l_sfhb.sfhb007
           FROM imaa_t
          WHERE imaaent = g_enterprise
            AND imaa001 = l_sfhb.sfhb001
         #參考單位
         LET l_imaf032 = ''
         LET l_imaf061 = ''
         SELECT imaf015,imaf032,imaf061
           INTO l_sfhb.sfhb009,l_imaf032,l_imaf061
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = l_sfhb.sfhb001
         #生效日期
         IF l_imaf061 = '1' THEN
            LET l_sfhb.sfhb011 = cl_get_today()
            IF NOT cl_null(l_imaf032) THEN
               LET l_sfhb.sfhb011 = l_sfhb.sfhb011 + l_imaf032
            END IF
         END IF
         #參考數量
         IF NOT cl_null(l_sfhb.sfhb007) AND cl_null(l_sfhb.sfhb009) THEN
            CALL s_aooi250_convert_qty(l_sfhb.sfhb001,l_sfhb.sfhb007,l_sfhb.sfhb009,l_sfhb.sfhb008)
               RETURNING l_success,l_sfhb.sfhb010
         END IF
      END IF
      #161109-00085#55-s
      #INSERT INTO sfhb_t VALUES(l_sfhb.*) 
      INSERT INTO sfhb_t ( sfhbent,sfhbsite,sfhbdocno,sfhbseq,sfhb001,
                           sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,
                           sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,
                           sfhb012,sfhbud001,sfhbud002,sfhbud003,sfhbud004,
                           sfhbud005,sfhbud006,sfhbud007,sfhbud008,sfhbud009,
                           sfhbud010,sfhbud011,sfhbud012,sfhbud013,sfhbud014,
                           sfhbud015,sfhbud016,sfhbud017,sfhbud018,sfhbud019,
                           sfhbud020,sfhbud021,sfhbud022,sfhbud023,sfhbud024,
                           sfhbud025,sfhbud026,sfhbud027,sfhbud028,sfhbud029,
                           sfhbud030 )
         VALUES(l_sfhb.sfhbent,l_sfhb.sfhbsite,l_sfhb.sfhbdocno,l_sfhb.sfhbseq,l_sfhb.sfhb001,
                l_sfhb.sfhb002,l_sfhb.sfhb003,l_sfhb.sfhb004,l_sfhb.sfhb005,l_sfhb.sfhb006,
                l_sfhb.sfhb007,l_sfhb.sfhb008,l_sfhb.sfhb009,l_sfhb.sfhb010,l_sfhb.sfhb011,
                l_sfhb.sfhb012,l_sfhb.sfhbud001,l_sfhb.sfhbud002,l_sfhb.sfhbud003,l_sfhb.sfhbud004,
                l_sfhb.sfhbud005,l_sfhb.sfhbud006,l_sfhb.sfhbud007,l_sfhb.sfhbud008,l_sfhb.sfhbud009,
                l_sfhb.sfhbud010,l_sfhb.sfhbud011,l_sfhb.sfhbud012,l_sfhb.sfhbud013,l_sfhb.sfhbud014,
                l_sfhb.sfhbud015,l_sfhb.sfhbud016,l_sfhb.sfhbud017,l_sfhb.sfhbud018,l_sfhb.sfhbud019,
                l_sfhb.sfhbud020,l_sfhb.sfhbud021,l_sfhb.sfhbud022,l_sfhb.sfhbud023,l_sfhb.sfhbud024,
                l_sfhb.sfhbud025,l_sfhb.sfhbud026,l_sfhb.sfhbud027,l_sfhb.sfhbud028,l_sfhb.sfhbud029,
                l_sfhb.sfhbud030)       
      #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins sfhb_t",SQLERRMESSAGE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOR
      END IF
      INITIALIZE l_sfhc.* TO NULL
      LET l_sfhc.sfhcent   = l_sfhb.sfhbent      #企業編號
      LET l_sfhc.sfhcsite  = l_sfhb.sfhbsite     #營運據點
      LET l_sfhc.sfhcdocno = l_sfhb.sfhbdocno    #單號
      LET l_sfhc.sfhcseq   = l_sfhb.sfhbseq      #項次
      LET l_sfhc.sfhcseq1  = l_sfhb.sfhbseq      #項序
      LET l_sfhc.sfhc001   = l_sfhb.sfhb001      #料件編號
      LET l_sfhc.sfhc002   = l_sfhb.sfhb002      #產品特徵
      LET l_sfhc.sfhc003   = l_sfhb.sfhb003      #庫位
      LET l_sfhc.sfhc004   = l_sfhb.sfhb004      #儲位
      LET l_sfhc.sfhc007   = l_sfhb.sfhb007      #單位
      LET l_sfhc.sfhc008   = l_sfhb.sfhb008      #數量
      LET l_sfhc.sfhc009   = l_sfhb.sfhb009      #參考單位
      LET l_sfhc.sfhc010   = l_sfhb.sfhb010      #參考數量
      LET l_sfhc.sfhc011   = l_sfhb.sfhb011      #生效日期
      #161109-00085#55-s
      #INSERT INTO sfhc_t VALUES(l_sfhc.*)
      INSERT INTO sfhc_t ( sfhcent,sfhcsite,sfhcdocno,sfhcseq,sfhcseq1,
                           sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,
                           sfhc006,sfhc007,sfhc008,sfhc009,sfhc010,
                           sfhc011,sfhc012,sfhcud001,sfhcud002,sfhcud003,
                           sfhcud004,sfhcud005,sfhcud006,sfhcud007,sfhcud008,
                           sfhcud009,sfhcud010,sfhcud011,sfhcud012,sfhcud013,
                           sfhcud014,sfhcud015,sfhcud016,sfhcud017,sfhcud018,
                           sfhcud019,sfhcud020,sfhcud021,sfhcud022,sfhcud023,
                           sfhcud024,sfhcud025,sfhcud026,sfhcud027,sfhcud028,
                           sfhcud029,sfhcud030)
         VALUES(l_sfhc.sfhcent,l_sfhc.sfhcsite,l_sfhc.sfhcdocno,l_sfhc.sfhcseq,l_sfhc.sfhcseq1,
                l_sfhc.sfhc001,l_sfhc.sfhc002,l_sfhc.sfhc003,l_sfhc.sfhc004,l_sfhc.sfhc005,
                l_sfhc.sfhc006,l_sfhc.sfhc007,l_sfhc.sfhc008,l_sfhc.sfhc009,l_sfhc.sfhc010,
                l_sfhc.sfhc011,l_sfhc.sfhc012,l_sfhc.sfhcud001,sfhcud002,sfhcud003,
                l_sfhc.sfhcud004,l_sfhc.sfhcud005,l_sfhc.sfhcud006,l_sfhc.sfhcud007,l_sfhc.sfhcud008,
                l_sfhc.sfhcud009,l_sfhc.sfhcud010,l_sfhc.sfhcud011,l_sfhc.sfhcud012,l_sfhc.sfhcud013,
                l_sfhc.sfhcud014,l_sfhc.sfhcud015,l_sfhc.sfhcud016,l_sfhc.sfhcud017,l_sfhc.sfhcud018,
                l_sfhc.sfhcud019,l_sfhc.sfhcud020,l_sfhc.sfhcud021,l_sfhc.sfhcud022,l_sfhc.sfhcud023,
                l_sfhc.sfhcud024,l_sfhc.sfhcud025,l_sfhc.sfhcud026,l_sfhc.sfhcud027,l_sfhc.sfhcud028,
                l_sfhc.sfhcud029,l_sfhc.sfhcud030)
      #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins sfhc_t",SQLERRMESSAGE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOR
      END IF
   END FOR
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 插入s_asft335_sffbtmp临时表数据
# Memo...........: 对sffb表的各项次重新按报工的顺序排序
# Usage..........: CALL s_asft335_deal_sffbtmp(p_docno)
#                  RETURNING r_success
# Input parameter: p_docno     报工单号
# Return code....: r_success   处理状态(TRUE/FALSE)
# Date & Author..: 2016/7/30 By zhangllc 160730-00003#1
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_asft335_deal_sffbtmp(p_docno)
   DEFINE p_docno         LIKE sffb_t.sffbdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_sffb005       LIKE sffb_t.sffb005  #工单
   DEFINE l_sffb006       LIKE sffb_t.sffb006  #RUNCARD

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   DELETE FROM s_asft335_sffbtmp  #161215-00047#1
   #将该笔报工单的资料写入临时表
   INSERT INTO s_asft335_sffbtmp
   #161109-00085#55-s
   #SELECT * FROM sffb_t WHERE sffbent = g_enterprise AND sffbdocno = p_docno
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     FROM sffb_t WHERE sffbent = g_enterprise AND sffbdocno = p_docno       
   #161109-00085#55-e       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins s_asft335_sffbtmp'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #报工单资料重新排序--将现项次先更新为备份项次，以便后面逐个重排
   SELECT COUNT(1) INTO g_count FROM s_asft335_sffbtmp  #批次报工总笔数，此g_count就是用于判断已重排和未重排的依据，不可另作他用  #161212-00020#1 星號調整
   IF g_count = 1 THEN  #只有1笔则不用重排序
      RETURN r_success
   END IF
   
   UPDATE s_asft335_sffbtmp SET sffbseq = sffbseq + g_count  #先搬移原项次
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'upd sffbtmp：sffbseq bak'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #报工单资料重新排序--按工单+runcard分类
   LET l_sql = " SELECT UNIQUE sffb005,sffb006 FROM s_asft335_sffbtmp "
   PREPARE s_asft335_deal_sffbtmp_p1 FROM l_sql
   DECLARE s_asft335_deal_sffbtmp_c1 CURSOR FOR s_asft335_deal_sffbtmp_p1
   LET g_seq = 0
   FOREACH s_asft335_deal_sffbtmp_c1 INTO l_sffb005,l_sffb006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach s_asft335_deal_sffbtmp_c1:'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      #按工单+runcard的工艺顺序走，并与s_asft335_sffbtmp匹配，能匹配到的更新项次g_seq
      CALL s_asft335_deal_sffbtmp_round('0',l_sffb005,l_sffb006,'','','','','') RETURNING l_success
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION


################################################################################
# Descriptions...: 插入s_asft335_sffbtmp临时表数据
# Memo...........: 对sffb表的各项次重新按报工的顺序排序
# Usage..........: CALL s_asft335_deal_sffbtmp_round(p_flag,p_wo,p_runcard,p_sfcb003,p_sfcb004,p_sfcb006,p_sfcb009,p_sfcb010)
#                  RETURNING r_success
# Input parameter: p_docno     报工单号
# Return code....: r_success   处理状态(TRUE/FALSE)
# Date & Author..: 2016/7/30 By zhangllc 160730-00003#1
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_asft335_deal_sffbtmp_round(p_flag,p_wo,p_runcard,p_sfcb003,p_sfcb004,p_sfcb006,p_sfcb009,p_sfcb010)
DEFINE p_flag      LIKE type_t.chr1      #0首站 1递归下站
DEFINE p_wo        LIKE sfca_t.sfcadocno #工单号
DEFINE p_runcard   LIKE sfca_t.sfca001   #runcard号
DEFINE p_sfcb003   LIKE sfcb_t.sfcb003   #前一站转入的该站的：本站作业
DEFINE p_sfcb004   LIKE sfcb_t.sfcb004   #前一站转入的该站的：本站作业序
DEFINE p_sfcb006   LIKE sfcb_t.sfcb006   #群组
DEFINE p_sfcb009   LIKE sfcb_t.sfcb009   #前一站转入的该站的：下站作业
DEFINE p_sfcb010   LIKE sfcb_t.sfcb010   #前一站转入的该站的：下站作业序
DEFINE r_success     LIKE type_t.num5
DEFINE l_i,l_row     LIKE type_t.num5
DEFINE l_success     LIKE type_t.num5
DEFINE l_sql         STRING
#161109-00085#55-s
#DEFINE l_sfcb DYNAMIC ARRAY OF RECORD LIKE sfcb_t.*
DEFINE l_sfcb DYNAMIC ARRAY OF RECORD 
       sfcbent LIKE sfcb_t.sfcbent, #企業編號
       sfcbsite LIKE sfcb_t.sfcbsite, #營運據點
       sfcbdocno LIKE sfcb_t.sfcbdocno, #單號
       sfcb001 LIKE sfcb_t.sfcb001, #RUN CARD
       sfcb002 LIKE sfcb_t.sfcb002, #項次
       sfcb003 LIKE sfcb_t.sfcb003, #本站作業
       sfcb004 LIKE sfcb_t.sfcb004, #作業序
       sfcb005 LIKE sfcb_t.sfcb005, #群組性質
       sfcb006 LIKE sfcb_t.sfcb006, #群組
       sfcb007 LIKE sfcb_t.sfcb007, #上站作業
       sfcb008 LIKE sfcb_t.sfcb008, #上站作業序
       sfcb009 LIKE sfcb_t.sfcb009, #下站作業
       sfcb010 LIKE sfcb_t.sfcb010, #下站作業序
       sfcb011 LIKE sfcb_t.sfcb011, #工作站
       sfcb012 LIKE sfcb_t.sfcb012, #允許委外
       sfcb013 LIKE sfcb_t.sfcb013, #主要加工廠
       sfcb014 LIKE sfcb_t.sfcb014, #Move in
       sfcb015 LIKE sfcb_t.sfcb015, #Check in
       sfcb016 LIKE sfcb_t.sfcb016, #報工站
       sfcb017 LIKE sfcb_t.sfcb017, #PQC
       sfcb018 LIKE sfcb_t.sfcb018, #Check out
       sfcb019 LIKE sfcb_t.sfcb019, #Move out
       sfcb020 LIKE sfcb_t.sfcb020, #轉出單位
       sfcb021 LIKE sfcb_t.sfcb021, #單位轉換率分子
       sfcb022 LIKE sfcb_t.sfcb022, #單位轉換率分母
       sfcb023 LIKE sfcb_t.sfcb023, #固定工時
       sfcb024 LIKE sfcb_t.sfcb024, #標準工時
       sfcb025 LIKE sfcb_t.sfcb025, #固定機時
       sfcb026 LIKE sfcb_t.sfcb026, #標準機時
       sfcb027 LIKE sfcb_t.sfcb027, #標準產出量
       sfcb028 LIKE sfcb_t.sfcb028, #良品轉入
       sfcb029 LIKE sfcb_t.sfcb029, #重工轉入
       sfcb030 LIKE sfcb_t.sfcb030, #回收轉入
       sfcb031 LIKE sfcb_t.sfcb031, #分割轉入
       sfcb032 LIKE sfcb_t.sfcb032, #合併轉入
       sfcb033 LIKE sfcb_t.sfcb033, #良品轉出
       sfcb034 LIKE sfcb_t.sfcb034, #重工轉出
       sfcb035 LIKE sfcb_t.sfcb035, #回收轉出
       sfcb036 LIKE sfcb_t.sfcb036, #當站報廢
       sfcb037 LIKE sfcb_t.sfcb037, #當站下線
       sfcb038 LIKE sfcb_t.sfcb038, #分割轉出
       sfcb039 LIKE sfcb_t.sfcb039, #合併轉出
       sfcb040 LIKE sfcb_t.sfcb040, #Bonus
       sfcb041 LIKE sfcb_t.sfcb041, #委外加工數
       sfcb042 LIKE sfcb_t.sfcb042, #委外完工數
       sfcb043 LIKE sfcb_t.sfcb043, #盤點數
       sfcb044 LIKE sfcb_t.sfcb044, #預計開工日
       sfcb045 LIKE sfcb_t.sfcb045, #預計完工日
       sfcb046 LIKE sfcb_t.sfcb046, #待Move in數
       sfcb047 LIKE sfcb_t.sfcb047, #待Check in數
       sfcb048 LIKE sfcb_t.sfcb048, #待Check out數
       sfcb049 LIKE sfcb_t.sfcb049, #待Move out數
       sfcb050 LIKE sfcb_t.sfcb050, #在製數
       sfcb051 LIKE sfcb_t.sfcb051, #待PQC數
       sfcb052 LIKE sfcb_t.sfcb052, #轉入單位
       sfcb053 LIKE sfcb_t.sfcb053, #轉入單位轉換率分子
       sfcb054 LIKE sfcb_t.sfcb054, #轉入單位轉換率分母
       sfcb055 LIKE sfcb_t.sfcb055  #回收站
END RECORD   
#161109-00085#55-e
DEFINE l_cnt        LIKE type_t.num10
DEFINE l_cnt_i      LIKE type_t.num10
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

   IF p_flag = 0 THEN
      #抓出某RUN CARD各首站开始的第一个报工站      
      #161109-00085#55-s
      #LET l_sql = " SELECT sfcb_t.* FROM sfcb_t ",
      LET l_sql = " SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
                           sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
                           sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
                           sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
                           sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
                           sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
                           sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
                           sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
                           sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
                           sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
                           sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
                           sfcb053,sfcb054,sfcb055
                      FROM sfcb_t ",
      #161109-00085#55-e
                  "  WHERE sfcbent = ",g_enterprise,
                  "    AND sfcbdocno = '",p_wo,"' ",  #单号
                  "    AND sfcb001 = '",p_runcard,"' ",   #RUN CARD
                  "    AND (sfcb007 = 'INIT' OR sfcb007 = ' ' OR sfcb007 IS NULL) "       #上站作业=首站(非制程工单为空)
   ELSE
      #递归流转，获取下站sfcb资料
      IF NOT cl_null(p_sfcb006) THEN   #群组
         #从sfcb中获取下站，不能从sfcc以防群组中某一工艺线路也存在自己的流程，群组里面不会有MULT的情况，若有代表制程资料有误
      #161109-00085#55-s
      #LET l_sql = " SELECT sfcb_t.* FROM sfcb_t ",
      LET l_sql = " SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
                           sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
                           sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
                           sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
                           sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
                           sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
                           sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
                           sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
                           sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
                           sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
                           sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
                           sfcb053,sfcb054,sfcb055
                      FROM sfcb_t ",
      #161109-00085#55-e
                     "  WHERE sfcbent = ",g_enterprise,
                     "    AND sfcbdocno = '",p_wo,"' ",  #单号
                     "    AND sfcb001 = '",p_runcard,"' ",   #RUN CARD
                     "    AND sfcb003 = '",p_sfcb009,"' ", #本站作业  = 前一站转入的该站的：下站作业
                     "    AND sfcb004 = '",p_sfcb010,"' "  #本站作业序 = 前一站转入的该站的：下站作业序
      ELSE
         #从sfcc中获取下站
         #是要找到当前站所有的下站,接受传入参数的是当前站，抓出来的是下站
         #161109-00085#55-s
         #LET l_sql = " SELECT sfcb_t.* FROM sfcb_t,sfcc_t ",  
         LET l_sql = " SELECT sfcbent,sfcbsite,sfcbdocno,sfcb001,sfcb002,
                              sfcb003,sfcb004,sfcb005,sfcb006,sfcb007,
                              sfcb008,sfcb009,sfcb010,sfcb011,sfcb012,
                              sfcb013,sfcb014,sfcb015,sfcb016,sfcb017,
                              sfcb018,sfcb019,sfcb020,sfcb021,sfcb022,
                              sfcb023,sfcb024,sfcb025,sfcb026,sfcb027,
                              sfcb028,sfcb029,sfcb030,sfcb031,sfcb032,
                              sfcb033,sfcb034,sfcb035,sfcb036,sfcb037,
                              sfcb038,sfcb039,sfcb040,sfcb041,sfcb042,
                              sfcb043,sfcb044,sfcb045,sfcb046,sfcb047,
                              sfcb048,sfcb049,sfcb050,sfcb051,sfcb052,
                              sfcb053,sfcb054,sfcb055
                         FROM sfcb_t,sfcc_t ",
         #161109-00085#55-e         
                     "  WHERE sfcbent = sfccent AND sfcbdocno = sfccdocno ",
                     "    AND sfcb001 = sfcc001 ",
                     "    AND sfcb002 = sfcc002 ",
                     "    AND sfccent = ",g_enterprise,
                     "    AND sfccdocno = '",p_wo,"' ",    #单号
                     "    AND sfcc001 = '",p_runcard,"' ", #RUN CARD
                     "    AND sfcc003 = '",p_sfcb003,"' ", #上站作业编号=前一站转入的该站的：本站作业
                     "    AND sfcc004 = '",p_sfcb004,"' "  #上站作业序  =前一站转入的该站的：本站作业序
      END IF
   END IF
   PREPARE s_asft310_get_transfer_p FROM l_sql
   DECLARE s_asft310_get_transfer_c CURSOR FOR s_asft310_get_transfer_p
   
   LET l_row = 1

   FOREACH s_asft310_get_transfer_c INTO l_sfcb[l_row].*

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      LET l_row = l_row + 1
   END FOREACH
   LET l_row = l_row - 1
   
   IF l_row > 0 THEN
      #191108-00034#1 add-S
      IF l_row > 1 THEN    
         FOR l_i = 1 TO l_row 
             #平行工艺排序时，先将同阶的工艺排在一起，再排下阶的工艺
             SELECT COUNT(1) INTO l_cnt FROM s_asft335_sffbtmp
              WHERE sffbent = g_enterprise
                AND sffb005 = p_wo     #工单
                AND sffb006 = p_runcard  #runcard号
                AND sffb007 = l_sfcb[l_row].sfcb003 #作业 
                AND sffb008 = l_sfcb[l_row].sfcb004 #作业序  
             IF l_cnt > 0 THEN
                FOR l_cnt_i = 1 TO l_cnt   #考虑同作业+作业序分几笔报工的情况
                   LET g_seq = g_seq + 1
                   UPDATE s_asft335_sffbtmp SET sffbseq = g_seq
                    WHERE sffbent = g_enterprise
                      AND sffb005 = p_wo     #工单
                      AND sffb006 = p_runcard  #runcard号
                      AND sffb007 = l_sfcb[l_row].sfcb003 #作业   
                      AND sffb008 = l_sfcb[l_row].sfcb004 #作业序  
                      AND sffbseq > g_count  #尚未被更新过的
                      AND sffbseq = (SELECT MIN(sffbseq) FROM s_asft335_sffbtmp
                                      WHERE sffbent = g_enterprise
                                        AND sffb005 = p_wo     #工单
                                        AND sffb006 = p_runcard  #runcard号
                                        AND sffb007 = l_sfcb[l_row].sfcb003 #作业    
                                        AND sffb008 = l_sfcb[l_row].sfcb004 #作业序  
                                        AND sffbseq > g_count  #尚未被更新过的
                                    )
           
                  IF g_seq = g_count THEN  #代表已全更新完，不用继续匹配了
                     RETURN r_success
                  END IF
               END FOR
             END IF
          END FOR
             
          #递归找第下个工艺流
                                      #   单号                  run card            本站作业             作业序               群组                下站作业             下站作业序
          CALL s_asft335_deal_sffbtmp_round('1',l_sfcb[l_i].sfcbdocno,l_sfcb[l_i].sfcb001,l_sfcb[l_i].sfcb003,l_sfcb[l_i].sfcb004,l_sfcb[l_i].sfcb006,l_sfcb[l_i].sfcb009,l_sfcb[l_i].sfcb010)
             RETURNING l_success
          IF NOT l_success THEN
             LET r_success = FALSE
             RETURN r_success
          END IF
      ELSE
      #191108-00034#1 add-E
         FOR l_i = 1 TO l_row 
             #判断当站的作业+作业序是不是在sffbtmp中有，有就可以给予顺序了
             #注意，目前不支持张工单会有多个相同作业+作业序的存在，若有这样的资料，请前端卡控住
             SELECT COUNT(1) INTO l_cnt FROM s_asft335_sffbtmp  #161212-00020#1 星號調整
              WHERE sffbent = g_enterprise
                AND sffb005 = p_wo     #工单
                AND sffb006 = p_runcard  #runcard号
                AND sffb007 = l_sfcb[l_row].sfcb003 #作业    
                AND sffb008 = l_sfcb[l_row].sfcb004 #作业序  
             IF l_cnt > 0 THEN
                FOR l_cnt_i = 1 TO l_cnt   #考虑同作业+作业序分几笔报工的情况
                   LET g_seq = g_seq + 1
                   UPDATE s_asft335_sffbtmp SET sffbseq = g_seq
                    WHERE sffbent = g_enterprise
                      AND sffb005 = p_wo     #工单
                      AND sffb006 = p_runcard  #runcard号
                      AND sffb007 = l_sfcb[l_row].sfcb003 #作业    
                      AND sffb008 = l_sfcb[l_row].sfcb004 #作业序   
                      AND sffbseq > g_count  #尚未被更新过的
                      AND sffbseq = (SELECT MIN(sffbseq) FROM s_asft335_sffbtmp
                                      WHERE sffbent = g_enterprise
                                        AND sffb005 = p_wo     #工单
                                        AND sffb006 = p_runcard  #runcard号
                                        AND sffb007 = l_sfcb[l_row].sfcb003 #作业    
                                        AND sffb008 = l_sfcb[l_row].sfcb004 #作业序  
                                        AND sffbseq > g_count  #尚未被更新过的
                                    )
           
                  IF g_seq = g_count THEN  #代表已全更新完，不用继续匹配了
                     RETURN r_success
                  END IF
               END FOR
             END IF
             
             #递归找第下个工艺流
                                         #   单号                  run card            本站作业             作业序               群组                下站作业             下站作业序
             CALL s_asft335_deal_sffbtmp_round('1',l_sfcb[l_i].sfcbdocno,l_sfcb[l_i].sfcb001,l_sfcb[l_i].sfcb003,l_sfcb[l_i].sfcb004,l_sfcb[l_i].sfcb006,l_sfcb[l_i].sfcb009,l_sfcb[l_i].sfcb010)
                RETURNING l_success
             IF NOT l_success THEN
                LET r_success = FALSE
                RETURN r_success
             END IF
         END FOR
      END IF
   END IF   #191108-00034#1 add
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 接收批次報工(asft330)的單身項次
# Memo...........:
# Usage..........: CALL s_asft335_receive_sffbseq(p_sffadocno,p_sffadocno,p_sffbseq)
# Input parameter: p_sffadocno    單號
#                : p_sffbseq      項次
# Return code....: 
# Date & Author..: 2016/08/04 By dorislai (160804-00029#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_receive_sffbseq(p_sffadocno,p_sffbseq)
   DEFINE p_sffadocno LIKE sffa_t.sffadocno
   DEFINE p_sffbseq LIKE sffb_t.sffbseq
   
   LET g_sffadocno = p_sffadocno
   LET g_sffbseq = p_sffbseq
END FUNCTION

################################################################################
# Descriptions...: 產生完工入庫單(asft340)
# Memo...........: (參考asft340_sfeb001_reference寫法，以及參考裡面呼叫到的fuction)
# Usage..........: CALL s_asft335_gen_sfea(p_sfcbdocno,p_sfcb001)
#                  RETURNING r_success
# Input parameter: p_slip         單別(asft340的)
#                : p_sfcbdocno    工單單號
#                : p_sfcb001      RUN CARD
# Return code....: r_success      TRUE/FALSE
#                : r_sfebdocno    完工入庫單據
# Date & Author..: 2016/11/17 By dorislai (#160826-00025#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_gen_sfea(p_slip,p_sfcbdocno,p_sfcb001)
   DEFINE   r_success   LIKE  type_t.num5
   DEFINE   r_sfebdocno LIKE  sfeb_t.sfebdocno
   DEFINE   p_slip      STRING
   DEFINE   p_sfcbdocno LIKE  sfcb_t.sfcbdocno
   DEFINE   p_sfcb001   LIKE  sfcb_t.sfcb001
   DEFINE   l_cnt       LIKE  type_t.num5
   DEFINE   l_sql       STRING
   DEFINE   l_today     LIKE  sfea_t.sfeadocdt    #今天的日期
   DEFINE   l_success   LIKE  type_t.num5
   DEFINE   l_sfeacrtdt LIKE  sfea_t.sfeacrtdt    #資料創建日
   DEFINE   l_sfebseq   LIKE  sfeb_t.sfebseq      #項次
   DEFINE   l_chk       LIKE  type_t.num5
   DEFINE   l_count     LIKE  type_t.num5   #170228-00022#1 add
   DEFINE   l_sfeb      RECORD
            sfebdocno     LIKE  sfeb_t.sfebdocno, #完工入庫單號
            sfeb002       LIKE  sfeb_t.sfeb002,   #FQC否    
            sfeb003       LIKE  sfeb_t.sfeb003,   #入庫類型
            sfeb004       LIKE  sfeb_t.sfeb004,   #料件编号
            sfeb004_desc1 LIKE  imaal_t.imaal003, #品名
            sfeb004_desc2 LIKE  imaal_t.imaal004, #規格
            sfeb005       LIKE  sfeb_t.sfeb005,   #特徵值
            sfeb007       LIKE  sfeb_t.sfeb007,   #單位
            sfeb008       LIKE  sfeb_t.sfeb008,   #申請數量
            sfeb009       LIKE  sfeb_t.sfeb009,   #實際數量
            sfeb010       LIKE  sfeb_t.sfeb010,   #參考單位
            sfeb011       LIKE  sfeb_t.sfeb011,   #參考數量
            sfeb012       LIKE  sfeb_t.sfeb012,   #實際參考數量
            sfeb013       LIKE  sfeb_t.sfeb013,   #庫位
            sfeb014       LIKE  sfeb_t.sfeb014,   #儲位
            sfeb015       LIKE  sfeb_t.sfeb015,   #批號
            sfeb017       LIKE  sfeb_t.sfeb017,   #專案代號
            sfeb018       LIKE  sfeb_t.sfeb018,   #WBS
            sfeb019       LIKE  sfeb_t.sfeb019,   #活動代號
            sfeb021       LIKE  sfeb_t.sfeb021,   #置有效日期
            sfeb026       LIKE  sfeb_t.sfeb026,   #RUN CARD
            sfeb027       LIKE  sfeb_t.sfeb027    #檢驗合格量
         END RECORD
   DEFINE   l_sfaa      RECORD
            sfaa003       LIKE  sfaa_t.sfaa003,   #工單類型   #170228-00022#1 add
            sfaa028       LIKE  sfaa_t.sfaa028,   #專案編號
            sfaa029       LIKE  sfaa_t.sfaa029,   #WBS
            sfaa030       LIKE  sfaa_t.sfaa030,   #活動
            sfaa034       LIKE  sfaa_t.sfaa034,   #庫位
            sfaa035       LIKE  sfaa_t.sfaa035,   #儲位
            sfaa059       LIKE  sfaa_t.sfaa059    #批號
         END RECORD
         
#180716-00017#1---s--
   DEFINE l_imaf062        LIKE imaf_t.imaf062
   DEFINE l_imaf063        LIKE imaf_t.imaf063
   DEFINE l_imaf061        LIKE imaf_t.imaf061
   DEFINE l_sfaa010        LIKE sfaa_t.sfaa010
   DEFINE l_oofg_return DYNAMIC ARRAY OF RECORD    
             oofg019     LIKE oofg_t.oofg019,   #field
             oofg020     LIKE oofg_t.oofg020    #value
                     END RECORD
#180716-00017#1---e--         
   
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET l_cnt = 0
   LET l_chk = FALSE
   LET l_today = cl_get_today()
   #191128-00064#1---add----str---
   #由asft335[產生完工入庫單]才會有g_maxd
   IF NOT cl_null(g_maxd) AND l_today < g_maxd THEN
       LET l_today = g_maxd
   END IF
   #191128-00064#1---add----end---
   
   #檢查：應在transation中
   IF NOT s_transaction_chk('Y','0') THEN
      RETURN r_success
   END IF
   
   #檢查
   IF cl_null(p_sfcbdocno) THEN
      #傳入單據編號為空;請指定單據編號!
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00228'
      LET g_errparam.extend = p_sfcbdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_sfaa.* TO NULL
   INITIALIZE l_sfeb.* TO NULL
   
   #--自動產生單據
   CALL s_aooi200_gen_docno(g_site,p_slip,l_today,'asft340') RETURNING l_success,l_sfeb.sfebdocno
   LET r_sfebdocno = l_sfeb.sfebdocno
   IF NOT l_success THEN
      #170228-00022#1-s-add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #170228-00022#1-e-add
      LET r_sfebdocno = ''
      LET r_success = FALSE
      RETURN r_success,r_sfebdocno
   END IF
   
   #抓取sfaa_t的資料(asft300)
   #170228-00022#1-s-mod   新增sfaa003
#   SELECT sfaa028,sfaa029,sfaa030,sfaa034,sfaa035,sfaa059 
#     INTO l_sfaa.sfaa028,l_sfaa.sfaa029,l_sfaa.sfaa030,l_sfaa.sfaa034,l_sfaa.sfaa035,l_sfaa.sfaa059
   SELECT sfaa003,sfaa028,sfaa029,sfaa030,sfaa034,sfaa035,sfaa059 
     INTO l_sfaa.sfaa003,l_sfaa.sfaa028,l_sfaa.sfaa029,l_sfaa.sfaa030,l_sfaa.sfaa034,l_sfaa.sfaa035,l_sfaa.sfaa059  
   #170228-00022#1-e-mod
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = p_sfcbdocno

   #170228-00022#1-s-mod
   #sfeb003  -入庫類型，預設=1:一般
   LET l_sfeb.sfeb003 = '1'   
   CASE l_sfaa.sfaa003 
      WHEN '1'   #一般工单
         #多产出主件个数
         SELECT COUNT(1) INTO l_cnt FROM sfac_t
         WHERE sfacent   = g_enterprise
           AND sfacsite  = g_site
           AND sfacdocno = p_sfcbdocno
           AND sfac002   = '3'
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 0 THEN                   
            LET l_sfeb.sfeb003 = '3'  #多产出主件
         ELSE
            LET l_sfeb.sfeb003 = '1'  #一般          
         END IF         
      
      WHEN '3'   #拆件式工单
         LET l_sfeb.sfeb003 = '4'   #拆件式 
         
   END CASE
   #170228-00022#1-e-mod
        
   #sfeb002  -FQC否
   SELECT sfaa044 INTO l_sfeb.sfeb002 FROM sfaa_t                                           
    WHERE sfaaent   = g_enterprise                                                     
      AND sfaasite  = g_site                                                
      AND sfaadocno = p_sfcbdocno  
        
   #sfeb017  -專案代號
   LET l_sfeb.sfeb017 = l_sfaa.sfaa028
   
   #sfeb018  -WBS
   LET l_sfeb.sfeb018 = l_sfaa.sfaa029
   
   #sfeb019  -活動代號
   LET l_sfeb.sfeb019 = l_sfaa.sfaa030
   
   #sfeb026  -RUN CARD
   LET l_sfeb.sfeb026 = p_sfcb001
   
   #資料創建日
   LET l_sfeacrtdt = cl_get_current()   
   
   #sfeb004/sfeb005/sfeb007/sfeb010  -料件编号/產品特徵/單位/參考單位
   LET l_sql = " SELECT sfac001,COALESCE(sfac006,' '),sfac004, ",
               "        (SELECT imaf015 FROM imaf_t WHERE imafent='",g_enterprise,"' AND imafsite='",g_site,"' AND imaf001=sfac001) imaf015 ",
               "   FROM sfac_t ",
               "  WHERE sfacent   = '",g_enterprise,"' ",
               "    AND sfacsite  = '",g_site,"' ",
               "    AND sfacdocno = '",p_sfcbdocno,"' ",
               "    AND sfac002   = '",l_sfeb.sfeb003,"' "        
   PREPARE s_asft335_sfac_pre FROM l_sql
   DECLARE s_asft335_sfac_cur CURSOR FOR s_asft335_sfac_pre
   LET l_count = 0   #170228-00022#1 add
   FOREACH s_asft335_sfac_cur INTO l_sfeb.sfeb004,l_sfeb.sfeb005,l_sfeb.sfeb007,l_sfeb.sfeb010
      #170228-00022#1-s-add
      LET l_count = l_count + 1
      #170523-00038#1 mark(s)  如果料件不适用参考单位,则不要预设
#      IF cl_null(l_sfeb.sfeb010) THEN
#         LET l_sfeb.sfeb010 = l_sfeb.sfeb007
#      END IF
      #170523-00038#1 mark(e)
      #170228-00022#1-e-add
      #---品名、規格
      CALL s_desc_get_item_desc(l_sfeb.sfeb004) RETURNING l_sfeb.sfeb004_desc1,l_sfeb.sfeb004_desc2
      #---sfeb013/sfeb014/sfeb015  -庫/儲/批
      CALL s_asft340_set_warehouses(p_sfcbdocno,l_sfeb.sfeb004,l_sfaa.sfaa034,l_sfaa.sfaa035,l_sfaa.sfaa059)  
          RETURNING l_sfeb.sfeb013,l_sfeb.sfeb014,l_sfeb.sfeb015
      
      #180716-00017#1 add
      LET l_imaf061 = ''
      LET l_imaf062 = ''
      LET l_imaf063 = ''
      
      SELECT sfaa010 INTO l_sfaa010
        FROM sfaa_t 
       WHERE sfaaent = g_enterprise 
         AND sfaadocno = p_sfcbdocno 
        #AND sfaa001 = p_sfcb001 #200615-00010#1 ==>這一行需mark掉,sfaa001是變更版本,sfcb001是RUN CARD 不一樣的
      
      SELECT imaf061,imaf062,imaf063 INTO l_imaf061,l_imaf062,l_imaf063 
         FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = l_sfaa010
      
      IF cl_null(l_sfeb.sfeb015) AND l_imaf061 = '1' AND l_imaf062 = 'Y' AND (NOT cl_null(l_imaf063)) THEN
         CALL s_aooi390_gen_1('6',l_imaf063) RETURNING l_success,l_sfeb.sfeb015,l_oofg_return
         IF NOT l_success THEN
            LET l_sfeb.sfeb015 = ''
         ELSE
            CALL s_aooi390_get_auto_no('6',l_sfeb.sfeb015) RETURNING l_success,l_sfeb.sfeb015
            CALL s_aooi390_oofi_upd('6',l_sfeb.sfeb015) RETURNING l_success
         END IF
      END IF
      
      #180716-00017#1 end

      #---sfeb008/sfeb009/sfeb027  -申請數量/實際數量/檢驗合格量
      CALL s_asft335_set_sfeb008(p_sfcbdocno,l_sfeb.sfeb002,l_sfeb.sfeb003,l_sfeb.sfeb004,l_sfeb.sfeb005,l_sfeb.sfeb007,l_sfeb.sfeb026)
          RETURNING l_sfeb.sfeb008,l_sfeb.sfeb009,l_sfeb.sfeb027
      #---sfeb011  -參考數量
      IF NOT cl_null(l_sfeb.sfeb008) AND NOT cl_null(l_sfeb.sfeb007) AND NOT cl_null(l_sfeb.sfeb010) THEN
         CALL s_aooi250_convert_qty1(l_sfeb.sfeb004,l_sfeb.sfeb007,l_sfeb.sfeb010,l_sfeb.sfeb008)
              RETURNING l_success,l_sfeb.sfeb011
         IF NOT l_success THEN
            LET l_sfeb.sfeb011 = l_sfeb.sfeb008
         END IF  
      ELSE
#         LET l_sfeb.sfeb011 = l_sfeb.sfeb008  #170523-00038#1 mark  
      END IF
      IF NOT cl_null(l_sfeb.sfeb010) THEN #170523-00038#1 add
         CALL s_aooi250_take_decimals(l_sfeb.sfeb010,l_sfeb.sfeb011)
              RETURNING l_success,l_sfeb.sfeb011
         #---實際參考數量 
         IF l_sfeb.sfeb002 = 'N' THEN
            LET l_sfeb.sfeb012 = l_sfeb.sfeb011
         ELSE
            LET l_sfeb.sfeb012 = 0  
         END IF
      END IF   #170523-00038#1 add                              
      #---sfeb021  -置有效日期
      CALL s_aini010_calculate_effdt(g_site,l_sfeb.sfeb004,l_sfeb.sfeb005,l_sfeb.sfeb015,l_today) RETURNING l_sfeb.sfeb021
      #申請數量>0，才產生完工入庫單
      IF l_sfeb.sfeb008 > 0 THEN
         #建立單身
         IF NOT cl_null(l_sfeb.sfebdocno) THEN
            LET l_sfebseq = ''
            SELECT MAX(sfebseq)+1 INTO l_sfebseq
              FROM sfeb_t
             WHERE sfebent = g_enterprise AND sfebsite = g_site AND sfebdocno = l_sfeb.sfebdocno
            IF cl_null(l_sfebseq) OR l_sfebseq = 0 THEN
               LET l_sfebseq = 1
            END IF
            INSERT INTO sfeb_t(sfebent,sfebsite,sfebdocno,sfebseq,sfeb001,sfeb026,sfeb002,sfeb003,sfeb004,sfeb005,
                               sfeb007,sfeb008,sfeb009,sfeb010,sfeb011,sfeb012,sfeb013,sfeb014,sfeb015,sfeb017,
                               sfeb018,sfeb019,sfeb021,sfeb027)
                   VALUES(g_enterprise,g_site,l_sfeb.sfebdocno,l_sfebseq,p_sfcbdocno,p_sfcb001,l_sfeb.sfeb002,l_sfeb.sfeb003,l_sfeb.sfeb004,l_sfeb.sfeb005,
                          l_sfeb.sfeb007,l_sfeb.sfeb008,l_sfeb.sfeb009,l_sfeb.sfeb010,l_sfeb.sfeb011,l_sfeb.sfeb012,l_sfeb.sfeb013,l_sfeb.sfeb014,l_sfeb.sfeb015,l_sfeb.sfeb017,
                          l_sfeb.sfeb018,l_sfeb.sfeb019,l_sfeb.sfeb021,l_sfeb.sfeb027)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfeb_t:",SQLERRMESSAGE 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
            ELSE   
               #完工入庫(aft340)-非FQC，才產生入庫明細
               IF l_sfeb.sfeb002 = 'N' THEN
                  INSERT INTO sfec_t(sfecent,sfecsite,sfecdocno,sfecseq,sfecseq1,sfec001,sfec002,sfec003,sfec004,sfec005,sfec006,
                                     sfec008,sfec009,sfec010,sfec011,sfec012,sfec013,sfec014,sfec021,sfec022,sfec023,sfec024,sfec016)
                         VALUES(g_enterprise,g_site,l_sfeb.sfebdocno,l_sfebseq,1,p_sfcbdocno,'','',l_sfeb.sfeb003,l_sfeb.sfeb004,l_sfeb.sfeb005,
                                l_sfeb.sfeb007,l_sfeb.sfeb008,l_sfeb.sfeb010,l_sfeb.sfeb011,l_sfeb.sfeb013,l_sfeb.sfeb014,l_sfeb.sfeb015,p_sfcb001,
                                l_sfeb.sfeb017,l_sfeb.sfeb018,l_sfeb.sfeb019,l_sfeb.sfeb021)
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfec_t:",SQLERRMESSAGE 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  ELSE
                     LET l_chk = TRUE
                  END IF
               ELSE
                  LET l_chk = TRUE
               END IF
            END IF
         END IF
      ELSE
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ''
         LET g_errparam.code   = 'asf-00811' #工單單號：%1，料號,：%2，申請數量=0，不產生完工入庫單！
         LET g_errparam.popup  = TRUE 
         LET g_errparam.replace[1] = p_sfcbdocno
         LET g_errparam.replace[2] = l_sfeb.sfeb004
         LET r_success = FALSE
         CALL cl_err()
      END IF
   END FOREACH
   #建立單頭
   IF l_chk AND NOT cl_null(l_sfeb.sfebdocno) THEN
      INSERT INTO sfea_t (sfeaent,sfeasite,sfeadocno,sfeadocdt,sfea001,sfea002,sfea003,sfeastus,
                          sfeaownid,sfeaowndp,sfeacrtid,sfeacrtdp,sfeacrtdt,sfeamodid,sfeamoddt)
             VALUES (g_enterprise,g_site,l_sfeb.sfebdocno,l_today,l_today,g_user,g_dept,'N',
                     g_user,g_dept,g_user,g_dept,l_sfeacrtdt,g_user,l_sfeacrtdt)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfea_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         LET r_success = FALSE
         CALL cl_err()
      END IF
   ELSE
      #170228-00022#1-s-add
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = p_sfcbdocno
      LET g_errparam.code   = 'asf-00837'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      #170228-00022#1-e-add
      LET r_success = FALSE
   END IF
   
   RETURN r_success,r_sfebdocno
END FUNCTION

################################################################################
# Descriptions...: 預設sfeb008值
# Memo...........:
# Usage..........: CALL s_asft335_set_sfeb008(p_sfeb001,p_sfeb002,p_sfeb003,p_sfeb004,p_sfeb005,p_sfeb007,p_sfeb026)
#                  RETURNING NULL
# Input parameter: p_sfeb001  #工單單號
#                : p_sfeb002  #FQC
#                : p_sfeb003  #入庫類型
#                : p_sfeb004  #料件編號
#                : p_sfeb005  #特徵
#                : p_sfeb007  #單位
#                : p_sfeb026  #RUN CARD
# Return code....: r_sfeb008  #申請數量
#                : r_sfeb009  #實際數量
#                : r_sfeb027  #檢驗合格量
# Date & Author..: 2016/11/17 By dorislai (#160826-00025#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_set_sfeb008(p_sfeb001,p_sfeb002,p_sfeb003,p_sfeb004,p_sfeb005,p_sfeb007,p_sfeb026)
   DEFINE l_qty1        LIKE sfeb_t.sfeb009
   DEFINE l_qty2        LIKE sfeb_t.sfeb009 
   DEFINE l_sfac004     LIKE sfac_t.sfac004
   DEFINE l_rate        LIKE inaj_t.inaj014   #單位轉換率
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_sfeb008     LIKE sfeb_t.sfeb008   #單位取位過的數量
   DEFINE l_imaa005     LIKE imaa_t.imaa005   #是否有產品特徵的功能
   DEFINE l_today       LIKE sfea_t.sfeadocdt #今天的日期
   DEFINE p_sfeb001     LIKE sfeb_t.sfeb001
   DEFINE p_sfeb002     LIKE sfeb_t.sfeb002
   DEFINE p_sfeb003     LIKE sfeb_t.sfeb003
   DEFINE p_sfeb004     LIKE sfeb_t.sfeb004
   DEFINE p_sfeb005     LIKE sfeb_t.sfeb005
   DEFINE p_sfeb007     LIKE sfeb_t.sfeb007
   DEFINE p_sfeb026     LIKE sfeb_t.sfeb026
   DEFINE r_sfeb008     LIKE sfeb_t.sfeb008
   DEFINE r_sfeb009     LIKE sfeb_t.sfeb009
   DEFINE r_sfeb027     LIKE sfeb_t.sfeb027
   
   LET r_sfeb008 = 0
   LET r_sfeb009 = 0
   LET r_sfeb027 = 0
   LET l_today = cl_get_today()
   #191128-00064#1---add----str---
   #由asft335[產生完工入庫單]才會有g_maxd
   IF NOT cl_null(g_maxd) AND l_today < g_maxd THEN
       LET l_today = g_maxd
   END IF
   #191128-00064#1---add----end---
   
   IF cl_null(p_sfeb001) OR cl_null(p_sfeb026) OR cl_null(p_sfeb004) OR cl_null(p_sfeb007) THEN
      RETURN
   ELSE
      #170410-00029#1-s mark
      ##判斷料件是否存在產品特徵
      #LET l_imaa005 = ''
      #SELECT imaa005 INTO l_imaa005 FROM imaa_t 
      # WHERE imaaent = g_enterprise AND imaa001 = p_sfeb004
      #IF NOT cl_null(l_imaa005) THEN
      #   IF cl_null(p_sfeb005) THEN
      #      RETURN r_sfeb008,r_sfeb009,r_sfeb027
      #   END IF
      #END IF
      #170410-00029#1-e mark
   END IF

   #l_qty1 可入庫的數量 BY 工單單位
#180724-00011#1 -s mark
#  CALL s_asft340_avariable_store_in_qty_1('2',p_sfeb001,p_sfeb026,p_sfeb004,p_sfeb005,p_sfeb007,l_today,0,0) RETURNING l_qty1  #170517-00009#1 mod '1'--->'2'
#180724-00011#1 -e mark
#180724-00011#1 -s add
   #一般與聯產品可以CALL s_asft340_avariable_store_in_qty_1,
   #但多產出應該使用CALL s_asft340_avariable_store_in_qty_2
   CASE p_sfeb003
      WHEN '1'  #一般
         CALL s_asft340_avariable_store_in_qty_1('2',p_sfeb001,p_sfeb026,p_sfeb004,p_sfeb005,
                                                     p_sfeb007,l_today,0,0)
            RETURNING l_qty1
      WHEN '2'  #联产品
         CALL s_asft340_avariable_store_in_qty_1('2',p_sfeb001,p_sfeb026,p_sfeb004,p_sfeb005,
                                                     p_sfeb007,l_today,0,0)
            RETURNING l_qty1
      WHEN '3'  #多产出主件
         CALL s_asft340_avariable_store_in_qty_2('2',p_sfeb001,p_sfeb026,p_sfeb004,p_sfeb005,
                                                     p_sfeb007,l_today,0,0)
            RETURNING l_qty1
   END CASE
#180724-00011#1 -e add

   IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF

   #l_qty2 可入庫的數量 BY 入庫單位
   #取生產單位
   SELECT sfac004 INTO l_sfac004 FROM sfac_t
    WHERE sfacent   = g_enterprise
      AND sfacdocno = p_sfeb001
      AND sfac001   = p_sfeb004
      AND sfac006   = p_sfeb005
   IF SQLCA.sqlcode THEN
      LET l_qty2 = l_qty1
   ELSE
      IF p_sfeb007 <> l_sfac004 THEN
         CALL s_aooi250_convert_qty1(p_sfeb004,l_sfac004,p_sfeb007,l_qty1)
              RETURNING l_success,l_qty2
         IF NOT l_success THEN
            LET l_qty2 = l_qty1
         END IF
      ELSE
         LET l_qty2 = l_qty1
      END IF   
   END IF
   
   CALL s_aooi250_take_decimals(p_sfeb007,l_qty2)
        RETURNING l_success,l_sfeb008
        
   LET r_sfeb008 = l_sfeb008
   IF p_sfeb002 = 'N' THEN
      LET r_sfeb009 = l_sfeb008
      LET r_sfeb027 = l_sfeb008
   ELSE
      LET r_sfeb009 = 0  
      LET r_sfeb027 = 0
   END IF
   
   RETURN r_sfeb008,r_sfeb009,r_sfeb027
   
END FUNCTION

################################################################################
# Descriptions...: 取得最後一個報工點
# Memo...........:
# Usage..........: CALL s_asft335_get_final_point()
#                  RETURNING r_point
# Input parameter: p_sfcbdocno    工單單號
#                : p_sfcb001      RUN CARD
# Return code....: r_point        1.Move in 2.Check in 3.報工 4.Check out 5.Move out 6.PQC
# Date & Author..: 2016/11/17 By dorislai (#160826-00025#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_final_point(p_sfcbdocno,p_sfcb001)
   DEFINE   p_sfcbdocno   LIKE   sfcb_t.sfcbdocno
   DEFINE   p_sfcb001     LIKE   sfcb_t.sfcb001
   DEFINE   r_point       LIKE   type_t.num5
#161212-00048#1-s mark
#   DEFINE   l_sfcb014     LIKE   sfcb_t.sfcb014  #Move in 
#   DEFINE   l_sfcb015     LIKE   sfcb_t.sfcb015  #Check in 
#   DEFINE   l_sfcb016     LIKE   sfcb_t.sfcb016  #報工
#   DEFINE   l_sfcb017     LIKE   sfcb_t.sfcb017  #PQC
#   DEFINE   l_sfcb018     LIKE   sfcb_t.sfcb018  #Check out
#   DEFINE   l_sfcb019     LIKE   sfcb_t.sfcb019  #Move out 
#   
#   LET l_sfcb014 = ''
#   LET l_sfcb015 = ''
#   LET l_sfcb016 = ''
#   LET l_sfcb017 = ''
#   LET l_sfcb018 = ''
#   LET l_sfcb019 = ''
#   LET r_point = 0
#   
#   SELECT sfcb014,sfcb015,sfcb016,sfcb017,sfcb018,sfcb019 
#     INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb017,l_sfcb018,l_sfcb019
#     FROM sfcb_t
#    WHERE sfcbent = g_enterprise
#      AND sfcbsite = g_site
#      AND sfcbdocno = p_sfcbdocno
#      AND sfcb001 = p_sfcb001
#      AND sfcb009 = 'END'
#      
#   #Move out 
#   IF l_sfcb019 = 'Y' THEN
#      LET r_point = '5'
#   END IF
#   
#   #Check out
#   IF l_sfcb018 = 'Y' AND r_point = 0 THEN
#      LET r_point = '4'
#   END IF
#   
#   #PQC   
#   IF l_sfcb017 = 'Y' AND r_point = 0 THEN
#      LET r_point = '6'
#   END IF
#   
#   #報工
#   IF l_sfcb016 = 'Y' AND r_point = 0 THEN
#      LET r_point = '3'
#   END IF
#   
#   #Check in 
#   IF l_sfcb015 = 'Y' AND r_point = 0 THEN
#      LET r_point = '2'
#   END IF
#   #Move in 
#   IF l_sfcb014 = 'Y' AND r_point = 0 THEN
#      LET r_point = '1'
#   END IF
#161212-00048#1-e mark
   
   RETURN r_point
END FUNCTION

################################################################################
# Descriptions...: 工單結案其他相關單據不可以異動
# Memo...........:
# Usage..........: CALL s_asft335_sfaastus_chk(p_sfaadocno)
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: #161212-00033#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_sfaastus_chk(p_sfaadocno)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE r_success    LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5

   LET r_success = TRUE
   
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfaadocno
      AND sfaastus IN ('C','E','M')
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00264'
      LET g_errparam.extend = p_sfaadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 产生倒扣领料单
# Memo...........:
# Usage..........: s_asft335_gen_sfda(p_sffbdocno)
#                  RETURNING r_success
# Input parameter: p_sffbdocno  报工单号   
# Return code....: r_success   trye/false   
# Date & Author..: 2017/03/16 By xujing
# Modify.........: 161031-00014#1
################################################################################
PUBLIC FUNCTION s_asft335_gen_sfda(p_sffbdocno,p_sffbseq,p_docno,p_date)
   DEFINE p_sffbdocno     LIKE sffb_t.sffbdocno 
   DEFINE p_sffbseq       LIKE sffb_t.sffbseq
   DEFINE p_docno         LIKE sfda_t.sfdadocno
   DEFINE p_date          LIKE sfda_t.sfdadocdt
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_start_no      LIKE sfda_t.sfdadocno
   DEFINE r_end_no        LIKE sfda_t.sfdadocno
   DEFINE l_sql           STRING   
   #161109-00085#51-s
   #DEFINE l_sfba          RECORD LIKE sfba_t.*
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
       sfbaud001 LIKE sfba_t.sfbaud001, #自定義欄位(文字)001
       sfbaud002 LIKE sfba_t.sfbaud002, #自定義欄位(文字)002
       sfbaud003 LIKE sfba_t.sfbaud003, #自定義欄位(文字)003
       sfbaud004 LIKE sfba_t.sfbaud004, #自定義欄位(文字)004
       sfbaud005 LIKE sfba_t.sfbaud005, #自定義欄位(文字)005
       sfbaud006 LIKE sfba_t.sfbaud006, #自定義欄位(文字)006
       sfbaud007 LIKE sfba_t.sfbaud007, #自定義欄位(文字)007
       sfbaud008 LIKE sfba_t.sfbaud008, #自定義欄位(文字)008
       sfbaud009 LIKE sfba_t.sfbaud009, #自定義欄位(文字)009
       sfbaud010 LIKE sfba_t.sfbaud010, #自定義欄位(文字)010
       sfbaud011 LIKE sfba_t.sfbaud011, #自定義欄位(數字)011
       sfbaud012 LIKE sfba_t.sfbaud012, #自定義欄位(數字)012
       sfbaud013 LIKE sfba_t.sfbaud013, #自定義欄位(數字)013
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
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035  #SET替代套數
   END RECORD
   #161109-00085#51-e
   DEFINE l_qty           LIKE sfeb_t.sfeb009   #主件的入库数量
   DEFINE l_sfeb003       LIKE sfeb_t.sfeb003
   DEFINE l_sfeb004       LIKE sfeb_t.sfeb004
   DEFINE l_sfeb005       LIKE sfeb_t.sfeb005
   DEFINE l_sfdadocno     LIKE sfda_t.sfdadocno
   #161109-00085#51-s
   #DEFINE l_sfac          RECORD LIKE sfac_t.*
   DEFINE l_sfac RECORD  #工單聯產品檔
       sfacent LIKE sfac_t.sfacent, #企業編號
       sfacsite LIKE sfac_t.sfacsite, #營運據點
       sfacdocno LIKE sfac_t.sfacdocno, #單號
       sfac001 LIKE sfac_t.sfac001, #料件編號
       sfac002 LIKE sfac_t.sfac002, #類型
       sfac003 LIKE sfac_t.sfac003, #預計產出量
       sfac004 LIKE sfac_t.sfac004, #單位
       sfac005 LIKE sfac_t.sfac005, #實際產出數量
       sfacseq LIKE sfac_t.sfacseq, #項次
       sfac006 LIKE sfac_t.sfac006, #產品特徵
       sfac007 LIKE sfac_t.sfac007  #保稅否
   END RECORD
   #161109-00085#51-e
   DEFINE l_sfaa012       LIKE sfaa_t.sfaa012
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_rate          LIKE type_t.num20_6
   #161104-00032#1 add---------s---------
   DEFINE l_sfaastus      LIKE sfaa_t.sfaastus     
   DEFINE l_count_Y       LIKE  type_t.num5        # 入库单所有工单计数
   DEFINE l_count_N       LIKE  type_t.num5        # 入库单所有已结案工单计数
   #180716-00043#1 add --s
   DEFINE l_sffb_qty      LIKE sffb_t.sffb017   #已報工數量
   DEFINE l_qty_o         LIKE sfeb_t.sfeb009   #主件的入库数量
   #180716-00043#1 add --e
   #161104-00032#1 add--------e----------   
   DEFINE l_sffb RECORD  #单笔工艺报工档
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030, #成本中心
       sffb031 LIKE sffb_t.sffb031  #倒扣領料單號
END RECORD
#181008-00005#1 add --(S)--
   DEFINE l_sfcb021       LIKE sfcb_t.sfcb021   #單位轉換率分子(轉出)
   DEFINE l_sfcb022       LIKE sfcb_t.sfcb022   #單位轉換率分母(轉出)
   DEFINE l_sfcb027       LIKE sfcb_t.sfcb027   #標準產出量
#181008-00005#1 add --(E)--
   DEFINE l_count         LIKE type_t.num5      #200708-00073#1 add   
   
   LET r_success  = FALSE
   LET r_start_no = ''
   LET r_end_no   = '' 
   #161104-00032#1 add------s------
   LET l_count_Y=0
   LET l_count_N=0
   #161104-00032#1 add------e------

   #1.插入发料单单头
   CALL s_asft335_gen_14_ins_sfda(p_sffbdocno,p_sffbseq,p_docno,p_date)
        RETURNING l_success,l_sfdadocno
   IF NOT l_success THEN
      RETURN r_success,r_start_no,r_end_no
   END IF
   
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,
          sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,sffb030,sffb031
     INTO l_sffb.* FROM sffb_t
    WHERE sffbent = g_enterprise
      AND sffbdocno = p_sffbdocno
      AND sffbseq = p_sffbseq
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 's_asft340_gen_14_cs1'
       LET g_errparam.popup = TRUE
       CALL cl_err()
     
       RETURN r_success,r_start_no,r_end_no
    END IF
    LET l_qty = l_sffb.sffb017 +  l_sffb.sffb018 +  l_sffb.sffb019 +  l_sffb.sffb020
    LET l_qty_o = l_qty   #180716-00043#1 add 備份舊值，因為FOREACH裡面的l_qty的值會被蓋掉
   #2.插入发料单需求档
   #170921-00006#1 mark --s
   #DECLARE s_asft340_gen_14_cs1 CURSOR FOR
   # #161109-00085#51-s
   # #SELECT sfba_t.*,sfeb009,sfeb003,sfeb004,sfeb005 FROM sfeb_t,sfba_t
   # SELECT sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,
   #        sfba006,sfba007,sfba008,sfba009,sfba010,sfba011,sfba012,sfba013,sfba014,sfba015,
   #        sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025,
   #        sfba026,sfba027,sfba028,sfba029,sfba030,sfbaud001,sfbaud002,sfbaud003,sfbaud004,
   #        sfbaud005,sfbaud006,sfbaud007,sfbaud008,sfbaud009,sfbaud010,sfbaud011,sfbaud012,sfbaud013,
   #        sfbaud014,sfbaud015,sfbaud016,sfbaud017,sfbaud018,sfbaud019,sfbaud020,sfbaud021,sfbaud022,
   #        sfbaud023,sfbaud024,sfbaud025,sfbaud026,sfbaud027,sfbaud028,sfbaud029,sfbaud030,
   #        sfba031,sfba032,sfba033,sfba034,sfba035
   #        #sfeb009,sfeb003,sfeb004,sfeb005
   #        
   #   FROM sffb_t,sfba_t
   # #161109-00085#51-e
   #  WHERE sffbent = sfbaent AND sffbent = g_enterprise
   #    AND sffbdocno = p_sffbdocno     #报工单号
   #    AND sffbseq = p_sffbseq      #报工项次
   #    AND sffb005 = sfbadocno      #工单
   #    AND sfba009 = 'Y'            #倒扣料否
   #    AND sfba013 > 0              #应发量
   #   #AND sffb007 = sfba003  #170420-00028#1 mark
   #   #AND sffb008 = sfba004  #170420-00028#1 mark
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = SQLCA.sqlcode
   #   LET g_errparam.extend = p_docno
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   RETURN r_success,r_start_no,r_end_no
   #END IF
   #170921-00006#1 mark --e
       
   #161109-00085#51-s
   #FOREACH s_asft340_gen_14_cs1 INTO l_sfba.*,l_qty,l_sfeb003,l_sfeb004,l_sfeb005
   #170921-00006#1 add --s
   IF cl_null(l_sffb.sffb007) AND cl_null(l_sffb.sffb008) THEN
      LET l_sql = " SELECT sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,",
                  "        sfba006,sfba007,sfba008,sfba009,sfba010,sfba011,sfba012,sfba013,sfba014,sfba015, ",
                  "        sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025, ",
                  "        sfba026,sfba027,sfba028,sfba029,sfba030,sfbaud001,sfbaud002,sfbaud003,sfbaud004, ",
                  "        sfbaud005,sfbaud006,sfbaud007,sfbaud008,sfbaud009,sfbaud010,sfbaud011,sfbaud012,sfbaud013, ",
                  "        sfbaud014,sfbaud015,sfbaud016,sfbaud017,sfbaud018,sfbaud019,sfbaud020,sfbaud021,sfbaud022, ",
                  "        sfbaud023,sfbaud024,sfbaud025,sfbaud026,sfbaud027,sfbaud028,sfbaud029,sfbaud030, ",
                  "        sfba031,sfba032,sfba033,sfba034,sfba035",
                  "   FROM sffb_t,sfba_t",
                  "  WHERE sffbent = sfbaent AND sffbent = ",g_enterprise,"",
                  "    AND sffbdocno = '",p_sffbdocno,"' ",   #报工单号
                  "    AND sffbseq = ",p_sffbseq,"",          #报工项次
                  "    AND sffb005 = sfbadocno",              #工单 
                  "    AND sfba009 = 'Y'",                    #倒扣料否
                  "    AND sfba008 != '4'",                   #必要特性,非参考材料   #190801-00003#1 add
                  "    AND sfba013 > 0"                       #应发量
   ELSE
      LET l_sql = "SELECT sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,",
                  "       sfba006,sfba007,sfba008,sfba009,sfba010,sfba011,sfba012,sfba013,sfba014,sfba015,",
                  "       sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025,",
                  "       sfba026,sfba027,sfba028,sfba029,sfba030,sfbaud001,sfbaud002,sfbaud003,sfbaud004,",
                  "       sfbaud005,sfbaud006,sfbaud007,sfbaud008,sfbaud009,sfbaud010,sfbaud011,sfbaud012,sfbaud013,",
                  "       sfbaud014,sfbaud015,sfbaud016,sfbaud017,sfbaud018,sfbaud019,sfbaud020,sfbaud021,sfbaud022,",
                  "       sfbaud023,sfbaud024,sfbaud025,sfbaud026,sfbaud027,sfbaud028,sfbaud029,sfbaud030,",
                  "       sfba031,sfba032,sfba033,sfba034,sfba035",
                  "  FROM sffb_t,sfba_t",
                  " WHERE sffbent = sfbaent AND sffbent = ",g_enterprise,"",
                  "   AND sffbdocno = '",p_sffbdocno,"'",  #报工单号
                  "   AND sffbseq = ",p_sffbseq,"",      #报工项次
                  "   AND sffb005 = sfbadocno",            #工单
                  "   AND sfba009 = 'Y'",                  #倒扣料否
                  "   AND sfba008 != '4'",                 #必要特性,非参考材料   #190801-00003#1 add
                  "   AND sfba013 > 0",                    #应发量
                  "   AND sffb007 = sfba003",              #作業編號
                  "   AND sffb008 = sfba004"               #作業序
   END IF
   PREPARE s_asft340_gen_14_pb1 FROM l_sql
   DECLARE s_asft340_gen_14_cs1 CURSOR FOR s_asft340_gen_14_pb1                  
   #170921-00006#1 add --e
   FOREACH s_asft340_gen_14_cs1  
      INTO l_sfba.sfbaent,l_sfba.sfbasite,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
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
           l_sfba.sfba031,l_sfba.sfba032,l_sfba.sfba033,l_sfba.sfba034,l_sfba.sfba035       
#           l_qty,l_sfeb003,l_sfeb004,l_sfeb005
   #161109-00085#51-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 's_asft340_gen_14_cs1'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,r_start_no,r_end_no
      END IF
      #161104-00032#1 add------s-------
      LET l_count_Y=l_count_Y+1
      #工单已结案则不允许发料
      SELECT sfaastus INTO l_sfaastus FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfba.sfbadocno AND sfaasite=g_site
      IF l_sfaastus='C' OR l_sfaastus='M' THEN
         LET l_count_N=l_count_N+1
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00264'
         LET g_errparam.extend = l_sfba.sfbadocno
         LET g_errparam.popup = FALSE
         CALL cl_err()
         #DELETE FROM sfda_t WHERE sfdaent=g_enterprise AND sfdasite=g_site AND sfdadocno=l_sfdadocno  #170420-00028#1 mark
         CONTINUE FOREACH
      END IF
      
     #161104-00032#1 add------e-------            
      #若为多主件时，不能直接用入库的数量进行发备料
      #要按多主件入库的数量*(多主件预计生产数量/工单生产数量)，做为发料数量
#      IF l_sfeb003 MATCHES '[35]' THEN
#         #161109-00085#51-s
#         #SELECT * INTO l_sfac.* FROM sfac_t
#         SELECT sfacent,sfacsite,sfacdocno,sfac001,sfac002,
#                sfac003,sfac004,sfac005,sfacseq,sfac006,
#                sfac007
#           INTO l_sfac.sfacent,l_sfac.sfacsite,l_sfac.sfacdocno,l_sfac.sfac001,l_sfac.sfac002,
#                l_sfac.sfac003,l_sfac.sfac004,l_sfac.sfac005,l_sfac.sfacseq,l_sfac.sfac006,
#                l_sfac.sfac007 
#           FROM sfac_t
#         #161109-00085#51-e
#          WHERE sfacent = g_enterprise
#            AND sfacdocno = l_sfba.sfbadocno
#            AND sfac001   = l_sfeb004
#            AND sfac006   = l_sfeb005
#          SELECT sfaa012 INTO l_sfaa012 FROM sfaa_t
#           WHERE sfaaent = g_enterprise
#             AND sfaadocno = l_sfba.sfbadocno
#          #mod 150101
#          #LET l_rate = l_sfac.sfac003 / l_sfaa012
#          #IF cl_null(l_rate) THEN LET l_rate = 0 END IF
#          #LET l_qty = l_qty * l_rate
#          LET l_qty = l_qty *  l_sfac.sfac003 / l_sfaa012
#          IF cl_null(l_qty) THEN LET l_qty = 0 END IF
#          #mod 150101 end
#      END IF
      #180716-00043#1 add --s
      LET l_qty = l_qty_o  #還原舊值，因為FOREACH裡面的l_qty的值會被蓋掉
      #取得工單開單數量
      LET l_sfaa012 = 0
      SELECT sfaa012 INTO l_sfaa012 FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_sfba.sfbadocno
      IF cl_null(l_sfaa012) THEN LET l_sfaa012 = 0 END IF
      #取得已報工數量(包含本張單)
      LET l_sffb_qty = 0
      #181008-00005#1 add --(S)--
      #若有作業編號作業序時,只取該作業編號作業序的已報工量
      IF NOT cl_null(l_sffb.sffb007) AND NOT cl_null(l_sffb.sffb008) THEN
         SELECT SUM(sffb017)+SUM(sffb018)+SUM(sffb019)+SUM(sffb020) INTO l_sffb_qty #總報工數量
           FROM sffb_t
          WHERE sffbent = g_enterprise
            AND sffb005 = l_sffb.sffb005
            AND sffb006 = l_sffb.sffb006
            AND sffb007 = l_sffb.sffb007
            AND sffb008 = l_sffb.sffb008
            AND sffbstus = 'Y'
            
         #取出該製程的轉出分子,轉出分母,標準產出量    
         SELECT sfcb021,sfcb022,sfcb027
           INTO l_sfcb021,l_sfcb022,l_sfcb027
           FROM sfcb_t
          WHERE sfcbent = g_enterprise
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001 = l_sffb.sffb006
            AND sfcb003 = l_sffb.sffb007
            AND sfcb004 = l_sffb.sffb008    
               
      ELSE
      #181008-00005#1 add --(E)--
         SELECT SUM(sffb017)+SUM(sffb018)+SUM(sffb019)+SUM(sffb020) INTO l_sffb_qty #總報工數量
           FROM sffb_t
          WHERE sffbent = g_enterprise
            AND sffb005 = l_sffb.sffb005
            AND sffb006 = l_sffb.sffb006   #181008-00005#1 add 
            AND sffbstus = "Y"
            
         #181008-00005#1 add --(S)--
         SELECT sfcb021,sfcb022,sfcb027
           INTO l_sfcb021,l_sfcb022,l_sfcb027
           FROM sfcb_t
          WHERE sfcbent = g_enterprise
            AND sfcbdocno = l_sffb.sffb005
            AND sfcb001 = l_sffb.sffb006
         
         #若無作業編號作業序,則可能是非製程工單,因此轉出分子分母為1,標準產出量為生產數量
         IF sqlca.sqlcode THEN         
            LET l_sfcb021 = 1
            LET l_sfcb022 = 1
            LET l_sfcb027 = l_sfaa012
         END IF   
         #181008-00005#1 add --(E)--
      END IF   #181008-00005#1 add   
      IF cl_null(l_sffb_qty) THEN LET l_sffb_qty = 0 END IF
      #如果已報工數量 >= 工單開單數量→表示這是最後一張報工單
     #IF l_sffb_qty >= l_sfaa012 THEN   #181008-00005#1 mark
      IF l_sffb_qty >= l_sfcb027 THEN   #181008-00005#1 add   #總報工量跟标准产出量判断
         #發料數量應調整為:應發數量-已發數量
         LET l_qty = l_sfba.sfba013 - l_sfba.sfba016
      ELSE
         #發料數量應調整為:本次報工量/生產量*總應發量
         LET l_qty = l_qty /(l_sfcb021/l_sfcb022)   #181008-00005#1 add #報工量需經過轉出分子分母處理,才可與生產數量比較
         LET l_qty = l_qty / l_sfaa012 * l_sfba.sfba013
         IF l_sfba.sfba016 + l_qty > l_sfba.sfba013 THEN
            LET l_qty = l_sfba.sfba013 - l_sfba.sfba016
         END IF
      END IF
      IF l_qty < 0 THEN LET l_qty = 0 END IF
      #180716-00043#1 add --e
      #200708-00073#1---add----str---
      IF l_qty = 0 THEN
          CONTINUE FOREACH
      END IF
      #200708-00073#1---add----end---
      #插入发料单需求档
      CALL s_asft310_gen_14_ins_sfdc(l_qty,l_sfdadocno,l_sfba.*)
           RETURNING l_success
      IF NOT l_success THEN
         RETURN r_success,r_start_no,r_end_no
      END IF
  
   END FOREACH
    #200708-00073#1---add-----str---
   LET l_count = 0
   SELECT COUNT(1) INTO l_count FROM sfdc_t
    WHERE sfdcent = g_enterprise AND sfdcdocno = l_sfdadocno
   IF l_count = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00699'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      DELETE FROM sfda_t WHERE sfdaent=g_enterprise AND sfdadocno=l_sfdadocno
      RETURN r_success,r_start_no,r_end_no
   END IF
   #200708-00073#1---add-----end---
   #161104-00032#1 add-------s------------
   #如果完工入库单单身工单全部是倒扣料且已结案工单，则一开始产生的发料单单头资料为废资料，直接删除并退出 
   IF l_count_Y=l_count_N THEN
      #DELETE FROM sfda_t WHERE sfdaent=g_enterprise AND sfdasite=g_site AND sfdadocno=l_sfda.sfdadocno  #170420-00028#1 mark
      DELETE FROM sfda_t WHERE sfdaent=g_enterprise AND sfdasite=g_site AND sfdadocno=l_sfdadocno        #170420-00028#1 add
      RETURN r_success,r_start_no,r_end_no
   END IF
   #161104-00032#1 add-----e----------     
   #3.插入发料明细档
   CALL s_asft310_gen_14_ins_sfdd(l_sfdadocno)
        RETURNING l_success
   IF NOT l_success THEN
      RETURN r_success,r_start_no,r_end_no
   END IF   
      
   #4.插入需求汇总档
   CALL s_asft310_gen_14_ins_sfde(l_sfdadocno)
        RETURNING l_success
   IF NOT l_success THEN
      RETURN r_success,r_start_no,r_end_no
   END IF         
          
   #5.插入仓储批汇总档
   CALL s_asft310_gen_14_ins_sfdf(l_sfdadocno)
        RETURNING l_success
   IF NOT l_success THEN
      RETURN r_success,r_start_no,r_end_no
   END IF  

   #160913-00006#1-s
   #6.发料单审核
   #180817-00009#2 mark --s
   #確認段及過帳段移到主程式處理
   #CALL s_asft310_confirm_upd(l_sfdadocno)
   #     RETURNING l_success
   #IF NOT l_success THEN
   #   RETURN r_success,r_start_no,r_end_no
   #END IF
   ##7.发料单过帐
   #CALL s_asft310_post_upd(l_sfdadocno,p_date)
   #     RETURNING l_success
   #IF NOT l_success THEN
   #   RETURN r_success,r_start_no,r_end_no
   #END IF
   #180817-00009#2 mark --e
   #6.发料单审核  
#   IF s_asft310_confirm_upd(l_sfdadocno) THEN
#      #7.发料单过帐
#      IF NOT s_asft310_post_upd(l_sfdadocno,p_date) THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00831'
#         LET g_errparam.extend = 's_asft310_gen_14'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#      END IF
#   ELSE
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'axr-00310'
#      LET g_errparam.extend = 's_asft310_gen_14'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#   END IF
   #160913-00006#1-e
   
   #8.更新工单完工入库单 - sfea005(倒扣領料單號)
   UPDATE sffb_t SET sffb031 = l_sfdadocno
    WHERE sffbent = g_enterprise
      AND sffbdocno = p_sffbdocno
      AND sffbseq = p_sffbseq
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update sffb031'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_start_no,r_end_no
   END IF
    
   LET r_success = TRUE
   LET r_start_no = l_sfdadocno
   LET r_end_no = l_sfdadocno
   RETURN r_success,r_start_no,r_end_no  
END FUNCTION

################################################################################
# Descriptions...: 新增领料单单头
# Memo...........:
# Usage..........: CALL s_asft335_gen_14_ins_sfda(p_sffbdocno,p_sffbseq,p_docno,p_date) 
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/03/16 By xujing
# Modify.........: #161031-00014#1
################################################################################
PUBLIC FUNCTION s_asft335_gen_14_ins_sfda(p_sffbdocno,p_sffbseq,p_docno,p_date)
DEFINE p_sffbdocno     LIKE sffb_t.sffbdocno 
   DEFINE p_sffbseq       LIKE sffb_t.sffbseq
   DEFINE p_docno         LIKE sfda_t.sfdadocno
   DEFINE p_date          LIKE sfda_t.sfdadocdt
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_sfdadocno     LIKE sfda_t.sfdadocno
   #161109-00085#51-s
   #DEFINE l_sfda          RECORD LIKE sfda_t.*
   DEFINE l_sfda RECORD  #發退料單頭檔
          sfdaent LIKE sfda_t.sfdaent, #企業編號
          sfdasite LIKE sfda_t.sfdasite, #營運據點
          sfdadocno LIKE sfda_t.sfdadocno, #發退料單號
          sfdadocdt LIKE sfda_t.sfdadocdt, #單據日期
          sfda001 LIKE sfda_t.sfda001, #過帳日期
          sfda002 LIKE sfda_t.sfda002, #發退料類別
          sfda003 LIKE sfda_t.sfda003, #生產部門
          sfda004 LIKE sfda_t.sfda004, #申請人
          sfda005 LIKE sfda_t.sfda005, #PBI編號
          sfda006 LIKE sfda_t.sfda006, #生產料號
          sfda007 LIKE sfda_t.sfda007, #BOM特性
          sfda008 LIKE sfda_t.sfda008, #產品特徵
          sfda009 LIKE sfda_t.sfda009, #生產控制組
          sfda010 LIKE sfda_t.sfda010, #作業編號
          sfda011 LIKE sfda_t.sfda011, #作業序
          sfda012 LIKE sfda_t.sfda012, #庫位
          sfda013 LIKE sfda_t.sfda013, #套數
          sfda014 LIKE sfda_t.sfda014, #來源單號
          sfda015 LIKE sfda_t.sfda015, #來源類型
          sfdaownid LIKE sfda_t.sfdaownid, #資料所有者
          sfdaowndp LIKE sfda_t.sfdaowndp, #資料所屬部門
          sfdacrtid LIKE sfda_t.sfdacrtid, #資料建立者
          sfdacrtdp LIKE sfda_t.sfdacrtdp, #資料建立部門
          sfdacrtdt LIKE sfda_t.sfdacrtdt, #資料創建日
          sfdamodid LIKE sfda_t.sfdamodid, #資料修改者
          sfdamoddt LIKE sfda_t.sfdamoddt, #最近修改日
          sfdacnfid LIKE sfda_t.sfdacnfid, #資料確認者
          sfdacnfdt LIKE sfda_t.sfdacnfdt, #資料確認日
          sfdapstid LIKE sfda_t.sfdapstid, #資料過帳者
          sfdapstdt LIKE sfda_t.sfdapstdt, #資料過帳日
          sfdastus LIKE sfda_t.sfdastus, #狀態碼
          sfdaud001 LIKE sfda_t.sfdaud001, #自定義欄位(文字)001
          sfdaud002 LIKE sfda_t.sfdaud002, #自定義欄位(文字)002
          sfdaud003 LIKE sfda_t.sfdaud003, #自定義欄位(文字)003
          sfdaud004 LIKE sfda_t.sfdaud004, #自定義欄位(文字)004
          sfdaud005 LIKE sfda_t.sfdaud005, #自定義欄位(文字)005
          sfdaud006 LIKE sfda_t.sfdaud006, #自定義欄位(文字)006
          sfdaud007 LIKE sfda_t.sfdaud007, #自定義欄位(文字)007
          sfdaud008 LIKE sfda_t.sfdaud008, #自定義欄位(文字)008
          sfdaud009 LIKE sfda_t.sfdaud009, #自定義欄位(文字)009
          sfdaud010 LIKE sfda_t.sfdaud010, #自定義欄位(文字)010
          sfdaud011 LIKE sfda_t.sfdaud011, #自定義欄位(數字)011
          sfdaud012 LIKE sfda_t.sfdaud012, #自定義欄位(數字)012
          sfdaud013 LIKE sfda_t.sfdaud013, #自定義欄位(數字)013
          sfdaud014 LIKE sfda_t.sfdaud014, #自定義欄位(數字)014
          sfdaud015 LIKE sfda_t.sfdaud015, #自定義欄位(數字)015
          sfdaud016 LIKE sfda_t.sfdaud016, #自定義欄位(數字)016
          sfdaud017 LIKE sfda_t.sfdaud017, #自定義欄位(數字)017
          sfdaud018 LIKE sfda_t.sfdaud018, #自定義欄位(數字)018
          sfdaud019 LIKE sfda_t.sfdaud019, #自定義欄位(數字)019
          sfdaud020 LIKE sfda_t.sfdaud020, #自定義欄位(數字)020
          sfdaud021 LIKE sfda_t.sfdaud021, #自定義欄位(日期時間)021
          sfdaud022 LIKE sfda_t.sfdaud022, #自定義欄位(日期時間)022
          sfdaud023 LIKE sfda_t.sfdaud023, #自定義欄位(日期時間)023
          sfdaud024 LIKE sfda_t.sfdaud024, #自定義欄位(日期時間)024
          sfdaud025 LIKE sfda_t.sfdaud025, #自定義欄位(日期時間)025
          sfdaud026 LIKE sfda_t.sfdaud026, #自定義欄位(日期時間)026
          sfdaud027 LIKE sfda_t.sfdaud027, #自定義欄位(日期時間)027
          sfdaud028 LIKE sfda_t.sfdaud028, #自定義欄位(日期時間)028
          sfdaud029 LIKE sfda_t.sfdaud029, #自定義欄位(日期時間)029
          sfdaud030 LIKE sfda_t.sfdaud030  #自定義欄位(日期時間)030
   END RECORD
   #161109-00085#51-e
   DEFINE l_success       LIKE type_t.num5
   #161109-00085#51-s
   #DEFINE l_sfea          RECORD LIKE sfea_t.*
   DEFINE l_sfea RECORD  #完工入庫單頭檔
       sfeaent LIKE sfea_t.sfeaent, #企業編號
       sfeasite LIKE sfea_t.sfeasite, #營運據點
       sfeadocno LIKE sfea_t.sfeadocno, #單號
       sfeadocdt LIKE sfea_t.sfeadocdt, #單據日期
       sfea001 LIKE sfea_t.sfea001, #過帳日期
       sfea002 LIKE sfea_t.sfea002, #申請人
       sfea003 LIKE sfea_t.sfea003, #部門
       sfea004 LIKE sfea_t.sfea004, #PBI編號
       sfea005 LIKE sfea_t.sfea005, #倒扣領料單號
       sfeaownid LIKE sfea_t.sfeaownid, #資料所有者
       sfeaowndp LIKE sfea_t.sfeaowndp, #資料所屬部門
       sfeacrtid LIKE sfea_t.sfeacrtid, #資料建立者
       sfeacrtdp LIKE sfea_t.sfeacrtdp, #資料建立部門
       sfeacrtdt LIKE sfea_t.sfeacrtdt, #資料創建日
       sfeamodid LIKE sfea_t.sfeamodid, #資料修改者
       sfeamoddt LIKE sfea_t.sfeamoddt, #最近修改日
       sfeacnfid LIKE sfea_t.sfeacnfid, #資料確認者
       sfeacnfdt LIKE sfea_t.sfeacnfdt, #資料確認日
       sfeapstid LIKE sfea_t.sfeapstid, #資料過帳者
       sfeapstdt LIKE sfea_t.sfeapstdt, #資料過帳日
       sfeastus LIKE sfea_t.sfeastus, #狀態碼
       sfea006 LIKE sfea_t.sfea006  #生產計畫
   END RECORD
   #161109-00085#51-e
   DEFINE l_sffb RECORD  #单笔工艺报工档
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030, #成本中心
       sffb031 LIKE sffb_t.sffb031  #倒扣領料單號
END RECORD
   LET r_success  = FALSE
   LET r_sfdadocno = NULL
   
   #插入发料单单头档
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,
          sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,sffb030,sffb031
     INTO l_sffb.* FROM sffb_t
    WHERE sffbent = g_enterprise
      AND sffbdocno = p_sffbdocno
      AND sffbseq = p_sffbseq
      
   INITIALIZE l_sfda.* TO NULL
   
   CALL s_aooi200_gen_docno(l_sffb.sffbsite,p_docno,p_date,'asft314')
        RETURNING l_success,l_sfda.sfdadocno
   IF NOT l_success THEN
      RETURN r_success,r_sfdadocno
   END IF 
   
   LET l_sfda.sfdaent   = g_enterprise      #企業代碼
   LET l_sfda.sfdasite  = l_sffb.sffbsite   #營運據點
   LET l_sfda.sfdadocno = l_sfda.sfdadocno  #發退料單號
   LET l_sfda.sfdadocdt = p_date            #單據日期
   LET l_sfda.sfda001   = ''                #過帳日期
   LET l_sfda.sfda002   = '14'              #發料類別
   LET l_sfda.sfda003   = l_sffb.sffb003    #生產部門
   LET l_sfda.sfda004   = l_sffb.sffb002    #申請人
   LET l_sfda.sfda005   = ''    #PBI編號
   LET l_sfda.sfda006   = l_sffb.sffb029    #生產料號
   LET l_sfda.sfda007   = ''                #BOM特性
   LET l_sfda.sfda008   = ''                #產品特徵
   LET l_sfda.sfda009   = ''                #生產控制組
   LET l_sfda.sfda010   = l_sffb.sffb007    #作業編號
   LET l_sfda.sfda011   = l_sffb.sffb008    #製程序
   LET l_sfda.sfda012   = ''                #庫位
   LET l_sfda.sfda013   = 0                 #套數
   LET l_sfda.sfda015    = '07'               #来源类型
   LET l_sfda.sfda014    =  p_sffbdocno     #来源单号
   LET l_sfda.sfdaownid = g_user            #資料所有者
   LET l_sfda.sfdaowndp = g_dept            #資料所屬部門
   LET l_sfda.sfdacrtid = g_user            #資料建立者
   LET l_sfda.sfdacrtdp = g_dept            #資料建立部門
   LET l_sfda.sfdacrtdt = cl_get_current()  #資料創建日
   LET l_sfda.sfdamodid = ''                #資料修改者
   LET l_sfda.sfdamoddt = ''                #最近修改日
   LET l_sfda.sfdacnfid = ''                #資料確認者
   LET l_sfda.sfdacnfdt = ''                #資料確認日
   LET l_sfda.sfdapstid = ''                #資料過帳者
   LET l_sfda.sfdapstdt = ''                #資料過帳日
   LET l_sfda.sfdastus  = 'N'               #狀態碼
   INSERT INTO sfda_t (sfdaent,sfdasite,sfdadocno,sfdadocdt,sfda001,
                       sfda002,sfda003,sfda004,sfda005,sfda006,
                       sfda007,sfda008,sfda009,sfda010,sfda011,
                       sfda012,sfda013,sfda014,sfda015,sfdaownid,
                       sfdaowndp,sfdacrtid,sfdacrtdp,sfdacrtdt,sfdamodid,
                       sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt,
                       sfdastus,sfdaud001,sfdaud002,sfdaud003,sfdaud004,
                       sfdaud005,sfdaud006,sfdaud007,sfdaud008,sfdaud009,
                       sfdaud010,sfdaud011,sfdaud012,sfdaud013,sfdaud014,
                       sfdaud015,sfdaud016,sfdaud017,sfdaud018,sfdaud019,
                       sfdaud020,sfdaud021,sfdaud022,sfdaud023,sfdaud024,
                       sfdaud025,sfdaud026,sfdaud027,sfdaud028,sfdaud029,
                       sfdaud030)
   VALUES( l_sfda.sfdaent,l_sfda.sfdasite,l_sfda.sfdadocno,l_sfda.sfdadocdt,l_sfda.sfda001,
           l_sfda.sfda002,l_sfda.sfda003,l_sfda.sfda004,l_sfda.sfda005,l_sfda.sfda006,
           l_sfda.sfda007,l_sfda.sfda008,l_sfda.sfda009,l_sfda.sfda010,l_sfda.sfda011,
           l_sfda.sfda012,l_sfda.sfda013,l_sfda.sfda014,l_sfda.sfda015,l_sfda.sfdaownid,
           l_sfda.sfdaowndp,l_sfda.sfdacrtid,l_sfda.sfdacrtdp,l_sfda.sfdacrtdt,l_sfda.sfdamodid,
           l_sfda.sfdamoddt,l_sfda.sfdacnfid,l_sfda.sfdacnfdt,l_sfda.sfdapstid,l_sfda.sfdapstdt,
           l_sfda.sfdastus,l_sfda.sfdaud001,l_sfda.sfdaud002,l_sfda.sfdaud003,l_sfda.sfdaud004,
           l_sfda.sfdaud005,l_sfda.sfdaud006,l_sfda.sfdaud007,l_sfda.sfdaud008,l_sfda.sfdaud009,
           l_sfda.sfdaud010,l_sfda.sfdaud011,l_sfda.sfdaud012,l_sfda.sfdaud013,l_sfda.sfdaud014,
           l_sfda.sfdaud015,l_sfda.sfdaud016,l_sfda.sfdaud017,l_sfda.sfdaud018,l_sfda.sfdaud019,
           l_sfda.sfdaud020,l_sfda.sfdaud021,l_sfda.sfdaud022,l_sfda.sfdaud023,l_sfda.sfdaud024,
           l_sfda.sfdaud025,l_sfda.sfdaud026,l_sfda.sfdaud027,l_sfda.sfdaud028,l_sfda.sfdaud029,
           l_sfda.sfdaud030 )
   #161109-00085#51-e
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins sfda_t'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,r_sfdadocno
   END IF
   
   LET r_success = TRUE
   LET r_sfdadocno = l_sfda.sfdadocno
   RETURN r_success,r_sfdadocno
END FUNCTION

################################################################################
# Descriptions...: 取消审核报工单同时删除倒扣领料单
# Memo...........:
# Usage..........: CALL s_asft335_del_sfda(p_sffbdocno,p_sffbseq)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/03/16 By xujing
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_del_sfda(p_sffbdocno,p_sffbseq)
DEFINE p_sffbdocno LIKE sffb_t.sffbdocno
DEFINE p_sffbseq   LIKE sffb_t.sffbseq
DEFINE r_success   LIKE type_t.num5
 DEFINE l_sffb RECORD  #单笔工艺报工档
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030, #成本中心
       sffb031 LIKE sffb_t.sffb031  #倒扣領料單號
END RECORD
DEFINE l_sfdastus LIKE sfda_t.sfdastus
   LET r_success = FALSE
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,
          sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,sffb030,sffb031
     INTO l_sffb.* FROM sffb_t
    WHERE sffbent = g_enterprise
      AND sffbdocno = p_sffbdocno
      AND sffbseq = p_sffbseq
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'sel_sffb_t'
       LET g_errparam.popup = TRUE
       CALL cl_err()
     
       RETURN r_success
    END IF
    
    IF NOT cl_null(l_sffb.sffb031) THEN
       SELECT sfdastus INTO l_sfdastus FROM sfda_t
        WHERE sfdaent = g_enterprise
          AND sfdadocno = l_sffb.sffb031
       IF l_sfdastus = 'S' THEN  #如果已过账则先过账还原
          IF NOT s_asft310_unpost_upd(l_sffb.sffb031) THEN
             RETURN r_success
          END IF
       END IF
       SELECT sfdastus INTO l_sfdastus FROM sfda_t
        WHERE sfdaent = g_enterprise
          AND sfdadocno = l_sffb.sffb031
       IF l_sfdastus = 'Y' THEN  #如果已审核则先取消审核
          IF NOT s_asft310_unconfirm_upd(l_sffb.sffb031) THEN
             RETURN r_success
          END IF
       END IF
       #删除发料需求
       DELETE FROM sfda_t WHERE sfdaent = g_enterprise
          AND sfdadocno = l_sffb.sffb031
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'del_sfda'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
       #删除发料明细
       DELETE FROM sfdc_t WHERE sfdcent = g_enterprise
          AND sfdcdocno = l_sffb.sffb031
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'del_sfdc'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
       #删除发退料明细
       DELETE FROM sfdd_t WHERE sfddent = g_enterprise
          AND sfdddocno = l_sffb.sffb031
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'del_sfdd'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
       #删除发料需求汇总
       DELETE FROM sfde_t WHERE sfdeent = g_enterprise
          AND sfdedocno = l_sffb.sffb031
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'del_sfde'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
       #删除发料仓储批汇总
       DELETE FROM sfdf_t WHERE sfdfent = g_enterprise
          AND sfdfdocno = l_sffb.sffb031
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'del_sfdf'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
       
       UPDATE sffb_t SET sffb031 = ''
                   WHERE sffbent = g_enterprise
                     AND sffbdocno = p_sffbdocno
                     AND sffbseq = p_sffbseq
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'upd_sffb_t'
          LET g_errparam.popup = TRUE
          CALL cl_err()
        
          RETURN r_success
       END IF
    END IF
    LET r_success = TRUE
    RETURN r_success
END FUNCTION
#170420-00018#1 add
#回写工单报废数量,下线数量
PUBLIC FUNCTION s_asft335_upd_scrap(p_cmd,p_sffb001,p_sffb005,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
 DEFINE p_cmd               LIKE type_t.num5             #审核 1/取消审核 -1   
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型 0 表示从发料过来的
   DEFINE p_sffb005           LIKE sffb_t.sffb005
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE j                   LIKE type_t.num5
   DEFINE l_sfcb_next         type_sfcb_next    
   DEFINE l_amt1              LIKE sffb_t.sffb018   
   DEFINE l_amt2              LIKE sffb_t.sffb019  
   DEFINE l_sfcb046           LIKE sfcb_t.sfcb046
   DEFINE l_sfcb047           LIKE sfcb_t.sfcb047
   DEFINE l_sfcb048           LIKE sfcb_t.sfcb048
   DEFINE l_sfcb049           LIKE sfcb_t.sfcb049
   DEFINE l_sfcb050           LIKE sfcb_t.sfcb050
   DEFINE l_count             LIKE type_t.num5
   DEFINE l_sfcb_prev         DYNAMIC ARRAY OF type_sfcb_prev2 
#为后续查找上下站做cursor定义
   CALL s_asft335_declare_sfcb()
   LET r_success = TRUE
#先找到所有的下一站（但是数量栏位都是原始的未改过的，最后计算了才累加上去）
   DELETE FROM s_asft335_tmp01
   IF NOT s_asft335_get_next_station(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
#去除重复站点
   INSERT INTO s_asft335_tmp01 
   SELECT DISTINCT 'Y',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,type,sfcb021,sfcb022,amt,sfcb053,sfcb054
     FROM s_asft335_tmp01
   DELETE FROM s_asft335_tmp01 WHERE chk = 'N'
#再根据每一个下一站，找到它的所有的上站报工，也就是和现在正在审核的一个阶层的站，综合这一阶层站的数量，更新下一站的数量
   #DECLARE s_asft335_sel_sfcb_next_tmp CURSOR FOR SELECT * FROM s_asft335_tmp01 ORDER BY sfcb003,sfcb004 #161109-00085#55 MARK
   #FOREACH s_asft335_sel_sfcb_next_tmp INTO l_sfcb_next.*  #161109-00085#55 MARK
   #161109-00085#55-s
   DECLARE s_asft335_sel_sfcb_next_tmp2 CURSOR FOR SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                                                         sfcb005,sfcb006,type,sfcb021,sfcb022,
                                                         amt,sfcb053,sfcb054   
                                                    FROM s_asft335_tmp01 ORDER BY sfcb003,sfcb004
   FOREACH s_asft335_sel_sfcb_next_tmp2 INTO l_sfcb_next.chk,l_sfcb_next.sfcbdocno,l_sfcb_next.sfcb001,l_sfcb_next.sfcb003,l_sfcb_next.sfcb004,
                                            l_sfcb_next.sfcb005,l_sfcb_next.sfcb006,l_sfcb_next.type,l_sfcb_next.sfcb021,l_sfcb_next.sfcb022,
                                            l_sfcb_next.amt,l_sfcb_next.sfcb053,l_sfcb_next.sfcb054
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      DELETE FROM s_asft335_tmp03
      IF NOT s_asft335_get_prev_station_scrap(l_sfcb_next.type,l_sfcb_next.sfcbdocno,l_sfcb_next.sfcb001,l_sfcb_next.sfcb003,l_sfcb_next.sfcb004) THEN
         LET r_success = FALSE
         RETURN r_success      
      END IF
#同样去除重复
      INSERT INTO s_asft335_tmp03 
      SELECT DISTINCT 'Y',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,type,
                      sfcb021,sfcb022,amt1,amt2,sfcb053,sfcb054 
        FROM s_asft335_tmp03
      DELETE FROM s_asft335_tmp03 WHERE chk = 'N'
      IF NOT s_asft335_calculate_scrap()  THEN   #计算数量，用来更新到对应的下一站点数量（含合并同一替代群组的数量）
         LET r_success = FALSE
         RETURN r_success      
      END IF
#上一站的数据都更新进去了，该取个最小值更新到下一站了
      LET l_amt1 = NULL
      SELECT MAX(amt1) INTO l_amt1 FROM s_asft335_tmp03
      IF l_amt1 IS NULL THEN LET l_amt1 = 0 END IF  
      LET l_amt2 = NULL
      SELECT MAX(amt2) INTO l_amt2 FROM s_asft335_tmp03
      IF l_amt2 IS NULL THEN LET l_amt2 = 0 END IF 

      #回写工单报废数量,下线数量
#     LET l_count = 0
#     IF p_cmd = 1 THEN
#        #判断(平行工艺),除了本站以外,有没有已经审核的,如果没有则回写工单单头报废,下线数量
#        SELECT COUNT(1) INTO l_count
#          FROM s_asft335_tmp03
#         WHERE ((amt1 IS NOT NULL AND amt1 > 0 ) OR (amt2 IS NOT NULL AND amt2 > 0))
#           AND NOT (type = p_sffb001 AND sfcbdocno = p_sfcbdocno             #排除掉当前报工资料
#                    AND sfcb001 = p_sfcb001 AND sfcb003 = p_sfcb003 AND sfcb004 = p_sfcb004 )
#     ELSE
#       #判断本站(包括平行的站)是否全部都取消审核,如果是则回写工单单头报废,下线数量
#       SELECT COUNT(1) INTO l_count
#          FROM s_asft335_tmp03
#         WHERE ((amt1 IS NOT NULL AND amt1 > 0 ) OR (amt2 IS NOT NULL AND amt2 > 0))
#           AND EXISTS(SELECT 1 FROM sffb_t WHERE sffbent = g_enterprise AND sffb001 = type
#                        AND sffb005 = sfcbdocno AND sffb006 = sfcb001 AND sffb007 = sfcb003
#                        AND sffb008 = sfcb004 AND sffbstus = 'Y') 
#     END IF
      
       #判断平行工艺中是否存在没有报工的资料,如不存在则不更新工单单头报废,下线数量,如不存在,则取最大的增加
       LET l_count = 0
       SELECT COUNT(1) INTO l_count
         FROM s_asft335_tmp03
        WHERE EXISTS(SELECT 1 FROM sffb_t WHERE sffbent = g_enterprise AND sffb001 = type
                       AND sffb005 = sfcbdocno AND sffb006 = sfcb001 AND sffb007 = sfcb003
                       AND sffb008 = sfcb004 AND sffbstus = 'N') 
       #如果没有未审核的单据并且是审核,则回写增加报废量,下线数量
       IF l_count = 0 AND p_cmd = 1 THEN
         UPDATE sfaa_t SET sfaa055 = sfaa055 + l_amt2,
                           sfaa056 = sfaa056 + l_amt1
          WHERE sfaaent   = g_enterprise
            AND sfaasite  = g_site
            AND sfaadocno =p_sffb005
       END IF
       #如果未审核的只有一笔单据并且动作的取消审核,则回写扣除报废量,下线数量
       IF l_count = 1 AND p_cmd = -1 THEN
         UPDATE sfaa_t SET sfaa055 = sfaa055 - l_amt2,
                           sfaa056 = sfaa056 - l_amt1
          WHERE sfaaent   = g_enterprise
            AND sfaasite  = g_site
            AND sfaadocno =p_sffb005
       END IF
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = 'upd_sfaa'
          LET g_errparam.popup = TRUE
          CALL cl_err()
       
          LET r_success = FALSE       
       END IF
         
       IF SQLCA.sqlerrd[3] = 0 THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'asf-00097'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()
       
          LET r_success = FALSE
       END IF  
#      END IF       
      #作废无需回写下站数量,所以只取一笔就好
      EXIT FOREACH
   END FOREACH
   FREE s_asft335_sel_sfcb_next_tmp2
   CLOSE s_asft335_sel_sfcb_next_tmp2
   
   RETURN r_success
END FUNCTION
#170420-00018#1 add
#计算平行的报废数量,下线数量
PUBLIC FUNCTION s_asft335_calculate_scrap()
DEFINE l_sfcb_prev         type_sfcb_prev2  
   DEFINE l_sffb018           LIKE sffb_t.sffb018
   DEFINE l_sffb019           LIKE sffb_t.sffb019
   DEFINE r_success           LIKE type_t.num5
#   DEFINE l_sfcb017           LIKE sfcb_t.sfcb017   #170110-00056#1 add
   DEFINE l_sfcb051           LIKE sfcb_t.sfcb051    #170322-00016#1 add  
   DEFINE l_qcba027           LIKE qcba_t.qcba027    #170322-00016#1 add  
   
   LET r_success = TRUE
   WHENEVER ERROR CONTINUE
   #DECLARE s_asft335_sel_sfcb_prev_tmp CURSOR FOR SELECT * FROM s_asft335_tmp03 ORDER BY sfcb003,sfcb004  #161109-00085#55  MARK
   #FOREACH s_asft335_sel_sfcb_prev_tmp INTO l_sfcb_prev.*   #161109-00085#55  MARK
   #161109-00085#55-s
   DECLARE s_asft335_sel_sfcb_prev_tmp2 CURSOR FOR SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                                                         sfcb005,sfcb006,type,sfcb021,sfcb022,
                                                         amt1,amt2,sfcb053,sfcb054    
                                                    FROM s_asft335_tmp03 ORDER BY sfcb003,sfcb004         
   FOREACH s_asft335_sel_sfcb_prev_tmp2 
      INTO l_sfcb_prev.chk,l_sfcb_prev.sfcbdocno,l_sfcb_prev.sfcb001,l_sfcb_prev.sfcb003,l_sfcb_prev.sfcb004, 
           l_sfcb_prev.sfcb005,l_sfcb_prev.sfcb006,l_sfcb_prev.type,l_sfcb_prev.sfcb021,l_sfcb_prev.sfcb022,
           l_sfcb_prev.amt1,l_sfcb_prev.amt2,l_sfcb_prev.sfcb053,l_sfcb_prev.sfcb054
   #161109-00085#55-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF  

      IF l_sfcb_prev.sfcb021 IS NULL OR l_sfcb_prev.sfcb022 IS NULL OR l_sfcb_prev.sfcb053 IS NULL OR l_sfcb_prev.sfcb054 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00345'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      #170110-00056#1 add(s)
#      SELECT sfcb017 INTO l_sfcb017 FROM sfcb_t
#       WHERE sfcbent = g_enterprise
#         AND sfcbdocno = l_sfcb_prev.sfcbdocno
#         AND sfcb001 = l_sfcb_prev.sfcb001
#         AND sfcb003 = l_sfcb_prev.sfcb003
#         AND sfcb004 = l_sfcb_prev.sfcb004
#      IF l_sfcb_prev.type='3' AND l_sfcb017 = 'Y' THEN
#         SELECT SUM(qcba023) INTO l_sffb017
#           FROM qcba_t
#          WHERE qcbaent = g_enterprise
#            AND qcbasite = g_site
#            AND qcba003 = l_sfcb_prev.sfcbdocno
#            AND qcba029 = l_sfcb_prev.sfcb001
#            AND qcba006 = l_sfcb_prev.sfcb003
#            AND qcba007 = l_sfcb_prev.sfcb004
#            AND qcbastus = 'Y'
#      ELSE
      #170110-00056 add(e)
#选取报工单数量
         
         SELECT SUM(sffb018),SUM(sffb019) INTO l_sffb018,l_sffb019 
           FROM sffb_t
          WHERE sffbent   = g_enterprise
            AND sffbsite  = g_site
            AND sffb001   = l_sfcb_prev.type
            AND sffb005   = l_sfcb_prev.sfcbdocno
            AND sffb006   = l_sfcb_prev.sfcb001
            AND sffb007   = l_sfcb_prev.sfcb003
            AND sffb008   = l_sfcb_prev.sfcb004
            AND sffbstus  <>  'X'     
         #170322-00016#1 add  --begin--
         #pqc处理
#         IF l_sfcb_prev.type = '3' THEN
#            SELECT sfcb051 INTO l_sfcb051 FROM sfcb_t
#             WHERE sfcbent = g_enterprise 
#               AND sfcbdocno = l_sfcb_prev.sfcbdocno
#               AND sfcb001   = l_sfcb_prev.sfcb001
#               AND sfcb003   = l_sfcb_prev.sfcb003
#               AND sfcb004   = l_sfcb_prev.sfcb004
#            SELECT SUM(qcba027) INTO l_qcba027 FROM qcba_t
#             WHERE qcbaent = g_enterprise AND qcbasite = g_site
#               AND qcba003 = l_sfcb_prev.sfcbdocno AND qcba029 = l_sfcb_prev.sfcb001
#               AND qcba006 = l_sfcb_prev.sfcb003 AND qcba007 = l_sfcb_prev.sfcb004
#               AND qcbastus = 'Y'
#            IF cl_null(l_sfcb051) THEN
#               LET l_sfcb051 = 0
#            END IF
#            IF cl_null(l_qcba027) THEN
#               LET l_qcba027 = 0
#            END IF
#            LET l_sffb017 = l_sffb017 - l_sfcb051 - l_qcba027
#         END IF
         #170322-00016#1 add  --end--
             
#      END IF
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate SELECT SUM(sffb018)'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 

      IF l_sffb018 IS NULL THEN LET l_sffb018 = 0 END IF
      IF l_sffb019 IS NULL THEN LET l_sffb019 = 0 END IF
#Move In，Check In用转入单位分子/分母
      IF l_sfcb_prev.type MATCHES '[12]' THEN
        #LET l_sfcb_prev.amt = l_sffb017/l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054     #170405-00004#1 mark
         LET l_sfcb_prev.amt1 = l_sffb018/(l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054)   #170405-00004#1 add
         LET l_sfcb_prev.amt2 = l_sffb019/(l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054)
      END IF
#Move Out，Check Out，报工用转出单位分子/分母
      IF l_sfcb_prev.type MATCHES '[345]' THEN
        #LET l_sfcb_prev.amt = l_sffb017/l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022       #170405-00004#1 mark
         LET l_sfcb_prev.amt1 = l_sffb018/(l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022)     #170405-00004#1 mark
         LET l_sfcb_prev.amt2 = l_sffb019/(l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022)
      END IF
	
      UPDATE s_asft335_tmp03
         SET amt1 = l_sfcb_prev.amt1,
             amt2 = l_sfcb_prev.amt2
       WHERE type      = l_sfcb_prev.type
         AND sfcbdocno = l_sfcb_prev.sfcbdocno
         AND sfcb001   = l_sfcb_prev.sfcb001
         AND sfcb003   = l_sfcb_prev.sfcb003
         AND sfcb004   = l_sfcb_prev.sfcb004
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate update s_asft335_tmp03'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 
   END FOREACH

#将相同替代群组的累加起来
   UPDATE s_asft335_tmp03 SET chk = 'N'
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL

#其他不是替代群组的不能删掉，也要改成chk=Y
   UPDATE s_asft335_tmp03 SET chk = 'Y'
    WHERE sfcb005 != '2'


   INSERT INTO s_asft335_tmp03 
#   SELECT 'Y','','','','','',sfcb006,'','','',SUM(amt1),SUM(amt2),'','' #201021-00059#1 mark
   SELECT 'Y','',0,'','','',sfcb006,'',0,0,SUM(amt1),SUM(amt2),0,0 #201021-00059#1 add
     FROM s_asft335_tmp03
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL
    GROUP BY sfcb006


    
   DELETE FROM s_asft335_tmp03 WHERE chk = 'N'   

   RETURN r_success
END FUNCTION
#170420-00018#1 add
#取上站的所有数量
PUBLIC FUNCTION s_asft335_get_prev_action_scrap(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE r_success           LIKE type_t.num5
   DEFINE r_errmsg            STRING
   DEFINE l_sfcb014           LIKE sfcb_t.sfcb014
   DEFINE l_sfcb015           LIKE sfcb_t.sfcb015
   DEFINE l_sfcb016           LIKE sfcb_t.sfcb016
   DEFINE l_sfcb018           LIKE sfcb_t.sfcb018
   DEFINE l_sfcb019           LIKE sfcb_t.sfcb019

   LET r_success = TRUE
   LET r_errmsg = NULL
   CASE p_sffb001
      WHEN '0'   #从下站Move In过来的，到上上站找第一个勾选的步骤1～5个步骤都要找
        SELECT sfcb014,sfcb015,sfcb016,sfcb018,sfcb019 
          INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018,l_sfcb019
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb019 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,5,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF  

         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '1'   #Move In
#Move In是第一个步骤，它的上一步就是要到上一站了，不是这里处理的，给个赞，离开吧
         LET r_success = FALSE
         RETURN r_success,r_errmsg       
      WHEN '2'   #check In
        SELECT sfcb014
          INTO l_sfcb014
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '3'   #报工
        SELECT sfcb014,sfcb015
          INTO l_sfcb014,l_sfcb015
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '4'   #check Out
        SELECT sfcb014,sfcb015,sfcb016
          INTO l_sfcb014,l_sfcb015,l_sfcb016
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
      WHEN '5'   #Move Out
        SELECT sfcb014,sfcb015,sfcb016,sfcb018
          INTO l_sfcb014,l_sfcb015,l_sfcb016,l_sfcb018
          FROM sfcb_t
         WHERE sfcbent   = g_enterprise
           AND sfcbsite  = g_site
           AND sfcbdocno = p_sfcbdocno
           AND sfcb001   = p_sfcb001
           AND sfcb003   = p_sfcb003
           AND sfcb004   = p_sfcb004
 
         IF l_sfcb018 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,4,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb016 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,3,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 

         IF l_sfcb015 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,2,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
               
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
         
         IF l_sfcb014 = 'Y' THEN
            INSERT INTO s_asft335_tmp03
            SELECT 'N',sfcbdocno,sfcb001,sfcb003,sfcb004,sfcb005,sfcb006,1,sfcb021,sfcb022,0,0,sfcb053,sfcb054
              FROM sfcb_t
             WHERE sfcbent   = g_enterprise
               AND sfcbsite  = g_site
               AND sfcbdocno = p_sfcbdocno
               AND sfcb001   = p_sfcb001
               AND sfcb003   = p_sfcb003
               AND sfcb004   = p_sfcb004 
             
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET r_success = FALSE
               LET r_errmsg = SQLCA.sqlcode
               RETURN r_success,r_errmsg
            END IF
            IF SQLCA.sqlerrd[3] = 0 THEN
               LET r_success = FALSE
               LET r_errmsg = 100
               RETURN r_success,r_errmsg
            END IF 
            RETURN r_success,r_errmsg
         END IF 
   END CASE  
#如果走到这里，说明一个Y都没抓到，那就是失败了，返回FALSE
   LET r_success = FALSE
   RETURN r_success,r_errmsg
END FUNCTION
#170420-00018#1 add
#递归上站
PUBLIC FUNCTION s_asft335_get_prev_station_scrap(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
 DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE l_sfcb_prev         DYNAMIC ARRAY OF type_sfcb_prev2
   DEFINE l_sfcb_prev1        DYNAMIC ARRAY OF RECORD
                              sfcb003  LIKE sfcb_t.sfcb003,
                              sfcb004  LIKE sfcb_t.sfcb004
                              END RECORD
   DEFINE l_sfcc003           DYNAMIC ARRAY OF LIKE sfcc_t.sfcc003       
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE j                   LIKE type_t.num5
   DEFINE l_sfcb002           LIKE sfcb_t.sfcb002
   DEFINE l_sfcb006           LIKE sfcb_t.sfcb006
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_errmsg            STRING
   
   LET r_success = TRUE
   LET l_errmsg = NULL
#先看本站里前续步骤是否有勾选的，有的话插入临时表，本站没有勾选前续步骤再找上上一站
   CALL s_asft335_get_prev_action(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004) RETURNING l_success,l_errmsg
   IF l_success THEN
      LET r_success = TRUE
      RETURN r_success
   ELSE
      IF l_errmsg IS NOT NULL THEN
         LET r_success = l_success
         RETURN r_success
      END IF
   END IF   

#找上一站参考s_asft335_get_next_station()的逻辑，先考虑sfcc里存的是明细的作业编号+作业序，再考虑存的是群组代号
   EXECUTE s_asft335_ins_sfcb_prev2 USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'EXECUTE s_asft335_ins_sfcb_prev'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF 

   PREPARE s_asft335_sel_sfcb_prev_pb2 FROM g_sel_sfcb_prev_sql2
   DECLARE s_asft335_sel_sfcb_prev2 CURSOR FOR s_asft335_sel_sfcb_prev_pb2
   OPEN s_asft335_sel_sfcb_prev2 USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   LET i = 1
   CALL l_sfcb_prev.clear()
   #FOREACH s_asft335_sel_sfcb_prev INTO l_sfcb_prev[i].*
   #161109-00085#55-s
   FOREACH s_asft335_sel_sfcb_prev2 
      INTO l_sfcb_prev[i].chk,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004, 
           l_sfcb_prev[i].sfcb005,l_sfcb_prev[i].sfcb006,l_sfcb_prev[i].type,l_sfcb_prev[i].sfcb021,l_sfcb_prev[i].sfcb022,
           l_sfcb_prev[i].amt1,l_sfcb_prev[i].amt2,l_sfcb_prev[i].sfcb053,l_sfcb_prev[i].sfcb054
   #161109-00085#55-e           
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      LET i = i + 1 
   END FOREACH
   FREE s_asft335_sel_sfcb_prev2
   CLOSE s_asft335_sel_sfcb_prev2
   CALL l_sfcb_prev.deleteElement(l_sfcb_prev.getLength())
   IF l_sfcb_prev.getLength() > 0 THEN  
      FOR i = 1 TO l_sfcb_prev.getLength()
#这站没报工，递归去找上上一站(l_sfcb_prev.*的其他变量没用到，但还是都选出来，预留可能以后会用)
         IF NOT s_asft335_get_prev_station_scrap(0,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF  
      END FOR
   END IF
#以上是基于sfcc里上站作业编号存的是明细的作业编号，接下来考虑存的是群组 
#先把sfcc里存的群组都找出来（sfcc004 = 0 AND sfcc003 <> 'INIT'）
#再按每个群组包含的明细作业编号+作业序找出来，这些就是我们要找的上一站
#每一个上一站都先检查是否有勾选步骤，没有的话继续找上上站
   SELECT sfcb002,sfcb006 INTO l_sfcb002,l_sfcb006 
     FROM sfcb_t
    WHERE sfcbent    = g_enterprise
      AND sfcbdocno  = p_sfcbdocno
      AND sfcb001    = p_sfcb001
      AND sfcb003    = p_sfcb003
      AND sfcb004    = p_sfcb004
      
     
   DECLARE s_asft335_sel_sfcc003_2 CURSOR FOR
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是具体的作业编号
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = p_sfcb003
      AND sfcb010   = p_sfcb004
   UNION
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是下站所在的群组
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = l_sfcb006   #即使l_sfcb006是null也没关系，如果是null，那这段sql本来就不该选出资料来
  

   LET i = 1  #群组用
   LET j = 1  #明细作业编号用
   CALL l_sfcc003.clear()
   CALL l_sfcb_prev1.clear()
   FOREACH s_asft335_sel_sfcc003_2 INTO l_sfcc003[i]   #找到群组
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      DECLARE s_asft335_sel_sfcb_prev3 CURSOR FOR
      SELECT sfcb003,sfcb004 FROM sfcb_t
       WHERE sfcbent    = g_enterprise
         AND sfcbdocno  = p_sfcbdocno
         AND sfcb001    = p_sfcb001
         AND sfcb005    <> '1'
         AND sfcb006    = l_sfcc003[i]

      #FOREACH s_asft335_sel_sfcb_prev1 INTO l_sfcb_prev1[j].*  #找到明细作业编号+作业序
      #161109-00085#55-s
      FOREACH s_asft335_sel_sfcb_prev3 
         INTO l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004 #找到明细作业编号+作业序
      #161109-00085#55-e         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
         LET j = j + 1
      END FOREACH
         
      LET i = i + 1   
   END FOREACH
   
   CALL l_sfcb_prev1.deleteElement(l_sfcb_prev1.getLength())
   IF l_sfcb_prev1.getLength() > 0 THEN
      FOR j = 1 TO l_sfcb_prev1.getLength()
#先看明细作业编号里前续步骤是否有勾选的，有的话插入临时表，本站没有勾选前续步骤再找上上一站
         LET l_errmsg = NULL
         CALL s_asft335_get_prev_action_scrap(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) RETURNING l_success,l_errmsg
         IF l_success THEN         
            LET r_success = TRUE
            CONTINUE FOR   #这笔有勾选，继续处理下一笔
         ELSE              #这笔没勾选，找他的上上站
            IF l_errmsg IS NOT NULL THEN
               LET r_success = l_success
               RETURN r_success
            END IF         
            IF NOT s_asft335_get_prev_station_scrap(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END FOR
   END IF
   
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 获得重工轉入的所有上一站报工
# Memo...........:
# Usage..........: CALL s_asft335_get_prev_station_rework(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success
# Input parameter: p_sffb001      作业类型
#                : p_sfcbdocno    工单单号
#                : p_sfcb001      RunCard单号
#                : p_sfcb003      作业编号
#                : p_sfcb004      制程序
# Return code....: r_success      執行成功否
# Date & Author..: 17/07/19 By fionchen (#170524-00070#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_get_prev_station_rework(p_sffb001,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_sffb001           LIKE sffb_t.sffb001          #作业类型
   DEFINE p_sfcbdocno         LIKE sfcb_t.sfcbdocno        #工单单号
   DEFINE p_sfcb001           LIKE sfcb_t.sfcb001          #RunCard单号
   DEFINE p_sfcb003           LIKE sfcb_t.sfcb003          #作业编号
   DEFINE p_sfcb004           LIKE sfcb_t.sfcb004          #制程序
   DEFINE l_sfcb_prev         DYNAMIC ARRAY OF type_sfcb_prev
   DEFINE l_sfcb_prev1        DYNAMIC ARRAY OF RECORD
                              sfcb003  LIKE sfcb_t.sfcb003,
                              sfcb004  LIKE sfcb_t.sfcb004
                              END RECORD
   DEFINE l_sfcc003           DYNAMIC ARRAY OF LIKE sfcc_t.sfcc003       
   DEFINE r_success           LIKE type_t.num5
   DEFINE i                   LIKE type_t.num5
   DEFINE j                   LIKE type_t.num5
   DEFINE l_sfcb002           LIKE sfcb_t.sfcb002
   DEFINE l_sfcb006           LIKE sfcb_t.sfcb006
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_errmsg            STRING
   
   LET r_success = TRUE
   LET l_errmsg = NULL 

   #找上一站参考s_asft335_get_next_station()的逻辑，先考虑sfcc里存的是明细的作业编号+作业序，再考虑存的是群组代号
   EXECUTE s_asft335_ins_sfcb_prev3 USING p_sfcbdocno,p_sfcb001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'EXECUTE s_asft335_ins_sfcb_prev3'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF 

   PREPARE s_asft335_sel_sfcb_prev_pb4 FROM g_sel_sfcb_prev_sql3
   DECLARE s_asft335_sel_sfcb_prev4 CURSOR FOR s_asft335_sel_sfcb_prev_pb4
   OPEN s_asft335_sel_sfcb_prev4 USING p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004
   LET i = 1
   CALL l_sfcb_prev.clear()
   FOREACH s_asft335_sel_sfcb_prev4 
      INTO l_sfcb_prev[i].chk,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004, 
           l_sfcb_prev[i].sfcb005,l_sfcb_prev[i].sfcb006,l_sfcb_prev[i].type,l_sfcb_prev[i].sfcb021,l_sfcb_prev[i].sfcb022,
           l_sfcb_prev[i].amt,l_sfcb_prev[i].sfcb053,l_sfcb_prev[i].sfcb054           
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      LET i = i + 1 
   END FOREACH
   FREE s_asft335_sel_sfcb_prev4
   CLOSE s_asft335_sel_sfcb_prev4 
   CALL l_sfcb_prev.deleteElement(l_sfcb_prev.getLength())
   IF l_sfcb_prev.getLength() > 0 THEN  
      FOR i = 1 TO l_sfcb_prev.getLength()
         #这站没报工，递归去找上上一站(l_sfcb_prev.*的其他变量没用到，但还是都选出来，预留可能以后会用)
         IF NOT s_asft335_get_prev_station(0,l_sfcb_prev[i].sfcbdocno,l_sfcb_prev[i].sfcb001,l_sfcb_prev[i].sfcb003,l_sfcb_prev[i].sfcb004) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF  
      END FOR
   END IF
   #以上是基于sfcc里上站作业编号存的是明细的作业编号，接下来考虑存的是群组 
   #先把sfcc里存的群组都找出来（sfcc004 = 0 AND sfcc003 <> 'INIT'）
   #再按每个群组包含的明细作业编号+作业序找出来，这些就是我们要找的上一站
   #每一个上一站都先检查是否有勾选步骤，没有的话继续找上上站
   SELECT sfcb002,sfcb006 INTO l_sfcb002,l_sfcb006 
     FROM sfcb_t
    WHERE sfcbent    = g_enterprise
      AND sfcbdocno  = p_sfcbdocno
      AND sfcb001    = p_sfcb001
      AND sfcb003    = p_sfcb003
      AND sfcb004    = p_sfcb004
       
   DECLARE s_asft335_sel_sfcc003_3 CURSOR FOR
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是具体的作业编号
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = p_sfcb003
      AND sfcb010   = p_sfcb004
   UNION
   SELECT DISTINCT sfcc003 FROM sfcc_t,sfcb_t   #上站的下一站作业编号栏位里存的是下站所在的群组
    WHERE sfccent   = g_enterprise
      AND sfccdocno = p_sfcbdocno
      AND sfcc001   = p_sfcb001
      AND sfcc002   = l_sfcb002
      AND sfcc003 <> 'INIT'
      AND sfcc004   = '0'
      AND sfcbent   = sfccent
      AND sfcbdocno = sfccdocno
      AND sfcb001   = sfcc001
      AND sfcb006   = sfcc003
      AND sfcb005 <> '1'
      AND sfcb009   = l_sfcb006   #即使l_sfcb006是null也没关系，如果是null，那这段sql本来就不该选出资料来
  

   LET i = 1  #群组用
   LET j = 1  #明细作业编号用
   CALL l_sfcc003.clear()
   CALL l_sfcb_prev1.clear()
   FOREACH s_asft335_sel_sfcc003_3 INTO l_sfcc003[i]   #找到群组
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      DECLARE s_asft335_sel_sfcb_prev5 CURSOR FOR
      SELECT sfcb003,sfcb004 FROM sfcb_t
       WHERE sfcbent    = g_enterprise
         AND sfcbdocno  = p_sfcbdocno
         AND sfcb001    = p_sfcb001
         AND sfcb005    <> '1'
         AND sfcb006    = l_sfcc003[i]

      FOREACH s_asft335_sel_sfcb_prev5 
         INTO l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004 #找到明细作业编号+作业序
              
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
         LET j = j + 1
      END FOREACH
         
      LET i = i + 1   
   END FOREACH
   
   CALL l_sfcb_prev1.deleteElement(l_sfcb_prev1.getLength())
   IF l_sfcb_prev1.getLength() > 0 THEN
      FOR j = 1 TO l_sfcb_prev1.getLength()
         #先看明细作业编号里前续步骤是否有勾选的，有的话插入临时表，本站没有勾选前续步骤再找上上一站
         LET l_errmsg = NULL
         CALL s_asft335_get_prev_action(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) RETURNING l_success,l_errmsg
         IF l_success THEN         
            LET r_success = TRUE
            CONTINUE FOR   #这笔有勾选，继续处理下一笔
         ELSE              #这笔没勾选，找他的上上站
            IF l_errmsg IS NOT NULL THEN
               LET r_success = l_success
               RETURN r_success
            END IF         
            IF NOT s_asft335_get_prev_station(0,p_sfcbdocno,p_sfcb001,l_sfcb_prev1[j].sfcb003,l_sfcb_prev1[j].sfcb004) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END FOR
   END IF
   
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 计算各报工站综合对下一站点的影响，合并替代群组，其余取最小值(重工)
# Memo...........: step1:根据作业编号+制程序将对应的数量写到s_asft335_tmp04里，考虑转换率
#                : step2:以替代群组为group做sum
#                : step3:全体都有，取最小值，作为传给下一站的数量
# Usage..........: CALL s_asft335_calculate_rework()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      執行成功否
# Date & Author..: 17/07/19 By fionchen (#170524-00070#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_calculate_rework()
   DEFINE l_sfcb_prev         type_sfcb_prev  
   DEFINE l_sffb017           LIKE sffb_t.sffb017
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_sfcb051           LIKE sfcb_t.sfcb051    
   DEFINE l_qcba027           LIKE qcba_t.qcba027    
   DEFINE l_qcba010           LIKE qcba_t.qcba010       
   DEFINE l_qcba009           LIKE qcba_t.qcba009
   DEFINE l_qcba016           LIKE qcba_t.qcba016
   DEFINE l_qcba023           LIKE qcba_t.qcba023
   DEFINE l_qcba023_sum       LIKE qcba_t.qcba023
   DEFINE l_success           LIKE type_t.num5
   
   LET r_success = TRUE
   WHENEVER ERROR CONTINUE
  
   DECLARE s_asft335_sel_sfcb_prev_tmp3 CURSOR FOR SELECT chk,sfcbdocno,sfcb001,sfcb003,sfcb004,
                                                         sfcb005,sfcb006,type,sfcb021,sfcb022,
                                                         amt,sfcb053,sfcb054    
                                                    FROM s_asft335_tmp04 ORDER BY sfcb003,sfcb004         
   FOREACH s_asft335_sel_sfcb_prev_tmp3 
      INTO l_sfcb_prev.chk,l_sfcb_prev.sfcbdocno,l_sfcb_prev.sfcb001,l_sfcb_prev.sfcb003,l_sfcb_prev.sfcb004, 
           l_sfcb_prev.sfcb005,l_sfcb_prev.sfcb006,l_sfcb_prev.type,l_sfcb_prev.sfcb021,l_sfcb_prev.sfcb022,
           l_sfcb_prev.amt,l_sfcb_prev.sfcb053,l_sfcb_prev.sfcb054
  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF  

      IF l_sfcb_prev.sfcb021 IS NULL OR l_sfcb_prev.sfcb022 IS NULL OR l_sfcb_prev.sfcb053 IS NULL OR l_sfcb_prev.sfcb054 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00345'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      
      #选取报工单数量
      SELECT SUM(sffb017) INTO l_sffb017 
        FROM sffb_t
       WHERE sffbent   = g_enterprise
         AND sffbsite  = g_site
         AND sffb001   = l_sfcb_prev.type
         AND sffb005   = l_sfcb_prev.sfcbdocno
         AND sffb006   = l_sfcb_prev.sfcb001
         AND sffb007   = l_sfcb_prev.sfcb003
         AND sffb008   = l_sfcb_prev.sfcb004
         AND sffbstus  = 'Y' 
         
      #pqc处理
      IF l_sfcb_prev.type = '3' THEN
         SELECT sfcb051 INTO l_sfcb051 FROM sfcb_t
          WHERE sfcbent = g_enterprise 
            AND sfcbdocno = l_sfcb_prev.sfcbdocno
            AND sfcb001   = l_sfcb_prev.sfcb001
            AND sfcb003   = l_sfcb_prev.sfcb003
            AND sfcb004   = l_sfcb_prev.sfcb004
            
        DECLARE sel_qcba023_curs1 CURSOR FOR
         SELECT qcba010,qcba009,qcba016,NVL(qcba023,0) FROM qcba_t
          WHERE qcbaent = g_enterprise AND qcbasite = g_site
            AND qcba003 = l_sfcb_prev.sfcbdocno AND qcba029 = l_sfcb_prev.sfcb001
            AND qcba006 = l_sfcb_prev.sfcb003 AND qcba007 = l_sfcb_prev.sfcb004
            AND qcbastus = 'Y'
        LET l_qcba023_sum = 0
        FOREACH sel_qcba023_curs1 INTO l_qcba010,l_qcba009,l_qcba016,l_qcba023
           IF NOT cl_null(l_qcba009) AND NOT cl_null(l_qcba016) AND l_qcba009 != l_qcba016 THEN
              CALL s_aooi250_convert_qty1(l_qcba010,l_qcba016,l_qcba009,l_qcba023) RETURNING l_success,l_qcba023
           END IF
           LET l_qcba023_sum = l_qcba023_sum + l_qcba023
        END FOREACH
            
        IF cl_null(l_sfcb051) THEN
           LET l_sfcb051 = 0
        END IF
            
        LET l_sffb017 = l_sffb017 - l_sfcb051 - l_qcba023_sum   
      END IF
        
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate SELECT SUM(sffb017)'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 

      IF l_sffb017 IS NULL THEN LET l_sffb017 = 0 END IF
      
      #Move In，Check In用转入单位分子/分母
      IF l_sfcb_prev.type MATCHES '[12]' THEN
         LET l_sfcb_prev.amt = l_sffb017/(l_sfcb_prev.sfcb053/l_sfcb_prev.sfcb054)   
      END IF
      #Move Out，Check Out，报工用转出单位分子/分母
      IF l_sfcb_prev.type MATCHES '[345]' THEN
         LET l_sfcb_prev.amt = l_sffb017/(l_sfcb_prev.sfcb021/l_sfcb_prev.sfcb022)    
      END IF
	
      UPDATE s_asft335_tmp04
         SET amt = l_sfcb_prev.amt
       WHERE type      = l_sfcb_prev.type
         AND sfcbdocno = l_sfcb_prev.sfcbdocno
         AND sfcb001   = l_sfcb_prev.sfcb001
         AND sfcb003   = l_sfcb_prev.sfcb003
         AND sfcb004   = l_sfcb_prev.sfcb004
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'calculate update s_asft335_tmp04'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 
   END FOREACH

   #将相同替代群组的累加起来
   UPDATE s_asft335_tmp04 SET chk = 'N'
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL

   #其他不是替代群组的不能删掉，也要改成chk=Y
   UPDATE s_asft335_tmp04 SET chk = 'Y'
    WHERE sfcb005 != '2'

   INSERT INTO s_asft335_tmp04 
   #SELECT 'Y','','','','','',sfcb006,'','','',SUM(amt),'',''  #200827-00049#1 mark
   SELECT 'Y','',0,'','','',sfcb006,'',0,0,SUM(amt),0,0  #200827-00049#1 add
     FROM s_asft335_tmp04
    WHERE sfcb005 = '2' 
      AND sfcb006 IS NOT NULL
    GROUP BY sfcb006

   DELETE FROM s_asft335_tmp04 WHERE chk = 'N'   

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 确认审核
# Memo...........: #171113-00002#1
################################################################################
PUBLIC FUNCTION s_asft335_conf_chk(p_docno)
   DEFINE p_docno       LIKE sffb_t.sffbdocno 
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sffbstus    LIKE sffb_t.sffbstus
   DEFINE l_sffbseq     LIKE sffb_t.sffbseq      
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE l_sffd002_sum LIKE sffd_t.sffd002
   DEFINE l_sffb017     LIKE sffb_t.sffb017
   DEFINE l_sffb018     LIKE sffb_t.sffb018
   DEFINE l_sffb019     LIKE sffb_t.sffb019
   DEFINE l_sffb012     LIKE sffb_t.sffb012    
   DEFINE l_sffbdocdt   LIKE sffb_t.sffbdocdt  
   DEFINE l_sffb005     LIKE sffb_t.sffb005
   DEFINE l_sfaadocdt   LIKE sfaa_t.sfaadocdt
   DEFINE l_sffadocdt   LIKE sffa_t.sffadocdt
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_slip        LIKE ooba_t.ooba002
   DEFINE l_flag        LIKE type_t.chr1
   DEFINE l_sffb014     LIKE sffb_t.sffb014
   DEFINE l_sffe002     LIKE sffe_t.sffe002
   DEFINE l_sffe003     LIKE sffe_t.sffe003
   #191111-00013#1 -s add
   DEFINE l_sffb001     LIKE sffb_t.sffb001   #報工類別
   DEFINE l_sffb006     LIKE sffb_t.sffb006   #RunCard
   DEFINE l_sffb007     LIKE sffb_t.sffb007   #作業編號
   DEFINE l_sffb008     LIKE sffb_t.sffb008   #作業序
   DEFINE l_sffb020     LIKE sffb_t.sffb020   #回收數量
   DEFINE ls_js         STRING
   DEFINE lc_param      type_sffb_parameter
   #191111-00013#1 -e add
   DEFINE l_slip1       LIKE ooba_t.ooba002   #工單單別   #191111-00013#1 add
   DEFINE l_sfaa047     LIKE sfaa_t.sfaa047   #210409-00003#1 add
   DEFINE l_sfaa048     LIKE sfaa_t.sfaa047   #210409-00003#1 add
  
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
      
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00036'
      LET g_errparam.extend = 's_asft335_conf_chk'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #检查为未审核的才可以
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   LET l_flag = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0092')
   
   DECLARE sel_sffbstus_c1 CURSOR FOR
      SELECT sffbseq,sffbstus,sffbdocdt,sffb012,sffb014,sffb017,sffb018,sffb019,sffb005
             ,(SELECT sfaadocdt FROM sfaa_t WHERE sfaadocno = sffb005 AND sfaaent = g_enterprise) sfaadocdt
             ,sffb001,sffb006,sffb007,sffb008,sffb020   #191111-00013#1 add             
        FROM sffb_t
       WHERE sffbent   = g_enterprise
         AND sffbsite  = g_site
         AND sffbdocno = p_docno
   FOREACH sel_sffbstus_c1 INTO l_sffbseq,l_sffbstus,l_sffbdocdt,l_sffb012,l_sffb014,l_sffb017,l_sffb018,l_sffb019,l_sffb005,l_sfaadocdt
                               ,l_sffb001,l_sffb006,l_sffb007,l_sffb008,l_sffb020   #191111-00013#1 add   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'sel_sffbstus'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      IF l_sffbstus NOT MATCHES '[NA]' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'afa-00024'
         LET g_errparam.extend = l_sffbstus
         LET g_errparam.coll_vals[1] = l_sffbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #如果是批次报工单，检核的日期为sffadocdt
      IF g_prog='asft330' THEN 
         SELECT sffadocdt INTO l_sffbdocdt FROM sffa_t WHERE sffaent=g_enterprise AND sffadocno=p_docno 
      END IF 
      #[單據日期]和[完成日期]是否小于等于关账日期
      IF l_sffb012 > l_sffbdocdt THEN
         IF NOT s_date_chk_close(l_sffbdocdt,'1') THEN
            LET r_success = FALSE
         END IF
      ELSE
         IF NOT s_date_chk_close(l_sffb012,'1') THEN
            LET r_success = FALSE
         END IF
      END IF
      #210429-00003#1---add----str---
      #增加以下控卡:
      #(1)報工日期不可小於工單的單據日期(sfaadocdt)
      #(2)報工日期不可小於=庫存關帳日期 'S-MFG-0031'
      #(3)報工日期不可小於=成本關帳日期 'S-FIN-6012'
      #下面二點不需做,因為報工有控卡工單狀態結案就不可以報工了,故(4)(5)不用做
      #(4)報工日期不可大於生管結案日(sfaa047)
      #(5)報工日期不可大於成本結案日(sfaa048) 
      LET l_sfaa047 = NULL
      LET l_sfaa048 = NULL
      SELECT   sfaa047,  sfaa048 
        INTO l_sfaa047,l_sfaa048
        FROM sfaa_t
       WHERE sfaaent   = g_enterprise
         AND sfaasite  = g_site
         AND sfaadocno = p_docno
      #(1)報工日期不可小於工單的單據日期(sfaadocdt)
      IF l_sffb012 < l_sfaadocdt THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code  = 'asf-01078'      #日期%1不可小於工單單據日期%2！ 
          LET g_errparam.replace[1] = l_sffb012
          LET g_errparam.replace[2] = l_sfaadocdt
          LET g_errparam.extend= p_docno
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success = FALSE
      END IF
      
      #(2)報工日期不可小於=庫存關帳日期 'S-MFG-0031'
      IF NOT s_date_chk_close(l_sffb012,'1') THEN
         LET r_success = FALSE
      END IF
       
      #(3)報工日期不可小於=成本關帳日期 'S-FIN-6012'
      IF NOT s_date_chk_close(l_sffb012,'2') THEN
         LET r_success = FALSE
      END IF
      #210429-00003#1---add----end---
      
      IF l_flag = 'Y' THEN
         LET l_sffe002 = 0
         LET l_sffe003 = 0
         SELECT SUM(sffe002),SUM(sffe003) INTO l_sffe002,l_sffe003
           FROM sffe_t
          WHERE sffeent = g_enterprise
            AND sffedocno = p_docno
            AND sffeseq = l_sffbseq
         IF cl_null(l_sffe002) THEN LET l_sffe002 = 0 END IF
         IF cl_null(l_sffe003) THEN LET l_sffe003 = 0 END IF
         IF l_sffb014 <> l_sffe002 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_sffbseq 
            LET g_errparam.code   = "asf-00751"
            LET g_errparam.replace[1] = l_sffb014
            LET g_errparam.replace[2] = l_sffe002
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET r_success = FALSE
         END IF
         IF l_sffb017 <> l_sffe003 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_sffbseq 
            LET g_errparam.code   = "asf-00752"
            LET g_errparam.replace[1] = l_sffb017
            LET g_errparam.replace[2] = l_sffe003
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
      LET l_sffd002_sum = 0
      SELECT SUM(sffd002) INTO l_sffd002_sum
        FROM sffd_t
       WHERE sffdent = g_enterprise
         AND sffddocno = p_docno
         AND sffdseq = l_sffbseq
      IF cl_null(l_sffd002_sum) THEN LET l_sffd002_sum = 0 END IF
      IF l_sffd002_sum > l_sffb017+l_sffb018+l_sffb019 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ""
         LET g_errparam.code = 'asf-00856'
         LET g_errparam.popup = TRUE 
         CALL cl_err() 
         LET r_success = FALSE        
      END IF
#      SELECT sfaadocdt INTO l_sfaadocdt FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sffb005#200605-00064#1 mark
#      SELECT sffbdocdt INTO l_sffadocdt FROM sffb_t WHERE sffbent=g_enterprise AND  sffbdocno=p_docno#200605-00064#1 mark

      SELECT sfaadocdt INTO l_sfaadocdt FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sffb005 AND rownum = 1#200605-00064#1 add #ODI-ORA#

      SELECT sffbdocdt INTO l_sffadocdt FROM sffb_t WHERE sffbent=g_enterprise AND  sffbdocno=p_docno AND rownum = 1#200605-00064#1 add #ODI-ORA#
      IF g_prog='asft330' THEN 
#         SELECT sffadocdt INTO l_sffadocdt FROM sffa_t WHERE sffaent=g_enterprise AND sffadocno=p_docno#200605-00064#1 mark

         SELECT sffadocdt INTO l_sffadocdt FROM sffa_t WHERE sffaent=g_enterprise AND sffadocno=p_docno AND rownum = 1#200605-00064#1 add #ODI-ORA#
      END IF    
      IF l_sfaadocdt>l_sffadocdt THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00894'   #單據日期不可小於工單單據日期！
         LET g_errparam.extend = p_docno,'/',l_sffbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE  
      END IF
      
      #191111-00013#1 -s add
      #检查良品数量，报废数量，当站下线数量和回收数量
      #在依順序報工時，應用良品轉入的數量判斷，且總數不可大於標準產出量*（1+允許超交率/100)
      #如不照順序報工，則判斷報工總量不可超過，標準產出量*(1+允許超交率）
      CALL s_aooi200_get_slip(l_sffb005) RETURNING l_success,l_slip1
      IF l_sffb001 = '3' AND cl_get_doc_para(g_enterprise,g_site,l_slip1,'D-MFG-0045') ='N' THEN
         LET l_sffb017 = 0
        #201229-00031#1---mod---str--- 
        #SELECT SUM(sffb017) INTO l_sffb017
         SELECT SUM(sffb017),SUM(sffb018),SUM(sffb019),SUM(sffb020)
           INTO l_sffb017,l_sffb018,l_sffb019,l_sffb020
        #201229-00031#1---mod---str--- 
           FROM sffb_t
          WHERE sffbent  = g_enterprise
            AND sffbsite = g_site
            AND sffb005  = l_sffb005
            AND sffb006  = l_sffb006
            AND sffb007  = l_sffb007
            AND sffb008  = l_sffb008
            AND sffbstus <> 'X'
            AND sffbdocno = p_docno #191125-00048#1(2) 應限製在當下的報工單
         IF cl_null(l_sffb017) THEN LET l_sffb017 = 0 END IF
      
         LET lc_param.sffbdocno = p_docno      #報工單號
         LET lc_param.sffbseq   = l_sffbseq    #項次
         LET lc_param.sffb001   = l_sffb001    #報工類別
         LET lc_param.sffb005   = l_sffb005    #工單單號
         LET lc_param.sffb006   = l_sffb006    #Run Card
         LET lc_param.sffb007   = l_sffb007    #作業編號
         LET lc_param.sffb008   = l_sffb008    #製程式
         LET lc_param.sffb017   = l_sffb017    #良品數量
         LET lc_param.sffb018   = l_sffb018    #報廢數量
         LET lc_param.sffb019   = l_sffb019    #當站下線數量
         LET lc_param.sffb020   = l_sffb020    #回收數量
         LET ls_js = util.JSON.stringify(lc_param)
         IF NOT s_asft335_chk_qty(ls_js) THEN
            LET r_success = FALSE
         END IF
      END IF
      #191111-00013#1 -e add
   END FOREACH
   #检查check in/check out必要项目都填了
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM sffc_t
    WHERE sffcent   = g_enterprise
      AND sffcsite  = g_site
      AND sffcdocno = p_docno
      AND sffc006   = 'Y'
      AND sffc005 IS NULL
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00037'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF 
   
   #190702-00010#14 -S add
   #檢查是否有PQC
   SELECT COUNT(1)
     INTO l_cnt
     FROM sfcb_t,sffb_t
    WHERE sfcbent = sffbent
      AND sfcbdocno = sffb005
      AND sfcb001 = sffb006
      AND sfcb003 = sffb007
      AND sfcb004 = sffb008
      AND sffbent = g_enterprise
      AND sffbdocno = p_docno
      AND sffb001 = '3'
      AND sfcb017 = 'Y'
   IF l_cnt > 0 THEN
      #檢查是否有與sQMS或SPC整合
      IF s_aqct300_is_sqms() THEN
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
   #190702-00010#14 -E add
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 确认更新
# Memo...........: #171113-00002#1
################################################################################
PUBLIC FUNCTION s_asft335_conf_upd(p_docno)
   DEFINE p_docno       LIKE sffb_t.sffbdocno    #审核单号
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sffbstus    LIKE sffb_t.sffbstus
   DEFINE l_sffbseq     LIKE sffb_t.sffbseq      
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE g_time1       DATETIME YEAR TO SECOND
   DEFINE l_sffd002_sum LIKE sffd_t.sffd002
   DEFINE l_sffb017     LIKE sffb_t.sffb017
   DEFINE l_sffb018     LIKE sffb_t.sffb018
   DEFINE l_sffb019     LIKE sffb_t.sffb019
   DEFINE l_sffb012     LIKE sffb_t.sffb012    
   DEFINE l_sffbdocdt   LIKE sffb_t.sffbdocdt  
   DEFINE l_sffb005     LIKE sffb_t.sffb005
   DEFINE l_sfaadocdt   LIKE sfaa_t.sfaadocdt
   DEFINE l_sffadocdt   LIKE sffa_t.sffadocdt
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_slip        LIKE ooba_t.ooba002
   DEFINE l_flag        LIKE type_t.chr1
   DEFINE l_sffb014     LIKE sffb_t.sffb014
   DEFINE l_sffe002     LIKE sffe_t.sffe002
   DEFINE l_sffe003     LIKE sffe_t.sffe003
  
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET g_time1 = cl_get_current()
   
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00036'
      LET g_errparam.extend = 's_asft335_conf_upd'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #开始审核的干活
   #先更新状态码为Y
   UPDATE sffb_t SET sffbstus  = 'Y',
                     sffbcnfdt = g_time1,
                     sffbcnfid = g_user
    WHERE sffbent = g_enterprise
      AND sffbsite = g_site
      AND sffbdocno = p_docno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'updsffbstus'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF 
   IF SQLCA.sqlerrd[3] = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00038'
      LET g_errparam.extend = 'select'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #若是asft330调用，则多更新一个单头档   
   IF g_prog MATCHES 'asft330*' OR g_prog MATCHES 'asft331*' OR g_prog MATCHES 'asft332*' OR g_prog MATCHES 'asft333*' OR g_prog MATCHES 'asft334*' THEN   #170301-00021#9 by 09263 --add
      UPDATE sffa_t SET sffastus = 'Y',
                        sffacnfdt = g_time1,
                        sffacnfid = g_user
       WHERE sffaent = g_enterprise
         AND sffasite = g_site
         AND sffadocno = p_docno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'updsffastus'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF 
      IF SQLCA.sqlerrd[3] = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00038'
         LET g_errparam.extend = 'select'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF   
   END IF
   LET g_sffadocno = p_docno
   #调用更新工单制程进度元件
   IF NOT s_asft335_upd_routing(1,p_docno) THEN
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: BPM流程前置处理
# Memo...........: #171113-00002#1
################################################################################
PUBLIC FUNCTION s_asft335_ws_preprocess()
#s_asft335_cre_tmp_table
   DEFINE r_success LIKE type_t.chr1

   CALL s_asft335_cre_tmp_table() RETURNING r_success

   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_success = 'N' #若有異常會影響確認段結果，故返回N
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "s_asft335_ws_preprocess()"
      LET g_errparam.popup = FALSE
      CALL cl_err()
   END IF
END FUNCTION

################################################################################
# Descriptions...: BPM流程后置处理
# Memo...........: #171113-00002#1
################################################################################
PUBLIC FUNCTION s_asft335_ws_postprocess()
   CALL s_asft335_drop_tmp_table()

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_success = 'N' #若有異常會影響確認段結果，故返回N
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "s_asft335_ws_postprocess()"
      LET g_errparam.popup = FALSE
      CALL cl_err()
   END IF
END FUNCTION

################################################################################
# Descriptions...: 計算累加報廢量/下線量
# Memo...........:
# Usage..........: CALL s_asft335_calculate_scrap_qty(p_type,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
#                  RETURNING r_success,r_qty
# Input parameter: p_type         計算類型(1.包含本站作業量,2.計算本站作業前的量)
#                : p_sfcbdocno    工單單號
#                : p_sfcb001      RunCard
#                : p_sfcb003      本站作業
#                : p_sfcb004      本站作業序
# Return code....: r_success      執行成功否
#                : r_qty1         報廢量
#                : r_qty2         下線量
# Date & Author..: 19/07/09 By 07423 (#190709-00006#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_calculate_scrap_qty(p_type,p_sfcbdocno,p_sfcb001,p_sfcb003,p_sfcb004)
   DEFINE p_type          LIKE type_t.chr1      
   DEFINE p_sfcbdocno     LIKE sfcb_t.sfcbdocno  #工單單號
   DEFINE p_sfcb001       LIKE sfcb_t.sfcb001    #RunCard
   DEFINE p_sfcb003       LIKE sfcb_t.sfcb003    #本站作業
   DEFINE p_sfcb004       LIKE sfcb_t.sfcb004    #本站作業序
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_qty1          LIKE sfcb_t.sfcb027    #報廢量
   DEFINE r_qty2          LIKE sfcb_t.sfcb027    #下線量
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_sql           STRING
   DEFINE l_path          LIKE type_t.chr300
   DEFINE l_qty1          LIKE sfcb_t.sfcb027
   DEFINE l_qty2          LIKE sfcb_t.sfcb027
   DEFINE l_sfcb036       LIKE sfcb_t.sfcb036    #存放本作業編號/作業序的報廢量
   DEFINE l_sfcb037       LIKE sfcb_t.sfcb037    #存放本作業編號/作業序的下線量
   DEFINE l_sfcb005       LIKE sfcb_t.sfcb005    #171129-00035#2 add
   DEFINE l_sfcb006       LIKE sfcb_t.sfcb006    #171129-00035#2 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   LET r_qty1 = 0
   LET r_qty2 = 0
   DELETE FROM s_asft335_tmp05
   DELETE FROM s_asft335_tmp06
   
   #將製程展開本站作業/作業序與上站作業/作業序資料新增至temp table
   LET l_sql = " INSERT INTO s_asft335_tmp05 ",
              #" SELECT sfcbdocno,sfcb001,sfcb002,sfcb003,sfcb004,sfcc003,sfcc004 ",                          #171129-00035#2 mark
               " SELECT sfcbdocno,sfcb001,sfcb002,sfcb003,sfcb004,sfcb005,sfcb006,sfcc003,sfcc004,'1','' ",   #171129-00035#2 add
               "   FROM sfcb_t LEFT OUTER JOIN sfcc_t ON sfcbent = sfccent AND sfcbdocno = sfccdocno AND sfcb001 = sfcc001 AND sfcb002 = sfcc002 ",
               "  WHERE sfcbent = ",g_enterprise,
               "    AND sfcbdocno = ? AND sfcb001 = ? ",
               "  UNION ",
              #" SELECT sfcbdocno,sfcb001,sfcb002,sfcb009,sfcb010,sfcb003,sfcb004 ",                          #171129-00035#2 mark
               " SELECT sfcbdocno,sfcb001,sfcb002,sfcb009,sfcb010,'1','',sfcb003,sfcb004,'1','' ",            #171129-00035#2 add
               "   FROM sfcb_t LEFT OUTER JOIN sfcc_t ON sfcbent = sfccent AND sfcbdocno = sfccdocno AND sfcb001 = sfcc001 AND sfcb002 = sfcc002 ", 
               "  WHERE sfcbent = ",g_enterprise,
               "   AND sfcbdocno = ? AND sfcb001 = ? AND sfcb009 = 'END' " 
               
   PREPARE s_asft335_scrap_p1 FROM l_sql
   EXECUTE s_asft335_scrap_p1 USING p_sfcbdocno,p_sfcb001,p_sfcbdocno,p_sfcb001
   FREE s_asft335_scrap_p1
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asft335_scrap_p1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success,r_qty1,r_qty2
   END IF
   
   #171129-00035#2 add --(S)--
   #置換替代製程的作業編號 (作業編號 -> 群組編號)
   #PGS(D)-00824 ---start---
   LET l_sql = " MERGE INTO s_asft335_tmp05 a ",
               " USING (SELECT b1.sfcb003,b1.sfcb004,b1.sfcb005,b1.sfcb006 FROM s_asft335_tmp05 b1 WHERE b1.sfcb005 = '2' ) b ",
               "    ON (a.sfcc003 = b.sfcb003 AND a.sfcc004 = b.sfcb004) ",
               "  WHEN MATCHED THEN ",
               "UPDATE SET a.sfcb005_1 = b.sfcb005, ",
               "           a.sfcb006_1 = b.sfcb006  "
   #PGS(D)-00824 --- end ---
               
   PREPARE s_asft335_scrap_p11 FROM l_sql
   EXECUTE s_asft335_scrap_p11 
   FREE s_asft335_scrap_p11
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asft335_scrap_p11"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success,r_qty1,r_qty2
   END IF            
   
   LET l_sql = " UPDATE s_asft335_tmp05 ",
               "    SET sfcb003 = sfcb006 ",
               "  WHERE sfcb005 = '2' "

   PREPARE s_asft335_scrap_p12 FROM l_sql
   EXECUTE s_asft335_scrap_p12 
   FREE s_asft335_scrap_p12
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asft335_scrap_p12"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success,r_qty1,r_qty2
   END IF     
   
   LET l_sql = " UPDATE s_asft335_tmp05 ",
               "    SET sfcc003 = sfcb006_1 ",
               "  WHERE sfcb005_1 = '2' "

   PREPARE s_asft335_scrap_p13 FROM l_sql
   EXECUTE s_asft335_scrap_p13 
   FREE s_asft335_scrap_p13
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asft335_scrap_p13"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success,r_qty1,r_qty2
   END IF     
   #171129-00035#2 add --(E)--
   
   #取得本站作業編號/作業序的上站作業編號/作業序
  #LET l_sql = "SELECT sfcc003,sfcc004 ",                                 #171129-00035#2 mark
   LET l_sql = "SELECT sfcc003,sfcc004,sfcb005_1,sfcb006_1 ",             #171129-00035#2 add
               "  FROM s_asft335_tmp05 ",         
               " WHERE sfcb003 = ? AND sfcb004 = ? ",
               "   AND NOT (sfcb003 = sfcc003 AND sfcb004 = sfcc004) ",   #171129-00035#2 add #因為置換替代製程的作業編號,造成可能會有本站的上站還是本站的狀況,因此需要排除
               " GROUP BY sfcc003,sfcc004,sfcb005_1,sfcb006_1 ",          #171129-00035#2 add
               " ORDER BY sfcc003"
  
   PREPARE s_asft335_scrap_p2 FROM l_sql               
   DECLARE s_asft335_scrap_c2 CURSOR FOR s_asft335_scrap_p2
   
   #計算本站作業編號/作業序的報廢量
   LET l_sql = "SELECT sfcb036*sfcb054/sfcb053*sfcb021/sfcb022,sfcb037*sfcb054/sfcb053*sfcb021/sfcb022 ",
               "  FROM sfcb_t ",
               " WHERE sfcbent   = ",g_enterprise,
               "   AND sfcbdocno = '",p_sfcbdocno,"'",    #單號
               "   AND sfcb001   = ",p_sfcb001,           #RUN CARD
               "   AND sfcb003   = ? ",                   #本站作業編號
               "   AND sfcb004   = ? "                    #本站作業序
   PREPARE s_asft335_scrap_p3 FROM l_sql
   
   #171129-00035#2 add --(S)--
   #計算本站作業編號/作業序相同替代群組的報廢量 
   LET l_sql = "SELECT SUM(A.sfcb036*A.sfcb054/A.sfcb053*A.sfcb021/A.sfcb022),SUM(A.sfcb037*A.sfcb054/A.sfcb053*A.sfcb021/A.sfcb022) ",
               "  FROM sfcb_t A ",
               " WHERE A.sfcbent   = ",g_enterprise,
               "   AND A.sfcbdocno = '",p_sfcbdocno,"'",    #單號
               "   AND A.sfcb001   = ",p_sfcb001,           #RUN CARD
               "   AND A.sfcb005   = '2' ",                 #群組性質
               "   AND A.sfcb006   = ? "
   PREPARE s_asft335_scrap_p31 FROM l_sql
   #171129-00035#2 add --(E)--
   
   #將所有路徑的加總報廢量/下線量新增至temp table
   LET l_sql = " INSERT INTO s_asft335_tmp06 (sfcb036,sfcb037) VALUES (?,?) "
   PREPARE s_asft335_scrap_p4 FROM l_sql   

   LET l_path = p_sfcb003,',',p_sfcb004
   LET l_qty1 = 0
   LET l_qty2 = 0
   
   CALL s_asft335_calculate_path(p_sfcb003,p_sfcb004,l_path,l_qty1,l_qty2)
      RETURNING l_success,l_path,l_qty1,l_qty2
   
   #取出最大加總報廢量/下線量
   SELECT MAX(sfcb036),MAX(sfcb037) INTO l_qty1,l_qty2
     FROM s_asft335_tmp06

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "SELECT MAX(sfcb036) ERROR"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success,r_qty1,r_qty2
   END IF

   IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
   IF cl_null(l_qty2) THEN LET l_qty2 = 0 END IF
   
   #計算本站的報廢量與下線量
   IF p_type = '1' THEN
      LET l_sfcb036 = 0
      LET l_sfcb037 = 0
     #EXECUTE s_asft335_scrap_p4 USING p_sfcb003,p_sfcb004 INTO l_sfcb036,l_sfcb037   #171129-00035#2 mark
      #171129-00035#2 add --(S)--
      SELECT sfcb005,sfcb006 INTO l_sfcb005,l_sfcb006
        FROM sfcb_t
       WHERE sfcbent   = g_enterprise
         AND sfcbdocno = p_sfcbdocno  
         AND sfcb001   = p_sfcb001
         
      IF l_sfcb005 = '2' THEN
         EXECUTE s_asft335_scrap_p31 USING l_sfcb006 INTO l_sfcb036,l_sfcb037
      ELSE
         EXECUTE s_asft335_scrap_p3 USING p_sfcb003,p_sfcb004 INTO l_sfcb036,l_sfcb037
      END IF
      #171129-00035#2 add --(E)--
      IF cl_null(l_sfcb036) THEN LET l_sfcb036 = 0 END IF
      IF cl_null(l_sfcb037) THEN LET l_sfcb037 = 0 END IF
      LET l_qty1 = l_qty1 + l_sfcb036
      LET l_qty2 = l_qty2 + l_sfcb037
   END IF
   
   LET r_success = TRUE
   LET r_qty1 = l_qty1
   LET r_qty2 = l_qty2
   RETURN r_success,r_qty1,r_qty2
END FUNCTION

################################################################################
# Descriptions...: 取得所有製程路徑的累加報廢量/下線量
# Memo...........:
# Usage..........: CALL s_asft335_calculate_path(p_sfcb003,p_sfcb004,p_path,p_qty1,p_qty2)
#                  RETURNING r_success,r_path,r_qty1,r_qty2
# Input parameter: p_sfcb003      作業編號
#                : p_sfcb004      作業序
#                : p_path         路徑資料
#                : p_qty1         報廢量
#                : p_qty2         下線量
# Return code....: r_success      執行成功否
#                : r_path         路徑資料
#                : r_qty1         報廢量
#                : r_qty2         下線量
# Date & Author..: 19/07/09 By 07423 (#190709-00006#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_calculate_path(p_sfcb003,p_sfcb004,p_path,p_qty1,p_qty2)
   DEFINE p_sfcb003    LIKE sfcb_t.sfcb003
   DEFINE p_sfcb004    LIKE sfcb_t.sfcb004
   DEFINE p_path       LIKE type_t.chr300
   DEFINE p_qty1       LIKE sfcb_t.sfcb027
   DEFINE p_qty2       LIKE sfcb_t.sfcb027
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_path       LIKE type_t.chr300
   DEFINE r_qty1       LIKE sfcb_t.sfcb027
   DEFINE r_qty2       LIKE sfcb_t.sfcb027
   DEFINE l_sql        STRING
   DEFINE l_path       LIKE type_t.chr300    #驗證路徑是否正確
   DEFINE l_qty1       LIKE sfcb_t.sfcb027   #存放累加的報廢量
   DEFINE l_qty2       LIKE sfcb_t.sfcb027   #存放累加的下線量
   DEFINE l_sfcb036    LIKE sfcb_t.sfcb036   #存放本作業編號/作業序的報廢量
   DEFINE l_sfcb037    LIKE sfcb_t.sfcb037   #存放本作業編號/作業序的下線量
   DEFINE l_sfcc003    LIKE sfcc_t.sfcc003   #上站作業編號
   DEFINE l_sfcc004    LIKE sfcc_t.sfcc004   #上站作業序
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_sfcc       DYNAMIC ARRAY OF RECORD
             sfcc003   LIKE sfcc_t.sfcc003,
             sfcc004   LIKE sfcc_t.sfcc004,  #171129-00035#2 add ,
             sfcb005   LIKE sfcb_t.sfcb005,  #171129-00035#2 add
             sfcb006   LIKE sfcb_t.sfcb006   #171129-00035#2 add
          END RECORD
   DEFINE i            LIKE type_t.num10
   DEFINE li           LIKE type_t.num10
   DEFINE l_sfcb005    LIKE sfcb_t.sfcb005   #171129-00035#2 add
   DEFINE l_sfcb006    LIKE sfcb_t.sfcb006   #171129-00035#2 add   
   
   LET r_success = FALSE
   LET l_path = p_path
   LET l_qty1 = p_qty1
   LET l_qty2 = p_qty2
   
   #將此作業編號/作業序的上站資料存入ARRAY
   CALL l_sfcc.clear()
   LET i = 0
  #FOREACH s_asft335_scrap_c2 USING p_sfcb003,p_sfcb004 INTO l_sfcc003,l_sfcc004                       #171129-00035#2 mark
   FOREACH s_asft335_scrap_c2 USING p_sfcb003,p_sfcb004 INTO l_sfcc003,l_sfcc004,l_sfcb005,l_sfcb006   #171129-00035#2 add
      LET i = i+1
      LET l_sfcc[i].sfcc003 = l_sfcc003
      LET l_sfcc[i].sfcc004 = l_sfcc004
      LET l_sfcc[i].sfcb005 = l_sfcb005   #171129-00035#2 add
      LET l_sfcc[i].sfcb006 = l_sfcb006   #171129-00035#2 add
   END FOREACH
   
   #找出所有製程路徑,計算累加報廢量與下線量
   FOR li = 1 TO l_sfcc.getLength()
       LET l_path = p_path
       LET l_qty1 = p_qty1
       LET l_qty2 = p_qty2
       #若已經到起點的時候,將資料存入temp table裡,不需繼續執行
      #IF l_sfcc003 = 'INIT' THEN            #171129-00035#2 mark
       IF l_sfcc[li].sfcc003 = 'INIT' THEN   #171129-00035#2 add
          IF NOT cl_null(l_path) THEN LET l_path = l_path,'/' END IF
          LET l_path = l_path,l_sfcc[li].sfcc003,",",l_sfcc[li].sfcc004
          EXECUTE s_asft335_scrap_p4 USING l_qty1,l_qty2
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code   = SQLCA.sqlcode
             LET g_errparam.extend = "EXECUTE s_asft335_scrap_p4"
             LET g_errparam.popup  = TRUE
             CALL cl_err()
             RETURN r_success,l_path,l_qty1,l_qty2
          END IF
          CONTINUE FOR         
       ELSE
          IF NOT cl_null(l_path) THEN LET l_path = l_path,'/' END IF
          LET l_path = l_path,l_sfcc[li].sfcc003,",",l_sfcc[li].sfcc004
          LET l_sfcb036 = 0
          LET l_sfcb037 = 0
          #計算上一作業編號/作業序的報廢量與下線量
          #171129-00035#2 add --(S)--
          #若為替代群組,計算整個群組加總的報廢量與下線量
          IF l_sfcc[li].sfcb005 = '2' THEN
             EXECUTE s_asft335_scrap_p31 USING l_sfcc[li].sfcb006 INTO l_sfcb036,l_sfcb037
          ELSE
          #171129-00035#2 add --(E)--
             EXECUTE s_asft335_scrap_p3 USING l_sfcc[li].sfcc003,l_sfcc[li].sfcc004 INTO l_sfcb036,l_sfcb037
          END IF   #171129-00035 add
          IF cl_null(l_sfcb036) THEN LET l_sfcb036 = 0 END IF
          IF cl_null(l_sfcb037) THEN LET l_sfcb037 = 0 END IF
          LET l_qty1 = l_qty1 + l_sfcb036
          LET l_qty2 = l_qty2 + l_sfcb037
          
          CALL s_asft335_calculate_path(l_sfcc[li].sfcc003,l_sfcc[li].sfcc004,l_path,l_qty1,l_qty2) 
             RETURNING l_success,l_path,l_qty1,l_qty2
          
          IF NOT l_success THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code   = SQLCA.sqlcode
             LET g_errparam.extend = "EXECUTE s_asft335_calculate_path() ERROR"
             LET g_errparam.popup  = TRUE
             CALL cl_err()
             RETURN r_success,l_path,l_qty1,l_qty2
          END IF
       END IF
   END FOR
               
   LET r_success = TRUE
   LET r_path = l_path
   LET r_qty1 = l_qty1
   LET r_qty2 = l_qty2   
   RETURN r_success,r_path,r_qty1,r_qty2
END FUNCTION

################################################################################
# Descriptions...: 目前可報工的良品轉出量
# Memo...........: 參考s_asft335_chk_qty()調整
# Usage..........: CALL s_asft335_def_qty(ls_js)
#                  RETURNING r_success,r_def_qty
# Input parameter: ls_js   
# Return code....: r_success      執行結果
#                : r_def_qty      目前可報工的良品數量
# Date & Author..: 19/08/30 By 07423 (#171129-00035#2 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft335_def_qty(ls_js)
   DEFINE ls_js             STRING
   DEFINE lc_param          type_sffb_parameter
   DEFINE r_success         LIKE type_t.num5
   DEFINE r_def_qty         LIKE sffb_t.sffb017
   DEFINE l_sfaa010         LIKE sfaa_t.sfaa010
   DEFINE l_sfaa013         LIKE sfaa_t.sfaa013   
   DEFINE l_imae020         LIKE imae_t.imae020
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_sql             STRING
   DEFINE l_qty             LIKE sfcb_t.sfcb050
   DEFINE l_sfcb027         LIKE sfcb_t.sfcb027
   DEFINE l_sfcb028         LIKE sfcb_t.sfcb028
   DEFINE l_sfcb_chk        LIKE sfcb_t.sfcb028   
   DEFINE l_sfca005         LIKE sfca_t.sfca005  
   DEFINE l_sfcb_chk1       LIKE sfcb_t.sfcb028   #已報工項目
   DEFINE l_sfcb007         LIKE sfcb_t.sfcb007   #上站作業
   DEFINE l_sfcb029         LIKE sfcb_t.sfcb029   
   DEFINE l_sfcb046         LIKE sfcb_t.sfcb046   #待Move in數   
   DEFINE l_sfcb047         LIKE sfcb_t.sfcb047   #待Check in數   
   DEFINE l_sfcb048         LIKE sfcb_t.sfcb048   #待Check out數   
   DEFINE l_sfcb049         LIKE sfcb_t.sfcb049   #待Move out數
   DEFINE l_sfcb050         LIKE sfcb_t.sfcb050   #在製數   
   DEFINE l_sfcb051         LIKE sfcb_t.sfcb051   #待PQC數   
   DEFINE l_sfcb_chk2       LIKE sfcb_t.sfcb047   
   DEFINE l_sfcb021         LIKE sfcb_t.sfcb021   
   DEFINE l_sfcb022         LIKE sfcb_t.sfcb022   
   DEFINE l_sfcb053         LIKE sfcb_t.sfcb053   
   DEFINE l_sfcb054         LIKE sfcb_t.sfcb054   
   DEFINE l_sfcb002         LIKE sfcb_t.sfcb002
   DEFINE l_sfcb005         LIKE sfcb_t.sfcb005   
   DEFINE l_sfcb006         LIKE sfcb_t.sfcb006  
   DEFINE l_new_sfcb002     LIKE sfcb_t.sfcb002
   DEFINE l_new_sfcb003     LIKE sfcb_t.sfcb003
   DEFINE l_new_sfcb004     LIKE sfcb_t.sfcb004
   DEFINE l_td_sum          LIKE sfcb_t.sfcb027
   DEFINE l_qty2            LIKE sfcb_t.sfcb027
   DEFINE l_qty3            LIKE sfcb_t.sfcb027  #報廢+下線
   DEFINE l_qty4            LIKE sfaa_t.sfaa050  #完工入庫量(完工入库单中存在(不管过帐还是未审核等状态))
   DEFINE r_type            LIKE type_t.chr2 
   DEFINE l_cnt             LIKE type_t.num10
   DEFINE l_sql2            STRING
   DEFINE l_flag            LIKE type_t.num5
   DEFINE l_sfga016         LIKE sfga_t.sfga016     #来源PQC单号  
   DEFINE l_sfcb030         LIKE sfcb_t.sfcb030   #回收转入
   DEFINE l_qcbc009         LIKE qcbc_t.qcbc009   #PQC轉回當站量
   DEFINE l_ooba002         LIKE ooba_t.ooba002  #单别
   DEFINE l_d_mfg_0104      LIKE type_t.chr1     #依报工站检查齐套(D-MFG-0104)
   DEFINE l_fullflag        LIKE type_t.num5     #是否要控管齊套數
   DEFINE l_n1              LIKE type_t.num10
   DEFINE l_n2              LIKE type_t.num10
   DEFINE l_fullqty         LIKE sfcb_t.sfcb027
   DEFINE l_sfcb041         LIKE sfcb_t.sfcb041 
   DEFINE l_sfcb042         LIKE sfcb_t.sfcb042 
   DEFINE l_sfcb008         LIKE sfcb_t.sfcb008 
   DEFINE l_qty5            LIKE sfcb_t.sfcb027 #下線量
   DEFINE l_sfcb036         LIKE sfcb_t.sfcb036 #當站已報廢量
   DEFINE l_d_mfg_0105      LIKE type_t.chr1    #可報工數只考慮良品數(D-MFG-0105)
   DEFINE l_def_qty         LIKE sffb_t.sffb017

   CALL util.JSON.parse(ls_js,lc_param)

   LET r_success = TRUE
   LET r_def_qty = 0
   
   IF lc_param.sffb005 IS NULL OR
      lc_param.sffb006 IS NULL OR
      lc_param.sffb007 IS NULL OR
      lc_param.sffb008 IS NULL THEN
      RETURN r_success,r_def_qty
   END IF
  
   IF NOT cl_null(lc_param.sffbdocno) THEN #来源pqc的不需要考虑
      LET l_sfga016 = NULL
      SELECT sfga016 INTO l_sfga016
        FROM sfga_t
       WHERE sfgadocno = lc_param.sffbdocno
         AND sfgaent = g_enterprise
      IF NOT cl_null(l_sfga016) THEN
         RETURN r_success,r_def_qty
      END IF
   END IF
   
   IF cl_null(lc_param.sffb017) THEN LET lc_param.sffb017 = 0 END IF
   IF cl_null(lc_param.sffb018) THEN LET lc_param.sffb018 = 0 END IF
   IF cl_null(lc_param.sffb019) THEN LET lc_param.sffb019 = 0 END IF
   IF cl_null(lc_param.sffb020) THEN LET lc_param.sffb020 = 0 END IF
   LET l_flag = FALSE   
   #抓取當站製程資料
   LET l_sfcb027 = 0
   LET l_sfcb028 = 0
   LET l_sfcb_chk = 0   
   LET l_sfcb_chk1 = 0  
   LET l_sfcb_chk2 = 0  
   SELECT sfcb027,(sfcb028+sfcb029+sfcb030+sfcb031+sfcb032),
          (sfcb033+sfcb034+sfcb035+sfcb036+sfcb037+sfcb038+sfcb039),     
          (sfcb033+sfcb034+sfcb035+sfcb036+sfcb037),
          sfcb007,sfcb008,sfcb028,sfcb029,sfcb046,
          sfcb047,sfcb048,sfcb049,sfcb050,sfcb051,
          sfcb021,sfcb022,sfcb053,sfcb054,sfcb030,
          sfcb041,sfcb042,sfcb036                                                    
     INTO l_sfcb027,
          l_sfcb_chk,l_sfcb_chk2,l_sfcb_chk1,
          l_sfcb007,l_sfcb008,l_sfcb028,l_sfcb029,l_sfcb046,
          l_sfcb047,l_sfcb048,l_sfcb049,l_sfcb050,l_sfcb051,
          l_sfcb021,l_sfcb022,l_sfcb053,l_sfcb054,l_sfcb030,
          l_sfcb041,l_sfcb042,l_sfcb036                                               
     FROM sfcb_t
    WHERE sfcbent   = g_enterprise
      AND sfcbsite  = g_site
      AND sfcbdocno = lc_param.sffb005     #單號
      AND sfcb001   = lc_param.sffb006     #RUN CARD
      AND sfcb003   = lc_param.sffb007     #本站作業
      AND sfcb004   = lc_param.sffb008     #作業序
      
   IF cl_null(l_sfcb027) THEN LET l_sfcb027 = 0 END IF
   IF cl_null(l_sfcb_chk) THEN LET l_sfcb_chk = 0 END IF
   IF cl_null(l_sfcb_chk1) THEN LET l_sfcb_chk1 = 0 END IF  
   IF cl_null(l_sfcb_chk2) THEN LET l_sfcb_chk2 = 0 END IF  
   
   LET l_qty3 = 0 
   LET l_qty5 = 0
   
   #l_qty3 = 本站作業前的報廢量, l_qty5 = 本站作業前的下線量
   CALL s_asft335_calculate_scrap_qty(2,lc_param.sffb005,lc_param.sffb006,lc_param.sffb007,lc_param.sffb008)
      RETURNING l_success,l_qty3,l_qty5      
      
   IF cl_null(l_qty3) THEN LET l_qty3 = 0 END IF
   IF cl_null(l_qty5) THEN LET l_qty5 = 0 END IF
   
   CALL s_aooi200_get_slip(lc_param.sffb005) RETURNING l_success,g_doc_slip
   
   #若[可报工数只考虑良品数]=Y,則可报工数量=转入量*(1+超交率)-除报废外的转出量,因此轉出量需扣除報廢量
   LET l_d_mfg_0105 = cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0105')
   IF cl_null(l_d_mfg_0105) THEN LET l_d_mfg_0105 = 'N' END IF
   IF l_d_mfg_0105 = 'Y' THEN
      LET l_sfcb_chk2 = l_sfcb_chk2 - l_sfcb036
      LET l_sfcb_chk1 = l_sfcb_chk1 - l_sfcb036
      LET l_qty3 = 0
   END IF   
   
   LET l_sfaa010 = ''
   LET l_sfaa013 = ''
   SELECT sfaa010,sfaa013 
     INTO l_sfaa010,l_sfaa013
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = lc_param.sffb005
   #容许误差率
   LET l_imae020 = 0
   SELECT imae020 INTO l_imae020
     FROM imae_t
    WHERE imaeent  = g_enterprise
      AND imaesite = g_site
      AND imae001  = l_sfaa010
   IF cl_null(l_imae020) THEN LET l_imae020 = 0 END IF
   
   LET l_fullflag = FALSE  
   LET l_fullqty = 0        
   
   #转入*（1+超交率）-转出-待做的
   #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
   CALL s_aooi200_get_slip(lc_param.sffb005) RETURNING l_success,l_ooba002
   LET l_d_mfg_0104 = cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0104')
      
   IF l_d_mfg_0104 = 'Y' THEN
      #備料是否有該作業編號備料      
      LET l_cnt = 0   
      SELECT COUNT(1) INTO l_cnt
        FROM sfba_t
       WHERE sfbaent = g_enterprise
         AND sfbadocno = lc_param.sffb005
         AND sfba003 = lc_param.sffb007
         AND sfba004 = lc_param.sffb008
         AND sfba008 IN ('1','2')       #需排除間接材料與參考材料
         
      #是否該作業編號備料都是倒扣料
      LET l_n1 = 0
      SELECT COUNT(1) INTO l_n1
        FROM sfba_t
       WHERE sfbaent = g_enterprise
         AND sfbadocno = lc_param.sffb005
         AND sfba003 = lc_param.sffb007
         AND sfba004 = lc_param.sffb008
         AND sfba009 = 'N'
         AND sfba008 IN ('1','2','3')   #是否全倒扣料的判斷需排除參考材料
            
      #是否所有備料都是倒扣料
      LET l_n2 = 0
      SELECT COUNT(1) INTO l_n2
        FROM sfba_t
       WHERE sfbaent = g_enterprise
         AND sfbadocno = lc_param.sffb005
         AND sfba009 = 'N' 
         AND sfba008 IN ('1','2','3')   #是否全倒扣料的判斷需排除參考材料            
            
      IF (l_cnt > 0 AND l_n1 > 0) THEN
         #可報工數量須用該作業編號/作業序的齊套數控管          
         CALL s_asft340_full_sets(lc_param.sffb005,lc_param.sffb007,lc_param.sffb008,'') 
            RETURNING l_success,l_sfcb_chk
         IF l_success THEN
            LET l_fullflag = TRUE
            LET l_fullqty = l_sfcb_chk
         END IF               
      END IF   
   END IF
   
   #剩餘可轉出量   
   IF lc_param.sffb001 = '1' THEN 
      LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 -  l_sfcb050 - l_sfcb051  
      IF l_sfcb_chk > l_sfcb046 THEN LET l_sfcb_chk = l_sfcb046 END IF      
   END IF
   IF lc_param.sffb001 = '2' THEN 
      LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 -  l_sfcb050 - l_sfcb051  
      IF l_sfcb_chk > l_sfcb047 THEN LET l_sfcb_chk = l_sfcb047 END IF      
   END IF
   IF lc_param.sffb001 = '3' THEN 
      LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 - l_sfcb049 - l_sfcb051  
      IF l_sfcb_chk > l_sfcb050 THEN LET l_sfcb_chk = l_sfcb050 END IF      
   END IF
   IF lc_param.sffb001 = '4' THEN 
      LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb049 -  l_sfcb050 - l_sfcb051  
      IF l_sfcb_chk > l_sfcb048 THEN LET l_sfcb_chk = l_sfcb048 END IF      
   END IF
   IF lc_param.sffb001 = '5' THEN 
      LET l_sfcb_chk = (l_sfcb_chk*(1+l_imae020/100) - l_sfcb046 - l_sfcb047) * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk2 - l_sfcb048 -  l_sfcb050 - l_sfcb051  
      IF l_sfcb_chk > l_sfcb049 THEN LET l_sfcb_chk = l_sfcb049 END IF      
   END IF
      
   LET l_qty = 0
   LET l_sql = "   FROM sffb_t ",
               "  WHERE sffbent  = ",g_enterprise,
               "    AND sffbsite = '",g_site,"' ",
               "    AND sffb005  = '",lc_param.sffb005,"' ",
               "    AND sffb006  = '",lc_param.sffb006,"' ",
               "    AND sffb007  = '",lc_param.sffb007,"' ",
               "    AND sffb008  = '",lc_param.sffb008,"' ",
               "    AND sffbstus <> 'X' "
   IF NOT cl_null(lc_param.sffbdocno) THEN
      IF cl_null(lc_param.sffbseq) THEN
         LET l_sql = l_sql," AND NOT (sffbdocno = '",lc_param.sffbdocno,"')"
      ELSE
         LET l_sql = l_sql," AND NOT (sffbdocno = '",lc_param.sffbdocno,"' AND sffbseq = '",lc_param.sffbseq,"')"
      END IF
   END IF
   #191107-00026#1(2)--add----str---
   IF l_d_mfg_0105 = 'Y' THEN
       #可報工收只考慮良品數(D-MFG-0105='Y')
       #l_qty 不含報廢數量sffb018
       IF cl_null(lc_param.sffb001) THEN
          LET l_sql = " SELECT MAX(SUM(sffb017+sffb019+sffb020)) ",l_sql," GROUP BY sffb001 "
       ELSE
          LET l_sql = " SELECT SUM(sffb017+sffb019+sffb020) ",l_sql," AND sffb001 = '",lc_param.sffb001,"' "
       END IF
   ELSE
   #191107-00026#1(2)--add----end---
       IF cl_null(lc_param.sffb001) THEN  #報廢
          LET l_sql = " SELECT MAX(SUM(sffb017+sffb018+sffb019+sffb020)) ",l_sql," GROUP BY sffb001 "
       ELSE
          LET l_sql = " SELECT SUM(sffb017+sffb018+sffb019+sffb020) ",l_sql," AND sffb001 = '",lc_param.sffb001,"' "
       END IF
   END IF #191107-00026#1(2) add
   PREPARE s_asft335_sffb_qty1 FROM l_sql
   EXECUTE s_asft335_sffb_qty1 INTO l_qty
   IF cl_null(l_qty) THEN LET l_qty = 0 END IF
   
   #取得PQC轉回當站量
   LET l_qcbc009 = 0
   IF cl_nuLL(lc_param.sffb007) THEN LET lc_param.sffb007 = 0 END IF  #PGS(D)-01534 add
   IF cl_nuLL(lc_param.sffb008) THEN LET lc_param.sffb008 = 0 END IF  #PGS(D)-01534 add
   SELECT SUM(qcbc009) INTO l_qcbc009
     FROM qcba_t,qcbc_t
    WHERE qcbaent = qcbcent AND qcbadocno = qcbcdocno
      AND qcbaent = g_enterprise
      AND qcba003 = lc_param.sffb005  #工單單號
     #AND qcba006 = lc_param.sffb007 AND qcba007 = lc_param.sffb008  #作業編號,作業序     #PGS(D)-01534 mark
      AND NVL(qcba006,null) = lc_param.sffb007 AND NVL(qcba007,0) = lc_param.sffb008    #PGS(D)-01534 add
      AND qcba029 = lc_param.sffb006  #RUN CARD
      AND qcbastus = 'Y'
      AND qcbc012 = '6'          
      
   IF cl_null(l_qcbc009) THEN LET l_qcbc009 = 0 END IF 
   IF cl_null(l_sfcb030) THEN LET l_sfcb030 = 0 END IF   
   
   #依順序報工
   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0045') ='N' THEN
      #取得已完工入庫量
      LET l_qty4 = 0
      #定义取入库量的CURSOR
      #CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb005,'1',l_sfaa010,'','') RETURNING l_success  #200326-00028#1 mark
      CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb006,'1',l_sfaa010,'','') RETURNING l_success   #200326-00028#1
      IF NOT l_success THEN
         LET l_qty4 = 0
      ELSE
         #取入库量
        #CALL s_asft340_stored_in_qty('1',l_sfaa013) RETURNING l_qty4      #PGS(D)-00902-mark
         CALL s_asft340_stored_in_qty('1',l_sfaa013,'') RETURNING l_qty4   #PGS(D)-00902-add
         LET l_qty4 = l_qty4 *l_sfcb021/l_sfcb022    #將入庫量轉換為轉出數量  
      END IF

       #當有報工過時
       IF l_sfcb_chk1 > 0 THEN
          IF l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 - l_sfcb_chk1 < l_sfcb_chk THEN
             LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022                
                            + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009 - l_sfcb_chk1                    
                            - l_qty3  
          END IF
       ELSE
          IF l_sfcb_chk > l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009 THEN   
             LET l_sfcb_chk = l_sfcb027*(1+l_imae020/100) + l_sfcb029 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_sfcb030 * l_sfcb054 / l_sfcb053 * l_sfcb021 /l_sfcb022 + l_qcbc009    
                            - l_qty3  
          END IF
       END IF

      LET l_sfcb_chk = l_sfcb_chk - l_sfcb041 + l_sfcb042
      LET l_def_qty = l_sfcb_chk      
   ELSE  #允许事后报工
      #取得已完工入庫量
      LET l_qty4 = 0
      #定义取入库量的CURSOR
      #CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb005,'1',l_sfaa010,'','')    #200326-00028#1 mark  
      CALL s_asft340_stored_in_qty_def_cursor(lc_param.sffb005,lc_param.sffb006,'1',l_sfaa010,'','')     #200326-00028#1      
         RETURNING l_success
      IF NOT l_success THEN
         LET l_qty4 = 0
      ELSE
         #取入库量
        #CALL s_asft340_stored_in_qty('1',l_sfaa013)   #PGS(D)-00902-mark
         CALL s_asft340_stored_in_qty('1',l_sfaa013,'')   #PGS(D)-00902-add 
            RETURNING l_qty4
         LET l_qty4 = l_qty4 *l_sfcb021/l_sfcb022    #將入庫量轉換為轉出數量  
      END IF      
      SELECT sfcb002,sfcb005,sfcb006 INTO l_sfcb002,l_sfcb005,l_sfcb006 FROM sfcb_t 
       WHERE sfcbent = g_enterprise
         AND sfcbdocno = lc_param.sffb005
         AND sfcb001 = lc_param.sffb006
         AND sfcb003 = lc_param.sffb007
         AND sfcb004 = lc_param.sffb008
      IF l_sfcb005 = '2' THEN  #替代群组
         SELECT COUNT(1) INTO l_cnt FROM sfcc_t 
          WHERE sfccent = g_enterprise
            AND sfccdocno = lc_param.sffb005
            AND sfcc001 = lc_param.sffb006
            AND sfcc002 = l_sfcb002
            AND sfcc003||sfcc004 NOT IN (SELECT sfcb003||sfcb004 FROM sfcb_t WHERE sfcbent = g_enterprise AND sfcbdocno =  lc_param.sffb005
                                                                               AND sfcb001 = lc_param.sffb006 AND sfcb005 = l_sfcb005 AND sfcb006 = l_sfcb006)
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF           
      END IF  
      IF l_cnt = 0 THEN   
         #191107-00026#1(2)-add----str---
         #備註
         #l_sfcb027     標準產出量
         #l_sfcb029     重工轉入
         #l_sfcb030     回收轉入
         #l_qcbc009     PQC轉回當站量
         #l_qty         本工單其他報工單,已報工的資料
         #              若可報工收只考慮良品數(D-MFG-0105='Y')
         #              l_qty 不含報廢數量sffb018
         #l_td_sum      替代群組
         #l_qty3        本站作業前的報廢量
         #191107-00026#1(2)-add----end---      
#         LET l_def_qty = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_qty3)    #200116-00010#1 mark
         #LET l_def_qty = l_sfcb_chk + l_qcbc009 - l_qty - l_qty3   #200116-00010#1 add #200715-00062#1 mark
         LET l_def_qty = l_sfcb_chk + l_qcbc009 #200715-00062#1 add
            
         #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
         IF lc_param.sffb001 = '3' AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN
#            LET l_def_qty = (l_sfcb_chk + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3)   #200116-00010#1 mark
            #LET l_def_qty = l_sfcb_chk + l_qcbc009 - l_qty - l_td_sum - l_qty3    #200116-00010#1 add #200715-00062#1 mark
            LET l_def_qty = l_sfcb_chk + l_qcbc009 - l_td_sum #200715-00062#1 add
         END IF
      ELSE
         #替代群組首站
         DECLARE s_asft335_sel_sfcb003_1 CURSOR FOR
            SELECT sfcb002,sfcb003,sfcb004 FROM sfcc_t,sfcb_t 
             WHERE sfcbent = sfccent 
               AND sfcbdocno = sfccdocno
               AND sfcb001 = sfcc001
               AND sfcb002 = sfcc002
               AND sfccent = g_enterprise
               AND sfccdocno = lc_param.sffb005
               AND sfcc001 = lc_param.sffb006
               AND sfcb005 = l_sfcb005
               AND sfcb006 = l_sfcb006           
               AND sfcc003||sfcc004 NOT IN (SELECT sfcb003||sfcb004 FROM sfcb_t WHERE sfcbent = g_enterprise AND sfcbdocno =  lc_param.sffb005
                                                                                  AND sfcb001 = lc_param.sffb006 AND sfcb005 = l_sfcb005 AND sfcb006 = l_sfcb006)
             ORDER BY sfcb002,sfcb003,sfcb004                                                                                
         
         LET l_sql2 = "   FROM sffb_t ",
                      "  WHERE sffbent  = ",g_enterprise,
                      "    AND sffbsite = '",g_site,"' ",
                      "    AND sffb005  = '",lc_param.sffb005,"' ",
                      "    AND sffb006  = ",lc_param.sffb006,
                      "    AND sffb007  = ? ",
                      "    AND sffb008  = ? ",
                      "    AND sffbstus <> 'X' "
         IF NOT cl_null(lc_param.sffbdocno) THEN
            IF cl_null(lc_param.sffbseq) THEN
               LET l_sql2 = l_sql2," AND NOT (sffbdocno = '",lc_param.sffbdocno,"')"
            ELSE
               LET l_sql2 = l_sql2," AND NOT (sffbdocno = '",lc_param.sffbdocno,"' AND sffbseq = ",lc_param.sffbseq,")"
            END IF
         END IF
        
         IF cl_null(lc_param.sffb001) THEN  #報廢
            LET l_sql2 = " SELECT MAX(SUM(sffb017+sffb018+sffb019+sffb020)) ",l_sql2," GROUP BY sffb001 "
         ELSE
            LET l_sql2 = " SELECT SUM(sffb017+sffb018+sffb019+sffb020) ",l_sql2," AND sffb001 = ? "
         END IF         
         PREPARE s_asft335_sffb_qty2_1 FROM l_sql2
       
         LET l_td_sum = 0 
         LET r_type = ''         
         FOREACH s_asft335_sel_sfcb003_1 INTO l_new_sfcb002,l_new_sfcb003,l_new_sfcb004

             IF l_new_sfcb003 = lc_param.sffb007 AND l_new_sfcb004 = lc_param.sffb008 THEN
                CONTINUE FOREACH
             END IF 
             #找作业编号+作业序的第一个报工点
             CALL s_asft335_get_first_action(lc_param.sffb005,lc_param.sffb006,l_new_sfcb003,l_new_sfcb004)
                RETURNING r_success,r_type 
                
             #r_type = '1':move in 2:check in 3:报工站 4:check out 5:move out
             EXECUTE s_asft335_sffb_qty2_1 USING l_new_sfcb003,l_new_sfcb004,r_type INTO l_qty2

             LET l_td_sum = l_td_sum + l_qty2
             
         END FOREACH 
         IF cl_null(l_td_sum) THEN LET l_td_sum = 0 END IF
         LET l_def_qty = (l_sfcb027*(1+l_imae020/100) + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3)      
         #工單參數依报工站检查齐套(D-MFG-0104),若參數=Y,每一站报工时，增加控卡依站别检查材料是否齐套
         IF lc_param.sffb001 = '3' AND l_d_mfg_0104 = 'Y' AND l_fullflag THEN
            LET l_def_qty = (l_sfcb_chk + l_sfcb029 + l_sfcb030 + l_qcbc009 - l_qty - l_td_sum - l_qty3) 
         END IF        
      END IF          
   END IF
   
   LET r_def_qty = l_def_qty
   FREE s_asft335_sffb_qty
   RETURN r_success,r_def_qty
END FUNCTION

################################################################################
# Descriptions...: 產生對應的QC單並拋轉sQMS
# Memo...........:
# Usage..........: CALL s_asft335_crt_sqms(p_sffbdocno,p_sffbdocdt)
# Input parameter: p_sffbdocno    單號
#                : p_sffbdocdt    日期
# Date & Author..: 2019/09/04 By 10042
# Modify.........: 190702-00010#14 add
################################################################################
PUBLIC FUNCTION s_asft335_crt_sqms(p_sffbdocno,p_sffbdocdt)
DEFINE p_sffbdocno    LIKE sffb_t.sffbdocno
DEFINE p_sffbdocdt    LIKE sffb_t.sffbdocdt
DEFINE l_cnt          LIKE type_t.num5
DEFINE l_success      LIKE type_t.num5
DEFINE l_start_no     LIKE qcba_t.qcbadocno
DEFINE l_end_no       LIKE qcba_t.qcbadocno
DEFINE l_oobn003      LIKE oobn_t.oobn003
   
   IF NOT s_aqct300_is_sqms() THEN
      RETURN
   END IF
   
   #檢查是否有PQC
   SELECT COUNT(1)
     INTO l_cnt
     FROM sfcb_t,sffb_t
    WHERE sfcbent = sffbent
      AND sfcbdocno = sffb005
      AND sfcb001 = sffb006
      AND sfcb003 = sffb007
      AND sfcb004 = sffb008
      AND sffbent = g_enterprise
      AND sffbdocno = p_sffbdocno
      AND sffb001 = '3'
      AND sfcb017 = 'Y'
   IF l_cnt > 0 THEN
      CALL s_aooi210_get_doc(g_site,'','6',p_sffbdocno,'aqct300','') RETURNING l_success,l_oobn003
      IF l_success THEN
         CALL s_aqct300_gen_for_sqms('3',p_sffbdocno,'',l_oobn003,p_sffbdocdt) RETURNING l_success,l_start_no,l_end_no
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 同步删除sfha
# Memo...........: 原删除函数s_asft335_del_sfha，逻辑修改为作废，此处增加删除逻辑
# Usage..........: CALL s_asft335_del_sfha_1(p_docno,p_seq)
#                  RETURNING r_success
# Input parameter: p_docno        报工单号
#                : p_seq          报工单项次
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2020/04/17 By  181120-00025
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_asft335_del_sfha_1(p_docno,p_seq)
   DEFINE p_docno         LIKE sffb_t.sffbdocno
   DEFINE p_seq           LIKE sffb_t.sffbseq
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_cnt           LIKE type_t.num5
      #161109-00085#55-s
   #DEFINE l_sffb        RECORD LIKE sffb_t.*
   DEFINE l_sffb RECORD  #單筆製程報工檔
       sffbent LIKE sffb_t.sffbent, #企業編號
       sffbsite LIKE sffb_t.sffbsite, #營運據點
       sffbdocno LIKE sffb_t.sffbdocno, #報工單號
       sffbseq LIKE sffb_t.sffbseq, #項次
       sffbdocdt LIKE sffb_t.sffbdocdt, #單據日期
       sffb001 LIKE sffb_t.sffb001, #報工類別
       sffb002 LIKE sffb_t.sffb002, #報工人員
       sffb003 LIKE sffb_t.sffb003, #部門
       sffb004 LIKE sffb_t.sffb004, #報工班別
       sffb005 LIKE sffb_t.sffb005, #工單單號
       sffb006 LIKE sffb_t.sffb006, #Run Card
       sffb007 LIKE sffb_t.sffb007, #作業編號
       sffb008 LIKE sffb_t.sffb008, #製程式
       sffb009 LIKE sffb_t.sffb009, #工作站
       sffb010 LIKE sffb_t.sffb010, #機器編號
       sffb011 LIKE sffb_t.sffb011, #作業人數
       sffb012 LIKE sffb_t.sffb012, #完成日期
       sffb013 LIKE sffb_t.sffb013, #完成時間
       sffb014 LIKE sffb_t.sffb014, #工時
       sffb015 LIKE sffb_t.sffb015, #機時
       sffb016 LIKE sffb_t.sffb016, #單位
       sffb017 LIKE sffb_t.sffb017, #良品數量
       sffb018 LIKE sffb_t.sffb018, #報廢數量
       sffb019 LIKE sffb_t.sffb019, #當站下線數量
       sffb020 LIKE sffb_t.sffb020, #回收數量
       sffb021 LIKE sffb_t.sffb021, #no use
       sffb022 LIKE sffb_t.sffb022, #no use
       sffb023 LIKE sffb_t.sffb023, #備註
       sffb024 LIKE sffb_t.sffb024, #報工組別
       sffb025 LIKE sffb_t.sffb025, #生產計畫
       sffb026 LIKE sffb_t.sffb026, #生產料號
       sffb027 LIKE sffb_t.sffb027, #BOM特性
       sffb028 LIKE sffb_t.sffb028, #產品特徵
       sffbownid LIKE sffb_t.sffbownid, #資料所有者
       sffbowndp LIKE sffb_t.sffbowndp, #資料所屬部門
       sffbcrtid LIKE sffb_t.sffbcrtid, #資料建立者
       sffbcrtdp LIKE sffb_t.sffbcrtdp, #資料建立部門
       sffbcrtdt LIKE sffb_t.sffbcrtdt, #資料創建日
       sffbmodid LIKE sffb_t.sffbmodid, #資料修改者
       sffbmoddt LIKE sffb_t.sffbmoddt, #最近修改日
       sffbcnfid LIKE sffb_t.sffbcnfid, #資料確認者
       sffbcnfdt LIKE sffb_t.sffbcnfdt, #資料確認日
       sffbstus LIKE sffb_t.sffbstus, #狀態碼
       sffb029 LIKE sffb_t.sffb029, #報工料號
       sffb030 LIKE sffb_t.sffb030  #成本中心
   END RECORD
   #161109-00085#55-e

   LET r_success = TRUE

   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00300'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   INITIALIZE l_sffb.* TO NULL

   #161109-00085#55-s
   #SELECT * INTO l_sffb.* FROM sffb_t
   SELECT sffbent,sffbsite,sffbdocno,sffbseq,
          sffbdocdt,sffb001,sffb002,sffb003,sffb004,
          sffb005,sffb006,sffb007,sffb008,sffb009,
          sffb010,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,
          sffb020,sffb021,sffb022,sffb023,sffb024,
          sffb025,sffb026,sffb027,sffb028,sffbownid,
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,
          sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus,sffb029,
          sffb030
     INTO l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbseq,
          l_sffb.sffbdocdt,l_sffb.sffb001,l_sffb.sffb002,l_sffb.sffb003,l_sffb.sffb004,
          l_sffb.sffb005,l_sffb.sffb006,l_sffb.sffb007,l_sffb.sffb008,l_sffb.sffb009,
          l_sffb.sffb010,l_sffb.sffb011,l_sffb.sffb012,l_sffb.sffb013,l_sffb.sffb014,
          l_sffb.sffb015,l_sffb.sffb016,l_sffb.sffb017,l_sffb.sffb018,l_sffb.sffb019,
          l_sffb.sffb020,l_sffb.sffb021,l_sffb.sffb022,l_sffb.sffb023,l_sffb.sffb024,
          l_sffb.sffb025,l_sffb.sffb026,l_sffb.sffb027,l_sffb.sffb028,l_sffb.sffbownid,
          l_sffb.sffbowndp,l_sffb.sffbcrtid,l_sffb.sffbcrtdp,l_sffb.sffbcrtdt,l_sffb.sffbmodid,
          l_sffb.sffbmoddt,l_sffb.sffbcnfid,l_sffb.sffbcnfdt,l_sffb.sffbstus,l_sffb.sffb029,
          l_sffb.sffb030
     FROM sffb_t     
   #161109-00085#55-e
    WHERE sffbent   = g_enterprise
      AND sffbsite  = g_site
      AND sffbdocno = p_docno
      AND sffbseq   = p_seq
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sel_sffb"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
      
   IF l_sffb.sffb001 <> '3' OR l_sffb.sffb019 IS NULL OR l_sffb.sffb019 = 0 THEN
      LET r_success = TRUE 
      RETURN r_success
   END IF

   
   SELECT COUNT(1) INTO l_cnt  #161212-00020#1 星號調整
     FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfha010 = p_docno
      AND sfha011 = p_seq
      #170209-00041#1-s-mod
#      AND sfhastus<> 'N'
      AND sfhastus NOT IN ('N','X')
      #170209-00041#1-e-mod
    
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00245'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF     
   
#171030-00006#1 mark -s  #181120-00025#1 remark -s #还原删除逻辑
   DELETE FROM sfha_t 
    WHERE sfhaent = g_enterprise
      AND sfha010 = p_docno
      AND sfha011 = p_seq  
      #170209-00041#1-s-add
      AND sfhastus = 'N'
      #170209-00041#1-e-add

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sfha_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
   
   #170209-00041#1-s-add
   #刪除sfha_t也要刪除對應的sfhb_t、sfhc_t
   DELETE FROM sfhb_t 
    WHERE sfhbent = g_enterprise
      AND sfhbdocno = (SELECT sfhadocno 
                         FROM sfha_t
                        WHERE sfhaent = g_enterprise
                          AND sfha010 = p_docno
                          AND sfha011 = p_seq  
                          AND sfhastus = 'N')
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sfhb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
   
   DELETE FROM sfhc_t 
    WHERE sfhcent = g_enterprise
      AND sfhcdocno = (SELECT sfhadocno 
                         FROM sfha_t
                        WHERE sfhaent = g_enterprise
                          AND sfha010 = p_docno
                          AND sfha011 = p_seq  
                          AND sfhastus = 'N')
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sfhc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success      
   END IF
   #170209-00041#1-e-add
#171030-00006#1 mark -e     #181120-00025#1 remark -e

#181120-00025#1 mark -s
##171030-00006#1 add -s
#   UPDATE sfha_t 
#      SET sfhastus = 'X'
#    WHERE sfhaent = g_enterprise
#      AND sfha010 = p_docno
#      AND sfha011 = p_seq  
#      AND sfhastus = 'N'
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "update sfha_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success      
#   END IF
##171030-00006#1 add -e
#181120-00025#1 remark -e

   RETURN r_success
END FUNCTION

 
{</section>}
 
