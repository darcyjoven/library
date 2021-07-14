#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_afat503.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0114(1900-01-01 00:00:00), PR版次:0114(2021-06-03 15:56:49)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000522
#+ Filename...: s_afat503
#+ Description: 審核過單操作檢查
#+ Creator....: 02599(2014-08-15 18:26:13)
#+ Modifier...: 00000 -SD/PR- 11234
 
{</section>}
 
{<section id="s_afat503.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150709-00007#1   BY lujh                调整sql写法.被除数是0会引起sql语法错误
#150731-00002#1   BY yangtt              程序執行后，第二次默認值帶值，帳套帶值錯誤
#150825           BY albireo             客戶整測修改追回:核算項及科目檢核  除了判斷agli010分錄底稿設定外,要加入單別參數判斷
#151001-00005#1   2015/10/08 BY yangtt   臨時表afap280_01_fa_group名稱太長，只能為18碼,改成afap280_01_group
#160304-00002#2   2016/03/04 BY lujh     存在已审核未过帐的单据（针对5*作业），在第二次做单时提示存在此单据，不可再做单
#160321-00016#5   2016/03/22 BY Jessy    修正azzi920重複定義之錯誤訊息
#160328-00029#1   2016/03/31 BY Jessy    將重複內容的錯誤訊息置換為公用錯誤訊息
#140122-00001#74  2016/04/07 BY lujh     新增afat492的检核逻辑
#160331-00003#1   2016/04/11 BY 07673    修改处置本年累折
#160331-00002#1   2016/04/15 BY 07673    afat5*的作业单身，财产编号+附号+卡片编号如果faaj的折旧方式为不计提，则不再检查参数，afai021里面的当月处置是否先计提折旧
#160222-00024#1   2016/04/19 BY lujh     新增afat700的检核逻辑
#160329-00025#1   2016/04/25 BY 01531    afat513过账/取消过账时更新afai100资产状态和取得方式
#160222-00024#5   2016/04/26 BY lujh     新增afat800的检核逻辑
#160426-00014#7   2016/07/24 BY 01531    免税不可以出售(faah036)，免税为1为可免税的不可以出售，自动产生单身+单身栏位检核修改
#160426-00014#10  2016/07/25 BY 01531    新增afat523逻辑 
#160727-00019#2   2016/08/01 BY 08742    系统中定义的临时表名称超过15码在执行时会出错,所以需要将系统中定义的临时表长度超过15码的全部改掉	 	
#                                        MOD   afap280_01_group -->afap280_tmp02
#160824-00027#1   2016/08/24 BY 00768    afai100直接新增然後做出售，afat504過帳時不应该檢查fabh_t，沒資料無法過帳
#160822-00020#1   2016/09/06 BY 02114    afat513/afat514审核时，会判断单身核算项栏位是否有值，而不是根据分录底稿里面是不是有值。
#160930-00036#1   2016/09/30 By dorishsu 過帳還原參考160824-00027#1調整
#161103-00028#1   2016/11/10 By 01727    1.修改单身后成本字段显示资料和后台不符
#161104-00048#5   2016/11/23 By 01531    更新资产状态改为更新faaj038。
#161128-00061#6   2016/12/06 by 02481    标准程式定义采用宣告模式,弃用.*写法
#161215-00070#1   2016/12/20 By 01531    afat503，afat504，afat506，afat507 当月 新增的资产，进行处分时，需加判断faaj008 的年度期别<单据日期， 再管控是否报 afa-00280
#161227-00064#1   2016/12/29 By 01531    D-FIN-0030=Y & 子模块不启用分录底稿时 ，审核时检查异动科目是否为空
#170203-00024#2   2017/02/06 By Jessica  1.「自動確認、手動確認」時，調整BPM回寫報錯「狀態為'N.未確認',才可執行確認!」
#                                        2.狀態為D/R，作廢時報錯: 狀態為N才能作廢
#170220-00020#1   2017/02/20 By 07900    1.搜寻q_faah003_5(),调整此条件：AND faah015 NOT IN ('1','5','6')状态为1的不要排除
#                                        2.财产编号开窗q_faah003_5 开窗增加资产名称/取得成本
#                                        3.s_afat503 报错afa-01007 排除类型1 （请同步调整宜山）
#170301-00021#3   2017/03/02 By 09263    g_prog整批調整
#170320-00030#1   2017/03/20 By 02114    审核时,判断是否启用分录底稿有误,导致启用分录底稿时,却走了不启用分录底稿的凭证检核逻辑段
#170426-00013#1   2017/05/19 By 07900    和SA确认，afat523 异动类型：39 调整 时，过账回写未折减额 的逻辑 调整成 (本币成本+调整成本-累计折旧)-处置成本-处置累折; 本币成本取afai100的成本
#170525-00014#1   2017/05/25 By 07491    BPM整合增加自動確認的交易前處理元件s_afat503_ws_preprocess
#170603-00027#1   2017/06/14 By 09232    在 afai100作业中资产为抵押='1' 未抵押afat504才可出售, 其他狀態不可出售
#170603-00034#1   2017/06/08 By 09232    在afai100作业中显示已被抵押的資產,不可在afat507中被作废。
#170617-00292#1   2017/06/18 By 04150    撈取faaj003 where 條件調整為AND faaj008 <= l_ym  
#170618-00113#1   2017/06/18 By 02599    afat513过账/过账还原时，同步更新资产faah对应数量、金额、资产状态等资料
#170617-00292#1   2017/07/03 By 01531    问题1：afat503审核的过账的时候没有管控固定资产当月是否已经提及折旧 操作过程：先折旧--录入afat503--折旧还原--afat503审核过账
#170704-00040#1   2017/07/06 By 05795    afat507报废单据过账后再删除，其他数据回写正常，但是faah表的资产状态不会回写为原来的状态；
#170618-00147#1   2017/07/07 By 01531    盘亏成本fabh008是账面成本，fabh010是处置成本，过账时应回写afai100处置成本faaj034= faaj034+fabh010
#170706-00054#1   2017/07/10 By 05795    afat507审核过账后，只有faah的资产状态回写了销账，faaj表的资产状态不变。同理，取消过账后也应该更新faaj表至原状态。
#170724-00035#1   2017/07/24 By 06821    確認時依單別參數D-FIN-0030決定異動科目+核算項必輸控卡,參數N(單別不產生分錄傳票):不控卡科目+核算項必輸的限制;Y:同目前控卡原則(科目空者報錯)
#170707-00009#1   2017/08/09 By 07900    afat513的调整成本是本币的调整成本，调整成本和原币计算时，要除以汇率。
#170704-00052#1   2017/08/07 By 09773    新增检查财产编号是否在盘点中的判断
#170626-00033#1   2017/08/12 By 04150    增加檢查 若已存在應收，則不可取消確認
#170825-00040#1   2017/08/28 By 08729    如果不用先計提折舊，卻已存在折舊檔，不可以確認。
#170911-00028#1   2017/09/21 By 08729    進行調整時,不應控卡參數當月處份時應計提折否(afai021),因為通常會進行調整,改良,重估..等調整,就是要將調整的金額納入折舊計算 PS.如果有進行調整,請將月結批次程式也一起改
#170921-00036#1   2017/09/22 By 08729    afat501同一笔固定资产做第二次单据的时候，报存在未过账的单据。afat501 没有过账的功能。还请协助，谢谢！
#170926-00009#1   2017/09/26 By 08729    再s_afat503的s_afat503_conf_ins_tab_chk裡面SQL加上ENT條件
#171005-00014#1   2017/10/12 By 08729    將改良時未折減額欄未計算加上調整的金額
#170816-00007#27  2017/10/20 By 09773    調整公用元件錯誤訊息,顯示更明確的資訊內容
#171020-00028#1   2017/11/03 By 07900    afat504/afat509審核時，沒有檢核分錄底稿（科目）是否為統治科目,D-FIN-0030 参数值和生成分录底稿时保持一致
#170421-00027#9   2017/11/21 By 07900    检核科目是否满足agli061限制条件
#171129-00039#1   2017/11/30 By 05795    afat508过账的时候需要更新faah015
#170421-00027#10  2017/11/30 By 07900    审核时对单据上科目的检核是否符合agli061设置，不管是否有启用分录底稿，都应该检核
#170421-00027#11  2017/12/06 By 09505    审核时对单据上科目的检核是否符合agli061设置，不管是否有启用分录底稿，都应该检核
#171212-00024#1   2017/12/12 By 08729    afat508 改良作業, 改良後未用年限沒更新到afai100,導致折舊金額太多,固資折畢再提>此時作改良的話，未用年限會寫入折畢再提預留年月，但是折舊還是看未用年限
#171214-00048#1   2017/12/18 By 09232    afat503的单身资产状态栏位若是折毕再提,回写afai100时资产状态不要回写
#171228-00025#1   2018/01/03 By 05634    若卡片數量=報廢數量,報廢還原將fabh077更新回faaj019
#180115-00009#1   2018/01/03 By 05634    若卡片數量=銷帳數量,銷帳還原將fabh077更新回faaj019
#180109-00065#1   2018/01/18 By 09232    銷帳過帳後,afai100資產狀態(faah015)會更新為6:銷帳/盤虧,接著過帳還原,資產狀態(faah015)還是6:銷帳/盤虧
#180119-00008#1   2018/01/19 By 08729    afat508 改良作業，過帳還原時，當資產狀態是7折畢在提時，未使用年限沒有回寫到faaj005是回寫到faaj013，要回寫到faaj005才對
#170207-00044#1   2018/01/22 By 01531    過帳/過帳還原“重估折舊方式”回寫faaj003
#180124-00038#1   2018/01/26 By 05795    单别参数D-FIN-0030=N时，取消分录借贷平衡的检核段
#180119-00017#1   2018/02/07 By 09232    1.修改之前遗留问题（只检核了借方科目“核算项”，贷方科目“核算项”未检核）
#                                        2.afat500增加了自由核算项，所以增加检核“自由核算项”逻辑
#180111-00043#55  2018/03/22 By 09505    现在设计器产生方法的时候说明默认给值是CALL s_aooi150_ins (传入参数)，本次批量调整将方法明改为此方法的实际用途说明
#180301-00007#1   2018/03/30 By 01531    afat503/afat508過帳還原時,僅更新faaj038沒有更新faah015.
#180326-00032#2   2018/04/17 By 09773    调整s_afat503_sys_chk方法。原单据日期与现行年月不符的卡控，将afa-00283调整为如果小于现行年月则报afa-00480的错误
#180418-00046#1   2018/04/19 By 04152    若單別D-FIN-0030=N不產生分錄，#170724-00035#1只考慮afat508但其他程式也要考慮
#180511-00010#1   2018/05/11 By 09773    afat514审核时当日期大于现行日期时，未提示
#180604-00010#1   2018/06/04 By 05634    1.處置預留殘值（fabo025)=(afai100預留殘值/未出售量）*本次出售量
#                                        2.原本afat504過帳以及過帳還原沒有回寫afai100的預留殘值(faaj019),應該要回寫
#                                        3.afat504單身呈現處置預留殘值（fabo025),僅呈現,不開放維護(DISPLAY ONLY)
#180614-00039#9   2018/07/05 By 07556    BPM整合功能修正:s_afat503_conf_chk_fabo檢核報錯:狀態為'N.未確認',才可執行確認!
#180614-00012#1   2018/07/25 by 08172    afat508在aapt301中存在不是作废的资料就不可以取消过账取消审核,折旧方式应该不回写
#180820-00013#1   2018/08/21 By 04152    若數量已出售完，除了更新afai100上面的狀態(faah015)之外，單身的狀態(faaj038)也要一起更新
#180911-00014#1   2018/09/12 By 04152    出售取消過帳時，狀態還原取最近一個月的faan007來放
#181001-00015#74  2018/10/31 By 09232    补ent条件
#181114-00018#1   2018/11/16 By 00537    调用afap280_01的时候少了指定前段单据号的p_wc条件
#181217-00003#1   2018/12/17 By 08729    如果是報廢時回寫faai023的標籤狀態回寫錯誤，應該回寫的跟afai100的資產狀態一樣(目前給21，應該給6)
#181218-00049#1   2018/12/20 By 05795    单别参数D-FIN-0030=N时，不需要走产生分录得方法
#181224-00009#1   2019/01/22 By 11234    修复afat500审核时报错后还审核成功问题
#181204-00026#6   2019/03/13 By 01531    afat500|afat504审核增加科目使用的合理性檢核
#190528-00023#1   2019/05/29 By 07804    afat508取消過帳新增檢核點:若同年月有折舊時,不可取消過帳
#190610-00045#1   2019/06/11 By 05795    審核時, 應該有檢查, 若該資產在afai100有标签明细那就一定要有輸入
#190617-00022#1   2019/06/17 By 11234    afat523过账时fabh081回写faaj004，取消过账时fabh080回写faaj004
#190619-00008#1   2019/06/20 By 07804    1.當單身為新增狀態時,修改[異動]欄位,會把成本清空
#                                        2.當成本為空時,確認與過帳段增加控卡afa-09597
#190703-00033#1   2019/07/03 By 08729    修正盤虧過帳時沒有更新資產狀態的問題 
#190710-00012#1   2019/07/18 By 08729    afa-00280判斷的資產狀態要用faaj038(原先是faah015)
#190719-00027#1   2019/07/19 By 05634    afat506過帳應將帳套資產狀態faaj038 同時 update
#190426-00010#1   2019/08/12 By 05795    未折减额回写需要计算上先前调整
#190815-00018#1   2019/08/16 By 07804    1.修正帳套資產狀態:4.折畢，無法使用afat501，會被控卡afa-00329(資產狀態不為4.折畢7.折畢再提，不可用！)
#                                        2.新增確認檢查時，再提年限(月)、折畢殘值須>0
#                                        3.修正折畢再提批次生成時，當依資產主檔取得再提年月及殘值=N，殘值計算錯誤
#                                        4.修正批次生成時，去除faaj011(僅看狀態是折畢或折畢再提)
#                                        5.取消確認回寫時，需更新faaj011 
#190624-00017#3   2019/08/27 by 08172    afat502/afat503/afat508/afat523取消审核时，若当月异动是否先计提折旧为N且存在折旧时不可取消审核
#180815-00024#1   2019/09/10 By 01531    afat507單身輸入時判斷,若為列管資產,則允許狀態為取得
#190916-00030#1   2019/09/17 By 08729    資產若已抵押，再afat507單身輸入不能過
#180730-00011#1   2019/09/19 by 08172    取預設值時，取得資產中心後應重展一次組織結構
#190923-00051#1   2019/09/27 By 08729    afat507過帳/過帳還原都只抓到第一項次的值去更新處置累折
#191105-00013#1   2019/11/06 By 05795    修改本币成本得取值
#191122-00020#1   2019/11/27 By 05795    afat507在不产生分录单别得时候不要检查科目为空得判断
#190830-00087#1   2019/12/03 by 08172    修正盘盈过账/取消过账回写afai100折旧方式和耐用年限
#200102-00009#1   2020/01/02 By 11234    afat523过账时，若调整后未用年限fabh014=0，则更新资产状态为4折毕
#200131-00004#1   2020/01/31 By 08729    當單別不產分錄，就不檢查科目是否為空
#200319-00041#1   2020/03/20 By 08729    當單別產分錄，且帳套不啟用分錄底稿時，如果分錄是空的會導致無法關帳，應在確認時報錯並換用不產分錄的單別
#200325-00063#1   2020/03/25 By 05795    #180326-00032#2排除afat509因为折旧计算一定是跨月月初才执行的资料,肯定不会在当月月底执行, 显示这讯息没有意义
#200330-00029#1   2020/04/14 By 11234    报错信息优化
#200405-00011#4   2020/06/15 by 08172    afat509取消过账检查放至取消审核
#200608-00011#1   2020/06/23 By 08729    當月異動是否要先記提折舊 參數為N時，再過帳還原就應該卡住(現在是取消確認才卡)
#200619-00046#1   2020/06/20 By 07804    1.畫面[科目與核算項頁簽]增加:產品分類 2.調整產品分類相關邏輯與分錄底稿
#200622-00032#3   2020/07/16 By 13656    可提示项目编号 和 WBS编号 空白，但不影响审核，仍可审核
#201023-00019#1   2020/10/26 By 03980    参数为不启底稿时，afat509审核加入fabg005=0的条件
#201202-00040#1   2020/12/03 By 11234    修正afat509直接抛转凭证功能
#210218-00004#1   2021/02/18 By 05795    afat507作业，如果当月处置先计提折旧=N，但已存在该月折旧资料，请先执行折旧还原afap240
#200518-00023#1   2021/02/23 By 05795    #重估过帐后回写修改：faaj017 = l_fabh.fabh012+faaj035
#210603-00009#1   2021/06/03 By 11234    修正盘亏单过账回写未折减额的问题
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util     #151125-000006#1--add by aiqq
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_afat503.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_afat503.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_sql          STRING
#170816-00007#27 by 09773 add(S)
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#27 by 09773 add(E)
#end add-point
 
{</section>}
 
{<section id="s_afat503.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_afat503.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 资产异动资料审核检查
# Memo...........:
# Usage..........: CALL s_afat503_conf_chk_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_chk_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabh              RECORD LIKE fabh_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076  #主要類別新
      ,fabh044 LIKE fabh_t.fabh044  #產品分類   #200619-00046#1 add
       END RECORD    
   #161128-00061#6---modify--end--------------------
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_desc              STRING
   DEFINE l_date              LIKE fabg_t.fabgdocdt
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_sql               STRING
   DEFINE l_errmsg            STRING
   DEFINE l_c                 LIKE glaq_t.glaq003
   DEFINE l_d                 LIKE glaq_t.glaq004
   DEFINE l_glad007        LIKE glad_t.glad007     #部門管理否
   DEFINE l_glad008        LIKE glad_t.glad008     #利潤成本中心管理
   DEFINE l_glad009        LIKE glad_t.glad009     #區域管理
   DEFINE l_glad010        LIKE glad_t.glad010     #交易客商管理
   DEFINE l_glad027        LIKE glad_t.glad027     #账款客商管理
   DEFINE l_glad011        LIKE glad_t.glad011     #客群管理否
   DEFINE l_glad012        LIKE glad_t.glad012     #產品類別
   DEFINE l_glad013        LIKE glad_t.glad013     #人員
   DEFINE l_glad015        LIKE glad_t.glad015     #专案管理否
   DEFINE l_glad016        LIKE glad_t.glad016     #wbs管理
   DEFINE l_glad031        LIKE glad_t.glad031     #經營方式管理
   DEFINE l_glad032        LIKE glad_t.glad032     #渠道管理
   DEFINE l_glad033        LIKE glad_t.glad033     #品牌管理
   DEFINE l_errno          LIKE type_t.chr10   
   #是否做自由科目核算项管理
   DEFINE l_glad017        LIKE glad_t.glad017
   DEFINE l_glad0171       LIKE glad_t.glad0171 
   DEFINE l_glad0172       LIKE glad_t.glad0172 
   DEFINE l_glad018        LIKE glad_t.glad018
   DEFINE l_glad0181       LIKE glad_t.glad0181
   DEFINE l_glad0182       LIKE glad_t.glad0182
   DEFINE l_glad019        LIKE glad_t.glad019
   DEFINE l_glad0191       LIKE glad_t.glad0191
   DEFINE l_glad0192       LIKE glad_t.glad0192
   DEFINE l_glad020        LIKE glad_t.glad020
   DEFINE l_glad0201       LIKE glad_t.glad0201
   DEFINE l_glad0202       LIKE glad_t.glad0202
   DEFINE l_glad021        LIKE glad_t.glad021
   DEFINE l_glad0211       LIKE glad_t.glad0211
   DEFINE l_glad0212       LIKE glad_t.glad0212
   DEFINE l_glad022        LIKE glad_t.glad022
   DEFINE l_glad0221       LIKE glad_t.glad0221
   DEFINE l_glad0222       LIKE glad_t.glad0222
   DEFINE l_glad023        LIKE glad_t.glad023
   DEFINE l_glad0231       LIKE glad_t.glad0231
   DEFINE l_glad0232       LIKE glad_t.glad0232
   DEFINE l_glad024        LIKE glad_t.glad024
   DEFINE l_glad0241       LIKE glad_t.glad0241
   DEFINE l_glad0242       LIKE glad_t.glad0242
   DEFINE l_glad025        LIKE glad_t.glad025
   DEFINE l_glad0251       LIKE glad_t.glad0251
   DEFINE l_glad0252       LIKE glad_t.glad0252
   DEFINE l_glad026        LIKE glad_t.glad026
   DEFINE l_glad0261       LIKE glad_t.glad0261
   DEFINE l_glad0262       LIKE glad_t.glad0262
   DEFINE l_cate           LIKE type_t.chr10          
   DEFINE g_glaa121        LIKE glaa_t.glaa121 
   
   #albireo 150824-----s
   DEFINE l_comp   LIKE ooef_t.ooef001
   DEFINE l_chr    LIKE type_t.chr1
   DEFINE l_slip   LIKE type_t.chr10
   #albireo 150824-----e
   #170421-00027#11  By 09505  --(S)--
   DEFINE l_fabh021       LIKE fabh_t.fabh021
   DEFINE l_fabh023       LIKE fabh_t.fabh023
   DEFINE l_fabh024       LIKE fabh_t.fabh024
   DEFINE l_fabh025       LIKE fabh_t.fabh025
   DEFINE l_fabh074       LIKE fabh_t.fabh074
   DEFINE ls_js            STRING
   DEFINE lc_param  RECORD
       glbi001   LIKE glbi_t.glbi001,   #作业编号 
       glbild    LIKE glbi_t.glbild,    #账套
       docno     LIKE xrca_t.xrcadocno, #单号OR单别
       glbi003   LIKE glbi_t.glbi003    #科目编号  
             END RECORD
   #170421-00027#11  By 09505  --(E)--
   #180326-00032#2  add  --(S)--
   DEFINE l_fabgdocdt       LIKE fabg_t.fabgdocdt
   DEFINE l_fabgmoddt       LIKE fabg_t.fabgmoddt
   #180326-00032#2  add  --(E)--
   DEFINE l_wc              LIKE type_t.chr1000    #181114-00018#1 add
   DEFINE l_fabi007_sum     LIKE fabi_t.fabi007    #190610-00045#1---add
   DEFINE l_n               LIKE type_t.num5       #190610-00045#1---add

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #初始化数组
   INITIALIZE l_fabg.* TO NULL
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
#      LET r_success = FALSE
##      CALL cl_errmsg('conf_chk',p_fabgdocno,'','sub-00110',1)   #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err()      
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t WHERE fabgent=g_enterprise AND fabgld=p_fabgld AND fabgdocno=p_fabgdocno
   #(2).狀態碼=未審核,才可進行確認動作   
   #170203-00024#2-S
   #IF l_fabg.fabgstus <>'N' THEN
   IF l_fabg.fabgstus NOT MATCHES "[NA]" THEN
   #170203-00024#2-E
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'','afa-00024',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00024'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
   END IF 
   
   #20141213 mod by chenying fabg-->fabh
   #(3).有單頭資料但無單身資料返回报错
   LET l_cnt = 0
   SELECT count(*) INTO l_cnt FROM fabh_t
    WHERE fabhent = g_enterprise
      AND fabhld  = p_fabgld
      AND fabhdocno = p_fabgdocno
   IF l_cnt = 0  THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','agl-00066',1) #cmod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00066'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()        
   END IF
   #20141213 mod by chenying
   #180326-00032#2  add  --(S)--
   IF g_prog MATCHES "afat5*"  THEN
      IF g_prog NOT MATCHES "afat509"  THEN #200325-00063#1---add--->排除掉afat509
         SELECT fabgdocdt,fabgmoddt INTO l_fabgdocdt,l_fabgmoddt
           FROM fabg_t
          WHERE fabgent = g_enterprise
            AND fabgld = p_fabgld 
            AND fabgdocno = p_fabgdocno
         IF (YEAR(l_fabgdocdt) <> YEAR(l_fabgmoddt)) OR (YEAR(l_fabgdocdt) = YEAR(l_fabgmoddt) AND MONTH(l_fabgdocdt) <> MONTH(l_fabgmoddt)) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'afa-00482'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()  
            END IF
      END IF #200325-00063#1---add
   END IF
   #180326-00032#2  add  --(E)--
   #170421-00027#11  By 09505   --(E)--
   LET l_sql = " SELECT DISTINCT fabh021,fabh023,fabh024,fabh025,fabh074 FROM fabh_t  ",
               " WHERE fabhent = '",g_enterprise,"'",
               "   AND fabhld = '",p_fabgld,"'",
               "   AND fabhdocno = '",p_fabgdocno,"'"             
   PREPARE l_fabh_pre FROM l_sql
   DECLARE l_fabh_cs CURSOR FOR l_fabh_pre
   FOREACH l_fabh_cs INTO l_fabh021,l_fabh023,l_fabh024,l_fabh025,l_fabh074
           IF NOT cl_null(l_fabh021) THEN
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_fabgld
              LET lc_param.docno   = p_fabgdocno
              LET lc_param.glbi003 = l_fabh021
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF
           END IF
           IF g_prog = 'afat509' OR g_prog = 'afat521' THEN
              IF NOT cl_null(l_fabh023) THEN
                 LET lc_param.glbi001 = g_prog
                 LET lc_param.glbild  = p_fabgld
                 LET lc_param.docno   = p_fabgdocno
                 LET lc_param.glbi003 = l_fabh023
                 LET ls_js = util.JSON.stringify(lc_param)
                 CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
                 IF NOT l_success THEN
                    LET r_success = FALSE
                 END IF
              END IF
           END IF
           IF g_prog  = 'afat509' OR g_prog = 'afat521' THEN
              IF NOT cl_null(l_fabh024) THEN
                 LET lc_param.glbi001 = g_prog
                 LET lc_param.glbild  = p_fabgld
                 LET lc_param.docno   = p_fabgdocno
                 LET lc_param.glbi003 = l_fabh024
                 LET ls_js = util.JSON.stringify(lc_param)
                 CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
                 IF NOT l_success THEN
                    LET r_success = FALSE
                 END IF
              END IF
           END IF
           IF g_prog = 'afat502' OR g_prog = 'afat509' OR g_prog = 'afat521' THEN
              IF NOT cl_null(l_fabh025) THEN
                 LET lc_param.glbi001 = g_prog
                 LET lc_param.glbild  = p_fabgld
                 LET lc_param.docno   = p_fabgdocno
                 LET lc_param.glbi003 = l_fabh025
                 LET ls_js = util.JSON.stringify(lc_param)
                 CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
                 IF NOT l_success THEN
                    LET r_success = FALSE
                 END IF
              END IF
           END IF
           IF g_prog = 'afat522' THEN
              IF NOT cl_null(l_fabh074) THEN
                 LET lc_param.glbi001 = g_prog
                 LET lc_param.glbild  = p_fabgld
                 LET lc_param.docno   = p_fabgdocno
                 LET lc_param.glbi003 = l_fabh074
                 LET ls_js = util.JSON.stringify(lc_param)
                 CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
                 IF NOT l_success THEN
                    LET r_success = FALSE
                 END IF
              END IF
           END IF
           
   END FOREACH 
   #170421-00027#11  By 09505   --(E)--
   
   ##########################add by huangtao 
   IF l_fabg.fabg005 = '14' THEN
  
      SELECT COUNT(*) INTO l_cnt FROM fabh_t
       WHERE fabhent = g_enterprise AND fabhdocno = p_fabgdocno AND  fabhld=p_fabgld
         AND fabh019 = 0 
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'afa-00402'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE       
      END IF
   END IF
   ##########################add by huangtao 
   
   #20150112 add by chenying
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
   #albireo 150824-----s
   #抓取單別參數 是否走分錄底稿   
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add 
   #albireo 150824-----e
   IF g_glaa121 = 'Y' AND l_chr = 'Y' THEN    #albireo 150825  add  l_chr = 'Y'    
      IF l_fabg.fabg005 = '0' OR l_fabg.fabg005 = '4' OR l_fabg.fabg005 = '6' OR
         l_fabg.fabg005 = '8' OR l_fabg.fabg005 = '9' OR l_fabg.fabg005 = '14' OR
         l_fabg.fabg005 = '21' OR l_fabg.fabg005 = '31' OR l_fabg.fabg005 = '35'     #140122-00001#129 add OR l_fabg.fabg005 = '35' lujh
         OR l_fabg.fabg005 = '39' OR l_fabg.fabg005 = '23' OR l_fabg.fabg005 = '24'  #160426-00014#10  #160822-00020#1 add '23','24'  lujh
         THEN  #150417-00007#65 add '31'   
         CASE l_fabg.fabg005 
             WHEN '0'
                LET l_cate =  'F30'  
             WHEN '4'
                LET l_cate =  'F40'  
             WHEN '6'
                LET l_cate =  'F50'  
             WHEN '8'
                LET l_cate =  'F50'
             #160426-00014#10 add s--                
             WHEN '39'
                LET l_cate =  'F50' 
             #160426-00014#10 add e--                
             WHEN '14'
                LET l_cate =  'F50'  
             WHEN '21'
                LET l_cate =  'F50'
             WHEN '9'
                LET l_cate =  'F50'   
             WHEN '31'               #150417-00007#65 add '31'
                LET l_cate =  'F50'   
             #140122-00001#129--add--str--lujh
             WHEN '35'               
                LET l_cate =  'F50' 
             #140122-00001#129--add--end--lujh  
             #160822-00020#1--add--str--lujh
             WHEN '23'               
                LET l_cate =  'F50' 
             WHEN '24'               
                LET l_cate =  'F50' 
             #160822-00020#1--add--end--lujh
         END CASE 
         CALL s_chk_voucher('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF l_success = FALSE THEN
            LET r_success = FALSE
         END IF
      END IF
   END IF   
   #20150112 add by chenying
   
   #150417-00007#65--add--str--
   #afat521资产科目异动
   IF l_fabg.fabg005 = '31' THEN
      CALL s_afat503_conf_chk_31(p_fabgld,p_fabgdocno) RETURNING l_success
      IF l_success = FALSE THEN
         LET r_success = FALSE
      END IF
      RETURN r_success
   END IF
   #150417-00007#65--add--end
   
   #albireo 150824-----s
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add 
   #albireo 150824-----e
   
   #(7).单身科目无效，性質不為帳戶,不為明細或獨立帳戶,则返回报错
   #固定核算項欄位,其對應基本資料的合理性 
#   IF g_glaa121 = 'N' THEN #20150112 add by chenying   #mark by yangxf

   #161128-00061#6---modify--begin--------------------
   #LET l_sql = " SELECT * FROM fabh_t",
   LET l_sql = " SELECT fabhent,fabhld,fabhsite,fabhdocno,fabhseq,fabh000,fabh001,fabh002,fabh003,",
               "fabh004,fabh005,fabh006,fabh007,fabh008,fabh009,fabh010,fabh011,fabh012,fabh013,fabh014,",
               "fabh015,fabh016,fabh017,fabh018,fabh019,fabh020,fabh021,fabh022,fabh023,fabh024,fabh025,",
               "fabh026,fabh027,fabh028,fabh029,fabh030,fabh031,fabh032,fabh033,fabh034,fabh035,fabh036,",
               "fabh037,fabh038,fabh039,fabh040,fabh041,fabh042,fabh043,fabh060,fabh061,fabh062,fabh063,",
               "fabh064,fabh065,fabh066,fabh067,fabh068,fabh069,fabh100,fabh101,fabh102,fabh103,fabh104,",
               "fabh105,fabh106,fabh107,fabh108,fabh109,fabh110,fabh150,fabh151,fabh152,fabh153,fabh154,",
               "fabh155,fabh156,fabh157,fabh158,fabh159,fabh160,fabh070,fabh071,fabh072,fabh073,fabh111,",
               #"fabh161,fabh074,fabh075,fabh076 FROM fabh_t",   #200619-00046#1 mark
               #200619-00046#1-(S) add
               "fabh161,fabh074,fabh075,fabh076 ",
               ",fabh044 ",
               " FROM fabh_t",   
               #200619-00046#1-(E) add
   #161128-00061#6---modify--end--------------------
               " WHERE fabhent = '",g_enterprise,"'",
               "   AND fabhld = '",p_fabgld,"'",
               "   AND fabhdocno = '",p_fabgdocno,"'"
   PREPARE s_afat503_fabh_pr1 FROM l_sql
   DECLARE s_afat503_fabh_cs1 CURSOR FOR s_afat503_fabh_pr1
   FOREACH s_afat503_fabh_cs1 INTO l_fabh.*
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = sqlca.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #190619-00008#1-(S) add
      IF l_fabg.fabg005 = '9' THEN
         IF cl_null(l_fabh.fabh008) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-09597'   #卡片編號%1+財產編號%2+附號%3，發現異常資料，[成本]不可為空! 請檢查！
            LET g_errparam.replace[1] = l_fabh.fabh000
            LET g_errparam.replace[2] = l_fabh.fabh001
            LET g_errparam.replace[3] = l_fabh.fabh002
            LET g_errparam.coll_vals[1]  = l_fabh.fabh000
            LET g_errparam.coll_vals[2]  = l_fabh.fabh001
            LET g_errparam.coll_vals[3]  = l_fabh.fabh002         
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
             
            LET r_success = FALSE
         END IF
      END IF
      #190619-00008#1-(E) add
      #190610-00045#1---add----str
      
      IF l_fabg.fabg005 = '21' THEN
         LET l_n = 0
         SELECT COUNT(*) INTO l_n 
           FROM faai_t 
          WHERE faaient = g_enterprise 
            AND faai001 = l_fabh.fabh000
            AND faai002 = l_fabh.fabh001 
            AND faai003 = l_fabh.fabh002
         IF cl_null(l_n) THEN
            LET l_n = 0
         END IF
         IF l_n > 0 THEN
            LET l_fabi007_sum = 0 
            SELECT SUM(fabi007) INTO l_fabi007_sum    
              FROM fabi_t
             WHERE fabient = g_enterprise 
               AND fabi001 = l_fabh.fabh000
               AND fabi002 = l_fabh.fabh001 
               AND fabi003 = l_fabh.fabh002
               AND fabidocno = p_fabgdocno 
               AND fabiseq = l_fabh.fabhseq
            
            IF cl_null(l_fabi007_sum) THEN LET l_fabi007_sum = 0 END IF
            #报废时检查标签数量需等于处置数量
            IF l_fabi007_sum <> l_fabh.fabh007 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.replace[1] = l_fabh.fabh000
               LET g_errparam.replace[2] = l_fabh.fabh001 
               LET g_errparam.replace[3] = l_fabh.fabh002
               LET g_errparam.code   = "afa-09589"
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET r_success = FALSE
               EXIT FOREACH   
            END IF
         END IF
      END IF
       
      #190610-00045#1---add----str
      
      #add by yangxf ---
      #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
      IF l_chr = 'Y' THEN #180418-00046#1
         IF cl_null(l_fabh.fabh026) THEN
            LET g_errno = 'afa-00451'
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         END IF
      END IF #170724-00035#1 add
      
      #170704-00052#1  add--S
      #如果该财产编号在afat512中存在未审核的单据，则提示报错
      IF g_prog = 'afat502' OR g_prog = 'afat503' OR g_prog = 'afat506' OR g_prog = 'afat507' OR g_prog = 'afat508' THEN
         CALL s_afa_faah003_chk(l_fabh.fabh000,l_fabh.fabh001,l_fabh.fabh002) RETURNING l_success,l_errno
         IF NOT l_success THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_fabh.fabh000
            LET g_errparam.replace[2] = l_fabh.fabh001
            LET g_errparam.replace[3] = l_fabh.fabh002
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF   
      #170704-00052#1  add--E
      
      #albireo 150824-----s
#      IF g_glaa121 = 'N' THEN
#         CONTINUE FOREACH 
#      END IF
      #170320-00030#1--mark--str--lujh
      #IF NOT (g_glaa121 = 'Y' AND l_chr = 'Y') THEN 
      #   CONTINUE FOREACH
      #END IF
      #170320-00030#1--mark--end--lujh
      
      #170320-00030#1--add--str--lujh
      IF g_glaa121 = 'Y' AND l_chr = 'Y' THEN 
         CONTINUE FOREACH
      END IF
      #170320-00030#1--add--end--lujh
      
      #albireo 150824-----e
      #add by yangxf ----
#20141224 mod by chenying
#改用sub检查
#      IF g_prog != 'afat509' THEN   #add by yangxf
#         #20141213 add by chenying
#         #是否存在未审核的资料的异动单据
#         LET l_cnt = 0
#         SELECT COUNT(*) INTO l_cnt FROM fabh_t,fabg_t 
#          WHERE fabhent = fabgent AND fabhld = fabgld
#            AND fabhdocno = fabgdocno
#            AND fabhent =  g_enterprise 
#            AND fabhld =  p_fabgld 
#            AND fabhdocno !=  p_fabgdocno 
#            AND fabh000 = l_fabh.fabh000
#            AND fabh001 = l_fabh.fabh001
#            AND fabh002 = l_fabh.fabh002
#            AND fabgstus = 'N' 
#         IF l_cnt > 0 THEN 
##            INITIALIZE g_errparam TO NULL
##            LET g_errparam.code = 'afa-00333'
##            LET g_errparam.extend = l_fabh.fabh001
##            LET g_errparam.popup = TRUE
##            CALL cl_err()
#            CALL cl_errmsg('',l_fabh.fabh001,'','afa-00333',1)
#            LET r_success = FALSE
#         END IF      
#         #20141213 add by chenying
#      END IF   #add by yangxf
      IF l_fabg.fabg005 <> '35' THEN   #140122-00001#129 add lujh
         CALL s_afat503_conf_ins_tab_chk(p_fabgdocno,p_fabgld,l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000) RETURNING l_success 
         IF l_success = FALSE THEN
            LET r_success = FALSE
         END IF   
      END IF          #140122-00001#129 add lujh  
#20141224 mod by chenying
      #資產檢核
      IF l_fabg.fabg005 <> '23' AND l_fabg.fabg005 <> '24' AND l_fabg.fabg005 <> '35' THEN   #140122-00001#129 add AND l_fabg.fabg005 <> '35' lujh
         CALL s_afat503_fabh001_chk(l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000,l_fabg.fabgld,l_fabg.fabg005)
      END IF   
      IF NOT cl_null(g_errno) THEN
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
#         CALL cl_errmsg('fabhdocno,fabhseq',l_errmsg,'',g_errno,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF 
      #盤點期間改資產不可異動

      #科目
      IF NOT cl_null(l_fabh.fabh021) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh021)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh021
            LET r_success = FALSE
#            CALL cl_errmsg('fabh021',l_errmsg,'',g_errno,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         END IF
      ###############################add by huangtao#############
      ELSE
         #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
         IF l_chr = 'Y' THEN #180418-00046#1
            LET g_errno = 'afa-00271'
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
            LET r_success = FALSE
            #CALL cl_errmsg('fabh021',l_errmsg,'',g_errno,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         END IF #170724-00035#1 add
      ###############################add by huangtao#############
      END IF
      ###############################add by huangtao#############
      IF l_fabg.fabg005 <> '35' THEN        #140122-00001#129 add lujh
         #IF (g_prog = 'afat507' AND l_chr = 'Y') OR g_prog <> 'afat507' THEN #191122-00020#1---add--afat507单别不产生分录得时候，不需要检查科目 #200131-00004#1 mark
         IF l_chr = 'Y' THEN #200131-00004#1 add
            IF cl_null(l_fabh.fabh023) THEN
               LET g_errno = 'afa-00272'
               LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
               LET r_success = FALSE
   #            CALL cl_errmsg('fabh023',l_errmsg,'',g_errno,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            END IF
            IF cl_null(l_fabh.fabh024) THEN
               LET g_errno = 'afa-00273'
               LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
               LET r_success = FALSE
   #            CALL cl_errmsg('fabh024',l_errmsg,'',g_errno,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            END IF
            IF cl_null(l_fabh.fabh025) THEN
               LET g_errno = 'afa-00274'
               LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
               LET r_success = FALSE
   #            CALL cl_errmsg('fabh025',l_errmsg,'',g_errno,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            END IF
         END IF  #191122-00020#1---add
      END IF              #140122-00001#129 add lujh

      ###############################add by huangtao#############
      IF g_glaa121 <> 'Y' OR l_chr <> 'Y' THEN     #160822-00020#1 add lujh        
         #20141218 add by chenying
         #依據帳別，科目編號，判斷該科目是否启用
         #部門管理， 利潤成本中心管理，區域管理，交易客商管理，客群管理，產品類別，人員，預算，專案，wbs管理，账款客商管理，自由核算项1~10
         #1.清空核算项管理值
          LET l_glad007 = ''  LET l_glad008 = ''  LET l_glad009 = ''  LET l_glad010 = ''  LET l_glad027 = ''   LET l_glad011 = ''
          LET l_glad012 = ''  LET l_glad013 = ''  LET l_glad015 = ''  LET l_glad016 = ''  
          LET l_glad031 = ''  LET l_glad032 = ''  LET l_glad033 = ''
          LET l_glad017 = ''  LET l_glad0171 =''  LET l_glad0172 = '' LET l_glad018 = ''  LET l_glad0181 = ''  LET l_glad0182 = ''   
          LET l_glad019 = ''  LET l_glad0191 =''  LET l_glad0192 = '' LET l_glad020 = ''  LET l_glad0201 = ''  LET l_glad0202 = ''
          LET l_glad021 = ''  LET l_glad0211 =''  LET l_glad0212 = '' LET l_glad022 = ''  LET l_glad0221 = ''  LET l_glad0222 = ''
          LET l_glad023 = ''  LET l_glad0231 =''  LET l_glad0232 = '' LET l_glad024 = ''  LET l_glad0241 = ''  LET l_glad0242 = ''
          LET l_glad025 = ''  LET l_glad0251 =''  LET l_glad0252 = '' LET l_glad026 = ''  LET l_glad0261 = ''  LET l_glad0262 = ''
          #2.重新依账套，科目抓取核算项管理值
          SELECT glad007,glad008,glad009,glad010,glad027,glad011,glad012,glad013,glad015,glad016,
                 glad031,glad032,glad033,
                 glad017,glad0171,glad0172,glad018,glad0181,glad0182,glad019,glad0191,glad0192,
                 glad020,glad0201,glad0202,glad021,glad0211,glad0212,glad022,glad0221,glad0222,
                 glad023,glad0231,glad0232,glad024,glad0241,glad0242,glad025,glad0251,glad0252,
                 glad026,glad0261,glad0262              
            INTO l_glad007,l_glad008,l_glad009,l_glad010,l_glad027,l_glad011,l_glad012,l_glad013,l_glad015,l_glad016,
                 l_glad031,l_glad032,l_glad033,
                 l_glad017,l_glad0171,l_glad0172,l_glad018,l_glad0181,l_glad0182,l_glad019,l_glad0191,l_glad0192,
                 l_glad020,l_glad0201,l_glad0202,l_glad021,l_glad0211,l_glad0212,l_glad022,l_glad0221,l_glad0222,
                 l_glad023,l_glad0231,l_glad0232,l_glad024,l_glad0241,l_glad0242,l_glad025,l_glad0251,l_glad0252,
                 l_glad026,l_glad0261,l_glad0262
            FROM glad_t
          WHERE gladent = g_enterprise
            AND gladld  = p_fabgld
            AND glad001 = l_fabh.fabh021     
         
         #======================================
         #固定核算项检查
         #如果启用改固定核算项勾选，则对该核算项的值进行检查
         #======================================  
         #20141218 add by chenying
          
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh021
         #營運據點
         IF NOT cl_null(l_fabh.fabh026) THEN
            CALL s_voucher_glaq017_chk(l_fabh.fabh026)
            IF NOT cl_null(g_errno) THEN
               LET r_success = FALSE
#               CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',g_errno,1)  #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = g_errno
               #160321-00016#5 --s add
               #(s_voucher_glaq017_chk)aoo-00089->sub-01302
               LET g_errparam.replace[1] = 'aooi100'
               LET g_errparam.replace[2] = cl_get_progname('aooi100',g_lang,"2")
               LET g_errparam.exeprog = 'aooi100'
               #160321-00016#5 --e add
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            END IF
         END IF
         
         #部门检查-#該科目做部門管理時，部門不可空白
         IF l_glad007 = 'Y' THEN
            IF cl_null(l_fabh.fabh027) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh027',l_errmsg,'','agl-00043',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00043'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF  #170724-00035#1 add
            ELSE   
               CALL s_department_chk(l_fabh.fabh027,l_fabg.fabgdocdt) RETURNING l_success            
               IF l_success = FALSE THEN
                  LET r_success = FALSE
               END IF    
            END IF
         END IF
         
         #利润成本中心检查--#該科目做利潤成本管理時，利潤成本不可空白
         IF l_glad008 = 'Y' THEN
            IF cl_null(l_fabh.fabh028) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh028',l_errmsg,'','agl-00044',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00044'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq019_chk(l_fabh.fabh028,l_fabg.fabgdocdt)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh028
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq019_chk)aoo-00029->sub-01302
                  IF g_errno = 'sub-01302' THEN
                     LET g_errparam.replace[1] = 'aooi125'
                     LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi125'
                  END IF
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            END IF
         END IF
         
         #区域检查 #該科目做區域管理時，區域不可空白
         IF l_glad009 = 'Y' THEN
            IF cl_null(l_fabh.fabh029) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh029',l_errmsg,'','agl-00045',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00045'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF       #170724-00035#1 add
            ELSE
               CALL s_azzi650_chk_exist('287',l_fabh.fabh029) RETURNING l_success
               IF l_success = FALSE THEN
                  LET r_success = FALSE
               END IF
            END IF
         END IF
          
         #客商检查-#該科目做交易客商管理時，客商不可空白 
         IF l_glad010 = 'Y' THEN
            IF cl_null(l_fabh.fabh030) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00046',1) 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00046'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF  #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq021_chk(l_fabh.fabh030)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
#                  CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',g_errno,1)  #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh030
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq021_chk)apm-00029->sub-01302
                  LET g_errparam.replace[1] = 'apmm100'
                  LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                  LET g_errparam.exeprog = 'apmm100'
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            END IF
         END IF
         
         #客商检查--#該科目做账款客商管理時，客商不可空白
         IF l_glad027 = 'Y' THEN
            IF cl_null(l_fabh.fabh031) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','axr-00215',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'axr-00215'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF   #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq021_chk(l_fabh.fabh031)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
#                  CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',g_errno,1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh031
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq021_chk)apm-00029->sub-01302
                  LET g_errparam.replace[1] = 'apmm100'
                  LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                  LET g_errparam.exeprog = 'apmm100'
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            END IF
         END IF
         
         #客群检查-#該科目做客群管理時，客群不可空白
         IF l_glad011 = 'Y' THEN
            IF cl_null(l_fabh.fabh032) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh032',l_errmsg,'','agl-00047',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00047'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF  #170724-00035#1 add
            ELSE
               CALL s_azzi650_chk_exist('281',l_fabh.fabh032) RETURNING l_success
               IF l_success = FALSE THEN
                  LET r_success = FALSE
               END IF
            END IF
         END IF
         
         #人员
         IF l_glad013 = 'Y' THEN
            IF cl_null(l_fabh.fabh033) THEN 
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00069',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00069'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF  #170724-00035#1 add
            ELSE
              CALL s_employee_chk(l_fabh.fabh033) RETURNING l_success 
               IF l_success = FALSE THEN
                  LET r_success = FALSE
               END IF
            END IF
         END IF
         
         #專案检查
         IF l_glad015 = 'Y' THEN
            IF cl_null(l_fabh.fabh034) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
#                  LET r_success = FALSE    #200622-00032#3 mark
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00071',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00071'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF #170724-00035#1 add
            ELSE
               CALL s_aap_project_chk(l_fabh.fabh034) RETURNING l_success,g_errno
               IF l_success = FALSE THEN
                  LET r_success = FALSE    
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh034
                  #160321-00016#5 --s add
                  #(s_aap_project_chk)apj-00002->sub-01302
                  LET g_errparam.replace[1] = 'apjm200'
                  LET g_errparam.replace[2] = cl_get_progname('apjm200',g_lang,"2")
                  LET g_errparam.exeprog = 'apjm200'
                  #160321-00016#5 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()               
               END IF               
            END IF
         END IF
         
         #WBS检查 
         IF l_glad016 = 'Y' THEN
            IF cl_null(l_fabh.fabh035) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
#                  LET r_success = FALSE      #200622-00032#3 mark
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00072',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00072'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq028_chk(l_fabh.fabh034,l_fabh.fabh035) 
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh035
                  LET g_errparam.popup = TRUE
                  CALL cl_err()               
               END IF
            END IF
         END IF  
         
         #該科目做經營方式管理時，不可空白
         IF l_glad031 = 'Y' THEN  
            IF cl_null(l_fabh.fabh041) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00286',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00286'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq051_chk(l_fabh.fabh041)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
#                  CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',g_errno,1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh041
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            END IF
         END IF
         
         #該科目做渠道管理時，不可空白
         IF l_glad032 = 'Y' THEN
            IF cl_null(l_fabh.fabh042) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00287',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00287'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF #170724-00035#1 add
            ELSE
               CALL s_voucher_glaq052_chk(l_fabh.fabh042)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
#                  CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',g_errno,1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh042
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            END IF
         END IF
         
         #該科目做品牌管理時，不可空白
         IF l_glad033 = 'Y' THEN
            IF cl_null(l_fabh.fabh043) THEN
               #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
               IF l_chr = 'Y' THEN #180418-00046#1
                  LET r_success = FALSE
                  #CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh043',l_errmsg,'','agl-00288',1) #cymod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00288'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF   #170724-00035#1 add
            ELSE
               CALL s_azzi650_chk_exist('2002',l_fabh.fabh043) RETURNING l_success
               IF l_success = FALSE THEN
                  LET r_success = FALSE
#                  CALL cl_errmsg('fabhdocno,fabhseq,fabh021,fabh043',l_errmsg,'',g_errno,1) #cymod   
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh043
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF
            END IF      
         END IF 
         
         #200619-00046#1-(S) add
         #該科目做產品分類管理時，不可空白
         IF l_glad012 = 'Y' THEN
            IF cl_null(l_fabh.fabh044) THEN               
               IF l_chr = 'Y' THEN
                  LET r_success = FALSE                  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00068'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
            ELSE
               CALL s_voucher_glaq024_chk(l_fabh.fabh044)                
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh044               
                  LET g_errparam.replace[1] = 'arti202'
                  LET g_errparam.replace[2] = cl_get_progname('arti202',g_lang,"2")
                  LET g_errparam.exeprog = 'arti202'               
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               END IF
            END IF      
         END IF
         #200619-00046#1-(E) add
         
         #===================================================
         #自由核算项检查
         #如果启用该核算项勾选，并且控制方式不为1：允许空白，则对核算项的值进行检查
         #===================================================
         #核算项一
         IF l_glad017 = 'Y' THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0172<>'1' THEN
                  IF cl_null(l_fabh.fabh060) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00074',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00074'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh060) THEN
                  CALL s_voucher_free_account_chk(l_glad0171,l_fabh.fabh060,l_glad0172) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err() 
                     #END IF #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项二
         IF l_glad018 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0182 <>'1' THEN
                  IF cl_null(l_fabh.fabh061) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00075',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00075'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh061) THEN
                  CALL s_voucher_free_account_chk(l_glad0181,l_fabh.fabh061,l_glad0182) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项三
         IF l_glad019 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0192 <>'1'  THEN
                  IF cl_null(l_fabh.fabh062) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00076',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00076'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err() 
                     #END IF  #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh062) THEN
                  CALL s_voucher_free_account_chk(l_glad0191,l_fabh.fabh062,l_glad0192) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF       #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项四
         IF l_glad020 = 'Y' THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0202 <>'1' THEN
                  IF cl_null(l_fabh.fabh063) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00077',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00077'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh063) THEN
                  CALL s_voucher_free_account_chk(l_glad0201,l_fabh.fabh063,l_glad0202) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项五
         IF l_glad021 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0212 <>'1' THEN
                  IF cl_null(l_fabh.fabh064) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00078',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00078'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add  #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh064) THEN
                  CALL s_voucher_free_account_chk(l_glad0211,l_fabh.fabh064,l_glad0212) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add  #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项六
         IF l_glad022 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0222 <>'1' THEN
                  IF cl_null(l_fabh.fabh065) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00079',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00079'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF  #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh065) THEN
                  CALL s_voucher_free_account_chk(l_glad0221,l_fabh.fabh065,l_glad0222) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF 
         #核算项七
         IF l_glad023 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0232 <>'1' THEN 
                  IF cl_null(l_fabh.fabh066) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00080',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00080'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err() 
                     #END IF #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh066) THEN
                  CALL s_voucher_free_account_chk(l_glad0231,l_fabh.fabh066,l_glad0232) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项八
         IF l_glad024 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0242 <>'1' THEN
                  IF cl_null(l_fabh.fabh067) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00081',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00081'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF  #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh067) THEN
                  CALL s_voucher_free_account_chk(l_glad0241,l_fabh.fabh067,l_glad0242) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项九
         IF l_glad025 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0252 <>'1' THEN
                  IF cl_null(l_fabh.fabh068) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00082',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00082'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err() 
                     #END IF  #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh068) THEN
                  CALL s_voucher_free_account_chk(l_glad0251,l_fabh.fabh068,l_glad0252) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
         #核算项十
         IF l_glad026 = 'Y'  THEN
            IF l_chr = 'Y' THEN #180418-00046#1
               IF l_glad0262 <>'1' THEN
                  IF cl_null(l_fabh.fabh069) THEN
                     #IF NOT (l_chr = 'N' AND g_prog MATCHES 'afat508*') THEN  #170724-00035#1 add #180418-00046#1 mark
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'','agl-00083',1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = 'agl-00083'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     #END IF  #170724-00035#1 add #180418-00046#1 mark
                  END IF
               END IF
               IF NOT cl_null(l_fabh.fabh069) THEN
                  CALL s_voucher_free_account_chk(l_glad0261,l_fabh.fabh069,l_glad0262) RETURNING l_errno
                  IF NOT cl_null(l_errno) THEN
                     LET r_success = FALSE
                     #CALL cl_errmsg('fabhdocno,fabhseq,fabh021',l_errmsg,'',l_errno,1) #cymod
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = l_errmsg
                     LET g_errparam.code   = l_errno
                     #160321-00016#5 --s add
                     #(s_voucher_free_account_chk)agl-00063->sub-01302
                     IF l_errno = 'agl-00063' THEN
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                     END IF
                     #160321-00016#5 --e add
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  END IF
               END IF
            END IF #180418-00046#1
         END IF
      END IF   #160822-00020#1 add lujh          
   END FOREACH
#   END IF #20150112 add by chenying   #mark by yangxf
   ##############################################huangtao add
   IF NOT s_afat503_sys_chk(l_fabg.fabgld,l_fabg.fabgsite,l_fabg.fabgdocdt) THEN
      RETURN FALSE
   END IF
  
   #20141212 add by chenying
   #关账日期检查
   IF NOT s_afat503_docdt_chk(l_fabg.fabgld,l_fabg.fabgsite,l_fabg.fabgdocdt) THEN
      RETURN FALSE
   END IF   
   #20141212 add by chenying
   
   #170617-00292#1 add s---
   IF NOT s_afat503_fixed_chk1(l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000,l_fabg.fabgld,l_fabg.fabgcomp,l_fabg.fabgdocdt) THEN 
      RETURN FALSE   
   END IF 
   #170617-00292#1 add e---
   IF g_glaa121 = 'N' THEN #200319-00041#1 add 不啟用分錄底稿才需進此段(有啟用的上面已經檢查過了，避免跳兩次錯誤) 
      #181114-00018#1 --begin
      LET l_wc = ''
      LET l_wc = " fabgdocno = '",p_fabgdocno CLIPPED,"' "
      #181114-00018#1 --en
      IF l_chr = 'Y' THEN  #181218-00049#1---add--当单别参数D-FIN-0030=N时， 不需要产生分录
         CASE l_fabg.fabg005
          WHEN '14'
             CALL afap280_01_gen_ar('14',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat502') RETURNING l_success    #181114-00018#1 add l_wc
           WHEN '8'
             CALL afap280_01_gen_ar('8',l_fabg.fabgld,'',' ','1','','Y','afat503') RETURNING l_success       #181114-00018#1 add l_wc
           #160426-00014#10 add s--   
           WHEN '39'
             CALL afap280_01_gen_ar('39',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat523') RETURNING l_success    #181114-00018#1 add l_wc 
           #160426-00014#10 add e---       
           WHEN '4'
             CALL afap280_01_gen_ar('4',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat504') RETURNING l_success     #181114-00018#1 add l_wc
           WHEN '6'
             CALL afap280_01_gen_ar('6',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat506') RETURNING l_success     #181114-00018#1 add l_wc
           WHEN '21'
             CALL afap280_01_gen_ar('21',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat507') RETURNING l_success    #181114-00018#1 add l_wc
           WHEN '9'
             CALL afap280_01_gen_ar('9',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat508') RETURNING l_success     #181114-00018#1 add l_wc 
          #201023-00019#1    --add--str--          
            WHEN '0'
            CALL afap280_01_gen_ar('0',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat509') RETURNING l_success     
           #201023-00019#1   --add--end--            
           #140122-00001#129--add--str--
           WHEN '35'
             CALL afap280_01_gen_ar('35',l_fabg.fabgld,'',' ','1',l_wc,'Y','afat552') RETURNING l_success    #181114-00018#1 add l_wc  
           #140122-00001#129--add--end--
         END CASE
         #IF l_chr = 'Y' THEN     #180124-00038#1--add   当单别参数D-FIN-0030=N时，取消分录借贷平衡的检核段  #181218-00049#1---mark
         IF l_success THEN
            #检查金额平不平 
            #SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_01_fa_group  #151001-00005#1
            #SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_01_group  #151001-00005#1 #160727-00019#2 mark
            SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_tmp02 #160727-00019#2 Mod   afap280_01_group -->afap280_tmp02
             WHERE docno = l_fabg.fabgdocno AND docdt = l_fabg.fabgdocdt 
            IF l_c <> l_d THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'afa-00275'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            #200319-00041#1 add(s)
            LET l_cnt = 0
            SELECT COUNT(1) INTO l_cnt 
              FROM afap280_tmp02
             WHERE docno = l_fabg.fabgdocno AND docdt = l_fabg.fabgdocdt
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt = 0 THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axr-00293'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            #200319-00041#1 add(e)
         END IF
      END IF #180124-00038#1--add
   END IF #200319-00041#1 add   
   ##############################################huangtao add
   
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 財產編號+符號+卡號檢查
# Memo...........:
# Usage..........: CALL s_afat503_fabh001_chk(p_fabh001,p_fabh002,p_fabh000,p_fabgld,p_fabg005)
#                  RETURNING 回传参数
# Input parameter: p_fabh001   財產編號
#                : p_fabh002   符號
#                : p_fabgld    帳套
#                : p_fabh000   卡號
#                : p_fabg005   異動類型
# Date & Author..: 2014/8/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_fabh001_chk(p_fabh001,p_fabh002,p_fabh000,p_fabgld,p_fabg005)
   DEFINE p_fabh001                LIKE fabh_t.fabh001
   DEFINE p_fabh002                LIKE fabh_t.fabh002
   DEFINE p_fabh000                LIKE fabh_t.fabh000
   DEFINE p_fabgld                 LIKE fabg_t.fabgld
   DEFINE p_fabg005                LIKE fabg_t.fabg005
   DEFINE l_faah015                LIKE faah_t.faah015
   DEFINE l_cnt                    LIKE type_t.num5
   
   LET g_errno=""
   
   #卡片+财编+附號需存在於faah_t固定資產基礎資料檔中   
   SELECT faah015 INTO l_faah015 FROM faah_t
    WHERE faahent = g_enterprise
      AND faah003 = p_fabh001
      AND faah004 = p_fabh002 
      AND faah001 = p_fabh000
      
   IF SQLCA.SQLCODE = 100 THEN 
      LET g_errno= 'afa-00076'
   END IF 
   #當異動類型為8：重估或4：出售時，財產狀態不可為0：取得、5：出售、6：銷賬、10：被資本化
   IF p_fabg005='8' OR p_fabg005='4' OR p_fabg005='39' THEN #160426-00014#10 add 39
      IF l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10' THEN
         LET g_errno='afa-00135'
      END IF
   END IF
   #科目异动
   IF p_fabg005='31' THEN
      IF l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10' THEN
         LET g_errno='afa-00461'
      END IF
   END IF
   #卡片+财编+附號需存在於faaj_t固定資產帳套折舊明細資料檔中  
      LET l_cnt = 0 
      SELECT COUNT(*) INTO l_cnt FROM faaj_t
       WHERE faajent = g_enterprise
         AND faajld  = p_fabgld 
         AND faaj001 = p_fabh001
         AND faaj002 = p_fabh002 
         AND faaj037 = p_fabh000
      IF l_cnt = 0 THEN 
         LET g_errno= 'afa-00134'
      END IF  
END FUNCTION

################################################################################
# Descriptions...: 更新狀態碼為審核狀態
# Memo...........:
# Usage..........: CALL s_afat503_conf_upd_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帳套
#                : p_fabgdocno    異動單號
# Date & Author..: 2014/8/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_upd_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_today             DATETIME YEAR TO SECOND
   
   WHENEVER ERROR CONTINUE

   LET r_success  = TRUE
   LET l_today  = cl_get_current()
   #检查完毕，更新狀態碼=已確認,確認人=登入user,確認日期=g_today
   UPDATE fabg_t SET fabgstus = 'Y',
                     fabgcnfid = g_user,
                     fabgcnfdt = l_today
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
    IF SQLCA.SQLCODE THEN
       LET r_success = FALSE
#       CALL cl_errmsg('fabgstus',p_fabgdocno,'Y',sqlca.sqlcode,1) #cymod
       INITIALIZE g_errparam TO NULL
       LET g_errparam.extend = p_fabgdocno
       LET g_errparam.code   = sqlca.sqlcode
       LET g_errparam.popup  = TRUE 
       CALL cl_err()
    END IF 
    RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取消審核檢查
# Memo...........:
# Usage..........: CALL s_afat503_unconf_chk_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_unconf_chk_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5                #檢核狀態
   DEFINE l_fabgstus          LIKE fabg_t.fabgstus            #状态码
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_cnt2              LIKE type_t.num5
   DEFINE l_cnt3              LIKE type_t.num5
   DEFINE l_site              LIKE glaa_t.glaacomp
   DEFINE l_fabgdocdt         LIKE fabg_t.fabgdocdt
   DEFINE l_ooab002           LIKE ooab_t.ooab002
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabh              RECORD LIKE fabh_t.*  #20141213 add by chenying
   DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076  #主要類別新
       END RECORD    
   #161128-00061#6---modify--end--------------------
   
   DEFINE l_faal003           LIKE faal_t.faal003   #20141213 add by chenying
   DEFINE l_faah006           LIKE faah_t.faah006   #20141213 add by chenying
   DEFINE l_sql               STRING                #20141213 add by chenying
   DEFINE l_fabg005           LIKE fabg_t.fabg005   #20141213 add by chenying
   DEFINE l_year              LIKE type_t.num5
   DEFINE l_month             LIKE type_t.num5  
   #170704-00052#1  add--S
   DEFINE  l_errno            LIKE type_t.chr1000
   DEFINE  l_success          LIKE type_t.num5
   #170704-00052#1  add--E 
   DEFINE  l_faal007          LIKE faal_t.faal007  #190624-00017#3 add
   #200405-00011#4 add -s
   DEFINE l_fabg008           LIKE fabg_t.fabg008
   DEFINE l_fabg011           LIKE fabg_t.fabg011
   #200405-00011#4 add -e
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
##      CALL cl_errmsg('unconf',p_fabgdocno,'','sub-00110',1) #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err() 
#      LET r_success = FALSE
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #(2).狀態碼=确认,才可進行確認動作
   SELECT fabgstus INTO l_fabgstus FROM fabg_t  
    WHERE fabgent = g_enterprise
      AND fabgld = p_fabgld
      AND fabgdocno = p_fabgdocno
   IF l_fabgstus <>'Y' THEN
#      CALL cl_errmsg('unconf',p_fabgdocno,'','afa-00026',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00026'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF 

   #20141212 add by chenying
   #(3).檢核是否已經關帳
   SELECT glaacomp INTO l_site FROM glaa_t
   WHERE glaaent = g_enterprise AND glaald = p_fabgld

   SELECT fabgdocdt INTO l_fabgdocdt FROM fabg_t  
    WHERE fabgent = g_enterprise
      AND fabgld = p_fabgld
      AND fabgdocno = p_fabgdocno   
   CALL cl_get_para(g_enterprise,l_site,'S-FIN-9003') RETURNING l_ooab002
   IF l_fabgdocdt <= l_ooab002 THEN 
#      CALL cl_errmsg('',p_fabgdocno,'','afa-00061',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00061'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF
   #20141212 add by chenying
   
   #20141213 add by chenying
    
   SELECT fabg005 INTO l_fabg005 FROM fabg_t  
    WHERE fabgent = g_enterprise
      AND fabgld = p_fabgld
      AND fabgdocno = p_fabgdocno

   IF l_fabg005 = '0' THEN 
      #200405-00011#4 add -s
      SELECT fabg011,fabg008 INTO l_fabg011,l_fabg008 
        FROM fabg_t   
       WHERE fabgent = g_enterprise
         AND fabgld = p_fabgld
         AND fabgdocno = p_fabgdocno
      
      #(1).有單頭資料但無單身資料返回报错
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt 
        FROM fabh_t
       WHERE fabhent = g_enterprise
         AND fabhld  = p_fabgld
         AND fabhdocno = p_fabgdocno
         
      IF l_cnt = 0  THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = p_fabgdocno
         LET g_errparam.code   = 'agl-00066'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      #(2)已存在應收賬款不可過帳還原
      IF NOT cl_null(l_fabg011) THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = p_fabgdocno
         LET g_errparam.code   = 'afa-01273'
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
      
      #(3)已存在传票号码不可過帳還原
      IF NOT cl_null(l_fabg008) THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = p_fabgdocno
         LET g_errparam.code   = 'afa-01274'
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
      #200405-00011#4 add -e
      RETURN r_success  
   END IF 
   #当月异动是否先计提折旧，N则不可取消
   INITIALIZE l_fabh.* TO NULL
   IF l_fabg005 != '4' AND l_fabg005 != '22' THEN
      LET l_sql = " SELECT fabh001,fabh002,fabh000 FROM fabh_t",
                  " WHERE fabhent = '",g_enterprise,"'",
                  "   AND fabhld = '",p_fabgld,"'",
                  "   AND fabhdocno = '",p_fabgdocno,"'"
   END IF               
   IF l_fabg005 = '4' THEN
      LET l_sql = " SELECT fabo001,fabo002,fabo003 FROM fabo_t",
                  " WHERE faboent = '",g_enterprise,"'",
                  "   AND fabold = '",p_fabgld,"'",
                  "   AND fabodocno = '",p_fabgdocno,"'"   
   END IF 
   IF l_fabg005 = '22' THEN
      LET l_sql = " SELECT fabs004,fabs005,fabs006 FROM fabs_t",
                  " WHERE fabsent = '",g_enterprise,"'",
                  "   AND fabsld = '",p_fabgld,"'",
                  "   AND fabsdocno = '",p_fabgdocno,"'"   
   END IF     
   PREPARE s_voucher_fabh_pr3 FROM l_sql
   DECLARE s_voucher_fabh_cs3 CURSOR FOR s_voucher_fabh_pr3
   FOREACH s_voucher_fabh_cs3 INTO l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach 3:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach 3:'
         LET g_errparam.code   = SQLCA.SQLCODE
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE         
         EXIT FOREACH
      END IF  
      
      #170704-00052#1  add--S
      #如果该财产编号在afat512中存在未审核的单据，则提示报错
      IF g_prog = 'afat502' OR g_prog = 'afat503' OR g_prog = 'afat506' OR g_prog = 'afat507' OR g_prog = 'afat508' OR g_prog = 'afat504' THEN
         CALL s_afa_faah003_chk(l_fabh.fabh000,l_fabh.fabh001,l_fabh.fabh002) RETURNING l_success,l_errno
         IF NOT l_success THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = l_fabh.fabh000
            LET g_errparam.replace[2] = l_fabh.fabh001
            LET g_errparam.replace[3] = l_fabh.fabh002
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF   
      #170704-00052#1  add--E
      
      LET l_cnt = 0
      LET l_cnt2 = 0
      LET l_cnt3 = 0
      
#      IF l_fabg005 != '4' AND l_fabg005 != '22' THEN
         #检查财编是否存在大于当前单据日期的其他已確認的异动单据和當前異動單據,则不可取消审核
         SELECT COUNT(*) INTO l_cnt FROM fabg_t,fabh_t
           WHERE fabgent = fabhent AND fabgld = fabhld
             AND fabgdocno = fabhdocno
             AND fabgent = g_enterprise
             AND fabgld  = p_fabgld  
             AND fabgdocdt > l_fabgdocdt
#             AND fabg005 != l_fabg005
             AND fabh001 = l_fabh.fabh001
             AND fabh002 = l_fabh.fabh002
             AND fabh000 = l_fabh.fabh000
             AND fabgstus = 'Y'
#      END IF
#      IF l_fabg005 = '4' THEN
         SELECT COUNT(*) INTO l_cnt2 FROM fabg_t,fabo_t
           WHERE fabgent = faboent AND fabgld = fabold
             AND fabgdocno = fabodocno
             AND fabgent = g_enterprise
             AND fabgld  = p_fabgld  
             AND fabgdocdt > l_fabgdocdt
#             AND fabg005 != l_fabg005
             AND fabo001 = l_fabh.fabh001
             AND fabo002 = l_fabh.fabh002
             AND fabo003 = l_fabh.fabh000  
             AND fabgstus = 'Y'             
#      END IF
#      IF l_fabg005 = '22' THEN
         SELECT COUNT(*) INTO l_cnt3 FROM fabg_t,fabs_t
           WHERE fabgent = fabsent AND fabgld = fabsld
             AND fabgdocno = fabsdocno
             AND fabgent = g_enterprise
             AND fabgld  = p_fabgld  
             AND fabgdocdt > l_fabgdocdt
#             AND fabg005 != l_fabg005
             AND fabs004 = l_fabh.fabh001
             AND fabs005 = l_fabh.fabh002
             AND fabs006 = l_fabh.fabh000 
             AND fabgstus = 'Y'             
#      END IF        
       IF l_cnt > 0 OR l_cnt2 > 0 OR l_cnt3 >0 THEN 
#          CALL cl_errmsg('',l_fabh.fabh001,'','afa-00332',1) #cymod
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = l_fabh.fabh001
          LET g_errparam.code   = 'afa-00332'
          LET g_errparam.popup  = TRUE 
          CALL cl_err() 
          LET r_success = FALSE
       END IF            
      SELECT faah006 INTO l_faah006 FROM faah_t
       WHERE faahent = g_enterprise
         AND faah003 = l_fabh.fabh001
         AND faah004 = l_fabh.fabh002 
         AND faah001 = l_fabh.fabh000
      #PGS(D)-13132 add -S-
      #PGS(D)-13132 add -E-
#      SELECT faal003 INTO l_faal003 FROM faal_t #190624-00017#3 mark
      #190624-00017#3 add -s
      LET l_faal003 = ''
      LET l_faal007 = ''
      
      SELECT faal003,faal007 INTO l_faal003,l_faal007 FROM faal_t 
      #190624-00017#3 add -e
       WHERE faalent = g_enterprise 
         AND faalld = p_fabgld 
         AND faal001 = l_faah006   
      #190624-00017#3 add -s
      IF cl_null(l_faal007) THEN LET l_faal007 = 'N' END IF
      #当月异动是否先计提折旧为N且存在折旧时afat502/afat503/afat508/afat523不可取消审核
      IF (l_faal003 = 'N' AND l_fabg005 <> '14' AND l_fabg005 <> '8' AND l_fabg005 <> '9' AND l_fabg005 <> '39')
         OR (l_faal007 = 'N' AND (l_fabg005 = '14' OR l_fabg005 = '8' OR l_fabg005 = '9' OR l_fabg005 = '39')) THEN
         
      #190624-00017#3 add -e
#      IF l_faal003 = 'N' THEN  #190624-00017#3 mark
         #检查是否已有计提档
         LET l_cnt = 0
         #190624-00017#3 mark -s
#         LET l_year = YEAR(l_fabgdocdt)
#         LET l_month = MONTH(l_fabgdocdt)  
         #190624-00017#3 mark -e   
         CALL s_fin_date_get_period_value('',p_fabgld,l_fabgdocdt) RETURNING l_success,l_year,l_month  #190624-00017#3 add            
         SELECT COUNT(*) INTO l_cnt FROM faam_t
           WHERE faament = g_enterprise AND faamld = p_fabgld
             AND faam000 = l_fabh.fabh000 AND faam001 = l_fabh.fabh001 AND faam002= l_fabh.fabh002
             AND faam004 = l_year AND faam005 = l_month 
         IF l_cnt > 0 THEN              
#            CALL cl_errmsg('',l_fabh.fabh001,'','afa-00331',1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_fabh.fabh001
#            LET g_errparam.code   = 'afa-00331'  #190624-00017#3 mark
            LET g_errparam.code   = 'afa-01181'  #190624-00017#3 add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF   
      END IF
   END FOREACH      
   #20141213 add by chenying
   
   #--170626-00033#1 add start--
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM xrca_t
    WHERE xrca016 = '15'
      AND xrca018 = p_fabgdocno
      AND xrcastus <> 'X'
      AND xrcaent = g_enterprise  #180301-00007#1 add 
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-01110'
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #--170626-00033#1 add end--
   
   #180614-00012#1 -s add by 08172
   #afat508在aapt301中存在不是作废的资料就不可以取消审核
   IF l_fabg005='9' THEN
      LET l_cnt = 0 
      SELECT COUNT(1) INTO l_cnt
        FROM apca_t,apcb_t
       WHERE apcaent = g_enterprise
         AND apcaent = apcbent
         AND apcald = apcbld
         AND apcadocno = apcbdocno
         AND apca001 = '19'
         AND apcb001 = '23'
         AND apcb002 = p_fabgdocno
         AND apcastus <> 'X'
      IF l_cnt > 0 THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = p_fabgdocno
         LET g_errparam.code   = 'afa-09509'
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
   END IF
   #180614-00012#1 -e add by 08172
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新狀態碼為審核狀態
# Memo...........:
# Usage..........: CALL s_afat503_unconf_upd_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      更新结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_unconf_upd_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_today             DATETIME YEAR TO SECOND
   
   WHENEVER ERROR CONTINUE
   
   LET r_success  = TRUE
   #更新狀態碼=未審核, 確認人=NULL,確認日期=NULL
   UPDATE fabg_t SET fabgstus = 'N',
                     fabgcnfid = '',
                     fabgcnfdt = ''
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
    IF SQLCA.SQLCODE THEN
      LET r_success = FALSE
#      CALL cl_errmsg('fabgdocno',p_fabgdocno,'N',sqlca.sqlcode,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = sqlca.sqlcode
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
    END IF 
    
    RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 過單檢查
# Memo...........:
# Usage..........: CALL s_afat503_post_chk_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_post_chk_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   #161128-00061#6---modify--end--------------------
   DEFINE l_cnt               LIKE type_t.num5
   #170617-00164#1 add s---
   DEFINE l_sql               STRING 
   DEFINE l_fabh002           LIKE fabh_t.fabh002
   DEFINE l_fabh001           LIKE fabh_t.fabh001
   DEFINE l_fabh000           LIKE fabh_t.fabh000
   #170617-00164#1 add e---
   DEFINE l_fabh008           LIKE fabh_t.fabh008   #190619-00008#1 add
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   INITIALIZE l_fabg.* TO NULL
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
#      LET r_success = FALSE
##      CALL cl_errmsg('post',p_fabgdocno,'','sub-00110',1)  #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err() 
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t WHERE fabgent=g_enterprise AND fabgld=p_fabgld AND fabgdocno=p_fabgdocno
   #(2).狀態碼=确认,才可進行確認動作
   IF l_fabg.fabgstus <>'Y' THEN
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'','agl-00053',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00053'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()       
   END IF 
   #(3).有單頭資料但無單身資料返回报错
   LET l_cnt = 0
   #140122-00001#129--mark--str--lujh
   #SELECT count(*) INTO l_cnt FROM fabg_t
   # WHERE fabgent = g_enterprise
   #   AND fabgld  = p_fabgld
   #   AND fabgdocno = p_fabgdocno
   #140122-00001#129--mark--end--lujh
   
   #160824-00027#1 mod--s 
   ##140122-00001#129--add--str--lujh
   #SELECT COUNT(*) INTO l_cnt FROM fabh_t
   # WHERE fabhent = g_enterprise
   #   AND fabhld  = p_fabgld
   #   AND fabhdocno = p_fabgdocno  
   ##140122-00001#129--add--end--lujh 
   CASE
      WHEN l_fabg.fabg005='14' OR l_fabg.fabg005='8' OR l_fabg.fabg005='6' OR l_fabg.fabg005='21'
        OR l_fabg.fabg005='9' OR l_fabg.fabg005='0' OR l_fabg.fabg005='23' OR l_fabg.fabg005='35'
        OR l_fabg.fabg005='31'
           SELECT COUNT(*) INTO l_cnt FROM fabh_t
           WHERE fabhent = g_enterprise
             AND fabhld  = p_fabgld
             AND fabhdocno = p_fabgdocno 
      WHEN l_fabg.fabg005='4' OR l_fabg.fabg005='17'
          SELECT count(*) INTO l_cnt FROM fabo_t
           WHERE faboent = g_enterprise
             AND fabold  = p_fabgld
             AND fabodocno = p_fabgdocno
      OTHERWISE  #其他情况先不判断单身有没有不报错，若有发现还有其他情况再增加WHEN条件
         LET l_cnt = 1
   END CASE
   IF l_cnt = 0  THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','agl-00066',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00066'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF
   #160824-00027#1 mod--e    
   
   #170617-00292#1 add s---
   #LET l_sql = " SELECT fabh001,fabh002,fabh000 FROM fabh_t ",   #190619-00008#1 mark
   LET l_sql = " SELECT fabh001,fabh002,fabh000,fabh008 ",        #190619-00008#1 add
               "   FROM fabh_t ",                                 #190619-00008#1 add
               "  WHERE fabhent = ",g_enterprise," AND fabhdocno = '",p_fabgdocno,"' AND fabhld = '",p_fabgld,"'"   
   PREPARE s_afat503_fabh_pr2 FROM l_sql
   DECLARE s_afat503_fabh_cs2 CURSOR FOR s_afat503_fabh_pr2
  #FOREACH s_afat503_fabh_cs2 INTO l_fabh001,l_fabh002,l_fabh000  #190619-00008#1 mark
   FOREACH s_afat503_fabh_cs2 INTO l_fabh001,l_fabh002,l_fabh000,l_fabh008  #190619-00008#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = sqlca.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
          
         LET r_success = FALSE         
         EXIT FOREACH
      END IF               
    
      #190619-00008#1-(S) add
      IF l_fabg.fabg005 = '9' THEN
         IF cl_null(l_fabh008) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-09597'   #卡片編號%1+財產編號%2+附號%3，發現異常資料，[成本]不可為空! 請檢查！
            LET g_errparam.replace[1] = l_fabh000
            LET g_errparam.replace[2] = l_fabh001
            LET g_errparam.replace[3] = l_fabh002
            LET g_errparam.coll_vals[1]  = l_fabh000
            LET g_errparam.coll_vals[2]  = l_fabh001
            LET g_errparam.coll_vals[3]  = l_fabh002         
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
             
            LET r_success = FALSE
         END IF
      END IF
      #190619-00008#1-(E) add
      IF NOT s_afat503_fixed_chk1(l_fabh001,l_fabh002,l_fabh000,p_fabgld,l_fabg.fabgcomp,l_fabg.fabgdocdt) THEN 
         RETURN FALSE   
      END IF 
   END FOREACH   
   #170617-00292#1 add e---   
   
   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 更新狀態碼為已過單
# Memo...........:
# Usage..........: CALL s_afat503_post_upd_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_post_upd_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabh              RECORD LIKE fabh_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076,  #主要類別新
       fabh078 LIKE fabh_t.fabh078, #170207-00044#1 add
       fabh079 LIKE fabh_t.fabh079  #170207-00044#1 add
      ,fabh080 LIKE fabh_t.fabh080, #190617-00022#1 add
       fabh081 LIKE fabh_t.fabh081  #190617-00022#1 add
       END RECORD    
   #161128-00061#6---modify--end--------------------
   DEFINE l_sql               STRING
   DEFINE l_faah015           LIKE faah_t.faah015
   DEFINE l_faaj020           LIKE faaj_t.faaj020
   DEFINE l_faaj103           LIKE faaj_t.faaj103
   DEFINE l_faaj153           LIKE faaj_t.faaj153
   DEFINE l_faaj018           LIKE faaj_t.faaj018
   DEFINE l_faaj028           LIKE faaj_t.faaj028
   DEFINE l_faaj021           LIKE faaj_t.faaj021 
   DEFINE l_faah018           LIKE faah_t.faah018
   DEFINE l_faaj033           LIKE faaj_t.faaj033
   DEFINE l_qty               LIKE faaj_t.faaj033
   DEFINE l_faaj112           LIKE faaj_t.faaj112
   DEFINE l_faaj162           LIKE faaj_t.faaj162
   DEFINE l_fabiseq1          LIKE fabi_t.fabiseq
   DEFINE l_today             DATETIME YEAR TO SECOND
   DEFINE l_cnt               LIKE type_t.num5   
   DEFINE l_faaj020_1         LIKE faaj_t.faaj020
   DEFINE l_fabi007           LIKE fabi_t.fabi007  #20141229 add by chenying
   DEFINE l_faai007           LIKE faai_t.faai007  #20141229 add by chenying 
   DEFINE l_fabh073           LIKE fabh_t.fabh073  #160331-00003#1
   DEFINE l_faaj016           LIKE faaj_t.faaj016  #170426-00013#1 add xul
   DEFINE l_glaa014           LIKE glaa_t.glaa014  #170618-00113#1 add
   DEFINE l_faaj015           LIKE faaj_t.faaj015  #170618-00113#1 add 
   DEFINE l_faaj020_a         LIKE faaj_t.faaj020  #190426-00010#1 add 
   
   WHENEVER ERROR CONTINUE
    
   LET r_success  = TRUE
   LET l_today = cl_get_current()  
   #更新狀態碼=過帳, 過帳人=g_user,過帳日期=g_today
   UPDATE fabg_t SET fabgstus = 'S',
                     fabgpstid = g_user,
                     fabgpstdt = l_today
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
   IF SQLCA.SQLCODE THEN
#      CALL cl_errmsg('fabgdocno',p_fabgdocno,'S',SQLCA.SQLCODE,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = sqlca.sqlcode
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF 
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t
   WHERE fabgent = g_enterprise
     AND fabgld = p_fabgld
     AND fabgdocno = p_fabgdocno
   #更新資產狀態
   #161128-00061#6---modify--begin--------------------
   #LET l_sql = " SELECT * FROM fabh_t",
   LET l_sql = " SELECT fabhent,fabhld,fabhsite,fabhdocno,fabhseq,fabh000,fabh001,fabh002,fabh003,",
               "fabh004,fabh005,fabh006,fabh007,fabh008,fabh009,fabh010,fabh011,fabh012,fabh013,fabh014,",
               "fabh015,fabh016,fabh017,fabh018,fabh019,fabh020,fabh021,fabh022,fabh023,fabh024,fabh025,",
               "fabh026,fabh027,fabh028,fabh029,fabh030,fabh031,fabh032,fabh033,fabh034,fabh035,fabh036,",
               "fabh037,fabh038,fabh039,fabh040,fabh041,fabh042,fabh043,fabh060,fabh061,fabh062,fabh063,",
               "fabh064,fabh065,fabh066,fabh067,fabh068,fabh069,fabh100,fabh101,fabh102,fabh103,fabh104,",
               "fabh105,fabh106,fabh107,fabh108,fabh109,fabh110,fabh150,fabh151,fabh152,fabh153,fabh154,",
               "fabh155,fabh156,fabh157,fabh158,fabh159,fabh160,fabh070,fabh071,fabh072,fabh073,fabh111,",
               "fabh161,fabh074,fabh075,fabh076,fabh078,fabh079,fabh080,fabh081 FROM fabh_t",  #170207-00044#1 add fabh078,fabh079    #190617-00022#1 add fabh080,fabh081  
   #161128-00061#6---modify--end--------------------
               " WHERE fabhent = '",g_enterprise,"'",
               "   AND fabhld = '",p_fabgld,"'",
               "   AND fabhdocno = '",p_fabgdocno,"'"
   PREPARE s_voucher_fabh_pr1 FROM l_sql
   DECLARE s_voucher_fabh_cs1 CURSOR FOR s_voucher_fabh_pr1
   FOREACH s_voucher_fabh_cs1 INTO l_fabh.*
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = sqlca.sqlcode
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE         
         EXIT FOREACH
      END IF

 

      #重估&減值
      #調整成本：調增累加，調減想減
      IF l_fabh.fabh018='1' THEN #調增
          LET l_faaj020=l_fabh.fabh010
          LET l_faaj103=l_fabh.fabh103
          LET l_faaj153=l_fabh.fabh153
          LET l_faaj021=l_fabh.fabh019
          LET l_faaj112=l_fabh.fabh109
          LET l_faaj162=l_fabh.fabh159          
      ELSE #調減
          LET l_faaj020=l_fabh.fabh010*(-1)
          LET l_faaj103=l_fabh.fabh103*(-1)
          LET l_faaj153=l_fabh.fabh153*(-1)
          LET l_faaj021=l_fabh.fabh019*(-1)
          LET l_faaj112=l_fabh.fabh109*(-1)
          LET l_faaj162=l_fabh.fabh159*(-1)          
      END IF
      
      #銷賬/盘亏
      IF l_fabg.fabg005='6' OR l_fabg.fabg005= '24' THEN  #160329-00025#1 add l_fabg.fabg005= '24'
         LET l_faah015='6' 
         #faah數量
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent = g_enterprise AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002
            
         #faaj數量
        SELECT faaj033 INTO l_faaj033 FROM faaj_t 
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
        #190923-00051#1 mark(s)
        #160331-00003#1 add -str    
        #SELECT fabh073 INTO l_fabh073 
        #  FROM fabh_t
        # WHERE fabhent   = g_enterprise
        #   AND fabhld    = p_fabgld
        #   AND fabhdocno = p_fabgdocno
        #160331-00003#1 add -end   
        #190923-00051#1 mark(e)
         LET l_qty = l_faah018 - l_faaj033
         #170618-00147#1 add s---
         IF l_fabg.fabg005='6' THEN 
            IF l_qty > 0 THEN 
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                                 faaj034 = faaj034 + l_fabh.fabh008,            #處置成本
                                 faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                                 faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                                                                                #本期處置累折
                                                     #（本期累折-本期處置累折）/(faah數量-處置數量)*銷賬數量                           
#                                 faaj032 = faaj032 + (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                                 faaj032 = faaj032 + l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073 
                                 faaj028 = faaj028 - l_fabh.fabh004,            #未折減額
                                 faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                                 faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                                 
                                 faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                                 faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                                                                #本位幣二本期處置累折                                                               
                                 faaj115 = faaj115 + (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007,
                                 faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                                 faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                                 faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                                 faaj158 = faaj158 - l_fabh.fabh158,            #本位幣三未折減額
                                 faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值                              
                                                                                #本位幣三本期處置累折                                                                          
                                 faaj165 = faaj165 + (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                   AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
                                        
            ELSE
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                                 faaj034 = faaj034 + l_fabh.fabh008,            #處置成本
                                 faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                                 faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                                 
                                 faaj028 = faaj028 - l_fabh.fabh004,            #未折減額
                                # faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj019 = 0,
                                 faaj032 = faaj032 + l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073 
                                 faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                                 faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                             
                                 faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                                # faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj105 = 0,
                                 faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                                 faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                                 faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                                #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj155 = 0,                             
                                 faaj158 = faaj158 - l_fabh.fabh158             #本位幣三未折減額
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
            END IF             
         ELSE
         #盘亏
         LET l_fabh.fabh006 = l_fabh.fabh006-l_fabh.fabh007 #190703-00033#1 add
         #170618-00147#1 add e---
            IF l_qty > 0 THEN 
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                                 faaj034 = faaj034 + l_fabh.fabh010,            #處置成本 #170618-00147#1 mod fabh008-->fabh010
                                 faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                                 faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                                                                                #本期處置累折
                                                     #（本期累折-本期處置累折）/(faah數量-處置數量)*銷賬數量                           
#                                 faaj032 = faaj032 + (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                                 faaj032 = faaj032 + l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073 
                                 #faaj028 = faaj028 - l_fabh.fabh004,            #未折減額 #190703-00033#1 mark
                                 #新的未折減額=成本 -(新的)處置成本           +(新的)處置累折          -累折
                                 #因為這邊的faaj028成本已經是有加過調整成本的，所以不用在加一次，避免虛增
                                 #faaj028 = faaj028-(faaj034+l_fabh.fabh010)+(faaj035+l_fabh.fabh011)-l_fabh.fabh011, #190703-00033#1  add  #210603-00009#1 mark
                                 #盘亏过账回写afai100未折减额=（成本 + 调整成本 - 处置成本 - 盘亏单身处置成本）-（累折 - 处置累折 - 盘亏单身累折 ） #210603-00009#1 add memo
                                 faaj028 = (faaj016 + faaj020 - faaj034 - l_fabh.fabh010) - (faaj017 - faaj035 - l_fabh.fabh011),           #210603-00009#1 add
                                 faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                                 faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                                 
                                 faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                                 faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                                                                #本位幣二本期處置累折                                                               
                                 faaj115 = faaj115 + (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007,
                                 faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                                 faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                                 faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                                 faaj158 = faaj158 - l_fabh.fabh158,            #本位幣三未折減額
                                 faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值                              
                                                                                #本位幣三本期處置累折                                                                          
                                 faaj165 = faaj165 + (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                   AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
                                        
            ELSE
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                                 faaj034 = faaj034 + l_fabh.fabh010,            #處置成本 #170618-00147#1 mod fabh008-->fabh010
                                 faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                                 faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                                 
                                 #faaj028 = faaj028 - l_fabh.fabh004,            #未折減額 #190703-00033#1 mark
                                 #新的未折減額=成本 -(新的)處置成本           +(新的)處置累折          -累折
                                 #因為這邊的faaj028成本已經是有加過調整成本的，所以不用在加一次，避免虛增
                                 faaj028 = faaj028-(faaj034+l_fabh.fabh010)+(faaj035+l_fabh.fabh011)-l_fabh.fabh011, #190703-00033#1  add
                                # faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj019 = 0,
                                 faaj032 = faaj032 + l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073 
                                 faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                                 faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                             
                                 faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                                # faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj105 = 0,
                                 faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                                 faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                                 faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                                #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                 faaj155 = 0,                             
                                 faaj158 = faaj158 - l_fabh.fabh158             #本位幣三未折減額
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
            END IF  
         END IF #170618-00147#1 add   
         #160329-00025#1 add--str--  
         IF l_fabg.fabg005 = '24' AND l_fabh.fabh006 = 0 THEN #161103-00028#1 Add AND l_fabh.fabh006 = 0
            UPDATE faah_t SET faah015 = '6',
                              faah016 = '2'
             WHERE faahent = g_enterprise AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002 AND faah001 = l_fabh.fabh000
            #190703-00033#1 add(s)             
            UPDATE faaj_t SET faaj038 = '6'
             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
            #190703-00033#1 add(e)
         END IF    
         #160329-00025#1 add--end--         
      END IF
      
      #減值
      IF l_fabg.fabg005='14' THEN
         #更新faaj已提列減值準備
         UPDATE faaj_t SET faaj021 = faaj021 + l_faaj021,    #已提列減值準備
                           faaj112 = faaj112 + l_faaj112,    #本位幣二已提列減值準備
                           faaj162 = faaj162 + l_faaj162     #本位幣三已提列減值準備
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
      END IF
          
      #############add by huangtao
      #IF l_fabg.fabg005='8' OR l_fabg.fabg005='39' THEN  #160426-00014#10 add ‘39’ #161104-00048#5 mark
      #IF l_fabg.fabg005='8' OR l_fabg.fabg005='39' OR l_fabg.fabg005='9' OR l_fabg.fabg005='23' THEN  #160426-00014#10 add ‘39’  #161104-00048#5 add #170618-00113#1 add '23'       #171214-00048#1 mark 
      IF (l_fabg.fabg005='8' AND l_fabh.fabh003<>'7') OR l_fabg.fabg005='39' OR (l_fabg.fabg005='9' AND l_fabh.fabh003<>'7') OR l_fabg.fabg005='23' THEN    #171214-00048#1 add
         IF l_fabh.fabh006 > 0 THEN
            #200102-00009#1 add(s)
            IF l_fabh.fabh014 = 0 THEN
               UPDATE faah_t SET faah015 = '4'
                WHERE faahent = g_enterprise AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002 AND faah001 = l_fabh.fabh000
               UPDATE faaj_t SET faaj038 = '4'
                WHERE faajent = g_enterprise AND faaj001 = l_fabh.fabh001 AND faaj002 = l_fabh.fabh002 AND faaj037 = l_fabh.fabh000
            ELSE
            #200102-00009#1 add(e)
#161104-00048#1 mod s---         
            UPDATE faah_t SET faah015 = '9'   #171129-00039#1----remark
             WHERE faahent = g_enterprise AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002 AND faah001 = l_fabh.fabh000   #171129-00039#1----remark
            UPDATE faaj_t SET faaj038 = '9'
             WHERE faajent = g_enterprise AND faaj001 = l_fabh.fabh001 AND faaj002 = l_fabh.fabh002 AND faaj037 = l_fabh.fabh000          
#161104-00048#1 mod e---
            END IF  #200102-00009#1 add
         END IF
      END IF
      #############add by huangtao
      

      #重估或盤盈/盤虧或改良
      IF l_fabg.fabg005='8' OR l_fabg.fabg005 = '23'  OR l_fabg.fabg005='9' OR l_fabg.fabg005='39' THEN #160329-00025#1 del OR l_fabg.fabg005 = '24'#160426-00014#10 add ‘39’ 
         LET l_cnt = 0 
         SELECT COUNT(*) INTO l_cnt FROM faaj_t WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND (faaj002=l_fabh.fabh002 OR faaj002 IS NULL) 
               AND faaj037=l_fabh.fabh000
         IF l_cnt > 0 THEN   #存在於 afai100 中                        
            #本期累折=本期累折+重估累計折舊-累折
            IF cl_null(l_fabh.fabh011) THEN LET l_fabh.fabh011=0 END IF
            IF cl_null(l_fabh.fabh012) THEN LET l_fabh.fabh012=0 END IF
            
            LET l_faaj018=l_fabh.fabh012-l_fabh.fabh011  #重估累計折舊-累折
            
            #未折減額=(本币成本+调整成本-累计折旧)-处置成本+处置累折 
            IF cl_null(l_fabh.fabh008) THEN LET l_fabh.fabh008=0 END IF
            #170426-00013#1--add--s--xul
            IF l_fabg.fabg005='39' THEN  
               SELECT faaj016,faaj020 INTO l_faaj016,l_faaj020_a   #190426-00010#1---add---->,faaj020   和   ,l_faaj020_a    
                 FROM faaj_t WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND (faaj002=l_fabh.fabh002 OR faaj002 IS NULL) 
                  AND faaj037=l_fabh.fabh000
               IF cl_null(l_faaj016) THEN LET l_faaj016 =0 END IF
#               LET l_faaj028=l_faaj016+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧)             #190426-00010#1---mark    
               LET l_faaj028=l_faaj016+l_faaj020_a+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧) #190426-00010#1---add               
            ELSE
            #170426-00013#1--add--e--xul         
               #LET l_faaj028=l_fabh.fabh008+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧) #171005-00014#1 mark
               #171005-00014#1 add(s)
               LET l_faaj016 = 0     #191105-00013#1---add
               SELECT faaj020,faaj016 INTO l_faaj020_1,l_faaj016  FROM faaj_t WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld  #191105-00013#1---add-->,faaj016    ,l_faaj016 
                  AND faaj001=l_fabh.fabh001 AND (faaj002=l_fabh.fabh002 OR faaj002 IS NULL) 
                  AND faaj037=l_fabh.fabh000
               
               #191105-00013#1---add--str
               IF cl_null(l_faaj016) THEN
                  LET l_faaj016 = 0 
               END IF
               LET l_faaj028=l_faaj016+l_faaj020_1+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧)
               #191105-00013#1---add--end
                  
#               LET l_faaj028=l_fabh.fabh008+l_faaj020_1+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧)  #191105-00013#1---mark
                              
               #171005-00014#1 add(e)            
            END IF #170426-00013#1 add xul 
            #160329-00025#1 add--str--
            #161103-00028#1 Mark ---(S)---
           ###更新faah_t狀態
           #IF l_fabg.fabg005 = '23' THEN 
           #   UPDATE faah_t SET faah015 = '9',
           #                     faah016 = '2'
           #    WHERE faahent = g_enterprise AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002 AND faah001 = l_fabh.fabh000        
           #END IF
            #161103-00028#1 Mark ---(E)---
#            IF l_fabg.fabg005 = '24' THEN 
#               UPDATE faah_t SET faah015 = '6',
#                                 faah016 = '2'
#                WHERE faahent = g_enterprise AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002 AND faah001 = l_fabh.fabh000        
#            END IF         
            #160329-00025#1 add--end--            
            
            #更新faaj_t
            #資產狀態為折畢再提時進行重估，重估的未使用年限與預留殘值賦值與折畢再提的預留年限和預留殘值
            IF l_fabh.fabh003='7' THEN
               UPDATE faaj_t SET faaj020 = faaj020 + l_faaj020,                        #調整成本
                                 faaj012 = l_fabh.fabh016,                             #折畢再提預留殘值
                                 #faaj013 = l_fabh.fabh014,                            #折畢再提預留年月（數）#171212-00024#1 mark
                                 faaj005 = l_fabh.fabh014,                             #折畢再提預留年月（數）#171212-00024#1 add
                                 faaj018 = faaj018 + l_faaj018,                        #本期累折
                                 faaj017 = l_fabh.fabh012,                             #累計折舊
                                 #faaj028 = l_faaj028 - faaj034 + faaj035,              #未折減額      #170426-00013#1 MARK xul 
                                 faaj028 = CASE WHEN l_fabg.fabg005 ='39' THEN l_faaj028 - faaj034 - faaj035 ELSE l_faaj028 - faaj034 + faaj035 END,#170426-00013#1 add xul                                
                                 faaj103 = faaj103 + l_faaj103,                        #本位幣二調整成本                      
                                 faaj104 = l_fabh.fabh105,                             #本位幣二累折
                                 faaj106 = l_fabh.fabh107,                             #本位幣二折畢再提預留殘值
                                 faaj117 = l_fabh.fabh103,
                                 faaj167 = l_fabh.fabh153, 
                                 faaj153 = faaj153 + l_faaj153,                        #本位幣調整三成本                      
                                 faaj154 = l_fabh.fabh155,                             #本位幣三累折
                                 faaj156 = l_fabh.fabh157                              #本位幣三折畢再提預留殘值
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
            ELSE
               #190830-00087#1 add -s
               #盘盈时应排除耐用年限
               IF l_fabg.fabg005 = '23'  THEN
                  UPDATE faaj_t SET faaj020 = faaj020 + l_faaj020,                        #調整成本
                                    faaj005 = l_fabh.fabh014,                             #未使用年限(月數)
                                    faaj019 = l_fabh.fabh016,                             #預留殘值
                                    faaj018 = faaj018 + l_faaj018,                        #本期累折
                                    faaj017 = l_fabh.fabh012,                             #累計折舊
                                    faaj028 = CASE WHEN l_fabg.fabg005 ='39' THEN l_faaj028 - faaj034 - faaj035 ELSE l_faaj028 - faaj034 + faaj035 END,
                                    faaj103 = faaj103 + l_faaj103,                        #本位幣二成本                      
                                    faaj104 = l_fabh.fabh105,                             #本位幣二累折
                                    faaj105 = l_fabh.fabh107,                             #本位幣二折畢再提預留殘值
                                    faaj117 = l_fabh.fabh103,
                                    faaj167 = l_fabh.fabh153, 
                                    faaj153 = faaj153 + l_faaj153,                        #本位幣三調整成本                      
                                    faaj154 = l_fabh.fabh155,                             #本位幣三累折
                                    faaj155 = l_fabh.fabh157                              #本位幣三折畢再提預留殘值
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                     AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
               ELSE
               #190830-00087#1 add -e
                  UPDATE faaj_t SET faaj020 = faaj020 + l_faaj020,                        #調整成本
                                    faaj004 = l_fabh.fabh081,                             #耐用年限  #190617-00022#1 add
                                    faaj005 = l_fabh.fabh014,                             #未使用年限(月數)
                                    faaj019 = l_fabh.fabh016,                             #預留殘值
                                    faaj018 = faaj018 + l_faaj018,                        #本期累折
                                    faaj017 = l_fabh.fabh012,                             #累計折舊
                                    #faaj028 = l_faaj028 - faaj034 + faaj035,              #未折減額      #170426-00013#1 MARK xul 
                                    faaj028 = CASE WHEN l_fabg.fabg005 ='39' THEN l_faaj028 - faaj034 - faaj035 ELSE l_faaj028 - faaj034 + faaj035 END,#170426-00013#1 add xul  
                                    faaj103 = faaj103 + l_faaj103,                        #本位幣二成本                      
                                    faaj104 = l_fabh.fabh105,                             #本位幣二累折
                                    faaj105 = l_fabh.fabh107,                             #本位幣二折畢再提預留殘值
                                    faaj117 = l_fabh.fabh103,
                                    faaj167 = l_fabh.fabh153, 
                                    faaj153 = faaj153 + l_faaj153,                        #本位幣三調整成本                      
                                    faaj154 = l_fabh.fabh155,                             #本位幣三累折
                                    faaj155 = l_fabh.fabh157                              #本位幣三折畢再提預留殘值
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                     AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
               END IF  #190830-00087#1 add
            END IF
            
            #200518-00023#1---add----str
            IF l_fabg.fabg005='8' THEN
               #重估过帐后回写修改：faaj017 = l_fabh.fabh012+faaj035 
               #未折减额=（原始成本+调整成本-处置成本）-（累计折旧-处置累折） faaj028=(faaj016+faaj020-faaj034)-(faaj017-faaj035) 
               UPDATE faaj_t SET faaj017 = l_fabh.fabh012 + faaj035,
                                 faaj028 = (faaj016 + faaj020 - faaj034) - l_fabh.fabh012
                WHERE faajent = g_enterprise 
                  AND faajld  = l_fabh.fabhld
                  AND faaj001 = l_fabh.fabh001 
                  AND faaj002 = l_fabh.fabh002 
                  AND faaj037 = l_fabh.fabh000
            END IF
            #200518-00023#1---add----end
            
            #180614-00012#1 -s 180725 add by 08172
            #改良盘盈时不更新折旧方式
#            IF l_fabg.fabg005 <> '9' THEN  #190830-00087#1 mark 
            IF l_fabg.fabg005 <> '9' AND l_fabg.fabg005 <> '23' THEN  #190830-00087#1
            #180614-00012#1 -e 180725 add by 08172
               #170207-00044#1 add s---
               UPDATE faaj_t SET faaj003 = l_fabh.fabh079
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000         
               #170207-00044#1 add e---             
            END IF #180614-00012#1 180725 add by 08172
         ELSE   #不存在於 afai100 中 需要新增faah_t,faaj_t,faai_t數據
             CALL s_afat503_ins_faah(l_fabh.fabhdocno,l_fabh.fabhld,l_fabh.fabhseq) 
         END IF
      END IF  
    
      #170618-00113#1--add--str--
      #盘盈
      #1.资产状态改为9.盘盈，faah015,faaj038都要更新
      #2.数量=faah018 + 盘盈数量fabh007,原币金额=faah022 +调整成本fabh010,原币单价=原币金额/数量，本币单价/金额=原币*汇率
      IF l_fabg.fabg005 = '23'  THEN
         SELECT glaa014 INTO l_glaa014 FROM glaa_t 
          WHERE glaaent=g_enterprise AND glaald=l_fabh.fabhld
          #170707-00009#1--add--s--xul
          #调整成本要换算成原币在计算
           SELECT faaj015 INTO l_faaj015 FROM faaj_t
            WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
              AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
          #170707-00009#1--add--e--xul
         IF l_glaa014 ='Y' THEN
            UPDATE faah_t SET faah015 = '9',
                              faah018 = faah018 + l_fabh.fabh007,
                              faah022 = faah022 + l_fabh.fabh010/l_faaj015   #170707-00009#1 add /l_faaj015
             WHERE faahent = g_enterprise
               AND faah001 = l_fabh.fabh000
               AND faah003 = l_fabh.fabh001
               AND faah004 = l_fabh.fabh002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faah_t'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
            #170707-00009#1--mark--s--xul
            #放在上面
#            SELECT faaj015 INTO l_faaj015 FROM faaj_t
#             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
#               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
            #170707-00009#1--mark--e--xul   
            UPDATE faah_t SET faah021 = faah022/faah018,
                              faah023 = faah022/faah018 * l_faaj015 ,
                              faah024 = faah022 * l_faaj015
             WHERE faahent = g_enterprise
               AND faah001 = l_fabh.fabh000
               AND faah003 = l_fabh.fabh001
               AND faah004 = l_fabh.fabh002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faah_t'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
         END IF
      END IF
      #170618-00113#1--add--end

      #報廢
      IF l_fabg.fabg005='21' THEN
         LET l_faah015='21' 
         #faah數量
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent = g_enterprise AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002
            
         #faaj數量
         SELECT faaj033 INTO l_faaj033 FROM faaj_t                   
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
        #190923-00051#1 mark(s)
        #160331-00003#1 add -str    
        #SELECT fabh073 INTO l_fabh073 
        #  FROM fabh_t
        # WHERE fabhent   = g_enterprise
        #   AND fabhld    = p_fabgld
        #   AND fabhdocno = p_fabgdocno
        #160331-00003#1 add -end
        #190923-00051#1 mark(e)        
         LET l_qty = l_faah018 - l_faaj033
         
         
         IF l_qty > 0 THEN 
            #更新faaj
            UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                              faaj034 = faaj034 + l_fabh.fabh008,            #處置成本
                              faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                              faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                                                                             #本期處置累折
                                                  #（本期累折-本期處置累折）/(faah數量-處置數量)*報廢數量                           
#                              faaj032 = faaj032 + (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                              faaj032 = faaj032 + l_fabh.fabh073,            #190923-00051#1 mod l_fabh073->l_fabh.fabh073
                              faaj028 = faaj028 - l_fabh.fabh004 ,           #未折減額
                              faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                              faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                              faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                             
                              faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                              faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                                                                             #本位幣二本期處置累折                                                               
                              faaj115 = faaj115 + (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007, 
                              faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                              faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                              faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                              faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                              faaj158 = faaj158 - l_fabh.fabh158,            #本位幣三未折減額
                              faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值
                                                                             #本位幣三本期處置累折                                                                          
                              faaj165 = faaj165 + (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
               WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000                       
         ELSE
            #更新faaj
            UPDATE faaj_t SET faaj033 = faaj033 + l_fabh.fabh007,            #處置數量 
                              faaj034 = faaj034 + l_fabh.fabh008,            #處置成本
                              faaj035 = faaj035 + l_fabh.fabh011,            #處置累折
                              faaj027 = faaj027 + l_fabh.fabh017,            #銷賬減值準備
                              faaj028 = faaj028 - l_fabh.fabh004,            #未折減額
                              #faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              faaj019 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj019 / l_qty END)*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值     #150709-00007#1 add lujh                          
                              faaj113 = faaj113 + l_fabh.fabh102,            #本位幣二處置成本
                              faaj114 = faaj114 + l_fabh.fabh104,            #本位幣二處置累折                             
                              faaj110 = faaj110 + l_fabh.fabh110,            #本位幣二銷賬減值準備 
                              faaj108 = faaj108 - l_fabh.fabh108,            #本位幣二未折減額
                              #faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              faaj105 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj105 / l_qty END)*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值     #150709-00007#1 add lujh  
                              faaj163 = faaj163 + l_fabh.fabh152,            #本位幣三處置成本
                              faaj164 = faaj164 + l_fabh.fabh154,            #本位幣三處置累折                             
                              faaj160 = faaj160 + l_fabh.fabh160,            #本位幣三銷賬減值準備 
                              #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              faaj155 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj155 / l_qty END)*(l_faah018 - (l_faaj033+l_fabh.fabh007)), #预留残值     #150709-00007#1 add lujh                         
                              faaj158 = faaj158 - l_fabh.fabh158             #本位幣三未折減額
             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
             AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
         END IF 

      END IF
      
      IF SQLCA.SQLCODE THEN
#         CALL cl_errmsg('upd faaj_t','','',SQLCA.SQLCODE,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'upd faaj_t'
         LET g_errparam.code   = sqlca.sqlcode
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE
      END IF
         
      #銷賬 
      IF l_fabg.fabg005='6' THEN 
         #faaj數量
         SELECT faaj033 INTO l_faaj033 FROM faaj_t
             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000               
      END IF
      
      #報廢
      IF l_fabg.fabg005='21' THEN 
         #faaj數量
         SELECT faaj033 INTO l_faaj033 FROM faaj_t
             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000               
      END IF      
                                                         #檢查是否數量已銷賬完                               
#      IF l_fabg.fabg005='8' OR (l_fabg.fabg005 = '6' AND l_faah018 = l_faaj033 ) THEN   #mark by yangxf
      IF l_fabg.fabg005 = '6' AND l_faah018 = l_faaj033 THEN                             #add by yangxf
         UPDATE faah_t SET faah015 = l_faah015,
                           faahmodid = g_user,
                           faahmoddt = l_today
          WHERE faahent = g_enterprise
            AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001
            AND faah004 = l_fabh.fabh002
         IF SQLCA.SQLCODE THEN
#            CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faah_t'
            LET g_errparam.code   = sqlca.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF
         #190719-00027#1---add---str--
         UPDATE faaj_t SET faaj038 = l_faah015
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faaj_t'
            LET g_errparam.code   = sqlca.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF   
         #190719-00027#1---add---end--
      END IF
      
      #報廢更新資產狀態
      #已存在已銷賬資料,及時現在剩下的報廢了，但資產狀態還是更新為已銷賬
      #全部報廢完，也更新為已銷賬狀態
                                       #檢查是否數量已報廢完
      IF (l_fabg.fabg005 = '21' AND l_faah018 = l_faaj033) THEN
#         LET l_cnt = 0 
#         SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabh_t
#             ON fabhent = fabgent AND fabhld = fabgld AND fabhdocno = fabgdocno
#          WHERE fabhent = g_enterprise
#            AND fabhld = l_fabh.fabhld
#            AND fabhdocno = l_fabh.fabhdocno
#            AND fabh000 = l_fabh.fabh000
#            AND fabh001 = l_fabh.fabh001
#            AND fabh002 = l_fabh.fabh002
         UPDATE faah_t SET faah015 = '6',
                           faahmodid = g_user,
                           faahmoddt = l_today
          WHERE faahent = g_enterprise
            AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001
            AND faah004 = l_fabh.fabh002
         IF SQLCA.SQLCODE THEN
#            CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faah_t'
            LET g_errparam.code   = sqlca.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF

         #170706-00054#1----add----str
         UPDATE faaj_t SET faaj038 = '6'                  
          WHERE faajent = g_enterprise 
            AND faajld = l_fabh.fabhld
            AND faaj001 = l_fabh.fabh001 
            AND faaj002 = l_fabh.fabh002 
            AND faaj037 = l_fabh.fabh000    
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faaj_t'
            LET g_errparam.code   = sqlca.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF
         #170706-00054#1----add----end

      END IF


  
      IF l_fabg.fabg005='6' THEN
         #更新資產標籤狀態
#         LET g_sql = " SELECT DISTINCT fabiseq1 ",         #20141229 mark by chenying
         LET g_sql = " SELECT DISTINCT fabiseq1,fabi007 ",  #20141229 add by chenying
                      "   FROM fabi_t ",
                      "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",l_fabh.fabhdocno,"'",
                      "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                      "    AND fabi001 = '", l_fabh.fabh000 ,"'",
                      "    AND fabi002 = '", l_fabh.fabh001 ,"'",
                      "    AND fabi003 = '", l_fabh.fabh002 ,"'"
         PREPARE s_voucher_fabi_pr1 FROM g_sql
         DECLARE s_voucher_fabi_cs1 CURSOR FOR s_voucher_fabi_pr1
#         FOREACH s_voucher_fabi_cs1 INTO l_fabiseq1           #20141229 mark by chenying
         LET l_fabi007 = 0                                     #20141229 add by chenying
         LET l_fabiseq1 = 0                                    #20141229 add by chenying
         FOREACH s_voucher_fabi_cs1 INTO l_fabiseq1,l_fabi007  #20141229 add by chenying
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #20141229 add by chenying
            #标签总数量（afai100标签明细）
            LET l_faai007 = 0
            SELECT faai007 INTO l_faai007 FROM faai_t
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq1
               AND faai001 = l_fabh.fabh000
               AND faai002 = l_fabh.fabh001
               AND faai003 = l_fabh.fabh002          
            #20141229 add by chenying
            
#            IF l_faah018 = l_faaj033 THEN  #20141229 mark by chenying
            IF l_faai007 = l_fabi007 THEN   #20141229 add by chenying 
               #銷賬結束更新狀態為 銷賬
               UPDATE faai_t SET faai023 = '6' 
                WHERE faaient = g_enterprise
                  AND faaiseq = l_fabiseq1
                  #20141229 add by chenying
                  AND faai001 = l_fabh.fabh000
                  AND faai002 = l_fabh.fabh001
                  AND faai003 = l_fabh.fabh002
                  #20141229 add by chenying
#20141229 mark by chenying                  
#            ELSE
#               #銷賬未結束更新狀態為 原狀態
#               UPDATE faai_t SET faai023 = l_fabh.fabh003  
#                WHERE faaient = g_enterprise
#                  AND faaiseq = l_fabiseq1 
#                  #20141229 add by chenying
#                  AND faai001 = l_fabh.fabh000
#                  AND faai002 = l_fabh.fabh001
#                  AND faai003 = l_fabh.fabh002
#                  #20141229 add by chenying
#20141229 mark by chenying
            END IF  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
         END FOREACH              
      END IF
      
      #報廢
      IF l_fabg.fabg005='21' THEN
         #更新資產標籤狀態
         LET g_sql = " SELECT DISTINCT fabiseq1,fabi007 ",  #20141229 add fabi007 by chenying
                      "   FROM fabi_t ",
                      "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",l_fabh.fabhdocno,"'",
                      "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                      "    AND fabi001 = '", l_fabh.fabh000 ,"'",
                      "    AND fabi002 = '", l_fabh.fabh001 ,"'",
                      "    AND fabi003 = '", l_fabh.fabh002 ,"'"
         PREPARE s_voucher_fabi_pr3 FROM g_sql
         DECLARE s_voucher_fabi_cs3 CURSOR FOR s_voucher_fabi_pr3
         LET l_fabi007 = 0                                     #20141229 add by chenying
         LET l_fabiseq1 = 0                                    #20141229 add by chenying         
         FOREACH s_voucher_fabi_cs3 INTO l_fabiseq1,l_fabi007  #20141229 add l_fabi007 by chenying
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #20141229 add by chenying
            #标签总数量（afai100标签明细）
            LET l_faai007 = 0
            SELECT faai007 INTO l_faai007 FROM faai_t
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq1
               AND faai001 = l_fabh.fabh000
               AND faai002 = l_fabh.fabh001
               AND faai003 = l_fabh.fabh002          
            #20141229 add by chenying
      
#            IF l_faah018 = l_faaj033 THEN  #20141229 mark by chenying
            IF l_faai007 = l_fabi007 THEN   #20141229 add by chenying 
               #報廢結束更新狀態為 報廢
               #UPDATE faai_t SET faai023 = '21'#181217-00003#1 mark
               UPDATE faai_t SET faai023 = '6'  #181217-00003#1 add
                WHERE faaient = g_enterprise
                  AND faaiseq = l_fabiseq1
                  #20141229 add by chenying
                  AND faai001 = l_fabh.fabh000
                  AND faai002 = l_fabh.fabh001
                  AND faai003 = l_fabh.fabh002
                  #20141229 add by chenying 
#20141229 mark by chenying                  
#            ELSE   
#               #報廢未結束更新狀態為 原狀態
#               UPDATE faai_t SET faai023 = l_fabh.fabh003  
#                WHERE faaient = g_enterprise
#                  AND faaiseq = l_fabiseq1
#                  #20141229 add by chenying
#                  AND faai001 = l_fabh.fabh000
#                  AND faai002 = l_fabh.fabh001
#                  AND faai003 = l_fabh.fabh002
#                  #20141229 add by chenying 
#20141229 mark by chenying 
            END IF  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = sqlca.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err()  
               LET r_success = FALSE
            END IF
         END FOREACH              
      END IF      

 
   END FOREACH
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 作廢檢查
# Memo...........:
# Usage..........: CALL s_afat503_void_chk_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_void_chk_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_fabgstus          LIKE fabg_t.fabgstus            #状态码
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
##      CALL cl_errmsg('void',p_fabgdocno,'','sub-00110',1) #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err() 
#      LET r_success = FALSE
#   END IF 
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #(1).狀態碼=未确认,才可進行作廢動作
   SELECT fabgstus INTO l_fabgstus FROM fabg_t
    WHERE fabgent = g_enterprise
      AND fabgld = p_fabgld
      AND fabgdocno = p_fabgdocno
   #170203-00024#2-S   
   #IF l_fabgstus <>'N' THEN
   IF l_fabgstus NOT MATCHES "[NDR]" THEN
   #170203-00024#2-E   
#      CALL cl_errmsg('void',p_fabgdocno,'','afa-00049',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00049'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新狀態碼為作廢
# Memo...........:
# Usage..........: CALL s_afat503_void_upd_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_void_upd_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_today       DATETIME YEAR TO SECOND
    
   WHENEVER ERROR CONTINUE
    
   LET r_success  = TRUE
   LET l_today = cl_get_current()
   #更新狀態碼='X', 修改者=g_user,修改日期=g_today
   UPDATE fabg_t SET fabgstus = 'X',
                     fabgmodid = g_user,
                     fabgmoddt = l_today
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
   IF SQLCA.SQLCODE THEN
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'X',sqlca.sqlcode,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = sqlca.sqlcode
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取消過帳檢查
# Memo...........:
# Usage..........: CALL s_afat503_unpost_chk_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_unpost_chk_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_fabgstus          LIKE fabg_t.fabgstus
   DEFINE l_fabg011           LIKE fabg_t.fabg011
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_fabg008           LIKE fabg_t.fabg008             #传票号码 #0921
   DEFINE l_fabg005           LIKE fabg_t.fabg005             #160930-00036#1 add
   #190528-00023#1-(S) add
   DEFINE l_sql,l_sql2        STRING
   DEFINE l_fabgdocdt         LIKE fabg_t.fabgdocdt
   DEFINE l_fabh001           LIKE fabh_t.fabh001
   DEFINE l_fabh002           LIKE fabh_t.fabh002
   DEFINE l_fabh000           LIKE fabh_t.fabh000
   DEFINE l_year              LIKE type_t.num5
   DEFINE l_month             LIKE type_t.num5
   #190528-00023#1-(E) add
   #190624-00017#3 add -s
   DEFINE l_faah006           LIKE faah_t.faah006  
   DEFINE l_faal007           LIKE faal_t.faal007 
   DEFINE l_success           LIKE type_t.num5
   #190624-00017#3 add -e
   DEFINE l_faal003           LIKE faal_t.faal003 #200608-00011#1 add
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
#      LET r_success = FALSE
##      CALL cl_errmsg('conf_chk',p_fabgdocno,'','sub-00110',1) #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err() 
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #SELECT fabgstus,fabg011,fabg008 INTO l_fabgstus,l_fabg011,l_fabg008 FROM fabg_t                    #160930-00036#1 mark
   SELECT fabgstus,fabg011,fabg008,fabg005 INTO l_fabgstus,l_fabg011,l_fabg008,l_fabg005 FROM fabg_t   #160930-00036#1 add
    WHERE fabgent = g_enterprise
      AND fabgld = p_fabgld
      AND fabgdocno = p_fabgdocno
   #(2).狀態碼=已過帳,才可進行過賬還原動作   
   IF l_fabgstus <>'S' THEN
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'','agl-00054',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00054'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF 
   
   #(3).有單頭資料但無單身資料返回报错
   LET l_cnt = 0
   #140122-00001#129--mark--str--lujh
   #SELECT count(*) INTO l_cnt FROM fabg_t
   # WHERE fabgent = g_enterprise
   #   AND fabgld  = p_fabgld
   #   AND fabgdocno = p_fabgdocno
   #140122-00001#129--mark--end--lujh
   
   #160930-00036#1---mark---str-- 
   ##140122-00001#129--add--str--lujh
   #SELECT COUNT(*) INTO l_cnt FROM fabh_t
   # WHERE fabhent = g_enterprise
   #   AND fabhld  = p_fabgld
   #   AND fabhdocno = p_fabgdocno  
   ##140122-00001#129--add--end--lujh   
   #160930-00036#1---mark---end--   
   #160930-00036#1---add---str--
   CASE
       WHEN l_fabg005='14' OR l_fabg005='8' OR l_fabg005='6' OR l_fabg005='21'
         OR l_fabg005='9' OR l_fabg005='0' OR l_fabg005='23' OR l_fabg005='35'
         OR l_fabg005='31'
            SELECT COUNT(*) INTO l_cnt FROM fabh_t
            WHERE fabhent = g_enterprise
              AND fabhld  = p_fabgld
              AND fabhdocno = p_fabgdocno
       WHEN l_fabg005='4' OR l_fabg005='17'
           SELECT count(*) INTO l_cnt FROM fabo_t
            WHERE faboent = g_enterprise
              AND fabold  = p_fabgld
              AND fabodocno = p_fabgdocno
       OTHERWISE  #其他情况先不判断单身有没有不报错，若有发现还有其他情况再增加WHEN条件
          LET l_cnt = 1
    END CASE
   #160930-00036#1---add---end--
      
   IF l_cnt = 0  THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','agl-00066',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00066'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF
   #(4)已存在應收賬款不可過帳還原
   IF NOT cl_null(l_fabg011) THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','afa-00171',1) #cymod  
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00171'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   
   #0921
   #(5)已存在传票号码不可過帳還原
   IF NOT cl_null(l_fabg008) THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','afa-00246',1)   #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00246'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   #180614-00012#1 -s add by 08172
   #afat508在aapt301中存在不是作废的资料就不可以取消过账
   IF l_fabg005='9' THEN
      LET l_cnt = 0 
      SELECT COUNT(1) INTO l_cnt
        FROM apca_t,apcb_t
       WHERE apcaent = g_enterprise
         AND apcaent = apcbent
         AND apcald = apcbld
         AND apcadocno = apcbdocno
         AND apca001 = '19'
         AND apcb001 = '23'
         AND apcb002 = p_fabgdocno
         AND apcastus <> 'X'
      IF l_cnt > 0 THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = p_fabgdocno
         LET g_errparam.code   = 'afa-09508'
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
   END IF #200608-00011#1 add   
   #190528-00023#1-(S) add
   #資產是否當月已有折舊
   LET l_sql2 = "SELECT COUNT(1) FROM faam_t ",
               " WHERE faament = ",g_enterprise,
               "   AND faam001 = ? AND faam002 = ? ",
               "   AND faam000 = ? ", 
               "   AND faam004 = ? AND faam005 = ? ",
               "   AND faamld  = '",p_fabgld,"' "      
   PREPARE s_afat503_faam_chk FROM l_sql2
   
   #檢核改良單身資料，是否存在當月折舊信息
   #                    單據日期  卡片編號 財產編號 附號
   LET l_sql = " SELECT fabgdocdt,fabh000,fabh001,fabh002 ",                  
               "   FROM fabg_t ", 
               "   LEFT JOIN fabh_t ON fabgent = fabhent AND fabgld = fabhld AND fabgdocno = fabhdocno ",
               "   WHERE fabgent = ",g_enterprise," AND fabgld = '",p_fabgld,"' ",
               "     AND fabgdocno = '",p_fabgdocno,"' ",
               "   ORDER BY fabhseq "      
   
   PREPARE s_afat503_fabg_pr FROM l_sql
   DECLARE s_afat503_fabg_cur CURSOR FOR s_afat503_fabg_pr
   FOREACH s_afat503_fabg_cur INTO l_fabgdocdt,l_fabh000,l_fabh001,l_fabh002      
      LET l_cnt = 0
      #190624-00017#3 mark -s
      #LET l_year = YEAR(l_fabgdocdt)
      #LET l_month = MONTH(l_fabgdocdt) 
      #190624-00017#3 mark -e
      #190624-00017#3 add -s
      #取年期
      CALL s_fin_date_get_period_value('',p_fabgld,l_fabgdocdt) RETURNING l_success,l_year,l_month
      #取主要类型
      LET l_faah006 = ''
      SELECT faah006 INTO l_faah006 FROM faah_t
       WHERE faahent = g_enterprise
         AND faah003 = l_fabh001
         AND faah004 = l_fabh002 
         AND faah001 = l_fabh000
      #当月异动是否先计提折旧
      LET l_faal007 = ''
      #SELECT faal007 INTO l_faal007  #200608-00011#1 mark
      LET l_faal003 = '' #200608-00011#1 add
      SELECT faal007,faal003 INTO l_faal007,l_faal003 #200608-00011#1 add
        FROM faal_t 
       WHERE faalent = g_enterprise 
         AND faalld = p_fabgld 
         AND faal001 = l_faah006   
      IF cl_null(l_faal007) THEN LET l_faal007 = 'N' END IF
      #200608-00011#1 add(s)
      IF cl_null(l_faal003) THEN LET l_faal003 = 'N' END IF 
      #当月异动是否先计提折旧为N且存在折旧时不可取消过账
      IF (l_faal003 = 'N' AND l_fabg005 <> '14' AND l_fabg005 <> '8' AND l_fabg005 <> '9' AND l_fabg005 <> '39')
         OR (l_faal007 = 'N' AND (l_fabg005 = '14' OR l_fabg005 = '8' OR l_fabg005 = '9' OR l_fabg005 = '39')) THEN
      #200608-00011#1 add(e)
      #当月异动是否先计提折旧为N且存在折旧时不可取消过账
      #IF l_faal007 = 'N' THEN #200608-00011#1 mark
      #190624-00017#3 add -e
         EXECUTE s_afat503_faam_chk USING l_fabh001,l_fabh002,l_fabh000,l_year,l_month INTO l_cnt        
         IF l_cnt > 0 THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-01181'
            LET g_errparam.extend = l_fabh001,'/',l_fabh002,'/',l_fabh000
            LET g_errparam.popup = TRUE
            CALL cl_err()            
         END IF
      END IF  #190624-00017#3 add
   END FOREACH
   #190528-00023#1-(E) add      
   #END IF #200608-00011#1 mark
   #180614-00012#1 -e add by 08172
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 過賬還原
# Memo...........:
# Usage..........: CALL s_afat503_unpost_upd_fabo(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_unpost_upd_fabo(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabo              RECORD LIKE fabo_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabo RECORD  #資產出售單身檔
       faboent LIKE fabo_t.faboent, #企業編碼
       fabold LIKE fabo_t.fabold, #帳套
       fabodocno LIKE fabo_t.fabodocno, #異動單號
       faboseq LIKE fabo_t.faboseq, #項次
       fabo000 LIKE fabo_t.fabo000, #資產類型
       fabo001 LIKE fabo_t.fabo001, #財產編號
       fabo002 LIKE fabo_t.fabo002, #附號
       fabo003 LIKE fabo_t.fabo003, #卡片編號
       fabo004 LIKE fabo_t.fabo004, #未折減額
       fabo005 LIKE fabo_t.fabo005, #單位
       fabo006 LIKE fabo_t.fabo006, #單價
       fabo007 LIKE fabo_t.fabo007, #調撥/出售數量
       fabo008 LIKE fabo_t.fabo008, #成本
       fabo009 LIKE fabo_t.fabo009, #稅別
       fabo010 LIKE fabo_t.fabo010, #交易幣別
       fabo011 LIKE fabo_t.fabo011, #原幣匯率
       fabo012 LIKE fabo_t.fabo012, #原幣未稅金額
       fabo013 LIKE fabo_t.fabo013, #原幣稅額
       fabo014 LIKE fabo_t.fabo014, #原幣應收金額
       fabo015 LIKE fabo_t.fabo015, #本幣未稅金額
       fabo016 LIKE fabo_t.fabo016, #本幣稅額
       fabo017 LIKE fabo_t.fabo017, #本幣應收金額
       fabo018 LIKE fabo_t.fabo018, #處置成本
       fabo019 LIKE fabo_t.fabo019, #處置累折
       fabo020 LIKE fabo_t.fabo020, #處置減值準備
       fabo021 LIKE fabo_t.fabo021, #處置本期折舊
       fabo022 LIKE fabo_t.fabo022, #處置未折減額
       fabo023 LIKE fabo_t.fabo023, #異動原因
       fabo024 LIKE fabo_t.fabo024, #異動科目
       fabo025 LIKE fabo_t.fabo025, #處置預留殘值
       fabo026 LIKE fabo_t.fabo026, #累折科目
       fabo027 LIKE fabo_t.fabo027, #減值準備科目
       fabo028 LIKE fabo_t.fabo028, #資產科目
       fabo029 LIKE fabo_t.fabo029, #應收帳款科目
       fabo030 LIKE fabo_t.fabo030, #稅額科目
       fabo031 LIKE fabo_t.fabo031, #營運據點
       fabo032 LIKE fabo_t.fabo032, #部門
       fabo033 LIKE fabo_t.fabo033, #利潤/成本中心
       fabo034 LIKE fabo_t.fabo034, #區域
       fabo035 LIKE fabo_t.fabo035, #交易客商
       fabo036 LIKE fabo_t.fabo036, #帳款客商
       fabo037 LIKE fabo_t.fabo037, #客群
       fabo038 LIKE fabo_t.fabo038, #人員
       fabo039 LIKE fabo_t.fabo039, #專案編號
       fabo040 LIKE fabo_t.fabo040, #WBS
       fabo041 LIKE fabo_t.fabo041, #帳款編號
       fabo042 LIKE fabo_t.fabo042, #摘要
       fabo043 LIKE fabo_t.fabo043, #調出管理組織
       fabo044 LIKE fabo_t.fabo044, #調出所有組織
       fabo045 LIKE fabo_t.fabo045, #調出核算組織
       fabo046 LIKE fabo_t.fabo046, #調入管理組織
       fabo047 LIKE fabo_t.fabo047, #調入所有組織
       fabo048 LIKE fabo_t.fabo048, #調入核算組織
       fabo049 LIKE fabo_t.fabo049, #處分損益
       fabo050 LIKE fabo_t.fabo050, #應收帳款單號
       fabo051 LIKE fabo_t.fabo051, #交易價格差異
       fabo052 LIKE fabo_t.fabo052, #應付帳款單號
       fabo053 LIKE fabo_t.fabo053, #已計提減值準備
       fabo054 LIKE fabo_t.fabo054, #經營方式
       fabo055 LIKE fabo_t.fabo055, #通路
       fabo056 LIKE fabo_t.fabo056, #品牌
       fabo060 LIKE fabo_t.fabo060, #自由核算項一
       fabo061 LIKE fabo_t.fabo061, #自由核算項二
       fabo062 LIKE fabo_t.fabo062, #自由核算項三
       fabo063 LIKE fabo_t.fabo063, #自由核算項四
       fabo064 LIKE fabo_t.fabo064, #自由核算項五
       fabo065 LIKE fabo_t.fabo065, #自由核算項六
       fabo066 LIKE fabo_t.fabo066, #自由核算項七
       fabo067 LIKE fabo_t.fabo067, #自由核算項八
       fabo068 LIKE fabo_t.fabo068, #自由核算項九
       fabo069 LIKE fabo_t.fabo069, #自由核算項十
       fabo101 LIKE fabo_t.fabo101, #本位幣二幣別
       fabo102 LIKE fabo_t.fabo102, #本位幣二匯率
       fabo103 LIKE fabo_t.fabo103, #本位幣二未稅金額
       fabo104 LIKE fabo_t.fabo104, #本位幣二稅額
       fabo105 LIKE fabo_t.fabo105, #本位幣二應收金額
       fabo106 LIKE fabo_t.fabo106, #本位幣二處份損益
       fabo107 LIKE fabo_t.fabo107, #本位幣二處置成本
       fabo108 LIKE fabo_t.fabo108, #本位幣二處置累折
       fabo109 LIKE fabo_t.fabo109, #本位幣二處置減值準備
       fabo110 LIKE fabo_t.fabo110, #本位幣二本期處置折舊
       fabo111 LIKE fabo_t.fabo111, #本位幣二處置後未折減額
       fabo150 LIKE fabo_t.fabo150, #本位幣三幣別
       fabo151 LIKE fabo_t.fabo151, #本位幣三匯率
       fabo152 LIKE fabo_t.fabo152, #本位幣三未稅金額
       fabo153 LIKE fabo_t.fabo153, #本位幣三稅額
       fabo154 LIKE fabo_t.fabo154, #本位幣三應收金額
       fabo155 LIKE fabo_t.fabo155, #本位幣三處份損益
       fabo156 LIKE fabo_t.fabo156, #本位幣三處置成本
       fabo157 LIKE fabo_t.fabo157, #本位幣三處置累折
       fabo158 LIKE fabo_t.fabo158, #本位幣三處置減值準備
       fabo159 LIKE fabo_t.fabo159, #本位幣三本期處置折舊
       fabo160 LIKE fabo_t.fabo160, #本位幣三處置後未折減額
       fabo112 LIKE fabo_t.fabo112, #本位幣二處置預留殘值
       fabo161 LIKE fabo_t.fabo161  #本位幣三處置預留殘值
       END RECORD
   #161128-00061#6---modify--end--------------------
   
   DEFINE l_sql               STRING
   DEFINE l_faah018           LIKE faah_t.faah018
   DEFINE l_faaj033           LIKE faaj_t.faaj033
   DEFINE l_today             DATETIME YEAR TO SECOND
   DEFINE l_fabiseq           LIKE fabi_t.fabiseq
   DEFINE l_faan007           LIKE faan_t.faan007  #180911-00014#1
   
   
   WHENEVER ERROR CONTINUE
    
   LET r_success  = TRUE
   LET l_today = cl_get_current()  
   #更新狀態碼=過帳, 過帳人=g_user,過帳日期=g_today
   UPDATE fabg_t SET fabgstus = 'Y',
                     fabgpstid = '',
                     fabgpstdt = ''
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
   IF SQLCA.SQLCODE THEN
#      CALL cl_errmsg('fabgdocno',p_fabgdocno,'Y',SQLCA.SQLCODE,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
   END IF 
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t
   WHERE fabgent = g_enterprise
     AND fabgld = p_fabgld
     AND fabgdocno = p_fabgdocno
     
#20141229 add by chenying
    LET g_sql = " SELECT DISTINCT fabiseq1 ",
                 "   FROM fabi_t ",
                 "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",p_fabgdocno,"'",
                 "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                 "    AND fabi001 = ? ",
                 "    AND fabi002 = ? ",
                 "    AND fabi003 = ? "
    PREPARE s_voucher_fabi_pr6 FROM g_sql
    DECLARE s_voucher_fabi_cs6 CURSOR FOR s_voucher_fabi_pr6
#20141229 add by chenying

   #更新資產狀態
   #161128-00061#6---modify--begin-------------------
   #LET l_sql = " SELECT * FROM fabo_t",
   LET l_sql = " SELECT faboent,fabold,fabodocno,faboseq,fabo000,fabo001,fabo002,fabo003,fabo004,",
               "fabo005,fabo006,fabo007,fabo008,fabo009,fabo010,fabo011,fabo012,fabo013,fabo014,",
               "fabo015,fabo016,fabo017,fabo018,fabo019,fabo020,fabo021,fabo022,fabo023,fabo024,",
               "fabo025,fabo026,fabo027,fabo028,fabo029,fabo030,fabo031,fabo032,fabo033,fabo034,",
               "fabo035,fabo036,fabo037,fabo038,fabo039,fabo040,fabo041,fabo042,fabo043,fabo044,",
               "fabo045,fabo046,fabo047,fabo048,fabo049,fabo050,fabo051,fabo052,fabo053,fabo054,",
               "fabo055,fabo056,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,",
               "fabo068,fabo069,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo107,fabo108,",
               "fabo109,fabo110,fabo111,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo156,",
               "fabo157,fabo158,fabo159,fabo160,fabo112,fabo161 FROM fabo_t",
   #161128-00061#6---modify--end--------------------
               " WHERE faboent = '",g_enterprise,"'",
               "   AND fabold = '",p_fabgld,"'",
               "   AND fabodocno = '",p_fabgdocno,"'"
   PREPARE s_voucher_fabo_pr2 FROM l_sql
   DECLARE s_voucher_fabo_cs2 CURSOR FOR s_voucher_fabo_pr2
   FOREACH s_voucher_fabo_cs2 INTO l_fabo.*
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = SQLCA.SQLCODE
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE         
         EXIT FOREACH
      END IF
      #出售
      IF l_fabg.fabg005='4' THEN 
         #faah_t总数量 
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent=g_enterprise AND faah001=l_fabo.fabo003
            AND faah003=l_fabo.fabo001 AND faah004=l_fabo.fabo002          
         #faaj數量
         SELECT faaj033 INTO l_faaj033 FROM faaj_t
          WHERE faajent=g_enterprise AND faajld=p_fabgld
            AND faaj001=l_fabo.fabo001 AND faaj002=l_fabo.fabo002 AND faaj037=l_fabo.fabo003    
              
         #更新faaj_t
         UPDATE faaj_t SET faaj033 = faaj033 - l_fabo.fabo007,     #处置数量
                           faaj034 = faaj034 - l_fabo.fabo018,     #处置成本
                           faaj035 = faaj035 - l_fabo.fabo019,     #处置累折
                           faaj027 = faaj027 - l_fabo.fabo020,     #处置减值准备
                           faaj032 = faaj032 - l_fabo.fabo021,     #本年处置折舊
                           faaj028 = faaj028 + l_fabo.fabo022,     #未折减额
                           faaj113 = faaj113 - l_fabo.fabo107,     #本位币二处置成本
                           faaj114 = faaj114 - l_fabo.fabo108,     #本位币二处置累折
                           faaj110 = faaj110 - l_fabo.fabo109,     #本位币二处置减值准备
                           faaj115 = faaj115 - l_fabo.fabo110,     #本位币二本年处置折舊
                           faaj108 = faaj108 + l_fabo.fabo111,     #本位币二未折减额
                           faaj163 = faaj163 - l_fabo.fabo156,     #本位币三处置成本
                           faaj164 = faaj164 - l_fabo.fabo157,     #本位币三处置累折
                           faaj160 = faaj160 - l_fabo.fabo158,     #本位币三处置减值准备
                           faaj165 = faaj165 - l_fabo.fabo159,     #本位币三本年处置折舊
                           faaj158 = faaj158 + l_fabo.fabo160      #本位币三未折减额     
                          ,faaj019 = faaj019 + l_fabo.fabo025      #預留殘值          #180604-00010#1 add    
                          ,faaj105 = faaj105 + l_fabo.fabo112      #本位幣二預留殘值   #180604-00010#1 add  
                          ,faaj155 = faaj155 + l_fabo.fabo161      #本位幣三預留殘值   #180604-00010#1 add                          
          WHERE faajent=g_enterprise AND faajld=p_fabgld
            AND faaj001=l_fabo.fabo001 AND faaj002=l_fabo.fabo002 AND faaj037=l_fabo.fabo003
         IF SQLCA.SQLCODE THEN
#            CALL cl_errmsg('upd faaj_t','','',SQLCA.SQLCODE,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faaj_t'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET r_success = FALSE
         END IF
                   
         #檢查是否數量已出售完,如果销售完更新资产状态为出售
         IF l_faah018 = l_faaj033  THEN
            #180911-00014#1 add ------
            #出售取消過帳時，狀態還原取最近一個月的faan007來放
            LET l_faan007 = ''
            SELECT faan007 INTO l_faan007
              FROM faan_t
             WHERE faanent = g_enterprise
               AND faan003 = l_fabo.fabo003
               AND faan004 = l_fabo.fabo001
               AND faan005 = l_fabo.fabo002
             ORDER BY faan001 DESC ,faan002 DESC
            IF cl_null(l_faan007) THEN
               LET l_faan007 = '1'
            END IF
            #180911-00014#1 add end---
            #UPDATE faah_t SET faah015 = l_fabo.fabo000, #180911-00014#1 mark
            UPDATE faah_t SET faah015 = l_faan007,       #180911-00014#1
                              faahmodid = g_user,
                              faahmoddt = l_today
             WHERE faahent = g_enterprise
               AND faah001 = l_fabo.fabo003
               AND faah003 = l_fabo.fabo001
               AND faah004 = l_fabo.fabo002
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faah_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET r_success = FALSE
            END IF
         #180911-00014#1 add ------
            UPDATE faaj_t SET faaj038 = l_faan007,
                              faajmodid = g_user,
                              faajmoddt = l_today
             WHERE faajent = g_enterprise
               AND faaj037 = l_fabo.fabo003
               AND faaj001 = l_fabo.fabo001
               AND faaj002 = l_fabo.fabo002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faaj_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()  
               LET r_success = FALSE
            END IF
            #180911-00014#1 add end---
         END IF
         

         FOREACH s_voucher_fabi_cs6 USING l_fabo.fabo003,l_fabo.fabo001,l_fabo.fabo002 INTO l_fabiseq
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #報廢未結束更新狀態為 原狀態
            UPDATE faai_t SET faai023 = l_fabo.fabo000 
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq
               #20141229 add by chenying
               AND faai001 = l_fabo.fabo003
               AND faai002 = l_fabo.fabo001
               AND faai003 = l_fabo.fabo002
               #20141229 add by chenying  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END FOREACH              
      END IF
   END FOREACH
 
 
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新狀態碼為已過單
# Memo...........:
# Usage..........: CALL s_afat503_post_upd_fabo(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_post_upd_fabo(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
  #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabo              RECORD LIKE fabo_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabo RECORD  #資產出售單身檔
       faboent LIKE fabo_t.faboent, #企業編碼
       fabold LIKE fabo_t.fabold, #帳套
       fabodocno LIKE fabo_t.fabodocno, #異動單號
       faboseq LIKE fabo_t.faboseq, #項次
       fabo000 LIKE fabo_t.fabo000, #資產類型
       fabo001 LIKE fabo_t.fabo001, #財產編號
       fabo002 LIKE fabo_t.fabo002, #附號
       fabo003 LIKE fabo_t.fabo003, #卡片編號
       fabo004 LIKE fabo_t.fabo004, #未折減額
       fabo005 LIKE fabo_t.fabo005, #單位
       fabo006 LIKE fabo_t.fabo006, #單價
       fabo007 LIKE fabo_t.fabo007, #調撥/出售數量
       fabo008 LIKE fabo_t.fabo008, #成本
       fabo009 LIKE fabo_t.fabo009, #稅別
       fabo010 LIKE fabo_t.fabo010, #交易幣別
       fabo011 LIKE fabo_t.fabo011, #原幣匯率
       fabo012 LIKE fabo_t.fabo012, #原幣未稅金額
       fabo013 LIKE fabo_t.fabo013, #原幣稅額
       fabo014 LIKE fabo_t.fabo014, #原幣應收金額
       fabo015 LIKE fabo_t.fabo015, #本幣未稅金額
       fabo016 LIKE fabo_t.fabo016, #本幣稅額
       fabo017 LIKE fabo_t.fabo017, #本幣應收金額
       fabo018 LIKE fabo_t.fabo018, #處置成本
       fabo019 LIKE fabo_t.fabo019, #處置累折
       fabo020 LIKE fabo_t.fabo020, #處置減值準備
       fabo021 LIKE fabo_t.fabo021, #處置本期折舊
       fabo022 LIKE fabo_t.fabo022, #處置未折減額
       fabo023 LIKE fabo_t.fabo023, #異動原因
       fabo024 LIKE fabo_t.fabo024, #異動科目
       fabo025 LIKE fabo_t.fabo025, #處置預留殘值
       fabo026 LIKE fabo_t.fabo026, #累折科目
       fabo027 LIKE fabo_t.fabo027, #減值準備科目
       fabo028 LIKE fabo_t.fabo028, #資產科目
       fabo029 LIKE fabo_t.fabo029, #應收帳款科目
       fabo030 LIKE fabo_t.fabo030, #稅額科目
       fabo031 LIKE fabo_t.fabo031, #營運據點
       fabo032 LIKE fabo_t.fabo032, #部門
       fabo033 LIKE fabo_t.fabo033, #利潤/成本中心
       fabo034 LIKE fabo_t.fabo034, #區域
       fabo035 LIKE fabo_t.fabo035, #交易客商
       fabo036 LIKE fabo_t.fabo036, #帳款客商
       fabo037 LIKE fabo_t.fabo037, #客群
       fabo038 LIKE fabo_t.fabo038, #人員
       fabo039 LIKE fabo_t.fabo039, #專案編號
       fabo040 LIKE fabo_t.fabo040, #WBS
       fabo041 LIKE fabo_t.fabo041, #帳款編號
       fabo042 LIKE fabo_t.fabo042, #摘要
       fabo043 LIKE fabo_t.fabo043, #調出管理組織
       fabo044 LIKE fabo_t.fabo044, #調出所有組織
       fabo045 LIKE fabo_t.fabo045, #調出核算組織
       fabo046 LIKE fabo_t.fabo046, #調入管理組織
       fabo047 LIKE fabo_t.fabo047, #調入所有組織
       fabo048 LIKE fabo_t.fabo048, #調入核算組織
       fabo049 LIKE fabo_t.fabo049, #處分損益
       fabo050 LIKE fabo_t.fabo050, #應收帳款單號
       fabo051 LIKE fabo_t.fabo051, #交易價格差異
       fabo052 LIKE fabo_t.fabo052, #應付帳款單號
       fabo053 LIKE fabo_t.fabo053, #已計提減值準備
       fabo054 LIKE fabo_t.fabo054, #經營方式
       fabo055 LIKE fabo_t.fabo055, #通路
       fabo056 LIKE fabo_t.fabo056, #品牌
       fabo060 LIKE fabo_t.fabo060, #自由核算項一
       fabo061 LIKE fabo_t.fabo061, #自由核算項二
       fabo062 LIKE fabo_t.fabo062, #自由核算項三
       fabo063 LIKE fabo_t.fabo063, #自由核算項四
       fabo064 LIKE fabo_t.fabo064, #自由核算項五
       fabo065 LIKE fabo_t.fabo065, #自由核算項六
       fabo066 LIKE fabo_t.fabo066, #自由核算項七
       fabo067 LIKE fabo_t.fabo067, #自由核算項八
       fabo068 LIKE fabo_t.fabo068, #自由核算項九
       fabo069 LIKE fabo_t.fabo069, #自由核算項十
       fabo101 LIKE fabo_t.fabo101, #本位幣二幣別
       fabo102 LIKE fabo_t.fabo102, #本位幣二匯率
       fabo103 LIKE fabo_t.fabo103, #本位幣二未稅金額
       fabo104 LIKE fabo_t.fabo104, #本位幣二稅額
       fabo105 LIKE fabo_t.fabo105, #本位幣二應收金額
       fabo106 LIKE fabo_t.fabo106, #本位幣二處份損益
       fabo107 LIKE fabo_t.fabo107, #本位幣二處置成本
       fabo108 LIKE fabo_t.fabo108, #本位幣二處置累折
       fabo109 LIKE fabo_t.fabo109, #本位幣二處置減值準備
       fabo110 LIKE fabo_t.fabo110, #本位幣二本期處置折舊
       fabo111 LIKE fabo_t.fabo111, #本位幣二處置後未折減額
       fabo150 LIKE fabo_t.fabo150, #本位幣三幣別
       fabo151 LIKE fabo_t.fabo151, #本位幣三匯率
       fabo152 LIKE fabo_t.fabo152, #本位幣三未稅金額
       fabo153 LIKE fabo_t.fabo153, #本位幣三稅額
       fabo154 LIKE fabo_t.fabo154, #本位幣三應收金額
       fabo155 LIKE fabo_t.fabo155, #本位幣三處份損益
       fabo156 LIKE fabo_t.fabo156, #本位幣三處置成本
       fabo157 LIKE fabo_t.fabo157, #本位幣三處置累折
       fabo158 LIKE fabo_t.fabo158, #本位幣三處置減值準備
       fabo159 LIKE fabo_t.fabo159, #本位幣三本期處置折舊
       fabo160 LIKE fabo_t.fabo160, #本位幣三處置後未折減額
       fabo112 LIKE fabo_t.fabo112, #本位幣二處置預留殘值
       fabo161 LIKE fabo_t.fabo161  #本位幣三處置預留殘值
       END RECORD
   #161128-00061#6---modify--end--------------------
   DEFINE l_sql               STRING
   DEFINE l_faah018           LIKE faah_t.faah018
   DEFINE l_today             DATETIME YEAR TO SECOND   
   DEFINE l_faaj033           LIKE faaj_t.faaj033
   DEFINE l_faaj034           LIKE faaj_t.faaj034
   DEFINE l_faaj035           LIKE faaj_t.faaj035
   DEFINE l_faaj027           LIKE faaj_t.faaj027
   DEFINE l_faaj032           LIKE faaj_t.faaj032
   DEFINE l_faaj028           LIKE faaj_t.faaj028
   DEFINE l_faaj113           LIKE faaj_t.faaj113
   DEFINE l_faaj114           LIKE faaj_t.faaj114
   DEFINE l_faaj110           LIKE faaj_t.faaj110
   DEFINE l_faaj115           LIKE faaj_t.faaj115
   DEFINE l_faaj108           LIKE faaj_t.faaj108
   DEFINE l_faaj163           LIKE faaj_t.faaj163
   DEFINE l_faaj164           LIKE faaj_t.faaj164
   DEFINE l_faaj160           LIKE faaj_t.faaj160
   DEFINE l_faaj165           LIKE faaj_t.faaj165
   DEFINE l_faaj158           LIKE faaj_t.faaj158
   DEFINE l_faaj019           LIKE faaj_t.faaj019   #180604-00010#1 add
   DEFINE l_faaj105           LIKE faaj_t.faaj105   #180604-00010#1 add
   DEFINE l_faaj155           LIKE faaj_t.faaj155   #180604-00010#1 add
   DEFINE l_fabiseq           LIKE fabi_t.fabiseq  #20141223 add by chenying
   DEFINE l_faah015           LIKE faah_t.faah015  #20141223 add by chenying
   DEFINE l_fabi007           LIKE fabi_t.fabi007  #20141229 add by chenying  
   DEFINE l_faai007           LIKE faai_t.faai007  #20141229 add by chenying   
   WHENEVER ERROR CONTINUE
    
   LET r_success  = TRUE
   LET l_today = cl_get_current()  
   #更新狀態碼=過帳, 過帳人=g_user,過帳日期=g_today
   UPDATE fabg_t SET fabgstus = 'S',
                     fabgpstid = g_user,
                     fabgpstdt = l_today
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
   IF SQLCA.SQLCODE THEN
#      CALL cl_errmsg('fabgdocno',p_fabgdocno,'S',SQLCA.SQLCODE,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF 
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t
   WHERE fabgent = g_enterprise
     AND fabgld = p_fabgld
     AND fabgdocno = p_fabgdocno
   #更新資產狀態
   #161128-00061#6---modify--begin-------------------
   #LET l_sql = " SELECT * FROM fabo_t",
   LET l_sql = " SELECT faboent,fabold,fabodocno,faboseq,fabo000,fabo001,fabo002,fabo003,fabo004,",
               "fabo005,fabo006,fabo007,fabo008,fabo009,fabo010,fabo011,fabo012,fabo013,fabo014,",
               "fabo015,fabo016,fabo017,fabo018,fabo019,fabo020,fabo021,fabo022,fabo023,fabo024,",
               "fabo025,fabo026,fabo027,fabo028,fabo029,fabo030,fabo031,fabo032,fabo033,fabo034,",
               "fabo035,fabo036,fabo037,fabo038,fabo039,fabo040,fabo041,fabo042,fabo043,fabo044,",
               "fabo045,fabo046,fabo047,fabo048,fabo049,fabo050,fabo051,fabo052,fabo053,fabo054,",
               "fabo055,fabo056,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,",
               "fabo068,fabo069,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo107,fabo108,",
               "fabo109,fabo110,fabo111,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo156,",
               "fabo157,fabo158,fabo159,fabo160,fabo112,fabo161 FROM fabo_t",
   #161128-00061#6---modify--end--------------------
               " WHERE faboent = '",g_enterprise,"'",
               "   AND fabold = '",p_fabgld,"'",
               "   AND fabodocno = '",p_fabgdocno,"'"
   PREPARE s_voucher_fabo_pr1 FROM l_sql
   DECLARE s_voucher_fabo_cs1 CURSOR FOR s_voucher_fabo_pr1
   FOREACH s_voucher_fabo_cs1 INTO l_fabo.*
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = SQLCA.SQLCODE
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE         
         EXIT FOREACH
      END IF
      #出售
      IF l_fabg.fabg005='4' THEN
         #faah_t总数量 
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent=g_enterprise AND faah001=l_fabo.fabo003
            AND faah003=l_fabo.fabo001 AND faah004=l_fabo.fabo002          
            
          IF cl_null(l_faah018) THEN LET l_faah018=0 END IF
          
         SELECT faaj033,faaj034,faaj035,faaj027,faaj032,faaj028,faaj113,faaj114,
                faaj110,faaj115,faaj108,faaj163,faaj164,faaj160,faaj165,faaj158
               ,faaj019,faaj105,faaj155   #180604-00010#1 add 
           INTO l_faaj033,l_faaj034,l_faaj035,l_faaj027,l_faaj032,l_faaj028,l_faaj113,l_faaj114,
                l_faaj110,l_faaj115,l_faaj108,l_faaj163,l_faaj164,l_faaj160,l_faaj165,l_faaj158
               ,l_faaj019,l_faaj105,l_faaj155   #180604-00010#1 add 
           FROM faaj_t
          WHERE faajent=g_enterprise AND faajld=p_fabgld
            AND faaj001=l_fabo.fabo001 AND faaj002=l_fabo.fabo002 AND faaj037=l_fabo.fabo003
         IF cl_null(l_faaj033) THEN LET l_faaj033=0 END IF
         IF cl_null(l_faaj034) THEN LET l_faaj034=0 END IF
         IF cl_null(l_faaj035) THEN LET l_faaj035=0 END IF
         IF cl_null(l_faaj027) THEN LET l_faaj027=0 END IF
         IF cl_null(l_faaj032) THEN LET l_faaj032=0 END IF
         IF cl_null(l_faaj028) THEN LET l_faaj028=0 END IF
         IF cl_null(l_faaj113) THEN LET l_faaj113=0 END IF
         IF cl_null(l_faaj114) THEN LET l_faaj114=0 END IF
         IF cl_null(l_faaj110) THEN LET l_faaj110=0 END IF
         IF cl_null(l_faaj115) THEN LET l_faaj115=0 END IF
         IF cl_null(l_faaj108) THEN LET l_faaj108=0 END IF
         IF cl_null(l_faaj163) THEN LET l_faaj163=0 END IF
         IF cl_null(l_faaj164) THEN LET l_faaj164=0 END IF
         IF cl_null(l_faaj160) THEN LET l_faaj160=0 END IF
         IF cl_null(l_faaj165) THEN LET l_faaj165=0 END IF
         IF cl_null(l_faaj158) THEN LET l_faaj158=0 END IF
         IF cl_null(l_faaj019) THEN LET l_faaj019=0 END IF   #180604-00010#1 add
         IF cl_null(l_faaj105) THEN LET l_faaj105=0 END IF   #180604-00010#1 add
         IF cl_null(l_faaj155) THEN LET l_faaj155=0 END IF   #180604-00010#1 add

         #更新faaj_t
         UPDATE faaj_t SET faaj033 = l_faaj033 + l_fabo.fabo007,     #处置数量
                           faaj034 = l_faaj034 + l_fabo.fabo018,     #处置成本
                           faaj035 = l_faaj035 + l_fabo.fabo019,     #处置累折
                           faaj027 = l_faaj027 + l_fabo.fabo020,     #处置减值准备
                           faaj032 = l_faaj032 + l_fabo.fabo021,     #本年处置折舊
                           faaj028 = l_faaj028 - l_fabo.fabo022,     #未折减额
                           faaj113 = l_faaj113 + l_fabo.fabo107,     #本位币二处置成本
                           faaj114 = l_faaj114 + l_fabo.fabo108,     #本位币二处置累折
                           faaj110 = l_faaj110 + l_fabo.fabo109,     #本位币二处置减值准备
                           faaj115 = l_faaj115 + l_fabo.fabo110,     #本位币二本年处置折舊
                           faaj108 = l_faaj108 - l_fabo.fabo111,     #本位币二未折减额
                           faaj163 = l_faaj163 + l_fabo.fabo156,     #本位币三处置成本
                           faaj164 = l_faaj164 + l_fabo.fabo157,     #本位币三处置累折
                           faaj160 = l_faaj160 + l_fabo.fabo158,     #本位币三处置减值准备
                           faaj165 = l_faaj165 + l_fabo.fabo159,     #本位币三本年处置折舊
                           faaj158 = l_faaj158 - l_fabo.fabo160      #本位币三未折减额   
                          ,faaj019 = l_faaj019 - l_fabo.fabo025      #預留殘值          #180604-00010#1 add   
                          ,faaj105 = l_faaj105 - l_fabo.fabo112      #本位幣二預留殘值   #180604-00010#1 add  
                          ,faaj155 = l_faaj155 - l_fabo.fabo161      #本位幣三預留殘值   #180604-00010#1 add                           
          WHERE faajent=g_enterprise AND faajld=p_fabgld
            AND faaj001=l_fabo.fabo001 AND faaj002=l_fabo.fabo002 AND faaj037=l_fabo.fabo003
         IF SQLCA.SQLCODE THEN
#            CALL cl_errmsg('upd faaj_t','','',SQLCA.SQLCODE,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faaj_t'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE 
            CALL cl_err()  
            LET r_success = FALSE
         END IF
                     
         #檢查是否數量已出售完,如果销售完更新资产状态为出售
         LET l_faaj033=l_faaj033 + l_fabo.fabo007 
         IF l_faah018 = l_faaj033  THEN
            UPDATE faah_t SET faah015 = '5',
                              faahmodid = g_user,
                              faahmoddt = l_today
             WHERE faahent = g_enterprise
               AND faah001 = l_fabo.fabo003
               AND faah003 = l_fabo.fabo001
               AND faah004 = l_fabo.fabo002
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faah_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()  
               LET r_success = FALSE
            END IF
            #180820-00013#1 add ------
            UPDATE faaj_t SET faaj038 = '5',
                              faajmodid = g_user,
                              faajmoddt = l_today
             WHERE faajent = g_enterprise
               AND faaj037 = l_fabo.fabo003
               AND faaj001 = l_fabo.fabo001
               AND faaj002 = l_fabo.fabo002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faaj_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()  
               LET r_success = FALSE
            END IF
            #180820-00013#1 add end---
         END IF


      
         #20141223 add by chenying
         #更新标签状态
         LET l_fabiseq = 0
         LET g_sql = " SELECT DISTINCT fabiseq1,fabi007 ",  #20141229 add fabi007 by chenying
                      "   FROM fabi_t ",
                      "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",p_fabgdocno,"'",
                      "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                      "    AND fabi001 = '", l_fabo.fabo003 ,"'",
                      "    AND fabi002 = '", l_fabo.fabo001 ,"'",
                      "    AND fabi003 = '", l_fabo.fabo002 ,"'"
         PREPARE s_voucher_fabi_pr5 FROM g_sql
         DECLARE s_voucher_fabi_cs5 CURSOR FOR s_voucher_fabi_pr5
         LET l_fabi007 = 0                                     #20141229 add by chenying
         LET l_fabiseq = 0                                    #20141229 add by chenying         
         FOREACH s_voucher_fabi_cs5 INTO l_fabiseq,l_fabi007  #20141229 add l_fabi007 by chenying 
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()  
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #20141229 add by chenying
            #标签总数量（afai100标签明细）
            LET l_faai007 = 0
            SELECT faai007 INTO l_faai007 FROM faai_t
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq
               AND faai001 = l_fabo.fabo003
               AND faai002 = l_fabo.fabo001
               AND faai003 = l_fabo.fabo002          
            #20141229 add by chenying
         
#            IF l_faah018 = l_faaj033 THEN  #20141229 mark by chenying
            IF l_faai007 = l_fabi007 THEN   #20141229 add by chenying  
               #出售結束更新狀態為 出售
               UPDATE faai_t SET faai023 = '5' 
                WHERE faaient = g_enterprise
                  AND faaiseq = l_fabiseq
                  #20141229 add by chenying
                  AND faai001 = l_fabo.fabo003
                  AND faai002 = l_fabo.fabo001
                  AND faai003 = l_fabo.fabo002 
                  #20141229 add by chenying  
#20141229 mark by chenying                   
#            ELSE
#               #出售未結束更新狀態為 原狀態
#               LET l_faah015 = null
#               SELECT faah015 INTO l_faah015 FROM faah_t
#                WHERE faahent=g_enterprise AND faah001=l_fabo.fabo003
#                  AND faah003=l_fabo.fabo001 AND faah004=l_fabo.fabo002  
#               UPDATE faai_t SET faai023 = l_faah015  
#                WHERE faaient = g_enterprise
#                  AND faaiseq = l_fabiseq
#                  #20141229 add by chenying
#                  AND faai001 = l_fabh.fabh000
#                  AND faai002 = l_fabh.fabh001
#                  AND faai003 = l_fabh.fabh002
#                  #20141229 add by chenying 
#20141229 mark by chenying
            END IF  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err()  
               LET r_success = FALSE
            END IF
         END FOREACH 
         #20141223 add by chenying
      END IF
   END FOREACH
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 资产出售资料审核检查
# Memo...........:
# Usage..........: CALL s_afat503_conf_chk_fabo(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_chk_fabo(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabo              RECORD LIKE fabo_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabo RECORD  #資產出售單身檔
       faboent LIKE fabo_t.faboent, #企業編碼
       fabold LIKE fabo_t.fabold, #帳套
       fabodocno LIKE fabo_t.fabodocno, #異動單號
       faboseq LIKE fabo_t.faboseq, #項次
       fabo000 LIKE fabo_t.fabo000, #資產類型
       fabo001 LIKE fabo_t.fabo001, #財產編號
       fabo002 LIKE fabo_t.fabo002, #附號
       fabo003 LIKE fabo_t.fabo003, #卡片編號
       fabo004 LIKE fabo_t.fabo004, #未折減額
       fabo005 LIKE fabo_t.fabo005, #單位
       fabo006 LIKE fabo_t.fabo006, #單價
       fabo007 LIKE fabo_t.fabo007, #調撥/出售數量
       fabo008 LIKE fabo_t.fabo008, #成本
       fabo009 LIKE fabo_t.fabo009, #稅別
       fabo010 LIKE fabo_t.fabo010, #交易幣別
       fabo011 LIKE fabo_t.fabo011, #原幣匯率
       fabo012 LIKE fabo_t.fabo012, #原幣未稅金額
       fabo013 LIKE fabo_t.fabo013, #原幣稅額
       fabo014 LIKE fabo_t.fabo014, #原幣應收金額
       fabo015 LIKE fabo_t.fabo015, #本幣未稅金額
       fabo016 LIKE fabo_t.fabo016, #本幣稅額
       fabo017 LIKE fabo_t.fabo017, #本幣應收金額
       fabo018 LIKE fabo_t.fabo018, #處置成本
       fabo019 LIKE fabo_t.fabo019, #處置累折
       fabo020 LIKE fabo_t.fabo020, #處置減值準備
       fabo021 LIKE fabo_t.fabo021, #處置本期折舊
       fabo022 LIKE fabo_t.fabo022, #處置未折減額
       fabo023 LIKE fabo_t.fabo023, #異動原因
       fabo024 LIKE fabo_t.fabo024, #異動科目
       fabo025 LIKE fabo_t.fabo025, #處置預留殘值
       fabo026 LIKE fabo_t.fabo026, #累折科目
       fabo027 LIKE fabo_t.fabo027, #減值準備科目
       fabo028 LIKE fabo_t.fabo028, #資產科目
       fabo029 LIKE fabo_t.fabo029, #應收帳款科目
       fabo030 LIKE fabo_t.fabo030, #稅額科目
       fabo031 LIKE fabo_t.fabo031, #營運據點
       fabo032 LIKE fabo_t.fabo032, #部門
       fabo033 LIKE fabo_t.fabo033, #利潤/成本中心
       fabo034 LIKE fabo_t.fabo034, #區域
       fabo035 LIKE fabo_t.fabo035, #交易客商
       fabo036 LIKE fabo_t.fabo036, #帳款客商
       fabo037 LIKE fabo_t.fabo037, #客群
       fabo038 LIKE fabo_t.fabo038, #人員
       fabo039 LIKE fabo_t.fabo039, #專案編號
       fabo040 LIKE fabo_t.fabo040, #WBS
       fabo041 LIKE fabo_t.fabo041, #帳款編號
       fabo042 LIKE fabo_t.fabo042, #摘要
       fabo043 LIKE fabo_t.fabo043, #調出管理組織
       fabo044 LIKE fabo_t.fabo044, #調出所有組織
       fabo045 LIKE fabo_t.fabo045, #調出核算組織
       fabo046 LIKE fabo_t.fabo046, #調入管理組織
       fabo047 LIKE fabo_t.fabo047, #調入所有組織
       fabo048 LIKE fabo_t.fabo048, #調入核算組織
       fabo049 LIKE fabo_t.fabo049, #處分損益
       fabo050 LIKE fabo_t.fabo050, #應收帳款單號
       fabo051 LIKE fabo_t.fabo051, #交易價格差異
       fabo052 LIKE fabo_t.fabo052, #應付帳款單號
       fabo053 LIKE fabo_t.fabo053, #已計提減值準備
       fabo054 LIKE fabo_t.fabo054, #經營方式
       fabo055 LIKE fabo_t.fabo055, #通路
       fabo056 LIKE fabo_t.fabo056, #品牌
       fabo060 LIKE fabo_t.fabo060, #自由核算項一
       fabo061 LIKE fabo_t.fabo061, #自由核算項二
       fabo062 LIKE fabo_t.fabo062, #自由核算項三
       fabo063 LIKE fabo_t.fabo063, #自由核算項四
       fabo064 LIKE fabo_t.fabo064, #自由核算項五
       fabo065 LIKE fabo_t.fabo065, #自由核算項六
       fabo066 LIKE fabo_t.fabo066, #自由核算項七
       fabo067 LIKE fabo_t.fabo067, #自由核算項八
       fabo068 LIKE fabo_t.fabo068, #自由核算項九
       fabo069 LIKE fabo_t.fabo069, #自由核算項十
       fabo101 LIKE fabo_t.fabo101, #本位幣二幣別
       fabo102 LIKE fabo_t.fabo102, #本位幣二匯率
       fabo103 LIKE fabo_t.fabo103, #本位幣二未稅金額
       fabo104 LIKE fabo_t.fabo104, #本位幣二稅額
       fabo105 LIKE fabo_t.fabo105, #本位幣二應收金額
       fabo106 LIKE fabo_t.fabo106, #本位幣二處份損益
       fabo107 LIKE fabo_t.fabo107, #本位幣二處置成本
       fabo108 LIKE fabo_t.fabo108, #本位幣二處置累折
       fabo109 LIKE fabo_t.fabo109, #本位幣二處置減值準備
       fabo110 LIKE fabo_t.fabo110, #本位幣二本期處置折舊
       fabo111 LIKE fabo_t.fabo111, #本位幣二處置後未折減額
       fabo150 LIKE fabo_t.fabo150, #本位幣三幣別
       fabo151 LIKE fabo_t.fabo151, #本位幣三匯率
       fabo152 LIKE fabo_t.fabo152, #本位幣三未稅金額
       fabo153 LIKE fabo_t.fabo153, #本位幣三稅額
       fabo154 LIKE fabo_t.fabo154, #本位幣三應收金額
       fabo155 LIKE fabo_t.fabo155, #本位幣三處份損益
       fabo156 LIKE fabo_t.fabo156, #本位幣三處置成本
       fabo157 LIKE fabo_t.fabo157, #本位幣三處置累折
       fabo158 LIKE fabo_t.fabo158, #本位幣三處置減值準備
       fabo159 LIKE fabo_t.fabo159, #本位幣三本期處置折舊
       fabo160 LIKE fabo_t.fabo160, #本位幣三處置後未折減額
       fabo112 LIKE fabo_t.fabo112, #本位幣二處置預留殘值
       fabo161 LIKE fabo_t.fabo161  #本位幣三處置預留殘值
       END RECORD
   #161128-00061#6---modify--end--------------------
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_desc              STRING
   DEFINE l_date              LIKE fabg_t.fabgdocdt
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_sql               STRING
   DEFINE l_errmsg            STRING
   DEFINE l_glad007        LIKE glad_t.glad007     #部門管理否
   DEFINE l_glad008        LIKE glad_t.glad008     #利潤成本中心管理
   DEFINE l_glad009        LIKE glad_t.glad009     #區域管理
   DEFINE l_glad010        LIKE glad_t.glad010     #交易客商管理
   DEFINE l_glad027        LIKE glad_t.glad027     #账款客商管理
   DEFINE l_glad011        LIKE glad_t.glad011     #客群管理否
   DEFINE l_glad012        LIKE glad_t.glad012     #產品類別
   DEFINE l_glad013        LIKE glad_t.glad013     #人員
   DEFINE l_glad015        LIKE glad_t.glad015     #专案管理否
   DEFINE l_glad016        LIKE glad_t.glad016     #wbs管理
   DEFINE l_glad031        LIKE glad_t.glad031     #經營方式管理
   DEFINE l_glad032        LIKE glad_t.glad032     #渠道管理
   DEFINE l_glad033        LIKE glad_t.glad033     #品牌管理
   DEFINE l_errno          LIKE type_t.chr10   
   #是否做自由科目核算项管理
   DEFINE l_glad017        LIKE glad_t.glad017
   DEFINE l_glad0171       LIKE glad_t.glad0171 
   DEFINE l_glad0172       LIKE glad_t.glad0172 
   DEFINE l_glad018        LIKE glad_t.glad018
   DEFINE l_glad0181       LIKE glad_t.glad0181
   DEFINE l_glad0182       LIKE glad_t.glad0182
   DEFINE l_glad019        LIKE glad_t.glad019
   DEFINE l_glad0191       LIKE glad_t.glad0191
   DEFINE l_glad0192       LIKE glad_t.glad0192
   DEFINE l_glad020        LIKE glad_t.glad020
   DEFINE l_glad0201       LIKE glad_t.glad0201
   DEFINE l_glad0202       LIKE glad_t.glad0202
   DEFINE l_glad021        LIKE glad_t.glad021
   DEFINE l_glad0211       LIKE glad_t.glad0211
   DEFINE l_glad0212       LIKE glad_t.glad0212
   DEFINE l_glad022        LIKE glad_t.glad022
   DEFINE l_glad0221       LIKE glad_t.glad0221
   DEFINE l_glad0222       LIKE glad_t.glad0222
   DEFINE l_glad023        LIKE glad_t.glad023
   DEFINE l_glad0231       LIKE glad_t.glad0231
   DEFINE l_glad0232       LIKE glad_t.glad0232
   DEFINE l_glad024        LIKE glad_t.glad024
   DEFINE l_glad0241       LIKE glad_t.glad0241
   DEFINE l_glad0242       LIKE glad_t.glad0242
   DEFINE l_glad025        LIKE glad_t.glad025
   DEFINE l_glad0251       LIKE glad_t.glad0251
   DEFINE l_glad0252       LIKE glad_t.glad0252
   DEFINE l_glad026        LIKE glad_t.glad026
   DEFINE l_glad0261       LIKE glad_t.glad0261
   DEFINE l_glad0262       LIKE glad_t.glad0262
   DEFINE l_cate           LIKE type_t.chr10          
   DEFINE g_glaa121        LIKE glaa_t.glaa121 
   
   #albireo 150824-----s
   DEFINE l_comp   LIKE ooef_t.ooef001
   DEFINE l_chr    LIKE type_t.chr1
   DEFINE l_slip   LIKE type_t.chr10
   #albireo 150824-----e
   #170421-00027#11  By 09505  --(S)--
   DEFINE l_fabo024       LIKE fabo_t.fabo024
   DEFINE l_xrcd009       LIKE xrcd_t.xrcd009
   #180326-00032#2  add  --(S)--
   DEFINE l_fabgdocdt       LIKE fabg_t.fabgdocdt
   DEFINE l_fabgmoddt       LIKE fabg_t.fabgmoddt
   #180326-00032#2  add  --(E)--
   
   DEFINE ls_js            STRING
   DEFINE lc_param  RECORD
       glbi001   LIKE glbi_t.glbi001,   #作业编号 
       glbild    LIKE glbi_t.glbild,    #账套
       docno     LIKE xrca_t.xrcadocno, #单号OR单别
       glbi003   LIKE glbi_t.glbi003    #科目编号  
             END RECORD
   #170421-00027#11  By 09505  --(E)--
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #初始化数组
   INITIALIZE l_fabg.* TO NULL
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
#      LET r_success = FALSE
##      CALL cl_errmsg('conf_chk',p_fabgdocno,'','sub-00110',1) #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err()        
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t WHERE fabgent=g_enterprise AND fabgld=p_fabgld AND fabgdocno=p_fabgdocno
   #(2).狀態碼=未審核,才可進行確認動作   
   #IF l_fabg.fabgstus <>'N' THEN              #180614-00039#9 mark
   IF l_fabg.fabgstus NOT MATCHES "[NA]" THEN  #180614-00039#9 add
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'','afa-00024',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00024'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF 
   
   #20141213 mod by chenying fabg-->fabo
   #(3).有單頭資料但無單身資料返回报错
   LET l_cnt = 0
   SELECT count(*) INTO l_cnt FROM fabo_t
    WHERE faboent = g_enterprise
      AND fabold  = p_fabgld
      AND fabodocno = p_fabgdocno
   IF l_cnt = 0  THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','agl-00066',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00066'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF
   #20141213 mod by chenying
   #180326-00032#2  add  --(S)--
   IF g_prog MATCHES "afat5*"  THEN
    IF g_prog NOT MATCHES "afat509"  THEN #200325-00063#1---add--->排除掉afat509
      SELECT fabgdocdt,fabgmoddt INTO l_fabgdocdt,l_fabgmoddt
        FROM fabg_t
       WHERE fabgent = g_enterprise
         AND fabgld = p_fabgld 
         AND fabgdocno = p_fabgdocno
      IF (YEAR(l_fabgdocdt) <> YEAR(l_fabgmoddt)) OR (YEAR(l_fabgdocdt) = YEAR(l_fabgmoddt) AND MONTH(l_fabgdocdt) <> MONTH(l_fabgmoddt)) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-00482'
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()  
         END IF
      END IF #200325-00063#1---add
   END IF
   #180326-00032#2  add  --(E)--
   
   #170421-00027#11  By 09505   --(E)--
   #LET l_sql = " SELECT DISTINCT fabo024 FROM fabh_t  ",  #181001-00015#74 mark
   LET l_sql = " SELECT DISTINCT fabo024 FROM fabo_t  ",  #181001-00015#74 add
               " WHERE faboent = '",g_enterprise,"'",
               "   AND fabold = '",p_fabgld,"'",
               "   AND fabodocno = '",p_fabgdocno,"'"             
   PREPARE l_fabo_pre FROM l_sql
   DECLARE l_fabo_cs CURSOR FOR l_fabo_pre
   FOREACH l_fabo_cs INTO l_fabo024
           IF NOT cl_null(l_fabo024) THEN
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_fabgld
              LET lc_param.docno   = p_fabgdocno
              LET lc_param.glbi003 = l_fabo024
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF   
           END IF
   END FOREACH 
   LET l_sql = " SELECT DISTINCT xrcd009 FROM xrcd_t  ",
               " WHERE xrcdent = '",g_enterprise,"'",
               "   AND xrcdld = '",p_fabgld,"'",
               "   AND xrcddocno = '",p_fabgdocno,"'"             
   PREPARE l_xrcd009_pre FROM l_sql
   DECLARE l_xrcd009_cs CURSOR FOR l_xrcd009_pre
   FOREACH l_xrcd009_cs INTO l_xrcd009
           IF NOT cl_null(l_xrcd009) THEN
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_fabgld
              LET lc_param.docno   = p_fabgdocno
              LET lc_param.glbi003 = l_xrcd009
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF   
           END IF
   END FOREACH 
   #170421-00027#11  By 09505   --(E)--
   
   #20150112 add by chenying
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
   #albireo 150824-----s
   
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add 
   #albireo 150824-----e
   #181204-00026#6 add s----
   IF l_fabg.fabg005 = '0' OR l_fabg.fabg005 = '4' OR l_fabg.fabg005 = '6' OR
      l_fabg.fabg005 = '8' OR l_fabg.fabg005 = '9' OR l_fabg.fabg005 = '14' OR
      l_fabg.fabg005 = '21' THEN
      CASE l_fabg.fabg005 
          WHEN '0'
             LET l_cate =  'F30'  
          WHEN '4'
             LET l_cate =  'F40'  
          WHEN '6'
             LET l_cate =  'F50'  
          WHEN '8'
             LET l_cate =  'F50' 
          WHEN '14'
             LET l_cate =  'F50'  
          WHEN '21'
             LET l_cate =  'F50'
          WHEN '9'
             LET l_cate =  'F50'                  
      END CASE 
   END IF 
  #181204-00026#6 mark e---   
   IF g_glaa121 = 'Y' AND l_chr = 'Y' THEN   #albireo 150825 add l_chr = 'Y'
#181204-00026#6 mark s---   
#      IF l_fabg.fabg005 = '0' OR l_fabg.fabg005 = '4' OR l_fabg.fabg005 = '6' OR
#         l_fabg.fabg005 = '8' OR l_fabg.fabg005 = '9' OR l_fabg.fabg005 = '14' OR
#         l_fabg.fabg005 = '21' THEN
#         CASE l_fabg.fabg005 
#             WHEN '0'
#                LET l_cate =  'F30'  
#             WHEN '4'
#                LET l_cate =  'F40'  
#             WHEN '6'
#                LET l_cate =  'F50'  
#             WHEN '8'
#                LET l_cate =  'F50' 
#             WHEN '14'
#                LET l_cate =  'F50'  
#             WHEN '21'
#                LET l_cate =  'F50'
#             WHEN '9'
#                LET l_cate =  'F50'                  
#         END CASE 
#181204-00026#6 mark e---
         CALL s_chk_voucher('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF l_success = FALSE THEN
            LET r_success = FALSE
         END IF         
#      END IF #181204-00026#6 marks
   #181204-00026#6 add s---   
   ELSE   
      IF g_glaa121 = 'N' THEN 
         CALL s_pre_voucher_ins('FA',l_cate,p_fabgld,p_fabgdocno,l_fabg.fabgdocdt,'4')  RETURNING l_success
         IF NOT l_success THEN LET r_success = FALSE END IF
         CALL s_chk_voucher('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF NOT l_success THEN LET r_success = FALSE END IF
         CALL s_pre_voucher_del('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF NOT l_success THEN LET r_success = FALSE END IF         
      END IF       
   #181204-00026#6 add e---      
   END IF   
   #20150112 add by chenying
   
   #albireo 150824-----s
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add 
   #albireo 150824-----e
   
   #(7).单身科目无效，性質不為帳戶,不為明細或獨立帳戶,则返回报错
   #固定核算項欄位,其對應基本資料的合理性 
#181204-00026#6 mark s---#不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项     
#   IF g_glaa121 = 'N' THEN #20150112 add by chenying
#   #161128-00061#6---modify--begin-------------------
#   #LET l_sql = " SELECT * FROM fabo_t",
#   LET l_sql = " SELECT faboent,fabold,fabodocno,faboseq,fabo000,fabo001,fabo002,fabo003,fabo004,",
#               "fabo005,fabo006,fabo007,fabo008,fabo009,fabo010,fabo011,fabo012,fabo013,fabo014,",
#               "fabo015,fabo016,fabo017,fabo018,fabo019,fabo020,fabo021,fabo022,fabo023,fabo024,",
#               "fabo025,fabo026,fabo027,fabo028,fabo029,fabo030,fabo031,fabo032,fabo033,fabo034,",
#               "fabo035,fabo036,fabo037,fabo038,fabo039,fabo040,fabo041,fabo042,fabo043,fabo044,",
#               "fabo045,fabo046,fabo047,fabo048,fabo049,fabo050,fabo051,fabo052,fabo053,fabo054,",
#               "fabo055,fabo056,fabo060,fabo061,fabo062,fabo063,fabo064,fabo065,fabo066,fabo067,",
#               "fabo068,fabo069,fabo101,fabo102,fabo103,fabo104,fabo105,fabo106,fabo107,fabo108,",
#               "fabo109,fabo110,fabo111,fabo150,fabo151,fabo152,fabo153,fabo154,fabo155,fabo156,",
#               "fabo157,fabo158,fabo159,fabo160,fabo112,fabo161 FROM fabo_t",
#   #161128-00061#6---modify--end--------------------
#               " WHERE faboent = '",g_enterprise,"'",
#               "   AND fabold = '",p_fabgld,"'",
#               "   AND fabodocno = '",p_fabgdocno,"'"
#   PREPARE s_voucher_fabo_pr FROM l_sql
#   DECLARE s_voucher_fabo_cs CURSOR FOR s_voucher_fabo_pr
#   FOREACH s_voucher_fabo_cs INTO l_fabo.*
#      IF SQLCA.sqlcode THEN
##         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = 'foreach:'
#         LET g_errparam.code   = SQLCA.SQLCODE
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#         LET r_success = FALSE         
#         EXIT FOREACH
#      END IF
#      
#      #170704-00052#1  add--S
#      #如果该财产编号在afat512中存在未审核的单据，则提示报错
#      CALL s_afa_faah003_chk(l_fabo.fabo003,l_fabo.fabo001,l_fabo.fabo002) RETURNING l_success,l_errno
#      IF NOT l_success THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = l_errno
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         LET g_errparam.replace[1] = l_fabo.fabo003
#         LET g_errparam.replace[2] = l_fabo.fabo001
#         LET g_errparam.replace[3] = l_fabo.fabo002
#         CALL cl_err()
#         LET r_success = FALSE
#      END IF  
#      #170704-00052#1  add--E
#      
##20141224 mod by chenying        
##      #20141213 add by chenying
##      #是否存在未审核的资料的异动单据
##      LET l_cnt = 0
##      SELECT COUNT(*) INTO l_cnt FROM fabo_t,fabg_t 
##       WHERE faboent = fabgent AND fabold = fabgld
##         AND fabodocno = fabgdocno
##         AND faboent =  g_enterprise 
##         AND fabold =  p_fabgld 
##         AND fabodocno !=  p_fabgdocno 
##         AND fabo001 = l_fabo.fabo001
##         AND fabo002 = l_fabo.fabo002
##         AND fabo003 = l_fabo.fabo003
##         AND fabgstus = 'N' 
##      IF l_cnt > 0 THEN 
##          CALL cl_errmsg('',l_fabo.fabo001,'','afa-00333',1)
##          LET r_success = FALSE         
##      END IF      
##      #20141213 add by chenying
#      CALL s_afat503_conf_ins_tab_chk(p_fabgdocno,p_fabgld,l_fabo.fabo001,l_fabo.fabo002,l_fabo.fabo003) RETURNING l_success
#      IF l_success = FALSE THEN
#         LET r_success = FALSE
#      END IF      
##20141224 mod by chenying      
#      #資產檢核
#      IF l_fabg.fabg005 <> '23' AND l_fabg.fabg005 <> '24'  THEN   
#         CALL s_afat503_fabh001_chk(l_fabo.fabo001,l_fabo.fabo002,l_fabo.fabo003,l_fabg.fabgld,l_fabg.fabg005)
#       END IF    
#      IF NOT cl_null(g_errno) THEN
#         LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabodocno,faboseq',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#      END IF 
#      #盤點期間改資產不可異動
#      #albireo 150824-----s
##161227-00064#1 mark s---      
##      IF NOT (g_glaa121 = 'Y' AND l_chr = 'Y') THEN  
##         CONTINUE FOREACH
##      END IF
##161227-00064#1 mark e---
#      #albireo 150824-----e
#      #科目
#      IF NOT cl_null(l_fabo.fabo024) THEN
#         CALL s_voucher_glaq002_chk(p_fabgld,l_fabo.fabo024)
#         IF NOT cl_null(g_errno) THEN
#            LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq||'/'||l_fabo.fabo024
#            LET r_success = FALSE
##            CALL cl_errmsg('fabo024',l_errmsg,'',g_errno,1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = g_errno
#            #160321-00016#5 --s add
#            #(s_voucher_glaq002_chk)ais-00046->sub-01302
#            LET g_errparam.replace[1] = 'agli030'
#            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
#            LET g_errparam.exeprog = 'agli030'
#            #160321-00016#5 --e add
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         END IF 
#      ####################################add by huangtao
#      ELSE
#         LET g_errno = 'afa-00271'
#         LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabo024',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#      ####################################add by huangtao
#      END IF
#      ####################################add by huangtao
#      IF cl_null(l_fabo.fabo026) THEN
#         LET g_errno = 'afa-00272'
#         LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabh023',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#      END IF
#      IF cl_null(l_fabo.fabo028) THEN
#         LET g_errno = 'afa-00273'
#         LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabh024',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#      END IF
#      IF cl_null(l_fabo.fabo027) THEN
#         LET g_errno = 'afa-00274'
#         LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabh025',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err() 
#      END IF
#      ####################################add by huangtao
#      
#
#      #20141218 add by chenying
#      #依據帳別，科目編號，判斷該科目是否启用
#      #部門管理， 利潤成本中心管理，區域管理，交易客商管理，客群管理，產品類別，人員，預算，專案，wbs管理，账款客商管理，自由核算项1~10
#      #1.清空核算项管理值
#       LET l_glad007 = ''  LET l_glad008 = ''  LET l_glad009 = ''  LET l_glad010 = ''  LET l_glad027 = ''   LET l_glad011 = ''
#       LET l_glad012 = ''  LET l_glad013 = ''  LET l_glad015 = ''  LET l_glad016 = ''  
#       LET l_glad031 = ''  LET l_glad032 = ''  LET l_glad033 = ''
#       LET l_glad017 = ''  LET l_glad0171 =''  LET l_glad0172 = '' LET l_glad018 = ''  LET l_glad0181 = ''  LET l_glad0182 = ''   
#       LET l_glad019 = ''  LET l_glad0191 =''  LET l_glad0192 = '' LET l_glad020 = ''  LET l_glad0201 = ''  LET l_glad0202 = ''
#       LET l_glad021 = ''  LET l_glad0211 =''  LET l_glad0212 = '' LET l_glad022 = ''  LET l_glad0221 = ''  LET l_glad0222 = ''
#       LET l_glad023 = ''  LET l_glad0231 =''  LET l_glad0232 = '' LET l_glad024 = ''  LET l_glad0241 = ''  LET l_glad0242 = ''
#       LET l_glad025 = ''  LET l_glad0251 =''  LET l_glad0252 = '' LET l_glad026 = ''  LET l_glad0261 = ''  LET l_glad0262 = ''
#       #2.重新依账套，科目抓取核算项管理值
#       SELECT glad007,glad008,glad009,glad010,glad027,glad011,glad012,glad013,glad015,glad016,
#              glad031,glad032,glad033,
#              glad017,glad0171,glad0172,glad018,glad0181,glad0182,glad019,glad0191,glad0192,
#              glad020,glad0201,glad0202,glad021,glad0211,glad0212,glad022,glad0221,glad0222,
#              glad023,glad0231,glad0232,glad024,glad0241,glad0242,glad025,glad0251,glad0252,
#              glad026,glad0261,glad0262              
#         INTO l_glad007,l_glad008,l_glad009,l_glad010,l_glad027,l_glad011,l_glad012,l_glad013,l_glad015,l_glad016,
#              l_glad031,l_glad032,l_glad033,
#              l_glad017,l_glad0171,l_glad0172,l_glad018,l_glad0181,l_glad0182,l_glad019,l_glad0191,l_glad0192,
#              l_glad020,l_glad0201,l_glad0202,l_glad021,l_glad0211,l_glad0212,l_glad022,l_glad0221,l_glad0222,
#              l_glad023,l_glad0231,l_glad0232,l_glad024,l_glad0241,l_glad0242,l_glad025,l_glad0251,l_glad0252,
#              l_glad026,l_glad0261,l_glad0262
#         FROM glad_t
#       WHERE gladent = g_enterprise
#         AND gladld  = p_fabgld
#         AND glad001 = l_fabo.fabo024     
#      
#      #======================================
#      #固定核算项检查
#      #如果启用改固定核算项勾选，则对该核算项的值进行检查
#      #======================================  
#      #20141218 add by chenying
#
#      LET l_errmsg = p_fabgdocno||'/'||l_fabo.faboseq||'/'||l_fabo.fabo024
#      #營運據點
#      IF NOT cl_null(l_fabo.fabo031) THEN
#         CALL s_voucher_glaq017_chk(l_fabo.fabo031)
#         IF NOT cl_null(g_errno) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',g_errno,1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = g_errno
#            #160321-00016#5 --s add
#            #(s_voucher_glaq017_chk)aoo-00089->sub-01302
#            LET g_errparam.replace[1] = 'aooi100'
#            LET g_errparam.replace[2] = cl_get_progname('aooi100',g_lang,"2")
#            LET g_errparam.exeprog = 'aooi100'
#            #160321-00016#5 --e add
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         END IF
#      END IF
#      
#      #部门检查-#該科目做部門管理時，部門不可空白
#      IF l_glad007 = 'Y' THEN
#         IF cl_null(l_fabo.fabo032) THEN
#            LET r_success = FALSE    
##            CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo032',l_errmsg,'','agl-00043',1) #cymod     
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00043'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()          
#         ELSE   
#            CALL s_department_chk(l_fabo.fabo032,l_fabg.fabgdocdt) RETURNING l_success            
#            IF l_success = FALSE THEN
#               LET r_success = FALSE
#            END IF                
#         END IF
#      END IF
#      
#      #利润成本中心检查--#該科目做利潤成本管理時，利潤成本不可空白
#      IF l_glad008 = 'Y' THEN
#         IF cl_null(l_fabo.fabo033) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo033',l_errmsg,'','agl-00044',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00044'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()  
#         ELSE
#            CALL s_voucher_glaq019_chk(l_fabo.fabo033,l_fabg.fabgdocdt)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo033
#               LET g_errparam.code   = g_errno
#               #160321-00016#5 --s add
#               #(s_voucher_glaq019_chk)aoo-00029->sub-01302
#               IF g_errno = 'sub-01302' THEN
#                  LET g_errparam.replace[1] = 'aooi125'
#                  LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
#                  LET g_errparam.exeprog = 'aooi125'
#               END IF
#               #160321-00016#5 --e add
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()  
#            END IF                 
#         END IF
#      END IF                      
#       
#      #区域检查 #該科目做區域管理時，區域不可空白
#      IF l_glad009 = 'Y' THEN
#         IF cl_null(l_fabo.fabo034) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo034',l_errmsg,'','agl-00045',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00045'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()          
#         ELSE
#            CALL s_azzi650_chk_exist('287',l_fabo.fabo034) RETURNING l_success
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#            END IF                  
#         END IF
#      END IF  
#       
#      #客商检查-#該科目做交易客商管理時，客商不可空白 
#      IF l_glad010 = 'Y' THEN
#         IF cl_null(l_fabo.fabo035) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00046',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00046'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()          
#         ELSE
#            CALL s_voucher_glaq021_chk(l_fabo.fabo035)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
##               CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',g_errno,1) #cymod
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo035
#               LET g_errparam.code   = g_errno
#               #160321-00016#5 --s add
#               #(s_voucher_glaq021_chk)apm-00029->sub-01302
#               LET g_errparam.replace[1] = 'apmm100'
#               LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
#               LET g_errparam.exeprog = 'apmm100'
#               #160321-00016#5 --e add
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()             
#            END IF                
#         END IF
#      END IF  
#       
#      #客商检查--#該科目做账款客商管理時，客商不可空白
#      IF l_glad027 = 'Y' THEN
#         IF cl_null(l_fabo.fabo036) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','axr-00215',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'axr-00215'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_voucher_glaq021_chk(l_fabo.fabo036)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
##               CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',g_errno,1) #cymod
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo036
#               LET g_errparam.code   = g_errno
#               #160321-00016#5 --s add
#               #(s_voucher_glaq021_chk)apm-00029->sub-01302
#               LET g_errparam.replace[1] = 'apmm100'
#               LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
#               LET g_errparam.exeprog = 'apmm100'
#               #160321-00016#5 --e add
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()            
#            END IF                
#         END IF
#      END IF  
#      
#      #客群检查-#該科目做客群管理時，客群不可空白
#      IF l_glad011 = 'Y' THEN
#         IF cl_null(l_fabo.fabo037) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo037',l_errmsg,'','agl-00047',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00047'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_azzi650_chk_exist('281',l_fabo.fabo037) RETURNING l_success
#            IF l_success = FALSE THEN
#               LET r_success = FALSE    
#            END IF                
#         END IF
#      END IF  
#      
#      #人员
#      IF l_glad013 = 'Y' THEN
#         IF cl_null(l_fabo.fabo038) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00069',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00069'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#           CALL s_employee_chk(l_fabo.fabo038) RETURNING l_success 
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#            END IF                
#         END IF
#      END IF
#      
#      #專案检查
#      IF l_glad015 = 'Y' THEN
#         IF cl_null(l_fabo.fabo039) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00071',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00071'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_aap_project_chk(l_fabo.fabo039) RETURNING l_success,g_errno
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo039
#               #160321-00016#5 --s add
#               #(s_aap_project_chk)apj-00002->sub-01302
#               LET g_errparam.replace[1] = 'apjm200'
#               LET g_errparam.replace[2] = cl_get_progname('apjm200',g_lang,"2")
#               LET g_errparam.exeprog = 'apjm200'
#               #160321-00016#5 --e add
#               LET g_errparam.popup = TRUE
#               CALL cl_err()               
#            END IF            
#         END IF
#      END IF
#      
#      #WBS检查 
#      IF l_glad016 = 'Y' THEN
#         IF cl_null(l_fabo.fabo040) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00072',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00072'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()          
#         ELSE
#            CALL s_voucher_glaq028_chk(l_fabo.fabo039,l_fabo.fabo040) 
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo040
#               LET g_errparam.popup = TRUE
#               CALL cl_err()               
#            END IF         
#         END IF
#      END IF  
#      
#      #該科目做經營方式管理時，不可空白
#      IF l_glad031 = 'Y' THEN  
#         IF cl_null(l_fabo.fabo054) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00286',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00286'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_voucher_glaq051_chk(l_fabo.fabo054) 
#            IF NOT cl_null(g_errno) THEN  
#               LET r_success = FALSE             
##               CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',g_errno,1) #cymod               
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo054
#               LET g_errparam.popup = TRUE
#               CALL cl_err()              
#            END IF
#         END IF
#      END IF      
#      #該科目做渠道管理時，不可空白
#      IF l_glad032 = 'Y' THEN  
#         IF cl_null(l_fabo.fabo055) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00287',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00287'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_voucher_glaq052_chk(l_fabo.fabo055) 
#            IF NOT cl_null(g_errno) THEN  
#               LET r_success = FALSE             
##               CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',g_errno,1) #cymod            
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo055
#               LET g_errparam.popup = TRUE
#               CALL cl_err()              
#            END IF 
#         END IF      
#      END IF         
#      #該科目做品牌管理時，不可空白
#      IF l_glad033 = 'Y' THEN
#         IF cl_null(l_fabo.fabo056) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo056',l_errmsg,'','agl-00288',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00288'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()           
#         ELSE
#            CALL s_azzi650_chk_exist('2002',l_fabo.fabo056) RETURNING l_success
#            IF l_success = FALSE THEN  
#               LET r_success = FALSE             
##               CALL cl_errmsg('fabodocno,faboseq,fabo024,fabo056',l_errmsg,'',g_errno,1) #cymod       
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabo.fabo056
#               LET g_errparam.code   = g_errno
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()              
#            END IF
#         END IF      
#      END IF 
#
#      #===================================================
#      #自由核算项检查
#      #如果启用该核算项勾选，并且控制方式不为1：允许空白，则对核算项的值进行检查
#      #===================================================
#      #核算项一
#       IF l_glad017 = 'Y' THEN
#          IF l_glad0172<>'1' THEN
#             IF cl_null(l_fabo.fabo060) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00074',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00074'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                
#             END IF
#          END IF
#          IF NOT cl_null(l_fabo.fabo060) THEN          
#             CALL s_voucher_free_account_chk(l_glad0171,l_fabo.fabo060,l_glad0172) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                 
#             END IF 
#           END IF   
#       END IF 
#       #核算项二
#       IF l_glad018 = 'Y'  THEN
#          IF l_glad0182 <>'1' THEN 
#             IF cl_null(l_fabo.fabo061) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00075',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00075'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF
#          IF NOT cl_null(l_fabo.fabo061) THEN          
#             CALL s_voucher_free_account_chk(l_glad0181,l_fabo.fabo061,l_glad0182) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                 
#             END IF 
#          END IF    
#       END IF
#       #核算项三
#       IF l_glad019 = 'Y'  THEN
#          IF l_glad0192 <>'1'  THEN 
#             IF cl_null(l_fabo.fabo062) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00076',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00076'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF   
#          IF NOT cl_null(l_fabo.fabo062) THEN        
#             CALL s_voucher_free_account_chk(l_glad0191,l_fabo.fabo062,l_glad0192) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                 
#             END IF 
#          END IF    
#       END IF 
#       #核算项四
#       IF l_glad020 = 'Y' THEN
#          IF l_glad0202 <>'1' THEN
#             IF cl_null(l_fabo.fabo063) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00077',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00077'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF   
#          END IF
#          IF NOT cl_null(l_fabo.fabo063) THEN
#             CALL s_voucher_free_account_chk(l_glad0201,l_fabo.fabo063,l_glad0202) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                 
#             END IF 
#          END IF    
#       END IF
#       #核算项五
#       IF l_glad021 = 'Y'  THEN
#          IF l_glad0212 <>'1' THEN
#             IF cl_null(l_fabo.fabo064) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00078',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00078'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF
#          IF NOT cl_null(l_fabo.fabo064) THEN
#             CALL s_voucher_free_account_chk(l_glad0211,l_fabo.fabo064,l_glad0212) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()                 
#             END IF 
#          END IF    
#       END IF 
#        #核算项六
#       IF l_glad022 = 'Y'  THEN
#          IF l_glad0222 <>'1' THEN 
#             IF cl_null(l_fabo.fabo065) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00079',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00079'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabo.fabo065) THEN          
#             CALL s_voucher_free_account_chk(l_glad0221,l_fabo.fabo065,l_glad0222) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF           
#       END IF 
#       #核算项七
#       IF l_glad023 = 'Y'  THEN
#          IF l_glad0232 <>'1' THEN 
#             IF cl_null(l_fabo.fabo066) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00080',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00080'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF  
#          END IF
#          IF NOT cl_null(l_fabo.fabo066) THEN          
#             CALL s_voucher_free_account_chk(l_glad0231,l_fabo.fabo066,l_glad0232) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF           
#       END IF
#       #核算项八
#       IF l_glad024 = 'Y'  THEN
#          IF l_glad0242 <>'1' THEN 
#             IF cl_null(l_fabo.fabo067) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00081',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00081'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabo.fabo067) THEN           
#             CALL s_voucher_free_account_chk(l_glad0241,l_fabo.fabo067,l_glad0242) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF 
#          END IF 
#       END IF 
#       #核算项九
#       IF l_glad025 = 'Y'  THEN
#          IF l_glad0252 <>'1' THEN 
#             IF cl_null(l_fabo.fabo068) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00082',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00082'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()              
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabo.fabo068) THEN          
#             CALL s_voucher_free_account_chk(l_glad0251,l_fabo.fabo068,l_glad0252) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF
#          END IF           
#       END IF        
#       #核算项十
#       IF l_glad026 = 'Y'  THEN
#          IF l_glad0262 <>'1' THEN 
#             IF cl_null(l_fabo.fabo069) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'','agl-00083',1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = 'agl-00083'
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()               
#             END IF  
#          END IF
#          IF NOT cl_null(l_fabo.fabo069) THEN        
#             CALL s_voucher_free_account_chk(l_glad0261,l_fabo.fabo069,l_glad0262) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
##                CALL cl_errmsg('fabodocno,faboseq,fabo024',l_errmsg,'',l_errno,1)#cymod
#                INITIALIZE g_errparam TO NULL
#                LET g_errparam.extend = l_errmsg
#                LET g_errparam.code   = l_errno
#                #160321-00016#5 --s add
#                #(s_voucher_free_account_chk)agl-00063->sub-01302
#                IF l_errno = 'agl-00063' THEN
#                   LET g_errparam.replace[1] = 'agli041'
#                   LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
#                   LET g_errparam.exeprog = 'agli041'
#                END IF
#                #160321-00016#5 --e add
#                LET g_errparam.popup  = TRUE 
#                CALL cl_err()  
#             END IF 
#          END IF 
#       END IF
#
#   END FOREACH
#   END IF #20150112 add by chenying
#181204-00026#6 mark e---#不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项  
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 過賬還原
# Memo...........:
# Usage..........: CALL s_afat503_unpost_upd_fabg(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       帐套
#                : p_fabgdocno    异动单号
# Return code....: r_success      检查结果
# Date & Author..: 2014/08/4 By wangrr
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_unpost_upd_fabg(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   DEFINE r_success           LIKE type_t.num5
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabh              RECORD LIKE fabh_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076  #主要類別新
      ,fabh077 LIKE fabh_t.fabh077, #異動前預留殘值   #171228-00025#1 add 
       fabh078 LIKE fabh_t.fabh078, #170207-00044#1 add
       fabh079 LIKE fabh_t.fabh079  #170207-00044#1 add
      ,fabh080 LIKE fabh_t.fabh080, #190617-00022#1 add
       fabh081 LIKE fabh_t.fabh081  #190617-00022#1 add      
       END RECORD    
   #161128-00061#6---modify--end--------------------
   DEFINE l_sql               STRING
   DEFINE l_faaj020           LIKE faaj_t.faaj020
   DEFINE l_faaj103           LIKE faaj_t.faaj103
   DEFINE l_faaj153           LIKE faaj_t.faaj153
   DEFINE l_faaj018           LIKE faaj_t.faaj018
   DEFINE l_faaj021           LIKE faaj_t.faaj021   
   DEFINE l_faah018           LIKE faah_t.faah018
   DEFINE l_faaj033           LIKE faaj_t.faaj033
   DEFINE l_faaj112           LIKE faaj_t.faaj112
   DEFINE l_faaj162           LIKE faaj_t.faaj162
   DEFINE l_qty               LIKE faaj_t.faaj033 
   DEFINE l_fabiseq1          LIKE fabi_t.fabiseq   
   DEFINE l_today             DATETIME YEAR TO SECOND
   DEFINE l_faaj032           LIKE faaj_t.faaj032  #160331-00003#1
   DEFINE l_fabh073           LIKE fabh_t.fabh073  #160331-00003#1
   #170618-00113#1--add--str--
   DEFINE l_glaa014           LIKE glaa_t.glaa014 
   DEFINE l_fabr012           LIKE fabr_t.fabr012
   DEFINE l_fabr040           LIKE fabr_t.fabr040
   DEFINE l_fabr041           LIKE fabr_t.fabr041
   DEFINE l_fabr042           LIKE fabr_t.fabr042
   DEFINE l_fabr043           LIKE fabr_t.fabr043
   #170618-00113#1--add--end
   
   WHENEVER ERROR CONTINUE
    
   LET r_success  = TRUE
   LET l_today = cl_get_current()  
   #更新狀態碼=過帳, 過帳人=g_user,過帳日期=g_today
   UPDATE fabg_t SET fabgstus = 'Y',
                     fabgpstid = '',
                     fabgpstdt = ''
               WHERE fabgent = g_enterprise
                 AND fabgld = p_fabgld
                 AND fabgdocno = p_fabgdocno
   IF SQLCA.SQLCODE THEN
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'Y',SQLCA.SQLCODE,1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
      LET r_success = FALSE
   END IF 
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t
   WHERE fabgent = g_enterprise
     AND fabgld = p_fabgld
     AND fabgdocno = p_fabgdocno
   #更新資產狀態
  #161128-00061#6---modify--begin--------------------
   #LET l_sql = " SELECT * FROM fabh_t",
   LET l_sql = " SELECT fabhent,fabhld,fabhsite,fabhdocno,fabhseq,fabh000,fabh001,fabh002,fabh003,",
               "fabh004,fabh005,fabh006,fabh007,fabh008,fabh009,fabh010,fabh011,fabh012,fabh013,fabh014,",
               "fabh015,fabh016,fabh017,fabh018,fabh019,fabh020,fabh021,fabh022,fabh023,fabh024,fabh025,",
               "fabh026,fabh027,fabh028,fabh029,fabh030,fabh031,fabh032,fabh033,fabh034,fabh035,fabh036,",
               "fabh037,fabh038,fabh039,fabh040,fabh041,fabh042,fabh043,fabh060,fabh061,fabh062,fabh063,",
               "fabh064,fabh065,fabh066,fabh067,fabh068,fabh069,fabh100,fabh101,fabh102,fabh103,fabh104,",
               "fabh105,fabh106,fabh107,fabh108,fabh109,fabh110,fabh150,fabh151,fabh152,fabh153,fabh154,",
               "fabh155,fabh156,fabh157,fabh158,fabh159,fabh160,fabh070,fabh071,fabh072,fabh073,fabh111,",
               "fabh161,fabh074,fabh075,fabh076,fabh077,fabh078,fabh079,fabh080,fabh081 FROM fabh_t",   #171228-00025#1 add fabh077 #170207-00044#1 add fabh078 fabh079  #190617-00022#1 add fabh080,fabh081  
   #161128-00061#6---modify--end--------------------
               " WHERE fabhent = '",g_enterprise,"'",
               "   AND fabhld = '",p_fabgld,"'",
               "   AND fabhdocno = '",p_fabgdocno,"'"
   PREPARE s_voucher_fabh_pr2 FROM l_sql
   DECLARE s_voucher_fabh_cs2 CURSOR FOR s_voucher_fabh_pr2
   FOREACH s_voucher_fabh_cs2 INTO l_fabh.*
      IF SQLCA.sqlcode THEN
#         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = SQLCA.SQLCODE
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE         
         EXIT FOREACH
      END IF

 

      #重估&減值
      #調整成本：調增累加，調減想減
      IF l_fabh.fabh018='1' THEN #調增
          LET l_faaj020=l_fabh.fabh010
          LET l_faaj103=l_fabh.fabh103
          LET l_faaj153=l_fabh.fabh153
          LET l_faaj021=l_fabh.fabh019       #減值準備
          LET l_faaj112=l_fabh.fabh109
          LET l_faaj162=l_fabh.fabh159
      ELSE #調減
          LET l_faaj020=l_fabh.fabh010*(-1)
          LET l_faaj103=l_fabh.fabh103*(-1)
          LET l_faaj153=l_fabh.fabh153*(-1)
          LET l_faaj021=l_fabh.fabh019*(-1)  #減值準備
          LET l_faaj112=l_fabh.fabh109*(-1)
          LET l_faaj162=l_fabh.fabh159*(-1)          
      END IF

      #銷賬
      IF l_fabg.fabg005='6' OR l_fabg.fabg005='24' THEN  #160329-00025#1 add l_fabg.fabg005='24'
         #faah數量
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent = g_enterprise AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002

         #faaj數量
#         SELECT faaj033 INTO l_faaj033 FROM faaj_t                   #160331-00003#1 mark 
         SELECT faaj032,faaj033 INTO l_faaj032,l_faaj033 FROM faaj_t  #160331-00003#1 add
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
         #190923-00051#1 mark(s)
         #160331-00003#1 add -str    
         #SELECT fabh073 INTO l_fabh073 
         #  FROM fabh_t
         # WHERE fabhent   = g_enterprise
         #   AND fabhld    = p_fabgld
         #   AND fabhdocno = p_fabgdocno
         #160331-00003#1 add -end
         #190923-00051#1 mark(s)         
         LET l_qty = l_faah018 - l_faaj033
         #170618-00147#1 add s---
         IF l_fabg.fabg005='24' THEN        
            IF l_qty > 0 THEN 
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                                 faaj034 = faaj034 - l_fabh.fabh010,              #處置成本
                                 faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                                 faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                                                                                  #本期處置累折
                                          #（本期累折-本期處置累折）/(faah數量-處置數量)*銷賬數量                           
#                                 faaj032 = faaj032 - (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                                 faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073
                                 #faaj028 = faaj028  + l_fabh.fabh004,             #未折減額  #190703-00033#1 mark
                                 faaj028 = faaj028  + l_fabh.fabh010,              #還原時要把未折減額+回處置成本 #190703-00033#1 add 
                                 faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值  
                                                           
                                 faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                                 faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                                 faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                                 faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值 
                                                                                  #本位幣二本期處置累折
                                 faaj115 = faaj115 - (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007, 
                                 faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                                 faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                                 faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                                 faaj158 = faaj158 + l_fabh.fabh158,              #本位幣三未折減額
                                 faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                                                                  #本位幣三本期處置累折                                                                   
                                 faaj165 = faaj165 - (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
                  WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000              
            ELSE   
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                                 faaj034 = faaj034 - l_fabh.fabh010,              #處置成本
                                 faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                                 faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                                 faaj028 = faaj028 + l_fabh.fabh004,              #未折減額 
                                 #faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值  
                                 faaj019 = l_fabh.fabh015,  
                                 faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073                              
                                 faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                                 faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                                 faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                                 #faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                 faaj105 = l_fabh.fabh015,
                                 faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                                 faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                                 faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                                 #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                 faaj155 = l_fabh.fabh015,
                                 faaj158 = faaj158 + l_fabh.fabh158               #本位幣三未折減額   
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000                              
            END IF
         ELSE
         #170618-00147#1 add e---
            IF l_qty > 0 THEN 
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                                 faaj034 = faaj034 - l_fabh.fabh008,              #處置成本
                                 faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                                 faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                                                                                  #本期處置累折
                                          #（本期累折-本期處置累折）/(faah數量-處置數量)*銷賬數量                           
#                                 faaj032 = faaj032 - (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                                 faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073
                                 faaj028 = faaj028  + l_fabh.fabh004,             #未折減額 
                                 faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值  
                                                           
                                 faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                                 faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                                 faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                                 faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值 
                                                                                  #本位幣二本期處置累折
                                 faaj115 = faaj115 - (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007, 
                                 faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                                 faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                                 faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                                 faaj158 = faaj158 + l_fabh.fabh158,              #本位幣三未折減額
                                 faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                                                                  #本位幣三本期處置累折                                                                   
                                 faaj165 = faaj165 - (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
                  WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000              
            ELSE   
               #更新faaj
               UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                                 faaj034 = faaj034 - l_fabh.fabh008,              #處置成本
                                 faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                                 faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                                 faaj028 = faaj028 + l_fabh.fabh004,              #未折減額 
                                 #faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值  
                                 #faaj019 = l_fabh.fabh015,   #180115-00009#1 mark
                                 faaj019 = l_fabh.fabh077,    #180115-00009#1 add  
                                 faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073                              
                                 faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                                 faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                                 faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                                 faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                                 #faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                 faaj105 = l_fabh.fabh015,
                                 faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                                 faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                                 faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                                 #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值
                                 faaj155 = l_fabh.fabh015,
                                 faaj158 = faaj158 + l_fabh.fabh158               #本位幣三未折減額   
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000                              
            END IF
            #190703-00033#1 mark(s)
            ##180109-00065#1 add-s
            #UPDATE faah_t SET faah015 = l_fabh.fabh003
            # WHERE faahent = g_enterprise AND faah001 =  l_fabh.fabh000
            #   AND faah003 =  l_fabh.fabh001 AND faah004 = l_fabh.fabh002 
            ##180109-00065#1 add-e
            #190703-00033#1 mark(e)            
         END IF #170618-00147#1 add    
         #190703-00033#1 add(s)   
         UPDATE faah_t SET faah015 = l_fabh.fabh003,faah016 = '1'
          WHERE faahent = g_enterprise AND faah001 =  l_fabh.fabh000
            AND faah003 =  l_fabh.fabh001 AND faah004 = l_fabh.fabh002 
            
         UPDATE faaj_t SET faaj038 = l_fabh.fabh003
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
         #190703-00033#1 add(e)            
      END IF
      
      #減值
      IF l_fabg.fabg005='14' THEN
         #更新faaj已提列減值準備
         UPDATE faaj_t SET faaj021 = faaj021 - l_faaj021,    #已提列減值準備
                           faaj112 = faaj112 - l_faaj112,    #本位幣二已提列減值準備
                           faaj162 = faaj162 - l_faaj162     #本位幣三已提列減值準備
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
      END IF
      
      #重估
      #IF l_fabg.fabg005='8' OR l_fabg.fabg005 = '23' OR l_fabg.fabg005 = '24' OR l_fabg.fabg005='9' OR l_fabg.fabg005='39' THEN #160426-00014#10 add '39' #190703-00033 mark
      IF l_fabg.fabg005='8' OR l_fabg.fabg005 = '23'  OR l_fabg.fabg005='9' OR l_fabg.fabg005='39' THEN #190703-00033#1 add  因為盤虧上面已有處理過，此處不用在更新一次
         IF l_fabg.fabg005='8' OR l_fabg.fabg005 = '23' OR l_fabg.fabg005='9' OR l_fabg.fabg005='39' THEN  #160329-00025#1 add #160426-00014#10 add '39'
            #本期累折=本期累折-（重估累計折舊-累折）
             LET l_faaj018=l_fabh.fabh012-l_fabh.fabh011   #（重估累計折舊-累折）
            #更新faaj_t
            #資產狀態為折畢再提時進行重估，重估的未使用年限與預留殘值賦值與折畢再提的預留年限和預留殘值
            IF l_fabh.fabh003='7' THEN
               UPDATE faaj_t SET faaj020 = faaj020 - l_faaj020,      #調整成本
                                 faaj012 = l_fabh.fabh015,           #預留殘値
                                 #faaj013 = l_fabh.fabh013,          #未用年限 #180119-00008#1 mark
                                 faaj005 = l_fabh.fabh013,           #未用年限 #180119-00008#1 add
                                 faaj018 = faaj018 - l_faaj018,      #本期累折
                                 faaj017 = l_fabh.fabh011,           #累折
                                 faaj028 = l_fabh.fabh004,           #未折減額 
                                 faaj103 = faaj103 - l_faaj103,      #本位幣二調整成本                      
                                 faaj104 = l_fabh.fabh104,           #本位幣二累折
                                 faaj106 = l_fabh.fabh106,           #本位幣二折畢再提預留殘值
                                 faaj117 = faaj117 - l_fabh.fabh103,
                                 faaj167 = faaj167 - l_fabh.fabh153,
                                 faaj153 = faaj153 - l_faaj153,      #本位幣三調整成本                      
                                 faaj154 = l_fabh.fabh154,           #本位幣三累折
                                 faaj156 = l_fabh.fabh156            #本位幣三折畢再提預留殘值                           
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
            ELSE
               #190830-00087#1 add -s
               #盘盈时不更新耐用年限
               IF l_fabg.fabg005 = '23' THEN
                  UPDATE faaj_t SET faaj020 = faaj020 - l_faaj020,      #調整成本
                                    faaj005 = l_fabh.fabh013,           #未用年限
                                    faaj019 = l_fabh.fabh015,           #預留殘值
                                    faaj018 = faaj018 - l_faaj018,      #本期累折
                                    faaj017 = l_fabh.fabh011,           #累折
                                    faaj028 = l_fabh.fabh004,           #未折減額
                                    faaj103 = faaj103 - l_faaj103,      #本位幣二調整成本                      
                                    faaj104 = l_fabh.fabh104,           #本位幣二累折
                                    faaj105 = l_fabh.fabh106,           #本位幣二折畢再提預留殘值
                                    faaj117 = faaj117 - l_fabh.fabh103,
                                    faaj167 = faaj167 - l_fabh.fabh153,
                                    faaj153 = faaj153 - l_faaj153,      #本位幣三調整成本                      
                                    faaj154 = l_fabh.fabh154,           #本位幣三累折
                                    faaj155 = l_fabh.fabh156            #本位幣三折畢再提預留殘值
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                     AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
               ELSE
               #190830-00087#1 add -e
                  UPDATE faaj_t SET faaj020 = faaj020 - l_faaj020,      #調整成本
                                    faaj004 = l_fabh.fabh080,           #耐用年限  #190617-00022#1 add
                                    faaj005 = l_fabh.fabh013,           #未用年限
                                    faaj019 = l_fabh.fabh015,           #預留殘值
                                    faaj018 = faaj018 - l_faaj018,      #本期累折
                                    faaj017 = l_fabh.fabh011,           #累折
                                    faaj028 = l_fabh.fabh004,           #未折減額
                                    faaj103 = faaj103 - l_faaj103,      #本位幣二調整成本                      
                                    faaj104 = l_fabh.fabh104,           #本位幣二累折
                                    faaj105 = l_fabh.fabh106,           #本位幣二折畢再提預留殘值
                                    faaj117 = faaj117 - l_fabh.fabh103,
                                    faaj167 = faaj167 - l_fabh.fabh153,
                                    faaj153 = faaj153 - l_faaj153,      #本位幣三調整成本                      
                                    faaj154 = l_fabh.fabh154,           #本位幣三累折
                                    faaj155 = l_fabh.fabh156            #本位幣三折畢再提預留殘值
                   WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                     AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
               END IF  #190830-00087#1 add
            END IF
            #180614-00012#1 -s 180725 add by 08172
            #改良盘盈时不更新折旧方式
#            IF l_fabg.fabg005 <> '9' THEN  #190830-00087#1 mark
            IF l_fabg.fabg005 <> '9' AND l_fabg.fabg005 <> '23' THEN  #190830-00087#1 add
            #180614-00012#1 -e 180725 add by 08172
               #170207-00044#1 add s---
               UPDATE faaj_t SET faaj003 = l_fabh.fabh078
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
                  AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000         
               #170207-00044#1 add e---
            END IF#180614-00012#1 180725 add by 08172         
         END IF #160329-00025#1
         IF l_fabg.fabg005 = '23' OR l_fabg.fabg005 = '24' THEN
            
            IF l_fabg.fabg005 = '23' AND l_fabh.fabh006 = 0 THEN  #160329-00025#1 盘盈（账面上无）需删除faah_t,faaj_t
               IF NOT cl_null(l_fabh.fabh002) THEN  
                  DELETE FROM faah_t WHERE faahent = g_enterprise AND faah001 =  l_fabh.fabh000
                                       AND faah003 =  l_fabh.fabh001 AND faah004 = l_fabh.fabh002
               ELSE 
                  DELETE FROM faah_t WHERE faahent = g_enterprise AND faah001 =  l_fabh.fabh000
                                       AND faah003 =  l_fabh.fabh001 AND faah004 = ' '
               END IF
               DELETE FROM faaj_t WHERE faajent =  g_enterprise AND faajld = l_fabh.fabhld
                                    AND faaj001 =  l_fabh.fabh001 AND faaj002 = l_fabh.fabh002  
               DELETE FROM faai_t WHERE faaient =  g_enterprise AND faai001 = l_fabh.fabh000
                                    AND faai002 =  l_fabh.fabh001 AND faai003 = l_fabh.fabh002                
            END IF   #160329-00025#1  
            
            #160329-00025#1 add--str--
            UPDATE faah_t SET faah015 = '2',
                              faah016 = '1'
             WHERE faahent = g_enterprise AND faah001 =  l_fabh.fabh000
               AND faah003 =  l_fabh.fabh001 AND faah004 = l_fabh.fabh002   
            #160329-00025#1 add--end--
            
         END IF
      END IF   
 
      #報廢
      IF l_fabg.fabg005='21' THEN 
         #faah數量
         SELECT faah018 INTO l_faah018 FROM faah_t
          WHERE faahent = g_enterprise AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001 AND faah004 = l_fabh.fabh002

         #faaj數量
#         SELECT faaj033 INTO l_faaj033 FROM faaj_t                   #160331-00003#1 mark 
         SELECT faaj032,faaj033 INTO l_faaj032,l_faaj033 FROM faaj_t  #160331-00003#1 add
          WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
            AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000  
         #190923-00051#1 mark(s)
         #160331-00003#1 add -str    
         #SELECT fabh073 INTO l_fabh073 
         #  FROM fabh_t
         # WHERE fabhent   = g_enterprise
         #   AND fabhld    = p_fabgld
         #   AND fabhdocno = p_fabgdocno
         #160331-00003#1 add -end
         #190923-00051#1 mark(e)         
         LET l_qty = l_faah018 - l_faaj033
         IF l_qty > 0 THEN 
            #更新faaj
            UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                              faaj034 = faaj034 - l_fabh.fabh008,              #處置成本
                              faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                              faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                              faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值   
                                                                               #本期處置累折
                                       #（本期累折-本期處置累折）/(faah數量-處置數量)*銷賬數量                           
#                              faaj032 = faaj032 - (faaj018 - faaj032)/(l_faah018 - faaj033)*l_fabh.fabh007,   #160331-00003#1 mark
                              faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073
                              faaj028 = faaj028 + l_fabh.fabh004,              #未折減額                             
                              faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                              faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                              faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                              faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                              faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值   
                                                                               #本位幣二本期處置累折
                              faaj115 = faaj115 - (faaj111 - faaj115)/(l_faah018 - faaj033)*l_fabh.fabh007, 
                              faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                              faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                              faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                              faaj158 = faaj158 + l_fabh.fabh158,              #本位幣三未折減額
                              faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值   
                                                                               #本位幣三本期處置累折                                                                   
                              faaj165 = faaj165 - (faaj161 - faaj165)/(l_faah018 - faaj033)*l_fabh.fabh007 
             WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000                 
         ELSE   
            #更新faaj
            UPDATE faaj_t SET faaj033 = faaj033 - l_fabh.fabh007,              #處置數量 
                              faaj034 = faaj034 - l_fabh.fabh008,              #處置成本
                              faaj035 = faaj035 - l_fabh.fabh011,              #處置累折
                              faaj027 = faaj027 - l_fabh.fabh017,              #銷賬減值準備
                              faaj028 = faaj028 + l_fabh.fabh004,              #未折減額   
                              #faaj019 = (faaj019 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              #faaj019 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj019 / l_qty END)*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值       #150709-00007#1 add lujh   #171228-00025#1 mark
                              faaj019 = l_fabh.fabh077,   #171228-00025#1 add                        
                              faaj032 = faaj032 - l_fabh.fabh073,   #160331-00003#1 add #190923-00051#1 mod l_fabh073->l_fabh.fabh073
                              faaj113 = faaj113 - l_fabh.fabh102,              #本位幣二處置成本
                              faaj114 = faaj114 - l_fabh.fabh104,              #本位幣二處置累折                             
                              faaj110 = faaj110 - l_fabh.fabh110,              #本位幣二銷賬減值準備 
                              #faaj105 = (faaj105 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              faaj105 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj105 / l_qty END)*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值       #150709-00007#1 add lujh 
                              faaj108 = faaj108 + l_fabh.fabh108,              #本位幣二未折減額
                              faaj163 = faaj163 - l_fabh.fabh152,              #本位幣三處置成本
                              faaj164 = faaj164 - l_fabh.fabh154,              #本位幣三處置累折                             
                              faaj160 = faaj160 - l_fabh.fabh160,              #本位幣三銷賬減值準備 
                              #faaj155 = (faaj155 / (l_faah018-l_faaj033))*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值    #150709-00007#1 mark lujh
                              faaj155 = (CASE WHEN l_qty = 0 THEN 0 ELSE faaj155 / l_qty END)*(l_faah018 - (l_faaj033-l_fabh.fabh007)), #预留残值       #150709-00007#1 add lujh 
                              faaj158 = faaj158 + l_fabh.fabh158               #本位幣三未折減額      
                WHERE faajent=g_enterprise AND faajld=l_fabh.fabhld
               AND faaj001=l_fabh.fabh001 AND faaj002=l_fabh.fabh002 AND faaj037=l_fabh.fabh000
        END IF
      END IF
      
      IF SQLCA.SQLCODE THEN
#         CALL cl_errmsg('upd faaj_t','','',SQLCA.SQLCODE,1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'upd faaj_t'
         LET g_errparam.code   = SQLCA.SQLCODE
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
         LET r_success = FALSE
      END IF
      
      IF l_fabg.fabg005='8' OR l_fabg.fabg005='6' OR l_fabg.fabg005='21' OR l_fabg.fabg005='9' 
         OR l_fabg.fabg005='39' OR l_fabg.fabg005='23' THEN #160426-00014#10 add 39 #170618-00113#1 add '23'
#         #161104-00048#5 mark s---
#         #更新faah_t的資產狀態為2：折舊中
#         UPDATE faah_t SET faah015 = l_fabh.fabh003,
#                           faahmodid = g_user,
#                           faahmoddt = l_today
#          WHERE faahent = g_enterprise
#            AND faah001 = l_fabh.fabh000
#            AND faah003 = l_fabh.fabh001
#            AND faah004 = l_fabh.fabh002
#         IF SQLCA.SQLCODE THEN
##            CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = 'upd faah_t'
#            LET g_errparam.code   = SQLCA.SQLCODE
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#            LET r_success = FALSE
#         END IF
#         #161104-00048#5 mark e---
         
         
         #180301-00007#1 add s---
         #更新faah_t的資產狀態為2：折舊中
         UPDATE faah_t SET faah015 = l_fabh.fabh003,
                           faahmodid = g_user,
                           faahmoddt = l_today
          WHERE faahent = g_enterprise
            AND faah001 = l_fabh.fabh000
            AND faah003 = l_fabh.fabh001
            AND faah004 = l_fabh.fabh002
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faah_t'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF         
         #180301-00007#1 add e---
         
         #161104-00048#5 add s---
         #更新faah_t的資產狀態為2：折舊中
         UPDATE faaj_t SET faaj038 = l_fabh.fabh003,
                           faajmodid = g_user,
                           faajmoddt = l_today
          WHERE faajent = g_enterprise
            AND faaj037 = l_fabh.fabh000
            AND faaj001 = l_fabh.fabh001
            AND faaj002 = l_fabh.fabh002
         IF SQLCA.SQLCODE THEN
#            CALL cl_errmsg('upd faah_t','','',SQLCA.SQLCODE,1) #cymod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd faaj_t'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
            LET r_success = FALSE
         END IF         
         #161104-00048#5 add e---         
      END IF

      #170704-00040#1----add----str
      IF l_fabg.fabg005='21' THEN
            #更新faah_t的資產狀態為2：折舊中
            UPDATE faah_t SET faah015 = l_fabh.fabh003,
                              faahmodid = g_user,
                              faahmoddt = l_today
             WHERE faahent = g_enterprise
               AND faah001 = l_fabh.fabh000
               AND faah003 = l_fabh.fabh001
               AND faah004 = l_fabh.fabh002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faah_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
      END IF
      #170704-00040#1----add----end

      IF l_fabg.fabg005='6' THEN
         #更新資產標籤狀態
         LET g_sql = " SELECT DISTINCT fabiseq1 ",
                      "   FROM fabi_t ",
                      "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",l_fabh.fabhdocno,"'",
                      "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                      "    AND fabi001 = '", l_fabh.fabh000 ,"'",
                      "    AND fabi002 = '", l_fabh.fabh001 ,"'",
                      "    AND fabi003 = '", l_fabh.fabh002 ,"'"
         PREPARE s_voucher_fabi_pr2 FROM g_sql
         DECLARE s_voucher_fabi_cs2 CURSOR FOR s_voucher_fabi_pr2
         FOREACH s_voucher_fabi_cs2 INTO l_fabiseq1
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #銷賬未結束更新狀態為 原狀態
            UPDATE faai_t SET faai023 = l_fabh.fabh003  
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq1 
               #20141229 add by chenying
               AND faai001 = l_fabh.fabh000
               AND faai002 = l_fabh.fabh001
               AND faai003 = l_fabh.fabh002
               #20141229 add by chenying 
                  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
         END FOREACH              
      END IF
      
      #170618-00113#1--add--str--
      #盘盈
      #1.资产状态改为2.折旧中，faah015,faaj038都要更新
      #2.数量、金额，抓取afat512资料还原
      IF l_fabg.fabg005 = '23'  THEN
         SELECT glaa014 INTO l_glaa014 FROM glaa_t 
          WHERE glaaent=g_enterprise AND glaald=l_fabh.fabhld
         IF l_glaa014 ='Y' THEN
            LET l_fabr012 = 0 
            LET l_fabr040 = 0
            LET l_fabr041 = 0
            LET l_fabr042 = 0
            LET l_fabr043 = 0
            SELECT fabr012,fabr040,fabr041,fabr042,fabr043 
              INTO l_fabr012,l_fabr040,l_fabr041,l_fabr042,l_fabr043
              FROM fabr_t
             WHERE fabrent=g_enterprise AND fabr003=l_fabh.fabh039 AND fabr004=l_fabh.fabh040
            IF SQLCA.SQLCODE THEN
            ELSE   
               UPDATE faah_t SET faah015 = '2',
                                 faah018 = l_fabr012,
                                 faah021 = l_fabr040,
                                 faah022 = l_fabr041,
                                 faah023 = l_fabr042,
                                 faah024 = l_fabr043
                WHERE faahent = g_enterprise
                  AND faah001 = l_fabh.fabh000
                  AND faah003 = l_fabh.fabh001
                  AND faah004 = l_fabh.fabh002
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd faah_t'
                  LET g_errparam.code   = sqlca.sqlcode
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
                  LET r_success = FALSE
               END IF
            END IF
         END IF
      END IF
      #170618-00113#1--add--end
      
      #報廢
      IF l_fabg.fabg005='21' THEN
         #更新資產標籤狀態
         LET g_sql = " SELECT DISTINCT fabiseq1 ",
                      "   FROM fabi_t ",
                      "  WHERE fabient = ",g_enterprise," AND fabidocno  = '",l_fabh.fabhdocno,"'",
                      "    AND fabi000 = '", l_fabg.fabg005 ,"'",
                      "    AND fabi001 = '", l_fabh.fabh000 ,"'",
                      "    AND fabi002 = '", l_fabh.fabh001 ,"'",
                      "    AND fabi003 = '", l_fabh.fabh002 ,"'"
         PREPARE s_voucher_fabi_pr4 FROM g_sql
         DECLARE s_voucher_fabi_cs4 CURSOR FOR s_voucher_fabi_pr4
         FOREACH s_voucher_fabi_cs4 INTO l_fabiseq1
            IF SQLCA.sqlcode THEN
#               CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'foreach:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE         
               EXIT FOREACH
            END IF
            
            #報廢未結束更新狀態為 原狀態
            UPDATE faai_t SET faai023 = l_fabh.fabh003  
             WHERE faaient = g_enterprise
               AND faaiseq = l_fabiseq1 
               #20141229 add by chenying
               AND faai001 = l_fabh.fabh000
               AND faai002 = l_fabh.fabh001
               AND faai003 = l_fabh.fabh002
               #20141229 add by chenying  
            IF SQLCA.SQLCODE THEN
#               CALL cl_errmsg('upd faai_t','','',SQLCA.SQLCODE,1) #cymod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd faai_t'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               LET r_success = FALSE
            END IF
         END FOREACH              
      END IF
      
   END FOREACH
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_afat503_ins_faah(p_fabhdocno,p_fabhld,p_fabhseq)
#                 
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_ins_faah(p_fabhdocno,p_fabhld,p_fabhseq)
#161128-00061#6---modify--begin--------------------
#DEFINE l_faah RECORD LIKE faah_t.*
#DEFINE l_faaj RECORD LIKE faaj_t.*
#DEFINE l_faai RECORD LIKE faai_t.*
#DEFINE l_fabh RECORD LIKE fabh_t.*
#DEFINE l_fabi RECORD LIKE fabi_t.*
#DEFINE l_fabr RECORD LIKE fabr_t.*  #160329-00025#1
DEFINE l_faaj RECORD  #固定資產帳套折舊資訊資料檔
       faajent LIKE faaj_t.faajent, #企業編碼
       faajld LIKE faaj_t.faajld, #帳套別編碼
       faajsite LIKE faaj_t.faajsite, #營運據點
       faaj000 LIKE faaj_t.faaj000, #批號
       faaj001 LIKE faaj_t.faaj001, #財產編號
       faaj002 LIKE faaj_t.faaj002, #附號
       faaj003 LIKE faaj_t.faaj003, #折舊方式
       faaj004 LIKE faaj_t.faaj004, #耐用年限(月數)
       faaj005 LIKE faaj_t.faaj005, #未使用年限(月數)
       faaj006 LIKE faaj_t.faaj006, #分攤方式
       faaj007 LIKE faaj_t.faaj007, #分攤類別
       faaj008 LIKE faaj_t.faaj008, #開始折舊年月
       faaj009 LIKE faaj_t.faaj009, #最近折舊年度
       faaj010 LIKE faaj_t.faaj010, #最近折舊期別
       faaj011 LIKE faaj_t.faaj011, #折畢再提
       faaj012 LIKE faaj_t.faaj012, #折畢再提預留殘值
       faaj013 LIKE faaj_t.faaj013, #折畢再提預留年月（數）
       faaj014 LIKE faaj_t.faaj014, #幣別
       faaj015 LIKE faaj_t.faaj015, #匯率
       faaj016 LIKE faaj_t.faaj016, #成本
       faaj017 LIKE faaj_t.faaj017, #累折
       faaj018 LIKE faaj_t.faaj018, #本期累折
       faaj019 LIKE faaj_t.faaj019, #預留殘值
       faaj020 LIKE faaj_t.faaj020, #調整成本
       faaj021 LIKE faaj_t.faaj021, #已提列減值準備
       faaj022 LIKE faaj_t.faaj022, #年折舊額
       faaj023 LIKE faaj_t.faaj023, #資產科目
       faaj024 LIKE faaj_t.faaj024, #累折科目
       faaj025 LIKE faaj_t.faaj025, #折舊科目
       faaj026 LIKE faaj_t.faaj026, #減值準備科目
       faaj027 LIKE faaj_t.faaj027, #銷帳減值準備
       faaj028 LIKE faaj_t.faaj028, #未折減額
       faaj029 LIKE faaj_t.faaj029, #第一個月未折減額
       faaj030 LIKE faaj_t.faaj030, #帳款編號
       faaj031 LIKE faaj_t.faaj031, #帳款編號項次
       faaj032 LIKE faaj_t.faaj032, #本期處置累折
       faaj033 LIKE faaj_t.faaj033, #處置數量
       faaj034 LIKE faaj_t.faaj034, #處置成本
       faaj035 LIKE faaj_t.faaj035, #處置累折
       faaj036 LIKE faaj_t.faaj036, #交易價格差異
       faaj037 LIKE faaj_t.faaj037, #卡片編號
       faaj038 LIKE faaj_t.faaj038, #資產狀態
       faaj039 LIKE faaj_t.faaj039, #部門
       faaj040 LIKE faaj_t.faaj040, #利潤/成本中心
       faaj041 LIKE faaj_t.faaj041, #區域
       faaj042 LIKE faaj_t.faaj042, #交易客商
       faaj043 LIKE faaj_t.faaj043, #帳款客商
       faaj044 LIKE faaj_t.faaj044, #客群
       faaj045 LIKE faaj_t.faaj045, #專案編號
       faaj046 LIKE faaj_t.faaj046, #WBS
       faaj047 LIKE faaj_t.faaj047, #人員
       faaj101 LIKE faaj_t.faaj101, #本位幣二幣別
       faaj102 LIKE faaj_t.faaj102, #本位幣二匯率
       faaj103 LIKE faaj_t.faaj103, #本位幣二成本
       faaj104 LIKE faaj_t.faaj104, #本位幣二累折
       faaj105 LIKE faaj_t.faaj105, #本位幣二預留殘值
       faaj106 LIKE faaj_t.faaj106, #本位幣二折畢再提預留殘值
       faaj107 LIKE faaj_t.faaj107, #本位幣二年折舊額
       faaj108 LIKE faaj_t.faaj108, #本位幣二未折減額
       faaj109 LIKE faaj_t.faaj109, #本位幣二第一月未折減額
       faaj110 LIKE faaj_t.faaj110, #本位幣二處置減值準備
       faaj111 LIKE faaj_t.faaj111, #本位幣二本年累折
       faaj112 LIKE faaj_t.faaj112, #本位幣二已提列減值準備
       faaj113 LIKE faaj_t.faaj113, #本位幣二處置成本
       faaj114 LIKE faaj_t.faaj114, #本位幣二處置累折
       faaj115 LIKE faaj_t.faaj115, #本位幣二本期處置累折
       faaj116 LIKE faaj_t.faaj116, #本位幣二交易價格差異
       faaj117 LIKE faaj_t.faaj117, #本位幣二調整成本
       faaj151 LIKE faaj_t.faaj151, #本位幣三幣別
       faaj152 LIKE faaj_t.faaj152, #本位幣三匯率
       faaj153 LIKE faaj_t.faaj153, #本位幣三成本
       faaj154 LIKE faaj_t.faaj154, #本位幣三累折
       faaj155 LIKE faaj_t.faaj155, #本位幣三預留殘值
       faaj156 LIKE faaj_t.faaj156, #本位幣三折畢再提預留殘值
       faaj157 LIKE faaj_t.faaj157, #本位幣三年折舊額
       faaj158 LIKE faaj_t.faaj158, #本位幣三未折減額
       faaj159 LIKE faaj_t.faaj159, #本位幣三第一月未折減額
       faaj160 LIKE faaj_t.faaj160, #本位幣三處置減值準備
       faaj161 LIKE faaj_t.faaj161, #本位幣三本年累折
       faaj162 LIKE faaj_t.faaj162, #本位幣三已提列減值準備
       faaj163 LIKE faaj_t.faaj163, #本位幣三處置成本
       faaj164 LIKE faaj_t.faaj164, #本位幣三處置累折
       faaj165 LIKE faaj_t.faaj165, #本位幣三本期處置累折
       faaj166 LIKE faaj_t.faaj166, #本位幣三交易價格差異
       faaj167 LIKE faaj_t.faaj167, #本位幣三調整成本
       faajownid LIKE faaj_t.faajownid, #資料所有者
       faajowndp LIKE faaj_t.faajowndp, #資料所屬部門
       faajcrtid LIKE faaj_t.faajcrtid, #資料建立者
       faajcrtdp LIKE faaj_t.faajcrtdp, #資料建立部門
       faajcrtdt LIKE faaj_t.faajcrtdt, #資料創建日
       faajmodid LIKE faaj_t.faajmodid, #資料修改者
       faajmoddt LIKE faaj_t.faajmoddt, #最近修改日
       faajstus LIKE faaj_t.faajstus, #狀態碼
       faaj048 LIKE faaj_t.faaj048  #列帳/列管
       END RECORD
   DEFINE l_faah RECORD  #固定資產基礎資料檔
       faahent LIKE faah_t.faahent, #企業編號
       faah000 LIKE faah_t.faah000, #產生批號
       faah001 LIKE faah_t.faah001, #卡片編號
       faah002 LIKE faah_t.faah002, #型態
       faah003 LIKE faah_t.faah003, #財產編號
       faah004 LIKE faah_t.faah004, #附號
       faah005 LIKE faah_t.faah005, #資產性質
       faah006 LIKE faah_t.faah006, #資產主要類型
       faah007 LIKE faah_t.faah007, #資產次要類型
       faah008 LIKE faah_t.faah008, #資產組
       faah009 LIKE faah_t.faah009, #供應供應商
       faah010 LIKE faah_t.faah010, #製造供應商
       faah011 LIKE faah_t.faah011, #產地
       faah012 LIKE faah_t.faah012, #名稱
       faah013 LIKE faah_t.faah013, #規格型號
       faah014 LIKE faah_t.faah014, #取得日期
       faah015 LIKE faah_t.faah015, #資產狀態
       faah016 LIKE faah_t.faah016, #取得方式
       faah017 LIKE faah_t.faah017, #單位
       faah018 LIKE faah_t.faah018, #數量
       faah019 LIKE faah_t.faah019, #在外數量
       faah020 LIKE faah_t.faah020, #幣別
       faah021 LIKE faah_t.faah021, #原幣單價
       faah022 LIKE faah_t.faah022, #原幣金額
       faah023 LIKE faah_t.faah023, #本幣單價
       faah024 LIKE faah_t.faah024, #本幣金額
       faah025 LIKE faah_t.faah025, #保管人員
       faah026 LIKE faah_t.faah026, #保管部門
       faah027 LIKE faah_t.faah027, #存放位置
       faah028 LIKE faah_t.faah028, #存放組織
       faah029 LIKE faah_t.faah029, #負責人員
       faah030 LIKE faah_t.faah030, #管理組織
       faah031 LIKE faah_t.faah031, #核算組織
       faah032 LIKE faah_t.faah032, #歸屬法人
       faah033 LIKE faah_t.faah033, #直接資本化
       faah034 LIKE faah_t.faah034, #保稅
       faah035 LIKE faah_t.faah035, #保險
       faah036 LIKE faah_t.faah036, #免稅
       faah037 LIKE faah_t.faah037, #抵押
       faah038 LIKE faah_t.faah038, #採購單號
       faah039 LIKE faah_t.faah039, #收貨單號
       faah040 LIKE faah_t.faah040, #帳款單號
       faah041 LIKE faah_t.faah041, #來源營運中心
       faah042 LIKE faah_t.faah042, #資產屬性
       faah043 LIKE faah_t.faah043, #預計總工作量
       faah044 LIKE faah_t.faah044, #已使用工作量
       faah045 LIKE faah_t.faah045, #帳款編號項次
       faahownid LIKE faah_t.faahownid, #資料所有者
       faahowndp LIKE faah_t.faahowndp, #資料所屬部門
       faahcrtid LIKE faah_t.faahcrtid, #資料建立者
       faahcrtdp LIKE faah_t.faahcrtdp, #資料建立部門
       faahcrtdt LIKE faah_t.faahcrtdt, #資料創建日
       faahmodid LIKE faah_t.faahmodid, #資料修改者
       faahmoddt LIKE faah_t.faahmoddt, #最近修改日
       faahstus LIKE faah_t.faahstus, #狀態碼
       faah046 LIKE faah_t.faah046, #備註
       faah047 LIKE faah_t.faah047, #保稅機器擷取否
       faah048 LIKE faah_t.faah048, #投資抵減狀態
       faah049 LIKE faah_t.faah049, #投資抵減合併碼
       faah050 LIKE faah_t.faah050, #抵減率
       faah051 LIKE faah_t.faah051, #投資抵減用途
       faah052 LIKE faah_t.faah052, #抵減金額
       faah053 LIKE faah_t.faah053, #已抵減金額
       faah054 LIKE faah_t.faah054, #投資抵減否
       faah055 LIKE faah_t.faah055, #投資抵減年限
       faah056 LIKE faah_t.faah056  #免稅狀態
       END RECORD

DEFINE l_faai RECORD  #固定資產標籤檔
       faaient LIKE faai_t.faaient, #企業編號
       faai000 LIKE faai_t.faai000, #產生批號
       faai001 LIKE faai_t.faai001, #卡片編號
       faai002 LIKE faai_t.faai002, #財產編號
       faai003 LIKE faai_t.faai003, #附號
       faaiseq LIKE faai_t.faaiseq, #項次
       faai004 LIKE faai_t.faai004, #財簽條碼
       faai005 LIKE faai_t.faai005, #S/N號碼
       faai006 LIKE faai_t.faai006, #單位
       faai007 LIKE faai_t.faai007, #數量
       faai008 LIKE faai_t.faai008, #在外數量
       faai009 LIKE faai_t.faai009, #供應供應商
       faai010 LIKE faai_t.faai010, #製造供應商
       faai011 LIKE faai_t.faai011, #產地
       faai012 LIKE faai_t.faai012, #名稱
       faai013 LIKE faai_t.faai013, #規格型號
       faai014 LIKE faai_t.faai014, #取得日期
       faai015 LIKE faai_t.faai015, #保管人員
       faai016 LIKE faai_t.faai016, #保管部門
       faai017 LIKE faai_t.faai017, #存放位置
       faai018 LIKE faai_t.faai018, #存放組織
       faai019 LIKE faai_t.faai019, #負責人員
       faai020 LIKE faai_t.faai020, #管理組織
       faai021 LIKE faai_t.faai021, #核算組織
       faai022 LIKE faai_t.faai022, #歸屬法人
       faai023 LIKE faai_t.faai023  #標籤狀態
       END RECORD
DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076  #主要類別新
       END RECORD

DEFINE l_fabi RECORD  #固定資產異動標籤檔
       fabient LIKE fabi_t.fabient, #企業編號
       fabild LIKE fabi_t.fabild, #帳套
       fabicomp LIKE fabi_t.fabicomp, #法人
       fabisite LIKE fabi_t.fabisite, #資產中心
       fabidocno LIKE fabi_t.fabidocno, #單據編號
       fabiseq LIKE fabi_t.fabiseq, #項次
       fabiseq1 LIKE fabi_t.fabiseq1, #項次1
       fabi000 LIKE fabi_t.fabi000, #單據性質
       fabi001 LIKE fabi_t.fabi001, #卡片編號
       fabi002 LIKE fabi_t.fabi002, #財產編號
       fabi003 LIKE fabi_t.fabi003, #附號
       fabi004 LIKE fabi_t.fabi004, #標籤條碼
       fabi005 LIKE fabi_t.fabi005, #S/N號碼
       fabi006 LIKE fabi_t.fabi006, #單位
       fabi007 LIKE fabi_t.fabi007, #數量
       fabi008 LIKE fabi_t.fabi008, #在外數量
       fabi009 LIKE fabi_t.fabi009, #供應供應商
       fabi010 LIKE fabi_t.fabi010, #製造供應商
       fabi011 LIKE fabi_t.fabi011, #產地
       fabi012 LIKE fabi_t.fabi012, #名稱
       fabi013 LIKE fabi_t.fabi013, #規格型號
       fabi014 LIKE fabi_t.fabi014, #取得時間
       fabi015 LIKE fabi_t.fabi015, #保管人員
       fabi016 LIKE fabi_t.fabi016, #保管部門
       fabi017 LIKE fabi_t.fabi017, #存放位置
       fabi018 LIKE fabi_t.fabi018, #存放組織
       fabi019 LIKE fabi_t.fabi019, #負責人員
       fabi020 LIKE fabi_t.fabi020, #管理組織
       fabi021 LIKE fabi_t.fabi021, #核算組織
       fabi022 LIKE fabi_t.fabi022, #附屬法人
       fabiownid LIKE fabi_t.fabiownid, #資料所有者
       fabiowndp LIKE fabi_t.fabiowndp, #資料所屬部門
       fabicrtid LIKE fabi_t.fabicrtid, #資料建立者
       fabicrtdp LIKE fabi_t.fabicrtdp, #資料建立部門
       fabicrtdt LIKE fabi_t.fabicrtdt, #資料創建日
       fabimodid LIKE fabi_t.fabimodid, #資料修改者
       fabimoddt LIKE fabi_t.fabimoddt, #最近修改日
       fabicnfid LIKE fabi_t.fabicnfid, #資料確認者
       fabicnfdt LIKE fabi_t.fabicnfdt, #資料確認日
       fabipstid LIKE fabi_t.fabipstid, #資料過帳者
       fabipstdt LIKE fabi_t.fabipstdt, #資料過帳日
       fabistus LIKE fabi_t.fabistus    #狀態碼
       END RECORD
DEFINE l_fabr RECORD  #固定資產盤點資料檔
       fabrent LIKE fabr_t.fabrent, #企業編號
       fabrcomp LIKE fabr_t.fabrcomp, #法人
       fabr001 LIKE fabr_t.fabr001, #資產中心
       fabr002 LIKE fabr_t.fabr002, #財務人員
       fabr003 LIKE fabr_t.fabr003, #盤點編號
       fabr004 LIKE fabr_t.fabr004, #盤點序號
       fabr005 LIKE fabr_t.fabr005, #財產編號
       fabr006 LIKE fabr_t.fabr006, #附號
       fabr007 LIKE fabr_t.fabr007, #卡片編號
       fabr008 LIKE fabr_t.fabr008, #資產性質
       fabr009 LIKE fabr_t.fabr009, #資產狀態
       fabr010 LIKE fabr_t.fabr010, #資產組
       fabr011 LIKE fabr_t.fabr011, #單位
       fabr012 LIKE fabr_t.fabr012, #數量
       fabr013 LIKE fabr_t.fabr013, #在外數量
       fabr014 LIKE fabr_t.fabr014, #保管部門
       fabr015 LIKE fabr_t.fabr015, #保管人員
       fabr016 LIKE fabr_t.fabr016, #存放位置
       fabr017 LIKE fabr_t.fabr017, #負責人員
       fabr018 LIKE fabr_t.fabr018, #管理組織
       fabr019 LIKE fabr_t.fabr019, #所有組織
       fabr020 LIKE fabr_t.fabr020, #核算組織
       fabr021 LIKE fabr_t.fabr021, #歸屬法人
       fabr022 LIKE fabr_t.fabr022, #單位
       fabr023 LIKE fabr_t.fabr023, #數量
       fabr024 LIKE fabr_t.fabr024, #實際保管部門
       fabr025 LIKE fabr_t.fabr025, #實際保管人員
       fabr026 LIKE fabr_t.fabr026, #實際存放位置
       fabr027 LIKE fabr_t.fabr027, #實際管理組織
       fabr028 LIKE fabr_t.fabr028, #實際所有組織
       fabr029 LIKE fabr_t.fabr029, #實際核算組織
       fabr030 LIKE fabr_t.fabr030, #實際歸屬法人
       fabr031 LIKE fabr_t.fabr031, #盤點日期
       fabr032 LIKE fabr_t.fabr032, #盤點人員
       fabr033 LIKE fabr_t.fabr033, #產生日期
       fabr034 LIKE fabr_t.fabr034, #產生人員
       fabr035 LIKE fabr_t.fabr035, #過帳碼
       fabrownid LIKE fabr_t.fabrownid, #資料所有者
       fabrowndp LIKE fabr_t.fabrowndp, #資料所屬部門
       fabrcrtid LIKE fabr_t.fabrcrtid, #資料建立者
       fabrcrtdp LIKE fabr_t.fabrcrtdp, #資料建立部門
       fabrcrtdt LIKE fabr_t.fabrcrtdt, #資料創建日
       fabrmodid LIKE fabr_t.fabrmodid, #資料修改者
       fabrmoddt LIKE fabr_t.fabrmoddt, #最近修改日
       fabrcnfid LIKE fabr_t.fabrcnfid, #資料確認者
       fabrcnfdt LIKE fabr_t.fabrcnfdt, #資料確認日
       fabrpstid LIKE fabr_t.fabrpstid, #資料過帳者
       fabrpstdt LIKE fabr_t.fabrpstdt, #資料過帳日
       fabrstus LIKE fabr_t.fabrstus, #狀態碼
       fabr036 LIKE fabr_t.fabr036, #實際負責人員
       fabr037 LIKE fabr_t.fabr037, #資產主要類型
       fabr038 LIKE fabr_t.fabr038, #資產次要類型
       fabr039 LIKE fabr_t.fabr039, #幣別
       fabr040 LIKE fabr_t.fabr040, #原幣單價
       fabr041 LIKE fabr_t.fabr041, #原幣金額
       fabr042 LIKE fabr_t.fabr042, #本幣單價
       fabr043 LIKE fabr_t.fabr043, #本幣金額
       fabr044 LIKE fabr_t.fabr044, #列帳/列管
       fabr045 LIKE fabr_t.fabr045, #名稱
       fabr046 LIKE fabr_t.fabr046, #規格型號
       fabr047 LIKE fabr_t.fabr047  #原因碼
       END RECORD

#161128-00061#6---modify--end--------------------
DEFINE p_fabhdocno LIKE fabh_t.fabhdocno
DEFINE p_fabhld LIKE fabh_t.fabhld
DEFINE p_fabhseq LIKE fabh_t.fabhseq
DEFINE l_ooag004 LIKE ooag_t.ooag004
DEFINE l_ooef017 LIKE ooef_t.ooef017
DEFINE l_glaa001 LIKE glaa_t.glaa001
DEFINE l_faaj018 LIKE faaj_t.faaj018
DEFINE l_faaj028 LIKE faaj_t.faaj028
DEFINE l_faaj020 LIKE faaj_t.faaj020
DEFINE l_faah015 LIKE faah_t.faah015
DEFINE l_faaj021 LIKE faaj_t.faaj021
DEFINE l_faaj153 LIKE faaj_t.faaj153
DEFINE l_faaj103 LIKE faaj_t.faaj103
DEFINE l_faaj112 LIKE faaj_t.faaj112
DEFINE l_faaj162 LIKE faaj_t.faaj162
DEFINE l_cnt1    LIKE type_t.num5   #PGS(D)-13132 add
DEFINE l_cnt     LIKE type_t.num5   #PGS(D)-13132 add
        

   INITIALIZE l_faah.* TO NULL
   INITIALIZE l_faaj.* TO NULL
   INITIALIZE l_faai.* TO NULL
    INITIALIZE l_fabi.* TO NULL
   INITIALIZE l_fabh.* TO NULL 
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabh.* 
   SELECT fabhent,fabhld,fabhsite,fabhdocno,fabhseq,fabh000,fabh001,fabh002,fabh003,fabh004,fabh005,
          fabh006,fabh007,fabh008,fabh009,fabh010,fabh011,fabh012,fabh013,fabh014,fabh015,fabh016,
          fabh017,fabh018,fabh019,fabh020,fabh021,fabh022,fabh023,fabh024,fabh025,fabh026,fabh027,
          fabh028,fabh029,fabh030,fabh031,fabh032,fabh033,fabh034,fabh035,fabh036,fabh037,fabh038,
          fabh039,fabh040,fabh041,fabh042,fabh043,fabh060,fabh061,fabh062,fabh063,fabh064,fabh065,
          fabh066,fabh067,fabh068,fabh069,fabh100,fabh101,fabh102,fabh103,fabh104,fabh105,fabh106,
          fabh107,fabh108,fabh109,fabh110,fabh150,fabh151,fabh152,fabh153,fabh154,fabh155,fabh156,
          fabh157,fabh158,fabh159,fabh160,fabh070,fabh071,fabh072,fabh073,fabh111,fabh161,fabh074,
          fabh075,fabh076 INTO l_fabh.* 
   #161128-00061#6---modify--end--------------------
   FROM fabh_t WHERE fabhent = g_enterprise AND fabhdocno = p_fabhdocno
                 AND fabhld = p_fabhld AND fabhseq = p_fabhseq
                                         
    
    SELECT ooag004 INTO l_ooag004
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_user

   SELECT ooef017 INTO l_ooef017
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = l_ooag004

   SELECT glaa001
     INTO l_glaa001
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = l_fabh.fabhld
      AND glaa014 = 'Y'
      
   LET l_faah.faahownid = g_user
   LET l_faah.faahowndp = g_dept
   LET l_faah.faahcrtid = g_user
   LET l_faah.faahcrtdp = g_dept
   LET l_faah.faahcrtdt = cl_get_current()
   LET l_faah.faahmodid = ""
   LET l_faah.faahmoddt = ""
   LET l_faah.faahstus = "N"
   LET l_faah.faah002 = "1"
   LET l_faah.faah005 = "1"
   LET l_faah.faahstus = "N"
#   LET l_faah.faah015 = l_fabh.fabh003   #資產狀態  #160329-00025#1
   LET l_faah.faah016 = "2"               #取得方式
   LET l_faah.faah042 = "1"
   LET l_faah.faah018 = "0"
   LET l_faah.faah019 = "0"
   LET l_faah.faah021 = "0"
   LET l_faah.faah022 = "0"
   LET l_faah.faah023 = "0"
   LET l_faah.faah024 = "0"
   LET l_faah.faah033 = "Y"
   LET l_faah.faah043 = "0"
   LET l_faah.faah044 = "0"
   LET l_faah.faah000 = ' '
   LET l_faah.faah014 = g_today
   LET l_faah.faah020 = l_glaa001
   LET l_faah.faah025 = g_user
   LET l_faah.faah028 = g_site
   LET l_faah.faah029 = g_user
   LET l_faah.faah030 = g_site
   LET l_faah.faah031 = g_site
   LET l_faah.faah032 = l_ooef017
   LET l_faah.faah041 = g_site
   SELECT ooag003 INTO l_faah.faah026
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = l_faah.faah025
         
   LET l_faah.faah001 = l_fabh.fabh000   #卡片編號
   LET l_faah.faah003 = l_fabh.fabh001   #財產編號
   LET l_faah.faah004 = l_fabh.fabh002   #附號  
   IF cl_null(l_faah.faah004) THEN LET l_faah.faah004 = ' ' END IF
   LET l_faah.faah017 = l_fabh.fabh005   #單位
#   LET l_faah.faah018 = l_fabh.fabh006   #數量 #160329-00025#1 mark
   LET l_faah.faah018 = l_fabh.fabh007          #160329-00025#1 add 
   LET l_faah.faah021 = 0
   LET l_faah.faah022 = 0
   LET l_faah.faah023 = 0
   LET l_faah.faah024 = 0
   SELECT fabr008,fabr009,fabr013,fabr025,fabr024,fabr026,fabr028,fabr036,fabr027,fabr029,fabr030,fabr010,
          fabr037,fabr038,fabr039,fabr040,fabr041,fabr042,fabr043  #160329-00025#1   
     INTO l_faah.faah005,l_faah.faah042,l_faah.faah019,l_faah.faah025,l_faah.faah026,l_faah.faah027,l_faah.faah028,
          l_faah.faah029,l_faah.faah030,l_faah.faah031,l_faah.faah032,l_faah.faah008,
          l_faah.faah006,l_faah.faah007,l_faah.faah020,l_faah.faah021,l_faah.faah022,l_faah.faah023,l_faah.faah024  #160329-00025#1           
     FROM fabr_t WHERE fabrent = g_enterprise AND fabr003 = l_fabh.fabh039 AND fabr004 = l_fabh.fabh040  #在外數量
   

   
   LET l_faah.faah015 = "9" #160329-00025#1 9：盘盈
   
   #PGS(D)-13132 add -S-
   SELECT COUNT(1) INTO l_cnt1 FROM faah_t WHERE faahent = g_enterprise AND faah000 = l_faah.faah000 
      AND faah001 = l_faah.faah001 AND faah003 = l_faah.faah003 AND faah004 = l_faah.faah004
   IF l_cnt1 = 0 THEN
   #PGS(D)-13132 add -E-
      INSERT INTO faah_t (faahent,faah001,faah002,faah000,faah003,faah004,faah006,faah007,faah005,
                      faah008,faahstus,faah014,faah015,faah016,faah042,faah017,faah018,faah019,faah020,
                      faah021,faah022,faah023,faah024,faah025,faah026,faah027,faah028,faah029,faah030,faah031,
                      faah032,faah033,faah009,faah010,faah011,faah012,faah013,faah034,faah035,faah036,faah037,
                      faah043,faah044,faah041,faah038,faah039,faah040,faahownid,faahowndp,faahcrtid,faahcrtdp,
                      faahcrtdt)
                  VALUES (g_enterprise,l_faah.faah001,l_faah.faah002,l_faah.faah000,l_faah.faah003,
                      l_faah.faah004,l_faah.faah006,l_faah.faah007,l_faah.faah005,l_faah.faah008,
                      l_faah.faahstus,l_faah.faah014,l_faah.faah015,l_faah.faah016,l_faah.faah042,
                      l_faah.faah017,l_faah.faah018,l_faah.faah019,l_faah.faah020,l_faah.faah021,
                      l_faah.faah022,l_faah.faah023,l_faah.faah024,l_faah.faah025,l_faah.faah026,
                      l_faah.faah027,l_faah.faah028,l_faah.faah029,l_faah.faah030,l_faah.faah031,
                      l_faah.faah032,l_faah.faah033,l_faah.faah009,l_faah.faah010,l_faah.faah011,
                      l_faah.faah012,l_faah.faah013,l_faah.faah034,l_faah.faah035,l_faah.faah036,
                      l_faah.faah037,l_faah.faah043,l_faah.faah044,l_faah.faah041,l_faah.faah038,
                      l_faah.faah039,l_faah.faah040,l_faah.faahownid,l_faah.faahowndp,l_faah.faahcrtid,
                      l_faah.faahcrtdp,l_faah.faahcrtdt)
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
                      
                      
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "g_faah_m"
          LET g_errparam.code   = SQLCA.sqlcode
          LET g_errparam.popup  = TRUE
          CALL cl_err()    
          RETURN
          LET l_faaj.faajld = l_fabh.fabhld  #帳套
          LET l_faaj.faaj000 = l_faah.faah000
          
          IF cl_null(l_faaj.faaj000)  THEN LET l_faaj.faaj000 = ' ' END IF
          LET l_faaj.faaj001 = l_faah.faah003
          LET l_faaj.faaj002 = l_faah.faah004
          LET l_faaj.faaj005 = l_fabh.fabh013
          SELECT glaa001 INTO l_faaj.faaj014 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = l_fabh.fabhld   #幣別
     
     
     
     
          
          
          IF cl_null(l_faaj.faaj002)  THEN LET l_faaj.faaj002 = ' ' END IF
          LET l_faaj.faaj037 = l_faah.faah001
          LET l_faaj.faajsite = l_faah.faah028
          LET l_faaj.faaj011 = 'Y'
          LET l_faaj.faaj042 = l_faah.faah009
          LET l_faaj.faaj038 = l_faah.faah015
          LET l_faaj.faaj016 = 0
          LET l_faaj.faaj017 = 0
          LET l_faaj.faaj018 = 0
          LET l_faaj.faaj019 = 0
          LET l_faaj.faaj020 = 0
          LET l_faaj.faaj022 = 0
          LET l_faaj.faaj033 = 0
          LET l_faaj.faaj034 = 0
          LET l_faaj.faaj035 = 0
          LET l_faaj.faaj032 = 0
          LET l_faaj.faaj027 = 0
          LET l_faaj.faaj021 = 0
          LET l_faaj.faaj028 = 0
     
     
          LET l_faaj.faaj103 = 0
          LET l_faaj.faaj104 = 0
          LET l_faaj.faaj111 = 0
          LET l_faaj.faaj105 = 0
          LET l_faaj.faaj117 = 0
          LET l_faaj.faaj107 = 0
          LET l_faaj.faaj108 = 0
          LET l_faaj.faaj113 = 0
          LET l_faaj.faaj114 = 0
          LET l_faaj.faaj115 = 0
          LET l_faaj.faaj110 = 0
          LET l_faaj.faaj112 = 0
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
          LET l_faaj.faaj153 = 0
          LET l_faaj.faaj154 = 0
          LET l_faaj.faaj161 = 0
          LET l_faaj.faaj155 = 0
          LET l_faaj.faaj167 = 0
          LET l_faaj.faaj157 = 0
          LET l_faaj.faaj158 = 0
          LET l_faaj.faaj163 = 0
          LET l_faaj.faaj164 = 0
          LET l_faaj.faaj165 = 0
          LET l_faaj.faaj160 = 0
          LET l_faaj.faaj162 = 0
          LET l_faaj.faaj016 = l_fabh.fabh008
          LET l_faaj.faaj028 = l_fabh.fabh004
          LET l_faaj.faaj017 = l_fabh.fabh011
          LET l_faaj.faaj005 = l_fabh.fabh013
          LET l_faaj.faaj019 = l_fabh.fabh015
          LET l_faaj.faaj003 = '6'
          LET l_faaj.faaj012 = l_fabh.fabh013
          LET l_faaj.faaj013 = l_fabh.fabh015
          LET l_faaj.faaj023 = l_fabh.fabh024
          LET l_faaj.faaj024 = l_fabh.fabh023
          LET l_faaj.faaj103 = l_fabh.fabh102
          LET l_faaj.faaj104 = l_fabh.fabh104
          LET l_faaj.faaj105 = l_fabh.fabh106
          LET l_faaj.faaj153 = l_fabh.fabh152
          LET l_faaj.faaj154 = l_fabh.fabh154
          LET l_faaj.faaj155 = l_fabh.fabh156       
          #本期累折=本期累折+重估累計折舊-累折
          IF cl_null(l_fabh.fabh011) THEN LET l_fabh.fabh011=0 END IF
          IF cl_null(l_fabh.fabh012) THEN LET l_fabh.fabh012=0 END IF
          LET l_faaj018=l_fabh.fabh012-l_fabh.fabh011  #重估累計折舊-累折
     
            #未折減額=(本币成本+调整成本-累计折旧)-处置成本+处置累折
            IF cl_null(l_fabh.fabh008) THEN LET l_fabh.fabh008=0 END IF
            IF l_fabh.fabh018='1' THEN #調增
             LET l_faaj020=l_fabh.fabh010
             LET l_faaj103=l_fabh.fabh103
             LET l_faaj153=l_fabh.fabh153
             LET l_faaj021=l_fabh.fabh019
             LET l_faaj112=l_fabh.fabh109
             LET l_faaj162=l_fabh.fabh159
            ELSE #調減
             LET l_faaj020=l_fabh.fabh010*(-1)
             LET l_faaj103=l_fabh.fabh103*(-1)
             LET l_faaj153=l_fabh.fabh153*(-1)
             LET l_faaj021=l_fabh.fabh019*(-1)
             LET l_faaj112=l_fabh.fabh109*(-1)
             LET l_faaj162=l_fabh.fabh159*(-1)
            END IF   
            LET l_faaj028=l_fabh.fabh008+l_faaj020-l_fabh.fabh012   #(本币成本+调整成本-累计折旧)
     
            ##更新faah_t狀態
            LET l_faah015='9'
          IF l_fabh.fabh003='7' THEN
            LET l_faaj.faaj020 = l_faaj020
            LET l_faaj.faaj012 = l_fabh.fabh016
            LET l_faaj.faaj013 = l_fabh.fabh014
            LET l_faaj.faaj018 = l_faaj018
            LET l_faaj.faaj017 = l_fabh.fabh012
            LET l_faaj.faaj028 = l_faaj028
            LET l_faaj.faaj103 = l_faaj103
            LET l_faaj.faaj104 = l_fabh.fabh105
            LET l_faaj.faaj106 = l_fabh.fabh107
            LET l_faaj.faaj153 = l_faaj153
            LET l_faaj.faaj154 = l_fabh.fabh155
            LET l_faaj.faaj156 = l_fabh.fabh157
            ELSE
             
              LET l_faaj.faaj020 = l_faaj020
              LET l_faaj.faaj005 = l_fabh.fabh014
              LET l_faaj.faaj019 = l_fabh.fabh016
              LET l_faaj.faaj018 = l_faaj018
              LET l_faaj.faaj017 = l_fabh.fabh012
              LET l_faaj.faaj028 = l_faaj028
              LET l_faaj.faaj103 = l_faaj103
              LET l_faaj.faaj104 = l_fabh.fabh105
              LET l_faaj.faaj105 = l_fabh.fabh107
              LET l_faaj.faaj153 = l_faaj153
              LET l_faaj.faaj154 = l_fabh.fabh155
              LET l_faaj.faaj155 = l_fabh.fabh157
     
            END IF
          LET l_faaj.faaj016 =  l_fabh.fabh008  #成本
          LET l_faaj.faaj017 =  l_fabh.fabh011  #累折
          LET l_faaj.faaj018 = 0   #本年累折
          LET l_faaj.faaj019 = l_fabh.fabh015   #預留殘值
          LET l_faaj.faaj020 = l_fabh.fabh010   #調整成本
          #本位幣二
          LET l_faaj.faaj101 = l_fabh.fabh100  #幣別
          LET l_faaj.faaj102 = l_fabh.fabh101 #匯率
          LET l_faaj.faaj103 = l_fabh.fabh102 #成本
          LET l_faaj.faaj104 = l_fabh.fabh104 #累折
          LET l_faaj.faaj111 = 0  #本年累折
          LET l_faaj.faaj105 = l_fabh.fabh106  #預留殘值
          LET l_faaj.faaj117 = l_fabh.fabh103  #調整成本
     
           #本位幣三
          LET l_faaj.faaj151 = l_fabh.fabh150  #幣別
          LET l_faaj.faaj152 = l_fabh.fabh151 #匯率
          LET l_faaj.faaj153 = l_fabh.fabh152 #成本
          LET l_faaj.faaj154 = l_fabh.fabh154 #累折
          LET l_faaj.faaj161 = 0  #
          LET l_faaj.faaj155 = l_fabh.fabh156  #預留殘值
          LET l_faaj.faaj167 = l_fabh.fabh153 #調整成本
          INSERT INTO faaj_t(faajent,faajld ,faaj000,faaj001,
                         faaj002,faaj037,faaj006,faaj007,
                         faaj023,faaj024,faaj025,faaj026,
                         faaj003,faaj004,faaj005,faaj038,
                         faaj008,faaj009,faaj010,faaj014,
                         faaj015,faaj016,faaj017,faaj018,
                         faaj019,faaj020,faaj022,faaj033,
                         faaj034,faaj035,faaj032,faaj027,
                         faaj021,faaj028,faaj011,faaj013,faaj012,
                         faaj106,faaj156,faaj042,faaj043,
                         faaj045,faaj046,faaj030,faajsite,
                         faaj101,faaj102,faaj103,faaj104,
                         faaj111,faaj105,faaj117,faaj107,faaj108,
                         faaj113,faaj114,faaj115,faaj110,
                         faaj112,faaj151,faaj152,faaj153,
                         faaj154,faaj161,faaj155,faaj167,faaj157,
                         faaj158,faaj163,faaj164,faaj165,
                         faaj160,faaj162)
      VALUES (g_enterprise,    l_faaj.faajld ,l_faaj.faaj000,l_faaj.faaj001,
              l_faaj.faaj002,l_faaj.faaj037,l_faaj.faaj006,l_faaj.faaj007,
              l_faaj.faaj023,l_faaj.faaj024,l_faaj.faaj025,l_faaj.faaj026,
              l_faaj.faaj003,l_faaj.faaj004,l_faaj.faaj005,l_faaj.faaj038,
              l_faaj.faaj008,l_faaj.faaj009,l_faaj.faaj010,l_faaj.faaj014,
              l_faaj.faaj015,l_faaj.faaj016,l_faaj.faaj017,l_faaj.faaj018,
              l_faaj.faaj019,l_faaj.faaj020,l_faaj.faaj022,l_faaj.faaj033,
              l_faaj.faaj034,l_faaj.faaj035,l_faaj.faaj032,l_faaj.faaj027,
              l_faaj.faaj021,l_faaj.faaj028,l_faaj.faaj011,l_faaj.faaj013,l_faaj.faaj012,
              l_faaj.faaj106,l_faaj.faaj156,l_faaj.faaj042,l_faaj.faaj043,
              l_faaj.faaj045,l_faaj.faaj046,l_faaj.faaj030,l_faaj.faajsite,
              l_faaj.faaj101,l_faaj.faaj102,l_faaj.faaj103,l_faaj.faaj104,
              l_faaj.faaj111,l_faaj.faaj105,l_faaj.faaj117,l_faaj.faaj107,l_faaj.faaj108,
              l_faaj.faaj113,l_faaj.faaj114,l_faaj.faaj115,l_faaj.faaj110,
              l_faaj.faaj112,l_faaj.faaj151,l_faaj.faaj152,l_faaj.faaj153,
              l_faaj.faaj154,l_faaj.faaj161,l_faaj.faaj155,l_faaj.faaj167,l_faaj.faaj157,
              l_faaj.faaj158,l_faaj.faaj163,l_faaj.faaj164,l_faaj.faaj165,
              l_faaj.faaj160,l_faaj.faaj162)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'INSERT error!'
         LET g_errparam.popup = TRUE
         CALL cl_err()  
         RETURN
       END IF   
     END IF
  END IF #PGS(D)-13132 add 
  #161128-00061#6---modify--begin--------------------
  #DECLARE fabisel_cs CURSOR FOR SELECT * FROM fabi_t WHERE fabient = g_enterprise
  DECLARE fabisel_cs CURSOR FOR SELECT fabient,fabild,fabicomp,fabisite,fabidocno,fabiseq,fabiseq1,fabi000,
                                       fabi001,fabi002,fabi003,fabi004,fabi005,fabi006,fabi007,fabi008,fabi009,
                                       fabi010,fabi011,fabi012,fabi013,fabi014,fabi015,fabi016,fabi017,fabi018,
                                       fabi019,fabi020,fabi021,fabi022,fabiownid,fabiowndp,fabicrtid,fabicrtdp,
                                       fabicrtdt,fabimodid,fabimoddt,fabicnfid,fabicnfdt,fabipstid,fabipstdt,
                                       fabistus FROM fabi_t WHERE fabient = g_enterprise
  #161128-00061#6---modify--end--------------------
                                                      AND fabidocno = l_fabh.fabhdocno
                                                      AND fabiseq = l_fabh.fabhseq
                                                      AND (fabi000 = '23' OR fabi000 = '24')
                                                      ORDER BY fabiseq,fabiseq1
   FOREACH  fabisel_cs INTO l_fabi.*
       LET l_faai.faai000 = ' '
       LET l_faai.faai001 = l_fabi.fabi001   #卡片編號
       LET l_faai.faai002 = l_fabi.fabi002   #財產編號
       LET l_faai.faai003 = l_fabi.fabi003   #附號
       IF cl_null(l_faai.faai003) THEN LET l_faai.faai003 = ' ' END IF
       LET l_faai.faaiseq = l_fabi.fabiseq1    #項次
       LET l_faai.faai004 =  l_fabi.fabi004 #條碼
       LET l_faai.faai005 =  l_fabi.fabi005 #S/N號
       LET l_faai.faai006 =  l_fabi.fabi006 #單位
       LET l_faai.faai007 =  l_fabi.fabi007 #數量
       LET l_faai.faai008 =  l_fabi.fabi008 #在外數量
       LET l_faai.faai009 = l_fabi.fabi009
       LET l_faai.faai010 = l_fabi.fabi010
       LET l_faai.faai011 = l_fabi.fabi011
       LET l_faai.faai012 = l_fabi.fabi012
       LET l_faai.faai013 = l_fabi.fabi013
       LET l_faai.faai014 = g_today
       LET l_faai.faai015 = l_fabi.fabi015 #保管人員
       LET l_faai.faai016 = l_fabi.fabi016 #保管部門
       LET l_faai.faai017 = l_fabi.fabi017 #存放位置
       LET l_faai.faai018 = l_fabi.fabi018 #存放組織
       LET l_faai.faai019 = l_fabi.fabi019 #負責人員
       LET l_faai.faai020 = l_fabi.fabi020 #管理組織
       LET l_faai.faai021 = l_fabi.fabi021 #核算組織
       LET l_faai.faai022 = l_fabi.fabi022 #歸屬法人
       #PGS(D)-13132 add -S-
       SELECT count(1) INTO l_cnt FROM faai_t WHERE faaient = g_enterprise AND faai000 = l_faai.faai000 AND faai001 = l_faai.faai001 
            AND faai002 = l_faai.faai002 AND faai003 = l_faai.faai003 AND faaiseq = l_faai.faaiseq
       IF l_cnt = 0 THEN
       #PGS(D)-13132 add -E-
          INSERT INTO faai_t (faaient,faaiseq,faai000,faai001,faai002,faai003,faai004,faai005,faai006,faai007,
                              faai008,faai009,faai010,faai011,faai012,faai013,faai014,faai015,faai016,faai017,faai018,faai019,
                              faai020,faai021,faai022)VALUES (g_enterprise,l_faai.faaiseq,
                              l_faai.faai000,l_faai.faai001,l_faai.faai002,
                              l_faai.faai003,l_faai.faai004,l_faai.faai005,l_faai.faai006,
                              l_faai.faai007,l_faai.faai008,l_faai.faai009,l_faai.faai010,l_faai.faai011,
                              l_faai.faai012,l_faai.faai013,l_faai.faai014,
                              l_faai.faai015,l_faai.faai016,l_faai.faai017,l_faai.faai018,l_faai.faai019,
                              l_faai.faai020,l_faai.faai021,l_faai.faai022)
          IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "faai_t" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            EXIT FOREACH
         END IF  
      END IF  #PGS(D)-13132 add
   END FOREACH   
END FUNCTION

################################################################################
# Descriptions...: 传票抛转检查
# Memo...........:
# Usage..........: CALL s_afat503_afap280_chk(p_docno,p_glapdocno,p_stus)
#                  RETURNING r_success
# Input parameter: p_docno      单据编号
#                : p_glapdocno  传票号码
#                : p_stus       单据状态
# Return code....: r_success    成功否标识别
#                :  
# Date & Author..: 2014/11/07 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_afap280_chk(p_docno,p_glapdocno,p_stus)
   DEFINE r_success       LIKE type_t.num5
   DEFINE p_docno         LIKE fabg_t.fabgdocno
   DEFINE p_glapdocno     LIKE glap_t.glapdocno   #傳票號碼
   DEFINE p_stus          LIKE fabg_t.fabgstus
   
   LET r_success = TRUE
   
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET  r_success = FALSE
      RETURN r_success
   END IF
   
   #未过账單據不可拋轉
   #IF p_stus <> 'S' THEN                         #201202-00040#1 mark
   IF p_stus <> 'S' AND g_prog <> 'afat509' THEN  #201202-00040#1 add
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = p_docno
      LET g_errparam.code   = "afa-00268" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET  r_success = FALSE
      RETURN r_success
   END IF
   
   IF NOT cl_null(p_glapdocno) THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend =p_docno 
      LET g_errparam.code   = "anm-00198" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET  r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 传票还原检查
# Memo...........:
# Usage..........: CALL s_afat503_afap280_chk(p_docno,p_ld,p_glapdocno)
#                  RETURNING r_success
# Input parameter: p_docno      单据编号
#                : p_glapdocno  传票号码
#                : p_ld         帐套
# Return code....: r_success    成功否标识别
#                :  
# Date & Author..: 2014/11/07 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_afap290_chk(p_docno,p_ld,p_glapdocno)
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE p_docno       LIKE fabg_t.fabgdocno
   DEFINE p_glapdocno   LIKE glap_t.glapdocno   #傳票號碼
   DEFINE p_ld          LIKE fabg_t.fabgld
   
   LET r_success = TRUE 
   
   IF p_docno IS NULL THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_glapdocno) THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = p_docno
      LET g_errparam.code   = "anm-00186" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT COUNT(*) INTO l_cnt FROM glap_t
   WHERE glapent=g_enterprise AND glapld=p_ld 
#   AND glapdocno=p_p_glapdocno AND glapstus <>'N'     #PGS(D)-13656 memo mark
   AND glapdocno=p_glapdocno AND glapstus <>'N'     #PGS(D)-13656 memo add
   IF l_cnt >0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = p_glapdocno
      LET g_errparam.code   = "axr-00076" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 资金中心、帐套预设
# Memo...........:
# Usage..........: CALL s_afat503_default(p_bookno)
#                  RETURNING r_xrca,r_success
# Input parameter: p_tab          表名   
# Return code....:  
#                  r_success      執行成功否 
# Date & Author..: 2014/11/07 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_default(p_bookno)

   DEFINE p_bookno       LIKE glaa_t.glaald
   DEFINE l_sql          STRING
   DEFINE l_success      LIKE type_t.chr1
   #返回值
   DEFINE r_success      LIKE type_t.chr1
   DEFINE p_site         LIKE fabg_t.fabgsite
   DEFINE p_ld           LIKE fabg_t.fabgld
   DEFINE p_comp         LIKE fabg_t.fabgcomp
   
   LET r_success = 'Y'  
   LET p_site = NULL
   LET p_ld = NULL
   LET p_comp = NULL
   
   CALL s_fin_create_account_center_tmp()   #PGS(D)-13656 memo add
   DELETE FROM s_fin_tmp1    #150731-00002 1 程序執行后，第二次帶帳套錯誤
   #抓取組織所屬資產中心
   CALL s_fin_get_account_center('',g_user,'5',g_today) RETURNING g_sub_success,p_site,g_errno
   #根據資產中心重展結構
   CALL s_fin_account_center_sons_query('5',p_site,g_today,'1')  #180730-00011#1 add
   #g_bookno,先做資產中心及g_bookno的勾稽,登入人員帳務人員時,基本上會有該g_bookno的帳務中心權限
   IF NOT cl_null(p_bookno) THEN
      #帳務中心與帳別勾稽
      CALL s_fin_account_center_with_ld_chk(p_site,p_bookno,g_user,'5','N','',g_today) RETURNING g_sub_success,g_errno
   END IF
   
   #該帳務中心與帳別無法勾稽到,以登入人員g_user取得預設帳別/法人
   IF NOT g_sub_success OR cl_null(p_bookno) THEN
      CALL s_fin_ld_carry('',g_user) RETURNING g_sub_success,p_ld,p_comp,g_errno
      CALL s_fin_account_center_with_ld_chk(p_site,p_ld,g_user,'5','N','',g_today) RETURNING g_sub_success,g_errno
   ELSE
      LET p_ld = p_bookno
   END IF
   
   #若取不出資料,則不預設帳別
   IF NOT g_sub_success THEN
      LET p_ld   = ''
      LET p_comp = ''
   END IF 

   #用帳務中心取得帳別與法人
   IF cl_null(p_ld) THEN
      CALL s_fin_orga_get_comp_ld(p_site) RETURNING g_sub_success,g_errno,p_comp,p_ld
      CALL s_fin_account_center_with_ld_chk(p_site,p_ld,g_user,'5','N','',g_today) RETURNING g_sub_success,g_errno
   END IF
   
   #若取不出資料,則不預設帳別
   IF NOT g_sub_success THEN
      LET p_ld   = ''
      LET p_comp = ''
   END IF 
   
   RETURN r_success,p_site,p_ld,p_comp
END FUNCTION

################################################################################
# Descriptions...: 单据日期对应的年度期别检查
# Memo...........:
# Usage..........: CALL s_afat503_sys_chk(p_ld,p_site,p_date)
#                  RETURNING TRUE/FALSE
# Input parameter: P_ld           账套
#                : p_site         资产中心
#                : p_date         日期
# Return code....: TRUE/FALSE
#                : 无
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#55  By 09505
################################################################################
PUBLIC FUNCTION s_afat503_sys_chk(p_ld,p_site,p_date)
DEFINE p_ld   LIKE fabg_t.fabgld   #帳套
DEFINE p_site LIKE fabg_t.fabgsite #資產中心
DEFINE p_date LIKE type_t.dat
DEFINE l_site LIKE fabg_t.fabgsite 
DEFINE l_month LIKE type_t.num5
DEFINE l_year  LIKE type_t.num5
DEFINE l_sql   STRING
DEFINE l_ooab002 LIKE ooab_t.ooab002
DEFINE r_date LIKE type_t.dat #aoos020设置的现行年月

  LET l_site = p_site 
  
  #如果有帳套 檢查帳套歸屬法人的參數設定優先
  IF NOT cl_null(p_ld) THEN
    SELECT glaacomp INTO l_site FROM glaa_t
     WHERE glaaent = g_enterprise AND glaald = p_ld
  END IF
   
  SELECT ooab002 INTO l_ooab002 FROM ooab_t
   WHERE ooab001 = 'S-FIN-9018'  AND ooabent = g_enterprise AND ooabsite = l_site

  IF STATUS = 100 OR cl_null(l_ooab002) THEN
     INITIALIZE g_errparam TO NULL
     LET g_errparam.code = 'afa-00298'
     LET g_errparam.replace[1] = l_site
     LET g_errparam.popup = TRUE
     CALL cl_err()
     RETURN FALSE
  END IF
  
  SELECT ooab002 INTO l_ooab002 FROM ooab_t
   WHERE ooab001 = 'S-FIN-9019'  AND ooabent = g_enterprise AND ooabsite = l_site

  IF STATUS = 100 OR cl_null(l_ooab002) THEN
     INITIALIZE g_errparam TO NULL
     LET g_errparam.code = 'afa-00298'
     LET g_errparam.replace[1] = l_site
     LET g_errparam.popup = TRUE
     CALL cl_err()
     RETURN FALSE
  END IF
  

  CALL cl_get_para(g_enterprise,l_site,'S-FIN-9018') RETURNING l_year
  CALL cl_get_para(g_enterprise,l_site,'S-FIN-9019') RETURNING l_month
  
  #180326-00032#2 mark--s
#  IF l_year <> YEAR(p_date) OR l_month <> MONTH(p_date)  THEN
#     INITIALIZE g_errparam TO NULL
#     LET g_errparam.code = 'afa-00283'
#     LET g_errparam.extend = ''
#     LET g_errparam.popup = TRUE
#     CALL cl_err()
#     RETURN FALSE
#  END IF
  #180326-00032#2 mark--e
  #180326-00032#2 mod--s
  #aoos020设置的现行年月
  LET r_date = MDY(l_month,1,l_year)
  IF p_date < r_date THEN
     INITIALIZE g_errparam TO NULL
     #200330-00029#1 add(s)
     IF g_prog = 'afat421' THEN
        LET g_errparam.code = 'afa-09621'
     ELSE        
     #200330-00029#1 add(e)
     LET g_errparam.code = 'afa-00480'
     END IF  #200330-00029#1 add  
     LET g_errparam.extend = ''
     LET g_errparam.popup = TRUE
     CALL cl_err()
     RETURN FALSE
  END IF
  #180326-00032#2 mod--e
  RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 单据日期不可小于等于关账日期检查
# Memo...........:
# Usage..........: CALL s_afat503_docdt_chk(p_ld,p_site,p_date)
# Input parameter:  
# Date & Author..: 2014/12/12 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_docdt_chk(p_ld,p_site,p_date)
DEFINE p_ld   LIKE fabg_t.fabgld   #帳套
DEFINE p_site LIKE fabg_t.fabgsite #資產中心
DEFINE p_date LIKE type_t.dat
DEFINE l_site LIKE fabg_t.fabgsite 
DEFINE l_sql   STRING
DEFINE l_ooab002 LIKE ooab_t.ooab002

  LET l_site = p_site 
  
  #如果有帳套 檢查帳套歸屬法人的參數設定優先
  IF NOT cl_null(p_ld) THEN
    SELECT glaacomp INTO l_site FROM glaa_t
     WHERE glaaent = g_enterprise AND glaald = p_ld
  END IF
   
  SELECT ooab002 INTO l_ooab002 FROM ooab_t
   WHERE ooab001 = 'S-FIN-9003'  AND ooabent = g_enterprise AND ooabsite = l_site

  IF STATUS = 100 OR cl_null(l_ooab002) THEN
     INITIALIZE g_errparam TO NULL
     LET g_errparam.code = 'afa-00298'
     LET g_errparam.replace[1] = l_site
     LET g_errparam.popup = TRUE
     CALL cl_err()
     RETURN FALSE
  END IF

  CALL cl_get_para(g_enterprise,l_site,'S-FIN-9003') RETURNING l_ooab002
  IF p_date <= l_ooab002 THEN
     INITIALIZE g_errparam TO NULL
     #200330-00029#1 add(s)
     IF g_prog = 'afat421' THEN
        LET g_errparam.code = 'afa-09622'
     ELSE
     #200330-00029#1 add(e)
     LET g_errparam.code = 'afa-00060'
     END IF  #200330-00029#1 add
     LET g_errparam.extend = ''
     LET g_errparam.popup = TRUE
     CALL cl_err()
     RETURN FALSE
  END IF
  RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 检查资产状态
# Memo...........:
# Usage..........: CALL s_afat503_fixed_chk(p_faah003,p_faah004,p_faah001,p_prog,p_ld,p_comp,p_date)
#                  RETURNING TRUE/FALSE
# Input parameter: 
# Return code....: 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#55  By 09505
################################################################################
PUBLIC FUNCTION s_afat503_fixed_chk(p_faah003,p_faah004,p_faah001,p_prog,p_ld,p_comp,p_date)
DEFINE  p_faah004 LIKE faah_t.faah004
DEFINE  p_faah003 LIKE faah_t.faah003
DEFINE  p_faah001 LIKE faah_t.faah001
DEFINE  p_prog    LIKE gzza_t.gzza001
DEFINE  p_ld      LIKE fabg_t.fabgld
DEFINE  p_comp    LIKE faba_t.fabacomp
DEFINE  p_date    LIKE type_t.dat
DEFINE  l_sql     STRING
DEFINE  l_n       LIKE type_t.num5
DEFINE  l_faah015 LIKE faah_t.faah015
DEFINE  l_faah032 LIKE faah_t.faah032
DEFINE  l_faah006 LIKE faah_t.faah006
DEFINE  l_glaacomp LIKE glaa_t.glaacomp
DEFINE  l_faal003 LIKE faal_t.faal003
DEFINE  l_year    LIKE type_t.num5
DEFINE  l_month   LIKE type_t.num5
DEFINE  l_faaj003 LIKE faaj_t.faaj003   #160331-00002#1
DEFINE  l_faah036 LIKE faah_t.faah036   #160426-00014#7 add
DEFINE  l_faah037 LIKE faah_t.faah037   #170603-00027#1 add
DEFINE  l_yy      LIKE faaj_t.faaj008   #161215-00070#1 add
DEFINE  l_mm      LIKE faaj_t.faaj008   #161215-00070#1 add
DEFINE  l_ym      LIKE faaj_t.faaj008   #161215-00070#1 add
DEFINE  l_faaj038 LIKE faaj_t.faaj038   #190815-00018#1 add


   IF cl_null(p_faah003) OR p_faah004 IS NULL THEN 
       RETURN TRUE
   END IF 

   IF cl_null(p_faah001) THEN
      RETURN TRUE
   END IF
   
   #检查财产+附号+卡号存在否，确认否
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_faah003
   LET g_chkparam.arg2 = p_faah004
   LET g_chkparam.arg3 = p_faah001
   LET g_errshow = TRUE                                                                                                #160328-00029#1 add
   LET g_chkparam.err_str[1] = "afa-00264:sub-01302|afai100|",cl_get_progname("afai100",g_lang,"2"),"|:EXEPROGafai100" #160328-00029#1 add
   IF NOT cl_chk_exist("v_faah003_3") THEN
      RETURN FALSE
   END IF

   SELECT faah015,faah032,faah006,faah036,faah037 INTO l_faah015,l_faah032,l_faah006,l_faah036,l_faah037 FROM faah_t #160426-00014#7 add faah036     #170603-00027#1 add faah037
    WHERE faahent = g_enterprise  #20150722 by 02599 add
      AND faah003 = p_faah003
      AND faah004 = p_faah004
      AND faah001 = p_faah001
      
   #190815-00018#1-(S) add
   #afat501:要檢查faaj038
   #可能二個帳套: A 帳是加速折舊法、B 帳是平均年限法,A 帳會提早折畢 
   SELECT faaj038 INTO l_faaj038
     FROM faaj_t
    WHERE faajent = g_enterprise AND faajld = p_ld
      AND faaj001 = p_faah003
      AND faaj002 = p_faah004
      AND faaj037 = p_faah001   
   #190815-00018#1-(E) add

   #检查资产状态
   INITIALIZE g_errparam TO NULL
   CASE 
      #WHEN (p_prog ="afat400" AND l_faah015<>'0')   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat400*" AND l_faah015<>'0')   #170301-00021#3 by 09263 --add
         LET g_errparam.code = 'afa-00122'     
      #WHEN (p_prog ="afat430" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat430*" AND   #170301-00021#3 by 09263 --add
           (l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10'))
         LET g_errparam.code = 'afa-00065'      
      #WHEN ((p_prog ="afat410"  OR p_prog ="afat470" OR p_prog="afat480"   #170301-00021#3 by 09263 --mark
      WHEN ((p_prog MATCHES "afat410*"  OR p_prog MATCHES "afat470*" OR p_prog MATCHES "afat480*"   #170301-00021#3 by 09263 --add
            #OR p_prog ="afat502" OR p_prog ="afat503" OR p_prog ="afat504" OR p_prog ="afat505"   #170301-00021#3 by 09263 --mark
            OR p_prog MATCHES "afat502*" OR p_prog MATCHES "afat503*" OR p_prog MATCHES "afat504*" OR p_prog MATCHES "afat505*"   #170301-00021#3 by 09263 --add
            #OR p_prog ="afat506" OR p_prog ="afat507" OR p_prog ="afat508"  OR p_prog ="afat523" ) #160426-00014#10 add afat523   #170301-00021#3 by 09263 --mark
            #OR p_prog MATCHES "afat506*" OR p_prog MATCHES "afat507*" OR p_prog MATCHES "afat508*"  OR p_prog MATCHES "afat523*" )   #170301-00021#3 by 09263 --add #180815-00024#1 mark
            OR p_prog MATCHES "afat506*" OR p_prog MATCHES "afat508*"  OR p_prog MATCHES "afat523*" ) #180815-00024#1 add #afat507此检核放afat507中做，要考虑是否列管和单别参数
            AND (l_faah015 = '0' OR l_faah015 = '5' OR l_faah015 = '6' OR l_faah015 = '8' OR l_faah015 = '10'))
         LET g_errparam.code = 'afa-00297'  
      #WHEN ((p_prog ="afat440" OR p_prog ="afat450" OR p_prog ="afat460" )   #170301-00021#3 by 09263 --mark
      WHEN ((p_prog MATCHES "afat440*" OR p_prog MATCHES "afat450*" OR p_prog MATCHES "afat460*" )   #170301-00021#3 by 09263 --add
             AND (l_faah015='5' OR l_faah015='6' OR l_faah015='8' OR l_faah015='10'))
         LET g_errparam.code = 'afa-01004' 
      #WHEN (p_prog ="afat500" AND l_faah015<>'1')   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat500*" AND l_faah015<>'1')   #170301-00021#3 by 09263 --add
         LET g_errparam.code = 'afa-00328'  
      #WHEN (p_prog ="afat501" AND l_faah015<>'4')                #151118-00010#1 151120 by sakura mark  
      #WHEN (p_prog ="afat501" AND l_faah015 NOT MATCHES "[47]")   #151118-00010#1 151120 by sakura add    #170301-00021#3 by 09263 --mark
      #WHEN (p_prog MATCHES "afat501*" AND l_faah015 NOT MATCHES "[47]")   #170301-00021#3 by 09263 --add   #190815-00018#1 mark
      WHEN (p_prog MATCHES "afat501*" AND l_faaj038 NOT MATCHES "[47]")   #190815-00018#1 add
         LET g_errparam.code = 'afa-00329'
      #WHEN (p_prog ="afat515" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat515*" AND   #170301-00021#3 by 09263 --add
           (l_faah015='5' OR l_faah015='6'))                      #170220-00020#1 del l_faah015='1' 
         LET g_errparam.code = 'afa-01007'      
      #20150722--by--02599--add--str--
      #WHEN (p_prog ="afat521" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat521*" AND   #170301-00021#3 by 09263 --add
           (l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10')) 
         LET g_errparam.code = 'afa-00461' 
      #20150722--by--02599--add--end   
      #140122-00001#117--add--str--lujh
      #WHEN (p_prog ="afat490" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat490*" AND   #170301-00021#3 by 09263 --add
           (l_faah015='0' OR l_faah015='5' OR l_faah015='6' OR l_faah015='10'))
         LET g_errparam.code = 'afa-01036'     
      #140122-00001#117--add--end--lujh
      
      #140122-00001#74--add--str--lujh
      #WHEN (p_prog ="afat492" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat492*" AND   #170301-00021#3 by 09263 --add      
           (l_faah015='5' OR l_faah015='6' OR l_faah015='10'))
         LET g_errparam.code = 'afa-01045'  
      #140122-00001#74--add--end--lujh
      
      #160222-00024#1--add--str--lujh
      #WHEN (p_prog ="afat700" AND      #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat700*" AND   #170301-00021#3 by 09263 --add      
           (l_faah015='5' OR l_faah015='6' OR l_faah015='10'))
         LET g_errparam.code = 'afa-01054'  
      #160222-00024#1--add--end--lujh
      
      #160222-00024#5--add--str--lujh
      #WHEN (p_prog ="afat800" AND   #170301-00021#3 by 09263 --mark
      WHEN (p_prog MATCHES "afat800*" AND   #170301-00021#3 by 09263 --add
           (l_faah015='5' OR l_faah015='6' OR l_faah015='10'))
         LET g_errparam.code = 'afa-01066'  
      #160222-00024#5--add--end--lujh

      #160426-00014#7 add s---
      #WHEN  p_prog ="afat504" AND l_faah036='1'   #170301-00021#3 by 09263 --mark
      WHEN  p_prog MATCHES "afat504*" AND l_faah036='1'   #170301-00021#3 by 09263 --add 
         LET g_errparam.code = 'afa-01077'        
      #160426-00014#7 add e---
      
      #170603-00027#1 add（s)
         WHEN  p_prog MATCHES "afat504*" AND l_faah037<>'1'
         LET g_errparam.code = 'afa-01161'
      #170603-00027#1 add（e)
      #170603-00034#1 add(s)
      WHEN  p_prog MATCHES "afat506*" AND l_faah037<>'1'
         LET g_errparam.code = 'afa-00203'
      #170603-00034#1 add(s)
      #190916-00030#1 add(s)
      WHEN p_prog MATCHES "afat507*" AND l_faah037<>'1'
         LET g_errparam.code = 'afa-00203'
      #190916-00030#1 add(e)
   END CASE
   IF NOT cl_null(g_errparam.code) THEN
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      RETURN FALSE
   END IF
   
   #afat4*作业检查 是否和单头的法人一致
   #IF p_prog MATCHES "afat4[0-9][0-9]" OR p_prog = 'afat515'   #170301-00021#3 by 09263 --mark 
   IF p_prog MATCHES "afat4[0-9][0-9]*" OR p_prog MATCHES 'afat515*'   #170301-00021#3 by 09263 --add 
                                       #OR p_prog = 'afat700'         #160222-00024#1 add OR p_prog ='afat700' lujh   #170301-00021#3 by 09263 --mark
                                       OR p_prog MATCHES 'afat700*'   #170301-00021#3 by 09263 --add        
                                       #OR p_prog = 'afat800' THEN    #160222-00024#5 add OR p_prog ='afat800' lujh   #170301-00021#3 by 09263 --mark
                                       OR p_prog MATCHES 'afat800*' THEN   #170301-00021#3 by 09263 --add 
     #检查财编+附号+卡号 的归属法人和单头的归属法人一致
     IF l_faah032 <> p_comp THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = 'afa-00296'
        LET g_errparam.extend = ''
        LET g_errparam.popup = TRUE
        CALL cl_err() 
        RETURN FALSE
     END IF 
   END IF
   
   #IF p_prog MATCHES "afat5[0-9][0-9]" THEN   #170301-00021#3 by 09263 --mark
   IF p_prog MATCHES "afat5[0-9][0-9]*" THEN   #170301-00021#3 by 09263 --add
     #检查财编+附号+卡号 的归属法人和单头的帐套对应的法人是否一致
      SELECT glaacomp INTO l_glaacomp  FROM glaa_t
       WHERE glaaent = g_enterprise AND glaald = p_ld
     IF l_faah032 <> l_glaacomp THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = 'afa-00296'
        LET g_errparam.extend = ''
        LET g_errparam.popup = TRUE
        CALL cl_err() 
        RETURN FALSE
     END IF  
     #IF p_prog <> "afat501" AND p_prog <> "afat515" THEN   #170301-00021#3 by 09263 --mark
     IF p_prog NOT MATCHES "afat501*" AND p_prog NOT MATCHES "afat515*" THEN   #170301-00021#3 by 09263 --add
        #检查是否存在afai021 不存在报错，存在的话，检查是否先计提折旧
        #160331-00002#1 add -str
        #161215-00070#1 add s---
        CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-9018') RETURNING l_year
        CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-9019') RETURNING l_month    
        LET l_yy = l_year
        LET l_mm = l_month
        LET l_yy = l_yy USING "&&&&"
        LET l_mm = l_mm USING "&&"
        LET l_ym = l_yy,l_mm
        #161215-00070#1 add e---
        LET l_faaj003 = NULL  #161215-00070#1 add
        SELECT faaj003 INTO l_faaj003
          FROM faaj_t
         WHERE faajent = g_enterprise
           AND faaj001 = p_faah003
           AND faaj002 = p_faah004
           AND faaj037 = p_faah001
           AND faajld  = p_ld
          #AND faaj008 < l_ym #161215-00070#1 add   #170617-00292#1 mark
           AND faaj008 <= l_ym                      #170617-00292#1 add
           
        #IF  l_faaj003 != 5  THEN   #161215-00070#1 mark
        IF  l_faaj003 != 5  AND NOT cl_null(l_faaj003) THEN #161215-00070#1 add        
        #160331-00002#1 add -end
           SELECT faal003 INTO l_faal003 FROM faal_t 
            WHERE faalent = g_enterprise AND faalld = p_ld AND faal001 = l_faah006
           
           IF STATUS =100 OR cl_null(l_faal003) THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = 'afa-00183'     
              LET g_errparam.extend = ''
              LET g_errparam.popup = TRUE
              CALL cl_err()
              RETURN FALSE
           ELSE
              LET l_year = YEAR(p_date)
              LET l_month = MONTH(p_date)
              IF l_faal003 = 'Y' THEN   
                 IF p_prog MATCHES "afat50[467]*" THEN #170911-00028#1 add #只有銷帳，報廢，出售才要卡參數
                    SELECT COUNT(*) INTO l_n FROM faam_t
                      WHERE faament = g_enterprise AND faamld = p_ld
                        AND faam000 = p_faah001 AND faam001 = p_faah003 AND faam002= p_faah004
                        AND faam004 = l_year AND faam005 = l_month
                     IF l_n = 0 THEN
                        #检查资产状态是否为折毕
                        #190710-00012#1 mark(s)
                        #SELECT faah015 INTO l_faah015
                        #  FROM faah_t 
                        # WHERE faahent = g_enterprise
                        #   AND faah001 = p_faah001卡
                        #   AND faah003 = p_faah003才
                        #   AND faah004 = p_faah004負
                        #190710-00012#1 mark(e)
                        #190710-00012#1 add(s)
                        SELECT faaj038 INTO l_faah015
                          FROM faaj_t 
                         WHERE faajent = g_enterprise
                           AND faajld = p_ld
                           AND faaj037 = p_faah001
                           AND faaj001 = p_faah003
                           AND faaj002 = p_faah004
                        #190710-00012#1 add(s)
                        IF l_faah015 != '4' THEN 
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'afa-00280'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           RETURN FALSE
                        END IF 
                     END IF
                 END IF  #170911-00028#1 add
              END IF
              #210218-00004#1---add----str
              IF l_faal003 <> 'Y' THEN 
                  IF p_prog MATCHES "afat507" THEN 
                     LET l_n = 0                  
                     SELECT COUNT(*) INTO l_n 
                       FROM faam_t
                      WHERE faament = g_enterprise 
                        AND faamld = p_ld
                        AND faam000 = p_faah001 
                        AND faam001 = p_faah003 
                        AND faam002= p_faah004
                        AND faam004 = l_year 
                        AND faam005 = l_month   
                     IF cl_null(l_n) THEN
                        LET l_n = 0   
                     END IF
                     IF l_n > 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'afa-09635'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        RETURN FALSE   
                     END IF
                  END IF                  
              END IF
              #210218-00004#1---add----end
           END IF 
       END IF  #160331-00002#1
     END IF
   END IF
   RETURN TRUE

END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_afat503_conf_chk_fabs(p_fabgld,p_fabgdocno)
# Input parameter: 
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_chk_fabs(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld            LIKE fabg_t.fabgld
   DEFINE p_fabgdocno         LIKE fabg_t.fabgdocno
   #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabs              RECORD LIKE fabs_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabs RECORD  #資產資本化帳務單身檔
       fabsent LIKE fabs_t.fabsent, #企業編號
       fabscomp LIKE fabs_t.fabscomp, #法人
       fabsld LIKE fabs_t.fabsld, #帳套編號
       fabsdocno LIKE fabs_t.fabsdocno, #帳務編號
       fabsseq LIKE fabs_t.fabsseq, #項次
       fabs001 LIKE fabs_t.fabs001, #單據來源
       fabs002 LIKE fabs_t.fabs002, #來源單號
       fabs003 LIKE fabs_t.fabs003, #來源單項次
       fabs004 LIKE fabs_t.fabs004, #財產編號
       fabs005 LIKE fabs_t.fabs005, #附號
       fabs006 LIKE fabs_t.fabs006, #卡片編號
       fabs007 LIKE fabs_t.fabs007, #借方科目
       fabs008 LIKE fabs_t.fabs008, #貸方科目
       fabs009 LIKE fabs_t.fabs009, #交易幣別
       fabs010 LIKE fabs_t.fabs010, #匯率
       fabs011 LIKE fabs_t.fabs011, #原幣金額
       fabs012 LIKE fabs_t.fabs012, #本幣金額
       fabs013 LIKE fabs_t.fabs013, #摘要
       fabs014 LIKE fabs_t.fabs014, #營運據點
       fabs015 LIKE fabs_t.fabs015, #部門
       fabs016 LIKE fabs_t.fabs016, #利潤/成本中心
       fabs017 LIKE fabs_t.fabs017, #區域
       fabs018 LIKE fabs_t.fabs018, #交易客商
       fabs019 LIKE fabs_t.fabs019, #帳款客商
       fabs020 LIKE fabs_t.fabs020, #客群
       fabs021 LIKE fabs_t.fabs021, #產品類別
       fabs022 LIKE fabs_t.fabs022, #人員
       fabs023 LIKE fabs_t.fabs023, #預算編號
       fabs024 LIKE fabs_t.fabs024, #專案編號
       fabs025 LIKE fabs_t.fabs025, #WBS
       #180119-00017#1 add-s
       fabs026 LIKE fabs_t.fabs026, #自由核算项1
       fabs027 LIKE fabs_t.fabs027, #自由核算项2
       fabs028 LIKE fabs_t.fabs028, #自由核算项3
       fabs029 LIKE fabs_t.fabs029, #自由核算项4
       fabs030 LIKE fabs_t.fabs030, #自由核算项5
       fabs031 LIKE fabs_t.fabs031, #自由核算项6
       fabs032 LIKE fabs_t.fabs032, #自由核算项7
       fabs033 LIKE fabs_t.fabs033, #自由核算项8
       fabs034 LIKE fabs_t.fabs034, #自由核算项9
       fabs035 LIKE fabs_t.fabs035, #自由核算项10
       #180119-00017#1 add-e
       fabs100 LIKE fabs_t.fabs100, #本位幣二幣別
       fabs101 LIKE fabs_t.fabs101, #本位幣二匯率
       fabs102 LIKE fabs_t.fabs102, #本位幣二本幣金額
       fabs150 LIKE fabs_t.fabs150, #本位幣三幣別
       fabs151 LIKE fabs_t.fabs151, #本位幣三匯率
       fabs152 LIKE fabs_t.fabs152  #本位幣三本幣金額
       END RECORD
   #161128-00061#6---modify--end--------------------
   #180119-00017#1 add-s
   DEFINE l_fabs_1 RECORD  #核算项值
       fabs015 LIKE fabs_t.fabs015, #部門
       fabs016 LIKE fabs_t.fabs016, #利潤/成本中心
       fabs017 LIKE fabs_t.fabs017, #區域
       fabs018 LIKE fabs_t.fabs018, #交易客商
       fabs019 LIKE fabs_t.fabs019, #帳款客商
       fabs020 LIKE fabs_t.fabs020, #客群
       fabs021 LIKE fabs_t.fabs021, #產品類別
       fabs022 LIKE fabs_t.fabs022, #人員
       fabs024 LIKE fabs_t.fabs024, #專案編號
       fabs025 LIKE fabs_t.fabs025, #WBS
       glaq051 LIKE glaq_t.glaq051, #经营方式
       glaq052 LIKE glaq_t.glaq052, #渠道
       glaq053 LIKE glaq_t.glaq053, #品牌
       fabs026 LIKE fabs_t.fabs026, #自由核算项1
       fabs027 LIKE fabs_t.fabs027, #自由核算项2
       fabs028 LIKE fabs_t.fabs028, #自由核算项3
       fabs029 LIKE fabs_t.fabs029, #自由核算项4
       fabs030 LIKE fabs_t.fabs030, #自由核算项5
       fabs031 LIKE fabs_t.fabs031, #自由核算项6
       fabs032 LIKE fabs_t.fabs032, #自由核算项7
       fabs033 LIKE fabs_t.fabs033, #自由核算项8
       fabs034 LIKE fabs_t.fabs034, #自由核算项9
       fabs035 LIKE fabs_t.fabs035, #自由核算项10
       glbc004 LIKE glbc_t.glbc004  #现金变动码
       END RECORD
       #180119-00017#1 add-e
   DEFINE r_success           LIKE type_t.num5
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_desc              STRING
   DEFINE l_date              LIKE fabg_t.fabgdocdt
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_sql               STRING
   DEFINE l_errmsg            STRING
   DEFINE l_glad007        LIKE glad_t.glad007     #部門管理否
   DEFINE l_glad008        LIKE glad_t.glad008     #利潤成本中心管理
   DEFINE l_glad009        LIKE glad_t.glad009     #區域管理
   DEFINE l_glad010        LIKE glad_t.glad010     #交易客商管理
   DEFINE l_glad027        LIKE glad_t.glad027     #账款客商管理
   DEFINE l_glad011        LIKE glad_t.glad011     #客群管理否
   DEFINE l_glad012        LIKE glad_t.glad012     #產品類別
   DEFINE l_glad013        LIKE glad_t.glad013     #人員
   DEFINE l_glad015        LIKE glad_t.glad015     #专案管理否
   DEFINE l_glad016        LIKE glad_t.glad016     #wbs管理
   DEFINE l_glad031        LIKE glad_t.glad031     #經營方式管理
   DEFINE l_glad032        LIKE glad_t.glad032     #渠道管理
   DEFINE l_glad033        LIKE glad_t.glad033     #品牌管理
   DEFINE l_errno          LIKE type_t.chr10   
   #是否做自由科目核算项管理
   DEFINE l_glad017        LIKE glad_t.glad017
   DEFINE l_glad0171       LIKE glad_t.glad0171 
   DEFINE l_glad0172       LIKE glad_t.glad0172 
   DEFINE l_glad018        LIKE glad_t.glad018
   DEFINE l_glad0181       LIKE glad_t.glad0181
   DEFINE l_glad0182       LIKE glad_t.glad0182
   DEFINE l_glad019        LIKE glad_t.glad019
   DEFINE l_glad0191       LIKE glad_t.glad0191
   DEFINE l_glad0192       LIKE glad_t.glad0192
   DEFINE l_glad020        LIKE glad_t.glad020
   DEFINE l_glad0201       LIKE glad_t.glad0201
   DEFINE l_glad0202       LIKE glad_t.glad0202
   DEFINE l_glad021        LIKE glad_t.glad021
   DEFINE l_glad0211       LIKE glad_t.glad0211
   DEFINE l_glad0212       LIKE glad_t.glad0212
   DEFINE l_glad022        LIKE glad_t.glad022
   DEFINE l_glad0221       LIKE glad_t.glad0221
   DEFINE l_glad0222       LIKE glad_t.glad0222
   DEFINE l_glad023        LIKE glad_t.glad023
   DEFINE l_glad0231       LIKE glad_t.glad0231
   DEFINE l_glad0232       LIKE glad_t.glad0232
   DEFINE l_glad024        LIKE glad_t.glad024
   DEFINE l_glad0241       LIKE glad_t.glad0241
   DEFINE l_glad0242       LIKE glad_t.glad0242
   DEFINE l_glad025        LIKE glad_t.glad025
   DEFINE l_glad0251       LIKE glad_t.glad0251
   DEFINE l_glad0252       LIKE glad_t.glad0252
   DEFINE l_glad026        LIKE glad_t.glad026
   DEFINE l_glad0261       LIKE glad_t.glad0261
   DEFINE l_glad0262       LIKE glad_t.glad0262
   DEFINE l_cate           LIKE type_t.chr10          
   DEFINE g_glaa121        LIKE glaa_t.glaa121 
   #albireo 150824-----s
   DEFINE l_comp   LIKE ooef_t.ooef001
   DEFINE l_chr    LIKE type_t.chr1
   DEFINE l_slip   LIKE type_t.chr10
   #albireo 150824-----e 
   #170421-00027#9--add--s--xul
   DEFINE l_fabs007        LIKE fabs_t.fabs007
   DEFINE l_fabs008        LIKE fabs_t.fabs008 
   DEFINE ls_js            STRING
   DEFINE lc_param  RECORD
       glbi001   LIKE glbi_t.glbi001,   #作业编号 
       glbild    LIKE glbi_t.glbild,    #账套
       docno     LIKE xrca_t.xrcadocno, #单号OR单别
       glbi003   LIKE glbi_t.glbi003    #科目编号  
             END RECORD
   #170421-00027#9--add--e--xul    
   #180326-00032#2  add  --(S)--
   DEFINE l_fabgdocdt       LIKE fabg_t.fabgdocdt
   DEFINE l_fabgmoddt       LIKE fabg_t.fabgmoddt
   #180326-00032#2  add  --(E)--
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #初始化数组
   INITIALIZE l_fabg.* TO NULL
   #资料检查
   #(1).传入参数为空，返回
   #170816-00007#27 by 09773 mod(S)
#   IF cl_null(p_fabgld) OR cl_null(p_fabgdocno) THEN
#      LET r_success = FALSE
##      CALL cl_errmsg('conf_chk',p_fabgdocno,'','sub-00110',1) #cymod
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = p_fabgdocno
#      LET g_errparam.code   = 'sub-00110'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err() 
#   END IF
   #170816-00007#27 by 09773 mod(E)
   
   #170816-00007#27 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fabgld) THEN
      CALL s_azzi902_get_gzzd("aapi511","lbl_glabld") RETURNING g_colname_1,g_comment_1  #賬套 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fabgdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aglt310_07","lbl_glapdocno") RETURNING g_colname_1,g_comment_1   #單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
   END IF   
   #170816-00007#27 by 09773 add(E)
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t WHERE fabgent=g_enterprise AND fabgld=p_fabgld AND fabgdocno=p_fabgdocno
   #(2).狀態碼=未審核,才可進行確認動作   
   IF l_fabg.fabgstus <>'N' THEN
      LET r_success = FALSE
#      CALL cl_errmsg('fabgstus',p_fabgdocno,'','afa-00024',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'afa-00024'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF 
   
   
   #(3).有單頭資料但無單身資料返回报错
   LET l_cnt = 0
   SELECT count(*) INTO l_cnt FROM fabs_t
    WHERE fabsent = g_enterprise
      AND fabsld  = p_fabgld
      AND fabsdocno = p_fabgdocno
   IF l_cnt = 0  THEN
      LET r_success = FALSE
#      CALL cl_errmsg('',p_fabgdocno,'','agl-00066',1) #cymod
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_fabgdocno
      LET g_errparam.code   = 'agl-00066'
      LET g_errparam.popup  = TRUE 
      CALL cl_err() 
   END IF
   
   #albireo 150824-----s
   #170421-00027#10--add--s--xul
   LET l_sql = " SELECT DISTINCT fabs007,fabs008 FROM fabs_t  ",
               " WHERE fabsent = '",g_enterprise,"'",
               "   AND fabsld = '",p_fabgld,"'",
               "   AND fabsdocno = '",p_fabgdocno,"'"             
   PREPARE l_fabs007_fabs008_pre FROM l_sql
   DECLARE l_fabs007_fabs008_cs CURSOR FOR l_fabs007_fabs008_pre
   FOREACH l_fabs007_fabs008_cs INTO l_fabs007,l_fabs008
           IF NOT cl_null(l_fabs007) THEN      
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_fabgld
              LET lc_param.docno   = p_fabgdocno
              LET lc_param.glbi003 = l_fabs007
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF
           END IF
           IF NOT cl_null(l_fabs008) THEN      
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_fabgld
              LET lc_param.docno   = p_fabgdocno
              LET lc_param.glbi003 = l_fabs008
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF
           END IF
   END FOREACH 
   #170421-00027#10--add--e--xul
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add  
   #albireo 150824-----e
   #20150112 add by chenying
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   #181204-00026#6 add s--- 
   IF l_fabg.fabg005 = '0' OR l_fabg.fabg005 = '4' OR l_fabg.fabg005 = '6' OR
      l_fabg.fabg005 = '8' OR l_fabg.fabg005 = '9' OR l_fabg.fabg005 = '14' OR
      l_fabg.fabg005 = '21'OR l_fabg.fabg005 = '22'OR l_fabg.fabg005 = '26' THEN #170421-00027#9 xul add l_fabg.fabg005 = '22' OR l_fabg.fabg005 = '26'
      CASE l_fabg.fabg005
          #170421-00027#9--add--s--xul
          WHEN '22'
             LET l_cate =  'F10'
          WHEN '26'
             LET l_cate =  'F20'
          #170421-00027#9--add--e--xul
          WHEN '0'
             LET l_cate =  'F30'  
          WHEN '4'
             LET l_cate =  'F40'  
          WHEN '6'
             LET l_cate =  'F50'  
          WHEN '8'
             LET l_cate =  'F50' 
          WHEN '14'
             LET l_cate =  'F50'  
          WHEN '21'
             LET l_cate =  'F50'
          WHEN '9'
             LET l_cate =  'F50'                  
      END CASE 
   END IF
   #181204-00026#6 add e---   
   
   IF g_glaa121 = 'Y' AND l_chr = 'Y' THEN    #albireo 150825 add l_chr='Y'
#181204-00026#6 mark s-- 
#      IF l_fabg.fabg005 = '0' OR l_fabg.fabg005 = '4' OR l_fabg.fabg005 = '6' OR
#         l_fabg.fabg005 = '8' OR l_fabg.fabg005 = '9' OR l_fabg.fabg005 = '14' OR
#         l_fabg.fabg005 = '21'OR l_fabg.fabg005 = '22'OR l_fabg.fabg005 = '26' THEN #170421-00027#9 xul add l_fabg.fabg005 = '22' OR l_fabg.fabg005 = '26'
#         CASE l_fabg.fabg005
#             #170421-00027#9--add--s--xul
#             WHEN '22'
#                LET l_cate =  'F10'
#             WHEN '26'
#                LET l_cate =  'F20'
#             #170421-00027#9--add--e--xul
#             WHEN '0'
#                LET l_cate =  'F30'  
#             WHEN '4'
#                LET l_cate =  'F40'  
#             WHEN '6'
#                LET l_cate =  'F50'  
#             WHEN '8'
#                LET l_cate =  'F50' 
#             WHEN '14'
#                LET l_cate =  'F50'  
#             WHEN '21'
#                LET l_cate =  'F50'
#             WHEN '9'
#                LET l_cate =  'F50'                  
#         END CASE 
#181204-00026#6 mark e--- 
         CALL s_chk_voucher('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF l_success = FALSE THEN
            LET r_success = FALSE
         END IF         
      #END IF #181204-00026#6
   #181204-00026#6 add s---   
   ELSE   
      IF g_glaa121 = 'N' THEN 
         IF l_cate = 'F10' THEN 
            CALL s_pre_voucher_ins('FA',l_cate,p_fabgld,p_fabgdocno,l_fabg.fabgdocdt,'22')  RETURNING l_success
         END IF   
         IF l_cate = 'F20' THEN 
            CALL s_pre_voucher_ins('FA',l_cate,p_fabgld,p_fabgdocno,l_fabg.fabgdocdt,'26')  RETURNING l_success
         END IF            
         IF NOT l_success THEN LET r_success = FALSE END IF
         CALL s_chk_voucher('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF NOT l_success THEN LET r_success = FALSE END IF
         CALL s_pre_voucher_del('FA',l_cate,p_fabgld,p_fabgdocno) RETURNING l_success
         IF NOT l_success THEN LET r_success = FALSE END IF         
      END IF       
   #181204-00026#6 add e---
   END IF   
   #20150112 add by chenying
   
   #albireo 150824-----s
   #使用分录时，检查分录实体表核算项
   SELECT glaa121 INTO g_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
   CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING g_sub_success,l_slip
   LET l_comp = NULL
   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_fabgld
   CALL s_fin_get_doc_para(p_fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF cl_null(l_chr) THEN LET l_chr = 'Y' END IF #171020-00028#1 xul add 
   
   #albireo 150824-----e
   #(7).单身科目无效，性質不為帳戶,不為明細或獨立帳戶,则返回报错
   #固定核算項欄位,其對應基本資料的合理性 
#181204-00026#6 mark s---#不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项  
#   IF g_glaa121 = 'N'  THEN #20150112 add by chenying
#   #161128-00061#6---modify--begin--------------------
#   #LET l_sql = " SELECT * FROM fabs_t", 
#   LET l_sql = " SELECT fabsent,fabscomp,fabsld,fabsdocno,fabsseq,fabs001,fabs002,fabs003,fabs004,",
#               "fabs005,fabs006,fabs007,fabs008,fabs009,fabs010,fabs011,fabs012,fabs013,fabs014,",
#               "fabs015,fabs016,fabs017,fabs018,fabs019,fabs020,fabs021,fabs022,fabs023,fabs024,",
#               #"fabs025,fabs100,fabs101,fabs102,fabs150,fabs151,fabs152 FROM fabs_t", #180119-00017#1 mark
#               #180119-00017#1 add-s
#               "fabs025,fabs026,fabs027,fabs028,fabs029,fabs030,fabs031,fabs032,fabs033,fabs034,fabs035,",
#               "fabs100,fabs101,fabs102,fabs150,fabs151,fabs152 FROM fabs_t",
#               #180119-00017#1 add-e
#   #161128-00061#6---modify--end--------------------
#               " WHERE fabsent = '",g_enterprise,"'",
#               "   AND fabsld = '",p_fabgld,"'",
#               "   AND fabsdocno = '",p_fabgdocno,"'"
#   PREPARE s_voucher_fabs_pr FROM l_sql
#   DECLARE s_voucher_fabs_cs CURSOR FOR s_voucher_fabs_pr
#   FOREACH s_voucher_fabs_cs INTO l_fabs.*
#      IF SQLCA.sqlcode THEN
##         CALL cl_errmsg('foreach:','','',SQLCA.sqlcode,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = 'foreach:'
#         LET g_errparam.code   = SQLCA.sqlcode
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()  
#         LET r_success = FALSE         
#         EXIT FOREACH
#      END IF
#
##20141224 mod by chenying  
##      #是否存在未审核的资料的异动单据
##      LET l_cnt = 0
##      SELECT COUNT(*) INTO l_cnt FROM fabs_t,fabg_t 
##       WHERE fabsent = fabgent AND fabsld = fabgld
##         AND fabsdocno = fabgdocno
##         AND fabsent =  g_enterprise 
##         AND fabsld =  p_fabgld 
##         AND fabsdocno != p_fabgdocno 
##         AND fabs004 = l_fabs.fabs004
##         AND fabs005 = l_fabs.fabs005
##         AND fabs006 = l_fabs.fabs006
##         AND fabgstus = 'N' 
##      IF l_cnt > 0 THEN 
##         CALL cl_errmsg('',l_fabs.fabs004,'','afa-00333',1)
##         LET r_success = FALSE
##      END IF  
#      CALL s_afat503_conf_ins_tab_chk(p_fabgdocno,p_fabgld,l_fabs.fabs004,l_fabs.fabs005,l_fabs.fabs006) RETURNING l_success
#      IF l_success = FALSE THEN
#         LET r_success = FALSE
#         RETURN r_success    #181224-00009#1 add
#      END IF      
##20141224 mod by chenying  
#      #資產檢核
#      IF l_fabg.fabg005 <> '23' AND l_fabg.fabg005 <> '24'  THEN   
#         CALL s_afat503_fabh001_chk(l_fabs.fabs004,l_fabs.fabs005,l_fabs.fabs006,l_fabg.fabgld,l_fabg.fabg005)
#       END IF    
#      IF NOT cl_null(g_errno) THEN
#         LET l_errmsg = p_fabgdocno||'/'||l_fabs.fabsseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()  
#      END IF
#      
#      #盤點期間改資產不可異動
#      #170421-00027#10--mark--s--xul
#      #单独拉出来写
#      #170421-00027#9--add--s--xul     
#      #检核科目 
##      IF NOT cl_null(l_fabs.fabs007) THEN      
##         LET lc_param.glbi001 = g_prog
##         LET lc_param.glbild  = p_fabgld
##         LET lc_param.docno   = p_fabgdocno
##         LET lc_param.glbi003 = l_fabs.fabs007
##         LET ls_js = util.JSON.stringify(lc_param)
##         CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
##         IF NOT l_success THEN
##            LET r_success = FALSE
##         END IF
##      END IF
##      IF NOT cl_null(l_fabs.fabs008) THEN      
##         LET lc_param.glbi001 = g_prog
##         LET lc_param.glbild  = p_fabgld
##         LET lc_param.docno   = p_fabgdocno
##         LET lc_param.glbi003 = l_fabs.fabs008
##         LET ls_js = util.JSON.stringify(lc_param)
##         CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
##         IF NOT l_success THEN
##            LET r_success = FALSE
##         END IF
##      END IF      
#      #170421-00027#9--add--e--xul
#      #170421-00027#10--mark--e--xul
#      #albireo 150824-----s
#      
#      #180119-00017#1 mark-s   如果不mark， g_glaa121 = 'N' or l_chr = 'N' 都会导致无法对核算项检核 
##      IF NOT (g_glaa121 = 'Y' AND l_chr = 'Y') THEN 
##         CONTINUE FOREACH
##      END IF
#      #180119-00017#1 mark-s  
#      #albireo 150824-----e
#     
#      #借方科目
#      IF NOT cl_null(l_fabs.fabs007) THEN
#        
#         CALL s_voucher_glaq002_chk(p_fabgld,l_fabs.fabs007)
#         IF NOT cl_null(g_errno) THEN
#            LET l_errmsg = p_fabgdocno||'/'||l_fabs.fabsseq||'/'||l_fabs.fabs007
#            LET r_success = FALSE
##            CALL cl_errmsg('fabs007',l_errmsg,'',g_errno,1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = g_errno
#            #160321-00016#5 --s add
#            #(s_voucher_glaq002_chk)ais-00046->sub-01302
#            LET g_errparam.replace[1] = 'agli030'
#            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
#            LET g_errparam.exeprog = 'agli030'
#            #160321-00016#5 --e add
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()  
#         END IF 
#      ####################################add by huangtao
#      ELSE
#         LET g_errno = 'afa-00271'
#         LET l_errmsg = p_fabgdocno||'/'||l_fabs.fabsseq
#         LET r_success = FALSE
##         CALL cl_errmsg('fabs007',l_errmsg,'',g_errno,1) #cymod
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = l_errmsg
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()  
#      ####################################add by huangtao
#      END IF
#      ####################################add by huangtao
#      
#      #180119-00017#1 add-s
#      #对核算项进行检核,glaa121参数为N只检核借方科目
#      LET l_fabs_1.fabs015=l_fabs.fabs015 #部門
#      LET l_fabs_1.fabs016=l_fabs.fabs016 #利潤/成本中心
#      LET l_fabs_1.fabs017=l_fabs.fabs017 #區域
#      LET l_fabs_1.fabs018=l_fabs.fabs018 #交易客商
#      LET l_fabs_1.fabs019=l_fabs.fabs019 #帳款客商
#      LET l_fabs_1.fabs020=l_fabs.fabs020 #客群
#      LET l_fabs_1.fabs021=l_fabs.fabs021 #產品類別
#      LET l_fabs_1.fabs022=l_fabs.fabs022 #人員
#      LET l_fabs_1.fabs024=l_fabs.fabs024 #專案編號
#      LET l_fabs_1.fabs025=l_fabs.fabs025 #WBS
#      LET l_fabs_1.glaq051='' #经营方式
#      LET l_fabs_1.glaq052='' #渠道
#      LET l_fabs_1.glaq053='' #品牌
#      LET l_fabs_1.fabs026=l_fabs.fabs026 #自由核算项1
#      LET l_fabs_1.fabs027=l_fabs.fabs027 #自由核算项2
#      LET l_fabs_1.fabs028=l_fabs.fabs028 #自由核算项3
#      LET l_fabs_1.fabs029=l_fabs.fabs029 #自由核算项4
#      LET l_fabs_1.fabs030=l_fabs.fabs030 #自由核算项5
#      LET l_fabs_1.fabs031=l_fabs.fabs031 #自由核算项6
#      LET l_fabs_1.fabs032=l_fabs.fabs032 #自由核算项7
#      LET l_fabs_1.fabs033=l_fabs.fabs033 #自由核算项8
#      LET l_fabs_1.fabs034=l_fabs.fabs034 #自由核算项9
#      LET l_fabs_1.fabs035=l_fabs.fabs035 #自由核算项10
#      LET l_fabs_1.glbc004='' #现金变动码
#      CALL s_fix_acc_open_chk(l_fabs.fabsld,l_fabs.fabs007,l_fabs_1.*)  RETURNING  r_success
#      #180119-00017#1 add-e
#181204-00026#6 mark e---#不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项  


#180119-00017#1 mark-e
#      #核算項檢查
#      LET l_errmsg = p_fabgdocno||'/'||l_fabs.fabsseq||'/'||l_fabs.fabs007
#      #營運據點
#      IF NOT cl_null(l_fabs.fabs014) THEN
#         CALL s_voucher_glaq017_chk(l_fabs.fabs014)
#         IF NOT cl_null(g_errno) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',g_errno,1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = g_errno
#            #160321-00016#5 --s add
#            #(s_voucher_glaq017_chk)aoo-00089->sub-01302
#            LET g_errparam.replace[1] = 'aooi100'
#            LET g_errparam.replace[2] = cl_get_progname('aooi100',g_lang,"2")
#            LET g_errparam.exeprog = 'aooi100'
#            #160321-00016#5 --e add
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()   
#         END IF
#      END IF
#      
#      
#       #20141218 add by chenying
#      #依據帳別，科目編號，判斷該科目是否启用
#      #部門管理， 利潤成本中心管理，區域管理，交易客商管理，客群管理，產品類別，人員，預算，專案，wbs管理，账款客商管理，自由核算项1~10
#      #1.清空核算项管理值
#       LET l_glad007 = ''  LET l_glad008 = ''  LET l_glad009 = ''  LET l_glad010 = ''  LET l_glad027 = ''   LET l_glad011 = ''
#       LET l_glad012 = ''  LET l_glad013 = ''  LET l_glad015 = ''  LET l_glad016 = ''  
#       LET l_glad031 = ''  LET l_glad032 = ''  LET l_glad033 = ''
#       LET l_glad017 = ''  LET l_glad0171 =''  LET l_glad0172 = '' LET l_glad018 = ''  LET l_glad0181 = ''  LET l_glad0182 = ''   
#       LET l_glad019 = ''  LET l_glad0191 =''  LET l_glad0192 = '' LET l_glad020 = ''  LET l_glad0201 = ''  LET l_glad0202 = ''
#       LET l_glad021 = ''  LET l_glad0211 =''  LET l_glad0212 = '' LET l_glad022 = ''  LET l_glad0221 = ''  LET l_glad0222 = ''
#       LET l_glad023 = ''  LET l_glad0231 =''  LET l_glad0232 = '' LET l_glad024 = ''  LET l_glad0241 = ''  LET l_glad0242 = ''
#       LET l_glad025 = ''  LET l_glad0251 =''  LET l_glad0252 = '' LET l_glad026 = ''  LET l_glad0261 = ''  LET l_glad0262 = ''
#       #2.重新依账套，科目抓取核算项管理值
#       SELECT glad007,glad008,glad009,glad010,glad027,glad011,glad012,glad013,glad015,glad016,
#              glad031,glad032,glad033,
#              glad017,glad0171,glad0172,glad018,glad0181,glad0182,glad019,glad0191,glad0192,
#              glad020,glad0201,glad0202,glad021,glad0211,glad0212,glad022,glad0221,glad0222,
#              glad023,glad0231,glad0232,glad024,glad0241,glad0242,glad025,glad0251,glad0252,
#              glad026,glad0261,glad0262              
#         INTO l_glad007,l_glad008,l_glad009,l_glad010,l_glad027,l_glad011,l_glad012,l_glad013,l_glad015,l_glad016,
#              l_glad031,l_glad032,l_glad033,
#              l_glad017,l_glad0171,l_glad0172,l_glad018,l_glad0181,l_glad0182,l_glad019,l_glad0191,l_glad0192,
#              l_glad020,l_glad0201,l_glad0202,l_glad021,l_glad0211,l_glad0212,l_glad022,l_glad0221,l_glad0222,
#              l_glad023,l_glad0231,l_glad0232,l_glad024,l_glad0241,l_glad0242,l_glad025,l_glad0251,l_glad0252,
#              l_glad026,l_glad0261,l_glad0262
#         FROM glad_t
#       WHERE gladent = g_enterprise
#         AND gladld  = p_fabgld
#         AND glad001 = l_fabs.fabs007    
#      
#      #======================================
#      #固定核算项检查
#      #如果启用改固定核算项勾选，则对该核算项的值进行检查
#      #======================================  
#      #20141218 add by chenying
#      
#      #部门检查-#該科目做部門管理時，部門不可空白
#      IF l_glad007 = 'Y' THEN
#         IF cl_null(l_fabs.fabs015) THEN
#            LET r_success = FALSE    
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007,fabs015',l_errmsg,'','agl-00043',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00043'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()  
#         ELSE   
#            CALL s_department_chk(l_fabs.fabs015,l_fabg.fabgdocdt) RETURNING l_success        
#            IF l_success = FALSE THEN
#               LET r_success = FALSE
#            END IF               
#         END IF
#      END IF
#      
#      #利润成本中心检查--#該科目做利潤成本管理時，利潤成本不可空白
#      IF l_glad008 = 'Y' THEN
#         IF cl_null(l_fabs.fabs016) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007,fabs016',l_errmsg,'','agl-00044',1)  #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00044'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()  
#         ELSE
#            CALL s_voucher_glaq019_chk(l_fabs.fabs016,l_fabg.fabgdocdt)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabs.fabs016
#               LET g_errparam.code   = g_errno
#               #160321-00016#5 --s add
#               #(s_voucher_glaq019_chk)aoo-00029->sub-01302
#               IF g_errno = 'sub-01302' THEN
#                  LET g_errparam.replace[1] = 'aooi125'
#                  LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
#                  LET g_errparam.exeprog = 'aooi125'
#               END IF
#               #160321-00016#5 --e ad
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()                  
#            END IF               
#         END IF
#      END IF                      
#       
#      #区域检查 #該科目做區域管理時，區域不可空白
#      IF l_glad009 = 'Y' THEN
#         IF cl_null(l_fabs.fabs017) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007,fabs017',l_errmsg,'','agl-00045',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00045'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()   
#         ELSE
#            CALL s_azzi650_chk_exist('287',l_fabs.fabs017) RETURNING l_success
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#            END IF                 
#         END IF
#      END IF  
#       
#      #客商检查-#該科目做交易客商管理時，客商不可空白 
#      IF l_glad010 = 'Y' THEN
#         IF cl_null(l_fabs.fabs018) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'','agl-00046',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00046'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()   
#         ELSE
#            CALL s_voucher_glaq021_chk(l_fabs.fabs018)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
##               CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'',g_errno,1)  #cymod
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabs.fabs018
#               LET g_errparam.code   = g_errno
#               LET g_errparam.popup  = TRUE 
#               #160321-00016#5 --s add
#               #(s_voucher_glaq021_chk)apm-00029->sub-01302
#               LET g_errparam.replace[1] = 'apmm100'
#               LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
#               LET g_errparam.exeprog = 'apmm100'
#               #160321-00016#5 --e add
#               CALL cl_err()   
#            END IF                  
#         END IF
#      END IF  
#       
#      #客商检查--#該科目做账款客商管理時，客商不可空白
#      IF l_glad027 = 'Y' THEN
#         IF cl_null(l_fabs.fabs019) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'','axr-00215',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'axr-00215'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         ELSE
#            CALL s_voucher_glaq021_chk(l_fabs.fabs019)
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE   
##               CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'',g_errno,1) #cymod
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = l_errmsg||'/'||l_fabs.fabs019
#               LET g_errparam.code   = g_errno
#               #160321-00016#5 --s add
#               #(s_voucher_glaq021_chk)apm-00029->sub-01302
#               LET g_errparam.replace[1] = 'apmm100'
#               LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
#               LET g_errparam.exeprog = 'apmm100'
#               #160321-00016#5 --e add
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err() 
#            END IF                  
#         END IF
#      END IF  
#      
#      #客群检查-#該科目做客群管理時，客群不可空白
#      IF l_glad011 = 'Y' THEN
#         IF cl_null(l_fabs.fabs020) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007,fabs020',l_errmsg,'','agl-00047',1) 
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00047'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         ELSE
#            CALL s_azzi650_chk_exist('281',l_fabs.fabs020) RETURNING l_success
#            IF l_success = FALSE THEN
#               LET r_success = FALSE    
#            END IF                  
#         END IF
#      END IF  
#      
#      #人员
#      IF l_glad013 = 'Y' THEN
#         IF cl_null(l_fabs.fabs022) THEN 
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'','agl-00069',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg 
#            LET g_errparam.code   = 'agl-00069'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         ELSE
#           CALL s_employee_chk(l_fabs.fabs022) RETURNING l_success 
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#            END IF                                   
#         END IF
#      END IF
#      
#      #專案检查
#      IF l_glad015 = 'Y' THEN
#         IF cl_null(l_fabs.fabs024) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'','agl-00071',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00071'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         ELSE
#            CALL s_aap_project_chk(l_fabs.fabs024) RETURNING l_success,g_errno
#            IF l_success = FALSE THEN
#               LET r_success = FALSE   
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno
#               LET g_errparam.extend = l_errmsg||'/'||l_fabs.fabs024
#               #160321-00016#5 --s add
#               #(s_aap_project_chk)apj-00002->sub-01302
#               LET g_errparam.replace[1] = 'apjm200'
#               LET g_errparam.replace[2] = cl_get_progname('apjm200',g_lang,"2")
#               LET g_errparam.exeprog = 'apjm200'
#               #160321-00016#5 --e add
#               LET g_errparam.popup = TRUE
#               CALL cl_err()               
#            END IF               
#         END IF
#      END IF
#      
#      #WBS检查 
#      IF l_glad016 = 'Y' THEN
#         IF cl_null(l_fabs.fabs025) THEN
#            LET r_success = FALSE
##            CALL cl_errmsg('fabsdocno,fabsseq,fabs007',l_errmsg,'','agl-00072',1) #cymod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_errmsg
#            LET g_errparam.code   = 'agl-00072'
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err() 
#         ELSE
#            CALL s_voucher_glaq028_chk(l_fabs.fabs024,l_fabs.fabs025) 
#            IF NOT cl_null(g_errno) THEN
#               LET r_success = FALSE
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = g_errno||'/'||l_fabs.fabs025
#               LET g_errparam.extend = l_errmsg
#               LET g_errparam.popup = TRUE
#               CALL cl_err()               
#            END IF
#         END IF   
#      END IF 
#180119-00017#1 mark-e      
      
#      #該科目做經營方式管理時，不可空白
#      IF l_glad031 = 'Y' THEN  
#         IF cl_null(l_fabs.fabs041) THEN
#            LET r_success = FALSE
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00286',1) 
#         ELSE
#            CALL s_voucher_glaq051_chk(l_fabs.fabs041)  
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',g_errno,1) 
#         END IF
#      END IF      
#      #該科目做渠道管理時，不可空白
#      IF l_glad032 = 'Y' THEN  
#         IF cl_null(l_fabs.fabs042) THEN
#            LET r_success = FALSE
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00287',1)
#         ELSE
#            CALL s_voucher_glaq052_chk(l_fabs.fabs042)  
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',g_errno,1)             
#         END IF      
#      END IF         
#      #該科目做品牌管理時，不可空白
#      IF l_glad033 = 'Y' THEN
#         IF cl_null(l_fabs.fabs043) THEN
#            LET r_success = FALSE
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00288',1) 
#         ELSE
#            CALL s_voucher_glaq020_chk('2002',l_fabs.fabs043)  
#            CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',g_errno,1)             
#         END IF      
#      END IF 
#
#      #===================================================
#      #自由核算项检查
#      #如果启用该核算项勾选，并且控制方式不为1：允许空白，则对核算项的值进行检查
#      #===================================================
#      #核算项一
#       IF l_glad017 = 'Y' THEN
#          IF l_glad0172<>'1' THEN
#             IF cl_null(l_fabs.fabs060) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00074',1)
#             END IF
#          END IF
#          IF NOT cl_null(l_fabs.fabs060) THEN          
#             CALL s_voucher_free_account_chk(l_glad0171,l_fabs.fabs060,l_glad0172) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#           END IF   
#       END IF 
#       #核算项二
#       IF l_glad018 = 'Y'  THEN
#          IF l_glad0182 <>'1' THEN 
#             IF cl_null(l_fabs.fabs061) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00075',1)
#             END IF
#          END IF
#          IF NOT cl_null(l_fabs.fabs061) THEN          
#             CALL s_voucher_free_account_chk(l_glad0181,l_fabs.fabs061,l_glad0182) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF    
#       END IF
#       #核算项三
#       IF l_glad019 = 'Y'  THEN
#          IF l_glad0192 <>'1'  THEN 
#             IF cl_null(l_fabs.fabs062) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00076',1)
#             END IF
#          END IF   
#          IF NOT cl_null(l_fabs.fabs062) THEN        
#             CALL s_voucher_free_account_chk(l_glad0191,l_fabs.fabs062,l_glad0192) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF    
#       END IF 
#       #核算项四
#       IF l_glad020 = 'Y' THEN
#          IF l_glad0202 <>'1' THEN
#             IF cl_null(l_fabs.fabs063) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00077',1)
#             END IF   
#          END IF
#          IF NOT cl_null(l_fabs.fabs063) THEN
#             CALL s_voucher_free_account_chk(l_glad0201,l_fabs.fabs063,l_glad0202) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF    
#       END IF
#       #核算项五
#       IF l_glad021 = 'Y'  THEN
#          IF l_glad0212 <>'1' THEN
#             IF cl_null(l_fabs.fabs064) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00078',1)
#             END IF
#          END IF
#          IF NOT cl_null(l_fabs.fabs064) THEN
#             CALL s_voucher_free_account_chk(l_glad0211,l_fabs.fabs064,l_glad0212) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF    
#       END IF 
#        #核算项六
#       IF l_glad022 = 'Y'  THEN
#          IF l_glad0222 <>'1' THEN 
#             IF cl_null(l_fabs.fabs065) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00079',1)
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabs.fabs065) THEN          
#             CALL s_voucher_free_account_chk(l_glad0221,l_fabs.fabs065,l_glad0222) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF
#          END IF           
#       END IF 
#       #核算项七
#       IF l_glad023 = 'Y'  THEN
#          IF l_glad0232 <>'1' THEN 
#             IF cl_null(l_fabs.fabs066) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00080',1)
#             END IF  
#          END IF
#          IF NOT cl_null(l_fabs.fabs066) THEN          
#             CALL s_voucher_free_account_chk(l_glad0231,l_fabs.fabs066,l_glad0232) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF
#          END IF           
#       END IF
#       #核算项八
#       IF l_glad024 = 'Y'  THEN
#          IF l_glad0242 <>'1' THEN 
#             IF cl_null(l_fabs.fabs067) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00081',1)
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabs.fabs067) THEN           
#             CALL s_voucher_free_account_chk(l_glad0241,l_fabs.fabs067,l_glad0242) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF 
#       END IF 
#       #核算项九
#       IF l_glad025 = 'Y'  THEN
#          IF l_glad0252 <>'1' THEN 
#             IF cl_null(l_fabs.fabs068) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00082',1)
#             END IF 
#          END IF
#          IF NOT cl_null(l_fabs.fabs068) THEN          
#             CALL s_voucher_free_account_chk(l_glad0251,l_fabs.fabs068,l_glad0252) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF
#          END IF           
#       END IF        
#       #核算项十
#       IF l_glad026 = 'Y'  THEN
#          IF l_glad0262 <>'1' THEN 
#             IF cl_null(l_fabs.fabs069) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'','agl-00083',1)
#             END IF  
#          END IF
#          IF NOT cl_null(l_fabs.fabs069) THEN        
#             CALL s_voucher_free_account_chk(l_glad0261,l_fabs.fabs069,l_glad0262) RETURNING l_errno
#             IF NOT cl_null(l_errno) THEN
#                LET r_success = FALSE
#                CALL cl_errmsg('fabsdocno,fabsseq',l_errmsg,'',l_errno,1)
#             END IF 
#          END IF 
#       END IF     
#   END FOREACH  #181204-00026#6 mark  #不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项  
#   END IF #20150112 add by chenying #181204-00026#6 mark #不启用分录,上面代码将临时表插入glgb glgb在s_chk_voucher中检核科目有效性等和科目核算项 
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 审核、录入时，当前异动作业和其他异动作业财编+附号+卡片检查是否存在未审核资料
# Memo...........:
# Usage..........: CALL s_afat503_conf_ins_tab_chk(p_docno,p_ld,p_faah003,p_faah004,p_faah001)
#                  RETURNING r_success 
# Input parameter: p_docno    当前异动单据
#                : p_ld       
#                : p_faah003  财编
#                : p_faah004  附号
#                : p_faah001  卡片
# Return code....: r_success   
#                :  
# Date & Author..: 2014/12/24 By chenying
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_ins_tab_chk(p_docno,p_ld,p_faah003,p_faah004,p_faah001)
DEFINE r_success           LIKE type_t.num5  
DEFINE p_faah003           LIKE faah_t.faah003
DEFINE p_faah004           LIKE faah_t.faah004
DEFINE p_faah001           LIKE faah_t.faah001
DEFINE p_ld                LIKE fabg_t.fabgld
DEFINE p_docno             LIKE fabg_t.fabgdocno
DEFINE l_prog              LIKE type_t.chr10
DEFINE l_fabg005           LIKE fabg_t.fabg005
DEFINE l_docno             LIKE fabg_t.fabgdocno
DEFINE l_errmsg            LIKE type_t.chr100
DEFINE l_cnt               LIKE type_t.num5

#4*检查
#fabn-afat400
#fabb-afat410,afat430
#fabk-afat440,afat450
#fabl-afat470,afat480

#5*检查
#fabh-afat502,afat503,afat506,afat507,afat508,afat513,afat514,afat521(afat509排除)
#fabo-afat504
#fabs-afat500
#fabd-afat501
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   LET l_cnt     = 0
   LET l_prog    = NULL
   LET l_fabg005 = NULL
   LET l_docno   = NULL
   LET l_errmsg  = NULL
   
   #cursor###############################################
   #afat400
   LET g_sql = " SELECT faba003,fabadocno FROM faba_t LEFT OUTER JOIN fabn_t ON fabaent = fabnent AND fabadocno = fabndocno ",
               "  WHERE fabn001 = ? AND fabn002 = ? AND fabn003 = ? ",
               "    AND fabaent = ",g_enterprise, #170926-00009#1 add
               "    AND fabastus = 'N' ",
               "    AND faba003 IN ('1') ",
               "    AND fabadocno <> ? "                
   PREPARE s_afat503_fabn_pr FROM g_sql 
   DECLARE s_afat503_fabn_cs CURSOR FOR s_afat503_fabn_pr  
   
   #afat410,afat430
   LET g_sql = " SELECT faba003,fabadocno FROM faba_t LEFT OUTER JOIN fabb_t ON fabaent = fabbent AND fabadocno = fabbdocno ",
               "  WHERE fabb001 = ? AND fabb002 = ? AND fabb000 = ? ",
               "    AND fabaent = ",g_enterprise, #170926-00009#1 add
               "    AND fabastus = 'N' ",
               "    AND faba003 IN ('5','7') ",
               "    AND fabadocno <> ? "                
   PREPARE s_afat503_fabb_pr FROM g_sql 
   DECLARE s_afat503_fabb_cs CURSOR FOR s_afat503_fabb_pr  
   
   #afat440,afat450
   LET g_sql = " SELECT faba003,fabadocno FROM faba_t LEFT OUTER JOIN fabk_t ON fabaent = fabkent AND fabadocno = fabkdocno ",
               "  WHERE fabk001 = ? AND fabk002 = ? AND fabk000 = ? ",
               "    AND fabaent = ",g_enterprise, #170926-00009#1 add
               "    AND fabastus = 'N' ",
               "    AND faba003 IN ('10','11') ",
               "    AND fabadocno <> ? "                
   PREPARE s_afat503_fabk_pr FROM g_sql 
   DECLARE s_afat503_fabk_cs CURSOR FOR s_afat503_fabk_pr  

   #afat470,afat480
   LET g_sql = " SELECT faba003,fabadocno FROM faba_t LEFT OUTER JOIN fabl_t ON fabaent = fablent AND fabadocno = fabldocno ",
               "  WHERE fabl001 = ? AND fabl002 = ? AND fabl003 = ? ",
               "    AND fabaent = ",g_enterprise, #170926-00009#1 add
               "    AND fabastus = 'N' ",
               "    AND faba003 IN ('18','19') ",
               "    AND fabadocno <> ? "                
   PREPARE s_afat503_fabl_pr FROM g_sql 
   DECLARE s_afat503_fabl_cs CURSOR FOR s_afat503_fabl_pr  

   #afat502,afat503,afat506,afat507,afat508,afat513,afat514,afat521
   LET g_sql = " SELECT fabg005,fabgdocno FROM fabg_t LEFT OUTER JOIN fabh_t ON fabgent = fabhent AND fabgdocno = fabhdocno AND fabgld = fabhld ",
               "  WHERE fabh001 = ? AND fabh002 = ? AND fabh000 = ? ",
               "    AND fabgent = ",g_enterprise, #170926-00009#1 add
               #"    AND fabgstus = 'N' ",    #160304-00002#2 mark lujh
               "    AND fabgstus IN ('N','Y') ",   #160304-00002#2 add lujh
               "    AND fabg005 IN ('14','8','6','21','9','23','24','31','39') ", #150417-00007#65 add '31'    #160426-00014#10 add 39
               "    AND fabgdocno <> ? "
   #20150123 mod by chenying
   #4*无帐套，检查时需抓5*所有帐套资料
   IF NOT cl_null(p_ld) THEN              
      LET g_sql = g_sql CLIPPED,"    AND fabgld = '",p_ld,"'"   
   END IF
   #20150123 mod by chenying   
   PREPARE s_afat503_fabh_pr FROM g_sql 
   DECLARE s_afat503_fabh_cs CURSOR FOR s_afat503_fabh_pr 
   
   #afat504
   LET g_sql = " SELECT fabg005,fabgdocno FROM fabg_t LEFT OUTER JOIN fabo_t ON fabgent = faboent AND fabgdocno = fabodocno AND fabgld = fabold ",
               "  WHERE fabo001 = ? AND fabo002 = ? AND fabo003 = ? ",
               "    AND fabgent = ",g_enterprise, #170926-00009#1 add
               #"    AND fabgstus = 'N' ",   #160304-00002#2 mark lujh
               "    AND fabgstus IN ('N','Y') ",  #160304-00002#2 add lujh
               "    AND fabg005 IN ('4') ",
               "    AND fabgdocno <> ? "
   #20150123 mod by chenying
   #4*无帐套，检查时需抓5*所有帐套资料
   IF NOT cl_null(p_ld) THEN              
      LET g_sql = g_sql CLIPPED,"    AND fabgld = '",p_ld,"'"   
   END IF 
   #20150123 mod by chenying                
   PREPARE s_afat503_fabo_pr FROM g_sql 
   DECLARE s_afat503_fabo_cs CURSOR FOR s_afat503_fabo_pr  
   
   #add by yangxf ---
   #afat511
   LET g_sql = " SELECT fabg005,fabgdocno FROM fabg_t LEFT OUTER JOIN fabp_t ON fabgent = fabpent AND fabgdocno = fabpdocno AND fabgld = fabpld ",
               "  WHERE fabp001 = ? AND fabp002 = ? AND fabp000 = ? ",
               "    AND fabgent = ",g_enterprise, #170926-00009#1 add
               "    AND fabgstus IN ('N','Y') ",
               "    AND fabg005 = '30' ",
               "    AND fabgld = '",p_ld,"'",
               "    AND fabgdocno <> ? "
   PREPARE s_afat503_fabp_pr FROM g_sql 
   DECLARE s_afat503_fabp_cs CURSOR FOR s_afat503_fabp_pr 
   #add by yangxf ---
   #afat500
   LET g_sql = " SELECT fabg005,fabgdocno FROM fabg_t LEFT OUTER JOIN fabs_t ON fabgent = fabsent AND fabgdocno = fabsdocno AND fabgld = fabsld ",
               "  WHERE fabs004 = ? AND fabs005 = ? AND fabs006 = ? ",
               "    AND fabgent = ",g_enterprise, #170926-00009#1 add
               #"    AND fabgstus = 'N' ",   #160304-00002#2 mark lujh
               "    AND fabgstus IN ('N','Y') ",   #160304-00002#2 add lujh
               "    AND fabg005 IN ('22') ",
               "    AND fabgdocno <> ? "
   #20150123 mod by chenying
   #4*无帐套，检查时需抓5*所有帐套资料
   IF NOT cl_null(p_ld) THEN              
      LET g_sql = g_sql CLIPPED,"    AND fabgld = '",p_ld,"'"  
   END IF 
   #20150123 mod by chenying               
   PREPARE s_afat503_fabs_pr FROM g_sql 
   DECLARE s_afat503_fabs_cs CURSOR FOR s_afat503_fabs_pr  
   
   #afat501
   LET g_sql = " SELECT fabg005,fabgdocno FROM fabg_t LEFT OUTER JOIN fabd_t ON fabgent = fabdent AND fabgdocno = fabddocno AND fabgld = fabdld ",
               "  WHERE fabd001 = ? AND fabd002 = ? AND fabd000 = ? ",
               "    AND fabgent = ",g_enterprise, #170926-00009#1 add
               "    AND fabgstus = 'N' ",   #160304-00002#2 mark lujh        #170921-00036#1 remark
               #"    AND fabgstus IN ('N','Y') ",   #160304-00002#2 add lujh #170921-00036#1 mark
               "    AND fabg005 IN ('12') ",
               "    AND fabgdocno <> ? "
   #20150123 mod by chenying
   #4*无帐套，检查时需抓5*所有帐套资料
   IF NOT cl_null(p_ld) THEN              
      LET g_sql = g_sql CLIPPED,"    AND fabgld = '",p_ld,"'"   
   END IF
   #20150123 mod by chenying
   PREPARE s_afat503_fabd_pr FROM g_sql 
   DECLARE s_afat503_fabd_cs CURSOR FOR s_afat503_fabd_pr  
   #######################################################
   
   
   #4*检查
   #fabn-afat400
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM faba_t LEFT OUTER JOIN fabn_t 
       ON fabaent = fabnent AND fabadocno = fabndocno 
    WHERE fabnent = g_enterprise 
      AND fabn001 = p_faah003
      AND fabn002 = p_faah004
      AND fabn003 = p_faah001
      AND fabastus = 'N'
      AND faba003 IN ('1')
      AND fabadocno <> p_docno
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabn_cs USING p_faah003,p_faah004,p_faah001,p_docno 
         INTO l_fabg005,l_docno
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabn_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         LET l_prog = 'afat400'
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1)   #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00333'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH      
   END IF
   
   #fabb-afat410,afat430
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM faba_t LEFT OUTER JOIN fabb_t 
       ON fabaent = fabbent AND fabadocno = fabbdocno 
    WHERE fabbent = g_enterprise 
      AND fabb001 = p_faah003
      AND fabb002 = p_faah004
      AND fabb000 = p_faah001
      AND fabastus = 'N'
      AND faba003 IN ('5','7')
      AND fabadocno <> p_docno
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabb_cs USING p_faah003,p_faah004,p_faah001,p_docno 
         INTO l_fabg005,l_docno
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabb_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         CASE l_fabg005 
           WHEN '5' LET l_prog = 'afat410'
           WHEN '7' LET l_prog = 'afat430'
         END CASE

         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00333'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH     
   END IF
   
   #fabk-afat440,afat450
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM faba_t LEFT OUTER JOIN fabk_t 
       ON fabaent = fabkent AND fabadocno = fabkdocno 
    WHERE fabkent = g_enterprise 
      AND fabk001 = p_faah003
      AND fabk002 = p_faah004
      AND fabk000 = p_faah001
      AND fabastus = 'N'
      AND faba003 IN ('10','11')
      AND fabadocno <> p_docno
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabk_cs USING p_faah003,p_faah004,p_faah001,p_docno 
         INTO l_fabg005,l_docno
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabk_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         CASE l_fabg005 
           WHEN '10' LET l_prog = 'afat440'
           WHEN '11' LET l_prog = 'afat450'
         END CASE

         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00333'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH     
   END IF
   
   #fabl-afat470,afat480
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM faba_t LEFT OUTER JOIN fabl_t 
       ON fabaent = fablent AND fabadocno = fabldocno 
    WHERE fablent = g_enterprise 
      AND fabl001 = p_faah003
      AND fabl002 = p_faah004
      AND fabl003 = p_faah001
      AND fabastus = 'N'
      AND faba003 IN ('18','19')
      AND fabadocno <> p_docno
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabl_cs USING p_faah003,p_faah004,p_faah001,p_docno 
         INTO l_fabg005,l_docno
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabl_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         CASE l_fabg005 
           WHEN '18' LET l_prog = 'afat470'
           WHEN '19' LET l_prog = 'afat480'
         END CASE

         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00333'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH      
   END IF 

   #5*检查
   #fabh-afat502,afat503,afat506,afat507,afat508,afat513,afat514,afat521
   LET l_cnt = 0
   #20150123 mod by chenying
   IF NOT cl_null(p_ld) THEN 
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabh_t 
          ON fabgent = fabhent AND fabgdocno = fabhdocno 
       WHERE fabhent = g_enterprise 
         AND fabgld  = p_ld 
         AND fabh001 = p_faah003
         AND fabh002 = p_faah004
         AND fabh000 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('14','8','6','21','9','23','24','31','39') #150417-00007#65 add '31'    #160426-00014#10 add 39
         AND fabgdocno <> p_docno
   ELSE
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabh_t 
          ON fabgent = fabhent AND fabgdocno = fabhdocno 
       WHERE fabhent = g_enterprise 
         AND fabh001 = p_faah003
         AND fabh002 = p_faah004
         AND fabh000 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('14','8','6','21','9','23','24','31','39') #150417-00007#65 add '31'  #160426-00014#10 add 39
         AND fabgdocno <> p_docno
   END IF         
   #20150123 mod by chenying      
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL

 
      FOREACH s_afat503_fabh_cs USING p_faah003,p_faah004,p_faah001,p_docno INTO l_fabg005,l_docno
 
      
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabh_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         CASE l_fabg005 
           WHEN '14' LET l_prog = 'afat502'
           WHEN '8'  LET l_prog = 'afat503'
           WHEN '6'  LET l_prog = 'afat506'
           WHEN '21' LET l_prog = 'afat507'
           WHEN '9'  LET l_prog = 'afat508'
           WHEN '23' LET l_prog = 'afat513'
           WHEN '24' LET l_prog = 'afat514'
           WHEN '39' LET l_prog = 'afat523' #160426-00014#10
         END CASE
         
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         #LET g_errparam.code   = 'afa-00333'     #160304-00002#2 mark lujh
         LET g_errparam.code   = 'afa-00458'      #160304-00002#2 add lujh
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH         
   END IF 
   
   #fabo-afat504
   LET l_cnt = 0
   #20150123 mod by chenying
   IF NOT cl_null(p_ld) THEN    
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabo_t 
          ON fabgent = faboent AND fabgdocno = fabodocno 
       WHERE faboent = g_enterprise 
         AND fabgld  = p_ld 
         AND fabo001 = p_faah003
         AND fabo002 = p_faah004
         AND fabo003 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('4')
         AND fabgdocno <> p_docno
   ELSE
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabo_t 
          ON fabgent = faboent AND fabgdocno = fabodocno 
       WHERE faboent = g_enterprise 
         AND fabo001 = p_faah003
         AND fabo002 = p_faah004
         AND fabo003 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('4')
         AND fabgdocno <> p_docno   
   END IF 
   #20150123 mod by chenying   
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabo_cs USING p_faah003,p_faah004,p_faah001,p_docno INTO l_fabg005,l_docno     
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabo_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         LET l_prog = 'afat504'
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         #LET g_errparam.code   = 'afa-00333'     #160304-00002#2 mark lujh
         LET g_errparam.code   = 'afa-00458'      #160304-00002#2 add lujh
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH      
   END IF 
   
   #fabs-afat500
   LET l_cnt = 0
   #20150123 mod by chenying
   IF NOT cl_null(p_ld) THEN   
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabs_t 
          ON fabgent = fabsent AND fabgdocno = fabsdocno 
       WHERE fabsent = g_enterprise 
         AND fabgld  = p_ld 
         AND fabs004 = p_faah003
         AND fabs005 = p_faah004
         AND fabs006 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('22')
         AND fabgdocno <> p_docno
   ELSE
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabs_t 
          ON fabgent = fabsent AND fabgdocno = fabsdocno 
       WHERE fabsent = g_enterprise 
         AND fabs004 = p_faah003
         AND fabs005 = p_faah004
         AND fabs006 = p_faah001
         #AND fabgstus = 'N'          #160304-00002#2 mark lujh
         AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh
         AND fabg005 IN ('22')
         AND fabgdocno <> p_docno   
   END IF 
   #20150123 mod by chenying   
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
   
      FOREACH s_afat503_fabs_cs USING p_faah003,p_faah004,p_faah001,p_docno INTO l_fabg005,l_docno   
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabs_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         LET l_prog = 'afat500'
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         #LET g_errparam.code   = 'afa-00333'     #160304-00002#2 mark lujh
         LET g_errparam.code   = 'afa-00458'      #160304-00002#2 add lujh
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH      
   END IF     
   
   #fabd-afat501
   LET l_cnt = 0
   #20150123 mod by chenying
   IF NOT cl_null(p_ld) THEN    
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabd_t 
          ON fabgent = fabdent AND fabgdocno = fabddocno 
       WHERE fabdent = g_enterprise 
         AND fabgld  = p_ld 
         AND fabd001 = p_faah003
         AND fabd002 = p_faah004
         AND fabd000 = p_faah001
         AND fabgstus = 'N'          #160304-00002#2 mark lujh   #170921-00036#1 remark
         #AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh  #170921-00036#1 mark
         AND fabg005 IN ('12')
         AND fabgdocno <> p_docno
   ELSE
      SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabd_t 
          ON fabgent = fabdent AND fabgdocno = fabddocno 
       WHERE fabdent = g_enterprise 
         AND fabd001 = p_faah003
         AND fabd002 = p_faah004
         AND fabd000 = p_faah001
         AND fabgstus = 'N'          #160304-00002#2 mark lujh  #170921-00036#1 remark
         #AND fabgstus IN ('N','Y')    #160304-00002#2 add lujh #170921-00036#1 mark
         AND fabg005 IN ('12')
         AND fabgdocno <> p_docno   
   END IF  
   #20150123 mod by chenying   
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL
      
      FOREACH s_afat503_fabd_cs USING p_faah003,p_faah004,p_faah001,p_docno INTO l_fabg005,l_docno     
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabd_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         
         LET l_prog = 'afat501'
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
#         CALL cl_errmsg('',l_errmsg,'','afa-00333',1) #cymod
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00333'     #160304-00002#2 mark lujh  #170921-00036#1 remark
         #LET g_errparam.code   = 'afa-00458'      #160304-00002#2 add lujh #170921-00036#1 mark
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH      
   END IF    
#add by yangxf ---
   #afat511
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM fabg_t LEFT OUTER JOIN fabp_t 
       ON fabgent = fabpent AND fabgdocno = fabpdocno 
    WHERE fabpent = g_enterprise 
      AND fabpld  = p_ld 
      AND fabp001 = p_faah003
      AND fabp002 = p_faah004
      AND fabp000 = p_faah001
      AND fabgstus IN ('N','Y')
      AND fabg005 = '30'
      AND fabgdocno <> p_docno
   IF l_cnt > 0 THEN 
      LET l_prog    = NULL
      LET l_fabg005 = NULL
      LET l_docno   = NULL
      LET l_errmsg  = NULL

 
      FOREACH s_afat503_fabp_cs USING p_faah003,p_faah004,p_faah001,p_docno INTO l_fabg005,l_docno
 
      
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_afat503_fabp_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF   
         LET l_prog = 'afat511'
         
         LET l_errmsg = l_prog||'/'||l_docno||'/'||p_faah003||'/'||p_faah004||'/'||p_faah001
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = 'afa-00458'
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END FOREACH
   END IF   

#add by yangxf ---
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: BPM
# Memo...........:
# Usage..........: CALL s_afat503_ws_confirm(p_fabgdocno)
#                  RETURNING r_success
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_ws_confirm(p_fabgdocno)
DEFINE p_fabgdocno     LIKE fabg_t.fabgdocno
DEFINE r_success  LIKE type_t.num5
DEFINE l_fabgld  LIKE fabg_t.fabgld
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #抓取單據key欄位 CALL cl_bpm_get_key_value(“key值欄位”) 
   LET l_fabgld = cl_bpm_get_key_value('fabgld')
   
   CALL s_afat503_conf_chk_fabg(l_fabgld,p_fabgdocno) RETURNING r_success
   IF r_success = TRUE THEN
      CALL s_afat503_conf_upd_fabg(l_fabgld,p_fabgdocno) RETURNING r_success 
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: afat521资产科目异动审核时单身栏位检查
# Memo...........:
# Usage..........: CALL s_afat503_conf_chk_31(p_fabgld,p_fabgdocno)
#                  RETURNING r_success
# Input parameter: p_fabgld       账套
#                : p_fabgdocno    单号
# Return code....: r_success      检查结果
# Date & Author..: 2015/08/20 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_conf_chk_31(p_fabgld,p_fabgdocno)
   DEFINE p_fabgld         LIKE fabg_t.fabgld
   DEFINE p_fabgdocno      LIKE fabg_t.fabgdocno
   DEFINE r_success        LIKE type_t.num5
  #161128-00061#6---modify--begin--------------------
   #DEFINE l_fabg              RECORD LIKE fabg_t.*
   #DEFINE l_fabh              RECORD LIKE fabh_t.*
   DEFINE l_fabg RECORD  #資產異動單頭檔(一帳套)
       fabgent LIKE fabg_t.fabgent, #企業編號
       fabgcomp LIKE fabg_t.fabgcomp, #法人
       fabgld LIKE fabg_t.fabgld, #帳套
       fabgdocno LIKE fabg_t.fabgdocno, #來源單號
       fabgdocdt LIKE fabg_t.fabgdocdt, #單據日期
       fabgsite LIKE fabg_t.fabgsite, #資產中心
       fabg001 LIKE fabg_t.fabg001, #帳務人員
       fabg002 LIKE fabg_t.fabg002, #申請人員
       fabg003 LIKE fabg_t.fabg003, #申請部門
       fabg004 LIKE fabg_t.fabg004, #申請日期
       fabg005 LIKE fabg_t.fabg005, #異動類型
       fabg006 LIKE fabg_t.fabg006, #帳款客戶
       fabg007 LIKE fabg_t.fabg007, #收款客戶
       fabg008 LIKE fabg_t.fabg008, #傳票號碼
       fabg009 LIKE fabg_t.fabg009, #傳票日期
       fabg010 LIKE fabg_t.fabg010, #所有組織
       fabg011 LIKE fabg_t.fabg011, #產生應收帳款編號
       fabg012 LIKE fabg_t.fabg012, #產生應付帳款編號
       fabg013 LIKE fabg_t.fabg013, #稅別
       fabg014 LIKE fabg_t.fabg014, #稅率
       fabg015 LIKE fabg_t.fabg015, #幣別
       fabg016 LIKE fabg_t.fabg016, #匯率
       fabg017 LIKE fabg_t.fabg017, #調撥流水碼
       fabg018 LIKE fabg_t.fabg018, #核算組織
       fabg019 LIKE fabg_t.fabg019, #來源單號
       fabgstus LIKE fabg_t.fabgstus, #狀態碼
       fabgownid LIKE fabg_t.fabgownid, #資料所有者
       fabgowndp LIKE fabg_t.fabgowndp, #資料所屬部門
       fabgcrtid LIKE fabg_t.fabgcrtid, #資料建立者
       fabgcrtdp LIKE fabg_t.fabgcrtdp, #資料建立部門
       fabgcrtdt LIKE fabg_t.fabgcrtdt, #資料創建日
       fabgmodid LIKE fabg_t.fabgmodid, #資料修改者
       fabgmoddt LIKE fabg_t.fabgmoddt, #最近修改日
       fabgcnfid LIKE fabg_t.fabgcnfid, #資料確認者
       fabgcnfdt LIKE fabg_t.fabgcnfdt, #資料確認日
       fabgpstid LIKE fabg_t.fabgpstid, #資料過帳者
       fabgpstdt LIKE fabg_t.fabgpstdt, #資料過帳日
       fabg020 LIKE fabg_t.fabg020  #資產性質
       END RECORD
   DEFINE l_fabh RECORD  #資產異動單身檔
       fabhent LIKE fabh_t.fabhent, #企業編號
       fabhld LIKE fabh_t.fabhld, #帳套
       fabhsite LIKE fabh_t.fabhsite, #營運據點
       fabhdocno LIKE fabh_t.fabhdocno, #異動單號
       fabhseq LIKE fabh_t.fabhseq, #項次
       fabh000 LIKE fabh_t.fabh000, #卡片編號
       fabh001 LIKE fabh_t.fabh001, #財產編號
       fabh002 LIKE fabh_t.fabh002, #附號
       fabh003 LIKE fabh_t.fabh003, #資產狀態
       fabh004 LIKE fabh_t.fabh004, #未折減餘額
       fabh005 LIKE fabh_t.fabh005, #單位
       fabh006 LIKE fabh_t.fabh006, #數量
       fabh007 LIKE fabh_t.fabh007, #處置數量
       fabh008 LIKE fabh_t.fabh008, #成本
       fabh009 LIKE fabh_t.fabh009, #累計調整成本
       fabh010 LIKE fabh_t.fabh010, #調整成本/公允價值
       fabh011 LIKE fabh_t.fabh011, #累折
       fabh012 LIKE fabh_t.fabh012, #重估累計折舊
       fabh013 LIKE fabh_t.fabh013, #未用年限
       fabh014 LIKE fabh_t.fabh014, #重估未用年限
       fabh015 LIKE fabh_t.fabh015, #預留殘值
       fabh016 LIKE fabh_t.fabh016, #重估預留殘值
       fabh017 LIKE fabh_t.fabh017, #已計提減值準備
       fabh018 LIKE fabh_t.fabh018, #異動
       fabh019 LIKE fabh_t.fabh019, #減值準備金額
       fabh020 LIKE fabh_t.fabh020, #異動原因
       fabh021 LIKE fabh_t.fabh021, #異動科目
       fabh022 LIKE fabh_t.fabh022, #調整成本科目
       fabh023 LIKE fabh_t.fabh023, #累計折舊科目
       fabh024 LIKE fabh_t.fabh024, #資產科目
       fabh025 LIKE fabh_t.fabh025, #減值準備科目
       fabh026 LIKE fabh_t.fabh026, #營運據點
       fabh027 LIKE fabh_t.fabh027, #部門
       fabh028 LIKE fabh_t.fabh028, #利潤/成本中心
       fabh029 LIKE fabh_t.fabh029, #區域
       fabh030 LIKE fabh_t.fabh030, #交易客商
       fabh031 LIKE fabh_t.fabh031, #帳款客商
       fabh032 LIKE fabh_t.fabh032, #客群
       fabh033 LIKE fabh_t.fabh033, #人員
       fabh034 LIKE fabh_t.fabh034, #專案編號
       fabh035 LIKE fabh_t.fabh035, #WBS
       fabh036 LIKE fabh_t.fabh036, #摘要
       fabh037 LIKE fabh_t.fabh037, #來源編號
       fabh038 LIKE fabh_t.fabh038, #來源項次
       fabh039 LIKE fabh_t.fabh039, #盤點編號
       fabh040 LIKE fabh_t.fabh040, #盤點序號
       fabh041 LIKE fabh_t.fabh041, #經營方式
       fabh042 LIKE fabh_t.fabh042, #通路
       fabh043 LIKE fabh_t.fabh043, #品牌
       fabh060 LIKE fabh_t.fabh060, #自由核算項一
       fabh061 LIKE fabh_t.fabh061, #自由核算項二
       fabh062 LIKE fabh_t.fabh062, #自由核算項三
       fabh063 LIKE fabh_t.fabh063, #自由核算項四
       fabh064 LIKE fabh_t.fabh064, #自由核算項五
       fabh065 LIKE fabh_t.fabh065, #自由核算項六
       fabh066 LIKE fabh_t.fabh066, #自由核算項七
       fabh067 LIKE fabh_t.fabh067, #自由核算項八
       fabh068 LIKE fabh_t.fabh068, #自由核算項九
       fabh069 LIKE fabh_t.fabh069, #自由核算項十
       fabh100 LIKE fabh_t.fabh100, #本位幣二幣別
       fabh101 LIKE fabh_t.fabh101, #本位幣二匯率
       fabh102 LIKE fabh_t.fabh102, #本位幣二成本
       fabh103 LIKE fabh_t.fabh103, #本位幣二調整成本
       fabh104 LIKE fabh_t.fabh104, #本位幣二累折
       fabh105 LIKE fabh_t.fabh105, #本位幣二重估累折
       fabh106 LIKE fabh_t.fabh106, #本位幣二預留殘值
       fabh107 LIKE fabh_t.fabh107, #本位幣二重估殘值
       fabh108 LIKE fabh_t.fabh108, #本位幣二未折減額
       fabh109 LIKE fabh_t.fabh109, #本位幣二已計提減值準備
       fabh110 LIKE fabh_t.fabh110, #本位幣二減值準備金額
       fabh150 LIKE fabh_t.fabh150, #本位幣三幣別
       fabh151 LIKE fabh_t.fabh151, #本位幣三匯率
       fabh152 LIKE fabh_t.fabh152, #本位幣三成本
       fabh153 LIKE fabh_t.fabh153, #本位幣三調整成本
       fabh154 LIKE fabh_t.fabh154, #本位幣三累折
       fabh155 LIKE fabh_t.fabh155, #本位幣三重估累折
       fabh156 LIKE fabh_t.fabh156, #本位幣三預留殘值
       fabh157 LIKE fabh_t.fabh157, #本位幣三重估殘值
       fabh158 LIKE fabh_t.fabh158, #本位幣三未折減額
       fabh159 LIKE fabh_t.fabh159, #本位幣三已計提減值準備
       fabh160 LIKE fabh_t.fabh160, #本位幣三減值準備金額
       fabh070 LIKE fabh_t.fabh070, #累計折舊科目(舊)
       fabh071 LIKE fabh_t.fabh071, #資產科目(舊)
       fabh072 LIKE fabh_t.fabh072, #減值準備科目(舊)
       fabh073 LIKE fabh_t.fabh073, #處置本年累折
       fabh111 LIKE fabh_t.fabh111, #本位幣二處置本年累折
       fabh161 LIKE fabh_t.fabh161, #本位幣三處置本年累折
       fabh074 LIKE fabh_t.fabh074, #保險費用科目
       fabh075 LIKE fabh_t.fabh075, #主要類別
       fabh076 LIKE fabh_t.fabh076  #主要類別新
       END RECORD    
   #161128-00061#6---modify--end--------------------
   DEFINE l_sql            STRING
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_glac002        LIKE glac_t.glac002
   DEFINE l_i              LIKE type_t.num5
   DEFINE l_errmsg         STRING
   DEFINE l_c              LIKE glaq_t.glaq003
   DEFINE l_d              LIKE glaq_t.glaq004
   DEFINE l_glad007        LIKE glad_t.glad007     #部門管理否
   DEFINE l_glad008        LIKE glad_t.glad008     #利潤成本中心管理
   DEFINE l_glad009        LIKE glad_t.glad009     #區域管理
   DEFINE l_glad010        LIKE glad_t.glad010     #交易客商管理
   DEFINE l_glad027        LIKE glad_t.glad027     #账款客商管理
   DEFINE l_glad011        LIKE glad_t.glad011     #客群管理否
   DEFINE l_glad012        LIKE glad_t.glad012     #產品類別
   DEFINE l_glad013        LIKE glad_t.glad013     #人員
   DEFINE l_glad015        LIKE glad_t.glad015     #专案管理否
   DEFINE l_glad016        LIKE glad_t.glad016     #wbs管理
   DEFINE l_glad031        LIKE glad_t.glad031     #經營方式管理
   DEFINE l_glad032        LIKE glad_t.glad032     #渠道管理
   DEFINE l_glad033        LIKE glad_t.glad033     #品牌管理
   DEFINE l_errno          LIKE type_t.chr10   
   #是否做自由科目核算项管理
   DEFINE l_glad017        LIKE glad_t.glad017
   DEFINE l_glad0171       LIKE glad_t.glad0171 
   DEFINE l_glad0172       LIKE glad_t.glad0172 
   DEFINE l_glad018        LIKE glad_t.glad018
   DEFINE l_glad0181       LIKE glad_t.glad0181
   DEFINE l_glad0182       LIKE glad_t.glad0182
   DEFINE l_glad019        LIKE glad_t.glad019
   DEFINE l_glad0191       LIKE glad_t.glad0191
   DEFINE l_glad0192       LIKE glad_t.glad0192
   DEFINE l_glad020        LIKE glad_t.glad020
   DEFINE l_glad0201       LIKE glad_t.glad0201
   DEFINE l_glad0202       LIKE glad_t.glad0202
   DEFINE l_glad021        LIKE glad_t.glad021
   DEFINE l_glad0211       LIKE glad_t.glad0211
   DEFINE l_glad0212       LIKE glad_t.glad0212
   DEFINE l_glad022        LIKE glad_t.glad022
   DEFINE l_glad0221       LIKE glad_t.glad0221
   DEFINE l_glad0222       LIKE glad_t.glad0222
   DEFINE l_glad023        LIKE glad_t.glad023
   DEFINE l_glad0231       LIKE glad_t.glad0231
   DEFINE l_glad0232       LIKE glad_t.glad0232
   DEFINE l_glad024        LIKE glad_t.glad024
   DEFINE l_glad0241       LIKE glad_t.glad0241
   DEFINE l_glad0242       LIKE glad_t.glad0242
   DEFINE l_glad025        LIKE glad_t.glad025
   DEFINE l_glad0251       LIKE glad_t.glad0251
   DEFINE l_glad0252       LIKE glad_t.glad0252
   DEFINE l_glad026        LIKE glad_t.glad026
   DEFINE l_glad0261       LIKE glad_t.glad0261
   DEFINE l_glad0262       LIKE glad_t.glad0262
   #180124-00038#1---add---str
   DEFINE l_comp   LIKE ooef_t.ooef001
   DEFINE l_chr    LIKE type_t.chr1
   DEFINE l_slip   LIKE type_t.chr10
   #180124-00038#1---add---end
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #初始化数组
   INITIALIZE l_fabg.* TO NULL
   
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_fabg.* 
   SELECT fabgent,fabgcomp,fabgld,fabgdocno,fabgdocdt,fabgsite,fabg001,fabg002,fabg003,
          fabg004,fabg005,fabg006,fabg007,fabg008,fabg009,fabg010,fabg011,fabg012,fabg013,
          fabg014,fabg015,fabg016,fabg017,fabg018,fabg019,fabgstus,fabgownid,fabgowndp,
          fabgcrtid,fabgcrtdp,fabgcrtdt,fabgmodid,fabgmoddt,fabgcnfid,fabgcnfdt,fabgpstid,
          fabgpstdt,fabg020 INTO l_fabg.* 
   #161128-00061#6---modify--end--------------------
   FROM fabg_t WHERE fabgent=g_enterprise AND fabgld=p_fabgld AND fabgdocno=p_fabgdocno
   #.单身科目无效，性質不為帳戶,不為明細或獨立帳戶,则返回报错
   #固定核算項欄位,其對應基本資料的合理性 
   #161128-00061#6---modify--begin--------------------
   #LET l_sql = " SELECT * FROM fabh_t",
   LET l_sql = " SELECT fabhent,fabhld,fabhsite,fabhdocno,fabhseq,fabh000,fabh001,fabh002,fabh003,",
               "fabh004,fabh005,fabh006,fabh007,fabh008,fabh009,fabh010,fabh011,fabh012,fabh013,fabh014,",
               "fabh015,fabh016,fabh017,fabh018,fabh019,fabh020,fabh021,fabh022,fabh023,fabh024,fabh025,",
               "fabh026,fabh027,fabh028,fabh029,fabh030,fabh031,fabh032,fabh033,fabh034,fabh035,fabh036,",
               "fabh037,fabh038,fabh039,fabh040,fabh041,fabh042,fabh043,fabh060,fabh061,fabh062,fabh063,",
               "fabh064,fabh065,fabh066,fabh067,fabh068,fabh069,fabh100,fabh101,fabh102,fabh103,fabh104,",
               "fabh105,fabh106,fabh107,fabh108,fabh109,fabh110,fabh150,fabh151,fabh152,fabh153,fabh154,",
               "fabh155,fabh156,fabh157,fabh158,fabh159,fabh160,fabh070,fabh071,fabh072,fabh073,fabh111,",
               "fabh161,fabh074,fabh075,fabh076 FROM fabh_t",
   #161128-00061#6---modify--end--------------------
               " WHERE fabhent = '",g_enterprise,"'",
               "   AND fabhld = '",p_fabgld,"'",
               "   AND fabhdocno = '",p_fabgdocno,"'"
   PREPARE s_afat503_fabh_31_pr FROM l_sql
   DECLARE s_afat503_fabh_31_cs CURSOR FOR s_afat503_fabh_31_pr
   FOREACH s_afat503_fabh_31_cs INTO l_fabh.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = sqlca.sqlcode
         LET g_errparam.extend = 'FOREACH s_afat503_fabh_31_cs'
         LET g_errparam.popup = FALSE
         CALL cl_err()
          
         LET r_success = FALSE         
         EXIT FOREACH
      END IF
      IF cl_null(l_fabh.fabh026) THEN
         LET g_errno = 'afa-00451'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      CALL s_afat503_conf_ins_tab_chk(p_fabgdocno,p_fabgld,l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000) RETURNING l_success 
      IF l_success = FALSE THEN
         LET r_success = FALSE
      END IF      

      #資產檢核
      CALL s_afat503_fabh001_chk(l_fabh.fabh001,l_fabh.fabh002,l_fabh.fabh000,l_fabg.fabgld,l_fabg.fabg005)  
      IF NOT cl_null(g_errno) THEN
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF 
      #盤點期間改資產不可異動

      #新科目
      IF NOT cl_null(l_fabh.fabh023) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh023)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh023
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00272'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      IF NOT cl_null(l_fabh.fabh024) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh024)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh024
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00273'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      IF NOT cl_null(l_fabh.fabh025) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh025)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh025
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00274'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      #旧科目
      IF NOT cl_null(l_fabh.fabh070) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh070)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh070
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00274'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      IF NOT cl_null(l_fabh.fabh071) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh071)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh071
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00274'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      IF NOT cl_null(l_fabh.fabh072) THEN
         CALL s_voucher_glaq002_chk(p_fabgld,l_fabh.fabh072)
         IF NOT cl_null(g_errno) THEN
            LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_fabh.fabh072
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_errmsg
            LET g_errparam.code   = g_errno
            #160321-00016#5 --s add
            #(s_voucher_glaq002_chk)ais-00046->sub-01302
            LET g_errparam.replace[1] = 'agli030'
            LET g_errparam.replace[2] = cl_get_progname('agli030',g_lang,"2")
            LET g_errparam.exeprog = 'agli030'
            #160321-00016#5 --e add
            LET g_errparam.popup  = TRUE 
            CALL cl_err() 
         END IF
      ELSE
         LET g_errno = 'afa-00274'
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_errmsg
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err() 
      END IF
      
      #三个科目不可都没有发生异动      
      IF l_fabh.fabh023=l_fabh.fabh070 AND l_fabh.fabh024=l_fabh.fabh071 AND l_fabh.fabh025=l_fabh.fabh072 THEN
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "afa-00462"
         LET g_errparam.extend = l_errmsg
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CONTINUE FOREACH
      END IF
      FOR l_i = 1 TO 6
         #当科目没有发生异动时，不检查科目对应核算项是否有值，因为该科目及核算项不会产生到凭证中
         CASE l_i
            WHEN 1
               IF l_fabh.fabh023 = l_fabh.fabh070 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh023
            WHEN 2 
               IF l_fabh.fabh024 = l_fabh.fabh071 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh024
            WHEN 3 
               IF l_fabh.fabh025 = l_fabh.fabh072 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh025
            WHEN 4 
               IF l_fabh.fabh023 = l_fabh.fabh070 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh070
            WHEN 5 
               IF l_fabh.fabh024 = l_fabh.fabh071 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh071
            WHEN 6 
               IF l_fabh.fabh025 = l_fabh.fabh072 THEN
                  CONTINUE FOR
               END IF
               LET l_glac002 = l_fabh.fabh072
         END CASE
         #依據帳別，科目編號，判斷該科目是否启用
         #部門管理， 利潤成本中心管理，區域管理，交易客商管理，客群管理，產品類別，人員，預算，專案，wbs管理，账款客商管理，自由核算项1~10
         #1.清空核算项管理
         LET l_glad007 = ''  LET l_glad008 = ''  LET l_glad009 = ''  LET l_glad010 = ''  LET l_glad027 = ''
         LET l_glad011 = ''  LET l_glad012 = ''  LET l_glad013 = ''  LET l_glad015 = ''  LET l_glad016 = ''  
         LET l_glad031 = ''  LET l_glad032 = ''  LET l_glad033 = '' 
         LET l_glad017 = ''  LET l_glad0171 =''  LET l_glad0172 = '' LET l_glad018 = ''  LET l_glad0181 = ''  LET l_glad0182 = ''   
         LET l_glad019 = ''  LET l_glad0191 =''  LET l_glad0192 = '' LET l_glad020 = ''  LET l_glad0201 = ''  LET l_glad0202 = ''
         LET l_glad021 = ''  LET l_glad0211 =''  LET l_glad0212 = '' LET l_glad022 = ''  LET l_glad0221 = ''  LET l_glad0222 = ''
         LET l_glad023 = ''  LET l_glad0231 =''  LET l_glad0232 = '' LET l_glad024 = ''  LET l_glad0241 = ''  LET l_glad0242 = ''
         LET l_glad025 = ''  LET l_glad0251 =''  LET l_glad0252 = '' LET l_glad026 = ''  LET l_glad0261 = ''  LET l_glad0262 = ''
         
         #2.重新依账套，科目抓取核算项管理值
         SELECT glad007,glad008,glad009,glad010,glad027,glad011,glad012,glad013,glad015,glad016,
                glad031,glad032,glad033,
                glad017,glad0171,glad0172,glad018,glad0181,glad0182,glad019,glad0191,glad0192,
                glad020,glad0201,glad0202,glad021,glad0211,glad0212,glad022,glad0221,glad0222,
                glad023,glad0231,glad0232,glad024,glad0241,glad0242,glad025,glad0251,glad0252,
                glad026,glad0261,glad0262              
           INTO l_glad007,l_glad008,l_glad009,l_glad010,l_glad027,l_glad011,l_glad012,l_glad013,l_glad015,l_glad016,
                l_glad031,l_glad032,l_glad033,
                l_glad017,l_glad0171,l_glad0172,l_glad018,l_glad0181,l_glad0182,l_glad019,l_glad0191,l_glad0192,
                l_glad020,l_glad0201,l_glad0202,l_glad021,l_glad0211,l_glad0212,l_glad022,l_glad0221,l_glad0222,
                l_glad023,l_glad0231,l_glad0232,l_glad024,l_glad0241,l_glad0242,l_glad025,l_glad0251,l_glad0252,
                l_glad026,l_glad0261,l_glad0262
           FROM glad_t
          WHERE gladent = g_enterprise
            AND gladld  = p_fabgld
            AND glad001 = l_glac002   
      
         #======================================
         #固定核算项检查
         #如果启用改固定核算项勾选，则对该核算项的值进行检查
         #======================================  
       
         LET l_errmsg = p_fabgdocno||'/'||l_fabh.fabhseq||'/'||l_glac002
         #營運據點
         IF NOT cl_null(l_fabh.fabh026) THEN
            CALL s_voucher_glaq017_chk(l_fabh.fabh026)
            IF NOT cl_null(g_errno) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = g_errno
               #160321-00016#5 --s add
               #(s_voucher_glaq017_chk)aoo-00089->sub-01302
               LET g_errparam.replace[1] = 'aooi100'
               LET g_errparam.replace[2] = cl_get_progname('aooi100',g_lang,"2")
               LET g_errparam.exeprog = 'aooi100'
               #160321-00016#5 --e add
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            END IF
         END IF
      
         #部门检查-#該科目做部門管理時，部門不可空白
         IF l_glad007 = 'Y' THEN
            IF cl_null(l_fabh.fabh027) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00043'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE   
               CALL s_department_chk(l_fabh.fabh027,l_fabg.fabgdocdt) RETURNING l_success            
               IF l_success = FALSE THEN
                  LET r_success = FALSE
               END IF    
            END IF
         END IF
      
         #利润成本中心检查--#該科目做利潤成本管理時，利潤成本不可空白
         IF l_glad008 = 'Y' THEN
            IF cl_null(l_fabh.fabh028) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00044'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_voucher_glaq019_chk(l_fabh.fabh028,l_fabg.fabgdocdt)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh028
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq019_chk)aoo-00029->sub-01302
                  IF g_errno = 'sub-01302' THEN
                     LET g_errparam.replace[1] = 'aooi125'
                     LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi125'
                  END IF
                  #160321-00016#5 --e ad
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()               
               END IF                          
            END IF
         END IF                      
       
         #区域检查 #該科目做區域管理時，區域不可空白
         IF l_glad009 = 'Y' THEN
            IF cl_null(l_fabh.fabh029) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00045'
               LET g_errparam.popup  = TRUE 
               CALL cl_err()              
            ELSE
               CALL s_azzi650_chk_exist('287',l_fabh.fabh029) RETURNING l_success
               IF l_success = FALSE THEN
                  LET r_success = FALSE   
               END IF                  
            END IF
         END IF  
       
         #客商检查-#該科目做交易客商管理時，客商不可空白 
         IF l_glad010 = 'Y' THEN
            IF cl_null(l_fabh.fabh030) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00046'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_voucher_glaq021_chk(l_fabh.fabh030)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh030
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq021_chk)apm-00029->sub-01302
                  LET g_errparam.replace[1] = 'apmm100'
                  LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                  LET g_errparam.exeprog = 'apmm100'
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF                  
            END IF
         END IF  
       
         #客商检查--#該科目做账款客商管理時，客商不可空白
         IF l_glad027 = 'Y' THEN
            IF cl_null(l_fabh.fabh031) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'axr-00215'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_voucher_glaq021_chk(l_fabh.fabh031)
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh031
                  LET g_errparam.code   = g_errno
                  #160321-00016#5 --s add
                  #(s_voucher_glaq021_chk)apm-00029->sub-01302
                  LET g_errparam.replace[1] = 'apmm100'
                  LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                  LET g_errparam.exeprog = 'apmm100'
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF                  
            END IF
         END IF  
      
         #客群检查-#該科目做客群管理時，客群不可空白
         IF l_glad011 = 'Y' THEN
            IF cl_null(l_fabh.fabh032) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00047'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_azzi650_chk_exist('281',l_fabh.fabh032) RETURNING l_success
               IF l_success = FALSE THEN
                  LET r_success = FALSE    
               END IF                  
            END IF
         END IF  
      
         #人员
         IF l_glad013 = 'Y' THEN
            IF cl_null(l_fabh.fabh033) THEN 
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00069'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
              CALL s_employee_chk(l_fabh.fabh033) RETURNING l_success 
               IF l_success = FALSE THEN
                  LET r_success = FALSE   
               END IF                  
            END IF
         END IF
         
         #專案检查
         IF l_glad015 = 'Y' THEN
            IF cl_null(l_fabh.fabh034) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00071'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_aap_project_chk(l_fabh.fabh034) RETURNING l_success,g_errno
               IF l_success = FALSE THEN
                  LET r_success = FALSE   
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh034
                  #160321-00016#5 --s add
                  #(s_aap_project_chk)apj-00002->sub-01302
                  LET g_errparam.replace[1] = 'apjm200'
                  LET g_errparam.replace[2] = cl_get_progname('apjm200',g_lang,"2")
                  LET g_errparam.exeprog = 'apjm200'
                  #160321-00016#5 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()               
               END IF               
            END IF
         END IF
      
         #WBS检查 
         IF l_glad016 = 'Y' THEN
            IF cl_null(l_fabh.fabh035) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00072'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_voucher_glaq028_chk(l_fabh.fabh034,l_fabh.fabh035) 
               IF NOT cl_null(g_errno) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh035
                  LET g_errparam.popup = TRUE
                  CALL cl_err()               
               END IF
            END IF
         END IF  
      
         #該科目做經營方式管理時，不可空白
         IF l_glad031 = 'Y' THEN  
            IF cl_null(l_fabh.fabh041) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00286'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
         
            ELSE
               CALL s_voucher_glaq051_chk(l_fabh.fabh041) 
               IF NOT cl_null(g_errno) THEN  
                  LET r_success = FALSE  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh041
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF
            END IF
         END IF   
      
         #該科目做渠道管理時，不可空白
         IF l_glad032 = 'Y' THEN  
            IF cl_null(l_fabh.fabh042) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00287'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_voucher_glaq052_chk(l_fabh.fabh042)  
               IF NOT cl_null(g_errno) THEN  
                  LET r_success = FALSE 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh042
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF
            END IF      
         END IF   
      
         #該科目做品牌管理時，不可空白
         IF l_glad033 = 'Y' THEN
            IF cl_null(l_fabh.fabh043) THEN
               LET r_success = FALSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_errmsg
               LET g_errparam.code   = 'agl-00288'
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
            ELSE
               CALL s_azzi650_chk_exist('2002',l_fabh.fabh043) RETURNING l_success
               IF l_success = FALSE THEN  
                  LET r_success = FALSE 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg||'/'||l_fabh.fabh043
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF
            END IF      
         END IF 

         #===================================================
         #自由核算项检查
         #如果启用该核算项勾选，并且控制方式不为1：允许空白，则对核算项的值进行检查
         #===================================================
         #核算项一
         IF l_glad017 = 'Y' THEN
            IF l_glad0172<>'1' THEN
               IF cl_null(l_fabh.fabh060) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = 'agl-00074'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF
            END IF
            IF NOT cl_null(l_fabh.fabh060) THEN          
               CALL s_voucher_free_account_chk(l_glad0171,l_fabh.fabh060,l_glad0172) RETURNING l_errno
               IF NOT cl_null(l_errno) THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = l_errmsg
                  LET g_errparam.code   = l_errno
                  #160321-00016#5 --s add
                  #(s_voucher_free_account_chk)agl-00063->sub-01302
                  IF l_errno = 'agl-00063' THEN
                     LET g_errparam.replace[1] = 'agli041'
                     LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                     LET g_errparam.exeprog = 'agli041'
                  END IF
                  #160321-00016#5 --e add
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
               END IF 
             END IF   
         END IF 
          #核算项二
          IF l_glad018 = 'Y'  THEN
             IF l_glad0182 <>'1' THEN 
                IF cl_null(l_fabh.fabh061) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00075'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF
             END IF
             IF NOT cl_null(l_fabh.fabh061) THEN          
                CALL s_voucher_free_account_chk(l_glad0181,l_fabh.fabh061,l_glad0182) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF 
             END IF    
          END IF
          #核算项三
          IF l_glad019 = 'Y'  THEN
             IF l_glad0192 <>'1'  THEN 
                IF cl_null(l_fabh.fabh062) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00076'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF
             END IF   
             IF NOT cl_null(l_fabh.fabh062) THEN        
                CALL s_voucher_free_account_chk(l_glad0191,l_fabh.fabh062,l_glad0192) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF 
             END IF    
          END IF 
          #核算项四
          IF l_glad020 = 'Y' THEN
             IF l_glad0202 <>'1' THEN
                IF cl_null(l_fabh.fabh063) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00077'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF   
             END IF
             IF NOT cl_null(l_fabh.fabh063) THEN
                CALL s_voucher_free_account_chk(l_glad0201,l_fabh.fabh063,l_glad0202) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF 
             END IF    
          END IF
          #核算项五
          IF l_glad021 = 'Y'  THEN
             IF l_glad0212 <>'1' THEN
                IF cl_null(l_fabh.fabh064) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00078'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF
             END IF
             IF NOT cl_null(l_fabh.fabh064) THEN
                CALL s_voucher_free_account_chk(l_glad0211,l_fabh.fabh064,l_glad0212) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF 
             END IF    
          END IF 
          #核算项六
          IF l_glad022 = 'Y'  THEN
             IF l_glad0222 <>'1' THEN 
                IF cl_null(l_fabh.fabh065) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00079'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF 
             END IF
             IF NOT cl_null(l_fabh.fabh065) THEN          
                CALL s_voucher_free_account_chk(l_glad0221,l_fabh.fabh065,l_glad0222) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF
             END IF           
          END IF 
          #核算项七
          IF l_glad023 = 'Y'  THEN
             IF l_glad0232 <>'1' THEN 
                IF cl_null(l_fabh.fabh066) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00080'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF  
             END IF
             IF NOT cl_null(l_fabh.fabh066) THEN          
                CALL s_voucher_free_account_chk(l_glad0231,l_fabh.fabh066,l_glad0232) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF
             END IF           
          END IF
          #核算项八
          IF l_glad024 = 'Y'  THEN
             IF l_glad0242 <>'1' THEN 
                IF cl_null(l_fabh.fabh067) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00081'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF 
             END IF
             IF NOT cl_null(l_fabh.fabh067) THEN           
                CALL s_voucher_free_account_chk(l_glad0241,l_fabh.fabh067,l_glad0242) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF 
             END IF 
          END IF 
          #核算项九
          IF l_glad025 = 'Y'  THEN
             IF l_glad0252 <>'1' THEN 
                IF cl_null(l_fabh.fabh068) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00082'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF 
             END IF
             IF NOT cl_null(l_fabh.fabh068) THEN          
                CALL s_voucher_free_account_chk(l_glad0251,l_fabh.fabh068,l_glad0252) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF
             END IF           
          END IF        
          #核算项十
          IF l_glad026 = 'Y'  THEN
             IF l_glad0262 <>'1' THEN 
                IF cl_null(l_fabh.fabh069) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = 'agl-00083'
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err() 
                END IF  
             END IF
             IF NOT cl_null(l_fabh.fabh069) THEN        
                CALL s_voucher_free_account_chk(l_glad0261,l_fabh.fabh069,l_glad0262) RETURNING l_errno
                IF NOT cl_null(l_errno) THEN
                   LET r_success = FALSE
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = l_errmsg
                   LET g_errparam.code   = l_errno
                   #160321-00016#5 --s add
                   #(s_voucher_free_account_chk)agl-00063->sub-01302
                   IF l_errno = 'agl-00063' THEN
                      LET g_errparam.replace[1] = 'agli041'
                      LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                      LET g_errparam.exeprog = 'agli041'
                   END IF
                   #160321-00016#5 --e add
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()              
                END IF 
             END IF 
          END IF
       END FOR   
   END FOREACH
   
   #固资现行年度期别检查
   IF NOT s_afat503_sys_chk(l_fabg.fabgld,l_fabg.fabgsite,l_fabg.fabgdocdt) THEN
      RETURN FALSE
   END IF
  
   #关账日期检查
   IF NOT s_afat503_docdt_chk(l_fabg.fabgld,l_fabg.fabgsite,l_fabg.fabgdocdt) THEN
      RETURN FALSE
   END IF
    #180124-00038#1--add--str
     CALL s_aooi200_fin_get_slip(l_fabg.fabgdocno) RETURNING l_success,l_slip
     LET l_comp = NULL
     SELECT glaacomp INTO l_comp FROM glaa_t
      WHERE glaaent = g_enterprise
        AND glaald = l_fabg.fabgld
     CALL s_fin_get_doc_para(l_fabg.fabgld,l_comp,l_slip,'D-FIN-0030') RETURNING l_chr
    #180124-00038#1--add--end
   IF l_chr = 'Y' THEN  #181218-00049#1---add--当单别参数D-FIN-0030=N时， 不需要产生分录
   #分录底稿
   CALL afap280_01_gen_ar('31',l_fabg.fabgld,'',' ','1','','Y','afat521') RETURNING l_success 
#   IF l_chr = 'Y' THEN     #180124-00038#1--add   当单别参数D-FIN-0030=N时，取消分录借贷平衡的检核段   #181218-00049#1---mark
   IF l_success THEN
      #检查金额平不平 
     #SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_01_fa_group   #151001-00005#1
     #SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_01_group   #151001-00005#1  #160727-00019#2 mark
      SELECT SUM(NVL(c,0)),SUM(NVL(d,0)) INTO l_c,l_d FROM afap280_tmp02  #160727-00019#2 Mod   afap280_01_group -->afap280_tmp02
      WHERE docno = l_fabg.fabgdocno AND docdt = l_fabg.fabgdocdt 
      IF l_c <> l_d THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'afa-00275'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
   END IF
   END IF  #180124-00038#1--add  
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 编辑后立即审核
# Memo...........:
# Usage..........: CALL s_afat503_immediately_conf(p_docno,p_comp,p_ld,p_docdt,p_prog)
#                  RETURNING r_success
# Input parameter: p_docno    单据编号
#                : p_comp     法人
#                : p_ld       账套
#                : p_docdt    单据日期
#                : p_prog     程序编号
# Date & Author..: 2015/12/10 By 06862
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_immediately_conf(p_docno,p_comp,p_ld,p_docdt,p_prog)
   DEFINE p_comp            LIKE faba_t.fabacomp
   DEFINE p_docno           LIKE faba_t.fabadocno
   DEFINE p_ld              LIKE fabg_t.fabgld
   DEFINE p_docdt           LIKE faba_t.fabadocdt
   DEFINE p_prog            LIKE gzza_t.gzza001
   DEFINE l_moddt           LIKE faba_t.fabamoddt
   DEFINE l_cnfdt           LIKE faba_t.fabacnfdt
   DEFINE l_success         LIKE type_t.num5
   #161128-00061#6---modify--begin------------------
   #DEFINE l_glaa            RECORD LIKE glaa_t.* 
   DEFINE l_glaa RECORD  #帳套資料檔
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
   #161128-00061#6---modify--end--------------------   
   DEFINE l_dfin0031        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_n               LIKE type_t.num5
   DEFINE r_success         LIKE type_t.num5
   DEFINE l_colname         STRING
   DEFINE l_comment         STRING
   DEFINE l_table           LIKE type_t.chr10
   DEFINE l_table000        LIKE type_t.chr20
   DEFINE l_table001        LIKE type_t.chr20
   DEFINE l_table002        LIKE type_t.chr20
   DEFINE l_glgbdocno       LIKE glgb_t.glgbdocno
   DEFINE l_glgbseq         LIKE glgb_t.glgbseq
   DEFINE l_sql             STRING
   DEFINE l_today           DATETIME YEAR TO SECOND
   #151125-00006#3--s
   DEFINE l_glgb003         LIKE glgb_t.glgb003
   DEFINE l_fabh010         LIKE fabh_t.fabh010
   DEFINE l_glaa121         LIKE glaa_t.glaa121
   #151125-00006#3--e
   
   LET r_success = TRUE 
   IF cl_null(p_docno) THEN RETURN r_success = FALSE END IF   #無資料直接返回不做處理
    
   #获取法人账套 
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_glaa.*
    SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
           glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,
           glaa010,glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,
           glaa021,glaa022,glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,
           glaa112,glaa113,glaa120,glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,
           glaa135,glaa136,glaa137,glaa138,glaa139,glaa140,glaa123,glaa124,glaa028 INTO l_glaa.*
   #161128-00061#6---modify--end--------------------
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaacomp = p_comp
      AND glaa014 = 'Y'
   
   CALL cl_err_collect_init()
   #CALL s_transaction_begin()
  
   LET l_success = TRUE
   
   #IF p_prog = 'afat410' OR p_prog = 'afat440' then   #170301-00021#3 by 09263 --mark
   IF p_prog MATCHES 'afat410*' OR p_prog MATCHES 'afat440*' then   #170301-00021#3 by 09263 --add    
      IF NOT s_afat503_sys_chk('',p_comp,p_docdt) THEN
             RETURN r_success = FALSE 
      END IF
   END IF 
   
    CALL cl_err_collect_init()
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
    LET g_coll_title[1] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
    LET g_coll_title[2] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
    LET g_coll_title[3] = l_colname
    
    LET l_table = 'fabb_t'
    LET l_table000 = 'fabb000'
    LET l_table001 = 'fabb001'
    LET l_table002 = 'fabb002'

    #IF p_prog = 'afat440' THEN   #170301-00021#3 by 09263 --mark 
    IF p_prog MATCHES 'afat440*' THEN   #170301-00021#3 by 09263 --add 
       LET l_table = 'fabk_t'
       LET l_table000 = 'fabk000'
       LET l_table001 = 'fabk001'
       LET l_table002 = 'fabk002'
    END IF
    
    #IF p_prog = 'afap270' OR p_prog = 'afat504' OR p_prog = 'afat505' THEN #151125-00006#2--s add afat504,afat505 by 06421   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afap270*' OR p_prog MATCHES 'afat504*' OR p_prog MATCHES 'afat505*' THEN   #170301-00021#3 by 09263 --add 
       LET l_table = 'fabo_t'
       LET l_table000 = 'fabo003'
       LET l_table001 = 'fabo001'
       LET l_table002 = 'fabo002'
    END IF
    #151125-00006#2--s by 06421
    #IF p_prog = 'afat500' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat500*' THEN   #170301-00021#3 by 09263 --add
       LET l_table = 'fabs_t'
       LET l_table000 = 'fabs006'
       LET l_table001 = 'fabs004'
       LET l_table002 = 'fabs005'
    END IF
    #IF p_prog = 'afat501'THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat501*' THEN   #170301-00021#3 by 09263 --add
       LET l_table = 'faah_t'
       LET l_table000 = 'faah001'
       LET l_table001 = 'faah003'
       LET l_table002 = 'faah004'
    END IF
    #IF p_prog = 'afat502' OR p_prog = 'afat503' OR p_prog = 'afat421_02' THEN  #151125-00006#1---add  afat421_02 by aiqq   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat502*' OR p_prog MATCHES 'afat503*' OR p_prog MATCHES 'afat421_02*' THEN   #170301-00021#3 by 09263 --add  
       LET l_table = 'fabh_t'
       LET l_table000 = 'fabh000'
       LET l_table001 = 'fabh001'
       LET l_table002 = 'fabh002'
    END IF    
    #151125-00006#2--e by 06421
    #151125-00006#3--s
    #IF p_prog = 'afat507' OR p_prog = 'afat508' OR p_prog = 'afat509'  OR p_prog = 'afat511' OR p_prog = 'afat513' OR p_prog = 'afat521' THEN   #170301-00021#3 by 09263 --mark  
    IF p_prog MATCHES 'afat507*' OR p_prog MATCHES 'afat508*' OR p_prog MATCHES 'afat509*'  OR p_prog MATCHES 'afat511*' OR p_prog MATCHES 'afat513*' OR p_prog MATCHES 'afat521*' THEN   #170301-00021#3 by 09263 --add  
       LET l_table = 'fabh_t'
       LET l_table000 = 'fabh000'
       LET l_table001 = 'fabh001'
       LET l_table002 = 'fabh002'
    END IF    
    #151125-00006#3--e
    CALL s_afa_p_faan_chk(l_glaa.glaald ,p_docno,p_docdt,l_table,l_table000,l_table001,l_table002) 
         RETURNING l_success
    
    #afat504审核逻辑    
    #IF (p_prog = 'afap270' OR p_prog = 'afat504')  AND l_success THEN  #151125-00006#2--s add afat504 by 06421   #170301-00021#3 by 09263 --mark
    IF (p_prog MATCHES 'afap270*' OR p_prog MATCHES 'afat504*')  AND l_success THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabo(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF 
    END IF

    #afat521审核逻辑
    #IF p_prog = 'afat421_02' AND l_success THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat421_02*' AND l_success THEN   #170301-00021#3 by 09263 --add
    
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
       
       IF l_success = TRUE THEN
          #如果启用分录底稿，需要判断借方金额总和是否等于折旧单身折旧金额总和
          IF l_glaa.glaa121 = 'Y' THEN
             #检查汇率为1，但是借/贷金额不等于原币金额的资料
             LET l_sql = "SELECT a.glgbdocno,a.glgbseq ",
                         "  FROM glgb_t a,glgb_t b ",
                         " WHERE a.glgbdocno = b.glgbdocno ",
                         "   AND a.glgbld = b.glgbld ",
                         "   AND a.glgbseq = b.glgbseq ",
                         "   AND a.glgb100 = b.glgb100 ",
                         "   AND a.glgb101 = b.glgb101 ",
                         "   AND a.glgbent = b.glgbent ",
                         "   AND a.glgb006 = 1 ",
                         "   AND a.glgbdocno = '",p_docno,"'",
                         "   AND a.glgbent = '",g_enterprise,"'",
                         "   AND a.glgbld = '",p_ld,"'",
                         "   AND ((a.glgb003 <> b.glgb010 AND a.glgb003 > 0) ",
                         "    OR (a.glgb004 <> b.glgb010 AND a.glgb004 > 0))" 
             PREPARE sel_glgb FROM l_sql
             DECLARE sel_glgb_cs CURSOR FOR sel_glgb
             
             LET l_n = 0
             FOREACH sel_glgb_cs INTO l_glgbdocno,l_glgbseq
                IF STATUS THEN 
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = "sel_glgb_cs"
                   LET g_errparam.code   = SQLCA.sqlcode
                   LET g_errparam.popup  = FALSE
                   CALL cl_err()         
                END IF 
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = 'afa-00455'
                LET g_errparam.extend = ''
                LET g_errparam.replace[1] = l_glgbdocno
                LET g_errparam.replace[2] = l_glgbseq
                LET g_errparam.sqlerr = 0
                CALL cl_err()
                LET l_success = FALSE
                LET l_n = l_n + 1
             END FOREACH 
             
             IF l_n > 0 THEN 
                RETURN r_success = FALSE
             END IF 
             
          END IF
          
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
          
       END IF      
    END IF
    
    #151125-00006#2--s by 06421
    #afat500
    #IF p_prog = 'afat500' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat500*' THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabs(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF
    END IF
    #afat502 afat503
    #IF (p_prog = 'afat502' OR p_prog = 'afat503') AND l_success THEN   #170301-00021#3 by 09263 --mark
    IF (p_prog MATCHES 'afat502*' OR p_prog MATCHES 'afat503*') AND l_success THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF
    END IF
    #afat505
    #IF g_prog = 'afat505' THEN   #170301-00021#3 by 09263 --mark
    IF g_prog MATCHES 'afat505*' THEN   #170301-00021#3 by 09263 --add
       LET l_n = 0
       SELECT COUNT(*) INTO l_n FROM fabg_t
        WHERE fabgent = g_enterprise
          AND fabgld  = p_ld
          AND fabg019 = p_docno
       IF l_n > 0 THEN 
          #调拨单审核时，出售单状态更新为S
          UPDATE fabg_t SET fabgstus = 'S' 
           WHERE fabgent = g_enterprise 
             AND fabgld = p_ld 
             AND fabg019 = p_docno
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL 
             LET g_errparam.extend = "" 
             LET g_errparam.code   = SQLCA.sqlcode 
             LET g_errparam.popup  = FALSE 
             CALL cl_err()
       
             RETURN            
          END IF 
       END IF  
       
       
       LET l_today = cl_get_current()
       UPDATE fabg_t 
           SET (fabgcnfid,fabgcnfdt) 
             = (g_user,l_today)     
         WHERE fabgent = g_enterprise AND fabgld = p_ld
           AND fabgdocno = p_docno
       
        
       UPDATE faah_t SET faahstus = 'Y'
                   WHERE faahent = g_enterprise
                     AND faah040 = p_docno
                     
       UPDATE faah_t SET faah015 = '1'
                   WHERE faahent = g_enterprise
                     AND faah040 = p_docno
                     AND faah033 = 'Y'
    END IF
    #151125-00006#2--e by 06421 
 
    #151125-00006#1---add--s
    LET l_moddt = cl_get_current()
    #IF p_prog = 'afap270' OR p_prog = 'afat421_02' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afap270*' OR p_prog MATCHES 'afat421_02*' THEN   #170301-00021#3 by 09263 --add 
       UPDATE fabg_t SET fabgstus = 'Y',
                         fabgcnfid = g_user,
                         fabgcnfdt = l_moddt
                   WHERE fabgent = g_enterprise
                     AND fabgdocno = p_docno
        IF SQLCA.SQLCODE THEN
           LET l_success = FALSE
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.SQLCODE
           LET g_errparam.extend = 'fabgstus'||p_docno
           LET g_errparam.popup = TRUE
           CALL cl_err()            
        END IF 
    ELSE
       UPDATE faba_t SET fabastus = 'Y',
                         fabacnfid = g_user,
                         fabacnfdt = l_moddt
                   WHERE fabaent = g_enterprise
                     AND fabadocno = p_docno
        IF SQLCA.SQLCODE THEN
           LET l_success = FALSE
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.SQLCODE
           LET g_errparam.extend = 'fabastus'||p_docno
           LET g_errparam.popup = TRUE
           CALL cl_err()              
        END IF 
    END IF
    #151125-00006#1---add--s
    
    #151125-00006#3---s
    #SELECT glaa121 INTO l_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
    #IF (p_prog = 'afat507' OR p_prog = 'afat508' OR p_prog = 'afat511' OR p_prog = 'afat513' ) AND l_success THEN   #170301-00021#3 by 09263 --mark
    #IF (p_prog MATCHES 'afat507*' OR p_prog MATCHES 'afat508*' OR p_prog MATCHES 'afat511*' OR p_prog MATCHES 'afat513*' ) AND l_success THEN   #170301-00021#3 by 09263 --add  #180511-00010#1 mark
    IF (p_prog MATCHES 'afat507*' OR p_prog MATCHES 'afat508*' OR p_prog MATCHES 'afat511*' OR p_prog MATCHES 'afat513*' OR p_prog MATCHES 'afat514*' ) AND l_success THEN#180511-00010#1
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF
    END IF
    
    #afat509审核
    #IF p_prog = 'afat509' AND l_success THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat509*' AND l_success THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
            IF l_success = TRUE THEN
               #如果启用分录底稿，需要判断借方金额总和是否等于折旧单身折旧金额总和
               IF l_glaa121 = 'Y' THEN 
                  #获取预览借方金额
                  SELECT SUM(glgb003) INTO l_glgb003
                    FROM glgb_t
                   WHERE glgbent = g_enterprise
                     AND glgbdocno = p_docno
                  IF cl_null(l_glgb003) THEN 
                     LET l_glgb003 = 0
                  END IF 
                  #获取折旧档折旧金额总和
                  SELECT SUM(fabh010) INTO l_fabh010
                    FROM fabh_t
                   WHERE fabhent = g_enterprise
                     AND fabhdocno = p_docno
                  IF cl_null(l_fabh010) THEN 
                     LET l_fabh010 = 0
                  END IF 
                  IF l_glgb003 != l_fabh010 THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'afa-00454'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  END IF
                  #检查汇率为1，但是借/贷金额不等于原币金额的资料
                  LET l_sql = "SELECT a.glgbdocno,a.glgbseq ",
                              "  FROM glgb_t a,glgb_t b ",
                              " WHERE a.glgbdocno = b.glgbdocno ",
                              "   AND a.glgbld = b.glgbld ",
                              "   AND a.glgbseq = b.glgbseq ",
                              "   AND a.glgb100 = b.glgb100 ",
                              "   AND a.glgb101 = b.glgb101 ",
                              "   AND a.glgbent = b.glgbent ",
                              "   AND a.glgb006 = 1 ",
                              "   AND a.glgbdocno = '",p_docno,"'",
                              "   AND a.glgbent = '",g_enterprise,"'",
                              "   AND a.glgbld = '",p_ld,"'",
                              "   AND ((a.glgb003 <> b.glgb010 AND a.glgb003 > 0) ",
                              "    OR (a.glgb004 <> b.glgb010 AND a.glgb004 > 0))" 
                  PREPARE sel_glgb2 FROM l_sql
                  DECLARE sel_glgb_cs2 CURSOR FOR sel_glgb2
                  LET l_n = 0
                  FOREACH sel_glgb_cs2 INTO l_glgbdocno,l_glgbseq
                     IF STATUS THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = "sel_glgb_cs"
                        LET g_errparam.code   = SQLCA.sqlcode
                        LET g_errparam.popup  = FALSE
                        CALL cl_err()         
                     END IF 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'afa-00455'
                     LET g_errparam.extend = ''
                     LET g_errparam.replace[1] = l_glgbdocno
                     LET g_errparam.replace[2] = l_glgbseq
                     LET g_errparam.sqlerr = 0
                     CALL cl_err()
                     LET l_success = FALSE
                     LET l_n = l_n + 1
                  END FOREACH 
               END IF
               CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
            END IF 
    END IF
    
    #afat521审核
    #IF p_prog = 'afat521' AND l_success THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat521*' AND l_success THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
            IF l_success = TRUE THEN
               #a如果启用分录底稿，需要判断借方金额总和是否等于折旧单身折旧金额总和
               IF l_glaa121 = 'Y' THEN
                  #检查汇率为1，但是借/贷金额不等于原币金额的资料
                  LET l_sql = "SELECT a.glgbdocno,a.glgbseq ",
                              "  FROM glgb_t a,glgb_t b ",
                              " WHERE a.glgbdocno = b.glgbdocno ",
                              "   AND a.glgbld = b.glgbld ",
                              "   AND a.glgbseq = b.glgbseq ",
                              "   AND a.glgb100 = b.glgb100 ",
                              "   AND a.glgb101 = b.glgb101 ",
                              "   AND a.glgbent = b.glgbent ",
                              "   AND a.glgb006 = 1 ",
                              "   AND a.glgbdocno = '",p_docno,"'",
                              "   AND a.glgbent = '",g_enterprise,"'",
                              "   AND a.glgbld = '",p_ld,"'",
                              "   AND ((a.glgb003 <> b.glgb010 AND a.glgb003 > 0) ",
                              "    OR (a.glgb004 <> b.glgb010 AND a.glgb004 > 0))" 
                  PREPARE sel_glgb1 FROM l_sql
                  DECLARE sel_glgb_cs1 CURSOR FOR sel_glgb1
                  LET l_n = 0
                  FOREACH sel_glgb_cs1 INTO l_glgbdocno,l_glgbseq
                     IF STATUS THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = "sel_glgb_cs"
                        LET g_errparam.code   = SQLCA.sqlcode
                        LET g_errparam.popup  = FALSE
                        CALL cl_err()         
                     END IF 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'afa-00455'
                     LET g_errparam.extend = ''
                     LET g_errparam.replace[1] = l_glgbdocno
                     LET g_errparam.replace[2] = l_glgbseq
                     LET g_errparam.sqlerr = 0
                     CALL cl_err()
                     LET l_success = FALSE
                     LET l_n = l_n + 1
                  END FOREACH 
               END IF
               #add by yangxf ---
               CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
            END IF 
    END IF
    #151125-00006#3---e
    
    IF l_success = FALSE THEN 
       LET r_success = FALSE 
    END IF
    
    #CALL cl_err_collect_show()
   
    RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: afap270、afat421_02立即抛转传票
# Memo...........:
# Usage..........: CALL s_afat503_fabg_immediately_gen(p_fabgld,p_fabgdocno,p_fabgstus,p_fabg005,p_fabg008)
# Input parameter: p_fabgld       账套
#                : p_fabgdocno    单据编号
#                : p_fabgdocdt    单据日期
#                : p_fabgstus     单据状态
#                : p_fabg005      异动类型
#                : p_fabg008      传票号
# Date & Author..: 2015 By 06862
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_fabg_immediately_gen(p_fabgld,p_fabgdocno,p_fabgstus,p_fabg005,p_fabg008)
   DEFINE p_fabgld          LIKE fabg_t.fabgld
   DEFINE p_fabgdocno       LIKE fabg_t.fabgdocno
   DEFINE p_fabg005         LIKE fabg_t.fabg005
   DEFINE p_fabg008         LIKE fabg_t.fabg008
   DEFINE p_fabgstus        LIKE fabg_t.fabgstus
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0032        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_glap001         LIKE glap_t.glap001
   DEFINE l_glaa024         LIKE glaa_t.glaa024
   DEFINE l_ooac004         LIKE ooac_t.ooac004
   DEFINE la_param          RECORD
          prog              STRING,
          param             DYNAMIC ARRAY OF STRING
                            END RECORD
   DEFINE ls_js             STRING

    IF cl_null(p_fabgld)    THEN RETURN END IF   #無資料直接返回不做處理
    IF cl_null(p_fabgdocno) THEN RETURN END IF   #無資料直接返回不做處理
    #IF g_prog = 'afat500' OR g_prog = 'afat502' OR g_prog = 'afat503' OR g_prog = 'afat504' OR g_prog = 'afat506'   #170301-00021#3 by 09263 --mark
    IF g_prog MATCHES 'afat500*' OR g_prog MATCHES 'afat502*' OR g_prog MATCHES 'afat503*' OR g_prog MATCHES 'afat504*' OR g_prog MATCHES 'afat506*'   #170301-00021#3 by 09263 --add
       #OR g_prog = 'afat507' OR g_prog = 'afat509' OR g_prog = 'afat521' THEN   #170301-00021#3 by 09263 --mark
       #OR g_prog MATCHES 'afat507*' OR g_prog MATCHES 'afat509*' OR g_prog MATCHES 'afat521*' THEN   #170301-00021#3 by 09263 --add  #201202-00040#1 mark
       OR g_prog MATCHES 'afat507*' OR g_prog MATCHES 'afat521*' THEN                                                                 #201202-00040#1 add
       IF p_fabgstus <> 'S'    THEN RETURN END IF
    ELSE
       IF p_fabgstus <> 'Y'    THEN RETURN END IF   #無資料直接返回不做處理
    END IF
    IF NOT cl_null(p_fabg008)   THEN RETURN END IF   #無傳票單號不做處理

    #取得單別
    CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING l_success,l_slip
    SELECT glaa024 INTO l_glaa024 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
    SELECT ooac004 INTO l_ooac004
      FROM ooac_t
     WHERE ooacent = g_enterprise
       AND ooac001 = l_glaa024
       AND ooac002 = l_slip
       AND ooac003 = 'D-FIN-2002'
       
      CALL s_afat503_afap280_chk(p_fabgdocno,p_fabg008,p_fabgstus) RETURNING l_success 
      
      IF l_success = TRUE THEN              
         LET la_param.prog = 'afap280'
         LET la_param.param[1] = p_fabgld
         LET la_param.param[2] = p_fabgdocno
         LET la_param.param[3] = p_fabg005
         LET la_param.param[4] = l_ooac004
         IF NOT cl_null(l_ooac004) THEN 
            LET la_param.param[5] = 'Y'
         ELSE
            LET la_param.param[5] = 'N'
         END IF 
         
         LET ls_js = util.JSON.stringify(la_param)
         CALL cl_cmdrun_wait(ls_js)
         
      END IF 
      
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_afat503_immediately_conf_1(p_docno,p_comp,p_ld,p_docdt,p_prog)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/21 By 06421
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_immediately_conf_1(p_docno,p_comp,p_ld,p_docdt,p_prog)
DEFINE p_comp            LIKE faba_t.fabacomp
   DEFINE p_docno           LIKE faba_t.fabadocno
   DEFINE p_ld              LIKE fabg_t.fabgld
   DEFINE p_docdt           LIKE faba_t.fabadocdt
   DEFINE p_prog            LIKE gzza_t.gzza001
   DEFINE l_moddt           LIKE faba_t.fabamoddt
   DEFINE l_cnfdt           LIKE faba_t.fabacnfdt
   DEFINE l_success         LIKE type_t.num5
   #161128-00061#6---modify--begin------------------
   #DEFINE l_glaa            RECORD LIKE glaa_t.* 
   DEFINE l_glaa RECORD  #帳套資料檔
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
   #161128-00061#6---modify--end--------------------   
   DEFINE l_dfin0031        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_n               LIKE type_t.num5
   DEFINE r_success         LIKE type_t.num5
   DEFINE l_colname         STRING
   DEFINE l_comment         STRING
   DEFINE l_table           LIKE type_t.chr10
   DEFINE l_table000        LIKE type_t.chr20
   DEFINE l_table001        LIKE type_t.chr20
   DEFINE l_table002        LIKE type_t.chr20
   DEFINE l_glgbdocno       LIKE glgb_t.glgbdocno
   DEFINE l_glgbseq         LIKE glgb_t.glgbseq
   DEFINE l_sql             STRING
   DEFINE l_today           DATETIME YEAR TO SECOND
   #151125-00006#3--s
   DEFINE l_glgb003         LIKE glgb_t.glgb003
   DEFINE l_fabh010         LIKE fabh_t.fabh010
   DEFINE l_glaa121         LIKE glaa_t.glaa121
   #151125-00006#3--e
   DEFINE l_ooab002 LIKE ooab_t.ooab002   
   LET r_success = TRUE 
   IF cl_null(p_docno) THEN RETURN r_success = FALSE END IF   #無資料直接返回不做處理
    
   #获取法人账套 
   #161128-00061#6---modify--begin--------------------
   #SELECT * INTO l_glaa.*
    SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
           glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,
           glaa010,glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,
           glaa021,glaa022,glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,
           glaa112,glaa113,glaa120,glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,
           glaa135,glaa136,glaa137,glaa138,glaa139,glaa140,glaa123,glaa124,glaa028 INTO l_glaa.*
   #161128-00061#6---modify--end--------------------
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaacomp = p_comp
      AND glaa014 = 'Y'
   
   CALL cl_err_collect_init()
   #CALL s_transaction_begin()
  
   LET l_success = TRUE
   
   
   
    CALL cl_err_collect_init()
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
    LET g_coll_title[1] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
    LET g_coll_title[2] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
    LET g_coll_title[3] = l_colname
    
    LET l_table = 'fabb_t'
    LET l_table000 = 'fabb000'
    LET l_table001 = 'fabb001'
    LET l_table002 = 'fabb002'

    
    
   
    #IF p_prog = 'afat500' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat500*' THEN   #170301-00021#3 by 09263 --add
       LET l_table = 'fabs_t'
       LET l_table000 = 'fabs006'
       LET l_table001 = 'fabs004'
       LET l_table002 = 'fabs005'
    END IF
    #IF p_prog = 'afat501'  THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat501*'  THEN   #170301-00021#3 by 09263 --add
       LET l_table = 'fabd_t'
       LET l_table000 = 'fabd000'
       LET l_table001 = 'fabd001'
       LET l_table002 = 'fabd002'
    END IF
    #IF p_prog = 'afat502' OR p_prog = 'afat503' OR p_prog = 'afat506' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat502*' OR p_prog MATCHES 'afat503*' OR p_prog MATCHES 'afat506*' THEN   #170301-00021#3 by 09263 --add      
       LET l_table = 'fabh_t'
       LET l_table000 = 'fabh000'
       LET l_table001 = 'fabh001'
       LET l_table002 = 'fabh002'
    END IF    
     #IF  p_prog = 'afat504' OR p_prog = 'afat505' THEN   #170301-00021#3 by 09263 --mark
     IF  p_prog MATCHES 'afat504*' OR p_prog MATCHES 'afat505*' THEN   #170301-00021#3 by 09263 --add      
       LET l_table = 'fabo_t'
       LET l_table000 = 'fabo003'
       LET l_table001 = 'fabo001'
       LET l_table002 = 'fabo002'
    END IF

    CALL s_afa_p_faan_chk(l_glaa.glaald ,p_docno,p_docdt,l_table,l_table000,l_table001,l_table002) 
         RETURNING l_success
#151125-00006#1---mark by aiqq---s
#   #afat490
#   IF p_prog = 'afat490' THEN 
#      CALL cl_get_para(g_enterprise,p_comp,'S-FIN-9003') RETURNING l_ooab002  
#            IF p_docdt <= l_ooab002 THEN 
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = "afa-00060"
#               LET g_errparam.extend = p_docno
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#               
#               RETURN FALSE
#            END IF
#            
#            CALL s_afat490_conf_chk(p_docno,p_comp) RETURNING l_success
#            IF l_success = FALSE THEN 
#               #CALL cl_err_collect_show()
#               RETURN FALSE
#            END IF
#            
#            #CALL afat490_01(g_faba_m.fabasite,g_faba_m.fabadocdt)
#   END IF
#151125-00006#1---mark by aiqq---e
   
    #afat504审核逻辑    
    #IF  p_prog = 'afat504' AND l_success THEN   #170301-00021#3 by 09263 --mark 
    IF  p_prog MATCHES 'afat504*' AND l_success THEN   #170301-00021#3 by 09263 --add      
       CALL s_afat503_conf_chk_fabo(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF 
    END IF

   
    
    #151125-00006#2--s by 06421
    #afat500
    #IF p_prog = 'afat500' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat500*' THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabs(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF
    END IF
    #afat502 afat503
    #IF (p_prog = 'afat502' OR p_prog = 'afat503' OR p_prog = 'afat506') AND l_success THEN   #170301-00021#3 by 09263 --mark
    IF (p_prog MATCHES 'afat502*' OR p_prog MATCHES 'afat503*' OR p_prog MATCHES 'afat506*') AND l_success THEN   #170301-00021#3 by 09263 --add
       CALL s_afat503_conf_chk_fabg(p_ld,p_docno) RETURNING l_success
       IF l_success = TRUE THEN
          CALL s_afat503_conf_upd_fabg(p_ld,p_docno) RETURNING l_success 
       END IF
    END IF
    #afat505
    #IF g_prog = 'afat505' THEN   #170301-00021#3 by 09263 --mark
    IF g_prog MATCHES 'afat505*' THEN   #170301-00021#3 by 09263 --add
       UPDATE fabg_t SET fabgstus = 'Y',
                         fabgcnfid = g_user,
                         fabgcnfdt = l_moddt
                   WHERE fabgent = g_enterprise
                     AND fabgdocno = p_docno
        IF SQLCA.SQLCODE THEN
           LET l_success = FALSE
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.SQLCODE
           LET g_errparam.extend = 'fabgstus'||p_docno
           LET g_errparam.popup = TRUE
           CALL cl_err()            
        END IF 
        
       LET l_n = 0
       SELECT COUNT(*) INTO l_n FROM fabg_t
        WHERE fabgent = g_enterprise
          AND fabgld  = p_ld
          AND fabg019 = p_docno
       IF l_n > 0 THEN 
          #调拨单审核时，出售单状态更新为S
          UPDATE fabg_t SET fabgstus = 'S' 
           WHERE fabgent = g_enterprise 
             AND fabgld = p_ld 
             AND fabg019 = p_docno
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL 
             LET g_errparam.extend = "" 
             LET g_errparam.code   = SQLCA.sqlcode 
             LET g_errparam.popup  = FALSE 
             CALL cl_err()
       
             RETURN            
          END IF 
       END IF  
       
       
       LET l_today = cl_get_current()
       UPDATE fabg_t 
           SET (fabgcnfid,fabgcnfdt) 
             = (g_user,l_today)     
         WHERE fabgent = g_enterprise AND fabgld = p_ld
           AND fabgdocno = p_docno
       
        
       UPDATE faah_t SET faahstus = 'Y'
                   WHERE faahent = g_enterprise
                     AND faah040 = p_docno
                     
       UPDATE faah_t SET faah015 = '1'
                   WHERE faahent = g_enterprise
                     AND faah040 = p_docno
                     AND faah033 = 'Y'
    END IF

  

    LET l_moddt = cl_get_current()
    #IF p_prog = 'afat480' OR p_prog = 'afat490' THEN   #151125-00006#1---mark by aiqq
     #IF p_prog = 'afat480' THEN                         #151125-00006#1---add      #170301-00021#3 by 09263 --mark             
     IF p_prog MATCHES 'afat480*' THEN      #170301-00021#3 by 09263 --add     
       UPDATE faba_t SET fabastus = 'Y',
                         fabacnfid = g_user,
                         fabacnfdt = l_moddt
                   WHERE fabaent = g_enterprise
                     AND fabadocno = p_docno
        IF SQLCA.SQLCODE THEN
           LET l_success = FALSE
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.SQLCODE
           LET g_errparam.extend = 'fabastus'||p_docno
           LET g_errparam.popup = TRUE
           CALL cl_err()              
        END IF 
    END IF
    #IF p_prog = 'afat501' THEN   #170301-00021#3 by 09263 --mark
    IF p_prog MATCHES 'afat501*' THEN   #170301-00021#3 by 09263 --add 
        UPDATE fabg_t SET fabgstus = 'Y',
                         fabgcnfid = g_user,
                         fabgcnfdt = l_moddt
                   WHERE fabgent = g_enterprise
                     AND fabgdocno = p_docno
        IF SQLCA.SQLCODE THEN
           LET l_success = FALSE
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.SQLCODE
           LET g_errparam.extend = 'fabgstus'||p_docno
           LET g_errparam.popup = TRUE
           CALL cl_err()            
        END IF 
    END IF
    
    
    IF l_success = FALSE THEN 
       LET r_success = FALSE 
    END IF
    
    #CALL cl_err_collect_show()
   
    RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: afat507,508,509,511,512立即抛转传票
# Memo...........:
# Usage..........: CALL s_afat503_fabg_immediately_gen(p_fabgld,p_fabgdocno,p_fabgstus,p_fabg005,p_fabg008)
# Input parameter: p_fabgld       账套
#                : p_fabgdocno    单据编号
#                : p_fabgdocdt    单据日期
#                : p_fabgstus     单据状态
#                : p_fabg005      异动类型
#                : p_fabg008      传票号
# Date & Author..: 2015 By 07166
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_fabg_immediately_gen_1(p_fabgld,p_fabgdocno,p_fabgstus,p_fabg005,p_fabg008)
   DEFINE p_fabgld          LIKE fabg_t.fabgld
   DEFINE p_fabgdocno       LIKE fabg_t.fabgdocno
   DEFINE p_fabg005         LIKE fabg_t.fabg005
   DEFINE p_fabg008         LIKE fabg_t.fabg008
   DEFINE p_fabgstus        LIKE fabg_t.fabgstus
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0032        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_glap001         LIKE glap_t.glap001
   DEFINE l_glaa024         LIKE glaa_t.glaa024
   DEFINE l_ooac004         LIKE ooac_t.ooac004
   DEFINE la_param          RECORD
          prog              STRING,
          param             DYNAMIC ARRAY OF STRING
                            END RECORD
   DEFINE ls_js             STRING

    IF cl_null(p_fabgld)    THEN RETURN END IF   #無資料直接返回不做處理
    IF cl_null(p_fabgdocno) THEN RETURN END IF   #無資料直接返回不做處理
    #IF g_prog = 'afat507' OR g_prog = 'afat508' OR g_prog = 'afat509' OR g_prog = 'afat511' OR g_prog = 'afat521' THEN   #170301-00021#3 by 09263 --mark
    IF g_prog MATCHES 'afat507*' OR g_prog MATCHES 'afat508*' OR g_prog MATCHES 'afat509*' OR g_prog MATCHES 'afat511*' OR g_prog MATCHES 'afat521*' THEN   #170301-00021#3 by 09263 --add
       IF p_fabgstus <> 'S'    THEN RETURN END IF
    ELSE
       IF p_fabgstus <> 'Y'    THEN RETURN END IF   #無資料直接返回不做處理
    END IF
    IF NOT cl_null(p_fabg008)   THEN RETURN END IF   #無傳票單號不做處理

    #取得單別
    CALL s_aooi200_fin_get_slip(p_fabgdocno) RETURNING l_success,l_slip
    SELECT glaa024 INTO l_glaa024 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_fabgld
   
    SELECT ooac004 INTO l_ooac004
      FROM ooac_t
     WHERE ooacent = g_enterprise
       AND ooac001 = l_glaa024
       AND ooac002 = l_slip
       AND ooac003 = 'D-FIN-2002'
       
      CALL s_afat503_afap280_chk(p_fabgdocno,p_fabg008,p_fabgstus) RETURNING l_success 
      
      IF l_success = TRUE THEN              
         LET la_param.prog = 'afap280'
         LET la_param.param[1] = p_fabgld
         LET la_param.param[2] = p_fabgdocno
         LET la_param.param[3] = p_fabg005
         LET la_param.param[4] = l_ooac004
         IF NOT cl_null(l_ooac004) THEN 
            LET la_param.param[5] = 'Y'
         ELSE
            LET la_param.param[5] = 'N'
         END IF 
         
         LET ls_js = util.JSON.stringify(la_param)
         CALL cl_cmdrun_wait(ls_js)
         
      END IF 
END FUNCTION

################################################################################
# Descriptions...: ws_preprocess
# Memo...........: BPM整合用，在自動確認的transaction之前調用
#                  用途例如可在確認段前調用建立temp table的函式
# Usage..........: CALL s_afat503_ws_preprocess()
# Date & Author..: 2017/05/25 By Vivianliaw
# Modify.........: 170525-00014#1
################################################################################
PUBLIC FUNCTION s_afat503_ws_preprocess()
   DEFINE r_success LIKE type_t.chr1
   
   CALL afap280_01_cre_fa_tmp_table() RETURNING r_success
   
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_success = 'N' #若有異常會影響確認段結果，故返回N
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "s_afat503_ws_preprocess()"
      LET g_errparam.popup = FALSE
      CALL cl_err()
   END IF
END FUNCTION

################################################################################
# Descriptions...: 审核和过账时，当月是否先计提折旧检核
# Memo...........:
# Usage..........: CALL s_afat503_fixed_chk1(p_faah003,p_faah004,p_faah001,p_prog,p_ld,p_comp,p_date)
# Date & Author..: 2017/07/03 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_afat503_fixed_chk1(p_faah003,p_faah004,p_faah001,p_ld,p_comp,p_date)
DEFINE  p_faah004 LIKE faah_t.faah004
DEFINE  p_faah003 LIKE faah_t.faah003
DEFINE  p_faah001 LIKE faah_t.faah001
DEFINE  p_prog    LIKE gzza_t.gzza001
DEFINE  p_ld      LIKE fabg_t.fabgld
DEFINE  p_comp    LIKE faba_t.fabacomp
DEFINE  p_date    LIKE type_t.dat
DEFINE  l_sql     STRING
DEFINE  l_n       LIKE type_t.num5
DEFINE  l_glaacomp LIKE glaa_t.glaacomp
DEFINE  l_faal003 LIKE faal_t.faal003
DEFINE  l_year    LIKE type_t.num5
DEFINE  l_month   LIKE type_t.num5
DEFINE  l_faaj003 LIKE faaj_t.faaj003   
DEFINE  l_yy      LIKE faaj_t.faaj008   
DEFINE  l_mm      LIKE faaj_t.faaj008   
DEFINE  l_ym      LIKE faaj_t.faaj008  
DEFINE  l_faah015 LIKE faah_t.faah015
DEFINE  l_faah006 LIKE faah_t.faah006

   SELECT faah015,faah006 INTO l_faah015,l_faah006 FROM faah_t 
    WHERE faahent = g_enterprise  
      AND faah003 = p_faah003
      AND faah004 = p_faah004
      AND faah001 = p_faah001
   #PGS(D)-13132 add -S-
   #PGS(D)-13132 add -E-
   IF g_prog NOT MATCHES "afat501*" AND g_prog NOT MATCHES "afat515*" THEN 
      #检查是否存在afai021 不存在报错，存在的话，检查是否先计提折旧
      CALL cl_get_para(g_enterprise,p_comp,'S-FIN-9018') RETURNING l_year
      CALL cl_get_para(g_enterprise,p_comp,'S-FIN-9019') RETURNING l_month    
      LET l_yy = l_year
      LET l_mm = l_month
      LET l_yy = l_yy USING "&&&&"
      LET l_mm = l_mm USING "&&"
      LET l_ym = l_yy,l_mm
      LET l_faaj003 = NULL   
      SELECT faaj003 INTO l_faaj003
        FROM faaj_t
       WHERE faajent = g_enterprise
         AND faaj001 = p_faah003
         AND faaj002 = p_faah004
         AND faaj037 = p_faah001
         AND faajld  = p_ld
         AND faaj008 <= l_ym  
       IF l_faaj003 != 5  AND NOT cl_null(l_faaj003) THEN         
          SELECT faal003 INTO l_faal003 FROM faal_t 
           WHERE faalent = g_enterprise AND faalld = p_ld AND faal001 = l_faah006
          IF STATUS =100 OR cl_null(l_faal003) THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = 'afa-00183'     
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE
             CALL cl_err()
             RETURN FALSE
          ELSE
             LET l_year = YEAR(p_date)
             LET l_month = MONTH(p_date)
             IF l_faal003 = 'Y' THEN
                IF g_prog MATCHES "afat50[467]*" THEN #170911-00028#1 add #只有銷帳，報廢，出售才要卡參數             
                   SELECT COUNT(*) INTO l_n FROM faam_t
                     WHERE faament = g_enterprise AND faamld = p_ld
                       AND faam000 = p_faah001 AND faam001 = p_faah003 AND faam002= p_faah004
                       AND faam004 = l_year AND faam005 = l_month
                    IF l_n = 0 THEN
                       #检查资产状态是否为折毕
                       #190710-00012#1 mark(s)
                       #SELECT faah015 INTO l_faah015
                       #  FROM faah_t 
                       # WHERE faahent = g_enterprise
                       #   AND faah001 = p_faah001
                       #   AND faah003 = p_faah003
                       #   AND faah004 = p_faah004
                       #190710-00012#1 mark(e)
                       #190710-00012#1 add(s)
                       SELECT faaj038 INTO l_faah015
                         FROM faaj_t 
                        WHERE faajent = g_enterprise
                          AND faajld = p_ld
                          AND faaj037 = p_faah001
                          AND faaj001 = p_faah003
                          AND faaj002 = p_faah004
                       #190710-00012#1 add(e)
                       IF l_faah015 != '4' THEN 
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'afa-00280'
                          LET g_errparam.extend = p_faah003
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          RETURN FALSE
                       END IF 
                    END IF
                 END IF
             #170825-00040#1 add(s)    
             ELSE
                IF g_prog MATCHES "afat508*" THEN
                   SELECT COUNT(*) INTO l_n FROM faam_t
                    WHERE faament = g_enterprise AND faamld = p_ld
                      AND faam000 = p_faah001 AND faam001 = p_faah003 AND faam002= p_faah004
                      AND faam004 = l_year AND faam005 = l_month
                   IF l_n > 0 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'afa-00111'     
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      CALL cl_err()
                      RETURN FALSE
                   END IF
                END IF                   
             #170825-00040#1 add(e)   
             END IF          
          END IF          
       END IF          
   END IF
   RETURN TRUE
END FUNCTION

 
{</section>}
 
