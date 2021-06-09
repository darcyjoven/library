#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_axrp130.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0055(1900-01-01 00:00:00), PR版次:0055(2021-02-03 14:29:54)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000376
#+ Filename...: s_axrp130
#+ Description: 出貨拋轉應收的應用組件
#+ Creator....: 01727(2014-10-09 09:11:05)
#+ Modifier...: 00000 -SD/PR- 05795
 
{</section>}
 
{<section id="s_axrp130.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150401-00010#2 By 01727 以單據的角度去做沖暫估
#                          1.xrcfseq變為單純的項次不再與立帳單單身項次關聯
#                          2.xrcfseq2固定為0
#                          3.處理方式不變，但是存入xrcf表的時候同一張暫估單據的單身資料匯總後插入
#150826-00024#1 By 02291 去掉欄位SUM(xrcb007)后多餘的逗號
#150203-00010#5 2015/09/09 By 01727  雜項類產生沖暫估明細:1.帳款單身AFTER INPUT後,才以整張單據角度產生沖暫估明細
#160506-00008#1 2016/05/17 By 01727  axrt300 沖暫估時會帶出暫估單的稅別, 這點不太對, 應是帶出目前的出貨單稅別才對
#160601-00002#1 2016/06/01 By 01727  取暂估数量SQL错误
#160816-00014#1 2016/08/22 By 01727  含稅立沖暫估規格優化
#160823-00027#1 2016/08/25 By 01727  暂估时候如果冲账方式选择的是单号+项次+帐期 沖暂估的多帐期资料應拆成多笔 
#160912-00011#4 2016/09/19 By 01727  沖暫估規格修改
#161212-00005#2 2016/12/12 by 02481  标准程式定义采用宣告模式,弃用.*写法
#170112-00023#1 2017/01/12 By 02114  无来源单号时,抓取暂估金额等where条件根据账款客商抓取
#170225-00002#1 2017/03/02 By 02599  产生冲暂估代码优化
#170314-00017#1 2017/03/24 By 01531  aist310的杂项发票，通过axrp132产生到axrt330，没有冲暂估，但是单身的【冲暂估否】被勾选了
#170321-00125#1 2017/03/27 By 01531  當沖暫估 aoos020  參數屬於含稅時並未產生原/本幣稅額(xrcf104,xrcf114)  
#170325-00053#1 2017/03/28 By 02599  杂项冲暂估，展算金额时，根据稅别是否含税展算
#170317-00029#2 2017/04/12 By 07900  修改沖暫估匯率取暫估單重評後匯率 xrcc102
#170419-00065#1 2017/04/19 By 07900  接着 #170317-00029#2 ，修改沖暫估匯率取暫估單重評後匯率 xrcc102
#170410-00053#1 2017/04/24 By 01531  axrp132冲暂估优化
#170525-00073#1 2017/05/25 By 01531  延续170410-00053#1，冲暂估部分，有汇差的时候会计分录不正确。
#170603-00037#1 2017/06/17 By 02599  冲暂估本币金额按照本币取位,当立账币种=暂估币种时，计算价差汇差汇率=暂估重评价汇率
#170617-00473#1 2017/06/30 By 02599  比较冲暂估数量时，l_xrcb007改为p_xrcb007 
#170531-00025#1 2017/07/13 By 01531  冲暂估计算原币未税汇差金额时，应使用原币取位
#170809-00021#1 2017/08/10 By dorishsu 修正s_axrp130_get_xrcf,雜項未稅立帳沖暫估金額計算邏輯
#170814-00024#1 2017/08/14 By dorishsu 單據是否可沖暫估檢查s_axrp130_estimate_chk元件,如果是雜項,在取得立帳金額的sql邏輯有誤
#170325-00043#1 2017/08/25 By 01531  aist310单身来源类型为16：其中应收暂估和26：其他待抵暂估 时，判断是否可冲暂估,用数量判断
#170811-00036#1 2017/09/11 By 01531  產生沖暫估資訊的元件s_axrp130_ins_xrcf在sub中呼叫s_axrp130_create_tmp(),CREATE TEMP TABLE的語法,會造成問題後續有事務問題
#                                    将CALL s_axrp130_create_tmp()写入主作业中。
#170929-00010#4 2017/10/20 By 01531  取消自動沖銷雜項暫估處理
#170929-00010#5 2017/10/29 By 01531  axrt330/axrt340 暂估资料写入xrcf
#170821-00012#1 2017/11/15 By 07900  冲暂估时， 暂估项次都为1.
#180507-00028#1 2018/05/28 By 09232  axrt300/axrt340产生杂项暂估单产生冲暂估资料
#180221-00030#2 2018/06/07 By 09232  产生冲暂估资料要根据S-FIN-1002参数来产生，如果参数为1/2 则将暂估资料合并产生一笔，参数3则产生到对应的项次。
#180510-00021#1 2018/06/19 By 01531  当应收冲销参数S-FIN-1002=3且暂估不回转时，冲暂估科目来源单身xrcb029
#180625-00055#1 2018/06/27 By 09232  不含税立暂估时，#暂估单税别含税时，因价差看未税，故这里要用暂估单价将原币含税单价反推成原币未税单价
#180627-00046#1 2018/06/27 By 09232  产生冲暂估资料，判断是否有价差时，原币未税单价要取位
#180111-00043#59 2018/07/03 By 09505  修改设计器产生方法的时候说明默认给值是CALL s_aooi150_ins (传入参数)，将方法改为此方法的实际用途
#180807-00065#1  2018/08/13 By 01531  账款单性质＝D1:价差时，xrcf102汇率栏位需要反推,即xrcf115本币冲销暂估金额/xrcf105原币暂估冲销金额 
#180808-00054#1  2018/08/14 By 01531  计算汇差时，当暂估单据性质MATCHES '0[24]'时，本幣匯差金额*-1处理，在ins_xrcf和ins_xrcf_diff中重复处理，导致汇差有误
#180807-00063#1  2018/08/14 By 09505  "其他信息维护”页签的“产品类别”带值错误
#180822-00006#1  2018/08/24 By 06189  推算價差時,推算出未稅單價時先不取位,乘數量後再取位,以降低取位差異.
#180906-00063#1  2018/09/10 By 05795  汇差会产生差异
#180917-00020#1  2018/09/30 by 08172  1.暂估汇差的汇率应为立账单汇率
#                                    2.暂估价差的汇率应为立账汇率，本币金额应用立账汇率来计算
#180823-00022#1  2018/10/18 By 01531  立账单与暂估汇率无差异时，有产生暂估汇差，参考AP处理方式，调整汇差的计算方式
#181001-00015#77 2018/10/31  By 09232   补ent条件
#181113-00019#1  2018/11/13 By 05634  修正沖暫估訊息裡的暫估項次(xrcf009)是空的問題
#181127-00061#1  2018/11/28 By 05795  匯差是t300與t320的匯率差異,不能拿t300的匯率為1來看.
#181218-00045#1  2018/12/18 by 09767  修正TOP18升級genero 3.10後編譯失敗清單
#180821-00038#2  2018/11/26 By 01531  冲暂估明细写入xrch_t，通过xrch_t产生xrcf_t及价差/汇差/纯差异金额
#190125-00035#1  2019/01/31 By 01531  冲销参数=3明细，自动生成的axrt300冲暂估信息中未按单身立账项次排序
#190307-00012#1  2019/03/12 By 05795  xrcf030是账款客商，对应得应该是账款对象。在凭证预览里看到账款客户和收付款客户是反的
#190402-00043#2  2019/05/17 By 10554  產生xrch後,產xrcf前要分攤xrch含稅本幣金額和xrcc未沖本幣金額差異
#190423-00042#19 2019/06/28 By 01531  依專案做帳且沖帳參數為1時,xrcf_t錯誤修正
#190716-00007#1  2019/07/16 By 05795  在更新临时s_axrp130_tmp得地方xrcf009得值给的不对需要纠正
#190726-00008#1  2019/07/29 By 05795  l_sfin1002 MATCHES '[12]'的时候需要把 xrcr009 的值给xrcfseq2
#190807-00032#1  2019/10/14 by 08172  暂估差异的客商取值账款单单头客商
#191204-00032#3  2019/12/05 by 08172  暂估单身允许多税种，冲暂估时由单头税种改为单身税种
#200116-00002#4  2020/02/21 By 13132  取汇率改为调用s_fin_get_curr_rate(传入参数)
#210203-00008#1  2021/02/03 By 05795  汇率为空得时候，给1
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util   #200116-00002#4 add 
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_axrp130.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
TYPE type_xrcf_tmp   RECORD
         xrca001     LIKE xrca_t.xrca001,
         xrcfseq     LIKE xrcf_t.xrcfseq,
         xrcf103     LIKE xrcf_t.xrcf103,
         xrcf104     LIKE xrcf_t.xrcf104,
         xrcf105     LIKE xrcf_t.xrcf105,
         xrcf106     LIKE xrcf_t.xrcf106,
         xrcf107     LIKE xrcf_t.xrcf117,
         xrcf113     LIKE xrcf_t.xrcf113,
         xrcf114     LIKE xrcf_t.xrcf114,
         xrcf115     LIKE xrcf_t.xrcf115,
         xrcf116     LIKE xrcf_t.xrcf116,
         xrcf117     LIKE xrcf_t.xrcf117,
         xrcf123     LIKE xrcf_t.xrcf123,
         xrcf124     LIKE xrcf_t.xrcf124,
         xrcf125     LIKE xrcf_t.xrcf125,
         xrcf133     LIKE xrcf_t.xrcf133,
         xrcf134     LIKE xrcf_t.xrcf134,
         xrcf135     LIKE xrcf_t.xrcf135,
         xrcf021     LIKE xrcf_t.xrcf021, #DIFF3账款科目  #180821-00038#2 add 
         xrch015     LIKE xrch_t.xrch015, #纯差异原币金额 #180821-00038#2 add
         xrch016     LIKE xrch_t.xrch016  #纯差异原币金额 #180821-00038#2 add           
                 END RECORD
#end add-point
 
{</section>}
 
{<section id="s_axrp130.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
#161212-00005#2---add---begin--------------------
#DEFINE g_glaa         RECORD LIKE glaa_t.*
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
#161212-00005#2---add---end--------------------

#end add-point
 
{</section>}
 
{<section id="s_axrp130.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_axrp130.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 單據是否可沖暫估檢查
# Memo...........:
# Usage..........: CALL s_axrp130_estimate_chk(p_xrcald,p_xrcadocdt,p_xrca004,p_xrca100,p_xrcb002,p_xrcb003)
#                  RETURNING r_success
# Input parameter: p_xrcald       帳套
#                : p_xrcadocdt    單據日期
#                : p_xrca004      帳款對象
#                : p_xrca100      交易幣別
#                : p_xrcb001      來源類型
#                : p_xrcb002      來源單號
#                : p_xrcb003      來源項次
# Return code....: r_success      檢查成功否   TRUE 可立沖暫估 / FALSE 不可立沖暫估
# Date & Author..: 2015/11/18 By 01727
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axrp130_estimate_chk(p_xrcald,p_xrcadocdt,p_xrca004,p_xrca100,p_xrcb001,p_xrcb002,p_xrcb003)
   DEFINE p_xrcald            LIKE xrca_t.xrcald      #帳套
   DEFINE p_xrcadocdt         LIKE xrca_t.xrcadocdt   #單據日期
   DEFINE p_xrca004           LIKE xrca_t.xrca004     #帳款對象
   DEFINE p_xrca100           LIKE xrca_t.xrca100     #交易幣別
   DEFINE p_xrcb001           LIKE xrcb_t.xrcb001     #來源類型
   DEFINE p_xrcb002           LIKE xrcb_t.xrcb002     #來源單號
   DEFINE p_xrcb003           LIKE xrcb_t.xrcb003     #來源項次
   DEFINE r_success           LIKE type_t.num5        #檢查成功否   TRUE 可立沖暫估 / FALSE 不可立沖暫估

   DEFINE l_xrcf007           LIKE xrcf_t.xrcf007     #沖暫估數量
   DEFINE t_xrcb007           LIKE xrcb_t.xrcb007     #暫估數量
   DEFINE t_xrcb103           LIKE xrcb_t.xrcb103     #暫估未稅金額
   DEFINE t_xrcb105           LIKE xrcb_t.xrcb105     #暫估含稅金額
   DEFINE l_xrcf103           LIKE xrcf_t.xrcf103     #立帳未稅金額
   DEFINE l_xrcf105           LIKE xrcf_t.xrcf105     #立帳含稅金額
   DEFINE l_sfin2011          LIKE type_t.chr1        #迴轉否
   DEFINE l_sfin2012          LIKE type_t.chr1        #含稅立帳否
   DEFINE l_glaacomp          LIKE glaa_t.glaacomp    #所屬法人

   LET r_success = FALSE

   IF cl_null(p_xrcald) THEN
      RETURN r_success
   END IF

   IF (cl_null(p_xrcadocdt) OR cl_null(p_xrca004) OR cl_null(p_xrca100)) AND (cl_null(p_xrcb002) OR cl_null(p_xrcb003)) THEN
      RETURN r_success
   END IF

   SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcald

   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2012') RETURNING l_sfin2012
  #IF l_sfin2011 = 'N' THEN LET l_sfin2012 = '1' END IF  #1.立帳不含稅    #160823-00027#1 Mark

   IF NOT cl_null(p_xrcb002) THEN
      #有來源單號,根据来源单号检查是否可冲暂估
      #立暫估數量 - 沖暫估數量 > 0 則表示可以沖暫估
      #取得暫估數量(T320)
      SELECT SUM(xrcb007) INTO t_xrcb007 FROM xrcb_t,xrca_t WHERE xrcadocno = xrcbdocno
         AND xrcaent = xrcbent     AND xrcald = xrcbld
         AND xrcb002 = p_xrcb002   AND xrcb003 = p_xrcb003
         AND xrcald = p_xrcald     AND xrcaent = g_enterprise
         AND xrcastus = 'Y'        AND xrca001 IN ('01','02')
         
      #170325-00043#1 add s---
      IF cl_null(t_xrcb007) THEN 
         #aist310单身来源类型为16/26时，来源单是杂项暂估单
         SELECT SUM(xrcb007) INTO t_xrcb007 FROM xrca_t,xrcb_t WHERE xrcadocno = xrcbdocno 
            AND xrcaent = xrcbent     AND xrcald = xrcbld
            #AND xrcadocno = p_xrcb002 AND  xrcald = p_xrcald     AND xrcaent = g_enterprise #180821-00038#2 mark
            AND xrcadocno = p_xrcb002 AND  xrcald = p_xrcald AND xrcbseq = p_xrcb003     AND xrcaent = g_enterprise #180821-00038#2 add 
            AND xrcastus = 'Y'        AND xrca001 IN ('03','04') 
      END IF
      #170325-00043#1 add e---      
      IF cl_null(t_xrcb007) THEN LET t_xrcb007 = 0 END IF

#180821-00038#2 mod s---
#      #取得立帳數量(T300/T330/T340/T341)
#      SELECT SUM(xrcf007) INTO l_xrcf007 FROM xrcf_t,xrca_t WHERE xrcadocno = xrcfdocno
#         AND xrcaent = xrcfent     AND xrcald = xrcfld   #160601-00002#1 Mod xrcbld --> xrcfld
#         AND xrcf008 = p_xrcb002   AND xrcf009 = p_xrcb003
#         AND xrcald = p_xrcald     AND xrcaent = g_enterprise
#         AND xrcastus <> 'X'
      SELECT SUM(xrcb007) INTO l_xrcf007 FROM xrcb_t  
       LEFT JOIN xrca_t ON xrcaent = xrcbent AND xrcadocno = xrcbdocno 
       WHERE xrcaent =  g_enterprise            
         AND xrcb002 = p_xrcb002 AND xrcb003 = p_xrcb003  
         AND xrcb023 = 'Y'         
         AND xrcald = p_xrcald AND xrca001 NOT IN ('01','02','03','04') 
         AND xrcastus <> 'X' 
#180821-00038#2 mod e---         
      IF cl_null(l_xrcf007) THEN LET l_xrcf007 = 0 END IF

      IF t_xrcb007 > l_xrcf007 THEN
         LET r_success = TRUE
      END IF
   ELSE
#      #170929-00010#4 mark s---
#      #無來源單號,根据金額检查是否可冲暂估
#      #取得暫估金額(T320)
#      SELECT SUM(xrcb103),SUM(xrcb105) INTO t_xrcb103,t_xrcb105 FROM xrcb_t,xrca_t WHERE xrcadocno = xrcbdocno
#         AND xrcaent = xrcbent     AND xrcald = xrcbld
#         #AND xrcb002 = p_xrcb002   AND xrcb003 = p_xrcb003   #170112-00023#1 mark lujh
#         AND xrca004 = p_xrca004                              #170112-00023#1 add lujh
#         AND xrcald = p_xrcald     AND xrcaent = g_enterprise
#         AND xrcastus = 'Y'        AND xrca001 IN ('03','04')
#         AND xrca100 = p_xrca100  #170314-00017#1 add 
#      #170929-00010#4 mark e---    
      IF cl_null(t_xrcb103) THEN LET t_xrcb103 = 0 END IF
      IF cl_null(t_xrcb105) THEN LET t_xrcb105 = 0 END IF

#      #170929-00010#4 mark s---
#      #取得立帳金額(T300/T330/T340/T341)
#      SELECT SUM(xrcf103),SUM(xrcf105) INTO l_xrcf103,l_xrcf105 FROM xrcf_t,xrca_t WHERE xrcadocno = xrcfdocno
#         AND xrcaent = xrcfent     AND xrcald = xrcfld
#         #AND xrcf008 = p_xrcb002   AND xrcf009 = p_xrcb003   #170112-00023#1 mark lujh
#         #AND xrca004 = p_xrca004   AND xrca001 IN ('19')      #170112-00023#1 add lujh   #170814-00024#1 mark
#         AND xrcald = p_xrcald     AND xrcaent = g_enterprise
#         AND xrca100 = p_xrca100  #170314-00017#1 add 
#         AND xrcastus <> 'X'
#         #170814-00024#1---add---str--
#         AND xrca004 = p_xrca004
#         AND EXISTS (SELECT 1 
#                       FROM xrcb_t,xrca_t a 
#                      WHERE xrcadocno = xrcbdocno
#                        AND xrcaent = xrcbent     AND xrcald = xrcbld
#                        AND xrca004 = p_xrca004 
#                        AND xrcald = p_xrcald     AND xrcaent = g_enterprise 
#                        AND xrcastus = 'Y'        AND xrca001 IN ('03','04')
#                        AND xrca100 = p_xrca100
#                        AND a.xrcadocno = xrcf008 AND a.xrcaent = xrcaent AND a.xrcald = xrcald)
#         #170814-00024#1---add---end--
#      #170929-00010#4 mark e---
      IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF
      IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF

      IF l_sfin2012 = '1' THEN      #立帳未稅
         IF t_xrcb103 > l_xrcf103 THEN
            LET r_success = TRUE
         END IF
      ELSE
         IF t_xrcb105 > l_xrcf105 THEN
            LET r_success = TRUE
         END IF
      END IF

   END IF

   RETURN r_success

END FUNCTION
################################################################################
# Descriptions...: 產生沖暫估資料
# Memo...........:
# Usage..........: CALL axrp130_ins_xrcf()
#                  RETURNING r_xrcb023
# Input parameter: 
# Return code....: r_xrcb023      沖暫估否
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axrp130_ins_xrcf(p_xrcald,p_xrcadocno,p_xrcb002,p_type)
DEFINE p_xrcald      LIKE xrca_t.xrcald      #帳別
DEFINE p_xrcadocno   LIKE xrca_t.xrcadocno   #立帳單據
#DEFINE p_xrcb001     LIKE xrcb_t.xrcb001     #來源作業  180507-00028#1 mark
DEFINE p_xrcb002     LIKE xrcb_t.xrcb002     #來源作業  180507-00028#1 add
DEFINE p_type        LIKE type_t.chr1        #執行類型(0:全部 1:非雜項 2:雜項)
DEFINE r_success     LIKE type_t.num5
#161212-00005#2---add---begin--------------------
#DEFINE l_xrca        RECORD LIKE xrca_t.*
#DEFINE l_xrcb        RECORD LIKE xrcb_t.*
#DEFINE l_xrcc        RECORD LIKE xrcc_t.*
#DEFINE l_xrcf        RECORD LIKE xrcf_t.*
DEFINE l_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
    DEFINE l_xrcb RECORD  #應收憑單單身
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
       xrcbud001 LIKE xrcb_t.xrcbud001, #自定義欄位(文字)001
       xrcbud002 LIKE xrcb_t.xrcbud002, #自定義欄位(文字)002
       xrcbud003 LIKE xrcb_t.xrcbud003, #自定義欄位(文字)003
       xrcbud004 LIKE xrcb_t.xrcbud004, #自定義欄位(文字)004
       xrcbud005 LIKE xrcb_t.xrcbud005, #自定義欄位(文字)005
       xrcbud006 LIKE xrcb_t.xrcbud006, #自定義欄位(文字)006
       xrcbud007 LIKE xrcb_t.xrcbud007, #自定義欄位(文字)007
       xrcbud008 LIKE xrcb_t.xrcbud008, #自定義欄位(文字)008
       xrcbud009 LIKE xrcb_t.xrcbud009, #自定義欄位(文字)009
       xrcbud010 LIKE xrcb_t.xrcbud010, #自定義欄位(文字)010
       xrcbud011 LIKE xrcb_t.xrcbud011, #自定義欄位(數字)011
       xrcbud012 LIKE xrcb_t.xrcbud012, #自定義欄位(數字)012
       xrcbud013 LIKE xrcb_t.xrcbud013, #自定義欄位(數字)013
       xrcbud014 LIKE xrcb_t.xrcbud014, #自定義欄位(數字)014
       xrcbud015 LIKE xrcb_t.xrcbud015, #自定義欄位(數字)015
       xrcbud016 LIKE xrcb_t.xrcbud016, #自定義欄位(數字)016
       xrcbud017 LIKE xrcb_t.xrcbud017, #自定義欄位(數字)017
       xrcbud018 LIKE xrcb_t.xrcbud018, #自定義欄位(數字)018
       xrcbud019 LIKE xrcb_t.xrcbud019, #自定義欄位(數字)019
       xrcbud020 LIKE xrcb_t.xrcbud020, #自定義欄位(數字)020
       xrcbud021 LIKE xrcb_t.xrcbud021, #自定義欄位(日期時間)021
       xrcbud022 LIKE xrcb_t.xrcbud022, #自定義欄位(日期時間)022
       xrcbud023 LIKE xrcb_t.xrcbud023, #自定義欄位(日期時間)023
       xrcbud024 LIKE xrcb_t.xrcbud024, #自定義欄位(日期時間)024
       xrcbud025 LIKE xrcb_t.xrcbud025, #自定義欄位(日期時間)025
       xrcbud026 LIKE xrcb_t.xrcbud026, #自定義欄位(日期時間)026
       xrcbud027 LIKE xrcb_t.xrcbud027, #自定義欄位(日期時間)027
       xrcbud028 LIKE xrcb_t.xrcbud028, #自定義欄位(日期時間)028
       xrcbud029 LIKE xrcb_t.xrcbud029, #自定義欄位(日期時間)029
       xrcbud030 LIKE xrcb_t.xrcbud030, #自定義欄位(日期時間)030
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
  DEFINE l_xrcc RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrccud001 LIKE xrcc_t.xrccud001, #自定義欄位(文字)001
       xrccud002 LIKE xrcc_t.xrccud002, #自定義欄位(文字)002
       xrccud003 LIKE xrcc_t.xrccud003, #自定義欄位(文字)003
       xrccud004 LIKE xrcc_t.xrccud004, #自定義欄位(文字)004
       xrccud005 LIKE xrcc_t.xrccud005, #自定義欄位(文字)005
       xrccud006 LIKE xrcc_t.xrccud006, #自定義欄位(文字)006
       xrccud007 LIKE xrcc_t.xrccud007, #自定義欄位(文字)007
       xrccud008 LIKE xrcc_t.xrccud008, #自定義欄位(文字)008
       xrccud009 LIKE xrcc_t.xrccud009, #自定義欄位(文字)009
       xrccud010 LIKE xrcc_t.xrccud010, #自定義欄位(文字)010
       xrccud011 LIKE xrcc_t.xrccud011, #自定義欄位(數字)011
       xrccud012 LIKE xrcc_t.xrccud012, #自定義欄位(數字)012
       xrccud013 LIKE xrcc_t.xrccud013, #自定義欄位(數字)013
       xrccud014 LIKE xrcc_t.xrccud014, #自定義欄位(數字)014
       xrccud015 LIKE xrcc_t.xrccud015, #自定義欄位(數字)015
       xrccud016 LIKE xrcc_t.xrccud016, #自定義欄位(數字)016
       xrccud017 LIKE xrcc_t.xrccud017, #自定義欄位(數字)017
       xrccud018 LIKE xrcc_t.xrccud018, #自定義欄位(數字)018
       xrccud019 LIKE xrcc_t.xrccud019, #自定義欄位(數字)019
       xrccud020 LIKE xrcc_t.xrccud020, #自定義欄位(數字)020
       xrccud021 LIKE xrcc_t.xrccud021, #自定義欄位(日期時間)021
       xrccud022 LIKE xrcc_t.xrccud022, #自定義欄位(日期時間)022
       xrccud023 LIKE xrcc_t.xrccud023, #自定義欄位(日期時間)023
       xrccud024 LIKE xrcc_t.xrccud024, #自定義欄位(日期時間)024
       xrccud025 LIKE xrcc_t.xrccud025, #自定義欄位(日期時間)025
       xrccud026 LIKE xrcc_t.xrccud026, #自定義欄位(日期時間)026
       xrccud027 LIKE xrcc_t.xrccud027, #自定義欄位(日期時間)027
       xrccud028 LIKE xrcc_t.xrccud028, #自定義欄位(日期時間)028
       xrccud029 LIKE xrcc_t.xrccud029, #自定義欄位(日期時間)029
       xrccud030 LIKE xrcc_t.xrccud030, #自定義欄位(日期時間)030
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
    DEFINE l_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD

#161212-00005#2---add---end--------------------
DEFINE l_xrcadocdt   LIKE xrca_t.xrcadocdt   #單據日
DEFINE l_xrca004     LIKE xrca_t.xrca004     #帳款對象
DEFINE l_xrca005     LIKE xrca_t.xrca005     #付款對象
DEFINE l_xrca100     LIKE xrca_t.xrca100     #幣別
DEFINE l_xrcb001     LIKE xrcb_t.xrcb001     #單據性質
DEFINE l_xrcb002     LIKE xrcb_t.xrcb002     #入庫單號
DEFINE l_xrcb003     LIKE xrcb_t.xrcb003     #入庫單項次
DEFINE l_type        LIKE type_t.chr1        #1:非雜項/2:雜項
DEFINE l_type_diff   LIKE type_t.chr1        #1:依據每筆計算價差匯差/2:彙總每筆價差匯差
DEFINE l_flag        LIKE type_t.chr1        #是否
DEFINE l_sql         STRING
#180507-00028#1 add-s
DEFINE l_sql1        STRING
DEFINE l_xrcb002_1   LIKE xrcb_t.xrcb002
DEFINE l_xrcb002_s   STRING
#180507-00028#1 add-e
DEFINE l_i,l_cnt     LIKE type_t.num5
DEFINE l_xrcf_tmp    DYNAMIC ARRAY OF type_xrcf_tmp
DEFINE l_xrcf_tmp_s  DYNAMIC ARRAY OF type_xrcf_tmp
#160912-00011#4 Add  ---(S)---
DEFINE l_sfin2011    LIKE type_t.chr1        #迴轉否 
DEFINE t_xrcadocdt   LIKE xrca_t.xrcadocdt
DEFINE l_glaacomp    LIKE glaa_t.glaacomp
#160912-00011#4 Add  ---(E)---
#170317-00029#2--add--s--xul
DEFINE l_xrcc102     LIKE xrcc_t.xrcc102
DEFINE l_xrcc122     LIKE xrcc_t.xrcc122
DEFINE l_xrcc132     LIKE xrcc_t.xrcc132
#170317-00029#2--add--e--xul
#170410-00053#1 add s---
DEFINE l_xrcb007     LIKE xrcb_t.xrcb007     #t300此次要沖帳-入庫單數量
DEFINE l_xrcb0071    LIKE xrcb_t.xrcb007     #
DEFINE l_xrcb1       RECORD                  #t300此次要沖帳
         xrcb101     LIKE xrcb_t.xrcb101,
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115,
         xrcb123     LIKE xrcb_t.xrcb123,
         xrcb124     LIKE xrcb_t.xrcb124,
         xrcb125     LIKE xrcb_t.xrcb125,
         xrcb133     LIKE xrcb_t.xrcb133,
         xrcb134     LIKE xrcb_t.xrcb134,
         xrcb135     LIKE xrcb_t.xrcb135,
         xrcborga    LIKE xrcb_t.xrcborga,         #來源組織
         xrcb010     LIKE xrcb_t.xrcb010,          #業務部門
         xrcb011     LIKE xrcb_t.xrcb011,          #責任中心
         xrcb024     LIKE xrcb_t.xrcb024,          #區域
         xrcb036     LIKE xrcb_t.xrcb036,          #客群
         #xrcb004     LIKE xrcb_t.xrcb004,          #產品類別            #180807-00063#1 mark
         xrcb012     LIKE xrcb_t.xrcb012,          #產品類別             #180807-00063#1 add
         xrcb051     LIKE xrcb_t.xrcb051,          #業務人員
         xrcb015     LIKE xrcb_t.xrcb015,          #專案編號
         xrcb016     LIKE xrcb_t.xrcb016,          #WBS
         xrcb033     LIKE xrcb_t.xrcb033,          #經營方式
         xrcb034     LIKE xrcb_t.xrcb034,          #渠道
         xrcb035     LIKE xrcb_t.xrcb035,          #品牌
         xrcb037     LIKE xrcb_t.xrcb037,          #自由核算項1
         xrcb038     LIKE xrcb_t.xrcb038,          #自由核算項2
         xrcb039     LIKE xrcb_t.xrcb039,          #自由核算項3
         xrcb040     LIKE xrcb_t.xrcb040,          #自由核算項4
         xrcb041     LIKE xrcb_t.xrcb041,          #自由核算項5
         xrcb042     LIKE xrcb_t.xrcb042,          #自由核算項6
         xrcb043     LIKE xrcb_t.xrcb043,          #自由核算項7
         xrcb044     LIKE xrcb_t.xrcb044,          #自由核算項8
         xrcb045     LIKE xrcb_t.xrcb045,          #自由核算項9
         xrcb046     LIKE xrcb_t.xrcb046,          #自由核算項10
         xrcb047     LIKE xrcb_t.xrcb047,          #摘要
         xrcb021     LIKE xrcb_t.xrcb021           #費用會計科目
                 END RECORD
DEFINE l_xrcf008  LIKE xrcf_t.xrcf008
DEFINE l_xrcf009  LIKE xrcf_t.xrcf009  
DEFINE l_sfin1002 LIKE type_t.chr1   #180221-00030#2 add
#170410-00053#1 add e---                 
DEFINE l_xrcbseq    LIKE xrcb_t.xrcbseq #180821-00038#2 add
#190402-00043#2---add---(S)
DEFINE l_xrcf_tmp2 RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD
DEFINE l_sum_xrch019  LIKE xrch_t.xrch019
DEFINE l_sum_xrch022  LIKE xrch_t.xrch022
DEFINE l_sum_xrcc108  LIKE xrcc_t.xrcc108
DEFINE l_sum_xrcc118  LIKE xrcc_t.xrcc118
DEFINE l_min_xrch022  LIKE xrch_t.xrch022
DEFINE l_xrch_o       RECORD
       xrch002        LIKE xrch_t.xrch002,
       xrch011        LIKE xrch_t.xrch011,
       xrch020        LIKE xrch_t.xrch020,
       xrch022        LIKE xrch_t.xrch022
       END RECORD
DEFINE l_xrch_105     LIKE xrcf_t.xrcf105
DEFINE l_xrch_115     LIKE xrcf_t.xrcf115
DEFINE l_adjust       LIKE xrcf_t.xrcf115 #分攤金額
DEFINE l_diff_left    LIKE type_t.num20_6 
DEFINE l_diff         LIKE type_t.num20_6 
#190402-00043#2---add---(E) 
DEFINE l_sfin9025 LIKE type_t.chr1   #190423-00042#19

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET l_xrca004 = NULL      LET l_xrca100 = NULL
   LET l_xrca005 = NULL      LET l_xrcadocdt = NULL
   
   CALL l_xrcf_tmp_s.clear()
   LET l_type_diff = 2
   SELECT xrca004,xrca005,xrca100,xrcadocdt
     INTO l_xrca004,l_xrca005,l_xrca100,l_xrcadocdt
     FROM xrca_t
    WHERE xrcaent = g_enterprise 
      AND xrcald = p_xrcald AND xrcadocno = p_xrcadocno
    #180221-00030#2 add-s
   #SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent=g_enterprise AND glaald=p_xrcald    #190402-00043#2 mark
    SELECT glaacomp,glaa001 INTO l_glaacomp,g_glaa.glaa001 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=p_xrcald #190402-00043#2 add
    CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-1002') RETURNING l_sfin1002
    CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-9025') RETURNING l_sfin9025   #190423-00042#19
    IF cl_null(l_sfin9025) THEN LET l_sfin9025 = 'N' END IF   #190423-00042#19
    #180221-00030#2 add-e   
#170225-00002#1--mark--str--
#   SELECT count(*) INTO l_cnt
#     FROM xrcf_t
#    WHERE xrcfent = g_enterprise
#      AND xrcfld  = p_xrcald AND xrcfdocno = p_xrcadocno
#      AND xrcf008 = 'DIFF'
#   IF l_cnt > 0 THEN
#170225-00002#1--mark--end
      DELETE FROM xrcf_t
       WHERE xrcfent = g_enterprise
         AND xrcfld  = p_xrcald AND xrcfdocno = p_xrcadocno AND xrcf008 = 'DIFF'
#   END IF #170225-00002#1 mark
    
   IF p_type MATCHES '[012]' THEN  #180821-00038#2 add 2
      
      #CALL s_axrp130_create_tmp() #170410-00053#1 add #170811-00036#1 mark
      DELETE FROM s_axrp130_tmp  #170410-00053#1 add
      
      LET l_type = 0 #180821-00038#2 add 1-->0
      #160823-00027#1 Mark ---(S)---
     #LET l_sql = "SELECT xrca_t.*,xrcc_t.* ",
     #          "    FROM xrca_t,xrcc_t",
     #          "   WHERE xrcaent = xrccent AND xrcald = xrccld ",
     #          "     AND xrcadocno = xrccdocno AND xrcc108 - xrcc109 <> 0 ",
     #          "     AND xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
     #          "     AND xrcadocno IN (SELECT DISTINCT xrcadocno ",
     #          "                         FROM xrca_t,xrcb_t a1,xrcb_t a2" ,     #xrca_t/a1.xrcb_t(暫估的TABLE)/a2.xrcb_t(是此次立帳單的TABLE)
     #          "                        WHERE xrcaent = a1.xrcbent     AND xrcald = a1.xrcbld",
     #          "                          AND xrcaent = a2.xrcbent     AND xrcald = a2.xrcbld",
     #          "                          AND xrcadocno = a1.xrcbdocno AND xrca001 IN ('01','02') AND xrcastus = 'Y'" ,
     #          "                          AND xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
     #          "                          AND xrcadocdt <='",l_xrcadocdt,"' " ,    
     #          "                          AND a1.xrcbent = a2.xrcbent ",        #"AND a1.xrcb001 = a2.xrcb001" ,>>t210跟t320的xrcb001不同
     #          "                          AND a1.xrcb002 = a2.xrcb002 AND a1.xrcb003 = a2.xrcb003" ,
     #          "                          AND a2.xrcbdocno = '",p_xrcadocno,"') ",
     #          "   ORDER BY xrcadocdt "  
      #160823-00027#1 Mark ---(E)---
      #160823-00027#1 Add  ---(S)---
      #161212-00005#2---add---begin--------------------
      #LET l_sql = "SELECT DISTINCT xrca_t.* ",
#170410-00053#1 mark s---      
#      LET l_sql = "SELECT DISTINCT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,",
#                  "xrcacnfid,xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,",
#                  "xrcasite,xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,",
#                  "xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,",
#                  "xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,",
#                  "xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,",
#                  "xrca051,xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,",
#                  "xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,",
#                  "xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,",
#                  "xrca131,xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,",
#                  "xrcaud006,xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,",
#                  "xrcaud016,xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,",
#                  "xrcaud026,xrcaud027,xrcaud028,xrcaud029,xrcaud030,xrcc102,xrcc122,xrcc132 ", #170317-00029#2 add xrcc102,xrcc122,xrcc132
#      #161212-00005#2---add---end--------------------
#                "    FROM xrca_t LEFT JOIN xrcc_t ON xrcaent = xrccent AND xrcald = xrccld AND xrcadocno = xrccdocno AND xrcc108 - xrcc109 > 0",
#                "   WHERE xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
#                "     AND xrcadocno IN (SELECT DISTINCT xrcadocno ",
#                "                         FROM xrca_t,xrcb_t a1,xrcb_t a2" ,     #xrca_t/a1.xrcb_t(暫估的TABLE)/a2.xrcb_t(是此次立帳單的TABLE)
#                "                        WHERE xrcaent = a1.xrcbent     AND xrcald = a1.xrcbld",
#                "                          AND xrcaent = a2.xrcbent     AND xrcald = a2.xrcbld",
#                "                          AND xrcadocno = a1.xrcbdocno AND xrca001 IN ('01','02') AND xrcastus = 'Y'" ,
#                "                          AND xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
#                "                          AND xrcadocdt <='",l_xrcadocdt,"' " ,    
#                "                          AND a1.xrcbent = a2.xrcbent ",        #"AND a1.xrcb001 = a2.xrcb001" ,>>t210跟t320的xrcb001不同
#                "                          AND a1.xrcb002 = a2.xrcb002 AND a1.xrcb003 = a2.xrcb003" ,
#                "                          AND a2.xrcbdocno = '",p_xrcadocno,"') ",
#                "   ORDER BY xrcadocdt "  
#      #160823-00027#1 Add  ---(E)---
#       PREPARE s_aapp130_ins_xrcf_p1 FROM l_sql
#       DECLARE s_aapp130_ins_xrcf_c1 CURSOR FOR s_aapp130_ins_xrcf_p1
#170410-00053#1 mark e---

      #170410-00053#1 add s--- 
      LET l_sql = "SELECT xrcbseq,xrcb002,xrcb003,xrcb007,", #180821-00038#2 add xrcbseq
                  "       xrcb101,",
                  "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
                  "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135,",
                  "       xrcborga,",
                  #"       xrcb010,xrcb011,xrcb024,xrcb036,xrcb004,",     #180807-00063#1 mark
                  "       xrcb010,xrcb011,xrcb024,xrcb036,xrcb012,",      #180807-00063#1 add
                  "       xrcb051,xrcb015,xrcb016,xrcb033,xrcb034,",
                  "       xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,",
                  "       xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,",
                  "       xrcb046,xrcb047,xrcb021 ",
                  "  FROM xrcb_t",
                  " WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_xrcald,"'",
                  "   AND xrcbdocno = '",p_xrcadocno,"' ",
                  "   AND xrcb001 IN ('11','21','19','29') ",  #180821-00038#2 add '19','29'
                  "   AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL ",
                  "   AND xrcb023 = 'Y' "
      PREPARE s_axrp130_get_t300xrcb_p FROM l_sql
      DECLARE s_axrp130_get_t300xrcb_c CURSOR FOR s_axrp130_get_t300xrcb_p
         FOREACH s_axrp130_get_t300xrcb_c INTO l_xrcbseq,l_xrcb002,l_xrcb003,l_xrcb007,l_xrcb1.*  #180821-00038#2 add xrcbseq 
       #170410-00053#1 add e--- 
#170410-00053#1 mark s---       
#          FOREACH s_aapp130_ins_xrcf_c1 INTO l_xrca.*,l_xrcc102,l_xrcc122,l_xrcc132#,l_xrcc.*    #取得t320的暫估資料   #160823-00027#1 Mark #170317-00029#2 add l_xrcc102,l_xrcc122,l_xrcc132 
#             INITIALIZE l_xrcc.* TO NULL   #160823-00027#1 Add
#             #170317-00029#2--add--s--xul
#             LET l_xrcc.xrcc102 = l_xrcc102
#             LET l_xrcc.xrcc122 = l_xrcc122
#             LET l_xrcc.xrcc132 = l_xrcc132
#             #170317-00029#2--add--e--xul
#170410-00053#1 mark e---
             CALL l_xrcf_tmp.clear()      
             #CALL s_axrp130_get_xrcf(p_xrcald,p_xrcadocno,l_type,l_xrca.*,l_xrcc.*) RETURNING l_flag,l_xrcf.*,l_xrcf_tmp #170410-00053#1 mark
             #CALL s_axrp130_get_xrcf(p_xrcald,p_xrcadocno,l_type,l_xrca.*,l_xrcc.*,l_xrcb002,l_xrcb003,l_xrcb007,l_xrcb1.*) RETURNING l_flag,l_xrcf.*,l_xrcf_tmp  #170410-00053#1 add #180821-00038#2 mark
             LET l_xrcc.xrccseq = l_xrcbseq  #180821-00038#2 add s_axrp130_get_xrcf2中l_xrcc.*参数用不到，将t300项次传进去
             CALL s_axrp130_get_xrcf2(p_xrcald,p_xrcadocno,l_type,l_xrca.*,l_xrcc.*,l_xrcb002,l_xrcb003,l_xrcb007,l_xrcb1.*) RETURNING l_flag,l_xrcf.*,l_xrcf_tmp  #180821-00038#2 add
             CASE l_flag
                  WHEN '1'  CONTINUE FOREACH  #目前的t320已沖完
                  WHEN '2'  EXIT FOREACH      #t300立帳單已沖完
                  OTHERWISE 
                            #161212-00005#2---add---begin--------------------
                            #INSERT INTO xrcf_t VALUES(l_xrcf.*)
#                            #170410-00053#1 mark s--- 
#                            INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
#                                                xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
#                                                xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
#                                                xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
#                                                xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
#                                                xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
#                                                xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
#                                                xrcf135,xrcf136,xrcf137)
#                             VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
#                                    l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
#                                    l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
#                                    l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
#                                    l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
#                                    l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
#                                    l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
#                                    l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137) 
#                             #170410-00053#1 mark e---                                    
                            #161212-00005#2---add---end--------------------
#                            #170410-00053#1 mark s---
#                            IF l_type_diff = '1' THEN    
#                               #依據每一筆寫入價差匯差
#                               CALL s_axrp130_ins_xrcf_diff('1',p_xrcald,p_xrcadocno,l_xrcf_tmp)
#                            ELSE
#                               #每次FOREACH清空都會重展一次l_xrcf_tmp的動態陣列，因此用l_xrcf_tmp_s當作最後的集合
#                               FOR l_i = 1 TO l_xrcf_tmp.getLength()
#                                   CALL l_xrcf_tmp_s.appendElement()
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrca001 = l_xrcf_tmp[l_i].xrca001
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcfseq = l_xrcf_tmp[l_i].xrcfseq
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf103 = l_xrcf_tmp[l_i].xrcf103
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf104 = l_xrcf_tmp[l_i].xrcf104
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf105 = l_xrcf_tmp[l_i].xrcf105
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf106 = l_xrcf_tmp[l_i].xrcf106
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf107 = l_xrcf_tmp[l_i].xrcf107
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf113 = l_xrcf_tmp[l_i].xrcf113
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf114 = l_xrcf_tmp[l_i].xrcf114
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf115 = l_xrcf_tmp[l_i].xrcf115
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf116 = l_xrcf_tmp[l_i].xrcf116
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf117 = l_xrcf_tmp[l_i].xrcf117
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf123 = l_xrcf_tmp[l_i].xrcf123
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf124 = l_xrcf_tmp[l_i].xrcf124
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf125 = l_xrcf_tmp[l_i].xrcf125
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf133 = l_xrcf_tmp[l_i].xrcf133
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf134 = l_xrcf_tmp[l_i].xrcf134
#                                   LET l_xrcf_tmp_s[l_xrcf_tmp_s.getLength()].xrcf135 = l_xrcf_tmp[l_i].xrcf135
#                               END FOR

#                            END IF
#                            #170410-00053#1 mark e---                            
             END CASE
          END FOREACH
#          #170410-00053#1 mark s---
#          IF l_type_diff = '2' THEN
#             CALL s_axrp130_ins_xrcf_diff('1',p_xrcald,p_xrcadocno,l_xrcf_tmp_s)
#          END IF
#          #170410-00053#1 mark s---
          #170410-00053#1 add s---
          #汇总
          #180221-00030#2 add-s

#180821-00038#2 mod s---#非杂项，xrcf由xrch写入,并产生汇差 
#          IF l_sfin1002 MATCHES '[12]' THEN
#             LET l_sql =  
#                         " SELECT xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf008,                ", 
#                         #"        '',xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",   #181113-00019#1 mark
#                         "        '1',xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",   #181113-00019#1 add
#                         "        '','','','','','','','','', ",
#                         "        '','','','','','','','','', ",
#                         "        '','','','','','',xrcf102,  ",
#                         "        xrcf122,SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf126),SUM(xrcf127),xrcf132,  ",
#                         "        SUM(xrcf133),SUM(xrcf134),SUM(xrcf135),",
#                         "        SUM(xrcf136),SUM(xrcf137),",
#                         "        SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),",
#                         "        SUM(xrcf113),SUM(xrcf114),SUM(xrcf115) ",
#                         "   FROM s_axrp130_tmp ",
#                         "  GROUP BY xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf008,              ",   
#                         "           xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga, ",
#                         "           xrcf102,xrcf122,xrcf132   "
#          ELSE
#          #180221-00030#2 add-e
#             LET l_sql =  
#                         " SELECT xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf008,                ", 
#                         "        xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",
#                         "        xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
#                         "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
#                         "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,NVL(xrcf049,' '),xrcf102, ",
#                         "        xrcf122,NVL(xrcf123,0),NVL(xrcf124,0),NVL(xrcf125,0),xrcf126,xrcf127,xrcf132,  ",
#                         "        NVL(xrcf133,0),NVL(xrcf134,0),NVL(xrcf135,0),",
#                         "        xrcf136,xrcf137,",
#                         "        SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),",
#                         "        SUM(xrcf113),SUM(xrcf114),SUM(xrcf115) ",
#                         "   FROM s_axrp130_tmp ",
#                         "  GROUP BY xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf008,              ",   
#                         "                          xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga, ",
#                         "                          xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,  ",
#                         "                          xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,  ",
#                         "                          xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,NVL(xrcf049,' '),xrcf102,   ",
#                         "                          xrcf122,NVL(xrcf123,0),NVL(xrcf124,0),NVL(xrcf125,0),xrcf126,xrcf127,xrcf132,   ",
#                         "                          NVL(xrcf133,0),NVL(xrcf134,0),NVL(xrcf135,0), ",
#                         "                          xrcf136,xrcf137 "
#         END IF #180221-00030#2 add
#         PREPARE s_axrp130_ins_xrcf_p FROM l_sql
#         DECLARE s_axrp130_ins_xrcf_c CURSOR FOR s_axrp130_ins_xrcf_p
#         FOREACH s_axrp130_ins_xrcf_c INTO l_xrcf.xrcfent,l_xrcf.xrcfld, l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf008,      
#                                           l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,  l_xrcf.xrcf021,l_xrcf.xrcf022, l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,  
#                                           l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,  l_xrcf.xrcf029,l_xrcf.xrcf030, l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
#                                           l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,  l_xrcf.xrcf038,l_xrcf.xrcf039, l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
#                                           l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,  l_xrcf.xrcf047,l_xrcf.xrcf048, l_xrcf.xrcf049,l_xrcf.xrcf102,   
#                                           l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,  l_xrcf.xrcf125,l_xrcf.xrcf126, l_xrcf.xrcf127,l_xrcf.xrcf132,
#                                           l_xrcf.xrcf133,l_xrcf.xrcf134,l_xrcf.xrcf135,                                   
#                                           l_xrcf.xrcf136,l_xrcf.xrcf137,l_xrcf.xrcf103,  l_xrcf.xrcf104,l_xrcf.xrcf105, l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115
#            #180221-00030#2 add-s
#            #暂估资料合并成一笔后摘要核算项以最大项次的为准
#            IF l_sfin1002 MATCHES '[12]' THEN
#               LET l_sql=" SELECT xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
#                         "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
#                         "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049 ",
#                         "   FROM s_axrp130_tmp ",
#                         "  WHERE xrcf009 IN (SELECT MAX(xrcf009) FROM s_axrp130_tmp)"
#                PREPARE  s_axrp130_sel_s_axrp130_tmp FROM l_sql
#                EXECUTE  s_axrp130_sel_s_axrp130_tmp INTO l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030, l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
#                                                          l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039, l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
#                                                          l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048, l_xrcf.xrcf049
#            END IF            
#            #180221-00030#2 add-e
#            
#            SELECT MAX(xrcfseq)+1 INTO l_xrcf.xrcfseq  FROM xrcf_t WHERE xrcfdocno = l_xrcf.xrcfdocno AND xrcfld = l_xrcf.xrcfld
#               AND xrcfent = l_xrcf.xrcfent
#            IF cl_null(l_xrcf.xrcfseq) THEN LET l_xrcf.xrcfseq = 1 END IF   
#            
#            INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,      
#                                xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,  
#                                xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,   
#                                xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,   
#                                xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf111,   
#                                xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,   
#                                xrcf135,xrcf136,xrcf137,xrcf103,xrcf104,xrcf105,xrcf113,xrcf114,xrcf115)
#                         VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,      
#                                l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,  
#                                l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
#                                l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
#                                l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf111,   
#                                l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,   
#                                l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137,l_xrcf.xrcf103,l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115)                 
#              
#         END FOREACH      
#
#         #汇差处理
#         #xrcf106,xrcf107,xrcf116,xrcf117
#         LET l_i = 1        
#         LET l_sql = " SELECT xrcf008,xrcf009,xrcfseq,xrca001,SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),",
#                     "       SUM(xrcf106) ,SUM(xrcf107),",
#                     "       SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),SUM(xrcf116),",
#                     "       SUM(xrcf117),",
#                     "       SUM(xrcf123),SUM(xrcf124),SUM(xrcf125) FROM s_axrp130_tmp ",
#                     "   GROUP BY xrcf008,xrcf009,xrcfseq,xrca001" 
#         PREPARE s_axrp130_ins_xrcf_p1 FROM l_sql
#         DECLARE s_axrp130_ins_xrcf_c1 CURSOR FOR s_axrp130_ins_xrcf_p1         
#         FOREACH s_axrp130_ins_xrcf_c1 INTO l_xrcf008,l_xrcf009,l_xrcf_tmp_s[l_i].xrcfseq,l_xrcf_tmp_s[l_i].xrca001,l_xrcf_tmp_s[l_i].xrcf103,l_xrcf_tmp_s[l_i].xrcf104,
#l_xrcf_tmp_s[l_i].xrcf105,l_xrcf_tmp_s[l_i].xrcf106,l_xrcf_tmp_s[l_i].xrcf107,l_xrcf_tmp_s[l_i].xrcf113,l_xrcf_tmp_s[l_i].xrcf114,
#l_xrcf_tmp_s[l_i].xrcf115,l_xrcf_tmp_s[l_i].xrcf116,l_xrcf_tmp_s[l_i].xrcf117,l_xrcf_tmp_s[l_i].xrcf123,l_xrcf_tmp_s[l_i].xrcf124,l_xrcf_tmp_s[l_i].xrcf125         
#           
#            
#               LET l_i= l_i + 1
#            
#         END FOREACH
#         CALL l_xrcf_tmp_s.deleteElement(l_xrcf_tmp_s.getLength())
#         IF l_type_diff = '2' THEN
#            CALL s_axrp130_ins_xrcf_diff('1',p_xrcald,p_xrcadocno,l_xrcf_tmp_s)
#         END IF       
#         #170410-00053#1 add e---            

          #非杂项，xrcf由xrch写入,并产生汇差
          IF l_sfin1002 MATCHES '[12]' THEN
             IF l_sfin9025 = 'N' THEN    #190423-00042#19
                LET l_sql =  
                            #" SELECT DISTINCT xrchent,xrcfld,xrchdocno,0,xrcfseq2,xrcf001,xrcf002,xrch001,SUM(xrch006),  ",  #1218 xrcfseq-->0   (#190117)#180821-00038#2 mark
                            " SELECT DISTINCT xrchent,xrcfld,xrchdocno,'',xrcfseq2,xrcf001,xrcf002,xrch001,SUM(xrch006),  ",  #1218 xrcfseq-->0   (#190117)#180821-00038#2 add
                            #"        '1',xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,", #1218 沖銷參數設定1or2,暫估項次(xrcf009)給予1 #190423-00042#19
                            "        '0',xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,", #沖銷參數設定1or2,暫估項次(xrcf009)給予0   #190423-00042#19
#                            "        '','','','','','','','','', ",  #190807-00032#1 mark
                            "        '','','',xrcf029,xrcf030,'','','','', ",  #190807-00032#1 add
                            "        '','','','','','','','','', ",
                            "        '','','','','','',xrcf102,  ",
                            "        xrcf122,SUM(NVL(xrcf123,0)),SUM(NVL(xrcf124,0)),SUM(NVL(xrcf125,0)),",
                            "        SUM(NVL(xrcf126,0)),SUM(NVL(xrcf127,0)),xrcf132,  ",
                            "        SUM(NVL(xrcf133,0)),SUM(NVL(xrcf134,0)),SUM(NVL(xrcf135,0)),",
                            "        SUM(NVL(xrcf136,0)),SUM(NVL(xrcf137,0)),",
                            "        SUM(xrch017),SUM(xrch018),SUM(xrch019),",   
                            "        SUM(xrch020),SUM(xrch021),SUM(xrch022) ",  
                            "   FROM ( SELECT DISTINCT xrchent,xrcfld,xrchdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrch001,xrch006,                ",  #1218 del xrcfseq
                            "        '',xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",
#                            "        '','','','','','','','','', ",  #190807-00032#1 mark
                            "        '','','',xrcf029,xrcf030,'','','','', ",  #190807-00032#1 add
                            "        '','','','','','','','','', ",
                            "        '','','','','','',xrcf102,  ",
                            "        xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,",
                            "        xrcf135,xrcf136,xrcf137,xrch017+xrch015 xrch017,xrch018,xrch019+xrch015 xrch019,xrch020+xrch016 xrch020,xrch021,xrch022+xrch016 xrch022 ",
                            "   FROM xrch_t,s_axrp130_tmp ",
                            "  WHERE xrchent = xrcfent AND xrchdocno = xrcfdocno AND xrch001 = xrcf008 AND xrch002 = xrcf009 AND xrchseq = xrcfseq ) t51 ",  #PGS(D)-10500-add t51
                            "  GROUP BY xrchent,xrcfld,xrchdocno,xrcfseq2,xrcf001,xrcf002,xrch001,              ",   #1218 del xrcfseq 
                            "           xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga, ",
                            "           xrcf029,xrcf030, ",  #190807-00032#1 add
                            "           xrcf102,xrcf122,xrcf132   "
             #190423-00042#19 start
             ELSE
                LET l_sql =  
                            " SELECT DISTINCT xrchent,xrcfld,xrchdocno,'',xrcfseq2,xrcf001,xrcf002,xrch001,SUM(xrch006),  ",  
                            "        '0','',xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",     #沖銷參數設定1or2,暫估項次(xrcf009)給予0
#                            "        '','','','','','','','',xrcf034, ",  #190807-00032#1 mark
                            "        '','','',xrcf029,xrcf030,'','','',xrcf034, ",  #190807-00032#1 add
                            "        xrcf035,'','','','','','','','', ",
                            "        '','','','','','',xrcf102,  ",
                            "        xrcf122,SUM(NVL(xrcf123,0)),SUM(NVL(xrcf124,0)),SUM(NVL(xrcf125,0)),",
                            "        SUM(NVL(xrcf126,0)),SUM(NVL(xrcf127,0)),xrcf132,  ",
                            "        SUM(NVL(xrcf133,0)),SUM(NVL(xrcf134,0)),SUM(NVL(xrcf135,0)),",
                            "        SUM(NVL(xrcf136,0)),SUM(NVL(xrcf137,0)),",
                            "        SUM(xrch017),SUM(xrch018),SUM(xrch019),",   
                            "        SUM(xrch020),SUM(xrch021),SUM(xrch022) ",  
                            "   FROM ( SELECT DISTINCT xrchent,xrcfld,xrchdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrch001,xrch006,                ",  
                            "        '','',xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",
#                            "        '','','','','','','','',xrcf034, ",  #190807-00032#1 mark
                            "        '','','',xrcf029,xrcf030,'','','',xrcf034, ",  #190807-00032#1 add
                            "        xrcf035,'','','','','','','','', ",
                            "        '','','','','','',xrcf102,  ",
                            "        xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,",
                            "        xrcf135,xrcf136,xrcf137,xrch017+xrch015 xrch017,xrch018,xrch019+xrch015 xrch019,xrch020+xrch016 xrch020,xrch021,xrch022+xrch016 xrch022 ",
                            "   FROM xrch_t,s_axrp130_tmp ",
                            "  WHERE xrchent = xrcfent AND xrchdocno = xrcfdocno AND xrch001 = xrcf008 AND xrch002 = xrcf009 AND xrchseq = xrcfseq ) t52 ",  #PGS(D)-10500-add t52
                            "  GROUP BY xrchent,xrcfld,xrchdocno,xrcfseq2,xrcf001,xrcf002,xrch001,              ",   
                            "           xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga, ",
                            "           xrcf029,xrcf030, ",  #190807-00032#1 add
                            "           xrcf034,xrcf035,xrcf102,xrcf122,xrcf132   "
             END IF
             #190423-00042#19 end               
                                 
          ELSE
          #180221-00030#2 add-e
             LET l_sql =  
                         #" SELECT DISTINCT xrchent,xrcfld,xrchdocno,xrchseq,xrcfseq2,xrcf001,xrcf002,xrch001,SUM(xrch006),                ",          #(#190117)#180821-00038#2 mark
                         "  SELECT DISTINCT xrchent,xrcfld,xrchdocno,'',xrcfseq2,xrcf001,xrcf002,xrch001,SUM(xrch006),                ",               #(#190117)#180821-00038#2 add
                         "        xrch002,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,",
                         "        xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
                         "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
                         "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,NVL(xrcf049,' '),xrcf102, ",
                         "        xrcf122,SUM(NVL(xrcf123,0)),SUM(NVL(xrcf124,0)),SUM(NVL(xrcf125,0)),SUM(NVL(xrcf126,0)),SUM(NVL(xrcf127,0)),xrcf132,  ",
                         "        SUM(NVL(xrcf133,0)),SUM(NVL(xrcf134,0)),SUM(NVL(xrcf135,0)),",
                         "        SUM(NVL(xrcf136,0)),SUM(NVL(xrcf137,0)),",
                         "        SUM(xrch017+xrch015),SUM(xrch018),SUM(xrch019+xrch015),",
                         "        SUM(xrch020+xrch016),SUM(xrch021),SUM(xrch022+xrch016) ",
                         "   FROM xrch_t,s_axrp130_tmp ",
                         "  WHERE xrchent = xrcfent AND xrchdocno = xrcfdocno AND xrch001 = xrcf008 AND xrch002 = xrcf009 ",
                         #"  GROUP BY xrchent,xrcfld,xrchdocno,xrchseq,xrcfseq2,xrcf001,xrcf002,xrch001,              ",      #(#190117)#180821-00038#2 mark
                         "  GROUP BY xrchent,xrcfld,xrchdocno,xrcfseq2,xrcf001,xrcf002,xrch001,              ",               #(#190117)#180821-00038#2 add 
                         "                          xrch002,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga, ",
                         "                          xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,  ",
                         "                          xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,  ",
                         "                          xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,NVL(xrcf049,' '),xrcf102,   ",
                         "                          xrcf122,xrcf132   "
                         ," ORDER BY xrch001,xrch002" #190125-00035#1 add 
         END IF #180221-00030#2 add
         PREPARE s_axrp130_ins_xrcf_p FROM l_sql
         DECLARE s_axrp130_ins_xrcf_c CURSOR FOR s_axrp130_ins_xrcf_p
          
         #190402-00043#2---add---(S)在寫完xrch_t後寫入xrcf_t前檢視是否原幣沖銷完畢但仍有本幣未沖銷完的情形,有的話需進行分攤
         #非本次沖銷且未確認的xrcf已沖金額xrcf105 = xrch019+xrch015,xrcf115=xrch022+xrch016
         LET l_sql = " SELECT SUM(xrch019+xrch015),SUM(xrch022+xrch016)",
                     "   FROM xrch_t ",
                     "   LEFT JOIN xrca_t ON xrcaent = xrchent AND xrcacomp = xrchcomp AND xrcadocno = xrchdocno",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno <> '",p_xrcadocno,"'",
                     "    AND xrch001 = ? AND xrch002 = ?",
                     "    AND xrcald = '",p_xrcald,"'",
                     "    AND xrcastus = 'N'"
         PREPARE s_axrp130_get_sumxrch FROM l_sql
         
         #190423-00042#19 start
         LET l_sql = " SELECT SUM(xrch019+xrch015),SUM(xrch022+xrch016)",
                     "   FROM xrch_t ",
                     "   LEFT JOIN xrca_t ON xrcaent = xrchent AND xrcacomp = xrchcomp AND xrcadocno = xrchdocno",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno <> '",p_xrcadocno,"'",
                     "    AND xrch001 = ? ",   
                     "    AND xrcald = '",p_xrcald,"'",
                     "    AND xrcastus = 'N'"
         PREPARE s_axrp130_get_sumxrch2 FROM l_sql
         LET l_sql = " SELECT SUM(xrch019+xrch015),SUM(xrch022+xrch016)",
                     "   FROM xrch_t ",
                     "   LEFT JOIN xrca_t ON xrcaent = xrchent AND xrcacomp = xrchcomp AND xrcadocno = xrchdocno",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno <> '",p_xrcadocno,"'",
                     "    AND xrch001 = ? ",   
                     "    AND xrcald = '",p_xrcald,"'",
                     "    AND xrcastus = 'N'",
                     "    AND xrch002 IN (SELECT xrcbseq FROM xrcb_t ",
                     "                  WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_xrcald,"' AND xrcbdocno = ? ",
                     "                    AND xrcb015 = ?  AND xrcb016 = ? )"
         PREPARE s_axrp130_get_sumxrch3 FROM l_sql
         #190423-00042#19 end          
         
         #抓要比較的暫估單xrcc未沖銷金額
         LET l_sql = " SELECT SUM(xrcc108-xrcc109),SUM(xrcc118+xrcc113-xrcc119)",
                     "   FROM xrcc_t ",
                     "  WHERE xrccent = ",g_enterprise,
                     "    AND xrccld = '",p_xrcald,"'",
                     "    AND xrccdocno = ? ",
                     "    AND xrccseq = ?"
         PREPARE s_axrp130_get_sumxrcc FROM l_sql
       
         #190423-00042#19 start
         LET l_sql = " SELECT SUM(xrcc108-xrcc109),SUM(xrcc118+xrcc113-xrcc119)",
                     "   FROM xrcc_t ",
                     "  WHERE xrccent = ",g_enterprise,
                     "    AND xrccld = '",p_xrcald,"'",
                     "    AND xrccdocno = ? ",
                     "    AND xrccseq = ?",
                     "    AND xrcc018 = ?",
                     "    AND xrcc019 = ?"
         PREPARE s_axrp130_get_sumxrcc2 FROM l_sql
         #190423-00042#19 end 
         
         LET l_sql = " SELECT MIN(xrch022) ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ? AND xrch002 = ?"
         PREPARE s_axrp130_min_xrch022 FROM l_sql
         
         #190423-00042#19 start
         LET l_sql = " SELECT MIN(xrch022) ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ? "                 
         PREPARE s_axrp130_min_xrch022_2 FROM l_sql
         LET l_sql = " SELECT MIN(xrch022) ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ? ",                
                     "    AND xrch002 IN (SELECT xrcbseq FROM xrcb_t ",
                     "                  WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_xrcald,"' AND xrcbdocno = ? ",
                     "                    AND xrcb015 = ?  AND xrcb016 = ? )" 
         PREPARE s_axrp130_min_xrch022_3 FROM l_sql
         #190423-00042#19 end          
         
         #xrch依xrch022由大到小排序
         LET l_sql = " SELECT xrch002,xrch011,xrch020,xrch022 ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ?",
                     "  ORDER BY xrch022 DESC" 
         PREPARE s_axrp130_get_xrch FROM l_sql
         DECLARE s_axrp130_get_xrch_c CURSOR FOR s_axrp130_get_xrch

         #190423-00042#19 start
         LET l_sql = " SELECT xrch002,xrch011,xrch020,xrch022 ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ?",
                     "    AND xrch002 IN (SELECT xrcbseq FROM xrcb_t ",
                     "                  WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_xrcald,"' AND xrcbdocno = ? ",
                     "                    AND xrcb015 = ?  AND xrcb016 = ? )",
                     "  ORDER BY xrch022 DESC"
         PREPARE s_axrp130_get_xrch3 FROM l_sql
         DECLARE s_axrp130_get_xrch_c3 CURSOR FOR s_axrp130_get_xrch3
         #190423-00042#19 end 
         
         #沖銷參數=3時一筆cf只會有一筆ch
         LET l_sql = " SELECT xrch002,xrch011,xrch020,xrch022 ",
                     "   FROM xrch_t ",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ? AND xrch002 = ?",
                     "  ORDER BY xrch022 DESC" 
         PREPARE s_axrp130_get_xrch2 FROM l_sql
         
         LET l_sql = " UPDATE xrch_t SET xrch011 = ? ,xrch020 = ?, xrch022 = ?",
                     "  WHERE xrchent = ",g_enterprise,
                     "    AND xrchcomp = '",l_glaacomp,"'",
                     "    AND xrchdocno = '",p_xrcadocno,"'",
                     "    AND xrch001 = ? AND xrch002 = ? "
         PREPARE s_axrp130_upd_xrch FROM l_sql
         
#         LET l_sql = " UPDATE s_axrp130_tmp SET xrcf117 = xrcf117 + ? ", #190716-00007#1---mark
         LET l_sql = " UPDATE s_axrp130_tmp SET xrcf117 = xrcf117 - ? ", #190716-00007#1---add
                     " WHERE xrcfent = ",g_enterprise,
                     "   AND xrcfld = '",p_xrcald,"'",
                     "   AND xrcfdocno = '",p_xrcadocno,"'",
                     #"   AND xrcf008 = ? AND xrcf009 = ?"   #190423-00042#19
                     "   AND xrcf008 = ? AND xrcf009 = ? AND xrcf010 = ?"   #190423-00042#19
         PREPARE s_axrp130_upd_tmp FROM l_sql
         
         FOREACH s_axrp130_ins_xrcf_c INTO l_xrcf_tmp2.xrcfent,l_xrcf_tmp2.xrcfld, l_xrcf_tmp2.xrcfdocno,l_xrcf_tmp2.xrcfseq,l_xrcf_tmp2.xrcfseq2,l_xrcf_tmp2.xrcf001,l_xrcf_tmp2.xrcf002,l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf007,     
                                           l_xrcf_tmp2.xrcf009,l_xrcf_tmp2.xrcf010,l_xrcf_tmp2.xrcf020,  l_xrcf_tmp2.xrcf021,l_xrcf_tmp2.xrcf022, l_xrcf_tmp2.xrcf023,l_xrcf_tmp2.xrcf024,l_xrcf_tmp2.xrcf025,l_xrcf_tmp2.xrcforga,  
                                           l_xrcf_tmp2.xrcf026,l_xrcf_tmp2.xrcf027,l_xrcf_tmp2.xrcf028,  l_xrcf_tmp2.xrcf029,l_xrcf_tmp2.xrcf030, l_xrcf_tmp2.xrcf031,l_xrcf_tmp2.xrcf032,l_xrcf_tmp2.xrcf033,l_xrcf_tmp2.xrcf034,   
                                           l_xrcf_tmp2.xrcf035,l_xrcf_tmp2.xrcf036,l_xrcf_tmp2.xrcf037,  l_xrcf_tmp2.xrcf038,l_xrcf_tmp2.xrcf039, l_xrcf_tmp2.xrcf040,l_xrcf_tmp2.xrcf041,l_xrcf_tmp2.xrcf042,l_xrcf_tmp2.xrcf043,   
                                           l_xrcf_tmp2.xrcf044,l_xrcf_tmp2.xrcf045,l_xrcf_tmp2.xrcf046,  l_xrcf_tmp2.xrcf047,l_xrcf_tmp2.xrcf048, l_xrcf_tmp2.xrcf049,l_xrcf_tmp2.xrcf102,  
                                           l_xrcf_tmp2.xrcf122,l_xrcf_tmp2.xrcf123,l_xrcf_tmp2.xrcf124,  l_xrcf_tmp2.xrcf125,l_xrcf_tmp2.xrcf126, l_xrcf_tmp2.xrcf127,l_xrcf_tmp2.xrcf132, 
                                           l_xrcf_tmp2.xrcf133,l_xrcf_tmp2.xrcf134,l_xrcf_tmp2.xrcf135,  
                                           l_xrcf_tmp2.xrcf136,l_xrcf_tmp2.xrcf137,l_xrcf_tmp2.xrcf103,  l_xrcf_tmp2.xrcf104,l_xrcf_tmp2.xrcf105, l_xrcf_tmp2.xrcf113,l_xrcf_tmp2.xrcf114,l_xrcf_tmp2.xrcf115
            #190423-00042#19 start
            IF l_sfin1002 MATCHES '[12]' AND l_sfin9025 = 'Y' THEN   
               IF l_xrcf_tmp2.xrcf034 IS NULL THEN LET l_xrcf_tmp2.xrcf034 = ' ' END IF
               IF l_xrcf_tmp2.xrcf035 IS NULL THEN LET l_xrcf_tmp2.xrcf035 = ' ' END IF
               SELECT xrcc001 INTO l_xrcf_tmp2.xrcf010 FROM xrcc_t 
                WHERE xrccent = g_enterprise AND xrccld = p_xrcald AND xrccdocno = l_xrcf_tmp2.xrcf008 AND xrccseq = l_xrcf_tmp2.xrcf009 AND
                      xrcc018 = l_xrcf_tmp2.xrcf034 AND xrcc019 = l_xrcf_tmp2.xrcf035
            END IF 
            #190423-00042#19 end 

            #190423-00042#19 start
            IF l_sfin1002 MATCHES '[12]' THEN
               IF l_sfin9025 = 'N' THEN   
                  EXECUTE s_axrp130_get_sumxrch2 USING l_xrcf_tmp2.xrcf008   
                     INTO l_sum_xrch019,l_sum_xrch022
               ELSE
                  EXECUTE s_axrp130_get_sumxrch3 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf034,l_xrcf_tmp2.xrcf035   
                     INTO l_sum_xrch019,l_sum_xrch022
               END IF
            ELSE 
            #190423-00042#19 end 
               EXECUTE s_axrp130_get_sumxrch USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf009
                  INTO l_sum_xrch019,l_sum_xrch022
            END IF   #190423-00042#19      
            IF cl_null(l_sum_xrch019) THEN LET l_sum_xrch019 = 0 END IF
            IF cl_null(l_sum_xrch022) THEN LET l_sum_xrch022 = 0 END IF
            LET l_xrch_105 = l_sum_xrch019 + l_xrcf_tmp2.xrcf105 #其他單待沖原幣+本次待沖原幣
            LET l_xrch_115 = l_sum_xrch022 + l_xrcf_tmp2.xrcf115 #其他單待沖本幣+本次待沖本幣
            #190423-00042#19 start
            IF l_sfin1002 MATCHES '[12]' AND l_sfin9025 = 'Y' THEN   
               EXECUTE s_axrp130_get_sumxrcc2 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf009,l_xrcf_tmp2.xrcf034,l_xrcf_tmp2.xrcf035   
                  INTO l_sum_xrcc108,l_sum_xrcc118
            ELSE 
            #190423-00042#19 end             
               EXECUTE s_axrp130_get_sumxrcc USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf009
                  INTO l_sum_xrcc108,l_sum_xrcc118
            END IF #190423-00042#19     
            IF cl_null(l_sum_xrcc108) THEN LET l_sum_xrcc108 = 0 END IF
            IF cl_null(l_sum_xrcc118) THEN LET l_sum_xrcc118 = 0 END IF
            LET l_diff = 0
            LET l_diff_left = 0
            IF (l_sum_xrcc108 = l_xrch_105 ) AND (l_sum_xrcc118 <> l_xrch_115) THEN #未沖銷原幣=未確認之xrch沖銷原幣,未沖銷本幣<>未確認之xrch沖銷本幣需分攤
               LET l_diff = l_sum_xrcc118 - l_xrch_115
               LET l_diff_left = l_diff
               #190423-00042#19 start
               IF l_sfin1002 MATCHES '[12]'  THEN   
                  IF l_sfin9025 = 'N' THEN
                     EXECUTE s_axrp130_min_xrch022_2 USING l_xrcf_tmp2.xrcf008 INTO l_min_xrch022  
                  ELSE
                     EXECUTE s_axrp130_min_xrch022_3 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf034,l_xrcf_tmp2.xrcf035 INTO l_min_xrch022   
                  END IF
               ELSE 
               #190423-00042#19 end                
                  EXECUTE s_axrp130_min_xrch022 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf009 INTO l_min_xrch022
               END IF #190423-00042#19  
               IF l_sfin1002 MATCHES '[12]' THEN #沖銷參數1:一筆cf對應多筆ch,要分攤回寫
                  IF l_sfin9025 = 'N' THEN     #190423-00042#19 
                     FOREACH s_axrp130_get_xrch_c USING l_xrcf_tmp2.xrcf008 
                        INTO l_xrch_o.xrch002,l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022
                        LET l_adjust = (l_xrch_o.xrch022/l_xrcf_tmp2.xrcf115) * l_diff #計算xrch022+xrch016佔總xrch022+xrch016的比率 * diff
                        CALL s_curr_round_ld('1',p_xrcald,g_glaa.glaa001,l_adjust,2) RETURNING g_sub_success,g_errno,l_adjust  #190716-00007#1---add  应该是计算以后就取位 
                        IF l_adjust = 0 OR l_xrch_o.xrch022 = l_min_xrch022 THEN LET l_adjust = l_diff_left END IF #未分攤完但分攤金額為0時,把剩下的分攤金額歸在此筆
#                        CALL s_curr_round_ld('1',p_xrcald,g_glaa.glaa001,l_adjust,2) RETURNING g_sub_success,g_errno,l_adjust  #190716-00007#1---mark 如果是0.003这样取2位就是0
                        LET l_xrch_o.xrch011 = l_xrch_o.xrch011 + l_adjust
                        LET l_xrch_o.xrch020 = l_xrch_o.xrch020 + l_adjust
                        LET l_xrch_o.xrch022 = l_xrch_o.xrch022 + l_adjust
                        EXECUTE s_axrp130_upd_xrch USING l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022,l_xrcf_tmp2.xrcf008,l_xrch_o.xrch002
                        IF SQLCA.SQLCODE THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = SQLCA.SQLCODE
                           LET g_errparam.extend = "s_axrp130_upd_xrch err"
                           LET g_errparam.popup = TRUE
                           CALL cl_err()            
                        END IF
                        #更新s_axrp130_tmp裡的匯差xrcf117 後面算匯差用
                        #EXECUTE s_axrp130_upd_tmp USING l_adjust,l_xrcf_tmp2.xrcf008 ,l_xrcf_tmp2.xrcf009   #190423-00042#19
#                        EXECUTE s_axrp130_upd_tmp USING l_adjust,l_xrcf_tmp2.xrcf008 ,l_xrcf_tmp2.xrcf009 ,l_xrcf_tmp2.xrcf010   #190423-00042#19   #190716-00007#1--mark
                        EXECUTE s_axrp130_upd_tmp USING l_adjust,l_xrcf_tmp2.xrcf008 ,l_xrch_o.xrch002,l_xrcf_tmp2.xrcf010   #190716-00007#1--add--因为l_xrcf_tmp2.xrcf009这个sql对应得字段是0所以不应该作为条件得值
                        IF SQLCA.SQLCODE THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = SQLCA.SQLCODE
                           LET g_errparam.extend = "s_axrp130_upd_tmp err"
                           LET g_errparam.popup = TRUE
                           CALL cl_err()            
                        END IF
                        LET l_xrch_o.xrch011 = 0
                        LET l_xrch_o.xrch020 = 0
                        LET l_xrch_o.xrch022 = 0
                        LET l_diff_left = l_diff_left - l_adjust
                        IF l_diff_left = 0 THEN EXIT FOREACH END IF #分攤完了就跳出
                     END FOREACH
                  #190423-00042#19 start
                  ELSE
                     FOREACH s_axrp130_get_xrch_c3 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf034,l_xrcf_tmp2.xrcf035
                        INTO l_xrch_o.xrch002,l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022
                        LET l_adjust = (l_xrch_o.xrch022/l_xrcf_tmp2.xrcf115) * l_diff #計算xrch022+xrch016佔總xrch022+xrch016的比率 * diff
                        CALL s_curr_round_ld('1',p_xrcald,g_glaa.glaa001,l_adjust,2) RETURNING g_sub_success,g_errno,l_adjust #190716-00007#1--add-
                        IF l_adjust = 0 OR l_xrch_o.xrch022 = l_min_xrch022 THEN LET l_adjust = l_diff_left END IF #未分攤完但分攤金額為0時,把剩下的分攤金額歸在此筆
#                        CALL s_curr_round_ld('1',p_xrcald,g_glaa.glaa001,l_adjust,2) RETURNING g_sub_success,g_errno,l_adjust #190716-00007#1--mark-
                        LET l_xrch_o.xrch011 = l_xrch_o.xrch011 + l_adjust
                        LET l_xrch_o.xrch020 = l_xrch_o.xrch020 + l_adjust
                        LET l_xrch_o.xrch022 = l_xrch_o.xrch022 + l_adjust
                        EXECUTE s_axrp130_upd_xrch USING l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022,l_xrcf_tmp2.xrcf008,l_xrch_o.xrch002
                        IF SQLCA.SQLCODE THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = SQLCA.SQLCODE
                           LET g_errparam.extend = "s_axrp130_upd_xrch err"
                           LET g_errparam.popup = TRUE
                           CALL cl_err()            
                        END IF
                        #更新s_axrp130_tmp裡的匯差xrcf117 後面算匯差用
#                        EXECUTE s_axrp130_upd_tmp USING l_adjust,l_xrcf_tmp2.xrcf008 ,l_xrcf_tmp2.xrcf009 ,l_xrcf_tmp2.xrcf010  #190716-00007#1--mark--因为l_xrcf_tmp2.xrcf009这个sql对应得字段是0所以不应该作为条件得值
                        EXECUTE s_axrp130_upd_tmp USING l_adjust,l_xrcf_tmp2.xrcf008 ,l_xrch_o.xrch002,l_xrcf_tmp2.xrcf010  #190716-00007#1--add--因为l_xrcf_tmp2.xrcf009这个sql对应得字段是0所以不应该作为条件得值
                        IF SQLCA.SQLCODE THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = SQLCA.SQLCODE
                           LET g_errparam.extend = "s_axrp130_upd_tmp err"
                           LET g_errparam.popup = TRUE
                           CALL cl_err()            
                        END IF
                        LET l_xrch_o.xrch011 = 0
                        LET l_xrch_o.xrch020 = 0
                        LET l_xrch_o.xrch022 = 0
                        LET l_diff_left = l_diff_left - l_adjust
                        IF l_diff_left = 0 THEN EXIT FOREACH END IF #分攤完了就跳出
                     END FOREACH
                  END IF
                  #190423-00042#19 end   
               ELSE #沖銷參數3時只有一筆所以不用分攤,直接把差異數回加到匯差/未稅沖銷本幣/含稅沖銷本幣
                  EXECUTE s_axrp130_get_xrch2 USING l_xrcf_tmp2.xrcf008,l_xrcf_tmp2.xrcf009
                     INTO l_xrch_o.xrch002,l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022
                  LET l_xrch_o.xrch011 = l_xrch_o.xrch011 + l_diff
                  LET l_xrch_o.xrch020 = l_xrch_o.xrch020 + l_diff
                  LET l_xrch_o.xrch022 = l_xrch_o.xrch022 + l_diff  
                  EXECUTE s_axrp130_upd_xrch USING l_xrch_o.xrch011,l_xrch_o.xrch020,l_xrch_o.xrch022,l_xrcf_tmp2.xrcf008,l_xrch_o.xrch002
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.extend = "s_axrp130_upd_xrch err"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()            
                  END IF
                  #更新s_axrp130_tmp裡的匯差xrcf117 後面算匯差用
                  #EXECUTE s_axrp130_upd_tmp USING l_diff,l_xrcf_tmp2.xrcf008 ,l_xrcf_tmp2.xrcf009   #190423-00042#19
                  EXECUTE s_axrp130_upd_tmp USING l_diff,l_xrcf_tmp2.xrcf008 ,l_xrcf_tmp2.xrcf009,l_xrcf_tmp2.xrcf010   #190423-00042#19
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.extend = "s_axrp130_upd_tmp err"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()            
                  END IF
               END IF 
            END IF
            INITIALIZE l_xrcf_tmp2.* TO NULL
         END FOREACH
         #190402-00043#2---add---(E)
         
         FOREACH s_axrp130_ins_xrcf_c INTO l_xrcf.xrcfent,l_xrcf.xrcfld, l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf008, l_xrcf.xrcf007,     
                                           l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,  l_xrcf.xrcf021,l_xrcf.xrcf022, l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,  
                                           l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,  l_xrcf.xrcf029,l_xrcf.xrcf030, l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
                                           l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,  l_xrcf.xrcf038,l_xrcf.xrcf039, l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
                                           l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,  l_xrcf.xrcf047,l_xrcf.xrcf048, l_xrcf.xrcf049,l_xrcf.xrcf102,   
                                           l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,  l_xrcf.xrcf125,l_xrcf.xrcf126, l_xrcf.xrcf127,l_xrcf.xrcf132,
                                           l_xrcf.xrcf133,l_xrcf.xrcf134,l_xrcf.xrcf135,                                   
                                           l_xrcf.xrcf136,l_xrcf.xrcf137,l_xrcf.xrcf103,  l_xrcf.xrcf104,l_xrcf.xrcf105, l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115
            #190423-00042#19 start
            IF l_sfin1002 MATCHES '[12]' AND l_sfin9025 = 'Y' THEN   
               IF l_xrcf.xrcf034 IS NULL THEN LET l_xrcf.xrcf034 = ' ' END IF
               IF l_xrcf.xrcf035 IS NULL THEN LET l_xrcf.xrcf035 = ' ' END IF
               SELECT xrcc001 INTO l_xrcf.xrcf010 FROM xrcc_t 
                WHERE xrccent = g_enterprise AND xrccld = p_xrcald AND xrccdocno = l_xrcf.xrcf008 AND xrccseq = l_xrcf.xrcf009 AND
                      xrcc018 = l_xrcf.xrcf034 AND xrcc019 = l_xrcf.xrcf035
            END IF 
            #190423-00042#19 end 
            
            #180221-00030#2 add-s
            #暂估资料合并成一笔后摘要核算项以最大项次的为准
            IF l_sfin1002 MATCHES '[12]' THEN
               #190726-00008#1---add---->,l_xrcf.xrcfseq2  这个栏位的值保存暂估单的项次,因为凭证那边有一个get_xrcf                
                LET l_sql = " SELECT xrcf009 ",
                            "   FROM s_axrp130_tmp ",
                            " WHERE  xrcfent = '",l_xrcf.xrcfent,"' ",
                            " AND xrcfld = '",l_xrcf.xrcfld,"' ",
                            " AND xrcfdocno = '",l_xrcf.xrcfdocno,"' ",
                            " AND xrcfseq2 =",l_xrcf.xrcfseq2,
                            " AND xrcf001 ='",l_xrcf.xrcf001, "' ",
                            " AND xrcf002 ='",l_xrcf.xrcf002, "' ",
                            " AND xrcf008 ='",l_xrcf.xrcf008,"'",
                            " AND xrcf010 ='",l_xrcf.xrcf010,"'",
                            " AND rownum = 1 "
                #PGS(D) meno 13130 -S add
                #PGS(D) meno 13130 -E add  
                PREPARE  s_axrp130_sel_tmp_xrcf009 FROM l_sql
                EXECUTE  s_axrp130_sel_tmp_xrcf009 INTO l_xrcf.xrcfseq2  
                
               #190726-00008#1---add----str 
               IF l_sfin9025='N' THEN    #190423-00042#19
                  #PGS(D)-10500 -S-
#                  LET l_sql=" SELECT xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
#                            "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
#                            "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049 ",
#                            "   FROM s_axrp130_tmp ",
#                            "  WHERE xrcf009 IN (SELECT MAX(xrcf009) FROM s_axrp130_tmp)"
                  LET l_sql=" SELECT xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
                            "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
                            "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049 ",
                            "   FROM s_axrp130_tmp ",
                            "  WHERE xrcf009 IN (SELECT MAX(xrcf009) FROM s_axrp130_tmp)",
                            "    AND ROWNUM = 1 "
                  #PGS(D)-10500 -E-
               #190423-00042#19 start
               ELSE
                  #PGS(D)-10500 -S-
#                  LET l_sql=" SELECT xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
#                            "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
#                            "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049 ",
#                            "   FROM s_axrp130_tmp ",
#                            "  WHERE xrcf009 IN (SELECT MAX(xrcf009) FROM s_axrp130_tmp WHERE xrcf034='",l_xrcf.xrcf034,"' AND xrcf035='",l_xrcf.xrcf035,"' )",
#                            "    AND xrcf034='",l_xrcf.xrcf034,"' AND xrcf035='",l_xrcf.xrcf035,"' )"
                  LET l_sql=" SELECT xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034, ",
                            "        xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043, ",
                            "        xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049 ",
                            "   FROM s_axrp130_tmp ",
                            "  WHERE xrcf009 IN (SELECT MAX(xrcf009) FROM s_axrp130_tmp WHERE xrcf034='",l_xrcf.xrcf034,"' AND xrcf035='",l_xrcf.xrcf035,"' )",
                            "    AND xrcf034='",l_xrcf.xrcf034,"' AND xrcf035='",l_xrcf.xrcf035,"' )",
                            "    AND ROWNUM = 1 "
                  #PGS(D)-10500 -E-
               END IF
               #190423-00042#19 end                             
                   PREPARE  s_axrp130_sel_s_axrp130_tmp FROM l_sql
                   EXECUTE  s_axrp130_sel_s_axrp130_tmp INTO l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030, l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
                                                             l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039, l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
                                                             l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048, l_xrcf.xrcf049
            END IF            
            #180221-00030#2 add-e
            
            SELECT MAX(xrcfseq)+1 INTO l_xrcf.xrcfseq  FROM xrcf_t WHERE xrcfdocno = l_xrcf.xrcfdocno AND xrcfld = l_xrcf.xrcfld
               AND xrcfent = l_xrcf.xrcfent
            IF cl_null(l_xrcf.xrcfseq) THEN LET l_xrcf.xrcfseq = 1 END IF   
            
            INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,      
                                xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,  
                                xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,   
                                xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,   
                                xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf111,   
                                xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,   
                                xrcf135,xrcf136,xrcf137,xrcf103,xrcf104,xrcf105,xrcf113,xrcf114,xrcf115)
                         VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,      
                                l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,  
                                l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,   
                                l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,   
                                l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf111,   
                                l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,   
                                l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137,l_xrcf.xrcf103,l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115)                 
              
         END FOREACH      

         #汇差处理
         #xrcf106,xrcf107,xrcf116,xrcf117
         LET l_i = 1        
#         LET l_sql = " SELECT DISTINCT xrcf008,xrcfseq,xrca001,SUM(xrch017),SUM(xrch018),SUM(xrch019),",
#                     "        SUM(xrcf106),SUM(xrcf107),", #DIFF 原幣價差金額 #xrcf107原币汇差(原币无汇差应该为0）
#                     "        SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),",
#                     "        SUM(xrcf116),SUM(xrcf117), ",  #DIFF 本幣價差金額 DIFF 本幣匯差金額
#                     "        SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrch015),SUM(xrch016) FROM ",
#                     " (SELECT DISTINCT xrcf008,xrcfseq,xrca001,xrch017,xrch018,xrch019,",
#                     "         xrcf106,xrcf107,", #DIFF 原幣價差金額 #xrcf107原币汇差(原币无汇差应该为0）
#                     "         xrcf113,xrcf114,xrcf115,",
#                     "         xrcf116,xrcf117, ",  #DIFF 本幣價差金額 DIFF 本幣匯差金額
#                     "         xrcf123,xrcf124,xrcf125,0 xrch015,0 xrch016 FROM xrch_t,s_axrp130_tmp ",
#                     "  WHERE xrchent = xrcfent AND xrchdocno = xrcfdocno AND xrch001 = xrcf008 ",
#                     "  )",
#                     "   GROUP BY xrcf008,xrcfseq,xrca001 "
         LET l_sql = " SELECT DISTINCT xrcf008,xrcfseq,xrca001,SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),",
                     "        SUM(xrcf106),SUM(xrcf107),", #DIFF 原幣價差金額 #xrcf107原币汇差(原币无汇差应该为0）
                     "        SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),",
                     "        SUM(xrcf116),SUM(xrcf117), ",  #DIFF 本幣價差金額 DIFF 本幣匯差金額
                     "        SUM(xrcf123),SUM(xrcf124),SUM(xrcf125) FROM s_axrp130_tmp ",
                     "   GROUP BY xrcf008,xrcfseq,xrca001 "                     
         PREPARE s_axrp130_ins_xrcf_p1 FROM l_sql
         DECLARE s_axrp130_ins_xrcf_c1 CURSOR FOR s_axrp130_ins_xrcf_p1         
         FOREACH s_axrp130_ins_xrcf_c1 INTO l_xrcf008,l_xrcf_tmp_s[l_i].xrcfseq,l_xrcf_tmp_s[l_i].xrca001,l_xrcf_tmp_s[l_i].xrcf103,l_xrcf_tmp_s[l_i].xrcf104,
                                            l_xrcf_tmp_s[l_i].xrcf105,l_xrcf_tmp_s[l_i].xrcf106,l_xrcf_tmp_s[l_i].xrcf107,l_xrcf_tmp_s[l_i].xrcf113,l_xrcf_tmp_s[l_i].xrcf114,
                                            l_xrcf_tmp_s[l_i].xrcf115,l_xrcf_tmp_s[l_i].xrcf116,l_xrcf_tmp_s[l_i].xrcf117,l_xrcf_tmp_s[l_i].xrcf123,l_xrcf_tmp_s[l_i].xrcf124,l_xrcf_tmp_s[l_i].xrcf125
                                            
           
            
               LET l_i= l_i + 1
            
         END FOREACH
         CALL l_xrcf_tmp_s.deleteElement(l_xrcf_tmp_s.getLength())
         IF l_type_diff = '2' THEN
            CALL s_axrp130_ins_xrcf_diff('1',p_xrcald,p_xrcadocno,l_xrcf_tmp_s)
         END IF       
         #170410-00053#1 add e---            
#180821-00038#2 mod e---#非杂项，xrcf由xrch写入,并产生汇差
   END IF
#180821-00038#2 mark s------#原杂项逻辑mark#   
#   IF p_type MATCHES '[02]' THEN
#      LET l_type = 2
#      #161212-00005#2---add---begin--------------------
#      #LET l_sql = "SELECT xrca_t.*,xrcc_t.* ",
#      LET l_sql = "SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,",
#                  "xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,",
#                  "xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,",
#                  "xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,",
#                  "xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,",
#                  "xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,",
#                  "xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,",
#                  "xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,",
#                  "xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,",
#                  "xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,",
#                  "xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,",
#                  "xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,",
#                  "xrcaud027,xrcaud028,xrcaud029,xrcaud030,xrccent,xrccld,xrcccomp,xrccdocno,xrccseq,xrcc001,xrcc002,",
#                  "xrcc003,xrcc004,xrcc005,xrcc006,xrcclegl,xrcc008,xrcc009,xrccsite,xrcc010,xrcc011,xrcc012,xrcc013,",
#                  "xrcc014,xrcc100,xrcc101,xrcc102,xrcc103,xrcc104,xrcc105,xrcc106,xrcc107,xrcc108,xrcc109,xrcc113,",
#                  "xrcc114,xrcc115,xrcc116,xrcc117,xrcc118,xrcc119,xrcc120,xrcc121,xrcc122,xrcc123,xrcc124,xrcc125,",
#                  "xrcc126,xrcc127,xrcc128,xrcc129,xrcc130,xrcc131,xrcc132,xrcc133,xrcc134,xrcc135,xrcc136,xrcc137,",
#                  "xrcc138,xrcc139,xrccud001,xrccud002,xrccud003,xrccud004,xrccud005,xrccud006,xrccud007,xrccud008,",
#                  "xrccud009,xrccud010,xrccud011,xrccud012,xrccud013,xrccud014,xrccud015,xrccud016,xrccud017,xrccud018,",
#                  "xrccud019,xrccud020,xrccud021,xrccud022,xrccud023,xrccud024,xrccud025,xrccud026,xrccud027,xrccud028,",
#                  "xrccud029,xrccud030,xrcc015,xrcc016,xrcc017 ",
#      #161212-00005#2---add---end--------------------
#                "    FROM xrca_t,xrcc_t",
#                "   WHERE xrcaent = xrccent AND xrcald = xrccld ",
#                "     AND xrcadocno = xrccdocno AND xrcc108 - xrcc109 <> 0 ",
#                "     AND xrcastus = 'Y' AND xrca001 IN ('03','04')  ",
#                "     AND xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
#                "     AND xrca004 ='",l_xrca004,"'   AND xrca005= '",l_xrca005,"'",
#                "     AND xrca100 = '",l_xrca100,"'",    #雜項沖暫估不區分幣別   #160912-00011#4 Unmark
#                "     AND xrcadocdt <='",l_xrcadocdt,"' " 
#                #"   ORDER BY xrcadocdt,xrcadocno "  #180507-00028#1 mark
#                
#       #180221-00030#2 mark-s
#       #180507-00028#1 add-s
##       IF g_prog MATCHES 'axrt300*' OR g_prog MATCHES 'axrt340*' THEN
##          SELECT COUNT(1) INTO l_cnt FROM xrcb_t 
##           WHERE xrcbent=g_enterprise AND xrcbld=p_xrcald AND  xrcbdocno =p_xrcadocno AND xrcb023 = 'Y' AND xrcb001 IN ('19','29')
##          IF l_cnt >0 THEN          
##             LET l_sql1 ="SELECT DISTINCT xrcb002 FROM xrcb_t ", 
##                         " WHERE xrcbent=? AND xrcbld=? AND xrcbdocno =? AND xrcb023 = 'Y' AND xrcb001 IN ('19','29') "
##             PREPARE s_axrp130_sel_xrcb FROM l_sql1
##             DECLARE s_axrp130_cur_xrcb CURSOR FOR s_axrp130_sel_xrcb
##             LET l_xrcb002_s=''
##             FOREACH s_axrp130_cur_xrcb USING g_enterprise,p_xrcald,p_xrcadocno INTO l_xrcb002_1
##               IF cl_null(l_xrcb002_s) THEN
##                  LET l_xrcb002_s="'",l_xrcb002_1,"'"
##               ELSE
##                  LET l_xrcb002_s="'",l_xrcb002_1,"','",l_xrcb002_s,"'"
##               END IF 
##             END FOREACH
##             LET l_sql = l_sql," AND xrcadocno IN (",l_xrcb002_s,")",
##                         "   ORDER BY xrcadocdt,xrcadocno "
##          END IF
##       END IF      
###       IF NOT cl_null(p_xrcb002) THEN
###         LET l_sql=l_sql,"  AND xrcadocno= '",p_xrcb002,"' "  
###       END IF
###       LET  l_sql=l_sql,"   ORDER BY xrcadocdt,xrcadocno "      
##       #180507-00028#1 add-e 
#       #180221-00030#2 mark-e
#       #180221-00030#2 add-s
#       IF l_sfin1002='3' THEN
#         LET l_sql=l_sql," AND xrcadocno IN (SELECT DISTINCT xrcb002 FROM xrcb_t ",
#                         "                    WHERE xrcbent=xrcaent AND xrcbld=xrcald ",
#                         "                      AND xrcbdocno='",p_xrcadocno,"'",
#                         "                      AND xrcb003=xrccseq AND xrcb023='Y')"
#       ELSE
#         LET l_sql=l_sql," AND xrcadocno IN (SELECT DISTINCT xrcb002 FROM xrcb_t ",
#                         "                    WHERE xrcbent=xrcaent AND xrcbld=xrcald ",
#                         "                      AND xrcbdocno='",p_xrcadocno,"'",
#                         "                      AND xrcb023='Y')"
#       END IF
#       LET l_sql=l_sql,"   ORDER BY xrcadocdt,xrcadocno,xrccseq "       
#       #180221-00030#2 add-e
#       
#       
#       PREPARE s_aapp130_ins_xrcf_p2 FROM l_sql
#       DECLARE s_aapp130_ins_xrcf_c2 CURSOR FOR s_aapp130_ins_xrcf_p2
#       FOREACH s_aapp130_ins_xrcf_c2 INTO l_xrca.*,l_xrcc.*    #取得t320的暫估資料
#          #CALL s_axrp130_get_xrcf(p_xrcald,p_xrcadocno,l_type,l_xrca.*,l_xrcc.*) RETURNING l_flag,l_xrcf.*,l_xrcf_tmp #170410-00053#1 mark
#          CALL s_axrp130_get_xrcf(p_xrcald,p_xrcadocno,l_type,l_xrca.*,l_xrcc.*,'','','',l_xrcb1.*) RETURNING l_flag,l_xrcf.*,l_xrcf_tmp  #170410-00053#1 add
#          CASE l_flag
#               WHEN '1'  CONTINUE FOREACH  #目前的t320已沖完
#               WHEN '2'  EXIT FOREACH      #t300立帳單已沖完
#               OTHERWISE 
#                         #161212-00005#2---add---begin--------------------
#                         #INSERT INTO xrcf_t VALUES(l_xrcf.*)
#                         INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
#                                             xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
#                                             xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
#                                             xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
#                                             xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
#                                             xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
#                                             xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
#                                             xrcf135,xrcf136,xrcf137)
#                          VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
#                                 l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
#                                 l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
#                                 l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
#                                 l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
#                                 l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
#                                 l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
#                                 l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
#                         #161212-00005#2---add---end--------------------
#          END CASE
#       END FOREACH
#       #雜項一定要整張單沖暫估，不然會抓不準
#       #CALL s_axrp130_ins_xrcf_diff('2',p_xrcald,p_xrcadocno,'')       #181218-00045#1 mark
#       CALL s_axrp130_ins_xrcf_diff('2',p_xrcald,p_xrcadocno,NULL)      #181218-00045#1 mod
#   END IF   
#   #160912-00011#4 Add  ---(S)---
#180821-00038#2 mark s------#原杂项逻辑mark#

   SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise
      AND glaald = p_xrcald
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   SELECT MIN (xrcadocdt) INTO l_xrcadocdt FROM xrca_t WHERE xrcaent = g_enterprise
      AND xrcald = p_xrcald
      AND xrcadocno = p_xrcadocno
   SELECT MIN (xrcadocdt) INTO t_xrcadocdt FROM xrca_t WHERE xrcaent = g_enterprise
      AND xrcald = p_xrcald
      AND xrcadocno IN (SELECT xrcf008 FROM xrcf_t WHERE xrcfent = g_enterprise
                           AND xrcfld = p_xrcald
                           AND xrcfdocno = p_xrcadocno
                        )
   IF NOT cl_null(t_xrcadocdt) THEN
      IF YEAR(t_xrcadocdt) * 12 + MONTH(t_xrcadocdt) >= YEAR(l_xrcadocdt) * 12 + MONTH(l_xrcadocdt) THEN
         LET l_sfin2011 = 'N'
      END IF
   END IF
   IF l_sfin2011 = 'Y' THEN
      UPDATE xrcf_t SET xrcf021 = '',xrcf022 = '',xrcf023 = ''
       WHERE xrcfent = g_enterprise
         AND xrcfld  = p_xrcald
         AND xrcfdocno = p_xrcadocno
         AND xrcf002 NOT IN( 'D1','D2') #170821-00012#1 xul add 排除价差 汇差
   END IF
   #160912-00011#4 Add  ---(E)---
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 應收沖暫估明細檔新增资料
# Memo...........:
# Usage..........: CALL s_axrp130_get_xrcf(p_ld,p_xrcadocno,p_type,p_xrca,p_xrcc,p_xrcb002,p_xrcb003,p_xrcb007,p_xrcb1)

# Input parameter: p_ld             账套
#                : p_xrcadocno      立账单据
#                : p_type           1：非杂项/2：杂项
#                : p_xrca           应收凭单
#                : p_xrcc           多账期明细
#                : p_xrcb002        来源业务单据号码
#                : p_xrcb003        来源业务单据项次
#                : p_xrcb007        计价数量
#                : p_xrcb1          应收凭单单身
# Return code....: 无
#                : 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#48  By 09505
################################################################################
PUBLIC FUNCTION s_axrp130_get_xrcf(p_ld,p_xrcadocno,p_type,p_xrca,p_xrcc,p_xrcb002,p_xrcb003,p_xrcb007,p_xrcb1)
DEFINE p_ld          LIKE xrca_t.xrcald
DEFINE p_xrcadocno   LIKE xrca_t.xrcadocno   #立帳單據

DEFINE p_type        LIKE type_t.chr1        #1:非雜項/2:雜項
#161212-00005#2---add---begin--------------------
#DEFINE p_xrca        RECORD LIKE xrca_t.*    #t320暫估單據
#DEFINE p_xrcc        RECORD LIKE xrcc_t.*    #t320暫估單據
#DEFINE r_xrcf        RECORD LIKE xrcf_t.*    #回傳的xrcf暫估資料
DEFINE p_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
DEFINE p_xrcc RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrccud001 LIKE xrcc_t.xrccud001, #自定義欄位(文字)001
       xrccud002 LIKE xrcc_t.xrccud002, #自定義欄位(文字)002
       xrccud003 LIKE xrcc_t.xrccud003, #自定義欄位(文字)003
       xrccud004 LIKE xrcc_t.xrccud004, #自定義欄位(文字)004
       xrccud005 LIKE xrcc_t.xrccud005, #自定義欄位(文字)005
       xrccud006 LIKE xrcc_t.xrccud006, #自定義欄位(文字)006
       xrccud007 LIKE xrcc_t.xrccud007, #自定義欄位(文字)007
       xrccud008 LIKE xrcc_t.xrccud008, #自定義欄位(文字)008
       xrccud009 LIKE xrcc_t.xrccud009, #自定義欄位(文字)009
       xrccud010 LIKE xrcc_t.xrccud010, #自定義欄位(文字)010
       xrccud011 LIKE xrcc_t.xrccud011, #自定義欄位(數字)011
       xrccud012 LIKE xrcc_t.xrccud012, #自定義欄位(數字)012
       xrccud013 LIKE xrcc_t.xrccud013, #自定義欄位(數字)013
       xrccud014 LIKE xrcc_t.xrccud014, #自定義欄位(數字)014
       xrccud015 LIKE xrcc_t.xrccud015, #自定義欄位(數字)015
       xrccud016 LIKE xrcc_t.xrccud016, #自定義欄位(數字)016
       xrccud017 LIKE xrcc_t.xrccud017, #自定義欄位(數字)017
       xrccud018 LIKE xrcc_t.xrccud018, #自定義欄位(數字)018
       xrccud019 LIKE xrcc_t.xrccud019, #自定義欄位(數字)019
       xrccud020 LIKE xrcc_t.xrccud020, #自定義欄位(數字)020
       xrccud021 LIKE xrcc_t.xrccud021, #自定義欄位(日期時間)021
       xrccud022 LIKE xrcc_t.xrccud022, #自定義欄位(日期時間)022
       xrccud023 LIKE xrcc_t.xrccud023, #自定義欄位(日期時間)023
       xrccud024 LIKE xrcc_t.xrccud024, #自定義欄位(日期時間)024
       xrccud025 LIKE xrcc_t.xrccud025, #自定義欄位(日期時間)025
       xrccud026 LIKE xrcc_t.xrccud026, #自定義欄位(日期時間)026
       xrccud027 LIKE xrcc_t.xrccud027, #自定義欄位(日期時間)027
       xrccud028 LIKE xrcc_t.xrccud028, #自定義欄位(日期時間)028
       xrccud029 LIKE xrcc_t.xrccud029, #自定義欄位(日期時間)029
       xrccud030 LIKE xrcc_t.xrccud030, #自定義欄位(日期時間)030
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
DEFINE r_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD
#161212-00005#2---add---end--------------------
DEFINE r_flag        LIKE type_t.chr1        #

DEFINE l_sfin2011    LIKE type_t.chr1        #迴轉否
DEFINE l_sfin2012    LIKE type_t.chr1        #含稅立帳否
DEFINE l_glaacomp    LIKE glaa_t.glaacomp    #所屬法人
DEFINE l_glaa001     LIKE glaa_t.glaa001
DEFINE l_glaa004     LIKE glaa_t.glaa004     #會計科目參照表
DEFINE l_glaa015     LIKE glaa_t.glaa015     #本位幣二啟用
DEFINE l_glaa016     LIKE glaa_t.glaa016     #本位幣二
DEFINE l_glaa017     LIKE glaa_t.glaa017     #本位幣二換算基準
DEFINE l_glaa019     LIKE glaa_t.glaa019     #本位幣三啟用
DEFINE l_glaa020     LIKE glaa_t.glaa020     #本位幣三
DEFINE l_glaa021     LIKE glaa_t.glaa021     #本位幣三換算基準
DEFINE l_glaa025     LIKE glaa_t.glaa025     #本位幣一換算基準
DEFINE l_glac007     LIKE glac_t.glac007     #科目性質

DEFINE l_xrca007     LIKE xrca_t.xrca007
DEFINE l_xrca035     LIKE xrca_t.xrca035
DEFINE l_xrca036     LIKE xrca_t.xrca036
DEFINE l_xrca100     LIKE xrca_t.xrca100     #交易幣幣別
DEFINE l_xrca101     LIKE xrca_t.xrca101     #本幣匯率
DEFINE l_xrca121     LIKE xrca_t.xrca121
DEFINE l_xrca131     LIKE xrca_t.xrca131
DEFINE l_xrcb101     LIKE xrcb_t.xrcb101     #t320暫估單價
DEFINE l_xrcc108     LIKE xrcc_t.xrcc108     #計算用
DEFINE l_xrcf103     LIKE xrcf_t.xrcf103     #計算用
DEFINE l_xrcf105     LIKE xrcf_t.xrcf105     #計算用
DEFINE l_xrcb103     LIKE xrcb_t.xrcb105     #計算用
DEFINE l_xrcb105     LIKE xrcb_t.xrcb105     #計算用
DEFINE l_xrcf007     LIKE xrcf_t.xrcf007     #320可沖帳數量
DEFINE l_xrcf0071    LIKE xrcf_t.xrcf007     #320已沖帳數量
DEFINE l_xrcf1       RECORD                  #t320已沖帳
         xrcf103     LIKE xrcf_t.xrcf103,    #原幣未稅金額
         xrcf104     LIKE xrcf_t.xrcf104,    #原幣稅額
         xrcf105     LIKE xrcf_t.xrcf105,    #原幣含稅金額
         xrcf113     LIKE xrcf_t.xrcf113,    #本幣未稅金額
         xrcf114     LIKE xrcf_t.xrcf114,    #本幣稅額
         xrcf115     LIKE xrcf_t.xrcf115,    #本幣含稅金額
         xrcf123     LIKE xrcf_t.xrcf123,    #本幣二未稅金額
         xrcf124     LIKE xrcf_t.xrcf124,    #本幣二稅額
         xrcf125     LIKE xrcf_t.xrcf125,    #本幣二含稅金額
         xrcf133     LIKE xrcf_t.xrcf133,    #本幣三未稅金額
         xrcf134     LIKE xrcf_t.xrcf134,    #本幣三稅額
         xrcf135     LIKE xrcf_t.xrcf135     #本幣三含稅金額
                 END RECORD
DEFINE l_xrcf2       RECORD                  #t320立帳數量
         xrcf103     LIKE xrcf_t.xrcf103,
         xrcf104     LIKE xrcf_t.xrcf104,
         xrcf105     LIKE xrcf_t.xrcf105,
         xrcf113     LIKE xrcf_t.xrcf113,
         xrcf114     LIKE xrcf_t.xrcf114,
         xrcf115     LIKE xrcf_t.xrcf115,
         xrcf123     LIKE xrcf_t.xrcf123,
         xrcf124     LIKE xrcf_t.xrcf124,
         xrcf125     LIKE xrcf_t.xrcf125,
         xrcf133     LIKE xrcf_t.xrcf133,
         xrcf134     LIKE xrcf_t.xrcf134,
         xrcf135     LIKE xrcf_t.xrcf135
                 END RECORD
DEFINE l_xrcb002     LIKE xrcb_t.xrcb002     #t300此次要沖帳-入庫單號
DEFINE l_xrcb003     LIKE xrcb_t.xrcb003     #t300此次要沖帳-入庫單項次
DEFINE l_xrcb007     LIKE xrcb_t.xrcb007     #t300此次要沖帳-入庫單數量
DEFINE l_xrcb0071    LIKE xrcb_t.xrcb007     #
DEFINE l_xrcb1       RECORD                  #t300此次要沖帳
         xrcb101     LIKE xrcb_t.xrcb101,
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115,
         xrcb123     LIKE xrcb_t.xrcb123,
         xrcb124     LIKE xrcb_t.xrcb124,
         xrcb125     LIKE xrcb_t.xrcb125,
         xrcb133     LIKE xrcb_t.xrcb133,
         xrcb134     LIKE xrcb_t.xrcb134,
         xrcb135     LIKE xrcb_t.xrcb135,
         xrcborga    LIKE xrcb_t.xrcborga,         #來源組織
         xrcb010     LIKE xrcb_t.xrcb010,          #業務部門
         xrcb011     LIKE xrcb_t.xrcb011,          #責任中心
         xrcb024     LIKE xrcb_t.xrcb024,          #區域
         xrcb036     LIKE xrcb_t.xrcb036,          #客群
         #xrcb004     LIKE xrcb_t.xrcb004,          #產品類別     #180807-00063#1 mark
         xrcb012     LIKE xrcb_t.xrcb012,          #產品類別      #180807-00063#1 add
         xrcb051     LIKE xrcb_t.xrcb051,          #業務人員
         xrcb015     LIKE xrcb_t.xrcb015,          #專案編號
         xrcb016     LIKE xrcb_t.xrcb016,          #WBS
         xrcb033     LIKE xrcb_t.xrcb033,          #經營方式
         xrcb034     LIKE xrcb_t.xrcb034,          #渠道
         xrcb035     LIKE xrcb_t.xrcb035,          #品牌
         xrcb037     LIKE xrcb_t.xrcb037,          #自由核算項1
         xrcb038     LIKE xrcb_t.xrcb038,          #自由核算項2
         xrcb039     LIKE xrcb_t.xrcb039,          #自由核算項3
         xrcb040     LIKE xrcb_t.xrcb040,          #自由核算項4
         xrcb041     LIKE xrcb_t.xrcb041,          #自由核算項5
         xrcb042     LIKE xrcb_t.xrcb042,          #自由核算項6
         xrcb043     LIKE xrcb_t.xrcb043,          #自由核算項7
         xrcb044     LIKE xrcb_t.xrcb044,          #自由核算項8
         xrcb045     LIKE xrcb_t.xrcb045,          #自由核算項9
         xrcb046     LIKE xrcb_t.xrcb046,          #自由核算項10
         xrcb047     LIKE xrcb_t.xrcb047,          #摘要
         xrcb021     LIKE xrcb_t.xrcb021           #費用會計科目
                 END RECORD
DEFINE l_xrcf_tmp    DYNAMIC ARRAY OF type_xrcf_tmp
DEFINE l_i,l_cnt     LIKE type_t.num5
DEFINE l_rate        LIKE xrcf_t.xrcf102
DEFINE l_sql         STRING
DEFINE l_xrcadocdt1  LIKE xrca_t.xrcadocdt   #立帳單據-立帳日期
DEFINE l_xrcadocdt2  LIKE xrca_t.xrcadocdt   #暫估單據-立帳日期
DEFINE l_xrca011     LIKE xrca_t.xrca011     #160506-00008#1
DEFINE l_sfin1002    LIKE type_t.chr1        #160823-00027#1 Add
#160823-00027#1 Add  ---(S)---
DEFINE l_xrcb3       RECORD
         xrcb007     LIKE xrcb_t.xrcb007,
         xrcb101     LIKE xrcb_t.xrcb101,    #160912-00011#4 Add
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb115     LIKE xrcb_t.xrcb115
                     END RECORD
#160823-00027#1 Add  ---(E)---
#160912-00011#4 Add  ---(S)---
DEFINE l_oodbl004    LIKE oodbl_t.oodbl004
DEFINE l_oodb005     LIKE oodb_t.oodb005
DEFINE l_oodb006     LIKE oodb_t.oodb006
DEFINE l_oodb011     LIKE oodb_t.oodb011
DEFINE l_xrcb4       RECORD
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115
                     END RECORD
#160912-00011#4 Add  ---(E)---
#170225-00002#1--add--str--
DEFINE l_xrcf106_s   LIKE xrcf_t.xrcf106
DEFINE l_xrcf116_s   LIKE xrcf_t.xrcf116
DEFINE l_xrcf107_s   LIKE xrcf_t.xrcf106
DEFINE l_xrcf117_s   LIKE xrcf_t.xrcf116
DEFINE l_xrcc118     LIKE xrcc_t.xrcc118
#170225-00002#1--add--end
DEFINE l_amt         LIKE xrcc_t.xrcc108 #170325-00053#1 add
#170410-00053#1 add s---
DEFINE p_xrcb002     LIKE xrcb_t.xrcb002
DEFINE p_xrcb003     LIKE xrcb_t.xrcb003
DEFINE p_xrcb007     LIKE xrcb_t.xrcb007
DEFINE p_xrcb1       RECORD                  #t300此次要沖帳
         xrcb101     LIKE xrcb_t.xrcb101,
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115,
         xrcb123     LIKE xrcb_t.xrcb123,
         xrcb124     LIKE xrcb_t.xrcb124,
         xrcb125     LIKE xrcb_t.xrcb125,
         xrcb133     LIKE xrcb_t.xrcb133,
         xrcb134     LIKE xrcb_t.xrcb134,
         xrcb135     LIKE xrcb_t.xrcb135,
         xrcborga    LIKE xrcb_t.xrcborga,         #來源組織
         xrcb010     LIKE xrcb_t.xrcb010,          #業務部門
         xrcb011     LIKE xrcb_t.xrcb011,          #責任中心
         xrcb024     LIKE xrcb_t.xrcb024,          #區域
         xrcb036     LIKE xrcb_t.xrcb036,          #客群
         #xrcb004     LIKE xrcb_t.xrcb004,          #產品類別     #180807-00063#1 mark
         xrcb012     LIKE xrcb_t.xrcb012,          #產品類別      #180807-00063#1 add
         xrcb051     LIKE xrcb_t.xrcb051,          #業務人員
         xrcb015     LIKE xrcb_t.xrcb015,          #專案編號
         xrcb016     LIKE xrcb_t.xrcb016,          #WBS
         xrcb033     LIKE xrcb_t.xrcb033,          #經營方式
         xrcb034     LIKE xrcb_t.xrcb034,          #渠道
         xrcb035     LIKE xrcb_t.xrcb035,          #品牌
         xrcb037     LIKE xrcb_t.xrcb037,          #自由核算項1
         xrcb038     LIKE xrcb_t.xrcb038,          #自由核算項2
         xrcb039     LIKE xrcb_t.xrcb039,          #自由核算項3
         xrcb040     LIKE xrcb_t.xrcb040,          #自由核算項4
         xrcb041     LIKE xrcb_t.xrcb041,          #自由核算項5
         xrcb042     LIKE xrcb_t.xrcb042,          #自由核算項6
         xrcb043     LIKE xrcb_t.xrcb043,          #自由核算項7
         xrcb044     LIKE xrcb_t.xrcb044,          #自由核算項8
         xrcb045     LIKE xrcb_t.xrcb045,          #自由核算項9
         xrcb046     LIKE xrcb_t.xrcb046,          #自由核算項10
         xrcb047     LIKE xrcb_t.xrcb047,          #摘要
         xrcb021     LIKE xrcb_t.xrcb021           #費用會計科目
                 END RECORD
DEFINE l_xrcadocdt   LIKE xrca_t.xrcadocdt                 
#170410-00053#1 add e---
#180221-00030#2 add-s
DEFINE l_xrcb103_do    LIKE xrcb_t.xrcb103
DEFINE l_xrcb105_do    LIKE xrcb_t.xrcb105
DEFINE g_sum           LIKE type_t.num20_6  #t300整張單原幣總合
DEFINE g_sum1          LIKE type_t.num20_6  #t300整張單本幣總合
DEFINE l_sum1          LIKE type_t.num20_6  #t320整張單本幣總和
DEFINE l_diff          LIKE type_t.num20_6  #原幣相同時的t300-t320本幣差異
DEFINE l_xrcc101       LIKE xrcc_t.xrcc101
DEFINE l_xrcc102       LIKE xrcc_t.xrcc102
DEFINE l_oodb004       LIKE oodb_t.oodb004
DEFINE l_xrcacomp      LIKE xrca_t.xrcacomp
#180221-00030#2 add-e
#180906-00063#1----add----str
DEFINE l_xrcb1s        LIKE xrcb_t.xrcb113  
DEFINE l_xrcb3s        LIKE xrcb_t.xrcb113
#180906-00063#1----add----end



   #l_xrca/l_xrcb(現在立帳的立帳單--axrt300)
   #p_xrca/p_xrcb(抓出來沖的暫估單--aapt320)

   WHENEVER ERROR CONTINUE

   #170410-00053#1 add s---
   LET l_xrcb1.* = p_xrcb1.*  
   LET l_xrcb002 = p_xrcb002 
   LET l_xrcb003 = p_xrcb003 
   LET l_xrcb007 = p_xrcb007
   #170410-00053#1 add e---

   #170225-00002#1--mod--str--
#   CALL s_ld_sel_glaa(p_ld,'glaacomp|glaa001|glaa004|glaa015|glaa016|glaa017|glaa019|glaa020|glaa021|glaa025')
#        RETURNING g_sub_success,l_glaacomp,l_glaa001,l_glaa004,
#                  l_glaa015,l_glaa016,l_glaa017,l_glaa019,l_glaa020,
#                  l_glaa021,l_glaa025
   SELECT glaacomp,glaa001,glaa004,glaa015,glaa016,
          glaa017,glaa019,glaa020,glaa021,glaa025
     INTO l_glaacomp,l_glaa001,l_glaa004,l_glaa015,l_glaa016,
          l_glaa017,l_glaa019,l_glaa020,l_glaa021,l_glaa025
     FROM glaa_t
    #WHERE glaaent=g_enterprise AND glaald=l_ld  #170321-00125#1 mark
    WHERE glaaent=g_enterprise AND glaald=p_ld   #170321-00125#1 add
   #170225-00002#1--mod--end
   
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-1002') RETURNING l_sfin1002   #160823-00027#1 Add  

   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2012') RETURNING l_sfin2012
  #IF l_sfin2011 = 'N' THEN LET l_sfin2012 = '1' END IF    #160823-00027#1 Mark

   SELECT xrca007,xrca035,xrca036,xrca101,xrca100,
          xrca121,xrca131,xrcadocdt  ##170410-00053#1 add xrcadocdt
     INTO l_xrca007,l_xrca035,l_xrca036,l_xrca101,l_xrca100,
          l_xrca121,l_xrca131,l_xrcadocdt ##170410-00053#1 add xrcadocdt
     FROM xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcald = p_ld AND xrcadocno= p_xrcadocno

   INITIALIZE r_xrcf.* TO NULL
   CALL l_xrcf_tmp.clear()
   #檢查t320是否被沖完暫估---(S)---
   LET l_xrcf105 = NULL    #有效的xrcf單據金額
   LET l_xrcc108 = NULL    #可沖的xrcc108的金額
   
   IF p_type <> '1' THEN #170410-00053#1 add #杂项检查
   SELECT SUM(xrcf105) INTO l_xrcf105
     FROM xrca_t,xrcf_t
    WHERE xrcaent = xrcfent AND xrcadocno = xrcfdocno
      AND xrcastus NOT IN ('X','Y')
      AND xrcaent = g_enterprise
      AND xrcald  = p_ld AND xrcf008 = p_xrca.xrcadocno
    # AND xrcf009 = p_xrcc.xrccseq   #160823-00027#1 Mark
	 # AND xrcf010 = p_xrcc.xrcc001

#   SELECT SUM(xrcc108-xrcc109) INTO l_xrcc108 #170225-00002#1 mark
    SELECT SUM(xrcc108-xrcc109),SUM(xrcc118-xrcc119) INTO l_xrcc108,l_xrcc118 #170225-00002#1 add
     FROM xrcc_t
    WHERE xrccent = g_enterprise
      AND xrccld  = p_ld AND xrccdocno = p_xrca.xrcadocno
    # AND xrccseq = p_xrcc.xrccseq   #160823-00027#1 Mark
	 # AND xrcc001 = p_xrcc.xrcc001

   IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
   IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
   IF l_xrcc108 - l_xrcf105 = 0 THEN   #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
      LET r_flag = 1                   #CONTINUE FOREACH
      RETURN r_flag,r_xrcf.*,l_xrcf_tmp
   END IF
   END IF  #170410-00053#1 add 
   #檢查t320是否被沖完暫估---(E)---

   #160823-00027#1 Add  ---(S)---
   #170225-00002#1--mod--str--
#   SELECT SUM(xrcc108-xrcc109),SUM(xrcc118-xrcc119) INTO p_xrcc.xrcc108,p_xrcc.xrcc118
#     FROM xrcc_t
#    WHERE xrccent = g_enterprise
#      AND xrccld  = p_ld AND xrccdocno = p_xrca.xrcadocno
   LET p_xrcc.xrcc108 = l_xrcc108
   LET p_xrcc.xrcc118 = l_xrcc118
   #170225-00002#1--mod--end
   #LET p_xrcc.xrccseq = 1     #180221-00030#2 mark
   #160823-00027#1 Add  ---(E)---

   #檢查t300是否沖完暫估---(S)---(若立帳單沖完以後 就表示不用沖暫估了)
   LET l_xrcb103 = NULL
   LET l_xrcb105 = NULL
   LET l_xrcf103 = NULL
   LET l_xrcf105 = NULL
   IF p_type = '1' THEN
      #非雜項看t320的 xrcb立了幾個沖暫估
      LET l_cnt = 0
      
      #170225-00002#1--add--str--
      #計算已沖 暫估數量(不含本張單沖銷的數量)
      LET l_sql="SELECT SUM(xrcb007) ",
                "  FROM xrca_t,xrcb_t",
                " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno",
                "   AND xrcastus NOT IN ('X','Y')",
                "   AND xrcaent = ",g_enterprise,
                "   AND xrcb023 = 'Y'",
                "   AND xrcald  = '",p_ld,"' AND xrcbdocno <> '",p_xrcadocno,"'",
                "   AND xrcb002 = ? AND xrcb003 = ?"
      PREPARE s_axrp130_sum_xrcb007_pr FROM l_sql          
      #170225-00002#1--add--end
      
      #取t320的資料
      LET l_sql = "SELECT xrcb002,xrcb003,xrcb007 ",
                "    FROM xrca_t,xrcb_t",
                "   WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno ",
                "     AND xrca001 IN ('01','02') ",
                "     AND xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
                "     AND xrcbdocno = ?",#p_xrca.xrcadocno,"' ",
                "     AND xrcb001 IN ('11','21') ",
                "     AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL ",
                "     AND xrcb002 = ? AND xrcb003 = ? " ##170410-00053#1
      PREPARE s_axrp130_get_xrcf_p FROM l_sql
      DECLARE s_axrp130_get_xrcf_c CURSOR FOR s_axrp130_get_xrcf_p
#170410-00053#1 mark s---      
#      FOREACH s_axrp130_get_xrcf_c INTO l_xrcb002,l_xrcb003,l_xrcb007
#         #計算已沖 暫估數量(不含本張單沖銷的數量)
#         #170225-00002#1--mod--str--
##         SELECT SUM(xrcb007) INTO l_xrcb0071
##           FROM xrca_t,xrcb_t
##          WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno
##            AND xrcastus NOT IN ('X','Y')
##            AND xrcaent = g_enterprise
##            AND xrcald  = p_ld AND xrcbdocno <> p_xrcadocno
##            AND xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003
##            AND xrcb023 = 'Y'
#         EXECUTE s_axrp130_sum_xrcb007_pr USING l_xrcb002,l_xrcb003 INTO l_xrcb0071
#         #170225-00002#1--mod--end
#         IF cl_null(l_xrcb007)  THEN LET l_xrcb007 = 0 END IF
#         IF cl_null(l_xrcb0071) THEN LET l_xrcb0071= 0 END IF
#         IF l_xrcb007 - l_xrcb0071 <> 0 THEN
#            LET l_cnt = 1
#            EXIT FOREACH
#         END IF
#      END FOREACH
#      IF l_cnt = 0 THEN          #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
#         LET r_flag = 1          #CONTINUE FOREACH
#         RETURN r_flag,r_xrcf.*,l_xrcf_tmp
#      END IF
#170410-00053#1 mark e---
   ELSE
      #180221-00030#2 mark-s
#      #t300無可符合的條件的可沖暫估
#      LET l_xrcb105 = 0
#      IF p_xrca.xrca001 = '03' THEN
#         SELECT SUM(xrcb103),SUM(xrcb105) INTO l_xrcb103,l_xrcb105
#            FROM xrcb_t
#           WHERE xrcbent = g_enterprise
#             AND xrcbld = p_ld AND xrcbdocno = p_xrcadocno
#             AND xrcb001 IN ('19','16')
#             AND xrcb023 = 'Y'
#          SELECT SUM(xrcf103),SUM(xrcf105) INTO l_xrcf103,l_xrcf105
#            FROM xrca_t,xrcf_t
#           WHERE xrcaent = xrcfent AND xrcald = xrcfld
#           AND xrcadocno = xrcf008
#             AND xrca001 = '03'
#             AND xrcfent = g_enterprise
#             AND xrcfld  = p_ld AND xrcfdocno = p_xrcadocno
#      ELSE
#         SELECT SUM(xrcb103),SUM(xrcb105) INTO l_xrcb103,l_xrcb105
#            FROM xrcb_t
#           WHERE xrcbent = g_enterprise
#             AND xrcbld = p_ld AND xrcbdocno = p_xrcadocno
#             AND xrcb001 IN ('29','26')
#             AND xrcb023 = 'Y'
#          SELECT SUM(xrcf103),SUM(xrcf105) INTO l_xrcf103,l_xrcf105
#            FROM xrca_t,xrcf_t
#           WHERE xrcaent = xrcfent AND xrcald = xrcfld
#           AND xrcadocno = xrcf008
#             AND xrca001 ='04'
#             AND xrcfent = g_enterprise
#             AND xrcfld  = p_ld AND xrcfdocno = p_xrcadocno
#      END IF
#      IF cl_null(l_xrcb103) THEN LET l_xrcb103 = 0 END IF
#      IF cl_null(l_xrcb105) THEN LET l_xrcb105 = 0 END IF
#      IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF
#      IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
#      IF l_xrcb105 = 0 THEN
#         LET r_flag = 1                      #CONT FOREACH
#         RETURN r_flag,r_xrcf.*,l_xrcf_tmp
#      END IF
#
#      IF l_sfin2012 = '1' THEN      #立帳未稅
#         IF l_xrcb103 - l_xrcf103 = 0 THEN
#            LET r_flag = 1                   #CONT FOREACH
#            RETURN r_flag,r_xrcf.*,l_xrcf_tmp
#         END IF
#      ELSE
#         IF l_xrcb105 - l_xrcf105 = 0 THEN
#            LET r_flag = 1                   #CONT FOREACH
#            RETURN r_flag,r_xrcf.*,l_xrcf_tmp
#         END IF
#      END IF
   #180221-00030#2 mark-e
   
      #180221-00030#2 add-s
      #取t320的資料        
      LET l_sql = "SELECT SUM(xrcb103),SUM(xrcb105) ",
                "    FROM xrca_t,xrcb_t",
                "   WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
                "     AND xrca001 = '",p_xrca.xrca001,"' ",
                "     AND xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
                "     AND xrcbdocno = ? AND xrcbseq = ? ",
                "     AND xrcb001 IN ('19','29') "
      PREPARE s_axrp130_get_xrcf105 FROM l_sql      
            
      #計算已沖金額(不含本張單沖銷的金額) 
      LET l_sql = " SELECT SUM(xrcb103),SUM(xrcb105) ",
                  "   FROM xrca_t,xrcb_t ",
                  "  WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno  ",
                  "    AND xrcaent = ",g_enterprise," ",
                  "    AND xrcald  = '",p_ld,"' AND xrcbdocno <> '",p_xrcadocno,"' ",
                  "    AND xrcb002 = ? AND xrcb003 = ? ",
                  "    AND xrcastus <> 'X' AND xrcb023 = 'Y'  "
      PREPARE s_axrp130_xrcb105p FROM l_sql               
   
      #計算雜項是否有可暫估金額
      LET l_cnt = 0        
      LET l_sql = "SELECT xrcb002,xrcb003 ",
                "    FROM xrca_t,xrcb_t",
                "   WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
                "     AND xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
                "     AND xrcbdocno = '",p_xrcadocno,"' ",
                "     AND xrcb002 = '",p_xrca.xrcadocno,"' ",
                "     AND xrcb001 IN ('19','29') AND xrcb023 = 'Y' ",
                "     AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL "
      PREPARE s_axrp130_get_xrcf_p1 FROM l_sql
      DECLARE s_axrp130_get_xrcf_c1 CURSOR FOR s_axrp130_get_xrcf_p1
      FOREACH s_axrp130_get_xrcf_c1 INTO l_xrcb002,l_xrcb003
         #取t320的資料
         LET l_xrcf103 = 0          
         LET l_xrcf105 = 0       
         EXECUTE s_axrp130_get_xrcf105 USING l_xrcb002,l_xrcb003 INTO l_xrcf103,l_xrcf105
         IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF         
         IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF       
      
         #計算已沖金額(不含本張單沖銷的金額) 
         LET l_xrcb103 = 0   
         LET l_xrcb105 = 0           
         EXECUTE s_axrp130_xrcb105p USING l_xrcb002,l_xrcb003 INTO l_xrcb103,l_xrcb105
         IF cl_null(l_xrcb103) THEN LET l_xrcb103 = 0 END IF         
         IF cl_null(l_xrcb105) THEN LET l_xrcb105 = 0 END IF
         
         IF l_sfin2012 = '1' THEN      #立帳未稅
            IF l_xrcf103 - l_xrcb103 > 0 THEN
               LET l_cnt = 1
               EXIT FOREACH
            END IF
         ELSE
            IF l_xrcf105 - l_xrcb105 > 0 THEN
               LET l_cnt = 1
               EXIT FOREACH
            END IF
         END IF
      END FOREACH
      IF l_cnt = 0 THEN          #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
            LET r_flag = 1          #CONTINUE FOREACH
            IF cl_null(r_xrcf.xrcf026) THEN LET r_xrcf.xrcf026 = " " END IF #業務部門
            IF cl_null(r_xrcf.xrcf027) THEN LET r_xrcf.xrcf027 = " " END IF #責任中心
            IF cl_null(r_xrcf.xrcf028) THEN LET r_xrcf.xrcf028 = " " END IF #區域
            IF cl_null(r_xrcf.xrcf029) THEN LET r_xrcf.xrcf029 = " " END IF #收付款客商
            IF cl_null(r_xrcf.xrcf030) THEN LET r_xrcf.xrcf030 = " " END IF #帳款客商
            IF cl_null(r_xrcf.xrcf031) THEN LET r_xrcf.xrcf031 = " " END IF #客群
            IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = " " END IF #產品類別
            IF cl_null(r_xrcf.xrcf033) THEN LET r_xrcf.xrcf033 = " " END IF #業務人員
            IF cl_null(r_xrcf.xrcf034) THEN LET r_xrcf.xrcf034 = " " END IF #專案編號
            IF cl_null(r_xrcf.xrcf035) THEN LET r_xrcf.xrcf035 = " " END IF #WBS
            IF cl_null(r_xrcf.xrcf036) THEN LET r_xrcf.xrcf036 = " " END IF #經營方式
            IF cl_null(r_xrcf.xrcf037) THEN LET r_xrcf.xrcf037 = " " END IF #通路
            IF cl_null(r_xrcf.xrcf038) THEN LET r_xrcf.xrcf038 = " " END IF #品牌
            IF cl_null(r_xrcf.xrcf039) THEN LET r_xrcf.xrcf039 = " " END IF #自由核算項一
            IF cl_null(r_xrcf.xrcf040) THEN LET r_xrcf.xrcf040 = " " END IF #自由核算項二
            IF cl_null(r_xrcf.xrcf041) THEN LET r_xrcf.xrcf041 = " " END IF #自由核算項三
            IF cl_null(r_xrcf.xrcf042) THEN LET r_xrcf.xrcf042 = " " END IF #自由核算項四
            IF cl_null(r_xrcf.xrcf043) THEN LET r_xrcf.xrcf043 = " " END IF #自由核算項五
            IF cl_null(r_xrcf.xrcf044) THEN LET r_xrcf.xrcf044 = " " END IF #自由核算項六
            IF cl_null(r_xrcf.xrcf045) THEN LET r_xrcf.xrcf045 = " " END IF #自由核算項七
            IF cl_null(r_xrcf.xrcf046) THEN LET r_xrcf.xrcf046 = " " END IF #自由核算項八
            IF cl_null(r_xrcf.xrcf047) THEN LET r_xrcf.xrcf047 = " " END IF #自由核算項九
            IF cl_null(r_xrcf.xrcf048) THEN LET r_xrcf.xrcf048 = " " END IF #自由核算項十               
            RETURN r_flag,r_xrcf.*,l_xrcf_tmp
         END IF
         #180221-00030#2 add-e
   END IF
   #檢查t300是否沖完暫估---(E)---

   #沖帳情況：1整張單沖銷部分 2.全部沖完
#   #190307-00012#1---mark---str
#   LET r_xrcf.xrcf029 = p_xrca.xrca004       #交易客商
#   LET r_xrcf.xrcf030 = p_xrca.xrca005       #帳款客商
#   #190307-00012#1---mark---end
   #190307-00012#1---add---str
   #xrcf030是账款客商，对应得应该是账款对象。在凭证预览里看到账款客户和收付款客户是反的
   LET r_xrcf.xrcf029 = p_xrca.xrca005       #交易客商
   LET r_xrcf.xrcf030 = p_xrca.xrca004       #帳款客商
   #190307-00012#1---add---end
   
   LET r_xrcf.xrcf101 = ''                   #NO USE
   LET r_xrcf.xrcf102 = p_xrcc.xrcc102       #本幣一匯率   #170317-00029#2 mod p_xrca.xrca101 -> p_xrcc.xrcc102
   LET r_xrcf.xrcf111 = ''                   #NO USE
   LET r_xrcf.xrcf122 = p_xrcc.xrcc122       #本幣二匯率   #170317-00029#2 mod p_xrca.xrca121 -> p_xrcc.xrcc122
   LET r_xrcf.xrcf132 = p_xrcc.xrcc132       #本幣三匯率   #170317-00029#2 mod p_xrca.xrca131 -> p_xrcc.xrcc132
   
   #180221-00030#2 add-s         
   LET l_xrcc102 = ''
   SELECT xrcc101,xrcc102 INTO l_xrcc101,l_xrcc102 FROM xrcc_t 
    WHERE xrccent = g_enterprise AND xrccld  = p_ld AND xrccdocno = p_xrca.xrcadocno
      AND xrccseq = p_xrcc.xrccseq AND xrcc001 = p_xrcc.xrcc001        
   LET r_xrcf.xrcf102 = l_xrcc102    
    
   #180221-00030#2 add-e
   {p_type1:出貨單/銷退單--S--}

   IF p_type = '1' THEN
      LET l_cnt = 0
          
      #170225-00002#1--add--str--
      #程式优化
      #t300計算已沖暫估數量(不含本張單沖銷的)
      LET l_sql="SELECT SUM(xrcb007),",
                "       SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115),",
                "       SUM(xrcb123),SUM(xrcb124),SUM(xrcb125),SUM(xrcb133),SUM(xrcb134),SUM(xrcb135)",
                "  FROM xrca_t,xrcb_t",
                " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno",
                "   AND xrcastus NOT IN ('X','Y')",
                "   AND xrcaent = ",g_enterprise,
                "   AND xrcb023 = 'Y'",
                "   AND xrcald  = '",p_ld,"' AND xrcbdocno <> '",p_xrcadocno,"'",
                "   AND xrcb002 = ? AND xrcb003 = ?"
      PREPARE s_axrp130_sum_xrcb_pr FROM l_sql        
      #t320立暫估數量
      LET l_sql="SELECT xrcb007,xrcb107,xrcb101,",                      
                "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
                "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135",
                "  FROM xrca_t,xrcb_t",
                " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno",
                "   AND xrcbent = ",g_enterprise,
                "   AND xrcbld = '",p_ld,"' AND xrcbdocno = ?",#p_xrca.xrcadocno,"'",
                "   AND xrcb002= ? AND xrcb003 = ?"
      PREPARE s_axrp130_sum_xrcb2_pr FROM l_sql
      #170225-00002#1--add--end

      #170410-00053#1 add s---
      LET l_sql = "SELECT DISTINCT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,",
                  "xrcacnfid,xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,",
                  "xrcasite,xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,",
                  "xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,",
                  "xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,",
                  "xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,",
                  "xrca051,xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,",
                  "xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,",
                  "xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,",
                  "xrca131,xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,",
                  "xrcaud006,xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,",
                  "xrcaud016,xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,",
                  "xrcaud026,xrcaud027,xrcaud028,xrcaud029,xrcaud030,xrcc102,xrcc122,xrcc132 ",  
                "    FROM xrca_t LEFT JOIN xrcc_t ON xrcaent = xrccent AND xrcald = xrccld AND xrcadocno = xrccdocno AND xrcc108 - xrcc109 > 0",
                "   WHERE xrcaent = ",g_enterprise," AND xrcald = '",p_ld,"'",
                "     AND xrcadocno IN (SELECT DISTINCT xrcadocno ",
                "                         FROM xrca_t,xrcb_t a1,xrcb_t a2" ,     #xrca_t/a1.xrcb_t(暫估的TABLE)/a2.xrcb_t(是此次立帳單的TABLE)
                "                        WHERE xrcaent = a1.xrcbent     AND xrcald = a1.xrcbld",
                "                          AND xrcaent = a2.xrcbent     AND xrcald = a2.xrcbld",
                "                          AND xrcadocno = a1.xrcbdocno AND xrca001 IN ('01','02') AND xrcastus = 'Y'" ,
                "                          AND xrcaent = ",g_enterprise," AND xrcald = '",p_ld,"'",
                "                          AND xrcadocdt <='",l_xrcadocdt,"' " ,    
                "                          AND a1.xrcbent = a2.xrcbent ",        #"AND a1.xrcb001 = a2.xrcb001" ,>>t210跟t320的xrcb001不同
                "                          AND a1.xrcb002 = a2.xrcb002 AND a1.xrcb003 = a2.xrcb003" ,
                "                          AND a2.xrcb002 = ? AND a2.xrcb003 = ?",  
                "                          AND a2.xrcbdocno = '",p_xrcadocno,"') ",
                "   ORDER BY xrcadocdt "  
       PREPARE s_aapp130_ins_xrcf_p1 FROM l_sql
       DECLARE s_aapp130_ins_xrcf_c1 CURSOR FOR s_aapp130_ins_xrcf_p1
       #170410-00053#1 add e---
       
#170410-00053#1 mark s---
#      LET l_sql = "SELECT xrcb002,xrcb003,xrcb007,",
#                  "       xrcb101,",
#                  "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
#                  "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135,",
#                  "       xrcborga,",
#                  "       xrcb010,xrcb011,xrcb024,xrcb036,xrcb004,",
#                  "       xrcb051,xrcb015,xrcb016,xrcb033,xrcb034,",
#                  "       xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,",
#                  "       xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,",
#                  "       xrcb046,xrcb047,xrcb021 ",
#                  "  FROM xrcb_t",
#                  " WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
#                  "   AND xrcbdocno = '",p_xrcadocno,"' ",
#                  "   AND xrcb001 IN ('11','21') ",
#                  "   AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL ",
#                  "   AND xrcb023 = 'Y' "
#      PREPARE s_axrp130_get_t300xrcb_p FROM l_sql
#      DECLARE s_axrp130_get_t300xrcb_c CURSOR FOR s_axrp130_get_t300xrcb_p
#      FOREACH s_axrp130_get_t300xrcb_c INTO l_xrcb002,l_xrcb003,l_xrcb007,l_xrcb1.*
#         LET l_xrcf007 = 0
#         LET l_xrcf0071= 0
#170410-00053#1 mark e---

         #170410-00053#1 add s---
         #檢查t320是否被沖完暫估
         LET l_sql = "SELECT SUM(xrcf105)",# INTO l_xrcf105
                     " FROM xrca_t,xrcf_t",
                     " WHERE xrcaent = xrcfent AND xrcadocno = xrcfdocno",
                     "   AND xrcastus NOT IN ('X','Y')",
                     "   AND xrcaent = ",g_enterprise,
                     "   AND xrcald  = '",p_ld,"' AND xrcf008 = ?"#p_xrca.xrcadocno
         PREPARE s_axrp130_sum_xrcf_pr FROM l_sql            
 
         LET l_sql = "SELECT SUM(xrcc108-xrcc109),SUM(xrcc118-xrcc119)",# INTO l_xrcc108,l_xrcc118  
                     "  FROM xrcc_t ",
                     " WHERE xrccent = ",g_enterprise,
                     "   AND xrccld  = '",p_ld,"' AND xrccdocno = ?" #p_xrca.xrcadocno,"'"
         PREPARE s_axrp130_sum_xrcc_pr FROM l_sql 
         #170410-00053#1 add e---

         FOREACH s_aapp130_ins_xrcf_c1 USING l_xrcb002,l_xrcb003 INTO p_xrca.*,p_xrcc.xrcc102,p_xrcc.xrcc122,p_xrcc.xrcc132#,l_xrcc.*    #取得t320的暫估資料 #170410-00053#1 add   
 
            #170410-00053#1 add s---
            #檢查t320是否被沖完暫估
            EXECUTE s_axrp130_sum_xrcf_pr USING p_xrca.xrcadocno INTO l_xrcf105
            EXECUTE s_axrp130_sum_xrcc_pr USING p_xrca.xrcadocno INTO l_xrcc108,l_xrcc118
            IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
            IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
            IF l_xrcc108 - l_xrcf105 = 0 THEN   #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
               CONTINUE FOREACH
            END IF      
            #檢查t300是否沖完暫估 
            FOREACH s_axrp130_get_xrcf_c USING p_xrca.xrcadocno,l_xrcb002,l_xrcb003 INTO l_xrcb002,l_xrcb003,l_xrcb007
               #計算已沖 暫估數量(不含本張單沖銷的數量)
               EXECUTE s_axrp130_sum_xrcb007_pr USING l_xrcb002,l_xrcb003 INTO l_xrcb0071
             
               IF cl_null(l_xrcb007)  THEN LET l_xrcb007 = 0 END IF
               IF cl_null(l_xrcb0071) THEN LET l_xrcb0071= 0 END IF
               IF l_xrcb007 - l_xrcb0071 <> 0 THEN
                  LET l_cnt = 1
                  EXIT FOREACH
               END IF
            END FOREACH
            IF l_cnt = 0 THEN          #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
               CONTINUE FOREACH
            END IF
            #170410-00053#1 add e---
         
         #170225-00002#1--mod--str--
         #程式优化
         #t300計算已沖暫估數量(不含本張單沖銷的)
#         SELECT SUM(xrcb007),
#                SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115),
#                SUM(xrcb123),SUM(xrcb124),SUM(xrcb125),SUM(xrcb133),SUM(xrcb134),SUM(xrcb135)
#           INTO l_xrcf0071,l_xrcf1.*
#           FROM xrca_t,xrcb_t
#          WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno
#            AND xrcastus NOT IN ('X','Y')
#            AND xrcaent = g_enterprise
#            AND xrcald  = p_ld AND xrcbdocno <> p_xrcadocno
#            AND xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003
#            AND xrcb023 = 'Y'
         EXECUTE s_axrp130_sum_xrcb_pr USING l_xrcb002,l_xrcb003 
                                       INTO l_xrcf0071,l_xrcf1.*
         #t320立暫估數量
#         SELECT xrcb007,xrcb107,   #160816-00014#1 Mod xrcb101 --> xrcb107
#                xrcb101,           #160912-00011#4 Add
#                xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,
#                xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135
#           INTO l_xrcf007,l_xrcb101,l_xrcb3.xrcb101,l_xrcf2.*   #160912-00011#4 Add l_xrcb3.xrcb101
#           FROM xrca_t,xrcb_t
#          WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno
#            AND xrcbent = g_enterprise
#            AND xrcbld = p_ld AND xrcbdocno = p_xrca.xrcadocno
#            AND xrcb002= l_xrcb002 AND xrcb003 = l_xrcb003
         EXECUTE s_axrp130_sum_xrcb2_pr USING p_xrca.xrcadocno,l_xrcb002,l_xrcb003 
                                        INTO l_xrcf007,l_xrcb101,l_xrcb3.xrcb101,l_xrcf2.*
         #170225-00002#1--mod--end
         
         #170410-00053#1 add s---
         LET r_xrcf.xrcfent = g_enterprise
         LET r_xrcf.xrcfld  = p_ld
         LET r_xrcf.xrcfdocno=p_xrcadocno

         LET r_xrcf.xrcfseq = 0        
         LET r_xrcf.xrcfseq2 = 0
         LET r_xrcf.xrcf001 = 'axrt300'
         LET r_xrcf.xrcf002 = '01'                 #固定值
         LET r_xrcf.xrcf008 = p_xrca.xrcadocno
         #170821-00012#1--xul--mod--s--
        #LET r_xrcf.xrcf009 = p_xrcc.xrccseq
         SELECT DISTINCT xrcbseq INTO r_xrcf.xrcf009
           FROM xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrcbdocno = p_xrca.xrcadocno
            AND xrcb002 = l_xrcb002
            AND xrcb003 = l_xrcb003           
         #170821-00012#1--xul--mod--e--
         LET r_xrcf.xrcf010 = 0   #p_xrcc.xrcc001       #期別:暫估原則上只有一期
         
         SELECT xrca011 INTO l_xrca011 FROM xrca_t WHERE xrcaent = g_enterprise
            AND xrcald = p_ld
            AND xrcadocno = p_xrcadocno
         LET r_xrcf.xrcf020 = l_xrca011
         
         SELECT xrca035 INTO l_xrca035 FROM xrca_t
          WHERE xrcaent = g_enterprise
            AND xrcald = p_xrca.xrcald AND xrcadocno= p_xrca.xrcadocno
         
         IF l_sfin2011 = 'Y' THEN #180510-00021#1 add
            LET r_xrcf.xrcf021 = l_xrca035 
         #180510-00021#1 add s--   
         ELSE   
            LET r_xrcf.xrcf021 = l_xrca035
            IF l_sfin1002 = '3' THEN
               SELECT xrcb029 INTO r_xrcf.xrcf021
                 FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = p_ld
                  AND xrcbdocno = p_xrca.xrcadocno
                  AND xrcbseq = p_xrcc.xrccseq
            END IF
         END IF   
         #180510-00021#1 add e---
         SELECT glac007 INTO l_glac007       #取得科目性質
           #FROM glac_t,glaa_t  #181001-00015#77 mark
           FROM glac_t  #181001-00015#77 add
          WHERE glacent = g_enterprise AND glac001 = l_glaa004 AND glac002 = l_xrca036  
         SELECT xrcadocdt INTO l_xrcadocdt1  #立帳單的立帳日期
           FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrcadocno
          SELECT xrcadocdt INTO l_xrcadocdt2 #暫估單的立帳日期
           FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrca.xrcadocno
         #當期沖暫估的科目及資產類科目
         IF l_glac007 NOT MATCHES '[45]' OR (YEAR(l_xrcadocdt1) = YEAR(l_xrcadocdt2) AND MONTH(l_xrcadocdt1) = MONTH(l_xrcadocdt2)) THEN
            LET r_xrcf.xrcf022 = p_xrca.xrca036
         ELSE
            LET r_xrcf.xrcf022 = l_xrca036
         END IF
         CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_03')  RETURNING g_sub_success,r_xrcf.xrcf023,g_errno   
         CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_11') RETURNING g_sub_success,r_xrcf.xrcf024,g_errno
         CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_12') RETURNING g_sub_success,r_xrcf.xrcf025,g_errno      
         
#         #190307-00012#1---mark---str
#         LET r_xrcf.xrcf029 = p_xrca.xrca004       #交易客商
#         LET r_xrcf.xrcf030 = p_xrca.xrca005       #帳款客商
#         #190307-00012#1---mark---end
         #190307-00012#1---add---str
         #xrcf030是账款客商，对应得应该是账款对象。在凭证预览里看到账款客户和收付款客户是反的
         LET r_xrcf.xrcf029 = p_xrca.xrca005       #交易客商
         LET r_xrcf.xrcf030 = p_xrca.xrca004       #帳款客商
         #190307-00012#1---add---end
         
         LET r_xrcf.xrcf101 = ''                   #NO USE
         LET r_xrcf.xrcf102 = p_xrcc.xrcc102       #本幣一匯率   #170317-00029#2 mod p_xrca.xrca101 -> p_xrcc.xrcc102
         LET r_xrcf.xrcf111 = ''                   #NO USE
         LET r_xrcf.xrcf122 = p_xrcc.xrcc122       #本幣二匯率   #170317-00029#2 mod p_xrca.xrca121 -> p_xrcc.xrcc122
         LET r_xrcf.xrcf132 = p_xrcc.xrcc132       #本幣三匯率   #170317-00029#2 mod p_xrca.xrca131 -> p_xrcc.xrcc132         
         #170410-00053#1 add e---
         
         #160823-00027#1 Add  ---(S)---
         LET l_xrcb3.xrcb007 = l_xrcf007
         LET l_xrcb3.xrcb103 = l_xrcf2.xrcf103
         LET l_xrcb3.xrcb105 = l_xrcf2.xrcf105
         LET l_xrcb3.xrcb113 = l_xrcf2.xrcf113
         LET l_xrcb3.xrcb115 = l_xrcf2.xrcf115
         #160823-00027#1 Add  ---(E)---

         IF cl_null(l_xrcb007) THEN LET l_xrcb007 = 0 END IF
         IF cl_null(l_xrcf007) THEN LET l_xrcf007 = 0 END IF
         IF cl_null(l_xrcf0071)THEN LET l_xrcf0071= 0 END IF
         IF cl_null(l_xrcf1.xrcf103) THEN LET l_xrcf1.xrcf103 = 0 END IF      IF cl_null(l_xrcf1.xrcf113) THEN LET l_xrcf1.xrcf113 = 0 END IF
         IF cl_null(l_xrcf1.xrcf104) THEN LET l_xrcf1.xrcf104 = 0 END IF      IF cl_null(l_xrcf1.xrcf114) THEN LET l_xrcf1.xrcf114 = 0 END IF
         IF cl_null(l_xrcf1.xrcf105) THEN LET l_xrcf1.xrcf105 = 0 END IF      IF cl_null(l_xrcf1.xrcf115) THEN LET l_xrcf1.xrcf115 = 0 END IF
         IF cl_null(l_xrcf2.xrcf103) THEN LET l_xrcf2.xrcf103 = 0 END IF      IF cl_null(l_xrcf2.xrcf113) THEN LET l_xrcf2.xrcf113 = 0 END IF
         IF cl_null(l_xrcf2.xrcf104) THEN LET l_xrcf2.xrcf104 = 0 END IF      IF cl_null(l_xrcf2.xrcf114) THEN LET l_xrcf2.xrcf114 = 0 END IF
         IF cl_null(l_xrcf2.xrcf105) THEN LET l_xrcf2.xrcf105 = 0 END IF      IF cl_null(l_xrcf2.xrcf115) THEN LET l_xrcf2.xrcf115 = 0 END IF
         IF l_xrcf007 = l_xrcf0071 THEN CONTINUE FOREACH END IF
         IF cl_null(r_xrcf.xrcforga)THEN LET r_xrcf.xrcforga= l_xrcb1.xrcborga END IF      #來源組織
         IF cl_null(r_xrcf.xrcf026) THEN LET r_xrcf.xrcf026 = l_xrcb1.xrcb010 END IF       #業務部門
         IF cl_null(r_xrcf.xrcf027) THEN LET r_xrcf.xrcf027 = l_xrcb1.xrcb011 END IF       #責任中心
         IF cl_null(r_xrcf.xrcf028) THEN LET r_xrcf.xrcf028 = l_xrcb1.xrcb024 END IF       #區域
         IF cl_null(r_xrcf.xrcf031) THEN LET r_xrcf.xrcf031 = l_xrcb1.xrcb036 END IF       #客群
         #IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb004 END IF       #產品類別     #180807-00063#1 mark
         IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb012 END IF       #產品類別      #180807-00063#1 add
         IF cl_null(r_xrcf.xrcf033) THEN LET r_xrcf.xrcf033 = l_xrcb1.xrcb051 END IF       #業務人員
         IF cl_null(r_xrcf.xrcf034) THEN LET r_xrcf.xrcf034 = l_xrcb1.xrcb015 END IF       #專案編號
         IF cl_null(r_xrcf.xrcf035) THEN LET r_xrcf.xrcf035 = l_xrcb1.xrcb016 END IF       #WBS
         IF cl_null(r_xrcf.xrcf036) THEN LET r_xrcf.xrcf036 = l_xrcb1.xrcb033 END IF       #經營方式
         IF cl_null(r_xrcf.xrcf037) THEN LET r_xrcf.xrcf037 = l_xrcb1.xrcb034 END IF       #渠道
         IF cl_null(r_xrcf.xrcf038) THEN LET r_xrcf.xrcf038 = l_xrcb1.xrcb035 END IF       #品牌
         IF cl_null(r_xrcf.xrcf039) THEN LET r_xrcf.xrcf039 = l_xrcb1.xrcb037 END IF       #自由核算項1
         IF cl_null(r_xrcf.xrcf040) THEN LET r_xrcf.xrcf040 = l_xrcb1.xrcb038 END IF       #自由核算項2
         IF cl_null(r_xrcf.xrcf041) THEN LET r_xrcf.xrcf041 = l_xrcb1.xrcb039 END IF       #自由核算項3
         IF cl_null(r_xrcf.xrcf042) THEN LET r_xrcf.xrcf042 = l_xrcb1.xrcb040 END IF       #自由核算項4
         IF cl_null(r_xrcf.xrcf043) THEN LET r_xrcf.xrcf043 = l_xrcb1.xrcb041 END IF       #自由核算項5
         IF cl_null(r_xrcf.xrcf044) THEN LET r_xrcf.xrcf044 = l_xrcb1.xrcb042 END IF       #自由核算項6
         IF cl_null(r_xrcf.xrcf045) THEN LET r_xrcf.xrcf045 = l_xrcb1.xrcb043 END IF       #自由核算項7
         IF cl_null(r_xrcf.xrcf046) THEN LET r_xrcf.xrcf046 = l_xrcb1.xrcb044 END IF       #自由核算項8
         IF cl_null(r_xrcf.xrcf047) THEN LET r_xrcf.xrcf047 = l_xrcb1.xrcb045 END IF       #自由核算項9
         IF cl_null(r_xrcf.xrcf048) THEN LET r_xrcf.xrcf048 = l_xrcb1.xrcb046 END IF       #自由核算項10
         IF cl_null(r_xrcf.xrcf049) THEN LET r_xrcf.xrcf049 = l_xrcb1.xrcb047 END IF       #摘要
         IF cl_null(r_xrcf.xrcf022) THEN LET r_xrcf.xrcf022 = l_xrcb1.xrcb021 END IF       #費用會計科目

         CASE
             WHEN l_sfin2012 ='1'    #1:非雜項/1:立帳不含稅
                  LET l_cnt = l_cnt +1
                  #(t320立暫估數-t300不含本張沖暫估數) > t300這次要沖的暫估數
                  IF (l_xrcf007 - l_xrcf0071) >  p_xrcb007 THEN  #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     LET l_xrcf007 = p_xrcb007  #計算匯差價差要以沖暫估數量 #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb1.xrcb103
                     LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb1.xrcb103
                     #本幣要等於原幣*原立暫估匯率
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf114 = 0
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
                  ELSE
                     LET l_xrcf007 = l_xrcf007 - l_xrcf0071
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103   #(立暫估數-沖暫估數)
                     LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103
                     #170419-00065#1--mark--s--xul
#                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf2.xrcf113 - l_xrcf1.xrcf113
#                     LET l_xrcf_tmp[l_cnt].xrcf114 = 0
#                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf2.xrcf113 - l_xrcf1.xrcf113
                     #170419-00065#1--mark--e--xul
                     #170419-00065#1--add---s--xul
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf114 = 0 
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * r_xrcf.xrcf102
                     #170419-00065#1--add---e--xul
                  END IF
                  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
                  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
             WHEN l_sfin2012 ='2'    #1:非雜項/2:立帳含稅
                  LET l_cnt = l_cnt +1
                  IF (l_xrcf007 - l_xrcf0071) >  p_xrcb007 THEN #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     LET l_xrcf007 = p_xrcb007  #計算匯差價差要以沖暫估數量 #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     #l_glaacomp營運據點/p_oodb002稅別/p_money計稅基礎/p_num數量/p_curr幣別/p_rate匯率
                    #CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcb1.xrcb105,l_xrcf007,p_xrca.xrca100,p_xrca.xrca101)   #160912-00011#4 Mark
                     CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcb3.xrcb101 * l_xrcf007,l_xrcf007,p_xrca.xrca100,r_xrcf.xrcf102)   #160912-00011#4 Add #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
                          RETURNING l_xrcf_tmp[l_cnt].xrcf103,l_xrcf_tmp[l_cnt].xrcf104,l_xrcf_tmp[l_cnt].xrcf105,
                                    l_xrcf_tmp[l_cnt].xrcf113,l_xrcf_tmp[l_cnt].xrcf114,l_xrcf_tmp[l_cnt].xrcf115
                  ELSE
                     LET l_xrcf007 = l_xrcf007 - l_xrcf0071
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103   #(立暫估數-沖暫估數)
                     LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcf2.xrcf104 - l_xrcf1.xrcf104
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcf2.xrcf105 - l_xrcf1.xrcf105
                     #170419-00065#1--mark--s--xul
#                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf2.xrcf113 - l_xrcf1.xrcf113
#                     LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf2.xrcf114 - l_xrcf1.xrcf114
#                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf2.xrcf115 - l_xrcf1.xrcf115
                     #170419-00065#1--mark--e--xul
                     #170419-00065#1--add--s--xul
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf_tmp[l_cnt].xrcf104 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * r_xrcf.xrcf102
                     #170419-00065#1--add--e--xul
                     #170603-00037#1--add--str--
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf114
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
                     #170603-00037#1--add--end
                  END IF
         END CASE

         LET l_xrcf_tmp[l_cnt].xrca001 = p_xrca.xrca001
         #計算價差匯差
         IF l_xrca100 = p_xrca.xrca100 THEN     #相同幣別沖暫估者，則以原暫估單匯率
#            LET l_rate = p_xrca.xrca101 #170603-00037#1 mark
            LET l_rate = r_xrcf.xrcf102 #170603-00037#1 add
         ELSE
            #170603-00037#1--mod--str--
            #参照AP规格
            #不同幣別沖暫估,直接取現在立帳的單頭匯率來換算本幣,不重取匯率
            LET l_rate = l_xrca101
#            CALL s_aooi160_get_exrate('2',p_ld,p_xrca.xrcadocdt,l_xrca100,l_glaa001,0,l_glaa025)
#                 RETURNING l_rate
            #170603-00037#1--mod--end
         END IF
         
         #180221-00030#2 add-s
         #计算立账单的未税单价金额
         LET l_oodb004 = ''
         LET l_oodb005 = ''
         LET l_oodb006 = ''
         LET l_oodb011 = ''
         LET l_xrcacomp= ''
         LET l_xrca011 = ''
         #立账单法人/税别
         SELECT xrcacomp,xrca011 INTO l_xrcacomp,l_xrca011  FROM xrca_t
          WHERE xrcaent=g_enterprise AND xrcald=p_ld AND xrcadocno=p_xrcadocno
            
         CALL s_tax_chk(l_xrcacomp,l_xrca011) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011         
         IF l_oodb005 = 'Y' THEN
            LET l_xrcb1.xrcb101 = l_xrcb1.xrcb101 / (1 + l_oodb006/100)    
            #CALL s_curr_round_ld('1',p_ld,l_xrca011,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101 #180627-00046#1 mark
            #CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101 #180627-00046#1 mark #180822-00006#1 mark 
         END IF
         
         #计算暂估单未税单价金额
         LET l_oodb004 = ''
         LET l_oodb005 = ''
         LET l_oodb006 = ''
         LET l_oodb011 = ''
         LET l_xrcacomp= ''
         LET l_xrca011 = ''
         #暂估单法人/税别
         SELECT xrcacomp,xrca011 INTO l_xrcacomp,l_xrca011  FROM xrca_t
          WHERE xrcaent=g_enterprise AND xrcald=p_ld AND xrcadocno=p_xrca.xrcadocno
            
         CALL s_tax_chk(l_xrcacomp,l_xrca011) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011         
         IF l_oodb005 = 'Y' THEN
            #180625-00055#1 mark-s
#            LET l_xrcb101  = l_xrcb101  / (1 + l_oodb006/100)    
#            CALL s_curr_round_ld('1',p_ld,l_xrca011,l_xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb101 
            #180625-00055#1 mark-e
            #180625-00055#1 add-s
            #暂估单税别含税时，因价差看未税，故这里要用暂估单价将原币含税单价反推成原币未税单价
            LET l_xrcb3.xrcb101  = l_xrcb3.xrcb101  / (1 + l_oodb006/100)    
            #CALL s_curr_round_ld('1',p_ld,l_xrca011,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180627-00046#1 mark
            #CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180627-00046#1 add  #180822-00006#1 mark           
            #180625-00055#1 add-e
         END IF    
         #180221-00030#2 add-e
         
         #160912-00011#4 Add  ---(S)---
         #LET l_xrcf_tmp[l_cnt].xrcf106 = (l_xrcb1.xrcb101 - l_xrcb101) * l_xrcf007  #180625-00055#1 mark
         LET l_xrcf_tmp[l_cnt].xrcf106 = (l_xrcb1.xrcb101 - l_xrcb3.xrcb101 ) * l_xrcf007  #180625-00055#1 add
         #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf106,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf106  #180625-00055#1 mark
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf106,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf106  #180625-00055#1 add
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101  #180822-00006#1 add
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180822-00006#1 add    
         #180221-00030#2 mark-s
#         IF p_xrca.xrca013 = 'Y' THEN
#            CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcf_tmp[l_cnt].xrcf106,l_xrcf007,p_xrca.xrca100,r_xrcf.xrcf102)  #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102 
#                 RETURNING l_xrcb4.xrcb103,l_xrcb4.xrcb104,l_xrcb4.xrcb105,
#                           l_xrcb4.xrcb113,l_xrcb4.xrcb114,l_xrcb4.xrcb115
#            LET l_xrcf_tmp[l_cnt].xrcf106 = l_xrcb4.xrcb103
#            LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrcb4.xrcb113
#         END IF
         #180221-00030#2 mark-e
#         LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrcf_tmp[l_cnt].xrcf106 * p_xrca.xrca101  #180221-00030#2 add #180917-00020#1 mark
         LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrcf_tmp[l_cnt].xrcf106 * l_xrca101  #180917-00020#1 #本币价格差异金额应用原币*立账汇率计算
         IF cl_null(l_xrcf_tmp[l_cnt].xrcf106) THEN LET l_xrcf_tmp[l_cnt].xrcf106 = 0 END IF #170525-00073#1 add         
         IF cl_null(l_xrcf_tmp[l_cnt].xrcf116) THEN LET l_xrcf_tmp[l_cnt].xrcf116 = 0 END IF #170525-00073#1 add
         
         LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb103/p_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb103/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf106 #170617-00473#1 mod l_xrcb007--> p_xrcb007
#180823-00022#1 mark s---#此计算方式还是会有差异，与调整确认了此处mark
#         #180906-00063#1----add----str
#         #如果xrcf117直接计算会产生差额
#         LET l_xrcb1s = (l_xrcb1.xrcb113/p_xrcb007)*l_xrcf007
#         LET l_xrcb3s = (l_xrcb3.xrcb113/l_xrcb3.xrcb007)*l_xrcf007
#         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb1s,2) RETURNING g_sub_success,g_errno,l_xrcb1s  
#         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcb3s,2) RETURNING g_sub_success,g_errno,l_xrcb3s
#         LET l_xrcf_tmp[l_cnt].xrcf117 = l_xrcb1s - l_xrcb3s -  l_xrcf_tmp[l_cnt].xrcf116
#         #180906-00063#1----add----end
#180823-00022#1 mark e---         
         #180823-00022#1 add s---
         #匯差計算方式:該項次本幣未稅金額-立暫估時本幣未稅金額-本幣價差
         LET l_xrcf_tmp[l_cnt].xrcf117 = l_xrcb1.xrcb113 - l_xrcf_tmp[l_cnt].xrcf113 - l_xrcf_tmp[l_cnt].xrcf116         
         #180823-00022#1 add e---
         
#         LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb113/p_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb113/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf116 #170617-00473#1 mod l_xrcb007--> p_xrcb007    #180906-00063#1----mark
         #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf107,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf107 #170531-00025#1 mark
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf107,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf107  #170531-00025#1 add
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf117,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf117
         #160912-00011#4 Add  ---(E)---

         #160912-00011#4 Mark ---(S)---
       # ##计算公式可以是：立账的rmb单价＊立暂估时点的rmb的汇率－立暂估的ntd的单价＊立暂估时的ntd的汇率
       # #LET l_xrcf_tmp[l_cnt].xrcf116 = (l_xrcb1.xrcb101 * l_rate - l_xrcb101 * p_xrca.xrca101) * l_xrcf007
       # #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf116,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf116
       # #
       # #LET l_xrcf_tmp[l_cnt].xrcf106 = l_xrcf_tmp[l_cnt].xrcf116 / p_xrca.xrca101
       # #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf106,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf106
       #
       #  #雜項沖暫估整筆處理
       #  #匯差金额的计算公式：立账的rmb单价＊立账时点的rmb的汇率－立账的rmb的单价＊立暂估时点的rmb的汇率 並扣除價差
       # #IF l_sfin2012 ='1' THEN   #160816-00014#1 Mark
       #     #160823-00027#1 Mark ---(S)---
       #    #LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb103/l_xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf105 - l_xrcf_tmp[l_cnt].xrcf106
       #    #LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb113/l_xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf115 - l_xrcf_tmp[l_cnt].xrcf116
       #     #160823-00027#1 Mark ---(E)---
       #     #160823-00027#1 Add  ---(S)---
       #     LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb103/l_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb103/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf106
       #     LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb113/l_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb113/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf116
       #     #160823-00027#1 Add  ---(E)---
       # #160816-00014#1 Mark ---(S)---
       # #ELSE
       # #   #160823-00027#1 Mark ---(S)---
       # #  #LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb105/l_xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf105 - l_xrcf_tmp[l_cnt].xrcf106
       # #  #LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb115/l_xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf115 - l_xrcf_tmp[l_cnt].xrcf116
       # #   #160823-00027#1 Mark ---(E)---
       # #   #160823-00027#1 Add  ---(S)---
       # #   LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb105/l_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb105/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf106
       # #   LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb115/l_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb115/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf116
       # #   #160823-00027#1 Add  ---(E)---
       # #END IF
       # #160816-00014#1 Mark ---(E)---
       #  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf107,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf107
       #  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf117,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf117
       #  #160912-00011#4 Mark ---(E)---
       
       #170410-00053#1 add s---
        LET r_xrcf.xrcf103 = l_xrcf_tmp[l_cnt].xrcf103
        LET r_xrcf.xrcf104 = l_xrcf_tmp[l_cnt].xrcf104
        LET r_xrcf.xrcf105 = l_xrcf_tmp[l_cnt].xrcf105
        LET r_xrcf.xrcf113 = l_xrcf_tmp[l_cnt].xrcf113
        LET r_xrcf.xrcf114 = l_xrcf_tmp[l_cnt].xrcf114
        LET r_xrcf.xrcf115 = l_xrcf_tmp[l_cnt].xrcf115  
        LET r_xrcf.xrcf116 = l_xrcf_tmp[l_cnt].xrcf116
        LET r_xrcf.xrcf117 = l_xrcf_tmp[l_cnt].xrcf117
        LET r_xrcf.xrcf106 = l_xrcf_tmp[l_cnt].xrcf106
 
        IF cl_null(r_xrcf.xrcf106) THEN LET r_xrcf.xrcf106 = 0 END IF
        IF cl_null(r_xrcf.xrcf116) THEN LET r_xrcf.xrcf116 = 0 END IF
#180808-00054#1 mark s---
#FUNCTION s_axrp130_ins_xrcf_diff中处理价差，
#汇差时已考虑销退暂估单，其他待底暂估单 原幣沖銷價格差異金額 和 本币汇差金额的处理
#        IF l_xrcf_tmp[l_cnt].xrca001 MATCHES '0[24]' THEN
#           LET r_xrcf.xrcf106 = r_xrcf.xrcf106 * -1
#           LET r_xrcf.xrcf116 = r_xrcf.xrcf106 * -1
#        END IF
#180808-00054#1 mark e--- 
        IF cl_null(l_xrcf_tmp[l_cnt].xrcf107) THEN LET l_xrcf_tmp[l_cnt].xrcf107 = 0 END IF
        IF cl_null(r_xrcf.xrcf117) THEN LET r_xrcf.xrcf117 = 0 END IF
#180808-00054#1 mark s---   
#FUNCTION s_axrp130_ins_xrcf_diff中处理价差，
#汇差时已考虑销退暂估单，其他待底暂估单 原幣沖銷價格差異金額 和 本币汇差金额的处理
#        IF r_xrcf.xrcf117 <> 0 THEN
#           IF l_xrcf_tmp[l_cnt].xrca001 MATCHES '0[24]' THEN
#              LET r_xrcf.xrcf117 = r_xrcf.xrcf117 * -1
#              LET l_xrcf_tmp[l_cnt].xrcf107 = l_xrcf_tmp[l_cnt].xrcf107 * -1
#           END IF
#        END IF        
#180808-00054#1 mark e---

        INSERT INTO s_axrp130_tmp (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,  
                            xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                            xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                            xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                            xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                            xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                            xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                            xrcf135,xrcf136,xrcf137,xrcf107,xrca001)
         VALUES(r_xrcf.xrcfent,r_xrcf.xrcfld, r_xrcf.xrcfdocno,r_xrcf.xrcfseq,r_xrcf.xrcfseq2,r_xrcf.xrcf001,r_xrcf.xrcf002,r_xrcf.xrcf007,r_xrcf.xrcf008,
                r_xrcf.xrcf009,r_xrcf.xrcf010,r_xrcf.xrcf020,r_xrcf.xrcf021,r_xrcf.xrcf022,r_xrcf.xrcf023,r_xrcf.xrcf024,r_xrcf.xrcf025,r_xrcf.xrcforga,
                r_xrcf.xrcf026,r_xrcf.xrcf027,r_xrcf.xrcf028,r_xrcf.xrcf029,r_xrcf.xrcf030,r_xrcf.xrcf031,r_xrcf.xrcf032,r_xrcf.xrcf033,r_xrcf.xrcf034,
                r_xrcf.xrcf035,r_xrcf.xrcf036,r_xrcf.xrcf037,r_xrcf.xrcf038,r_xrcf.xrcf039,r_xrcf.xrcf040,r_xrcf.xrcf041,r_xrcf.xrcf042,r_xrcf.xrcf043,
                r_xrcf.xrcf044,r_xrcf.xrcf045,r_xrcf.xrcf046,r_xrcf.xrcf047,r_xrcf.xrcf048,r_xrcf.xrcf049,r_xrcf.xrcf101,r_xrcf.xrcf102,r_xrcf.xrcf103,
                r_xrcf.xrcf104,r_xrcf.xrcf105,r_xrcf.xrcf106,r_xrcf.xrcf111,r_xrcf.xrcf113,r_xrcf.xrcf114,r_xrcf.xrcf115,r_xrcf.xrcf116,r_xrcf.xrcf117,
                r_xrcf.xrcf122,r_xrcf.xrcf123,r_xrcf.xrcf124,r_xrcf.xrcf125,r_xrcf.xrcf126,r_xrcf.xrcf127,r_xrcf.xrcf132,r_xrcf.xrcf133,r_xrcf.xrcf134,
                r_xrcf.xrcf135,r_xrcf.xrcf136,r_xrcf.xrcf137,l_xrcf_tmp[l_cnt].xrcf107,l_xrcf_tmp[l_cnt].xrca001)      
         
       #170410-00053#1 add e---
       
      END FOREACH #备注：s_aapp130_ins_xrcf_c1（#170410-00053#1） 
#170410-00053#1 mark s---      
#      LET r_xrcf.xrcf103 = 0     LET r_xrcf.xrcf113 = 0
#      LET r_xrcf.xrcf104 = 0     LET r_xrcf.xrcf114 = 0
#      LET r_xrcf.xrcf105 = 0     LET r_xrcf.xrcf115 = 0
#      #170225-00002#1--add--str--
#      LET l_xrcf106_s = 0        LET l_xrcf116_s = 0
#      LET l_xrcf107_s = 0        LET l_xrcf117_s = 0
#      #170225-00002#1--add--end
#      FOR l_i = 1 TO l_xrcf_tmp.getLength()
#         LET r_xrcf.xrcf103 = r_xrcf.xrcf103 + l_xrcf_tmp[l_i].xrcf103
#         LET r_xrcf.xrcf104 = r_xrcf.xrcf104 + l_xrcf_tmp[l_i].xrcf104
#         LET r_xrcf.xrcf105 = r_xrcf.xrcf105 + l_xrcf_tmp[l_i].xrcf105
#         LET r_xrcf.xrcf113 = r_xrcf.xrcf113 + l_xrcf_tmp[l_i].xrcf113
#         LET r_xrcf.xrcf114 = r_xrcf.xrcf114 + l_xrcf_tmp[l_i].xrcf114
#         LET r_xrcf.xrcf115 = r_xrcf.xrcf115 + l_xrcf_tmp[l_i].xrcf115
#         
#         #170225-00002#1--add--str--
#         #xrcf106/xrcf116
#         IF cl_null(l_xrcf_tmp[l_i].xrcf106) THEN LET l_xrcf_tmp[l_i].xrcf106 = 0 END IF
#         IF cl_null(l_xrcf_tmp[l_i].xrcf116) THEN LET l_xrcf_tmp[l_i].xrcf116 = 0 END IF
#         IF l_xrcf_tmp[l_i].xrca001 MATCHES '0[24]' THEN
#            LET l_xrcf_tmp[l_i].xrcf106 = l_xrcf_tmp[l_i].xrcf106 * -1
#            LET l_xrcf_tmp[l_i].xrcf116 = l_xrcf_tmp[l_i].xrcf116 * -1
#         END IF
#         LET l_xrcf106_s = l_xrcf106_s + l_xrcf_tmp[l_i].xrcf106
#         LET l_xrcf116_s = l_xrcf116_s + l_xrcf_tmp[l_i].xrcf116
#         
#         #xrcf107/xrcf117
#         IF cl_null(l_xrcf_tmp[l_i].xrcf107) THEN LET l_xrcf_tmp[l_i].xrcf107 = 0 END IF
#         IF cl_null(l_xrcf_tmp[l_i].xrcf117) THEN LET l_xrcf_tmp[l_i].xrcf117 = 0 END IF
#         IF l_xrcf_tmp[l_i].xrcf117 <> 0 THEN
#            IF l_xrcf_tmp[l_i].xrca001 MATCHES '0[24]' THEN
#               LET l_xrcf_tmp[l_i].xrcf117 = l_xrcf_tmp[l_i].xrcf117 * -1
#               LET l_xrcf_tmp[l_i].xrcf107 = l_xrcf_tmp[l_i].xrcf107 * -1
#            END IF
#            LET l_xrcf107_s = l_xrcf107_s + l_xrcf_tmp[l_i].xrcf117
#            LET l_xrcf117_s = l_xrcf117_s + l_xrcf_tmp[l_i].xrcf107
#         END IF
#         #170225-00002#1--add--end
#      END FOR
#
#      #170225-00002#1--add--str--
#      #将多笔l_xrcf_tmp数组汇总成一笔
#      IF l_xrcf_tmp.getLength() > 1 THEN
#         LET l_i = 1
#         CALL l_xrcf_tmp.clear()
#         LET l_xrcf_tmp[1].xrca001 = p_xrca.xrca001
#         LET l_xrcf_tmp[1].xrcf103 = r_xrcf.xrcf103 
#         LET l_xrcf_tmp[1].xrcf104 = r_xrcf.xrcf104 
#         LET l_xrcf_tmp[1].xrcf105 = r_xrcf.xrcf105 
#         LET l_xrcf_tmp[1].xrcf106 = l_xrcf106_s
#         LET l_xrcf_tmp[1].xrcf107 = l_xrcf107_s 
#         LET l_xrcf_tmp[1].xrcf113 = r_xrcf.xrcf113 
#         LET l_xrcf_tmp[1].xrcf114 = r_xrcf.xrcf114 
#         LET l_xrcf_tmp[1].xrcf115 = r_xrcf.xrcf115 
#         LET l_xrcf_tmp[1].xrcf116 = l_xrcf116_s
#         LET l_xrcf_tmp[1].xrcf117 = l_xrcf117_s 
#         LET l_xrcf_tmp[1].xrcf123 = r_xrcf.xrcf123
#         LET l_xrcf_tmp[1].xrcf124 = r_xrcf.xrcf124 
#         LET l_xrcf_tmp[1].xrcf125 = r_xrcf.xrcf125 
#         LET l_xrcf_tmp[1].xrcf133 = r_xrcf.xrcf133
#         LET l_xrcf_tmp[1].xrcf134 = r_xrcf.xrcf134 
#         LET l_xrcf_tmp[1].xrcf135 = r_xrcf.xrcf135 
#      END IF 
#      #170225-00002#1--add--end
##170410-00053#1#1 mark e---
      
   {p_type1:入庫單/倉退單--E--}
   ELSE
   {p_type2:雜項--S--}
      #180221-00030#2 mark-s
#      #t320已沖的金額
#      SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),
#             SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135)
#        INTO l_xrcf1.*
#        FROM xrca_t,xrcf_t
#       WHERE xrcaent = xrcfent      AND xrcald = xrcfld
#         AND xrcadocno=xrcfdocno    AND xrcastus <> 'X'
#         AND xrcfent = g_enterprise AND xrcfld = p_ld
#         AND xrcf008 = p_xrca.xrcadocno
#         AND xrcf009 = p_xrcc.xrccseq
#        #AND xrcf010 = p_xrcc.xrcc001
#
#      #t300目前
#      IF p_xrca.xrca001 = '03' THEN
#         SELECT SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115),
#                SUM(xrcb123),SUM(xrcb124), SUM(xrcb125),SUM(xrcb133),SUM(xrcb134),SUM(xrcb135)
#           INTO l_xrcb1.xrcb103,l_xrcb1.xrcb104,l_xrcb1.xrcb105,
#                l_xrcb1.xrcb113,l_xrcb1.xrcb114,l_xrcb1.xrcb115,
#                l_xrcb1.xrcb123,l_xrcb1.xrcb124,l_xrcb1.xrcb125,
#                l_xrcb1.xrcb133,l_xrcb1.xrcb134,l_xrcb1.xrcb135
#           FROM xrcb_t
#          WHERE xrcbent = g_enterprise
#            AND xrcbld  = p_ld AND xrcbdocno = p_xrcadocno
#            AND xrcb001 IN ('19','16')
#            AND xrcb023 = 'Y'
#         SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),
#                SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135)
#           INTO l_xrcf2.xrcf103,l_xrcf2.xrcf104,l_xrcf2.xrcf105,l_xrcf2.xrcf113,l_xrcf2.xrcf114,l_xrcf2.xrcf115,
#                l_xrcf2.xrcf123,l_xrcf2.xrcf124,l_xrcf2.xrcf125,l_xrcf2.xrcf133,l_xrcf2.xrcf134,l_xrcf2.xrcf135
#           FROM xrcf_t,xrca_t
#          WHERE xrcaent = xrcfent AND xrcald = xrcfld
#            AND xrcadocno = xrcf008 AND xrca001 = '03'
#            AND xrcfent = g_enterprise
#            AND xrcfld  = p_ld AND xrcfdocno = p_xrcadocno
#      ELSE
#         SELECT SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115),
#                SUM(xrcb123),SUM(xrcb124),SUM(xrcb125),SUM(xrcb133),SUM(xrcb134),SUM(xrcb135)
#           INTO l_xrcb1.xrcb103,l_xrcb1.xrcb104,l_xrcb1.xrcb105,
#                l_xrcb1.xrcb113,l_xrcb1.xrcb114,l_xrcb1.xrcb115,
#                l_xrcb1.xrcb123,l_xrcb1.xrcb124,l_xrcb1.xrcb125,
#                l_xrcb1.xrcb133,l_xrcb1.xrcb134,l_xrcb1.xrcb135
#           FROM xrcb_t
#          WHERE xrcbent = g_enterprise
#            AND xrcbld  = p_ld AND xrcbdocno = p_xrcadocno
#            AND xrcb001 IN ('29','26')
#            AND xrcb023 = 'Y'
#         SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),
#                SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135)
#           INTO l_xrcf2.xrcf103,l_xrcf2.xrcf104,l_xrcf2.xrcf105,l_xrcf2.xrcf113,l_xrcf2.xrcf114,l_xrcf2.xrcf115,
#                l_xrcf2.xrcf123,l_xrcf2.xrcf124,l_xrcf2.xrcf125,l_xrcf2.xrcf133,l_xrcf2.xrcf134,l_xrcf2.xrcf135
#           FROM xrcf_t,xrca_t
#          WHERE xrcaent = xrcfent AND xrcald = xrcfld
#            AND xrcadocno = xrcf008 AND xrca001 = '04'
#            AND xrcfent = g_enterprise
#            AND xrcfld  = p_ld AND xrcfdocno = p_xrcadocno
#      END IF
#      IF cl_null(l_xrcf1.xrcf103) THEN LET l_xrcf1.xrcf103 = 0 END IF      IF cl_null(l_xrcf1.xrcf104) THEN LET l_xrcf1.xrcf104 = 0 END IF         IF cl_null(l_xrcf1.xrcf105) THEN LET l_xrcf1.xrcf105 = 0 END IF
#      IF cl_null(l_xrcf1.xrcf113) THEN LET l_xrcf1.xrcf113 = 0 END IF      IF cl_null(l_xrcf1.xrcf114) THEN LET l_xrcf1.xrcf114 = 0 END IF         IF cl_null(l_xrcf1.xrcf115) THEN LET l_xrcf1.xrcf115 = 0 END IF
#      IF cl_null(l_xrcf1.xrcf123) THEN LET l_xrcf1.xrcf123 = 0 END IF      IF cl_null(l_xrcf1.xrcf124) THEN LET l_xrcf1.xrcf124 = 0 END IF         IF cl_null(l_xrcf1.xrcf125) THEN LET l_xrcf1.xrcf125 = 0 END IF
#      IF cl_null(l_xrcf1.xrcf133) THEN LET l_xrcf1.xrcf133 = 0 END IF      IF cl_null(l_xrcf1.xrcf134) THEN LET l_xrcf1.xrcf134 = 0 END IF         IF cl_null(l_xrcf1.xrcf135) THEN LET l_xrcf1.xrcf135 = 0 END IF
#      IF cl_null(l_xrcf2.xrcf103) THEN LET l_xrcf2.xrcf103 = 0 END IF      IF cl_null(l_xrcf2.xrcf113) THEN LET l_xrcf2.xrcf113 = 0 END IF
#      IF cl_null(l_xrcf2.xrcf104) THEN LET l_xrcf2.xrcf104 = 0 END IF      IF cl_null(l_xrcf2.xrcf114) THEN LET l_xrcf2.xrcf114 = 0 END IF
#      IF cl_null(l_xrcf2.xrcf105) THEN LET l_xrcf2.xrcf105 = 0 END IF      IF cl_null(l_xrcf2.xrcf115) THEN LET l_xrcf2.xrcf115 = 0 END IF
#      LET l_xrcb1.xrcb103 = l_xrcb1.xrcb103 - l_xrcf2.xrcf103
#      LET l_xrcb1.xrcb104 = l_xrcb1.xrcb104 - l_xrcf2.xrcf104
#      LET l_xrcb1.xrcb105 = l_xrcb1.xrcb105 - l_xrcf2.xrcf105
#      LET l_xrcb1.xrcb113 = l_xrcb1.xrcb113 - l_xrcf2.xrcf113
#      LET l_xrcb1.xrcb114 = l_xrcb1.xrcb114 - l_xrcf2.xrcf114
#      LET l_xrcb1.xrcb115 = l_xrcb1.xrcb115 - l_xrcf2.xrcf114
#
#      CASE
#          WHEN l_sfin2012 ='1'    #2:雜項  /1:立帳未稅
#               #IF ((p_xrcc.xrcc108 - l_xrcf1.xrcf103) >  l_xrcb1.xrcb103 AND l_xrca100 =  p_xrca.xrca100) OR     #170809-00021#1 mark
#               #   ((p_xrcc.xrcc118 - l_xrcf1.xrcf113) >  l_xrcb1.xrcb113 AND l_xrca100 <> p_xrca.xrca100) THEN   #170809-00021#1 mark
#               #因為p_xrcc.xrcc108已經是t320暫估xrcc108-109剩餘可沖金額,l_xrcf.xrcf103則是t320已沖金額,所以邏輯有誤   #170809-00021#1 add
#               IF (p_xrcc.xrcc108 >  l_xrcb1.xrcb103 AND l_xrca100 =  p_xrca.xrca100) OR     #170809-00021#1 add
#                  (p_xrcc.xrcc118 >  l_xrcb1.xrcb113 AND l_xrca100 <> p_xrca.xrca100) THEN   #170809-00021#1 add
#                  IF l_xrca100 = p_xrca.xrca100 THEN        #同幣別沖暫估
#                     LET r_xrcf.xrcf103 = l_xrcb1.xrcb103
#                     LET r_xrcf.xrcf104 = 0
#                     LET r_xrcf.xrcf105 = l_xrcb1.xrcb103
#                     LET r_xrcf.xrcf113 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                     LET r_xrcf.xrcf114 = 0
#                     LET r_xrcf.xrcf115 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                     CALL s_curr_round_ld('1',p_ld,l_glaa001,r_xrcf.xrcf113,2) RETURNING g_sub_success,g_errno,r_xrcf.xrcf113
#                     CALL s_curr_round_ld('1',p_ld,l_glaa001,r_xrcf.xrcf115,2) RETURNING g_sub_success,g_errno,r_xrcf.xrcf115
#                  ELSE                                      #不同幣別沖暫估
#                     LET r_xrcf.xrcf113 = l_xrcb1.xrcb113
#                     LET r_xrcf.xrcf114 = 0
#                     LET r_xrcf.xrcf115 = l_xrcb1.xrcb113
#                     LET r_xrcf.xrcf104 = 0
#                     CALL s_curr_round_ld('1',p_ld,l_glaa001,r_xrcf.xrcf113/r_xrcf.xrcf102,2) RETURNING g_sub_success,g_errno,r_xrcf.xrcf103 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                     CALL s_curr_round_ld('1',p_ld,l_glaa001,r_xrcf.xrcf115/r_xrcf.xrcf102,2) RETURNING g_sub_success,g_errno,r_xrcf.xrcf105 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                  END IF
#               ELSE
##170809-00021#1---mark---str--               
##                  LET r_xrcf.xrcf103 = p_xrcc.xrcc108 - l_xrcf1.xrcf103
##                  LET r_xrcf.xrcf104 = 0
##                  LET r_xrcf.xrcf105 = p_xrcc.xrcc108 - l_xrcf1.xrcf103
##                  #170419-00065#1--add--s--xul
###                  LET r_xrcf.xrcf113 = p_xrcc.xrcc118 - l_xrcf1.xrcf113
###                  LET r_xrcf.xrcf114 = 0
###                  LET r_xrcf.xrcf115 = p_xrcc.xrcc118 - l_xrcf1.xrcf113
##                  #170419-00065#1--add--e--xul
##                  #170419-00065#1--add--s--xul
##                  LET r_xrcf.xrcf113 = r_xrcf.xrcf103 * r_xrcf.xrcf102
##                  LET r_xrcf.xrcf114 = 0
##                  LET r_xrcf.xrcf115 = r_xrcf.xrcf105 * r_xrcf.xrcf102
##                  #170419-00065#1--add--e--xul
##170809-00021#1---mark---end--
#                  #170809-00021#1---add---str--
#                  LET r_xrcf.xrcf103 = p_xrcc.xrcc108
#                  LET r_xrcf.xrcf104 = 0
#                  LET r_xrcf.xrcf105 = p_xrcc.xrcc108
#                  LET r_xrcf.xrcf113 = r_xrcf.xrcf103 * r_xrcf.xrcf102
#                  LET r_xrcf.xrcf114 = 0
#                  LET r_xrcf.xrcf115 = r_xrcf.xrcf105 * r_xrcf.xrcf102
#                  #170809-00021#1---add---end--                  
#               END IF
#
#          WHEN l_sfin2012 ='2'    #2:雜項  /2:立帳含稅
#               IF (p_xrcc.xrcc108 - l_xrcf1.xrcf105) >  l_xrcb1.xrcb105 THEN
#                  #170325-00053#1--add--str--
#                  #稅别不含税，传入未税金额展算，反之，传入含税金额展算
#                  IF p_xrca.xrca013 = 'N' THEN
#                     LET l_amt = l_xrcb1.xrcb103
#                  ELSE
#                     LET l_amt = l_xrcb1.xrcb105
#                  END IF
#                  #170325-00053#1--add--end
#                  #l_glaacomp營運據點/p_oodb002稅別/p_money計稅基礎/p_num數量/p_curr幣別/p_rate匯率
##                  CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcb1.xrcb105,1,p_xrca.xrca100,p_xrca.xrca101) #170325-00053#1 mark
#                  CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_amt,1,p_xrca.xrca100,r_xrcf.xrcf102) #170325-00053#1 add #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                       RETURNING r_xrcf.xrcf103,r_xrcf.xrcf104,r_xrcf.xrcf105,
#                                 r_xrcf.xrcf113,r_xrcf.xrcf114,r_xrcf.xrcf115
#               ELSE
#                  CALL s_tax_count(l_glaacomp,p_xrca.xrca011,(p_xrcc.xrcc108 - l_xrcf1.xrcf103),1,p_xrca.xrca100,r_xrcf.xrcf102) #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
#                       RETURNING r_xrcf.xrcf103,r_xrcf.xrcf104,r_xrcf.xrcf105,
#                                 r_xrcf.xrcf113,r_xrcf.xrcf114,r_xrcf.xrcf115
#                  LET r_xrcf.xrcf115 = p_xrcc.xrcc118 - l_xrcf1.xrcf113
#               END IF
#      END CASE
#      #取得核算項資料--(S)--
#      LET l_sql = "SELECT xrcborga,",
#                  "       xrcb010,xrcb011,xrcb024,xrcb036,xrcb004,",
#                  "       xrcb051,xrcb015,xrcb016,xrcb033,xrcb034,",
#                  "       xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,",
#                  "       xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,",
#                  "       xrcb046,xrcb047,xrcb021 ",
#                  "  FROM xrcb_t",
#                  " WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
#                  "   AND xrcbdocno = '",p_xrcadocno,"' ",
#                  "   AND xrcb001 IN ('19','29','16','26') ",
#                  "   AND xrcb023 = 'Y' "
#      PREPARE s_axrp130_get_t300xrcb_p1 FROM l_sql
#      DECLARE s_axrp130_get_t300xrcb_c1 CURSOR FOR s_axrp130_get_t300xrcb_p1
#      FOREACH s_axrp130_get_t300xrcb_c1 INTO l_xrcb1.xrcborga,
#              l_xrcb1.xrcb010,l_xrcb1.xrcb011,l_xrcb1.xrcb024,l_xrcb1.xrcb036,l_xrcb1.xrcb004,
#              l_xrcb1.xrcb051,l_xrcb1.xrcb015,l_xrcb1.xrcb016,l_xrcb1.xrcb033,l_xrcb1.xrcb034,
#              l_xrcb1.xrcb035,l_xrcb1.xrcb037,l_xrcb1.xrcb038,l_xrcb1.xrcb039,l_xrcb1.xrcb040,
#              l_xrcb1.xrcb041,l_xrcb1.xrcb042,l_xrcb1.xrcb043,l_xrcb1.xrcb044,l_xrcb1.xrcb045,
#              l_xrcb1.xrcb046,l_xrcb1.xrcb047,l_xrcb1.xrcb021
#
#         IF cl_null(r_xrcf.xrcforga)THEN LET r_xrcf.xrcforga= l_xrcb1.xrcborga END IF      #來源組織
#         IF cl_null(r_xrcf.xrcf026) THEN LET r_xrcf.xrcf026 = l_xrcb1.xrcb010 END IF       #業務部門
#         IF cl_null(r_xrcf.xrcf027) THEN LET r_xrcf.xrcf027 = l_xrcb1.xrcb011 END IF       #責任中心
#         IF cl_null(r_xrcf.xrcf028) THEN LET r_xrcf.xrcf028 = l_xrcb1.xrcb024 END IF       #區域
#         IF cl_null(r_xrcf.xrcf031) THEN LET r_xrcf.xrcf031 = l_xrcb1.xrcb036 END IF       #客群
#         IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb004 END IF       #產品類別
#         IF cl_null(r_xrcf.xrcf033) THEN LET r_xrcf.xrcf033 = l_xrcb1.xrcb051 END IF       #業務人員
#         IF cl_null(r_xrcf.xrcf034) THEN LET r_xrcf.xrcf034 = l_xrcb1.xrcb015 END IF       #專案編號
#         IF cl_null(r_xrcf.xrcf035) THEN LET r_xrcf.xrcf035 = l_xrcb1.xrcb016 END IF       #WBS
#         IF cl_null(r_xrcf.xrcf036) THEN LET r_xrcf.xrcf036 = l_xrcb1.xrcb033 END IF       #經營方式
#         IF cl_null(r_xrcf.xrcf037) THEN LET r_xrcf.xrcf037 = l_xrcb1.xrcb034 END IF       #渠道
#         IF cl_null(r_xrcf.xrcf038) THEN LET r_xrcf.xrcf038 = l_xrcb1.xrcb035 END IF       #品牌
#         IF cl_null(r_xrcf.xrcf039) THEN LET r_xrcf.xrcf039 = l_xrcb1.xrcb037 END IF       #自由核算項1
#         IF cl_null(r_xrcf.xrcf040) THEN LET r_xrcf.xrcf040 = l_xrcb1.xrcb038 END IF       #自由核算項2
#         IF cl_null(r_xrcf.xrcf041) THEN LET r_xrcf.xrcf041 = l_xrcb1.xrcb039 END IF       #自由核算項3
#         IF cl_null(r_xrcf.xrcf042) THEN LET r_xrcf.xrcf042 = l_xrcb1.xrcb040 END IF       #自由核算項4
#         IF cl_null(r_xrcf.xrcf043) THEN LET r_xrcf.xrcf043 = l_xrcb1.xrcb041 END IF       #自由核算項5
#         IF cl_null(r_xrcf.xrcf044) THEN LET r_xrcf.xrcf044 = l_xrcb1.xrcb042 END IF       #自由核算項6
#         IF cl_null(r_xrcf.xrcf045) THEN LET r_xrcf.xrcf045 = l_xrcb1.xrcb043 END IF       #自由核算項7
#         IF cl_null(r_xrcf.xrcf046) THEN LET r_xrcf.xrcf046 = l_xrcb1.xrcb044 END IF       #自由核算項8
#         IF cl_null(r_xrcf.xrcf047) THEN LET r_xrcf.xrcf047 = l_xrcb1.xrcb045 END IF       #自由核算項9
#         IF cl_null(r_xrcf.xrcf048) THEN LET r_xrcf.xrcf048 = l_xrcb1.xrcb046 END IF       #自由核算項10
#         IF cl_null(r_xrcf.xrcf049) THEN LET r_xrcf.xrcf049 = l_xrcb1.xrcb047 END IF       #摘要
#         IF cl_null(r_xrcf.xrcf022) THEN LET r_xrcf.xrcf022 = l_xrcb1.xrcb021 END IF       #費用會計科目
#      END FOREACH
#      #取得核算項資料--(E)--
      #180221-00030#2 mark-e
      
      #180221-00030#2 add-s
      LET l_cnt = 0
      #計算雜項是否有可暫估金額      
      LET l_sql = "SELECT xrcb002,xrcb003,",
                  "       xrcb101,",
                  "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
                  "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135,",
                  "       xrcborga,",
                  #"       xrcb010,xrcb011,xrcb024,xrcb036,xrcb004,",    #180807-00063#1 mark
                  "       xrcb010,xrcb011,xrcb024,xrcb036,xrcb012,",     #180807-00063#1 add
                  "       xrcb051,xrcb015,xrcb016,xrcb033,xrcb034,",
                  "       xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,",
                  "       xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,",
                  "       xrcb046,xrcb047,xrcb021,xrcb020 ",  
                  "  FROM xrca_t,xrcb_t",
                  " WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
                  "   AND xrcbent = ",g_enterprise," AND xrcbld = '",p_ld,"'",
                  "   AND xrcbdocno = '",p_xrcadocno,"' ",
                  "   AND xrcb002 = '",p_xrca.xrcadocno,"' ",
                  "   AND xrcb001 IN ('19','29') AND xrcb023 = 'Y' ",
                  "   AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL "
                  
      IF l_sfin1002 = '3' THEN
         LET l_sql = l_sql," AND xrcb003 = '",p_xrcc.xrccseq,"'"
      END IF  

      PREPARE s_axrp130_get_t301xrcb_p FROM l_sql
      DECLARE s_axrp130_get_t301xrcb_c CURSOR FOR s_axrp130_get_t301xrcb_p
      FOREACH s_axrp130_get_t301xrcb_c INTO l_xrcb002,l_xrcb003,l_xrcb1.*  
 
         #取t320的資料 
         LET l_xrcf103 = 0 
         LET l_xrcf105 = 0       
         EXECUTE s_axrp130_get_xrcf105 USING l_xrcb002,l_xrcb003 INTO l_xrcf103,l_xrcf105
         IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF         
         IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF       
      
         #計算已沖金額(不含本張單沖銷的金額) 
         LET l_xrcb103 = 0
         LET l_xrcb105 = 0           
         EXECUTE s_axrp130_xrcb105p USING l_xrcb002,l_xrcb003 INTO l_xrcb103,l_xrcb105 
         IF cl_null(l_xrcb103) THEN LET l_xrcb103 = 0 END IF
         IF cl_null(l_xrcb105) THEN LET l_xrcb105 = 0 END IF
         
         #可沖餘額
         LET l_xrcb103_do = l_xrcf103 - l_xrcb103
         LET l_xrcb105_do = l_xrcf105 - l_xrcb105
         IF cl_null(l_xrcb105_do) THEN CONTINUE FOREACH END IF
         
         #抓再t300有沖過的單(以整張單的角度去抓數字)
         LET l_sql = "  SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),", 
                     "         SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135),",
                     "         xrcf009 ",
                     "    FROM xrcf_t",
                     "   WHERE xrcfent = ",g_enterprise," AND xrcfld  = ? AND xrcfdocno <> ?  ",
                     "     AND xrcf008 = ? ",
                     "   GROUP BY xrcf009",            
                     "     AND xrcfdocno NOT IN (SELECT xrcadocno FROM xrca_t WHERE xrcaent= ",g_enterprise,
                     "     AND xrcald= ? ",
                     "     AND xrcastus<>'X')"
         PREPARE s_axrp130_get_xrcf4p FROM l_sql
         EXECUTE s_axrp130_get_xrcf4p USING p_ld,p_xrcadocno,p_xrca.xrcadocno,p_ld INTO l_xrcf2.*   
         IF cl_null(l_xrcf2.xrcf103) THEN LET l_xrcf2.xrcf103 = 0 END IF
         IF cl_null(l_xrcf2.xrcf104) THEN LET l_xrcf2.xrcf104 = 0 END IF
         IF cl_null(l_xrcf2.xrcf105) THEN LET l_xrcf2.xrcf105 = 0 END IF
         IF cl_null(l_xrcf2.xrcf113) THEN LET l_xrcf2.xrcf113 = 0 END IF
         IF cl_null(l_xrcf2.xrcf114) THEN LET l_xrcf2.xrcf114 = 0 END IF
         IF cl_null(l_xrcf2.xrcf115) THEN LET l_xrcf2.xrcf115 = 0 END IF
         IF cl_null(l_xrcf2.xrcf123) THEN LET l_xrcf2.xrcf123 = 0 END IF
         IF cl_null(l_xrcf2.xrcf124) THEN LET l_xrcf2.xrcf124 = 0 END IF
         IF cl_null(l_xrcf2.xrcf125) THEN LET l_xrcf2.xrcf125 = 0 END IF
         IF cl_null(l_xrcf2.xrcf133) THEN LET l_xrcf2.xrcf133 = 0 END IF
         IF cl_null(l_xrcf2.xrcf134) THEN LET l_xrcf2.xrcf134 = 0 END IF
         IF cl_null(l_xrcf2.xrcf135) THEN LET l_xrcf2.xrcf135 = 0 END IF
         
         
         #核算項填入
         IF cl_null(r_xrcf.xrcforga)THEN LET r_xrcf.xrcforga= l_xrcb1.xrcborga END IF      #來源組織
         IF cl_null(r_xrcf.xrcf026) THEN LET r_xrcf.xrcf026 = l_xrcb1.xrcb010 END IF       #業務部門
         IF cl_null(r_xrcf.xrcf027) THEN LET r_xrcf.xrcf027 = l_xrcb1.xrcb011 END IF       #責任中心
         IF cl_null(r_xrcf.xrcf028) THEN LET r_xrcf.xrcf028 = l_xrcb1.xrcb024 END IF       #區域
         IF cl_null(r_xrcf.xrcf031) THEN LET r_xrcf.xrcf031 = l_xrcb1.xrcb036 END IF       #客群
         #IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb004 END IF       #產品類別     #180807-00063#1 mark
         IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb012 END IF       #產品類別      #180807-00063#1 add
         IF cl_null(r_xrcf.xrcf033) THEN LET r_xrcf.xrcf033 = l_xrcb1.xrcb051 END IF       #業務人員
         IF cl_null(r_xrcf.xrcf034) THEN LET r_xrcf.xrcf034 = l_xrcb1.xrcb015 END IF       #專案編號
         IF cl_null(r_xrcf.xrcf035) THEN LET r_xrcf.xrcf035 = l_xrcb1.xrcb016 END IF       #WBS
         IF cl_null(r_xrcf.xrcf036) THEN LET r_xrcf.xrcf036 = l_xrcb1.xrcb033 END IF       #經營方式
         IF cl_null(r_xrcf.xrcf037) THEN LET r_xrcf.xrcf037 = l_xrcb1.xrcb034 END IF       #渠道
         IF cl_null(r_xrcf.xrcf038) THEN LET r_xrcf.xrcf038 = l_xrcb1.xrcb035 END IF       #品牌
         IF cl_null(r_xrcf.xrcf039) THEN LET r_xrcf.xrcf039 = l_xrcb1.xrcb037 END IF       #自由核算項1
         IF cl_null(r_xrcf.xrcf040) THEN LET r_xrcf.xrcf040 = l_xrcb1.xrcb038 END IF       #自由核算項2
         IF cl_null(r_xrcf.xrcf041) THEN LET r_xrcf.xrcf041 = l_xrcb1.xrcb039 END IF       #自由核算項3
         IF cl_null(r_xrcf.xrcf042) THEN LET r_xrcf.xrcf042 = l_xrcb1.xrcb040 END IF       #自由核算項4
         IF cl_null(r_xrcf.xrcf043) THEN LET r_xrcf.xrcf043 = l_xrcb1.xrcb041 END IF       #自由核算項5
         IF cl_null(r_xrcf.xrcf044) THEN LET r_xrcf.xrcf044 = l_xrcb1.xrcb042 END IF       #自由核算項6
         IF cl_null(r_xrcf.xrcf045) THEN LET r_xrcf.xrcf045 = l_xrcb1.xrcb043 END IF       #自由核算項7
         IF cl_null(r_xrcf.xrcf046) THEN LET r_xrcf.xrcf046 = l_xrcb1.xrcb044 END IF       #自由核算項8
         IF cl_null(r_xrcf.xrcf047) THEN LET r_xrcf.xrcf047 = l_xrcb1.xrcb045 END IF       #自由核算項9
         IF cl_null(r_xrcf.xrcf048) THEN LET r_xrcf.xrcf048 = l_xrcb1.xrcb046 END IF       #自由核算項10
         IF cl_null(r_xrcf.xrcf049) THEN LET r_xrcf.xrcf049 = l_xrcb1.xrcb047 END IF       #摘要
         IF cl_null(r_xrcf.xrcf022) THEN LET r_xrcf.xrcf022 = l_xrcb1.xrcb021 END IF       #費用會計科目 
         
         CASE
            WHEN l_sfin2012 ='1'    #1:雜項/1:立帳不含稅
               LET l_cnt = l_cnt +1 
               #t300這次要沖的暫估未稅額 <= (t320立暫估數-t300不含本張沖暫估未稅額)
               IF l_xrcb1.xrcb103 <= l_xrcb103_do THEN
                  LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb1.xrcb103
                  LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                  LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb1.xrcb103
               ELSE
                  #超沖則用剩餘可沖金額去寫入
                  LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb103_do
                  LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                  LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb103_do
               END IF 
               #本幣要等於原幣*原立暫估重評匯率
               LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * l_xrcc102    
               LET l_xrcf_tmp[l_cnt].xrcf114 = 0
               LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf103 * l_xrcc102     
               #170930-00022#1 add(s)
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf114
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
               #t301原幣加總
               LET g_sum = l_xrcf_tmp[l_cnt].xrcf103 + g_sum
               #t301本幣加總
               LET g_sum1 = l_xrcf_tmp[l_cnt].xrcf113 + g_sum1
               #如果t301與t320本幣相同，且原幣有差異，就將差異的本幣金額攤到最後一筆上
               IF g_sum = p_xrcc.xrcc108  OR (g_sum + l_xrcf2.xrcf103 = p_xrcc.xrcc108) THEN
                  LET l_diff = (g_sum1 + l_xrcf2.xrcf113) - l_sum1
                  LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf113 - l_diff
                  LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf113
               END IF
               #170930-00022#1 add(e)
            WHEN l_sfin2012 ='2'    #1:雜項/2:立帳含稅
               LET l_cnt = l_cnt +1 
               #t300這次要沖的暫估數 <= (t320立暫估數-t300不含本張沖暫估數)
               IF l_xrcb1.xrcb105 <= l_xrcb105_do THEN
                  LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb1.xrcb103
                  LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcb1.xrcb104
                  LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb1.xrcb105   
               ELSE
                  #超沖則用剩餘可沖金額去寫入
                  LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb103_do
                  LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcb105_do - l_xrcb103_do
                  LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb105_do
               END IF 
               #本幣要等於原幣*原立暫估重評匯率
               LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * l_xrcc102    
               LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf_tmp[l_cnt].xrcf104 * l_xrcc102    
               LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * l_xrcc102      
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf114
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
               #t301原幣加總
               LET g_sum = l_xrcf_tmp[l_cnt].xrcf105 + g_sum
               #t301本幣加總
               LET g_sum1 = l_xrcf_tmp[l_cnt].xrcf115 + g_sum1
               #如果t301與t320本幣相同，且原幣有差異，就將差異的本幣金額攤到最後一筆上
               IF g_sum = p_xrcc.xrcc108 OR (g_sum + l_xrcf2.xrcf105 = p_xrcc.xrcc108) THEN
                  LET l_diff = (g_sum1 + l_xrcf2.xrcf115) - l_sum1
                  LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf115 - l_diff
               END IF
               LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcf_tmp[l_cnt].xrcf105 - l_xrcf_tmp[l_cnt].xrcf103
               LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf_tmp[l_cnt].xrcf115 - l_xrcf_tmp[l_cnt].xrcf113
               LET l_xrcf_tmp[l_cnt].xrcf124 = l_xrcf_tmp[l_cnt].xrcf125 - l_xrcf_tmp[l_cnt].xrcf123
               LET l_xrcf_tmp[l_cnt].xrcf134 = l_xrcf_tmp[l_cnt].xrcf135 - l_xrcf_tmp[l_cnt].xrcf133
         END CASE
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf114
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
      END FOREACH
      LET r_xrcf.xrcf007 = 1     #180227-00030#1 add 雜項用金額看,數量給1
      LET r_xrcf.xrcf103 = 0     LET r_xrcf.xrcf113 = 0      
      LET r_xrcf.xrcf104 = 0     LET r_xrcf.xrcf114 = 0
      LET r_xrcf.xrcf105 = 0     LET r_xrcf.xrcf115 = 0 
      FOR l_i = 1 TO l_xrcf_tmp.getLength()
         LET r_xrcf.xrcf103 = r_xrcf.xrcf103 + l_xrcf_tmp[l_i].xrcf103
         LET r_xrcf.xrcf104 = r_xrcf.xrcf104 + l_xrcf_tmp[l_i].xrcf104
         LET r_xrcf.xrcf105 = r_xrcf.xrcf105 + l_xrcf_tmp[l_i].xrcf105
         LET r_xrcf.xrcf113 = r_xrcf.xrcf113 + l_xrcf_tmp[l_i].xrcf113
         LET r_xrcf.xrcf114 = r_xrcf.xrcf114 + l_xrcf_tmp[l_i].xrcf114
         LET r_xrcf.xrcf115 = r_xrcf.xrcf115 + l_xrcf_tmp[l_i].xrcf115
      END FOR            
      #180221-00030#2 add-e
   END IF
   {p_type2:雜項--E--}
   IF p_type <> '1' THEN #170410-00053#1 add 
   LET r_xrcf.xrcfent = g_enterprise
   LET r_xrcf.xrcfld  = p_ld
   LET r_xrcf.xrcfdocno=p_xrcadocno
 
   #IF p_type <> '1' THEN #170410-00053#1 add  
   SELECT MAX(xrcfseq) + 1 INTO r_xrcf.xrcfseq
     FROM xrcf_t
    WHERE xrcfent = g_enterprise AND xrcfld = p_ld
      AND xrcfdocno=p_xrcadocno
   IF cl_null(r_xrcf.xrcfseq) THEN LET r_xrcf.xrcfseq = 1 END IF
   ##170410-00053#1 add s---
   #ELSE
   #   LET r_xrcf.xrcfseq = 0        
   #END IF  
   #170410-00053#1 add e---
   
   LET r_xrcf.xrcfseq2 = 0
   LET r_xrcf.xrcf001 = 'axrt300'
   LET r_xrcf.xrcf002 = '01'                 #固定值
   LET r_xrcf.xrcf008 = p_xrca.xrcadocno
   LET r_xrcf.xrcf009 = p_xrcc.xrccseq
   LET r_xrcf.xrcf010 = 0   #p_xrcc.xrcc001       #期別:暫估原則上只有一期
  #LET r_xrcf.xrcf020 = p_xrca.xrca011       #稅別   #160506-00008#1 Mark
  #160506-00008#1 Add  ---(S)---
   SELECT xrca011 INTO l_xrca011 FROM xrca_t WHERE xrcaent = g_enterprise
      AND xrcald = p_ld
      AND xrcadocno = p_xrcadocno
   LET r_xrcf.xrcf020 = l_xrca011
  #160506-00008#1 Add  ---(E)---
  #160823-00027#1 Mark ---(S)---
  #IF l_sfin2011 = 'N' THEN      #不迴轉(Y代表回转。N不回转:抓xrcf)
  #   LET r_xrcf.xrcf021 = p_xrca.xrca035
  #   LET r_xrcf.xrcf022 = p_xrca.xrca036
  #   CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8304_03') RETURNING g_sub_success,r_xrcf.xrcf023,g_errno   #160816-00014#1 Mod 8504_08 --> 8304_03
  #ELSE
  #160823-00027#1 Mark ---(E)---
  #160816-00014#1 Add  ---(S)---
   SELECT xrca035 INTO l_xrca035 FROM xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcald = p_xrca.xrcald AND xrcadocno= p_xrca.xrcadocno
  #160816-00014#1 Add  ---(E)---
      #LET r_xrcf.xrcf021 = l_xrca035  #180510-00021#1 mark   
      #180510-00021#1 add s---
      IF l_sfin2011 = 'Y' THEN 
         LET r_xrcf.xrcf021 = l_xrca035 
      #180510-00021#1 add s--   
      ELSE   
         LET r_xrcf.xrcf021 = l_xrca035
         IF l_sfin1002 = '3' THEN
            SELECT xrcb029 INTO r_xrcf.xrcf021
              FROM xrcb_t
             WHERE xrcbent = g_enterprise
               AND xrcbld = p_ld
               AND xrcbdocno = p_xrca.xrcadocno
               AND xrcbseq = p_xrcc.xrccseq
         END IF
      END IF   
      #180510-00021#1 add e---      
      SELECT glac007 INTO l_glac007       #取得科目性質
        #FROM glac_t,glaa_t  #181001-00015#77  mark
        FROM glac_t  #181001-00015#77  add
       WHERE glacent = g_enterprise AND glac001 = l_glaa004 AND glac002 = l_xrca036  
      SELECT xrcadocdt INTO l_xrcadocdt1  #立帳單的立帳日期
        FROM xrca_t
       WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrcadocno
       SELECT xrcadocdt INTO l_xrcadocdt2 #暫估單的立帳日期
        FROM xrca_t
       WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrca.xrcadocno
      #當期沖暫估的科目及資產類科目
      IF l_glac007 NOT MATCHES '[45]' OR (YEAR(l_xrcadocdt1) = YEAR(l_xrcadocdt2) AND MONTH(l_xrcadocdt1) = MONTH(l_xrcadocdt2)) THEN
         LET r_xrcf.xrcf022 = p_xrca.xrca036
      ELSE
         LET r_xrcf.xrcf022 = l_xrca036
      END IF
      CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_03')  RETURNING g_sub_success,r_xrcf.xrcf023,g_errno   #160816-00014#1 Mod 8504_04 --> 8304_03
  #END IF      #160823-00027#1 Mark
   CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_11') RETURNING g_sub_success,r_xrcf.xrcf024,g_errno
   CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_12') RETURNING g_sub_success,r_xrcf.xrcf025,g_errno
   END IF #170410-00053#1 add
    
   
   RETURN r_flag,r_xrcf.*,l_xrcf_tmp

END FUNCTION

################################################################################
# Descriptions...: 应收冲暂估明细档
# Memo...........:
# Usage..........: CALL s_axrp130_ins_xrcf_diff(p_type,p_ld,p_xrcadocno,p_xrcf_tmp)

# Input parameter: p_type           选取类型
#                : p_ld             账别
#                : p_xrcadocno      立账单据
#                : p_xrcf_tmp       应收冲暂估明细档
# Return code....: 无
#                : 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#59 By 09505
################################################################################
PUBLIC FUNCTION s_axrp130_ins_xrcf_diff(p_type,p_ld,p_xrcadocno,p_xrcf_tmp)
DEFINE p_type        LIKE type_t.chr1
DEFINE p_ld          LIKE xrca_t.xrcald      #帳別
DEFINE p_xrcadocno   LIKE xrca_t.xrcadocno   #立帳單據
DEFINE p_xrcf_tmp    DYNAMIC ARRAY OF type_xrcf_tmp
#161212-00005#2---add---begin--------------------
#DEFINE l_xrcf        RECORD LIKE xrcf_t.*
DEFINE l_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD
#161212-00005#2---add---end--------------------

DEFINE l_sql         STRING
DEFINE l_xrca007     LIKE xrca_t.xrca007
DEFINE l_xrca101     LIKE xrca_t.xrca101
DEFINE l_xrca100     LIKE xrca_t.xrca100
DEFINE l_glaacomp    LIKE glaa_t.glaacomp
DEFINE l_glaa001     LIKE glaa_t.glaa001
DEFINE l_xrcf106     LIKE xrcf_t.xrcf106
DEFINE l_xrcf116     LIKE xrcf_t.xrcf116
DEFINE l_i,l_cnt     LIKE type_t.num5
DEFINE l_xrcb113     LIKE xrcb_t.xrcb105
DEFINE l_xrcb123     LIKE xrcb_t.xrcb105
DEFINE l_xrcb133     LIKE xrcb_t.xrcb105
DEFINE l_xrcf101     LIKE xrcf_t.xrcf101
DEFINE l_xrcf111     LIKE xrcf_t.xrcf111
DEFINE l_xrcf113     LIKE xrcf_t.xrcf113
DEFINE l_xrcf123     LIKE xrcf_t.xrcf123
DEFINE l_xrcf133     LIKE xrcf_t.xrcf133
DEFINE l_xrcf1131    LIKE xrcf_t.xrcf113
DEFINE l_xrcf1231    LIKE xrcf_t.xrcf123
DEFINE l_xrcf1331    LIKE xrcf_t.xrcf133
DEFINE l_sfin2011    LIKE type_t.chr1        #迴轉否
DEFINE l_sfin2012    LIKE type_t.chr1
#190807-00032#1 add -s
DEFINE l_xrca004     LIKE xrca_t.xrca004
DEFINE l_xrca005     LIKE xrca_t.xrca005
#190807-00032#1 add -e

   WHENEVER ERROR CONTINUE

   CALL s_ld_sel_glaa(p_ld,'glaacomp|glaa001')
        RETURNING  g_sub_success,l_glaacomp,l_glaa001
   #180507-00028#1 mark-s
#   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2011') RETURNING l_sfin2011
#   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING l_sfin2012
   #180507-00028#1 mark-e
  #IF l_sfin2011 = 'N' THEN LET l_sfin2012 = '1' END IF       #160823-00027#1 Mark
   #180507-00028#1 add-s
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2012') RETURNING l_sfin2012
   #180507-00028#1 add-e

   SELECT xrca007,xrca101,xrca100
          ,xrca004,xrca005              #190807-00032#1 add
     INTO l_xrca007,l_xrca101,l_xrca100
          ,l_xrca004,l_xrca005          #190807-00032#1 add
     FROM xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcald  = p_ld AND xrcadocno = p_xrcadocno

   SELECT count(*) INTO l_cnt
     FROM xrcf_t,xrca_t
    WHERE xrcaent = xrcfent AND xrcald = xrcfld AND xrcadocno = xrcf008
      AND xrcfent = g_enterprise
      AND xrcfld  = p_ld AND xrcfdocno = p_xrcadocno
      AND xrca001 IN ('01','02','03','04')
   IF l_cnt = 0 THEN #若無0*單據不沖暫估
      RETURN
   END IF

   INITIALIZE l_xrcf.* TO NULL
   LET l_xrcf.xrcfent = g_enterprise
   LET l_xrcf.xrcfld  = p_ld
   LET l_xrcf.xrcforga=l_glaacomp
   #add by lixwz210524 s---
   #冲暂估差异，如果单身暂估单来源是同一营运中心，优先取单身营运中心
   SELECT count(unique xrcborga ) INTO l_cnt from xrca_t 
    where xrcadocno = p_xrcadocno and xrcaent = g_enterprise
      AND xrcfld = p_ld
   IF l_cnt = 1 THEN
      SELECT unique xrcborga INTO l_xrcf.xrcforga from xrca_t 
      where xrcadocno = p_xrcadocno and xrcaent = g_enterprise
      AND xrcfld = p_ld
      IF cl_null(l_xrcf.xrcforga) THEN
         LET l_xrcf.xrcforga=l_glaacomp
      END IF
   END IF
   #add by lixwz210524 e---
   LET l_xrcf.xrcfdocno=p_xrcadocno
   LET l_xrcf.xrcfseq2 = 0
   LET l_xrcf.xrcf001 = 'axrt300'
   LET l_xrcf.xrcf002 = '01'              #固定值
   LET l_xrcf.xrcf007 = 1
   LET l_xrcf.xrcf008 = 'DIFF'  
   LET l_xrcf.xrcf009 = 0
   LET l_xrcf.xrcf010 = 0
   LET l_xrcf.xrcf020 = ''
   LET l_xrcf.xrcf022 = ''
   LET l_xrcf.xrcf023 = ''
   LET l_xrcf.xrcf024 = ''
   LET l_xrcf.xrcf025 = ''
   LET l_xrcf.xrcf022 = ''
   #190807-00032#1 add -s
   #交易客商
   LET l_xrcf.xrcf029 = l_xrca005
   #帳款客商
   LET l_xrcf.xrcf030 = l_xrca004
   #190807-00032#1 add -e
   LET l_xrcf.xrcf101 = 0
   LET l_xrcf.xrcf104 = 0
   LET l_xrcf.xrcf106 = 0
   LET l_xrcf.xrcf111 = 0
   LET l_xrcf.xrcf114 = 0
   LET l_xrcf.xrcf116 = 0
   LET l_xrcf.xrcf117 = 0
   CASE p_type
        WHEN  '1'
               #產生價差數據---(S)---
               LET l_xrcf101 = 0
               LET l_xrcf111 = 0
               CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_11') RETURNING g_sub_success,l_xrcf.xrcf021,g_errno
               LET l_xrcf.xrcf102 = l_xrca101  #180807-00065#1 mark  #180917-00020#1 remark #价差汇率取立账单汇率
               SELECT MAX(xrcfseq) + 1 INTO l_xrcf.xrcfseq
                 FROM xrcf_t
                WHERE xrcfent = g_enterprise AND xrcfld = p_ld
                 AND xrcfdocno=p_xrcadocno
               IF cl_null(l_xrcf.xrcfseq) THEN LET l_xrcf.xrcfseq = 1 END IF
               FOR l_i = 1 TO p_xrcf_tmp.getLength()
                  LET l_xrcf101 = p_xrcf_tmp[l_i].xrcf106
                  LET l_xrcf111 = p_xrcf_tmp[l_i].xrcf116
                  IF cl_null(l_xrcf101) THEN LET l_xrcf101 = 0 END IF
                  IF cl_null(l_xrcf111) THEN LET l_xrcf111 = 0 END IF
                  IF p_xrcf_tmp[l_i].xrca001 MATCHES '0[24]' THEN
                     LET l_xrcf101 = l_xrcf101 * -1
                     LET l_xrcf111 = l_xrcf111 * -1
                  END IF
                  LET l_xrcf.xrcf101 = l_xrcf.xrcf101 + l_xrcf101
                  LET l_xrcf.xrcf111 = l_xrcf.xrcf111 + l_xrcf111
               END FOR
               
               LET l_xrcf.xrcf103 = l_xrcf.xrcf007 * l_xrcf.xrcf101
               CALL s_curr_round_ld('1',p_ld,l_xrca100,l_xrcf.xrcf103,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf103
               CALL s_curr_round_ld('1',p_ld,l_xrca100,l_xrcf.xrcf103,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf103
               LET l_xrcf.xrcf105 = l_xrcf.xrcf103
               LET l_xrcf.xrcf113 = l_xrcf.xrcf007 * l_xrcf.xrcf111
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf.xrcf113,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf113
               LET l_xrcf.xrcf115 = l_xrcf.xrcf113
               #180917-00020#1 mark -s
#               #180807-00065#1 add s---#账款单性质＝D1:价差时，xrcf102汇率栏位需要反推
#               LET l_xrcf.xrcf102 = l_xrcf.xrcf115 / l_xrcf.xrcf105
#               CALL s_curr_round_ld('1',p_ld,l_xrca100,l_xrcf.xrcf102,3) RETURNING g_sub_success,g_errno,l_xrcf.xrcf102
#               #180807-00065#1 add e---
               #180917-00020#1 mark -e
               IF NOT (l_xrcf.xrcf103 = 0 AND l_xrcf.xrcf113 = 0) THEN
                  LET l_xrcf.xrcf002 = 'D1'  #170603-00037#1 add 價差類型D1
                  #161212-00005#2---add---begin--------------------
                  #INSERT INTO xrcf_t VALUES(l_xrcf.*)
                                    INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                                      xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                                      xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                                      xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                                      xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                                      xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                                      xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                                      xrcf135,xrcf136,xrcf137)
                   VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                          l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                          l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                          l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                          l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                          l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                          l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                          l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
                  #161212-00005#2---add---end--------------------
               END IF
               #產生價差數據---(E)---

               #產生匯差數據---(S)---
#               LET l_xrcf.xrcf102 = 1  #180917-00020#1 mark
               LET l_xrcf.xrcf102 = l_xrca101  #180917-00020#1 add #汇差汇率取立账单汇率
               LET l_xrcf.xrcf103 = 0
               LET l_xrcf.xrcf105 = 0
               LET l_xrcf.xrcf106 = 0
               LET l_xrcf.xrcf111 = 0
               LET l_xrcf.xrcf113 = 0
               LET l_xrcf.xrcf115 = 0
               LET l_xrcf.xrcf116 = 0
               CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_12') RETURNING g_sub_success,l_xrcf.xrcf021,g_errno
               SELECT MAX(xrcfseq) + 1 INTO l_xrcf.xrcfseq
                 FROM xrcf_t
                WHERE xrcfent = g_enterprise AND xrcfld = p_ld
                  AND xrcfdocno=p_xrcadocno
               IF cl_null(l_xrcf.xrcfseq) THEN LET l_xrcf.xrcfseq = 1 END IF
#               IF l_xrca101 > 1 THEN  #170929-00010#5 #临时调整： axrt320 單頭匯率 > 1 才考虑汇差问题   #181127-00061#1--mark
                  FOR l_i = 1 TO p_xrcf_tmp.getLength()
                     IF p_xrcf_tmp[l_i].xrcf117 <> 0 THEN
                        IF p_xrcf_tmp[l_i].xrca001 MATCHES '0[24]' THEN
                           LET p_xrcf_tmp[l_i].xrcf117 = p_xrcf_tmp[l_i].xrcf117 * -1
                           LET p_xrcf_tmp[l_i].xrcf107 = p_xrcf_tmp[l_i].xrcf107 * -1
                        END IF
                        LET l_xrcf.xrcf111 = l_xrcf.xrcf111 + p_xrcf_tmp[l_i].xrcf117
                        LET l_xrcf.xrcf103 = l_xrcf.xrcf103 + p_xrcf_tmp[l_i].xrcf107
                      END IF
                  END FOR
#               END IF   #170929-00010#5  #181127-00061#1--mark
               LET l_xrcf.xrcf113 = l_xrcf.xrcf007 * l_xrcf.xrcf111
               #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf.xrcf103,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf103 #170531-00025#1 mark
               CALL s_curr_round_ld('1',p_ld,l_xrca100,l_xrcf.xrcf103,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf103  #170531-00025#1 add
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf.xrcf113,1) RETURNING g_sub_success,g_errno,l_xrcf.xrcf113
               LET l_xrcf.xrcf105 = l_xrcf.xrcf103 #170531-00025#1 add
               LET l_xrcf.xrcf115 = l_xrcf.xrcf113
               IF l_xrcf.xrcf111 <> 0 THEN
                  LET l_xrcf.xrcf002 = 'D2'  #170603-00037#1 add 匯差類型D2
                  #161212-00005#2---add---begin--------------------
                  #INSERT INTO xrcf_t VALUES(l_xrcf.*)
                  INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                                      xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                                      xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                                      xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                                      xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                                      xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                                      xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                                      xrcf135,xrcf136,xrcf137)
                   VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                          l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                          l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                          l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                          l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                          l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                          l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                          l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
                  #161212-00005#2---add---end--------------------
               END IF
               #產生匯差數據---(E)---
        WHEN '2'
               #產生雜項沖暫估150203---(S)
               LET l_cnt = 0
               SELECT count(*) INTO l_cnt
                 FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = p_ld AND xrcbdocno = p_xrcadocno
                  AND xrcb023 = 'Y' AND xrcb001 IN ('19','29','16','26')
               IF l_cnt = 0 THEN
                  RETURN
               END IF

               SELECT MAX(xrcfseq) + 1 INTO l_xrcf.xrcfseq
                   FROM xrcf_t
                   WHERE xrcfent = g_enterprise AND xrcfld = p_ld
                    AND xrcfdocno=p_xrcadocno
               IF cl_null(l_xrcf.xrcfseq) THEN LET l_xrcf.xrcfseq = 1 END IF
               CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_11') RETURNING g_sub_success,l_xrcf.xrcf021,g_errno
               LET l_xrcf.xrcf102 = l_xrca101
               #IF l_sfin2012 = '1' THEN   #180507-00028#1 mark (汇差金额使用未税金额计算，)
                  #那就是xrcf113/xrcf115和aapt320的金额比对
                  SELECT SUM(xrcf113),SUM(xrcf123),SUM(xrcf133)
                    INTO l_xrcf113,l_xrcf123,l_xrcf133
                    FROM xrcf_t,xrca_t
                   WHERE xrcfent = xrcaent AND xrcfld = xrcald AND xrcadocno = xrcf008
                     AND xrcfent = g_enterprise
                     AND xrcfld  = p_ld AND xrcfdocno=p_xrcadocno
                     AND xrca001 = '03'

                  SELECT SUM(xrcf113)*-1,SUM(xrcf123)*-1,SUM(xrcf133) *-1
                    INTO l_xrcf1131,l_xrcf1231,l_xrcf1331
                    FROM xrcf_t,xrca_t
                   WHERE xrcfent = xrcaent AND xrcfld = xrcald AND xrcadocno = xrcf008
                     AND xrcfent = g_enterprise
                     AND xrcfld  = p_ld AND xrcfdocno=p_xrcadocno
                     AND xrca001 = '04'

                  SELECT SUM(xrcb113*xrcb022),SUM(xrcb123*xrcb022),SUM(xrcb133*xrcb022)
                    INTO l_xrcb113,l_xrcb123,l_xrcb133
                    FROM xrcb_t
                   WHERE xrcbent = g_enterprise
                     AND xrcbld  = p_ld AND xrcbdocno=p_xrcadocno
                     AND xrcb023 = 'Y' AND xrcb001 IN ('19','29','16','26')
               #180507-00028#1 mark (汇差金额使用未税金额计算，)
#               ELSE  
#                  #那就是xrcf113/xrcf115和aapt320的金额比对
#                  SELECT SUM(xrcf115),SUM(xrcf125),SUM(xrcf135)
#                    INTO l_xrcf113,l_xrcf123,l_xrcf133
#                    FROM xrcf_t,xrca_t
#                   WHERE xrcfent = xrcaent AND xrcfld = xrcald AND xrcadocno = xrcf008
#                     AND xrcfent = g_enterprise
#                     AND xrcfld  = p_ld AND xrcfdocno=p_xrcadocno
#                     AND xrca001 = '03'
#
#                  SELECT SUM(xrcf115)*-1,SUM(xrcf125)*-1,SUM(xrcf135) *-1
#                    INTO l_xrcf1131,l_xrcf1231,l_xrcf1331
#                    FROM xrcf_t,xrca_t
#                   WHERE xrcfent = xrcaent AND xrcfld = xrcald AND xrcadocno = xrcf008
#                     AND xrcfent = g_enterprise
#                     AND xrcfld  = p_ld AND xrcfdocno=p_xrcadocno
#                     AND xrca001 = '04'
#
#                  SELECT SUM(xrcb115*xrcb022),SUM(xrcb125*xrcb022),SUM(xrcb135*xrcb022)
#                    INTO l_xrcb113,l_xrcb123,l_xrcb133
#                    FROM xrcb_t
#                   WHERE xrcbent = g_enterprise
#                     AND xrcbld  = p_ld AND xrcbdocno=p_xrcadocno
#                     AND xrcb023 = 'Y' AND xrcb001 IN ('19','29','16','26')
#               END IF
               #180507-00028#1 mark (汇差金额使用未税金额计算，)
               IF cl_null(l_xrcf113)  THEN LET l_xrcf113 = 0 END IF
               IF cl_null(l_xrcf123)  THEN LET l_xrcf123 = 0 END IF
               IF cl_null(l_xrcf133)  THEN LET l_xrcf133 = 0 END IF
               IF cl_null(l_xrcf1131) THEN LET l_xrcf1131= 0 END IF
               IF cl_null(l_xrcf1231) THEN LET l_xrcf1231= 0 END IF
               IF cl_null(l_xrcf1331) THEN LET l_xrcf1331= 0 END IF
               IF cl_null(l_xrcb113)  THEN LET l_xrcb113 = 0 END IF
               IF cl_null(l_xrcb123)  THEN LET l_xrcb123 = 0 END IF
               IF cl_null(l_xrcb133)  THEN LET l_xrcb133 = 0 END IF
               LET l_xrcf113 = l_xrcf113 + l_xrcf1131
               LET l_xrcf123 = l_xrcf123 + l_xrcf1231
               LET l_xrcf133 = l_xrcf133 + l_xrcf1331

               LET l_xrcf.xrcf113 = l_xrcb113 - l_xrcf113
               LET l_xrcf.xrcf114 = 0
               LET l_xrcf.xrcf115 = l_xrcf.xrcf113          #含稅未稅相同
               LET l_xrcf.xrcf123 = l_xrcb123 - l_xrcf123
               LET l_xrcf.xrcf124 = 0
               LET l_xrcf.xrcf125 = l_xrcf.xrcf113
               LET l_xrcf.xrcf133 = l_xrcb133 - l_xrcf133
               LET l_xrcf.xrcf134 = 0
               LET l_xrcf.xrcf135 = l_xrcf.xrcf133
               #LET l_xrcf.xrcf103 = l_xrcf.xrcf113    #180507-00028#1 mark
               LET l_xrcf.xrcf103 = 0  #180507-00028#1 add
               LET l_xrcf.xrcf104 = 0
               #LET l_xrcf.xrcf105 = l_xrcf.xrcf115    #180507-00028#1 mark
               LET l_xrcf.xrcf105 = 0    #180507-00028#1 add 
               #180507-00028#1 add-s
               #axri011取预设科目
               SELECT glab005 INTO l_xrcf.xrcf021 FROM glab_t
                WHERE glabent=g_enterprise AND glabld=p_ld AND glab001='13' AND glab003='8304_12'
                  AND glab002 IN (SELECT xrca007 FROM xrca_t 
                                   WHERE xrcaent=g_enterprise 
                                     AND xrcald=p_ld 
                                     AND xrcadocno=p_xrcadocno)
               #180507-00028#1 add-e

               IF NOT l_xrcf.xrcf115 = 0  THEN
                  #161212-00005#2---add---begin--------------------
                  #INSERT INTO xrcf_t VALUES(l_xrcf.*)
                  let l_xrcf.xrcf002='D2' #180221-00030#2
                  INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                                      xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                                      xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                                      xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                                      xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                                      xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                                      xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                                      xrcf135,xrcf136,xrcf137)
                   VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                          l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                          l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                          l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                          l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                          l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                          l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                          l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
                  #161212-00005#2---add---end-----------------
               END IF
   END CASE

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
PUBLIC FUNCTION s_axrp130_get_glab(p_glabld,p_glab001,p_glab002,p_glab003)
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
# Descriptions...: 暫估金額是否平衡
# Memo...........:
# Usage..........: CALL s_axrp130_xrcf_amt_chk(p_ld,p_docno)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axrp130_xrcf_amt_chk(p_ld,p_docno)
DEFINE p_ld          LIKE xrca_t.xrcald
DEFINE p_docno       LIKE xrca_t.xrcadocno
DEFINE r_success     LIKE type_t.num5        #处理状态TRUE/FALSE
DEFINE r_errno       LIKE gzze_t.gzze001
DEFINE l_sfin2011    LIKE type_t.chr1        #迴轉否
DEFINE l_sfin2012    LIKE type_t.chr1        #含稅立帳否
DEFINE l_xrcb113     LIKE xrcb_t.xrcb103
DEFINE l_xrcb115     LIKE xrcb_t.xrcb105
DEFINE l_apcf113     LIKE apcf_t.apcf103
DEFINE l_apcf115     LIKE apcf_t.apcf103
DEFINE l_glaacomp    LIKE glaa_t.glaacomp

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_errno = ''
   CALL s_ld_sel_glaa(p_ld,'glaacomp')
        RETURNING g_sub_success,l_glaacomp
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2012') RETURNING l_sfin2012
  #IF l_sfin2011 = 'N' THEN LET l_sfin2012 = '1' END IF  #1.立帳不含稅    #160823-00027#1 Mark
   SELECT SUM(xrcb113),SUM(xrcb115) INTO l_xrcb113,l_xrcb115
     FROM xrcb_t
    WHERE xrcbent = g_enterprise
      AND xrcbld  = p_ld AND xrcbdocno = p_docno
      AND xrcb023 = 'Y'
   SELECT SUM(apcf113),SUM(apcf115) INTO l_apcf113,l_apcf115   
     FROM apcf_t
    WHERE apcfent = g_enterprise
      AND apcfld  = p_ld AND apcfdocno = p_docno
   IF l_sfin2012 = '1' THEN
      IF cl_null(l_xrcb113) THEN LET l_xrcb113 = 0 END IF
      IF cl_null(l_apcf113) THEN LET l_apcf113 = 0 END IF
      IF l_xrcb113 <> l_apcf113 THEN
         LET r_success = FALSE
         LET r_errno   = 'aap-00175'
      END IF
   ELSE
      IF cl_null(l_xrcb115) THEN LET l_xrcb115 = 0 END IF
      IF cl_null(l_apcf115) THEN LET l_apcf115 = 0 END IF
      IF l_xrcb115 <> l_apcf115 THEN
         LET r_success = FALSE
         LET r_errno   = 'aap-00175' 
      END IF
   END IF
   
   RETURN r_success,r_errno

END FUNCTION

################################################################################
# Descriptions...: 应收冲暂估明细档新增
# Memo...........:
# Usage..........: CALL s_axrp130_ins_xrcf_bak(p_type,p_xrcald,p_xrcadocno)
#                : RETURNING r_xrcb023
# Input parameter: p_type           Y/N
#                : p_xrcald         账套
#                : p_xrcadocno      单号
# Return code....: r_xrcb023        冲暂估单否
#                : 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#59 By 09505
################################################################################
PUBLIC FUNCTION s_axrp130_ins_xrcf_bak(p_type,p_xrcald,p_xrcadocno)
   DEFINE p_xrcald            LIKE xrcb_t.xrcbld
   DEFINE p_xrcadocno         LIKE xrcb_t.xrcbdocno
   DEFINE p_xrcbseq           LIKE xrcb_t.xrcbseq
   DEFINE p_type              LIKE type_t.chr1        #Y/N   Y---需要往xrcf插资料 N---不往xrcf插资料

   DEFINE l_xrcb007           LIKE xrcb_t.xrcb007
   DEFINE l_xrcf007           LIKE xrcf_t.xrcf007
   DEFINE l_oodbl004          LIKE oodbl_t.oodbl004
   DEFINE l_oodb005           LIKE oodb_t.oodb005
   DEFINE l_oodb006           LIKE oodb_t.oodb006
   DEFINE l_oodb011           LIKE oodb_t.oodb011
   DEFINE l_ooef014           LIKE ooef_t.ooef014
   DEFINE l_ooaj004           LIKE ooaj_t.ooaj004
   DEFINE l_glac007           LIKE glac_t.glac007
   DEFINE l_xrcf103           LIKE xrcf_t.xrcf103
   DEFINE l_xrcf104           LIKE xrcf_t.xrcf104
   DEFINE l_xrcf105           LIKE xrcf_t.xrcf105
   DEFINE l_xrcf113           LIKE xrcf_t.xrcf113
   DEFINE l_xrcf114           LIKE xrcf_t.xrcf114
   DEFINE l_xrcf115           LIKE xrcf_t.xrcf115
   DEFINE l_xrcf123           LIKE xrcf_t.xrcf123
   DEFINE l_xrcf124           LIKE xrcf_t.xrcf124
   DEFINE l_xrcf125           LIKE xrcf_t.xrcf125
   DEFINE l_xrcf133           LIKE xrcf_t.xrcf133
   DEFINE l_xrcf134           LIKE xrcf_t.xrcf134
   DEFINE l_xrcf135           LIKE xrcf_t.xrcf135
   DEFINE l_flag              LIKE type_t.chr1
   DEFINE l_success           LIKE type_t.chr1
   #161212-00005#2---add---begin--------------------
   #DEFINE l_xrcf              RECORD LIKE xrcf_t.*
   #DEFINE t_xrca              RECORD LIKE xrca_t.*   #當前立帳單頭的資料(axrt300/axrt330/axrt340)
   #DEFINE t_xrcb              RECORD LIKE xrcb_t.*   #當前立帳單身的資料(axrt300/axrt330/axrt340)
   #DEFINE l_xrca              RECORD LIKE xrca_t.*   #暫估立帳單頭的資料(axrt320)
   #DEFINE l_xrcb              RECORD LIKE xrcb_t.*   #暫估立帳單身的資料(axrt320)
   DEFINE l_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD
   DEFINE t_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
  DEFINE l_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
  DEFINE t_xrcb RECORD  #應收憑單單身
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
       xrcbud001 LIKE xrcb_t.xrcbud001, #自定義欄位(文字)001
       xrcbud002 LIKE xrcb_t.xrcbud002, #自定義欄位(文字)002
       xrcbud003 LIKE xrcb_t.xrcbud003, #自定義欄位(文字)003
       xrcbud004 LIKE xrcb_t.xrcbud004, #自定義欄位(文字)004
       xrcbud005 LIKE xrcb_t.xrcbud005, #自定義欄位(文字)005
       xrcbud006 LIKE xrcb_t.xrcbud006, #自定義欄位(文字)006
       xrcbud007 LIKE xrcb_t.xrcbud007, #自定義欄位(文字)007
       xrcbud008 LIKE xrcb_t.xrcbud008, #自定義欄位(文字)008
       xrcbud009 LIKE xrcb_t.xrcbud009, #自定義欄位(文字)009
       xrcbud010 LIKE xrcb_t.xrcbud010, #自定義欄位(文字)010
       xrcbud011 LIKE xrcb_t.xrcbud011, #自定義欄位(數字)011
       xrcbud012 LIKE xrcb_t.xrcbud012, #自定義欄位(數字)012
       xrcbud013 LIKE xrcb_t.xrcbud013, #自定義欄位(數字)013
       xrcbud014 LIKE xrcb_t.xrcbud014, #自定義欄位(數字)014
       xrcbud015 LIKE xrcb_t.xrcbud015, #自定義欄位(數字)015
       xrcbud016 LIKE xrcb_t.xrcbud016, #自定義欄位(數字)016
       xrcbud017 LIKE xrcb_t.xrcbud017, #自定義欄位(數字)017
       xrcbud018 LIKE xrcb_t.xrcbud018, #自定義欄位(數字)018
       xrcbud019 LIKE xrcb_t.xrcbud019, #自定義欄位(數字)019
       xrcbud020 LIKE xrcb_t.xrcbud020, #自定義欄位(數字)020
       xrcbud021 LIKE xrcb_t.xrcbud021, #自定義欄位(日期時間)021
       xrcbud022 LIKE xrcb_t.xrcbud022, #自定義欄位(日期時間)022
       xrcbud023 LIKE xrcb_t.xrcbud023, #自定義欄位(日期時間)023
       xrcbud024 LIKE xrcb_t.xrcbud024, #自定義欄位(日期時間)024
       xrcbud025 LIKE xrcb_t.xrcbud025, #自定義欄位(日期時間)025
       xrcbud026 LIKE xrcb_t.xrcbud026, #自定義欄位(日期時間)026
       xrcbud027 LIKE xrcb_t.xrcbud027, #自定義欄位(日期時間)027
       xrcbud028 LIKE xrcb_t.xrcbud028, #自定義欄位(日期時間)028
       xrcbud029 LIKE xrcb_t.xrcbud029, #自定義欄位(日期時間)029
       xrcbud030 LIKE xrcb_t.xrcbud030, #自定義欄位(日期時間)030
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
  DEFINE l_xrcb RECORD  #應收憑單單身
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
       xrcbud001 LIKE xrcb_t.xrcbud001, #自定義欄位(文字)001
       xrcbud002 LIKE xrcb_t.xrcbud002, #自定義欄位(文字)002
       xrcbud003 LIKE xrcb_t.xrcbud003, #自定義欄位(文字)003
       xrcbud004 LIKE xrcb_t.xrcbud004, #自定義欄位(文字)004
       xrcbud005 LIKE xrcb_t.xrcbud005, #自定義欄位(文字)005
       xrcbud006 LIKE xrcb_t.xrcbud006, #自定義欄位(文字)006
       xrcbud007 LIKE xrcb_t.xrcbud007, #自定義欄位(文字)007
       xrcbud008 LIKE xrcb_t.xrcbud008, #自定義欄位(文字)008
       xrcbud009 LIKE xrcb_t.xrcbud009, #自定義欄位(文字)009
       xrcbud010 LIKE xrcb_t.xrcbud010, #自定義欄位(文字)010
       xrcbud011 LIKE xrcb_t.xrcbud011, #自定義欄位(數字)011
       xrcbud012 LIKE xrcb_t.xrcbud012, #自定義欄位(數字)012
       xrcbud013 LIKE xrcb_t.xrcbud013, #自定義欄位(數字)013
       xrcbud014 LIKE xrcb_t.xrcbud014, #自定義欄位(數字)014
       xrcbud015 LIKE xrcb_t.xrcbud015, #自定義欄位(數字)015
       xrcbud016 LIKE xrcb_t.xrcbud016, #自定義欄位(數字)016
       xrcbud017 LIKE xrcb_t.xrcbud017, #自定義欄位(數字)017
       xrcbud018 LIKE xrcb_t.xrcbud018, #自定義欄位(數字)018
       xrcbud019 LIKE xrcb_t.xrcbud019, #自定義欄位(數字)019
       xrcbud020 LIKE xrcb_t.xrcbud020, #自定義欄位(數字)020
       xrcbud021 LIKE xrcb_t.xrcbud021, #自定義欄位(日期時間)021
       xrcbud022 LIKE xrcb_t.xrcbud022, #自定義欄位(日期時間)022
       xrcbud023 LIKE xrcb_t.xrcbud023, #自定義欄位(日期時間)023
       xrcbud024 LIKE xrcb_t.xrcbud024, #自定義欄位(日期時間)024
       xrcbud025 LIKE xrcb_t.xrcbud025, #自定義欄位(日期時間)025
       xrcbud026 LIKE xrcb_t.xrcbud026, #自定義欄位(日期時間)026
       xrcbud027 LIKE xrcb_t.xrcbud027, #自定義欄位(日期時間)027
       xrcbud028 LIKE xrcb_t.xrcbud028, #自定義欄位(日期時間)028
       xrcbud029 LIKE xrcb_t.xrcbud029, #自定義欄位(日期時間)029
       xrcbud030 LIKE xrcb_t.xrcbud030, #自定義欄位(日期時間)030
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

   #161212-00005#2---add---end--------------------
   DEFINE l_sql               STRING
   DEFINE ls_wc               STRING
   DEFINE l_xrcb105           LIKE xrcb_t.xrcb105
   DEFINE l_xrcb115           LIKE xrcb_t.xrcb115
   DEFINE l_amt1              LIKE xrcb_t.xrcb115
   DEFINE l_amt2              LIKE xrcb_t.xrcb115
   DEFINE l_amt3              LIKE xrcb_t.xrcb115
   DEFINE l_amt4              LIKE xrcb_t.xrcb115
   DEFINE l_amt5              LIKE xrcb_t.xrcb115
   DEFINE l_amt6              LIKE xrcb_t.xrcb115
   DEFINE r_xrcb023           LIKE xrcb_t.xrcb023
   #價差                      
   DEFINE l_diff1_up          LIKE xrcf_t.xrcf105   #原幣差異
   DEFINE l_diff2_up          LIKE xrcf_t.xrcf115   #本幣差異
   DEFINE l_diff3_up          LIKE xrcf_t.xrcf125   #本位幣二差異
   DEFINE l_diff4_up          LIKE xrcf_t.xrcf135   #本位幣三差異
   #匯差                      
   DEFINE l_diff1_ra          LIKE xrcf_t.xrcf105   #原幣差異
   DEFINE l_diff2_ra          LIKE xrcf_t.xrcf115   #本幣差異
   DEFINE l_diff3_ra          LIKE xrcf_t.xrcf125   #本位幣二差異
   DEFINE l_diff4_ra          LIKE xrcf_t.xrcf135   #本位幣三差異
   DEFINE l_rate1             LIKE xrca_t.xrca101
   DEFINE l_xrcb101           LIKE xrcb_t.xrcb101
   DEFINE l_scc40             LIKE type_t.chr2
   DEFINE l_sfin2011          LIKE type_t.chr1
   DEFINE l_sfin2012          LIKE type_t.chr1
   DEFINE l_xrcadocno_tmp     LIKE xrca_t.xrcadocno   #150401-00010#2 Add
   
   #200116-00002#4 add s--
   DEFINE lc_param1         RECORD
          type           LIKE type_t.chr1,       #類型
          apca004        LIKE apca_t.apca004,
          sfin2009       LIKE type_t.chr1        #汇率基本    
                    END RECORD
   DEFINE ls_js1         STRING
   DEFINE l_rate2        LIKE type_t.num20_6
   DEFINE l_rate3        LIKE type_t.num20_6
   #200116-00002#4 add e--
   
   LET r_xrcb023 = 'N'

   LET l_diff1_up = 0
   LET l_diff2_up = 0
   LET l_diff3_up = 0
   LET l_diff4_up = 0

   LET l_diff1_ra = 0
   LET l_diff2_ra = 0
   LET l_diff3_ra = 0
   LET l_diff4_ra = 0
   #161212-00005#2---add---begin--------------------
   #SELECT * INTO g_glaa.* 
   SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
          glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
          glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
          glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
          glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
          glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161212-00005#2---add---end--------------------
   FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcbld

   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING l_sfin2012
   IF l_sfin2011 = 'N' THEN
      LET l_sfin2012 = '1'
   END IF

  #當前立帳單頭的資料(axrt300/axrt330/axrt340)
  #161212-00005#2---add---begin--------------------
  #SELECT * INTO t_xrca.* 
  SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,
         xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,
         xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,
         xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,
         xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,
         xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,
         xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,
         xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,
         xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,
         xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,
         xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,
         xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,
         xrcaud027,xrcaud028,xrcaud029,xrcaud030 INTO t_xrca.* 
  #161212-00005#2---add---end-------------------- 
   FROM xrca_t WHERE xrcadocno = p_xrcbdocno AND xrcald = p_xrcbld AND xrcaent = g_enterprise

  #當前立帳單身的資料(axrt300/axrt330/axrt340)
  #161212-00005#2---add---begin--------------------
  #SELECT * INTO t_xrcb.*
   SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
          xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
          xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
          xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
          xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
          xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
          xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
          xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
          xrcb134,xrcb135,xrcb136,xrcbud001,xrcbud002,xrcbud003,xrcbud004,xrcbud005,xrcbud006,
          xrcbud007,xrcbud008,xrcbud009,xrcbud010,xrcbud011,xrcbud012,xrcbud013,xrcbud014,
          xrcbud015,xrcbud016,xrcbud017,xrcbud018,xrcbud019,xrcbud020,xrcbud021,xrcbud022,
          xrcbud023,xrcbud024,xrcbud025,xrcbud026,xrcbud027,xrcbud028,xrcbud029,xrcbud030,
          xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,xrcb059,xrcb060,xrcb107 INTO t_xrcb.*  
  #161212-00005#2---add---end--------------------
   FROM xrcb_t WHERE xrcbdocno = p_xrcbdocno AND xrcbld = p_xrcbld AND xrcbent = g_enterprise
      AND xrcbseq = p_xrcbseq

  #IF t_xrcb.xrcb001 = '19' OR t_xrcb.xrcb001 = '29' THEN RETURN r_xrcb023 END IF   #150203-00010#5 Mark

   IF l_sfin2012 = '1' THEN
      LET t_xrcb.xrcb105 = t_xrcb.xrcb103
      LET t_xrcb.xrcb115 = t_xrcb.xrcb113
   END IF

   IF NOT cl_null(t_xrcb.xrcb002) AND NOT cl_null(t_xrcb.xrcb003) THEN
      IF t_xrcb.xrcb001 = '19' OR t_xrcb.xrcb001 = '29' THEN RETURN r_xrcb023 END IF   #150203-00010#5 Add
      LET l_xrcb007 = t_xrcb.xrcb007
      
      #161212-00005#2---add---begin--------------------
      # LET l_sql = "SELECT * FROM xrcb_t,xrca_t WHERE xrcbent = '",g_enterprise,"' AND xrca001 IN ('01','02')",
       LET l_sql = "SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,xrcb005,",
                   "xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,xrcb014,xrcb015,xrcb016,",
                   "xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,",
                   "xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,",
                   "xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,",
                   "xrcb101,xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,xrcb117,",
                   "xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,xrcb134,xrcb135,xrcb136,",
                   "xrcbud001,xrcbud002,xrcbud003,xrcbud004,xrcbud005,xrcbud006,xrcbud007,xrcbud008,xrcbud009,xrcbud010,",
                   "xrcbud011,xrcbud012,xrcbud013,xrcbud014,xrcbud015,xrcbud016,xrcbud017,xrcbud018,xrcbud019,xrcbud020,",
                   "xrcbud021,xrcbud022,xrcbud023,xrcbud024,xrcbud025,xrcbud026,xrcbud027,xrcbud028,xrcbud029,xrcbud030,",
                   "xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,xrcb059,xrcb060,xrcb107,",
                   "xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,xrcacnfdt,",
                   "xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,xrca003,xrca004,",
                   "xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,xrca015,xrca016,",
                   "xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,xrca028,xrca029,",
                   "xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,xrca040,xrca041,",
                   "xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,xrca052,xrca053,",
                   "xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,xrca064,xrca065,",
                   "xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,xrca116,xrca117,",
                   "xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,",
                   "xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,xrcaud007,",
                   "xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,xrcaud017,",
                   "xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,xrcaud027,",
                   "xrcaud028,xrcaud029,xrcaud030",
                   " FROM xrcb_t,xrca_t WHERE xrcbent = '",g_enterprise,"' AND xrca001 IN ('01','02') ",
      #161212-00005#2---add---end--------------------
                  "   AND xrcb002 = '",t_xrcb.xrcb002,"' AND xrcb003 = '",t_xrcb.xrcb003,"'                 ",
                  "   AND xrcb002 IS NOT NULL AND xrcb003 IS NOT NULL                                       ",
                  "   AND xrcbld = '",t_xrca.xrcald,"'                                                      ",
                  "   AND xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld                   ",
                  "   AND xrcastus = 'Y'                                                                    ",
                  " ORDER BY xrcadocdt,xrcadocno,xrcbseq   "
      PREPARE axrp132_xrcb_prep FROM l_sql
      DECLARE axrp132_xrcb_curs CURSOR FOR axrp132_xrcb_prep
      
      INITIALIZE l_xrcf.* TO NULL
      LET l_xrcf.xrcfseq2 = 0
      
      SELECT ooef014 INTO l_ooef014 FROM ooef_t
       WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
      
      #1.取基础币种的金额精度--若有传入p_amount时,返回的是金额,非汇率
      CALL s_curr_sel_ooaj004(l_ooef014,g_glaa.glaa001)
           RETURNING l_ooaj004
      
      FOREACH axrp132_xrcb_curs INTO l_xrcb.*
         IF l_xrcb007 = 0 THEN EXIT FOREACH END IF
         LET l_flag = 'Y'
      
         #161212-00005#2---add---begin--------------------
         #SELECT * INTO l_xrca.* 
         SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,
                xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,
                xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,
                xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,
                xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,
                xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,
                xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,
                xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,
                xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,
                xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,
                xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,
                xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,
                xrcaud027,xrcaud028,xrcaud029,xrcaud030 INTO l_xrca.* 
         #161212-00005#2---add---end--------------------
         FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcadocno = l_xrcb.xrcbdocno AND xrcald = l_xrcb.xrcbld
          SELECT glac007 INTO l_glac007 FROM glac_t
           WHERE glacent = g_enterprise AND glac001 = g_glaa.glaa004 AND glac002 = l_xrca.xrca035
      
         CALL s_tax_chk(g_glaa.glaacomp,l_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011

         #取得已冲暂估数量&其他未確認單, 有沖暫估記錄者
        #150401-00010#2 Mark ---(S)---
        #SELECT SUM(xrcf007) INTO l_xrcf007 FROM xrcf_t
        # WHERE xrcfent = g_enterprise
        #   AND xrcfld = t_xrca.xrcald
        #   AND xrcf008 = l_xrcb.xrcbdocno
        #   AND xrcf009 = l_xrcb.xrcbseq
        #150401-00010#2 Mark ---(E)---
        #150401-00010#2 Add  ---(S)---
         #t300計算已沖暫估數量(不含本次沖銷的)
         SELECT SUM(xrcb007)       #150826-00024#1 delete 逗号
           INTO l_xrcf007
           FROM xrca_t,xrcb_t
          WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno
            AND xrcastus NOT IN ('X','Y')
            AND xrcaent = g_enterprise
            AND xrcald  = t_xrcb.xrcbld AND xrcbdocno <> t_xrcb.xrcbdocno
            AND xrcb002 = t_xrcb.xrcb002 AND xrcb003 = t_xrcb.xrcb003
            AND xrcb023 = 'Y'
        #150401-00010#2 Add  ---(S)---
      
         IF cl_null(l_xrcf007) THEN LET l_xrcf007 = 0 END IF
         
         IF l_xrcf007 = l_xrcb.xrcb007 THEN CONTINUE FOREACH END IF
      
         LET l_xrcf.xrcfent = g_enterprise
         LET l_xrcf.xrcfld  = t_xrca.xrcald
         LET l_xrcf.xrcfdocno=t_xrca.xrcadocno
         LET l_xrcf.xrcfseq = t_xrcb.xrcbseq
        #LET l_xrcf.xrcfseq2= l_xrcf.xrcfseq2 + 1   #150401-00010#2 Mark
         LET l_xrcf.xrcf001 = 'axrt300'
         LET l_xrcf.xrcf002 = '01'
         LET l_xrcf.xrcf008 = l_xrcb.xrcbdocno
         LET l_xrcf.xrcf009 = l_xrcb.xrcbseq
         LET l_xrcf.xrcf010 = 0
         LET l_xrcf.xrcf020 = l_xrcb.xrcb020
         LET l_xrcf.xrcf021 = l_xrcb.xrcb029
         IF (YEAR(t_xrca.xrcadocdt) = YEAR(l_xrca.xrcadocdt) AND MONTH(t_xrca.xrcadocdt) = MONTH(l_xrca.xrcadocdt))
         OR (l_glac007 = '4' OR l_glac007 = '5') THEN
            LET l_xrcf.xrcf022 = l_xrcb.xrcb021
         END IF
         IF (YEAR(t_xrca.xrcadocdt) <> YEAR(l_xrca.xrcadocdt) OR MONTH(t_xrca.xrcadocdt) <> MONTH(l_xrca.xrcadocdt)) THEN
            LET l_xrcf.xrcf022 = t_xrcb.xrcb021
         END IF
         LET l_xrcf.xrcf023 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_27')
         LET l_xrcf.xrcf024 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_11')
         LET l_xrcf.xrcf025 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_12')
         LET l_xrcf.xrcf029 = t_xrca.xrca004
         LET l_xrcf.xrcf030 = t_xrca.xrca005
         LET l_xrcf.xrcf033 = t_xrca.xrca014
         LET l_xrcf.xrcf026 = t_xrca.xrca015
         LET l_xrcf.xrcf101 = l_xrcb.xrcb101
         LET l_xrcf.xrcf102 = l_xrca.xrca101
         LET l_xrcf.xrcforga= l_xrcb.xrcborga
         LET l_xrcf.xrcf026 = l_xrcb.xrcb010
         LET l_xrcf.xrcf027 = l_xrcb.xrcb011
         LET l_xrcf.xrcf028 = l_xrcb.xrcb024
         LET l_xrcf.xrcf029 = l_xrca.xrca004
         LET l_xrcf.xrcf030 = l_xrca.xrca004
         LET l_xrcf.xrcf031 = l_xrcb.xrcb036
         LET l_xrcf.xrcf032 = l_xrcb.xrcb012
         LET l_xrcf.xrcf033 = l_xrcb.xrcb051
         LET l_xrcf.xrcf034 = l_xrcb.xrcb015
         LET l_xrcf.xrcf035 = l_xrcb.xrcb016
         LET l_xrcf.xrcf036 = l_xrcb.xrcb033
         LET l_xrcf.xrcf037 = l_xrcb.xrcb034
         LET l_xrcf.xrcf038 = l_xrcb.xrcb035
         #沖帳情況：1.整張暫估單全部沖完     --> 直接賦值
         #         2.整張暫估單沖銷部分     --> 沖銷數量 * 單價
         #         3.整張暫估單沖銷剩餘部分 --> (暫估單金額 - 暫估明細當(xrcf_t)金額)
      
         #情況一:
         IF (l_xrcb.xrcb007 <= l_xrcb007 AND l_xrcf007 = 0) AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            LET l_xrcf.xrcf007 = l_xrcb.xrcb007
            LET l_xrcf.xrcf103 = l_xrcb.xrcb103
            LET l_xrcf.xrcf104 = l_xrcb.xrcb104
            LET l_xrcf.xrcf105 = l_xrcb.xrcb105
            LET l_xrcf.xrcf113 = l_xrcb.xrcb113
            LET l_xrcf.xrcf114 = l_xrcb.xrcb114
            LET l_xrcf.xrcf115 = l_xrcb.xrcb115
            LET l_xrcf.xrcf123 = l_xrcb.xrcb123
            LET l_xrcf.xrcf124 = l_xrcb.xrcb124
            LET l_xrcf.xrcf125 = l_xrcb.xrcb125
            LET l_xrcf.xrcf133 = l_xrcb.xrcb133
            LET l_xrcf.xrcf134 = l_xrcb.xrcb134
            LET l_xrcf.xrcf135 = l_xrcb.xrcb135
            LET l_xrcb007 = l_xrcb007 - l_xrcb.xrcb007
         END IF
      
         #情況二:
         IF (l_xrcb007 < l_xrcb.xrcb007 - l_xrcf007) AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            LET l_xrcf.xrcf007 = l_xrcb007
            CALL s_tax_count(g_glaa.glaacomp,l_xrcb.xrcb020,l_xrcf.xrcf007 * l_xrcb.xrcb101,l_xrcf.xrcf007,l_xrca.xrca100,l_xrca.xrca101)
               RETURNING l_xrcf.xrcf103,l_xrcf.xrcf104,l_xrcf.xrcf105,
                         l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115
            IF g_glaa.glaa015 = 'Y' THEN
               #計算本位幣二金額
               IF g_glaa.glaa017 = '1' THEN
                  #换算基准:交易原幣
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf103,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf123
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf104,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf124
               ELSE
                  #换算基准:帳簿幣別
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf103,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf123
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf104,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf124
               END IF
            ELSE
               LET l_xrcf.xrcf123 = 0
               LET l_xrcf.xrcf124 = 0
            END IF
            LET l_xrcf.xrcf125 = l_xrcf.xrcf123 + l_xrcf.xrcf124
            IF g_glaa.glaa019 = 'Y' THEN
               #計算本位幣三金額
               IF g_glaa.glaa021 = '1' THEN
                  #换算基准:交易原幣
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf103,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf133
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf104,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf134
               ELSE
                  #换算基准:帳簿幣別
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf103,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf133
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf104,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf134
               END IF
            ELSE
               LET l_xrcf.xrcf133 = 0
               LET l_xrcf.xrcf134 = 0
            END IF
            LET l_xrcf.xrcf135 = l_xrcf.xrcf133 + l_xrcf.xrcf134
            LET l_xrcb007 = 0
         END IF
      
         #情況三:
         IF (l_xrcb007 >= l_xrcb.xrcb007 - l_xrcf007 AND l_xrcf007 <> 0) AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            LET l_xrcf.xrcf007 = l_xrcb.xrcb007 - l_xrcf007
            SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),
                   SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135)
              INTO l_xrcf103,l_xrcf104,l_xrcf105,l_xrcf113,l_xrcf114,l_xrcf115,
                   l_xrcf123,l_xrcf124,l_xrcf125,l_xrcf133,l_xrcf134,l_xrcf135
              FROM xrcf_t
             WHERE xrcfld = t_xrca.xrcald
               AND xrcfent= g_enterprise
               AND xrcf008= l_xrcb.xrcbdocno
               AND xrcf009= l_xrcb.xrcbseq
      
            IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF
            IF cl_null(l_xrcf104) THEN LET l_xrcf104 = 0 END IF
            IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
            IF cl_null(l_xrcf113) THEN LET l_xrcf113 = 0 END IF
            IF cl_null(l_xrcf114) THEN LET l_xrcf114 = 0 END IF
            IF cl_null(l_xrcf115) THEN LET l_xrcf115 = 0 END IF
            IF cl_null(l_xrcf123) THEN LET l_xrcf123 = 0 END IF
            IF cl_null(l_xrcf124) THEN LET l_xrcf124 = 0 END IF
            IF cl_null(l_xrcf125) THEN LET l_xrcf125 = 0 END IF
            IF cl_null(l_xrcf133) THEN LET l_xrcf133 = 0 END IF
            IF cl_null(l_xrcf134) THEN LET l_xrcf134 = 0 END IF
            IF cl_null(l_xrcf135) THEN LET l_xrcf135 = 0 END IF
            
            LET l_xrcf.xrcf103 = l_xrcb.xrcb103 - l_xrcf103
            LET l_xrcf.xrcf104 = l_xrcb.xrcb104 - l_xrcf104
            LET l_xrcf.xrcf105 = l_xrcb.xrcb105 - l_xrcf105
            LET l_xrcf.xrcf113 = l_xrcb.xrcb113 - l_xrcf113
            LET l_xrcf.xrcf114 = l_xrcb.xrcb114 - l_xrcf114
            LET l_xrcf.xrcf115 = l_xrcb.xrcb115 - l_xrcf115
            LET l_xrcf.xrcf123 = l_xrcb.xrcb123 - l_xrcf123
            LET l_xrcf.xrcf124 = l_xrcb.xrcb124 - l_xrcf124
            LET l_xrcf.xrcf125 = l_xrcb.xrcb125 - l_xrcf125
            LET l_xrcf.xrcf133 = l_xrcb.xrcb133 - l_xrcf133
            LET l_xrcf.xrcf134 = l_xrcb.xrcb134 - l_xrcf134
            LET l_xrcf.xrcf135 = l_xrcb.xrcb135 - l_xrcf135
            LET l_xrcb007 = l_xrcb007 - (l_xrcb.xrcb007 - l_xrcf007)
         END IF
         LET l_xrcf.xrcf111 = l_xrcb.xrcb111
         #計算價差
         #STEP1:本幣價差
         #（立帳的原幣單價 * 立暫估時機點的[axrt300]原幣匯率 - 立暂估的原幣單價 * 立暫估的[axrt320]原币汇率） * 沖暫估數量  ps.單價必須都為含稅單價
         #STEP2:原幣價差
         #本幣價差/暫估匯率
         #STEP3:本幣匯差
         #（立帳的原幣單價 * 立帳時的原幣匯率 - 立帳時的原幣單價 * 立暫估實際點的[axrt300]原幣匯率） * 沖暫估數量   ps.單價必須都為含稅單價
         #需要重新計算的是:1.立暫估實際點的[axrt300]原幣匯率 2.axrt300/axrt320取得的单价若不含税 则需要计算为含税单价:含稅單價 = 未稅單價 * (1 + 稅額/100)
         #200116-00002#4 mark s--
#         CALL s_aooi160_get_exrate('2',t_xrca.xrcald,l_xrca.xrcadocdt,t_xrca.xrca100,g_glaa.glaa001,0,g_glaa.glaa025)
#            RETURNING l_rate1
         #200116-00002#4 mark e--
         #200116-00002#4 add s--
         LET lc_param1.apca004 = t_xrca.xrca004
         LET ls_js1 = util.JSON.stringify(lc_param1)
         CALL s_fin_get_curr_rate(t_xrca.xrcacomp,t_xrca.xrcald,l_xrca.xrcadocdt,t_xrca.xrca100,ls_js1)    
              RETURNING l_rate1,l_rate2,l_rate3
         #200116-00002#4 add e--
         
         IF t_xrca.xrca100 = l_xrca.xrca100 THEN
            LET l_rate1 = l_xrca.xrca101
         END IF
         IF l_sfin2012 = '1' THEN   #1.立帳不含稅
            #若暫估單單價含稅則需要換算為不含稅的單價
            IF l_oodb005 = 'Y' THEN  #暫估未稅單價轉換含稅單價
               LET l_xrcb.xrcb101 = l_xrcb.xrcb101 / (1 + l_oodb006/100)
            END IF
            #若應收單單價含稅則需要換算為不含稅的單價
            CALL s_tax_chk(g_glaa.glaacomp,t_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            IF l_oodb005 = 'Y' THEN  #出貨未稅單價轉換含稅單價
               LET l_xrcb101 = t_xrcb.xrcb101 / (1 + l_oodb006/100)
            ELSE
               LET l_xrcb101 = t_xrcb.xrcb101
            END IF
         ELSE                       #2.立帳含稅
            #若暫估單單價含稅則需要換算為不含稅的單價
            IF l_oodb005 = 'N' THEN  #暫估未稅單價轉換含稅單價
               LET l_xrcb.xrcb101 = l_xrcb.xrcb101 * (1 + l_oodb006/100)
            END IF
            #若應收單單價含稅則需要換算為不含稅的單價
            CALL s_tax_chk(g_glaa.glaacomp,t_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            IF l_oodb005 = 'N' THEN  #出貨未稅單價轉換含稅單價
               LET l_xrcb101 = t_xrcb.xrcb101 * (1 + l_oodb006/100)
            ELSE
               LET l_xrcb101 = t_xrcb.xrcb101
            END IF
         END IF

         LET l_xrcf.xrcf116 = (l_xrcb101 * l_rate1 - l_xrcb.xrcb101 * l_xrcf.xrcf102) * l_xrcf.xrcf007
        #LET l_xrcf.xrcf106 = s_num_round('1',l_xrcf.xrcf116 / t_xrca.xrca101,l_ooaj004)
         LET l_xrcf.xrcf117 = (l_xrcb101 * t_xrca.xrca101 - l_xrcb101 * l_rate1) * l_xrcf.xrcf007
         IF g_glaa.glaa015 = 'Y' THEN
            #計算本位幣二金額
            IF g_glaa.glaa017 = '1' THEN
               #换算基准:交易原幣
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf106,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf126
               LET l_xrcf.xrcf127 = 0   # 原幣不存在匯差所以依交易原幣計算本位幣二匯差則為0
            ELSE
               #换算基准:帳簿幣別
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf116,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf126
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf117,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf127
            END IF
         ELSE
            LET l_xrcf.xrcf126 = 0
            LET l_xrcf.xrcf127 = 0
         END IF
         IF g_glaa.glaa019 = 'Y' THEN
            #計算本位幣三金額
            IF g_glaa.glaa021 = '1' THEN
               #换算基准:交易原幣
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf106,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf136
               LET l_xrcf.xrcf137 = 0   # 原幣不存在匯差所以依交易原幣計算本位幣二匯差則為0
            ELSE
               #换算基准:帳簿幣別
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf116,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf136
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf117,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf137
            END IF
         ELSE
            LET l_xrcf.xrcf136 = 0
            LET l_xrcf.xrcf137 = 0
         END IF
         #累加價差
         LET l_diff1_up = l_diff1_up + l_xrcf.xrcf106   #原幣價差
         LET l_diff2_up = l_diff2_up + l_xrcf.xrcf116   #原幣價差
         LET l_diff3_up = l_diff3_up + l_xrcf.xrcf126   #原幣價差
         LET l_diff4_up = l_diff4_up + l_xrcf.xrcf136   #原幣價差

         #累加匯差
         LET l_diff1_ra = l_diff1_ra + 0                #原幣價差  ---不存在
         LET l_diff2_ra = l_diff2_ra + l_xrcf.xrcf117   #原幣價差
         LET l_diff3_ra = l_diff3_ra + l_xrcf.xrcf127   #原幣價差
         LET l_diff4_ra = l_diff4_ra + l_xrcf.xrcf137   #原幣價差

         LET l_xrcf.xrcf106 = 0
         LET l_xrcf.xrcf116 = 0   LET l_xrcf.xrcf117 = 0
         LET l_xrcf.xrcf126 = 0   LET l_xrcf.xrcf127 = 0
         LET l_xrcf.xrcf136 = 0   LET l_xrcf.xrcf137 = 0

         IF g_glaa.glaa015 = 'Y' THEN
            LET l_xrcf.xrcf122 = l_xrca.xrca121
         END IF
         IF g_glaa.glaa019 = 'Y' THEN
            LET l_xrcf.xrcf132 = l_xrca.xrca131
         END IF

         IF p_type = 'Y' THEN
           #150401-00010#2 Add  ---(S)---
            IF cl_null(l_xrcadocno_tmp) OR l_xrcadocno_tmp <> l_xrcb.xrcbdocno THEN
               #161212-00005#2---add---begin--------------------
               #INSERT INTO xrcf_t VALUES(l_xrcf.*)
               INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                                   xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                                   xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                                   xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                                   xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                                   xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                                   xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                                   xrcf135,xrcf136,xrcf137)
                VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                       l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                       l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                       l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                       l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                       l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                       l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                       l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
               #161212-00005#2---add---end-----------------
            ELSE
               UPDATE xrcf_t SET xrcf103 = xrcf103 + l_xrcf.xrcf103,
                                 xrcf104 = xrcf104 + l_xrcf.xrcf104,
                                 xrcf105 = xrcf105 + l_xrcf.xrcf105,
                                 xrcf113 = xrcf113 + l_xrcf.xrcf113,
                                 xrcf114 = xrcf114 + l_xrcf.xrcf114,
                                 xrcf115 = xrcf115 + l_xrcf.xrcf115,
                                 xrcf123 = xrcf123 + l_xrcf.xrcf123,
                                 xrcf124 = xrcf124 + l_xrcf.xrcf124,
                                 xrcf125 = xrcf125 + l_xrcf.xrcf125,
                                 xrcf133 = xrcf133 + l_xrcf.xrcf133,
                                 xrcf134 = xrcf134 + l_xrcf.xrcf134,
                                 xrcf135 = xrcf135 + l_xrcf.xrcf135
                WHERE xrcfent   = g_enterprise
                  AND xrcfdocno = l_xrcf.xrcfdocno
                  AND xrcfld    = l_xrcf.xrcfld
                  AND xrcf008   = l_xrcf.xrcf008
            END IF
            LET l_xrcadocno_tmp = l_xrcb.xrcbdocno
           #150401-00010#2 Add  ---(S)---
         END IF
         LET r_xrcb023 = 'Y'
      END FOREACH
   ELSE
      #雜項暫估,按照客戶取得暫估資料進行沖暫估,需要考慮到不同幣別時需要通過本幣反推原幣
      #沖雜項暫估的部分用本幣金額來比較，不用數量
      LET l_xrcb105 = t_xrcb.xrcb105
      LET l_xrcb115 = t_xrcb.xrcb115
      LET ls_wc = " 1=1"
      IF t_xrcb.xrcb001 = '16' THEN
         LET ls_wc = " xrca001 = '03' AND xrcb001 = '19'"
      END IF
      IF t_xrcb.xrcb001 = '26' THEN
         LET ls_wc = " xrca001 = '04' AND xrcb001 = '29'"
      END IF
      #161212-00005#2---add---begin--------------------
      #LET l_sql = "SELECT * FROM xrcb_t,xrca_t WHERE xrcbent = '",g_enterprise,"'             ",
       LET l_sql = "SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,xrcb005,",
                   "xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,xrcb014,xrcb015,xrcb016,",
                   "xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,",
                   "xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,",
                   "xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,",
                   "xrcb101,xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,xrcb117,",
                   "xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,xrcb134,xrcb135,xrcb136,",
                   "xrcbud001,xrcbud002,xrcbud003,xrcbud004,xrcbud005,xrcbud006,xrcbud007,xrcbud008,xrcbud009,xrcbud010,",
                   "xrcbud011,xrcbud012,xrcbud013,xrcbud014,xrcbud015,xrcbud016,xrcbud017,xrcbud018,xrcbud019,xrcbud020,",
                   "xrcbud021,xrcbud022,xrcbud023,xrcbud024,xrcbud025,xrcbud026,xrcbud027,xrcbud028,xrcbud029,xrcbud030,",
                   "xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,xrcb059,xrcb060,xrcb107,",
                   "xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,xrcacnfdt,",
                   "xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,xrca003,xrca004,",
                   "xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,xrca015,xrca016,",
                   "xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,xrca028,xrca029,",
                   "xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,xrca040,xrca041,",
                   "xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,xrca052,xrca053,",
                   "xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,xrca064,xrca065,",
                   "xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,xrca116,xrca117,",
                   "xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,",
                   "xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,xrcaud007,",
                   "xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,xrcaud017,",
                   "xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,xrcaud027,",
                   "xrcaud028,xrcaud029,xrcaud030",
                   " FROM xrcb_t,xrca_t WHERE xrcbent = '",g_enterprise,"'             ",
      #161212-00005#2---add---end--------------------
                  "   AND xrca004 = '",t_xrca.xrca004,"' AND xrca005 = '",t_xrca.xrca005,"'   ",
                  "   AND xrcb002 IS NULL AND xrcb003 IS NULL                                 ",
                  "   AND xrcbld = '",t_xrca.xrcald,"'                                      ",
                  "   AND xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld     ",
                  "   AND xrcastus = 'Y'                                                      ",
                  "   AND ",ls_wc CLIPPED
      IF t_xrcb.xrcb001[1,1] = '1' THEN
         LET l_sql = l_sql," AND xrca001 = '03'"
      ELSE
         LET l_sql = l_sql," AND xrca001 = '04'"
      END IF
      LET l_sql = l_sql,   " ORDER BY CASE WHEN xrca100 = '",t_xrca.xrca100,"' THEN 1 ELSE 2 END ASC,xrcadocdt ASC,",
                           "           xrcadocno,xrcbseq,xrca100   "
      PREPARE axrp132_xrcb_prep1 FROM l_sql
      DECLARE axrp132_xrcb_curs1 CURSOR FOR axrp132_xrcb_prep1
      
      INITIALIZE l_xrcf.* TO NULL
      LET l_xrcf.xrcfseq2 = 0
      
      SELECT ooef014 INTO l_ooef014 FROM ooef_t
       WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
      
      #1.取基础币种的金额精度--若有传入p_amount时,返回的是金额,非汇率
      CALL s_curr_sel_ooaj004(l_ooef014,g_glaa.glaa001)
           RETURNING l_ooaj004
      
      FOREACH axrp132_xrcb_curs1 INTO l_xrcb.*
         IF l_xrcb105 = 0 OR l_xrcb115 = 0 THEN EXIT FOREACH END IF
         LET l_flag = 'Y'
      
         #161212-00005#2---add---begin--------------------
         #SELECT * INTO l_xrca.* 
         SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,
                xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,
                xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,
                xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,
                xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,
                xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,
                xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,
                xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,
                xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,
                xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,
                xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,
                xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,
                xrcaud027,xrcaud028,xrcaud029,xrcaud030 INTO l_xrca.* 
         #161212-00005#2---add---end--------------------
         FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcadocno = l_xrcb.xrcbdocno AND xrcald = l_xrcb.xrcbld
          SELECT glac007 INTO l_glac007 FROM glac_t
           WHERE glacent = g_enterprise AND glac001 = g_glaa.glaa004 AND glac002 = l_xrca.xrca035
      
         CALL s_tax_chk(g_glaa.glaacomp,l_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
      
         #取得已冲暂估金额&其他未確認單, 有沖暫估記錄者
         SELECT SUM(xrcf105),SUM(xrcf115) INTO l_xrcf105,l_xrcf115 FROM xrcf_t
          WHERE xrcfent = g_enterprise
            AND xrcfld = t_xrca.xrcald
            AND xrcf008 = l_xrcb.xrcbdocno
            AND xrcf009 = l_xrcb.xrcbseq
      
         IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
         IF cl_null(l_xrcf115) THEN LET l_xrcf115 = 0 END IF
         
         IF (l_xrcf105 = l_xrcb.xrcb105 AND l_xrca.xrca100 =  t_xrca.xrca100) THEN CONTINUE FOREACH END IF
         IF (l_xrcf115 = l_xrcb.xrcb115 AND l_xrca.xrca100 <> t_xrca.xrca100) THEN CONTINUE FOREACH END IF
      
         LET l_xrcf.xrcfent = g_enterprise
         LET l_xrcf.xrcfld  = t_xrca.xrcald
         LET l_xrcf.xrcfdocno=t_xrca.xrcadocno
         LET l_xrcf.xrcfseq = t_xrcb.xrcbseq
        #LET l_xrcf.xrcfseq2= l_xrcf.xrcfseq2 + 1   #150401-00010#2 Mark
         LET l_xrcf.xrcf001 = 'axrt300'
         LET l_xrcf.xrcf002 = '01'
         LET l_xrcf.xrcf008 = l_xrcb.xrcbdocno
         LET l_xrcf.xrcf009 = l_xrcb.xrcbseq
         LET l_xrcf.xrcf010 = 0
         LET l_xrcf.xrcf020 = l_xrcb.xrcb020
         LET l_xrcf.xrcf021 = l_xrcb.xrcb029
         IF (YEAR(t_xrca.xrcadocdt) = YEAR(l_xrca.xrcadocdt) AND MONTH(t_xrca.xrcadocdt) = MONTH(l_xrca.xrcadocdt))
         OR (l_glac007 = '4' OR l_glac007 = '5') THEN
            LET l_xrcf.xrcf022 = l_xrcb.xrcb021
         END IF
         IF (YEAR(t_xrca.xrcadocdt) <> YEAR(l_xrca.xrcadocdt) OR MONTH(t_xrca.xrcadocdt) <> MONTH(l_xrca.xrcadocdt)) THEN
            LET l_xrcf.xrcf022 = t_xrcb.xrcb021
         END IF
         LET l_xrcf.xrcf023 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_27')
         LET l_xrcf.xrcf024 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_11')
         LET l_xrcf.xrcf025 = s_axrp130_get_glab(t_xrca.xrcald,'13',l_xrca.xrca007,'8304_12')
         LET l_xrcf.xrcf101 = l_xrcb.xrcb101
         LET l_xrcf.xrcf111 = l_xrcb.xrcb111
         LET l_xrcf.xrcf102 = l_xrca.xrca101
         LET l_xrcf.xrcforga= l_xrcb.xrcborga
         LET l_xrcf.xrcf026 = l_xrcb.xrcb010
         LET l_xrcf.xrcf027 = l_xrcb.xrcb011
         LET l_xrcf.xrcf028 = l_xrcb.xrcb024
         LET l_xrcf.xrcf029 = l_xrca.xrca004
         LET l_xrcf.xrcf030 = l_xrca.xrca004
         LET l_xrcf.xrcf031 = l_xrcb.xrcb036
         LET l_xrcf.xrcf032 = l_xrcb.xrcb012
         LET l_xrcf.xrcf033 = l_xrcb.xrcb051
         LET l_xrcf.xrcf034 = l_xrcb.xrcb015
         LET l_xrcf.xrcf035 = l_xrcb.xrcb016
         LET l_xrcf.xrcf036 = l_xrcb.xrcb033
         LET l_xrcf.xrcf037 = l_xrcb.xrcb034
         LET l_xrcf.xrcf038 = l_xrcb.xrcb035
         #沖帳情況：1.整張暫估單全部沖完     --> 直接賦值
         #         2.整張暫估單沖銷部分     --> 通過本幣金額反推原幣金額，再反推數量
         #         3.整張暫估單沖銷剩餘部分 --> (暫估單金額 - 暫估明細當(xrcf_t)金額)

         #情況一:
         IF ((l_xrcb.xrcb115 <= l_xrcb115 AND l_xrcf115 = 0 AND l_xrca.xrca100 <> t_xrca.xrca100)
            OR (l_xrcb.xrcb105 <= l_xrcb105 AND l_xrcf105 = 0 AND l_xrca.xrca100 = t_xrca.xrca100)) AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            LET l_xrcf.xrcf007 = l_xrcb.xrcb007
            LET l_xrcf.xrcf103 = l_xrcb.xrcb103
            LET l_xrcf.xrcf104 = l_xrcb.xrcb104
            LET l_xrcf.xrcf105 = l_xrcb.xrcb105
            LET l_xrcf.xrcf113 = l_xrcb.xrcb113
            LET l_xrcf.xrcf114 = l_xrcb.xrcb114
            LET l_xrcf.xrcf115 = l_xrcb.xrcb115
            LET l_xrcf.xrcf123 = l_xrcb.xrcb123
            LET l_xrcf.xrcf124 = l_xrcb.xrcb124
            LET l_xrcf.xrcf125 = l_xrcb.xrcb125
            LET l_xrcf.xrcf133 = l_xrcb.xrcb133
            LET l_xrcf.xrcf134 = l_xrcb.xrcb134
            LET l_xrcf.xrcf135 = l_xrcb.xrcb135
            LET l_xrcb105 = l_xrcb105 - l_xrcb.xrcb105
            LET l_xrcb115 = l_xrcb115 - l_xrcb.xrcb115
         END IF

         #情況二:
         IF ((l_xrcb115 < l_xrcb.xrcb115 - l_xrcf115 AND l_xrca.xrca100 <> t_xrca.xrca100)
            OR (l_xrcb105 < l_xrcb.xrcb105 - l_xrcf105 AND l_xrca.xrca100 = t_xrca.xrca100))AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            #當暫估單據金額大於立帳單據金額時
            #可以使用當前立帳單據金額減去已沖暫估的金額得到需要沖銷的本币金额
            SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),
                   SUM(xrcf113),SUM(xrcf114),SUM(xrcf115)
              INTO l_amt1,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6 FROM xrcf_t
             WHERE xrcfent = g_enterprise
               AND xrcfdocno = t_xrca.xrcadocno
               AND xrcfld = t_xrca.xrcald
               AND xrcfseq = t_xrcb.xrcbseq
            IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF
            IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
            IF cl_null(l_amt3) THEN LET l_amt3 = 0 END IF
            IF cl_null(l_amt4) THEN LET l_amt4 = 0 END IF
            IF cl_null(l_amt5) THEN LET l_amt5 = 0 END IF
            IF cl_null(l_amt6) THEN LET l_amt6 = 0 END IF
            LET l_xrcf.xrcf105 = t_xrcb.xrcb105 - l_amt3   #立帳單據單身含稅金額 - 已沖含稅暫估金額
            LET l_xrcf.xrcf103 = l_xrcf.xrcf105 / (1 + (l_oodb006/100))
            LET l_xrcf.xrcf103 = s_num_round('1',l_xrcf.xrcf103,l_ooaj004)
            LET l_xrcf.xrcf104 = l_xrcf.xrcf105 - l_xrcf.xrcf103
            
            LET l_xrcf.xrcf115 = t_xrcb.xrcb115 - l_amt6   #立帳單據單身含稅金額 - 已沖含稅暫估金額
            LET l_xrcf.xrcf113 = l_xrcf.xrcf115 / (1 + (l_oodb006/100))
            LET l_xrcf.xrcf113 = s_num_round('1',l_xrcf.xrcf113,l_ooaj004)
            LET l_xrcf.xrcf114 = l_xrcf.xrcf115 - l_xrcf.xrcf113

            IF l_xrca.xrca100 <> t_xrca.xrca100 THEN
               #反推原幣金額
               CALL s_curr_sel_ooaj004(l_ooef014,l_xrca.xrca100)
                  RETURNING l_ooaj004
               LET l_xrcf.xrcf103 = s_num_round('1',l_xrcf.xrcf113 / l_xrca.xrca101,l_ooaj004)
               LET l_xrcf.xrcf104 = s_num_round('1',l_xrcf.xrcf114 / l_xrca.xrca101,l_ooaj004)
               LET l_xrcf.xrcf105 = s_num_round('1',l_xrcf.xrcf115 / l_xrca.xrca101,l_ooaj004)
            END IF

            IF l_oodb005 = 'Y' THEN
               LET l_xrcf.xrcf007 = l_xrcf.xrcf105 / l_xrcf.xrcf101
            ELSE
               LET l_xrcf.xrcf007 = l_xrcf.xrcf103 / l_xrcf.xrcf101
            END IF

            IF g_glaa.glaa015 = 'Y' THEN
               #計算本位幣二金額
               IF g_glaa.glaa017 = '1' THEN
                  #换算基准:交易原幣
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf103,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf123
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf104,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf124
               ELSE
                  #换算基准:帳簿幣別
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf103,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf123
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf104,l_xrca.xrca121,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf124
               END IF
            ELSE
               LET l_xrcf.xrcf123 = 0
               LET l_xrcf.xrcf124 = 0
            END IF
            LET l_xrcf.xrcf125 = l_xrcf.xrcf123 + l_xrcf.xrcf124
            IF g_glaa.glaa019 = 'Y' THEN
               #計算本位幣三金額
               IF g_glaa.glaa021 = '1' THEN
                  #换算基准:交易原幣
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf103,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf133
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf104,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf134
               ELSE
                  #换算基准:帳簿幣別
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf103,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf133
                  CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf104,l_xrca.xrca131,g_glaa.glaacomp)
                     RETURNING l_success,l_xrcf.xrcf134
               END IF
            ELSE
               LET l_xrcf.xrcf133 = 0
               LET l_xrcf.xrcf134 = 0
            END IF
            LET l_xrcf.xrcf135 = l_xrcf.xrcf133 + l_xrcf.xrcf134
            LET l_xrcb105 = 0
            LET l_xrcb115 = 0
         END IF
      
         #情況三:
         IF ((l_xrcb115 >= l_xrcb.xrcb115 - l_xrcf115 AND l_xrcf115 <> 0 AND l_xrca.xrca100 <> t_xrca.xrca100)
            OR (l_xrcb105 >= l_xrcb.xrcb105 - l_xrcf105 AND l_xrcf105 <> 0 AND l_xrca.xrca100 = t_xrca.xrca100)) AND l_flag = 'Y' THEN
            LET l_flag = 'N'
            SELECT SUM(xrcf103),SUM(xrcf104),SUM(xrcf105),SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),
                   SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf133),SUM(xrcf134),SUM(xrcf135),SUM(xrcf007)
              INTO l_xrcf103,l_xrcf104,l_xrcf105,l_xrcf113,l_xrcf114,l_xrcf115,
                   l_xrcf123,l_xrcf124,l_xrcf125,l_xrcf133,l_xrcf134,l_xrcf135,l_xrcf007
              FROM xrcf_t
             WHERE xrcfld = t_xrca.xrcald
               AND xrcfent= g_enterprise
               AND xrcf008= l_xrcb.xrcbdocno
               AND xrcf009= l_xrcb.xrcbseq

            IF cl_null(l_xrcf007) THEN LET l_xrcf007 = 0 END IF
            IF cl_null(l_xrcf103) THEN LET l_xrcf103 = 0 END IF
            IF cl_null(l_xrcf104) THEN LET l_xrcf104 = 0 END IF
            IF cl_null(l_xrcf105) THEN LET l_xrcf105 = 0 END IF
            IF cl_null(l_xrcf113) THEN LET l_xrcf113 = 0 END IF
            IF cl_null(l_xrcf114) THEN LET l_xrcf114 = 0 END IF
            IF cl_null(l_xrcf115) THEN LET l_xrcf115 = 0 END IF
            IF cl_null(l_xrcf123) THEN LET l_xrcf123 = 0 END IF
            IF cl_null(l_xrcf124) THEN LET l_xrcf124 = 0 END IF
            IF cl_null(l_xrcf125) THEN LET l_xrcf125 = 0 END IF
            IF cl_null(l_xrcf133) THEN LET l_xrcf133 = 0 END IF
            IF cl_null(l_xrcf134) THEN LET l_xrcf134 = 0 END IF
            IF cl_null(l_xrcf135) THEN LET l_xrcf135 = 0 END IF
            
            LET l_xrcf.xrcf007 = l_xrcb.xrcb007 - l_xrcf007
            LET l_xrcf.xrcf103 = l_xrcb.xrcb103 - l_xrcf103
            LET l_xrcf.xrcf104 = l_xrcb.xrcb104 - l_xrcf104
            LET l_xrcf.xrcf105 = l_xrcb.xrcb105 - l_xrcf105
            LET l_xrcf.xrcf113 = l_xrcb.xrcb113 - l_xrcf113
            LET l_xrcf.xrcf114 = l_xrcb.xrcb114 - l_xrcf114
            LET l_xrcf.xrcf115 = l_xrcb.xrcb115 - l_xrcf115
            LET l_xrcf.xrcf123 = l_xrcb.xrcb123 - l_xrcf123
            LET l_xrcf.xrcf124 = l_xrcb.xrcb124 - l_xrcf124
            LET l_xrcf.xrcf125 = l_xrcb.xrcb125 - l_xrcf125
            LET l_xrcf.xrcf133 = l_xrcb.xrcb133 - l_xrcf133
            LET l_xrcf.xrcf134 = l_xrcb.xrcb134 - l_xrcf134
            LET l_xrcf.xrcf135 = l_xrcb.xrcb135 - l_xrcf135
            LET l_xrcb105 = l_xrcb105 - (l_xrcb.xrcb105 - l_xrcf105)
            LET l_xrcb115 = l_xrcb115 - (l_xrcb.xrcb115 - l_xrcf115)
         END IF
         #計算價差
         #STEP1:本幣價差
         #（立帳的原幣單價 * 立暫估時機點的[axrt300]原幣匯率 - 立暂估的原幣單價 * 立暫估的[axrt320]原币汇率） * 沖暫估數量  ps.單價必須都為含稅單價
         #STEP2:原幣價差
         #本幣價差/暫估匯率
         #STEP3:本幣匯差
         #(立帳的原幣單價 * 立帳時的原幣匯率 - 立帳時的原幣單價 * 立暫估實際點的[axrt300]原幣匯率） * 沖暫估數量   ps.單價必須都為含稅單價
         #需要重新計算的是:1.立暫估實際點的[axrt300]原幣匯率 2.axrt300/axrt320取得的单价若不含税 则需要计算为含税单价:含稅單價 = 未稅單價 * (1 + 稅額/100)
         #200116-00002#4 mark s--
#         CALL s_aooi160_get_exrate('2',t_xrca.xrcald,l_xrca.xrcadocdt,t_xrca.xrca100,g_glaa.glaa001,0,g_glaa.glaa025)
#            RETURNING l_rate1
         #200116-00002#4 mark e--
         #200116-00002#4 add s--
         LET lc_param1.apca004 = t_xrca.xrca004
         LET ls_js1 = util.JSON.stringify(lc_param1)
         CALL s_fin_get_curr_rate(t_xrca.xrcacomp,t_xrca.xrcald,l_xrca.xrcadocdt,t_xrca.xrca100,ls_js1)    
              RETURNING l_rate1,l_rate2,l_rate3
         #200116-00002#4 add e--
         IF t_xrca.xrca100 = l_xrca.xrca100 THEN
            LET l_rate1 = l_xrca.xrca101
         END IF
         IF l_sfin2012 = '1' THEN   #1.立帳不含稅
            #若暫估單單價含稅則需要換算為不含稅的單價
            IF l_oodb005 = 'Y' THEN  #暫估未稅單價轉換含稅單價
               LET l_xrcb.xrcb101 = l_xrcb.xrcb101 / (1 + l_oodb006/100)
            END IF
            #若應收單單價含稅則需要換算為不含稅的單價
            CALL s_tax_chk(g_glaa.glaacomp,t_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            IF l_oodb005 = 'Y' THEN  #出貨未稅單價轉換含稅單價
               LET l_xrcb101 = t_xrcb.xrcb101 / (1 + l_oodb006/100)
            ELSE
               LET l_xrcb101 = t_xrcb.xrcb101
            END IF
         ELSE                       #2.立帳含稅
            #若暫估單單價含稅則需要換算為不含稅的單價
            IF l_oodb005 = 'N' THEN  #暫估未稅單價轉換含稅單價
               LET l_xrcb.xrcb101 = l_xrcb.xrcb101 * (1 + l_oodb006/100)
            END IF
            #若應收單單價含稅則需要換算為不含稅的單價
            CALL s_tax_chk(g_glaa.glaacomp,t_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            IF l_oodb005 = 'N' THEN  #出貨未稅單價轉換含稅單價
               LET l_xrcb101 = t_xrcb.xrcb101 * (1 + l_oodb006/100)
            ELSE
               LET l_xrcb101 = t_xrcb.xrcb101
            END IF
         END IF

         LET l_xrcf.xrcf116 = (l_xrcb101 * l_rate1 - l_xrcb.xrcb101 * l_xrcf.xrcf102) * l_xrcf.xrcf007
        #LET l_xrcf.xrcf106 = s_num_round('1',l_xrcf.xrcf116 / t_xrca.xrca101,l_ooaj004)
         LET l_xrcf.xrcf117 = (l_xrcb101 * t_xrca.xrca101 - l_xrcb101 * l_rate1) * l_xrcf.xrcf007
         IF g_glaa.glaa015 = 'Y' THEN
            #計算本位幣二金額
            IF g_glaa.glaa017 = '1' THEN
               #换算基准:交易原幣
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa016,l_xrcf.xrcf106,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf126
               LET l_xrcf.xrcf127 = 0   # 原幣不存在匯差所以依交易原幣計算本位幣二匯差則為0
            ELSE
               #换算基准:帳簿幣別
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf116,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf126
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa016,l_xrcf.xrcf117,t_xrca.xrca121,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf127
            END IF
         ELSE
            LET l_xrcf.xrcf126 = 0
            LET l_xrcf.xrcf127 = 0
         END IF
         IF g_glaa.glaa019 = 'Y' THEN
            #計算本位幣三金額
            IF g_glaa.glaa021 = '1' THEN
               #换算基准:交易原幣
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,l_xrca.xrca100,g_glaa.glaa020,l_xrcf.xrcf106,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf136
               LET l_xrcf.xrcf137 = 0   # 原幣不存在匯差所以依交易原幣計算本位幣二匯差則為0
            ELSE
               #换算基准:帳簿幣別
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf116,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf136
               CALL s_axrt300_exrate(g_glaa.glaa002,l_xrca.xrcadocdt,g_glaa.glaa001,g_glaa.glaa020,l_xrcf.xrcf117,t_xrca.xrca131,g_glaa.glaacomp)
                  RETURNING l_success,l_xrcf.xrcf137
            END IF
         ELSE
            LET l_xrcf.xrcf136 = 0
            LET l_xrcf.xrcf137 = 0
         END IF
         CALL s_tax_chk(g_glaa.glaacomp,l_xrcb.xrcb020) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
         #累加價差
         LET l_diff1_up = l_diff1_up + l_xrcf.xrcf106   #原幣價差
         LET l_diff2_up = l_diff2_up + l_xrcf.xrcf116   #原幣價差
         LET l_diff3_up = l_diff3_up + l_xrcf.xrcf126   #原幣價差
         LET l_diff4_up = l_diff4_up + l_xrcf.xrcf136   #原幣價差

         #累加匯差
         LET l_diff1_ra = l_diff1_ra + 0                #原幣價差  ---不存在
         LET l_diff2_ra = l_diff2_ra + l_xrcf.xrcf117   #原幣價差
         LET l_diff3_ra = l_diff3_ra + l_xrcf.xrcf127   #原幣價差
         LET l_diff4_ra = l_diff4_ra + l_xrcf.xrcf137   #原幣價差

         LET l_xrcf.xrcf106 = 0
         LET l_xrcf.xrcf116 = 0   LET l_xrcf.xrcf117 = 0
         LET l_xrcf.xrcf126 = 0   LET l_xrcf.xrcf127 = 0
         LET l_xrcf.xrcf136 = 0   LET l_xrcf.xrcf137 = 0

         IF g_glaa.glaa015 = 'Y' THEN
            LET l_xrcf.xrcf122 = l_xrca.xrca121
         END IF
         IF g_glaa.glaa019 = 'Y' THEN
            LET l_xrcf.xrcf132 = l_xrca.xrca131
         END IF

         IF p_type = 'Y' THEN
           #150401-00010#2 Add  ---(S)---
            IF cl_null(l_xrcadocno_tmp) OR l_xrcadocno_tmp <> l_xrcb.xrcbdocno THEN
                #161212-00005#2---add---begin--------------------
                #INSERT INTO xrcf_t VALUES(l_xrcf.*)
                INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                                    xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                                    xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                                    xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                                    xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                                    xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                                    xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                                    xrcf135,xrcf136,xrcf137)
                 VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                        l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                        l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                        l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                        l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                        l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                        l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                        l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
                #161212-00005#2---add---end-----------------
            ELSE
               UPDATE xrcf_t SET xrcf103 = xrcf103 + l_xrcf.xrcf103,
                                 xrcf104 = xrcf104 + l_xrcf.xrcf104,
                                 xrcf105 = xrcf105 + l_xrcf.xrcf105,
                                 xrcf113 = xrcf113 + l_xrcf.xrcf113,
                                 xrcf114 = xrcf114 + l_xrcf.xrcf114,
                                 xrcf115 = xrcf115 + l_xrcf.xrcf115,
                                 xrcf123 = xrcf123 + l_xrcf.xrcf123,
                                 xrcf124 = xrcf124 + l_xrcf.xrcf124,
                                 xrcf125 = xrcf125 + l_xrcf.xrcf125,
                                 xrcf133 = xrcf133 + l_xrcf.xrcf133,
                                 xrcf134 = xrcf134 + l_xrcf.xrcf134,
                                 xrcf135 = xrcf135 + l_xrcf.xrcf135
                WHERE xrcfent   = g_enterprise
                  AND xrcfdocno = l_xrcf.xrcfdocno
                  AND xrcfld    = l_xrcf.xrcfld
                  AND xrcf008   = l_xrcf.xrcf008
            END IF
            LET l_xrcadocno_tmp = l_xrcb.xrcbdocno
           #150401-00010#2 Add  ---(S)---
         END IF
         LET r_xrcb023 = 'Y'
      
      END FOREACH
   END IF

   IF p_type = 'N' THEN RETURN r_xrcb023 END IF

   IF t_xrcb.xrcb001 = '19' OR t_xrcb.xrcb001 = '29' THEN
      RETURN r_xrcb023
   END IF

   IF cl_null(l_diff1_up) THEN LET l_diff1_up = 0 END IF
   IF cl_null(l_diff2_up) THEN LET l_diff2_up = 0 END IF
   IF cl_null(l_diff3_up) THEN LET l_diff3_up = 0 END IF
   IF cl_null(l_diff4_up) THEN LET l_diff4_up = 0 END IF

   IF cl_null(l_diff1_ra) THEN LET l_diff1_ra = 0 END IF
   IF cl_null(l_diff2_ra) THEN LET l_diff2_ra = 0 END IF
   IF cl_null(l_diff3_ra) THEN LET l_diff3_ra = 0 END IF
   IF cl_null(l_diff4_ra) THEN LET l_diff4_ra = 0 END IF

   IF t_xrcb.xrcb001[1,1] = '2' THEN
      LET l_diff1_up = l_diff1_up * -1
      LET l_diff2_up = l_diff2_up * -1
      LET l_diff3_up = l_diff3_up * -1
      LET l_diff4_up = l_diff4_up * -1

      LET l_diff1_ra = l_diff1_ra * -1
      LET l_diff2_ra = l_diff2_ra * -1
      LET l_diff3_ra = l_diff3_ra * -1
      LET l_diff4_ra = l_diff4_ra * -1
   END IF

   #處理價差
   IF l_diff1_up + l_diff2_up + l_diff3_up + l_diff4_up <> 0 THEN
      INITIALIZE l_xrcf.* TO NULL

      LET l_xrcf.xrcfent = g_enterprise
      LET l_xrcf.xrcfld  = t_xrca.xrcald
      LET l_xrcf.xrcfdocno=t_xrca.xrcadocno
      LET l_xrcf.xrcfseq = 0
      LET l_xrcf.xrcfseq2= 1
      LET l_xrcf.xrcf008 = 'DIFF'
      LET l_xrcf.xrcf105 = l_diff1_up   #s_num_round('1',l_diff1_up,l_ooaj004)
      LET l_xrcf.xrcf115 = l_diff2_up   #s_num_round('1',l_diff2_up,l_ooaj004)
      LET l_xrcf.xrcf125 = l_diff3_up   #s_num_round('1',l_diff3_up,l_ooaj004)
      LET l_xrcf.xrcf135 = l_diff4_up   #s_num_round('1',l_diff4_up,l_ooaj004)
      LET l_xrcf.xrcf021 = s_axrp130_get_glab(t_xrca.xrcald,'13',t_xrca.xrca007,'8304_11')
      
      UPDATE xrcf_t SET xrcf105 = xrcf105 + l_xrcf.xrcf105,
                        xrcf115 = xrcf115 + l_xrcf.xrcf115,
                        xrcf125 = xrcf125 + l_xrcf.xrcf125,
                        xrcf135 = xrcf135 + l_xrcf.xrcf135
       WHERE xrcfent = l_xrcf.xrcfent
         AND xrcfld  = l_xrcf.xrcfld
         AND xrcfseq = l_xrcf.xrcfseq
         AND xrcfseq2= l_xrcf.xrcfseq2
         AND xrcfdocno = l_xrcf.xrcfdocno
      IF SQLCA.SQLERRD[3] <> 1 THEN
         #161212-00005#2---add---begin--------------------
         #INSERT INTO xrcf_t VALUES(l_xrcf.*)
         INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                             xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                             xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                             xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                             xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                             xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                             xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                             xrcf135,xrcf136,xrcf137)
          VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                 l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                 l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                 l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                 l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                 l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                 l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                 l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
         #161212-00005#2---add---end-----------------
      END IF
   END IF

   #處理匯差
   IF l_diff1_ra + l_diff2_ra + l_diff3_ra + l_diff4_ra <> 0 THEN
      INITIALIZE l_xrcf.* TO NULL

      LET l_xrcf.xrcfent = g_enterprise
      LET l_xrcf.xrcfld  = t_xrca.xrcald
      LET l_xrcf.xrcfdocno=t_xrca.xrcadocno
      LET l_xrcf.xrcfseq = 0
      LET l_xrcf.xrcfseq2= 2
      LET l_xrcf.xrcf008 = 'DIFF'
      LET l_xrcf.xrcf105 = l_diff1_ra   #s_num_round('1',l_diff1_ra,l_ooaj004)
      LET l_xrcf.xrcf115 = l_diff2_ra   #s_num_round('1',l_diff2_ra,l_ooaj004)
      LET l_xrcf.xrcf125 = l_diff3_ra   #s_num_round('1',l_diff3_ra,l_ooaj004)
      LET l_xrcf.xrcf135 = l_diff4_ra   #s_num_round('1',l_diff4_ra,l_ooaj004)
      LET l_xrcf.xrcf021 = s_axrp130_get_glab(t_xrca.xrcald,'13',t_xrca.xrca007,'8304_12')
      
      UPDATE xrcf_t SET xrcf105 = xrcf105 + l_xrcf.xrcf105,
                        xrcf115 = xrcf115 + l_xrcf.xrcf115,
                        xrcf125 = xrcf125 + l_xrcf.xrcf125,
                        xrcf135 = xrcf135 + l_xrcf.xrcf135
       WHERE xrcfent = l_xrcf.xrcfent
         AND xrcfld  = l_xrcf.xrcfld
         AND xrcfseq = l_xrcf.xrcfseq
         AND xrcfseq2= l_xrcf.xrcfseq2
         AND xrcfdocno = l_xrcf.xrcfdocno
      IF SQLCA.SQLERRD[3] <> 1 THEN
         #161212-00005#2---add---begin--------------------
         #INSERT INTO xrcf_t VALUES(l_xrcf.*)
         INSERT INTO xrcf_t (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                             xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                             xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                             xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                             xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                             xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                             xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                             xrcf135,xrcf136,xrcf137)
          VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                 l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                 l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                 l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                 l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                 l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                 l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                 l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)
         #161212-00005#2---add---end--------------------
      END IF
   END IF

   RETURN r_xrcb023

END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL s_axrp130_create_tmp()
# Date & Author..: 2017/04/25 By 01531
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axrp130_create_tmp()

   DROP TABLE s_axrp130_tmp; #ODI-ORA#
   CREATE TEMP TABLE s_axrp130_tmp
   (
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcf107 LIKE xrcf_t.xrcf106,
       xrca001 LIKE xrca_t.xrca001       

   );
   #170929-00010#1 add s---

   DROP TABLE s_axrp130_tmp1; #ODI-ORA#
   CREATE TEMP TABLE s_axrp130_tmp1
   (
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137 #本位幣三匯差金額  

   );   
   
END FUNCTION

################################################################################
# Descriptions...: 杂项暂估新增xrcf
# Memo...........:
# Usage..........: CALL s_axrp130_ins_xrcf1(p_xrcadocno,p_xrcald,p_sfin1002,p_sfin2012)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_axrp130_ins_xrcf1(p_xrcadocno,p_xrcald,p_sfin1002,p_sfin2012)
   DEFINE p_sfin1002   LIKE type_t.chr1
   DEFINE p_sfin2012   LIKE type_t.chr1
   DEFINE p_xrcadocno  LIKE xrca_t.xrcadocno
   DEFINE p_xrcald     LIKE xrca_t.xrcald
   DEFINE l_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
    DEFINE l_xrcb RECORD  #應收憑單單身
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
       xrcbud001 LIKE xrcb_t.xrcbud001, #自定義欄位(文字)001
       xrcbud002 LIKE xrcb_t.xrcbud002, #自定義欄位(文字)002
       xrcbud003 LIKE xrcb_t.xrcbud003, #自定義欄位(文字)003
       xrcbud004 LIKE xrcb_t.xrcbud004, #自定義欄位(文字)004
       xrcbud005 LIKE xrcb_t.xrcbud005, #自定義欄位(文字)005
       xrcbud006 LIKE xrcb_t.xrcbud006, #自定義欄位(文字)006
       xrcbud007 LIKE xrcb_t.xrcbud007, #自定義欄位(文字)007
       xrcbud008 LIKE xrcb_t.xrcbud008, #自定義欄位(文字)008
       xrcbud009 LIKE xrcb_t.xrcbud009, #自定義欄位(文字)009
       xrcbud010 LIKE xrcb_t.xrcbud010, #自定義欄位(文字)010
       xrcbud011 LIKE xrcb_t.xrcbud011, #自定義欄位(數字)011
       xrcbud012 LIKE xrcb_t.xrcbud012, #自定義欄位(數字)012
       xrcbud013 LIKE xrcb_t.xrcbud013, #自定義欄位(數字)013
       xrcbud014 LIKE xrcb_t.xrcbud014, #自定義欄位(數字)014
       xrcbud015 LIKE xrcb_t.xrcbud015, #自定義欄位(數字)015
       xrcbud016 LIKE xrcb_t.xrcbud016, #自定義欄位(數字)016
       xrcbud017 LIKE xrcb_t.xrcbud017, #自定義欄位(數字)017
       xrcbud018 LIKE xrcb_t.xrcbud018, #自定義欄位(數字)018
       xrcbud019 LIKE xrcb_t.xrcbud019, #自定義欄位(數字)019
       xrcbud020 LIKE xrcb_t.xrcbud020, #自定義欄位(數字)020
       xrcbud021 LIKE xrcb_t.xrcbud021, #自定義欄位(日期時間)021
       xrcbud022 LIKE xrcb_t.xrcbud022, #自定義欄位(日期時間)022
       xrcbud023 LIKE xrcb_t.xrcbud023, #自定義欄位(日期時間)023
       xrcbud024 LIKE xrcb_t.xrcbud024, #自定義欄位(日期時間)024
       xrcbud025 LIKE xrcb_t.xrcbud025, #自定義欄位(日期時間)025
       xrcbud026 LIKE xrcb_t.xrcbud026, #自定義欄位(日期時間)026
       xrcbud027 LIKE xrcb_t.xrcbud027, #自定義欄位(日期時間)027
       xrcbud028 LIKE xrcb_t.xrcbud028, #自定義欄位(日期時間)028
       xrcbud029 LIKE xrcb_t.xrcbud029, #自定義欄位(日期時間)029
       xrcbud030 LIKE xrcb_t.xrcbud030, #自定義欄位(日期時間)030
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
  DEFINE l_xrcc RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrccud001 LIKE xrcc_t.xrccud001, #自定義欄位(文字)001
       xrccud002 LIKE xrcc_t.xrccud002, #自定義欄位(文字)002
       xrccud003 LIKE xrcc_t.xrccud003, #自定義欄位(文字)003
       xrccud004 LIKE xrcc_t.xrccud004, #自定義欄位(文字)004
       xrccud005 LIKE xrcc_t.xrccud005, #自定義欄位(文字)005
       xrccud006 LIKE xrcc_t.xrccud006, #自定義欄位(文字)006
       xrccud007 LIKE xrcc_t.xrccud007, #自定義欄位(文字)007
       xrccud008 LIKE xrcc_t.xrccud008, #自定義欄位(文字)008
       xrccud009 LIKE xrcc_t.xrccud009, #自定義欄位(文字)009
       xrccud010 LIKE xrcc_t.xrccud010, #自定義欄位(文字)010
       xrccud011 LIKE xrcc_t.xrccud011, #自定義欄位(數字)011
       xrccud012 LIKE xrcc_t.xrccud012, #自定義欄位(數字)012
       xrccud013 LIKE xrcc_t.xrccud013, #自定義欄位(數字)013
       xrccud014 LIKE xrcc_t.xrccud014, #自定義欄位(數字)014
       xrccud015 LIKE xrcc_t.xrccud015, #自定義欄位(數字)015
       xrccud016 LIKE xrcc_t.xrccud016, #自定義欄位(數字)016
       xrccud017 LIKE xrcc_t.xrccud017, #自定義欄位(數字)017
       xrccud018 LIKE xrcc_t.xrccud018, #自定義欄位(數字)018
       xrccud019 LIKE xrcc_t.xrccud019, #自定義欄位(數字)019
       xrccud020 LIKE xrcc_t.xrccud020, #自定義欄位(數字)020
       xrccud021 LIKE xrcc_t.xrccud021, #自定義欄位(日期時間)021
       xrccud022 LIKE xrcc_t.xrccud022, #自定義欄位(日期時間)022
       xrccud023 LIKE xrcc_t.xrccud023, #自定義欄位(日期時間)023
       xrccud024 LIKE xrcc_t.xrccud024, #自定義欄位(日期時間)024
       xrccud025 LIKE xrcc_t.xrccud025, #自定義欄位(日期時間)025
       xrccud026 LIKE xrcc_t.xrccud026, #自定義欄位(日期時間)026
       xrccud027 LIKE xrcc_t.xrccud027, #自定義欄位(日期時間)027
       xrccud028 LIKE xrcc_t.xrccud028, #自定義欄位(日期時間)028
       xrccud029 LIKE xrcc_t.xrccud029, #自定義欄位(日期時間)029
       xrccud030 LIKE xrcc_t.xrccud030, #自定義欄位(日期時間)030
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
    DEFINE l_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137 #本位幣三匯差金額
       END RECORD
   DEFINE l_glaa001 LIKE glaa_t.glaa001 
   DEFINE l_xrca011 LIKE xrca_t.xrca011
   DEFINE l_xrca100 LIKE xrca_t.xrca100
   DEFINE l_xrca007 LIKE xrca_t.xrca007
   DEFINE l_xrca035 LIKE xrca_t.xrca035
   DEFINE l_xrcb002 LIKE xrcb_t.xrcb002
   DEFINE l_xrcb003 LIKE xrcb_t.xrcb003
   DEFINE l_xrcb103 LIKE xrcb_t.xrcb103
   DEFINE l_xrcb113 LIKE xrcb_t.xrcb113
   DEFINE l_xrcb105 LIKE xrcb_t.xrcb105
   DEFINE r_success LIKE type_t.num5
   DEFINE l_sql     STRING
   DEFINE l_glaa004 LIKE glaa_t.glaa004
   DEFINE l_sfin2012 LIKE type_t.chr1
   DEFINE l_amt     LIKE type_t.num5
   DEFINE l_glaacomp LIKE glaa_t.glaacomp
   DEFINE l_xrcb029  LIKE xrcb_t.xrcb029
   DEFINE l_sfin2005 LIKE type_t.chr1
   DEFINE l_sfin2011 LIKE type_t.chr1 
   DEFINE l_seq      LIKE type_t.num5
 
   
   
   LET  r_success = TRUE
   
   DELETE FROM s_axrp130_tmp1;
   
   SELECT glaa001,glaa004,glaacomp INTO l_glaa001,l_glaa004,l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcald
   
   LET l_sql = " SELECT xrca100,xrcb002,xrcb003,xrcb103,xrcb113,xrcb105,xrcb029 FROM xrcb_t,xrca_t WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcbld = xrcald ",
               "    AND xrcbent = ",g_enterprise," AND xrcbdocno ='",p_xrcadocno,"'"
   PREPARE s_axrp130_xrcb_prep FROM l_sql
   DECLARE s_axrp130_xrcb_curs CURSOR FOR s_axrp130_xrcb_prep
   
   
   LET l_sql = "SELECT DISTINCT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,",
               "xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,",
               "xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,",
               "xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,",
               "xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,",
               "xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,",
               "xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,",
               "xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,",
               "xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,",
               "xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,xrcaud006,",
               "xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,xrcaud016,",
               "xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,xrcaud026,",
               "xrcaud027,xrcaud028,xrcaud029,xrcaud030,",
               "xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,xrcb005,xrcb006,",
               "xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,xrcb014,xrcb015,xrcb016,xrcb017,",
               "xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,",
               "xrcb030,xrcb031,xrcb032,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,",
               "xrcb043,xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,xrcb102,xrcb103,",
               "xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,",
               "xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,xrcb134,xrcb135,xrcb136,xrcbud001,xrcbud002,xrcbud003,xrcbud004,",
               "xrcbud005,xrcbud006,xrcbud007,xrcbud008,xrcbud009,xrcbud010,xrcbud011,xrcbud012,xrcbud013,xrcbud014,xrcbud015,",
               "xrcbud016,xrcbud017,xrcbud018,xrcbud019,xrcbud020,xrcbud021,xrcbud022,xrcbud023,xrcbud024,xrcbud025,xrcbud026,",
               "xrcbud027,xrcbud028,xrcbud029,xrcbud030,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,xrcb059,xrcb060,xrcb107 ",
               "    FROM xrca_t,xrcb_t ",
               "   WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
               "     AND xrcastus = 'Y' AND xrca001 IN ('03','04')  ",
               "     AND xrcaent = ",g_enterprise," AND xrcald = '",p_xrcald,"'",
               "     AND xrcadocno = ? AND xrcbseq = ?",
               "     AND xrca100 = ?",  
               "   ORDER BY xrcadocno,xrcbseq "  
    PREPARE s_axrp130_xrcb_prep2 FROM l_sql
    DECLARE s_axrp130_xrcb_curs2 CURSOR FOR s_axrp130_xrcb_prep2
    
    SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcald
    CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011    
    CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2005') RETURNING l_sfin2005  
    
    LET l_sql = " SELECT xrccseq,xrcc001,xrcc102,xrcc122,xrcc132 FROM xrcc_t",
                "  WHERE xrccent = ",g_enterprise," AND xrccdocno =? AND xrccld = '",p_xrcald,"' AND xrccseq = ?"
    PREPARE s_axrp130_xrcb_prep4 FROM l_sql
                
#    IF p_sfin1002 ='3' THEN 
#       LET l_sql = l_sql," AND xrccseq = ?"
#    END IF    
    
    #取得暂估单核算項資料 
    LET l_sql = "SELECT xrcborga,",
                #"       xrcb010,xrcb011,xrcb024,xrcb036,xrcb004,",    #180807-00063#1 mark
                "       xrcb010,xrcb011,xrcb024,xrcb036,xrcb012,",     #180807-00063#1 add
                "       xrcb051,xrcb015,xrcb016,xrcb033,xrcb034,",
                "       xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,",
                "       xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,",
                "       xrcb046,xrcb047,xrcb021 ",
                "  FROM xrcb_t",
                " WHERE xrcbent = ",g_enterprise," AND xrcbld = '",p_xrcald,"'",
                "   AND xrcbdocno = ? ",
                "   AND xrcb001 IN ('19','29') "
    PREPARE s_axrp130_xrcb_prep3 FROM l_sql
 

   
    FOREACH s_axrp130_xrcb_curs INTO l_xrca100,l_xrcb002,l_xrcb003,l_xrcb103,l_xrcb113,l_xrcb105,l_xrcb029 #立账单获取单身暂估单
       LET l_xrcf.xrcfent = g_enterprise
       LET l_xrcf.xrcfld  = p_xrcald
       LET l_xrcf.xrcfdocno=p_xrcadocno
     
#       SELECT MAX(xrcfseq) + 1 INTO l_xrcf.xrcfseq
#         FROM xrcf_t
#        WHERE xrcfent = g_enterprise AND xrcfld = p_xrcald
#          AND xrcfdocno=p_xrcadocno
       IF cl_null(l_xrcf.xrcfseq) THEN 
          LET l_xrcf.xrcfseq = 1
       ELSE 
          LET l_xrcf.xrcfseq = l_xrcf.xrcfseq + 1      
       END IF
       
       LET l_xrcf.xrcf007 = 1
       LET l_xrcf.xrcfseq2 = 0
       LET l_xrcf.xrcf001 = g_prog
       LET l_xrcf.xrcf002 = '01'                 #固定值
       
       
       SELECT xrca011,xrca007,xrca035 INTO l_xrca011,l_xrca007,l_xrca035 FROM xrca_t WHERE xrcaent = g_enterprise
          AND xrcald = p_xrcald
          AND xrcadocno = p_xrcadocno
       LET l_xrcf.xrcf020 = l_xrca011
       #暫估期初迴轉 後, 應該不需要再參考 axri011 的了, 直接與帳款的
       #因為期初已經被迴轉了 所以 axrt330 沖暫估不會有科目
       IF l_sfin2011 ='Y' AND l_sfin2005 = 'Y' THEN 
          LET l_xrcf.xrcf021 = l_xrcb.xrcb029 
       ELSE
          LET l_xrcf.xrcf021 = ''     
       END IF
 
              
       
       #當期沖暫估的科目及資產類科目
       SELECT xrcb021 INTO l_xrcf.xrcf022 FROM xrcb_t WHERE xrcbent = g_enterprise AND xrcbld = p_xrcald AND xrcbdocno = p_xrcadocno
       
       CALL s_fin_get_account(p_xrcald,'13',l_xrca007,'8304_03')  RETURNING g_sub_success,l_xrcf.xrcf023,g_errno   
       CALL s_fin_get_account(p_xrcald,'13',l_xrca.xrca007,'8504_11') RETURNING g_sub_success,l_xrcf.xrcf024,g_errno
       CALL s_fin_get_account(p_xrcald,'13',l_xrca.xrca007,'8504_12') RETURNING g_sub_success,l_xrcf.xrcf025,g_errno    
    
       FOREACH s_axrp130_xrcb_curs2 USING l_xrcb002,l_xrcb003,l_xrca100 INTO l_xrca.*,l_xrcb.*#,l_xrcc.*    #取得暫估資料
#          IF p_sfin1002 ='3' THEN 
#             EXECUTE s_axrp130_xrcb_prep4 USING l_xrcb002,l_xrcb003 INTO l_xrcc.xrccseq,l_xrcc.xrcc001,l_xrcc.xrcc102,l_xrcc.xrcc122,l_xrcc.xrcc132 
#          ELSE
#             EXECUTE s_axrp130_xrcb_prep4 USING l_xrcb002 INTO l_xrcc.xrccseq,l_xrcc.xrcc001,l_xrcc.xrcc102,l_xrcc.xrcc122,l_xrcc.xrcc132 
#          END IF             
          IF p_sfin1002 ='3' THEN 
             EXECUTE s_axrp130_xrcb_prep4 USING l_xrcb002,l_xrcb003 INTO l_xrcc.xrccseq,l_xrcc.xrcc001,l_xrcc.xrcc102,l_xrcc.xrcc122,l_xrcc.xrcc132 
          ELSE
             LET l_seq = 1
             EXECUTE s_axrp130_xrcb_prep4 USING l_xrcb002,l_seq INTO l_xrcc.xrccseq,l_xrcc.xrcc001,l_xrcc.xrcc102,l_xrcc.xrcc122,l_xrcc.xrcc132 
          END IF             
          
          LET l_xrcf.xrcf029 = l_xrca.xrca004       #交易客商
          LET l_xrcf.xrcf030 = l_xrca.xrca005       #帳款客商
          LET l_xrcf.xrcf101 = ''                   #NO USE
          LET l_xrcf.xrcf102 = l_xrcc.xrcc102       #本幣一匯率    
          LET l_xrcf.xrcf111 = ''                   #NO USE
          LET l_xrcf.xrcf122 = l_xrcc.xrcc122       #本幣二匯率    
          LET l_xrcf.xrcf132 = l_xrcc.xrcc132       #本幣三匯率    
          LET l_xrcf.xrcf008 = l_xrca.xrcadocno
          #180221-00030#2 mark-s   修改#180507-00028#1单号，多修改的部分忘记删除，故在此mark
#          #180507-00028#1 add-s
#          IF g_prog MATCHES 'axrt300*' OR g_prog MATCHES 'axrt340' THEN
#            #根据立账单原币计算本币金额
#            LET l_xrcf.xrcf103 = l_xrcb103
#            LET l_xrcf.xrcf105 = l_xrcb105
#            LET l_xrcf.xrcf104 = l_xrcf.xrcf105-l_xrcf.xrcf103
#            LET l_xrcf.xrcf113 = l_xrcb103 * l_xrca.xrca101 
#            LET l_xrcf.xrcf115 = l_xrcb105 * l_xrca.xrca101 
#            LET l_xrcf.xrcf114 = l_xrcf.xrcf115-l_xrcf.xrcf113 
#          ELSE
#          #180507-00028#1 add-e 
          #180221-00030#2 mark-e          
             CASE
                WHEN p_sfin2012 ='1'    #雜項  /立帳未稅
                   IF l_xrca100 = l_xrca.xrca100 THEN        #同幣別沖暫估
                      LET l_xrcf.xrcf103 = l_xrcb103
                      LET l_xrcf.xrcf104 = 0
                      LET l_xrcf.xrcf105 = l_xrcb103
                      LET l_xrcf.xrcf113 = l_xrcb103 * l_xrcf.xrcf102 
                      LET l_xrcf.xrcf114 = 0
                      LET l_xrcf.xrcf115 = l_xrcb103 * l_xrcf.xrcf102  
                      CALL s_curr_round_ld('1',p_xrcald,l_glaa001,l_xrcf.xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf.xrcf113
                      CALL s_curr_round_ld('1',p_xrcald,l_glaa001,l_xrcf.xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf.xrcf115
                   ELSE                                      #不同幣別沖暫估
                      LET l_xrcf.xrcf113 = l_xrcb113
                      LET l_xrcf.xrcf114 = 0
                      LET l_xrcf.xrcf115 = l_xrcb113
                      LET l_xrcf.xrcf104 = 0
                      CALL s_curr_round_ld('1',p_xrcald,l_glaa001,l_xrcf.xrcf113/l_xrcf.xrcf102,2) RETURNING g_sub_success,g_errno,l_xrcf.xrcf103  
                      CALL s_curr_round_ld('1',p_xrcald,l_glaa001,l_xrcf.xrcf115/l_xrcf.xrcf102,2) RETURNING g_sub_success,g_errno,l_xrcf.xrcf105 
                   END IF
             
                WHEN p_sfin2012 ='2'    #雜項  /立帳含稅
                     IF l_xrca.xrca013 = 'N' THEN
                        LET l_amt = l_xrcb103
                     ELSE
                        LET l_amt = l_xrcb105
                     END IF
                     
                     CALL s_tax_count(l_glaacomp,l_xrca.xrca011,l_amt,1,l_xrca.xrca100,l_xrcf.xrcf102)  
                          RETURNING l_xrcf.xrcf103,l_xrcf.xrcf104,l_xrcf.xrcf105,
                                    l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115
             END CASE
                     
#          END IF #180507-00028#1 add  #180221-00030#2 mark         
          LET l_xrcf.xrcf009 = l_xrcc.xrccseq
          LET l_xrcf.xrcf010 = l_xrcc.xrcc001  #期别

          EXECUTE s_axrp130_xrcb_prep3 USING l_xrca.xrcadocno INTO l_xrcf.xrcforga,
                 l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf031,l_xrcf.xrcf032,
                 l_xrcf.xrcf033,l_xrcf.xrcf034,l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,
                 l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,
                 l_xrcf.xrcf043,l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,
                 l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf022
 
         INSERT INTO s_axrp130_tmp1 (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                             xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                             xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                             xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                             xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                             xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                             xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                             xrcf135,xrcf136,xrcf137)
          VALUES(l_xrcf.xrcfent,l_xrcf.xrcfld,l_xrcf.xrcfdocno,l_xrcf.xrcfseq,l_xrcf.xrcfseq2,l_xrcf.xrcf001,l_xrcf.xrcf002,l_xrcf.xrcf007,l_xrcf.xrcf008,
                 l_xrcf.xrcf009,l_xrcf.xrcf010,l_xrcf.xrcf020,l_xrcf.xrcf021,l_xrcf.xrcf022,l_xrcf.xrcf023,l_xrcf.xrcf024,l_xrcf.xrcf025,l_xrcf.xrcforga,
                 l_xrcf.xrcf026,l_xrcf.xrcf027,l_xrcf.xrcf028,l_xrcf.xrcf029,l_xrcf.xrcf030,l_xrcf.xrcf031,l_xrcf.xrcf032,l_xrcf.xrcf033,l_xrcf.xrcf034,
                 l_xrcf.xrcf035,l_xrcf.xrcf036,l_xrcf.xrcf037,l_xrcf.xrcf038,l_xrcf.xrcf039,l_xrcf.xrcf040,l_xrcf.xrcf041,l_xrcf.xrcf042,l_xrcf.xrcf043,
                 l_xrcf.xrcf044,l_xrcf.xrcf045,l_xrcf.xrcf046,l_xrcf.xrcf047,l_xrcf.xrcf048,l_xrcf.xrcf049,l_xrcf.xrcf101,l_xrcf.xrcf102,l_xrcf.xrcf103,
                 l_xrcf.xrcf104,l_xrcf.xrcf105,l_xrcf.xrcf106,l_xrcf.xrcf111,l_xrcf.xrcf113,l_xrcf.xrcf114,l_xrcf.xrcf115,l_xrcf.xrcf116,l_xrcf.xrcf117,
                 l_xrcf.xrcf122,l_xrcf.xrcf123,l_xrcf.xrcf124,l_xrcf.xrcf125,l_xrcf.xrcf126,l_xrcf.xrcf127,l_xrcf.xrcf132,l_xrcf.xrcf133,l_xrcf.xrcf134,
                 l_xrcf.xrcf135,l_xrcf.xrcf136,l_xrcf.xrcf137)      
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "tmp1_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE                           
        END IF      
      
      END FOREACH  
   END FOREACH
   IF r_success = TRUE THEN 
      IF p_sfin1002 ='1' OR p_sfin1002 ='2' THEN 
         INSERT INTO xrcf_t(xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                 xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                 xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                 xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                 xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                 xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                 xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                 xrcf135,xrcf136,xrcf137)  
          SELECT xrcfent,xrcfld,xrcfdocno,1,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                 xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                 xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                 xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                 xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,SUM(xrcf103),
                 SUM(xrcf104),SUM(xrcf105),SUM(xrcf106),xrcf111,SUM(xrcf113),SUM(xrcf114),SUM(xrcf115),SUM(xrcf116),SUM(xrcf117),
                 xrcf122,SUM(xrcf123),SUM(xrcf124),SUM(xrcf125),SUM(xrcf126),SUM(xrcf127),xrcf132,SUM(xrcf133),SUM(xrcf134),
                 SUM(xrcf135),SUM(xrcf136),SUM(xrcf137) FROM s_axrp130_tmp1
                 GROUP BY xrcfent,xrcfld,xrcfdocno,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                 xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                 xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                 xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                 xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf111,
                 xrcf122,xrcf132
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "xrcf_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE                           
        END IF                   
      ELSE
         INSERT INTO xrcf_t(xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                 xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                 xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                 xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                 xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                 xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                 xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                 xrcf135,xrcf136,xrcf137) 
          SELECT xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,
                 xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                 xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                 xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                 xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                 xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                 xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                 xrcf135,xrcf136,xrcf137 FROM s_axrp130_tmp1
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "xrcf_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE                           
        END IF          
      END IF
   END IF   
   RETURN r_success
      
END FUNCTION

################################################################################
# Descriptions...: 复制s_axrp130_get_xrcf2改写
# Memo...........:
# Usage..........: CALL s_axrp130_get_xrcf2(p_ld,p_xrcadocno,p_type,p_xrca,p_xrcc,p_xrcb002,p_xrcb003,p_xrcb007,p_xrcb1)
#                  
# Modify.........: #180821-00038#2 add
################################################################################
PUBLIC FUNCTION s_axrp130_get_xrcf2(p_ld,p_xrcadocno,p_type,p_xrca,p_xrcc,p_xrcb002,p_xrcb003,p_xrcb007,p_xrcb1)
DEFINE p_ld          LIKE xrca_t.xrcald
DEFINE p_xrcadocno   LIKE xrca_t.xrcadocno   #立帳單據

DEFINE p_type        LIKE type_t.chr1        #1:非雜項/2:雜項
#161212-00005#2---add---begin--------------------
#DEFINE p_xrca        RECORD LIKE xrca_t.*    #t320暫估單據
#DEFINE p_xrcc        RECORD LIKE xrcc_t.*    #t320暫估單據
#DEFINE r_xrcf        RECORD LIKE xrcf_t.*    #回傳的xrcf暫估資料
DEFINE p_xrca RECORD  #應收憑單單頭
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
       xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
       xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
       xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
       xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
       xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
       xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
       xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
       xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
       xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
       xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
       xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
       xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
       xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
       xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
       xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
       xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
       xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
       xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
       xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
       xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
       xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
       xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
       xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
       xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
       xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
       xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
       xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
       xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
       xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
       xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
       xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
       END RECORD
DEFINE p_xrcc RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrccud001 LIKE xrcc_t.xrccud001, #自定義欄位(文字)001
       xrccud002 LIKE xrcc_t.xrccud002, #自定義欄位(文字)002
       xrccud003 LIKE xrcc_t.xrccud003, #自定義欄位(文字)003
       xrccud004 LIKE xrcc_t.xrccud004, #自定義欄位(文字)004
       xrccud005 LIKE xrcc_t.xrccud005, #自定義欄位(文字)005
       xrccud006 LIKE xrcc_t.xrccud006, #自定義欄位(文字)006
       xrccud007 LIKE xrcc_t.xrccud007, #自定義欄位(文字)007
       xrccud008 LIKE xrcc_t.xrccud008, #自定義欄位(文字)008
       xrccud009 LIKE xrcc_t.xrccud009, #自定義欄位(文字)009
       xrccud010 LIKE xrcc_t.xrccud010, #自定義欄位(文字)010
       xrccud011 LIKE xrcc_t.xrccud011, #自定義欄位(數字)011
       xrccud012 LIKE xrcc_t.xrccud012, #自定義欄位(數字)012
       xrccud013 LIKE xrcc_t.xrccud013, #自定義欄位(數字)013
       xrccud014 LIKE xrcc_t.xrccud014, #自定義欄位(數字)014
       xrccud015 LIKE xrcc_t.xrccud015, #自定義欄位(數字)015
       xrccud016 LIKE xrcc_t.xrccud016, #自定義欄位(數字)016
       xrccud017 LIKE xrcc_t.xrccud017, #自定義欄位(數字)017
       xrccud018 LIKE xrcc_t.xrccud018, #自定義欄位(數字)018
       xrccud019 LIKE xrcc_t.xrccud019, #自定義欄位(數字)019
       xrccud020 LIKE xrcc_t.xrccud020, #自定義欄位(數字)020
       xrccud021 LIKE xrcc_t.xrccud021, #自定義欄位(日期時間)021
       xrccud022 LIKE xrcc_t.xrccud022, #自定義欄位(日期時間)022
       xrccud023 LIKE xrcc_t.xrccud023, #自定義欄位(日期時間)023
       xrccud024 LIKE xrcc_t.xrccud024, #自定義欄位(日期時間)024
       xrccud025 LIKE xrcc_t.xrccud025, #自定義欄位(日期時間)025
       xrccud026 LIKE xrcc_t.xrccud026, #自定義欄位(日期時間)026
       xrccud027 LIKE xrcc_t.xrccud027, #自定義欄位(日期時間)027
       xrccud028 LIKE xrcc_t.xrccud028, #自定義欄位(日期時間)028
       xrccud029 LIKE xrcc_t.xrccud029, #自定義欄位(日期時間)029
       xrccud030 LIKE xrcc_t.xrccud030, #自定義欄位(日期時間)030
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
DEFINE r_xrcf RECORD  #應收沖暫估明細檔
       xrcfent LIKE xrcf_t.xrcfent, #企業編號
       xrcfld LIKE xrcf_t.xrcfld, #帳套
       xrcfdocno LIKE xrcf_t.xrcfdocno, #帳款單號
       xrcfseq LIKE xrcf_t.xrcfseq, #帳款單身項次
       xrcfseq2 LIKE xrcf_t.xrcfseq2, #沖銷項次
       xrcf001 LIKE xrcf_t.xrcf001, #作業別
       xrcf002 LIKE xrcf_t.xrcf002, #沖銷類型
       xrcf007 LIKE xrcf_t.xrcf007, #沖銷數量
       xrcf008 LIKE xrcf_t.xrcf008, #暫估單號碼
       xrcf009 LIKE xrcf_t.xrcf009, #暫估單號項次
       xrcf010 LIKE xrcf_t.xrcf010, #期別
       xrcf020 LIKE xrcf_t.xrcf020, #稅別
       xrcf021 LIKE xrcf_t.xrcf021, #應收暫估會科
       xrcf022 LIKE xrcf_t.xrcf022, #暫估未稅（收入）會科
       xrcf023 LIKE xrcf_t.xrcf023, #暫估稅額會科
       xrcf024 LIKE xrcf_t.xrcf024, #沖銷差異科目
       xrcf025 LIKE xrcf_t.xrcf025, #沖銷匯率差異科目
       xrcforga LIKE xrcf_t.xrcforga, #來源組織
       xrcf026 LIKE xrcf_t.xrcf026, #業務部門
       xrcf027 LIKE xrcf_t.xrcf027, #責任中心
       xrcf028 LIKE xrcf_t.xrcf028, #區域
       xrcf029 LIKE xrcf_t.xrcf029, #交易客商
       xrcf030 LIKE xrcf_t.xrcf030, #帳款客商
       xrcf031 LIKE xrcf_t.xrcf031, #客群
       xrcf032 LIKE xrcf_t.xrcf032, #產品類別
       xrcf033 LIKE xrcf_t.xrcf033, #業務人員
       xrcf034 LIKE xrcf_t.xrcf034, #專案編號
       xrcf035 LIKE xrcf_t.xrcf035, #WBS
       xrcf036 LIKE xrcf_t.xrcf036, #經營方式
       xrcf037 LIKE xrcf_t.xrcf037, #通路
       xrcf038 LIKE xrcf_t.xrcf038, #品牌
       xrcf039 LIKE xrcf_t.xrcf039, #自由核算項一
       xrcf040 LIKE xrcf_t.xrcf040, #自由核算項二
       xrcf041 LIKE xrcf_t.xrcf041, #自由核算項三
       xrcf042 LIKE xrcf_t.xrcf042, #自由核算項四
       xrcf043 LIKE xrcf_t.xrcf043, #自由核算項五
       xrcf044 LIKE xrcf_t.xrcf044, #自由核算項六
       xrcf045 LIKE xrcf_t.xrcf045, #自由核算項七
       xrcf046 LIKE xrcf_t.xrcf046, #自由核算項八
       xrcf047 LIKE xrcf_t.xrcf047, #自由核算項九
       xrcf048 LIKE xrcf_t.xrcf048, #自由核算項十
       xrcf049 LIKE xrcf_t.xrcf049, #摘要
       xrcf101 LIKE xrcf_t.xrcf101, #原幣單價
       xrcf102 LIKE xrcf_t.xrcf102, #暫估原幣匯率
       xrcf103 LIKE xrcf_t.xrcf103, #原幣未稅金額
       xrcf104 LIKE xrcf_t.xrcf104, #原幣稅額
       xrcf105 LIKE xrcf_t.xrcf105, #原幣含稅金額
       xrcf106 LIKE xrcf_t.xrcf106, #原幣沖銷價格差異金額
       xrcf111 LIKE xrcf_t.xrcf111, #本幣單價
       xrcf113 LIKE xrcf_t.xrcf113, #本幣未稅金額
       xrcf114 LIKE xrcf_t.xrcf114, #本幣稅額
       xrcf115 LIKE xrcf_t.xrcf115, #本幣含稅金額
       xrcf116 LIKE xrcf_t.xrcf116, #本幣價格差異金額
       xrcf117 LIKE xrcf_t.xrcf117, #本幣匯差金額
       xrcf122 LIKE xrcf_t.xrcf122, #暫估本位幣二匯率
       xrcf123 LIKE xrcf_t.xrcf123, #本位幣二未稅金額
       xrcf124 LIKE xrcf_t.xrcf124, #本位幣二稅額
       xrcf125 LIKE xrcf_t.xrcf125, #本位幣二含稅金額
       xrcf126 LIKE xrcf_t.xrcf126, #本位幣二價格差異金額
       xrcf127 LIKE xrcf_t.xrcf127, #本位幣二匯差金額
       xrcf132 LIKE xrcf_t.xrcf132, #暫估本位幣三匯率
       xrcf133 LIKE xrcf_t.xrcf133, #本位幣三未稅金額
       xrcf134 LIKE xrcf_t.xrcf134, #本位幣三稅額
       xrcf135 LIKE xrcf_t.xrcf135, #本位幣三含稅金額
       xrcf136 LIKE xrcf_t.xrcf136, #本位幣三價格差異金額
       xrcf137 LIKE xrcf_t.xrcf137, #本位幣三匯差金額
       xrcfud001 LIKE xrcf_t.xrcfud001, #自定義欄位(文字)001
       xrcfud002 LIKE xrcf_t.xrcfud002, #自定義欄位(文字)002
       xrcfud003 LIKE xrcf_t.xrcfud003, #自定義欄位(文字)003
       xrcfud004 LIKE xrcf_t.xrcfud004, #自定義欄位(文字)004
       xrcfud005 LIKE xrcf_t.xrcfud005, #自定義欄位(文字)005
       xrcfud006 LIKE xrcf_t.xrcfud006, #自定義欄位(文字)006
       xrcfud007 LIKE xrcf_t.xrcfud007, #自定義欄位(文字)007
       xrcfud008 LIKE xrcf_t.xrcfud008, #自定義欄位(文字)008
       xrcfud009 LIKE xrcf_t.xrcfud009, #自定義欄位(文字)009
       xrcfud010 LIKE xrcf_t.xrcfud010, #自定義欄位(文字)010
       xrcfud011 LIKE xrcf_t.xrcfud011, #自定義欄位(數字)011
       xrcfud012 LIKE xrcf_t.xrcfud012, #自定義欄位(數字)012
       xrcfud013 LIKE xrcf_t.xrcfud013, #自定義欄位(數字)013
       xrcfud014 LIKE xrcf_t.xrcfud014, #自定義欄位(數字)014
       xrcfud015 LIKE xrcf_t.xrcfud015, #自定義欄位(數字)015
       xrcfud016 LIKE xrcf_t.xrcfud016, #自定義欄位(數字)016
       xrcfud017 LIKE xrcf_t.xrcfud017, #自定義欄位(數字)017
       xrcfud018 LIKE xrcf_t.xrcfud018, #自定義欄位(數字)018
       xrcfud019 LIKE xrcf_t.xrcfud019, #自定義欄位(數字)019
       xrcfud020 LIKE xrcf_t.xrcfud020, #自定義欄位(數字)020
       xrcfud021 LIKE xrcf_t.xrcfud021, #自定義欄位(日期時間)021
       xrcfud022 LIKE xrcf_t.xrcfud022, #自定義欄位(日期時間)022
       xrcfud023 LIKE xrcf_t.xrcfud023, #自定義欄位(日期時間)023
       xrcfud024 LIKE xrcf_t.xrcfud024, #自定義欄位(日期時間)024
       xrcfud025 LIKE xrcf_t.xrcfud025, #自定義欄位(日期時間)025
       xrcfud026 LIKE xrcf_t.xrcfud026, #自定義欄位(日期時間)026
       xrcfud027 LIKE xrcf_t.xrcfud027, #自定義欄位(日期時間)027
       xrcfud028 LIKE xrcf_t.xrcfud028, #自定義欄位(日期時間)028
       xrcfud029 LIKE xrcf_t.xrcfud029, #自定義欄位(日期時間)029
       xrcfud030 LIKE xrcf_t.xrcfud030  #自定義欄位(日期時間)030
       END RECORD
#161212-00005#2---add---end--------------------
DEFINE r_flag        LIKE type_t.chr1        #

DEFINE l_sfin2011    LIKE type_t.chr1        #迴轉否
DEFINE l_sfin2012    LIKE type_t.chr1        #含稅立帳否
DEFINE l_glaacomp    LIKE glaa_t.glaacomp    #所屬法人
DEFINE l_glaa001     LIKE glaa_t.glaa001
DEFINE l_glaa004     LIKE glaa_t.glaa004     #會計科目參照表
DEFINE l_glaa015     LIKE glaa_t.glaa015     #本位幣二啟用
DEFINE l_glaa016     LIKE glaa_t.glaa016     #本位幣二
DEFINE l_glaa017     LIKE glaa_t.glaa017     #本位幣二換算基準
DEFINE l_glaa019     LIKE glaa_t.glaa019     #本位幣三啟用
DEFINE l_glaa020     LIKE glaa_t.glaa020     #本位幣三
DEFINE l_glaa021     LIKE glaa_t.glaa021     #本位幣三換算基準
DEFINE l_glaa025     LIKE glaa_t.glaa025     #本位幣一換算基準
DEFINE l_glac007     LIKE glac_t.glac007     #科目性質

DEFINE l_xrca007     LIKE xrca_t.xrca007
DEFINE l_xrca035     LIKE xrca_t.xrca035
DEFINE l_xrca036     LIKE xrca_t.xrca036
DEFINE l_xrca100     LIKE xrca_t.xrca100     #交易幣幣別
DEFINE l_xrca101     LIKE xrca_t.xrca101     #本幣匯率
DEFINE l_xrca121     LIKE xrca_t.xrca121
DEFINE l_xrca131     LIKE xrca_t.xrca131
DEFINE l_xrcb101     LIKE xrcb_t.xrcb101     #t320暫估單價
DEFINE l_xrcc108     LIKE xrcc_t.xrcc108     #計算用
DEFINE l_xrcf103     LIKE xrcf_t.xrcf103     #計算用
DEFINE l_xrcf105     LIKE xrcf_t.xrcf105     #計算用
DEFINE l_xrcb103     LIKE xrcb_t.xrcb105     #計算用
DEFINE l_xrcb105     LIKE xrcb_t.xrcb105     #計算用
DEFINE l_xrcf007     LIKE xrcf_t.xrcf007     #320可沖帳數量
DEFINE l_xrcf0071    LIKE xrcf_t.xrcf007     #320已沖帳數量
DEFINE l_xrcf1       RECORD                  #t320已沖帳
         xrcf103     LIKE xrcf_t.xrcf103,    #原幣未稅金額
         xrcf104     LIKE xrcf_t.xrcf104,    #原幣稅額
         xrcf105     LIKE xrcf_t.xrcf105,    #原幣含稅金額
         xrcf113     LIKE xrcf_t.xrcf113,    #本幣未稅金額
         xrcf114     LIKE xrcf_t.xrcf114,    #本幣稅額
         xrcf115     LIKE xrcf_t.xrcf115,    #本幣含稅金額
         xrcf123     LIKE xrcf_t.xrcf123,    #本幣二未稅金額
         xrcf124     LIKE xrcf_t.xrcf124,    #本幣二稅額
         xrcf125     LIKE xrcf_t.xrcf125,    #本幣二含稅金額
         xrcf133     LIKE xrcf_t.xrcf133,    #本幣三未稅金額
         xrcf134     LIKE xrcf_t.xrcf134,    #本幣三稅額
         xrcf135     LIKE xrcf_t.xrcf135,    #本幣三含稅金額
         xrch015     LIKE xrch_t.xrch015,    #DIFF3原币金额
         xrch016     LIKE xrch_t.xrch016     #DIFF3本币金额
                 END RECORD
DEFINE l_xrcf2       RECORD                  #t320立帳數量
         xrcf103     LIKE xrcf_t.xrcf103,
         xrcf104     LIKE xrcf_t.xrcf104,
         xrcf105     LIKE xrcf_t.xrcf105,
         xrcf113     LIKE xrcf_t.xrcf113,
         xrcf114     LIKE xrcf_t.xrcf114,
         xrcf115     LIKE xrcf_t.xrcf115,
         xrcf123     LIKE xrcf_t.xrcf123,
         xrcf124     LIKE xrcf_t.xrcf124,
         xrcf125     LIKE xrcf_t.xrcf125,
         xrcf133     LIKE xrcf_t.xrcf133,
         xrcf134     LIKE xrcf_t.xrcf134,
         xrcf135     LIKE xrcf_t.xrcf135
                 END RECORD
DEFINE l_xrcb002     LIKE xrcb_t.xrcb002     #t300此次要沖帳-入庫單號
DEFINE l_xrcb003     LIKE xrcb_t.xrcb003     #t300此次要沖帳-入庫單項次
DEFINE l_xrcb007     LIKE xrcb_t.xrcb007     #t300此次要沖帳-入庫單數量
DEFINE l_xrcb0071    LIKE xrcb_t.xrcb007     #
DEFINE l_xrcb1       RECORD                  #t300此次要沖帳
         xrcb101     LIKE xrcb_t.xrcb101,
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115,
         xrcb123     LIKE xrcb_t.xrcb123,
         xrcb124     LIKE xrcb_t.xrcb124,
         xrcb125     LIKE xrcb_t.xrcb125,
         xrcb133     LIKE xrcb_t.xrcb133,
         xrcb134     LIKE xrcb_t.xrcb134,
         xrcb135     LIKE xrcb_t.xrcb135,
         xrcborga    LIKE xrcb_t.xrcborga,         #來源組織
         xrcb010     LIKE xrcb_t.xrcb010,          #業務部門
         xrcb011     LIKE xrcb_t.xrcb011,          #責任中心
         xrcb024     LIKE xrcb_t.xrcb024,          #區域
         xrcb036     LIKE xrcb_t.xrcb036,          #客群
         #xrcb004     LIKE xrcb_t.xrcb004,          #產品類別     #180807-00063#1 mark
         xrcb012     LIKE xrcb_t.xrcb012,          #產品類別      #180807-00063#1 add
         xrcb051     LIKE xrcb_t.xrcb051,          #業務人員
         xrcb015     LIKE xrcb_t.xrcb015,          #專案編號
         xrcb016     LIKE xrcb_t.xrcb016,          #WBS
         xrcb033     LIKE xrcb_t.xrcb033,          #經營方式
         xrcb034     LIKE xrcb_t.xrcb034,          #渠道
         xrcb035     LIKE xrcb_t.xrcb035,          #品牌
         xrcb037     LIKE xrcb_t.xrcb037,          #自由核算項1
         xrcb038     LIKE xrcb_t.xrcb038,          #自由核算項2
         xrcb039     LIKE xrcb_t.xrcb039,          #自由核算項3
         xrcb040     LIKE xrcb_t.xrcb040,          #自由核算項4
         xrcb041     LIKE xrcb_t.xrcb041,          #自由核算項5
         xrcb042     LIKE xrcb_t.xrcb042,          #自由核算項6
         xrcb043     LIKE xrcb_t.xrcb043,          #自由核算項7
         xrcb044     LIKE xrcb_t.xrcb044,          #自由核算項8
         xrcb045     LIKE xrcb_t.xrcb045,          #自由核算項9
         xrcb046     LIKE xrcb_t.xrcb046,          #自由核算項10
         xrcb047     LIKE xrcb_t.xrcb047,          #摘要
         xrcb021     LIKE xrcb_t.xrcb021           #費用會計科目
                 END RECORD
DEFINE l_xrcf_tmp    DYNAMIC ARRAY OF type_xrcf_tmp
DEFINE l_i,l_cnt     LIKE type_t.num5
DEFINE l_rate        LIKE xrcf_t.xrcf102
DEFINE l_sql         STRING
DEFINE l_xrcadocdt1  LIKE xrca_t.xrcadocdt   #立帳單據-立帳日期
DEFINE l_xrcadocdt2  LIKE xrca_t.xrcadocdt   #暫估單據-立帳日期
DEFINE l_xrca011     LIKE xrca_t.xrca011     #160506-00008#1
DEFINE l_sfin1002    LIKE type_t.chr1        #160823-00027#1 Add
#160823-00027#1 Add  ---(S)---
DEFINE l_xrcb3       RECORD
         xrcb007     LIKE xrcb_t.xrcb007,
         xrcb101     LIKE xrcb_t.xrcb101,    #160912-00011#4 Add
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb115     LIKE xrcb_t.xrcb115
                     END RECORD
#160823-00027#1 Add  ---(E)---
#160912-00011#4 Add  ---(S)---
DEFINE l_oodbl004    LIKE oodbl_t.oodbl004
DEFINE l_oodb005     LIKE oodb_t.oodb005
DEFINE l_oodb006     LIKE oodb_t.oodb006
DEFINE l_oodb011     LIKE oodb_t.oodb011
DEFINE l_xrcb4       RECORD
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115
                     END RECORD
#160912-00011#4 Add  ---(E)---
#170225-00002#1--add--str--
DEFINE l_xrcf106_s   LIKE xrcf_t.xrcf106
DEFINE l_xrcf116_s   LIKE xrcf_t.xrcf116
DEFINE l_xrcf107_s   LIKE xrcf_t.xrcf106
DEFINE l_xrcf117_s   LIKE xrcf_t.xrcf116
DEFINE l_xrcc118     LIKE xrcc_t.xrcc118
#170225-00002#1--add--end
DEFINE l_amt         LIKE xrcc_t.xrcc108 #170325-00053#1 add
#170410-00053#1 add s---
DEFINE p_xrcb002     LIKE xrcb_t.xrcb002
DEFINE p_xrcb003     LIKE xrcb_t.xrcb003
DEFINE p_xrcb007     LIKE xrcb_t.xrcb007
DEFINE p_xrcb1       RECORD                  #t300此次要沖帳
         xrcb101     LIKE xrcb_t.xrcb101,
         xrcb103     LIKE xrcb_t.xrcb103,
         xrcb104     LIKE xrcb_t.xrcb104,
         xrcb105     LIKE xrcb_t.xrcb105,
         xrcb113     LIKE xrcb_t.xrcb113,
         xrcb114     LIKE xrcb_t.xrcb114,
         xrcb115     LIKE xrcb_t.xrcb115,
         xrcb123     LIKE xrcb_t.xrcb123,
         xrcb124     LIKE xrcb_t.xrcb124,
         xrcb125     LIKE xrcb_t.xrcb125,
         xrcb133     LIKE xrcb_t.xrcb133,
         xrcb134     LIKE xrcb_t.xrcb134,
         xrcb135     LIKE xrcb_t.xrcb135,
         xrcborga    LIKE xrcb_t.xrcborga,         #來源組織
         xrcb010     LIKE xrcb_t.xrcb010,          #業務部門
         xrcb011     LIKE xrcb_t.xrcb011,          #責任中心
         xrcb024     LIKE xrcb_t.xrcb024,          #區域
         xrcb036     LIKE xrcb_t.xrcb036,          #客群
         #xrcb004     LIKE xrcb_t.xrcb004,          #產品類別     #180807-00063#1 mark
         xrcb012     LIKE xrcb_t.xrcb012,          #產品類別      #180807-00063#1 add
         xrcb051     LIKE xrcb_t.xrcb051,          #業務人員
         xrcb015     LIKE xrcb_t.xrcb015,          #專案編號
         xrcb016     LIKE xrcb_t.xrcb016,          #WBS
         xrcb033     LIKE xrcb_t.xrcb033,          #經營方式
         xrcb034     LIKE xrcb_t.xrcb034,          #渠道
         xrcb035     LIKE xrcb_t.xrcb035,          #品牌
         xrcb037     LIKE xrcb_t.xrcb037,          #自由核算項1
         xrcb038     LIKE xrcb_t.xrcb038,          #自由核算項2
         xrcb039     LIKE xrcb_t.xrcb039,          #自由核算項3
         xrcb040     LIKE xrcb_t.xrcb040,          #自由核算項4
         xrcb041     LIKE xrcb_t.xrcb041,          #自由核算項5
         xrcb042     LIKE xrcb_t.xrcb042,          #自由核算項6
         xrcb043     LIKE xrcb_t.xrcb043,          #自由核算項7
         xrcb044     LIKE xrcb_t.xrcb044,          #自由核算項8
         xrcb045     LIKE xrcb_t.xrcb045,          #自由核算項9
         xrcb046     LIKE xrcb_t.xrcb046,          #自由核算項10
         xrcb047     LIKE xrcb_t.xrcb047,          #摘要
         xrcb021     LIKE xrcb_t.xrcb021           #費用會計科目
                 END RECORD
DEFINE l_xrcadocdt   LIKE xrca_t.xrcadocdt                 
#170410-00053#1 add e---
#180221-00030#2 add-s
DEFINE l_xrcb103_do    LIKE xrcb_t.xrcb103
DEFINE l_xrcb105_do    LIKE xrcb_t.xrcb105
DEFINE g_sum           LIKE type_t.num20_6  #t300整張單原幣總合
DEFINE g_sum1          LIKE type_t.num20_6  #t300整張單本幣總合
DEFINE l_sum1          LIKE type_t.num20_6  #t320整張單本幣總和
DEFINE l_diff          LIKE type_t.num20_6  #原幣相同時的t300-t320本幣差異
DEFINE l_xrcc101       LIKE xrcc_t.xrcc101
DEFINE l_xrcc102       LIKE xrcc_t.xrcc102
DEFINE l_oodb004       LIKE oodb_t.oodb004
DEFINE l_xrcacomp      LIKE xrca_t.xrcacomp
#180221-00030#2 add-e
#180906-00063#1----add----str
DEFINE l_xrcb1s        LIKE xrcb_t.xrcb113  
DEFINE l_xrcb3s        LIKE xrcb_t.xrcb113
#180906-00063#1----add----end
#180821-00038#2 add s---
DEFINE l_xrch         RECORD                 #沖暫估明細檔
         xrchent      LIKE xrch_t.xrchent,   #企業編號
         xrchcomp     LIKE xrch_t.xrchcomp,  #法人
         xrchsite     LIKE xrch_t.xrchsite,  #帳務組織
         xrchdocno    LIKE xrch_t.xrchdocno, #單據號碼
         xrchseq      LIKE xrch_t.xrchseq,   #項次
         xrch001      LIKE xrch_t.xrch001,   #暫估單號
         xrch002      LIKE xrch_t.xrch002,   #暫估項次
         xrch003      LIKE xrch_t.xrch003,   #出货單號
         xrch004      LIKE xrch_t.xrch004,   #出货單項次
         xrch005      LIKE xrch_t.xrch005,   #產品編號
         xrch006      LIKE xrch_t.xrch006,   #沖暫估數量
         xrch007      LIKE xrch_t.xrch007,   #原幣未稅單價
         xrch008      LIKE xrch_t.xrch008,   #本幣未稅單價
         xrch009      LIKE xrch_t.xrch009,   #DIFF 原幣價差金額
         xrch010      LIKE xrch_t.xrch010,   #DIFF 本幣價差金額
         xrch011      LIKE xrch_t.xrch011,   #DIFF 本幣匯差金額
         xrch012      LIKE xrch_t.xrch012,   #DIFF 原幣價差單價
         xrch013      LIKE xrch_t.xrch013,   #DIFF 本幣價差單價
         xrch014      LIKE xrch_t.xrch014,   #DIFF 本幣匯差單價
         xrch015      LIKE xrch_t.xrch015,   #DIFF 純差異原幣金額
         xrch016      LIKE xrch_t.xrch016,   #DIFF 純差異本幣金額
         xrch017      LIKE xrch_t.xrch017,   #原幣沖銷未稅金額
         xrch018      LIKE xrch_t.xrch018,   #原幣沖銷稅額
         xrch019      LIKE xrch_t.xrch019,   #原幣沖銷含稅金額
         xrch020      LIKE xrch_t.xrch020,   #本幣沖銷未稅金額
         xrch021      LIKE xrch_t.xrch021,   #本幣沖銷稅額
         xrch022      LIKE xrch_t.xrch022,   #本幣沖銷含稅金額
         xrch023      LIKE xrch_t.xrch023,   #暫估匯率
         xrch024      LIKE xrch_t.xrch024,   #沖暫估匯率
         xrch025      LIKE xrch_t.xrch025,   #暫估帳款性質      
         xrchud001    LIKE xrch_t.xrchud001, #自定義欄位(文字)001
         xrchud002    LIKE xrch_t.xrchud002, #自定義欄位(文字)002
         xrchud003    LIKE xrch_t.xrchud003, #自定義欄位(文字)003
         xrchud004    LIKE xrch_t.xrchud004, #自定義欄位(文字)004
         xrchud005    LIKE xrch_t.xrchud005, #自定義欄位(文字)005
         xrchud006    LIKE xrch_t.xrchud006, #自定義欄位(文字)006
         xrchud007    LIKE xrch_t.xrchud007, #自定義欄位(文字)007
         xrchud008    LIKE xrch_t.xrchud008, #自定義欄位(文字)008
         xrchud009    LIKE xrch_t.xrchud009, #自定義欄位(文字)009
         xrchud010    LIKE xrch_t.xrchud010, #自定義欄位(文字)010
         xrchud011    LIKE xrch_t.xrchud011, #自定義欄位(數字)011
         xrchud012    LIKE xrch_t.xrchud012, #自定義欄位(數字)012
         xrchud013    LIKE xrch_t.xrchud013, #自定義欄位(數字)013
         xrchud014    LIKE xrch_t.xrchud014, #自定義欄位(數字)014
         xrchud015    LIKE xrch_t.xrchud015, #自定義欄位(數字)015
         xrchud016    LIKE xrch_t.xrchud016, #自定義欄位(數字)016
         xrchud017    LIKE xrch_t.xrchud017, #自定義欄位(數字)017
         xrchud018    LIKE xrch_t.xrchud018, #自定義欄位(數字)018
         xrchud019    LIKE xrch_t.xrchud019, #自定義欄位(數字)019
         xrchud020    LIKE xrch_t.xrchud020, #自定義欄位(數字)020
         xrchud021    LIKE xrch_t.xrchud021, #自定義欄位(日期時間)021
         xrchud022    LIKE xrch_t.xrchud022, #自定義欄位(日期時間)022
         xrchud023    LIKE xrch_t.xrchud023, #自定義欄位(日期時間)023
         xrchud024    LIKE xrch_t.xrchud024, #自定義欄位(日期時間)024
         xrchud025    LIKE xrch_t.xrchud025, #自定義欄位(日期時間)025
         xrchud026    LIKE xrch_t.xrchud026, #自定義欄位(日期時間)026
         xrchud027    LIKE xrch_t.xrchud027, #自定義欄位(日期時間)027
         xrchud028    LIKE xrch_t.xrchud028, #自定義欄位(日期時間)028
         xrchud029    LIKE xrch_t.xrchud029, #自定義欄位(日期時間)029
         xrchud030    LIKE xrch_t.xrchud030  #自定義欄位(日期時間)030
                      END RECORD
DEFINE l_ooaj003          LIKE ooaj_t.ooaj003  
DEFINE l_num              LIKE type_t.num20_6
DEFINE l_price_diff       LIKE xrca_t.xrca101
DEFINE l_price_diff_max   LIKE xrca_t.xrca101
DEFINE l_price_diff_min   LIKE xrca_t.xrca101
DEFINE l_xrcasite         LIKE xrca_t.xrcasite
DEFINE l_j                LIKE type_t.num10  
DEFINE l_xrcb020          LIKE xrcb_t.xrcb020
DEFINE l_xrcb029          LIKE xrcb_t.xrcb029
DEFINE l_xrcb004          LIKE xrcb_t.xrcb004
DEFINE l_flag             LIKE type_t.chr1  
DEFINE l_xrcb020_t300     LIKE xrcb_t.xrcb020
DEFINE l_xrcbseq          LIKE xrcb_t.xrcbseq
DEFINE l_xrcb_o RECORD            
       xrcb103            LIKE xrcb_t.xrcb103,
       xrcb104            LIKE xrcb_t.xrcb104,
       xrcb105            LIKE xrcb_t.xrcb105,
       xrcb113            LIKE xrcb_t.xrcb113,
       xrcb114            LIKE xrcb_t.xrcb114,
       xrcb115            LIKE xrcb_t.xrcb115,
       xrcb020            LIKE xrcb_t.xrcb020,
       xrca101            LIKE xrca_t.xrca101,
       xrcb101            LIKE xrcb_t.xrcb101,
       xrcb007            LIKE xrcb_t.xrcb007
   END RECORD
DEFINE ls_js              STRING
DEFINE l_success          LIKE type_t.num5
DEFINE l_errno            LIKE type_t.chr100
DEFINE l_xrca012_t320     LIKE xrca_t.xrca012
DEFINE l_xrca012          LIKE xrca_t.xrca012
DEFINE l_xrca101_t320     LIKE xrca_t.xrca101
DEFINE l_xrcb101_t300     LIKE xrcb_t.xrcb101
DEFINE l_oodb0051         LIKE oodb_t.oodb005
DEFINE l_xrcb001          LIKE xrcb_t.xrcb001
DEFINE l_flag1            LIKE type_t.chr1
DEFINE l_xrch016          LIKE xrch_t.xrch016
#180821-00038#2 add e---          



   #l_xrca/l_xrcb(現在立帳的立帳單--axrt300)
   #p_xrca/p_xrcb(抓出來沖的暫估單--aapt320)

   WHENEVER ERROR CONTINUE

   #170410-00053#1 add s---
   LET l_xrcb1.* = p_xrcb1.*  
   LET l_xrcb002 = p_xrcb002 #t300单身来源单号(出货单/暂估单)
   LET l_xrcb003 = p_xrcb003 
   LET l_xrcb007 = p_xrcb007
   #170410-00053#1 add e---
   LET l_flag = 'N'  #180821-00038#2 add #标记是否是最后一次冲暂估
   LET l_flag1 = 'N' #180821-00038#2 add #标记是否写入diff3金额
   
   LET l_xrcbseq = p_xrcc.xrccseq #180821-00038#2 add t300项次
   
   #170225-00002#1--mod--str--
   SELECT glaacomp,glaa001,glaa004,glaa015,glaa016,
          glaa017,glaa019,glaa020,glaa021,glaa025
     INTO l_glaacomp,l_glaa001,l_glaa004,l_glaa015,l_glaa016,
          l_glaa017,l_glaa019,l_glaa020,l_glaa021,l_glaa025
     FROM glaa_t
    #WHERE glaaent=g_enterprise AND glaald=l_ld  #170321-00125#1 mark
    WHERE glaaent=g_enterprise AND glaald=p_ld   #170321-00125#1 add
   #170225-00002#1--mod--end
   
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-1002') RETURNING l_sfin1002   #160823-00027#1 Add  

   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2011') RETURNING l_sfin2011
   CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-2012') RETURNING l_sfin2012
  #IF l_sfin2011 = 'N' THEN LET l_sfin2012 = '1' END IF    #160823-00027#1 Mark

   SELECT xrca007,xrca035,xrca036,xrca101,xrca100,
          xrca121,xrca131,xrcadocdt  ##170410-00053#1 add xrcadocdt
          ,xrcasite,xrca012  #180821-00038#2 add
     INTO l_xrca007,l_xrca035,l_xrca036,l_xrca101,l_xrca100,
          l_xrca121,l_xrca131,l_xrcadocdt ##170410-00053#1 add xrcadocdt
          ,l_xrcasite,l_xrca012 #180821-00038#2 add
     FROM xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcald = p_ld AND xrcadocno= p_xrcadocno

   #180821-00038#2 add s---#单价允許誤差值计算
   #t300单头币别aooi150单价取位位数，
   SELECT ooaj003 INTO l_ooaj003  
     FROM ooaj_t
    WHERE ooajent = g_enterprise
      AND ooaj001 = (SELECT glaa026 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_ld)           
      AND ooaj002 = l_xrca100 
      
   #l_num = 允許誤差值 
   #允許誤差值 = 0.01(依axrt300單頭幣別設定檔-aooi150單價位數決定是0.01 or 0,001 or 0.0001)
   LET l_num=1
   IF l_ooaj003 > 0 THEN 
      FOR l_j = 1 to l_ooaj003 
          LET l_num = l_num * 0.1
      END FOR
   END IF   
   
    
   SELECT DISTINCT xrcb001,xrcb020,xrcb101 INTO l_xrcb001,l_xrcb020_t300,l_xrcb101_t300 FROM xrcb_t   #t300项次\稅別 
    WHERE xrcbent = g_enterprise AND xrcbld = p_ld AND xrcbdocno = p_xrcadocno
      AND xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003 AND xrcbseq = l_xrcbseq
   #180821-00038#2 add e---#单价允許誤差值计算   
   
   INITIALIZE r_xrcf.* TO NULL
   CALL l_xrcf_tmp.clear()
   #檢查t320是否被沖完暫估---(S)---
   LET l_xrcf105 = NULL    #有效的xrcf單據金額
   LET l_xrcc108 = NULL    #可沖的xrcc108的金額
   
   LET p_xrcc.xrcc108 = l_xrcc108
   LET p_xrcc.xrcc118 = l_xrcc118
 
   #檢查t300是否沖完暫估---(S)---(若立帳單沖完以後 就表示不用沖暫估了)
   LET l_xrcb103 = NULL
   LET l_xrcb105 = NULL
   LET l_xrcf103 = NULL
   LET l_xrcf105 = NULL
 
 
#   #沖帳情況：1整張單沖銷部分 2.全部沖完
#   LET r_xrcf.xrcf029 = p_xrca.xrca004       #交易客商
#   LET r_xrcf.xrcf030 = p_xrca.xrca005       #帳款客商
#   LET r_xrcf.xrcf101 = ''                   #NO USE
#   LET r_xrcf.xrcf102 = p_xrcc.xrcc102       #本幣一匯率   #170317-00029#2 mod p_xrca.xrca101 -> p_xrcc.xrcc102
#   LET r_xrcf.xrcf111 = ''                   #NO USE
#   LET r_xrcf.xrcf122 = p_xrcc.xrcc122       #本幣二匯率   #170317-00029#2 mod p_xrca.xrca121 -> p_xrcc.xrcc122
#   LET r_xrcf.xrcf132 = p_xrcc.xrcc132       #本幣三匯率   #170317-00029#2 mod p_xrca.xrca131 -> p_xrcc.xrcc132
   
#   #180221-00030#2 add-s         
#   LET l_xrcc102 = ''
#   SELECT xrcc101,xrcc102 INTO l_xrcc101,l_xrcc102 FROM xrcc_t 
#    WHERE xrccent = g_enterprise AND xrccld  = p_ld AND xrccdocno = p_xrca.xrcadocno
#      AND xrccseq = p_xrcc.xrccseq AND xrcc001 = p_xrcc.xrcc001        
#   LET r_xrcf.xrcf102 = l_xrcc102    
    
   #180221-00030#2 add-e
   {p_type0:全部(杂项/非杂项）--S--}
   IF p_type = '0' THEN
      LET l_cnt = 0
      #已冲数量用xrch抓取
      LET l_sql="SELECT SUM(xrch006),",
                "       SUM(xrch017),SUM(xrch018),SUM(xrch019),SUM(xrch020),SUM(xrch021),SUM(xrch022),",
                "       0,0,0,0,0,0,SUM(xrch015),SUM(xrch016) ",  #本位币二三金额暂不考虑
                "  FROM xrch_t",
                " WHERE xrchent = ",g_enterprise,
                #"  AND xrchdocno <> '",p_xrcadocno,"' AND xrchseq <> ",l_xrcbseq,
                "   AND xrch001 = ? AND xrch002 = ?"   #暂估单号
      PREPARE s_axrp130_sum_xrcb_pr_1 FROM l_sql  
      
      #t320立暫估數量
                #非杂项
      LET l_sql="SELECT xrcb007,xrcb107,xrcb101,xrcb020,",                  
                "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
                "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135",
                "  FROM xrca_t,xrcb_t",
                " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno",
                "   AND xrcbent = ",g_enterprise,
                "   AND xrcbld = '",p_ld,"' AND xrcbdocno = ?",#p_xrca.xrcadocno,"'",
                "   AND xrcastus = 'Y'",
                "   AND xrca001 IN ('01','02','03','04') ",
                "   AND xrcb002= ? AND xrcb003 = ?",  #出货单号
                " UNION ",
                #杂项 
                "SELECT xrcb007,xrcb107,xrcb101,xrcb020,",                      
                "       xrcb103,xrcb104,xrcb105,xrcb113,xrcb114,xrcb115,",
                "       xrcb123,xrcb124,xrcb125,xrcb133,xrcb134,xrcb135",
                "  FROM xrca_t,xrcb_t",
                " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno",
                "   AND xrcbent = ",g_enterprise,
                "   AND xrcbld = '",p_ld,"' AND xrcbdocno = ?",#p_xrca.xrcadocno,"'",
                "   AND xrcastus = 'Y'",
                "   AND xrca001 IN ('01','02','03','04') ",
                "   AND xrcbdocno= ? AND xrcbseq = ?" #暂估单号
      PREPARE s_axrp130_sum_xrcb2_pr_1 FROM l_sql

      LET l_sql = "SELECT DISTINCT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,",
                  "xrcacnfid,xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,",
                  "xrcasite,xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,",
                  "xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,",
                  "xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,",
                  "xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,",
                  "xrca051,xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,",
                  "xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,xrca108,xrca113,",
                  "xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,",
                  "xrca131,xrca133,xrca134,xrca136,xrca137,xrca138,xrcaud001,xrcaud002,xrcaud003,xrcaud004,xrcaud005,",
                  "xrcaud006,xrcaud007,xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,xrcaud013,xrcaud014,xrcaud015,",
                  "xrcaud016,xrcaud017,xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,xrcaud023,xrcaud024,xrcaud025,",
                  "xrcaud026,xrcaud027,xrcaud028,xrcaud029,xrcaud030,xrcc102,xrcc122,xrcc132 ",  
                "    FROM xrca_t LEFT JOIN xrcc_t ON xrcaent = xrccent AND xrcald = xrccld AND xrcadocno = xrccdocno AND xrcc108 - xrcc109 > 0",
                "   WHERE xrcaent = ",g_enterprise," AND xrcald = '",p_ld,"'",
                #非杂项暂估单号
                "     AND ( ",
                "         xrcadocno IN (SELECT DISTINCT xrcadocno ",
                "                         FROM xrca_t,xrcb_t a1,xrcb_t a2" ,     #xrca_t/a1.xrcb_t(暫估的TABLE)/a2.xrcb_t(是此次立帳單的TABLE)
                "                        WHERE xrcaent = a1.xrcbent     AND xrcald = a1.xrcbld",
                "                          AND xrcaent = a2.xrcbent     AND xrcald = a2.xrcbld",
                "                          AND xrcadocno = a1.xrcbdocno AND xrca001 IN ('01','02') AND xrcastus = 'Y'" ,  
                "                          AND xrcaent = ",g_enterprise," AND xrcald = '",p_ld,"'",
                "                          AND xrcadocdt <='",l_xrcadocdt,"' " ,    
                "                          AND a1.xrcbent = a2.xrcbent ",        #"AND a1.xrcb001 = a2.xrcb001" ,>>t210跟t320的xrcb001不同
                "                          AND (a1.xrcb002 = a2.xrcb002 AND a1.xrcb003 = a2.xrcb003 " , 
                "                          AND a2.xrcb002 = ? AND a2.xrcb003 = ?",  
                "                          AND a2.xrcbdocno = '",p_xrcadocno,"') )",
                #杂项暂估单号
                "     OR xrcadocno IN (SELECT DISTINCT xrcadocno ",
                "                         FROM xrca_t,xrcb_t a1,xrcb_t a2" ,     #xrca_t/a1.xrcb_t(暫估的TABLE)/a2.xrcb_t(是此次立帳單的TABLE)
                "                        WHERE xrcaent = a1.xrcbent     AND xrcald = a1.xrcbld",
                "                          AND xrcaent = a2.xrcbent     AND xrcald = a2.xrcbld",
                "                          AND xrcadocno = a1.xrcbdocno AND xrca001 IN('03','04') AND xrcastus = 'Y'" , #180821-00038#2 add '03''04'
                "                          AND xrcaent = ",g_enterprise," AND xrcald = '",p_ld,"'",
                "                          AND xrcadocdt <='",l_xrcadocdt,"' " ,    
                "                          AND a1.xrcbent = a2.xrcbent ",        #"AND a1.xrcb001 = a2.xrcb001" ,>>t210跟t320的xrcb001不同
                "                          AND (a1.xrcbdocno = a2.xrcb002 AND a1.xrcbseq = a2.xrcb003 " , 
                "                          AND a2.xrcb002 = ? AND a2.xrcb003 = ?",  
                "                          AND a2.xrcbdocno = '",p_xrcadocno,"') ) ", 
                "        )",                
                "   ORDER BY xrcadocdt "  
       PREPARE s_axrp130_ins_xrcf_p1_1 FROM l_sql
       DECLARE s_axrp130_ins_xrcf_c1_1 CURSOR FOR s_axrp130_ins_xrcf_p1_1
       #170410-00053#1 add e---
      

       FOREACH s_axrp130_ins_xrcf_c1_1 USING l_xrcb002,l_xrcb003,l_xrcb002,l_xrcb003 INTO p_xrca.*,p_xrcc.xrcc102,p_xrcc.xrcc122,p_xrcc.xrcc132#,l_xrcc.*    #取得t320的暫估資料 #170410-00053#1 add      
          #获取暂估单项次
          #暂估单项次         
#          SELECT DISTINCT xrcbseq INTO r_xrcf.xrcf009  #191204-00032#3 mark
          SELECT DISTINCT xrcbseq,xrcb020 INTO r_xrcf.xrcf009,p_xrca.xrca011  #191204-00032#3 add #税别改为抓单身税别
            FROM xrcb_t
           WHERE xrcbent = g_enterprise
             AND xrcbdocno = p_xrca.xrcadocno
             AND xrcb002 = l_xrcb002
             AND xrcb003 = l_xrcb003   
          IF cl_null(r_xrcf.xrcf009) THEN 
             LET r_xrcf.xrcf009 = l_xrcb003  #当l_xrcb002代表杂项暂估单时
          END IF           
          
#          #190307-00012#1---mark---str
#          LET r_xrcf.xrcf029 = p_xrca.xrca004       #交易客商
#          LET r_xrcf.xrcf030 = p_xrca.xrca005       #帳款客商
#          #190307-00012#1---mark---end
          #190307-00012#1---add---str
          #xrcf030是账款客商，对应得应该是账款对象。在凭证预览里看到账款客户和收付款客户是反的
          LET r_xrcf.xrcf029 = p_xrca.xrca005       #交易客商
          LET r_xrcf.xrcf030 = p_xrca.xrca004       #帳款客商
          #190307-00012#1---add---end
          
          LET r_xrcf.xrcf101 = ''                   #NO USE
          LET r_xrcf.xrcf102 = p_xrcc.xrcc102       #本幣一匯率   #170317-00029#2 mod p_xrca.xrca101 -> p_xrcc.xrcc102
          #210203-00008#1---add----str
          IF cl_null(r_xrcf.xrcf102) THEN
            LET r_xrcf.xrcf102 = 1         
          END IF
          #210203-00008#1---add----end
          LET r_xrcf.xrcf111 = ''                   #NO USE
          LET r_xrcf.xrcf122 = p_xrcc.xrcc122       #本幣二匯率   #170317-00029#2 mod p_xrca.xrca121 -> p_xrcc.xrcc122
          LET r_xrcf.xrcf132 = p_xrcc.xrcc132       #本幣三匯率   #170317-00029#2 mod p_xrca.xrca131 -> p_xrcc.xrcc132
          
#          #180221-00030#2 add-s         
#          LET l_xrcc102 = ''
#          SELECT xrcc101,xrcc102 INTO l_xrcc101,l_xrcc102 FROM xrcc_t 
#           WHERE xrccent = g_enterprise AND xrccld  = p_ld AND xrccdocno = p_xrca.xrcadocno
#             AND xrccseq = p_xrcc.xrccseq AND xrcc001 = p_xrcc.xrcc001        
#          LET r_xrcf.xrcf102 = l_xrcc102             
          
          #檢查t300是否沖完暫估（杂项/非杂项都用数量判断）
          #t320立暂估数量-xrch已冲数量
          #t320立暂估数量金额          
          EXECUTE s_axrp130_sum_xrcb2_pr_1 USING p_xrca.xrcadocno,l_xrcb002,l_xrcb003,p_xrca.xrcadocno,l_xrcb002,l_xrcb003 INTO l_xrcf007,l_xrcb101,l_xrcb3.xrcb101,l_xrcb020,l_xrcf2.* 
          #190402-00043#2---add---(S)暫估本幣需考慮重評匯率
          LET l_xrcf2.xrcf113 = l_xrcf2.xrcf103 * p_xrcc.xrcc102
          LET l_xrcf2.xrcf114 = l_xrcf2.xrcf104 * p_xrcc.xrcc102
          LET l_xrcf2.xrcf115 = l_xrcf2.xrcf105 * p_xrcc.xrcc102
          #210203-00008#1---add-----str
          IF cl_null(l_xrcf2.xrcf113) THEN
            LET l_xrcf2.xrcf113 = 0
          END IF
          IF cl_null(l_xrcf2.xrcf114) THEN
            LET l_xrcf2.xrcf114 = 0
          END IF
          IF cl_null(l_xrcf2.xrcf115) THEN
            LET l_xrcf2.xrcf115 = 0
          END IF
          #210203-00008#1---add-----end
          
          #取位
          CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf2.xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf2.xrcf113
          CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf2.xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf2.xrcf114
          CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf2.xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf2.xrcf115
          #190402-00043#2---add---(E)
          #計算已沖暫估數量金额 
          EXECUTE s_axrp130_sum_xrcb_pr_1 USING p_xrca.xrcadocno,r_xrcf.xrcf009 INTO l_xrcf0071,l_xrcf1.*
           
             IF cl_null(l_xrcb007)  THEN LET l_xrcb007 = 0 END IF
             IF cl_null(l_xrcb0071) THEN LET l_xrcb0071= 0 END IF
             IF l_xrcb007 - l_xrcb0071 <> 0 THEN
                LET l_cnt = 1
             END IF
          IF l_cnt = 0 THEN          #表示這一張暫估單已經沖完了/要抓下一筆t320繼續沖
             CONTINUE FOREACH
          END IF
 
         
         #170410-00053#1 add s---
         LET r_xrcf.xrcfent = g_enterprise
         LET r_xrcf.xrcfld  = p_ld
         LET r_xrcf.xrcfdocno=p_xrcadocno
         #LET r_xrcf.xrcfseq = 0           #1218 mark
         LET r_xrcf.xrcfseq = l_xrcbseq    #1218 add         
         LET r_xrcf.xrcfseq2 = 0
         LET r_xrcf.xrcf001 = 'axrt300'
         LET r_xrcf.xrcf002 = '01'                 #固定值
         LET r_xrcf.xrcf008 = p_xrca.xrcadocno
         LET r_xrcf.xrcf010 = 0   #p_xrcc.xrcc001       #期別:暫估原則上只有一期
         #191204-00032#3 mark -s
#         SELECT xrca011 INTO l_xrca011 FROM xrca_t WHERE xrcaent = g_enterprise
#            AND xrcald = p_ld
#            AND xrcadocno = p_xrcadocno
#         LET r_xrcf.xrcf020 = l_xrca011 
         #191204-00032#3 mark -e
         LET r_xrcf.xrcf020 = p_xrca.xrca011  #191204-00032#3 add 
         
         SELECT xrca035 INTO l_xrca035 FROM xrca_t
          WHERE xrcaent = g_enterprise
            AND xrcald = p_xrca.xrcald AND xrcadocno= p_xrca.xrcadocno
         
         IF l_sfin2011 = 'Y' THEN #180510-00021#1 add
            LET r_xrcf.xrcf021 = l_xrca035 
         #180510-00021#1 add s--   
         ELSE   
            LET r_xrcf.xrcf021 = l_xrca035
            IF l_sfin1002 = '3' THEN
               SELECT xrcb029 INTO r_xrcf.xrcf021
                 FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = p_ld
                  AND xrcbdocno = p_xrca.xrcadocno
                  AND xrcbseq = p_xrcc.xrccseq
            END IF
         END IF   
         #180510-00021#1 add e---
         SELECT glac007 INTO l_glac007       #取得科目性質
          #FROM glac_t,glaa_t  #180821-00038#2 mark 
          FROM glac_t  #180821-00038#2 add
          WHERE glacent = g_enterprise AND glac001 = l_glaa004 AND glac002 = l_xrca036 
         SELECT xrcadocdt INTO l_xrcadocdt1  #立帳單的立帳日期
           FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrcadocno
          SELECT xrcadocdt INTO l_xrcadocdt2 #暫估單的立帳日期
           FROM xrca_t
          WHERE xrcaent = g_enterprise AND xrcald = p_ld AND xrcadocno = p_xrca.xrcadocno
         #當期沖暫估的科目及資產類科目
         IF l_glac007 NOT MATCHES '[45]' OR (YEAR(l_xrcadocdt1) = YEAR(l_xrcadocdt2) AND MONTH(l_xrcadocdt1) = MONTH(l_xrcadocdt2)) THEN
            LET r_xrcf.xrcf022 = p_xrca.xrca036
         ELSE
            LET r_xrcf.xrcf022 = l_xrca036
         END IF
         CALL s_fin_get_account(p_ld,'13',l_xrca007,'8304_03')  RETURNING g_sub_success,r_xrcf.xrcf023,g_errno   
         CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_11') RETURNING g_sub_success,r_xrcf.xrcf024,g_errno
         CALL s_fin_get_account(p_ld,'13',p_xrca.xrca007,'8504_12') RETURNING g_sub_success,r_xrcf.xrcf025,g_errno      
#         #190307-00012#1---mark---str
#         LET r_xrcf.xrcf029 = p_xrca.xrca004       #交易客商
#         LET r_xrcf.xrcf030 = p_xrca.xrca005       #帳款客商
#         #190307-00012#1---mark---end
         #190307-00012#1---add---str
         #xrcf030是账款客商，对应得应该是账款对象。在凭证预览里看到账款客户和收付款客户是反的
         LET r_xrcf.xrcf029 = p_xrca.xrca005       #交易客商
         LET r_xrcf.xrcf030 = p_xrca.xrca004       #帳款客商
         #190307-00012#1---add---end
         
         LET r_xrcf.xrcf101 = ''                   #NO USE
         LET r_xrcf.xrcf102 = p_xrcc.xrcc102       #本幣一匯率   #170317-00029#2 mod p_xrca.xrca101 -> p_xrcc.xrcc102
         #210203-00008#1---add----str
         IF cl_null(r_xrcf.xrcf102) THEN
            LET r_xrcf.xrcf102 = 1         
         END IF
         #210203-00008#1---add----end
         LET r_xrcf.xrcf111 = ''                   #NO USE
         LET r_xrcf.xrcf122 = p_xrcc.xrcc122       #本幣二匯率   #170317-00029#2 mod p_xrca.xrca121 -> p_xrcc.xrcc122
         LET r_xrcf.xrcf132 = p_xrcc.xrcc132       #本幣三匯率   #170317-00029#2 mod p_xrca.xrca131 -> p_xrcc.xrcc132         
         #170410-00053#1 add e---
         
         #160823-00027#1 Add  ---(S)---
         LET l_xrcb3.xrcb007 = l_xrcf007
         LET l_xrcb3.xrcb103 = l_xrcf2.xrcf103
         LET l_xrcb3.xrcb105 = l_xrcf2.xrcf105
         LET l_xrcb3.xrcb113 = l_xrcf2.xrcf113
         LET l_xrcb3.xrcb115 = l_xrcf2.xrcf115
         #160823-00027#1 Add  ---(E)---

         IF cl_null(l_xrcb007) THEN LET l_xrcb007 = 0 END IF
         IF cl_null(l_xrcf007) THEN LET l_xrcf007 = 0 END IF
         IF cl_null(l_xrcf0071)THEN LET l_xrcf0071= 0 END IF
         IF cl_null(l_xrcf1.xrcf103) THEN LET l_xrcf1.xrcf103 = 0 END IF      IF cl_null(l_xrcf1.xrcf113) THEN LET l_xrcf1.xrcf113 = 0 END IF
         IF cl_null(l_xrcf1.xrcf104) THEN LET l_xrcf1.xrcf104 = 0 END IF      IF cl_null(l_xrcf1.xrcf114) THEN LET l_xrcf1.xrcf114 = 0 END IF
         IF cl_null(l_xrcf1.xrcf105) THEN LET l_xrcf1.xrcf105 = 0 END IF      IF cl_null(l_xrcf1.xrcf115) THEN LET l_xrcf1.xrcf115 = 0 END IF
         IF cl_null(l_xrcf2.xrcf103) THEN LET l_xrcf2.xrcf103 = 0 END IF      IF cl_null(l_xrcf2.xrcf113) THEN LET l_xrcf2.xrcf113 = 0 END IF
         IF cl_null(l_xrcf2.xrcf104) THEN LET l_xrcf2.xrcf104 = 0 END IF      IF cl_null(l_xrcf2.xrcf114) THEN LET l_xrcf2.xrcf114 = 0 END IF
         IF cl_null(l_xrcf2.xrcf105) THEN LET l_xrcf2.xrcf105 = 0 END IF      IF cl_null(l_xrcf2.xrcf115) THEN LET l_xrcf2.xrcf115 = 0 END IF
         IF l_xrcf007 = l_xrcf0071 THEN CONTINUE FOREACH END IF
         IF cl_null(r_xrcf.xrcforga)THEN LET r_xrcf.xrcforga= l_xrcb1.xrcborga END IF      #來源組織
         IF cl_null(r_xrcf.xrcf026) THEN LET r_xrcf.xrcf026 = l_xrcb1.xrcb010 END IF       #業務部門
         IF cl_null(r_xrcf.xrcf027) THEN LET r_xrcf.xrcf027 = l_xrcb1.xrcb011 END IF       #責任中心
         IF cl_null(r_xrcf.xrcf028) THEN LET r_xrcf.xrcf028 = l_xrcb1.xrcb024 END IF       #區域
         IF cl_null(r_xrcf.xrcf031) THEN LET r_xrcf.xrcf031 = l_xrcb1.xrcb036 END IF       #客群
         #IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb004 END IF       #產品類別     #180807-00063#1 mark
         IF cl_null(r_xrcf.xrcf032) THEN LET r_xrcf.xrcf032 = l_xrcb1.xrcb012 END IF       #產品類別      #180807-00063#1 add
         IF cl_null(r_xrcf.xrcf033) THEN LET r_xrcf.xrcf033 = l_xrcb1.xrcb051 END IF       #業務人員
         IF cl_null(r_xrcf.xrcf034) THEN LET r_xrcf.xrcf034 = l_xrcb1.xrcb015 END IF       #專案編號
         IF cl_null(r_xrcf.xrcf035) THEN LET r_xrcf.xrcf035 = l_xrcb1.xrcb016 END IF       #WBS
         IF cl_null(r_xrcf.xrcf036) THEN LET r_xrcf.xrcf036 = l_xrcb1.xrcb033 END IF       #經營方式
         IF cl_null(r_xrcf.xrcf037) THEN LET r_xrcf.xrcf037 = l_xrcb1.xrcb034 END IF       #渠道
         IF cl_null(r_xrcf.xrcf038) THEN LET r_xrcf.xrcf038 = l_xrcb1.xrcb035 END IF       #品牌
         IF cl_null(r_xrcf.xrcf039) THEN LET r_xrcf.xrcf039 = l_xrcb1.xrcb037 END IF       #自由核算項1
         IF cl_null(r_xrcf.xrcf040) THEN LET r_xrcf.xrcf040 = l_xrcb1.xrcb038 END IF       #自由核算項2
         IF cl_null(r_xrcf.xrcf041) THEN LET r_xrcf.xrcf041 = l_xrcb1.xrcb039 END IF       #自由核算項3
         IF cl_null(r_xrcf.xrcf042) THEN LET r_xrcf.xrcf042 = l_xrcb1.xrcb040 END IF       #自由核算項4
         IF cl_null(r_xrcf.xrcf043) THEN LET r_xrcf.xrcf043 = l_xrcb1.xrcb041 END IF       #自由核算項5
         IF cl_null(r_xrcf.xrcf044) THEN LET r_xrcf.xrcf044 = l_xrcb1.xrcb042 END IF       #自由核算項6
         IF cl_null(r_xrcf.xrcf045) THEN LET r_xrcf.xrcf045 = l_xrcb1.xrcb043 END IF       #自由核算項7
         IF cl_null(r_xrcf.xrcf046) THEN LET r_xrcf.xrcf046 = l_xrcb1.xrcb044 END IF       #自由核算項8
         IF cl_null(r_xrcf.xrcf047) THEN LET r_xrcf.xrcf047 = l_xrcb1.xrcb045 END IF       #自由核算項9
         IF cl_null(r_xrcf.xrcf048) THEN LET r_xrcf.xrcf048 = l_xrcb1.xrcb046 END IF       #自由核算項10
         IF cl_null(r_xrcf.xrcf049) THEN LET r_xrcf.xrcf049 = l_xrcb1.xrcb047 END IF       #摘要
         IF cl_null(r_xrcf.xrcf022) THEN LET r_xrcf.xrcf022 = l_xrcb1.xrcb021 END IF       #費用會計科目

         CASE
             WHEN l_sfin2012 ='1'    #1:非雜項/1:立帳不含稅
                  LET l_cnt = l_cnt +1
                  #(t320立暫估數-t300不含本張沖暫估數) > t300這次要沖的暫估數 
                  IF (l_xrcf007 - l_xrcf0071) >  p_xrcb007 THEN  #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     LET l_xrcf007 = p_xrcb007  #計算匯差價差要以沖暫估數量 #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     #LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb1.xrcb103 #1217 mark
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcb3.xrcb101 * l_xrcf007 #1217 add  #1218 l_xrcb1.xrcb101-->l_xrcb3.xrcb101
                     LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                     #LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb1.xrcb103  #1217 mark
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcb3.xrcb101 * l_xrcf007 #1217 add #1218 l_xrcb1.xrcb101-->l_xrcb3.xrcb101
                     CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf103,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf103 #1217 add
                     CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf105,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf105 #1217 add
                     #本幣要等於原幣*原立暫估匯率
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102 #1217 mark
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * r_xrcf.xrcf102 #1217 add 
                     LET l_xrcf_tmp[l_cnt].xrcf114 = 0
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcb1.xrcb103 * r_xrcf.xrcf102 #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102 #1217 mark
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * r_xrcf.xrcf102 #1217 add
                  ELSE
                     LET l_flag = 'Y'  #180821-00038#2 add #标记最后一次冲暂估
                     LET l_xrcf007 = l_xrcf007 - l_xrcf0071
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103   #(立暫估數-沖暫估數)
                     LET l_xrcf_tmp[l_cnt].xrcf104 = 0
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103
                     #170419-00065#1--add---s--xul
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf103 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf114 = 0 
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * r_xrcf.xrcf102
                     #170419-00065#1--add---e--xul
                  END IF
                  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
                  CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
             WHEN l_sfin2012 ='2'    #1:非雜項/2:立帳含稅
                  LET l_cnt = l_cnt +1
                  IF (l_xrcf007 - l_xrcf0071) >  p_xrcb007 THEN #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     LET l_xrcf007 = p_xrcb007  #計算匯差價差要以沖暫估數量 #170617-00473#1 mod l_xrcb007--> p_xrcb007
                     #l_glaacomp營運據點/p_oodb002稅別/p_money計稅基礎/p_num數量/p_curr幣別/p_rate匯率
                    #CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcb1.xrcb105,l_xrcf007,p_xrca.xrca100,p_xrca.xrca101)   #160912-00011#4 Mark
                     CALL s_tax_count(l_glaacomp,p_xrca.xrca011,l_xrcb3.xrcb101 * l_xrcf007,l_xrcf007,p_xrca.xrca100,r_xrcf.xrcf102)   #160912-00011#4 Add #170317-00029#2 mod p_xrca.xrca101 ->r_xrcf.xrcf102
                          RETURNING l_xrcf_tmp[l_cnt].xrcf103,l_xrcf_tmp[l_cnt].xrcf104,l_xrcf_tmp[l_cnt].xrcf105,
                                    l_xrcf_tmp[l_cnt].xrcf113,l_xrcf_tmp[l_cnt].xrcf114,l_xrcf_tmp[l_cnt].xrcf115
                  ELSE
                     LET l_flag = 'Y'  #180821-00038#2 add #标记最后一次冲暂估
                     LET l_xrcf007 = l_xrcf007 - l_xrcf0071
                     LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103   #(立暫估數-沖暫估數)
                     LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcf2.xrcf104 - l_xrcf1.xrcf104
                     LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcf2.xrcf105 - l_xrcf1.xrcf105
                     #170419-00065#1--add--s--xul
                     LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf_tmp[l_cnt].xrcf105 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf_tmp[l_cnt].xrcf104 * r_xrcf.xrcf102
                     LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf_tmp[l_cnt].xrcf115 - l_xrcf_tmp[l_cnt].xrcf114                  
                     #170419-00065#1--add--e--xul
                     #170603-00037#1--add--str--
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf113,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf113
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf114,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf114
                     CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf115,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf115
                     #170603-00037#1--add--end
                  END IF
         END CASE
         
         #180821-00038#2 add s----#沖暫估明細的尾差處理
         IF l_flag = 'Y' THEN #最后一次冲暂估
#已冲金额之前规格是检查xrch是否存在若存在才取，这部分调整为直接去xrch里的已冲金额         
#            INITIALIZE l_xrcb_o.* TO NULL
#            LET l_xrcb_o.xrcb103 = 0
#            LET l_xrcb_o.xrcb104 = 0
#            LET l_xrcb_o.xrcb105 = 0
#            LET l_xrcb_o.xrcb113 = 0
#            LET l_xrcb_o.xrcb114 = 0
#            LET l_xrcb_o.xrcb115 = 0
#            LET l_xrcb_o.xrcb020 = l_xrcb020_t300 
#            LET l_xrcb_o.xrca101 = l_xrca101     
#            LET l_xrcb_o.xrcb101 = l_xrcb1.xrcb101
#            LET l_xrcb_o.xrcb007 = l_xrcf007
#            LET ls_js = util.JSON.stringify(l_xrcb_o)   
#
#            #获取已冲金额
#            #若可使用xrch_t時,已沖金額直接取xrch_t 
#            CALL s_axrt300_diff_xrcb(p_ld,p_xrcadocno,l_xrcbseq_t300,l_xrcb002,l_xrcb003,ls_js,'2')    
#               RETURNING l_success,l_errno,
#                                l_xrcb_o.xrcb103,l_xrcb_o.xrcb104,l_xrcb_o.xrcb105,
#                                l_xrcb_o.xrcb113,l_xrcb_o.xrcb114,l_xrcb_o.xrcb115
            
            #l_xrcf1->记录的xrch已冲金额
            IF cl_null(l_xrcf1.xrcf103) THEN LET l_xrcf1.xrcf103 = 0 END IF   
            IF cl_null(l_xrcf1.xrcf104) THEN LET l_xrcf1.xrcf104 = 0 END IF 
            IF cl_null(l_xrcf1.xrcf105) THEN LET l_xrcf1.xrcf105 = 0 END IF 
            IF cl_null(l_xrcf1.xrcf113) THEN LET l_xrcf1.xrcf113 = 0 END IF 
            IF cl_null(l_xrcf1.xrcf114) THEN LET l_xrcf1.xrcf114 = 0 END IF 
            IF cl_null(l_xrcf1.xrcf115) THEN LET l_xrcf1.xrcf115 = 0 END IF 
            IF cl_null(l_xrcf1.xrch015) THEN LET l_xrcf1.xrch015 = 0 END IF 
            IF cl_null(l_xrcf1.xrch016) THEN LET l_xrcf1.xrch016 = 0 END IF 
            #最后一次可冲金额
            #沖暫估明細xrcf_t各金額=axrt320立暫估單身各金額-已沖各金額(B/C) - DIFF3金额 
            LET l_xrcf_tmp[l_cnt].xrcf103 = l_xrcf2.xrcf103 - l_xrcf1.xrcf103 - l_xrcf1.xrch015
            LET l_xrcf_tmp[l_cnt].xrcf104 = l_xrcf2.xrcf104 - l_xrcf1.xrcf104
            LET l_xrcf_tmp[l_cnt].xrcf105 = l_xrcf2.xrcf105 - l_xrcf1.xrcf105 - l_xrcf1.xrch015
            LET l_xrcf_tmp[l_cnt].xrcf113 = l_xrcf2.xrcf113 - l_xrcf1.xrcf113 - l_xrcf1.xrch016
            LET l_xrcf_tmp[l_cnt].xrcf114 = l_xrcf2.xrcf114 - l_xrcf1.xrcf114
            LET l_xrcf_tmp[l_cnt].xrcf115 = l_xrcf2.xrcf115 - l_xrcf1.xrcf115 - l_xrcf1.xrch016
         END IF
         #180821-00038#2 add e----#沖暫估明細的尾差處理

         LET l_xrcf_tmp[l_cnt].xrca001 = p_xrca.xrca001
         #計算價差匯差
         IF l_xrca100 = p_xrca.xrca100 THEN     #相同幣別沖暫估者，則以原暫估單匯率
#            LET l_rate = p_xrca.xrca101 #170603-00037#1 mark
            LET l_rate = r_xrcf.xrcf102 #170603-00037#1 add
         ELSE
            #170603-00037#1--mod--str--
            #参照AP规格
            #不同幣別沖暫估,直接取現在立帳的單頭匯率來換算本幣,不重取匯率
            LET l_rate = l_xrca101
#            CALL s_aooi160_get_exrate('2',p_ld,p_xrca.xrcadocdt,l_xrca100,l_glaa001,0,l_glaa025)
#                 RETURNING l_rate
            #170603-00037#1--mod--end
         END IF
         
         #180221-00030#2 add-s
         #计算立账单的未税单价金额
         LET l_oodb004 = ''
         LET l_oodb005 = ''
         LET l_oodb006 = ''
         LET l_oodb011 = ''
         LET l_xrcacomp= ''
         LET l_xrca011 = ''
         #立账单法人/税别
         SELECT xrcacomp,xrca011 INTO l_xrcacomp,l_xrca011  FROM xrca_t
          WHERE xrcaent=g_enterprise AND xrcald=p_ld AND xrcadocno=p_xrcadocno
            
         CALL s_tax_chk(l_xrcacomp,l_xrcb020_t300) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011   #取单身税别      
         IF l_oodb005 = 'Y' THEN
            LET l_xrcb1.xrcb101 = l_xrcb1.xrcb101 / (1 + l_oodb006/100)    
            #CALL s_curr_round_ld('1',p_ld,l_xrca011,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101 #180627-00046#1 mark
            #CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101 #180627-00046#1 mark #180822-00006#1 mark 
         END IF
         
         #计算暂估单未税单价金额
         LET l_oodb004 = ''
         LET l_oodb005 = ''
         LET l_oodb006 = ''
         LET l_oodb011 = ''
         LET l_xrcacomp= ''
         LET l_xrca011 = ''
         #暂估单法人/税别
         SELECT xrcacomp,xrca011 INTO l_xrcacomp,l_xrca011  FROM xrca_t
          WHERE xrcaent=g_enterprise AND xrcald=p_ld AND xrcadocno=p_xrca.xrcadocno
            
         CALL s_tax_chk(l_xrcacomp,l_xrcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011   #取单身的税别      
         IF l_oodb005 = 'Y' THEN
            #180625-00055#1 add-s
            #暂估单税别含税时，因价差看未税，故这里要用暂估单价将原币含税单价反推成原币未税单价
            LET l_xrcb3.xrcb101  = l_xrcb3.xrcb101  / (1 + l_oodb006/100)    
            #CALL s_curr_round_ld('1',p_ld,l_xrca011,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180627-00046#1 mark
            #CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180627-00046#1 add  #180822-00006#1 mark           
            #180625-00055#1 add-e
         END IF    
         #180221-00030#2 add-e
         
         #160912-00011#4 Add  ---(S)---
         #LET l_xrcf_tmp[l_cnt].xrcf106 = (l_xrcb1.xrcb101 - l_xrcb101) * l_xrcf007  #180625-00055#1 mark
         LET l_xrcf_tmp[l_cnt].xrcf106 = (l_xrcb1.xrcb101 - l_xrcb3.xrcb101 ) * l_xrcf007  #180625-00055#1 add
         #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf106,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf106  #180625-00055#1 mark
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf106,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf106  #180625-00055#1 add
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb1.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb1.xrcb101  #180822-00006#1 add
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcb3.xrcb101,1) RETURNING g_sub_success,g_errno,l_xrcb3.xrcb101  #180822-00006#1 add    
         #180221-00030#2 mark-s

#         LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrcf_tmp[l_cnt].xrcf106 * p_xrca.xrca101  #180221-00030#2 add #180917-00020#1 mark
         LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrcf_tmp[l_cnt].xrcf106 * l_xrca101  #180917-00020#1 #本币价格差异金额应用原币*立账汇率计算
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf116,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf116  #180821-00038#2 add 
         IF cl_null(l_xrcf_tmp[l_cnt].xrcf106) THEN LET l_xrcf_tmp[l_cnt].xrcf106 = 0 END IF #170525-00073#1 add         
         IF cl_null(l_xrcf_tmp[l_cnt].xrcf116) THEN LET l_xrcf_tmp[l_cnt].xrcf116 = 0 END IF #170525-00073#1 add
         
         #LET l_xrcf_tmp[l_cnt].xrcf107 = ((l_xrcb1.xrcb103/p_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb103/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf106 #170617-00473#1 mod l_xrcb007--> p_xrcb007  #201901 mod #180821-00038#1 mark
         LET l_xrcf_tmp[l_cnt].xrcf107 = 0 #180821-00028#1 add #原币无汇差给0
        
         #180823-00022#1 add s---
         #匯差計算方式:該項次本幣未稅金額-立暫估時本幣未稅金額-本幣價差
         LET l_xrcf_tmp[l_cnt].xrcf117 = l_xrcb1.xrcb113 - l_xrcf_tmp[l_cnt].xrcf113 - l_xrcf_tmp[l_cnt].xrcf116         
         #180823-00022#1 add e---
         
#         LET l_xrcf_tmp[l_cnt].xrcf117 = ((l_xrcb1.xrcb113/p_xrcb007)*l_xrcf007) - ((l_xrcb3.xrcb113/l_xrcb3.xrcb007)*l_xrcf007) - l_xrcf_tmp[l_cnt].xrcf116 #170617-00473#1 mod l_xrcb007--> p_xrcb007    #180906-00063#1----mark
         #CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf107,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf107 #170531-00025#1 mark
         CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrcf_tmp[l_cnt].xrcf107,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf107  #170531-00025#1 add
         CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrcf_tmp[l_cnt].xrcf117,2) RETURNING g_sub_success,g_errno,l_xrcf_tmp[l_cnt].xrcf117
         #160912-00011#4 Add  ---(E)---

       
       #170410-00053#1 add s---
        LET r_xrcf.xrcf103 = l_xrcf_tmp[l_cnt].xrcf103
        LET r_xrcf.xrcf104 = l_xrcf_tmp[l_cnt].xrcf104
        LET r_xrcf.xrcf105 = l_xrcf_tmp[l_cnt].xrcf105
        LET r_xrcf.xrcf113 = l_xrcf_tmp[l_cnt].xrcf113
        LET r_xrcf.xrcf114 = l_xrcf_tmp[l_cnt].xrcf114
        LET r_xrcf.xrcf115 = l_xrcf_tmp[l_cnt].xrcf115  
        LET r_xrcf.xrcf116 = l_xrcf_tmp[l_cnt].xrcf116
        LET r_xrcf.xrcf117 = l_xrcf_tmp[l_cnt].xrcf117
        LET r_xrcf.xrcf106 = l_xrcf_tmp[l_cnt].xrcf106
 
        IF cl_null(r_xrcf.xrcf106) THEN LET r_xrcf.xrcf106 = 0 END IF
        IF cl_null(r_xrcf.xrcf116) THEN LET r_xrcf.xrcf116 = 0 END IF
#180808-00054#1 mark s---
#FUNCTION s_axrp130_ins_xrcf_diff中处理价差，
#汇差时已考虑销退暂估单，其他待底暂估单 原幣沖銷價格差異金額 和 本币汇差金额的处理
#        IF l_xrcf_tmp[l_cnt].xrca001 MATCHES '0[24]' THEN
#           LET r_xrcf.xrcf106 = r_xrcf.xrcf106 * -1
#           LET r_xrcf.xrcf116 = r_xrcf.xrcf106 * -1
#        END IF
#180808-00054#1 mark e--- 
        IF cl_null(l_xrcf_tmp[l_cnt].xrcf107) THEN LET l_xrcf_tmp[l_cnt].xrcf107 = 0 END IF
        IF cl_null(r_xrcf.xrcf117) THEN LET r_xrcf.xrcf117 = 0 END IF
#180808-00054#1 mark s---   
#FUNCTION s_axrp130_ins_xrcf_diff中处理价差，
#汇差时已考虑销退暂估单，其他待底暂估单 原幣沖銷價格差異金額 和 本币汇差金额的处理
#        IF r_xrcf.xrcf117 <> 0 THEN
#           IF l_xrcf_tmp[l_cnt].xrca001 MATCHES '0[24]' THEN
#              LET r_xrcf.xrcf117 = r_xrcf.xrcf117 * -1
#              LET l_xrcf_tmp[l_cnt].xrcf107 = l_xrcf_tmp[l_cnt].xrcf107 * -1
#           END IF
#        END IF        
#180808-00054#1 mark e---
        
        #180821-00038#2 add s---#非杂项写入xrch_t冲暂估明细
        INITIALIZE l_xrch.* TO NULL      
        LET l_xrch.xrchent  = g_enterprise    #企業編號
        LET l_xrch.xrchcomp = l_xrcacomp      #法人
        LET l_xrch.xrchsite = l_xrcasite      #帳務組織
        LET l_xrch.xrchdocno = p_xrcadocno    #t300單據號碼
        #t300资料
        SELECT DISTINCT xrcbseq,xrcb021,xrcb029,xrcb004 
          INTO l_xrch.xrchseq,l_xrcb1.xrcb021,l_xrcb029,l_xrcb004 
          FROM xrcb_t  
         WHERE xrcbent = g_enterprise AND xrcbld = p_ld AND xrcbdocno = p_xrcadocno
           AND xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003         
        
        LET l_xrch.xrchseq = l_xrcbseq 
        LET l_xrch.xrch001 = p_xrca.xrcadocno #暫估單號
        
        #暫估項次
        SELECT xrcbseq INTO l_xrch.xrch002 FROM xrcb_t  
         WHERE xrcbent = g_enterprise AND xrcbld = p_xrca.xrcald AND xrcbdocno = p_xrca.xrcadocno 
           AND xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003
        IF cl_null(l_xrch.xrch002) THEN 
           LET l_xrch.xrch002 = l_xrcb003  #当l_xrcb002代表杂项暂估单时
        END IF        
         
        LET l_xrch.xrch003 = l_xrcb002        #出货單號
        LET l_xrch.xrch004 = l_xrcb003        #出货項次
        LET l_xrch.xrch005 = l_xrcb004        #產品編號
        LET l_xrch.xrch006 = l_xrcb007        #沖暫估數量

      
        #取來源暫估單稅別含稅否
        LET l_oodb004 = '' LET l_oodb005 = '' LET l_oodb006 = '' LET l_oodb011 = ''
        CALL s_tax_chk(l_xrch.xrchcomp,l_xrcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011  
        CALL s_tax_chk(l_xrch.xrchcomp,l_xrcb020_t300) RETURNING g_sub_success,l_oodb004,l_oodb0051,l_oodb006,l_oodb011 
        
        #若暂估單單價含稅則需要換算為不含稅的單價
        IF l_oodb005 = 'Y' THEN  
           #xrch007 =原幣未稅金額/原幣數量 ; xrch008 =本幣未稅金額/本幣數量 
           SELECT (xrcb103/xrcb007),(xrcb113/xrcb007) INTO l_xrch.xrch007,l_xrch.xrch008 FROM xrcb_t  
            WHERE xrcbent = g_enterprise AND xrcbld = p_xrca.xrcald AND xrcbdocno = p_xrca.xrcadocno 
            AND ((xrcb002 = l_xrcb002 AND xrcb003 = l_xrcb003) OR (xrcbdocno = l_xrcb002 AND xrcbseq = l_xrcb003))        
           CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrch.xrch007,1) RETURNING g_sub_success,g_errno,l_xrch.xrch007
           CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch008,1) RETURNING g_sub_success,g_errno,l_xrch.xrch008
        ELSE                 
           #xrch007 =原幣未稅單價 ; xrch008 =本幣未稅單價 
           SELECT xrcb101,xrcb111 INTO l_xrch.xrch007,l_xrch.xrch008 FROM xrcb_t  
            WHERE xrcbent = g_enterprise AND xrcbld = p_xrca.xrcald AND xrcbdocno = p_xrca.xrcadocno AND xrcbseq = l_xrch.xrch002        
        END IF  

#先按apch的处理方式，原幣未稅金額/原幣數量，
#        #xrch007 =原幣未稅單價 ; xrch008 =本幣未稅單價 
        SELECT xrcb101,xrcb111,xrca012,xrca101 INTO l_xrch.xrch007,l_xrch.xrch008,l_xrca012_t320,l_xrca101_t320 FROM xrca_t,xrcb_t  
         WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcbdocno = xrcadocno 
           AND xrcbent = g_enterprise AND xrcbld = p_xrca.xrcald AND xrcbdocno = p_xrca.xrcadocno AND xrcbseq = l_xrch.xrch002 
#            
#        IF l_oodb005 = 'Y' THEN           
#           #原币不含税单价=原币含税单价/(1+税率%)
#           #本币不含税单价=原币不含税单价*汇率
#           LET l_xrch.xrch007 = l_xrch.xrch007/(1+l_xrca012_t320/100)
#           CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrch.xrch007,1) RETURNING g_sub_success,g_errno,l_xrch.xrch007
#           LET l_xrch.xrch008 = l_xrch.xrch007 * l_xrca101_t320
#           CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch008,1) RETURNING g_sub_success,g_errno,l_xrch.xrch008
#        END IF 

#1220 mark s----t300的原幣未稅單價與t320的原幣未稅單價,記錄在xrchud011與xrchud012,供偵錯用,可mark 
#        IF l_oodb005 = 'Y' THEN  #暂单税别含税否
#           LET l_xrch.xrchud012 =  l_xrcb3.xrcb101/(1+l_xrca012_t320/100)#t320的原幣含稅單價
#           CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrch.xrchud012,1) RETURNING g_sub_success,g_errno,l_xrch.xrchud012
#        ELSE
#           LET l_xrch.xrchud012 =  l_xrcb101
#        END IF
        
      
#        IF l_oodb0051 = 'Y' THEN  #t300税别含税否
#           LET l_xrch.xrchud011 =  l_xrcb101_t300/(1+l_xrca012/100)#t320的原幣含稅單價
#           CALL s_curr_round_ld('1',p_ld,p_xrca.xrca100,l_xrch.xrchud011,1) RETURNING g_sub_success,g_errno,l_xrch.xrchud011
#        ELSE
#           LET l_xrch.xrchud011 =  l_xrcb101_t300
#        END IF  
#1220 mark e----

         #20190118 chenying add s---
         #修正：价差和汇差单独判断
         #汇差，若立暫估與沖暫估匯率相同时还有汇差，则xrcf117=0,此汇差后面计入到xrch016中        
         IF l_xrcf_tmp[l_cnt].xrcf117 <> 0 THEN #立暫估與沖暫估匯率相同时还有汇差，也要计入到纯差异中
            IF l_xrca101 = r_xrcf.xrcf102 THEN
               LET l_xrcf_tmp[l_cnt].xrcf117 = 0
            END IF   
         END IF 
         #20190118 chenying add e---
         
###step1:s---寫入價差當下,判斷沒有價差,則不寫入價差金額(即價差金額為0),也不寫DIFF-3
###step2:s---寫入匯差當下,判斷沒有匯差,則不寫入匯差金額(即匯差金額為0),也不寫DIFF-3
        #纯差异原币/本币金额
        #价差、汇差原逻辑不变，得到的价差去判断是否在价差范围类（允許誤差值-依axrt300單頭幣別設定檔-aooi150單價位數決定）
        #若在范围类则说明无价差，再判断是否有汇差，都没有则，产生diff3 xrch纯差异金额。
        #原币价差=l_xrcf_tmp[l_cnt].xrcf106   本币汇差=l_xrcf_tmp[l_cnt].xrcf117
        IF l_xrcf_tmp[l_cnt].xrcf106 <> 0 THEN 
           LET l_price_diff =  l_xrcb1.xrcb101 - l_xrcb3.xrcb101 #立沖暫估原幣未稅單價差異=立暫估原幣未稅單價(只能取立暫估xcrb單身的單價,不能由出貨重算,因為出貨金額可能變更過)-沖暫估原幣未稅單價
           LET l_price_diff_min = l_num * -1
           LET l_price_diff_max = l_num   
           IF l_price_diff <= l_price_diff_max AND l_price_diff >= l_price_diff_min THEN 
              #IF l_xrca101 = r_xrcf.xrcf102 THEN #立暫估與沖暫估匯率相同 #20190118 mark
                 ##规格调整：diff3不在这里写人
                 ##且取值xrch015=t300原幣未稅金額-ch沖暫估原幣未稅金額-ch原幣價差未稅金額
                 ##xrch016=將t300本幣未稅金額-ch沖暫估本幣未稅金額-ch本幣價差未稅金額-ch本幣匯差未稅金額
                 #LET l_xrch.xrch015 = l_xrcf_tmp[l_cnt].xrcf106 #DIFF 純差異原幣金額 #规格调整：diff3不在这里写人
                 #LET l_xrch.xrch016 = l_xrcf_tmp[l_cnt].xrcf116 #DIFF 純差異本幣金額 #规格调整：diff3不在这里写人
                 LET l_xrcf_tmp[l_cnt].xrcf106 = 0      
                 LET l_xrcf_tmp[l_cnt].xrcf116 = 0  
                 LET l_flag1 = 'Y' #表示有diff3，需写入xrch015,xrch016
#                 #20190118 chenying mark s---
#                 IF l_xrcf_tmp[l_cnt].xrcf117 <> 0 THEN #立暫估與沖暫估匯率相同时还有汇差，也要计入到纯差异中
#                    #LET l_xrch.xrch016 = l_xrcf_tmp[l_cnt].xrcf116 + l_xrcf_tmp[l_cnt].xrcf117  #规格调整：diff3不在这里写人
#                    LET l_xrcf_tmp[l_cnt].xrcf117 = 0
#                    LET l_flag1 = 'Y' #表示有diff3，需写入xrch015,xrch016
#                 END IF  
#              END IF
#                 #20190118 chenying mark e---               
           END IF
#        #20190118 chenying mark s---             
#        ELSE
#        #若无价差，汇率相等的情况下，产生的汇差也归DIFF3
#           IF l_xrca101 = r_xrcf.xrcf102 THEN #立暫估與沖暫估匯率相同
#              #LET l_xrch.xrch015 = l_xrcf_tmp[l_cnt].xrcf106 #DIFF 純差異原幣金額 #规格调整：diff3不在这里写人
#              #LET l_xrch.xrch016 = l_xrcf_tmp[l_cnt].xrcf116 #DIFF 純差異本幣金額 #规格调整：diff3不在这里写人
#              LET l_xrcf_tmp[l_cnt].xrcf106 = 0      
#              LET l_xrcf_tmp[l_cnt].xrcf116 = 0 
#              #LET l_flag1 = 'Y' #表示有diff3，需写入xrch015,xrch016              
#              IF l_xrcf_tmp[l_cnt].xrcf117 <> 0 THEN #立暫估與沖暫估匯率相同时还有汇差，也要计入到纯差异中
#                 #LET l_xrch.xrch016 = l_xrcf_tmp[l_cnt].xrcf116 + l_xrcf_tmp[l_cnt].xrcf117 #规格调整：diff3不在这里写人
#                 LET l_xrcf_tmp[l_cnt].xrcf117 = 0
#                 LET l_flag1 = 'Y' #表示有diff3，需写入xrch015,xrch016
#              END IF                 
#           END IF  
#        #20190118 chenying mark e---           
        END IF
###step1:e--- 
###step2:e--- 

        LET l_xrch.xrch009 = l_xrcf_tmp[l_cnt].xrcf106  #DIFF 原幣價差金額
        LET l_xrch.xrch010 = l_xrcf_tmp[l_cnt].xrcf116  #DIFF 本幣價差金額
        LET l_xrch.xrch011 = l_xrcf_tmp[l_cnt].xrcf117  #DIFF 本幣匯差金額
        LET l_xrch.xrch012 = l_xrch.xrch009 / l_xrcf007 #DIFF 原幣價差單價
        CALL s_curr_round_ld('1',p_ld,l_xrca100,l_xrch.xrch012,1) RETURNING g_sub_success,g_errno,l_xrch.xrch012
        LET l_xrch.xrch013 = l_xrch.xrch010 / l_xrcf007 #DIFF 本幣價差單價
        CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch013,1) RETURNING g_sub_success,g_errno,l_xrch.xrch013
        LET l_xrch.xrch014 = l_xrch.xrch011 / l_xrcf007 #DIFF 本幣匯差單價        
        CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch014,1) RETURNING g_sub_success,g_errno,l_xrch.xrch014               
        LET l_xrch.xrch017 = l_xrcf_tmp[l_cnt].xrcf103  #原幣沖銷未稅金額
        LET l_xrch.xrch018 = l_xrcf_tmp[l_cnt].xrcf104  #原幣沖銷稅額
        LET l_xrch.xrch019 = l_xrcf_tmp[l_cnt].xrcf105  #原幣沖銷含稅金額
        LET l_xrch.xrch020 = l_xrcf_tmp[l_cnt].xrcf113  #本幣沖銷未稅金額
        LET l_xrch.xrch021 = l_xrcf_tmp[l_cnt].xrcf114  #本幣沖銷稅額
        LET l_xrch.xrch022 = l_xrcf_tmp[l_cnt].xrcf115  #本幣沖銷含稅金額
        LET l_xrch.xrch023 = r_xrcf.xrcf102             #暫估匯率
        LET l_xrch.xrch024 = l_xrca101                  #沖暫估匯率
        LET l_xrch.xrch025 = p_xrca.xrca001             #暫估帳款性質
        
###规格调整###21/29只有在ch產生cf時,才*-1        
#        IF l_flag1 = 'Y' THEN 
#           #xrch015=t300原幣未稅金額-ch沖暫估原幣未稅金額-ch原幣價差未稅金額
#           #xrch016=t300本幣未稅金額-ch沖暫估本幣未稅金額-ch本幣價差未稅金額-ch本幣匯差未稅金額
#           IF l_xrcb001 MATCHES '2[19]' THEN            
#              LET l_xrch.xrch015 = l_xrcb1.xrcb103 - l_xrch.xrch017 - l_xrch.xrch009*-1
#              LET l_xrch.xrch016 = l_xrcb1.xrcb113 - l_xrch.xrch020 - l_xrch.xrch010*-1 - l_xrch.xrch011*-1
#           ELSE
#              LET l_xrch.xrch015 = l_xrcb1.xrcb103 - l_xrch.xrch017 - l_xrch.xrch009
#              LET l_xrch.xrch016 = l_xrcb1.xrcb113 - l_xrch.xrch020 - l_xrch.xrch010 - l_xrch.xrch011           
#           END IF           
#        ELSE
#           LET l_xrch.xrch015 = 0
#           LET l_xrch.xrch016 = 0
#        END IF

###step3-1:s---在做完價差/匯差之後,將t300原幣未稅金額-ch沖暫估原幣未稅金額-ch原幣價差未稅金額,寫入ch的DIFF3純差異原幣金額
#        IF l_flag1 = 'Y' THEN  #201901 mark
           #xrch015=t300原幣未稅金額-ch沖暫估原幣未稅金額-ch原幣價差未稅金額
           LET l_xrch.xrch015 = l_xrcb1.xrcb103 - l_xrch.xrch017 - l_xrch.xrch009                    
#        ELSE
#           LET l_xrch.xrch015 = 0
#        END IF 
###step3-1:e---

###step3-2.s---匯差金額=匯差金額-(ch的DIFF3純差異原幣金額*t300匯率,取位)-->要把因為DIFF3所產生的本幣差異,先扣掉,step3-3才算得出DIFF3的本幣差異.
        LET l_xrch016 = l_xrch.xrch015 * l_xrca101  
        IF cl_null(l_xrch016) THEN LET l_xrch016 = 0 END IF
        CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch016,2) RETURNING g_sub_success,g_errno,l_xrch016
        
        IF l_xrcf_tmp[l_cnt].xrcf117 <> 0 THEN 
           LET l_xrcf_tmp[l_cnt].xrcf117 = l_xrcb1.xrcb113 - l_xrcf_tmp[l_cnt].xrcf113 -l_xrcf_tmp[l_cnt].xrcf116 - l_xrch016
        END IF   
        LET l_xrch.xrch011 = l_xrcf_tmp[l_cnt].xrcf117
###step3-2.e--- 
  
###step3-3.s---將t300本幣未稅金額-ch沖暫估本幣未稅金額-ch本幣價差未稅金額-ch本幣匯差未稅金額,寫入ch的DIFF3純差異本幣金額
        LET l_xrch.xrch016 = l_xrcb1.xrcb113 - l_xrch.xrch020 - l_xrch.xrch010 - l_xrch.xrch011
###step3-3.e---

###step4-1.s---判斷若是最後一筆沖暫估,因為未沖金額已經過尾差的推算,故沖暫估的金額不能改變(即不能存在DIFF3來影響沖銷金額),故需把DIFF3回寫到價差與匯差
###step4.2.s---將DIFF3的原幣放回價差原幣,價差原幣*t300匯率放回價差本幣
###step4.3.s---DIFF3的本幣-價差本幣再放回匯差本幣.
        IF l_flag = 'Y' THEN #最后一次冲暂估
           IF l_xrch.xrch015 <> 0 OR l_xrch.xrch016 <> 0 THEN
              #DIFF1原幣=DIFF3原幣（DIFF3原幣攤到DIFF1原幣),后面DIFF3原幣=0
              LET l_xrch.xrch009 = l_xrch.xrch009 + l_xrch.xrch015 
              #DIFF1价差本幣=DIFF3原幣*t300匯率（攤到DIFF1本幣）
              LET l_xrch.xrch010 = l_xrch.xrch010 + l_xrch.xrch015 * l_xrca101 
              CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch010,2) RETURNING g_sub_success,g_errno,l_xrch.xrch010
              #DIFF3本幣 = DIFF3本幣 - DIFF1价差本币（此次分摊的DIFF3原幣*t300匯率 不是l_xrch.xrch010）
              LET l_xrch.xrch016 = l_xrch.xrch016 - l_xrch.xrch015 * l_xrca101 
              CALL s_curr_round_ld('1',p_ld,l_glaa001,l_xrch.xrch016,2) RETURNING g_sub_success,g_errno,l_xrch.xrch016
              #DIFF3原幣攤完給0
              LET l_xrch.xrch015 = 0
              #DIFF2汇差本币=剩下的DIFF3本幣 
              LET l_xrch.xrch011 = l_xrch.xrch011 + l_xrch.xrch016
              LET l_xrch.xrch016 = 0 #l_xrch.xrch016DIFF3本币给DIFF2汇差本币后要清零 #20190118 chenying adds
              #更新後的價差匯差給回l_apcf_tmp,用于插入xrcf价差汇差资料
              LET l_xrcf_tmp[l_cnt].xrcf106 = l_xrch.xrch009  #DIFF 原幣價差金額
              LET l_xrcf_tmp[l_cnt].xrcf116 = l_xrch.xrch010  #DIFF 本幣價差金額
              LET l_xrcf_tmp[l_cnt].xrcf117 = l_xrch.xrch011  #DIFF 本幣匯差金額 
              LET r_xrcf.xrcf106 = l_xrcf_tmp[l_cnt].xrcf106  #DIFF 原幣價差金額
              LET r_xrcf.xrcf116 = l_xrcf_tmp[l_cnt].xrcf116  #DIFF 本幣價差金額
              LET r_xrcf.xrcf117 = l_xrcf_tmp[l_cnt].xrcf117  #DIFF 本幣匯差金額                     
           END IF
        END IF
###step4-1.e---        
###step4.2.e--- 
###step4.3.e---

###step5.最終由ch匯總至cf時,DIFF3純差異金額放至沖暫估的沖銷金額-->在ins_xrcf INSERT INTO xrcf中做

###规格调整###21/29只有在ch產生cf時,才*-1
        #金額/匯率為空預設0
        IF cl_null(l_xrch.xrch007) THEN LET l_xrch.xrch007 = 0 END IF   #原幣未稅單價
        IF cl_null(l_xrch.xrch008) THEN LET l_xrch.xrch008 = 0 END IF   #本幣未稅單價
        IF cl_null(l_xrch.xrch009) THEN LET l_xrch.xrch009 = 0 END IF   #DIFF 原幣價差金額
        IF cl_null(l_xrch.xrch010) THEN LET l_xrch.xrch010 = 0 END IF   #DIFF 本幣價差金額
        IF cl_null(l_xrch.xrch011) THEN LET l_xrch.xrch011 = 0 END IF   #DIFF 本幣匯差金額
        IF cl_null(l_xrch.xrch012) THEN LET l_xrch.xrch012 = 0 END IF   #DIFF 原幣價差單價
        IF cl_null(l_xrch.xrch013) THEN LET l_xrch.xrch013 = 0 END IF   #DIFF 本幣價差單價
        IF cl_null(l_xrch.xrch014) THEN LET l_xrch.xrch014 = 0 END IF   #DIFF 本幣匯差單價
        IF cl_null(l_xrch.xrch015) THEN LET l_xrch.xrch015 = 0 END IF   #DIFF 純差異原幣金額
        IF cl_null(l_xrch.xrch016) THEN LET l_xrch.xrch016 = 0 END IF   #DIFF 純差異本幣金額
        IF cl_null(l_xrch.xrch017) THEN LET l_xrch.xrch017 = 0 END IF   #原幣沖銷未稅金額
        IF cl_null(l_xrch.xrch018) THEN LET l_xrch.xrch018 = 0 END IF   #原幣沖銷稅額
        IF cl_null(l_xrch.xrch019) THEN LET l_xrch.xrch019 = 0 END IF   #原幣沖銷含稅金額
        IF cl_null(l_xrch.xrch020) THEN LET l_xrch.xrch020 = 0 END IF   #本幣沖銷未稅金額
        IF cl_null(l_xrch.xrch021) THEN LET l_xrch.xrch021 = 0 END IF   #本幣沖銷稅額
        IF cl_null(l_xrch.xrch022) THEN LET l_xrch.xrch022 = 0 END IF   #本幣沖銷含稅金額
        
        
        
        INSERT INTO xrch_t(xrchent,xrchcomp,xrchsite,xrchdocno,xrchseq,
                           xrch001,xrch002,xrch003,xrch004,xrch005,
                           xrch006,xrch007,xrch008,xrch009,xrch010,
                           xrch011,xrch012,xrch013,xrch014,xrch015,
                           xrch016,xrch017,xrch018,xrch019,xrch020,
                           xrch021,xrch022,xrch023,xrch024,
                           xrchud001,xrchud002,xrchud003,xrchud004,xrchud005,
                           xrchud006,xrchud007,xrchud008,xrchud009,xrchud010,
                           xrchud011,xrchud012,xrchud013,xrchud014,xrchud015,
                           xrchud016,xrchud017,xrchud018,xrchud019,xrchud020,
                           xrchud021,xrchud022,xrchud023,xrchud024,xrchud025,
                           xrchud026,xrchud027,xrchud028,xrchud029,xrchud030                          
                           )
                    VALUES(l_xrch.xrchent,l_xrch.xrchcomp,l_xrch.xrchsite,l_xrch.xrchdocno,l_xrch.xrchseq,
                           l_xrch.xrch001,l_xrch.xrch002,l_xrch.xrch003,l_xrch.xrch004,l_xrch.xrch005,
                           l_xrch.xrch006,l_xrch.xrch007,l_xrch.xrch008,l_xrch.xrch009,l_xrch.xrch010,
                           l_xrch.xrch011,l_xrch.xrch012,l_xrch.xrch013,l_xrch.xrch014,l_xrch.xrch015,
                           l_xrch.xrch016,l_xrch.xrch017,l_xrch.xrch018,l_xrch.xrch019,l_xrch.xrch020,
                           l_xrch.xrch021,l_xrch.xrch022,l_xrch.xrch023,l_xrch.xrch024,
                           l_xrch.xrchud001,l_xrch.xrchud002,l_xrch.xrchud003,l_xrch.xrchud004,l_xrch.xrchud005,
                           l_xrch.xrchud006,l_xrch.xrchud007,l_xrch.xrchud008,l_xrch.xrchud009,l_xrch.xrchud010,
                           l_xrch.xrchud011,l_xrch.xrchud012,l_xrch.xrchud013,l_xrch.xrchud014,l_xrch.xrchud015,
                           l_xrch.xrchud016,l_xrch.xrchud017,l_xrch.xrchud018,l_xrch.xrchud019,l_xrch.xrchud020,
                           l_xrch.xrchud021,l_xrch.xrchud022,l_xrch.xrchud023,l_xrch.xrchud024,l_xrch.xrchud025,
                           l_xrch.xrchud026,l_xrch.xrchud027,l_xrch.xrchud028,l_xrch.xrchud029,l_xrch.xrchud030                             
                           )

        
        #180821-00038#2 add e---#非杂项写入xrch_t冲暂估明细
        
        INSERT INTO s_axrp130_tmp (xrcfent,xrcfld,xrcfdocno,xrcfseq,xrcfseq2,xrcf001,xrcf002,xrcf007,xrcf008,  
                            xrcf009,xrcf010,xrcf020,xrcf021,xrcf022,xrcf023,xrcf024,xrcf025,xrcforga,
                            xrcf026,xrcf027,xrcf028,xrcf029,xrcf030,xrcf031,xrcf032,xrcf033,xrcf034,
                            xrcf035,xrcf036,xrcf037,xrcf038,xrcf039,xrcf040,xrcf041,xrcf042,xrcf043,
                            xrcf044,xrcf045,xrcf046,xrcf047,xrcf048,xrcf049,xrcf101,xrcf102,xrcf103,
                            xrcf104,xrcf105,xrcf106,xrcf111,xrcf113,xrcf114,xrcf115,xrcf116,xrcf117,
                            xrcf122,xrcf123,xrcf124,xrcf125,xrcf126,xrcf127,xrcf132,xrcf133,xrcf134,
                            xrcf135,xrcf136,xrcf137,xrcf107,xrca001)
         VALUES(r_xrcf.xrcfent,r_xrcf.xrcfld, r_xrcf.xrcfdocno,r_xrcf.xrcfseq,r_xrcf.xrcfseq2,r_xrcf.xrcf001,r_xrcf.xrcf002,r_xrcf.xrcf007,r_xrcf.xrcf008,
                r_xrcf.xrcf009,r_xrcf.xrcf010,r_xrcf.xrcf020,r_xrcf.xrcf021,r_xrcf.xrcf022,r_xrcf.xrcf023,r_xrcf.xrcf024,r_xrcf.xrcf025,r_xrcf.xrcforga,
                r_xrcf.xrcf026,r_xrcf.xrcf027,r_xrcf.xrcf028,r_xrcf.xrcf029,r_xrcf.xrcf030,r_xrcf.xrcf031,r_xrcf.xrcf032,r_xrcf.xrcf033,r_xrcf.xrcf034,
                r_xrcf.xrcf035,r_xrcf.xrcf036,r_xrcf.xrcf037,r_xrcf.xrcf038,r_xrcf.xrcf039,r_xrcf.xrcf040,r_xrcf.xrcf041,r_xrcf.xrcf042,r_xrcf.xrcf043,
                r_xrcf.xrcf044,r_xrcf.xrcf045,r_xrcf.xrcf046,r_xrcf.xrcf047,r_xrcf.xrcf048,r_xrcf.xrcf049,r_xrcf.xrcf101,r_xrcf.xrcf102,r_xrcf.xrcf103,
                r_xrcf.xrcf104,r_xrcf.xrcf105,l_xrcf_tmp[l_cnt].xrcf106,r_xrcf.xrcf111,r_xrcf.xrcf113,r_xrcf.xrcf114,r_xrcf.xrcf115,l_xrcf_tmp[l_cnt].xrcf116,l_xrcf_tmp[l_cnt].xrcf117,  #1217 mod xrcf106 xrcf117 xrcf116 用l_xrcf_tmp写入
                r_xrcf.xrcf122,r_xrcf.xrcf123,r_xrcf.xrcf124,r_xrcf.xrcf125,r_xrcf.xrcf126,r_xrcf.xrcf127,r_xrcf.xrcf132,r_xrcf.xrcf133,r_xrcf.xrcf134,
                r_xrcf.xrcf135,r_xrcf.xrcf136,r_xrcf.xrcf137,l_xrcf_tmp[l_cnt].xrcf107,l_xrcf_tmp[l_cnt].xrca001)      
         
       #170410-00053#1 add e---
       
      END FOREACH #备注：s_aapp130_ins_xrcf_c1（#170410-00053#1） 
   END IF
   
   
   RETURN r_flag,r_xrcf.*,l_xrcf_tmp
END FUNCTION

 
{</section>}
 
