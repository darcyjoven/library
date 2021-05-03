#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_credit.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0096(1900-01-01 00:00:00), PR版次:0096(2021-03-05 16:44:49)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000402
#+ Filename...: s_credit
#+ Description: 交易對象信用相關應用元件
#+ Creator....: 02748(2014-08-22 09:04:56)
#+ Modifier...: 00000 -SD/PR- 00272
 
{</section>}
 
{<section id="s_credit.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#160104-00019#3   2015/01/05  By 02097     若xmab009為NULL應給0
#160502-00001#1   2016/05/03  By Ann_Huang 調整信用額度檢核
#160531-00001#1   2016/05/31  By 02040     調整信用額度檢核，額度都改抓pmab006
#160601-00021#1   2016/06/08  By 02097     調整在簽退單確認時 將信用額度原為S2:出通單未轉出貨更新回S1:訂單未出貨
#160622-00003#1   2016/06/22  By 02040     分銷經銷商可能只有ALL資料沒SITE級，調整如只有ALL資料，也需寫入異動明細檔
#160721-00021#1   2016/07/22  By lixiang   效能优化
#160826-00035#1   2016/08/12  By charles4m 修正當銷退單沒有出貨/出通單號時算不到信用額度問題
#160807-00003#1   2016/08/30  By ywtsai    當子公司設定信用額度為母公司時，相關資料應取得母公司的信用額度資料計算
#160905-00020#1   2016/09/07  By 02040     出通單的參數出通轉出貨控管方式選3一對一(回寫出通量)，信用額度原來在出通單(S2:出通單未轉出貨)上的額度，要還回訂單(S1:訂單未出貨)
#160913-00050#1   2016/09/22  By 02040     調整訂單抓取xmdcsite
#160922-00029#1   2016/09/22  By 02040     交易對象和額度對象不一致時，需重新抓取額度客戶的信用額度資料
#160926-00036#1   2016/09/29  By 02040     因調撥出貨單後續不會立帳，因此調撥訂單不需寫入當項信用額度，只需沖銷前項額度 
#160929-00021#1   2016/09/29  By charles4m 將 160826-00035 的調整還原。
#160926-00001#1   2016/09/29  By 02040     xmab002 已無使用，整批拿掉xmab002條件
#161012-00025#1   2016/10/28  By fionchen  票據未兌現需加上寬限額度的判斷
#161026-00046#1   2016/11/04  By 02040     可超出率、逾期帳款寬限天數、允許除外額度需增加有效日期判斷
#161110-00033#1   2016/11/11  By shiun     效能調整
#161109-00085#50  2016/11/22  By 08993     整批調整系統星號寫法
#161202-00048#1   2016/12/06  By lori      修正無來源銷退信用額度未計算問題
#161121-00025#1   2016/12/07  By fionchen  調整財務沖銷前單時,帶入參數錯誤問題
#170118-00050#1   2017/01/19  By 02114     若取不到额度币别,则再去pmaa抓取
#160906-00029#1   2017/03/06  By fionchen  新增一取匯率func,增加處理若目的幣別與來源幣別都不是本幣時,在取不到直接的來源幣別與目的幣別匯率時,則取來源對本幣匯率x本幣對目的匯率
#170325-00044#1   2017/03/27  By pomelo    修改s_credit_get_exrate，傳入參數為空，錯誤訊息不明確
#170321-00035#1   2017/03/29  By 02295     计算额度余额时应加上计算比率
#170329-00002#1   2017/03/30  By 06821     2.信用核度不查核時,確認時不要再顯示信用額度幣別為空(kris:信用查核為3.查核才做寫入或異動項目異動檔)
#170424-00046#1   2017/05/02  By 07024     修正單據有附屬零件，在出貨單過帳時，信用額度S1.訂單未出貨金額(xmac011)，金額重複多扣，改成「單價、稅別」取「交期明細」裡的
#170501-00004#1   2017/05/09  By 01531     axmq140中S8项目金额有误
#170614-00037#1   2017/06/15  By ouhz      1.调整取消信用额度检查条件，都要正确写入信用明细档，并加上信用額度採用匯率时币别不可为空条件
#170618-00380#1   2017/06/18  By 08171     修正：订单写入信用额度时，据点汇率没写入
#170620-00103#1   2017/06/20  By 08993     還原#170321-00035,需把這張單的修改段全部還原(寫入xmac_t時，不可以乘以比率)
#170617-00552#1   2017/07/10  By 08992     修正出貨時超出訂單額度，更新xmac時僅能更新剩餘的部份
#170628-00039#1   2017/07/13  By 08992     修正判斷信用額度是否超限時，應乘上比率計算
#170804-00048#1   2017/08/11  By 07024     1.修正xmab_t據點匯率、集團匯率錯誤的問題
#                                          2.據點信用不查核時，據點幣別(xmab012)應該也要寫入
#                                          3.修正跨據點，出貨後，訂單已沖銷金額(xmab010)沒回寫的問題
#                                          4.修正跨據點，出貨單數量超量，出貨後，取消過帳，訂單已沖銷金額(xmab010)沒有扣回來的問題
#170915-00029#1  2017/09/21   By 05795     anmt520做兌現。再查詢信限的部份.需要各项次回冲个项次的
#171013-00002#1  2017/11/02   By 04150     信用額度計算s_credit_check_xmac004 需增加P5(xmac045) P6(xmac046)邏輯
#171205-00048#1  2017/12/06   By 01258     增加l_xmab005为空的判断，防止出现传入参数为空的错误
#                                          原因：当出货单要与出通单勾稽的话，s_credit会把型态改为出通，可是带进去的l_array来源是订单，所以捞不到资料。
#180118-00014#1  2018/01/19   By 05016     效能調校
#180124-00045#1  2018/01/26   By 05795     出現交易對象據點資料的額度計算幣別為空,在这个错误信息上显示项次和交易对象
#180320-00022#1  2018/05/10   By 09773     添加xmaa002为'S91'LC收状金额的计算类型
#170324-00046#2  2018/05/31   By 06189     anmt540產生應收溢收單功能axrq343時,信用額度由S8轉至S6,取消確認時,信用額度由S6轉回S8
#180608-00048#1  2018/06/08   By 04441     修正#161026-00046#1
#180525-00008#1  2018/06/13   By 09773     anmt540款別為30且是即期票,金額改列至S8.axrt400沖銷時,要回寫S8的已沖金額
#180703-00053#2  2018/07/10   By 09773     增加xmac020的處理
#180711-00034#1  2018/07/12   By 05795     在更新xmab得时候，l_xmab.xmab015变量给的值为null.导致xmab016没有更新
#180723-00001#1  2018/07/25   By 09505     若是信用状LC产生的anmt540要冲掉S91的金额
#180731-00060#1  2018/08/01   By 09505     axrt530点击整单操作-押导入账生成缴款单按钮，如果勾选了“同时生成收款核销单”，则产生的anmt540是已经自动复核状态，但是没有将s91的信用额度冲销掉
#180802-00036#1  2018/08/13   By 10554     s_credit_move有處理S8的段落，原本sql中只有處理 ooia002 IN('10','20','30','40','70')要將除91外的50,60,80,90,92,ZZ一併放入
#180816-00046#1  2018/08/28   by 06189     s_credit_move有處理S8的段落，原本sql中只有處理 xrde007 IN('10','20','30','40','70')要將除91外的50,60,80,90,92,ZZ一併放入
#181019-00053#1  2018/10/22   By 10042     集團信用額度控卡由原本axmm201(SITE='ALL')的資料，改成抓axmm200(pmaa_t)資料
#170810-00042#1  2018/11/02   By 06137     信用額度寫入xmab時，據點匯率、集團匯率如果抓不到，就確認不成功
#181229-00015#1  2019/01/02   by 10130    1.所有抓取計算匯率的function加判斷，參數"匯率抓取"="2"時，改抓s_aooi170相同function
#190103-00038#1  2019/01/07   By 07024     流程：訂單-出貨-應收、S-BAS-0034='Y'，變更收款條件，單據確認後，更新xmac_t出貨單、應收單的信用額度金額錯誤
#190107-00045#1  2019/01/15   By 10500     s_credit_move()中预设g_sql = ''
#190222-00025#1  2019/02/22   By 07024     修正額度交易客戶為其他客戶，xmab019、xmab020欄位資料會為空的問題
#190305-00036#1  2019/03/07   By 05634     修改"若目的幣別與來源幣別都不是本幣時,在取不到直接的來源幣別與目的幣別匯率時,則取來源對本幣匯率x本幣對目的匯率"的邏輯
#190320-00023#1  2019/04/01   By 07024     信用額度的查核方式，設置：「2.只記錄不查核」，xmac_t應該也要寫入資料
#190409-00031#1  2019/04/22   By 02111     確認時判斷該筆資料是否存在 xrcd008 = 'Y'，若有則當 xmab015 <= xmab016 的時候，將剩餘未沖銷的金額全數沖銷並將xmab017更新為 Y。
#190409-00034#1  2019/05/24   By 11384     axrt400款別為30且是即期票或者款別為30非既期+D-FIN-2010參數為'Y'時金額改列至S8
#190521-00023#2  2019/06/10   By 01366     調整信用額度
#                                          還價時，1.不走出通，確認時寫入s3沖銷s1;2.走出通，確認時寫入s3沖銷s2
#                                          還量時，1.不走出通，確認時沖銷s1;2.走出通，確認時沖銷s2
#190528-00020#1  2019/06/19   By 01366     調整簽收信用額度
#                                          簽收時，1.不走出通，確認時寫入s3沖銷s1
#                                                 2.走出通，確認時寫入s3沖銷s2、一對一(回寫出通量)需再將未出貨量沖銷s2回寫s1
#                                          簽退時，1.不走出通，不異動信用額度
#                                                 2.走出通，確認時沖銷s2回寫s1
#190614-00053#1  2019/07/03   By 02111     axmq500 要抓集團 逾期帳款寬限天數 pmaa058、逾期帳款寬限金額 pmaa074。
#190603-00014#1  2019/07/05   By 02295     S3抓取出货单时,增加判断 xmdl038[主账套已立账数量]=0 AND xmdl047[已对账数量]=0 AND xmdl053[主账套暂估数量]=0的单身才更新信用额度数据
#190306-00018#5  2019/07/12   By 01366     增加逾期帳款寬限有效日期
#190731-00022#1  2019/08/01   By 05795     优化错误信息
#190722-00056#9  2019/08/19   By 01366     增加出通單中止出貨信用額度更新
#190902-00032#5  2019/09/26   By 05488     增加"P8.已付款未沖銷"信用額度相關計算邏輯
#190927-00030#1  2019/09/30   By 01996     调整清空g_xmab017的位置
#191001-00011#1  2019/10/15   By 12133     修正s_credit_aic_chk檢查
#190802-00035#4  2019/10/31   By 01534     信用額度功能調整 1：出通單抓取沖銷資料調整,抓取出通單'S2'資料時，應同出貨單抓xmdd的資料非xmdc
#190802-00035#3  2019/12/16   By 01531     写入S5/S6/P5/P6/S8已冲销数量时，根据xmab022是否已全部冲销完毕来异动已冲销数量，xmab022=Y,则已冲销数量=1，否则为0
#                                          写入S6/P6時要用含稅金額
#190802-00035#7  2019/12/31   By 01531     anmt510复核后，若变更aooi200 D-FIN-2010参数，则取消复核后，原S9或S8没有删除掉
#191225-00029#2  2020/01/09   By 05488     aapt301直接付款未沖銷P8信用額度 
#191001-00015#1  2020/01/21   By 12133     禁用語法修改(TODAY->cl_get_today())
#200119-00018#1  2020/01/20   By 07804     修正取消確認時，信用額度回寫S2，完全已沖銷數量狀態未更新
#200109-00032#1  2020/02/11   By 10042     借貨出通單中止出貨後，xmab009=出通單的新的含稅金額，xmab015=出通單的新的實際出貨量
#200116-00002#1  2020/02/15   By 05488     財務段信用額度匯率抓取調整(依信用额度项目抓取aoos020參數設置)
#200310-00065#1  2020/03/11   By 08734     修正出通单中止出货后S2没有冲减未冲销额度币种金额和额度重耗用金额。
#191104-00018#3  2020/03/20   By 01534     信用額度漏了處理採購驗退的部份(驗退單確認時，應寫入xmab_t資料，並立即沖銷掉，另沖銷收貨單(P2)，反沖銷採購單(P1))
#190924-00040#1  2020/04/09   By 01534     出通参数一对一(回写出通量)的问题修正
#200410-00040#1  2020/04/10   By 01534     出通参数一对一(回写出通量)出貨數量是0的情況修正
#200226-00031#1  2020/04/24   By 09424     解决axmt591借货还量时回写到信用评核表xmab_t中不是计价数量的问题
#200507-00006#1  2020/05/07   By 01996     调整#190802-00035#4 增加取新的去汇率规则,取到后没有RETURN的问题
#200401-00040#1  2020/05/22   By lifan     修正#190802-00035#3 查询已冲销数量与计价数量大小时，单号和项次条件未正确给到条件，未自动更新xmab022数量完全冲销为Y，导致axmp150重整显示异常
#200908-00092#1  2020/09/09   By 11234     核销单冲销应收单，写入xmab中的资料无法具体到多账期项次期别，加上判断不为核销单时，再取xmab资料来更新xmac
#201222-00022#1  2020/12/28   By 11234     效能优化，将foreach中sql改为动态sql，用execute写法
#210220-00047#1  2021/02/22   By 11234     修正核销单取消审核后xmac中资料更新的问题
#210304-00047#1  2021/03/05   By 00272     若出貨超交,單據[確認]後,回寫的S1.訂單未出貨金額(xmac011)應為0,不應為負值
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util  #150701 by whitney add
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_credit.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
 
#end add-point
 
{</section>}
 
{<section id="s_credit.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
   DEFINE g_sql      STRING
   #180124-00045#1---add---str
   DEFINE g_xmab004  LIKE  xmab_t.xmab004
   DEFINE g_xmab006  LIKE  xmab_t.xmab006
   #180124-00045#1---add---end
   DEFINE g_xmab017  LIKE  xmab_t.xmab017 #190409-00031#1     
   DEFINE g_xmab022  LIKE  xmab_t.xmab022 #190802-00035#4 add  
   DEFINE g_xmak001  LIKE  xmak_t.xmak001 #190802-00035#5 add
   DEFINE g_xmak002  LIKE  xmak_t.xmak002 #190802-00035#5 add
   DEFINE g_xmak003  LIKE  xmak_t.xmak003 #190802-00035#5 add 
#end add-point
 
{</section>}
 
{<section id="s_credit.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_credit.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 更新交易對像信用餘額檔的信用餘額與其他相關資料
# Memo...........:
# Usage..........: s_credit_upd_xmac(p_xmab003,p_xmab004,p_site,p_cust,ls_js,p_amount,p_proj,p_proj_o,p_type,p_array)
#                  RETURNING r_success
# Input parameter: p_xmab003      出貨單號
#                : p_xmab004      版本
#                : p_site         交易組織
#                : p_cust         客戶編號
#                : ls_js          STRING
#                     curr          交易幣別
#                     rate          交易匯率
#                : p_amount       總含稅金額
#                : p_proj         目前計算項目
#                : p_proj_o       前置計算項目
#                : p_type         異動類型(1:正向, -1:反向)
#                : p_array        沖銷明細陣列
# Return code....: r_success      處理狀態
# Date & Author..: 140822 By bartscott
# Modify.........: 150120 By whitney  捞集团的信用额度设置时,捞pmab_t pmabsite='ALL'的资料,非pmaa_t
################################################################################
PUBLIC FUNCTION s_credit_upd_xmac(p_xmab003,p_xmab004,p_site,p_cust,ls_js,p_amount,p_proj,p_proj_o,p_type,p_array)
DEFINE p_xmab003    LIKE xmab_t.xmab003
DEFINE p_xmab004    LIKE xmab_t.xmab004
DEFINE p_site       LIKE xmab_t.xmab005
DEFINE p_cust       LIKE pmaa_t.pmaa001
DEFINE p_currency   LIKE xmab_t.xmab007
DEFINE p_amount     LIKE xmab_t.xmab009
DEFINE p_proj       LIKE xmaa_t.xmaa002
DEFINE p_proj_o      LIKE xmaa_t.xmaa002
DEFINE p_type       LIKE type_t.num5
DEFINE p_array      DYNAMIC ARRAY OF RECORD 
    xmab003    LIKE xmab_t.xmab003,
    xmab005    LIKE xmab_t.xmab005,
    xmab009    LIKE xmab_t.xmab009
                END RECORD
DEFINE r_success    LIKE type_t.num5
DEFINE l_pmab       RECORD  
    pmabsite   LIKE pmab_t.pmabsite,
    pmab003    LIKE pmab_t.pmab003,
    pmab004    LIKE pmab_t.pmab004,
    pmab005    LIKE pmab_t.pmab005,
    pmab006    LIKE pmab_t.pmab006
                END RECORD
#DEFINE l_pmaa       RECORD
#    pmaa051    LIKE pmaa_t.pmaa051,
#    pmaa052    LIKE pmaa_t.pmaa052,
#    pmaa053    LIKE pmaa_t.pmaa053,
#    pmaa054    LIKE pmaa_t.pmaa054,
#    pmaa055    LIKE pmaa_t.pmaa055
#                END RECORD
#161109-00085#60-s mod
#DEFINE l_xmab       RECORD LIKE xmab_t.*   #161109-00085#60 mark
DEFINE l_xmab       RECORD  #信用評核異動明細檔
       xmabent LIKE xmab_t.xmabent, #企業編號
       xmab001 LIKE xmab_t.xmab001, #計算項目
       xmab002 LIKE xmab_t.xmab002, #異動類型
       xmab003 LIKE xmab_t.xmab003, #單據編號
       xmab004 LIKE xmab_t.xmab004, #單據項次
       xmab005 LIKE xmab_t.xmab005, #交易營運據點
       xmab006 LIKE xmab_t.xmab006, #交易客戶
       xmab007 LIKE xmab_t.xmab007, #交易幣別
       xmab008 LIKE xmab_t.xmab008, #額度客戶
       xmab009 LIKE xmab_t.xmab009, #交易含稅金額
       xmab010 LIKE xmab_t.xmab010, #已沖銷金額
       xmab011 LIKE xmab_t.xmab011, #異動日期
       xmab012 LIKE xmab_t.xmab012, #據點額度幣別
       xmab013 LIKE xmab_t.xmab013, #據點匯率
       xmab014 LIKE xmab_t.xmab014, #交易計價單位
       xmab015 LIKE xmab_t.xmab015, #計價數量
       xmab016 LIKE xmab_t.xmab016, #已沖銷數量
       xmab017 LIKE xmab_t.xmab017, #結案否
       xmab018 LIKE xmab_t.xmab018, #額度營運據點
       xmab019 LIKE xmab_t.xmab019, #集團額度幣別
       xmab020 LIKE xmab_t.xmab020, #集團匯率
       xmab021 LIKE xmab_t.xmab021, #190802-00035#4 add
       xmab022 LIKE xmab_t.xmab022, #190802-00035#4 add
       xmab023 LIKE xmab_t.xmab023 
               END RECORD   
#161109-00085#60-e mod
DEFINE l_xmaa001    LIKE xmaa_t.xmaa001
DEFINE l_xmaa004    LIKE xmaa_t.xmaa004
DEFINE l_xmab008    LIKE xmab_t.xmab008
DEFINE l_xmab012    LIKE xmab_t.xmab012
DEFINE l_xmab013    LIKE xmab_t.xmab013
DEFINE l_pmaa053    LIKE pmaa_t.pmaa053
DEFINE l_pmab004    LIKE pmab_t.pmab004
DEFINE l_para_data  LIKE type_t.chr80
DEFINE l_exchange   LIKE xmab_t.xmab013
DEFINE l_i          LIKE type_t.num5
DEFINE l_num        LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5
#190802-00035#4-S add
DEFINE l_xmak RECORD  #信用評核沖銷明細檔
          xmakent LIKE xmak_t.xmakent, #企業代碼
          xmak001 LIKE xmak_t.xmak001, #計算項目
          xmak002 LIKE xmak_t.xmak002, #單據編號
          xmak003 LIKE xmak_t.xmak003, #單據項次
          xmak004 LIKE xmak_t.xmak004, #沖銷計算項目
          xmak005 LIKE xmak_t.xmak005, #沖銷單據編號
          xmak006 LIKE xmak_t.xmak006, #沖銷單據項次
          xmak007 LIKE xmak_t.xmak007, #沖銷金額
          xmak008 LIKE xmak_t.xmak008, #沖銷數量
          xmak009 LIKE xmak_t.xmak009, #沖銷結案否
          xmak010 LIKE xmak_t.xmak010  #沖銷建立日期
END RECORD
DEFINE ls_js      STRING
DEFINE ls_js2     STRING
DEFINE lc_param2  RECORD
             curr       LIKE ooan_t.ooan002,    
             rate       LIKE xmab_t.xmab013 
                  END RECORD 
DEFINE lc_param  RECORD
             scc40      LIKE type_t.chr2,       #汇率类型
             curr       LIKE ooan_t.ooan002,    #190802-00035#4 add
             rate       LIKE xmab_t.xmab013     #190802-00035#4 add
            ,xmab001    LIKE xmab_t.xmab001     #計算項目        #200116-00002#1 add
                 END RECORD                     
#190802-00035#4-E add


   WHENEVER ERROR CONTINUE 
   
   LET r_success = TRUE
   
   IF cl_null(p_xmab003) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   ENd IF
   
   CALL util.JSON.parse(ls_js,lc_param2)  #190802-00035#4 add
   LET p_currency = lc_param2.curr        #190802-00035#4 add   

#   #處理交易對象集團信用資料
#   LET g_sql = " SELECT pmaa051,pmaa052,pmaa053,pmaa054 ",
#               "   FROM pmaa_t ",
#               "  WHERE pmaaent = ",g_enterprise,
#               "    AND pmaa001 = '",p_cust,"'"
#   PREPARE s_credit_pmaa_p1 FROM g_sql
#   DECLARE s_credit_pmaa_c1 CURSOR FOR s_credit_pmaa_p1 

   #處理交易對象據點信用資料
   #170810-00042#1 Mark By 06137  181102(S)
   #LET g_sql = " SELECT pmabsite,pmab003,pmab004,pmab005,pmab006 ",
   #            "   FROM pmab_t ",
   #            "  WHERE pmabent = ",g_enterprise,
   #            "    AND pmab001 = '",p_cust,"'",
   #            "    AND (pmabsite = '",p_site,"' OR pmabsite = 'ALL') ",
   #            "    AND pmab002 IN ('2','3') "                               #'1:不查核'或'4:依據集團設置'，則不處理
   #170810-00042#1 Mark By 06137  181102(E)  
   #170810-00042#1 Add By 06137  181102(S)     原本集團取axmm201，改取axmm200(pmaa_t)
   LET g_sql = " SELECT pmabsite,pmab003,pmab004,pmab005,pmab006 ",
               "   FROM pmab_t ",
               "  WHERE pmabent = ",g_enterprise,
               "    AND pmab001 = '",p_cust,"'",
               "    AND (pmabsite = '",p_site,"') ",
               "    AND pmab002 IN ('2','3') ",                               #'1:不查核'或'4:依據集團設置'，則不處理
               "  UNION ",
               " SELECT 'ALL',pmaa052,pmaa053,pmaa054,pmaa055 ",
               "   FROM pmaa_t ",
               "  WHERE pmaaent = ",g_enterprise,
               "    AND pmaa001 = '",p_cust,"'",
               "    AND pmaa051 IN ('2','3') "
   #170810-00042#1 Add By 06137  181102(E)               
   PREPARE s_credit_pmab_p3 FROM g_sql
   DECLARE s_credit_pmab_c3 CURSOR FOR s_credit_pmab_p3
   
#190802-00035#4 MOD-S
   #180118-00014#1 ---s---
   LET g_sql = " SELECT DISTINCT xmab008,xmab012,xmab013 ",
               "   FROM xmab_t                           ",
               "  WHERE xmabent = ",g_enterprise,"       ",
               "    AND xmab001 = '",p_proj_o,"'         ",
              #"    AND xmab003 = ? AND xmab005 ?        " #190722-00056#9 mark
               "    AND xmab003 = ? AND xmab005 = ?      " #190722-00056#9 add
   PREPARE s_credit_xmab_p2 FROM g_sql
   #180118-00014#1 ---e---
#190802-00035#4 MOD-E  

   FOREACH s_credit_pmab_c3 INTO l_pmab.pmabsite,l_pmab.pmab003,
                                 l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
                
      IF cl_null(l_pmab.pmab003) THEN
         LET l_pmab.pmab003 = p_cust
      END IF 
 
      IF cl_null(l_pmab.pmab006) THEN
         LET l_pmab.pmab006 = 0
      END IF
      
      IF cl_null(l_pmab.pmab005) THEN
         LET l_pmab.pmab005 = s_credit_get_currency(p_site)         
      END IF
      
      #更新目前計算項目資料
      IF NOT s_credit_upd_xmac_count(p_site,p_currency,p_amount,p_proj,'1',p_type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006,'') THEN
             
         LET r_success = FALSE
         RETURN r_success
      END IF
      
#190802-00035#4 mark-S   #移至FOREACH 外   
#      #180118-00014#1 ---s---
#      LET g_sql = " SELECT DISTINCT xmab008,xmab012,xmab013 ",
#                  "   FROM xmab_t                           ",
#                  "  WHERE xmabent = ",g_enterprise,"       ",
#                  "    AND xmab001 = '",p_proj_o,"'         ",
#                 #"    AND xmab003 = ? AND xmab005 ?        " #190722-00056#9 mark
#                  "    AND xmab003 = ? AND xmab005 = ?      " #190722-00056#9 add
#      PREPARE s_credit_xmab_p2 FROM g_sql
#      #180118-00014#1 ---e---
#190802-00035#4 mark-E 

      #沖銷明細陣列
      FOR l_i = 1 TO p_array.getLength()
         #判斷是否為單號中的額度客戶
         #180118-00014#1 ---s---
         #LET g_sql = " SELECT DISTINCT xmab008,xmab012,xmab013 ",
         #            "   FROM xmab_t ",
         #            "  WHERE xmabent = ",g_enterprise,
         #            "    AND xmab001 = '",p_proj_o,"'",
         #            "    AND xmab003 = '",p_array[l_i].xmab003,"'",
         #            "    AND xmab005 = '",p_array[l_i].xmab005,"'"
         #PREPARE s_credit_xmab_p2 FROM g_sql
         #DECLARE s_credit_xmab_c2 CURSOR FOR s_credit_xmab_p2
         #180118-00014#1 ---e---
         LET l_xmab008 = ''
         LET l_xmab013 = 0
         LET l_xmab012 = ''
         EXECUTE s_credit_xmab_p2 USING p_array[l_i].xmab003,p_array[l_i].xmab005 INTO l_xmab008,l_xmab012,l_xmab013 #180118-00014#1 add
         #180118-00014#1 ---s---
         #OPEN s_credit_xmab_c2
         #FETCH s_credit_xmab_c2 INTO l_xmab008,l_xmab012,l_xmab013
         #CLOSE s_credit_xmab_c2
         #180118-00014#1 ---e---
         
         IF l_xmab008 = l_pmab.pmab003 THEN

            #更新前置計算項目資料
            IF NOT s_credit_upd_xmac_count(p_site,p_currency,p_array[l_i].xmab009,p_proj_o,'2',p_type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF

         END IF
      END FOR
   END FOREACH
   
   #新增異動明細檔
   IF p_type = '1' THEN
      INITIALIZE l_xmab TO NULL 
      
      LET l_xmab008 = ''
      LET l_xmab012 = ''
      LET l_pmab004 = ''
      SELECT pmab003,pmab005,pmab004 INTO l_xmab008,l_xmab012,l_pmab004
        FROM pmab_t
       WHERE pmabent = g_enterprise
         AND pmab001 = p_cust
         AND pmabsite = p_site
      LET l_xmab.xmab008 = l_xmab008
      LET l_xmab.xmab012 = l_xmab012
      LET l_xmaa001 = l_pmab004
      IF cl_null(l_xmab.xmab008) OR cl_null(l_xmab.xmab012) OR cl_null(l_xmaa001) THEN
         LET l_xmab008 = ''
         LET l_xmab012 = ''
         LET l_pmaa053 = ''
         SELECT pmaa052,pmaa054,pmaa053  INTO l_xmab008,l_xmab012,l_pmaa053
           FROM pmaa_t
          WHERE pmaaent = g_enterprise
            AND pmaa001 = p_cust
         IF cl_null(l_xmab.xmab008) THEN
            LET l_xmab.xmab008 = l_xmab008
         END IF
         IF cl_null(l_xmab.xmab012) THEN
            LET l_xmab.xmab012 = l_xmab012
         END IF
         IF cl_null(l_xmaa001) THEN
            LET l_xmaa001 = l_pmaa053
         END IF
      END IF
      IF cl_null(l_xmab.xmab012) THEN
         LET l_xmab.xmab012 = s_credit_get_currency(p_site)
      END IF
      
      SELECT xmaa004 INTO l_xmaa004
        FROM xmaa_t
       WHERE xmaaent = g_enterprise
         AND xmaa001 = l_xmaa001
         AND xmaa002 = p_proj
       
#      IF cl_null(l_xmaa004) THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = 'xmaa_t' 
#         LET g_errparam.code   = 'sub-00618'
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
      
      LET l_xmab.xmab002 = l_xmaa004
      LET l_xmab.xmab001 = p_proj
      LET l_xmab.xmab003 = p_xmab003
      LET l_xmab.xmab004 = p_xmab004
      IF cl_null(l_xmab.xmab004) THEN
         LET l_xmab.xmab004 = 1
      END IF
      LET l_xmab.xmab005 = p_site
      LET l_xmab.xmab006 = p_cust
      LET l_xmab.xmab007 = p_currency
      LET l_xmab.xmab009 = p_amount
      LET l_xmab.xmab010 = 0
      LET l_xmab.xmab011 = g_today

      #信用額度採用匯率類型
      IF NOT cl_null(l_xmab.xmab012) THEN
         CALL cl_get_para(g_enterprise,p_site,'S-BAS-0013') RETURNING l_para_data
        #CALL s_aooi160_get_exrate('1',p_site,g_today,l_xmab.xmab007,l_xmab.xmab012,0,l_para_data) RETURNING l_exchange   #160906-00029#1 mark
        #CALL s_credit_get_exrate('1',p_site,g_today,l_xmab.xmab007,l_xmab.xmab012,0,l_para_data) RETURNING l_exchange   #160906-00029#1 add  #190802-00035#4 mark
         LET lc_param.scc40 = l_para_data
         LET lc_param.curr = lc_param2.curr
         LET lc_param.rate = lc_param2.rate
         LET lc_param.xmab001 = l_xmab.xmab001       #200116-00002#1 add
         LET ls_js2 = util.JSON.stringify(lc_param)
         CALL s_credit_get_exrate('1',p_site,l_xmab.xmab011,l_xmab.xmab007,l_xmab.xmab012,0,ls_js2) RETURNING l_exchange   #190802-00035#4 add 
         LET l_xmab.xmab013 = l_exchange
      END IF
      
      IF cl_null(l_xmab.xmab002) THEN LET l_xmab.xmab002 = ' ' END IF
      #190802-00035#4-S add
      LET l_xmab.xmab002 = ' '   
      LET l_xmab.xmab021 = ''
      SELECT pmaa052 INTO l_xmab.xmab021 FROM pmaa_t 
       WHERE pmaaent = g_enterprise
         AND pmaa001 = l_xmab.xmab006
      LET l_xmab.xmab022 = 'N' 
      LET l_xmab.xmab023 = lc_param2.rate       
      #190802-00035#4-E add   
      INSERT INTO xmab_t(xmabent,xmab001,xmab002,xmab003,xmab004,
                         xmab005,xmab006,xmab007,xmab008,xmab009,
                         xmab010,xmab011,xmab012,xmab013,xmab021,xmab022,xmab023)  #190802-00035#4 add xmab021
                  VALUES(g_enterprise,l_xmab.xmab001,l_xmab.xmab002,l_xmab.xmab003,l_xmab.xmab004,
                         l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
                         l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab021,l_xmab.xmab022,l_xmab.xmab023) #190802-00035#4 add xmab021 

      #1-1.信用額度建立目前項目並沖銷前置項目時，增加寫入xmak_t
      #	xmakent(企業編號)=xmabent
      #	xmak001(計算項目)=xmab001
      #	xmak002(單據編號)=xmab003
      #	xmak003(單據項次)=xmab004
      #	xmak004(沖銷計算項目)=沖銷項目
      #	xmak005(沖銷單據編號)=沖銷單號
      #	xmak006(沖銷單據項次)=沖銷項次
      #	xmak007(沖銷金額)=此次沖銷金額
      #	xmak008(沖銷數量)=xmab015
      #	xmak009(沖銷結案否)="N"
      #	xmak010(沖銷建立日期)=xmab011  
       
      #190802-00035#4-S add
      LET l_xmak.xmakent = g_enterprise
      LET l_xmak.xmak001 = l_xmab.xmab001
      LET l_xmak.xmak002 = l_xmab.xmab003
      LET l_xmak.xmak003 = l_xmab.xmab004
      LET l_xmak.xmak004 = p_proj_o   #沖銷項目
      LET l_xmak.xmak005 = '' #沖銷單號
      LET l_xmak.xmak006 = '' #沖銷項次
      LET l_xmak.xmak007 = 0
      LET l_xmak.xmak008 = l_xmab.xmab015
      LET l_xmak.xmak009 = 'N'
      LET l_xmak.xmak010 = l_xmab.xmab011  
      
      INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                         xmak006,xmak007,xmak008,xmak009,xmak010)
                  VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                         l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
      
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "ins2 xmak_t:" 
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF                     
      #190802-00035#4-E add  
                        
   ELSE
      IF NOT cl_null(p_xmab004) THEN
         DELETE FROM xmab_t 
          WHERE xmabent = g_enterprise 
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003 
            AND xmab004 = p_xmab004
            AND xmab005 = p_site 
#190802-00035#4-S add
         DELETE FROM xmak_t 
          WHERE xmakent = g_enterprise
            AND xmak001 = p_proj
            AND xmak002 = p_xmab003
            AND xmak003 = p_xmab004
#190802-00035#4-E add
      ELSE
         DELETE FROM xmab_t 
          WHERE xmabent = g_enterprise 
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003 
            AND xmab005 = p_site 
#190802-00035#4-S add
         DELETE FROM xmak_t 
          WHERE xmakent = g_enterprise
            AND xmak001 = p_proj
            AND xmak002 = p_xmab003
#190802-00035#4-E add            
      END IF            
   END IF
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = 'xmab_t' 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #沖銷明細陣列
   FOR l_i = 1 TO p_array.getLength()
      IF p_type = '1' THEN
         LET l_num = 1
      ELSE
         LET l_num = -1
      END IF 
      UPDATE xmab_t
         #SET xmab010 = xmab010 + (p_array[l_i].xmab009 * l_num),   #190802-00035#4 mark
         #    xmab011 = g_today                                     #190802-00035#4 mark
         SET xmab010 = xmab010 + (p_array[l_i].xmab009 * l_num)     #190802-00035#4 add
       WHERE xmabent = g_enterprise
         AND xmab001 = p_proj_o
         AND xmab003 = p_array[l_i].xmab003
         AND xmab005 = p_array[l_i].xmab005
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'xmab_t' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END FOR
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢核信用餘額是否足夠
# Memo...........:
# Usage..........: CALL s_credit_check_xmac004(p_site,p_cust,p_proj,p_proj_o,p_amount,ls_js)
#                  RETURNING r_success,r_flag
# Input parameter: p_site         交易組織
#                : p_cust         交易對象
#                : p_proj         計算項目
#                : p_proj_o       前置計算項目
#                : p_amount       交易金額
#                : ls_js          STRING
#                     curr           交易幣別
#                     rate           交易匯率
# Return code....: r_success      處理狀態
#                : r_flag         信用餘額足夠否(1:足夠, 0:超限, 2:逾期)
# Date & Author..: 140822 By bartscott
# Modify.........: 150120 By whitney 捞集团的信用额度设置时,捞pmab_t pmabsite='ALL'的资料,非pmaa_t
#                : 150615 By Polly   增加考慮可超出率、寬限天數、允許除外額度
#                : 150924 By whitney 將回傳值r_flag的0表示超限;新增2逾期
################################################################################
PUBLIC FUNCTION s_credit_check_xmac004(p_site,p_cust,p_proj,p_proj_o,p_amount,ls_js)
DEFINE p_site       LIKE pmab_t.pmabsite
DEFINE p_cust       LIKE pmaa_t.pmaa001
DEFINE p_proj       LIKE xmaa_t.xmaa002
DEFINE p_proj_o     LIKE xmaa_t.xmaa002
DEFINE p_amount     LIKE xmab_t.xmab009
DEFINE p_currency   LIKE xmab_t.xmab007
DEFINE r_success    LIKE type_t.num5
DEFINE r_flag       LIKE type_t.num5
DEFINE l_pmab       RECORD  
          pmabsite     LIKE pmab_t.pmabsite,
          pmab003      LIKE pmab_t.pmab003,
          pmab004      LIKE pmab_t.pmab004,
          pmab005      LIKE pmab_t.pmab005,
          pmab006      LIKE pmab_t.pmab006,
          pmab007      LIKE pmab_t.pmab007,       #20150615 POLLY ADD        
          pmab008      LIKE pmab_t.pmab008,       #161026-00046#1 add  
          pmab010      LIKE pmab_t.pmab010,       #20150615 POLLY ADD
          pmab020      LIKE pmab_t.pmab020        #161026-00046#1 add
       END RECORD
#DEFINE l_pmaa       RECORD
#          pmaa051      LIKE pmaa_t.pmaa051,
#          pmaa052      LIKE pmaa_t.pmaa052,
#          pmaa053      LIKE pmaa_t.pmaa053,
#          pmaa054      LIKE pmaa_t.pmaa054,
#          pmaa055      LIKE pmaa_t.pmaa055
#       END RECORD
DEFINE l_para_data  LIKE type_t.chr80
DEFINE l_exchange   LIKE xmab_t.xmab013
DEFINE l_xmac003    LIKE xmab_t.xmab009
DEFINE l_xmac003_o  LIKE xmab_t.xmab009
DEFINE l_xmac004    LIKE xmab_t.xmab009
DEFINE l_xmaa004    LIKE xmaa_t.xmaa004
DEFINE l_xmaa005    LIKE xmaa_t.xmaa005
DEFINE l_xmaa004_o  LIKE xmaa_t.xmaa004
DEFINE l_xmaa005_o  LIKE xmaa_t.xmaa005
DEFINE l_num        LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_xmaa002    LIKE xmaa_t.xmaa002
DEFINE l_sum        LIKE xmab_t.xmab009
#161109-00085#60-s mod
#DEFINE l_xmac       RECORD LIKE xmac_t.*   #161109-00085#60 mark
DEFINE l_xmac       RECORD  #交易對象信用餘額檔
       xmac011 LIKE xmac_t.xmac011, #S1.訂單未出貨金額
       xmac012 LIKE xmac_t.xmac012, #S2.出通單金額
       xmac013 LIKE xmac_t.xmac013, #S3.出貨未開發票金額
       xmac014 LIKE xmac_t.xmac014, #S4.銷退折讓金額
       xmac015 LIKE xmac_t.xmac015, #S5.發票應收帳款
       xmac016 LIKE xmac_t.xmac016, #S6.應收待抵賬款
       xmac017 LIKE xmac_t.xmac017, #NO USE
       xmac018 LIKE xmac_t.xmac018, #S8.已收款未沖銷
       xmac019 LIKE xmac_t.xmac019, #S9.未兌現應收票據
       xmac020 LIKE xmac_t.xmac020, #S91.LC收状金额    #180320-00022#1 add
       xmac041 LIKE xmac_t.xmac041, #P1.採購未收貨金額
       xmac042 LIKE xmac_t.xmac042, #P2.收貨未入庫金額
       xmac043 LIKE xmac_t.xmac043, #P3.入庫未立應付金額
       xmac044 LIKE xmac_t.xmac044  #P4.倉退金額
       #--171013-00002#1 start--
      ,xmac045 LIKE xmac_t.xmac045,
       xmac046 LIKE xmac_t.xmac046
       #--171013-00002#1 end--
      ,xmac049 LIKE xmac_t.xmac049  #P8.已付款未沖銷            #190902-00032#5 add
END RECORD
#161109-00085#60-e mod

#190802-00035#4-S add
DEFINE lc_param2  RECORD
             curr       LIKE ooan_t.ooan002,    
             rate       LIKE xmab_t.xmab013 
                  END RECORD 
DEFINE ls_js            STRING   
DEFINE ls_js2           STRING 
DEFINE lc_param  RECORD
             scc40      LIKE type_t.chr2,       #汇率类型
             curr       LIKE ooan_t.ooan002,    
             rate       LIKE xmab_t.xmab013     
            ,xmab001    LIKE xmab_t.xmab001     #計算項目        #200116-00002#1 add
                 END RECORD     
#190802-00035#4-E add

    WHENEVER ERROR CONTINUE 
   
    LET r_success = TRUE
    LET r_flag = TRUE
    
    CALL util.JSON.parse(ls_js,lc_param2)  #190802-00035#4 add
    LET p_currency = lc_param2.curr        #190802-00035#4 add
    
   ##檢查集團的信用餘額
   #LET g_sql = "SELECT pmaa051,pmaa052,pmaa053,pmaa054,pmaa055 ",
   #            "  FROM pmaa_t ",
   #            " WHERE pmaaent = ",g_enterprise,
   #            "   AND pmaa001 = '",p_cust,"'"
   #PREPARE s_credit_pmaa_p2 FROM g_sql
   #EXECUTE s_credit_pmaa_p2 INTO l_pmaa.pmaa051,l_pmaa.pmaa052,l_pmaa.pmaa053,l_pmaa.pmaa054,l_pmaa.pmaa055

    LET g_sql = "SELECT xmaa002,xmaa004,xmaa005 ",
                "  FROM xmaa_t ",
                " WHERE xmaaent = ",g_enterprise,
                "   AND xmaa001 = ? "          
    PREPARE s_credit_xmaa_p1 FROM g_sql
    DECLARE s_credit_xmaa_c1 CURSOR FOR s_credit_xmaa_p1
   #處理交易對象據點信用資料
#151228-00022 by whitney modify start
#    LET g_sql = "SELECT pmabsite,pmab003,pmab004,pmab005,pmab006, ",
#                "       pmab007,pmab010 ",                                     #20150615 POLLY ADD
#                "  FROM pmab_t ",
#                " WHERE pmabent = ",g_enterprise,
#                "   AND pmab001 = '",p_cust,"'",
#                "   AND (pmabsite = '",p_site,"' OR pmabsite = 'ALL') ",
#                "   AND pmab002 IN ('2','3') "                                  #'1:不查核'或'4:依據集團設置'，則不處理
   #LET g_sql = "SELECT b.pmabsite,b.pmab003,b.pmab004,b.pmab005,b.pmab006,b.pmab007,b.pmab010 ",   #161026-00046#1 mark
    LET g_sql = "SELECT b.pmabsite,b.pmab003,b.pmab004,b.pmab005,b.pmab006, ",   #161026-00046#1 add
                "       b.pmab007,b.pmab008,b.pmab010,b.pmab020 ",               #161026-00046#1 add     
                "  FROM pmab_t a,pmab_t b ",
                " WHERE a.pmabent = ",g_enterprise,
                #"   AND (a.pmabsite = '",g_site,"' OR a.pmabsite = 'ALL') ",  #181019-00053#1 mark
                "   AND a.pmabsite = '",g_site,"' ",                           #181019-00053#1 add
                "   AND a.pmabent = b.pmabent ",
                "   AND a.pmabsite = b.pmabsite ",
                "   AND b.pmab002 IN ('2','3') ",  #'1:不查核'或'4:依據集團設置'，則不處理
                "   AND a.pmab003 = b.pmab001 ",
                #"   AND a.pmab001 = '",p_cust,"' "  #181019-00053#1 mark
                #181019-00053#1 -S add
                "   AND a.pmab001 = '",p_cust,"' ",
                " UNION ",  #抓集團級的客戶信用額度
                "SELECT 'ALL',b.pmaa052,b.pmaa053,b.pmaa054,b.pmaa055, ",
                "       b.pmaa056,b.pmaa057,b.pmaa059,b.pmaa075",
                "  FROM pmaa_t a,pmaa_t b ",
                " WHERE a.pmaaent = ",g_enterprise,
                "   AND a.pmaaent = b.pmaaent ",
                "   AND a.pmaa051 IN ('2','3') ",
                "   AND a.pmaa052 = b.pmaa001 ",
                "   AND a.pmaa001 = '",p_cust,"' "
                #181019-00053#1- E add
#151228-00022 by whitney modify end
    PREPARE s_credit_pmab_p2 FROM g_sql
    DECLARE s_credit_pmab_c2 CURSOR FOR s_credit_pmab_p2
   
   
   #--20150417--POLLY--MARK--(S)
   #FOREACH s_credit_xmaa_c1 INTO l_xmaa002,l_xmaa004,l_xmaa005
   #   IF l_xmaa002 = 'S10' THEN
   #      LET l_cnt = 0
   #      SELECT COUNT(1) INTO l_cnt
   #        FROM xrca_t,xrcc_t
   #       WHERE xrcaent = xrccent
   #         AND xrcald = xrccld
   #         AND xrcadocno = xrccdocno
   #         AND xrcaent = g_enterprise
   #         AND xrca004 = p_cust
   #         AND xrcc108 - xrcc109 > 0
   #         AND xrcc003 < g_today
   #      IF l_cnt > 0 THEN
   #         LET r_flag = FALSE
   #         RETURN r_success,r_flag
   #      END IF
   #   END IF
   #   IF l_xmaa002 = 'S11' THEN
   #      LET l_cnt = 0
   #      SELECT COUNT(1) INTO l_cnt
   #        FROM nmba_t,nmbb_t
   #       WHERE nmbaent = nmbbent
   #         AND nmbacomp = nmbbcomp
   #         AND nmbadocno = nmbbdocno
   #         AND nmbaent = g_enterprise
   #         AND nmba004 = p_cust
   #         AND (nmbb042 = 1 OR nmbb042 = 2)
   #         AND nmbb031 < g_today
   #      IF l_cnt > 0 THEN
   #         LET r_flag = FALSE
   #         RETURN r_success,r_flag
   #      END IF
   #   END IF
   #END FOREACH
   #--20150417--POLLY--MARK--(E)
   #161026-00046#1-s-mark
   #FOREACH s_credit_pmab_c2 INTO l_pmab.pmabsite,l_pmab.pmab003,
   #                              l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006,
   #                              l_pmab.pmab007,l_pmab.pmab010        #20150615 POLLY ADD 
   #161026-00046#1-e-mark
   #161026-00046#1-s-add
   FOREACH s_credit_pmab_c2 INTO l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006,
                                 l_pmab.pmab007,l_pmab.pmab008,l_pmab.pmab010,l_pmab.pmab020
            
     #160922-00029#1-s-add
      IF p_cust <> l_pmab.pmab003 THEN
         SELECT pmab004,pmab005,pmab006,                  
                pmab007,pmab008,pmab010,pmab020                               #161026-00046#1 add
           INTO l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006,
                l_pmab.pmab007,l_pmab.pmab008,l_pmab.pmab010,l_pmab.pmab020   #161026-00046#1 add
           FROM pmab_t
          WHERE pmabent = g_enterprise
            AND pmab001 = l_pmab.pmab003
            AND pmabsite = l_pmab.pmabsite
      END IF   
     #160922-00029#1-e-add

      #S10:检查OVER DUE  
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt  #161026-00046#1 *mod 1
        FROM xmaa_t
       WHERE xmaaent = g_enterprise 
         AND xmaa001 = l_pmab.pmab004
         AND xmaa002 = 'S10'               
      IF l_cnt > 0 THEN   
        #IF NOT s_credit_over_due_chk(p_site,p_cust) THEN                     #20150615 POLLY MARK
        #IF NOT s_credit_over_due_chk(l_pmab.pmabsite,p_cust) THEN            #20150615 POLLY ADD #161026-00046#1 mark
         IF NOT s_credit_over_due_chk(l_pmab.pmabsite,l_pmab.pmab003) THEN    #161026-00046#1 add
         
            LET r_flag = 2
            RETURN r_success,r_flag
         END IF
      END IF 
      #S11:检查逾期未兑现票据
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt   #161026-00046#1 *mod 1
        FROM xmaa_t
       WHERE xmaaent = g_enterprise 
         AND xmaa001 = l_pmab.pmab004
         AND xmaa002 = 'S11'     
      IF l_cnt > 0 THEN 
        #IF NOT s_credit_unrealized_bills_chk(p_site,p_cust) THEN                   #20150615 POLLY MARK
        #IF NOT s_credit_unrealized_bills_chk(l_pmab.pmabsite,p_cust) THEN          #20150615 POLLY ADD #161026-00046#1 mark
         IF NOT s_credit_unrealized_bills_chk(l_pmab.pmabsite,l_pmab.pmab003) THEN  #161026-00046#1 add
            LET r_flag = 2
            RETURN r_success,r_flag
         END IF
      END IF
   
       
      LET l_xmaa004 = ''
      LET l_xmaa005 = ''
      SELECT xmaa004,xmaa005 
        INTO l_xmaa004,l_xmaa005
        FROM xmaa_t
       WHERE xmaaent = g_enterprise
         AND xmaa001 = l_pmab.pmab004
         AND xmaa002 = p_proj
     #計算比率   
      IF cl_null(l_xmaa005) THEN
         LET l_xmaa005 = 0
      END IF
     #額度計算加減項
      IF l_xmaa004 = '1' THEN
         LET l_num = 1
      ELSE
         LET l_num = -1
      END IF
      
     #額度計算幣別
      IF cl_null(l_pmab.pmab005) THEN
         #LET l_pmab.pmab005 = s_credit_get_currency(p_site)          #190802-00035#4 mark
         LET l_pmab.pmab005 = s_credit_get_currency(l_pmab.pmabsite)  #190802-00035#4 add (g_site&ALL)
      END IF
      CALL cl_get_para(g_enterprise,p_site,'S-BAS-0013') RETURNING l_para_data
     #CALL s_aooi160_get_exrate('1',p_site,g_today,p_currency,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange  #160906-00029#1 mark
     #CALL s_credit_get_exrate('1',p_site,g_today,p_currency,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange   #160906-00029#1 add  #190802-00035#4 mark
     #190802-00035#4-S add
     LET lc_param.scc40 = l_para_data
     LET lc_param.curr = lc_param2.curr
     LET lc_param.rate = lc_param2.rate
     LET lc_param.xmab001 = p_proj        #200116-00002#1 add
     LET ls_js2 = util.JSON.stringify(lc_param) 
     CALL s_credit_get_exrate('1',p_site,g_today,p_currency,l_pmab.pmab005,0,ls_js2) RETURNING l_exchange
     #190802-00035#4-E add
     #目前額度金額 = 交易金額(p_amount) * 目前計算項目.百分比(xmaa005/100) * 交易幣別與額度幣別(pmab005)匯率* 加減項
      LET l_xmac003 = p_amount * (l_xmaa005/100) * l_exchange * l_num
         
     #前置項目
      IF cl_null(p_proj_o) THEN
         LET l_xmac003_o = 0
      ELSE    
         SELECT xmaa004,xmaa005 
           INTO l_xmaa004_o,l_xmaa005_o
           FROM xmaa_t
          WHERE xmaaent = g_enterprise
            AND xmaa001 = l_pmab.pmab004
            AND xmaa002 = p_proj_o 
         IF cl_null(l_xmaa004_o) THEN
            LET l_xmac003_o = 0
         ELSE
            IF cl_null(l_xmaa005_o) THEN
               LET l_xmaa005_o = 0
            END IF      
            IF l_xmaa004_o = '1' THEN
               LET l_num = 1
            ELSE
               LET l_num = -1
            END IF
           #前置額度金額 = 交易金額(p_amount) * 前置百分比(xmaa005/100) * 交易幣別與額度幣別匯率 * 加減項
            LET l_xmac003_o = p_amount * (l_xmaa005_o/100) * l_exchange * l_num
         END IF   
      END IF
   
     #集團的信用餘額
     #SELECT xmac004 INTO l_xmac004
     #  FROM xmac_t
     # WHERE xmacent = g_enterprise
     #   AND xmacsite = 'ALL'
     #   AND xmac001 = l_pmab.pmab003
     #IF cl_null(l_xmac004) THEN
     #   LET l_xmac004 = 0
     #END IF
   
     #集團/營運據點的信用餘額ALL,p_site
      #161109-00085#60-s mod
#      SELECT * INTO l_xmac.*   #161109-00085#60 mark
      SELECT xmac011,xmac012,xmac013,xmac014,xmac015,xmac016,xmac017,xmac018,xmac019,xmac041,
             xmac042,xmac043,xmac044
             ,xmac045,xmac046   #171013-00002#1 add
             ,xmac020           #180703-00053#2 add
             ,xmac049           #190902-00032#5 add
        INTO l_xmac.xmac011,l_xmac.xmac012,l_xmac.xmac013,l_xmac.xmac014,l_xmac.xmac015,
             l_xmac.xmac016,l_xmac.xmac017,l_xmac.xmac018,l_xmac.xmac019,l_xmac.xmac041,
             l_xmac.xmac042,l_xmac.xmac043,l_xmac.xmac044
            ,l_xmac.xmac045,l_xmac.xmac046   #171013-00002#1 add
            ,l_xmac.xmac020                  #180703-00053#2 add
            ,l_xmac.xmac049                  #190902-00032#5 add
      #161109-00085#60-e mod
        FROM xmac_t
       WHERE xmacent = g_enterprise
         AND xmac001 = l_pmab.pmab003
        #AND xmacsite = p_site
         AND xmacsite = l_pmab.pmabsite
      LET l_sum = 0
      FOREACH s_credit_xmaa_c1 USING l_pmab.pmab004 INTO l_xmaa002,l_xmaa004,l_xmaa005
        IF NOT cl_null(l_xmaa004) THEN
           IF cl_null(l_xmaa005) THEN
              LET l_xmaa005 = 0
           END IF
           IF l_xmaa004 = '1' THEN
              LET l_num = 1
           ELSE
              LET l_num = -1
           END IF
           ############################################################################################################
           ###  重要 !!!!!!!!!!!                                                                                     ### 
           ###  寫入xmac_t 相關金額欄位，需寫入全額不可乘以比率                                                         ###
           ############################################################################################################
           CASE l_xmaa002
              WHEN 'S1'
                 IF cl_null(l_xmac.xmac011) THEN LET l_xmac.xmac011 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac011*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac011*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac011*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S2'
                 IF cl_null(l_xmac.xmac012) THEN LET l_xmac.xmac012 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac012*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac012*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac012*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S3'
                 IF cl_null(l_xmac.xmac013) THEN LET l_xmac.xmac013 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac013*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac013*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac013*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S4'
                 IF cl_null(l_xmac.xmac014) THEN LET l_xmac.xmac014 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac014*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac014*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac014*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S5'
                 IF cl_null(l_xmac.xmac015) THEN LET l_xmac.xmac015 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac015*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac015*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac015*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S6'
                 IF cl_null(l_xmac.xmac016) THEN LET l_xmac.xmac016 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac016*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac016*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac016*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S7'
                 IF cl_null(l_xmac.xmac017) THEN LET l_xmac.xmac017 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac017*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac017*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac017*l_num)                      #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S8'
                 IF cl_null(l_xmac.xmac018) THEN LET l_xmac.xmac018 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac018*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac018*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac018*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'S9'
                 IF cl_null(l_xmac.xmac019) THEN LET l_xmac.xmac019 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac019*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac019*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac019*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              #180320-00022#1 add--s
              WHEN 'S91'
                 IF cl_null(l_xmac.xmac020) THEN LET l_xmac.xmac020 = 0 END IF
                 LET l_sum = l_sum + (l_xmac.xmac020*l_num*(l_xmaa005/100))
              #180320-00022#1 add--e
              WHEN 'P1'
                 IF cl_null(l_xmac.xmac041) THEN LET l_xmac.xmac041 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac041*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac041*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac041*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'P2'
                 IF cl_null(l_xmac.xmac042) THEN LET l_xmac.xmac042 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac042*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac042*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac042*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'P3'
                 IF cl_null(l_xmac.xmac043) THEN LET l_xmac.xmac043 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac043*l_num)                    #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac043*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac043*l_num)                     #170620-00103#1 add #170628-00039#1 mark
              WHEN 'P4'
                 IF cl_null(l_xmac.xmac044) THEN LET l_xmac.xmac044 = 0 END IF
                 #LET l_sum = l_sum + (l_xmac.xmac044*l_num)                   #170321-00035#1 mark
                 LET l_sum = l_sum + (l_xmac.xmac044*l_num*(l_xmaa005/100))    #170321-00035#1 add   #170620-00103#1 mark   #170628-00039#1 remark
                 #LET l_sum = l_sum + (l_xmac.xmac044*l_num)                    #170620-00103#1 add  #170628-00039#1 mark
              #--171013-00002#1 add start--
              WHEN 'P5'
                 IF cl_null(l_xmac.xmac045) THEN LET l_xmac.xmac045 = 0 END IF
                 LET l_sum = l_sum + (l_xmac.xmac045*l_num*(l_xmaa005/100))    
              WHEN 'P6'
                 IF cl_null(l_xmac.xmac046) THEN LET l_xmac.xmac046 = 0 END IF
                 LET l_sum = l_sum + (l_xmac.xmac046*l_num*(l_xmaa005/100))    
              #--171013-00002#1 add end--
              #190902-00032#5---add---start---
              WHEN 'P8'
                 IF cl_null(l_xmac.xmac049) THEN LET l_xmac.xmac049 = 0 END IF
                 LET l_sum = l_sum + (l_xmac.xmac049*l_num*(l_xmaa005/100))  
              #190902-00032#5---add---end---
           END CASE
        END IF
      END FOREACH
      IF cl_null(l_pmab.pmab006) THEN
         LET l_pmab.pmab006 = 0
      END IF
    #160531-00001#1-s-mark 
    ##160502-00001#1  By Ann_Huang --- add Start ---
    # IF cl_null(l_xmac004) OR l_xmac004 = 0 THEN
    #    LET l_xmac004 = l_pmab.pmab006
    # END IF
    # 
    ##160502-00001#1  By Ann_Huang --- add End ---
    ##--150615--POLLY--MOD-(S)
    # #考慮可超交率
    # IF NOT cl_null(l_pmab.pmab007) AND l_pmab.pmab007 > 0 THEN 
    #    LET l_xmac004 = l_xmac004 * (1+l_pmab.pmab007/100)
    # END IF   
    # #考慮允許除外額度
    # IF NOT cl_null(l_pmab.pmab010) AND l_pmab.pmab010 > 0 THEN
    #    LET l_xmac004 = l_xmac004 + l_pmab.pmab010
    # END IF     
    ##--150615--POLLY--MOD-(E)      
    #
    ##150210 by whitney modify start
    # LET l_xmac004 = l_pmab.pmab006 - l_sum
    ##LET l_xmac004 = l_pmab.pmab006 + l_sum    #160502-00001#1  --- mark
    # LET l_xmac004 = l_xmac004 + l_sum         #160502-00001#1  --- add
    ##150210 by whitney modify end
    #160531-00001#1-e-mark
    
     #160531-00001#1-s-add
      IF cl_null(l_pmab.pmab008) OR (NOT cl_null(l_pmab.pmab008) AND l_pmab.pmab008 > = g_today) THEN   #161026-00046#1 add
         #考慮可超交率
         IF NOT cl_null(l_pmab.pmab007) AND l_pmab.pmab007 > 0 THEN 
            LET l_pmab.pmab006 = l_pmab.pmab006 * (1+l_pmab.pmab007/100)
         END IF   
      END IF                                                            #161026-00046#1 add
      #考慮允許除外額度
      IF cl_null(l_pmab.pmab020) OR (NOT cl_null(l_pmab.pmab020) AND l_pmab.pmab020 > = g_today) THEN   #161026-00046#1 add
         IF NOT cl_null(l_pmab.pmab010) AND l_pmab.pmab010 > 0 THEN
            LET l_pmab.pmab006 = l_pmab.pmab006 + l_pmab.pmab010
         END IF
      END IF                                                            #161026-00046#1 add
      LET l_xmac004 = l_pmab.pmab006 + l_sum      
     #160531-00001#1-e-add

      IF l_xmac004 - l_xmac003_o + l_xmac003 < 0 THEN
         LET r_flag = FALSE
         RETURN r_success,r_flag
      END IF
   END FOREACH   
   RETURN r_success,r_flag
END FUNCTION
################################################################################
# Descriptions...: 取得該組織編號的主幣別編號
# Memo...........:
# Usage..........: s_credit_get_currency(p_site)
#                  RETURNING r_currency
# Input parameter: p_site         交易組織
# Return code....: r_currency     主幣別編號
# Date & Author..: 140822 By bartscott
# Modify.........:
################################################################################
PUBLIC FUNCTION s_credit_get_currency(p_site)
DEFINE p_site       LIKE ooef_t.ooef001
DEFINE r_currency   LIKE ooef_t.ooef016
   
   SELECT ooef016 INTO r_currency
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = p_site
      AND ooefstus = 'Y'    #190802-00035#4 add
      
   RETURN r_currency
END FUNCTION

################################################################################
# Descriptions...: 更新交易對像信用餘額檔
# Memo...........: 
# Usage..........: s_credit_upd_xmac_count(p_site,p_currency,p_amount,p_proj,p_flag,p_type,p_pmabsite,p_pmab003,p_pmab004,p_pmab005,p_pmab006,p_xmab013)
#                  RETURNING r_success
# Input parameter: p_site         交易組織
#                : p_currency     交易幣別
#                : p_amount       總含稅金額
#                : p_proj         計算項目
#                : p_flag         '1':目前計算項目'2':前置計算項目
#                : p_type         異動類型(1:正向, -1:反向)
#                : p_pmabsite     額度據點
#                : p_pmab003      額度交易對象
#                : p_pmab004      信用評核等級
#                : p_pmab005      額度計算幣別
#                : p_pmab006      企業額度
#                : p_xmab013      匯率
# Return code....: r_success      處理狀態
# Date & Author..: 140822 By bartscott
# Modify.........: 150224 By whitney 從s_credit_upd萃取成共用函式
#                : 150813 By Polly 寫入餘額檔不需考慮計算比率
################################################################################
PUBLIC FUNCTION s_credit_upd_xmac_count(p_site,p_currency,p_amount,p_proj,p_flag,p_type,p_pmabsite,p_pmab003,p_pmab004,p_pmab005,p_pmab006,p_xmab013)
DEFINE p_site       LIKE pmab_t.pmabsite
DEFINE p_currency   LIKE xmab_t.xmab007
DEFINE p_amount     LIKE xmab_t.xmab009
DEFINE p_proj       LIKE xmaa_t.xmaa002
DEFINE p_flag       LIKE type_t.chr1
DEFINE p_type       LIKE type_t.num5
DEFINE p_pmabsite   LIKE pmab_t.pmabsite
DEFINE p_pmab003    LIKE pmab_t.pmab003
DEFINE p_pmab004    LIKE pmab_t.pmab004
DEFINE p_pmab005    LIKE pmab_t.pmab005
DEFINE p_pmab006    LIKE pmab_t.pmab006
DEFINE p_xmab013    LIKE xmab_t.xmab013
DEFINE r_success    LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_para_data  LIKE type_t.chr80
DEFINE l_exchange   LIKE xmab_t.xmab013
DEFINE l_xmab009    LIKE xmab_t.xmab009
DEFINE l_xmaa004    LIKE xmaa_t.xmaa004
DEFINE l_xmaa005    LIKE xmaa_t.xmaa005
DEFINE l_num        LIKE type_t.num5

   WHENEVER ERROR CONTINUE 
   
   LET r_success = TRUE
   
   #检查是否在事务中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF

   #依據異動明細的計算項目值，判斷該計算項目在該信用評等中設置的"餘額加減項"與"檢查百分比"值
   LET l_xmaa004 = ''
   LET l_xmaa005 = ''
   SELECT xmaa004,xmaa005 INTO l_xmaa004,l_xmaa005
     FROM xmaa_t
    WHERE xmaaent = g_enterprise
      AND xmaa001 = p_pmab004
      AND xmaa002 = p_proj
      

   IF cl_null(l_xmaa005) THEN
      LET l_xmaa005 = 0
   END IF
   IF l_xmaa004 = '1' THEN
      LET l_num = 1
   ELSE
      LET l_num = -1
   END IF

   #如果沒有xmac塞一筆
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM xmac_t
    WHERE xmacent = g_enterprise
      AND xmacsite = p_pmabsite
      AND xmac001 = p_pmab003
   IF l_cnt = 0 THEN
      INSERT INTO xmac_t(xmacent,xmacsite,xmac001,xmac002,xmac003,xmac004,
                         xmac011, xmac012,xmac013,xmac014,xmac015,xmac016,
                         xmac017, xmac018,xmac019,xmac041,xmac042,xmac043,
                         #xmac044, xmac045,xmac046,xmac047,xmac048,xmac020) #180703-00053#2 add xmac020  #190902-000321#51 mark
                         xmac044,xmac045,xmac046,xmac047,xmac048,            #190902-00032#5 add
                         xmac049,xmac020)                                    #190902-00032#5 add
                  VALUES(g_enterprise,p_pmabsite,p_pmab003,p_pmab005,0,0,
                         0,0,0,0,0,0,
                         0,0,0,0,0,0,
                         #0,0,0,0,0) #180703-00053#2 mark
                         #0,0,0,0,0,0) #180703-00053#2 mod                #190902-000321#51 mark
                         0,0,0,0,0,    #190902-00032#5 add
                         0,0)          #190902-00032#5 add 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'ins xmac_t' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   #IF p_flag = '1' THEN
   #   #目前額度金額 = 交易金額(p_amount) * 目前計算項目.百分比(xmaa005/100) * 交易幣別與額度幣別(pmab005)匯率
   #   CALL cl_get_para(g_enterprise,p_site,'S-BAS-0013') RETURNING l_para_data
   #   CALL s_aooi160_get_exrate('1',p_site,g_today,p_currency,p_pmab005,0,l_para_data) RETURNING l_exchange
   #   #LET l_xmab009 = p_amount*(l_xmaa005/100)*l_exchange  #150813 polly mark
   #   LET l_xmab009 = p_amount * l_exchange                 #150813 polly add
   #ELSE
      #額度金額
      #LET l_xmab009 = p_amount*(l_xmaa005/100)*p_xmab013   #150813 polly mark
      LET l_xmab009 = p_amount * p_xmab013                  #150813 polly add
   #END IF
   IF cl_null(l_xmab009) THEN
      LET l_xmab009 = 0
   END IF
   
   IF (p_type = '1' AND p_flag = '1') OR (p_type <> '1' AND p_flag = '2') THEN
      LET l_xmab009 = l_xmab009 * (-1)
   END IF
   
   IF NOT cl_null(p_pmab005) AND NOT cl_null(l_xmab009) THEN
      CALL s_curr_round(p_site,p_pmab005,l_xmab009,2) RETURNING l_xmab009      #150823 02097 add
   END IF
   
   LET g_sql = " UPDATE xmac_t "
   CASE p_proj 
      WHEN "S1"
         LET g_sql = g_sql," SET xmac011 =  xmac011 - ",l_xmab009
      WHEN "S2"
         LET g_sql = g_sql," SET xmac012 =  xmac012 - ",l_xmab009
      WHEN "S3"
         LET g_sql = g_sql," SET xmac013 =  xmac013 - ",l_xmab009
      WHEN "S4"
         LET g_sql = g_sql," SET xmac014 =  xmac014 - ",l_xmab009
      WHEN "S5"
         LET g_sql = g_sql," SET xmac015 =  xmac015 - ",l_xmab009
      WHEN "S6"
         LET g_sql = g_sql," SET xmac016 =  xmac016 - ",l_xmab009
      WHEN "S7"
         LET g_sql = g_sql," SET xmac017 =  xmac017 - ",l_xmab009
      WHEN "S8"
         LET g_sql = g_sql," SET xmac018 =  xmac018 - ",l_xmab009
      WHEN "S9"
         LET g_sql = g_sql," SET xmac019 =  xmac019 - ",l_xmab009
      WHEN "P1"
         LET g_sql = g_sql," SET xmac041 =  xmac041 - ",l_xmab009
      WHEN "P2"
         LET g_sql = g_sql," SET xmac042 =  xmac042 - ",l_xmab009
      WHEN "P3"
         LET g_sql = g_sql," SET xmac043 =  xmac043 - ",l_xmab009
      WHEN "P4"
         LET g_sql = g_sql," SET xmac044 =  xmac044 - ",l_xmab009
      WHEN "P5"
         LET g_sql = g_sql," SET xmac045 =  xmac045 - ",l_xmab009         
      WHEN "P6"
         LET g_sql = g_sql," SET xmac046 =  xmac046 - ",l_xmab009
      WHEN "P7"
         LET g_sql = g_sql," SET xmac047 =  xmac047 - ",l_xmab009
      #190902-00032#5---add---start---      
      WHEN "P8"            #已付款未沖銷
         LET g_sql = g_sql," SET xmac049 =  xmac049 - ",l_xmab009
      #190902-00032#5---add---end---
      WHEN "P9"
         LET g_sql = g_sql," SET xmac048 =  xmac048 - ",l_xmab009  
      #180320-00022#1 add--s
      WHEN "S91"
         LET g_sql = g_sql," SET xmac020 =  xmac020 - ",l_xmab009
      #180320-00022#1 add--e
   END CASE
   
   LET g_sql = g_sql," WHERE xmacent = ",g_enterprise,
                     "   AND xmac001 = '",p_pmab003,"'",
                     "   AND xmacsite = '",p_pmabsite,"'"
   PREPARE s_credit_xmac_p1 FROM g_sql
   EXECUTE s_credit_xmac_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = 'xmac_t' 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

#   END IF
   
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 檢核是否 Over Due
# Memo...........:
# Usage..........: CALL s_credit_over_due_chk(p_site,p_client)
#                  RETURNING r_success
# Input parameter: p_site      營運據點
#                : p_client    額度客戶
# Return code....: r_success   檢核結果
# Date & Author..: 150313 By whitney
# Modify.........: 150615 By Polly 增加寬限天數考慮
#                  150615 By polly 集團檢核不需加入site條件
#                  #190306-00018#5 增加逾期帳款寬限有效日期 
################################################################################
PUBLIC FUNCTION s_credit_over_due_chk(p_site,p_client)
DEFINE p_site       LIKE ooef_t.ooef001
DEFINE p_client     LIKE xrca_t.xrca004      
DEFINE r_success    LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_sql        STRING                   #20150615 POLLY ADD
DEFINE l_xrcc004    LIKE xrcc_t.xrcc004      #20150615 POLLY ADD
DEFINE l_pmab009    LIKE pmab_t.pmab009      #20150615 POLLY ADD
DEFINE l_pmab019    LIKE pmab_t.pmab019      #161026-00046#1 add
DEFINE l_xrcc108    LIKE xrcc_t.xrcc108      #161026-00046#1 add
DEFINE l_sql2       STRING                   #161026-00046#1 add
DEFINE l_client_wc  STRING                   #161026-00046#1 add
DEFINE l_pmab021    LIKE pmab_t.pmab021      #逾期帳款寬限有效日期 #190306-00018#5 add

   WHENEVER ERROR CONTINUE 

   LET r_success = TRUE
   LET l_cnt = 0   
  
  #161026-00046#1-s-add
  LET l_client_wc = " SELECT DISTINCT pmab001 FROM pmab_t ",
                    "  WHERE pmabent = ",g_enterprise,
                    "    AND pmab003 = '",p_client,"'"
   IF p_site <> 'ALL' THEN
      LET l_client_wc = l_client_wc,"   AND pmabsite = '",p_site,"'"          
   #END IF #190614-00053#1 mark 
  #161026-00046#1-e-add 
  
  #--20150615--POLLY--ADD--(S)
   LET l_pmab009 = 0
   LET l_pmab019 = ''                                 #161026-00046#1 add
   LET l_pmab021 = ''  #190306-00018#5 add
  #SELECT pmab009,pmab019 INTO l_pmab009,l_pmab019    #161026-00046#1 add pmab019 #190306-00018#5 mark
  #190306-00018#5 add --s
   SELECT pmab009,pmab019,pmab021
     INTO l_pmab009,l_pmab019,l_pmab021
  #190306-00018#5 add --e
     FROM pmab_t
    WHERE pmabent = g_enterprise
      AND pmabsite = p_site
      AND pmab001 = p_client
   #190614-00053#1 add start -----
   ELSE
      LET l_pmab009 = 0
      LET l_pmab019 = '' 
      LET l_pmab021 = ''  #190306-00018#5 add
     #SELECT pmaa058,pmaa074 INTO l_pmab009,l_pmab019  #190306-00018#5 mark
     #190306-00018#5 add --s
      SELECT pmaa058,pmaa074,pmaa076
        INTO l_pmab009,l_pmab019,l_pmab021
     #190306-00018#5 add --e
        FROM pmaa_t
       WHERE pmaaent = g_enterprise
         AND pmaa001 = p_client
   END IF
   #190614-00053#1 add end    -----      
   IF cl_null(l_pmab009) THEN LET l_pmab009 = 0 END IF   
   IF cl_null(l_pmab019) THEN LET l_pmab019 = 0 END IF    #161026-00046#1 add
   #190306-00018#5 add --s
   #190306-00018#5 add --e
   
  #LET l_xrcc004 = ''      #190306-00018#5  mark
   LET l_xrcc004 = g_today #190306-00018#5 add
   #考慮逾期帳款寬限有效日期
   IF cl_null(l_pmab021) OR (NOT cl_null(l_pmab021) AND l_pmab021 > = g_today) THEN  #190306-00018#5 add
      LET l_xrcc004 = g_today - l_pmab009 
   END IF #190306-00018#5 add 
  #161026-00046#1-s-mark 
  #LET l_sql = "SELECT COUNT(1) FROM xrca_t,xrcc_t,ooef_t ",   #161026-00046#1 * mod 1
  #            " WHERE xrcaent = '",g_enterprise,"' ",
  #            "   AND xrca004 = '",p_client,"' ",
  #            "   AND xrca001 LIKE '1%'",                 #排除應收待抵的(是加項)   #150825 Sarah add               
  #            "   AND xrcastus = 'Y' ",     
  #            "   AND xrccent = xrcaent ",
  #            "   AND xrccld = xrcald ",
  #            "   AND xrccdocno = xrcadocno ",
  #            "   AND xrcc004 < '",l_xrcc004,"' ",        #容許票據到期日(不管何種款別都有放值)
  #            "   AND (xrcc108 - xrcc109) > 0 ",          #(應收金額-已沖金額)>0表示有應收帳款
  #            "   AND ooefent = xrcaent ",
  #            "   AND ooef017 = xrcacomp "
  #IF p_site <> 'ALL' THEN
  #   LET l_sql = l_sql,"   AND ooef001 = '",p_site,"'"          
  #END IF
  #PREPARE s_over_due_p1 FROM l_sql
  #EXECUTE s_over_due_p1 INTO l_cnt
  ##--20150615--POLLY--ADD--(E) 
  #161026-00046#1-e-mark
  
 #190306-00018#5 mark --s
 ##161026-00046#1-s-add 
 # LET l_sql2 = "  FROM xrca_t,xrcc_t,ooef_t ",   
 #              " WHERE xrcaent = '",g_enterprise,"' ",
 #              "   AND xrca004 IN (",l_client_wc,")",
 #              "   AND xrca001 LIKE '1%'",                 #排除應收待抵的(是加項)                
 #              "   AND xrcastus = 'Y' ",     
 #              "   AND xrccent = xrcaent ",
 #              "   AND xrccld = xrcald ",
 #              "   AND xrccdocno = xrcadocno ",
 #              "   AND xrcc004 < '",l_xrcc004,"' ",        #容許票據到期日(不管何種款別都有放值)
 #              "   AND (xrcc108 - xrcc109) > 0 ",          #(應收金額-已沖金額)>0表示有應收帳款
 #              "   AND ooefent = xrcaent ",
 #              "   AND ooef017 = xrcacomp "
 # IF p_site <> 'ALL' THEN
 #    LET l_sql2 = l_sql2,"   AND ooef001 = '",p_site,"'"          
 # END IF
 #190306-00018#5 mark --e
   #190306-00018#5 add --s
   IF p_site <> 'ALL' THEN
      LET l_sql2 = "  FROM xrca_t,xrcc_t,ooef_t ",   
                   " WHERE xrcaent = ",g_enterprise,
                   "   AND xrca004 IN (",l_client_wc,")",
                   "   AND xrca001 LIKE '1%'",                 #排除應收待抵的(是加項)                
                   "   AND xrcastus = 'Y' ",     
                   "   AND xrccent = xrcaent ",
                   "   AND xrccld = xrcald ",
                   "   AND xrccdocno = xrcadocno ",
                   "   AND xrcc004 < '",l_xrcc004,"' ",        #容許票據到期日(不管何種款別都有放值)
                   "   AND (xrcc108 - xrcc109) > 0 ",          #(應收金額-已沖金額)>0表示有應收帳款
                   "   AND ooefent = xrcaent ",
                   "   AND ooef017 = xrcacomp ",
                   "   AND ooef001 = '",p_site,"'"
   ELSE
      LET l_sql2 = "  FROM xrca_t,xrcc_t ",
                   "       ,(SELECT DISTINCT ooefent,ooef017 FROM ooef_t WHERE ooefent=",g_enterprise," ) t51 ",  #PGS(D)-工號 00902-add
                   " WHERE xrcaent = ",g_enterprise,
                   "   AND xrca004 IN (",l_client_wc,")",
                   "   AND xrca001 LIKE '1%'",                 #排除應收待抵的(是加項)                
                   "   AND xrcastus = 'Y' ",     
                   "   AND xrccent = xrcaent ",
                   "   AND xrccld = xrcald ",
                   "   AND xrccdocno = xrcadocno ",
                   "   AND xrcc004 < '",l_xrcc004,"' ",        #容許票據到期日(不管何種款別都有放值)
                   "   AND (xrcc108 - xrcc109) > 0 ",          #(應收金額-已沖金額)>0表示有應收帳款
                   "   AND ooefent = xrcaent ",
                   "   AND ooef017 = xrcacomp "
   END IF
   #190306-00018#5 add --e
   
   LET l_sql = "SELECT COUNT(1) ",l_sql2 
   PREPARE s_over_due_p1 FROM l_sql
   EXECUTE s_over_due_p1 INTO l_cnt
   
   #考慮逾期帳款寬限有效日期
   IF cl_null(l_pmab021) OR (NOT cl_null(l_pmab021) AND l_pmab021 > = g_today) THEN  #190306-00018#5 add
     #LET l_sql = "SELECT nvl(SUM(xrcc108 - xrcc109) ",l_sql2            #180608-00048#1 mark
      LET l_sql = "SELECT SUM(nvl(xrcc108,0) - nvl(xrcc109,0)) ",l_sql2  #180608-00048#1
      PREPARE s_over_due_p2 FROM l_sql
      
      IF l_cnt > 0 AND l_pmab019 > 0 THEN
         LET l_xrcc108 = 0   
         EXECUTE s_over_due_p2 INTO l_xrcc108   
         IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
         IF l_pmab019 - l_xrcc108 > 0 THEN
            LET l_cnt = 0
         END IF
      END IF      
     #161026-00046#1-e-add  
   END IF #190306-00018#5 add
  
  #--20150615--POLLY--MARK--(S)
  #SELECT COUNT(1) INTO l_cnt
  #  FROM xrca_t,xrcc_t,ooef_t
  # WHERE xrcaent = g_enterprise
  #   AND xrca004 = p_client
  #   AND xrccent = xrcaent
  #   AND xrccld = xrcald
  #   AND xrccdocno = xrcadocno
  #   AND xrcc004 < l_xrcc004      #容許票據到期日(不管何種款別都有放值)
  #   AND (xrcc108 - xrcc109) > 0  #(應收金額-已沖金額)>0表示有應收帳款
  #   AND ooefent = xrcaent
  #   AND ooef001 = p_site
  #   AND ooef017 = xrcacomp
  #--20150615--POLLY--MARK--(E) 

   IF l_cnt > 0 THEN
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢核是否有逾期未兌現票據
# Memo...........:
# Usage..........: CALL s_credit_unrealized_bills_chk(p_site,p_client)
#                  RETURNING r_success
# Input parameter: p_site      營運據點
#                : p_client    額度客戶
# Return code....: r_success   檢核結果
# Date & Author..: 150313 By whitney
# Modify.........: 150615 By Polly 增加寬限天數考慮
#                : 150615 By polly 集團檢核不需加入site條件
#                  #190306-00018#5 增加逾期帳款寬限有效日期 
################################################################################
PUBLIC FUNCTION s_credit_unrealized_bills_chk(p_site,p_client)
DEFINE p_site       LIKE ooef_t.ooef001
DEFINE p_client     LIKE xrca_t.xrca004     
DEFINE r_success    LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_sql        STRING                   #20150615 POLLY ADD
DEFINE l_sql2       STRING                   #161026-00046#1 add
DEFINE l_xrcc004    LIKE xrcc_t.xrcc004      #20150615 POLLY ADD
DEFINE l_pmab009    LIKE pmab_t.pmab009      #20150615 POLLY ADD
DEFINE l_pmab019    LIKE pmab_t.pmab019      #161012-00025#1 add
DEFINE l_xrcc118    LIKE xrcc_t.xrcc118      #161026-00046#1 add
DEFINE l_client_wc  STRING                  #161026-00046#1 add
DEFINE l_pmab021    LIKE pmab_t.pmab021      #逾期帳款寬限有效日期 #190306-00018#5 add

   WHENEVER ERROR CONTINUE 

   LET r_success = TRUE

   LET l_cnt = 0
   
  #161026-00046#1-s-add
  LET l_client_wc = " SELECT DISTINCT pmab001 FROM pmab_t ",
                    "  WHERE pmabent = ",g_enterprise,
                    "    AND pmab003 = '",p_client,"'"
   IF p_site <> 'ALL' THEN
      LET l_client_wc = l_client_wc,"   AND pmabsite = '",p_site,"'"          
   END IF                    
  #161026-00046#1-e-add
  
  #--20150615--POLLY--ADD--(S)
   LET l_pmab009 = 0
   LET l_pmab019 = 0                                   #161012-00025#1 add
   LET l_pmab021 = ''  #190306-00018#5 add
  #SELECT pmab009,pmab019 INTO l_pmab009,l_pmab019     #161012-00025#1 add pmab019 #190306-00018#5 mark
  #190306-00018#5 add --s
   SELECT pmab009,pmab019,pmab021
     INTO l_pmab009,l_pmab019,l_pmab021
  #190306-00018#5 add --e
     FROM pmab_t
    WHERE pmabent = g_enterprise
      AND pmabsite = p_site
      AND pmab001 = p_client
   LET l_xrcc004 = NULL
#190306-00018#5 mark --s
#  IF NOT cl_null(l_pmab009) AND l_pmab009 > 0THEN
##    LET l_xrcc004 = g_today + l_pmab009 
#     LET l_xrcc004 = g_today - l_pmab009  #150921 by whitney mod
#  ELSE                                    #161026-00046#1 add
#     LET l_xrcc004 = g_today              #161026-00046#1 add
#  END IF  
#190306-00018#5 mark --e   
   
   #190306-00018#5 add --s
   IF cl_null(l_pmab009) THEN LET l_pmab009 = 0 END IF
   LET l_xrcc004 = g_today
   #考慮逾期帳款寬限有效日期
      IF cl_null(l_pmab021) OR (NOT cl_null(l_pmab021) AND l_pmab021 > = g_today) THEN  
         LET l_xrcc004 = g_today - l_pmab009
      END IF 
   #190306-00018#5 add --e
   
   #161012-00025#1 add --(S)--
   IF cl_null(l_pmab019) THEN
      LET l_pmab019 = 0
   END IF
   #161012-00025#1 add --(E)--
  #161026-00046#1-s-mark 
  #LET l_sql = " SELECT COUNT(1) FROM xrca_t,xrcc_t,xrce_t,nmbb_t,xrde_t,ooef_t ",  
  #            "  WHERE xrcaent = '",g_enterprise,"' ",
  #            "    AND xrca004 = '",p_client,"' ",
  #            "    AND xrccent = xrcaent ",
  #            "    AND xrccld = xrcald ",
  #            "    AND xrccdocno = xrcadocno ",
  #           #"    AND xrcc004 < '",l_xrcc004,"' ",                    #容許票據到期日(不管何種款別都有放值) 
  #            "    AND ((xrcc004 < '",l_xrcc004,"') OR ",              #161012-00025#1 add 
  #            "         (xrcc118-xrcc119+xrcc113 > ",l_pmab019,")) ",  #161012-00025#1 add 
  #            "    AND xrceent = xrccent ",
  #            "    AND xrceld = xrccld ",
  #            "    AND xrce003 = xrccdocno ",     #立帳單號
  #            "    AND xrce004 = xrccseq ",       #帳款項次
  #            "    AND xrce005 = xrcc001 ",       #期別
  #            "    AND xrdeent = xrceent ",
  #            "    AND xrdeld = xrceld ",
  #            "    AND xrdedocno = xrcedocno ",   #收款明細檔
  #            "    AND xrde002 = '10' ",          #10=收款
  #            "    AND xrde006 = '30' ",          #30=票據
  #            "    AND nmbbent = xrdeent ",
  #            "    AND nmbbcomp = ooef017 ",
  #            "    AND nmbbdocno = xrde003 ",      #收款單號
  #            "    AND nmbbseq = xrde004 ",        #收款項次
  #            "    AND nmbb042 <> '8' ",           #應收票據兌現
  #            "    AND ooefent = nmbbent "
  #IF p_site <> 'ALL' THEN
  #   LET l_sql = l_sql,"   AND ooef001 = '",p_site,"'"          
  #END IF
  #PREPARE s_unrealized_bills_p1 FROM l_sql
  #EXECUTE s_unrealized_bills_p1 INTO l_cnt
  #--20150615--POLLY--ADD--(E)     
  #161026-00046#1-e-mark  


 #190306-00018#5 mark --s
 ##161026-00046#1-s-add 
 # LET l_sql2 ="   FROM xrca_t,xrcc_t,xrce_t,nmbb_t,xrde_t,ooef_t ",
 #             "  WHERE xrcaent = '",g_enterprise,"' ",
 #             "    AND xrca004 IN (",l_client_wc,")",
 #             "    AND xrccent = xrcaent ",
 #             "    AND xrccld = xrcald ",
 #             "    AND xrccdocno = xrcadocno ",
 #             "    AND xrcc004 < '",l_xrcc004,"' ",                    #容許票據到期日(不管何種款別都有放值)  
 #             "    AND xrceent = xrccent ",
 #             "    AND xrceld = xrccld ",
 #             "    AND xrce003 = xrccdocno ",     #立帳單號
 #             "    AND xrce004 = xrccseq ",       #帳款項次
 #             "    AND xrce005 = xrcc001 ",       #期別
 #             "    AND xrdeent = xrceent ",
 #             "    AND xrdeld = xrceld ",
 #             "    AND xrdedocno = xrcedocno ",   #收款明細檔
 #             "    AND xrde002 = '10' ",          #10=收款
 #             "    AND xrde006 = '30' ",          #30=票據
 #             "    AND nmbbent = xrdeent ",
 #             "    AND nmbbcomp = ooef017 ",
 #             "    AND nmbbdocno = xrde003 ",      #收款單號
 #             "    AND nmbbseq = xrde004 ",        #收款項次
 #             "    AND nmbb042 <> '8' ",           #應收票據兌現
 #             "    AND ooefent = nmbbent "
 #             
 # IF p_site <> 'ALL' THEN
 #    LET l_sql2 = l_sql2,"   AND ooef001 = '",p_site,"'"          
 # END IF  
 #190306-00018#5 mark --e
   #190306-00018#5 add --s
   IF p_site <> 'ALL' THEN
      LET l_sql2 ="   FROM xrca_t,xrcc_t,xrce_t,nmbb_t,xrde_t,ooef_t ",
                  "  WHERE xrcaent = ",g_enterprise,
                  "    AND xrca004 IN (",l_client_wc,")",
                  "    AND xrccent = xrcaent ",
                  "    AND xrccld = xrcald ",
                  "    AND xrccdocno = xrcadocno ",
                  "    AND xrcc004 < '",l_xrcc004,"' ",                    #容許票據到期日(不管何種款別都有放值)  
                  "    AND xrceent = xrccent ",
                  "    AND xrceld = xrccld ",
                  "    AND xrce003 = xrccdocno ",     #立帳單號
                  "    AND xrce004 = xrccseq ",       #帳款項次
                  "    AND xrce005 = xrcc001 ",       #期別
                  "    AND xrdeent = xrceent ",
                  "    AND xrdeld = xrceld ",
                  "    AND xrdedocno = xrcedocno ",   #收款明細檔
                  "    AND xrde002 = '10' ",          #10=收款
                  "    AND xrde006 = '30' ",          #30=票據
                  "    AND nmbbent = xrdeent ",
                  "    AND nmbbcomp = ooef017 ",
                  "    AND nmbbdocno = xrde003 ",      #收款單號
                  "    AND nmbbseq = xrde004 ",        #收款項次
                  "    AND nmbb042 <> '8' ",           #應收票據兌現
                  "    AND ooefent = nmbbent ",
                  "   AND ooef001 = '",p_site,"'"
   ELSE   
      LET l_sql2 ="   FROM xrca_t,xrcc_t,xrce_t,nmbb_t,xrde_t ",
                  "       ,(SELECT DISTINCT ooefent,ooef017 FROM ooef_t WHERE ooefent=",g_enterprise," ) t52 ",  #PGS(D)-工號 00902 -add-
                  "  WHERE xrcaent = ",g_enterprise,
                  "    AND xrca004 IN (",l_client_wc,")",
                  "    AND xrccent = xrcaent ",
                  "    AND xrccld = xrcald ",
                  "    AND xrccdocno = xrcadocno ",
                  "    AND xrcc004 < '",l_xrcc004,"' ",                    #容許票據到期日(不管何種款別都有放值)  
                  "    AND xrceent = xrccent ",
                  "    AND xrceld = xrccld ",
                  "    AND xrce003 = xrccdocno ",     #立帳單號
                  "    AND xrce004 = xrccseq ",       #帳款項次
                  "    AND xrce005 = xrcc001 ",       #期別
                  "    AND xrdeent = xrceent ",
                  "    AND xrdeld = xrceld ",
                  "    AND xrdedocno = xrcedocno ",   #收款明細檔
                  "    AND xrde002 = '10' ",          #10=收款
                  "    AND xrde006 = '30' ",          #30=票據
                  "    AND nmbbent = xrdeent ",
                  "    AND nmbbcomp = ooef017 ",
                  "    AND nmbbdocno = xrde003 ",      #收款單號
                  "    AND nmbbseq = xrde004 ",        #收款項次
                  "    AND nmbb042 <> '8' ",           #應收票據兌現
                  "    AND ooefent = nmbbent "
   END IF
   #190306-00018#5 add --e   
   
   LET l_sql = " SELECT COUNT(1)  ",l_sql2  
   PREPARE s_unrealized_bills_p1 FROM l_sql
   EXECUTE s_unrealized_bills_p1 INTO l_cnt
   
   #考慮逾期帳款寬限有效日期
   IF cl_null(l_pmab021) OR (NOT cl_null(l_pmab021) AND l_pmab021 > = g_today) THEN   #190306-00018#5 add
     #LET l_sql = "SELECT nvl(SUM(xrcc118-xrcc119+xrcc113),0) ",l_sql2                #180608-00048#1 mark
      LET l_sql = "SELECT SUM(nvl(xrcc118,0)-nvl(xrcc119,0)+nvl(xrcc113,0)) ",l_sql2  #180608-00048#1
      PREPARE s_unrealized_bills_p2 FROM l_sql
     #161026-00046#1-e-add      
     
     
     #--20150615--POLLY--MARK--(S)  
     #SELECT COUNT(1) INTO l_cnt
     #  FROM xrca_t,xrcc_t,xrce_t,nmbb_t,xrde_t,ooef_t
     # WHERE xrcaent = g_enterprise
     #   AND xrca004 = p_client
     #   AND xrccent = xrcaent
     #   AND xrccld = xrcald
     #   AND xrccdocno = xrcadocno
     #   AND xrcc004 < g_today        #容許票據到期日(不管何種款別都有放值)
     #   AND xrceent = xrccent
     #   AND xrceld = xrccld
     #   AND xrce003 = xrccdocno      #立帳單號
     #   AND xrce004 = xrccseq        #帳款項次
     #   AND xrce005 = xrcc001        #期別
     #   AND xrdeent = xrceent
     #   AND xrdeld = xrceld
     #   AND xrdedocno = xrcedocno    #收款明細檔
     #   AND xrde002 = '10'           #10=收款
     #   AND xrde006 = '30'           #30=票據
     #   AND nmbbent = xrdeent
     #   AND nmbbcomp = ooef017
     #   AND nmbbdocno = xrde003      #收款單號
     #   AND nmbbseq = xrde004        #收款項次
     #   AND nmbb042 <> '8'           #應收票據兌現
     #   AND ooefent = nmbbent
     #   AND ooef001 = p_site
     #--20150615--POLLY--MARK--(E)      
      
     #161026-00046#1-s-add
     IF l_cnt > 0 AND l_pmab019 > 0 THEN
        #表示有未兌現票據
        LET l_xrcc118 = 0
        EXECUTE s_unrealized_bills_p2 INTO l_xrcc118
        IF cl_null(l_xrcc118) THEN LET l_xrcc118 = 0 END IF
        IF l_pmab019 - l_xrcc118 > 0 THEN
           LET l_cnt = 0
        END IF        
     END IF
     #161026-00046#1-e-add 
  END IF  #190306-00018#5 add
  
  IF l_cnt > 0 THEN
     LET r_success = FALSE
  END IF
  
  RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 信用額度異動
# Memo...........: 更新交易對象信用餘額檔和異動明細檔
# Usage..........: CALL s_credit_move(ls_js)
#                  RETURNING  r_success
# Input parameter: ls_js
#                    xmab003      單據編號
#                :   xmab006      交易客戶
#                :   xmab007      交易幣別
#                :   proj         目前計算項目
#                :   proj_o       前置計算項目
#                :   type         異動類型(1:正向, -1:反向)
#                :   glaald       帳別編號
#                :   glaacomp     歸屬法人
# Return code....: r_success  處理狀態
# Date & Author..: 150623 By Polly
# Modify.........: 150701 by whitney 傳入參數改為字串
#                : 150812 by Polly 拿掉pmab002控卡，不管是否查核都需寫入異動檔(xmab_t)，3查核要再多寫入餘額檔(xmac_t)
#                  160510 by lori  正式寄銷銷退單單身只記錄沖銷的訂單來源
################################################################################
PUBLIC FUNCTION s_credit_move(ls_js)
#150701 by whitney modify start
DEFINE ls_js        STRING
DEFINE lc_param  RECORD
    xmab003    LIKE xmab_t.xmab003,
    xmab006    LIKE xmab_t.xmab006,
    xmab007    LIKE xmab_t.xmab007,
    proj       LIKE xmaa_t.xmaa002,
    proj_o     LIKE xmaa_t.xmaa002,
    type       LIKE type_t.num5,
    glaald     LIKE glaa_t.glaald,
    glaacomp   LIKE glaa_t.glaacomp,
    xmab004    LIKE xmab_t.xmab004,
    xmab009    LIKE xmab_t.xmab009
             END RECORD
#150701 by whitney modify end
DEFINE r_success    LIKE type_t.num5
DEFINE l_pmab       RECORD  
    pmabsite   LIKE pmab_t.pmabsite,
    pmab002    LIKE pmab_t.pmab002,
    pmab003    LIKE pmab_t.pmab003,
    pmab004    LIKE pmab_t.pmab004,
    pmab005    LIKE pmab_t.pmab005,
    pmab006    LIKE pmab_t.pmab006
                END RECORD
DEFINE l_array RECORD 
       xmab018    LIKE xmab_t.xmab018,          #額度據點
       xmab003    LIKE xmab_t.xmab003,          #單據編號
       xmab004    LIKE xmab_t.xmab004,          #單據項次
       xmab005    LIKE xmab_t.xmab005,          #交易營運據點
       xmab009    LIKE xmab_t.xmab009,          #交易含稅金額
       xmab014    LIKE xmab_t.xmab014,          #交易計價單位
       xmab015    LIKE xmab_t.xmab015,          #計價數量       
       xmab003_o  LIKE xmab_t.xmab003,          #前置單號
       xmab004_o  LIKE xmab_t.xmab004,          #前置項次
       curr_o     LIKE xrcd_t.xrcd100,          #幣別
       rate_o     LIKE xrcd_t.xrcd101,          #匯率 
       price_o    LIKE xmdc_t.xmdc015,          #單價
       oodb002_o  LIKE oodb_t.oodb002           #稅別        
               END RECORD 
DEFINE l_xmdk000    LIKE xmdk_t.xmdk000         #單據性質  
DEFINE l_xmdk002    LIKE xmdk_t.xmdk002         #出貨性質     #160505-00018#7 160510 by lori add
DEFINE l_xmab005    LIKE xmab_t.xmab005         #交易營運據點 #170804-00048#1-add
DEFINE l_xmdk082    LIKE xmdk_t.xmdk082         #銷退方式/倉退方式
DEFINE l_xmab008    LIKE xmab_t.xmab008         #額度客戶
DEFINE l_xmab012    LIKE xmab_t.xmab012         #額度幣別
DEFINE l_xmab013    LIKE xmab_t.xmab013         #匯率      
DEFINE l_xmab018    LIKE xmab_t.xmab018         #額度營運據點 
DEFINE l_xmab019    LIKE xmab_t.xmab019         #集團額度幣別 
DEFINE l_xmab020    LIKE xmab_t.xmab020         #集團匯率 
DEFINE l_xmdl001    LIKE xmdl_t.xmdl001         #出貨單單號
DEFINE l_xmdl003    LIKE xmdl_t.xmdl003         #訂單單號
#161109-00085#60-s mod
#DEFINE l_xmab       RECORD LIKE xmab_t.*   #161109-00085#60 mark
DEFINE l_xmab       RECORD  #信用評核異動明細檔
       xmabent LIKE xmab_t.xmabent, #企業編號
       xmab001 LIKE xmab_t.xmab001, #計算項目
       xmab002 LIKE xmab_t.xmab002, #異動類型
       xmab003 LIKE xmab_t.xmab003, #單據編號
       xmab004 LIKE xmab_t.xmab004, #單據項次
       xmab005 LIKE xmab_t.xmab005, #交易營運據點
       xmab006 LIKE xmab_t.xmab006, #交易客戶
       xmab007 LIKE xmab_t.xmab007, #交易幣別
       xmab008 LIKE xmab_t.xmab008, #額度客戶
       xmab009 LIKE xmab_t.xmab009, #交易含稅金額
       xmab010 LIKE xmab_t.xmab010, #已沖銷金額
       xmab011 LIKE xmab_t.xmab011, #異動日期
       xmab012 LIKE xmab_t.xmab012, #據點額度幣別
       xmab013 LIKE xmab_t.xmab013, #據點匯率
       xmab014 LIKE xmab_t.xmab014, #交易計價單位
       xmab015 LIKE xmab_t.xmab015, #計價數量
       xmab016 LIKE xmab_t.xmab016, #已沖銷數量
       xmab017 LIKE xmab_t.xmab017, #結案否
       xmab018 LIKE xmab_t.xmab018, #額度營運據點
       xmab019 LIKE xmab_t.xmab019, #集團額度幣別
       xmab020 LIKE xmab_t.xmab020,  #集團匯率
       xmab021 LIKE xmab_t.xmab021,  #190802-00035#4 add
       xmab022 LIKE xmab_t.xmab022,  #190802-00035#4 add
       xmab023 LIKE xmab_t.xmab023   #190802-00035#4 add
               END RECORD   
#161109-00085#60-e mod
DEFINE l_para_data  LIKE type_t.chr80
DEFINE l_exchange   LIKE xmab_t.xmab013
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_slip       LIKE ooba_t.ooba001
DEFINE l_type       LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
#150518-00040-3
DEFINE l_array1 RECORD 
       xmab018    LIKE xmab_t.xmab018,          #額度據點
       xmab003    LIKE xmab_t.xmab003,          #單據編號
       xmab004    LIKE xmab_t.xmab004,          #單據項次
       xmab005    LIKE xmab_t.xmab005,          #交易營運據點
       xmab009    LIKE xmab_t.xmab009,          #交易含稅金額
       xmab014    LIKE xmab_t.xmab014,          #交易計價單位
       xmab015    LIKE xmab_t.xmab015,          #計價數量       
       xmab003_o  LIKE xmab_t.xmab003,          #前置單號
       xmab004_o  LIKE xmab_t.xmab004,          #前置項次
       curr_o     LIKE xrcd_t.xrcd100,          #幣別
       rate_o     LIKE xrcd_t.xrcd101,          #匯率 
       price_o    LIKE xmdc_t.xmdc015,          #單價
       oodb002_o  LIKE oodb_t.oodb002,          #稅別        
       xmab006    LIKE xmab_t.xmab006,          #交易對象
       proj_o     LIKE type_t.chr2              #前置項目
               END RECORD
DEFINE l_amount   LIKE xrcd_t.xrcd102
DEFINE l_amount_1 LIKE xrcd_t.xrcd102  #記錄要沖銷前一張單據的金額  #170804-00048#1-add
DEFINE l_sql      STRING
DEFINE l_proj_o   LIKE xmaa_t.xmaa002
DEFINE l_nmcr001  LIKE nmcr_t.nmcr001
DEFINE l_nmcr003  LIKE nmcr_t.nmcr003
DEFINE l_nmbbseq  LIKE nmbb_t.nmbbseq
DEFINE l_xmab009  LIKE xmab_t.xmab009
DEFINE l_xmab0091 LIKE xmab_t.xmab009           #差額
DEFINE l_xrde1091 LIKE xmde_t.xmde009
DEFINE l_xrde1092 LIKE xmde_t.xmde009
DEFINE l_pmab005  LIKE pmab_t.pmab005
DEFINE l_curr     LIKE xrcd_t.xrcd100  
DEFINE l_xrcb001  LIKE xrcb_t.xrcb001
#150518-00040-3
DEFINE l_sit_cnt  LIKE type_t.num5     #160622-00003#1 add
#160721-00021#1---s
DEFINE l_xmab018_t LIKE xmab_t.xmab018
DEFINE l_pmab_arr DYNAMIC ARRAY OF RECORD  
    pmabsite       LIKE pmab_t.pmabsite,
    pmab002        LIKE pmab_t.pmab002,
    pmab003        LIKE pmab_t.pmab003,
    pmab004        LIKE pmab_t.pmab004,
    pmab005        LIKE pmab_t.pmab005,
    pmab006        LIKE pmab_t.pmab006
                END RECORD
DEFINE i           LIKE type_t.num10
DEFINE l_i         LIKE type_t.num10
#160721-00021#1---e
#160905-00020#1-s-add
DEFINE l_s_0060    LIKE ooab_t.ooab002 
DEFINE l_xmda015   LIKE xmda_t.xmda015
DEFINE l_xmda016   LIKE xmda_t.xmda016
DEFINE l_xmdcsite  LIKE xmdc_t.xmdcsite
DEFINE l_xmdcdocno LIKE xmdc_t.xmdcdocno
DEFINE l_xmdcseq   LIKE xmdc_t.xmdcseq
DEFINE l_xmdc007   LIKE xmdc_t.xmdc007
DEFINE l_xmdc015   LIKE xmdc_t.xmdc015
DEFINE l_xmdc016   LIKE xmdc_t.xmdc016
DEFINE l_xmdc047   LIKE xmdc_t.xmdc047
DEFINE l_xmdcorga  LIKE xmdc_t.xmdcorga
DEFINE l_xmab015_o LIKE xmab_t.xmab015     #存放數量舊值
DEFINE l_xmab009_o LIKE xmab_t.xmab009     #存放金額舊值 #190722-00056#9 add
#160905-00020#1-e-add
DEFINE l_qty_o     LIKE xmab_t.xmab015     #170617-00552#1 add
DEFINE l_ooef016   LIKE ooef_t.ooef016     #170810-00042#1 Add By 06137  181102
DEFINE l_xmdgstus  LIKE xmdg_t.xmdgstus    #190722-00056#9 add

#190802-00035#4-S add
DEFINE l_xmak RECORD  #信用評核沖銷明細檔
          xmakent LIKE xmak_t.xmakent, #企業代碼
          xmak001 LIKE xmak_t.xmak001, #計算項目
          xmak002 LIKE xmak_t.xmak002, #單據編號
          xmak003 LIKE xmak_t.xmak003, #單據項次
          xmak004 LIKE xmak_t.xmak004, #沖銷計算項目
          xmak005 LIKE xmak_t.xmak005, #沖銷單據編號
          xmak006 LIKE xmak_t.xmak006, #沖銷單據項次
          xmak007 LIKE xmak_t.xmak007, #沖銷金額
          xmak008 LIKE xmak_t.xmak008, #沖銷數量
          xmak009 LIKE xmak_t.xmak009, #沖銷結案否
          xmak010 LIKE xmak_t.xmak010  #沖銷建立日期
END RECORD

DEFINE l_xmdd018  LIKE xmdd_t.xmdd018
DEFINE l_xmdd019  LIKE xmdd_t.xmdd019
DEFINE l_xmdg014  LIKE xmdg_t.xmdg014
DEFINE l_xmdg015  LIKE xmdg_t.xmdg015
DEFINE l_xmdh023  LIKE xmdh_t.xmdh023
DEFINE l_xmdh024  LIKE xmdh_t.xmdh024
DEFINE l_xmdl002  LIKE xmdl_t.xmdl002
DEFINE l_xmdl004  LIKE xmdl_t.xmdl004
#190802-00035#4-E add

#190802-00035#4-S add
DEFINE l_xmdc019    LIKE xmdc_t.xmdc019
DEFINE l_pmdn019    LIKE pmdn_t.pmdn019
DEFINE l_xmdgdocno  LIKE xmdg_t.xmdgdocno
DEFINE l_xmda006    LIKE xmda_t.xmda006
DEFINE l_ooab002    LIKE ooab_t.ooab002
DEFINE g_xmab003_t  LIKE xmab_t.xmab003
DEFINE g_xmab004_t  LIKE xmab_t.xmab004
DEFINE g_xmab005_t  LIKE xmab_t.xmab005
DEFINE lc_comb  RECORD
             scc40       LIKE type_t.chr2,       #汇率类型
             curr        LIKE ooan_t.ooan002,    #單據幣別
             rate        LIKE xmab_t.xmab013     #單據匯率
            ,xmab001     LIKE xmab_t.xmab001     #計算項目        #200116-00002#1 add
                  END RECORD 
#190802-00035#4-E add

#191104-00018#3-S add
DEFINE l_pmds000     LIKE pmds_t.pmds000  
DEFINE l_pmdt027     LIKE pmdt_t.pmdt027
DEFINE l_pmdt028     LIKE pmdt_t.pmdt028
DEFINE l_pmdt001     LIKE pmdt_t.pmdt001
DEFINE l_pmdt002     LIKE pmdt_t.pmdt002
DEFINE l_pmdt036     LIKE pmdt_t.pmdt036
DEFINE l_pmdt046     LIKE pmdt_t.pmdt046
DEFINE l_pmds037     LIKE pmds_t.pmds037
DEFINE l_pmds038     LIKE pmds_t.pmds038
DEFINE l_pmdl015     LIKE pmdl_t.pmdl015
DEFINE l_pmdl016     LIKE pmdl_t.pmdl016
DEFINE l_pmdn015     LIKE pmdn_t.pmdn015
DEFINE l_pmdn016     LIKE pmdn_t.pmdn016
DEFINE l_pmdnsite    LIKE pmdn_t.pmdnsite
DEFINE l_pmdndocno   LIKE pmdn_t.pmdndocno
DEFINE l_pmdnseq     LIKE pmdn_t.pmdnseq
DEFINE l_pmdnorga    LIKE pmdn_t.pmdnorga
DEFINE l_pmdn007     LIKE pmdn_t.pmdn007
DEFINE l_pmdn047     LIKE pmdn_t.pmdn047
DEFINE l_xmdh006     LIKE xmdh_t.xmdh006
DEFINE l_xmdh015     LIKE xmdh_t.xmdh015
DEFINE l_xmdh020     LIKE xmdh_t.xmdh020
#191104-00018#3-E add

#200410-00040-S add

DEFINE l_xmdhdocno   LIKE xmdh_t.xmdhdocno
DEFINE l_xmdhseq     LIKE xmdh_t.xmdhseq
DEFINE l_xmdhsite    LIKE xmdh_t.xmdhsite
DEFINE l_xmdh027     LIKE xmdh_t.xmdh027
DEFINE l_xmdh016     LIKE xmdh_t.xmdh016
DEFINE l_xmdh017     LIKE xmdh_t.xmdh017
DEFINE l_xmdh021     LIKE xmdh_t.xmdh021
DEFINE l_xmdh001     LIKE xmdh_t.xmdh001
DEFINE l_xmdh002     LIKE xmdh_t.xmdh002
DEFINE l_xmdc011     LIKE xmdc_t.xmdc011
DEFINE l_pmab002     LIKE pmab_t.pmab002
DEFINE l_pmab003     LIKE pmab_t.pmab003
DEFINE l_pmab004     LIKE pmab_t.pmab004
DEFINE l_pmab006     LIKE pmab_t.pmab006
DEFINE l_pmaa051     LIKE pmaa_t.pmaa051
DEFINE l_pmaa052     LIKE pmaa_t.pmaa052
DEFINE l_pmaa053     LIKE pmaa_t.pmaa053
DEFINE l_pmaa054     LIKE pmaa_t.pmaa054
DEFINE l_pmaa055     LIKE pmaa_t.pmaa055
DEFINE l_xmdc010     LIKE xmdc_t.xmdc010
DEFINE l_diff_num    LIKE xmdc_t.xmdc016
DEFINE l_xmdh027_2   LIKE xmdh_t.xmdh027
DEFINE l_sql2        STRING
#200410-00040-E add

   WHENEVER ERROR CONTINUE
   CALL util.JSON.parse(ls_js,lc_param)  #150701 by whitney add
   
   LET r_success = TRUE
   
   #180124-00045#1---add---str
   LET g_xmab004 = lc_param.xmab004
   LET g_xmab006 = lc_param.xmab006
   #180124-00045#1---add---end
   LET g_sql = ''#190107-00045#1 add
   
   #檢查是否在事務中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF cl_null(lc_param.xmab003) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #多角排除
   IF NOT s_credit_aic_chk(lc_param.proj,lc_param.xmab003) THEN
      RETURN r_success
   END IF


   #190802-00035#4-S add 
#        xmabent(企業編號)=xmdlent
#        xmab001(計算項目)=if xmdk000='5' then "axmt590" else if xmdk000='8' then "axmt591" else "S3"
#        xmab003(單據編號)=xmdldocno
#        xmab004(單據項次)=xmdlseq
#        xmab005(交易營運據點)=xmdlsite
#        xmab006(交易客戶)=xmdk007
#        xmab007(交易幣別)=xmdk016
#        xmab008(據點額度客戶)=pmab003 空的話給xmab006
#        xmab009(交易含稅金額)=xmdl028
#        xmab010(已沖銷金額)=0
#        xmab011(額度建立日期)=if xmdk000='1,2' then xmdkpstdt else xmdkcnfdt
#        xmab012(據點額度幣別)=xmdgsite的ooef016
#        xmab013(據點匯率)=if xmab007=xmab012 then 1 else 使用s_credit_get_exrate傳入xmab011抓取
#        xmab014(交易計價單位)=xmdl021
#        xmab015(計價數量)=if xmdk000='5' then xmdl083 else if xmdk000='8' then xmdl092 else xmdl022
#        xmab016(已沖銷數量)=0
#        xmab017(結案否)="N"
#        xmab018(額度營運據點)=if xmdk000='2' then xmdlsite else xmdcorga
#        xmab019(集團額度幣別)="ALL"的ooef016
#        xmab020(集團匯率)=if xmab007=xmab019 then 1 else 使用s_credit_get_exrate傳入xmab011抓取
#        xmab021(集團額度客戶)=pmaa052 空的話給xmab006
#        xmab022(數量完全沖銷)="N"   
#   IF lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND g_prog MATCHES 'axmt590*' THEN  #axmt590
#      IF lc_param.type = '1' THEN
#         #來源為訂單，產生一筆xmab_t 資料，一筆xmak_t（沖銷自身）資料
#         LET l_sql = " SELECT DISTINCT xmdlent,CASE WHEN xmdk000='5' THEN 'axmt590' ELSE CASE WHEN xmdk000='8' THEN 'axmt591' ELSE 'S3' END END,",
#                     "        xmdldocno,xmdlseq,xmdlsite,xmdk007,xmdk016,",
#                     "        (SELECT pmab003 FROM pmab_t WHERE pmabent = xmdkent AND pmab001 = xmdk007 AND pmabsite = xmdksite) pmab003,",
#                     "        xmdl028,0,",
#                     "        CASE WHEN xmdk000 IN ('1','2') THEN xmdkpstdt ELSE xmdkcnfdt END ,",
#                     "        (SELECT ooef016 FROM ooef_t WHERE ooef001 = xmdksite AND ooefent = xmdkent) ooef016,",
#                     "        0,xmdl021,",
#                     "        CASE WHEN xmdk000 = '5' THEN xmdl083 ELSE CASE WHEN xmdk000='8' THEN xmdl092 ELSE xmdl022 END END,",
#                     "        0,'N',",
#                     "        CASE WHEN xmdk000 = '2' THEN xmdlsite ELSE xmdcorga END,",
#                     "        (SELECT ooef016 FROM ooef_t WHERE ooefent = xmdkent AND ooef001 = 'ALL') ooef016_2,0,",
#                     "        (SELECT pmaa052 FROM pmaa_t WHERE pmaaent = xmdkent AND pmaa001 = xmdk007) pmaa052,",
#                     "        'N',xmdk000,xmdl001,xmdl002,xmdl003,xmdl004,xmda015,xmda016,xmdd018,xmdd019,xmdk045 ",
#                     "   FROM xmdk_t,xmdl_t,xmdd_t,xmdc_t,xmda_t  ",
#                     "  WHERE xmdkent = xmdlent ",
#                     "    AND xmdkdocno = xmdldocno ",
#                     "    AND xmdlent = xmddent ",
#                     "    AND xmdl003 = xmdddocno ",
#                     "    AND xmdl004 = xmddseq ",
#                     "    AND xmdl005 = xmddseq1 ",
#                     "    AND xmdl006 = xmddseq2 ",
#                     "    AND xmdcent = xmddent ",
#                     "    AND xmdcdocno = xmdddocno ",
#                     "    AND xmdcseq = xmddseq ",
#                     "    AND xmdaent = xmdcent",
#                     "    AND xmdadocno = xmdcdocno ",               
#                     "    AND xmdk002 NOT IN ('4','5') ",
#                     "    AND NOT (xmdk003 = '3' AND xmdk000 = '1') ",
#                     "    AND xmdk000 = '5' AND xmdkstus = 'Y' ",
#                     "    AND xmdkent = ",g_enterprise,
#                     "    AND xmdldocno = '",lc_param.xmab003,"' "
#        
#         PREPARE s_credit_sel FROM l_sql
#         DECLARE s_credit_cur CURSOR FOR s_credit_sel
#         
#         FOREACH s_credit_cur INTO l_xmab.xmabent,l_xmab.xmab001,l_xmab.xmab003,l_xmab.xmab004,
#                                   l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
#                                   l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab014,
#                                   l_xmab.xmab015,l_xmab.xmab016,l_xmab.xmab017,l_xmab.xmab018,l_xmab.xmab019,
#                                   l_xmab.xmab020,l_xmab.xmab021,l_xmab.xmab022,l_xmdk000     ,l_xmdl001     ,
#                                   l_xmdl002     ,l_xmdl003     ,l_xmdl004     ,l_xmda015     ,l_xmda016,
#                                   l_xmdd018     ,l_xmdd019     ,l_xmda006
#                                   
#            IF SQLCA.SQLCODE THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = "FOREACH s_credit_cur:" 
#               LET g_errparam.code = SQLCA.SQLCODE 
#               LET g_errparam.popup = TRUE 
#               LET r_success = FALSE
#               CALL cl_err() 
#               EXIT FOREACH
#            END IF                                   
#            
#            IF cl_null(l_xmab.xmab008) THEN LET l_xmab.xmab008 = l_xmab.xmab006 END IF
#            IF cl_null(l_xmab.xmab021) THEN LET l_xmab.xmab021 = l_xmab.xmab006 END IF
#            
#            IF l_xmab.xmab007 = l_xmab.xmab012 AND l_xmab.xmab007 = l_xmab.xmab019 THEN
#            ELSE
#               CALL cl_get_para(g_enterprise,l_xmab.xmab005,'S-BAS-0010') RETURNING l_ooab002
#            END IF 
#            
#            #據點匯率 
#            IF l_xmab.xmab007 = l_xmab.xmab012 THEN
#               LET l_xmab.xmab013 = 1
#            ELSE         
#               CALL s_credit_get_exrate('1',l_xmab.xmab005,l_xmab.xmab011,l_xmab.xmab007,l_xmab.xmab012,0,l_ooab002) RETURNING l_xmab.xmab013
#            END IF 
#            
#            #據點匯率 
#            IF l_xmab.xmab007 = l_xmab.xmab019 THEN
#               LET l_xmab.xmab020 = 1
#            ELSE
#               CALL s_credit_get_exrate('1',l_xmab.xmab005,l_xmab.xmab011,l_xmab.xmab007,l_xmab.xmab019,0,l_ooab002) RETURNING l_xmab.xmab020
#            END IF 
#            
#            LET l_xmab.xmab010 = l_xmab.xmab009
#            LET l_xmab.xmab016 = l_xmab.xmab015
#            
#            INSERT INTO xmab_t(xmabent,xmab001,xmab002,xmab003,xmab004,
#                               xmab005,xmab006,xmab007,xmab008,xmab009,
#                               xmab010,xmab011,xmab012,xmab013,xmab014,
#                               xmab015,xmab016,xmab017,xmab018,xmab019,
#                               xmab020,xmab021,xmab022)
#                        VALUES(l_xmab.xmabent,l_xmab.xmab001,' '           ,l_xmab.xmab003,l_xmab.xmab004,
#                               l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
#                               l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab014,
#                               l_xmab.xmab015,l_xmab.xmab016,l_xmab.xmab017,l_xmab.xmab018,l_xmab.xmab019,
#                               l_xmab.xmab020,l_xmab.xmab021,l_xmab.xmab022)
#                    
#            IF SQLCA.SQLCODE THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = "ins xmab_t:" 
#               LET g_errparam.code = SQLCA.SQLCODE 
#               LET g_errparam.popup = TRUE 
#               LET r_success = FALSE
#               CALL cl_err() 
#               EXIT FOREACH
#            END IF
#            
#            #簽退單不需立信用額度資料，只會回沖前置單據，因為要記錄相關沖銷過程，故也將簽退資料寫入xmab_t，但馬上沖銷
#            LET l_xmak.xmak001 = l_xmab.xmab001
#            LET l_xmak.xmak002 = l_xmab.xmab003
#            LET l_xmak.xmak003 = l_xmab.xmab004
#            LET l_xmak.xmak004 = l_xmab.xmab001
#            LET l_xmak.xmak005 = l_xmab.xmab003
#            LET l_xmak.xmak006 = l_xmab.xmab004
#            LET l_xmak.xmak007 = l_xmab.xmab009       
#            LET l_xmak.xmak008 = l_xmab.xmab015
#            LET l_xmak.xmak009 = 'N'
#            LET l_xmak.xmak010 = l_xmab.xmab011
#            
#            INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,xmak006,
#                               xmak007,xmak008,xmak009,xmak010)
#                        VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,l_xmak.xmak006,
#                               l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
#            
#            IF SQLCA.SQLCODE THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = "ins xmak:" 
#               LET g_errparam.code = SQLCA.SQLCODE 
#               LET g_errparam.popup = TRUE 
#               LET r_success = FALSE
#               CALL cl_err() 
#               EXIT FOREACH
#            END IF         
#         END FOREACH 
#              
#      ELSE
#         DELETE FROM xmab_t WHERE xmabent = g_enterprise
#                              AND xmab001 = lc_param.proj
#                              AND xmab003 = lc_param.xmab003
#         DELETE FROM xmak_t WHERE xmakent = g_enterprise
#                              AND xmak001 = lc_param.proj
#                              AND xmak002 = lc_param.xmab003
#                              AND xmak004 = lc_param.proj
#                              AND xmak005 = lc_param.xmab003                              
#      END IF 
#      RETURN r_success
#   END IF    
#   #190802-00035#4-E add 
     
   CASE lc_param.proj
     WHEN 'S1'     #S1:訂單未出貨     
       SELECT COUNT(1) INTO l_cnt
         FROM xmdk_t
        WHERE xmdkent = g_enterprise AND xmdkdocno = lc_param.xmab003
       #190802-00035#4-S add
       IF g_prog MATCHES 'axmt590*' OR g_prog MATCHES 'axmt591*' THEN
          LET l_xmdk000 = ''                                
          SELECT xmdk000 INTO l_xmdk000
            FROM xmdk_t
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = lc_param.xmab003 
       END IF         
       #190802-00035#4-E add          
       IF l_cnt = 0 THEN       
         #LET g_sql = " SELECT xmdcorga,xmdcdocno,xmdcseq,   ,xmdc047, ",         #160913-00050#1 mark
         #190802-00035#4-S add  
          #LET g_sql = " SELECT xmdcorga,xmdcdocno,xmdcseq,xmdcsite,xmdc047, ",    #160913-00050#1 add
          #            "        xmdc010 ,xmdc011  ,     '',      '',     '', ",
          #            "              '',       '',     '' ",
          #            "   FROM xmdc_t ",
          #            "  WHERE xmdcent  = ",g_enterprise,
          #            "    AND xmdcdocno = '",lc_param.xmab003,"' ",
          #            "  ORDER BY xmdcorga,xmdcseq "
         #190802-00035#4-E add                   
         #190802-00035#4-S add             
          LET g_sql = " SELECT xmdcorga,xmdcdocno,xmdcseq,xmdcsite,xmdc047, ",    #160913-00050#1 add
                      "        xmdc010 ,xmdc011  ,     '',      '',xmda015, ",
                      "        xmda016 ,       '',     '' ",
                      "   FROM xmdc_t,xmda_t ",                      
                      "  WHERE xmdcent = xmdaent AND xmdcdocno = xmdadocno ",
                      "    AND xmdcent  = ",g_enterprise,
                      "    AND xmdcdocno = '",lc_param.xmab003,"' ",
                      "  ORDER BY xmdcorga,xmdcseq "   
        #190802-00035#4-E add                       
        ELSE
           #190802-00035#4-S mark
           #LET g_sql = " SELECT xmdlsite,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
           #           #"        xmdl021,xmdl022,  ,     '',      '',     '', ",     #160623-00011#1 160624 by lori mark
           #            "        xmdl021,xmdl022   ,     '',      '',     '', ",     #160623-00011#1 160624 by lori add  
           #            "              '',       '',     '' ",
           #            "   FROM xmdl_t  ", 
           #            "  WHERE xmdlent = ",g_enterprise, 
           #            "    AND xmdldocno = '",lc_param.xmab003,"'",
           #           #"  ORDER BY xmdcorga,b.xmdlseq "    #160623-00011#1 160624 by lori mark
           #            "  ORDER BY xmdlorga,xmdlseq "      #160623-00011#1 160624 by lori add
           #190802-00035#4-E mark    

           #190802-00035#4-S add
           LET g_sql = " SELECT xmdlsite,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                       "        xmdl021,CASE WHEN xmdk000 = '5' THEN xmdl083 ELSE CASE WHEN xmdk000='8' THEN xmdl092 ELSE xmdl022 END END    ,     '',      '',    xmdk016, ",     
                       "        xmdk017,       '',     '' ",
                       "   FROM xmdl_t,xmdk_t ", 
                       "  WHERE xmdlent = xmdkent ",
                       "    AND xmdldocno = xmdkdocno ",
                       "    AND xmdlent = ",g_enterprise, 
                       "    AND xmdldocno = '",lc_param.xmab003,"'",
                       "  ORDER BY xmdlorga,xmdlseq "      
           #190802-00035#4-E add   
        END IF
        
     WHEN 'S2'     #S2:出通單未轉出貨
#190802-00035#4-S mark     
#       LET g_sql = " SELECT xmdcorga,xmdhdocno,xmdhseq,xmdhsite,xmdh027, ",
#                   "        xmdh020 ,xmdh021  ,xmdh001, xmdh002,xmda015, ",
#                   "        xmda016 ,xmdc015  ,xmdc016 ",
#                   "   FROM xmdh_t,xmda_t,xmdc_t ",
#                   "  WHERE xmdaent = xmdcent ",
#                   "    AND xmdadocno = xmdcdocno ",
#                   "    AND xmdhent = xmdcent ",
#                   "    AND xmdh001 = xmdcdocno ",
#                   "    AND xmdh002 = xmdcseq ",
#                   "    AND xmdhent = ",g_enterprise,
#                   "    AND xmdhdocno = '",lc_param.xmab003,"' ",
#                   "  ORDER BY xmdcorga,xmdhseq "
#190802-00035#4-E mark  

#190802-00035#4-S add
       LET g_sql = " SELECT DISTINCT xmdcorga,xmdhdocno,xmdhseq,xmdhsite,xmdh027, ",
                   "        xmdh020 ,xmdh021  ,xmdh001, xmdh002,xmda015, ",
                   "        xmda016 ,xmdd018  ,xmdd019 ",
                   "   FROM xmdh_t,xmdd_t,xmdc_t,xmda_t ",
                   "  WHERE xmdhent = xmddent ",
                   "    AND xmdh001 = xmdddocno ",
                   "    AND xmdh002 = xmddseq ",
                   "    AND xmdh003 = xmddseq1 ",
                   "    AND xmddent = xmdcent ",
                   "    AND xmdddocno = xmdcdocno",
                   "    AND xmddseq   = xmdcseq ",
                   "    AND xmdcent   = xmdaent ",
                   "    AND xmdcdocno = xmdadocno ",
                   "    AND xmdhent = ",g_enterprise,
                   "    AND xmdhdocno = '",lc_param.xmab003,"' ",
                   "  ORDER BY xmdcorga,xmdhseq "
#190802-00035#4-E add 

       #190722-00056#9 add --s
       LET l_xmdgstus = ''
       SELECT xmdgstus INTO l_xmdgstus
         FROM xmdg_t
        WHERE xmdgent   = g_enterprise 
          AND xmdgdocno = lc_param.xmab003
       #190722-00056#9 add --e
     WHEN 'S3'     #S3:出貨未開發票(出貨/簽收)         
       
       LET l_xmdk000 = ''
       LET l_xmdk002 = ''                                 #160505-00018#1 160624 by lori add
       SELECT xmdk000,xmdk002 INTO l_xmdk000,l_xmdk002    #160505-00018#1 160624 by lori add xmdl002
         FROM xmdk_t
        WHERE xmdkent = g_enterprise
          AND xmdkdocno = lc_param.xmab003  
       CASE l_xmdk000
         WHEN '1'         #出貨
           IF lc_param.proj_o = 'S1' THEN  #來源訂單
              #170424-00046#1-s-mod   「單價、稅別」改取「交期明細」的
              #LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
              #            "        xmdl021 ,xmdl022  ,xmdl003,xmdl004 ,xmda015, ",
              #            "        xmda016 ,xmdc015  ,xmdc016 ",
              #            "   FROM xmdl_t,xmda_t,xmdc_t ",
              #            "  WHERE xmdaent = xmdcent ",
              #            "    AND xmdadocno = xmdcdocno ",
              #            "    AND xmdlent = xmdcent ",
              #            "    AND xmdl003 = xmdcdocno ",
              #            "    AND xmdl004 = xmdcseq ",
              #            "    AND xmdlent = ",g_enterprise,
              #            "    AND xmdldocno = '",lc_param.xmab003,"'",
              #            "  ORDER BY xmdcorga,xmdlseq "
              LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                          "        xmdl021 ,xmdl022  ,xmdl003,xmdl004 ,xmda015, ",
                          "        xmda016 ,xmdd018  ,xmdd019  ",
                          "   FROM xmdl_t,xmda_t,xmdc_t,xmdd_t ",
                          "  WHERE  xmdaent = xmdcent  AND xmdadocno = xmdcdocno ",
                          "    AND xmdcent = xmddent AND xmdcdocno = xmdddocno AND xmdcseq = xmddseq ",
                          "    AND xmdlent = xmddent AND xmdl003 = xmdddocno AND xmdl004 = xmddseq AND xmdl005 = xmddseq1 AND xmdl006 = xmddseq2 ",
                          "    AND xmdlent = ",g_enterprise,
                          "    AND xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,xmdl003,xmdl004,xmdlseq "   #190802-00035#4 add
                          #"  ORDER BY xmdcorga,xmdlseq "                  #190802-00035#4 mark
                          
              #170424-00046#1-e-mod
           END IF
           IF lc_param.proj_o = 'S2' THEN  #來源出通
              #160505-00018#1 160624 by lori add---(S)
              #寄銷正式銷售單單身未紀錄出通單資訊
              IF l_xmdk002 = '7' THEN    
                 LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq  ,xmdlsite,xmdl028, ",
                             "        xmdl021 ,xmdl022  ,xmdhdocno,xmdhseq ,xmdg014, ",
                             "        xmdg015 ,xmdh023  ,xmdh024 ",
                             "   FROM xmdl_t, xmdk_t, xmdc_t, xmdh_t, xmdg_t ",
                             "  WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno ",
                             "        AND xmdlent = xmdcent AND xmdl003 = xmdcdocno AND xmdl004 = xmdcseq ",
                             "        AND xmdcent = xmdhent AND xmdcdocno = xmdh001 AND xmdcseq = xmdh002 ",
                             "        AND xmdhent = xmdgent AND xmdhdocno = xmdgdocno ",
                             "    AND xmdlent = ",g_enterprise,
                             "    AND xmdldocno = '",lc_param.xmab003,"'",
                             "  ORDER BY xmdcorga,xmdlseq "              
              ELSE
              #160505-00018#1 160624 by lori add---(E)
                 LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                             "        xmdl021 ,xmdl022  ,xmdl001,xmdl002 ,xmdg014, ",
                             "        xmdg015 ,xmdh023  ,xmdh024 ",
                             "   FROM xmdc_t,xmdl_t,xmdg_t,xmdh_t  ",
                             "  WHERE xmdcent = xmdlent AND xmdcdocno = xmdl003 AND xmdcseq = xmdl004 ",
                             "    AND xmdhent = xmdlent AND xmdhdocno = xmdl001 AND xmdhseq = xmdl002 ",
                             "    AND xmdgent = xmdhent AND xmdgdocno= xmdhdocno ",
                             "    AND xmdlent = ",g_enterprise,
                             "    AND xmdldocno = '",lc_param.xmab003,"'",
                             "  ORDER BY xmdcorga,xmdlseq "
              END IF   #160505-00018#1 160624 by lori add                
           END IF
         WHEN '2'      #無訂單出貨 
         #190802-00035#4-S mark
           #LET g_sql = " SELECT xmdlsite,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
           #            "        xmdl021 ,xmdl022  ,     '',      '',     '', ",
           #            "              '',       '',     '' ",
           #            "  FROM xmdl_t ",
           #            " WHERE xmdlent = ",g_enterprise,
           #            "   AND xmdldocno = '",lc_param.xmab003,"'",
           #            " ORDER BY xmdlseq "
         #190802-00035#4-E mark  
         #190802-00035#4-S add  
           LET g_sql = " SELECT xmdlsite,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                       "        xmdl021 ,xmdl022  ,     '',      '',xmdk016, ",
                       "        xmdk017 ,       '',     '' ",
                       "  FROM xmdl_t,xmdk_t ",
                       " WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno",
                       "   AND xmdlent = ",g_enterprise,
                       "   AND xmdldocno = '",lc_param.xmab003,"'",
                       " ORDER BY xmdlseq "
         #190802-00035#4-E add  
         
         WHEN '4'      #出貨簽收單          
          #190528-00020#1 mark --s
          #LET g_sql = " SELECT COALESCE(xmdcorga,a.xmdlsite),b.xmdldocno,b.xmdlseq,b.xmdlsite,b.xmdl028, ",
          #            "        b.xmdl021,b.xmdl022,COALESCE(xmdhdocno,xmdcdocno),COALESCE(xmdhseq,xmdcseq),COALESCE(xmdg014,xmda015), ",
          #            "        COALESCE(xmdg015,xmda016),COALESCE(xmdh023,xmdc015),COALESCE(xmdh024,xmdc016) ",  
          #            "   FROM xmdl_t b, ",         #a出貨b簽收
          #            "        xmdl_t a LEFT OUTER JOIN xmdg_t ON a.xmdlent = xmdgent AND a.xmdl001 = xmdgdocno ",
          #            "                 LEFT OUTER JOIN xmdh_t ON a.xmdlent = xmdhent AND a.xmdl001 = xmdhdocno AND a.xmdl002 = xmdhseq ",
          #            "                 LEFT OUTER JOIN xmda_t ON a.xmdlent = xmdaent AND a.xmdl003 = xmdadocno ",
          #            "                 LEFT OUTER JOIN xmdc_t ON a.xmdlent = xmdcent AND a.xmdl003 = xmdcdocno AND a.xmdl004 = xmdcseq ",                         
          #            "  WHERE a.xmdlent = b.xmdlent AND b.xmdlent = ",g_enterprise, 
          #            "    AND a.xmdldocno = b.xmdl001",
          #            "    AND a.xmdlseq = b.xmdl002",                           
          #            "    AND b.xmdldocno = '",lc_param.xmab003,"'",
          #            "  ORDER BY xmdcorga,b.xmdlseq " #160826-00035#1 mark #160929-00021#1 remark
          #190528-00020#1 mark --e
                      #160929-00021#1-s-mark 
                      ##160826-00035#1 add start -----
                      #"  UNION ",
                      #" SELECT COALESCE(xmdcorga,xmdlsite) ,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                      #"        xmdl021, xmdl022 , xmdl003,  xmdl004 , xmda015  , ",
                      #"        xmda016, xmdc015 , xmdc016 ",
                      #"   FROM xmdl_t ",
                      #"           LEFT OUTER JOIN xmda_t ON xmdlent = xmdaent AND xmdl003 = xmdadocno ",
                      #"           LEFT OUTER JOIN xmdc_t ON xmdlent = xmdcent AND xmdl003 = xmdcdocno AND xmdl004 = xmdcseq ",
                      #"       ,xmdk_t ",
                      #"  WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno ",
                      #"    AND xmdlent = ",g_enterprise,
                      #"    AND xmdldocno = '",lc_param.xmab003,"'"
                      ##160826-00035#1 add end   -----                          
                      #160929-00021#1-e-mark
           #190528-00020#1 add --s
           IF lc_param.proj_o = 'S1' THEN  #來源訂單
              LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                          "        xmdl021 ,xmdl022  ,xmdl003,xmdl004 ,xmda015, ",
                          "        xmda016 ,xmdd018  ,xmdd019  ",
                          "   FROM xmdl_t,xmda_t,xmdc_t,xmdd_t ",
                          "  WHERE  xmdaent = xmdcent  AND xmdadocno = xmdcdocno ",
                          "    AND xmdcent = xmddent AND xmdcdocno = xmdddocno AND xmdcseq = xmddseq ",
                          "    AND xmdlent = xmddent  AND xmdl003 = xmdddocno AND xmdl004 = xmddseq AND xmdl005 = xmddseq1 AND xmdl006 = xmddseq2 ",
                          "    AND xmdlent = ",g_enterprise,
                          "    AND xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,xmdlseq "
           END IF
           IF lc_param.proj_o = 'S2' THEN  #來源出通
              LET g_sql = " SELECT xmdcorga,a.xmdldocno,a.xmdlseq,a.xmdlsite,a.xmdl028, ",
                          "        a.xmdl021 ,a.xmdl022  ,b.xmdl001,b.xmdl002 ,xmdg014, ",
                          "        xmdg015 ,xmdh023  ,xmdh024 ",
                          "   FROM xmdc_t,xmdl_t a  ",
                          "        ,xmdl_t b,xmdg_t,xmdh_t ",
                          "  WHERE xmdcent = a.xmdlent AND xmdcdocno = a.xmdl003 AND xmdcseq = a.xmdl004 ",
                          "    AND a.xmdlent =b.xmdlent AND a.xmdl001 = b.xmdldocno AND a.xmdl002 = b.xmdlseq ",
                          "    AND xmdhent = b.xmdlent AND xmdhdocno = b.xmdl001 AND xmdhseq = b.xmdl002 ",
                          "    AND xmdgent = xmdhent AND xmdgdocno= xmdhdocno ",
                          "    AND a.xmdlent = ",g_enterprise,
                          "    AND a.xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,a.xmdlseq "
           END IF
         WHEN '5'         #出貨簽退單
         
           #190802-00035#4-S add         
           IF lc_param.proj_o = 'S1' THEN  #來源訂單
              LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                          "        xmdl021 ,xmdl083  ,xmdl003,xmdl004 ,xmda015, ",
                          "        xmda016 ,xmdd018  ,xmdd019  ",
                          "   FROM xmdl_t,xmda_t,xmdc_t,xmdd_t ",
                          "  WHERE  xmdaent = xmdcent  AND xmdadocno = xmdcdocno ",
                          "    AND xmdcent = xmddent AND xmdcdocno = xmdddocno AND xmdcseq = xmddseq ",
                          "    AND xmdlent = xmddent  AND xmdl003 = xmdddocno AND xmdl004 = xmddseq AND xmdl005 = xmddseq1 AND xmdl006 = xmddseq2 ",
                          "    AND xmdlent = ",g_enterprise,
                          "    AND xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,xmdlseq "
           END IF
           #190802-00035#4-E add   

           #因為出貨簽退單，不走出通，不異動信用額度資料，所以這邊不須有來源訂單的段落
           IF lc_param.proj_o = 'S2' THEN  #來源出通
              LET g_sql = " SELECT xmdcorga,a.xmdldocno,a.xmdlseq,a.xmdlsite,a.xmdl028, ",
                          "        a.xmdl021 ,a.xmdl083  ,b.xmdl001,b.xmdl002 ,xmdg014, ",
                          "        xmdg015 ,xmdh023  ,xmdh024 ",
                          "   FROM xmdc_t,xmdl_t a  ",
                          "        ,xmdl_t b,xmdg_t,xmdh_t ",
                          "  WHERE xmdcent = a.xmdlent AND xmdcdocno = a.xmdl003 AND xmdcseq = a.xmdl004 ",
                          "    AND a.xmdlent =b.xmdlent AND a.xmdl001 = b.xmdldocno AND a.xmdl002 = b.xmdlseq ",
                          "    AND xmdhent = b.xmdlent AND xmdhdocno = b.xmdl001 AND xmdhseq = b.xmdl002 ",
                          "    AND xmdgent = xmdhent AND xmdgdocno= xmdhdocno ",
                          "    AND a.xmdlent = ",g_enterprise,
                          "    AND a.xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,a.xmdlseq "
           END IF   
           #簽退只沖，不須立帳也不須折讓
           #LET lc_param.proj = '##'   #190802-00035#4 mark   #簽退也需要產生xmab_t/xmak_t
         #190528-00020#1 add --e
         #190521-00023#2 add --s
         WHEN '7'         #借貨還價單
           IF lc_param.proj_o = 'S1' THEN  #來源訂單
              LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                          "        xmdl021 ,xmdl022  ,xmdl003,xmdl004 ,xmda015, ",
                          "        xmda016 ,xmdd018  ,xmdd019  ",
                          "   FROM xmdl_t,xmda_t,xmdc_t,xmdd_t ",
                          "  WHERE  xmdaent = xmdcent  AND xmdadocno = xmdcdocno ",
                          "    AND xmdcent = xmddent AND xmdcdocno = xmdddocno AND xmdcseq = xmddseq ",
                          "    AND xmdlent = xmddent  AND xmdl003 = xmdddocno AND xmdl004 = xmddseq AND xmdl005 = xmddseq1 AND xmdl006 = xmddseq2 ",
                          "    AND xmdlent = ",g_enterprise,
                          "    AND xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,xmdlseq "
           END IF
           IF lc_param.proj_o = 'S2' THEN  #來源出通
                 LET g_sql = " SELECT xmdcorga,a.xmdldocno,a.xmdlseq,a.xmdlsite,a.xmdl028, ",
                             "        a.xmdl021 ,a.xmdl022  ,b.xmdl001,b.xmdl002 ,xmdg014, ",
                             "        xmdg015 ,xmdh023  ,xmdh024 ",
                             "   FROM xmdc_t,xmdl_t a  ",
                             "        ,xmdl_t b,xmdg_t,xmdh_t ",
                             "  WHERE xmdcent = a.xmdlent AND xmdcdocno = a.xmdl003 AND xmdcseq = a.xmdl004 ",
                             "    AND a.xmdlent =b.xmdlent AND a.xmdl001 = b.xmdldocno AND a.xmdl002 = b.xmdlseq ",
                             "    AND xmdhent = b.xmdlent AND xmdhdocno = b.xmdl001 AND xmdhseq = b.xmdl002 ",
                             "    AND xmdgent = xmdhent AND xmdgdocno= xmdhdocno ",
                             "    AND a.xmdlent = ",g_enterprise,
                             "    AND a.xmdldocno = '",lc_param.xmab003,"'",
                             "  ORDER BY xmdcorga,a.xmdlseq "
           END IF
         WHEN '8'         #借貨還量單
           IF lc_param.proj_o = 'S1' THEN  #來源訂單
              LET g_sql = " SELECT xmdcorga,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
#                          "        xmdl021 ,xmdl092  ,xmdl003,xmdl004 ,xmda015, ",  #200226-00031#1 mark by 09424
                          "        xmdl021 ,xmdl083  ,xmdl003,xmdl004 ,xmda015, ",  #200226-00031#1 add by 09424
                          "        xmda016 ,xmdd018  ,xmdd019  ",
                          "   FROM xmdl_t,xmda_t,xmdc_t,xmdd_t ",
                          "  WHERE  xmdaent = xmdcent  AND xmdadocno = xmdcdocno ",
                          "    AND xmdcent = xmddent AND xmdcdocno = xmdddocno AND xmdcseq = xmddseq ",
                          "    AND xmdlent = xmddent  AND xmdl003 = xmdddocno AND xmdl004 = xmddseq AND xmdl005 = xmddseq1 AND xmdl006 = xmddseq2 ",
                          "    AND xmdlent = ",g_enterprise,
                          "    AND xmdldocno = '",lc_param.xmab003,"'",
                          "  ORDER BY xmdcorga,xmdlseq "
           END IF
           IF lc_param.proj_o = 'S2' THEN  #來源出通
                 LET g_sql = " SELECT xmdcorga,a.xmdldocno,a.xmdlseq,a.xmdlsite,a.xmdl028, ",
#                             "        a.xmdl021 ,a.xmdl092  ,b.xmdl001,b.xmdl002 ,xmdg014, ", #200226-00031#1 mark by 09424
                             "        a.xmdl021 ,a.xmdl083  ,b.xmdl001,b.xmdl002 ,xmdg014, ", #200226-00031#1 add by 09424
                             "        xmdg015 ,xmdh023  ,xmdh024 ",
                             "   FROM xmdc_t,xmdl_t a  ",
                             "        ,xmdl_t b,xmdg_t,xmdh_t ",
                             "  WHERE xmdcent = a.xmdlent AND xmdcdocno = a.xmdl003 AND xmdcseq = a.xmdl004 ",
                             "    AND a.xmdlent =b.xmdlent AND a.xmdl001 = b.xmdldocno AND a.xmdl002 = b.xmdlseq ",
                             "    AND xmdhent = b.xmdlent AND xmdhdocno = b.xmdl001 AND xmdhseq = b.xmdl002 ",
                             "    AND xmdgent = xmdhent AND xmdgdocno= xmdhdocno ",
                             "    AND a.xmdlent = ",g_enterprise,
                             "    AND a.xmdldocno = '",lc_param.xmab003,"'",
                             "  ORDER BY xmdcorga,a.xmdlseq "
           END IF   
           #借貨還量只沖，不須立帳也不須折讓
           #LET lc_param.proj = '##'   #190802-00035#4 mark         
         #190521-00023#2 add --e
       END CASE
        
     WHEN 'S4'     #銷退單
       LET l_xmdk002 = ''           #160505-00018#7 160510 by lori add
       LET l_xmdk082 = ''
       
       SELECT xmdk002,xmdk082       #160505-00018#7 160510 by lori add xmdk002
         INTO l_xmdk002,l_xmdk082   #160505-00018#7 160510 by lori add xmdk002
         FROM xmdk_t
        WHERE xmdkent = g_enterprise
          AND xmdkdocno = lc_param.xmab003
          
       #160505-00018#7 160510 by lori add---(S)   
       IF l_xmdk002 = '7' THEN
          LET g_sql = " SELECT COALESCE(xmdcorga,xmdlsite) ,xmdldocno,xmdlseq,xmdlsite,xmdl028, ",
                      "        xmdl021, xmdl022 , xmdl003,  xmdl004 , xmda015  , ",
                      "        xmda016, xmdc015 , xmdc016 ",     
                      "   FROM xmdl_t ",
                      "           LEFT OUTER JOIN xmda_t ON xmdlent = xmdaent AND xmdl003 = xmdadocno ",
                      "           LEFT OUTER JOIN xmdc_t ON xmdlent = xmdcent AND xmdl003 = xmdcdocno AND xmdl004 = xmdcseq ", 
                      "       ,xmdk_t ", 
                      "  WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno ",
                      "    AND xmdlent = ",g_enterprise,
                      "    AND xmdldocno = '",lc_param.xmab003,"'",
                      "  ORDER BY xmdcorga,xmdlseq "       
       ELSE
       #160505-00018#7 160510 by lori add---(E)       
          LET g_sql = " SELECT COALESCE(xmdcorga,a.xmdlsite,b.xmdlsite) ,b.xmdldocno,b.xmdlseq,b.xmdlsite,b.xmdl028, ",   #161202-00048#1 161206 by lori add:b.xmdlsite
                      "        b.xmdl021,b.xmdl022  ,b.xmdl003,b.xmdl004 ,xmda015  , ",
                      "        xmda016 ,xmdc015  ,xmdc016 ",     
                     #161202-00048#1 161206 by lori mod---(S)
                     #"   FROM xmdl_t b,xmdk_t,",                 #a出貨/簽收 b銷退
                     #"        xmdl_t a LEFT OUTER JOIN xmda_t ON a.xmdlent = xmdaent AND a.xmdl003 = xmdadocno ",
                     #"                 LEFT OUTER JOIN xmdc_t ON a.xmdlent = xmdcent AND a.xmdl003 = xmdcdocno AND a.xmdl004 = xmdcseq ", 
                     #"  WHERE a.xmdlent = xmdkent AND a.xmdldocno = xmdkdocno ",
                     #"    AND a.xmdlent = b.xmdlent AND a.xmdldocno = b.xmdl001 AND a.xmdlseq = b.xmdl002 ",
                     #"    AND b.xmdlent = ",g_enterprise,
                      "   FROM xmdl_t b LEFT JOIN (SELECT xmdlent,xmdldocno,xmdlseq,xmdlsite,xmda015,xmda016,xmdc015,xmdc016,xmdcorga ",
                      "                              FROM xmdl_t LEFT OUTER JOIN xmda_t ON xmdlent = xmdaent AND xmdl003 = xmdadocno ",
                      "                                          LEFT OUTER JOIN xmdc_t ON xmdlent = xmdcent AND xmdl003 = xmdcdocno AND xmdl004 = xmdcseq ",    
                      "                                  ,xmdk_t WHERE xmdlent = xmdkent AND xmdldocno = xmdkdocno) a ", 
                      "                        ON a.xmdlent = b.xmdlent AND a.xmdldocno = b.xmdl001 AND a.xmdlseq = b.xmdl002 ",
                      "  WHERE b.xmdlent = ",g_enterprise,
                     #161202-00048#1 161206 by lori mod---(E)
                      "    AND b.xmdldocno = '",lc_param.xmab003,"'",
                      "  ORDER BY xmdcorga,b.xmdlseq " 
       END IF   #160505-00018#7 160510 by lori add 
     WHEN 'P1'     #採購單
     #190802-00035#4-S mark
#       LET g_sql = " SELECT pmdnorga,pmdndocno,pmdnseq,pmdnsite,pmdn047, ",
#                   "        pmdn010 ,pmdn011  ,     '',      '',     '', ",
#                   "              '',       '',     '' ",
#                   "   FROM pmdn_t ",
#                   "  WHERE pmdnent  = ",g_enterprise,
#                   "    AND pmdndocno = '",lc_param.xmab003,"' ",
#                   "  ORDER BY pmdnorga,pmdnseq "
     #190802-00035#4-E mark 

#     #191104-00018#1-S add
#     LET l_cnt = 0
#     SELECT COUNT(1) INTO l_cnt FROM pmdl_t 
#      WHERE pmdlent = g_enterprise
#        AND pmdldocno = lc_param.xmab003
#     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#     
#     IF l_cnt = 0 THEN 
#        #驗退、委外驗退、重覆性生產驗退
#  
#     ELSE
#     #191104-00018#1-E add
     
     
     #190802-00035#4-S add
       LET g_sql = " SELECT pmdnorga,pmdndocno,pmdnseq,pmdnsite,pmdn047, ",
                   "        pmdn010 ,pmdn011  ,     '',      '',pmdl015, ",
                   "        pmdl016 ,       '',     '' ",
                   "   FROM pmdn_t,pmdl_t ",
                   "  WHERE pmdnent = pmdlent AND pmdndocno = pmdldocno ",
                   "    AND pmdnent  = ",g_enterprise,
                   "    AND pmdndocno = '",lc_param.xmab003,"' ",
                   "  ORDER BY pmdnorga,pmdnseq "
     #190802-00035#4-E add 
#     END IF    #190802-00035#4 add 
     
     WHEN 'P2'     #採購收貨單/委外採購收貨單/重覆性生產收貨單/無採購收貨單   
       #190802-00035#4-S mark   #單價稅別改取交期明細
       #LET g_sql = " SELECT COALESCE(pmdnorga,pmdtsite) ,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
       #            "        pmdt023 ,pmdt024  ,pmdt001,pmdt002 ,pmdl015, ",
       #            "        pmdl016 ,pmdn015  ,pmdn016 ",
       #            "   FROM pmdt_t LEFT OUTER JOIN pmdl_t ON pmdtent = pmdlent AND pmdt001 = pmdldocno ",
       #            "               LEFT OUTER JOIN pmdn_t ON pmdtent = pmdnent AND pmdt001 = pmdndocno AND pmdt002 = pmdnseq ",
       #            "  WHERE pmdtent = ",g_enterprise,
       #            "    AND pmdtdocno = '",lc_param.xmab003,"'",
       #            "  ORDER BY pmdnorga,pmdtseq " 
       #190802-00035#4-E mark   

       #190802-00035#4-S add
       LET g_sql = " SELECT COALESCE(pmdnorga,pmdtsite) ,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
                   "        pmdt023 ,pmdt024  ,pmdt001,pmdt002 ,pmdl015, ",
                   "        pmdl016 ,pmdo022  ,pmdo023 ",
                   "   FROM pmdt_t LEFT OUTER JOIN pmdl_t ON pmdtent = pmdlent AND pmdt001 = pmdldocno ",
                   "               LEFT OUTER JOIN pmdn_t ON pmdtent = pmdnent AND pmdt001 = pmdndocno AND pmdt002 = pmdnseq ",
                   "               LEFT OUTER JOIN pmdo_t ON pmdtent = pmdoent AND pmdt001 = pmdodocno AND pmdt002 = pmdoseq AND pmdt003 = pmdoseq1 AND pmdt004 = pmdoseq2 ",
                   "  WHERE pmdtent = ",g_enterprise,
                   "    AND pmdtdocno = '",lc_param.xmab003,"'",
                   "  ORDER BY pmdnorga,pmdtseq "        
       #190802-00035#4-E add       
     WHEN 'P3'    
       IF NOT cl_null(lc_param.proj_o) THEN
          #採購收貨入庫單/委外採購收貨入庫單
          IF lc_param.proj_o = 'P1' THEN          
          #190802-00035#4-S mark  #單價稅別改取交期明細
             #LET g_sql = " SELECT pmdnorga,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
             #            "        pmdt023 ,pmdt024  ,pmdt001,pmdt002 ,pmdl015, ", 
             #            "        pmdl016 ,pmdn015  ,pmdn016 ", 
             #            "   FROM pmdt_t,pmdl_t,pmdn_t ",
             #            "  WHERE pmdtent = pmdlent AND pmdt001 = pmdldocno ", 
             #            "    AND pmdtent = pmdnent AND pmdt001 = pmdndocno AND pmdt002 = pmdnseq ",
             #            "    AND pmdtent =  ",g_enterprise,
             #            "    AND pmdtdocno = '",lc_param.xmab003,"'",
             #            "  ORDER BY pmdnorga,pmdtseq " 
          #190802-00035#4-E mark
          
          #單價稅別改取交期明細
          #190802-00035#4-S add
             LET g_sql = " SELECT pmdnorga,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
                         "        pmdt023 ,pmdt024  ,pmdt001,pmdt002 ,pmdl015, ", 
                         "        pmdl016 ,pmdo022  ,pmdo023 ", 
                         "   FROM pmdt_t,pmdl_t,pmdn_t,pmdo_t ",
                         "  WHERE pmdtent = pmdlent AND pmdt001 = pmdldocno ", 
                         "    AND pmdtent = pmdnent AND pmdt001 = pmdndocno AND pmdt002 = pmdnseq ",
                         "    AND pmdtent = pmdoent AND pmdt001 = pmdodocno AND pmdt002 = pmdoseq AND pmdt003 = pmdoseq1 AND pmdt004 = pmdoseq2",
                         "    AND pmdtent =  ",g_enterprise,
                         "    AND pmdtdocno = '",lc_param.xmab003,"'",
                         "  ORDER BY pmdnorga,pmdtseq "           
          #190802-00035#4-E add
                       
             
          END IF
          #入庫單/委外收貨入庫單/重覆性生產入庫
          IF lc_param.proj_o = 'P2' THEN
             LET g_sql = " SELECT COALESCE(pmdnorga,a.pmdtsite),a.pmdtdocno,a.pmdtseq,a.pmdtsite,a.pmdt039, ",
                         "        a.pmdt023,a.pmdt024,a.pmdt027,a.pmdt028  ,pmds037  , ", 
                         "        pmds038  ,b.pmdt036,b.pmdt046 ", 
                         "   FROM pmdt_t b,pmds_t, ",                    #a入庫 b收貨
                         "        pmdt_t a LEFT OUTER JOIN pmdn_t ON a.pmdtent = pmdnent AND a.pmdt001 = pmdndocno AND a.pmdt002 = pmdnseq  ",       
                         "  WHERE a.pmdtent = b.pmdtent AND a.pmdt027 = b.pmdtdocno AND a.pmdt028 = b.pmdtseq ",
                         "    AND b.pmdtent = pmdsent AND b.pmdtdocno = pmdsdocno ",
                         "    AND a.pmdtent =  ",g_enterprise,
                         "    AND a.pmdtdocno = '",lc_param.xmab003,"'",
                         "  ORDER BY pmdnorga,a.pmdtseq "   

             #191104-00018#3-S add
             LET l_pmds000 = ''
             SELECT pmds000 INTO l_pmds000 FROM pmds_t 
              WHERE pmdsent = g_enterprise
                AND pmdsdocno = lc_param.xmab003                
             #191104-00018#3-E add
             
          END IF
       ELSE
          #無採購收貨入庫
         #190802-00035#4-S mark 
          #LET g_sql = " SELECT pmdtsite,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
          #            "        pmdt023 ,pmdt024  ,''     ,''      ,''     , ",
          #            "        ''      ,''       ,''      ",       
          #            "   FROM pmdt_t ",
          #            "  WHERE pmdtent = ",g_enterprise,
          #            "    AND pmdtdocno = '",lc_param.xmab003,"'",
          #            "  ORDER BY pmdtseq "   
         #190802-00035#4-E mark     

         #190802-00035#4-S mark 
          LET g_sql = " SELECT pmdtsite,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
                      "        pmdt023 ,pmdt024  ,''     ,''      ,pmds037, ",
                      "        pmds038 ,''       ,''      ",       
                      "   FROM pmdt_t,pmds_t ",
                      "  WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno ",
                      "    AND pmdtent = ",g_enterprise,
                      "    AND pmdtdocno = '",lc_param.xmab003,"'",
                      "  ORDER BY pmdtseq "   
         #190802-00035#4-E mark     
         
       END IF
     WHEN 'P4'     #倉退單/委外倉退單/重覆性生產倉退 
       LET l_xmdk082 = ''
       SELECT pmds100 INTO l_xmdk082
         FROM pmds_t
        WHERE pmdsent = g_enterprise
          AND pmdsdocno = lc_param.xmab003   
       LET g_sql = " SELECT COALESCE(pmdnorga,pmdtsite) ,pmdtdocno,pmdtseq,pmdtsite,pmdt039, ",
                   "        pmdt023 ,pmdt024  ,pmdt001,pmdt002 ,pmdl015, ",
                   "        pmdl016 ,pmdn015  ,pmdn016 ",
                   "   FROM pmdt_t LEFT OUTER JOIN pmdl_t ON pmdtent = pmdlent AND pmdt001 = pmdldocno ",
                   "               LEFT OUTER JOIN pmdn_t ON pmdtent = pmdnent AND pmdt001 = pmdndocno AND pmdt002 = pmdnseq ",
                   "  WHERE pmdtent = ",g_enterprise,
                   "    AND pmdtdocno = '",lc_param.xmab003,"'",
                   "  ORDER BY pmdnorga,pmdtseq "   
      #150518-00040-3
      WHEN 'P5'         #應付帳款--入庫
         LET l_sql = " SELECT apcborga,apcbdocno,apcbseq,apcborga,apcb105,",
                     "        apcb006,apcb007,apcb002,apcb003,apcb100,",
                     "        pmds038,pmdt036,pmdt046,'',''",
                     "   FROM apcb_t,pmdt_t,pmds_t ",
                     "  WHERE apcbent = ",g_enterprise,
                     "    AND apcbld = '",lc_param.glaald,"' AND  apcbdocno = '",lc_param.xmab003,"'",
                     "    AND apcbent = pmdtent AND apcb002 = pmdtdocno AND apcb003 = pmdtseq",
                     "    AND pmdsent = pmdtent AND pmdsdocno = pmdtdocno"
                     
         LET g_sql = " SELECT apcacomp,apcadocno,'1',apcacomp, ",
                     "        (SELECT SUM(apcc108-apcc109) FROM apcc_t WHERE apccent = ",g_enterprise," AND apccld = '",lc_param.glaald,"' AND apccdocno = '",lc_param.xmab003,"') AS apcc108,",
                     "        '',1,'','','', ",  #190802-00035#3 mod #计价数量给值=1
                     "        apca101,'','' ", #190802-00035#3 mod apca101 #交易单据汇率
                     "   FROM apca_t ",
                     "  WHERE apcaent = ",g_enterprise,
                     "    AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY apcadocno"
          
      WHEN 'P6'         #應付帳款--待抵
         LET l_sql = " SELECT apcborga,apcbdocno,apcbseq,apcborga,apcb105,",
                     "        apcb006,apcb007,apcb002,apcb003,apcb100,",
                     "        pmds038,pmdt036,pmdt046,'',''",
                     "   FROM apcb_t,pmdt_t,pmds_t",
                     "  WHERE apcbent = ",g_enterprise,
                     "    AND apcbld = '",lc_param.glaald,"' AND  apcbdocno = '",lc_param.xmab003,"'",
                     "    AND apcbent = pmdtent AND apcb002 = pmdtdocno AND apcb003 = pmdtseq",
                     "    AND pmdsent = pmdtent AND pmdsdocno = pmdtdocno"
                     
         LET g_sql = " SELECT apcacomp,apcadocno,'1',apcacomp, ",
                     "        (SELECT SUM(apcc108-apcc109) FROM apcc_t WHERE apccent = ",g_enterprise," AND apccld = '",lc_param.glaald,"' AND apccdocno = '",lc_param.xmab003,"') AS apcc108,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        apca101,'','' ", #190802-00035#3 mod apca101 #交易单据汇率
                     "   FROM apca_t ",
                     "  WHERE apcaent = ",g_enterprise,
                     "    AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY apcadocno"
         #190802-00035#3 add(s)
         IF g_prog MATCHES 'aapt310' OR g_prog MATCHES 'aapp134' OR g_prog MATCHES 'aapp300' OR g_prog MATCHES 'aapp310' THEN
            LET g_sql = " SELECT apcacomp,apcadocno,'1',apcacomp, ",
                     "        (SELECT SUM(apcc108) FROM apcc_t WHERE apccent = ",g_enterprise," AND apccld = '",lc_param.glaald,"' AND apccdocno = (SELECT apca018 FROM apca_t WHERE apcaent=",g_enterprise," AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"')) AS apcc108,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        apca101,'','' ",  #190802-00035#3 mod apca101 #交易单据汇率
                     "   FROM apca_t ",
                     "  WHERE apcaent = ",g_enterprise,
                     "    AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY apcadocno"
         END IF
         #190802-00035#3 add(e)            
      #190902-00032#5---add---start--- 
      WHEN 'P8' #已付款未沖銷
         LET g_sql = " SELECT nmckcomp,nmckdocno,'1',nmckcomp,nmck103, ",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        nmck101,'','' ", #190802-00035#3 mod nmck101 #交易单据汇率
                     "   FROM nmck_t ",
                     "  WHERE nmckent = ",g_enterprise,
                     "    AND nmckcomp = '",lc_param.glaacomp,"' AND nmckdocno = '",lc_param.xmab003,"'",
                     "  ORDER BY nmckdocno"      
      #190902-00032#5---add---end---      
      WHEN 'P9' 
         LET g_sql = " SELECT nmckcomp,nmckdocno,'1',nmckcomp,nmck103, ",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1  
                     "        nmck101,'','' ", #190802-00035#3 mod nmck101 #交易单据汇率
                     "   FROM nmck_t ",
                     "  WHERE nmckent = ",g_enterprise,
                     "    AND nmckcomp = '",lc_param.glaacomp,"' AND nmckdocno = '",lc_param.xmab003,"'",
                     "  ORDER BY nmckdocno"               
      
      
      WHEN 'S5'         #應收帳款--出貨
         LET l_sql = " SELECT xrcborga,xrcbdocno,xrcbseq,xrcborga,xrcb105,",
                     "        xrcb006,xrcb007,xrcb002,xrcb003,xrca100,",
                     "        xmdk017,xmdl024,xmdl025,'',''",
                     "   FROM xrca_t,xrcb_t,xmdl_t,xmdk_t",
                     "  WHERE xrcbent = ",g_enterprise,
                     "    AND xrcbld  = '",lc_param.glaald,"' AND  xrcbdocno = '",lc_param.xmab003,"'",
                     "    AND xrcbent = xmdlent AND xrcb002 = xmdldocno AND xrcb003 = xmdlseq",
                     "    AND xrcbent = xrcaent AND xrcbld  = xrcald    AND xrcbdocno =xrcadocno",
                     "    AND xmdkent = xmdlent AND xmdldocno = xmdkdocno"
         LET g_sql = " SELECT xrcacomp,xrcadocno,'1',xrcacomp, ",
                     "        (SELECT SUM(xrcc108-xrcc109) FROM xrcc_t WHERE xrccent = ",g_enterprise," AND xrccld = '",lc_param.glaald,"' AND xrccdocno = '",lc_param.xmab003,"') AS xrcc108,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        xrca101,'','' ", #190802-00035#3 mod xrca101 #交易单据汇率
                     "   FROM xrca_t ",
                     "  WHERE xrcaent = ",g_enterprise,
                     "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY xrcadocno"
      WHEN 'S6'         #應收帳款--待抵
         LET l_sql = " SELECT xrcborga,xrcbdocno,xrcbseq,xrcborga,xrcb105,",
                     "        xrcb006,xrcb007,xrcb002,xrcb003,xrca100,",
                     "        xmdk017,xmdl024,xmdl025,'','' ",
                     "   FROM xrca_t,xrcb_t,xmdl_t,xmdk_t",
                     "  WHERE xrcbent = ",g_enterprise,
                     "    AND xrcbld  = '",lc_param.glaald,"' AND  xrcbdocno = '",lc_param.xmab003,"'",
                     "    AND xrcbent = xmdlent AND xrcb002 = xmdldocno AND xrcb003 = xmdlseq",
                     "    AND xrcbent = xrcaent AND xrcbld  = xrcald    AND xrcbdocno =xrcadocno",
                     "    AND xmdkent = xmdlent AND xmdldocno = xmdkdocno"

         #add by 06189 #170324-00046#2(S)   
         #anmt540產生應收溢收單axrq343時,信用額度由S8轉至S6,取消確認時,信用額度由S6轉回S8         
         IF g_prog MATCHES 'anmt540*' THEN         
            #因为anmt540按照交易对象，收款币别，汇率进行拆单，所以用axrq343的交易对象，收款币别，汇率去抓取anmt540的项次
            LET l_sql = " SELECT xrcborga,xrcbdocno,xrcbseq,xrcborga,nmbb006,",
                        "        xrcb006,xrcb007,nmbbdocno,nmbbseq,xrca100,",
                        "        nmbb005,nmbb006,'','','' ",
                        "   FROM xrca_t,xrcb_t,nmba_t,nmbb_t",
                        "  WHERE xrcbent = ",g_enterprise,
                        "    AND xrcald  = '",lc_param.glaald,"' AND  xrcadocno = '",lc_param.xmab003,"'",
                        "    AND nmbb075 = xrcadocno ", #190802-00035#3 add  
                        "    AND xrcbent = nmbaent AND xrcb002 = nmbadocno ",
                        "    AND nmbb026 = xrca004 AND xrca100 = nmbb004 AND xrca101 = nmbb005",
                        "    AND nmbaent = nmbbent AND nmbbcomp = nmbacomp AND nmbbdocno =nmbadocno",
                        "    AND xrcbent = xrcaent AND xrcbld  = xrcald    AND xrcbdocno =xrcadocno"
         END IF               
         #add by 06189 #170324-00046#2(E)    
         
         LET g_sql = " SELECT xrcacomp,xrcadocno,'1',xrcacomp, ",
                     "        (SELECT SUM(xrcc108-xrcc109) FROM xrcc_t WHERE xrccent = ",g_enterprise," AND xrccld = '",lc_param.glaald,"' AND xrccdocno = '",lc_param.xmab003,"') AS xrcc108,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        xrca101,'','' ", #190802-00035#3 mod xrca101 #交易单据汇率
                     "   FROM xrca_t ",
                     "  WHERE xrcaent = ",g_enterprise,
                     "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY xrcadocno"
         #190802-00035#3 add(s)
         IF g_prog MATCHES 'axrt310' OR g_prog MATCHES 'axrp137' OR g_prog MATCHES 'axrp300' OR g_prog MATCHES 'axrp310' THEN
            LET g_sql = " SELECT xrcacomp,xrcadocno,'1',xrcacomp, ",
                     "        (SELECT SUM(xrcc108) FROM xrcc_t WHERE xrccent = ",g_enterprise," AND xrccld = '",lc_param.glaald,"' AND xrccdocno = (SELECT xrca018 FROM xrca_t WHERE xrcaent=",g_enterprise," AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"')) AS xrcc108,",
                     "        '',1,'','','', ",#190802-00035#3 mod #计价数量给值=1
                     "        xrca101,'','' ", #190802-00035#3 mod xrca101 #交易单据汇率
                     "   FROM xrca_t ",
                     "  WHERE xrcaent = ",g_enterprise,
                     "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY xrcadocno"
         END IF
         #190802-00035#3 add(e)             
      WHEN 'S7'
         LET l_sql = " SELECT xrcborga,xrcbdocno,xrcbseq,xrcborga,xrcb105,",
                     "        xrcb006,xrcb007,xrcb002,xrcb003,xrca100,",
                     "        xmdk017,xmdl024,xmdl025,'','' ",
                     "   FROM xrca_t,xrcb_t,xmdl_t,xmdk_t",
                     "  WHERE xrcbent = ",g_enterprise,
                     "    AND xrcbld  = '",lc_param.glaald,"' AND  xrcbdocno = '",lc_param.xmab003,"'",
                     "    AND xrcbent = xmdlent AND xrcb002 = xmdldocno AND xrcb003 = xmdlseq",
                     "    AND xrcbent = xrcaent AND xrcbld  = xrcald    AND xrcbdocno =xrcadocno",
                     "    AND xmdkent = xmdlent AND xmdldocno = xmdkdocno"
         LET g_sql = " SELECT xrcacomp,xrcadocno,'1',xrcacomp, ",
                     "        (SELECT SUM(xrcc108-xrcc109) FROM xrcc_t WHERE xrccent = ",g_enterprise," AND xrccld = '",lc_param.glaald,"' AND xrccdocno = '",lc_param.xmab003,"') AS xrcc108,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        xrca101,'','' ", #190802-00035#3 mod xrca101 #交易单据汇率
                     "   FROM xrca_t ",
                     "  WHERE xrcaent = ",g_enterprise,
                     "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'",
                     "  ORDER BY xrcadocno"
      WHEN 'S8' 
         LET g_sql = " SELECT nmbbcomp,nmbbdocno,nmbbseq,nmbbcomp,nmbb057,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        nmbb005,'','' ",  #190802-00035#3 mod nmbb005 #交易单据汇率
                     "   FROM nmbb_t ",
                     "  WHERE nmbbent = ",g_enterprise,
                     "    AND nmbbcomp = '",lc_param.glaacomp,"'",
                     "    AND nmbbdocno = '",lc_param.xmab003,"' AND nmbbseq = ",lc_param.xmab004,
                    #"    AND nmbb029 IN ('10','20','30','40','70') "  #180802-00036#1 mark
                     "    AND nmbb029 IN ('10','20','30','40','70','50','60','80','90','92','ZZ') "  #180802-00036#1 add
      WHEN 'S9' 
         LET g_sql = " SELECT nmbbcomp,nmbbdocno,nmbbseq,nmbbcomp,nmbb057,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        nmbb005,'','' ", #190802-00035#3 mod nmbb005 #交易单据汇率
                     "   FROM nmbb_t ",
                     "  WHERE nmbbent = ",g_enterprise,
                     "    AND nmbbcomp = '",lc_param.glaacomp,"'",
                     "    AND nmbbdocno = '",lc_param.xmab003,"' AND nmbbseq = ",lc_param.xmab004,
                     "    AND nmbb029 ='30'"
      #180320-00022#1 add--s
      WHEN 'S91' 
         LET g_sql = " SELECT xrgacomp,xrgadocno,0,xrgacomp,xrga103,",
                     "        '',1,'','','', ", #190802-00035#3 mod #计价数量给值=1
                     "        xrga101,'','' ",  #190802-00035#3 mod xrga101 #交易单据汇率
                     "   FROM xrga_t ",
                     "  WHERE xrgaent = ",g_enterprise,
                     "    AND xrgacomp = '",lc_param.glaacomp,"'",
                     "    AND xrgadocno = '",lc_param.xmab003,"' "
      #180320-00022#1 add--e
      WHEN '##'   #只沖不立
           CASE lc_param.proj_o
                WHEN 'P5'  #沖應付帳款
                     LET l_sql = " SELECT apcecomp,'','',apcecomp,'',",
                                 "        '',1,apce003,'1',apce100,",
                                 "        apce101,apce109,'',apce038,apce002",
                                 "   FROM apce_t ",
                                 "  WHERE apceent = ",g_enterprise,
                                 "    AND apceld= '",lc_param.glaald,"' AND apcedocno = '",lc_param.xmab003,"'"
                     SELECT COUNT(1) INTO l_cnt
                       FROM apda_t 
                      WHERE apdaent = g_enterprise
                        AND apdald = lc_param.glaald AND apdadocno =lc_param.xmab003
                     IF l_cnt > 0 THEN
                        LET g_sql = " SELECT apdacomp,'','',apdacomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM apda_t ",
                                    "  WHERE apdaent = ",g_enterprise,
                                    "    AND apdald = '",lc_param.glaald,"' AND apdadocno = '",lc_param.xmab003,"'"
                     ELSE
                        LET g_sql = " SELECT apcacomp,'','',apcacomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM apca_t ",
                                    "  WHERE apcaent = ",g_enterprise,
                                    "    AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"'"
                     END IF          
                #190902-00032#5---add---start--- 
                WHEN 'P8'  #已付款未沖銷   
                     LET l_sql = " SELECT apdecomp,'','',apdecomp,'',",
                                 "        '',1,apde003,apde004,apde100,",    
                                 "        apde101,apde109,'',apde038,apde002",
                                 "   FROM apde_t ",
                                 "  WHERE apdeent = ",g_enterprise,
                                 "    AND apdeld  = '",lc_param.glaald,"' AND apdedocno = '",lc_param.xmab003,"'",
                                 "    AND apde006 IN ('10','20','30','40','70','50','60','80','90','92','ZZ') ",
                                 "    AND apde006 IS NOT NULL",
                                 "    AND apde021 IN (SELECT ooia001 FROM ooia_t ",
                                 "                     WHERE ooia002 IN('10','20','30','40','70','50','60','80','90','92','ZZ') ",
                                 "                       AND ooiaent = ",g_enterprise," )" 
                     
                     #IF g_prog MATCHES 'aapt300*' OR g_prog MATCHES 'aapt310*' OR g_prog MATCHES 'aapt330*' THEN     #191225-00029#2 mark
                     #191225-00029#2---add---start---
                     IF g_prog MATCHES 'aapt300*' OR g_prog MATCHES 'aapt301*' OR            
                        g_prog MATCHES 'aapt310*' OR g_prog MATCHES 'aapt330*' OR                                 
                        g_prog MATCHES 'aapt331*'THEN 
                     #191225-00029#2---add---end---   
                        LET g_sql = " SELECT apcacomp,'','',apcacomp,'', ",
                                 "        '','','','','', ",
                                 "        '','','' ",
                                 "   FROM apca_t ",
                                 "  WHERE apcaent = ",g_enterprise,
                                 "    AND apcald = '",lc_param.glaald,"' AND apcadocno = '",lc_param.xmab003,"'"
                     ELSE
                        LET g_sql = " SELECT apdacomp,'','',apdacomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM apda_t ",
                                    "  WHERE apdaent = ",g_enterprise,
                                    "    AND apdald = '",lc_param.glaald,"' AND apdadocno = '",lc_param.xmab003,"'"            
                     END IF 
                #190902-00032#5---add---end---      
                WHEN 'P9'  #沖未兌現應付票據
                     LET l_sql = " SELECT nmcicomp,'','',nmcicomp,'',",
                                 "        '',1,nmci003,'1',nmci100,",
                                 "        nmci101,nmci103,'','','' ",
                                 "   FROM nmci_t ",
                                 "  WHERE nmcient = ",g_enterprise,
                                 "    AND nmcicomp= '",lc_param.glaacomp,"'",
                                 "    AND nmcidocno = '",lc_param.xmab003,"' AND nmciseq = ",lc_param.xmab004
                                 
                     LET g_sql = " SELECT nmchcomp,'','',nmchcomp,'', ",
                                 "        '','','','','', ",
                                 "        '','','' ",
                                 "   FROM nmch_t ",
                                 "  WHERE nmchent = ",g_enterprise,
                                 "    AND nmchcomp = '",lc_param.glaacomp,"' AND nmchdocno = '",lc_param.xmab003,"'",
                                 "  ORDER BY nmchdocno"
                 WHEN 'S5' #沖應收帳款
                     LET l_sql = " SELECT xrcecomp,'','',xrcecomp,'',",
                                 "        '',1,xrce003,'1',xrce100,",
                                 "        xrce101,xrce109,'',xrce038,xrce002",
                                 "   FROM xrce_t ",
                                 "  WHERE xrceent = ",g_enterprise,
                                 "    AND xrceld= '",lc_param.glaald,"' AND xrcedocno = '",lc_param.xmab003,"'"
                     SELECT COUNT(1) INTO l_cnt
                       FROM xrda_t 
                      WHERE xrdaent = g_enterprise
                        AND xrdald = lc_param.glaald AND xrdadocno =lc_param.xmab003
                     IF l_cnt > 0 THEN
                        LET g_sql = " SELECT xrdacomp,'','',xrdacomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM xrda_t ",
                                    "  WHERE xrdaent = ",g_enterprise,
                                    "    AND xrdald = '",lc_param.glaald,"' AND xrdadocno = '",lc_param.xmab003,"'"
                     ELSE
                        LET g_sql = " SELECT xrcacomp,'','',xrcacomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM xrca_t ",
                                    "  WHERE xrcaent = ",g_enterprise,
                                    "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'"
                     END IF            
                     
                 WHEN 'S8' #沖已收款未沖銷
                     LET l_sql = " SELECT xrdecomp,'','',xrdecomp,'',",
                                 #"        '',1,xrde003,'1',xrde100,",       #170501-00004#1 mark 
                                 "        '',1,xrde003,xrde004,xrde100,",    #170501-00004#1 add  
                                 "        xrde101,xrde109,'',xrde038,xrde002",
                                 "   FROM xrde_t ",
                                 "  WHERE xrdeent = ",g_enterprise,
                                 "    AND xrdeld  = '",lc_param.glaald,"' AND xrdedocno = '",lc_param.xmab003,"'",
                                #"    AND xrde006 IN ('10','20','30','40','70') AND xrde006 IS NOT NULL ",                              #180802-00036#1 mark
                                 "    AND xrde006 IN ('10','20','30','40','70','50','60','80','90','92','ZZ') AND xrde006 IS NOT NULL", #180802-00036#1 add
                                 #"    AND xrde007 IN (SELECT ooia001 FROM ooia_t WHERE ((ooia001 = 'Y' AND ooia002 = '30') OR ooia002 IN('10','20','30','40','70')) AND ooiaent = ",g_enterprise," )" #180816-00046#1 mark
#                                 "    AND xrde007 IN (SELECT ooia001 FROM ooia_t WHERE ((ooia001 = 'Y' AND ooia002 = '30') OR ooia002 IN('10','20','30','40','70','50','60','80','90','92','ZZ')) AND ooiaent = ",g_enterprise," )" #180816-00046#1 add  #190409-00034#1 mark
                                 "    AND xrde007 IN (SELECT ooia001 FROM ooia_t WHERE ooia002 IN('10','20','30','40','70','50','60','80','90','92','ZZ') AND ooiaent = ",g_enterprise," )" #190409-00034#1 add
                                 #"    AND xrde003 NOT IN(SELECT xrgf010 FROM xrgf_t WHERE xrgfent =",g_enterprise, " AND xrgfcomp = xrdecomp)"  #180320-00022#1 add #180525-00008#1 mark
                                 #"    AND xrde003 NOT IN(SELECT xrgf010 FROM xrgf_t WHERE xrgfent =",g_enterprise, " AND xrgfcomp = xrdecomp AND xrgf010 IS NOT NULL )"  #180525-00008#1 mod     #180723-00001#1 mark
                     #180525-00008#1 add--s
                     IF g_prog MATCHES 'axrt300*' OR g_prog MATCHES 'axrt310*' OR g_prog MATCHES 'axrt330*' THEN 
                        LET l_sql = l_sql," AND xrdeseq = '",lc_param.xmab004,"' "  
                     END IF
                     #180525-00008#1 add--e
                     
                     LET g_sql = " SELECT xrdacomp,'','',xrdacomp,'', ",
                                 "        '','','','','', ",
                                 "        '','','' ",
                                 "   FROM xrda_t ",
                                 "  WHERE xrdaent = ",g_enterprise,
                                 "    AND xrdald = '",lc_param.glaald,"' AND xrdadocno = '",lc_param.xmab003,"'"
                     #180525-00008#1 add--s
                     IF g_prog MATCHES 'axrt300*' OR g_prog MATCHES 'axrt310*' OR g_prog MATCHES 'axrt330*' THEN
                        LET g_sql = " SELECT xrcacomp,'','',xrcacomp,'', ",
                                 "        '','','','','', ",
                                 "        '','','' ",
                                 "   FROM xrca_t ",
                                 "  WHERE xrcaent = ",g_enterprise,
                                 "    AND xrcald = '",lc_param.glaald,"' AND xrcadocno = '",lc_param.xmab003,"'"
                     END IF
                     #180525-00008#1 add--e
                 WHEN 'S9' #沖未兌現應收票據
                     LET l_sql = " SELECT nmcrcomp,'','',nmcrcomp,'',",
                                 "        '',1,nmcr003,nmcr009,nmcr100,",   #170915-00029#1--mod-- '1' ---> nmcr009 
                                 "        nmcr101,nmcr103,'','','' ",
                                 "   FROM nmcr_t ",
                                 "  WHERE nmcrent = ",g_enterprise,
                                 "    AND nmcrcomp= '",lc_param.glaacomp,"'",
                                 "    AND nmcrdocno = '",lc_param.xmab003,"' AND nmcrseq = ",lc_param.xmab004," "
                                 #"    AND nmcr003 NOT IN(SELECT xrgf010 FROM xrgf_t WHERE xrgfent =",g_enterprise," AND nmcrcomp = xrgfcomp)"  #180320-00022#1 add  #180525-00008#1 mark
                                 #"    AND nmcr003 NOT IN(SELECT xrgf010 FROM xrgf_t WHERE xrgfent =",g_enterprise," AND nmcrcomp = xrgfcomp AND xrgf010 IS NOT NULL )"   #180525-00008#1 mod   #180723-00001#1 mark
                                 
                     LET g_sql = " SELECT nmcqcomp,'','',nmcqcomp,'', ",
                                 "        '','','','','', ",
                                 "        '','','' ",
                                 "   FROM nmcq_t ",
                                 "  WHERE nmcqent = ",g_enterprise,
                                 "    AND nmcqcomp = '",lc_param.glaacomp,"' AND nmcqdocno = '",lc_param.xmab003,"'",
                                 "  ORDER BY nmcqdocno"
                 #180320-00022#1 add--s
                 WHEN 'S91' 
#                     IF g_prog MATCHES 'axrt400*' THEN                       #180723-00001#1 mark
                     IF g_prog MATCHES 'anmt540' THEN                         #180731-00060#1  add 
                        LET l_sql = " SELECT xrgfcomp,'','',xrgfcomp,'',",
                                    "        '',1,xrgf009,0,xrgf100, ", 
                                    #"        xrgf101,xmde109,'' ",               #180723-00001#1 mark
                                    "        xrgf101,nmbb006,'' ",                #180723-00001#1 add
                                    "   FROM xrgf_t ",
                                    #" LEFT JOIN xrde_t ON xrgfent = xrdeent AND xrgfcomp = xrdecomp AND xrgf010 = xrde003",       #180723-00001#1 mark
                                    #" LEFT JOIN xrda_t ON xrdaent = xrdeent AND xrdald = xrdeld AND xrdadocno = xrdedocno ",      #180723-00001#1 mark
                                    " LEFT JOIN nmbb_t ON xrgfent = nmbbent AND xrgfcomp = nmbbcomp AND xrgf010 = nmbbdocno",      #180723-00001#1 add
                                    " LEFT JOIN nmba_t ON nmbaent = nmbbent AND nmbadocno = nmbbdocno ",                           #180723-00001#1 add
                                    "  WHERE xrgfent = ",g_enterprise,
                                    "    AND xrgfcomp = '",lc_param.glaacomp,"'",
                                    "    AND xrgf010 = '",lc_param.xmab003,"'",
                                    #"    AND xrde006 IN ('10','20','30','40') ",          #180723-00001#1 mark
                                    "    AND nmbb028 IN (SELECT ooia001 FROM ooia_t WHERE ooiaent = ",g_enterprise," AND ooia002 IN  ('10','20','30','40','70')) ",  #180723-00001#1 add     
                                    #"    AND xrdastus <> 'X' "                #180723-00001#1 mark
                                    "    AND nmbastus <> 'X' "                 #180723-00001#1 add                      
                       #180723-00001#1 by 09505 mark --(S)--                                    
#                       END IF
#                       IF g_prog MATCHES 'anmt520*' THEN
#                          LET l_sql = " SELECT xrgfcomp,'','',xrgfcomp,'',",
#                                      "        '',1,xrgf009,0,xrgf100, ", 
#                                      "        xrgf101,nmcr103,'' ",
#                                      "   FROM xrgf_t ",
#                                      " LEFT JOIN nmcr_t ON xrgfent = nmcrent AND xrgfcomp = nmcrcomp AND xrgf010 = nmcr003",
#                                      " LEFT JOIN nmcq_t ON nmcqent = nmcrent AND nmcqcomp = nmcrcomp AND nmcqdocno = nmcrdocno ",
#                                      "  WHERE xrgfent = ",g_enterprise,
#                                      "    AND xrgfcomp = '",lc_param.glaacomp,"'",
#                                      "    AND xrgf010 = '",lc_param.xmab003,"'",
#                                      "    AND nmcq001 IN('4','5','6','7','8') ",
#                                      "    AND nmcqstus <> 'X' "                                    
#                       END IF                        
                       #180723-00001#1 by 09505 mark --(E)--  
                        LET g_sql = " SELECT xrgfcomp,'','',xrgfcomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM xrgf_t ",
                                    "  WHERE xrgfent = ",g_enterprise,
                                    "    AND xrgfcomp = '",lc_param.glaacomp,"'",
                                    "    AND xrgf010 = '",lc_param.xmab003,"'" 
                     #180731-00060#1  add --(S)-- 
                     ELSE
                        #当通过axrt530整单操作押汇入账生成缴款单，勾选‘同时生成收款核销单’时，产生的anmt540为直接复核状态
                        LET l_sql = " SELECT DISTINCT xrgfcomp,'','',xrgfcomp,'',",
                                    "        '',1,xrgf009,0,xrgf100, ", 
                                    "        xrgf101,xrgf103,'' ",              
                                    "   FROM xrgf_t ",                          
                                    "  WHERE xrgfent = ",g_enterprise,
                                    "    AND xrgfcomp = '",lc_param.glaacomp,"'",
                                    "    AND xrgfdocno = '",lc_param.xmab003,"'",                                    
                                    "    AND xrgfstus <> 'X' "                 
                                    
                        LET g_sql = " SELECT DISTINCT xrgfcomp,'','',xrgfcomp,'', ",
                                    "        '','','','','', ",
                                    "        '','','' ",
                                    "   FROM xrgf_t ",
                                    "  WHERE xrgfent = ",g_enterprise,
                                    "    AND xrgfcomp = '",lc_param.glaacomp,"'",
                                    "    AND xrgfdocno = '",lc_param.xmab003,"'" 
                    END IF
                    #180731-00060#1  add --(E)--  
                 #180320-00022#1 add--e
           END CASE
      #150518-00040-3
   END CASE   
   
   IF NOT cl_null(l_sql) THEN
      PREPARE s_credit_array_pr1 FROM l_sql
      DECLARE s_credit_array_cr1 CURSOR FOR s_credit_array_pr1
   END IF
   PREPARE s_credit_array_pr FROM g_sql
   DECLARE s_credit_array_cr CURSOR FOR s_credit_array_pr

   #160622-00003#1-s-add
  #LET g_sql = "SELECT COUNT(1) FROM pmab_t ",               #161110-00033#1  mark
   LET g_sql = "SELECT COUNT(pmabsite) FROM pmab_t ",        #161110-00033#1  add
               "  WHERE pmabent = ",g_enterprise,
               "    AND pmab001 = '",lc_param.xmab006,"'",
               "    AND pmabsite <> 'ALL' "
   DECLARE s_credit_pmab_p4 CURSOR FROM g_sql   
   #160622-00003#1-e-add  

   #160905-00020#1-s-add
    #LET g_sql = "SELECT DISTINCT xmab008,xmab012,xmab013,xmab019,xmab020 ",                               #170617-00552#1 mark
    #LET g_sql = "SELECT DISTINCT xmab008,xmab012,xmab013,xmab019,xmab020,nvl(xmab015,0)-nvl(xmab016,0) ",  #170617-00552#1 add  #170804-00048#1-mark
    #170804-00048#1-s-add 多抓xmab005(有可能跨據點)
    LET g_sql = "SELECT DISTINCT xmab005,xmab008,xmab012,xmab013,xmab019,xmab020,",   
                #數量-已沖銷，<0 表示超交，=0表示數量全沖銷完，這兩種狀況可以直接放全部的數量
                "       (CASE WHEN COALESCE(xmab015,0)-COALESCE(xmab016,0) <= 0 THEN COALESCE(xmab015,0) ",   
                "             ELSE COALESCE(xmab015,0)-COALESCE(xmab016,0) END ) num",
    #170804-00048#1-e-add
                "  FROM xmab_t ",
                " WHERE xmabent = ",g_enterprise,
                "   AND xmab001 = ? ",
                "   AND xmab003 = ? ",
                "   AND xmab004 = ? "#, #170804-00048#1-mark-','
                #"   AND xmab005 = ? "  #170804-00048#1-mark
    DECLARE s_credit_xmab_p1 CURSOR FROM g_sql   
    
    #201222-00022#1 add(s)
    LET l_sql = "   SELECT COUNT(1) FROM xrcd_t ",
                "    WHERE xrcdent = ? AND xrcd008 = 'Y' ",
                "      AND xrcddocno = ? AND xrcdseq = ? "
    DECLARE s_credit_xrcd_cnt CURSOR FROM l_sql
    #201222-00022#1 add(e)
    
    LET g_sql = "SELECT COUNT(1) FROM xmdh_t ",
                " WHERE xmdhent = ",g_enterprise,
                "   AND xmdhdocno = ? ",
                "   AND xmdhseq = ? ",
                "   AND nvl(xmdh016,0)-nvl(xmdh017,0) > 0 "
    DECLARE s_credit_xmdh_p1 CURSOR FROM g_sql 
    
    LET g_sql = "SELECT xmda015,xmda016,xmdcsite,xmdcdocno,xmdcseq, ",
                "       xmdc015,xmdc016,xmdcorga,nvl(xmdh016,0)-nvl(xmdh017,0) ",
                "      ,xmdh006,xmdh015,xmdh020 ",    #190924-00040#1 add
                "  FROM xmda_t,xmdc_t,xmdh_t ",
                " WHERE xmdaent = xmdcent AND xmdadocno = xmdcdocno ",
                "   AND xmdcent = xmdhent AND xmdcdocno = xmdh001 AND xmdcseq = xmdh002 ",
                "   AND xmdhent = ",g_enterprise,
                "   AND xmdhdocno = ? ",
                "   AND xmdhseq = ? ",
                "   AND nvl(xmdh016,0)-nvl(xmdh017,0) > 0 "
    DECLARE s_credit_xmdc_p1 CURSOR FROM g_sql               
   #160905-00020#1-e-add
   
   #190528-00020#1 add --s
   #取訂單資訊，因簽退走出通需將簽退量回寫訂單
   LET g_sql = "SELECT xmda015,xmda016,xmdcsite,xmdcdocno,xmdcseq, ",
                "       xmdc015,xmdc016,xmdcorga ",
                "  FROM xmda_t,xmdc_t,xmdh_t ",
                " WHERE xmdaent = xmdcent AND xmdadocno = xmdcdocno ",
                "   AND xmdcent = xmdhent AND xmdcdocno = xmdh001 AND xmdcseq = xmdh002 ",
                "   AND xmdhent = ",g_enterprise,
                "   AND xmdhdocno = ? ",
                "   AND xmdhseq = ? "
   DECLARE s_credit_xmdc_p2 CURSOR FROM g_sql
   #190528-00020#1 add --e
   
   #191104-00018#3-S add   
   
   LET g_sql =  "SELECT pmdl015,pmdl016,pmdnsite,pmdndocno,pmdnseq, ",
                "       pmdn015,pmdn016,pmdnorga ",
                "  FROM pmdl_t,pmdn_t,pmdt_t ",
                " WHERE pmdlent = pmdnent AND pmdldocno = pmdndocno ",
                "   AND pmdnent = pmdtent AND pmdndocno = pmdt001 AND pmdnseq = pmdt002 ",
                "   AND pmdtent = ",g_enterprise,
                "   AND pmdtdocno = ? ",
                "   AND pmdtseq = ? "
   DECLARE s_credit_pmds_p2 CURSOR FROM g_sql   
   #191104-00018#3-E add
   
  #161110-00033#1-s-mark 
  ##處理交易對象據點信用資料
  #LET g_sql = " SELECT pmabsite,pmab002,pmab003,pmab004,pmab005,pmab006 ",
  #            "   FROM pmab_t ",
  #            "  WHERE pmabent = ",g_enterprise,
  #            "    AND pmab001 = '",lc_param.xmab006,"'",
  #            "    AND (pmabsite = ? OR pmabsite = 'ALL') "
  ##           "    AND pmab002 IN ('2','3') "    #150812 polly mark  
  #161110-00033#1-e-mark
  #161110-00033#1-s-add
   LET g_sql = " SELECT b.pmabsite,b.pmab002,b.pmab003,b.pmab004,b.pmab005,b.pmab006 ",
               "  FROM pmab_t a,pmab_t b ",
               "  WHERE a.pmabent = ",g_enterprise,
               "    AND a.pmab001 = '",lc_param.xmab006,"'",
               #"    AND (a.pmabsite = ? OR a.pmabsite = 'ALL') ",  #181019-00053#1 mark
               "    AND a.pmabsite = ? ",                           #181019-00053#1 add
               "   AND a.pmabent = b.pmabent ",
               "   AND a.pmabsite = b.pmabsite ",
               "   AND a.pmab003 = b.pmab001 "  
  #161110-00033#1-e-add
   PREPARE s_credit_pmab_p1 FROM g_sql
   DECLARE s_credit_pmab_c1 CURSOR FOR s_credit_pmab_p1   
   
   #181019-00053#1 -S add
   #處理交易對象集團信用資料
   LET g_sql = " SELECT 'ALL',b.pmaa051,b.pmaa052,b.pmaa053,b.pmaa054,b.pmaa055 ",
               "  FROM pmaa_t a,pmaa_t b ",
               "  WHERE a.pmaaent = ",g_enterprise,
               "    AND a.pmaa001 = '",lc_param.xmab006,"'",
               "   AND a.pmaaent = b.pmaaent ",
               "   AND a.pmaa052 = b.pmaa001 "
   PREPARE s_credit_pmaa_p1 FROM g_sql
   #181019-00053#1 -E add
   
   INITIALIZE l_array.* TO NULL 
   #160721-00021#1---s
   CALL l_pmab_arr.clear()    
   
   #170810-00042#1 Mark By 06137  181102(S)
   #放到FOREACH外面，避免多次循环抓取
   #SELECT pmab005 INTO l_pmab005
   # FROM pmab_t
   #WHERE pmabent = g_enterprise
   #  AND pmab001 = lc_param.xmab006
   #  AND pmabsite = 'ALL'
   #160721-00021#1---e 
   #170810-00042#1 Mark By 06137  181102(E)  
    
   #170810-00042#1 Add By 06137  181102(S)  集團額度幣別由axmm201改取axmm200
   SELECT pmaa054 INTO l_pmab005
    FROM pmaa_t
   WHERE pmaaent = g_enterprise
     #AND pmaa001 = lc_param.xmab006 #190222-00025#1-mark
     #190222-00025#1-s-add
     #額度交易客戶有可能為別的客戶，要調整成此寫法
     AND pmaa001 = (SELECT pmaa052 FROM pmaa_t
                     WHERE pmaaent = g_enterprise
                       AND pmaa001 = lc_param.xmab006)
     #190222-00025#1-e-add
   #170810-00042#1 Add By 06137  181102(E)
   
   #190802-00035#4-S add
   IF cl_null(l_pmab005) THEN
      LET l_pmab005 = s_credit_get_currency('ALL')
   END IF    
   #190802-00035#4-E add

   #161110-00033#1-s-mark   
   #放到FOREACH外面，避免多次循环抓取
    LET l_sit_cnt = 0
    EXECUTE s_credit_pmab_p4 INTO l_sit_cnt 
   #161110-00033#1-s-mark  

#190802-00035#4-S add
   LET g_xmab003_t = ''    
   LET g_xmab004_t = ''    
   LET g_xmab005_t = ''
#190802-00035#4-E add

   FOREACH s_credit_array_cr INTO l_array.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:s_credit_array_cr' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF      
      IF cl_null(l_array.xmab009) THEN LET l_array.xmab009 = 0 END IF   #160104-00019#3

      #190802-00035#5-S add
      LET g_xmak001 = lc_param.proj
      LET g_xmak002 = l_array.xmab003
      LET g_xmak003 = l_array.xmab004
      #190802-00035#5-E add
      
     #160905-00020#1-s-add
      LET l_s_0060 = ''
      IF lc_param.proj = 'S3' AND lc_param.proj_o = 'S2' THEN
         CALL s_aooi200_get_slip(l_array.xmab003_o) RETURNING l_success,l_slip 
         LET l_s_0060 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0060') #出通轉出貨單控管D-BAS-0060
      END IF
      LET l_xmab015_o = l_array.xmab015    #先將數量備份
      LET l_xmab009_o = l_array.xmab009    #先將金額備份 #190722-00056#9 add
      
      #190528-00020#1 add --s
      IF l_xmdk000 = '5' THEN  
         LET l_xmdc007 = l_array.xmab015 #簽退走出通需將簽退量回寫訂單
         EXECUTE s_credit_xmdc_p2 USING l_array.xmab003_o,l_array.xmab004_o 
                  INTO l_xmda015,l_xmda016,l_xmdcsite,l_xmdcdocno,l_xmdcseq,l_xmdc015,l_xmdc016,l_xmdcorga
      ELSE
      #190528-00020#1 add --e
         #190722-00056#9 add --s
         IF l_xmdgstus = 'Q' THEN #出通單中止出貨
            LET l_cnt = 0
            #檢查是否有未出完的量，如果有的話，需回沖訂單
            EXECUTE s_credit_xmdh_p1 USING l_array.xmab003,l_array.xmab004 INTO l_cnt
            IF l_cnt > 0 THEN
               EXECUTE s_credit_xmdc_p1 USING l_array.xmab003,l_array.xmab004 
                  INTO l_xmda015,l_xmda016,l_xmdcsite,l_xmdcdocno,l_xmdcseq,l_xmdc015,l_xmdc016,l_xmdcorga,l_xmdc007,l_xmdh006,l_xmdh015,l_xmdh020  #190924-00040#1 add xmdh006,xmdh015,xmdh020                
               IF cl_null(l_xmdc007) THEN LET l_xmdc007 = 0 END IF 
              #190924-00040#1-S add
              #發貨單位和計價單位轉換
               CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdc007)
                      RETURNING l_success,l_xmdc007               
              #190924-00040#1-E add 
               LET l_array.xmab015 = l_xmdc007 * (-1) #更新S1的已沖數量
               LET l_amount = 0
               #CALL s_credit_get_amount(l_array.xmab005,l_xmab015_o,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o) #200310-00065#1 mark 
               CALL s_credit_get_amount(l_array.xmab005,l_array.xmab015,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o) #200310-00065#1 add 
                    RETURNING l_amount
               #LET l_array.xmab009 = (l_xmab009_o - l_amount) * (-1) #更新S2的xmac012  #200310-00065#1 mark
               LET l_array.xmab009 =  l_amount  #200310-00065#1 add
               LET l_xmab009_o = l_array.xmab009 #更新S1的已沖金額
            ELSE
               LET l_array.xmab015 = 0 #更新S1的已沖數量
               LET l_array.xmab009 = 0 #更新S2的xmac012
               LET l_xmab009_o = 0     #更新S1的已沖金額
            END IF
         ELSE
         #190722-00056#9 add --e
            IF l_s_0060 = '3' THEN
               LET l_cnt = 0
               #檢查是否有未出完的量，如果有的話，需回沖訂單
               EXECUTE s_credit_xmdh_p1 USING l_array.xmab003_o,l_array.xmab004_o INTO l_cnt
               IF l_cnt > 0 THEN
                  EXECUTE s_credit_xmdc_p1 USING l_array.xmab003_o,l_array.xmab004_o 
                     INTO l_xmda015,l_xmda016,l_xmdcsite,l_xmdcdocno,l_xmdcseq,l_xmdc015,l_xmdc016,l_xmdcorga,l_xmdc007,l_xmdh006,l_xmdh015,l_xmdh020  #190924-00040#1 add xmdh006,xmdh015,xmdh020                                 
                  IF cl_null(l_xmdc007) THEN LET l_xmdc007 = 0 END IF      
                 #190924-00040#1-S add
                 #發貨單位和計價單位轉換
                  CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdc007)
                         RETURNING l_success,l_xmdc007               
                 #190924-00040#1-E add                  
               ELSE
                  LET l_s_0060 = ''
               END IF
            END IF      
         END IF #190722-00056#9 add
      END IF  #190528-00020#1 add
      
     #160905-00020#1-s-add      
      
     #191104-00018#3-S add
      IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN
          LET l_pmdn007 = l_array.xmab015 #簽退走出通需將簽退量回寫訂單
          EXECUTE s_credit_pmds_p2 USING l_array.xmab003_o,l_array.xmab004_o 
                   INTO l_pmdl015,l_pmdl016,l_pmdnsite,l_pmdndocno,l_pmdnseq,l_pmdn015,l_pmdn016,l_pmdnorga   
      END IF                   
     #191104-00018#3-E add
      
      INITIALIZE l_pmab.* TO NULL 
      
      #160721-00021#1---s
      IF l_xmab018_t <> l_array.xmab018 OR cl_null(l_xmab018_t) THEN
         LET l_i = 1
         FOREACH s_credit_pmab_c1 USING l_array.xmab018 INTO l_pmab_arr[l_i].pmabsite,l_pmab_arr[l_i].pmab002,l_pmab_arr[l_i].pmab003,l_pmab_arr[l_i].pmab004,
                                                             l_pmab_arr[l_i].pmab005,l_pmab_arr[l_i].pmab006
            #170804-00048#1-s-add
            #額度幣別若為空，換抓aooi100的主幣別
            IF cl_null(l_pmab_arr[l_i].pmab005) THEN
               LET l_pmab_arr[l_i].pmab005 = s_credit_get_currency(l_pmab_arr[l_i].pmabsite)
               #170810-00042#1 Add By 06137  181102(S)
               IF cl_null(l_pmab_arr[l_i].pmab005) THEN
                  INITIALIZE g_errparam TO NULL    #據點報錯訊息
                  LET g_errparam.code = 'sub-01522'
                  LET g_errparam.extend = l_pmab_arr[l_i].pmabsite
                  LET g_errparam.popup = TRUE
                  CALL cl_err() 
                  LET r_success = FALSE
                  RETURN r_success                 
               END IF
               #170810-00042#1 Add By 06137  181102(E)
            END IF
            #170804-00048#1-e-add
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'foreach:s_credit_pmab_c1' 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            END IF
            LET l_i = l_i + 1
         END FOREACH
         #181019-00053#1 -S add
         EXECUTE s_credit_pmaa_p1 INTO l_pmab_arr[l_i].pmabsite,l_pmab_arr[l_i].pmab002,l_pmab_arr[l_i].pmab003,
                                       l_pmab_arr[l_i].pmab004,l_pmab_arr[l_i].pmab005,l_pmab_arr[l_i].pmab006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = 'EXECUTE s_credit_pmaa_p1' 
#            LET g_errparam.code   = SQLCA.sqlcode #190731-00022#1---mark
            LET g_errparam.code = "aap-01168"     #190731-00022#1---add
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
         #181019-00053#1 -E add
               
      END IF
      LET l_xmab018_t = l_array.xmab018
      
      #FOREACH s_credit_pmab_c1 USING l_array.xmab018 INTO l_pmab.pmabsite,l_pmab.pmab002,l_pmab.pmab003,l_pmab.pmab004,
      #                                                    l_pmab.pmab005,l_pmab.pmab006                                                  
      #   IF SQLCA.sqlcode THEN
      #      INITIALIZE g_errparam TO NULL 
      #      LET g_errparam.extend = 'foreach:s_credit_pmab_c1' 
      #      LET g_errparam.code   = SQLCA.sqlcode 
      #      LET g_errparam.popup  = TRUE 
      #      CALL cl_err()
      #      LET r_success = FALSE
      #      RETURN r_success
      #   END IF  
      FOR i = 1 TO l_pmab_arr.getLength()
         LET l_pmab.pmabsite = l_pmab_arr[i].pmabsite
         LET l_pmab.pmab002  = l_pmab_arr[i].pmab002
         LET l_pmab.pmab003  = l_pmab_arr[i].pmab003
         LET l_pmab.pmab004  = l_pmab_arr[i].pmab004
         LET l_pmab.pmab005  = l_pmab_arr[i].pmab005
         LET l_pmab.pmab006  = l_pmab_arr[i].pmab006
      #160721-00021#1---e   
        #161110-00033#1-s-mark  
        ##160807-00003#1 add---start---      
        #SELECT pmab002,pmab004,pmab005,pmab006                             #160922-00029#1 add pmab002
        #  INTO l_pmab.pmab002,l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006 #160922-00029#1 add pmab002
        #  FROM pmab_t
        # WHERE pmabent = g_enterprise
        #   AND pmab001 = l_pmab.pmab003
        #   AND pmabsite = l_pmab.pmabsite
        ##160807-00003#1 add---end---            
        #161110-00033#1-e-mark  
         IF cl_null(l_pmab.pmab003) THEN
            LET l_pmab.pmab003 = lc_param.xmab006 
         END IF  
         IF cl_null(l_pmab.pmab006) THEN
            LET l_pmab.pmab006 = 0
         END IF 
        #161110-00033#1-s-mark  
        ##160622-00003#1-s-add
        #LET l_sit_cnt = 0
        #EXECUTE s_credit_pmab_p4 INTO l_sit_cnt
        ##160622-00003#1-e-add 
        #161110-00033#1-s-mark          

####更新目前項目#### 
         IF lc_param.proj <> '##' THEN
            #更新餘額檔(xmac_t)IF lc_param.proj <> '##' THEN
            #170810-00042#1 Add By 06137  181102(S)
            #檢查據點、集團是否有設定aooi100的主幣別編號，無設定報錯離開
            LET l_ooef016 = ''
            CALL s_credit_get_currency(l_pmab_arr[l_i].pmabsite) RETURNING l_ooef016
            IF cl_null(l_ooef016) THEN
               IF l_pmab_arr[l_i].pmabsite = 'ALL' THEN  #集團報錯訊息
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-01523'
                  LET g_errparam.extend = l_pmab_arr[l_i].pmabsite
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               ELSE
                  INITIALIZE g_errparam TO NULL    #據點報錯訊息
                  LET g_errparam.code = 'sub-01522'
                  LET g_errparam.extend = l_pmab_arr[l_i].pmabsite
                  LET g_errparam.popup = TRUE
                  CALL cl_err() 
                  LET r_success = FALSE
                  RETURN r_success                  
               END IF
            END IF         
            #170810-00042#1 Add By 06137  181102(E)
           #IF l_pmab.pmab002 = '3' THEN          #3查核才需更新餘額檔   #190320-00023#1-mark
            IF l_pmab.pmab002 MATCHES '[23]' THEN #2.3查核才需更新餘額檔 #190320-00023#1-add
              
              #原S9是以xrde109為主 目前不處理
              #IF lc_param.proj = 'S9' THEN
              #   LET l_array.xmab009 = lc_param.xmab009    #以xrde109為主
              #END IF
              #150813--polly--add--(s)
              #信用額度採用匯率類型
              IF NOT cl_null(l_pmab.pmab005) THEN
                 CALL cl_get_para(g_enterprise,l_array.xmab005,'S-BAS-0013') RETURNING l_para_data
                #CALL s_aooi160_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange   #160906-00029#1 mark
                #190802-00035#4-S add 
                 LET lc_comb.scc40 = l_para_data
                 LET lc_comb.curr  = l_array.curr_o
                 LET lc_comb.rate  = l_array.rate_o
                 LET lc_comb.xmab001  = lc_param.proj         #200116-00002#1 add
                 LET ls_js = util.JSON.stringify(lc_comb)
                #190802-00035#4-E add 
                 #CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange   #160906-00029#1 add  #190802-00035#4 mark
                 CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_pmab.pmab005,0,ls_js) RETURNING l_exchange    #190802-00035#4 add
                 LET l_xmab.xmab013 = l_exchange
              END IF        
              #IF lc_param.proj = 'S3' AND l_xmdk002 = '4' THEN   #160926-00036#1 add 調撥出貨單不需更新S3餘額檔  #190802-00035#4 mark
             #IF (lc_param.proj = 'S3' AND l_xmdk002 = '4') OR (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') OR g_prog MATCHES 'axmt591*' THEN   #190802-00035#4 add 簽退單不需回寫xmac_t   #191104-00018#3 mark
              IF (lc_param.proj = 'S3' AND l_xmdk002 = '4') OR (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') OR g_prog MATCHES 'axmt591*' OR g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN   #191104-00018#3 add
              ELSE                                               #160926-00036#1 add
                 IF NOT s_credit_upd_xmac_count(l_array.xmab018,lc_param.xmab007,l_array.xmab009,lc_param.proj,'1',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_pmab.pmab005,l_pmab.pmab006,l_xmab.xmab013) THEN              
                    LET r_success = FALSE
                    RETURN r_success
                 END IF 
                 
                 
              END IF                                             #160926-00036#1 add   
            END IF
           #IF l_pmab.pmabsite <> 'ALL' THEN                                              #160622-00003#1 mark
            IF (l_pmab.pmabsite <> 'ALL') OR (l_pmab.pmabsite = 'ALL' AND l_sit_cnt = 0) THEN #160622-00003#1 add
               #IF l_pmab.pmab002 = '3' THEN    #3查核才需新增  #170329-00002#1 add   #170614-00037#1 mark
               #取消pmab002条件限制，都需写入信用明细档，
               #新增目前項目異動檔(xmab_t)
               INITIALIZE l_xmab TO NULL
               LET l_xmab.xmab003 = l_array.xmab003
               LET l_xmab.xmab004 = l_array.xmab004
               LET l_xmab.xmab005 = l_array.xmab005                       
               LET l_xmab.xmab009 = l_array.xmab009
               LET l_xmab.xmab014 = l_array.xmab014
               LET l_xmab.xmab015 = l_array.xmab015             
               IF lc_param.type = '1' THEN            
                  LET l_xmab.xmab001 = lc_param.proj
               #190802-00035#4-S 
                  IF g_prog MATCHES 'axmt590*' THEN
                     LET l_xmab.xmab001 = 'axmt590'
                  END IF 
                  IF g_prog MATCHES 'axmt591*' THEN
                     LET l_xmab.xmab001 = 'axmt591'
                  END IF                   
               #190802-00035#4-E   

               #191104-00018#3-S add
                  # 5.驗退單 apmt560  10.委外驗退單 apmt561  11.重覆性生產驗退 apmt563
                  IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN
                     LET l_xmab.xmab001 = 'apmt560'
                  END IF                
               #191104-00018#3-E add
               
                  SELECT xmaa004 INTO l_xmab.xmab002
                    FROM xmaa_t
                   WHERE xmaaent = g_enterprise
                     AND xmaa001 = l_pmab.pmab004
                     AND xmaa002 = lc_param.proj
                  IF cl_null(l_xmab.xmab002) THEN LET l_xmab.xmab002 = ' ' END IF
                  LET l_xmab.xmab006 = lc_param.xmab006
                  LET l_xmab.xmab007 = lc_param.xmab007
                  LET l_xmab.xmab008 = l_pmab.pmab003
                  IF lc_param.proj = 'S3' AND l_xmdk002 = '4' THEN   #160926-00036#1 add
                     LET l_xmab.xmab010 = l_xmab.xmab009             #160926-00036#1 add
                  ELSE                                               #160926-00036#1 add                                          
                     LET l_xmab.xmab010 = 0 
                  END IF                                             #160926-00036#1 add
                  LET l_xmab.xmab011 = g_today                 
                  LET l_xmab.xmab012 = l_pmab.pmab005
                  LET l_xmab.xmab013 = l_exchange #170618-00380#1 add 因前面會被清掉，所以再寫一次
                  #160721-00021#1--s
                  #SELECT pmab005 INTO l_xmab.xmab019
                  #  FROM pmab_t
                  # WHERE pmabent = g_enterprise
                  #   AND pmab001 = lc_param.xmab006
                  #   AND pmabsite = 'ALL'
                  LET l_xmab.xmab019 = l_pmab005
                  #160721-00021#1---e
                  #信用額度採用匯率類型
                  IF NOT cl_null(l_xmab.xmab012) THEN
                     CALL cl_get_para(g_enterprise,l_xmab.xmab005,'S-BAS-0013') RETURNING l_para_data
                    #CALL s_aooi160_get_exrate('1',l_xmab.xmab005,g_today,l_xmab.xmab007,l_xmab.xmab012,0,l_para_data) RETURNING l_exchange    #160906-00029#1 mark
                    #CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange  #160906-00029#1 add 170804-00048#1-mark
                    #CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_xmab.xmab012,0,l_para_data) RETURNING l_exchange #170804-00048#1-add 應該用據點幣別  #190802-00035#4 mark
                    #190802-00035#4-S add 
                     LET lc_comb.scc40 = l_para_data
                     LET lc_comb.curr  = l_array.curr_o
                     LET lc_comb.rate  = l_array.rate_o
                     LET lc_comb.xmab001  = lc_param.proj         #200116-00002#1 add
                     LET ls_js = util.JSON.stringify(lc_comb)
                    #190802-00035#4-E add 
                     CALL s_credit_get_exrate('1',l_array.xmab005,l_xmab.xmab011,lc_param.xmab007,l_xmab.xmab012,0,ls_js) RETURNING l_exchange    #190802-00035#4 add
                     LET l_xmab.xmab013 = l_exchange #170804-00048#1-add 重取完後，應該在重新給xmab013的值，避免取到舊值
                  END IF
                  IF NOT cl_null(l_xmab.xmab019) THEN    
                   IF NOT cl_null(l_pmab.pmab005) THEN#170614-00037#1   add                   
                     CALL cl_get_para(g_enterprise,l_xmab.xmab005,'S-BAS-0013') RETURNING l_para_data
                    #CALL s_aooi160_get_exrate('1',l_xmab.xmab005,g_today,l_xmab.xmab007,l_xmab.xmab019,0,l_para_data) RETURNING l_exchange    #160906-00029#1 mark
                    #CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_pmab.pmab005,0,l_para_data) RETURNING l_exchange  #160906-00029#1 add  #170804-00048#1-mark
                    #CALL s_credit_get_exrate('1',l_array.xmab005,g_today,lc_param.xmab007,l_xmab.xmab019,0,l_para_data) RETURNING l_exchange  #170804-00048#1-add 應該用集團幣別  #190802-00035#4 mark
                    #190802-00035#4-S add 
                     LET lc_comb.scc40 = l_para_data
                     LET lc_comb.curr  = l_array.curr_o
                     LET lc_comb.rate  = l_array.rate_o
                     LET lc_comb.xmab001  = lc_param.proj         #200116-00002#1 add
                     LET ls_js = util.JSON.stringify(lc_comb)
                    #190802-00035#4-E add 
                     CALL s_credit_get_exrate('1',l_array.xmab005,l_xmab.xmab011,lc_param.xmab007,l_xmab.xmab019,0,ls_js) RETURNING l_exchange   #190802-00035#4 add
                     LET l_xmab.xmab020 = l_exchange
                   END IF                      #170614-00037#1   add 
                  END IF                  
                  LET l_xmab.xmab016 = 0 
                  LET l_xmab.xmab017 = 'N'
                  LET l_xmab.xmab018 = l_array.xmab018
                  #190103-00038#1-s-add
                  IF g_prog MATCHES 'axmt510*' THEN
                     LET l_cnt = 0
                     SELECT COUNT(1) INTO l_cnt
                       FROM xmab_t
                      WHERE xmabent = g_enterprise
                        AND xmab001 = l_xmab.xmab001 AND xmab003 = l_xmab.xmab003
                        AND xmab004 = l_xmab.xmab004
                        AND xmab005 = l_xmab.xmab005
                     IF l_cnt > 0 THEN
                     #1-2.回寫已沖銷數量(xmab016)時，增加判斷
                     #    ###當訂單/採購單使用ckd/skd時，因為數量拆分的關系回寫已沖銷數量會虛增，故改使用最小套數回寫
                     #    IF 為沖銷項目=訂單(S1) and 子特性(xmdc019)='2,3' THEN
                     #       IF 走出通 then
                     #          已沖銷數量 = 最小出通套數，可參考s_axmt500_count_min_xmdd014
                     #       ELSE (不走出通) then
                     #          已沖銷數量 = 最小出貨套數，可參考s_axmt500_count_min_xmdd014
                     #       END IF 
                     #    END IF
                     #    IF 為沖銷項目=採購單(P1) and 子特性(pmdn019)='2,3' THEN
                     #       已沖銷數量 = 最小出通套數，可參考s_apmt500_count_min_pmdo015
                     #    END IF                  
                     #190802-00035#4-S add 
#                        IF l_xmab.xmab001 = 'S1' THEN 
#                           SELECT DISTINCT xmdc019,xmdgdocno INTO l_xmdc019,l_xmdgdocno FROM xmdc_t 
#                             LEFT OUTER JOIN xmdg_t ON xmdgent = xmdcent AND xmdg004 = xmdcdocno
#                            WHERE xmdcent = g_enterprise
#                              AND xmdcdocno = l_xmab.xmab003
#                              AND xmdcseq = l_xmab.xmab004
#                           IF l_xmdc019 MATCHES '[23]' THEN  #1.一般,2.CKD,3.SKD
#                              #出通單
#                              IF NOT cl_null(l_xmdgdocno) THEN 
#                                 CALL s_axmt500_count_min_xmdd014(l_xmab.xmab003,l_xmab.xmab004,'1',l_xmab.xmab005,'1')
#                                    RETURNING l_xmab.xmab016,l_success
#                              #出貨單      
#                              ELSE
#                                 CALL s_axmt500_count_min_xmdd014(l_xmab.xmab003,l_xmab.xmab004,'2',l_xmab.xmab005,'1')
#                                    RETURNING l_xmab.xmab016,l_success                              
#                              END IF                              
#                           END IF 
#                        END IF 
#
#                        IF l_xmab.xmab001 = 'P1' THEN                         
#                           SELECT DISTINCT pmdn019 INTO l_pmdn019 FROM pmdn_t 
#                            WHERE pmdnent = g_enterprise
#                              AND pmdndocno = l_xmab.xmab003
#                              AND pmdnseq = l_xmab.xmab004
#                           IF l_pmdn019 MATCHES '[23]' THEN 
#                              CALL s_apmt500_count_min_pmdo015(l_xmab.xmab003,l_xmab.xmab004) 
#                                 RETURNING l_xmab.xmab016,l_success 
#                           END IF                            
#                        END IF                         
#                     #190802-00035#4-E add 
                     
                     
                        #xmab_t資料存在，更新資料
                        UPDATE xmab_t
                           SET xmab006 = l_xmab.xmab006,xmab007 = l_xmab.xmab007,xmab008 = l_xmab.xmab008,
                               #xmab009 = l_xmab.xmab009,xmab010 = l_xmab.xmab010,xmab011 = l_xmab.xmab011,  #190603-00014#1 mark
                               #xmab009 = l_xmab.xmab009,xmab011 = l_xmab.xmab011,  #190603-00014#1 add      #190802-00035#4 mark
                               xmab009 = l_xmab.xmab009, #190802-00035#4 add
                               xmab012 = l_xmab.xmab012,xmab013 = l_xmab.xmab013,xmab014 = l_xmab.xmab014,
                               xmab015 = l_xmab.xmab015,xmab016 = l_xmab.xmab016,xmab017 = l_xmab.xmab017,
                               xmab018 = l_xmab.xmab018,xmab019 = l_xmab.xmab019,xmab020 = l_xmab.xmab020
                         WHERE xmabent = g_enterprise
                           AND xmab001 = l_xmab.xmab001 AND xmab003 = l_xmab.xmab003
                           AND xmab004 = l_xmab.xmab004
                           AND xmab005 = l_xmab.xmab005      
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.extend = 'UPDATE xmab_t'
                           LET g_errparam.code   = SQLCA.sqlcode
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET r_success = FALSE
                           RETURN r_success
                        END IF
                     ELSE
                        #xmab_t資料不存在，新增資料
                        #190802-00035#4-S add
                        LET l_xmab.xmab002 = ' '   
                        LET l_xmab.xmab021 = ''
                        SELECT pmaa052 INTO l_xmab.xmab021 FROM pmaa_t 
                         WHERE pmaaent = g_enterprise
                           AND pmaa001 = l_xmab.xmab006
                        LET l_xmab.xmab022 = 'N'  
                        LET l_xmab.xmab023 = l_array.rate_o               
                        #190802-00035#4-E add                        
                        INSERT INTO xmab_t(xmabent,xmab001,xmab002,xmab003,xmab004,
                                           xmab005,xmab006,xmab007,xmab008,xmab009,
                                           xmab010,xmab011,xmab012,xmab013,xmab014,
                                           xmab015,xmab016,xmab017,xmab018,xmab019,xmab020,xmab021,xmab022,xmab023)  #190802-00035#4 add xmab021
                                    VALUES(  g_enterprise,l_xmab.xmab001,l_xmab.xmab002,l_xmab.xmab003,l_xmab.xmab004,
                                           l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
                                           l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab014,
                                           l_xmab.xmab015,l_xmab.xmab016,l_xmab.xmab017,l_xmab.xmab018,l_xmab.xmab019,
                                           l_xmab.xmab020,l_xmab.xmab021,l_xmab.xmab022,l_xmab.xmab023) #190802-00035#4 add xmab021
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.extend = 'INSERT xmab_t'
                           LET g_errparam.code   = SQLCA.sqlcode
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET r_success = FALSE
                           RETURN r_success
                        END IF
                        
                        #1-1.信用額度建立目前項目並沖銷前置項目時，增加寫入xmak_t
                        #	xmakent(企業編號)=xmabent
                        #	xmak001(計算項目)=xmab001
                        #	xmak002(單據編號)=xmab003
                        #	xmak003(單據項次)=xmab004
                        #	xmak004(沖銷計算項目)=沖銷項目
                        #	xmak005(沖銷單據編號)=沖銷單號
                        #	xmak006(沖銷單據項次)=沖銷項次
                        #	xmak007(沖銷金額)=此次沖銷金額
                        #	xmak008(沖銷數量)=xmab015
                        #	xmak009(沖銷結案否)="N"
                        #	xmak010(沖銷建立日期)=xmab011  

                        #190802-00035#4-S add
                        LET l_xmak.xmakent = g_enterprise
                        LET l_xmak.xmak001 = l_xmab.xmab001
                        LET l_xmak.xmak002 = l_xmab.xmab003
                        LET l_xmak.xmak003 = l_xmab.xmab004
                        LET l_xmak.xmak004 = lc_param.proj_o   #沖銷項目
                        LET l_xmak.xmak005 = l_array.xmab003_o #沖銷單號
                        LET l_xmak.xmak006 = l_array.xmab004_o #沖銷項次
                        LET l_xmak.xmak007 = l_array.xmab009
                        LET l_xmak.xmak008 = l_xmab.xmab015
                        LET l_xmak.xmak009 = 'N'
                        LET l_xmak.xmak010 = l_xmab.xmab011  
                        IF cl_null(l_xmak.xmak004) THEN LET l_xmak.xmak004 = ' ' END IF
                        IF cl_null(l_xmak.xmak005) THEN LET l_xmak.xmak005 = ' ' END IF
                        IF cl_null(l_xmak.xmak006) THEN LET l_xmak.xmak006 = 0   END IF
                        
                        INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                           xmak006,xmak007,xmak008,xmak009,xmak010)
                                    VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                           l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                      
                        IF SQLCA.SQLCODE THEN
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = "ins xmak_t:" 
                           LET g_errparam.code   = SQLCA.sqlcode
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET r_success = FALSE
                           RETURN r_success
                        END IF                     
                        #190802-00035#4-E add     
                     
                     END IF
                  ELSE
                  #190103-00038#1-e-add
                     #190722-00056#9 add --s
                     IF l_xmdgstus = 'Q' THEN
                        UPDATE xmab_t
                           #200109-00032#1 -S mark
                           #SET xmab009 = xmab010,
                           #    xmab015 = xmab016
                           #200109-00032#1 -E mark
                           #200109-00032#1 -S add
                           SET xmab009 = (SELECT xmdh027 FROM xmdh_t WHERE xmdhent = g_enterprise AND xmdhdocno = l_xmab.xmab003 AND xmdhseq = l_xmab.xmab004),
                               xmab015 = (SELECT xmdh017 FROM xmdh_t WHERE xmdhent = g_enterprise AND xmdhdocno = l_xmab.xmab003 AND xmdhseq = l_xmab.xmab004)
                           #200109-00032#1 -E add
                         WHERE xmabent = g_enterprise
                           AND xmab001 = l_xmab.xmab001 
                           AND xmab003 = l_xmab.xmab003
                           AND xmab004 = l_xmab.xmab004
                           AND xmab005 = l_xmab.xmab005      
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.extend = 'UPDATE xmab_t'
                           LET g_errparam.code   = SQLCA.sqlcode
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET r_success = FALSE
                           RETURN r_success
                        END IF
                        
                       #更新xmak_t(xmak007/xmak008)  
                       #190802-00035#3-S add 

                       
                       #190802-00035#3-E add  
                     ELSE
                     #190722-00056#9 add --e
                        #--151104--polly--add--(s)
                        DELETE FROM xmab_t
                         WHERE xmabent = g_enterprise
                           AND xmab001 = l_xmab.xmab001
                          #AND xmab002 = l_xmab.xmab002   #160926-00001#1 mark
                           AND xmab003 = l_xmab.xmab003
                           AND xmab004 = l_xmab.xmab004
                           AND xmab005 = l_xmab.xmab005
                           AND EXISTS (SELECT 1 FROM xmab_t
                                        WHERE xmabent = g_enterprise
                                          AND xmab001 = l_xmab.xmab001
                                        # AND xmab002 = l_xmab.xmab002   #160926-00001#1 mark
                                          AND xmab003 = l_xmab.xmab003
                                          AND xmab004 = l_xmab.xmab004
                                          AND xmab005 = l_xmab.xmab005) 
                        #--151104--polly--add--(e)
                        #190802-00035#4-S add
                        DELETE FROM xmak_t 
                         WHERE xmakent = g_enterprise
                           AND xmak001 = l_xmab.xmab001
                           AND xmak002 = l_xmab.xmab003
                           AND xmak003 = l_xmab.xmab004
                        #190802-00035#4-E add                        
                       #IF lc_param.proj <> 'S9' THEN    #20150914 S9修正
                        #190802-00035#4-S add
                        LET l_xmab.xmab002 = ' '   
                        LET l_xmab.xmab021 = ''
                        SELECT pmaa052 INTO l_xmab.xmab021 FROM pmaa_t 
                         WHERE pmaaent = g_enterprise
                           AND pmaa001 = l_xmab.xmab006
                        LET l_xmab.xmab022 = 'N'  

                        IF g_prog MATCHES 'axmt590*' OR g_prog MATCHES 'axmt591*' THEN
                           LET l_xmab.xmab010 = l_xmab.xmab009
                           LET l_xmab.xmab016 = l_xmab.xmab015
                        END IF 
                        LET l_xmab.xmab023 = l_array.rate_o                          
                        #190802-00035#4-E add 
                        
                        #191104-00018#3-S add
                        IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN
                           LET l_xmab.xmab010 = l_xmab.xmab009
                           LET l_xmab.xmab016 = l_xmab.xmab015
                        END IF 
                        #191104-00018#3-E add
                        
                        #190802-00035#3 add s---
                        IF g_prog MATCHES 'axrt310*' OR g_prog MATCHES 'aapt310*' 
                        OR g_prog MATCHES 'axrt300*' OR g_prog MATCHES 'aapt300*'
                        OR g_prog MATCHES 'axrt330*' OR g_prog MATCHES 'aapt330*' 
                        OR g_prog MATCHES 'axrt400*' OR g_prog MATCHES 'aapt301*' OR g_prog MATCHES 'aapt420*'  THEN
                           IF l_xmab.xmab010 = l_xmab.xmab009 AND l_xmab.xmab009 = 0 THEN  #但订金预收单当前单据全部收款，应收金额=0时，应xmab016,xmab022同步更新
                              LET l_xmab.xmab016 = 1
                              LET l_xmab.xmab022 = 'Y'
                           END IF
                        END IF
                        #190802-00035#4 add e---
                        
                        INSERT INTO xmab_t(xmabent,xmab001,xmab002,xmab003,xmab004,
                                           xmab005,xmab006,xmab007,xmab008,xmab009,
                                           xmab010,xmab011,xmab012,xmab013,xmab014,
                                           xmab015,xmab016,xmab017,xmab018,xmab019,xmab020,xmab021,xmab022,xmab023)    #190802-00035#4 add xmab021 
                                    VALUES(  g_enterprise,l_xmab.xmab001,l_xmab.xmab002,l_xmab.xmab003,l_xmab.xmab004,
                                           l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
                                           l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab014,
                                           l_xmab.xmab015,l_xmab.xmab016,l_xmab.xmab017,l_xmab.xmab018,l_xmab.xmab019,
                                           l_xmab.xmab020,l_xmab.xmab021,l_xmab.xmab022,l_xmab.xmab023) #190802-00035#4 add xmab021 
                        #20150914 S9修正--(S)
                        #ELSE
                        #   SELECT COUNT(1) INTO l_cnt
                        #     FROM xmab_t
                        #    WHERE xmabent = g_enterprise 
                        #      AND xmab001 = l_xmab.xmab001 AND xmab002 = l_xmab.xmab002
                        #      AND xmab003 = l_xmab.xmab003 AND xmab004 = l_xmab.xmab004
                        #      AND xmab005 = l_xmab.xmab005
                        #   IF l_cnt > 0 THEN
                        #      #UPDATE xmab_t SET xmab009 = xmab009 + l_array.xmab009
                        #      # WHERE xmabent = g_enterprise 
                        #      #   AND xmab001 = l_xmab.xmab001 AND xmab002 = l_xmab.xmab002
                        #      #   AND xmab003 = l_xmab.xmab003 AND xmab004 = l_xmab.xmab004
                        #      #   AND xmab005 = l_xmab.xmab005
                        #   ELSE
                        #      #沒有資料才新增
                        #      INSERT INTO xmab_t(xmabent,xmab001,xmab002,xmab003,xmab004,
                        #                      xmab005,xmab006,xmab007,xmab008,xmab009,
                        #                      xmab010,xmab011,xmab012,xmab013,xmab014,
                        #                      xmab015,xmab016,xmab017,xmab018,xmab019,xmab020)
                        #               VALUES(  g_enterprise,l_xmab.xmab001,l_xmab.xmab002,l_xmab.xmab003,l_xmab.xmab004,
                        #                      l_xmab.xmab005,l_xmab.xmab006,l_xmab.xmab007,l_xmab.xmab008,l_xmab.xmab009,
                        #                      l_xmab.xmab010,l_xmab.xmab011,l_xmab.xmab012,l_xmab.xmab013,l_xmab.xmab014,
                        #                      l_xmab.xmab015,l_xmab.xmab016,l_xmab.xmab017,l_xmab.xmab018,l_xmab.xmab019,l_xmab.xmab020)
                        #   END IF
                        #   
                        #   
                        #END IF
                        ##原S9是以xrde109為主 目前不處理--(E)
                        #20150914 S9修正--(E)
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.extend = 'INSERT xmab_t'
                           LET g_errparam.code   = SQLCA.sqlcode
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET r_success = FALSE
                           RETURN r_success
                        END IF  

                        #1-1.信用額度建立目前項目並沖銷前置項目時，增加寫入xmak_t
                        #	xmakent(企業編號)=xmabent
                        #	xmak001(計算項目)=xmab001
                        #	xmak002(單據編號)=xmab003
                        #	xmak003(單據項次)=xmab004
                        #	xmak004(沖銷計算項目)=沖銷項目
                        #	xmak005(沖銷單據編號)=沖銷單號
                        #	xmak006(沖銷單據項次)=沖銷項次
                        #	xmak007(沖銷金額)=此次沖銷金額
                        #	xmak008(沖銷數量)=xmab015
                        #	xmak009(沖銷結案否)="N"
                        #	xmak010(沖銷建立日期)=xmab011  

                        #190802-00035#4-S add
                        LET l_xmak.xmakent = g_enterprise
                        LET l_xmak.xmak001 = l_xmab.xmab001
                        LET l_xmak.xmak002 = l_xmab.xmab003
                        LET l_xmak.xmak003 = l_xmab.xmab004
                        LET l_xmak.xmak004 = lc_param.proj_o   #沖銷項目
                        LET l_xmak.xmak005 = l_array.xmab003_o #沖銷單號
                        LET l_xmak.xmak006 = l_array.xmab004_o #沖銷項次
                        LET l_xmak.xmak007 = l_array.xmab009
                        LET l_xmak.xmak008 = l_xmab.xmab015
                        LET l_xmak.xmak009 = 'N'
                        LET l_xmak.xmak010 = l_xmab.xmab011  
                       #IF g_prog MATCHES 'axmt590*' OR g_prog MATCHES 'axmt591*' THEN    #191104-00018#3 mark
                        IF g_prog MATCHES 'axmt590*' OR g_prog MATCHES 'axmt591*' OR g_prog MATCHES 'apmt560*'  #191104-00018#3 add
                           OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN                       #191104-00018#3 add    
                            
                           LET l_xmak.xmakent = g_enterprise
                           LET l_xmak.xmak001 = l_xmab.xmab001
                           LET l_xmak.xmak002 = l_xmab.xmab003
                           LET l_xmak.xmak003 = l_xmab.xmab004
                           LET l_xmak.xmak004 = l_xmab.xmab001   #沖銷項目
                           LET l_xmak.xmak005 = l_xmab.xmab003   #沖銷單號
                           LET l_xmak.xmak006 = l_xmab.xmab004   #沖銷項次
                           LET l_xmak.xmak007 = l_xmab.xmab009
                           LET l_xmak.xmak008 = l_xmab.xmab015
                           LET l_xmak.xmak009 = 'N'
                           LET l_xmak.xmak010 = l_xmab.xmab011 
                        END IF 
                        IF cl_null(l_xmak.xmak004) THEN LET l_xmak.xmak004 = ' ' END IF
                        IF cl_null(l_xmak.xmak005) THEN LET l_xmak.xmak005 = ' ' END IF
                        IF cl_null(l_xmak.xmak006) THEN LET l_xmak.xmak006 = 0   END IF
                        IF (l_xmab.xmab001 = 'P1' AND l_xmab.xmab017 <> 'Y') OR (l_xmab.xmab001 = 'S1' AND l_xmab.xmab017 <> 'Y') THEN 
                        ELSE
                           IF l_xmab.xmab001 = 'P4' THEN    #倉退
                              IF l_xmak.xmak004 = 'P1' THEN #原採購單收貨 
                                 LET l_xmak.xmak007 = l_xmak.xmak007 * -1
                                 LET l_xmak.xmak008 = l_xmak.xmak008 * -1
                                 INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                    xmak006,xmak007,xmak008,xmak009,xmak010)
                                             VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                    l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                                 
                                 IF SQLCA.SQLCODE THEN
                                    INITIALIZE g_errparam TO NULL 
                                    LET g_errparam.extend = "ins14 xmak_t:" 
                                    LET g_errparam.code   = SQLCA.sqlcode
                                    LET g_errparam.popup  = TRUE
                                    CALL cl_err()
                                    LET r_success = FALSE
                                    RETURN r_success
                                 END IF                              
                              END IF 
                           ELSE
                              #依原訂單銷退
                              IF l_xmak.xmak001 = 'S4' AND l_xmak.xmak004 = 'S1' THEN
                                 LET l_xmak.xmak007 = l_xmak.xmak007 * -1
                                 LET l_xmak.xmak008 = l_xmak.xmak008 * -1
                              END IF 
                              IF (l_xmak.xmak001 = 'P3' OR l_xmak.xmak001 = 'P2') AND cl_null(lc_param.proj_o) THEN
                                 #無採購收貨單、無採購收貨入庫不需寫入xmak_t
                              ELSE
                                 INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                    xmak006,xmak007,xmak008,xmak009,xmak010)
                                             VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                    l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                                 
                                 IF SQLCA.SQLCODE THEN
                                    INITIALIZE g_errparam TO NULL 
                                    LET g_errparam.extend = "ins7 xmak_t:" 
                                    LET g_errparam.code   = SQLCA.sqlcode
                                    LET g_errparam.popup  = TRUE
                                    CALL cl_err()
                                    LET r_success = FALSE
                                    RETURN r_success
                                 END IF
                              END IF 
                           END IF                              
                        END IF 
                        #if 來源為訂單(單身.出貨單號xmdl001串到出貨單的出貨單單身.出通單號xmdl001 is null)
                        #   不需寫入
                        #else 來源為出通單
                        #   第二筆xmak沖銷出通單
                        #   xmakent(企業編號)=xmabent
                        #   xmak001(計算項目)=xmab001
                        #   xmak002(單據編號)=xmab003
                        #   xmak003(單據項次)=xmab004
                        #   xmak004(沖銷計算項目)='S2'
                        #   xmak005(沖銷單據編號)=回串的出貨單單身的出通單號(xmdl001)
                        #   xmak006(沖銷單據項次)=回串的出貨單單身的出通單號(xmdl002)
                        #   xmak007(沖銷金額)=使用s_credit_get_amount(xmakent,xmak008,xmdg014,xmdg015,xmdh023,xmdh024)
                        #   xmak008(沖銷數量)=xmab015
                        #   xmak009(沖銷結案否)="N"
                        #   xmak010(沖銷建立日期)=xmab011
                        #   第三筆xmak反沖銷訂單
                        #   xmakent(企業編號)=xmabent
                        #   xmak001(計算項目)=xmab001
                        #   xmak002(單據編號)=xmab003
                        #   xmak003(單據項次)=xmab004
                        #   xmak004(沖銷計算項目)='S1'
                        #   xmak005(沖銷單據編號)=xmdl003
                        #   xmak006(沖銷單據項次)=xmdl004
                        #   xmak007(沖銷金額)= -1 * 使用s_credit_get_amount(xmakent,xmak008,xmda015,xmda016,xmdd018,xmdd019)
                        #   xmak008(沖銷數量)= -1 * xmab015
                        #   xmak009(沖銷結案否)="N"
                        #   xmak010(沖銷建立日期)=xmab011
                        #end if
                        IF g_prog MATCHES 'axmt590*' THEN  #簽退單
                           LET l_xmdl001 = ''
                           LET l_xmdl002 = ''
                           SELECT xmdl001,xmdl002,xmdl003,xmdl004 INTO l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004 FROM xmdl_t 
                            WHERE xmdlent = g_enterprise 
                              AND xmdldocno = (SELECT DISTINCT xmdl001 FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = l_xmab.xmab003 AND xmdlseq = l_xmab.xmab004)
                              AND xmdlseq   = (SELECT DISTINCT xmdl002 FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = l_xmab.xmab003 AND xmdlseq = l_xmab.xmab004)
                              
                           IF NOT cl_null(l_xmdl001) THEN   #出通單
                              #第二筆xmak沖銷出通單
                              LET l_xmak.xmakent = g_enterprise
                              LET l_xmak.xmak001 = l_xmab.xmab001
                              LET l_xmak.xmak002 = l_xmab.xmab003
                              LET l_xmak.xmak003 = l_xmab.xmab004
                              LET l_xmak.xmak004 = 'S2'   #沖銷項目_出通單
                              LET l_xmak.xmak005 = l_xmdl001
                              LET l_xmak.xmak006 = l_xmdl002
                              LET l_xmdg014 = ''
                              LET l_xmdg015 = ''
                              LET l_xmdh023 = ''
                              LET l_xmdh024 = ''
                              SELECT DISTINCT xmdg014,xmdg015,xmdh023,xmdh024 INTO l_xmdg014,l_xmdg015,l_xmdh023,l_xmdh024 FROM xmdg_t,xmdh_t 
                               WHERE xmdhent = xmdgent 
                                 AND xmdhdocno = xmdgdocno
                                 AND xmdhdocno = l_xmdl001
                                 AND xmdhseq   = l_xmdl002
                                 
                              #LET l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmab.xmab015,l_xmdg014,l_xmdg015,l_xmdh023,l_xmdh024)
                              LET l_xmak.xmak007 = l_array.xmab009
                              LET l_xmak.xmak008 = l_xmab.xmab015
                              LET l_xmak.xmak009 = 'N'
                              LET l_xmak.xmak010 = l_xmab.xmab011
                              INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                 xmak006,xmak007,xmak008,xmak009,xmak010)
                                          VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                 l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                            
                              IF SQLCA.SQLCODE THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = "ins3 xmak_t:" 
                                 LET g_errparam.code   = SQLCA.sqlcode
                                 LET g_errparam.popup  = TRUE
                                 CALL cl_err()
                                 LET r_success = FALSE
                                 RETURN r_success
                              END IF 

                              #第三筆xmak反沖銷訂單                            
                              #   xmakent(企業編號)=xmabent
                              #   xmak001(計算項目)=xmab001
                              #   xmak002(單據編號)=xmab003
                              #   xmak003(單據項次)=xmab004
                              #   xmak004(沖銷計算項目)='S1'
                              #   xmak005(沖銷單據編號)=xmdl003
                              #   xmak006(沖銷單據項次)=xmdl004
                              #   xmak007(沖銷金額)= -1 * 使用s_credit_get_amount(xmakent,xmak008,xmda015,xmda016,xmdd018,xmdd019)
                              #   xmak008(沖銷數量)= -1 * xmab015
                              #   xmak009(沖銷結案否)="N"
                              #   xmak010(沖銷建立日期)=xmab011 
                              
                              LET l_xmak.xmakent = g_enterprise
                              LET l_xmak.xmak001 = l_xmab.xmab001
                              LET l_xmak.xmak002 = l_xmab.xmab003
                              LET l_xmak.xmak003 = l_xmab.xmab004
                              LET l_xmak.xmak004 = 'S1'   #沖銷項目_訂單
                              LET l_xmak.xmak005 = l_xmdl003
                              LET l_xmak.xmak006 = l_xmdl004
                              
                              LET l_xmda015 = ''
                              LET l_xmda016 = ''
                              LET l_xmdd018 = ''
                              LET l_xmdd019 = ''
                              
                              SELECT DISTINCT xmda015,xmda016,xmdd018,xmdd019 INTO l_xmda015,l_xmda016,l_xmdd018,l_xmdd019 
                                FROM xmda_t,xmdd_t 
                               WHERE xmdaent = xmddent 
                                 AND xmdadocno = xmdddocno
                                 AND xmdddocno = l_xmdl003
                                 AND xmddseq   = l_xmdl004
                              
                              LET l_xmak.xmak007 = l_array.xmab009                              
                              #LET l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmab.xmab015,l_xmda015,l_xmda016,l_xmdd018,l_xmdd019)
                              LET l_xmak.xmak007 = l_xmak.xmak007 * -1
                              LET l_xmak.xmak008 = l_xmab.xmab015 * -1
                              LET l_xmak.xmak009 = 'N'
                              LET l_xmak.xmak010 = l_xmab.xmab011
                              INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                 xmak006,xmak007,xmak008,xmak009,xmak010)
                                          VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                 l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                            
                              IF SQLCA.SQLCODE THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = "ins4 xmak_t:" 
                                 LET g_errparam.code   = SQLCA.sqlcode
                                 LET g_errparam.popup  = TRUE
                                 CALL cl_err()
                                 LET r_success = FALSE
                                 RETURN r_success
                              END IF 
                              
                           END IF                                                     
                        END IF 
                        
                        #if 來源為訂單(單身.出貨單號xmdl001串到出貨單的出貨單單身.出通單號xmdl001 is null)
                        #   第二筆xmak沖銷訂單
                        #   xmakent(企業編號)=xmabent
                        #   xmak001(計算項目)=xmab001
                        #   xmak002(單據編號)=xmab003
                        #   xmak003(單據項次)=xmab004
                        #   xmak004(沖銷計算項目)='S1'
                        #   xmak005(沖銷單據編號)=xmdl003
                        #   xmak006(沖銷單據項次)=xmdl004
                        #   xmak007(沖銷金額)=使用s_credit_get_amount(xmakent,xmak008,xmda015,xmda016,xmdd018,xmdd019)
                        #   xmak008(沖銷數量)=xmab015
                        #   xmak009(沖銷結案否)="N"
                        #   xmak010(沖銷建立日期)=xmab011
                        #else 來源為出通單
                        #   第二筆xmak沖銷出通單
                        #   xmakent(企業編號)=xmabent
                        #   xmak001(計算項目)=xmab001
                        #   xmak002(單據編號)=xmab003
                        #   xmak003(單據項次)=xmab004
                        #   xmak004(沖銷計算項目)='S2'
                        #   xmak005(沖銷單據編號)=回串的出貨單單身的出通單號(xmdl001)
                        #   xmak006(沖銷單據項次)=回串的出貨單單身的出通單號(xmdl002)
                        #   xmak007(沖銷金額)=使用s_credit_get_amount(xmakent,xmak008,xmdg014,xmdg015,xmdh023,xmdh024)
                        #   xmak008(沖銷數量)=xmab015
                        #   xmak009(沖銷結案否)="N"
                        #   xmak010(沖銷建立日期)=xmab011
                        #end if   

                        IF g_prog MATCHES 'axmt591*' THEN  #借貨還量單
                           LET l_xmdl001 = ''
                           LET l_xmdl002 = ''
                           LET l_xmdl003 = ''
                           LET l_xmdl004 = ''
                           SELECT xmdl001,xmdl002,xmdl003,xmdl004 INTO l_xmdl001,l_xmdl002,l_xmdl003,l_xmdl004 FROM xmdl_t 
                            WHERE xmdlent = g_enterprise 
                              AND xmdldocno = (SELECT DISTINCT xmdl001 FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = l_xmab.xmab003 AND xmdlseq = l_xmab.xmab004)
                              AND xmdlseq   = (SELECT DISTINCT xmdl002 FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = l_xmab.xmab003 AND xmdlseq = l_xmab.xmab004)
                              
                           IF NOT cl_null(l_xmdl001) THEN   #出通單
                              #第二筆xmak沖銷出通單
                              LET l_xmak.xmakent = g_enterprise
                              LET l_xmak.xmak001 = l_xmab.xmab001
                              LET l_xmak.xmak002 = l_xmab.xmab003
                              LET l_xmak.xmak003 = l_xmab.xmab004
                              LET l_xmak.xmak004 = 'S2'   #沖銷項目_出通單
                              LET l_xmak.xmak005 = l_xmdl001
                              LET l_xmak.xmak006 = l_xmdl002
                              LET l_xmdg014 = ''
                              LET l_xmdg015 = ''
                              LET l_xmdh023 = ''
                              LET l_xmdh024 = ''
                              SELECT DISTINCT xmdg014,xmdg015,xmdh023,xmdh024 INTO l_xmdg014,l_xmdg015,l_xmdh023,l_xmdh024 FROM xmdg_t,xmdh_t 
                               WHERE xmdhent = xmdgent 
                                 AND xmdhdocno = xmdgdocno
                                 AND xmdhdocno = l_xmdl001
                                 AND xmdhseq   = l_xmdl002
                                 
                              #LET l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmab.xmab015,l_xmdg014,l_xmdg015,l_xmdh023,l_xmdh024)
                              LET l_xmak.xmak007 = l_array.xmab009 
                              LET l_xmak.xmak008 = l_xmab.xmab015
                              LET l_xmak.xmak009 = 'N'
                              LET l_xmak.xmak010 = l_xmab.xmab011
                              INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                 xmak006,xmak007,xmak008,xmak009,xmak010)
                                          VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                 l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                            
                              IF SQLCA.SQLCODE THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = "ins5 xmak_t:" 
                                 LET g_errparam.code   = SQLCA.sqlcode
                                 LET g_errparam.popup  = TRUE
                                 CALL cl_err()
                                 LET r_success = FALSE
                                 RETURN r_success
                              END IF 
                           ELSE    
                              #   第二筆xmak沖銷訂單
                              #   xmakent(企業編號)=xmabent
                              #   xmak001(計算項目)=xmab001
                              #   xmak002(單據編號)=xmab003
                              #   xmak003(單據項次)=xmab004
                              #   xmak004(沖銷計算項目)='S1'
                              #   xmak005(沖銷單據編號)=xmdl003
                              #   xmak006(沖銷單據項次)=xmdl004
                              #   xmak007(沖銷金額)=使用s_credit_get_amount(xmakent,xmak008,xmda015,xmda016,xmdd018,xmdd019)
                              #   xmak008(沖銷數量)=xmab015
                              #   xmak009(沖銷結案否)="N"
                              #   xmak010(沖銷建立日期)=xmab011                              
                              LET l_xmak.xmakent = g_enterprise
                              LET l_xmak.xmak001 = l_xmab.xmab001
                              LET l_xmak.xmak002 = l_xmab.xmab003
                              LET l_xmak.xmak003 = l_xmab.xmab004
                              LET l_xmak.xmak004 = 'S1'   #沖銷項目_訂單
                              LET l_xmak.xmak005 = l_xmdl003
                              LET l_xmak.xmak006 = l_xmdl004
                              
                              LET l_xmda015 = ''
                              LET l_xmda016 = ''
                              LET l_xmdd018 = ''
                              LET l_xmdd019 = ''
                              
                              SELECT DISTINCT xmda015,xmda016,xmdd018,xmdd019 INTO l_xmda015,l_xmda016,l_xmdd018,l_xmdd019 
                                FROM xmda_t,xmdd_t 
                               WHERE xmdaent = xmddent 
                                 AND xmdadocno = xmdddocno
                                 AND xmdddocno = l_xmdl003
                                 AND xmddseq   = l_xmdl004
                                 
                              # l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmab.xmab015,l_xmda015,l_xmda016,l_xmdd018,l_xmdd019)
                              LET l_xmak.xmak007 = l_array.xmab009
                              LET l_xmak.xmak008 = l_xmab.xmab015 
                              LET l_xmak.xmak009 = 'N'
                              LET l_xmak.xmak010 = l_xmab.xmab011
                              INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                 xmak006,xmak007,xmak008,xmak009,xmak010)
                                          VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                 l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                            
                              IF SQLCA.SQLCODE THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = "ins6 xmak_t:" 
                                 LET g_errparam.code   = SQLCA.sqlcode
                                 LET g_errparam.popup  = TRUE
                                 CALL cl_err()
                                 LET r_success = FALSE
                                 RETURN r_success
                              END IF                               
                           END IF                                                     
                        END IF                         
                        #190802-00035#4-E add 

                        #191104-00018#3-S add
                        #第二筆沖銷收貨單
                        #xmakent(企業編號)=xmabent
                        #xmak001(計算項目)='apmt560'
                        #xmak002(單據編號)=pmdtdocno
                        #xmak003(單據項次)=pmdtseq
                        #xmak004(沖銷計算項目)='P2'
                        #xmak005(沖銷單據編號)=pmdt027
                        #xmak006(沖銷單據項次)=pmdt028
                        #xmak007(沖銷金額)=使用s_credit_get_amount(xmakent,xmak008,pmdl015,pmdl016,pmdn015,pmdn016)
                        #xmak008(沖銷數量)=xmab015
                        #xmak009(沖銷結案否)="N"
                        #xmak010(沖銷建立日期)=xmab011
                        #第三筆反沖銷採購單
                        #xmakent(企業編號)=xmabent
                        #xmak001(計算項目)='apmt560'
                        #xmak002(單據編號)=pmdtdocno
                        #xmak003(單據項次)=pmdtseq
                        #xmak004(沖銷計算項目)='P1'
                        #xmak005(沖銷單據編號)=pmdt001
                        #xmak006(沖銷單據項次)=pmdt002
                        #xmak007(沖銷金額)= -1 * 使用s_credit_get_amount(xmakent,xmak008,pmdl015,pmdl016,pmdn015,pmdn016)
                        #xmak008(沖銷數量)= -1 * xmab015
                        #xmak009(沖銷結案否)="N"
                        #xmak010(沖銷建立日期)=xmab011
                        IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN  #驗退單                           
                          #第二筆沖銷收貨單        
                           LET l_xmak.xmakent = g_enterprise
                           LET l_xmak.xmak001 = l_xmab.xmab001
                           LET l_xmak.xmak002 = l_xmab.xmab003
                           LET l_xmak.xmak003 = l_xmab.xmab004       
                           LET l_xmak.xmak004 = 'P2'
                           
                           LET l_pmdt027 = ''
                           LET l_pmdt028 = ''  
                           LET l_pmdt001 = ''
                           LET l_pmdt002 = ''                          
                           SELECT pmdt027,pmdt028,pmdt001,pmdt002 INTO l_pmdt027,l_pmdt028,l_pmdt001,l_pmdt002 FROM pmdt_t 
                            WHERE pmdtent = g_enterprise
                              AND pmdtdocno = l_xmab.xmab003
                              AND pmdtseq = l_xmab.xmab004
                              
                           LET l_xmak.xmak005 = l_pmdt027
                           LET l_xmak.xmak006 = l_pmdt028 
                           
                           LET l_pmds037 = ''
                           LET l_pmds038 = ''
                           LET l_pmdt036 = ''
                           LET l_pmdt046 = ''
                           SELECT DISTINCT pmds037,pmds038,pmdt036,pmdt046 INTO l_pmds037,l_pmds038,l_pmdt036,l_pmdt046 FROM pmds_t,pmdt_t 
                            WHERE pmdsent = pmdtent 
                              AND pmdsdocno = pmdtdocno 
                              AND pmdsent = g_enterprise
                              AND pmdtdocno = l_pmdt027
                              AND pmdtseq = l_pmdt028  
                              
                           LET l_xmak.xmak008 = l_xmab.xmab015  
                           LET l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmak.xmak008,l_pmds037,l_pmds038,l_pmdt036,l_pmdt046)
                           LET l_xmak.xmak009 = 'N'
                           LET l_xmak.xmak010 = l_xmab.xmab011  
                           INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                          xmak006,xmak007,xmak008,xmak009,xmak010)
                                                   VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                          l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                           
                           IF SQLCA.SQLCODE THEN
                              INITIALIZE g_errparam TO NULL 
                              LET g_errparam.extend = "ins xmak16:" 
                              LET g_errparam.code = SQLCA.SQLCODE 
                              LET g_errparam.popup = TRUE 
                              CALL cl_err() 
                              LET r_success = FALSE
                              RETURN r_success
                           END IF    
                         
                          #第三筆反沖銷採購單
                           LET l_xmak.xmakent = g_enterprise
                           LET l_xmak.xmak001 = l_xmab.xmab001
                           LET l_xmak.xmak002 = l_xmab.xmab003
                           LET l_xmak.xmak003 = l_xmab.xmab004       
                           LET l_xmak.xmak004 = 'P1'
                           LET l_xmak.xmak005 = l_pmdt001
                           LET l_xmak.xmak006 = l_pmdt002  
                         
                           LET l_pmdl015 = ''
                           LET l_pmdl016 = ''
                           LET l_pmdn015 = ''
                           LET l_pmdn016 = ''                           
                           SELECT pmdl015,pmdl016,pmdn015,pmdn016 INTO l_pmdl015,l_pmdl016,l_pmdn015,l_pmdn016 FROM pmdl_t,pmdn_t 
                            WHERE pmdlent = pmdnent 
                              AND pmdldocno = pmdndocno 
                              AND pmdlent = g_enterprise
                              AND pmdndocno = l_pmdt001
                              AND pmdnseq = l_pmdt002   
                              
                           LET l_xmak.xmak008 = l_xmab.xmab015  
                           LET l_xmak.xmak007 = s_credit_get_amount(l_xmab.xmab005,l_xmak.xmak008,l_pmdl015,l_pmdl016,l_pmdn015,l_pmdn016) *-1
                           LET l_xmak.xmak008 = l_xmak.xmak008 * -1
                           LET l_xmak.xmak009 = 'N'
                           LET l_xmak.xmak010 = l_xmab.xmab011  
                           INSERT INTO xmak_t(xmakent,xmak001,xmak002,xmak003,xmak004,xmak005,
                                                          xmak006,xmak007,xmak008,xmak009,xmak010)
                                                   VALUES(l_xmak.xmakent,l_xmak.xmak001,l_xmak.xmak002,l_xmak.xmak003,l_xmak.xmak004,l_xmak.xmak005,
                                                          l_xmak.xmak006,l_xmak.xmak007,l_xmak.xmak008,l_xmak.xmak009,l_xmak.xmak010)  
                           
                           IF SQLCA.SQLCODE THEN
                              INITIALIZE g_errparam TO NULL 
                              LET g_errparam.extend = "ins xmak17:" 
                              LET g_errparam.code = SQLCA.SQLCODE 
                              LET g_errparam.popup = TRUE 
                              CALL cl_err() 
                              LET r_success = FALSE
                              RETURN r_success
                           END IF       
                        END IF 
                        #191104-00018#3-E add
                                                
                     END IF #190722-00056#9 add
                  END IF #190103-00038#1-add
               ELSE         
                  #IF lc_param.proj <> 'S9' THEN    #20150914 S9修正
                  IF g_prog NOT MATCHES 'axmt510*' THEN #190103-00038#1-add
                     DELETE FROM xmab_t 
                      WHERE xmabent = g_enterprise 
                        AND xmab001 = lc_param.proj
                        AND xmab003 = lc_param.xmab003 
                        #AND xmab005 = l_pmab.pmabsite #170804-00048#1-mark
                        AND xmab005 = l_xmab.xmab005   #170804-00048#1-add 應為交易據點         
                     #190802-00035#4-S add
                     IF g_prog MATCHES 'axmt590*' THEN            
                        DELETE FROM xmab_t 
                         WHERE xmabent = g_enterprise 
                           AND xmab001 = 'axmt590'
                           AND xmab003 = lc_param.xmab003 
                           AND xmab005 = l_xmab.xmab005   
                     END IF 
                     IF g_prog MATCHES 'axmt591*' THEN            
                        DELETE FROM xmab_t 
                         WHERE xmabent = g_enterprise 
                           AND xmab001 = 'axmt591'
                           AND xmab003 = lc_param.xmab003 
                           AND xmab005 = l_xmab.xmab005   
                     END IF                      
                     #190802-00035#4-E add 

                     #191104-00018#3-S add
                     IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' or g_prog MATCHES 'apmt563*' THEN            
                        DELETE FROM xmab_t 
                         WHERE xmabent = g_enterprise 
                           AND xmab001 = 'apmt560'
                           AND xmab003 = lc_param.xmab003 
                           AND xmab005 = l_xmab.xmab005   
                     END IF                           
                     #191104-00018#3-E add
                                         
                     #190802-00035#7 add s---
                     IF g_prog MATCHES 'anmt510*' THEN 
                        DELETE FROM xmab_t 
                         WHERE xmabent = g_enterprise 
                           AND xmab001 IN ('S8','S9')
                           AND xmab003 = lc_param.xmab003 
                           AND xmab005 = l_xmab.xmab005                      
                     END IF 
                     #190802-00035#7 add e---                     
                  ##20150914 S9修正--(S)
                  #ELSE
                  #  ##因應S9
                  #  #UPDATE xmab_t SET xmab009 = xmab009 - l_array.xmab009
                  #  # WHERE xmabent = g_enterprise 
                  #  #   AND xmab001 = lc_param.proj AND xmab002 = '1'   #150901 add ''
                  #  #   AND xmab003 = lc_param.xmab003  AND xmab004 = l_xmab.xmab004
                  #  #   AND xmab005 = l_pmab.pmabsite
                  #  ##如果xmab009已經為0表示都扣完了，可以刪除
                  #   SELECT COUNT(1) INTO l_cnt
                  #     FROM xmab_t
                  #    WHERE xmabent = g_enterprise 
                  #      AND xmab001 = lc_param.proj AND xmab002 = '1'
                  #      AND xmab003 = lc_param.xmab003  AND xmab004 = l_xmab.xmab004
                  #      AND xmab005 = l_pmab.pmabsite #AND xmab009 = 0
                  #   IF l_cnt > 0 THEN
                  #      DELETE FROM xmab_t 
                  #       WHERE xmabent = g_enterprise 
                  #         AND xmab001 = lc_param.proj
                  #         AND xmab003 = lc_param.xmab003 
                  #         AND xmab005 = l_pmab.pmabsite  
                  #   END IF
                  #  #ELSE
                  #  #   #如果xmab010 > 0表示有沖S9紀錄 應該讓xmab009 = xmab010 避免額度虛增
                  #  #   SELECT COUNT(1) INTO l_cnt
                  #  #     FROM xmab_t
                  #  #    WHERE xmabent = g_enterprise 
                  #  #      AND xmab001 = lc_param.proj AND xmab002 = '1'   #150901 add ''
                  #  #      AND xmab003 = lc_param.xmab003  AND xmab004 = l_xmab.xmab004
                  #  #      AND xmab005 = l_pmab.pmabsite AND xmab010 > 0
                  #  #   IF l_cnt > 0 THEN
                  #  #      UPDATE xmab_t SET xmab010 = xmab009
                  #  #       WHERE xmabent = g_enterprise 
                  #  #         AND xmab001 = lc_param.proj AND xmab002 = '1'   #150901 add ''
                  #  #         AND xmab003 = lc_param.xmab003  AND xmab004 = l_xmab.xmab004
                  #  #         AND xmab005 = l_pmab.pmabsite
                  #  #   END IF
                  #  #END IF                     
                  #END IF
                  ##20150914 S9修正--(E)
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = 'DELETE xmab_t'
                        LET g_errparam.code   = SQLCA.sqlcode
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF   
                     
                     #190802-00035#4-S add
                     DELETE FROM xmak_t 
                      WHERE xmakent = g_enterprise
                        AND xmak001 = lc_param.proj
                        AND xmak002 = lc_param.xmab003 
                     #190802-00035#4-S add
                     IF g_prog MATCHES 'axmt590*' THEN            
                        DELETE FROM xmak_t 
                         WHERE xmakent = g_enterprise
                           AND xmak001 = 'axmt590'
                           AND xmak002 = lc_param.xmab003  
                     END IF 
                     IF g_prog MATCHES 'axmt591*' THEN            
                        DELETE FROM xmak_t 
                         WHERE xmakent = g_enterprise
                           AND xmak001 = 'axmt591'
                           AND xmak002 = lc_param.xmab003  
                     END IF                                             
                     #190802-00035#4-E add   
                     
                     #191104-00018#3-S add
                     IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN            
                        DELETE FROM xmak_t 
                         WHERE xmakent = g_enterprise
                           AND xmak001 = 'apmt560'
                           AND xmak002 = lc_param.xmab003  
                     END IF   
                     #191104-00018#3-E add 
                     
                  END IF #190103-00038#1-add
               END IF
             #END IF #170329-00002#1 add   #170614-00037#1 mark
            END IF   
         END IF
####沖銷前置項目####         
        #190528-00020#1 mark --s
        ##針對項目S3簽收單部份做前項項目調整
        #IF lc_param.proj = 'S3' AND l_xmdk000 = '4' THEN
        #   LET lc_param.proj_o = ''
        #   LET l_xmdl001 = ''
        #   LET l_xmdl003 = ''
        #   SELECT xmdl001,xmdl003 INTO l_xmdl001,l_xmdl003
        #     FROM xmdl_t
        #    WHERE xmdlent = g_enterprise
        #      AND xmdldocno = l_array.xmab003
        #      AND xmdlseq = l_array.xmab004
        #   IF NOT cl_null(l_xmdl003) THEN 
        #      CALL s_aooi200_get_slip(l_xmdl001) RETURNING l_success,l_slip 
        #      IF l_success THEN
        #         IF cl_get_doc_para(g_enterprise,l_array.xmab005,l_slip,'D-BAS-0062') = 'Y' THEN    
        #            #出通單
        #            LET lc_param.proj_o = 'S2'
        #            #160601-00021#1--S
        #            #纳入签退单资料
        #            SELECT NVL(xmdl022,0)+NVL(xmdl081,0) INTO l_array.xmab015 
        #              FROM xmdl_t
        #             WHERE xmdlent = g_enterprise 
        #               AND xmdldocno = l_array.xmab003 AND xmdlseq = l_array.xmab004
        #            LET l_xmab008 = ''
        #            LET l_xmab013 = 0
        #            LET l_xmab012 = ''  
        #            LET l_xmab019 = ''  
        #            LET l_xmab020 = 0 
        #           #160905-00020#1-s-mark 
        #           #SELECT DISTINCT xmab008,xmab012,xmab013,xmab019,xmab020
        #           #  INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020
        #           #  FROM xmab_t
        #           #WHERE xmabent = g_enterprise
        #           #  AND xmab001 = lc_param.proj_o
        #           #  AND xmab003 = l_array.xmab003_o
        #           #  AND xmab004 = l_array.xmab004_o
        #           #  AND xmab005 = l_array.xmab018
        #           #160905-00020#1-e-mark
        #           #170804-00048#1-s-mark                    
        #           #160905-00020#1-s-add
        #           #EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array.xmab003_o,l_array.xmab004_o,l_array.xmab018
        #           #   INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o      #170617-00552#1 add l_qty_o 
        #           #160905-00020#1-e-add   
        #           #170804-00048#1-e-mark
        #           #170804-00048#1-s-add
        #           EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array.xmab003_o,l_array.xmab004_o
        #               INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o
        #           #170804-00048#1-e-add 
        #            #重推价格
        #            LET l_array.xmab009 = 0
        #            CALL s_credit_get_amount(l_array.xmab005,l_array.xmab015,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
        #              RETURNING l_array.xmab009             
        #            #160601-00021#1--E
        #         ELSE
        #            #訂單
        #            LET lc_param.proj_o = 'S1'
        #         END IF   
        #      END IF   
        #   END IF                       
        #END IF 
        #190528-00020#1 mark --e        
         #針對項目S4銷退單/P4倉退單 做前項目調整 
         IF (lc_param.proj = 'S4' OR lc_param.proj = 'P4') THEN
            #銷退/倉退方式不是2:銷退依原訂單出貨/倉退依原採購單收貨 ，則不需沖銷前項額度
            IF l_xmdk082 <> '2' THEN  
               LET lc_param.proj_o = ''
            END IF          
         END IF  
         
         #沖銷前置項目餘額檔 
         IF NOT cl_null(lc_param.proj_o) AND NOT cl_null(l_array.xmab003_o) AND 
            NOT cl_null(l_array.xmab004_o) THEN 
            LET l_xmab008 = ''
            LET l_xmab013 = 0
            LET l_xmab012 = ''  
            LET l_xmab019 = ''  
            LET l_xmab020 = 0 
           #160905-00020#1-s-mark 
           #SELECT DISTINCT xmab008,xmab012,xmab013,xmab019,xmab020
           #  INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020
           #  FROM xmab_t
           #WHERE xmabent = g_enterprise
           #  AND xmab001 = lc_param.proj_o
           #  AND xmab003 = l_array.xmab003_o
           #  AND xmab004 = l_array.xmab004_o
           #  AND xmab005 = l_array.xmab018
           #160905-00020#1-e-mark  
           
           #160905-00020#1-s-add
           #--170804-00048#1-s-mark
           #EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array.xmab003_o,l_array.xmab004_o,l_array.xmab018
           #   #INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o      #170617-00552#1 add l_qty_o                 
           #--170804-00048#1-e-mark
           #--170804-00048#1-s-add           
           EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array.xmab003_o,l_array.xmab004_o  
               INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o   
           #--170804-00048#1-e-add
           IF l_xmdk000 <> '5' THEN   #簽退走出通不須回沖訂單未出通的金額，因為在簽收已經沖過 #190528-00020#1 add
              IF l_s_0060 = '3' THEN  #出通轉出貨單控管：一對一(回寫出通量)
                 #將出通單數量全部回沖
                 #LET l_array.xmab015 = l_array.xmab015 + l_xmdc007    #190924-00040#1 mark
              END IF
           END IF #190528-00020#1 add      
           #160905-00020#1-e-add 
            LET l_amount = 0
            #170804-00048#1-s-mark
            ##170617-00552#1-s add           
            #IF l_qty_o < l_array.xmab015 THEN
            #   CALL s_credit_get_amount(l_array.xmab005,l_qty_o,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
            #     RETURNING l_amount   
            #ELSE
            ##170617-00552#1-e add 
            #   CALL s_credit_get_amount(l_array.xmab005,l_array.xmab015,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
            #     RETURNING l_amount            
            #END IF  #170617-00552#1 add
            #170804-00048#1-e-mark  
            #170804-00048#1-s-add
            
            #171205-00048#1 add --begin--
            IF cl_null(l_xmab005) THEN
               LET l_xmab005 = l_array.xmab005  
            END IF
            #171205-00048#1 add --end--
            
            CALL s_credit_get_amount(l_xmab005,l_array.xmab015,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
                 RETURNING l_amount 
            LET l_amount_1 = l_amount
            #表示有差額(超交率)，重新抓取
            IF l_qty_o < l_array.xmab015 THEN                 #190521-00023#2 mark #210304-00047#1 unmark
           #IF l_qty_o < l_array.xmab015 AND l_qty_o < 0 THEN #190521-00023#2 add  #210304-00047#1 mark
               CALL s_credit_get_amount(l_xmab005,l_qty_o,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
                 RETURNING l_amount 
            END IF
            #170804-00048#1-e-add
            #190722-00056#9 add --s
            IF l_xmdgstus = 'Q' THEN #出通單中止出貨
               LET l_amount = l_xmab009_o
               #LET l_amount_1 = l_amount  #200109-00032#1 mark
            END IF
            #190722-00056#9 add --e
            LET g_xmab017 = ''  #190927-00030#1 add
            LET g_xmab022 = ''  #190802-00035#4 add  
            #190409-00031#1 add start -----
            LET l_cnt = 0
            #201222-00022#1 mark(s)
#            SELECT COUNT(1) INTO l_cnt 
#              FROM xrcd_t 
#             WHERE xrcdent = g_enterprise AND xrcd008 = 'Y' 
#               AND xrcddocno = l_array.xmab003_o AND xrcdseq = l_array.xmab004_o 
            #201222-00022#1 mark(e)
            EXECUTE s_credit_xrcd_cnt USING g_enterprise,l_array.xmab003_o,l_array.xmab004_o INTO l_cnt  #201222-00022#1 add
            
            #IF l_cnt > 0 THEN   #190802-00035#4 mark
               LET l_cnt = 0
               IF lc_param.type = 1 THEN #正向
                  #190802-00035#4-S add
                  IF (lc_param.proj_o = 'P1' AND lc_param.proj = 'P4') OR (lc_param.proj_o = 'S1' AND lc_param.proj = 'S4') 
                     OR lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5' THEN   #倉退         
                     SELECT COUNT(1) INTO l_cnt 
                       FROM xmab_t 
                      WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                        AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite  
                        AND xmab015 <= xmab016 - l_array.xmab015                     
                  ELSE 
                  #190802-00035#4-E add                  
                     SELECT COUNT(1) INTO l_cnt 
                       FROM xmab_t 
                      WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                        #AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_xmab.xmab005  #190802-00035#4 mark
                        AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite  #190802-00035#4 add
                        AND xmab015 <= xmab016 + l_array.xmab015
					   END IF #190802-00035#4 add
					   
                  IF l_cnt > 0 THEN
                     #LET g_xmab017 = 'Y'	#190802-00035#4 mark 
                     LET g_xmab022 = 'Y'  #190802-00035#4 add  
                    #190802-00035#4-S mark 
                     #SELECT (xmab009 - xmab010) INTO l_amount 
                     #  FROM xmab_t
                     # WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                     #   #AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_xmab.xmab005  #190802-00035#4 mark
                     #   AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite  #190802-00035#4 add
                    #190802-00035#4-E mark     
                 #190802-00035#4-S add
                  ELSE
                     #數量還未完全沖銷（eg:倉退依原採購單出貨）
                     LET g_xmab022 = 'N'                                                 
                 #190802-00035#4-E add                 
                  END IF					 
                
               ELSE #反向
               #190802-00035#4-S add 
                  #LET l_xmdc019 = ''   #200119-00018#1 mark   
                  LET l_xmdc019 = '1'   #200119-00018#1 add                  
                  IF lc_param.proj_o = 'S1' OR lc_param.proj_o = 'P1' THEN 
                     IF lc_param.proj_o = 'S1' THEN  #回寫訂單
                        SELECT DISTINCT xmdc019 INTO l_xmdc019 FROM xmdc_t 
                         WHERE xmdcent = g_enterprise
                           AND xmdcdocno = l_array.xmab003_o
                           AND xmdcseq = l_array.xmab004_o
                     END IF
                     
                     IF lc_param.proj_o = 'P1' THEN  #回寫採購單
                        SELECT DISTINCT pmdn019 INTO l_xmdc019 FROM pmdn_t 
                         WHERE pmdnent = g_enterprise
                           AND pmdndocno = l_array.xmab003_o
                           AND pmdnseq = l_array.xmab004_o
                     END IF   
                     
                  END IF 
                  #訂單/採購單CKD/SKD數量回寫有誤，數量回寫重複，數量只需回寫一次就OK,不可多次回寫，金額需要多次回寫
                  IF l_xmdc019 NOT MATCHES'[23]' THEN                 
               #190802-00035#4-E add  
                     #190802-00035#4-S add               
                     IF (lc_param.proj_o = 'P1' AND lc_param.proj = 'P4') OR (lc_param.proj_o = 'S1' AND lc_param.proj = 'S4') 
                        OR lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5' THEN   #倉退  
                        
                        #倉退/銷退/簽退單
                        SELECT COUNT(1) INTO l_cnt 
                          FROM xmab_t 
                         WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                           AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite      
                           AND xmab016 - xmab015 + l_array.xmab015 < 0                        
                     ELSE
                     #190802-00035#4-E add
                        SELECT COUNT(1) INTO l_cnt 
                          FROM xmab_t 
                         WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                           #AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_xmab.xmab005   #190802-00035#4 mark
                           AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite   #190802-00035#4 add
                           #AND xmab016 - l_array.xmab015 <= 0             #190802-00035#4 mark                       
                           AND xmab016 - xmab015 - l_array.xmab015 < 0     #190802-00035#4 add    #已沖銷數量-當前數量 >=計價數量 才可以判定是完全沖銷
                     END IF  #190802-00035#4 add
                     
                     IF l_cnt > 0 THEN
                        LET g_xmab017 = 'N'	
                        LET g_xmab022 = 'N'  #190802-00035#4 add 
                     #190802-00035#4-S mark                        
                        #SELECT xmab010 INTO l_amount 
                        #  FROM xmab_t
                        # WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                        #   #AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_xmab.xmab005   #190802-00035#4 mark
                        #   AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite   #190802-00035#4 add
                     #190802-00035#4-E mark     
                     #190802-00035#4-S add
                     ELSE
                        LET g_xmab022 = 'Y'
                     #190802-00035#4-E add                     
                     END IF					 
                  END IF #190802-00035#4 add
               END IF
            #END IF    #190802-00035#4 mark
            #190409-00031#1 add end    -----            
           #IF l_pmab.pmab002 = '3' THEN          #3查核才需紀錄餘額檔   #190320-00023#1-mark
            IF l_pmab.pmab002 MATCHES '[23]' THEN #2.3查核才需更新餘額檔 #190320-00023#1-add
               IF l_xmab008 = l_pmab.pmab003 THEN                  
                  IF l_pmab.pmabsite = 'ALL' THEN
                     LET l_xmab012 = l_xmab019
                     LET l_xmab013 = l_xmab020
                  END IF                  
                  IF lc_param.proj = 'S4' OR lc_param.proj = 'P4' THEN
                     #銷退/倉退：異動類型(正向)
                     IF NOT s_credit_upd_xmac_count(l_array.xmab018,lc_param.xmab007,l_amount,lc_param.proj_o,'1',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
                        LET r_success = FALSE
                        RETURN r_success
                     END IF                
                  ELSE
                     IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add
                     ELSE                                                                           #190802-00035#4 add  
                        IF NOT s_credit_upd_xmac_count(l_array.xmab018,lc_param.xmab007,l_amount,lc_param.proj_o,'2',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
                           LET r_success = FALSE
                           RETURN r_success
                        END IF
                        
#                        #191104-00018#3-S add
#                        #驗退單反沖銷訂單
#                        IF lc_param.proj = 'P3' AND lc_param.proj_o = 'P2' AND (l_pmds000 = '5' OR l_pmds000 = '10' OR l_pmds000 = '11') THEN
#                        
#                           IF NOT s_credit_upd_xmac_count(l_array.xmab018,lc_param.xmab007,l_amount,'P1','2',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
#                              LET r_success = FALSE
#                              RETURN r_success
#                           END IF                                                
#                        END IF 
#                        #191104-00018#3-E add
  
                     END IF  #190802-00035#4 add                     
                  END IF
                 #160905-00020#1-s-add
                 #回沖訂單金額
                 #IF l_s_0060 = '3' THEN  #出通轉出貨單控管：一對一(回寫出通量)          #190528-00020#1 mark
                  #出通轉出貨單控管：一對一(回寫出通量)、簽退走出通需將簽退量回寫訂單
                  IF (l_s_0060 = '3' AND l_xmdk000 <> '5') OR (l_xmdk000 = '5') THEN  #190528-00020#1 add
                     LET l_proj_o = 'S1'
                     #170804-00048#1-s-mark                     
                     #EXECUTE s_credit_xmab_p1 USING l_proj_o,l_xmdcdocno,l_xmdcseq,l_xmdcsite
                     #   INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o      #170617-00552#1 add l_qty_o                          
                     #170804-00048#1-e-mark
                     #170804-00048#1-s-add
                     EXECUTE s_credit_xmab_p1 USING l_proj_o,l_xmdcdocno,l_xmdcseq  
                        INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o     
                     #170804-00048#1-e-add
                     LET l_xmdc047 = 0
                     CALL s_credit_get_amount(l_xmdcsite,l_xmdc007,l_xmda015,l_xmda016,l_xmdc015,l_xmdc016)
                       RETURNING l_xmdc047        
                     IF l_pmab.pmabsite = 'ALL' THEN
                        LET l_xmab012 = l_xmab019
                        LET l_xmab013 = l_xmab020
                     END IF   
                     IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add   
                     ELSE                                                                           #190802-00035#4 add                     
                        IF NOT s_credit_upd_xmac_count(l_xmdcorga,l_xmda015,l_xmdc047,l_proj_o,'1',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
                           LET r_success = FALSE
                           RETURN r_success
                        END IF 
                     END IF  #190802-00035#4 add                         
                     LET l_proj_o = ''
                  END IF
                 #160905-00020#1-s-add  

                 #191104-00018#3-S add
                 #回沖採購單金額
                 IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN  #驗退單
                     LET l_proj_o = 'P1'

                     EXECUTE s_credit_xmab_p1 USING l_proj_o,l_pmdndocno,l_pmdnseq  
                        INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o     

                     LET l_pmdn047 = 0
                     LET l_pmdn007 = l_array.xmab015 #驗退需將驗退量回寫採購單
                     
                     EXECUTE s_credit_pmds_p2 USING l_array.xmab003_o,l_array.xmab004_o 
                        INTO l_pmdl015,l_pmdl016,l_pmdnsite,l_pmdndocno,l_pmdnseq,l_pmdn015,l_pmdn016,l_pmdnorga 
                        
                     CALL s_credit_get_amount(l_pmdnsite,l_pmdn007,l_pmdl015,l_pmdl016,l_pmdn015,l_pmdn016)
                       RETURNING l_pmdn047        
                     IF l_pmab.pmabsite = 'ALL' THEN
                        LET l_xmab012 = l_xmab019
                        LET l_xmab013 = l_xmab020
                     END IF   
                                                                                         
                     IF NOT s_credit_upd_xmac_count(l_pmdnorga,l_pmdl015,l_pmdn047*-1,l_proj_o,'2',lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) THEN
                        LET r_success = FALSE
                        RETURN r_success
                     END IF 
                    
                     LET l_proj_o = ''                 
                 
                 END IF                  
                 #191104-00018#3-E add
                 
               END IF 
            END IF
           #沖銷前置項目異動檔       
           #IF l_pmab.pmabsite <> 'ALL' THEN                                                  #160622-00003#1 mark
            IF (l_pmab.pmabsite <> 'ALL') OR (l_pmab.pmabsite = 'ALL' AND l_sit_cnt = 0) THEN #160622-00003#1 add            
               LET l_type = lc_param.type
               IF lc_param.proj = 'S4' OR lc_param.proj = 'P4' THEN
                  #銷退/倉退：異動類型(正向)，需減回已沖銷數量和金額，反之，需加回
                  IF lc_param.type = '1' THEN
                     LET l_type = '2'                     
                  ELSE
                     LET l_type = '1'
                  END IF
               END IF 
               #170804-00048#1-s-mark
               #IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
               #                         l_array.xmab003_o,l_array.xmab004_o,l_xmab.xmab015,l_amount) THEN
               #170804-00048#1-e-mark
               #170804-00048#1-s-add
               LET l_xmab.xmab005 = l_xmab005 #換成前單據的據點(有可能跨據點)
               IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add
               ELSE                                                                           #190802-00035#4 add  
                  #190802-00035#4-S add 
                  IF lc_param.proj_o = 'S1' THEN 
                     
                     SELECT DISTINCT xmdc019,xmdgdocno INTO l_xmdc019,l_xmdgdocno FROM xmdc_t 
                       LEFT OUTER JOIN xmdg_t ON xmdgent = xmdcent AND xmdg004 = xmdcdocno
                      WHERE xmdcent = g_enterprise
                        AND xmdcdocno = l_array.xmab003_o
                        AND xmdcseq = l_array.xmab004_o
                        AND xmdgdocno = lc_param.xmab003  #PGS(D)-01534 add
                        
                     IF l_xmdc019 MATCHES '[23]' THEN
                        IF cl_null(g_xmab003_t) OR cl_null(g_xmab005_t) OR g_xmab003_t <> l_array.xmab003_o OR g_xmab004_t <> l_array.xmab004_o OR g_xmab005_t <> l_xmab.xmab005 THEN
                           LET g_xmab003_t = l_array.xmab003_o
                           LET g_xmab004_t = l_array.xmab004_o
                           IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
                                                    l_array.xmab003_o,l_array.xmab004_o,l_array.xmab015,l_amount_1,'N') THEN   
                              LET r_success = FALSE
                              RETURN r_success 
                           END IF 
                        ELSE
                           IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
                                                    l_array.xmab003_o,l_array.xmab004_o,l_array.xmab015,l_amount_1,'Y') THEN   
                              LET r_success = FALSE
                              RETURN r_success 
                           END IF                         
                        END IF 
                     ELSE
                        IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
                                                 l_array.xmab003_o,l_array.xmab004_o,l_array.xmab015,l_amount_1,'N') THEN   
                           LET r_success = FALSE
                           RETURN r_success 
                        END IF                        
                     END IF 
                     
                  ELSE                  
                  #190802-00035#4-E add 

                    #190924-00040#1-S add
                     IF l_s_0060 = '3' THEN 
                        IF lc_param.proj = 'S3' AND lc_param.proj_o = 'S2'  THEN 
                        
                        END IF 
                     END IF 
                    #190924-00040#1-E add
                  
                     IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
#                                              l_array.xmab003_o,l_array.xmab004_o,l_xmab.xmab015,l_amount_1) THEN  #180711-00034#1---mark
                                              l_array.xmab003_o,l_array.xmab004_o,l_array.xmab015,l_amount_1,'N') THEN #180711-00034#1---add  #190802-00035#4 add 'N'
                     #170804-00048#1-e-add
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                  END IF #190802-00035#4 add 
               END IF #190802-00035#4 add               
              #160905-00020#1-s-add
              #IF l_s_0060 = '3' THEN  #出通轉出貨單控管：一對一(回寫出通量)          #190528-00020#1 mark
               #出通轉出貨單控管：一對一(回寫出通量)、簽退走出通需將簽退量回寫訂單
               IF (l_s_0060 = '3' AND l_xmdk000 <> '5') OR (l_xmdk000 = '5') THEN  #190528-00020#1 add
                  #回寫回訂單額度
                  LET l_proj_o = 'S1'
                  IF lc_param.type = '1' THEN
                     LET l_type = '2'                     
                  ELSE
                     LET l_type = '1'
                  END IF 
                  IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add
                  ELSE                                                                           #190802-00035#4 add 
                 #190924-00040#1-S add
                     EXECUTE s_credit_xmab_p1 USING l_proj_o,l_xmdcdocno,l_xmdcseq  
                        INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o     
                     LET l_xmdc047 = 0
                     CALL s_credit_get_amount(l_xmdcsite,l_xmdc007,l_xmda015,l_xmda016,l_xmdc015,l_xmdc016)
                       RETURNING l_xmdc047                         
                 #190924-00040#1-E add
                 
                     IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,l_proj_o,l_type,
                                              l_xmdcdocno,l_xmdcseq,l_xmdc007,l_xmdc047,'N') THEN  #190802-00035#4 add 'N'
                        LET r_success = FALSE
                        RETURN r_success                  
                     END IF  
                  END IF   #190802-00035#4 add     
                  LET l_proj_o = ''                  
               END IF 
              #160905-00020#1-e-add   

              #191104-00018#3-S add
               IF g_prog MATCHES 'apmt560*' OR g_prog MATCHES 'apmt561*' OR g_prog MATCHES 'apmt563*' THEN
                  #回寫採購單額度
                  LET l_proj_o = 'P1'
                  IF lc_param.type = '1' THEN
                     LET l_type = '2'                     
                  ELSE
                     LET l_type = '1'
                  END IF       
                  #LET l_pmdn007 = l_pmdn007 
                  #LET l_pmdn047 = l_pmdn047 
                  #更新xmab022 
                  IF lc_param.type = '1' THEN  #驗退單確認，反會寫採購額度、數量
                     LET l_cnt  = 0                   
                     SELECT COUNT(1) INTO l_cnt 
                       FROM xmab_t 
                      WHERE xmabent = g_enterprise AND xmab001 = l_proj_o
                        AND xmab003 = l_pmdndocno AND xmab004 = l_pmdnseq AND xmab005 = l_pmab.pmabsite  
                        AND xmab015 <= xmab016 - l_pmdn007
                     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF 
                     IF l_cnt > 0 THEN
                        LET g_xmab022 = 'Y' 
                     ELSE
                        LET g_xmab022 = 'N'
                     END IF                        
                  ELSE
                     LET l_cnt  = 0                   
                     SELECT COUNT(1) INTO l_cnt 
                       FROM xmab_t 
                      WHERE xmabent = g_enterprise AND xmab001 = l_proj_o
                        AND xmab003 = l_pmdndocno AND xmab004 = l_pmdnseq AND xmab005 = l_pmab.pmabsite  
                        AND xmab015 <= xmab016 + l_pmdn007
                     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF 
                     IF l_cnt > 0 THEN
                        LET g_xmab022 = 'Y' 
                     ELSE
                        LET g_xmab022 = 'N'
                     END IF    
                  END IF                   
                  IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,l_proj_o,l_type,
                                           l_pmdndocno,l_pmdnseq,l_pmdn007,l_pmdn047,'N') THEN  
                     LET r_success = FALSE
                     RETURN r_success                  
                  END IF     
                  LET l_proj_o = ''   
               END IF               
              #191104-00018#3-E add
                            
            END IF
            LET l_array.xmab015 = l_xmab015_o    #160905-00020#1 add
         END IF 
         
         #150518-00040-3--(S)
         #財務段的沖銷
         #IF lc_param.proj_o MATCHES '[PS]3' OR lc_param.proj_o MATCHES '[PS]5' OR lc_param.proj_o MATCHES '[PS]9' OR lc_param.proj_o = 'S8' THEN  #180320-00022#1 mark
         #IF lc_param.proj_o MATCHES '[PS]3' OR lc_param.proj_o MATCHES '[PS]5' OR lc_param.proj_o MATCHES '[PS]9' OR lc_param.proj_o = 'S8' OR lc_param.proj_o = 'S91' THEN  #180320-00022#1 mod  #190902-00032#5 mark
         IF lc_param.proj_o MATCHES '[PS]3' OR lc_param.proj_o MATCHES '[PS]5' OR lc_param.proj_o MATCHES '[PS]9'  #190902-00032#5 add 
          OR lc_param.proj_o MATCHES '[PS]8' OR lc_param.proj_o = 'S91' THEN                                       #190902-00032#5 add     
            LET l_proj_o = lc_param.proj_o
            FOREACH s_credit_array_cr1 INTO l_array1.*
               IF lc_param.proj_o MATCHES '[PS]5' THEN
                  CASE l_array1.proj_o
                       WHEN '30' LET lc_param.proj_o = 'S5'
                       WHEN '31' LET lc_param.proj_o = 'S6'
                       WHEN '32' LET lc_param.proj_o = 'S6'
                       WHEN '40' LET lc_param.proj_o = 'P5'
                       WHEN '41' LET lc_param.proj_o = 'P6'
                       WHEN '42' LET lc_param.proj_o = 'P6'
                  END CASE
                  LET lc_param.xmab007= l_array1.curr_o
               END IF
               #190902-00032#5---add---start---
               IF lc_param.proj_o = 'P8' THEN
                  IF cl_null(l_array1.xmab004_o) THEN
                     LET l_array1.xmab004_o = 1
                  END IF
               END IF
               #190902-00032#5---add---end---
               #150826--(S)
               IF lc_param.proj_o = 'S3' THEN
                  SELECT xrcb001 INTO l_xrcb001
                    FROM xrcb_t
                   WHERE xrcbent = g_enterprise 
                     AND xrcbdocno = l_array1.xmab003 AND xrcbseq = l_array1.xmab004
                  IF l_xrcb001[1,1] = '2' THEN
                     LET lc_param.proj_o = 'S4'
                  END IF
                  LET lc_param.xmab007= l_array1.curr_o
               END IF
               IF lc_param.proj_o = 'P3' THEN
                  #1.收貨單,10.委外驗退單,11.重覆性生產驗退單,12.委外入庫單,13.重覆性生產入庫單,14.委外倉退單,15.重覆性生產倉退單,16.虛擬入庫單,17.虛擬退廠單,18.借貨入庫單
                  SELECT apcb001 INTO l_xrcb001
                    FROM apcb_t
                   WHERE apcbent = g_enterprise 
                     AND apcbdocno = l_array1.xmab003 AND apcbseq = l_array1.xmab004
                  IF l_xrcb001[1,1] = '2' THEN
                     LET lc_param.proj_o = 'P4'
                  END IF
                  LET lc_param.xmab007= l_array1.curr_o
               END IF
               #150826--(E)
               #沖銷前置項目餘額檔
               LET l_xmab008 = ''
               LET l_xmab013 = 0
               LET l_xmab012 = ''    
               LET l_xmab019 = '' 
               LET l_xmab020 = 0
               IF cl_null(l_array1.xmab018) THEN
                  LET l_array1.xmab018 = l_array.xmab018
               END IF
               #找不到前置項目檔者 不用沖銷
               SELECT COUNT(1) INTO l_cnt
                 FROM xmab_t
                WHERE xmabent = g_enterprise
                  AND xmab001 = lc_param.proj_o AND xmab003 = l_array1.xmab003_o
                  AND xmab004 = l_array1.xmab004_o
                  AND xmab005 = l_array1.xmab018   
               IF l_cnt = 0 THEN CONTINUE FOREACH END IF
              #160905-00020#1-s-mark 
              #SELECT DISTINCT xmab008,xmab012,xmab013,xmab019,xmab020
              #  INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020
              #  FROM xmab_t
              # WHERE xmabent = g_enterprise
              #   AND xmab001 = lc_param.proj_o 
              #   AND xmab003 = l_array1.xmab003_o
              #   AND xmab004 = l_array1.xmab004_o
              #   AND xmab005 = l_array1.xmab018   
              #160905-00020#1-e-mark  
              #170804-00048#1-s-mark
              #160905-00020#1-s-add
              #EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array.xmab003_o,l_array.xmab004_o,l_array.xmab018     #161121-00025#1 mark  
              #    INTO l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o      #170617-00552#1 add l_qty_o                    
              #160905-00020#1-e-add                              
              #170804-00048#1-e-mark
               #170804-00048#1-s-add
               EXECUTE s_credit_xmab_p1 USING lc_param.proj_o,l_array1.xmab003_o,l_array1.xmab004_o  
                  INTO l_xmab005,l_xmab008,l_xmab012,l_xmab013,l_xmab019,l_xmab020,l_qty_o     
               #170804-00048#1-e-add
               #170118-00050#1--add--str--lujh
               #若取不到额度币别,则再去pmaa抓取
               IF cl_null(l_xmab019) THEN 
                  SELECT pmaa054 INTO l_xmab019 
                    FROM pmaa_t
                   WHERE pmaaent = g_enterprise
                     AND pmaa001 = l_xmab008
               END IF
               #170118-00050#1--add--end--lujh
              
               LET l_amount = 0
               #20150914--Mark
               #原S9是以xrde109為主 目前不處理--(S)
               #S9的沖銷 直接抓xmab_t來沖銷(因為 票據兌現是一次性兌現)
               #IF lc_param.proj_o = 'S9' THEN
               #   #取得單號及支票號碼
               #   SELECT nmcr001,nmcr003 INTO l_nmcr001,l_nmcr003
               #     FROM nmcr_t
               #    WHERE nmcrent = g_enterprise
               #      AND nmcrcomp= lc_param.glaacomp
               #      AND nmcrdocno = lc_param.xmab003 AND nmcrseq = lc_param.xmab004
               #   
               #   SELECT nmbbseq INTO l_nmbbseq
               #     FROM nmbb_t 
               #    WHERE nmbbdocno = l_nmcr003
               #      AND nmbb029  ='30' AND nmbb030 = l_nmcr001
               #   
               #   #取得用原來xmab立多少錢
               #   SELECT xmab009 INTO l_xmab009
               #     FROM xmab_t
               #    WHERE xmabent = g_enterprise 
               #      AND xmab001 = 'S9' AND xmab002 = '1' 
               #      AND xmab003 = l_nmcr003 AND xmab004 = l_nmbbseq
               #      AND xmab005 = lc_param.glaacomp
               #   IF cl_null(l_xmab009) THEN LET l_xmab009 = 0 END IF
               #   
               #  ##計算目前在axrt400/直接付款的未兌現票據多少金額
               #  #SELECT SUM(xrde109) INTO l_xrde1091
               #  #  FROM xrda_t,xrde_t 
               #  # WHERE xrdaent = xrdeent AND xrdald = xrdeld AND  xrdadocno = xrdedocno 
               #  #   AND xrdastus= 'Y'
               #  #   AND xrdaent = g_enterprise AND xrdecomp = lc_param.glaacomp
               #  #   AND xrde003 = l_nmcr003    AND xrde004 = l_nmbbseq
               #  #SELECT SUM(xrde109) INTO l_xrde1092
               #  #  FROM xrca_t,xrde_t 
               #  # WHERE xrcaent = xrdeent AND xrcald = xrdeld AND  xrcadocno = xrdedocno 
               #  #   AND xrcastus= 'Y'
               #  #   AND xrcaent = g_enterprise AND xrdacomp = lc_param.glaacomp
               #  #   AND xrde003 = l_nmcr003    AND xrde004 = l_nmbbseq
               #  #IF cl_null(l_xrde1091) THEN LET l_xrde1091 = 0 END IF
               #  #IF cl_null(l_xrde1092) THEN LET l_xrde1092 = 0 END IF
               #  #IF l_pmab.pmabsite <> 'ALL' THEN
               #  #   UPDATE xmab_t SET xmab009 = (l_xrde1091+l_xrde1092)
               #  #    WHERE xmabent = g_enterprise 
               #  #      AND xmab001 = 'S9' AND xmab002 = '1' 
               #  #      AND xmab003 = l_nmcr003 AND xmab004 = l_nmbbseq
               #  #      AND xmab005 = lc_param.glaacomp
               #  #END IF
               #   LET l_array1.price_o = l_xmab009
               #END IF 
               #20150914--Mark
 
               CALL s_credit_get_amount(l_array1.xmab005,l_array1.xmab015,l_array1.curr_o,l_array1.rate_o,l_array1.price_o,l_array1.oodb002_o)
                    RETURNING l_amount
               LET g_xmab017 = ''   #190927-00030#1 add
               LET g_xmab022 = ''   #190802-00035#4 add
               #190409-00031#1 add start -----
               LET l_cnt = 0
               #201222-00022#1 mark(s)
#               SELECT COUNT(1) INTO l_cnt
#                 FROM xrcd_t
#                WHERE xrcdent = g_enterprise AND xrcd008 = 'Y'
#                  AND xrcddocno = l_array1.xmab003_o AND xrcdseq = l_array1.xmab004_o
               #201222-00022#1 mark(e)
               EXECUTE s_credit_xrcd_cnt USING g_enterprise,l_array1.xmab003_o,l_array1.xmab004_o INTO l_cnt  #201222-00022#1 add
               
               #IF l_cnt > 0 THEN  #190802-00035#3 mark 同制造段处理，影响xmab022的更新
                  LET l_cnt = 0
                  IF lc_param.type = 1 THEN #正向
                     IF g_prog <> 'axrt400' THEN  #200908-00092#1 add
                     SELECT COUNT(1) INTO l_cnt
                       FROM xmab_t
                      WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                        #AND xmab003 = l_array1.xmab003_o AND xmab004 = l_array1.xmab004_o AND xmab005 = l_xmab.xmab005 #190802-00035#3 mark 同制造段修改(anmt450冲P9时l_xmab.xmab005是空的)
#                        AND xmab003 = l_array.xmab003_o AND xmab004 = l_array.xmab004_o AND xmab005 = l_pmab.pmabsite   #190802-00035#3 add  #200401-00040#1 mark
                        AND xmab003 = l_array1.xmab003_o AND xmab004 = l_array1.xmab004_o AND xmab005 = l_pmab.pmabsite     #200401-00040#1 add
                        AND xmab015 <= xmab016 + l_array1.xmab015
                     END IF                       #200908-00092#1 add
                     IF l_cnt > 0 THEN
                        LET g_xmab017 = 'Y'
                        LET g_xmab022 = 'Y'   #190802-00035#4 add
                        SELECT (xmab009 - xmab010) INTO l_amount
                          FROM xmab_t
                         WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                           AND xmab003 = l_array1.xmab003_o AND xmab004 = l_array1.xmab004_o 
                           AND xmab005 = l_array1.xmab005 #cust
                           #AND xmab005 = l_xmab005
                     END IF
                  ELSE #反向
                     IF g_prog <> 'axrt400' THEN  #210220-00047#1 add
                     SELECT COUNT(1) INTO l_cnt
                       FROM xmab_t
                      WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                        AND xmab003 = l_array1.xmab003_o AND xmab004 = l_array1.xmab004_o AND xmab005 = l_pmab.pmabsite  #190802-00035#3 mark 同制造段修改 l_xmab.xmab005-->l_pmab.pmabsite
                        AND xmab016 - l_array1.xmab015 <= 0
                     END IF                       #210220-00047#1 add
                     IF l_cnt > 0 THEN
                        LET g_xmab017 = 'N'
                        LET g_xmab022 = 'N'   #190802-00035#4 add
                        SELECT xmab010 INTO l_amount
                          FROM xmab_t
                         WHERE xmabent = g_enterprise AND xmab001 = lc_param.proj_o
                           AND xmab003 = l_array1.xmab003_o AND xmab004 = l_array1.xmab004_o 
                           AND xmab005 = l_pmab.pmabsite  #190802-00035#3 mark 同制造段修改 l_xmab.xmab005-->l_pmab.pmabsite
                     END IF
                  END IF
               #END IF #190802-00035#3 mark
               #190409-00031#1 add end    -----
               
              #IF l_pmab.pmab002 = '3' THEN          #3查核才需紀錄餘額檔   #190320-00023#1-mark
               IF l_pmab.pmab002 MATCHES '[23]' THEN #2.3查核才需更新餘額檔 #190320-00023#1-add               
                  IF l_pmab.pmabsite = 'ALL' THEN
                     IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add 
                     ELSE                                                                         #190802-00035#4 add   
                     IF NOT s_credit_upd_xmac_count(l_array1.xmab018,lc_param.xmab007,l_amount,lc_param.proj_o,'2',
                           lc_param.type,l_pmab.pmabsite,l_pmab.pmab003,l_pmab.pmab004,l_xmab019,l_pmab.pmab006,l_xmab020) 
                     THEN
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                     END IF    #190802-00035#4 add 
                  ELSE
                     IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add 
                     ELSE                                                                         #190802-00035#4 add                    
                     IF NOT s_credit_upd_xmac_count(l_array1.xmab018,lc_param.xmab007,l_amount,lc_param.proj_o,'2',
                           lc_param.type,l_array1.xmab018,l_pmab.pmab003,l_pmab.pmab004,l_xmab012,l_pmab.pmab006,l_xmab013) 
                     THEN
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                     END IF    #190802-00035#4 add                      
                  END IF
               END IF
              #沖銷前置項目異動檔               
              #IF l_pmab.pmabsite <> 'ALL' THEN                                              #160622-00003#1 mark
               IF (l_pmab.pmabsite <> 'ALL') OR (l_pmab.pmabsite = 'ALL' AND l_sit_cnt = 0) THEN #160622-00003#1 add               
                  LET l_type = lc_param.type
                  LET l_xmab.xmab005 = l_xmab005 #換成前單據的據點(有可能跨據點)           #180731-00060#1 add
                  IF (lc_param.proj = 'S3' AND lc_param.proj_o = 'S1' AND l_xmdk000 = '5') THEN  #190802-00035#4 add  #財務段沖銷
                  ELSE                                                                           #190802-00035#4 add   
                     IF NOT s_credit_upd_xmab(l_pmab.pmab004,l_xmab.xmab005,lc_param.proj_o,l_type,
#                                              l_array1.xmab003_o,l_array1.xmab004_o,l_xmab.xmab015,l_amount) THEN    #180711-00034#1---mark
                                              l_array1.xmab003_o,l_array1.xmab004_o,l_array1.xmab015,l_amount,'N') THEN  #180711-00034#1---add #190802-00035#4 add 'N'
                           LET r_success = FALSE
                           RETURN r_success
                     END IF      
                  END IF     #190802-00035#4 add                  
               END IF   
               LET lc_param.proj_o = l_proj_o   #151208-00006#4
            END FOREACH  
            LET lc_param.proj_o = l_proj_o
         END IF
         #150518-00040-3--(E)         
      #END FOREACH  #160721-00021#1
         LET g_xmab005_t = l_xmab.xmab005
      END FOR       #160721-00021#1
   END FOREACH   
   
  #200410-00040#1-S add
   #出通單一對一回寫問題（出貨單項次少於出通項次）
    
   #一張出通單可以錄入多張訂單
   #找出出貨單中沒有的出通項次
   IF lc_param.proj = 'S3' AND lc_param.proj_o = 'S2' THEN 

       LET l_sql = " SELECT DISTINCT xmdcorga,xmdhdocno,xmdhseq ,xmdhsite,xmdh001 ,xmdh002, ",
                   "        xmdh006 ,xmdh015 ,xmdh016 ,xmdh017  ,xmdh020 ,xmdh021 ,xmdh027, ",
                   "        xmda015 ,xmda016 ,xmdd018 ,xmdd019 ,xmdg014  ,xmdc011 ,xmdc047, ",
                   "        xmdc010 ,xmdc015 ,xmdc016 ",
                   "   FROM xmdg_t,xmdh_t,xmdd_t,xmdc_t,xmda_t ",
                   "  WHERE xmdgent = xmdhent ",
                   "    AND xmdgdocno = xmdhdocno ",
                   "    AND xmdhent = xmddent ",
                   "    AND xmdh001 = xmdddocno ",
                   "    AND xmdh002 = xmddseq ",
                   "    AND xmdh003 = xmddseq1 ",
                   "    AND xmddent = xmdcent ",
                   "    AND xmdddocno = xmdcdocno",
                   "    AND xmddseq   = xmdcseq ",
                   "    AND xmdcent   = xmdaent ",
                   "    AND xmdcdocno = xmdadocno ",
                   "    AND xmdhent = ",g_enterprise,
                   "    AND xmdhdocno IN (SELECT DISTINCT xmdl001 FROM xmdl_t WHERE xmdlent = ",g_enterprise, " AND xmdldocno = '",lc_param.xmab003,"') ",
                   "  ORDER BY xmdcorga,xmdhseq "
                  
      PREPARE s_credit_s2_pr FROM l_sql
      DECLARE s_credit_s2_cr CURSOR FOR s_credit_s2_pr
           
      FOREACH s_credit_s2_cr INTO l_xmdcorga,l_xmdhdocno,l_xmdhseq  ,l_xmdhsite ,l_xmdh001 ,l_xmdh002 , 
                                  l_xmdh006 ,l_xmdh015  ,l_xmdh016  ,l_xmdh017  ,l_xmdh020 ,l_xmdh021 , 
                                  l_xmdh027 ,l_xmda015  ,l_xmda016  ,l_xmdd018  ,l_xmdd019 ,l_xmdg014 ,
                                  l_xmdc011 ,l_xmdc047  ,l_xmdc010  ,l_xmdc015  ,l_xmdc016
              
         LET l_cnt = 0
         SELECT COUNT(1) INTO l_cnt FROM xmdl_t 
          WHERE xmdlent = g_enterprise
            AND xmdl001 = l_xmdhdocno
            AND xmdl002 = l_xmdhseq 
            AND xmdldocno = lc_param.xmab003  #出貨單
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF 
         IF l_cnt > 0 THEN 
            #過濾掉出貨單已經存在的項次
            CONTINUE FOREACH 
         END IF 

         LET l_xmdcorga = ''
         SELECT xmdcorga INTO l_xmdcorga FROM xmdc_t 
          WHERE xmdcent = g_enterprise
            AND xmdcdocno = l_xmdh001
            AND xmdcseq = l_xmdh002
            
#         #單位換算   
#         IF l_xmdh015 <> l_xmdh020 THEN          
#            CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdh016) 
#               RETURNING l_success,l_xmdh016
#         END IF 
         
         #更新明細檔xmab_t
         #過賬&過賬還原
         IF lc_param.type = '1' THEN  #正向（過賬）
            #S2出通未出貨 立賬金額0，沖銷金額0，數量0，沖銷數量也是0
            
            UPDATE xmab_t SET xmab009 = 0, 
                              xmab010 = 0, 
                              xmab015 = 0, 
                              xmab016 = 0  
             WHERE xmabent = g_enterprise
               AND xmab001 = 'S2'
               AND xmab003 = l_xmdhdocno
               AND xmab004 = l_xmdhseq
               AND xmab005 = l_xmdhsite       
        

               
           #S1訂單未出通 沖銷金額，沖銷數量
           #差額計算      
            LET l_diff_num = l_xmdh016 - l_xmdh017
            #單位轉換（計價單位）
            IF l_xmdh015 <> l_xmdc010 THEN 
               CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdc010,l_diff_num) 
                    RETURNING l_success,l_diff_num
            END IF  
            
           #订单单价*数量
            CALL s_credit_get_amount(l_xmdhsite,l_diff_num,l_xmda015,l_xmda016,l_xmdc015,l_xmdc016) RETURNING l_xmdh027_2
            
            UPDATE xmab_t SET xmab010 = xmab010 - l_xmdh027_2 ,
                              xmab016 = xmab016 - l_diff_num 
             WHERE xmabent = g_enterprise
               AND xmab001 = 'S1'
               AND xmab003 = l_xmdh001
               AND xmab004 = l_xmdh002
               AND xmab005 = l_xmdcorga    


            SELECT pmab002,pmab003,pmab004,pmab005,pmab006 
              INTO l_pmab002,l_pmab003,l_pmab004,l_pmab005,l_pmab006 FROM pmab_t 
             WHERE pmabent = g_enterprise
               AND pmabsite = l_xmdcorga
               AND pmab001 = (SELECT pmab003 FROM pmab_t WHERE pmabent = g_enterprise AND pmab001 = lc_param.xmab006 AND pmabsite = l_xmdcorga)
             
            SELECT pmaa051,pmaa052,pmaa053,pmaa054,pmaa055
              INTO l_pmaa051,l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055 FROM pmaa_t
             WHERE pmaaent = g_enterprise
               AND pmaa001 = (SELECT pmaa052 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = lc_param.xmab006) 
            
            SELECT xmab013,xmab020 INTO l_xmab013,l_xmab020 FROM xmab_t 
             WHERE xmabent = g_enterprise
               AND xmab001 = 'S2'
               AND xmab003 = l_xmdhdocno
               AND xmab004 = l_xmdhseq
               AND xmab005 = l_xmdcorga
               
            #根據設置更新餘額檔xmac_t
            #過賬&過賬還原 （差異回寫）
            IF l_pmab002 MATCHES '[23]' THEN  #據點  
            
               #出通單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027,'S2','2','1',l_xmdcorga,l_pmab003,l_pmab004,l_pmab005,l_pmab006,l_xmab013)
                  RETURNING r_success

               #訂單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027_2,'S1','2','-1',l_xmdcorga,l_pmab003,l_pmab004,l_pmab005,l_pmab006,l_xmab013)
                  RETURNING r_success               

            END IF 

            IF l_pmaa051 MATCHES '[23]' THEN  #集團 
               #出通單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027,'S2','2','1','ALL',l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020)
                  RETURNING r_success

               #訂單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027_2,'S1','2','-1','ALL',l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020)
                  RETURNING r_success                  
            END IF 
        
         END IF 
        
                    
         IF lc_param.type = '2' THEN  #反向（過賬還原）
            #S2出通未出貨 立賬金額=xmdh027(不考慮換算)，沖銷金額0，數量=計價數量xmdh021，沖銷數量0
            #S1訂單未出通 沖銷金額=出通數量*訂單單價（差額），沖銷數量=出通數量（差額）
            
            UPDATE xmab_t SET xmab009 = l_xmdh027,
                              xmab010 = 0,
                              xmab015 = l_xmdh016,
                              xmab016 = 0
             WHERE xmabent = g_enterprise
               AND xmab001 = 'S2'
               AND xmab003 = l_xmdhdocno
               AND xmab004 = l_xmdhseq
               AND xmab005 = l_xmdhsite       
        
 
           #單位換算
           #S1訂單未出通 沖銷金額，沖銷數量
           #差額計算      
            LET l_diff_num = l_xmdh016 - l_xmdh017
            #單位轉換（計價單位）
            IF l_xmdh015 <> l_xmdc010 THEN 
               CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdc010,l_diff_num) 
                    RETURNING l_success,l_diff_num
            END IF         
           #订单单价*数量
           CALL s_credit_get_amount(l_xmdhsite,l_diff_num,l_xmda015,l_xmda016,l_xmdc015,l_xmdc016) RETURNING l_xmdh027_2
           
            UPDATE xmab_t SET xmab010 = xmab010 + l_xmdh027_2 ,
                              xmab016 = xmab016 + l_diff_num
             WHERE xmabent = g_enterprise
               AND xmab001 = 'S1'
               AND xmab003 = l_xmdh001
               AND xmab004 = l_xmdh002
               AND xmab005 = l_xmdcorga    


            SELECT pmab002,pmab003,pmab004,pmab005,pmab006 
              INTO l_pmab002,l_pmab003,l_pmab004,l_pmab005,l_pmab006 FROM pmab_t 
             WHERE pmabent = g_enterprise
               AND pmabsite = l_xmdcorga
               AND pmab001 = (SELECT pmab003 FROM pmab_t WHERE pmabent = g_enterprise AND pmab001 = lc_param.xmab006 AND pmabsite = l_xmdcorga)
             
            SELECT pmaa051,pmaa052,pmaa053,pmaa054,pmaa055 
              INTO l_pmaa051,l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055 FROM pmaa_t
             WHERE pmaaent = g_enterprise
               AND pmaa001 = (SELECT pmaa052 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = lc_param.xmab006)            
            
            #根據設置更新餘額檔xmac_t
            #過賬&過賬還原 （差異回寫）
            IF l_pmab002 MATCHES '[23]' THEN  #據點   
            
               #出通單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027,'S2','2','-1',l_xmdcorga,l_pmab003,l_pmab004,l_pmab005,l_pmab006,l_xmab013)
                  RETURNING r_success

               #訂單
               CALL s_credit_upd_xmac_count(l_xmdhsite,l_xmdg014,l_xmdh027_2,'S1','2','1',l_xmdcorga,l_pmab003,l_pmab004,l_pmab005,l_pmab006,l_xmab013)
                  RETURNING r_success                  
 
            END IF 

            IF l_pmaa051 MATCHES '[23]' THEN  #集團 
            
               #出通單
               CALL s_credit_upd_xmac_count(l_xmdcorga,l_xmdg014,l_xmdh027,'S2','2','-1','ALL',l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020)
                  RETURNING r_success

               #訂單
               CALL s_credit_upd_xmac_count(l_xmdcorga,l_xmdg014,l_xmdh027_2,'S1','2','1','ALL',l_pmaa052,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020)
                  RETURNING r_success                       
            END IF 
                     
         END IF                        
      END FOREACH 
   END IF       
  #200410-00040#1-E add
   
   RETURN r_success

END FUNCTION
################################################################################
# Descriptions...: 沖銷交易對象信用評核異動明細檔
# Memo...........:
# Usage..........: CALL s_credit_upd_xmab(p_xmaa001,p_xmab005,p_proj,p_type,p_xmab003,p_xmab004,p_xmab016,p_xmab010)
#                  RETURNING r_success
# Input parameter: p_xmaa001   信用評等編號
#                : p_xmab005   交易據點   
#                : p_proj      計算項目
#                : p_type      異動類型(1:正向, -1:反向)
#                : p_xmab003   單據編號
#                : p_xmab004   單據項次
#                : p_xmab016   沖銷數量
#                : p_xmab010   沖銷金額
#                : p_type2     金额是否强制给0 'Y'/'N'
# Return code....: r_success   TRUE/FALSE
# Date & Author..: 20150707 By Polly
# Modify.........:
################################################################################
PUBLIC FUNCTION s_credit_upd_xmab(p_xmaa001,p_xmab005,p_proj,p_type,p_xmab003,p_xmab004,p_xmab016,p_xmab010,p_type2)
DEFINE p_xmaa001    LIKE xmaa_t.xmaa001
DEFINE p_xmab005    LIKE xmab_t.xmab005
DEFINE p_proj       LIKE xmaa_t.xmaa002
DEFINE p_type       LIKE type_t.num5
DEFINE p_xmab003    LIKE xmab_t.xmab003
DEFINE p_xmab004    LIKE xmab_t.xmab004
DEFINE p_xmab010    LIKE xmab_t.xmab010
DEFINE p_xmab016    LIKE xmab_t.xmab016
DEFINE p_type2      LIKE type_t.chr1        #190802-00035#4 add  
DEFINE l_xmab002    LIKE xmab_t.xmab002
DEFINE l_cnt        LIKE type_t.num5
DEFINE r_success    LIKE type_t.num5
#190802-00035#4-S add
DEFINE l_xmdc019    LIKE xmdc_t.xmdc019
DEFINE l_pmdn019    LIKE pmdn_t.pmdn019
DEFINE l_xmdgdocno  LIKE xmdg_t.xmdgdocno
DEFINE l_success    LIKE type_t.num5
DEFINE l_flag       LIKE type_t.chr1
DEFINE l_ooba002    LIKE ooba_t.ooba002
DEFINE l_ooac004    LIKE ooac_t.ooac004
DEFINE l_pmdlsite   LIKE pmdl_t.pmdlsite
DEFINE l_xmab015    LIKE xmab_t.xmab015
#190802-00035#4-E add
DEFINE l_xmdgstus   LIKE xmdg_t.xmdgstus  #190802-00035#5 add
DEFINE  l_n         LIKE type_t.num5 #190802-00035#3 add
DEFINE l_sql        STRING  #PGS(D)-08172 memo add
#190924-00040#1-S add
DEFINE  l_xmdh016   LIKE xmdh_t.xmdh016
DEFINE  l_xmdh027   LIKE xmdh_t.xmdh027
DEFINE  l_s_0060    LIKE ooab_t.ooab002
DEFINE  l_slip      LIKE ooba_t.ooba001
DEFINE  l_xmdh006   LIKE xmdh_t.xmdh006
DEFINE  l_xmdh015   LIKE xmdh_t.xmdh015
DEFINE  l_xmdh020   LIKE xmdh_t.xmdh020
DEFINE  l_pmab004   LIKE pmab_t.pmab004
DEFINE  l_pmab005   LIKE pmab_t.pmab005
DEFINE  l_pmab006   LIKE pmab_t.pmab006
DEFINE  l_pmaa053   LIKE pmaa_t.pmaa053
DEFINE  l_pmaa054   LIKE pmaa_t.pmaa054
DEFINE  l_pmaa055   LIKE pmaa_t.pmaa055
DEFINE  l_xmab009_2 LIKE xmab_t.xmab009
DEFINE  l_xmab015_2 LIKE xmab_t.xmab015
DEFINE  l_xmab005   LIKE xmab_t.xmab005
DEFINE  l_xmab007   LIKE xmab_t.xmab007
DEFINE  l_xmab008   LIKE xmab_t.xmab008
DEFINE  l_xmab009   LIKE xmab_t.xmab009
DEFINE  l_xmab018   LIKE xmab_t.xmab018
DEFINE  l_xmab012   LIKE xmab_t.xmab012
DEFINE  l_xmab013   LIKE xmab_t.xmab013
DEFINE  l_xmab020   LIKE xmab_t.xmab020
DEFINE  l_pmab002   LIKE pmab_t.pmab002
DEFINE  l_pmaa051   LIKE pmaa_t.pmaa051
#190924-00040#1-E add

   WHENEVER ERROR CONTINUE 
   
   LET r_success = TRUE
   #檢查是否在事務中
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_xmab005) THEN
      LET p_xmab005 = g_site
   END IF

   SELECT xmaa004 INTO l_xmab002
     FROM xmaa_t
    WHERE xmaaent = g_enterprise
      AND xmaa001 = p_xmaa001
      AND xmaa002 = p_proj     
   IF cl_null(l_xmab002) THEN LET l_xmab002 = ' ' END IF 
   LET l_flag = 'N'   #190802-00035#4
   #1-2.回寫已沖銷數量(xmab016)時，增加判斷
   #    ###當訂單/採購單使用ckd/skd時，因為數量拆分的關系回寫已沖銷數量會虛增，故改使用最小套數回寫
   #    IF 為沖銷項目=訂單(S1) and 子特性(xmdc019)='2,3' THEN
   #       IF 走出通 then
   #          已沖銷數量 = 最小出通套數，可參考s_axmt500_count_min_xmdd014
   #       ELSE (不走出通) then
   #          已沖銷數量 = 最小出貨套數，可參考s_axmt500_count_min_xmdd014
   #       END IF 
   #    END IF
   #    IF 為沖銷項目=採購單(P1) and 子特性(pmdn019)='2,3' THEN
   #       已沖銷數量 = 最小出通套數，可參考s_apmt500_count_min_pmdo015
   #    END IF                  
   #190802-00035#4-S add 
   IF p_proj = 'S1' AND p_type2 = 'N' THEN 
      SELECT DISTINCT xmdc019,xmdgdocno INTO l_xmdc019,l_xmdgdocno FROM xmdc_t 
        LEFT OUTER JOIN xmdg_t ON xmdgent = xmdcent AND xmdg004 = xmdcdocno
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = p_xmab003
         AND xmdcseq = p_xmab004
      #PGS(D)-08172 memo -S- add
      #PGS(D)-08172 memo -E- add 
      IF l_xmdc019 MATCHES '[23]' THEN  #1.一般,2.CKD,3.SKD
         LET l_xmab015 = 0 
         SELECT xmab015 INTO l_xmab015 FROM xmab_t 
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005
         #出通單
         IF NOT cl_null(l_xmdgdocno) THEN 
            CALL s_axmt500_count_min_xmdd014(p_xmab003,p_xmab004,'1',p_xmab005,'1')
               RETURNING p_xmab016,l_success
            LET l_flag = 'Y'   
         #出貨單      
         ELSE
            CALL s_axmt500_count_min_xmdd014(p_xmab003,p_xmab004,'2',p_xmab005,'1')
               RETURNING p_xmab016,l_success 
            LET l_flag = 'Y'                     
         END IF 
         IF p_xmab016 > = l_xmab015 THEN   
            #CKD/SKD 數量是否沖銷單獨判斷,p_xmab016 這裡是沖銷總量
            LET g_xmab022 = 'Y'    #數量完全沖銷
         END IF 
         UPDATE xmab_t
            SET xmab016 = 0                   
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005               
      END IF          
   END IF 
  
   IF p_proj = 'P1' AND p_type2 = 'N' THEN                         
      SELECT DISTINCT pmdlsite,pmdn019 INTO l_pmdlsite,l_pmdn019 FROM pmdn_t,pmdl_t 
       WHERE pmdlent = pmdnent 
         AND pmdldocno = pmdndocno
         AND pmdnent = g_enterprise
         AND pmdndocno = p_xmab003
         AND pmdnseq = p_xmab004
      IF l_pmdn019 MATCHES '[23]' THEN 
         LET l_xmab015 = 0 
         SELECT xmab015 INTO l_xmab015 FROM xmab_t 
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005      
         CALL s_aooi200_get_slip(p_xmab003) RETURNING l_success,l_ooba002
         CALL cl_get_doc_para(g_enterprise,l_pmdlsite,l_ooba002,'D-BAS-0074') RETURNING l_ooac004
         IF l_ooac004 = 'N' THEN 
            CALL s_apmt500_count_min_pmdo015(p_xmab003,p_xmab004) 
               RETURNING p_xmab016,l_success
         ELSE  
            #一階段式採購收貨入庫 
            CALL s_apmt500_count_min_pmdo019(p_xmab003,p_xmab004) 
               RETURNING p_xmab016,l_success
         END IF 
         IF p_xmab016 > = l_xmab015 THEN 
            #CKD/SKD 數量是否沖銷單獨判斷,p_xmab016 這裡是沖銷總量
            LET g_xmab022 = 'Y'    #數量完全沖銷
         END IF          
         UPDATE xmab_t
            SET xmab016 = 0                   
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005
         LET l_flag = 'Y'        
      END IF                            
   END IF                         
   #190802-00035#4-E add 
        
   
   IF p_type = '2' THEN
      LET p_xmab010 = p_xmab010 * -1   
      IF l_flag = 'N' THEN    #190802-00035#4 add  #CKD/SKD 不需要考慮加減項，直接算出來的就是訂單未出貨套數      
         LET p_xmab016 = p_xmab016 * -1 
      END IF                  #190802-00035#4 add          
   END IF
   
   #190802-00035#4-S add   
   IF p_type2 = 'Y' THEN
      LET p_xmab016 = 0   
   END IF
   #190802-00035#4-E add   
   
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM xmab_t
    WHERE xmabent = g_enterprise
      AND xmab001 = p_proj
  #   AND xmab002 = l_xmab002  #160926-00001#1 mark
      AND xmab003 = p_xmab003
      AND xmab004 = p_xmab004
      AND xmab005 = p_xmab005  
   IF l_cnt > 0 THEN 
      #190802-00035#3 add s---   
      IF p_proj = 'S5' OR p_proj = 'S6' OR p_proj = 'P5' OR p_proj = 'P6' OR p_proj = 'S8' OR p_proj = 'P9' OR p_proj = 'S9' OR p_proj = 'S91' OR p_proj = 'P8' THEN    
         UPDATE xmab_t
            SET xmab010 = xmab010 + p_xmab010
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005
         LET l_n = 0    
         SELECT COUNT(1) INTO l_n FROM xmab_t
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005
            AND xmab009 = xmab010
         IF cl_null(l_n) THEN LET l_n = 0 END IF
         IF l_n > 0 THEN #金额已全部冲销完毕
            UPDATE xmab_t
               SET xmab022 = 'Y',
                   xmab016 = 1
             WHERE xmabent = g_enterprise
               AND xmab001 = p_proj
               AND xmab003 = p_xmab003
               AND xmab004 = p_xmab004
               AND xmab005 = p_xmab005 
         ELSE 
            UPDATE xmab_t
               SET xmab022 = 'N',
                   xmab016 = 0
             WHERE xmabent = g_enterprise
               AND xmab001 = p_proj
               AND xmab003 = p_xmab003
               AND xmab004 = p_xmab004
               AND xmab005 = p_xmab005           
         END IF         
      ELSE
      #190802-00035#3 add e---
      
        #190924-00040#1-S add
         #出貨單過賬=>出通轉出貨單控管：一對一(回寫出通量) 
         LET l_s_0060 = ''
         IF g_xmak001 = 'S3' AND p_proj = 'S2' THEN               
            CALL s_aooi200_get_slip(p_xmab003) RETURNING l_success,l_slip 
            LET l_s_0060 = cl_get_doc_para(g_enterprise,p_xmab005,l_slip,'D-BAS-0060') #出通轉出貨單控管D-BAS-0060            
         END IF 
         
         IF l_s_0060 = '3' AND g_xmak001 = 'S3' AND p_proj = 'S2' THEN 
           
            SELECT xmab009,xmab015,xmab005,xmab007,xmab008,xmab018,xmab012,xmab013,xmab020 
              INTO l_xmab009_2,l_xmab015_2,l_xmab005,l_xmab007,l_xmab008,l_xmab018,l_xmab012,l_xmab013,l_xmab020 FROM xmab_t 
             WHERE xmabent = g_enterprise
               AND xmab001 = p_proj
               AND xmab003 = p_xmab003
               AND xmab004 = p_xmab004
               AND xmab005 = p_xmab005   
               
            SELECT pmab002,pmab004,pmab005,pmab006 INTO l_pmab002,l_pmab004,l_pmab005,l_pmab006 FROM pmab_t 
             WHERE pmabent = g_enterprise
               AND pmabsite = l_xmab018
               AND pmab001 = l_xmab008
               
            SELECT pmaa051,pmaa053,pmaa054,pmaa055 INTO l_pmaa051,l_pmaa053,l_pmaa054,l_pmaa055 FROM pmaa_t 
             WHERE pmaaent = g_enterprise
               AND pmaa001 = l_xmab008                  

            IF p_type = '1' THEN   #正向
            
               LET l_xmab009 = l_xmab009_2 - p_xmab010  #差異金額   
               
               UPDATE xmab_t
                  SET xmab010 = p_xmab010,
                      xmab009 = p_xmab010,
                      xmab016 = p_xmab016,
                      xmab015 = p_xmab016
                WHERE xmabent = g_enterprise
                  AND xmab001 = p_proj
                  AND xmab003 = p_xmab003
                  AND xmab004 = p_xmab004
                  AND xmab005 = p_xmab005   
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'UPDATE2 xmab_t'
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF  

               #餘額檔更新
               #據點      
               IF l_pmab002 MATCHES '[23]' THEN                
                  IF NOT s_credit_upd_xmac_count(l_xmab005,l_xmab007,l_xmab009,p_proj,'2','1',l_xmab018,l_xmab008,l_pmab004,l_pmab005,l_pmab006,l_xmab013) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF 
               
               #集團
               IF l_pmaa051 MATCHES '[23]' THEN    
                  IF NOT s_credit_upd_xmac_count(l_xmab005,l_xmab007,l_xmab009,p_proj,'2','1','ALL',l_xmab008,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF               
               END IF 
               
            END IF 
            
            IF p_type = '2' THEN   #反向
            
               LET l_xmdh016 = 0
               LET l_xmdh027 = 0
               SELECT xmdh006,xmdh015,xmdh016,xmdh020,xmdh027 INTO l_xmdh006,l_xmdh015,l_xmdh016,l_xmdh020,l_xmdh027 FROM xmdh_t 
                WHERE xmdhent = g_enterprise
                  AND xmdhdocno = p_xmab003
                  AND xmdhseq = p_xmab004
               CALL s_aooi250_convert_qty(l_xmdh006,l_xmdh015,l_xmdh020,l_xmdh016)
                      RETURNING l_success,l_xmdh016                                            
               UPDATE xmab_t
                  SET xmab010 = 0,
                      xmab009 = l_xmdh027,
                      xmab016 = 0,
                      xmab015 = l_xmdh016
                WHERE xmabent = g_enterprise
                  AND xmab001 = p_proj
                  AND xmab003 = p_xmab003
                  AND xmab004 = p_xmab004
                  AND xmab005 = p_xmab005   
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'UPDATE3 xmab_t'
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF      

               #餘額檔更新
               LET l_xmab009 = l_xmdh027 - l_xmab009_2  #差異金額 (過賬還原要用出通單金額，因為此時p_xmab010的金額已經不一定等於xmdh027)  
               #據點   
               IF l_pmab002 MATCHES '[23]' THEN                 
                  IF NOT s_credit_upd_xmac_count(l_xmab005,l_xmab007,l_xmab009,p_proj,'2','-1',l_xmab018,l_xmab008,l_pmab004,l_pmab005,l_pmab006,l_xmab013) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF 
               
               #集團
               IF l_pmaa051 MATCHES '[23]' THEN 
                  IF NOT s_credit_upd_xmac_count(l_xmab005,l_xmab007,l_xmab009,p_proj,'2','-1','ALL',l_xmab008,l_pmaa053,l_pmaa054,l_pmaa055,l_xmab020) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF       
               END IF 
               
            END IF             
         ELSE            
        #190924-00040#1-E add        
            UPDATE xmab_t
               SET xmab010 = xmab010 + p_xmab010,
                   xmab016 = xmab016 + p_xmab016
             WHERE xmabent = g_enterprise
               AND xmab001 = p_proj
            #  AND xmab002 = l_xmab002  #160926-00001#1 mark
               AND xmab003 = p_xmab003
               AND xmab004 = p_xmab004
               AND xmab005 = p_xmab005   
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'UPDATE xmab_t'
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF  #190924-00040#1 add 
         
         #190802-00035#5-S add
         #出通單中止出貨更新xmak_t 
         IF g_xmak001 = 'S2' AND p_proj = 'S1' THEN
            LET l_xmdgstus = ''
            SELECT xmdgstus INTO l_xmdgstus FROM xmdg_t 
             WHERE xmdgent = g_enterprise
               AND xmdgdocno = g_xmak002
            IF l_xmdgstus = 'Q' THEN   #出通中止出貨
               UPDATE xmak_t 
                  SET xmak007 = xmak007 + p_xmab010,
                      xmak008 = xmak008 + p_xmab016
                WHERE xmakent = g_enterprise
                  AND xmak001 = g_xmak001
                  AND xmak002 = g_xmak002
                  AND xmak003 = g_xmak003
                  AND xmak004 = p_proj
                  AND xmak005 = p_xmab003     
                  AND xmak006 = p_xmab004     
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'UPDATE xmak_t'
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF
            END IF                
         END IF             
         #190802-00035#5-E add
         
      END IF  #190802-00035#3 add  
     #190409-00031#1 add start -----
      #IF NOT cl_null(g_xmab017) THEN #190802-00035#4 mark
      IF NOT cl_null(g_xmab022) THEN  #190802-00035#4 add
         UPDATE xmab_t
            #SET xmab017 = g_xmab017  #190802-00035#4 mark
            SET xmab022 = g_xmab022   #190802-00035#4            
          WHERE xmabent = g_enterprise
            AND xmab001 = p_proj
            AND xmab003 = p_xmab003
            AND xmab004 = p_xmab004
            AND xmab005 = p_xmab005    
         LET g_xmab017 = ''
         LET g_xmab022 = ''   #190802-00035#4 add
      END IF
     #190409-00031#1 add end   -----
   END IF   
   RETURN r_success     
      
END FUNCTION

################################################################################
# Descriptions...: 計算原幣含稅金額
# Memo...........:
# Usage..........: CALL s_credit_get_amount(p_xmab005,p_xmab016,p_curr,p_rate,p_price,p_oodb002)
#                  RETURNING   l_amount
#                : p_xmab005   交易營運據點
#                : p_xmab016   數量
#                : p_curr      幣別
#                : p_rate      匯率
#                : p_price     單價
#                : p_oodb002   稅別
# Return code....: r_xrcd105   原幣含稅金額
# Date & Author..: 150708 By Polly
# Modify.........:
################################################################################
PUBLIC FUNCTION s_credit_get_amount(p_xmab005,p_xmab016,p_curr,p_rate,p_price,p_oodb002)
DEFINE p_xmab005    LIKE xmab_t.xmab005
DEFINE p_xmab016    LIKE xmab_t.xmab016
DEFINE p_curr       LIKE xrcd_t.xrcd100
DEFINE p_rate       LIKE xrcd_t.xrcd101
DEFINE p_price      LIKE xmdc_t.xmdc015
DEFINE p_oodb002    LIKE oodb_t.oodb002
DEFINE l_xrcd103    LIKE xrcd_t.xrcd103         #原幣未稅金額
DEFINE l_xrcd104    LIKE xrcd_t.xrcd104         #原幣稅額    
DEFINE l_xrcd113    LIKE xrcd_t.xrcd113         #本幣未稅金額
DEFINE l_xrcd114    LIKE xrcd_t.xrcd114         #本幣稅額    
DEFINE l_xrcd115    LIKE xrcd_t.xrcd115         #本幣含稅金額
DEFINE l_amount     LIKE xrcd_t.xrcd102         #計稅基礎 
DEFINE r_xrcd105    LIKE xrcd_t.xrcd105         #原幣含稅金額


   WHENEVER ERROR CONTINUE 
   
   LET l_amount = 0
   LET l_amount = p_xmab016 * p_price
   IF cl_null(p_oodb002) THEN       #財物後段　沒有稅別可以推算
      LET r_xrcd105 = l_amount
   ELSE
      CALL s_tax_count(p_xmab005,p_oodb002,l_amount,p_xmab016,p_curr,p_rate)
           RETURNING l_xrcd103,l_xrcd104,r_xrcd105,l_xrcd113,l_xrcd114,l_xrcd115
   END IF    
   IF cl_null(r_xrcd105) THEN LET r_xrcd105 = 0 END IF 
   RETURN r_xrcd105

#CALL s_credit_get_amount(l_array.xmab005,l_array.xmab015,l_array.curr_o,l_array.rate_o,l_array.price_o,l_array.oodb002_o)
END FUNCTION

################################################################################
# Descriptions...: 多角排除
# Memo...........:
# Usage..........: CALL s_credit_aic_chk(p_xmaa002,p_docno)
#                  RETURNING r_success
# Input parameter: p_xmaa002 目前計算項目
#                : p_docno   單據單號
# Return code....: r_success TRUE:做信用額度 FALSE:不做信用額度
#                : 
# Date & Author..: 150820 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_credit_aic_chk(p_xmaa002,p_docno)
   DEFINE p_xmaa002      LIKE xmaa_t.xmaa002
   DEFINE p_docno        LIKE xmda_t.xmdadocno #單據單號
   DEFINE r_success      LIKE type_t.num5
   
   DEFINE l_icaa003      LIKE icaa_t.icaa003
   DEFINE l_icab001      LIKE icab_t.icab001
   DEFINE l_icab002      LIKE icab_t.icab002
   DEFINE l_icab003      LIKE icab_t.icab003
   DEFINE l_max_icab002  LIKE icab_t.icab002
   
   WHENEVER ERROR CONTINUE 
   
   LET r_success = TRUE
   LET l_icab001 = ''   #多角流程代碼
   LET l_icab003 = ''   #營運據點
   
   #S1:訂單未出貨 xmda_t
   IF p_xmaa002 = 'S1' THEN
      SELECT xmda050,xmdasite
        INTO l_icab001,l_icab003
        FROM xmda_t
       WHERE xmdaent = g_enterprise
         AND xmdadocno = p_docno
   END IF
   
   #S2:出通單未轉出貨 xmdg_t
   IF p_xmaa002 = 'S2' THEN
      SELECT xmdg056,xmdgsite
        INTO l_icab001,l_icab003
        FROM xmdg_t
       WHERE xmdgent = g_enterprise
         AND xmdgdocno = p_docno
   END IF
   
   #S3:出貨未開發票 xmdk_t
   #S4:銷退 xmdk_t
   IF p_xmaa002 = 'S3' OR p_xmaa002 = 'S4' THEN
      SELECT xmdk044,xmdksite
        INTO l_icab001,l_icab003
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_docno
   END IF
   
   #P1:採購未收貨 pmdl_t
   IF p_xmaa002 = 'P1' THEN
      SELECT pmdl051,pmdlsite
        INTO l_icab001,l_icab003
        FROM pmdl_t
       WHERE pmdlent = g_enterprise
         AND pmdldocno = p_docno
   END IF
  
   #P2:收貨未入庫 pmds_t
   #P3:入庫未立應付帳款 pmds_t
   #P4:倉退 pmds_t
   IF p_xmaa002 = 'P2' OR p_xmaa002 = 'P3' OR p_xmaa002 = 'P4' THEN
      SELECT pmds053,pmdssite
        INTO l_icab001,l_icab003
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = p_docno
   END IF
   
   IF NOT cl_null(l_icab001) AND NOT cl_null(l_icab003) THEN
      LET l_icaa003 = ''  #流程類型
      LET l_icab002 = ''  #站別
      
#PGS(D)-01534-S mark      
#      SELECT icaa003,icab002
#        INTO l_icaa003,l_icab002
#        FROM icaa_t,icab_t
#       WHERE icaaent = icabent AND icabent = g_enterprise
#         AND icaa001 = icab001 AND icab001 = l_icab001
#         AND icab003 = l_icab003
#PGS(D)-01534-E mark         

#PGS(D)-01534-S add
      SELECT icaa003,icab002
        INTO l_icaa003,l_icab002
        FROM icaa_t,icab_t
       WHERE icaaent = icabent AND icabent = g_enterprise
         AND icaa001 = icab001 AND icab001 = l_icab001
         AND icab003 = l_icab003         

#PGS(D)-01534-E add
      #191001-00011#1 mark---(S)
      #若為初始站，回傳True要執行信用額度
      #IF l_icab002 <> 0 THEN
      #   #銷售、代採購非初始站，回傳FALSE不執行信用額度
      #   IF l_icaa003 <> '3' THEN
      #      LET r_success = FALSE
      #   ELSE
      #      LET l_max_icab002 = ''
      #      SELECT MAX(icab002)
      #        INTO l_icab002
      #        FROM icab_t
      #       WHERE icabent = g_enterprise
      #         AND icab001 = l_icab001
      #         AND icab003 = l_icab003
      #      
      #      #代採購指定最終供應商若非最終站，回傳FALSE不執行信用額度
      #      IF l_icab002 <> l_max_icab002 THEN
      #         LET r_success = FALSE
      #      END IF
      #   END IF
      #END IF
      #191001-00011#1 mark---(E)
      #191001-00011#1 add---(S)
      CASE l_icaa003
         #當l_icaa003=1.銷售：第0站(l_icab002=0)計算項目(p_xmaa002)=S*的回傳True要執行信用額度(r_success = TRUE)
         WHEN '1'
            IF l_icab002 <> 0 OR p_xmaa002 NOT MATCHES 'S*'THEN
               LET r_success = FALSE
            END IF
         #當l_icaa003=2.代採買：回傳FALSE不執行信用額度(r_success = FALSE)
         WHEN '2'
            LET r_success = FALSE
         #當l_icaa003=3.代採買最終供應商：最終站(l_icab002=l_max_icab002)計算項目(p_xmaa002)=P*的回傳True要執行信用額度(r_success = TRUE)
         WHEN '3'
            LET l_max_icab002 = ''
            SELECT MAX(icab002)
              INTO l_max_icab002
              FROM icab_t
             WHERE icabent = g_enterprise
               AND icab001 = l_icab001
               AND icab003 = l_icab003
            
            #代採購指定最終供應商若非最終站，回傳FALSE不執行信用額度
            IF l_icab002 <> l_max_icab002 OR p_xmaa002 NOT MATCHES 'P*' THEN
               LET r_success = FALSE
            END IF
      END CASE
      #191001-00011#1 add---(E)
      
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取匯率
# Memo...........:
# Usage..........: CALL s_credit_get_exrate(p_type,p_key1,p_ooan004,p_ooan002,p_ooan003,p_amount,ls_js)
#                  RETURNING r_rate
# Input parameter: p_type    類型(決定p_key1是SITE還是帳套)
#                            1.SITE 2.帳套
#                : p_key1    SITE(ooef001) 或 帳套(glaald) 
#                : p_ooan004 日期
#                : p_ooan002 來源幣別
#                : p_ooan003 目的幣別
#                : p_amount  來源幣別的金額(為NULL/0/1時,表示來源幣別的數量為1)
#                : ls_js     string JSON傳參
#                               p_scc40 匯率類型(取自azzi600 scc40的值) 11.銀行買入  12.銀行賣出  13.銀行中價  21.海關買入  22.海關賣出                           
#                               p_curr  單據幣別
#                               p_rate  單據匯率
# Return code....: r_rate    匯率(若p_amount有傳入值時,回傳p_amount*匯率)
# Date & Author..: 2017/03/06 By fionchen(#160906-00029#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_credit_get_exrate(p_type,p_key1,p_ooan004,p_ooan002,p_ooan003,p_amount,ls_js)
   DEFINE p_type          LIKE type_t.chr1       #类型 1.SITE 2.帐套 3.汇率参数表号   
   DEFINE p_key1          LIKE ooef_t.ooef001    #KEY值
   DEFINE p_ooan004       LIKE ooan_t.ooan004    #日期
   DEFINE p_ooan002       LIKE ooan_t.ooan002    #交易币种
   DEFINE p_ooan003       LIKE ooan_t.ooan003    #基础币种
   DEFINE p_amount        LIKE ooan_t.ooan005    #交易币种的数量
   DEFINE p_scc40         LIKE type_t.chr2       #汇率类型
   DEFINE ls_js           STRING
   DEFINE p_curr          LIKE ooan_t.ooan002    #190802-00035#4 add
   DEFINE p_rate          LIKE xmab_t.xmab013    #190802-00035#4 add
   DEFINE l_tmp           LIKE ooan_t.ooan005    #中间值
   DEFINE l_tmp1          LIKE ooan_t.ooan005    #中间值
   DEFINE l_tmp2          LIKE ooan_t.ooan005    #中间值
   DEFINE r_rate          LIKE ooan_t.ooan005
   DEFINE r_rate1         LIKE ooan_t.ooan005
   DEFINE r_rate2         LIKE ooan_t.ooan005
   DEFINE l_ooan001       LIKE ooan_t.ooan001    #汇率参照表号
   DEFINE l_ooaj004       LIKE ooaj_t.ooaj004    #金额精度
   DEFINE l_ooaj005       LIKE ooaj_t.ooaj005    #汇率精度
   DEFINE l_ooan013       LIKE ooan_t.ooan013    #汇率方向
   DEFINE l_ooef014       LIKE ooef_t.ooef014    #币种参照表
   DEFINE l_ooef016       LIKE ooef_t.ooef016    #主幣別編號
   DEFINE l_conv          LIKE type_t.chr1       #正向还是反向关系存在
   DEFINE l_conv1         LIKE type_t.chr1       #正向还是反向关系存在
   DEFINE l_conv2         LIKE type_t.chr1       #正向还是反向关系存在
   DEFINE l_ooan RECORD  #日匯率資料檔
       ooanent LIKE ooan_t.ooanent, #企业编号
       ooan001 LIKE ooan_t.ooan001, #汇率参照表号
       ooan002 LIKE ooan_t.ooan002, #交易币种
       ooan003 LIKE ooan_t.ooan003, #基础币种
       ooan004 LIKE ooan_t.ooan004, #日期
       ooan005 LIKE ooan_t.ooan005, #银行买入汇率
       ooan006 LIKE ooan_t.ooan006, #银行卖出汇率
       ooan007 LIKE ooan_t.ooan007, #银行中价汇率
       ooan008 LIKE ooan_t.ooan008, #海关买入汇率
       ooan009 LIKE ooan_t.ooan009, #海关卖出汇率
       ooan010 LIKE ooan_t.ooan010, #更新时间
       ooan011 LIKE ooan_t.ooan011, #更新方式
       ooan012 LIKE ooan_t.ooan012, #交易货币批量
       ooan013 LIKE ooan_t.ooan013 #汇率录入方式
   END RECORD
   DEFINE l_ooan004_1     LIKE ooan_t.ooan004    #汇率日期
   DEFINE l_ooan004_2     LIKE ooan_t.ooan004    #汇率日期 
   DEFINE l_ooan004_3     LIKE ooan_t.ooan004    #汇率日期
   DEFINE l_ooan004_4     LIKE ooan_t.ooan004    #汇率日期
   DEFINE l_ooan004_5     LIKE ooan_t.ooan004    #汇率日期
   DEFINE l_ooan004_6     LIKE ooan_t.ooan004    #汇率日期   
   DEFINE l_ooan004       LIKE ooan_t.ooan004    #汇率日期  
   DEFINE l_ooan002       LIKE ooan_t.ooan002
   DEFINE l_ooan003       LIKE ooan_t.ooan003
   DEFINE l_extra         LIKE type_t.chr1       #是否來源與目的幣別皆不是本幣
   DEFINE l_ooab002       LIKE ooab_t.ooab002   #1:日汇率，2：月汇率    #181229-00015#1 add 
#190802-00035#4-S add   
   DEFINE l_ooab002_10    LIKE ooba_t.ooba002
   DEFINE l_ooab002_11    LIKE ooba_t.ooba002
   DEFINE l_ooab002_13    LIKE ooba_t.ooba002
   DEFINE l_ooab002_14    LIKE ooba_t.ooba002
   DEFINE l_ooab002_15    LIKE ooba_t.ooba002   
DEFINE lc_param  RECORD
             scc40        LIKE type_t.chr2,       #汇率类型
             curr         LIKE ooan_t.ooan002,    #190802-00035#4 add
             rate         LIKE xmab_t.xmab013     #190802-00035#4 add
            ,xmab001      LIKE xmab_t.xmab001     #計算項目     #200116-00002#1 add
                 END RECORD     
#190802-00035#4-E add 

#     1-1.元件s_credit_get_exrate 一開始時增加判斷
#         IF 來源幣別 = 目的幣別 THEN
#            匯率 = 1
#         ELSE
#            IF 信用額度採用匯率類型(S-BAS-0013) = 交易單據的匯率類型(S-BAS-0010/S-BAS-0011/S-BAS-0014/S-BAS-0015) THEN
#               IF 目的幣別 = 據點幣別(此次是抓據點匯率時為xmab012，抓集團匯率時為xmab019) THEN
#                  匯率 = 單據單頭的匯率
#               END IF
#            END IF
#         END IF

#190802-00035#4-S add
   CALL util.JSON.parse(ls_js,lc_param)  
   LET p_scc40 = lc_param.scc40
   IF p_ooan002 = p_ooan003 THEN 
      LET r_rate = 1
      RETURN r_rate  #200507-00006#1 add
   ELSE
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0010') RETURNING l_ooab002_10
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0011') RETURNING l_ooab002_11
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0014') RETURNING l_ooab002_14
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0015') RETURNING l_ooab002_15
      CALL cl_get_para(g_enterprise,g_site,'S-BAS-0013') RETURNING l_ooab002_13
      
      IF l_ooab002_13 = l_ooab002_10 OR l_ooab002_13 = l_ooab002_11 OR 
         l_ooab002_13 = l_ooab002_14 OR l_ooab002_13 = l_ooab002_15 THEN
         IF p_ooan003 = lc_param.curr THEN 
            LET r_rate = lc_param.rate
            RETURN r_rate #200507-00006#1 add
         END IF       
      END IF 

   END IF 
#190802-00035#4-E add
         
  #181229-00015#1 add--s
   IF p_type = '1' THEN
         #200116-00002#1---mark---start---
         #IF  g_prog MATCHES '*apm*'  THEN           
         #   CALL cl_get_para(g_enterprise,g_site,'S-BAS-0052') RETURNING l_ooab002 
         #END IF
         #IF  g_prog MATCHES '*axm*'  THEN
         #   CALL cl_get_para(g_enterprise,g_site,'S-BAS-0053') RETURNING l_ooab002   
         #END IF
         #IF l_ooab002 = '1' THEN
         #
         #END IF
         #IF l_ooab002 = '2' THEN
         #   CALL s_aooi170_get_exrate(p_type,p_key1,p_ooan004,p_ooan002,p_ooan003,p_amount,p_scc40)  RETURNING   r_rate
         #   RETURN r_rate 
         #END IF
         #200116-00002#1---mark---end---
         #200116-00002#1---add---start---
         CASE 
            WHEN lc_param.xmab001 MATCHES 'P*'
               CALL cl_get_para(g_enterprise,g_site,'S-BAS-0052')     #採購 
                 RETURNING l_ooab002 
            WHEN lc_param.xmab001 MATCHES 'S*'
               CALL cl_get_para(g_enterprise,g_site,'S-BAS-0053')     #銷售 
                 RETURNING l_ooab002 
            WHEN g_prog MATCHES 'apm*' 
               CALL cl_get_para(g_enterprise,g_site,'S-BAS-0052')     #採購
                 RETURNING l_ooab002 
            WHEN g_prog MATCHES 'axm*' 
               CALL cl_get_para(g_enterprise,g_site,'S-BAS-0053')     #銷售 
                 RETURNING l_ooab002 
            OTHERWISE
               CALL cl_get_para(g_enterprise,g_site,'S-BAS-0052') 
                 RETURNING l_ooab002 
         END CASE
         IF cl_null(l_ooab002) THEN
            LET l_ooab002 = '1'
         END IF
         #參數若設為採取月匯率則抓aooi170裡的設定
         #設為日匯率則往下繼續執行
         IF l_ooab002 = '2' THEN         #抓月匯率
            CALL s_aooi170_get_exrate(p_type,p_key1,p_ooan004,p_ooan002,p_ooan003,p_amount,p_scc40)  
              RETURNING   r_rate
            RETURN r_rate 
         END IF
         #200116-00002#1---add---end---
   END IF
   #181229-00015#1 add--e
   
   IF cl_null(p_amount) OR p_amount = 0 THEN
      LET p_amount = 1
   END IF
   LET r_rate = 1 * p_amount                      

   #交易币种与基础币种一致
   IF p_ooan002 = p_ooan003 THEN 
      RETURN r_rate
   END IF   
   
   #IF cl_null(p_ooan004) THEN LET p_ooan004 = TODAY END IF #191001-00015#1 mark
   IF cl_null(p_ooan004) THEN LET p_ooan004 = cl_get_today() END IF #191001-00015#1 add
   
   #主程序时,可以把交易币种的金额传入,返回时,会是以该金额*汇率做返回
   #当汇率小数位很多时且总金额庞大时,将交易金额传进来可以有效的改善数字的有效精度问题
   IF cl_null(p_amount) OR p_amount = 0 THEN LET p_amount = 1 END IF
   
   IF cl_null(p_type) OR p_type NOT MATCHES '[12]' THEN       #类型
      #取汇率元件的第一参数：类型 为空或错误，有效值范围为：1.按营运据点 2.按账套
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00604'
      LET g_errparam.extend = p_type
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate      
   END IF
   IF cl_null(p_key1) THEN
      #取汇率元件的第二参数：营运据点 或 账套编号 为空
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00605'
#      LET g_errparam.extend = p_key1    #180124-00045#1---mark
      LET g_errparam.extend = s_fin_get_colname('','xmab004'),':',g_xmab004,s_fin_get_colname('','xmab006'),':',g_xmab006   #180124-00045#1---add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate 
   END IF
   
   IF cl_null(p_ooan004) THEN
      #取汇率元件的第三参数：汇率日期值 为空
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00606'
#      LET g_errparam.extend = p_ooan004  #180124-00045#1---mark
      LET g_errparam.extend = s_fin_get_colname('','xmab004'),':',g_xmab004,s_fin_get_colname('','xmab006'),':',g_xmab006   #180124-00045#1---add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate       
   END IF 
   
   IF cl_null(p_ooan002) THEN
      #取汇率元件的第四参数：来源币种 为空
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00607'
#      LET g_errparam.extend = p_ooan002  #180124-00045#1---mark
      LET g_errparam.extend = s_fin_get_colname('','xmab004'),':',g_xmab004,s_fin_get_colname('','xmab006'),':',g_xmab006   #180124-00045#1---add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate   
   END IF

   IF cl_null(p_ooan003) THEN
      #取汇率元件的第五参数：目的币种 为空
      #sub-01431 交易對象據點料的額度計算幣別為空！
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'sub-00608'    #170325-00044#1 mark
      #LET g_errparam.code = 'sub-01431'    #170325-00044#1 add   #190802-00035#4 mark
#      LET g_errparam.extend = p_ooan003  #180124-00045#1---mark
      LET g_errparam.code = 'sub-01531'     #190802-00035#4 add
      LET g_errparam.extend = s_fin_get_colname('','xmab004'),':',g_xmab004,s_fin_get_colname('','xmab006'),':',g_xmab006   #180124-00045#1---add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate         
   END IF
   
   IF cl_null(p_scc40) OR (p_scc40 <> '11' AND p_scc40 <> '12' AND p_scc40 <> '13' AND p_scc40 <> '21' AND p_scc40 <> '22' )THEN
      #取汇率元件的第五参数：汇率类型 为空或错误，有效值范围为：11/12/13/21/22
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00609'
#      LET g_errparam.extend = p_scc40  #180124-00045#1---mark
      LET g_errparam.extend = s_fin_get_colname('','xmab004'),':',g_xmab004,s_fin_get_colname('','xmab006'),':',g_xmab006   #180124-00045#1---add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_rate
   END IF
   
   #1.取得汇率参照表编号,币种参照表编号
   CASE p_type
        WHEN '1'  SELECT ooef014,ooef015,ooef016 INTO l_ooef014,l_ooan001,l_ooef016 FROM ooef_t 
                   WHERE ooefent = g_enterprise AND ooef001 = p_key1 
        WHEN '2'  SELECT glaa026,glaa002,glaa001 INTO l_ooef014,l_ooan001,l_ooef016 FROM glaa_t 
                   WHERE glaaent = g_enterprise AND glaald  = p_key1
   END CASE
   IF SQLCA.sqlcode OR cl_null(l_ooan001) THEN
      #获取不到参照表信息
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00041'
      LET g_errparam.extend = p_key1
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_rate
   END IF
   
   #2.取基础币种的金额精度--若有传入p_amount时,返回的是金额,非汇率
   CALL s_curr_sel_ooaj004(l_ooef014,p_ooan002)   
        RETURNING l_ooaj004
        
   #3.取基础币种的汇率精度
   CALL s_curr_sel_ooaj005(l_ooef014,p_ooan002)   
        RETURNING l_ooaj005   
        
   #4.传入的日期未见得有维护汇率,则取最近的一笔汇率做返回
   #4.1取最近的正向日期
   SELECT MAX(ooan004) INTO l_ooan004_1
     FROM ooan_t,ooam_t
    WHERE ooanent =  g_enterprise
      AND ooan001 =  l_ooan001   #汇率参照表号
      AND ooan002 =  p_ooan002   #交易币种
      AND ooan003 =  p_ooan003   #基础币种
      AND ooan004 <= p_ooan004   #日期
      AND ooament =  ooanent
      AND ooam001 =  ooan001
      AND ooam003 =  ooan003
      AND ooam004 =  ooan004
      AND ooamstus = 'Y'  
   #4.2取最近的反向日期      
   SELECT MAX(ooan004) INTO l_ooan004_2
     FROM ooan_t,ooam_t
    WHERE ooanent =  g_enterprise
      AND ooan001 =  l_ooan001   #汇率参照表号
      AND ooan002 =  p_ooan003   #基础币种
      AND ooan003 =  p_ooan002   #交易币种
      AND ooan004 <= p_ooan004   
      AND ooament =  ooanent
      AND ooam001 =  ooan001
      AND ooam003 =  ooan003
      AND ooam004 =  ooan004
      AND ooamstus = 'Y'   
      
   LET l_extra = 'N'    
   LET l_conv1 = NULL  
   LET l_conv2 = NULL     
   
   #無設定匯率,若目的幣別與來源幣別都不是本幣時,在取不到直接的來源幣別與目的幣別匯率時,則取來源對本幣匯率x本幣對目的匯率
   IF (p_ooan002 <> l_ooef016) AND (p_ooan003 <> l_ooef016) THEN
      LET l_extra = 'Y'
      #1取最近的正向日期(來源幣別)
      SELECT MAX(ooan004) INTO l_ooan004_3
        FROM ooan_t,ooam_t
       WHERE ooanent =  g_enterprise
         AND ooan001 =  l_ooan001   #汇率参照表号
         AND ooan002 =  p_ooan002   #交易币种
         AND ooan003 =  l_ooef016   #本幣
         AND ooan004 <= p_ooan004   #日期
         AND ooament =  ooanent
         AND ooam001 =  ooan001
         AND ooam003 =  ooan003
         AND ooam004 =  ooan004
         AND ooamstus = 'Y'  
      #2取最近的反向日期(來源幣別)      
      SELECT MAX(ooan004) INTO l_ooan004_4
        FROM ooan_t,ooam_t
       WHERE ooanent =  g_enterprise
         AND ooan001 =  l_ooan001   #汇率参照表号
         AND ooan002 =  l_ooef016   #本幣
         AND ooan003 =  p_ooan002   #交易币种
         AND ooan004 <= p_ooan004   
         AND ooament =  ooanent
         AND ooam001 =  ooan001
         AND ooam003 =  ooan003
         AND ooam004 =  ooan004
         AND ooamstus = 'Y'        
      
      IF cl_null(l_ooan004_3) THEN
         IF cl_null(l_ooan004_4) THEN 
            LET l_conv1 = NULL
         ELSE         
            LET l_conv1 = '2'                #基础币种对交易币种
         END IF
      ELSE
         #IF cl_null(l_ooan004_3) THEN   #190305-00036#1 mark
         IF cl_null(l_ooan004_4) THEN   #190305-00036#1 add
            LET l_conv1 = '1'                #交易币种对基础币种     
         ELSE
            IF l_ooan004_3 >= l_ooan004_4 THEN
               LET l_conv1 = '1'             #交易币种对基础币种   
            ELSE
               LET l_conv1 = '2'             #基础币种对交易币种
            END IF      
         END IF
      END IF   
      #3取最近的正向日期(目的幣別)
      SELECT MAX(ooan004) INTO l_ooan004_5
        FROM ooan_t,ooam_t
       WHERE ooanent =  g_enterprise
         AND ooan001 =  l_ooan001   #汇率参照表号
         AND ooan002 =  l_ooef016   #本幣
         AND ooan003 =  p_ooan003   #目的幣別
         AND ooan004 <= p_ooan004   #日期
         AND ooament =  ooanent
         AND ooam001 =  ooan001
         AND ooam003 =  ooan003
         AND ooam004 =  ooan004
         AND ooamstus = 'Y'  
      #4取最近的反向日期(目的幣別)      
      SELECT MAX(ooan004) INTO l_ooan004_6
        FROM ooan_t,ooam_t
       WHERE ooanent =  g_enterprise
         AND ooan001 =  l_ooan001   #汇率参照表号
         AND ooan002 =  p_ooan003   #目的幣別
         AND ooan003 =  l_ooef016   #本幣
         AND ooan004 <= p_ooan004   
         AND ooament =  ooanent
         AND ooam001 =  ooan001
         AND ooam003 =  ooan003
         AND ooam004 =  ooan004
         AND ooamstus = 'Y'     
      
      IF cl_null(l_ooan004_5) THEN
         IF cl_null(l_ooan004_6) THEN       
            LET l_conv2 = NULL 
         ELSE
            LET l_conv2 = '2'                #基础币种对交易币种
         END IF
      ELSE
         IF cl_null(l_ooan004_5) THEN
            LET l_conv2 = '1'                #交易币种对基础币种     
         ELSE
            IF l_ooan004_5 >= l_ooan004_6 THEN
               LET l_conv2 = '1'             #交易币种对基础币种   
            ELSE
               LET l_conv2 = '2'             #基础币种对交易币种
            END IF      
         END IF
      END IF            
   END IF
         
   LET l_conv = NULL
   
   IF cl_null(l_ooan004_1) THEN
      IF cl_null(l_ooan004_2) THEN
         IF l_extra = 'N' OR ((l_extra = 'Y') AND (cl_null(l_conv1) OR cl_null(l_conv2))) THEN       #没有维护汇率
            #无 %1 至 %2 的 %3 汇率资料, 汇率缺省为 1      
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00213'
            LET g_errparam.extend = NULL
            LET g_errparam.popup = TRUE
            LET g_errparam.replace[1] = p_ooan002 
            LET g_errparam.replace[2] = p_ooan003 
            LET g_errparam.replace[3] = p_ooan004
            CALL cl_err()

            RETURN r_rate     
         END IF         
      ELSE
         LET l_conv = '2'                #基础币种对交易币种
      END IF
   ELSE
      IF cl_null(l_ooan004_2) THEN
         LET l_conv = '1'                #交易币种对基础币种     
      ELSE
         IF l_ooan004_1 >= l_ooan004_2 THEN
            LET l_conv = '1'             #交易币种对基础币种   
         ELSE
            LET l_conv = '2'             #基础币种对交易币种
         END IF      
      END IF
   END IF
   
   IF l_conv = '1' THEN            #交易币种对基础币种
      LET l_ooan004 =  l_ooan004_1 #日期  
      LET l_ooan002 =  p_ooan002   #交易币种
      LET l_ooan003 =  p_ooan003   #基础币种   
   ELSE                            #基础币种对交易币种
      IF l_conv = '2' THEN
         LET l_ooan004 =  l_ooan004_2 #日期    
         LET l_ooan002 =  p_ooan003   #基础币种
         LET l_ooan003 =  p_ooan002   #交易币种   
      END IF   
   END IF
      

   #5.取汇率 & 汇率方向
   IF NOT cl_null(l_conv) THEN
      INITIALIZE l_ooan.* TO NULL
      SELECT ooanent,ooan001,ooan002,ooan003,ooan004,ooan005,ooan006,ooan007,ooan008,ooan009,ooan010,ooan011,ooan012,ooan013 INTO l_ooan.*  #161124-00048#7  2016/12/13 By 08734 add
        FROM ooan_t,ooam_t
       WHERE ooanent = g_enterprise
         AND ooan001 = l_ooan001   #汇率参照表号
         AND ooan002 = l_ooan002   
         AND ooan003 = l_ooan003   
         AND ooan004 = l_ooan004   #日期
         AND ooament = ooanent
         AND ooam001 = ooan001
         AND ooam003 = ooan003
         AND ooam004 = ooan004
         AND ooamstus = 'Y'
      IF SQLCA.sqlcode THEN
         #无 %1 至 %2 的 %3 汇率资料, 汇率缺省为 1      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00213'
         LET g_errparam.extend = NULL
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = p_ooan002 
         LET g_errparam.replace[2] =  p_ooan003 
         LET g_errparam.replace[3] =  p_ooan004
         CALL cl_err()

         RETURN r_rate
      END IF  
   
      #6.汇率类型
      CASE p_scc40
         WHEN '11' LET l_tmp = l_ooan.ooan005
         WHEN '12' LET l_tmp = l_ooan.ooan006
         WHEN '13' LET l_tmp = l_ooan.ooan007
         WHEN '21' LET l_tmp = l_ooan.ooan008
         WHEN '22' LET l_tmp = l_ooan.ooan009
      END CASE
      
      IF cl_null(l_tmp) THEN LET l_tmp = 1 END IF
      CALL s_num_round('1',l_tmp,l_ooaj005) RETURNING l_tmp        
      #交易币种批量
      IF cl_null(l_ooan.ooan012) THEN LET l_ooan.ooan012 = 1 END IF

      #7.计算汇率
      #减少处理步骤,以便精确度降低      
      IF l_conv = '1' THEN  #存在交易对基础币种的置换关系
         IF l_ooan.ooan013 = '1' THEN   #存在正向的汇率关系
            LET r_rate = l_tmp / l_ooan.ooan012 * p_amount        
         ELSE               #若为反向时,要1除取得的汇率
            LET r_rate = 1 / l_tmp * l_ooan.ooan012 * p_amount    
         END IF   
      ELSE                  #存在基础对交易币种的转换关系
         IF l_ooan.ooan013 = '1' THEN
            LET r_rate = 1 / l_tmp * l_ooan.ooan012 * p_amount    
         ELSE
            LET r_rate = l_tmp / l_ooan.ooan012 * p_amount        
         END IF
      END IF
      
   ELSE
      #來源幣別對本幣 
      IF l_conv1 = '1' THEN            #交易币种对基础币种
         LET l_ooan004 =  l_ooan004_3 #日期  
         LET l_ooan002 =  p_ooan002   #交易币种
         LET l_ooan003 =  l_ooef016   #本幣   
      ELSE                            #基础币种对交易币种
         IF l_conv1 = '2' THEN
            LET l_ooan004 =  l_ooan004_4 #日期    
            LET l_ooan002 =  l_ooef016   #本幣
            LET l_ooan003 =  p_ooan002   #交易币种   
         END IF 
      END IF   
      INITIALIZE l_ooan.* TO NULL
      SELECT ooanent,ooan001,ooan002,ooan003,ooan004,ooan005,ooan006,ooan007,ooan008,ooan009,ooan010,ooan011,ooan012,ooan013 INTO l_ooan.*  
        FROM ooan_t,ooam_t
       WHERE ooanent = g_enterprise
         AND ooan001 = l_ooan001   #汇率参照表号
         AND ooan002 = l_ooan002   
         AND ooan003 = l_ooan003   
         AND ooan004 = l_ooan004   #日期
         AND ooament = ooanent
         AND ooam001 = ooan001
         AND ooam003 = ooan003
         AND ooam004 = ooan004
         AND ooamstus = 'Y'
      IF SQLCA.sqlcode THEN
         #无 %1 至 %2 的 %3 汇率资料, 汇率缺省为 1      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00213'
         LET g_errparam.extend = NULL
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = p_ooan002 
         LET g_errparam.replace[2] =  p_ooan003 
         LET g_errparam.replace[3] =  p_ooan004
         CALL cl_err()

         RETURN r_rate
      END IF  
   
      #6.汇率类型
      CASE p_scc40
         WHEN '11' LET l_tmp1 = l_ooan.ooan005
         WHEN '12' LET l_tmp1 = l_ooan.ooan006
         WHEN '13' LET l_tmp1 = l_ooan.ooan007
         WHEN '21' LET l_tmp1 = l_ooan.ooan008
         WHEN '22' LET l_tmp1 = l_ooan.ooan009
      END CASE
      
      IF cl_null(l_tmp1) THEN LET l_tmp1 = 1 END IF
      CALL s_num_round('1',l_tmp1,l_ooaj005) RETURNING l_tmp1        
      #交易币种批量
      IF cl_null(l_ooan.ooan012) THEN LET l_ooan.ooan012 = 1 END IF

      #7.计算汇率
      #减少处理步骤,以便精确度降低      
      IF l_conv1 = '1' THEN  #存在交易对基础币种的置换关系
         IF l_ooan.ooan013 = '1' THEN   #存在正向的汇率关系
            LET r_rate1 = l_tmp1 / l_ooan.ooan012         
         ELSE               #若为反向时,要1除取得的汇率
            LET r_rate1 = 1 / l_tmp1 * l_ooan.ooan012     
         END IF   
      ELSE                  #存在基础对交易币种的转换关系
         IF l_ooan.ooan013 = '1' THEN
            LET r_rate1 = 1 / l_tmp1 * l_ooan.ooan012     
         ELSE
            LET r_rate1 = l_tmp1 / l_ooan.ooan012         
         END IF
      END IF
          
      #本幣對目的幣別
      IF l_conv2 = '1' THEN            #交易币种对基础币种
         LET l_ooan004 =  l_ooan004_5 #日期  
         LET l_ooan002 =  l_ooef016   #本幣
         LET l_ooan003 =  p_ooan003   #交易币种   
      ELSE                            #本幣对交易币种
         IF l_conv2 = '2' THEN
            LET l_ooan004 =  l_ooan004_6 #日期    
            LET l_ooan002 =  p_ooan003   #交易币种本幣
            LET l_ooan003 =  l_ooef016   #本幣   
         END IF
      END IF         
      INITIALIZE l_ooan.* TO NULL
      SELECT ooanent,ooan001,ooan002,ooan003,ooan004,ooan005,ooan006,ooan007,ooan008,ooan009,ooan010,ooan011,ooan012,ooan013 INTO l_ooan.*  
        FROM ooan_t,ooam_t
       WHERE ooanent = g_enterprise
         AND ooan001 = l_ooan001   #汇率参照表号
         AND ooan002 = l_ooan002   
         AND ooan003 = l_ooan003   
         AND ooan004 = l_ooan004   #日期
         AND ooament = ooanent
         AND ooam001 = ooan001
         AND ooam003 = ooan003
         AND ooam004 = ooan004
         AND ooamstus = 'Y'
      IF SQLCA.sqlcode THEN
         #无 %1 至 %2 的 %3 汇率资料, 汇率缺省为 1      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00213'
         LET g_errparam.extend = NULL
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = p_ooan002 
         LET g_errparam.replace[2] =  p_ooan003 
         LET g_errparam.replace[3] =  p_ooan004
         CALL cl_err()

         RETURN r_rate
      END IF  
   
      #6.汇率类型
      CASE p_scc40
         WHEN '11' LET l_tmp2 = l_ooan.ooan005
         WHEN '12' LET l_tmp2 = l_ooan.ooan006
         WHEN '13' LET l_tmp2 = l_ooan.ooan007
         WHEN '21' LET l_tmp2 = l_ooan.ooan008
         WHEN '22' LET l_tmp2 = l_ooan.ooan009
      END CASE      
   
      #取基础币种的金额精度--若有传入p_amount时,返回的是金额,非汇率
      CALL s_curr_sel_ooaj004(l_ooef014,p_ooan003)   
        RETURNING l_ooaj004
        
      #取基础币种的汇率精度
      CALL s_curr_sel_ooaj005(l_ooef014,p_ooan003)   
        RETURNING l_ooaj005   
        
      IF cl_null(l_tmp2) THEN LET l_tmp2 = 1 END IF
      CALL s_num_round('1',l_tmp2,l_ooaj005) RETURNING l_tmp2  
      
      IF l_conv2 = '1' THEN  #存在交易对基础币种的置换关系
         IF l_ooan.ooan013 = '1' THEN   #存在正向的汇率关系
            LET r_rate2 = l_tmp2 / l_ooan.ooan012         
         ELSE               #若为反向时,要1除取得的汇率
            LET r_rate2 = 1 / l_tmp2 * l_ooan.ooan012     
         END IF   
      ELSE                  #存在基础对交易币种的转换关系
         IF l_ooan.ooan013 = '1' THEN
            LET r_rate2 = 1 / l_tmp2 * l_ooan.ooan012     
         ELSE
            LET r_rate2 = l_tmp2 / l_ooan.ooan012         
         END IF
      END IF
        
      LET r_rate = r_rate1 * r_rate2 * p_amount
        
   END IF   
   
   #8.按精度进位小数取位
   IF p_amount > 1 THEN
      #传入的为金额,直接按ooaj004取位
      CALL s_num_round('1',r_rate,l_ooaj004) RETURNING r_rate
   ELSE
      #没有传入金额,根据汇率的精度进行取位
      CALL s_num_round('1',r_rate,l_ooaj005) RETURNING r_rate
   END IF

   RETURN r_rate
END FUNCTION

 
{</section>}
 
