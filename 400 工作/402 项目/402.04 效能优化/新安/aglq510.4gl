#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="aglq510.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:2(2019-06-27 17:47:03), PR版次:0002(2019-12-18 10:39:07)
#+ Customerized Version.: SD版次:(), PR版次:0002(2021-07-02 13:10:29)
#+ Build......: 000144
#+ Filename...: aglq510
#+ Description: 總帳與子系統自動勾稽
#+ Creator....: 02599(2015-10-29 15:07:19)
#+ Modifier...: 08172 -SD/PR- 10500
 
{</section>}
 
{<section id="aglq510.global" type="s" >}
#應用 q02 樣板自動產生(Version:49)
#add-point:填寫註解說明 name="global.memo"
#160302-00006#1   2016/03/02 By 07675   原本单身为可查询作业，增加二次筛选功能    
#160318-00025#7   2016/04/20 By 07675   將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160728-00003#1   2016/07/28 By 02599   AR/AP时,子系统金额取自月结档xrea_t,取金额是需判断若来源类型是2*，则金额*-1
#161021-00014#1   2016/10/21 By 02599   从三诺回收aglq510到产中
#161124-00078#1   2016/11/25 By 01727   TY-P31-20161123001此單據於aapt310已付款沖帳,不知為何底稿與總帳差異會有此筆,且差異金額=0
#161125-00026#1   2016/11/30 By 02599   固资模组交易币别依账套本币呈现，抓取总账余额档金额时，不用考虑原币，直接汇总本币金额，原币金额=本币金额
#161208-00011#1   2016/12/12 By 02114   销退/仓退暂估单用负数呈现
#161209-00052#1   2016/12/14 By 01531   期末在製的檢核，改成依　料、工、費　明細取值（ｘｃｃｄ）去對應總帳的科目（ａｇｌｉ１６１）
#161216-00027#1   2016/12/21 By 01531   1.固资财产科目子系统固定资产编号金额被双倍了。导致有差异。  
#                                       2.查询累折科目固定资产编号aglq510中金额与afaq150中10月累计折旧金融不一致。
#161217-00001#1   2016/12/21 By 01531   成本裏只會存本幣, 不會存原始交易幣,故XC总账抓glar时不考虑币别
#161222-00037#1   2016/12/23 By 02114   抓取底稿资料时,排除已作废的底稿单据
#170208-00010#1   2017/02/28 By 02114   固資AFA的检核, 排除掉 1.列管(faaj048)的資料
#170208-00041#1   2017/02/10 By 02114   成本勾稽的方式没有将委外工单排除掉，导致生成成本的子系统金额有误
#170210-00059#1   2017/02/13 By 02599   固资AFA系统：当累折科目=资产科目时，累折科目对应金额faan018 * -1
#170217-00036#1   2017/02/27 By 02599   AP,AR模組顯示時: 取底稿金額時, 同時取AR的相同科目作合計
#170302-00027#1   2017/03/06 By Hans    修改子系統餘額取 未稅原幣金額  xrea103 - xrea107 未稅本幣金額  xrea113 - xrea117
#170323-00087#2   170324     By albireo 因成本系統為抓取設定檔,可能會有空的科目,因此排除空科目的資料
#170324-00035#2   170324     By albireo glat抓取時不判斷模組別
#170324-00097#1 #170328-00086#2 170327     By albireo 成本底稿應抓取底稿;抓取底稿不分模組,且AFA ANM也應抓取底稿
#170322-00040#1   2017/04/17 By 01531   IF tm.chk_nm='Y' 取值時除了銀存科目外，增加取"anmi152依账套设置资金常用会计科目作业" 的暫收款及暫付款科目作顯示。SCC_8714 F.收款待沖銷科目 SCC_8718 F.應付电匯款科目
#170419-00044#1   170419     By albireo 依情境處理總帳與底稿正負值
#170509-00045#1   2017/05/10 By 02114   子系统与底稿差异页签,销退/仓退暂估单要用负数呈现
#170602-00026#1   2017/06/02 By 02114   固资计算底稿金额时,抓取总账金额时,where glar003 = 上月,改成where glar003 <= 上月
#170711-00051#1   2017/07/13 By 02114   1.依參數S-FIN-6014判斷, IF='3' 則只取總成本數,不看人工製費額
#                                       2.取在製期末成本時, 依工單判別,
#                                         區分出sfaa057  1.廠內/2.委外
#                                       3.取在製生產成本('3')科目, 要分成在製科目(3)及委外在製科目(4)
#170918-00041#1   171003     By 03080   #170322-00040#1電匯款邏輯變更,來源取用改用nmcy_t
#170927-00026#2   2017/10/30 By 07900   aglq510 取固资月結那段排除出售、销账/报废(5,6)的固资
#171113-00008#1   2017/11/13 By 05488   將規格chk_fm(投融資系統)欄位隱藏
#180110-00033#1   2018/01/19 By 09232   切换营运据点后，input的账套、法人等未变更，还是原来的数据
#180119-00011#1   2018/01/23 By 02111   當 agli161 [委外科目設定] * 時，PREPARE aglq510_sel_xccc_pr3 FROM l_sql 應該要判斷  AND glcc001='4'。
#171212-00013#1   2018/01/31 By 01531   1.子細統與總帳差異傳票頁籤增加顯示傳票號碼
#180201-00030#1   2018/02/02 By 00768   修改固资的底稿计算
#171212-00013#2   2018/02/07 By 01531   增加頁籤可以查詢子系統科目，但是直接從總帳輸入的明細
#180213-00012#1   2018/02/13 By 00768   处理第一页签的原材料子模块的总金额与第二页签的原材料的总金额不一致
#180319-00029#1   2018/03/19 By 05795   aglq510的程式段邏輯要調整
#180308-00059#1   2018/03/28 By 09505   aglq510需呈现发出商品会科
#180331-00005#1   2018/04/02 By 05634   修改glaald_desc參照的欄位
#180428-00012#1   2018/04/28 By 00768   总账扣除审计调整部分
#180509-00006#1   2018/05/09 By 05795   #180319-00029#1得sql要调整
#180702-00039#1   2018/07/02 By 01531   aoos020,S-FIN-6014在制人工制费转出规则=3依产出套数,aglq510在抓取期末在制成本取期末结存金额-材料
#180622-00050#1   2018/07/09 By 09232   18主机 6区 ent=2222 ap单据皆已生成凭证，但aglq510未显示凭证编号/凭证日期
#180716-00006#1   2018/07/18 By 09232   aglq510差異明細頁簽邏輯調整(AR/AP)
#180716-00006#2   2018/08/02 By 09232   aglq510优化：增加差异页签NM模组逻辑 
#180716-00006#3   2018/08/20 By 09232   1.aglq510优化：增加差异页签AFA模组逻辑
#                                       2.优化AR/AP检核
#                                       3.aglq510优化：增加差异页签AXC模组逻辑
#180815-00022#1   2018/10/12 By 09232   aglq510抓取成本系统科目时，漏抓axci200中所设科目。
#181024-00070#1   2018/10/25 By 01531  （仅调整4fd)【子系統與底稿差異】和【子系統與總帳差異明細】页签中交易对象清空format属性,4gl需下载重新上传
#181009-00011#1   2018/11/13 By 09232   aoos020的S-FIN-6014"在製人工製費轉出規則"是設3:依產出套數的邏輯調整:抓取table從xccd改為xcce,xcch改为xcci
#                                       aglq510NM模組納入票據
#181226-00067#1   2018/12/27 By 05634   調整子系統未啟用分錄底稿,差異頁籤的錯誤代碼說明
#181228-00020#1   2019/01/04 By 05795   子系统与总账明细内，若单据编号为axrq343的待底单，则不会带出传票编号已经传票日期
#190108-00068#1   2019/01/09 By 05016   單號為空不串查
#181224-00063#1   2019/02/11 By 05634   agl-00831檢核增加排除帳款單性質23:預付待抵單(帳款單性質23:預付待抵單,是當aapt310性質是14:預付應付時產生的,產品已不使用性質14,但會有舊資料問題)
#181207-00003#1   2019/02/27 By 11384   顯示總帳自行輸入檢核頁簽
#190313-00030#1   2019/03/18 By 00537   181009-00011#1改错，l_amt，l_xcce赋值前没有清空变量导致前一次的数据异常传下去,导致生产成本-直接材料成本子系统与总账不符
#190315-00009#1   2019/03/20 By 00537   将委外从xccd改为xcce捞取，切分xcce007是否等于'DL+OH+SUB'的情况
#190221-00009#1   2019/03/22 By 11384   单头增加checkbox [差異頁籤顯示警示]，默认N,单身增加[建議作法]信息显示
#181204-00026#9   2019/04/23 By 05016   差異頁籤優化ANM:
#                                       1.由傳票角度檢核【現金類科目】glac016='Y', 有無產生相應的nmbc 異動表
#                                       2.anmt540/anmt510 nmba006='Y' 是否有產生anmt311並且拋傳票
#                                       3.檢核應拋傳票未拋傳票段,只限制帳務單
#                                       4.由ANM的交易單, 檢核是否應產生帳務單, 未產生帳務單者 
#                                       5.差異頁籤優化:EMPL抓員工名稱 差異頁籤優化:ANM 應拋憑證未拋憑證 
#190514-00012#1  2019/05/20  By 05795   调整sql语句
#190322-00005#90 2019/05/20  By 12133   匯出excel，改寫為POI方式
#190613-00046#1  2019/06/14  By 00537   成本稽核时，发料（原材料），入库（人工制费）要分开计算
#190604-00001#1  2019/06/18  By 05634   AP/AR需扣除审计调整,還原180716-00006#2
#190618-00037#1  2019/06/18  By 05634   固資抓取總帳需扣掉審計調整的部份
#190416-00021#1  2019/06/20  By 08729   補上成本類SQL中缺的ENT
#190516-00019#1  2019/06/26  by 08172   原差异页签改为错误明细，新增差异页签显示中间层(科目币别+对象/账户)
#190709-00037#1  2019/07/10  By 05634   同180201-00030#1處理,成本底稿金額不應拿總帳科餘來加,取消170324-00097#1這部份邏輯 
#190716-00012#1  2019/07/18  By 00537   把拆件也分为一般在制和委外，一般在制已有union拆件xcci，但是要加上sfaa057 <>'2'的条件，委外加上拆件的union
#190604-00035#1  2019/07/19  By 05634   調整差异页签成本检核sql邏輯
#190704-00044#1  2019/07/05  By 05634   修正應付有做直接沖帳的立帳單,審核但未拋憑證的, aglq510未提示"應拋未拋傳票的交易單號"(agl-00828)
#181219-00040#28 2019/08/07  By 10554   加入anmt710產生的單據
#190806-00030#1  2019/08/07  By 05795   xcck006这个记录得是单据异动单号。不会记录到账款单号所以ND apcbdocno=xcck006 AND apcbseq=xcck007 这个条件需要调整
#190516-00019#1  2019/08/29  By 03080   錯誤頁籤串聯子系統Q類，依選定單身條件查看
#190902-00053#1  2019/09/03  By 00537   通过成本分群从委外抓在制页签的加工费科目时，考虑在制页签的成本分群设为*的情况 
#191003-00008#1  2019/10/03  By 05634   1.修正取應收票據應該是抓資金來源(nmcy003)=01.應收票據 2.修正查詢科目時,應看nmcy040科目
#190408-00030#1  2019/11/06  By 05634   1.子系統未啟用分錄底稿時,"差異頁籤"的"子系統與底稿差異(原幣)(本幣)"欄位應該隱藏
#                                       2.修正aapt340,aapt341在"差異頁籤"的"子系統與總帳差異(原幣)(本幣)"金額異常,造成誤判錯誤
#191111-00027#1  2019/11/13  By 03080   錯誤明細，AP AR子系統與總帳分錄各依照帳款增加的方向調整基準一致，才能正確比較餘額
#191125-00033#1  2019/11/26  By 05795   例如十月立暂估，十一月冲暂估但是账款单未审核，aglq510在查10得时候，错误明细页签暂估单子系统原币和本币金额翻倍了得问题
#191120-00020#1  2019/12/13  By 13132   标记错误类型（用于排序）flag类型改为定义chr2,测试时需检查flag超出一位的值是否正常而未截位
#190214-00011#1  2019/12/18  By 10500   AR "agl-00831交易單單別不產生傳票"也应增加排除账款单性质23的数据
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"
#20210702#1 add by wy 执行至b_fill6报错fatal error -1326，进行程序调整测试排错
#end add-point
#(ver:45) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:45) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:46) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#(ver:46) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:46) --- add end ---
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_glar_d RECORD
       #statepic       LIKE type_t.chr1,
       
       sel LIKE type_t.chr1, 
   sys LIKE type_t.chr500, 
   glar001 LIKE glar_t.glar001, 
   glar001_desc LIKE type_t.chr500, 
   glar009 LIKE glar_t.glar009, 
   soamt LIKE type_t.num20_6, 
   doamt LIKE type_t.num20_6, 
   zoamt LIKE type_t.num20_6, 
   samt LIKE type_t.num20_6, 
   damt LIKE type_t.num20_6, 
   zamt LIKE type_t.num20_6, 
   diff LIKE type_t.chr500, 
   result LIKE type_t.chr500 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_glar_d
DEFINE g_master_t                   type_g_glar_d
DEFINE g_glar_d          DYNAMIC ARRAY OF type_g_glar_d
DEFINE g_glar_d_t        type_g_glar_d
 
      
DEFINE g_wc                 STRING
DEFINE g_wc_t               STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                STRING
DEFINE g_wc_filter          STRING
DEFINE g_wc_filter_t        STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10              
DEFINE l_ac_d               LIKE type_t.num10              #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_detail_cnt2        LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
DEFINE g_detail_idx         LIKE type_t.num10
DEFINE g_detail_idx2        LIKE type_t.num10
DEFINE g_hyper_url          STRING                        #hyperlink的主要網址
DEFINE g_tot_cnt            LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page        LIKE type_t.num10             #每頁筆數
DEFINE g_current_row_tot    LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_act_list      STRING                        #分頁ACTION清單
DEFINE g_page_start_num     LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num       LIKE type_t.num10             #目前頁面結束筆數
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_wc_filter_table    STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

##end add-point
 
#add-point:傳入參數說明 name="global.argv"
 TYPE type_g_glar2_d RECORD
       sys2 LIKE type_t.chr500, 
   xrea009 LIKE xrea_t.xrea009, 
   xrea009_desc LIKE type_t.chr500, 
   xrea019 LIKE xrea_t.xrea019, 
   xrea019_desc LIKE type_t.chr500, 
   xrea100 LIKE xrea_t.xrea100, 
   samt1 LIKE xrea_t.xrea103, 
   damt1 LIKE xrea_t.xrea103, 
   diff1 LIKE xrea_t.xrea103, 
   samt2 LIKE xrea_t.xrea103, 
   damt2 LIKE xrea_t.xrea103, 
   diff2 LIKE xrea_t.xrea103
       END RECORD
 
 TYPE type_g_glar3_d RECORD
       sys3 LIKE type_t.chr500, 
   glgadocno LIKE glga_t.glgadocno, 
   glgadocdt LIKE glga_t.glgadocdt, 
   glgastus LIKE glga_t.glgastus, 
   glapdocno LIKE glap_t.glapdocno, 
   glapdocdt LIKE glap_t.glapdocdt, 
   glapstus LIKE glap_t.glapstus, 
   glgb002 LIKE glgb_t.glgb002, 
   glgb002_desc LIKE type_t.chr500, 
   glgb005 LIKE glgb_t.glgb005, 
   damt3 LIKE glgb_t.glgb003, 
   zamt3 LIKE glgb_t.glgb003, 
   diff3 LIKE glgb_t.glgb003, 
   damt4 LIKE glgb_t.glgb003, 
   zamt4 LIKE glgb_t.glgb003, 
   diff4 LIKE glgb_t.glgb003
       END RECORD
 
 TYPE type_g_glar4_d RECORD
       sys4 LIKE type_t.chr500, 
   xrea005 LIKE xrea_t.xrea005, 
   xrea008 LIKE xrea_t.xrea008, 
   glapdocno LIKE glap_t.glapdocno,
   glapdocdt LIKE glap_t.glapdocdt,
   xrea009 LIKE xrea_t.xrea009, 
   xrea009_4_desc LIKE type_t.chr500, 
   xrea019 LIKE xrea_t.xrea019, 
   xrea019_4_desc LIKE type_t.chr500, 
   xrea100 LIKE xrea_t.xrea100, 
   xrea103 LIKE xrea_t.xrea103, 
   xrea113 LIKE xrea_t.xrea113
       END RECORD

#190516-00019#1 add -s
TYPE type_g_glar5_d RECORD
   sys6 LIKE type_t.chr500, 
   glar001 LIKE glar_t.glar001, 
   glar001_desc LIKE type_t.chr500, 
   glar009 LIKE glar_t.glar009, 
   glar017 LIKE glar_t.glar017,
   glar017_desc LIKE type_t.chr500,
   nmbx003 LIKE nmbx_t.nmbx003,
   nmbx003_desc LIKE type_t.chr500,
   soamt5 LIKE type_t.num20_6, 
   doamt5 LIKE type_t.num20_6, 
   zoamt5 LIKE type_t.num20_6, 
   samt5 LIKE type_t.num20_6, 
   damt5 LIKE type_t.num20_6, 
   zamt5 LIKE type_t.num20_6
       END RECORD
       
DEFINE g_glar5_d      DYNAMIC ARRAY OF type_g_glar5_d
DEFINE g_glar5_d_t    type_g_glar5_d       
DEFINE g_detail_cnt7  LIKE type_t.num5
DEFINE g_detail_idx7  LIKE type_t.num10
#190516-00019#1 add -e

#171212-00013#2 add s---
 TYPE type_g_glaq5_d RECORD
   glaq002      LIKE glaq_t.glaq002, 
   glaq002_desc LIKE type_t.chr500,
   glaq005      LIKE glaq_t.glaq005,  
   glaqdocno    LIKE glaq_t.glaqdocno,
   glapdocdt_1  LIKE glap_t.glapdocdt,
   glaq010      LIKE glaq_t.glaq010, 
   glaq003      LIKE glaq_t.glaq003
       END RECORD
DEFINE g_glaq5_d   DYNAMIC ARRAY OF type_g_glaq5_d  
DEFINE g_glaq5_d_t type_g_glaq5_d
DEFINE g_detail_cnt5  LIKE type_t.num5
#171212-00013#2 add e---

#180716-00006#1 add-s
TYPE type_g_glaq6_d RECORD
   sys5          LIKE type_t.chr500,
   glaq002       LIKE glaq_t.glaq002,
   glaq002_desc  LIKE type_t.chr100,     
   glaq005       LIKE glaq_t.glaq005,
   glaq022       LIKE glaq_t.glaq021,
   glaq022_desc  LIKE type_t.chr100,   
   glaqdocno     LIKE glaq_t.glaqdocno,
   glaq010       LIKE glaq_t.glaq010,
   glaq003       LIKE glaq_t.glaq003,
   glgbdocno     LIKE glgb_t.glgbdocno,
   glgb010       LIKE glgb_t.glgb010,
   glgb003       LIKE glgb_t.glgb003,
   xrcbdocno     LIKE xrcb_t.xrcbdocno,
   xrcbseq       LIKE xrcb_t.xrcbseq,
   gzza001       LIKE oobx_t.oobx004,
   xrcb105       LIKE xrcb_t.xrcb105,
   xrcb115       LIKE xrcb_t.xrcb115,
   #180716-00006#3 add-s
   diff_1        LIKE xrcb_t.xrcb105,
   diff_2        LIKE xrcb_t.xrcb105,
   diff_3        LIKE xrcb_t.xrcb115,
   diff_4        LIKE xrcb_t.xrcb115,
   #180716-00006#3 add-e
   message_code  LIKE type_t.chr100,
   advise        LIKE type_t.chr100,
   message1      LIKE type_t.chr500  #180716-00006#3 add
       END RECORD
DEFINE g_glaq6_d   DYNAMIC ARRAY OF type_g_glaq6_d  
DEFINE g_glaq6_d_t type_g_glaq6_d
DEFINE g_detail_idx6        LIKE type_t.num10
#180716-00006#1 add-e
       
DEFINE g_glar2_d   DYNAMIC ARRAY OF type_g_glar2_d
DEFINE g_glar2_d_t type_g_glar2_d
 
DEFINE g_glar3_d   DYNAMIC ARRAY OF type_g_glar3_d
DEFINE g_glar3_d_t type_g_glar3_d
 
DEFINE g_glar4_d   DYNAMIC ARRAY OF type_g_glar4_d
DEFINE g_glar4_d_t type_g_glar4_d
DEFINE g_detail_idx3        LIKE type_t.num10
DEFINE g_detail_idx4        LIKE type_t.num10
DEFINE g_detail_idx5        LIKE type_t.num10  #171212-00013#2
DEFINE tm            RECORD 
       glaald        LIKE glaa_t.glaald,
       #glaald_desc   LIKE glaal_t.glaal003,   #180331-00005#1 mark
       glaald_desc   LIKE glaal_t.glaal002,   #180331-00005#1 add
       glaacomp      LIKE glaa_t.glaacomp,
       glaacomp_desc LIKE ooefl_t.ooefl003,
       glar002       LIKE glar_t.glar002,
       glar003       LIKE glar_t.glar003,
       chk_ar        LIKE type_t.chr1,
       chk_ap        LIKE type_t.chr1,
       chk_fa        LIKE type_t.chr1,
       chk_nm        LIKE type_t.chr1,
       chk_xc        LIKE type_t.chr1,
       chk_show      LIKE type_t.chr1,  #190221-00009#1 add
       chk_fm        LIKE type_t.chr1
       END RECORD
DEFINE g_glaa003     LIKE glaa_t.glaa003
DEFINE g_glaa004     LIKE glaa_t.glaa004
DEFINE g_glaa120     LIKE glaa_t.glaa120  #171103-00001#1 add 成本计算类型
DEFINE g_glaa121     LIKE glaa_t.glaa121
DEFINE g_wc3         STRING
DEFINE g_param   RECORD
   glaald  LIKE glaa_t.glaald,
   glar002 LIKE type_t.num5,
   glar003 LIKE type_t.num5,    
   ar      LIKE type_t.chr1, 
   ap      LIKE type_t.chr1,
   flag    LIKE type_t.chr1,
   nm      LIKE type_t.chr1,  #180716-00006#2 add
   fa      LIKE type_t.chr1,   #180716-00006#3 add
   xc      LIKE type_t.chr1   #180716-00006#3 add
END RECORD
#180815-00022#1 add-s
DEFINE g_str_pos    LIKE type_t.num5      
DEFINE g_slip_len   LIKE type_t.num5   
#180815-00022#1 add-e
#add by lixwz210707 s---
DEFINE g_agl00826   LIKE type_t.chr100
DEFINE g_agl00827   LIKE type_t.chr100
DEFINE g_agl00828   LIKE type_t.chr100
DEFINE g_agl00829   LIKE type_t.chr100
DEFINE g_agl00830   LIKE type_t.chr100
DEFINE g_agl00831   LIKE type_t.chr100
DEFINE g_agl00832   LIKE type_t.chr100
DEFINE g_agl00833   LIKE type_t.chr100
DEFINE g_agl00834   LIKE type_t.chr100
DEFINE g_agl00836   LIKE type_t.chr100
DEFINE g_agl00836   LIKE type_t.chr100
DEFINE g_agl00838   LIKE type_t.chr100
DEFINE g_agl00842   LIKE type_t.chr100
DEFINE g_agl00846   LIKE type_t.chr100
DEFINE g_agl00847   LIKE type_t.chr100
DEFINE g_agl00848   LIKE type_t.chr100
DEFINE g_agl00849   LIKE type_t.chr100
DEFINE g_agl00851   LIKE type_t.chr100
DEFINE g_agl00852   LIKE type_t.chr100
DEFINE g_agl00898   LIKE type_t.chr100
DEFINE g_agl00899   LIKE type_t.chr100
DEFINE g_agl44594   LIKE type_t.chr100
DEFINE g_agl44595   LIKE type_t.chr100
DEFINE g_agl44597   LIKE type_t.chr100
DEFINE g_agl44598   LIKE type_t.chr100
DEFINE g_agl44598   LIKE type_t.chr100
DEFINE g_agl44600   LIKE type_t.chr100
DEFINE g_agl44600   LIKE type_t.chr100
DEFINE g_agl44601   LIKE type_t.chr100
DEFINE g_agl44603   LIKE type_t.chr100
DEFINE g_agl44604   LIKE type_t.chr100
DEFINE g_agl44605   LIKE type_t.chr100
DEFINE g_agl44606   LIKE type_t.chr100
DEFINE g_agl44607   LIKE type_t.chr100
DEFINE g_agl44608   LIKE type_t.chr100
DEFINE g_agl44608   LIKE type_t.chr100
DEFINE g_agl44609   LIKE type_t.chr100
DEFINE g_agl44610   LIKE type_t.chr100
DEFINE g_agl44611   LIKE type_t.chr100
DEFINE g_agl44612   LIKE type_t.chr100
DEFINE g_agl44613   LIKE type_t.chr100
DEFINE g_agl44614   LIKE type_t.chr100
DEFINE g_agl44615   LIKE type_t.chr100
DEFINE g_agl44616   LIKE type_t.chr100
DEFINE g_agl44617   LIKE type_t.chr100
DEFINE g_agl44618   LIKE type_t.chr100
DEFINE g_agl44619   LIKE type_t.chr100
DEFINE g_agl44620   LIKE type_t.chr100
DEFINE g_agl44621   LIKE type_t.chr100
DEFINE g_agl44623   LIKE type_t.chr100
DEFINE g_agl44624   LIKE type_t.chr100

#add by lixwz210707 e---
#end add-point
 
{</section>}
 
{<section id="aglq510.main" type="s" >}
 #應用 a26 樣板自動產生(Version:7)
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
   CALL cl_ap_init("cgl","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " ", 
                      " FROM ",
                      " "
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aglq510_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE aglq510_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aglq510_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_aglq510 WITH FORM cl_ap_formpath("cgl",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL aglq510_init()   
 
      #進入選單 Menu (="N")
      CALL aglq510_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_aglq510
      
   END IF 
   
   CLOSE aglq510_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   DROP TABLE aglq510_tmp
   DROP TABLE aglq510_tmp01 #180716-00006#1 add
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="aglq510.init" type="s" >}
#+ 畫面資料初始化
PRIVATE FUNCTION aglq510_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = "  1 = 1  "   #171117-00042 modify 將1=1改為空白  #171219-00006 改為"  1 = 1  "
   LET g_wc_filter_t = ""   #171117-00042 modify 將1=1改為空白
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('glgastus','13','N,Y,X,S')
   CALL cl_set_combo_scc_part('glapstus','13','N,Y,S,A,D,R,W,X')
   CALL aglq510_create_temp_table()
   LET g_param.flag='N'  #180716-00006#1 ADD
   CALL aglq510_get_slip() RETURNING  g_success,g_str_pos,g_slip_len   #180815-00022#1 add
   #end add-point
 
   CALL aglq510_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="aglq510.default_search" type="s" >}
PRIVATE FUNCTION aglq510_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " glarld = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " glar001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " glar002 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET g_wc = g_wc, " glar003 = '", g_argv[04], "' AND "
   END IF
   IF NOT cl_null(g_argv[05]) THEN
      LET g_wc = g_wc, " glar004 = '", g_argv[05], "' AND "
   END IF
 
 
 
 
 
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段開始後 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.ui_dialog" type="s" >}
#+ 功能選單 
PRIVATE FUNCTION aglq510_ui_dialog()
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE li_idx     LIKE type_t.num10
   DEFINE lc_action_choice_old     STRING
   DEFINE lc_current_row           LIKE type_t.num10
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   #(ver:46) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:46) --- add end ---
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   #180716-00006#1 add-s
   DEFINE l_slip       LIKE type_t.chr20
   DEFINE l_gzza001    LIKE gzza_t.gzza001
   DEFINE l_success    LIKE type_t.num5
    
   #180716-00006#1 add-e
   #end add-point 
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
         
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL aglq510_b_fill()
   ELSE
      CALL aglq510_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_glar_d.clear()
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 1
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL aglq510_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_glar_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL aglq510_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL aglq510_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_glar2_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 2
            
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               DISPLAY g_detail_idx2 TO FORMONLY.h_index
               DISPLAY g_glar2_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row

               #end add-point 
 
            #自訂ACTION(detail_show,page_2)
            
            #add-point:page2自定義行為

            #end add-point
         END DISPLAY
 
         DISPLAY ARRAY g_glar3_d TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 3
            
            BEFORE ROW
               LET g_detail_idx3 = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx3
               DISPLAY g_detail_idx3 TO FORMONLY.h_index
               DISPLAY g_glar3_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row

               #end add-point 
 
            #自訂ACTION(detail_show,page_3)
            
            #add-point:page3自定義行為

            #end add-point
         END DISPLAY
 
         DISPLAY ARRAY g_glar4_d TO s_detail4.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 4
            
            BEFORE ROW
               LET g_detail_idx4 = DIALOG.getCurrentRow("s_detail4")
               LET l_ac = g_detail_idx4
               DISPLAY g_detail_idx4 TO FORMONLY.h_index
               DISPLAY g_glar4_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row

               #end add-point 
 
            #自訂ACTION(detail_show,page_4)
            
            #add-point:page4自定義行為

            #end add-point
         END DISPLAY
         
         #171212-00013#2 add s---
         DISPLAY ARRAY g_glaq5_d TO s_detail5.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 5
            
            BEFORE ROW
               LET g_detail_idx5 = DIALOG.getCurrentRow("s_detail5")
               LET l_ac = g_detail_idx5
               DISPLAY g_detail_idx5 TO FORMONLY.h_index
               DISPLAY g_glaq5_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row

               #end add-point 
 
            #自訂ACTION(detail_show,page_5)
            
            #add-point:page5自定義行為

            #end add-point
         END DISPLAY 
         #171212-00013#2 add e--- 
         #180716-00006#1 add-s
         DISPLAY ARRAY g_glaq6_d TO s_detail6.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 6
            
            BEFORE ROW
               LET g_detail_idx6 = DIALOG.getCurrentRow("s_detail6")
               LET l_ac = g_detail_idx6
               IF cl_null(l_ac) OR l_ac=0 THEN
                  LET l_ac=1
               END IF
               DISPLAY g_detail_idx6 TO FORMONLY.h_index
               DISPLAY g_glaq6_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row
           
               #end add-point 
        
            #自訂ACTION(detail_show,page_4)
            
            #add-point:page4自定義行為

            #end add-point
         END DISPLAY
         #180716-00006#1 add-s    
         #190516-00019#1 add -s
         DISPLAY ARRAY g_glar5_d TO s_detail7.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 7
            
            BEFORE ROW
               LET g_detail_idx7 = DIALOG.getCurrentRow("s_detail7")
               LET l_ac = g_detail_idx7
               IF cl_null(l_ac) OR l_ac=0 THEN
                  LET l_ac=1
               END IF
               DISPLAY g_detail_idx7 TO FORMONLY.h_index
               DISPLAY g_glar5_d.getLength() TO FORMONLY.h_count
               #add-point:input段before row
           
               #end add-point 
        
            #自訂ACTION(detail_show,page_4)
            
            #add-point:page4自定義行為

            #end add-point
         END DISPLAY
         #190516-00019#1 add -e         
         #end add-point
         
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL aglq510_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION aglq510_01
            LET g_action_choice="aglq510_01"
            IF cl_auth_chk_act("aglq510_01") THEN
               
               #add-point:ON ACTION aglq510_01 name="menu.aglq510_01"
               #180716-00006#1 add-s
               INITIALIZE g_param.* TO NULL
               CALL aglq510_01() RETURNING g_param.*
               IF g_param.flag='Y' THEN
                  LET tm.glaald=g_param.glaald
                  LET tm.glar002=g_param.glar002
                  LET tm.glar003=g_param.glar003
                  LET tm.chk_ar=g_param.ar
                  LET tm.chk_ap=g_param.ap
                  LET tm.chk_nm=g_param.nm  #180716-00006#2 add
                  LET tm.chk_fa=g_param.fa  #180716-00006#3 add
                  LET tm.chk_xc=g_param.xc  #180716-00006#3 add
                  CALL aglq510_glaald_desc(tm.glaald)
                  CALL aglq510_b_fill()
               END IF 
               LET g_param.flag='N'
               #180716-00006#1 add-e
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aglq510_query()
               #add-point:ON ACTION query name="menu.query"
               CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo name="menu.datainfo"
               
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickout
            LET g_action_choice="quickout"
               
               #add-point:ON ACTION quickout name="menu.quickout"
               #180716-00006#1 add-s
               MENU "" ATTRIBUTES (STYLE="popup")
                  BEFORE MENU
                  #190516-00019#1 add -s
                  IF g_current_page = 7 THEN
                     HIDE OPTION "sys_gl"
                     HIDE OPTION "sys_sub"
                  ELSE
                     HIDE OPTION "sys_diff_gl"
                     HIDE OPTION "sys_diff_sub"
                  END IF
                  #总账串查_差异页签
                  ON ACTION sys_diff_gl
                     IF NOT cl_null(g_glar5_d[l_ac].sys6) THEN
                        LET la_param.prog = 'aglq770'
                        LET ls_js = util.JSON.stringify(la_param)
                        CALL cl_cmdrun(ls_js)
                     END IF
                     
                     
                     
                  #子系统串查   
                  ON ACTION sys_diff_sub
                     IF NOT cl_null(g_glar5_d[l_ac].sys6) THEN
                        CASE g_glar5_d[l_ac].sys6
                           WHEN '1'
                              LET la_param.prog = 'axrq911'
                              #190516-00019#1-----s
                              LET la_param.param[1] = tm.glaacomp
                              LET la_param.param[2] = tm.glar002
                              LET la_param.param[3] = tm.glar003
                              LET la_param.param[4] = tm.glar003 
                              LET la_param.param[5] = tm.glaald
                              LET la_param.param[7] = g_glar5_d[l_ac].glar017
                              LET la_param.param[8] = tm.glaald
                              LET la_param.param[10] = g_glar5_d[l_ac].glar009
                              LET la_param.param[11] = g_glar5_d[l_ac].glar001
                              #190516-00019#1-----e
                           WHEN '2'
                              LET la_param.prog = 'aapq911'
                              #190516-00019#1-----s
                              LET la_param.param[1] = tm.glaacomp
                              LET la_param.param[2] = tm.glar002
                              LET la_param.param[3] = tm.glar003
                              LET la_param.param[4] = tm.glar003 
                              LET la_param.param[5] = tm.glaald
                              LET la_param.param[7] = g_glar5_d[l_ac].glar017
                              LET la_param.param[8] = tm.glaald
                              LET la_param.param[10] = g_glar5_d[l_ac].glar009
                              LET la_param.param[11] = g_glar5_d[l_ac].glar001
                              #190516-00019#1-----e
                           WHEN '3'
                              LET la_param.prog = 'afaq150'
                           WHEN '4'
                              LET la_param.prog = 'anmq310'
                           WHEN '5'
                              LET la_param.prog = 'axcq530'
                        END CASE
                        LET ls_js = util.JSON.stringify(la_param)
                        CALL cl_cmdrun(ls_js)
                     END IF
                     
                  #190516-00019#1 add -e
                  #总账串查
                  ON ACTION sys_gl
                     IF NOT cl_null(g_glaq6_d[l_ac].glaqdocno) THEN
                        CALL s_aooi200_fin_get_slip(g_glaq6_d[l_ac].glaqdocno) RETURNING l_success,l_slip
                        SELECT oobx004 INTO l_gzza001 FROM oobx_t 
                         WHERE oobxent=g_enterprise AND oobx001=l_slip
                        IF l_gzza001<>'MULTI' THEN
                           LET la_param.prog = l_gzza001
                           LET la_param.param[1] = tm.glaald
                           LET la_param.param[2] = g_glaq6_d[l_ac].glaqdocno
                           LET ls_js = util.JSON.stringify(la_param)
                           CALL cl_cmdrun_wait(ls_js)
                        ELSE
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = l_slip 
                           LET g_errparam.code = "agl-00835" 
                           LET g_errparam.popup = TRUE 
                           CALL cl_err()
                        END IF 
                     END IF
                     
                     
                     
                  #子系统串查   
                  ON ACTION sys_sub
                     IF NOT cl_null(g_glaq6_d[l_ac].xrcbdocno) THEN
                        CALL s_aooi200_fin_get_slip(g_glaq6_d[l_ac].xrcbdocno) RETURNING l_success,l_slip
                        SELECT oobx004 INTO l_gzza001 FROM oobx_t 
                         WHERE oobxent=g_enterprise AND oobx001=l_slip
                        IF l_gzza001<>'MULTI' THEN
                           LET la_param.prog = l_gzza001
                           LET la_param.param[1] = tm.glaald
                           LET la_param.param[2] = g_glaq6_d[l_ac].xrcbdocno
                           LET ls_js = util.JSON.stringify(la_param)
                           CALL cl_cmdrun_wait(ls_js)
                        ELSE
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = l_slip 
                           LET g_errparam.code = "agl-00835" 
                           LET g_errparam.popup = TRUE 
                           CALL cl_err()                        
                        END IF 
                     END IF
                                          
               END MENU
               #180716-00006#1 add-e
               

               #END add-point
               
 
 
 
 
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL aglq510_filter()
            #add-point:ON ACTION filter name="menu.filter"
            CALL aglq510_b_fill()#160118-00005#1  07675 ADD
            #END add-point
 
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
 
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION datarefresh   # 重新整理
            LET g_error_show = 1
            CALL aglq510_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:46) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               LET lb_get_type = "old"   #180716-00006#3 add
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_glar_d.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_glar_d[l_arr_cnt]
                     END FOR
 
 
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     #190322-00005#90  2019/05/20 By 12133 add---(S)
                     LET l_arr_len = g_glaq6_d.getLength()
                     LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[2] = "s_detail6"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[2][l_arr_cnt] = g_glaq6_d[l_arr_cnt]
                     END FOR
                     
                     LET l_arr_len = g_glar3_d.getLength()
                     LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[3] = "s_detail3"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[3][l_arr_cnt] = g_glar3_d[l_arr_cnt]
                     END FOR
                     
                     LET l_arr_len = g_glar4_d.getLength()
                     LET g_export_tag[4] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[4] = "s_detail4"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[4][l_arr_cnt] = g_glar4_d[l_arr_cnt]
                     END FOR
                     
                     LET l_arr_len = g_glaq5_d.getLength()
                     LET g_export_tag[5] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[5] = "s_detail5"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[5][l_arr_cnt] = g_glaq5_d[l_arr_cnt]
                     END FOR
                     
                     LET l_arr_len = g_glar2_d.getLength()
                     LET g_export_tag[6] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[6] = "s_detail2"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[6][l_arr_cnt] = g_glar2_d[l_arr_cnt]
                     END FOR
                     #190322-00005#90  2019/05/20 By 12133 add---(E)
                     #190516-00019#1 add -s
                     LET l_arr_len = g_glar5_d.getLength()
                     LET g_export_tag[7] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[7] = "s_detail7"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[7][l_arr_cnt] = g_glar5_d[l_arr_cnt]
                     END FOR
                     #190516-00019#1 add -e
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #END add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:46) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_glar_d)
                     LET g_export_id[1]   = "s_detail1"
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     #180716-00006#1 mark-s
#                     LET g_export_node[2] = base.typeInfo.create(g_glar2_d)
#                     LET g_export_id[2]   = "s_detail2"
#                  
#                     LET g_export_node[3] = base.typeInfo.create(g_glar3_d)
#                     LET g_export_id[3]   = "s_detail3"
#                     #180716-00006#1 mark-e
                   
                     LET g_export_node[4] = base.typeInfo.create(g_glar4_d)
                     LET g_export_id[4]   = "s_detail4"
#                   #180716-00006#1 mark-s
#                     #171212-00013#2 add s---
#                     LET g_export_node[5] = base.typeInfo.create(g_glaq5_d)
#                     LET g_export_id[5]   = "s_detail5" 
#                     #171212-00013#2 add e---
                     #180716-00006#1 mark-e
                     #180716-00006#1 add-s
                     LET g_export_node[2] = base.typeInfo.create(g_glaq6_d)
                     LET g_export_id[2]   = "s_detail6"
                     #180716-00006#1 add-e
                     #190322-00005#90  2019/05/30 By 12133 add---(S)
                     LET g_export_node[3] = base.typeInfo.create(g_glar3_d)
                     LET g_export_id[3]   = "s_detail3"
                     LET g_export_node[5] = base.typeInfo.create(g_glaq5_d)
                     LET g_export_id[5]   = "s_detail5"
                     LET g_export_node[6] = base.typeInfo.create(g_glar2_d)
                     LET g_export_id[6]   = "s_detail2"
                     #190322-00005#90  2019/05/30 By 12133 add---(E)
                     #190516-00019#1 add -s
                     LET g_export_node[7] = base.typeInfo.create(g_glar5_d)
                     LET g_export_id[7]   = "s_detail7"
                     #190516-00019#1 add -e
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:43)
                     
                     #END add-point
               END CASE   #(ver:46) add
            END IF
 
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            CALL aglq510_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL aglq510_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL aglq510_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL aglq510_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_glar_d.getLength()
               LET g_glar_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_glar_d.getLength()
               LET g_glar_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_glar_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_glar_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_glar_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_glar_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         #180716-00006#1 add-s
         ON ACTION modify_detail
               MENU "" ATTRIBUTES (STYLE="popup")
                  BEFORE MENU
                  #总账串查
                  ON ACTION sys_gl
                     IF NOT cl_null(g_glaq6_d[l_ac].glaqdocno) THEN
                        CALL s_aooi200_fin_get_slip(g_glaq6_d[l_ac].glaqdocno) RETURNING l_success,l_slip
                        SELECT oobx004 INTO l_gzza001 FROM oobx_t 
                         WHERE oobxent=g_enterprise AND oobx001=l_slip
                        IF l_gzza001<>'MULTI' THEN
                           LET la_param.prog = l_gzza001
                           LET la_param.param[1] = tm.glaald
                           LET la_param.param[2] = g_glaq6_d[l_ac].glaqdocno
                           LET ls_js = util.JSON.stringify(la_param)
                           CALL cl_cmdrun_wait(ls_js)
                        ELSE
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = l_slip 
                           LET g_errparam.code = "agl-00835" 
                           LET g_errparam.popup = TRUE 
                           CALL cl_err()
                        END IF 
                     END IF
                     
                     
                     
                  #子系统串查   
                  ON ACTION sys_sub
                     IF NOT cl_null(g_glaq6_d[l_ac].xrcbdocno) THEN
                        CALL s_aooi200_fin_get_slip(g_glaq6_d[l_ac].xrcbdocno) RETURNING l_success,l_slip
                        SELECT oobx004 INTO l_gzza001 FROM oobx_t 
                         WHERE oobxent=g_enterprise AND oobx001=l_slip
                        IF l_gzza001<>'MULTI' THEN
                           LET la_param.prog = l_gzza001
                           LET la_param.param[1] = tm.glaald
                           LET la_param.param[2] = g_glaq6_d[l_ac].xrcbdocno
                           LET ls_js = util.JSON.stringify(la_param)
                           CALL cl_cmdrun_wait(ls_js)
                        ELSE
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = l_slip 
                           LET g_errparam.code = "agl-00835" 
                           LET g_errparam.popup = TRUE 
                           CALL cl_err()                        
                        END IF 
                     END IF
                                          
               END MENU            
         #180716-00006#1 add-e
         #end add-point
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
   
         #end add-point
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.query" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION aglq510_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_max_period     LIKE glar_t.glar003
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
   CALL g_glar2_d.clear()
 
   CALL g_glar3_d.clear()
 
   CALL g_glar4_d.clear()
   
   CALL g_glaq5_d.clear() #171212-00013#2 add 
   
   CALL g_glar5_d.clear()  #190516-00019#1 add
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_glar_d.clear()
 
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_wc_filter = "  1 = 1  "   #171117-00042 將1=1改為空白  #171219-00006 改為"  1 = 1  "
   LET g_detail_page_action = ""
   LET g_pagestart = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET ls_wc2 = g_wc2
   LET g_master_idx = l_ac
 
   LET g_wc = ""   #(ver:44)
   LET g_wc2 = ""   #(ver:44)
 
   
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON glar001,glar009
           FROM s_detail1[1].b_glar001,s_detail1[1].b_glar009
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<sys>>----
         #----<<b_glar001>>----
         #Ctrlp:construct.c.page1.b_glar001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glar001
            #add-point:ON ACTION controlp INFIELD b_glar001 name="construct.c.page1.b_glar001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL aglt310_04()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_glar001  #顯示到畫面上
            NEXT FIELD b_glar001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glar001
            #add-point:BEFORE FIELD b_glar001 name="construct.b.page1.b_glar001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glar001
            
            #add-point:AFTER FIELD b_glar001 name="construct.a.page1.b_glar001"
            
            #END add-point
            
 
 
         #----<<b_glar001_desc>>----
         #----<<b_glar009>>----
         #Ctrlp:construct.c.page1.b_glar009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glar009
            #add-point:ON ACTION controlp INFIELD b_glar009 name="construct.c.page1.b_glar009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_glar009  #顯示到畫面上
            NEXT FIELD b_glar009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glar009
            #add-point:BEFORE FIELD b_glar009 name="construct.b.page1.b_glar009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glar009
            
            #add-point:AFTER FIELD b_glar009 name="construct.a.page1.b_glar009"
            
            #END add-point
            
 
 
         #----<<soamt>>----
         #----<<doamt>>----
         #----<<zoamt>>----
         #----<<samt>>----
         #----<<damt>>----
         #----<<zamt>>----
         #----<<diff>>----
         #----<<result>>----
   
       
      END CONSTRUCT
      
 
      
 
  
      #add-point:query段more_construct name="query.more_construct"
      INPUT BY NAME tm.glaald,tm.glaacomp,tm.glar002,tm.glar003,tm.chk_ar,tm.chk_ap,
#                    tm.chk_fa,tm.chk_nm,tm.chk_xc,tm.chk_fm   #190221-00009#1 mark
                    tm.chk_fa,tm.chk_nm,tm.chk_xc,tm.chk_fm,tm.chk_show   #190221-00009#1 add

         ATTRIBUTE(WITHOUT DEFAULTS)
         BEFORE INPUT
            #获取账别
            #IF cl_null(tm.glaald) THEN   #180110-00033#1 mark
               CALL s_ld_bookno()  RETURNING l_success,tm.glaald
               IF l_success = FALSE THEN
                  LET tm.glaald = ''
               END IF 
               CALL s_ld_chk_authorization(g_user,tm.glaald) RETURNING l_success
               IF l_success = FALSE THEN
                  LET tm.glaald = ''
               END IF
            #END IF    #180110-00033#1 mark
            CALL aglq510_glaald_desc(tm.glaald)
            #会计年度期别
            IF cl_null(tm.glar002) OR cl_null(tm.glar003) OR tm.glar002=0 OR tm.glar003=0 THEN 
               SELECT glav002,glav006 INTO tm.glar002,tm.glar003 FROM glav_t
                WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav004=g_today
            END IF
            
            IF cl_null(tm.chk_ar) THEN LET tm.chk_ar = 'Y' END IF
            IF cl_null(tm.chk_ap) THEN LET tm.chk_ap = 'Y' END IF
            IF cl_null(tm.chk_fa) THEN LET tm.chk_fa = 'Y' END IF
            IF cl_null(tm.chk_nm) THEN LET tm.chk_nm = 'Y' END IF
            IF cl_null(tm.chk_xc) THEN LET tm.chk_xc = 'Y' END IF
            IF cl_null(tm.chk_fm) THEN LET tm.chk_fm = 'Y' END IF
            IF cl_null(tm.chk_show) THEN LET tm.chk_show = 'N' END IF      #190221-00009#1 add      
            DISPLAY BY NAME tm.glaald,tm.glaald_desc,tm.glaacomp,tm.glaacomp_desc,tm.glar002,tm.glar003,
#                            tm.chk_ar,tm.chk_ap,tm.chk_fa,tm.chk_nm,tm.chk_xc,tm.chk_fm  #190221-00009#1 mark
                            tm.chk_ar,tm.chk_ap,tm.chk_fa,tm.chk_nm,tm.chk_xc,tm.chk_fm,tm.chk_show  #190221-00009#1 add
            
         AFTER FIELD glaald
            IF NOT cl_null(tm.glaald) THEN
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1=tm.glaald
               #160318-00025#7--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#7--add--end  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_glaald") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET tm.glaald=''
                  NEXT FIELD CURRENT
               END IF
               
               CALL s_ld_chk_authorization(g_user,tm.glaald) RETURNING l_success
               IF l_success = FALSE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00164'
                  LET g_errparam.extend = tm.glaald
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               
                  NEXT FIELD glaald
               END IF
               CALL aglq510_glaald_desc(tm.glaald)
               DISPLAY BY NAME tm.glaald,tm.glaald_desc,tm.glaacomp,tm.glaacomp_desc
            END IF
            
         AFTER FIELD glar002
            IF NOT cl_null(tm.glar002) THEN               
               #獲取現行會計週期最大期別
               SELECT MAX(glav006) INTO l_max_period FROM glav_t 
               WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002
            END IF
            
         AFTER FIELD glar003
            IF NOT cl_null(tm.glar003) THEN
               IF cl_null(l_max_period) OR l_max_period = 0 THEN
                  #獲取現行會計週期最大期別
                  SELECT MAX(glav006) INTO l_max_period FROM glav_t 
                  WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002
               END IF
               IF cl_null(l_max_period) OR l_max_period = 0 THEN
                  LET l_max_period = 12
               END IF
               IF NOT cl_ap_chk_Range(tm.glar003,"0","1",l_max_period,"1","azz-00087",1) THEN
                  NEXT FIELD glar003
               END IF
            END IF
            
         AFTER FIELD chk_ar
            IF tm.chk_ar NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_ar
            END IF
            
         AFTER FIELD chk_ap
            IF tm.chk_ap NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_ap
            END IF
         
         AFTER FIELD chk_fa
            IF tm.chk_fa NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_fa
            END IF
            
         AFTER FIELD chk_nm
            IF tm.chk_nm NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_nm
            END IF
            
         AFTER FIELD chk_xc
            IF tm.chk_xc NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_xc
            END IF
            
         AFTER FIELD chk_fm
            IF tm.chk_fm NOT MATCHES '[yYnN]' THEN
               NEXT FIELD chk_fm
            END IF
         
         ON ACTION controlp INFIELD glaald
           INITIALIZE g_qryparam.* TO NULL
           LET g_qryparam.state = 'i'
           LET g_qryparam.reqry = FALSE
           #給予arg
           LET g_qryparam.arg1 = g_user
           LET g_qryparam.arg2 = g_dept
           CALL q_authorised_ld()                                #呼叫開窗
           LET tm.glaald = g_qryparam.return1
           DISPLAY tm.glaald TO glaald 
           NEXT FIELD glaald

      END INPUT
      
      BEFORE DIALOG
       
      #end add-point 
 
      ON ACTION accept
         #add-point:ON ACTION accept name="query.accept"
         
         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前 name="query.set_qbe_action_before"
      
      #end add-point 
 
      ON ACTION qbeclear   # 條件清除
         CLEAR FORM
         #add-point:條件清除後 name="query.qbeclear"
         
         #end add-point 
 
      #add-point:query段查詢方案相關ACTION設定後 name="query.set_qbe_action_after"
      
      #end add-point 
 
   END DIALOG
 
   
 
   LET g_wc = g_wc_table 
 
 
   
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
 
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = " 1=2"
      LET g_wc2 = " 1=1"
   #  LET g_wc_filter = g_wc_filter_t   #171117-00042 mark
      RETURN
   ELSE
      LET g_master_idx = 1
   END IF
        
   #add-point:cs段after_construct name="cs.after_construct"
   #171212-00013#2 add s--- 
   LET g_error_show = 1
   CALL aglq510_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND g_detail_cnt5 = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
   RETURN 
   #171212-00013#2 add e---
   #end add-point
        
   LET g_error_show = 1
   CALL aglq510_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION
 
{</section>}
 
{<section id="aglq510.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION aglq510_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_sql           STRING  #180716-00006#2 add
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CASE
      WHEN tm.chk_ar = 'Y' AND tm.chk_ap = 'Y' 
         LET g_wc3 = "xrea003 IN ('AR','AP')"
      WHEN tm.chk_ar = 'Y' AND tm.chk_ap <> 'Y' 
         LET g_wc3 = "xrea003='AR'"
      WHEN tm.chk_ar <> 'Y' AND tm.chk_ap = 'Y' 
         LET g_wc3 = "xrea003='AP'"
   END CASE
   #CALL aglq510_get_data() #180716-00006#1 mark
   #180716-00006#1 add-s
   IF g_param.flag='N' THEN
      CALL aglq510_get_data()
   END IF
   #180716-00006#1 add-e
   #180716-00006#2 add-s
   DELETE FROM aglq510_tmp01   #查询前删除临时表资料
   #科目余额方向
   LET l_sql=" SELECT glac008 FROM glac_t ",
             " WHERE glacent=",g_enterprise," AND glac001='",g_glaa004,"' AND glac002=? "
   PREPARE aglq510_chk_glac1 FROM l_sql
   #应收应付模组
   IF tm.chk_ar='Y' OR tm.chk_ap='Y' THEN
   #180716-00006#2 add-e   
      CALL aglq510_chk_error1() 
   #180716-00006#2 add-s
   END  IF
   #资金模组
   IF tm.chk_nm='Y' THEN
      CALL aglq510_chk_error2()  
   END IF 
   #180716-00006#2 add-e
   #180716-00006#3 add-s
   #固资模组   
   IF tm.chk_fa='Y' THEN
      CALL aglq510_chk_error3()  
   END IF
   #成本模组   
   IF tm.chk_xc='Y' THEN
      CALL aglq510_chk_error4()  
   END IF
   #180716-00006#3 add-e

   #end add-point
 
   #171117-00042 ---mark start---
#  IF cl_null(g_wc_filter) THEN
#     LET g_wc_filter = " 1=1"
#  END IF
   #171117-00042 --- mark end ---
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   
#  LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter, cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()   #171117-00042 mark
   LET ls_wc = g_wc, " AND ", g_wc2, " ", cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()   #171117-00042 modify
 
   LET ls_sql_rank = "SELECT  UNIQUE '','',glar001,'',glar009,'','','','','','','',''  ,DENSE_RANK() OVER( ORDER BY glar_t.glarld, 
       glar_t.glar001,glar_t.glar002,glar_t.glar003,glar_t.glar004) AS RANK FROM glar_t",
 
 
                     "",
                     " WHERE glarent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("glar_t"),
                     " ORDER BY glar_t.glarld,glar_t.glar001,glar_t.glar002,glar_t.glar003,glar_t.glar004"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
  LET ls_sql_rank = "SELECT  UNIQUE '',sys,glar001,glar001_desc,glar009,soamt,doamt,zoamt,samt,damt,zamt,diff,result,DENSE_RANK() OVER( ORDER BY sys,glar001,glar009) AS RANK FROM aglq510_tmp",
                     " WHERE glarent= ? ", 
                     " ORDER BY glar001,glar009"
   #end add-point
 
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"
 
   PREPARE b_fill_cnt_pre FROM g_sql
   EXECUTE b_fill_cnt_pre USING g_enterprise INTO g_tot_cnt
   FREE b_fill_cnt_pre
 
   #add-point:b_fill段rank_sql_after_count name="b_fill.rank_sql_after_count"
   
   #end add-point
 
   CASE g_detail_page_action
      WHEN "detail_first"
          LET g_pagestart = 1
 
      WHEN "detail_previous"
          LET g_pagestart = g_pagestart - g_num_in_page
          IF g_pagestart < 1 THEN
              LET g_pagestart = 1
          END IF
 
      WHEN "detail_next"
         LET g_pagestart = g_pagestart + g_num_in_page
         IF g_pagestart > g_tot_cnt THEN
            LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
            WHILE g_pagestart > g_tot_cnt
               LET g_pagestart = g_pagestart - g_num_in_page
            END WHILE
         END IF
 
      WHEN "detail_last"
         LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
         WHILE g_pagestart > g_tot_cnt
            LET g_pagestart = g_pagestart - g_num_in_page
         END WHILE
 
      OTHERWISE
         LET g_pagestart = 1
 
   END CASE
 
   LET g_sql = "SELECT '','',glar001,'',glar009,'','','','','','','',''",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   LET g_sql = "SELECT '',sys,glar001,glar001_desc,glar009,soamt,doamt,zoamt,samt,damt,zamt,diff,result",
               "  FROM (",ls_sql_rank,")",
               " WHERE ",g_wc_filter,#160302-00006#1     ADD BY07675
               "   AND RANK >= ",g_pagestart, #160302-00006#1  modify (“WHERE” TO “AND”)
               "   AND RANK < ",g_pagestart + g_num_in_page,
               " ORDER BY sys,glar001,glar009" 
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE aglq510_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR aglq510_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_glar_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_glar_d[l_ac].sel,g_glar_d[l_ac].sys,g_glar_d[l_ac].glar001,g_glar_d[l_ac].glar001_desc, 
       g_glar_d[l_ac].glar009,g_glar_d[l_ac].soamt,g_glar_d[l_ac].doamt,g_glar_d[l_ac].zoamt,g_glar_d[l_ac].samt, 
       g_glar_d[l_ac].damt,g_glar_d[l_ac].zamt,g_glar_d[l_ac].diff,g_glar_d[l_ac].result
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_glar_d[l_ac].statepic = cl_get_actipic(g_glar_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      IF cl_null(g_glar_d[l_ac].glar001)THEN CONTINUE FOREACH END IF    #170323-00087#2
      #end add-point
 
      CALL aglq510_detail_show("'1'")      
 
      CALL aglq510_glar_t_mask()
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
      
   END FOREACH
   LET g_error_show = 0
   
 
   
   CALL g_glar_d.deleteElement(g_glar_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   #180716-00006#1 mark-s
#   IF g_glaa121 = 'Y' THEN
#      CALL aglq510_b_fill2()
#      CALL aglq510_b_fill3()
#   END IF
#   #180716-00006#1 mark-e
    CALL aglq510_b_fill4()
#   #180716-00006#1 mark-s
   CALL aglq510_b_fill5() #171212-00013#2   #181207-00003#1  remark
#   LET g_detail_cnt5 = g_glaq5_d.getLength() #171212-00013#2 add 
#   #180716-00006#1 mark-e
   
   CALL aglq510_b_fill6() #180716-00006#1 add 
   CALL aglq510_b_fill7() #190516-00019#1 add
   #end add-point
 
   LET g_detail_cnt = g_glar_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE aglq510_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL aglq510_detail_index_setting()
 
   #重新計算單身筆數並呈現
#  CALL aglq510_detail_action_trans()   #(ver:44) mark
 
   IF g_glar_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL aglq510_fetch()
   END IF
 
   CALL aglq510_detail_action_trans()   #(ver:44)
   
      CALL aglq510_filter_show('glar001','b_glar001')
   CALL aglq510_filter_show('glar009','b_glar009')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.fetch" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION aglq510_fetch()
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="fetch.before_function"
 
   #end add-point
 
 
   #add-point:陣列清空 name="fetch.array_clear"
 
   #end add-point
   
   LET li_ac = l_ac 
   
 
   
   #add-point:單身填充後 name="fetch.after_fill"
   
   #end add-point 
   
 
   #add-point:陣列筆數調整 name="fetch.array_deleteElement"
   
   #end add-point
 
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="aglq510.detail_show" type="s" >}
#+ 顯示相關資料
PRIVATE FUNCTION aglq510_detail_show(ps_page)
   #add-point:show段define-客製 name="detail_show.define_customerization"
   
   #end add-point
   DEFINE ps_page    STRING
   DEFINE ls_sql     STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
 
   #add-point:detail_show段之前 name="detail_show.before"
   
   #end add-point
   
   
 
   #讀入ref值
   IF ps_page.getIndexOf("'1'",1) > 0 THEN
      #帶出公用欄位reference值page1
      
 
      #add-point:show段單身reference name="detail_show.body.reference"
 
      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.filter" type="s" >}
#+ filter過濾功能
PRIVATE FUNCTION aglq510_filter()
   #add-point:filter段define-客製 name="filter.define_customerization"
   
   #end add-point
   DEFINE  ls_result   STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="filter.before_function"
    
   #end add-point
 
   LET l_ac = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()   #171117-00042 modify
   LET g_wc_t = g_wc
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')   #171117-00042 modify
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON glar001,glar009
                          FROM s_detail1[1].b_glar001,s_detail1[1].b_glar009
 
         BEFORE CONSTRUCT
                     DISPLAY aglq510_filter_parser('glar001') TO s_detail1[1].b_glar001
            DISPLAY aglq510_filter_parser('glar009') TO s_detail1[1].b_glar009
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<sys>>----
         #----<<b_glar001>>----
         #Ctrlp:construct.c.page1.b_glar001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glar001
            #add-point:ON ACTION controlp INFIELD b_glar001 name="construct.c.filter.page1.b_glar001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL aglt310_04()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_glar001  #顯示到畫面上
            NEXT FIELD b_glar001                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_glar001_desc>>----
         #----<<b_glar009>>----
         #Ctrlp:construct.c.page1.b_glar009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glar009
            #add-point:ON ACTION controlp INFIELD b_glar009 name="construct.c.filter.page1.b_glar009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_glar009  #顯示到畫面上
            NEXT FIELD b_glar009                     #返回原欄位
    


            #END add-point
 
 
         #----<<soamt>>----
         #----<<doamt>>----
         #----<<zoamt>>----
         #----<<samt>>----
         #----<<damt>>----
         #----<<zamt>>----
         #----<<diff>>----
         #----<<result>>----
   
 
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"
         
         #end add-point  
 
      ON ACTION accept
         ACCEPT DIALOG 
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
 
   END DIALOG
 
   #171117-00042 ---modify start---
   IF NOT INT_FLAG THEN
   #  LET g_wc_filter = g_wc_filter, " "
   #  LET g_wc_filter_t = g_wc_filter
 
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
   #171117-00042 --- modify end ---
   
      CALL aglq510_filter_show('glar001','b_glar001')
   CALL aglq510_filter_show('glar009','b_glar009')
 
    
   CALL aglq510_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.filter_parser" type="s" >}
#+ filter欄位解析
PRIVATE FUNCTION aglq510_filter_parser(ps_field)
   #add-point:filter段define-客製 name="filter_parser.define_customerization"
   
   #end add-point
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_parser.before_function"
   
   #end add-point
 
   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF
 
   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF
 
   RETURN ls_var
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.filter_show" type="s" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION aglq510_filter_show(ps_field,ps_object)
   #add-point:filter_show段define-客製 name="filter_show.define_customerization"
   
   #end add-point
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
   #add-point:filter_show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_show.before_function"
   
   #end add-point
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = aglq510_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.insert" type="s" >}
#+ insert
PRIVATE FUNCTION aglq510_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aglq510.modify" type="s" >}
#+ modify
PRIVATE FUNCTION aglq510_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.reproduce" type="s" >}
#+ reproduce
PRIVATE FUNCTION aglq510_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.delete" type="s" >}
#+ delete
PRIVATE FUNCTION aglq510_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.detail_action_trans" type="s" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION aglq510_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   #(ver:44) ---start---
   IF g_pagestart = 0 THEN
      LET g_pagestart = 1
   END IF
   #(ver:44) --- end ---
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   #(ver:44) ---modify start---
   IF g_tot_cnt > 0 THEN
      DISPLAY g_current_row_tot TO FORMONLY.h_index
      DISPLAY g_glar_d.getLength() TO FORMONLY.h_count
   ELSE
      IF g_glar_d.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.h_index
         DISPLAY g_tot_cnt TO FORMONLY.h_count
      ELSE
         DISPLAY '' TO FORMONLY.h_index
         DISPLAY '' TO FORMONLY.h_count
      END IF
   END IF
 
 
   #(ver:44) --- modify end ---
 
   #顯示單身頁面的起始與結束筆數
   LET g_page_start_num = g_pagestart
   LET g_page_end_num = g_pagestart + g_num_in_page - 1
   DISPLAY g_page_start_num TO FORMONLY.p_start
   DISPLAY g_page_end_num TO FORMONLY.p_end
 
   #目前不支援跳頁功能
   LET g_page_act_list = "detail_first,detail_previous,'',detail_next,detail_last"
   CALL cl_navigator_detail_page_setting(g_page_act_list,g_current_row_tot,g_pagestart,g_num_in_page,g_tot_cnt)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.detail_index_setting" type="s" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION aglq510_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="deatil_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_curr_diag IS NOT NULL THEN
      CASE
         WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
            LET g_detail_idx = 1
            IF g_glar_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_glar_d.getLength() AND g_glar_d.getLength() > 0
            LET g_detail_idx = g_glar_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_glar_d.getLength() THEN
               LET g_detail_idx = g_glar_d.getLength()
            END IF
            LET li_redirect = TRUE
      END CASE
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aglq510.mask_functions" type="s" >}
 &include "erp/cgl/aglq510_mask.4gl"
 
{</section>}
 
{<section id="aglq510.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 抓取账套相关资讯
# Memo...........:
# Usage..........: CALL aglq510_glaald_desc(p_glaald)
# Input parameter: p_glaald       账套编号
# Return code....: 
# Date & Author..: 2015/12/1 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_glaald_desc(p_glaald)
   DEFINE  p_glaald    LIKE glaa_t.glaald
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_glaald 
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.glaald_desc=g_rtn_fields[1]
   
   #依据对应的主账套编码，抓取对应法人，币别，汇率参照编号，会计科目参照编号,关账日期
   SELECT glaacomp,glaa003,glaa004,glaa120,glaa121  #171103-00001#1 add glaa120
     INTO tm.glaacomp,g_glaa003,g_glaa004,g_glaa120,g_glaa121 #171103-00001#1 add glaa120
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = p_glaald 
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = tm.glaacomp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.glaacomp_desc= g_rtn_fields[1]
   #当启用分录底稿，用分录底稿分别子系统、总账比较，否则只比较子系统与总账
   IF g_glaa121 = 'Y' THEN
      CALL cl_set_comp_visible("doamt,damt",TRUE)
      CALL cl_set_comp_visible("page_1,page_2",TRUE)  
      CALL cl_set_comp_visible("b_glgbdocno,b_glgb010,b_glgb003",TRUE) #180716-00006#1 add
      CALL cl_set_comp_visible("doamt5,damt5",TRUE)  #190516-00019#1 add
      CALL cl_set_comp_visible("diff_2,diff_4",TRUE)  #190408-00030#1 add
   ELSE
      CALL cl_set_comp_visible("doamt,damt",FALSE)
      CALL cl_set_comp_visible("page_1,page_2",FALSE)
      CALL cl_set_comp_visible("b_glgbdocno,b_glgb010,b_glgb003",FALSE) #180716-00006#1 add
      CALL cl_set_comp_visible("doamt5,damt5",FALSE)  #190516-00019#1 add
      CALL cl_set_comp_visible("diff_2,diff_4",FALSE)  #190408-00030#1 add
   END IF
#   CALL cl_set_comp_visible("page_1,page_2,page_4",FALSE)  #180716-00006#1 add  #181207-00003#1 mark
   CALL cl_set_comp_visible("page_1,page_2",FALSE)   #181207-00003#1 add
END FUNCTION

################################################################################
# Descriptions...: 建立临时表
# Memo...........:
# Usage..........: CALL aglq510_create_temp_table()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/12/31 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_create_temp_table()
   DROP TABLE aglq510_tmp
   CREATE TEMP TABLE aglq510_tmp(
      glarent LIKE glar_t.glarent,
      sys LIKE type_t.chr500,
      glar001 LIKE glar_t.glar001,
      glar001_desc LIKE type_t.chr500,
      glar009 LIKE glar_t.glar009,
      soamt LIKE type_t.num20_6,
      doamt LIKE type_t.num20_6,
      zoamt LIKE type_t.num20_6,
      samt LIKE type_t.num20_6,
      damt LIKE type_t.num20_6,
      zamt LIKE type_t.num20_6,
      diff LIKE type_t.chr500,
      result LIKE type_t.chr500)
   #180716-00006#1 add-s
   DROP TABLE aglq510_tmp01
   CREATE TEMP TABLE aglq510_tmp01(
      sys5          LIKE type_t.chr500,     #模组别
      glaq002       LIKE glaq_t.glaq002,    #科目
      glaq002_desc  LIKE type_t.chr100,     #科目名称
      glaq005       LIKE glaq_t.glaq005,    #币别
      glaq022       LIKE glaq_t.glaq021,    #交易对象
      glaq022_desc  LIKE type_t.chr100,     #交易对象名称
      glaqdocno     LIKE glaq_t.glaqdocno,  #总账凭证单号
      glaq010       LIKE glaq_t.glaq010,    #总账原币金额
      glaq003       LIKE glaq_t.glaq003,    #总账本币金额
      glgbdocno     LIKE glgb_t.glgbdocno,  #分录底稿单号
      glgb010       LIKE glgb_t.glgb010,    #分录底稿原币金额
      glgb003       LIKE glgb_t.glgb003,    #分录底稿本币金额
      xrcbdocno     LIKE xrcb_t.xrcbdocno,  #子系统单据号码
      xrcbseq       LIKE xrcb_t.xrcbseq,    #明细项次
      gzza001       LIKE oobx_t.oobx004,    #来源作业
      xrcb105       LIKE xrcb_t.xrcb105,    #子系统原币金额
      xrcb115       LIKE xrcb_t.xrcb115,    #子系统本币金额
      message_code  LIKE type_t.chr100,     #错误类型
      advise        LIKE type_t.chr100,     #建议做法
      flag          LIKE type_t.chr1 )      #标记错误类型（用于排序）
   #add by lixwz210706 s---
   CREATE INDEX tmp01_i01 ON aglq510_tmp01(sys5,glaq002,glaq005,glaq022,glaqdocno,flag);      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode

      LET g_errparam.extend = "CREATE INDEX tmp01_i01" 
      LET g_errparam.popup  = TRUE
      CALL cl_err() 
   END IF
   #add by lixwz210706 e---
   #180716-00006#1 add-e
   #190516-00019#1 add -s
   #中间层暂存档
   DROP TABLE aglq510_tmp02
   CREATE TEMP TABLE aglq510_tmp02(
      sys6 LIKE type_t.chr500, 
      glar001 LIKE glar_t.glar001, 
      glar001_desc LIKE type_t.chr500, 
      glar009 LIKE glar_t.glar009, 
      glar017 LIKE glar_t.glar017,
      glar017_desc LIKE type_t.chr500,
      nmbx003 LIKE nmbx_t.nmbx003,
      nmbx003_desc LIKE type_t.chr500,
      soamt5 LIKE type_t.num20_6, 
      doamt5 LIKE type_t.num20_6, 
      zoamt5 LIKE type_t.num20_6, 
      samt5 LIKE type_t.num20_6, 
      damt5 LIKE type_t.num20_6, 
      zamt5 LIKE type_t.num20_6)
   #190516-00019#1 add -e
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL aglq510_get_data()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_get_data()
   DEFINE l_sql               STRING
   DEFINE l_sql1              STRING
   DEFINE l_wc                STRING
   DEFINE l_wc1               STRING
   DEFINE l_wc2               STRING
   DEFINE l_wc3               STRING
   DEFINE l_wc4               STRING                        #180308-00059#1  add
   DEFINE l_wc5               STRING                #180815-00022#1 add(成本系统axci200的科目条件)
   #181009-00011#1 add-s
   DEFINE l_wc6               STRING  
   DEFINE l_wc7               STRING  
   DEFINE l_xcce    DYNAMIC ARRAY OF RECORD
      xcce010  LIKE xcce_t.xcce010,
      xcce902  LIKE xcce_t.xcce902
   END RECORD
   #181009-00011#1 add-e
   DEFINE l_success           LIKE type_t.num5
   DEFINE l_sys               LIKE type_t.chr10     #系统别
   DEFINE l_glar001           LIKE glar_t.glar001   #科目
   DEFINE l_glar001_desc      LIKE glacl_t.glacl004 #科目说明
   DEFINE l_glar009           LIKE glar_t.glar009   #币别
   DEFINE l_xrea003           LIKE xrea_t.xrea003   #系统别
   DEFINE l_xrea103           LIKE xrea_t.xrea103   #子系统原币余额
   DEFINE l_xrea113           LIKE xrea_t.xrea113   #子系统本币余额
   DEFINE l_glat103           LIKE glat_t.glat103   #底稿原币余额
   DEFINE l_glat113           LIKE glat_t.glat113   #底稿本币余额
   DEFINE l_glar010           LIKE glar_t.glar010   #总账原币余额
   DEFINE l_glar005           LIKE glar_t.glar005   #总账本币余额
   DEFINE l_glaq010           LIKE glaq_t.glaq010   #180428-00012#1 add
   DEFINE l_glaq003           LIKE glaq_t.glaq003   #180428-00012#1 add
   DEFINE l_diff              LIKE type_t.chr10     #差异原因
   DEFINE l_result            LIKE type_t.chr10     #核对结果
   DEFINE l_glcc001           LIKE glcc_t.glcc001
   DEFINE l_glcc011           LIKE glcc_t.glcc011
   DEFINE l_i                 LIKE type_t.num5
   DEFINE l_amt               LIKE xrea_t.xrea113
   DEFINE l_glac008           LIKE glac_t.glac008
   #160728-00003#1--add--str--
   DEFINE l_xrea103_o         LIKE xrea_t.xrea103   #子系统原币余额
   DEFINE l_xrea113_o         LIKE xrea_t.xrea113   #子系统本币余额
   DEFINE l_glat103_o         LIKE glat_t.glat103   #底稿原币余额
   DEFINE l_glat113_o         LIKE glat_t.glat113   #底稿本币余额
   DEFINE l_glar010_o         LIKE glar_t.glar010   #总账原币余额
   DEFINE l_glar005_o         LIKE glar_t.glar005   #总账本币余额
   #160728-00003#1--add--end
   #161209-00052#1 add s---
   DEFINE l_amt2              LIKE xrea_t.xrea113
   DEFINE l_amt3              LIKE xrea_t.xrea113
   DEFINE l_amt4              LIKE xrea_t.xrea113
   DEFINE l_amt5              LIKE xrea_t.xrea113
   DEFINE l_amt6              LIKE xrea_t.xrea113
   DEFINE l_amt7              LIKE xrea_t.xrea113
   DEFINE l_amt8              LIKE xrea_t.xrea113
   DEFINE l_amt9              LIKE xrea_t.xrea113  #170711-00051#1 add lujh  
   DEFINE l_glar001_2           LIKE glar_t.glar001
   DEFINE l_glar001_3           LIKE glar_t.glar001
   DEFINE l_glar001_4           LIKE glar_t.glar001
   DEFINE l_glar001_5           LIKE glar_t.glar001
   DEFINE l_glar001_6           LIKE glar_t.glar001
   DEFINE l_glar001_7           LIKE glar_t.glar001
   DEFINE l_glar001_8           LIKE glar_t.glar001
   #161209-00052#1 add e---
   #170217-00036#1--add--str--
   DEFINE l_xrea003_t         LIKE xrea_t.xrea003   #系统别
   DEFINE l_glat103_t         LIKE glat_t.glat103   #底稿原币余额
   DEFINE l_glat113_t         LIKE glat_t.glat113   #底稿本币余额
   #170217-00036#1--add--end
   #170324-00097#1-----s
   DEFINE l_glar00522         LIKE glar_t.glar005
   DEFINE l_glar002           LIKE glar_t.glar002
   DEFINE l_glar003           LIKE glar_t.glar003
   #170324-00097#1-----e
   DEFINE l_sfin6014          LIKE type_t.chr10    #170711-00051#1 add lujh
   DEFINE l_glcc016           LIKE glcc_t.glcc016  #180319-00029#1 add
   #190516-00019#1 add -s
   DEFINE l_glar017           LIKE glar_t.glar017
   DEFINE l_glar017_desc      LIKE pmaal_t.pmaal004
   #190516-00019#1 add -e
   
   DELETE FROM aglq510_tmp
   DELETE FROM aglq510_tmp02   #190516-00019#1 add
   CALL cl_err_collect_init()
   LET l_success = TRUE
   
   #抓取底稿余额
   LET l_sql="SELECT SUM(glat103-glat104),SUM(glat113-glat114) ",
             "  FROM glat_t ",
             " WHERE glatent=",g_enterprise," AND glatld='",tm.glaald,"'",
             "   AND glat001=",tm.glar002," AND glat002<=",tm.glar003,
             #"   AND glat003=? AND glat007=? AND glat100=? "    #170324-00035#2 mark
             "   AND glat007=? AND glat100=? "                   #170324-00035#2
   PREPARE aglq510_sel_glat_pr1 FROM l_sql
   #190516-00019#1 add -s
   #差异页签用
   LET l_sql = l_sql CLIPPED," AND glat006 = ?"
   PREPARE aglq510_sel_glat_pr11 FROM l_sql
   #190516-00019#1 add -e
   
   #170324-00097#1-----s
   LET l_sql="SELECT SUM(glat103-glat104),SUM(glat113-glat114) ",
             "  FROM glat_t ",
             " WHERE glatent=",g_enterprise," AND glatld='",tm.glaald,"'",
             "   AND glat001=",tm.glar002," AND glat002<=",tm.glar003,
             "   AND glat003=? AND glat007=? AND glat100=? "    
   PREPARE sel_glatp2 FROM l_sql
   #170324-00097#1-----e
   #170324-00097#1-----s
   LET l_sql="SELECT SUM(glat113-glat114),SUM(glat113-glat114) ",
             "  FROM glat_t ",
             " WHERE glatent=",g_enterprise," AND glatld='",tm.glaald,"'",
             "   AND glat001=",tm.glar002," AND glat002<=",tm.glar003,
             "   AND glat007=? "
   PREPARE sel_glatp3 FROM l_sql

   LET l_sql = "select SUM(glar005-glar006) from glar_t ",
               " where glarent = ? ",
               "   and glarld  = ?      ",
               "   and glar001 = ?      ",
               "   and glar002 = ?      ",
               "   and glar003 <= ?      "    #170602-00026#1 change = to <= lujh
   PREPARE sel_glarp3 FROM l_sql

   LET l_sql = " SELECT MIN(glat002) FROM glat_t ",
               "  WHERE glatent = ",g_enterprise," ",
               "    AND glatld = ? ",
               "    AND glat001 = ? ",
               "    AND glat003 = ? "
   PREPARE sel_glatp4 FROM l_sql
   #170324-00097#1-----e
   
   #抓取总账余额
   LET l_sql="SELECT SUM(glar010-glar011),SUM(glar005-glar006) ",
             "  FROM glar_t ",
             " WHERE glarent=",g_enterprise," AND glarld='",tm.glaald,"'",
             "   AND glar002=",tm.glar002," AND glar003<=",tm.glar003,
             "   AND glar001=? AND glar009=? "
   PREPARE aglq510_sel_glar_pr1 FROM l_sql
   #190516-00019#1 add -s
   #差异页签用
   LET l_sql = l_sql CLIPPED," AND glar017 = ?"
   PREPARE aglq510_sel_glar_pr11 FROM l_sql
   #190516-00019#1 add -e
   
   #180428-00012#1 add--s 总账扣除审计部分
   #                 原币借-贷，同SUM(glar010-glar011)                          本币借-贷，同SUM(glar005-glar006) 
   LET l_sql="SELECT SUM(CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END),SUM(glaq003-glaq004) ",
             "  FROM glaq_t,glap_t ",
             " WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
             "   AND glapent=",g_enterprise," AND glapld='",tm.glaald,"'",
             "   AND glapstus <> 'X' AND glap007 = 'AD' ",   
             "   AND (glap002 < ",tm.glar002," OR (glap002=",tm.glar002," AND glap004<=",tm.glar003,") ) ",
             "   AND glaq002=? AND glaq005=? "  #会计科目，交易币种
   PREPARE aglq510_sel_glap_pr0 FROM l_sql
   #190516-00019#1 add -s
   #差异页签用
   LET l_sql = l_sql CLIPPED," AND glaq022 = ?"
   PREPARE aglq510_sel_glap_pr01 FROM l_sql
   #190516-00019#1 add -e
   #180428-00012#1 add--e
   
   #161217-00001#1 add s---
   #XC捉取總帳科余時，"不"能用原幣區隔捉科余, 統一取科余本幣
   #抓取总账余额
   LET l_sql="SELECT SUM(glar005-glar006),SUM(glar005-glar006) ",
             "  FROM glar_t ",
             " WHERE glarent=",g_enterprise," AND glarld='",tm.glaald,"'",
             "   AND glar002=",tm.glar002," AND glar003<=",tm.glar003,
             "   AND glar001=? "
   PREPARE aglq510_sel_glar_pr2 FROM l_sql   
   #161217-00001#1 add e---
   
   #检查应收&应付系统
   IF tm.chk_ar='Y' OR tm.chk_ap='Y' THEN
      LET l_wc = cl_replace_str(g_wc,'glar001','xrea019')
      LET l_wc = cl_replace_str(l_wc,'glar009','xrea100')
      #160728-00003#1--mod--str--
#      LET l_sql="SELECT DISTINCT xrea003,xrea019,xrea100,SUM(xrea103),SUM(xrea113) ",
      LET l_sql="SELECT DISTINCT xrea003,xrea019,xrea100,",
#                "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN xrea103*-1 ELSE xrea103 END),",  #161208-00011#1 add OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' lujh  #170302-00027#1  mark
#                "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN xrea113*-1 ELSE xrea113 END) ",  #161208-00011#1 add OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' lujh  #170302-00027#1  mark
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea103-xrea107)*-1 ELSE (xrea103-xrea107) END),", #170302-00027#1 add
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea113-xrea117)*-1 ELSE (xrea113-xrea117) END) ", #170302-00027#1 add              
      #160728-00003#1--mod--end
                "  FROM xrea_t ",
                " WHERE xreaent=",g_enterprise," AND xreald='",tm.glaald,"'",
#                "   AND xrea001=",tm.glar002," AND xrea002<=",tm.glar003, #160728-00003#1 mark
                "   AND xrea001=",tm.glar002," AND xrea002 =",tm.glar003,  #160728-00003#1 add
                "   AND ",g_wc3,
                "   AND ",l_wc,
                " GROUP BY xrea003,xrea019,xrea100 ",
                " ORDER BY xrea003,xrea019,xrea100 "
      PREPARE aglq510_sel_xrea_pr1 FROM l_sql
      DECLARE aglq510_sel_xrea_cs1 CURSOR FOR aglq510_sel_xrea_pr1
      FOREACH aglq510_sel_xrea_cs1 INTO l_xrea003,l_glar001,l_glar009,l_xrea103,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_xrea_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #科目说明
         LET l_glar001_desc = ''
         CALL s_desc_get_account_desc(tm.glaald,l_glar001) RETURNING l_glar001_desc
         IF cl_null(l_xrea103) THEN LET l_xrea103 = 0 END IF
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         IF g_glaa121 = 'Y' THEN
            #EXECUTE aglq510_sel_glat_pr1 USING l_xrea003,l_glar001,l_glar009    #170324-00035#2 mark
            EXECUTE aglq510_sel_glat_pr1 USING l_glar001,l_glar009    #170324-00035#2 170324

                                         INTO l_glat103,l_glat113
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
            IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
            IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
            
            #170324-00035#2 mark-----s
            ##170217-00036#1--add--str--
            ##AP/AR模組顯示時: 取底稿金額時, 同時取AR/AP的相同科目作合計
            #IF l_xrea003='AR' THEN
            #   LET l_xrea003_t='AP'
            #ELSE
            #   LET l_xrea003_t='AR'
            #END IF
            # EXECUTE aglq510_sel_glat_pr1 USING l_xrea003_t,l_glar001,l_glar009
            #                             INTO l_glat103_t,l_glat113_t
            #IF SQLCA.sqlcode THEN
            #   INITIALIZE g_errparam TO NULL
            #   LET g_errparam.code = SQLCA.sqlcode
            #   LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
            #   LET g_errparam.popup = TRUE
            #   CALL cl_err()
            #   LET l_success = FALSE
            #END IF
            #IF cl_null(l_glat103_t) THEN LET l_glat103_t = 0 END IF
            #IF cl_null(l_glat113_t) THEN LET l_glat113_t = 0 END IF
            #LET l_glat103 = l_glat103 + l_glat103_t
            #LET l_glat113 = l_glat113 + l_glat113_t
            ##170217-00036#1--add--end
            #170324-00035#2 mark-----e
         END IF
         
         #抓取总账余额
         EXECUTE aglq510_sel_glar_pr1 USING l_glar001,l_glar009
                                      INTO l_glar010,l_glar005
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glar_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glar010) THEN LET l_glar010 = 0 END IF
         IF cl_null(l_glar005) THEN LET l_glar005 = 0 END IF
         
         #190604-00001#1---remark---str--
         #180716-00006#2 mark-s
          #180428-00012#1 add--s
          #抓取总账需扣掉的部分--审计调整
          EXECUTE aglq510_sel_glap_pr0 USING l_glar001,l_glar009
                                       INTO l_glaq010,l_glaq003
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = 'EXE aglq510_sel_glap_pr0'
             LET g_errparam.popup = TRUE
             CALL cl_err()
             LET l_success = FALSE
          END IF
          IF cl_null(l_glaq010) THEN LET l_glaq010 = 0 END IF
          IF cl_null(l_glaq003) THEN LET l_glaq003 = 0 END IF
         
          LET l_glar010 = l_glar010 - l_glaq010
          LET l_glar005 = l_glar005 - l_glaq003
          #180428-00012#1 add--e
         #180716-00006#2 mark-e
         #190604-00001#1---remark---end--
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
         IF l_glac008 = '2' THEN
            LET l_glat103 = l_glat103 * -1
            LET l_glat113 = l_glat113 * -1
            LET l_glar010 = l_glar010 * -1
            LET l_glar005 = l_glar005 * -1
         END IF
         
         #170419-00044#1-----s
         IF l_xrea003 = 'AP' THEN
            IF l_glac008 = '1' THEN
               LET l_glar010 = l_glar010 * -1  
               LET l_glar005 = l_glar005 * -1  
               LET l_glat103 = l_glat103 * -1  
               LET l_glat113 = l_glat113 * -1                
            END IF
          END IF   

         IF l_xrea003 = 'AR' THEN
            IF l_glac008 = '2' THEN
               LET l_glar010 = l_glar010 * -1  
               LET l_glar005 = l_glar005 * -1  
               LET l_glat103 = l_glat103 * -1  
               LET l_glat113 = l_glat113 * -1                
            END IF
         END IF
         #170419-00044#1-----e
         
         #160728-00003#1--add--str--
         #AR/AP子系统金额采用金额的绝对值与分录底稿、总账金额的绝对值比较
         #子系统金额
         IF l_xrea103 < 0 THEN
            LET l_xrea103_o = l_xrea103 * -1
         ELSE
            LET l_xrea103_o = l_xrea103
         END IF
         IF l_xrea113 < 0 THEN
            LET l_xrea113_o = l_xrea113 * -1
         ELSE
            LET l_xrea113_o = l_xrea113
         END IF
         #分录底稿金额
         IF l_glat103 < 0 THEN
            LET l_glat103_o = l_glat103 * -1
         ELSE
#            LET l_glat113_o = l_glat113 #161021-00014#1 mark
            LET l_glat103_o = l_glat103  #161021-00014#1 add
         END IF
         #161021-00014#1--add--str--
         IF l_glat113 < 0 THEN
            LET l_glat113_o = l_glat113 * -1
         ELSE
            LET l_glat113_o = l_glat113
         END IF
         #161021-00014#1--add--end
         #总账金额
         IF l_glar010 < 0 THEN
            LET l_glar010_o = l_glar010 * -1
         ELSE
            LET l_glar010_o = l_glar010
         END IF
#         IF l_glar010 < 0 THEN  #161021-00014#1 mark
         IF l_glar005 < 0 THEN   #161021-00014#1 add
            LET l_glar005_o = l_glar005 * -1
         ELSE
            LET l_glar005_o = l_glar005
         END IF
         
         #进行金额比较
         #当启用分录底稿
         IF g_glaa121 = 'Y' THEN
            IF l_xrea103_o = l_glat103_o AND l_xrea103_o = l_glar010_o AND
               l_xrea113_o = l_glat113_o AND l_xrea113_o = l_glar005_o THEN
               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o = l_glar010_o AND l_xrea113_o = l_glar005_o) THEN
               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
            END IF
            
            IF (l_xrea103_o = l_glat103_o AND l_xrea113_o = l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) THEN
               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) AND 
               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) AND 
               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
            END IF
         ELSE
         #未启用分录底稿时，只需比较子系统与总账余额差异
            IF l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o THEN
               LET l_diff = '6'  #6.子系统与总账有差异
            ELSE
               LET l_diff = '5'  #5.子系统与总账无差异
            END IF            
         END IF
         #160728-00003#1--add--end
         
#160728-00003#1--mark--str--         
#         #进行金额比较
#         #当启用分录底稿
#         IF g_glaa121 = 'Y' THEN
#            IF l_xrea103 = l_glat103 AND l_xrea103 = l_glar010 AND
#               l_xrea113 = l_glat113 AND l_xrea113 = l_glar005 THEN
#               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
#            END IF
#            
#            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
#               (l_xrea103 = l_glar010 AND l_xrea113 = l_glar005) THEN
#               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
#            END IF
#            
#            IF (l_xrea103 = l_glat103 AND l_xrea113 = l_glat113) AND
#               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) THEN
#               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
#            END IF
#            
#            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
#               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
#               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
#               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
#            END IF
#            
#            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
#               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
#               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
#               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
#            END IF
#         ELSE
#         #未启用分录底稿时，只需比较子系统与总账余额差异
#            IF l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005 THEN
#               LET l_diff = '6'  #6.子系统与总账有差异
#            ELSE
#               LET l_diff = '5'  #5.子系统与总账无差异
#            END IF            
#         END IF
#160728-00003#1--mark--end

         #核对结果
         IF l_diff = '0' OR l_diff = '5' THEN
            LET l_result = '0' #0.核对OK
         ELSE
            LET l_result = '1' #1.核对有误
         END IF
         
         #系统别
         IF l_xrea003 = 'AR' THEN LET l_sys = '1' END IF
         IF l_xrea003 = 'AP' THEN LET l_sys = '2' END IF
         #插入临时表
         INSERT INTO aglq510_tmp(glarent,sys,glar001,glar001_desc,glar009,
                                 soamt,doamt,zoamt,samt,damt,zamt,diff,result)
         VALUES(g_enterprise,l_sys,l_glar001,l_glar001_desc,l_glar009,
                l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005,l_diff,l_result)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         
      END FOREACH
      #190516-00019#1 add -s
      #差异页签加入对象
      LET l_sql="SELECT DISTINCT xrea003,xrea019,xrea100,xrea009,",
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea103-xrea107)*-1 ELSE (xrea103-xrea107) END),", 
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea113-xrea117)*-1 ELSE (xrea113-xrea117) END) ",              
                "  FROM xrea_t ",
                " WHERE xreaent=",g_enterprise," AND xreald='",tm.glaald,"'",
                "   AND xrea001=",tm.glar002," AND xrea002 =",tm.glar003,  
                "   AND ",g_wc3,
                "   AND ",l_wc,
                " GROUP BY xrea003,xrea019,xrea100,xrea009 ",
                " ORDER BY xrea003,xrea019,xrea100,xrea009 "
      PREPARE aglq510_sel_xrea_pr2 FROM l_sql
      DECLARE aglq510_sel_xrea_cs2 CURSOR FOR aglq510_sel_xrea_pr2
      FOREACH aglq510_sel_xrea_cs2 INTO l_xrea003,l_glar001,l_glar009,l_glar017,l_xrea103,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_xrea_cs2'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #科目说明
         LET l_glar001_desc = ''
         CALL s_desc_get_account_desc(tm.glaald,l_glar001) RETURNING l_glar001_desc
         IF cl_null(l_xrea103) THEN LET l_xrea103 = 0 END IF
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         #对象说明
         LET l_glar017_desc = ''
         CALL s_desc_get_trading_partner_abbr_desc(l_glar017) RETURNING l_glar017_desc
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         IF g_glaa121 = 'Y' THEN
            EXECUTE aglq510_sel_glat_pr11 USING l_glar001,l_glar009,l_glar017    

                                         INTO l_glat103,l_glat113
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'EXE aglq510_sel_glat_pr11'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
            IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
            IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
         END IF
         
         #抓取总账余额
         EXECUTE aglq510_sel_glar_pr11 USING l_glar001,l_glar009,l_glar017
                                      INTO l_glar010,l_glar005
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glar_pr11'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glar010) THEN LET l_glar010 = 0 END IF
         IF cl_null(l_glar005) THEN LET l_glar005 = 0 END IF
         
         #抓取总账需扣掉的部分--审计调整
         EXECUTE aglq510_sel_glap_pr01 USING l_glar001,l_glar009,l_glar017
                                      INTO l_glaq010,l_glaq003
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glap_pr01'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glaq010) THEN LET l_glaq010 = 0 END IF
         IF cl_null(l_glaq003) THEN LET l_glaq003 = 0 END IF
         
         LET l_glar010 = l_glar010 - l_glaq010
         LET l_glar005 = l_glar005 - l_glaq003
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
         IF l_glac008 = '2' THEN
            LET l_glat103 = l_glat103 * -1
            LET l_glat113 = l_glat113 * -1
            LET l_glar010 = l_glar010 * -1
            LET l_glar005 = l_glar005 * -1
         END IF
         
         IF l_xrea003 = 'AP' THEN
            IF l_glac008 = '1' THEN
               LET l_glar010 = l_glar010 * -1  
               LET l_glar005 = l_glar005 * -1  
               LET l_glat103 = l_glat103 * -1  
               LET l_glat113 = l_glat113 * -1                
            END IF
          END IF   

         IF l_xrea003 = 'AR' THEN
            IF l_glac008 = '2' THEN
               LET l_glar010 = l_glar010 * -1  
               LET l_glar005 = l_glar005 * -1  
               LET l_glat103 = l_glat103 * -1  
               LET l_glat113 = l_glat113 * -1                
            END IF
         END IF
         
         #AR/AP子系统金额采用金额的绝对值与分录底稿、总账金额的绝对值比较
         #子系统金额
         IF l_xrea103 < 0 THEN
            LET l_xrea103_o = l_xrea103 * -1
         ELSE
            LET l_xrea103_o = l_xrea103
         END IF
         IF l_xrea113 < 0 THEN
            LET l_xrea113_o = l_xrea113 * -1
         ELSE
            LET l_xrea113_o = l_xrea113
         END IF
         #分录底稿金额
         IF l_glat103 < 0 THEN
            LET l_glat103_o = l_glat103 * -1
         ELSE
            LET l_glat103_o = l_glat103  
         END IF
         IF l_glat113 < 0 THEN
            LET l_glat113_o = l_glat113 * -1
         ELSE
            LET l_glat113_o = l_glat113
         END IF
         #总账金额
         IF l_glar010 < 0 THEN
            LET l_glar010_o = l_glar010 * -1
         ELSE
            LET l_glar010_o = l_glar010
         END IF
         IF l_glar005 < 0 THEN   
            LET l_glar005_o = l_glar005 * -1
         ELSE
            LET l_glar005_o = l_glar005
         END IF
         
         #进行金额比较
         #当启用分录底稿
         IF g_glaa121 = 'Y' THEN
            IF l_xrea103_o = l_glat103_o AND l_xrea103_o = l_glar010_o AND
               l_xrea113_o = l_glat113_o AND l_xrea113_o = l_glar005_o THEN
               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o = l_glar010_o AND l_xrea113_o = l_glar005_o) THEN
               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
            END IF
            
            IF (l_xrea103_o = l_glat103_o AND l_xrea113_o = l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) THEN
               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) AND 
               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
            END IF
            
            IF (l_xrea103_o <> l_glat103_o OR l_xrea113_o <> l_glat113_o) AND
               (l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o) AND 
               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
            END IF
         ELSE
         #未启用分录底稿时，只需比较子系统与总账余额差异
            IF l_xrea103_o <> l_glar010_o OR l_xrea113_o <> l_glar005_o THEN
               LET l_diff = '6'  #6.子系统与总账有差异
            ELSE
               LET l_diff = '5'  #5.子系统与总账无差异
            END IF            
         END IF

         #核对结果
         IF l_diff = '0' OR l_diff = '5' THEN
            CONTINUE FOREACH
         END IF
         
         #系统别
         IF l_xrea003 = 'AR' THEN LET l_sys = '1' END IF
         IF l_xrea003 = 'AP' THEN LET l_sys = '2' END IF
         #插入临时表
         INSERT INTO aglq510_tmp02(sys6,glar001,glar001_desc,glar009,glar017,glar017_desc,
                                 soamt5,doamt5,zoamt5,samt5,damt5,zamt5)
         VALUES(l_sys,l_glar001,l_glar001_desc,l_glar009,l_glar017,l_glar017_desc,
                l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         
      END FOREACH
      #190516-00019#1 add -e
   END IF
   
   #检查固资系统
   IF tm.chk_fa='Y' THEN
      LET l_wc = cl_replace_str(g_wc,'glar001','faaj023')
      LET l_wc = cl_replace_str(l_wc,'glar009','faan010')
      
      LET l_wc1 = cl_replace_str(g_wc,'glar001','faaj024')
      LET l_wc1 = cl_replace_str(l_wc1,'glar009','faan010')
      
      LET l_sql="SELECT acc,faan010,SUM(amt) ",
                "  FROM (",
                #                财产科目    /币别   /本币余额
                "        (SELECT faaj023 acc,faan010,SUM(faan014) amt ",
                "           FROM faan_t,faaj_t ",
                "          WHERE faanent=faajent AND faanld=faajld ",
                "            AND faan003=faaj037 AND faan004=faaj001 AND faan005=faaj002",
                "            AND faanent=",g_enterprise," AND faanld='",tm.glaald,"'",
                #"            AND faan001=",tm.glar002," AND faan002<=",tm.glar003, #161216-00027#1 mark
                "            AND faan001=",tm.glar002," AND faan002 =",tm.glar003,  #161216-00027#1 add
                "            AND faaj048 <> '1' ",   #170208-00010#1 add lujh
                "            AND faan007 NOT IN ('5','6') ",#170927-00026#2 xul add 
                "            AND ",l_wc,
                "          GROUP BY faaj023,faan010 )",
                "          UNION ",
                #                累折科目    /币别   /本币余额
#                "        (SELECT faaj024 acc,faan010,SUM(faan018) amt ", #170210-00059#1 mark
                "        (SELECT faaj024 acc,faan010,SUM(CASE WHEN faaj023=faaj024 THEN faan018 *-1 ELSE faan018 END) amt ", #170210-00059#1 add
                "           FROM faan_t,faaj_t ",
                "          WHERE faanent=faajent AND faanld=faajld ",
                "            AND faan003=faaj037 AND faan004=faaj001 AND faan005=faaj002",
                "            AND faanent=",g_enterprise," AND faanld='",tm.glaald,"'",
                #"            AND faan001=",tm.glar002," AND faan002<=",tm.glar003,    #161216-00027#1 mark
                "            AND faan001=",tm.glar002," AND faan002 =",tm.glar003,     #161216-00027#1 add
                "            AND faaj048 <> '1' ",   #170208-00010#1 add lujh
                 "           AND faan007 NOT IN ('5','6') ",#170927-00026#2 xul add 
                "            AND ",l_wc1,
                "          GROUP BY faaj024,faan010 )",
                "       )",
                " GROUP BY acc,faan010 ",
                " ORDER BY acc,faan010 "
      PREPARE aglq510_sel_faan_pr1 FROM l_sql
      DECLARE aglq510_sel_faan_cs1 CURSOR FOR aglq510_sel_faan_pr1
      
      #161125-00026#1--add--str--
      #抓取总账余额
      LET l_sql="SELECT SUM(glar005-glar006) ",
                "  FROM glar_t ",
                " WHERE glarent=",g_enterprise," AND glarld='",tm.glaald,"'",
                "   AND glar002=",tm.glar002," AND glar003<=",tm.glar003,
                "   AND glar001=? "
      PREPARE aglq510_sel_glar_fa_pr1 FROM l_sql
      #161125-00026#1--add--end
   
      FOREACH aglq510_sel_faan_cs1 INTO l_glar001,l_glar009,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_faan_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #科目说明
         LET l_glar001_desc = ''
         CALL s_desc_get_account_desc(tm.glaald,l_glar001) RETURNING l_glar001_desc
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         #固资中原币金额 = 本币金额
         LET l_xrea103 = l_xrea113
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         IF g_glaa121 = 'Y' THEN
            #170324-00097#1 #170328-00086#2 mark-----s
            ##固资中分录底稿金额 = 子系统金额
            #LET l_glat103 = l_xrea103
            #LET l_glat113 = l_xrea113
            #170324-00097#1 #170328-00086#2 mark-----e
            
            #170324-00097#1-----s
            LET l_glat103 = NULL  LET l_glat113 = NULL
            EXECUTE sel_glatp3 USING l_glar001
               INTO l_glat103,l_glat113
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
            IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
            IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
            #180201-00030#1 mark--s
            #LET l_glar003 = NULL
            #EXECUTE sel_glatp4 USING tm.glaald,tm.glar002,'FA' 
            #                   INTO l_glar003
            #LET l_glar003 = l_glar003 - 1
            #LET l_glar00522 = NULL
            #EXECUTE sel_glarp3 USING g_enterprise,tm.glaald,l_glar001,tm.glar002,l_glar003
            #   INTO l_glar00522
            #IF cl_null(l_glar00522)THEN LET l_glar00522 = 0 END IF
            #
            #LET l_glat103 = l_glat103 + l_glar00522
            #LET l_glat113 = l_glat113 + l_glar00522
            #180201-00030#1 mark--e
            #170324-00097#1-----e
         END IF
         
         #抓取总账余额
         #161125-00026#1--mod--str--
#         EXECUTE aglq510_sel_glar_pr1 USING l_glar001,l_glar009
#                                      INTO l_glar010,l_glar005
         EXECUTE aglq510_sel_glar_fa_pr1 USING l_glar001
                                         INTO l_glar005
         #161125-00026#1--mod--end
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glar_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
#         IF cl_null(l_glar010) THEN LET l_glar010 = 0 END IF #161125-00026#1 mark
         IF cl_null(l_glar005) THEN LET l_glar005 = 0 END IF
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
         IF l_glac008 = '2' THEN
#            LET l_glar010 = l_glar010 * -1 #161125-00026#1 mark
            LET l_glar005 = l_glar005 * -1
            #170324-00097#1-----s
            LET l_glat103 = l_glat103 * -1
            LET l_glat113 = l_glat113 * -1
            #170324-00097#1-----e
         END IF
         LET l_glar010 = l_glar005 #161125-00026#1 add
         
         #190618-00037#1---add---str--
         #抓取總帳需扣掉的部份--審計調整
         EXECUTE aglq510_sel_glap_pr0 USING l_glar001,l_glar009
                                       INTO l_glaq010,l_glaq003
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = 'EXE aglq510_sel_glap_pr0'
             LET g_errparam.popup = TRUE
             CALL cl_err()
             LET l_success = FALSE
          END IF
          IF cl_null(l_glaq010) THEN LET l_glaq010 = 0 END IF
          IF cl_null(l_glaq003) THEN LET l_glaq003 = 0 END IF

          IF l_glac008 = '2' THEN
             LET l_glaq010 = l_glaq010 * -1
             LET l_glaq003 = l_glaq003 * -1
          END IF

          LET l_glar010 = l_glar010 - l_glaq010
          LET l_glar005 = l_glar005 - l_glaq003
         #190618-00037#1---add---end--
         
         #进行金额比较
         #当启用分录底稿
         IF g_glaa121 = 'Y' THEN
            IF l_xrea103 = l_glat103 AND l_xrea103 = l_glar010 AND
               l_xrea113 = l_glat113 AND l_xrea113 = l_glar005 THEN
               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 = l_glar010 AND l_xrea113 = l_glar005) THEN
               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
            END IF
            
            IF (l_xrea103 = l_glat103 AND l_xrea113 = l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) THEN
               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
            END IF
         ELSE
         #未启用分录底稿时，只需比较子系统与总账余额差异
            IF l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005 THEN
               LET l_diff = '6'  #6.子系统与总账有差异
            ELSE
               LET l_diff = '5'  #5.子系统与总账无差异
            END IF            
         END IF
         
         #核对结果
         IF l_diff = '0' OR l_diff = '5' THEN
            LET l_result = '0' #0.核对OK
         ELSE
            LET l_result = '1' #1.核对有误
         END IF
     
         #系统别:3.固资
         LET l_sys = '3' 
         
         #插入临时表
         INSERT INTO aglq510_tmp(glarent,sys,glar001,glar001_desc,glar009,
                                 soamt,doamt,zoamt,samt,damt,zamt,diff,result)
         VALUES(g_enterprise,l_sys,l_glar001,l_glar001_desc,l_glar009,
                l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005,l_diff,l_result)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         #190516-00019#1 add -s
         #有误时存入差异页签
         IF l_result = '1' THEN
            #插入临时表
            INSERT INTO aglq510_tmp02(sys6,glar001,glar001_desc,glar009,
                                      soamt5,doamt5,zoamt5,samt5,damt5,zamt5)
            VALUES(l_sys,l_glar001,l_glar001_desc,l_glar009,
                   l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
         END IF
         #190516-00019#1 add -e
      END FOREACH
   END IF
   
   #检查资金系统
   IF tm.chk_nm='Y' THEN
      #nmbx_t(资金帐户期统计档)
      LET l_wc = cl_replace_str(g_wc,'glar001','glab005')
      LET l_wc = cl_replace_str(l_wc,'glar009','nmbx100')
      #LET l_wc1 = cl_replace_str(g_wc,'glar001','nmcy018') #180716-00006#3 add   #191003-00008#1 mark
      LET l_wc1 = cl_replace_str(g_wc,'glar001','nmcy040')   #191003-00008#1 add
      #LET l_wc1 = cl_replace_str(g_wc,'glar009','glat100') #180716-00006#3 mark
      LET l_wc1 = cl_replace_str(l_wc1,'glar009','glat100') #180716-00006#3 add
      #nmcy(票据期统计档)，还没有写，故暂时不处理,暂时按照固资的写法预留抓取nmcy_t
      LET l_sql="SELECT acc,curr,SUM(amt1),SUM(amt2) ",
                "  FROM (",
                #              账户对应科目   /币别        /原币余额                 /本币余额
                "        (SELECT glab005 acc,nmbx100 curr,SUM(nmbx103-nmbx104) amt1,SUM(nmbx113-nmbx114) amt2 ",
                "           FROM nmbx_t,glab_t ",
                "          WHERE nmbxent=glabent AND nmbx003=glab003 ",
                "            AND glab001='40' AND glab002='40' AND glabld='",tm.glaald,"'",
                "            AND nmbxent=",g_enterprise," AND nmbxcomp='",tm.glaacomp,"'",
                "            AND nmbx001=",tm.glar002," AND nmbx002<=",tm.glar003, 
                "            AND ",l_wc,
                "          GROUP BY glab005,nmbx100 )",
             #170918-00041#1 mark-----s
             #   #170322-00040#1 add s---
             #   "         UNION ",
             #   "        (SELECT glab005 acc,glat100 curr,SUM(glat103-glat104) amt1,SUM(glat113-glat114) amt2 ",
             #   "           FROM glab_t, glat_t ",
             #   "          WHERE glabent = glatent AND glabld = glatld AND glab001='41' AND glab002 = '8714' AND glab003 = 'F' ",
             #   "            AND glabent =",g_enterprise," AND glabld = '",tm.glaald,"' AND glat001 =",tm.glar002," AND glat002<=",tm.glar003,
             #   "            AND glatcomp ='",tm.glaacomp,"' ",               
             #   "            AND glat007 = glab005 AND glat003 = 'NM'",
             #   "            AND ",l_wc1,
             #   "          GROUP BY glab005,glat100)",  
             #   "         UNION ",
             #   "        (SELECT glab005 acc,glat100 curr,SUM(glat103-glat104) amt1,SUM(glat113-glat114) amt2 ",
             #   "           FROM glab_t, glat_t ",
             #   "          WHERE glabent = glatent AND glabld = glatld AND glab001='41' AND glab002 = '8718' AND glab003 = '2' ",
             #   "            AND glabent =",g_enterprise," AND glabld = '",tm.glaald,"' AND glat001 =",tm.glar002," AND glat002<=",tm.glar003, 
             #   "            AND glat007 = glab005 AND glat003 = 'NM' ",
             #   "            AND glatcomp ='",tm.glaacomp,"' ",
             #   "            AND ",l_wc1,
             #   "          GROUP BY glab005,glat100)",                      
             #   #170322-00040#1 add e--- 
             #170918-00041#1 mark-----e 
                #170918-00041#1-----s
                #181009-00011#1 mark-s
#                "         UNION ",
#                       " (SELECT glab005 acc,nmcy100 curr,SUM(nmcy103) amt1,SUM(nmcy113) amt2 ",
#                          " FROM glab_t, nmcy_t  ", 
#                        "  WHERE glabent = nmcyent ", 
#                           " AND nmcyent = ",g_enterprise," ",
#                           " AND glabld = '",tm.glaald,"' ",
#                           " AND glab001='41' ", 
#                           " AND glab002 = '8718'", 
#                           " AND glab003 = '2' ",  
#                           " AND nmcy001 = '",tm.glar002,"' ",  # 年度
#                           " AND nmcy002 = '",tm.glar003,"' ",      # 月份
#                           " AND nmcy040 = glab005 ", # 
#                           " AND nmcy003 = '03' ",   #-應付匯款 
#                           " AND nmcycomp ='",tm.glaacomp,"' ",
#                           " AND ",l_wc1,
#                          " GROUP BY glab005,nmcy100) ",
                #181009-00011#1 mark-e                          
                #170918-00041#1-----e 
               #181009-00011#1 add-s
                "         UNION ",
                       " (SELECT nmcy040 acc,nmcy100 curr,SUM(nmcy103) amt1,SUM(nmcy113) amt2 ",
                          " FROM nmcy_t  ", 
                        "  WHERE nmcyent = ",g_enterprise," ",
                           " AND nmcyld = '",tm.glaald,"' ",
                           " AND nmcy001 = '",tm.glar002,"' ",  # 年度
                           " AND nmcy002 = '",tm.glar003,"' ",      # 月份
                           " AND nmcy003 = '03' ",   #-應付匯款 
                           " AND nmcycomp ='",tm.glaacomp,"' ",
                           " AND ",l_wc1,
                          " GROUP BY nmcy040,nmcy100) ",
                "         UNION ",
                       " (SELECT nmcy040 acc,nmcy100 curr,SUM(nmcy103) amt1,SUM(nmcy113) amt2 ",
                          " FROM nmcy_t  ", 
                        "  WHERE nmcyent = ",g_enterprise," ",
                           " AND nmcyld = '",tm.glaald,"' ",
                           " AND nmcy001 = '",tm.glar002,"' ",  # 年度
                           " AND nmcy002 = '",tm.glar003,"' ",      # 月份
                           " AND nmcy003 = '02' ",   #-應付票据 
                           " AND nmcycomp ='",tm.glaacomp,"' ",
                           " AND ",l_wc1,
                          " GROUP BY nmcy040,nmcy100) ",
                "         UNION ",
                       " (SELECT nmcy040 acc,nmcy100 curr,SUM(nmcy103) amt1,SUM(nmcy113) amt2 ",
                          " FROM nmcy_t  ", 
                        "  WHERE nmcyent = ",g_enterprise," ",
                           " AND nmcyld = '",tm.glaald,"' ",
                           " AND nmcy001 = '",tm.glar002,"' ",  # 年度
                           " AND nmcy002 = '",tm.glar003,"' ",      # 月份
                           #" AND nmcy003 = '02' ",   #-應收票据   #191003-00008#1 mark
                           " AND nmcy003 = '01' ",   #-應收票据   #191003-00008#1 add 
                           " AND nmcycomp ='",tm.glaacomp,"' ",
                           " AND ",l_wc1,
                          " GROUP BY nmcy040,nmcy100) ",
               #181009-00011#1 add-e                     
                "       )",
                " GROUP BY acc,curr ",
                " ORDER BY acc,curr "
      PREPARE aglq510_sel_nmbx_pr1 FROM l_sql
      DECLARE aglq510_sel_nmbx_cs1 CURSOR FOR aglq510_sel_nmbx_pr1
      FOREACH aglq510_sel_nmbx_cs1 INTO l_glar001,l_glar009,l_xrea103,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_nmbx_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #科目说明
         LET l_glar001_desc = ''
         CALL s_desc_get_account_desc(tm.glaald,l_glar001) RETURNING l_glar001_desc
         IF cl_null(l_xrea103) THEN LET l_xrea103 = 0 END IF
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         IF g_glaa121 = 'Y' THEN
            
            #170324-00097#1 #170328-00086#2 mark-----s           
            ##固资中分录底稿金额 = 子系统金额
            #LET l_glat103 = l_xrea103
            #LET l_glat113 = l_xrea113
            #170324-00097#1 #170328-00086#2 mark-----e
            
            #170324-00097#1-----s
            LET l_glat103 = NULL LET l_glat113 = NULL
            EXECUTE aglq510_sel_glat_pr1 USING l_glar001,l_glar009    
               INTO l_glat103,l_glat113
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
            IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
            IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
            #170324-00097#1-----e
         END IF
         
         #抓取总账余额
         EXECUTE aglq510_sel_glar_pr1 USING l_glar001,l_glar009
                                      INTO l_glar010,l_glar005
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glar_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glar010) THEN LET l_glar010 = 0 END IF
         IF cl_null(l_glar005) THEN LET l_glar005 = 0 END IF

         #180428-00012#1 add--s
         #抓取总账需扣掉的部分--审计调整
         EXECUTE aglq510_sel_glap_pr0 USING l_glar001,l_glar009
                                      INTO l_glaq010,l_glaq003
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glap_pr0'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glaq010) THEN LET l_glaq010 = 0 END IF
         IF cl_null(l_glaq003) THEN LET l_glaq003 = 0 END IF
        
         LET l_glar010 = l_glar010 - l_glaq010
         LET l_glar005 = l_glar005 - l_glaq003
         #180428-00012#1 add--e

         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
         IF l_glac008 = '2' THEN
            LET l_glar010 = l_glar010 * -1
            LET l_glar005 = l_glar005 * -1
            #170324-00097#1-----s
            LET l_glat103 = l_glat103 * -1
            LET l_glat113 = l_glat113 * -1
            #170324-00097#1-----e
         END IF
         
         #进行金额比较
         #当启用分录底稿
         IF g_glaa121 = 'Y' THEN
            IF l_xrea103 = l_glat103 AND l_xrea103 = l_glar010 AND
               l_xrea113 = l_glat113 AND l_xrea113 = l_glar005 THEN
               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 = l_glar010 AND l_xrea113 = l_glar005) THEN
               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
            END IF
            
            IF (l_xrea103 = l_glat103 AND l_xrea113 = l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) THEN
               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
            END IF
         ELSE
         #未启用分录底稿时，只需比较子系统与总账余额差异
            IF l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005 THEN
               LET l_diff = '6'  #6.子系统与总账有差异
            ELSE
               LET l_diff = '5'  #5.子系统与总账无差异
            END IF            
         END IF
         
         #核对结果
         IF l_diff = '0' OR l_diff = '5' THEN
            LET l_result = '0' #0.核对OK
         ELSE
            LET l_result = '1' #1.核对有误
         END IF
     
         #系统别:4.资金
         LET l_sys = '4' 
         
         #插入临时表
         INSERT INTO aglq510_tmp(glarent,sys,glar001,glar001_desc,glar009,
                                 soamt,doamt,zoamt,samt,damt,zamt,diff,result)
         VALUES(g_enterprise,l_sys,l_glar001,l_glar001_desc,l_glar009,
                l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005,l_diff,l_result)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         
      END FOREACH
   END IF
   
   #检查成本系统
   IF tm.chk_xc='Y' THEN
      #对查询单身录入的条件进行转换
      LET l_wc = " 1=1"   #科目条件
      LET l_wc1= " 1=1"   #币别条件xccc_t
      LET l_wc2= " 1=1"   #币别条件xccd_t
      LET l_wc3= " 1=1"   #币别条件xcch_t
      LET l_wc5= " 1=1"   #成本系统xcbu的科目条件  #180815-00022#1 add
      #181009-00011#1 add-s
      LET l_wc6= " 1=1"
      LET l_wc7= " 1=1"
      #181009-00011#1 add-e
      
#      CALL cl_get_para(g_enterprise,tm.glaacomp,'S-FIN-6014') RETURNING l_sfin6014   #170711-00051#1 add lujh  #190613-00046#1  mark
      
      IF g_wc <> " 1=1" THEN
         #找到币别条件的位置，科目与币别条件拆开
         LET l_i = 0
         LET l_i = g_wc.getIndexOf("glar009",1) 
         IF l_i = 0 THEN
            LET l_wc = cl_replace_str(g_wc,'glar001','glcc002')
            LET l_wc5 =cl_replace_str(l_wc,'glcc002','xcbu004')   #180815-00022#1 add
         ELSE
            #科目条件
            #180815-00022#1 mark-s
#            LET l_wc = g_wc.substring(1,l_i)
#            IF NOT cl_null(l_wc) THEN
#               LET l_wc = cl_replace_str(l_wc,'glar001','glcc002')
#            END IF
            #180815-00022#1 mark-e
            #180815-00022#1 add-s
            IF g_wc.getIndexOf("glar001",1)=0 THEN
               LET l_wc ="1=1"
               LET l_wc5 ="1=1"
            ELSE 
               LET l_i=l_i-6
               LET l_wc = g_wc.substring(1,l_i)
               IF NOT cl_null(l_wc) THEN
                  LET l_wc = cl_replace_str(l_wc,'glar001','glcc002')
                  LET l_wc5 =cl_replace_str(l_wc,'glcc002','xcbu004')
               END IF            
            END IF
            #180815-00022#1 add-e            
           
            #币别条件
            LET l_wc1 = g_wc.substring(l_i,g_wc.getLength())
            LET l_wc1 = cl_replace_str(l_wc1,'glar009','xccc010')
            LET l_wc2 = cl_replace_str(l_wc1,'xccc010','xccd010')
            LET l_wc3 = cl_replace_str(l_wc1,'xccc010','xcch010')
            #181009-00011#1 add-s
            LET l_wc6 = cl_replace_str(l_wc1,'xccc010','xcce010')
            LET l_wc7 = cl_replace_str(l_wc1,'xccc010','xcci010')
            #181009-00011#1 add-e
         END IF
      END IF
#161209-00052#1 mark s---       
#      #1）抓出该账套下所有成本分群码 + 库存科目或在制科目
#      LET l_sql="SELECT DISTINCT glcc001,glcc011,glcc002 FROM glcc_t ",  
#                " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                "   AND glcc001 IN ('1','3')  AND ",l_wc
#      PREPARE aglq510_sel_glcc_pr FROM l_sql
#      DECLARE aglq510_sel_glcc_cs CURSOR FOR aglq510_sel_glcc_pr
#      FOREACH aglq510_sel_glcc_cs INTO l_glcc001,l_glcc011,l_glar001
#         IF SQLCA.sqlcode THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = SQLCA.sqlcode
#            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs'
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET l_success = FALSE
#            EXIT FOREACH
#         END IF
#         #2）抓取成本分群码下料号的金额，按照币别汇总金额，并将抓取到资料插入临时表中
#         #注：此时插入的资料只是过渡资料，并不是要显示到单身的资料，此时glarent=NULL ,
#         #    diff字段存储成本分群，用于后续抓取子系统金额
#         #    为了第三部按照科目+币别汇出金额，与总账金额进行比较
#         #成本分群（agli161中维护）：
#         #         当成本分群码不等于‘*’时，抓取axci120中维护的，该成本分群码下所有的料件编号；
#         #         当成本分群码等于‘*’时，抓取axci120中没有维护分群码的料号，或者是维护的分群码不存在与agli161中的料号
#         IF l_glcc001='1' THEN #存货科目
#            LET l_sql="SELECT xccc010,SUM(xccc902) ",
#                      "  FROM xccc_t,xcbb_t ",
#                      " WHERE xcccent=xcbbent AND xccc004=xcbb001 AND xccc005=xcbb002 AND xccc006=xcbb003 ",
#                      "   AND xcccent=",g_enterprise," AND xcccld='",tm.glaald,"' ",
#                      "   AND xccc001='1' AND xccc004=",tm.glar002," AND xccc005=",tm.glar003,
#                      "   AND xcbbcomp='",tm.glaacomp,"' ",
#                      "   AND ",l_wc1
#            IF l_glcc011 <> '* ' THEN
#               LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",
#                               "      xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                               "                      WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                               "                        AND glcc001='1' AND glcc011 <> '*' )",
#                               "      )"
#            END IF
#            LET l_sql=l_sql," GROUP BY xccc010",
#                            " ORDER BY xccc010"
#         ELSE #在制科目
#            #成本分群条件
#            IF l_glcc011 <> '* ' THEN
#               LET l_sql1=" xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_sql1=" (xcbb010 IS NULL OR ",
#                          "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                          "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                          "                    AND glcc001='3' AND glcc011 <> '*' )",
#                          "  )"
#            END IF
#            LET l_sql="SELECT curr,SUM(amt) ",
#                      "  FROM (",
#                      "         (SELECT xccd011 curr,SUM(xccd902) amt",
#                      "            FROM xccd_t,xcbb_t ",
#                      "           WHERE xccdent=xcbbent AND xccd004=xcbb001 AND xccd005=xcbb002 AND xccd007=xcbb003 ",
#                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                      "             AND xcbbcomp='",tm.glaacomp,"' ",
#                      "             AND ",l_wc2,
#                      "             AND ",l_sql1,
#                      "           GROUP BY xccd011 ",
#                      "         )",
#                      "         UNION ",
#                      "         (SELECT xcch011 curr,SUM(xcch902) amt",
#                      "            FROM xcch_t,xcbb_t ",
#                      "           WHERE xcchent=xcbbent AND xcch004=xcbb001 AND xcch005=xcbb002 AND xcch007=xcbb003 ",
#                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
#                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
#                      "             AND xcbbcomp='",tm.glaacomp,"' ",
#                      "             AND ",l_wc3,
#                      "             AND ",l_sql1,
#                      "           GROUP BY xcch011 ",
#                      "         )",
#                      "       ) ",
#                      " GROUP BY curr ",
#                      " ORDER BY curr "
#         END IF
#         PREPARE aglq510_sel_xccc_pr FROM l_sql
#         DECLARE aglq510_sel_xccc_cs CURSOR FOR aglq510_sel_xccc_pr
#         FOREACH aglq510_sel_xccc_cs INTO l_glar009,l_amt
#            IF SQLCA.sqlcode THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = SQLCA.sqlcode
#               LET g_errparam.extend = 'FOREACH aglq510_sel_xccc_cs'
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#               LET l_success = FALSE
#               EXIT FOREACH
#            END IF
#            IF cl_null(l_amt) THEN LET l_amt = 0 END IF
#            #系统别:5.成本
#            LET l_sys = '5' 
#            
#            #插入临时表
#            #暂用diff字段存储成本分群，用于后续抓取子系统金额
#            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#            VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#            IF SQLCA.sqlcode THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = SQLCA.sqlcode
#               LET g_errparam.extend = 'insert'
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#               LET l_success = FALSE
#            END IF
#         END FOREACH
#      END FOREACH
#161209-00052#1 mark e---      
#161209-00052#1 add s--- 
      #1）抓出该账套下所有成本分群码 + 库存科目 
      LET l_sql="SELECT DISTINCT glcc001,glcc011,glcc002,glcc016 FROM glcc_t ",   #180319-00029#1---add---> ,glcc016 
                " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                "   AND glcc001 IN ('1')  AND ",l_wc
      PREPARE aglq510_sel_glcc_pr1 FROM l_sql
      DECLARE aglq510_sel_glcc_cs1 CURSOR FOR aglq510_sel_glcc_pr1
      FOREACH aglq510_sel_glcc_cs1 INTO l_glcc001,l_glcc011,l_glar001,l_glcc016  #180319-00029#1---add---> ,l_glcc016
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         
         IF cl_null(l_glar001)THEN CONTINUE FOREACH END IF   #170323-00087#2
         #2）抓取成本分群码下料号的金额，按照币别汇总金额，并将抓取到资料插入临时表中
         #注：此时插入的资料只是过渡资料，并不是要显示到单身的资料，此时glarent=NULL ,
         #    diff字段存储成本分群，用于后续抓取子系统金额
         #    为了第三部按照科目+币别汇出金额，与总账金额进行比较
         #成本分群（agli161中维护）：
         #         当成本分群码不等于‘*’时，抓取axci120中维护的，该成本分群码下所有的料件编号；
         #         当成本分群码等于‘*’时，抓取axci120中没有维护分群码的料号，或者是维护的分群码不存在与agli161中的料号
         IF l_glcc001='1' THEN #存货科目
            LET l_sql="SELECT xccc010,SUM(xccc902) ",
                      "  FROM xccc_t,xcbb_t ",
                      " WHERE xcccent=xcbbent AND xccc004=xcbb001 AND xccc005=xcbb002 AND xccc006=xcbb003 ",
                      "   AND xcccent=",g_enterprise," AND xcccld='",tm.glaald,"' ",
                      "   AND xccc001='1' AND xccc004=",tm.glar002," AND xccc005=",tm.glar003,
                      "   AND xccc003='",g_glaa120,"' ",  #171103-00001#1 add
                      "   AND xcbbcomp='",tm.glaacomp,"' ",
                      "   AND ",l_wc1
#            #180319-00029#1---mark---str
#            IF l_glcc011 <> '* ' THEN
#               LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",
#                               "      xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                               "                      WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                               "                        AND glcc001='1' AND glcc011 <> '*' )",
#                               "      )"
#            END IF
#            #180319-00029#1---mark---end
            #180319-00029#1---add---str
            IF l_glcc016<> '*' THEN        
               LET l_sql = l_sql," AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",        
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "  AND glcc001='1' AND glcc002 = '",l_glar001,"' ))"        
            ELSE        
               IF l_glcc011 <> '* ' THEN        
                  LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"        
                             
               ELSE        
                  LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",        
                                  "      xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",        
                                  "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                  "                    AND glcc001='1' AND glcc011 <> '*' )",        
                                  "      )"                           
               END IF 
               LET l_sql = l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",        
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "   ))"                   
            END IF  
            #180319-00029#1---add---end
            
            LET l_sql=l_sql," GROUP BY xccc010",
                            " ORDER BY xccc010"
         END IF                                          
         PREPARE aglq510_sel_xccc_pr1 FROM l_sql
         DECLARE aglq510_sel_xccc_cs1 CURSOR FOR aglq510_sel_xccc_pr1
#190313-00030#1 --begin
         LET l_glar009 = NULL
         LET l_amt = 0
#190313-00030#1 --end
         FOREACH aglq510_sel_xccc_cs1 INTO l_glar009,l_amt
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH aglq510_sel_xccc_cs1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
            IF cl_null(l_amt) THEN LET l_amt = 0 END IF
            #系统别:5.成本
            LET l_sys = '5' 
            
            #插入临时表
            #暂用diff字段存储成本分群，用于后续抓取子系统金额
            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
            VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
         END FOREACH            
      END FOREACH
      #180308-00059#1   By 09505  add   --(S)--
       #1）抓出该账套下所有成本分群码 +  发出商品科目 
      LET l_wc4 = cl_replace_str(l_wc,'glcc002','glcc006')
      LET l_sql="SELECT DISTINCT glcc001,glcc011,glcc006,glcc016 FROM glcc_t ",  
                " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                "   AND glcc001 IN ('1')  AND ",l_wc4
      PREPARE aglq510_sel_glcc_pr1_1 FROM l_sql
      DECLARE aglq510_sel_glcc_cs1_1 CURSOR FOR aglq510_sel_glcc_pr1_1
      FOREACH aglq510_sel_glcc_cs1_1 INTO l_glcc001,l_glcc011,l_glar001,l_glcc016  
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         
         IF cl_null(l_glar001)THEN CONTINUE FOREACH END IF   					
         IF l_glcc001='1' THEN #发出商品科目   																			
            LET l_sql="SELECT SUM(xckc014) ",											
                     "FROM xckc_t,xcbb_t ",											
                     " WHERE xckcent=xcbbent AND xckc001=xcbb001 AND xckc002=xcbb002 AND xckc004=xcbb003 ",	                       
                     " AND xckcent=",g_enterprise," AND xckcld='",tm.glaald,"' ",											
                     " AND xckc001=",tm.glar002," AND xckc002=",tm.glar003," ",											
                     " AND xcbbcomp='",tm.glaacomp,"' ",											
                     " AND ",l_wc1											
            IF l_glcc016<>'*' THEN											
               LET l_sql=l_sql," AND xcbb003  = '",l_glcc016,"' AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",											
                               " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",											
                               " AND glcc001='1' AND glcc006 = '",l_glar001,"' ))"											
            ELSE											
               IF l_glcc011<>'* ' THEN											
                  LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"											
               											
               ELSE											
                  LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",											
                                  " xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",											
                                  " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",											
                                  " AND glcc001='1' AND glcc011 <> '*' )",											
                                  " )"											
               END IF											
               LET l_sql=l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",											
                               " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",											
                               " ))"											
            END IF																				
         END IF	   																														
         PREPARE aglq510_sel_xckc_pr1_1 FROM l_sql											
         DECLARE aglq510_sel_xckc_cs1_1 CURSOR FOR aglq510_sel_xckc_pr1_1		
                   
         #本位币               
         SELECT glaa001 INTO l_glar009
            FROM glaa_t 
           WHERE glaaent = g_enterprise
             AND glaald =tm.glaald          

#190313-00030#1 --begin
         LET l_amt = 0
#190313-00030#1 --end

         FOREACH aglq510_sel_xckc_cs1_1 INTO l_amt											
            IF SQLCA.sqlcode THEN											
               INITIALIZE g_errparam TO NULL											
               LET g_errparam.code=SQLCA.sqlcode											
               LET g_errparam.extend='FOREACH aglq510_sel_xckc_cs1_1'											
               LET g_errparam.popup=TRUE											
               CALL cl_err()											
               LET l_success = FALSE											
               EXIT FOREACH											
            END IF											
            IF cl_null(l_amt) THEN LET l_amt = 0 END IF											
            #系统别:5.成本											
            LET l_sys='5'			               									
            #插入临时表											
            #暂用diff字段存储成本分群，用于后续抓取子系统金额											
            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)											
            VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)											
            IF SQLCA.sqlcode THEN											
               INITIALIZE g_errparam TO NULL											
               LET g_errparam.code=SQLCA.sqlcode											
               LET g_errparam.extend='insert'											
               LET g_errparam.popup=TRUE											
               CALL cl_err()											
               LET l_success = FALSE											
            END IF											
         END FOREACH                  
      END FOREACH
      #180308-00059#1   By 09505  add   --(E)--
      #1）抓出该账套下所有成本分群码 + 在制科目 
      LET l_sql="SELECT DISTINCT glcc001,glcc011,glcc002,glcc003,glcc004,glcc005,glcc006,glcc017,glcc018,glcc019 FROM glcc_t ",  
                " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                "   AND glcc001 IN ('3')  AND ",l_wc
      PREPARE aglq510_sel_glcc_pr2 FROM l_sql
      DECLARE aglq510_sel_glcc_cs2 CURSOR FOR aglq510_sel_glcc_pr2
      FOREACH aglq510_sel_glcc_cs2 INTO l_glcc001,l_glcc011,l_glar001,l_glar001_2,l_glar001_3,l_glar001_4,l_glar001_5,
      l_glar001_6,l_glar001_7,l_glar001_8
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs2'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #2）抓取成本分群码下料号的金额，按照币别汇总金额，并将抓取到资料插入临时表中
         #注：此时插入的资料只是过渡资料，并不是要显示到单身的资料，此时glarent=NULL ,
         #    diff字段存储成本分群，用于后续抓取子系统金额
         #    为了第三部按照科目+币别汇出金额，与总账金额进行比较
         #成本分群（agli161中维护）：
         #         当成本分群码不等于‘*’时，抓取axci120中维护的，该成本分群码下所有的料件编号；
         #         当成本分群码等于‘*’时，抓取axci120中没有维护分群码的料号，或者是维护的分群码不存在与agli161中的料号
 
            #成本分群条件
#            #180319-00029#1---mark---str
#            IF l_glcc011 <> '* ' THEN
#               LET l_sql1=" xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_sql1=" (xcbb010 IS NULL OR ",
#                          "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                          "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                          "                    AND glcc001='3' AND glcc011 <> '*' )",
#                          "  )"
#            END IF
#            #180319-00029#1---mark---end
            #180319-00029#1---add---str
            IF l_glcc016<> '*' THEN        
#               LET l_sql = l_sql," AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",   #180509-00006#1---mark
               LET l_sql1 = "  (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",       #180509-00006#1---add
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "  AND glcc001='3' AND glcc002 = '",l_glar001,"' ))"        
            ELSE        
               IF l_glcc011 <> '* ' THEN
                  LET l_sql1=" xcbb010='",l_glcc011,"'"
                  
               ELSE
                  LET l_sql1=" (xcbb010 IS NULL OR ",
                              "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
                              "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                              "                    AND glcc001='3' AND glcc011 <> '*' )",
                              "  )"
                   
               END IF
#               LET l_sql = l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",    #180509-00006#1---mark
               LET l_sql1 = l_sql1," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",   #180509-00006#1---add
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "  ))"               
            END IF  
            #180319-00029#1---add---end
            
#            #181009-00011#1 mark-s
#            LET l_sql="SELECT curr,SUM(amt),SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8),SUM(amt9) ",   #170711-00051#1 add SUM(amt9) lujh
#                      "  FROM (",
#                      "         (SELECT xccd011 curr,SUM(xccd902a) amt,SUM(xccd902b) amt2,SUM(xccd902c) amt3,SUM(xccd902d) amt4,SUM(xccd902e) amt5,SUM(xccd902f) amt6,SUM(xccd902g) amt7,SUM(xccd902h) amt8,",
#                      "                              SUM(xccd902) amt9 ",     #170711-00051#1 add lujh
#                      "            FROM xccd_t,xcbb_t ",
#                      "           WHERE xccdent=xcbbent AND xccd004=xcbb001 AND xccd005=xcbb002 AND xccd007=xcbb003 ",
#                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                      "             AND xcbbcomp='",tm.glaacomp,"' ",
#                      "             AND ",l_wc2,
#                      "             AND ",l_sql1,
#                      #170208-00041#1--add--str--lujh
#                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
#                      "                                 AND sfaa057 <> '2') ",
#                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ",  #180815-00022#1 add
#                      #170208-00041#1--add--end--lujh
#                      "           GROUP BY xccd011 ",
#                      "         )",
#                      "         UNION ",
#                      "         (SELECT xcch011 curr,SUM(xcch902a) amt,SUM(xcch902b) amt2,SUM(xcch902c) amt3,SUM(xcch902d) amt4,SUM(xcch902e) amt5,SUM(xcch902f) amt6,SUM(xcch902g) amt7,SUM(xcch902h) amt8,",
#                      "                              SUM(xcch902) amt9 ",     #170711-00051#1 add lujh
#                      "            FROM xcch_t,xcbb_t ",
#                      "           WHERE xcchent=xcbbent AND xcch004=xcbb001 AND xcch005=xcbb002 AND xcch007=xcbb003 ",
#                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
#                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
#                      "             AND xcbbcomp='",tm.glaacomp,"' ",
#                      "             AND ",l_wc3,
#                      "             AND ",l_sql1,
#                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  #180815-00022#1 add
#                      "           GROUP BY xcch011 ",
#                      "         )",
#                      "       ) ",
#                      " GROUP BY curr ",
#                      " ORDER BY curr "
#         #181009-00011#1 mark-e
         #181009-00011#1 add-s
            LET l_sql="SELECT curr,SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8) ",   
                      "  FROM (",
                      "         (SELECT xcce010 curr,SUM(xcce902b) amt2,SUM(xcce902c) amt3,SUM(xcce902d) amt4,SUM(xcce902e) amt5,SUM(xcce902f) amt6,SUM(xcce902g) amt7,SUM(xcce902h) amt8", 
                      "            FROM xcbb_t,xccd_t,xcce_t ",                   
                      "           WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
                      "             AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                      "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc2,
                      "             AND ",l_sql1,
                      "             AND xcce007 = 'DL+OH+SUB'",
                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 <> '2') ",
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
                      "           GROUP BY xcce010 ",
                      "         )",
                      "         UNION ",
                      "         (SELECT xcci010 curr,SUM(xcci902b) amt2,SUM(xcci902c) amt3,SUM(xcci902d) amt4,SUM(xcci902e) amt5,SUM(xcci902f) amt6,SUM(xcci902g) amt7,SUM(xcci902h) amt8",   
                      "            FROM xcbb_t,xcch_t,xcci_t ",
                      "           WHERE xcbbent=xcchent AND xcbb001=xcch004 AND xcbb002=xcch005 AND xcbb003=xcch007 ",
                      "             AND xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                      "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc3,
                      "             AND ",l_sql1,
                      "             AND xcci007 = 'DL+OH+SUB'",
#190716-00012#1 --begin    #这里只抓一般在制的拆件
                      "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 <> '2') ",
#190716-00012#1 --end
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  #180815-00022#1 add
                      "           GROUP BY xcci010 ",
                      "         )",
                      "       ) ",
                      " GROUP BY curr ",
                      " ORDER BY curr "
         #181009-00011#1 add-e
       
         PREPARE aglq510_sel_xccc_pr2 FROM l_sql
         DECLARE aglq510_sel_xccc_cs2 CURSOR FOR aglq510_sel_xccc_pr2

         #181009-00011#1 add-s
         #xcce902与xcci902有xcce007和xcci007 条件限制，需要单独抓取，
            LET l_sql="SELECT curr,SUM(amt) ",   
                      "  FROM (",
                      "         (SELECT xcce010 curr,SUM(xcce902) amt", 
                      "            FROM xcbb_t,xccd_t,xcce_t ",                   
                      "           WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
                      "             AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                      "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc2,
                      "             AND ",l_sql1,
                      "             AND xcce007 <>'DL+OH+SUB'",
                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 <> '2') ",
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
                      "           GROUP BY xcce010 ",
                      "         )",
                      "         UNION ",
                      "         (SELECT xcci010 curr,SUM(xcci902) amt",   
                      "            FROM xcbb_t,xcch_t,xcci_t ",
                      "           WHERE xcbbent=xcchent AND xcbb001=xcch004 AND xcbb002=xcch005 AND xcbb003=xcch007 ",
                      "             AND xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                      "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc3,
                      "             AND ",l_sql1,
                      "             AND xcci007 <> 'DL+OH+SUB'",
#190716-00012#1 --begin    #这里只抓一般在制的拆件
                      "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 <> '2') ",
#190716-00012#1 --end
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  #180815-00022#1 add
                      "           GROUP BY xcci010 ",
                      "         )",
                      "       ) ",
                      " GROUP BY curr ",
                      " ORDER BY curr "
         PREPARE agl510_pre_xcce_xcce FROM l_sql
         DECLARE agl510_cur_xcce_xcce CURSOR FOR agl510_pre_xcce_xcce
         LET l_i=1
#190313-00030#1 --begin
         INITIALIZE l_xcce TO NULL
#190313-00030#1 --end
         FOREACH agl510_cur_xcce_xcce INTO l_xcce[l_i].xcce010,l_xcce[l_i].xcce902
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH agl510_cur_xcce_xcce'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF 
            
#190613-00046#1 --begin   #考虑会有当月发料下月入库的，当月有材料费，但没有人工制费，如果放到FOREACH aglq510_sel_xccc_cs2去计算材料费，会因为当月没有入库而漏掉当月发料的材料费
#插入临时表
#暂用diff字段存储成本分群，用于后续抓取子系统金额
            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
            VALUES(l_sys,l_glar001,l_xcce[l_i].xcce010,l_xcce[l_i].xcce902,l_glcc011)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF  
#190613-00046#1 --end        
            
            LET l_i=l_i+1            
         END FOREACH

         #181009-00011#1 add-e  
 
#190313-00030#1 --begin
         LET l_glar009 = NULL
         LET l_amt2 = 0
         LET l_amt3 = 0
         LET l_amt4 = 0
         LET l_amt5 = 0
         LET l_amt6 = 0
         LET l_amt7 = 0
         LET l_amt8 = 0         
#190313-00030#1 --end

         #FOREACH aglq510_sel_xccc_cs2 INTO l_glar009,l_amt,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6,l_amt7,l_amt8,l_amt9  #181009-00011#1 mark
         FOREACH aglq510_sel_xccc_cs2 INTO l_glar009,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6,l_amt7,l_amt8  #181009-00011#1 add
                 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH aglq510_sel_xccc_cs2'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
#190313-00030#1 --begin
            LET l_amt = 0        
#190313-00030#1 --end
#190613-00046#1 --begin mark
            #181009-00011#1 add-s  币种将单独抓取的xcce902和xcci902的金额给l_amt
#            FOR l_i=1 TO l_xcce.getLength() 
#               IF l_xcce[l_i].xcce010=l_glar009 THEN
#                  LET l_amt= l_xcce[l_i].xcce902
#               END IF 
#            END FOR
            #181009-00011#1 add-e    
#190613-00046#1 --end         
            IF cl_null(l_amt) THEN LET l_amt = 0 END IF
            IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
            IF cl_null(l_amt3) THEN LET l_amt3 = 0 END IF
            IF cl_null(l_amt4) THEN LET l_amt4 = 0 END IF
            IF cl_null(l_amt5) THEN LET l_amt5 = 0 END IF
            IF cl_null(l_amt6) THEN LET l_amt6 = 0 END IF
            IF cl_null(l_amt7) THEN LET l_amt7 = 0 END IF
            IF cl_null(l_amt8) THEN LET l_amt8 = 0 END IF
            IF cl_null(l_amt9) THEN LET l_amt9 = 0 END IF   #170711-00051#1 add lujh
            #系统别:5.成本
            LET l_sys = '5' 
            
#190613-00046#1 --begin mark            
#            #170711-00051#1--add--str--lujh
#            IF l_sfin6014 = '3' THEN
#               #LET l_amt = l_amt9  #180702-00039#1 mark
#               LET l_amt  = l_amt   #180702-00039#1 add #l_amt期末结存金额-材料，l_amt9期末结存金额 
#               LET l_amt2 = 0
#               LET l_amt3 = 0
#               LET l_amt4 = 0
#               LET l_amt5 = 0
#               LET l_amt6 = 0
#               LET l_amt7 = 0
#               LET l_amt8 = 0
#               
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF
#            ELSE
#            #170711-00051#1--add--end--lujh
#               #插入临时表
#               #暂用diff字段存储成本分群，用于后续抓取子系统金额
#考虑会有当月发料下月入库的，原材料放到前面单独计算，跨月入库的，这里捞不到人工制费，但材料费要在上面先捞到
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF            
#190613-00046#1 --end           
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_2,l_glar009,l_amt2,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert2'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_3,l_glar009,l_amt3,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF          
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_4,l_glar009,l_amt4,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert4'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_5,l_glar009,l_amt5,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_6,l_glar009,l_amt6,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert6'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_7,l_glar009,l_amt7,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert7'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF   
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_8,l_glar009,l_amt8,l_glcc011) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert8'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF  
#            END IF   #170711-00051#1 add lujh       #190613-00046#1 mark             
         END FOREACH
      END FOREACH      
      
      #180815-00022#1 add-s
      #1）抓出axci200该账套下在制科目 
      LET l_sql="SELECT DISTINCT '',xcbu004,xcbu006,xcbu007,xcbu008,xcbu009,xcbu010,xcbu011,xcbu012 FROM xcbu_t ",  
                " WHERE xcbuent=",g_enterprise," AND xcbuld='",tm.glaald,"'",
                "  AND ",l_wc5
      PREPARE aglq510_sel_glcc_pr2_1 FROM l_sql
      DECLARE aglq510_sel_glcc_cs2_1 CURSOR FOR aglq510_sel_glcc_pr2_1
      FOREACH aglq510_sel_glcc_cs2_1 INTO l_glcc011,l_glar001,l_glar001_2,l_glar001_3,l_glar001_4,l_glar001_5,
      l_glar001_6,l_glar001_7,l_glar001_8
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs2_1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
#         #181009-00011#1 mark-s
#         LET l_sql="SELECT curr,SUM(amt),SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8),SUM(amt9) ",   
#                   "  FROM (",
#                   "         (SELECT xccd011 curr,SUM(xccd902a) amt,SUM(xccd902b) amt2,SUM(xccd902c) amt3,SUM(xccd902d) amt4,SUM(xccd902e) amt5,SUM(xccd902f) amt6,SUM(xccd902g) amt7,SUM(xccd902h) amt8,",
#                   "                              SUM(xccd902) amt9 ",   
#                   "            FROM xccd_t ",
#                   "           WHERE xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                   "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                   "             AND xccdcomp='",tm.glaacomp,"' ",
#                   "             AND ",l_wc2,
#                   "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
#                   "                                 AND sfaa057 <> '2') ",
#                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
#                   "           GROUP BY xccd011 ",
#                   "         )",
#                   "         UNION ",
#                   "         (SELECT xcch011 curr,SUM(xcch902a) amt,SUM(xcch902b) amt2,SUM(xcch902c) amt3,SUM(xcch902d) amt4,SUM(xcch902e) amt5,SUM(xcch902f) amt6,SUM(xcch902g) amt7,SUM(xcch902h) amt8,",
#                   "                              SUM(xcch902) amt9 ",    
#                   "            FROM xcch_t ",
#                   "           WHERE xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
#                   "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
#                   "             AND xcchcomp='",tm.glaacomp,"' ",
#                   "             AND ",l_wc3,
#                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  
#                   "           GROUP BY xcch011 ",
#                   "         )",
#                   "       ) ",
#                   " GROUP BY curr ",
#                   " ORDER BY curr "
#         #181009-00011#1 mark-e
         #181009-00011#1 add-s
         LET l_sql="SELECT curr,SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8) ",   
                   "  FROM (",
                   "         (SELECT xcce010 curr,SUM(xcce902b) amt2,SUM(xcce902c) amt3,SUM(xcce902d) amt4,SUM(xcce902e) amt5,SUM(xcce902f) amt6,SUM(xcce902g) amt7,SUM(xcce902h) amt8",
                   "            FROM xccd_t,xcce_t ",
                   "           WHERE xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                   "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                   "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                   "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                   "             AND xccdcomp='",tm.glaacomp,"' ",
                   "             AND ",l_wc2,
                   "             AND xcce007 = 'DL+OH+SUB'",
                   "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                   "                                 AND sfaa057 <> '2') ",
                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
                   "           GROUP BY xcce010 ",
                   "         )",
                   "         UNION ",
                   "         (SELECT xcci010 curr,SUM(xcci902b) amt2,SUM(xcci902c) amt3,SUM(xcci902d) amt4,SUM(xcci902e) amt5,SUM(xcci902f) amt6,SUM(xcci902g) amt7,SUM(xcci902h) amt8",
                   "            FROM xcch_t,xcci_t ",
                   "           WHERE xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                   "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                   "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                   "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                   "             AND xcchcomp='",tm.glaacomp,"' ",
                   "             AND ",l_wc3,
                   "             AND xcci007 = 'DL+OH+SUB'",
#190716-00012#1 --begin    #这里只抓一般在制的拆件
                   "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                   "                                 AND sfaa057 <> '2') ",
#190716-00012#1 --end
                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  
                   "           GROUP BY xcci010 ",
                   "         )",
                   "       ) ",
                   " GROUP BY curr ",
                   " ORDER BY curr "
         #181009-00011#1 add-e
       
         PREPARE aglq510_sel_xccc_pr2_1 FROM l_sql
         DECLARE aglq510_sel_xccc_cs2_1 CURSOR FOR aglq510_sel_xccc_pr2_1

         #181009-00011#1 add-s
         #xcce902与xcci902有xcce007和xcci007 条件限制，需要单独抓取，
         LET l_sql="SELECT curr,SUM(amt) ",   
                   "  FROM (",
                   "         (SELECT xcce010 curr,SUM(xcce902) amt",
                   "            FROM xccd_t,xcce_t ",
                   "            where xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                   "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                   "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                   "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                   "             AND xccdcomp='",tm.glaacomp,"' ",
                   "             AND ",l_wc2,
                   "             AND xcce007 <> 'DL+OH+SUB'",
                   "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                   "                                 AND sfaa057 <> '2') ",
                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
                   "           GROUP BY xcce010 ",
                   "         )",
                   "         UNION ",
                   "         (SELECT xcci010 curr,SUM(xcci902) amt",
                   "            FROM xcch_t,xcci_t ",
                   "           WHERE xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                   "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                   "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                   "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                   "             AND xcchcomp='",tm.glaacomp,"' ",
                   "             AND ",l_wc3,
                   "             AND xcci007 <> 'DL+OH+SUB'",
#190716-00012#1 --begin    #这里只抓一般在制的拆件
                   "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                   "                                 AND sfaa057 <> '2') ",
#190716-00012#1 --end
                   "             AND  EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  
                   "           GROUP BY xcci010 ",
                   "         )",
                   "       ) ",
                   " GROUP BY curr ",
                   " ORDER BY curr "
         PREPARE agl510_pre_xcce_xcce1 FROM l_sql
         DECLARE agl510_cur_xcce_xcce1 CURSOR FOR agl510_pre_xcce_xcce1
         LET l_i=1
#190313-00030#1 --begin
         INITIALIZE l_xcce TO NULL
#190313-00030#1 --end
         FOREACH agl510_cur_xcce_xcce1 INTO l_xcce[l_i].xcce010,l_xcce[l_i].xcce902
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH agl510_cur_xcce_xcce1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF 
            
#190613-00046#1 --begin    #考虑会有当月发料下月入库的，当月有材料费，但没有人工制费，如果放到FOREACH aglq510_sel_xccc_cs2去计算材料费，会因为当月没有入库而漏掉当月发料的材料费
#插入临时表
#暂用diff字段存储成本分群，用于后续抓取子系统金额
            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
            VALUES(l_sys,l_glar001,l_xcce[l_i].xcce010,l_xcce[l_i].xcce902,l_glcc011)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF   
#190613-00046#1 --end            
            
            LET l_i=l_i+1            
         END FOREACH
         #181009-00011#1 add-e
#190313-00030#1 --begin
         LET l_glar009 = NULL
         LET l_amt2 = 0
         LET l_amt3 = 0
         LET l_amt4 = 0
         LET l_amt5 = 0
         LET l_amt6 = 0
         LET l_amt7 = 0
         LET l_amt8 = 0         
#190313-00030#1 --end
         #FOREACH aglq510_sel_xccc_cs2_1 INTO l_glar009,l_amt,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6,l_amt7,l_amt8,l_amt9   #181009-00011#1 mark
         FOREACH aglq510_sel_xccc_cs2_1 INTO l_glar009,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6,l_amt7,l_amt8   #181009-00011#1 add
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH aglq510_sel_xccc_cs2'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
#190313-00030#1 --begin
            LET l_amt = 0        
#190313-00030#1 --end
#190613-00046#1 --begin  mark
            #181009-00011#1 add-s  币种将单独抓取的xcce902和xcci902的金额给l_amt
#            FOR l_i=1 TO l_xcce.getLength() 
#               IF l_xcce[l_i].xcce010=l_glar009 THEN
#                  LET l_amt= l_xcce[l_i].xcce902
#               END IF 
#            END FOR
            #181009-00011#1 add-e  
#190613-00046#1 --end 
            IF cl_null(l_amt) THEN LET l_amt = 0 END IF
            IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
            IF cl_null(l_amt3) THEN LET l_amt3 = 0 END IF
            IF cl_null(l_amt4) THEN LET l_amt4 = 0 END IF
            IF cl_null(l_amt5) THEN LET l_amt5 = 0 END IF
            IF cl_null(l_amt6) THEN LET l_amt6 = 0 END IF
            IF cl_null(l_amt7) THEN LET l_amt7 = 0 END IF
            IF cl_null(l_amt8) THEN LET l_amt8 = 0 END IF
            IF cl_null(l_amt9) THEN LET l_amt9 = 0 END IF 
            #系统别:5.成本
            LET l_sys = '5' 
            
#190613-00046#1 --begin mark            
#            IF l_sfin6014 = '3' THEN
#
#               LET l_amt  = l_amt   #l_amt期末结存金额-材料，l_amt9期末结存金额 
#               LET l_amt2 = 0
#               LET l_amt3 = 0
#               LET l_amt4 = 0
#               LET l_amt5 = 0
#               LET l_amt6 = 0
#               LET l_amt7 = 0
#               LET l_amt8 = 0
#               
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF
#            ELSE
#               #插入临时表
#考虑会有当月发料下月入库的，原材料放到前面单独计算，跨月入库的，这里捞不到人工制费，但材料费要在上面先捞到
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF            
#190613-00046#1 --end           
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_2,l_glar009,l_amt2,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert2'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_3,l_glar009,l_amt3,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF          
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_4,l_glar009,l_amt4,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert4'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_5,l_glar009,l_amt5,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_6,l_glar009,l_amt6,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert6'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_7,l_glar009,l_amt7,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert7'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF   
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_8,l_glar009,l_amt8,l_glcc011) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert8'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF  
#            END IF     #190613-00046#1 mark                 
         END FOREACH
      END FOREACH  
      #180815-00022#1 add-e
      
      #170711-00051#1--add--str--lujh 
      #再单独抓取一次委外的
      LET l_sql="SELECT DISTINCT glcc001,glcc011,glcc002,glcc003,glcc004,glcc005,glcc006,glcc017,glcc018,glcc019 FROM glcc_t ",  
                " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                "   AND glcc001 IN ('4')  AND ",l_wc   
      PREPARE aglq510_sel_glcc_pr3 FROM l_sql
      DECLARE aglq510_sel_glcc_cs3 CURSOR FOR aglq510_sel_glcc_pr3
      FOREACH aglq510_sel_glcc_cs3 INTO l_glcc001,l_glcc011,l_glar001,l_glar001_2,l_glar001_3,l_glar001_4,l_glar001_5,
      l_glar001_6,l_glar001_7,l_glar001_8
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glcc_cs3'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         
#190613-00046#1 --begin  #agli161里，委外加工费设在在制页签，所以这里glcc004是null，要从在制页签按同成本分群抓在制的加工费科目
         LET l_sql="SELECT DISTINCT glcc004 FROM glcc_t ",  
                   " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                   "   AND glcc001 IN ('3')  ",
                   "   AND glcc011 = '",l_glcc011,"'",
                   "   AND ",l_wc   
         PREPARE aglq510_sel_glcc004_pr FROM l_sql
         EXECUTE aglq510_sel_glcc004_pr INTO l_glar001_3
         IF SQLCA.sqlcode THEN
#190902-00053#1 --begin
            IF SQLCA.sqlcode = 100 THEN   #如果用委外的成本分群抓不到在制页签的，就再判断在制里是否有成本分群是*的
               LET l_sql="SELECT DISTINCT glcc004 FROM glcc_t ",
                         " WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                         "   AND glcc001 IN ('3')  ",
                         "   AND glcc011 = '*'",
                         "   AND ",l_wc
               PREPARE aglq510_sel_glcc004_pr1 FROM l_sql
               EXECUTE aglq510_sel_glcc004_pr1 INTO l_glar001_3
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'get glcc004_1'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
                  EXIT FOREACH

               END IF
            ELSE
#190902-00053#1 --end 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'get glcc004'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
            END IF
         END IF     #190902-00053#1 add
#190613-00046#1 --end         
         
         #2）抓取成本分群码下料号的金额，按照币别汇总金额，并将抓取到资料插入临时表中
         #注：此时插入的资料只是过渡资料，并不是要显示到单身的资料，此时glarent=NULL ,
         #    diff字段存储成本分群，用于后续抓取子系统金额
         #    为了第三部按照科目+币别汇出金额，与总账金额进行比较
         #成本分群（agli161中维护）：
         #         当成本分群码不等于‘*’时，抓取axci120中维护的，该成本分群码下所有的料件编号；
         #         当成本分群码等于‘*’时，抓取axci120中没有维护分群码的料号，或者是维护的分群码不存在与agli161中的料号
 
            #成本分群条件
#            #180319-00029#1---mark---str
#            IF l_glcc011 <> '* ' THEN
#               LET l_sql1=" xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_sql1=" (xcbb010 IS NULL OR ",
#                          "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                          "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                          #"                    AND glcc001='3' AND glcc011 <> '*' )", #180119-00011#1 mark
#                          "                    AND glcc001='4' AND glcc011 <> '*' )", #180119-00011#1 add                          
#                          "  )"
#            END IF
#            #180319-00029#1---mark---end
            #180319-00029#1---add---str
            IF l_glcc016<> '*' THEN        
#               LET l_sql = l_sql," AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",  #180509-00006#1---mark
               LET l_sql1 = "  (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",      #180509-00006#1---add
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "  AND glcc001='4' AND glcc002 = '",l_glar001,"' ))"        
            ELSE        
               IF l_glcc011 <> '* ' THEN
                  LET l_sql1=" xcbb010='",l_glcc011,"'"
                
               ELSE
                   LET l_sql1=" (xcbb010 IS NULL OR ",
                          "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
                          "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                          "                    AND glcc001='4' AND glcc011 <> '*' )",                        
                          "  )"
                  
               END IF
#               LET l_sql = l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",    #180509-00006#1---mark
               LET l_sql1 = l_sql1," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",    #180509-00006#1---add               
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "   ))"               
            END IF  
            #180319-00029#1---add---end

#190315-00009#1 --begin
         #xcce902与xcci902有xcce007和xcci007 条件限制，需要单独抓取，
#190716-00012#1 --begin  #加上委外的拆件
            LET l_sql="SELECT curr,SUM(amt) ",   
                      "  FROM (",
                      "         (SELECT xcce010 curr,SUM(xcce902) amt", 
                      "            FROM xcbb_t,xccd_t,xcce_t ",                   
                      "           WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
                      "             AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                      "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc2,
                      "             AND ",l_sql1,
                      "             AND xcce007 <>'DL+OH+SUB'",
                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 = '2') ",
                      "           GROUP BY xcce010 ",
                      "         )",
                      "         UNION ",
                      "         (SELECT xcci010 curr,SUM(xcci902) amt",   
                      "            FROM xcbb_t,xcch_t,xcci_t ",
                      "           WHERE xcbbent=xcchent AND xcbb001=xcch004 AND xcbb002=xcch005 AND xcbb003=xcch007 ",
                      "             AND xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                      "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc3,
                      "             AND ",l_sql1,
                      "             AND xcci007 <> 'DL+OH+SUB'",
                      "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 = '2') ",
                      "           GROUP BY xcci010 ",
                      "         )",
                      "       ) ",
                      " GROUP BY curr ",
                      " ORDER BY curr "


#            LET l_sql="SELECT xcce010,SUM(xcce902)", 
#                      "  FROM xcbb_t,xccd_t,xcce_t ",                   
#                      " WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
#                      "   AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
#                      "   AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
#                      "   AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                      "   AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                      "   AND xcbbcomp='",tm.glaacomp,"' ",
#                      "   AND ",l_wc2,
#                      "   AND ",l_sql1,
#                      "   AND xcce007 <>'DL+OH+SUB'",
#                      "   AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
#                      "                       AND sfaa057 = '2') ",
#                      " GROUP BY xcce010 ",
#                      " ORDER BY xcce010 "
#190716-00012#1 --end
         PREPARE agl510_pre_xcce_xcce2 FROM l_sql
         DECLARE agl510_cur_xcce_xcce2 CURSOR FOR agl510_pre_xcce_xcce2
         LET l_i=1
         INITIALIZE l_xcce TO NULL
         FOREACH agl510_cur_xcce_xcce2 INTO l_xcce[l_i].xcce010,l_xcce[l_i].xcce902
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH agl510_cur_xcce_xcce2'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF 
            
#190613-00046#1 --begin    #考虑会有当月发料下月入库的，当月有材料费，但没有人工制费，如果放到FOREACH aglq510_sel_xccc_cs2去计算材料费，会因为当月没有入库而漏掉当月发料的材料费
#插入临时表
#暂用diff字段存储成本分群，用于后续抓取子系统金额
            INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
            VALUES(l_sys,l_glar001,l_xcce[l_i].xcce010,l_xcce[l_i].xcce902,l_glcc011)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF  
#190613-00046#1 --end            
            
            LET l_i=l_i+1            
         END FOREACH





#190716-00012#1 --begin  #加上委外的拆件
            LET l_sql="SELECT curr,SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8) ",   
                      "  FROM (",
                      "         (SELECT xcce010 curr,SUM(xcce902b) amt2,SUM(xcce902c) amt3,SUM(xcce902d) amt4,SUM(xcce902e) amt5,SUM(xcce902f) amt6,SUM(xcce902g) amt7,SUM(xcce902h) amt8", 
                      "            FROM xcbb_t,xccd_t,xcce_t ",                   
                      "           WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
                      "             AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
                      "             AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc2,
                      "             AND ",l_sql1,
                      "             AND xcce007 = 'DL+OH+SUB'",
                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 = '2') ",
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xccdent AND xcbuld=xccdld AND xcbu001=substr(xccd006,",g_str_pos,',',g_slip_len,") ) ", 
                      "           GROUP BY xcce010 ",
                      "         )",
                      "         UNION ",
                      "         (SELECT xcci010 curr,SUM(xcci902b) amt2,SUM(xcci902c) amt3,SUM(xcci902d) amt4,SUM(xcci902e) amt5,SUM(xcci902f) amt6,SUM(xcci902g) amt7,SUM(xcci902h) amt8",   
                      "            FROM xcbb_t,xcch_t,xcci_t ",
                      "           WHERE xcbbent=xcchent AND xcbb001=xcch004 AND xcbb002=xcch005 AND xcbb003=xcch007 ",
                      "             AND xcchent=xccient AND xcchld=xccild AND xcch001=xcci001 AND xcch002=xcci002 AND xcch003=xcci003 ",
                      "             AND xcch004=xcci004 AND xcch005=xcci005 AND xcch006=xcci006 ",
                      "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                      "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                      "             AND xcbbcomp='",tm.glaacomp,"' ",
                      "             AND ",l_wc3,
                      "             AND ",l_sql1,
                      "             AND xcci007 = 'DL+OH+SUB'",
                      "             AND xcci006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                      "                                 AND sfaa057 = '2') ",
                      "             AND NOT EXISTS (SELECT 1 FROM xcbu_t WHERE xcbuent=xcchent AND xcbuld=xcchld AND xcbu001=substr(xcch006,",g_str_pos,',',g_slip_len,") ) ",  #180815-00022#1 add
                      "           GROUP BY xcci010 ",
                      "         )",
                      "       ) ",
                      " GROUP BY curr ",
                      " ORDER BY curr "

#            LET l_sql=" SELECT xcce010 ,SUM(xcce902b),SUM(xcce902c),SUM(xcce902d),SUM(xcce902e),SUM(xcce902f),SUM(xcce902g),SUM(xcce902h)", 
#                      "   FROM xcbb_t,xccd_t,xcce_t ",                   
#                      "  WHERE xcbbent=xccdent AND xcbb001=xccd004 AND xcbb002=xccd005 AND xcbb003=xccd007 ",
#                      "    AND xccdent=xcceent AND xccdld=xcceld AND xccd001=xcce001 AND xccd002=xcce002 AND xccd003=xcce003 ",
#                      "    AND xccd004=xcce004 AND xccd005=xcce005 AND xccd006=xcce006 ",
#                      "    AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                      "    AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                      "    AND xcbbcomp='",tm.glaacomp,"' ",
#                      "    AND ",l_wc2,
#                      "    AND ",l_sql1,
#                      "    AND xcce007 = 'DL+OH+SUB'",
#                      "    AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
#                      "                        AND sfaa057 = '2') ",
#                      " GROUP BY xcce010 ",
#                      " ORDER BY xcce010 "
#190716-00012#1 --end           
#            LET l_sql="SELECT curr,SUM(amt),SUM(amt2),SUM(amt3),SUM(amt4),SUM(amt5),SUM(amt6),SUM(amt7),SUM(amt8),SUM(amt9) ", 
#                      "  FROM (",
#                      "         (SELECT xccd011 curr,SUM(xccd902a) amt,SUM(xccd902b) amt2,SUM(xccd902c) amt3,SUM(xccd902d) amt4,SUM(xccd902e) amt5,SUM(xccd902f) amt6,SUM(xccd902g) amt7,SUM(xccd902h) amt8,",
#                      "                              SUM(xccd902) amt9 ",     
#                      "            FROM xccd_t,xcbb_t ",
#                      "           WHERE xccdent=xcbbent AND xccd004=xcbb001 AND xccd005=xcbb002 AND xccd007=xcbb003 ",
#                      "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
#                      "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
#                      "             AND xcbbcomp='",tm.glaacomp,"' ",
#                      "             AND ",l_wc2,
#                      "             AND ",l_sql1,
#                      "             AND xccd006 IN (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = ",g_enterprise,
#                      "                                 AND sfaa057 = '2') ",
#                      "           GROUP BY xccd011 ",
#                      "         )",
#                      "       ) ",
#                      " GROUP BY curr ",
#                      " ORDER BY curr "
#190315-00009#1 --end      
         PREPARE aglq510_sel_xccc_pr3 FROM l_sql
         DECLARE aglq510_sel_xccc_cs3 CURSOR FOR aglq510_sel_xccc_pr3
         
#190313-00030#1 --begin
         LET l_glar009 = NULL
         LET l_amt  = 0
         LET l_amt2 = 0
         LET l_amt3 = 0
         LET l_amt4 = 0
         LET l_amt5 = 0
         LET l_amt6 = 0
         LET l_amt7 = 0
         LET l_amt8 = 0   
         LET l_amt9 = 0      
#190313-00030#1 --end
 
         FOREACH aglq510_sel_xccc_cs3 INTO l_glar009,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6,l_amt7,l_amt8     #,l_amt9  #190315-00009#1 remove l_amt9   #170711-00051#1 add l_amt9 lujh  
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH aglq510_sel_xccc_cs3'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
#190613-00046#1 --begin  mark            
#190315-00009#1 --begin       
            LET l_amt = 0        
            #币种将单独抓取的xcce902和xcci902的金额给l_amt
#            FOR l_i=1 TO l_xcce.getLength() 
#               IF l_xcce[l_i].xcce010=l_glar009 THEN
#                  LET l_amt= l_xcce[l_i].xcce902
#               END IF 
#            END FOR
#190315-00009#1 --end 
#190613-00046#1 --end           
            IF cl_null(l_amt) THEN LET l_amt = 0 END IF
            IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
            IF cl_null(l_amt3) THEN LET l_amt3 = 0 END IF
            IF cl_null(l_amt4) THEN LET l_amt4 = 0 END IF
            IF cl_null(l_amt5) THEN LET l_amt5 = 0 END IF
            IF cl_null(l_amt6) THEN LET l_amt6 = 0 END IF
            IF cl_null(l_amt7) THEN LET l_amt7 = 0 END IF
            IF cl_null(l_amt8) THEN LET l_amt8 = 0 END IF
            IF cl_null(l_amt9) THEN LET l_amt9 = 0 END IF  

            #系统别:5.成本
            LET l_sys = '5' 

#190613-00046#1 --begin mark
#            IF l_sfin6014 = '3' THEN
##               LET l_amt = l_amt9     #190315-00009#1 mark
#               LET l_amt2 = 0
#               LET l_amt3 = 0
#               LET l_amt4 = 0
#               LET l_amt5 = 0
#               LET l_amt6 = 0
#               LET l_amt7 = 0
#               LET l_amt8 = 0
#               
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF
#            ELSE
#               #插入临时表
#               #暂用diff字段存储成本分群，用于后续抓取子系统金额
#考虑会有当月发料下月入库的，原材料放到前面单独计算，跨月入库的，这里捞不到人工制费，但材料费要在上面先捞到
#               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
#               VALUES(l_sys,l_glar001,l_glar009,l_amt,l_glcc011)
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = 'insert'
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  LET l_success = FALSE
#               END IF            
#190613-00046#1 --end            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_2,l_glar009,l_amt2,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert2'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_3,l_glar009,l_amt3,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF          
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_4,l_glar009,l_amt4,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert4'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_5,l_glar009,l_amt5,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_6,l_glar009,l_amt6,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert6'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF            
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_7,l_glar009,l_amt7,l_glcc011)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert7'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF   
               
               INSERT INTO aglq510_tmp(sys,glar001,glar009,samt,diff)
               VALUES(l_sys,l_glar001_8,l_glar009,l_amt8,l_glcc011) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'insert8'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
               END IF 
#            END IF    #190613-00046#1 mark     
         END FOREACH
      END FOREACH  
      #170711-00051#1--add--str--lujh  
      
#161209-00052#1 add e---      
      #3)汇总临时表中第二步存入的成本金额，按照科目+币别汇总金额，同时抓取总账金额，进行比较差异
      #  将比较结果及金额，插入到临时表，此时glarent=g_enterprise用于显示在单身，固资系统勾稽的最终数据
      LET l_sql="SELECT glar001,glar009,SUM(samt) ",
                "  FROM aglq510_tmp ",
                " WHERE glarent IS NULL AND sys='5'",
                " GROUP BY glar001,glar009 ",
                " ORDER BY glar001,glar009 "
      PREPARE aglq510_sel_tmp_pr1 FROM l_sql
      DECLARE aglq510_sel_tmp_cs1 CURSOR FOR aglq510_sel_tmp_pr1
      FOREACH aglq510_sel_tmp_cs1 INTO l_glar001,l_glar009,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_tmp_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #科目说明
         LET l_glar001_desc = ''
         CALL s_desc_get_account_desc(tm.glaald,l_glar001) RETURNING l_glar001_desc
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         #原币金额 = 本币金额
         LET l_xrea103 = l_xrea113
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         IF g_glaa121 = 'Y' THEN
            #170324-00097#1 mark-----s
            ##固资中分录底稿金额 = 子系统金额
            #LET l_glat103 = l_xrea103
            #LET l_glat113 = l_xrea113
            #170324-00097#1 mark-----e
            #170324-00097#1-----s
            EXECUTE sel_glatp3 USING l_glar001    
               INTO l_glat103,l_glat113
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
            IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
            IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
            #190709-00037#1---mark---str--
            #LET l_glar003 = NULL
            #LET l_glar003 = NULL
            #EXECUTE sel_glatp4 USING tm.glaald,tm.glar002,'XC'
            #                   INTO l_glar003
            #LET l_glar003 = l_glar003 - 1
            #LET l_glar00522 = NULL
            #EXECUTE sel_glarp3 USING g_enterprise,tm.glaald,l_glar001,tm.glar002,l_glar003
            #   INTO l_glar00522
            #IF cl_null(l_glar00522)THEN LET l_glar00522 = 0 END IF
            #
            #LET l_glat103 = l_glat103 + l_glar00522
            #LET l_glat113 = l_glat113 + l_glar00522
            #190709-00037#1---mark---end--
            #170324-00097#1-----e
         END IF
         
         #161217-00001#1 mod s---
         #抓取总账余额
         #EXECUTE aglq510_sel_glar_pr1 USING l_glar001,l_glar009
         #                             INTO l_glar010,l_glar005
         EXECUTE aglq510_sel_glar_pr2 USING l_glar001
                                      INTO l_glar010,l_glar005                                      
         #161217-00001#1 mod e---                              
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glar_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         IF cl_null(l_glar010) THEN LET l_glar010 = 0 END IF
         IF cl_null(l_glar005) THEN LET l_glar005 = 0 END IF
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
         IF l_glac008 = '2' THEN
            LET l_glar010 = l_glar010 * -1
            LET l_glar005 = l_glar005 * -1
         END IF
         
         #进行金额比较
         #当启用分录底稿
         IF g_glaa121 = 'Y' THEN
            IF l_xrea103 = l_glat103 AND l_xrea103 = l_glar010 AND
               l_xrea113 = l_glat113 AND l_xrea113 = l_glar005 THEN
               LET l_diff = '0'  #0.子系统、底稿、总账均无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 = l_glar010 AND l_xrea113 = l_glar005) THEN
               LET l_diff = '1'  #1.子系统与底稿有差异与总账无差异
            END IF
            
            IF (l_xrea103 = l_glat103 AND l_xrea113 = l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) THEN
               LET l_diff = '2'  #2.子系统与底稿无差异与总账有差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 = l_glar010 AND l_glat113 = l_glar005)THEN
               LET l_diff = '3'  #3.子系统与底稿有差异与总账有差异，底稿与总账无差异
            END IF
            
            IF (l_xrea103 <> l_glat103 OR l_xrea113 <> l_glat113) AND
               (l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005) AND 
               (l_glat103 <> l_glar010 OR l_glat113 <> l_glar005)THEN
               LET l_diff = '4'  #4.子系统、底稿、总账均有差异
            END IF
         ELSE
         #未启用分录底稿时，只需比较子系统与总账余额差异
            IF l_xrea103 <> l_glar010 OR l_xrea113 <> l_glar005 THEN
               LET l_diff = '6'  #6.子系统与总账有差异
            ELSE
               LET l_diff = '5'  #5.子系统与总账无差异
            END IF            
         END IF
         
         #核对结果
         IF l_diff = '0' OR l_diff = '5' THEN
            LET l_result = '0' #0.核对OK
         ELSE
            LET l_result = '1' #1.核对有误
         END IF
     
         #系统别:5.成本
         LET l_sys = '5' 
         
         #插入临时表
         INSERT INTO aglq510_tmp(glarent,sys,glar001,glar001_desc,glar009,
                                 soamt,doamt,zoamt,samt,damt,zamt,diff,result)
         VALUES(g_enterprise,l_sys,l_glar001,l_glar001_desc,l_glar009,
                l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005,l_diff,l_result)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'insert'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
         END IF
         #190516-00019#1 add -s
         #有误时存入差异页签
         IF l_result = '1' THEN
            #插入临时表
            INSERT INTO aglq510_tmp02(sys6,glar001,glar001_desc,glar009,
                                      soamt5,doamt5,zoamt5,samt5,damt5,zamt5)
            VALUES(l_sys,l_glar001,l_glar001_desc,l_glar009,
                   l_xrea103,l_glat103,l_glar010,l_xrea113,l_glat113,l_glar005)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'insert'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
            END IF
         END IF
         #190516-00019#1 add -e
      END FOREACH
   END IF
   
   #检查投融资系统
   IF tm.chk_fm='Y' THEN
   END IF
   CALL cl_err_collect_show()
END FUNCTION

################################################################################
# Descriptions...: 分录底稿与总账差异
# Memo...........:
# Usage..........: CALL aglq510_b_fill3()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/12/31 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill3()
   DEFINE l_sql               STRING
   DEFINE l_i                 LIKE type_t.num10 #170217-00036#1 mod num5-->num10
   DEFINE l_sys               LIKE type_t.chr10     #系统别
   DEFINE l_glar001           LIKE glar_t.glar001   #科目
   DEFINE l_glar001_desc      LIKE glacl_t.glacl004 #科目说明
   DEFINE l_glar009           LIKE glar_t.glar009   #币别
   DEFINE l_glga100           LIKE glga_t.glga100   #系统别
   DEFINE l_glgadocno         LIKE glga_t.glgadocno #业务单号
   DEFINE l_glgadocdt         LIKE glga_t.glgadocdt #业务单日期
   DEFINE l_glgastus          LIKE glga_t.glgastus  #分录底稿状态
   DEFINE l_glga007           LIKE glga_t.glga007   #分录底稿凭证号
   DEFINE l_doamt             LIKE glgb_t.glgb003   #分录底稿原币余额
   DEFINE l_damt              LIKE glgb_t.glgb003   #分录底稿本币余额
   DEFINE l_glapdocno         LIKE glap_t.glapdocno #总账凭证号
   DEFINE l_glapdocdt         LIKE glap_t.glapdocdt #凭证日期
   DEFINE l_glapstus          LIKE glap_t.glapstus  #凭证状态
   DEFINE l_zoamt             LIKE glaq_t.glaq003   #总账原币余额
   DEFINE l_zamt              LIKE glaq_t.glaq003   #总账本币余额
   DEFINE l_diff3             LIKE glaq_t.glaq003   #原币差额
   DEFINE l_diff4             LIKE glaq_t.glaq003   #本币差额
   DEFINE l_cnt               LIKE type_t.num5
   DEFINE l_sdate             LIKE glga_t.glgadocdt
   DEFINE l_edate             LIKE glga_t.glgadocdt
   DEFINE l_glac008           LIKE glac_t.glac008
   
   CALL g_glar3_d.clear()
   LET l_i=0
   
   #该年第一天
   SELECT MIN(glav004) INTO l_sdate FROM glav_t
    WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002
   #该期最会一天
   SELECT MAX(glav004) INTO l_edate 
     FROM glav_t
    WHERE glavent=g_enterprise AND glav001=g_glaa003 
      AND glav002=tm.glar002 AND glav006=tm.glar003
      
   #1）遍历临时表中科目+币别
   LET l_sql="SELECT DISTINCT sys,glar001,glar009 ",
             "  FROM aglq510_tmp ",
             " WHERE diff IN ('1','2','4')",
             " ORDER BY sys,glar001,glar009"
   PREPARE aglq510_sel_tmp_pr FROM l_sql
   DECLARE aglq510_sel_tmp_cs CURSOR FOR aglq510_sel_tmp_pr
   
   #2）抓取分录底稿资料：此业务分录底稿没有抛转产生总账凭证;
   LET l_sql="SELECT glgadocno,glgadocdt,glgastus,",
             "       SUM(CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END),",
             "       SUM(glgb003-glgb004) ",
             "  FROM glga_t,glgb_t ",
             " WHERE glgaent=glgbent AND glgald=glgbld AND glgadocno=glgbdocno ",
             "   AND glgaent=",g_enterprise," AND glgald='",tm.glaald,"'",
             "   AND glgadocdt BETWEEN '",l_sdate,"' AND '",l_edate,"'",
             "   AND glga007 IS NULL ",
             "   AND glgastus <> 'X' ",  #161222-00037#1 add lujh
             "   AND glga100=? AND glgb002=? AND glgb005=? ",
             " GROUP BY glgadocno,glgadocdt,glgastus ",
             " ORDER BY glgadocno,glgadocdt,glgastus"
   PREPARE aglq510_sel_glga_pr FROM l_sql
   DECLARE aglq510_sel_glga_cs CURSOR FOR aglq510_sel_glga_pr
   
   #3）抓取分录底稿资料：此业务分录底稿抛转产生总账凭证;
   LET l_sql="SELECT glga007,",
             "       SUM(CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END),",
             "       SUM(glgb003-glgb004) ",
             "  FROM glga_t,glgb_t ",
             " WHERE glgaent=glgbent AND glgald=glgbld AND glgadocno=glgbdocno ",
             "   AND glgaent=",g_enterprise," AND glgald='",tm.glaald,"'",
             "   AND glgadocdt BETWEEN '",l_sdate,"' AND '",l_edate,"'",
             "   AND glga007 IS NOT NULL ",
             "   AND glgastus <> 'X' ",  #161222-00037#1 add lujh
             "   AND glga100=? AND glgb002=? AND glgb005=? ",
             " GROUP BY glga007 ",
             " ORDER BY glga007"
   PREPARE aglq510_sel_glga_pr1 FROM l_sql
   DECLARE aglq510_sel_glga_cs1 CURSOR FOR aglq510_sel_glga_pr1
   
   #4）无分录底稿资料，抓取凭证资料
   LET l_sql="SELECT glapdocno,glapdocdt,glapstus,",
             "       SUM(CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END),",
             "       SUM(glaq003-glaq004) ",
             "  FROM glap_t,glaq_t ",
             " WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
             "   AND glapent=",g_enterprise," AND glapld='",tm.glaald,"'",
             "   AND glap002=",tm.glar002," AND glap004<=",tm.glar003,
             "   AND glapdocno NOT IN (SELECT DISTINCT glga007 FROM glga_t ",
             "                          WHERE glgaent=",g_enterprise," AND glgald='",tm.glaald,"'",
             "                            AND glgadocdt BETWEEN '",l_sdate,"' AND '",l_edate,"'",
             "                         )",
             "   AND glap007=? AND glaq002=? AND glaq005=? ",
             " GROUP BY glapdocno,glapdocdt,glapstus ",
             " ORDER BY glapdocno,glapdocdt,glapstus"
   PREPARE aglq510_sel_glap_pr FROM l_sql
   DECLARE aglq510_sel_glap_cs CURSOR FOR aglq510_sel_glap_pr
   
   #1）遍历临时表中科目+币别
   FOREACH aglq510_sel_tmp_cs INTO l_sys,l_glar001,l_glar009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH aglq510_sel_tmp_cs'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      CASE l_sys
         WHEN '1' LET l_glga100 = 'AR' 
         WHEN '2' LET l_glga100 = 'AP' 
         WHEN '3' LET l_glga100 = 'FA' 
         WHEN '4' LET l_glga100 = 'NM' 
         WHEN '5' LET l_glga100 = 'XC' 
         WHEN '6' LET l_glga100 = 'FM' 
      END CASE
      
      #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
      SELECT glac008 INTO l_glac008 FROM glac_t 
       WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_glar001
      
      #2）抓取分录底稿资料：业务分录底稿没有抛转产生总账凭证;
      FOREACH aglq510_sel_glga_cs USING l_glga100,l_glar001,l_glar009
                                  INTO l_glgadocno,l_glgadocdt,l_glgastus,l_doamt,l_damt
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glga_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF cl_null(l_doamt) THEN LET l_doamt = 0 END IF
         IF cl_null(l_damt) THEN LET l_damt = 0 END IF
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         IF l_glac008 = '2' THEN
            LET l_doamt = l_doamt * -1
            LET l_damt = l_damt * -1
         END IF
         
         #3)分析差异原因
         #a.底稿凭证号码为空的且底稿未审核的金额
         #b.底稿凭证号码为空的且底稿审核的金额
         LET l_i = l_i + 1
         LET g_glar3_d[l_i].sys3 = l_sys
         LET g_glar3_d[l_i].glgadocno = l_glgadocno
         LET g_glar3_d[l_i].glgadocdt = l_glgadocdt
         LET g_glar3_d[l_i].glgastus = l_glgastus
         LET g_glar3_d[l_i].glapdocno = ''
         LET g_glar3_d[l_i].glapdocdt = NULL
         LET g_glar3_d[l_i].glapstus = NULL
         LET g_glar3_d[l_i].glgb002 = l_glar001
         LET g_glar3_d[l_i].glgb002_desc = s_desc_get_account_desc(tm.glaald,g_glar3_d[l_i].glgb002 )
         LET g_glar3_d[l_i].glgb005 = l_glar009
         LET g_glar3_d[l_i].damt3 = l_doamt
         LET g_glar3_d[l_i].zamt3 = 0
         LET g_glar3_d[l_i].diff3 = g_glar3_d[l_i].damt3 - g_glar3_d[l_i].zamt3
         LET g_glar3_d[l_i].damt4 = l_damt
         LET g_glar3_d[l_i].zamt4 = 0
         LET g_glar3_d[l_i].diff4 = g_glar3_d[l_i].damt4 - g_glar3_d[l_i].zamt4
      END FOREACH
      
      #3）抓取分录底稿资料：此业务分录底稿抛转产生总账凭证;
      FOREACH aglq510_sel_glga_cs1 USING l_glga100,l_glar001,l_glar009
                                  INTO l_glga007,l_doamt,l_damt
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glga_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF cl_null(l_doamt) THEN LET l_doamt = 0 END IF
         IF cl_null(l_damt) THEN LET l_damt = 0 END IF
         
         #3)分析差异原因
         #c)底稿凭证号码不为空的但该凭证号在总账未审核的金额
         #d)底稿凭证号码不为空的但该凭证号在总账已审核未国过账的金额
         #e)底稿凭证号码不为空的且该凭证号在总账已过账的但科目金额不一致的
         
         #通过底稿凭证号码抓取对应的总账凭证资料
         #凭证日期，凭证状态
         LET l_glapdocdt = ''
         LET l_glapstus = ''
         SELECT glapdocdt,glapstus INTO l_glapdocdt,l_glapstus
           FROM glap_t
          WHERE glapent=g_enterprise AND glapld=tm.glaald AND glapdocno=l_glga007
         #凭证原币余额，凭证本币余额 
         LET l_zoamt = 0
         LET l_zamt = 0
         SELECT SUM(CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END),SUM(glaq003-glaq004)
           INTO l_zoamt,l_zamt
           FROM glaq_t
          WHERE glaqent=g_enterprise AND glaqld=tm.glaald AND glaqdocno=l_glga007
            AND glaq002=l_glar001 AND glaq005=l_glar009 
         IF cl_null(l_zoamt) THEN LET l_zoamt = 0 END IF
         IF cl_null(l_zamt) THEN LET l_zamt = 0 END IF
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         IF l_glac008 = '2' THEN
            LET l_doamt = l_doamt * -1
            LET l_damt = l_damt * -1
            LET l_zoamt = l_zoamt * -1
            LET l_zamt = l_zamt * -1
         END IF
         
         #差额 = 分录底稿余额 - 总账余额
         LET l_diff3 = l_doamt - l_zoamt
         LET l_diff4 = l_damt - l_zamt
         #底稿与总账无差异时不写入单身
        #IF l_glgastus = 'Y' AND l_glapstus = 'S' AND l_diff3 = 0 AND l_diff4 = 0 THEN   #161124-00078#1 Mark
         IF l_glapstus = 'S' AND l_diff3 = 0 AND l_diff4 = 0 THEN   #161124-00078#1 Add
            CONTINUE FOREACH
         ELSE
            #判断总账凭着编号对应几张业务底稿编号，如果对应一张，查询出业务底稿单据编号+单据日期+单据状态，如果对应多张，单据编号=MULTI
            LET l_cnt = 0
            SELECT COUNT(*) INTO l_cnt FROM glga_t
             WHERE glgaent=g_enterprise AND glgald=tm.glaald AND glga007=l_glga007
            IF l_cnt = 1 THEN
               #抓取业务分录底稿编号+单据日期+单据状态
               SELECT glgadocno,glgadocdt,glgastus INTO l_glgadocno,l_glgadocdt,l_glgastus
                 FROM glga_t
                WHERE glgaent=g_enterprise AND glgald=tm.glaald AND glga007=l_glga007
            ELSE
               LET l_glgadocno = 'MULTI'
               LET l_glgadocdt = NULL
               LET l_glgastus  = NULL
            END IF
            LET l_i = l_i + 1
            LET g_glar3_d[l_i].sys3 = l_sys
            LET g_glar3_d[l_i].glgadocno = l_glgadocno
            LET g_glar3_d[l_i].glgadocdt = l_glgadocdt
            LET g_glar3_d[l_i].glgastus = l_glgastus
            LET g_glar3_d[l_i].glapdocno = l_glga007
            LET g_glar3_d[l_i].glapdocdt = l_glapdocdt
            LET g_glar3_d[l_i].glapstus = l_glapstus
            LET g_glar3_d[l_i].glgb002 = l_glar001
            LET g_glar3_d[l_i].glgb002_desc = s_desc_get_account_desc(tm.glaald,g_glar3_d[l_i].glgb002 )
            LET g_glar3_d[l_i].glgb005 = l_glar009
            LET g_glar3_d[l_i].damt3 = l_doamt
            LET g_glar3_d[l_i].zamt3 = l_zoamt
            LET g_glar3_d[l_i].diff3 = l_diff3
            LET g_glar3_d[l_i].damt4 = l_damt
            LET g_glar3_d[l_i].zamt4 = l_zamt
            LET g_glar3_d[l_i].diff4 = l_diff4
         END IF
      END FOREACH
      
      #4)分析差异原因
      #f.没有底稿但有总账凭证的
      FOREACH aglq510_sel_glap_cs USING l_glga100,l_glar001,l_glar009
                                   INTO l_glapdocno,l_glapdocdt,l_glapstus,l_zoamt,l_zamt
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_sel_glap_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF cl_null(l_zoamt) THEN LET l_zoamt = 0 END IF
         IF cl_null(l_zamt) THEN LET l_zamt = 0 END IF
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         IF l_glac008 = '2' THEN
            LET l_zoamt = l_zoamt * -1
            LET l_zamt = l_zamt * -1
         END IF
         
         LET l_i = l_i + 1
         LET g_glar3_d[l_i].sys3 = l_sys
         LET g_glar3_d[l_i].glgadocno = ''
         LET g_glar3_d[l_i].glgadocdt = ''
         LET g_glar3_d[l_i].glgastus = ''
         LET g_glar3_d[l_i].glapdocno = l_glapdocno
         LET g_glar3_d[l_i].glapdocdt = l_glapdocdt
         LET g_glar3_d[l_i].glapstus = l_glapstus
         LET g_glar3_d[l_i].glgb002 = l_glar001
         LET g_glar3_d[l_i].glgb002_desc = s_desc_get_account_desc(tm.glaald,g_glar3_d[l_i].glgb002 )
         LET g_glar3_d[l_i].glgb005 = l_glar009
         LET g_glar3_d[l_i].damt3 = 0
         LET g_glar3_d[l_i].zamt3 = l_zoamt
         LET g_glar3_d[l_i].diff3 = g_glar3_d[l_i].damt3 - g_glar3_d[l_i].zamt3
         LET g_glar3_d[l_i].damt4 = 0
         LET g_glar3_d[l_i].zamt4 = l_zamt
         LET g_glar3_d[l_i].diff4 = g_glar3_d[l_i].damt4 - g_glar3_d[l_i].zamt4
      END FOREACH
   END FOREACH
END FUNCTION

################################################################################
# Descriptions...: 子系统与分录底稿差异
# Memo...........:
# Usage..........: CALL aglq510_b_fill2()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/12/31 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill2()
   DEFINE l_sql               STRING
   DEFINE l_i                 LIKE type_t.num10   #170217-00036#1 mod num5-->num10
   DEFINE l_xrea009           LIKE xrea_t.xrea009   #账款客户
   DEFINE l_xrea003           LIKE xrea_t.xrea003   #系统别
   DEFINE l_xrea019           LIKE xrea_t.xrea019   #科目
   DEFINE l_xrea100           LIKE xrea_t.xrea100   #币别
   DEFINE l_xrea103           LIKE xrea_t.xrea103   #子系统原币余额
   DEFINE l_xrea113           LIKE xrea_t.xrea113   #子系统本币余额
   DEFINE l_sys               LIKE type_t.chr10     #系统别
   DEFINE l_glat103           LIKE glat_t.glat103   #底稿原币余额
   DEFINE l_glat113           LIKE glat_t.glat113   #底稿本币余额
   DEFINE l_diff1             LIKE glat_t.glat103   #原币差异金额
   DEFINE l_diff2             LIKE glat_t.glat103   #本币差异金额
   DEFINE l_glac008           LIKE glac_t.glac008
   #170217-00036#1--add--str--
   DEFINE l_xrea003_t         LIKE xrea_t.xrea003   #系统别
   DEFINE l_glat103_t         LIKE glat_t.glat103   #底稿原币余额
   DEFINE l_glat113_t         LIKE glat_t.glat113   #底稿本币余额
   #170217-00036#1--add--end
   
   CALL g_glar2_d.clear()
   LET l_i=0
   #抓取底稿余额
   LET l_sql="SELECT SUM(glat103-glat104),SUM(glat113-glat114) ",
             "  FROM glat_t ",
             " WHERE glatent=",g_enterprise," AND glatld='",tm.glaald,"'",
             "   AND glat001=",tm.glar002," AND glat002<=",tm.glar003,
             "   AND glat003=? AND glat005=? AND glat007=? AND glat100=? "
   PREPARE aglq510_b_fill2_glat_pr1 FROM l_sql
   
   #检查应收&应付系统
   IF tm.chk_ar = 'Y' OR tm.chk_ap = 'Y' THEN
      #160728-00003#1--mod--str--
#      LET l_sql="SELECT sys,xrea003,xrea009,xrea019,xrea100,SUM(xrea103),SUM(xrea113)",
      LET l_sql="SELECT sys,xrea003,xrea009,xrea019,xrea100,",
   #             "       SUM(CASE WHEN xrea004 LIKE '2%' THEN xrea103*-1 ELSE xrea103 END),", #170302-00027#1 mark
   #             "       SUM(CASE WHEN xrea004 LIKE '2%' THEN xrea113*-1 ELSE xrea113 END) ", #170302-00027#1 mark
                #"       SUM(CASE WHEN xrea004 LIKE '2%' THEN (xrea103-xrea107)*-1 ELSE (xrea103-xrea107) END),", #170302-00027#1 add   #170509-00045#1 mark lujh
                #"       SUM(CASE WHEN xrea004 LIKE '2%' THEN (xrea113-xrea117)*-1 ELSE (xrea113-xrea117) END) ", #170302-00027#1 add   #170509-00045#1 mark lujh
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea103-xrea107)*-1 ELSE (xrea103-xrea107) END),",  #170509-00045#1 add lujh 
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea113-xrea117)*-1 ELSE (xrea113-xrea117) END) ",  #170509-00045#1 add lujh 
      #160728-00003#1--mod--end
                "  FROM xrea_t,aglq510_tmp ",
                " WHERE xreaent=glarent AND xrea019=glar001 AND xrea100=glar009 ",
                "   AND xreaent=",g_enterprise," AND xreald='",tm.glaald,"'",
#                "   AND xrea001=",tm.glar002," AND xrea002<=",tm.glar003, #160728-00003#1 mark
                "   AND xrea001=",tm.glar002," AND xrea002 =",tm.glar003, #160728-00003#1 add
                "   AND ",g_wc3,
                "   AND sys IN ('1','2')",
                "   AND diff IN ('1','3','4')",
                " GROUP BY sys,xrea003,xrea009,xrea019,xrea100 ",
                " ORDER BY sys,xrea003,xrea009,xrea019,xrea100 "
      PREPARE aglq510_b_fill2_xrea_pr1 FROM l_sql
      DECLARE aglq510_b_fill2_xrea_cs1 CURSOR FOR aglq510_b_fill2_xrea_pr1
      FOREACH aglq510_b_fill2_xrea_cs1 INTO l_sys,l_xrea003,l_xrea009,l_xrea019,l_xrea100,l_xrea103,l_xrea113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_b_fill2_xrea_cs1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         IF cl_null(l_xrea103) THEN LET l_xrea103 = 0 END IF
         IF cl_null(l_xrea113) THEN LET l_xrea113 = 0 END IF
         
         #当该账套启用分录底稿时，计算分录底稿余额，分别与子系统、总账进行比较
         EXECUTE aglq510_b_fill2_glat_pr1 USING l_xrea003,l_xrea009,l_xrea019,l_xrea100
                                          INTO l_glat103,l_glat113
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_sel_glat_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
         END IF
         IF cl_null(l_glat103) THEN LET l_glat103 = 0 END IF
         IF cl_null(l_glat113) THEN LET l_glat113 = 0 END IF
         
         #170217-00036#1--add--str--
         #AP/AR模組顯示時: 取底稿金額時, 同時取AR/AP的相同科目作合計
         IF l_xrea003='AR' THEN
            LET l_xrea003_t='AP'
         ELSE
            LET l_xrea003_t='AR'
         END IF
         EXECUTE aglq510_b_fill2_glat_pr1 USING l_xrea003_t,l_xrea009,l_xrea019,l_xrea100
                                          INTO l_glat103_t,l_glat113_t
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'EXE aglq510_b_fill2_glat_pr1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
         END IF
         IF cl_null(l_glat103_t) THEN LET l_glat103_t = 0 END IF
         IF cl_null(l_glat113_t) THEN LET l_glat113_t = 0 END IF
         LET l_glat103 = l_glat103 + l_glat103_t
         LET l_glat113 = l_glat113 + l_glat113_t
         #170217-00036#1--add--end
         
         #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
         SELECT glac008 INTO l_glac008 FROM glac_t 
          WHERE glacent=g_enterprise AND glac001=g_glaa004 AND glac002=l_xrea019
         IF l_glac008 = '2' THEN
            LET l_glat103 = l_glat103 * -1
            LET l_glat113 = l_glat113 * -1
         END IF
         
         #进行金额比较，当子系统金额与分录底稿金额不等时，写入单身二b_fill2
         LET l_diff1 = l_xrea103 - l_glat103
         LET l_diff2 = l_xrea113 - l_glat113
         IF l_diff1 <> 0 OR l_diff2 <> 0 THEN
            LET l_i = l_i + 1
            
            LET g_glar2_d[l_i].sys2 = l_sys  #系统别
            LET g_glar2_d[l_i].xrea009 = l_xrea009
            #账款对象说明
            CALL s_desc_get_trading_partner_abbr_desc(g_glar2_d[l_i].xrea009) RETURNING g_glar2_d[l_i].xrea009_desc
            LET g_glar2_d[l_i].xrea019 = l_xrea019
            #科目说明
            CALL s_desc_get_account_desc(tm.glaald,g_glar2_d[l_i].xrea019 ) RETURNING g_glar2_d[l_i].xrea019_desc
            LET g_glar2_d[l_i].xrea100 = l_xrea100
            LET g_glar2_d[l_i].samt1 = l_xrea103
            LET g_glar2_d[l_i].damt1 = l_glat103
            LET g_glar2_d[l_i].diff1 = l_diff1
            LET g_glar2_d[l_i].samt2 = l_xrea113
            LET g_glar2_d[l_i].damt2 = l_glat113
            LET g_glar2_d[l_i].diff2 = l_diff2
         END IF
      END FOREACH
   END IF
   
   #固资系统，资金系统，成本系统，投融资系统
   #因规格中分录底稿金额 = 子系统金额，故不存在差异
END FUNCTION

################################################################################
# Descriptions...: 子系统与总账差异
# Memo...........:
# Usage..........: CALL aglq510_b_fill4()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/12/31 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill4()
   DEFINE l_sql               STRING
   DEFINE l_sql1              STRING
   DEFINE l_wc                STRING
   DEFINE l_i                 LIKE type_t.num10 #170217-00036#1 mod num5-->num10
   DEFINE l_glar001           LIKE glar_t.glar001
   DEFINE l_glar009           LIKE glar_t.glar009
   DEFINE l_glcc011           LIKE glcc_t.glcc011
   DEFINE l_seq               LIKE type_t.num5
   DEFINE l_cnt               LIKE type_t.num5  #180213-00012#1 add
   DEFINE l_glcc016           LIKE glcc_t.glcc016  #180319-00029#1---add
   #181228-00020#1---add----str
   DEFINE l_success           LIKE type_t.num5 
   DEFINE l_slip              LIKE ooba_t.ooba002 
   DEFINE l_oobx004           LIKE oobx_t.oobx004
   DEFINE l_xrca038           LIKE xrca_t.xrca038 
   DEFINE l_xrca018           LIKE xrca_t.xrca018 
   #181228-00020#1---add----end
   ##181204-00026#9 ---s---
   DEFINE l_apca057          LIKE  apca_t.apca057
   DEFINE l_apca057_desc     LIKE type_t.chr100
   ##181204-00026#9 ---e---
   
   CALL g_glar4_d.clear()
   LET l_i=1
   
   #应收应付系统
   IF tm.chk_ar = 'Y' OR tm.chk_ap = 'Y' THEN
      #171212-00013#1 add s---
      LET l_sql="SELECT glapdocno,glapdocdt ",
                "  FROM glap_t,glaq_t ",
                " WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
                "   AND glapent=",g_enterprise," AND glapld='",tm.glaald,"'",
                "   AND glapstus <> 'X' ",   
                "   AND glapdocno=(SELECT xrca038 FROM xrca_t WHERE xrcaent = ",g_enterprise," AND xrcadocno = ? AND xrcald = '",tm.glaald,"')"
                #180622-00050#1 add-s
                ," UNION ",
                "SELECT glapdocno,glapdocdt ",
                "  FROM glap_t,glaq_t ",
                " WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
                "   AND glapent=",g_enterprise," AND glapld='",tm.glaald,"'",
                "   AND glapstus <> 'X' ",   
                "   AND glapdocno=(SELECT apca038 FROM apca_t WHERE apcaent = ",g_enterprise," AND apcadocno = ? AND apcald = '",tm.glaald,"')"
                #180622-00050#1 add-e
      PREPARE aglq510_sel_glap_pr1 FROM l_sql
      DECLARE aglq510_sel_glap_cs1 CURSOR FOR aglq510_sel_glap_pr1         
      #171212-00013#1 add e---   
      #160728-00003#1--mod--str--
#      LET l_sql="SELECT sys,xrea005,xrea008,xrea009,xrea019,xrea100,SUM(xrea103),SUM(xrea113) ",
      LET l_sql="SELECT sys,xrea005,xrea008,xrea009,xrea019,xrea100,",
#                "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN xrea103*-1 ELSE xrea103 END),",   #161208-00011#1 add OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' lujh   #170302-00027#1 mark
#                "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN xrea113*-1 ELSE xrea113 END) ",   #161208-00011#1 add OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' lujh   #170302-00027#1 mark
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea103-xrea107)*-1 ELSE (xrea103-xrea107) END),",   #170302-00027#1 add
                 "       SUM(CASE WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR xrea004 = '06' THEN (xrea113-xrea117)*-1 ELSE (xrea113-xrea117) END) ",   #170302-00027#1 add                 
      #160728-00003#1--mod--end
                "  FROM xrea_t,aglq510_tmp ",
                " WHERE xreaent=glarent AND xrea019=glar001 AND xrea100=glar009 ",
                "   AND xreaent=",g_enterprise," AND xreald='",tm.glaald,"'",
#                "   AND xrea001=",tm.glar002," AND xrea002<=",tm.glar003, #160728-00003#1 mark
                "   AND xrea001=",tm.glar002," AND xrea002 =",tm.glar003,  #160728-00003#1 add
                "   AND ",g_wc3,
                "   AND sys IN ('1','2')",
                "   AND diff IN ('2','3','4','6')",
                " GROUP BY sys,xrea005,xrea008,xrea009,xrea019,xrea100 ", 
                " ORDER BY sys,xrea005,xrea008,xrea009,xrea019,xrea100 "
      PREPARE aglq510_b_fill4_xrea_pr FROM l_sql
      DECLARE aglq510_b_fill4_xrea_cs CURSOR FOR aglq510_b_fill4_xrea_pr
      FOREACH aglq510_b_fill4_xrea_cs INTO g_glar4_d[l_i].sys4,g_glar4_d[l_i].xrea005,g_glar4_d[l_i].xrea008,  
                                           g_glar4_d[l_i].xrea009,g_glar4_d[l_i].xrea019,g_glar4_d[l_i].xrea100,
                                           g_glar4_d[l_i].xrea103,g_glar4_d[l_i].xrea113 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_b_fill4_xrea_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         IF cl_null(g_glar4_d[l_i].xrea103) THEN LET g_glar4_d[l_i].xrea103 = 0 END IF
         IF cl_null(g_glar4_d[l_i].xrea113) THEN LET g_glar4_d[l_i].xrea113 = 0 END IF
         #账款对象说明
         CALL s_desc_get_trading_partner_abbr_desc(g_glar4_d[l_i].xrea009) RETURNING g_glar4_d[l_i].xrea009_4_desc
         ##181204-00026#9 ---s---
         IF g_glar4_d[l_i].xrea009 = 'EMPL' THEN
            #抓AP立帳單頭
            LET l_apca057 = NULL   
            SELECT apca057 INTO l_apca057 FROM apca_t
             WHERE apcaent = g_enterprise AND apcald = tm.glaald 
               AND apcadocno = g_glar4_d[l_i].xrea005
            IF cl_null(l_apca057)THEN
                #抓AR立帳單頭
                SELECT xrca057 INTO l_apca057 FROM xrca_t
                 WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                   AND xrcadocno = g_glar4_d[l_i].xrea005                   
            END IF
  
            CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
            
            IF cl_null(l_apca057_desc)THEN
               SELECT ooag011 INTO l_apca057_desc
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = l_apca057
            END IF
            IF NOT cl_null(l_apca057_desc)THEN
               LET g_glar4_d[l_i].xrea009_4_desc = l_apca057_desc 
               LET g_glar4_d[l_i].xrea009 = l_apca057
            END IF                
         END IF
         ##181204-00026#9 ----e---        
         #科目说明
         CALL s_desc_get_account_desc(tm.glaald,g_glar4_d[l_i].xrea019) RETURNING g_glar4_d[l_i].xrea019_4_desc
         #EXECUTE aglq510_sel_glap_cs1 USING g_glar4_d[l_i].xrea005 INTO g_glar4_d[l_i].glapdocno,g_glar4_d[l_i].glapdocdt #171212-00013#1  #180622-00050#1 mark
         EXECUTE aglq510_sel_glap_cs1 USING g_glar4_d[l_i].xrea005,g_glar4_d[l_i].xrea005 INTO g_glar4_d[l_i].glapdocno,g_glar4_d[l_i].glapdocdt  #180622-00050#1 add
         #181228-00020#1---add----str
         IF cl_null(g_glar4_d[l_i].glapdocno) THEN
            IF NOT cl_null(g_glar4_d[l_i].xrea005) THEN #190108-00068#1 add
               CALL s_aooi200_fin_get_slip(g_glar4_d[l_i].xrea005) RETURNING l_success,l_slip
               SELECT oobx004 INTO l_oobx004
                 FROM oobx_t
                WHERE oobxent = g_enterprise
                  AND oobx001 = l_slip
               
               IF l_oobx004 ='axrq343' THEN
                  SELECT xrca038,xrca018 INTO l_xrca038,l_xrca018
                    FROM xrca_t 
                   WHERE xrcaent = g_enterprise
                     AND xrcadocno = g_glar4_d[l_i].xrea005
                     AND xrcald = tm.glaald
               
                  IF cl_null(l_xrca038) THEN 
                     SELECT xrda014 INTO g_glar4_d[l_i].glapdocno FROM xrda_t
                      WHERE xrdadocno = l_xrca018
                        AND xrdaent = g_enterprise
                        AND xrdald = tm.glaald
                     SELECT glapdocdt INTO g_glar4_d[l_i].glapdocdt FROM glap_t
                      WHERE glapdocno = g_glar4_d[l_i].glapdocno
                        AND glapent = g_enterprise
                        AND glapld = tm.glaald
                  END IF 
               END IF
            END IF #190108-00068#1 add               
         END IF 
         #181228-00020#1---add----end
         
         LET  l_i = l_i + 1
      END FOREACH
   END IF
   
   #检查固资系统
   IF tm.chk_fa='Y' THEN
      LET l_sql="SELECT faan004,acc,faan010,SUM(amt) ",
                "  FROM (",
                #               财产编号/资产科目    /币别    /本币余额
                "        (SELECT faan004,faaj023 acc,faan010,SUM(faan014) amt ",
                "           FROM faan_t,faaj_t,aglq510_tmp ",
                "          WHERE faanent=faajent AND faanld=faajld ",
                "            AND faan003=faaj037 AND faan004=faaj001 AND faan005=faaj002",
                "            AND faanent=glarent AND faaj023=glar001 AND faan010=glar009",
                "            AND faanent=",g_enterprise," AND faanld='",tm.glaald,"'",
                "            AND faan001=",tm.glar002," AND faan002<=",tm.glar003, 
                "            AND sys ='3'",
                "            AND faan007 NOT IN ('5','6')  AND faaj048 <> '1' ",#170927-00026#2 xul add 
                "            AND diff IN ('2','3','4','6')",
                "          GROUP BY faan004,faaj023,faan010 )",
                "          UNION ",
                #                财产编号/累折科目    /币别   /本币余额
#                "        (SELECT faan004,faaj024 acc,faan010,SUM(faan018) amt ", #170210-00059#1 mark
                "        (SELECT faan004,faaj024 acc,faan010,SUM(CASE WHEN faaj023=faaj024 THEN faan018 *-1 ELSE faan018 END) amt ", #170210-00059#1 add
                "           FROM faan_t,faaj_t,aglq510_tmp ",
                "          WHERE faanent=faajent AND faanld=faajld ",
                "            AND faan003=faaj037 AND faan004=faaj001 AND faan005=faaj002",
                "            AND faanent=glarent AND faaj024=glar001 AND faan010=glar009",
                "            AND faanent=",g_enterprise," AND faanld='",tm.glaald,"'",
                "            AND faan001=",tm.glar002," AND faan002<=",tm.glar003, 
                "            AND sys ='3'",
                "            AND faan007 NOT IN ('5','6')  AND faaj048 <> '1' ",#170927-00026#2 xul add 
                "            AND diff IN ('2','3','4','6')",
                "          GROUP BY faan004,faaj024,faan010 )",
                "       )",
                " GROUP BY faan004,acc,faan010 ",
                " ORDER BY faan004,acc,faan010 "
     
      PREPARE aglq510_b_fill4_faan_pr FROM l_sql
      DECLARE aglq510_b_fill4_faan_cs CURSOR FOR aglq510_b_fill4_faan_pr
      FOREACH aglq510_b_fill4_faan_cs INTO g_glar4_d[l_i].xrea005,g_glar4_d[l_i].xrea019,g_glar4_d[l_i].xrea100,
                                           g_glar4_d[l_i].xrea113 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_b_fill4_faan_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET g_glar4_d[l_i].sys4 = '3'
         IF cl_null(g_glar4_d[l_i].xrea113) THEN LET g_glar4_d[l_i].xrea113 = 0 END IF
         LET g_glar4_d[l_i].xrea103 = g_glar4_d[l_i].xrea113
         #科目说明
         CALL s_desc_get_account_desc(tm.glaald,g_glar4_d[l_i].xrea019) RETURNING g_glar4_d[l_i].xrea019_4_desc
         LET  l_i = l_i + 1
      END FOREACH
   END IF
   
   #检查资金系统
   IF tm.chk_nm='Y' THEN
      LET l_sql="SELECT nmbx003,acc,curr,SUM(amt1),SUM(amt2) ",
                "  FROM (",
                #                交易账户/科目       /币别         /原币余额                 /本币余额
                "        (SELECT nmbx003,glab005 acc,nmbx100 curr,SUM(nmbx103-nmbx104) amt1,SUM(nmbx113-nmbx114) amt2 ",
                "           FROM nmbx_t,glab_t,aglq510_tmp ",
                "          WHERE nmbxent=glabent AND nmbx003=glab003 ",
                "            AND glab001='40' AND glab002='40' AND glabld='",tm.glaald,"'",
                "            AND nmbxent=glarent AND glab005=glar001 AND nmbx100=glar009",
                "            AND nmbxent=",g_enterprise," AND nmbxcomp='",tm.glaacomp,"'",
                "            AND nmbx001=",tm.glar002," AND nmbx002<=",tm.glar003, 
                "            AND sys ='4'",
                "            AND diff IN ('2','3','4','6')",
                "          GROUP BY nmbx003,glab005,nmbx100 )",
             #170918-00041#1 mark-----s                
             #   #170322-00040#1 add s---
             #   "         UNION ",
             #   "        (SELECT '',glab005 acc,glat100 curr,SUM(glat103-glat104) amt1,SUM(glat113-glat114) amt2 ",
             #   "           FROM glab_t, glat_t ,aglq510_tmp",
             #   "          WHERE glabent = glatent AND glabld = glatld AND glab001='41' AND glab002 = '8714' AND glab003 = 'F' ",
             #   "            AND glabent =",g_enterprise," AND glabld = '",tm.glaald,"' AND glat001 =",tm.glar002," AND glat002<=",tm.glar003, 
             #   "            AND glat007 = glab005  AND glat003 = 'NM' ",
             #   "            AND glabent=glarent  AND glatcomp ='",tm.glaacomp,"' AND glab005 = glar001 AND glat100=glar009 ",
             #   "            AND sys ='4'",
             #   "            AND diff IN ('2','3','4','6')",
             #   "          GROUP BY '',glab005,glat100)",  
             #   "         UNION ",
             #   "        (SELECT '',glab005 acc,glat100 curr,SUM(glat103-glat104) amt1,SUM(glat113-glat114) amt2 ",
             #   "           FROM glab_t, glat_t ,aglq510_tmp",
             #   "          WHERE glabent = glatent AND glabld = glatld AND glab001='41' AND glab002 = '8718' AND glab003 = '2' ",
             #   "            AND glabent =",g_enterprise," AND glabld = '",tm.glaald,"' AND glat001 =",tm.glar002," AND glat002<=",tm.glar003, 
             #   "            AND glat007 = glab005  AND glat003 = 'NM' ",
             #   "            AND glabent=glarent  AND glatcomp ='",tm.glaacomp,"' AND glab005 = glar001 AND glat100=glar009 ",                
             #   "            AND sys ='4'",
             #   "            AND diff IN ('2','3','4','6')",
             #   "          GROUP BY '',glab005,glat100)",                      
             #   #170322-00040#1 add e---
             #170918-00041#1 mark-----e
                #170918-00041#1-----s
                "         UNION ",
                "        (SELECT '',glab005 acc,nmcy100 curr,SUM(nmcy103) amt1,SUM(nmcy113) amt2 ",
                "           FROM glab_t, nmcy_t ,aglq510_tmp",
                "          WHERE glabent = nmcyent AND glabld = nmcyld AND glab001='41' AND glab002 = '8714' AND glab003 = 'F' ",
                "            AND glabent =",g_enterprise," AND glabld = '",tm.glaald,"' AND nmcy001=",tm.glar002," AND nmcy002 =",tm.glar003, 
                "            AND nmcy040 = glab005 AND nmcy003 = '03'  ",
                "            AND glabent=nmcyent  AND nmcycomp ='",tm.glaacomp,"' ",
                "            AND sys ='4'",
                "            AND diff IN ('2','3','4','6')",
                "          GROUP BY '',glab005,nmcy100) ",  
                #170918-00041#1-----e                
                "       )",                
                " GROUP BY nmbx003,acc,curr ",
                " ORDER BY nmbx003,acc,curr "
     
      PREPARE aglq510_b_fill4_nmbx_pr FROM l_sql
      DECLARE aglq510_b_fill4_nmbx_cs CURSOR FOR aglq510_b_fill4_nmbx_pr
      FOREACH aglq510_b_fill4_nmbx_cs INTO g_glar4_d[l_i].xrea005,g_glar4_d[l_i].xrea019,g_glar4_d[l_i].xrea100,
                                           g_glar4_d[l_i].xrea103,g_glar4_d[l_i].xrea113 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_b_fill4_nmbx_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET g_glar4_d[l_i].sys4 = '4'
         IF cl_null(g_glar4_d[l_i].xrea103) THEN LET g_glar4_d[l_i].xrea103 = 0 END IF
         IF cl_null(g_glar4_d[l_i].xrea113) THEN LET g_glar4_d[l_i].xrea113 = 0 END IF
         #科目说明
         CALL s_desc_get_account_desc(tm.glaald,g_glar4_d[l_i].xrea019) RETURNING g_glar4_d[l_i].xrea019_4_desc
         LET  l_i = l_i + 1
      END FOREACH
   END IF
   
   #检查成本系统
   IF tm.chk_xc='Y' THEN
      #抓取有差异的科目和币别
      LET l_sql="SELECT DISTINCT glar001,glar009,glcc011 ",
                "  FROM aglq510_tmp,glcc_t ",
                " WHERE glarent=glccent AND glar001=glcc002 ",
                "   AND glarent=",g_enterprise," AND glccld='",tm.glaald,"'",
                "   AND glcc001 IN ('1','3')",
                "   AND sys = '5' ",
                "   AND diff IN ('2','3','4','6')",
                " ORDER BY glar001,glar009,glcc011 "
      PREPARE aglq510_b_fill4_tmp_pr FROM l_sql
      DECLARE aglq510_b_fill4_tmp_cs CURSOR FOR aglq510_b_fill4_tmp_pr
      FOREACH aglq510_b_fill4_tmp_cs INTO l_glar001,l_glar009,l_glcc011
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'FOREACH aglq510_b_fill4_nmbx_cs'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         #180319-00029#1---add--str
         SELECT glcc016 INTO l_glcc016
           FROM glcc_t
          WHERE glccent = g_enterprise
            AND glccld = tm.glaald
            AND glcc001 IN ('1','3')
            AND glcc011 = l_glcc011
            AND glcc002 = l_glar001
         
         #180319-00029#1---add--end
         
         #1)存货科目对应料件
         LET l_sql="SELECT 1 seq,xccc006 item,SUM(xccc902) amount ",
                   "  FROM xccc_t,xcbb_t ",
                   " WHERE xcccent=xcbbent AND xccc004=xcbb001 AND xccc005=xcbb002 AND xccc006=xcbb003 ",
                   "   AND xcccent=",g_enterprise," AND xcccld='",tm.glaald,"' ",
                   "   AND xccc001='1' AND xccc004=",tm.glar002," AND xccc005=",tm.glar003,
                   "   AND xccc003='",g_glaa120,"' ",  #171103-00001#1 add
                   "   AND xcbbcomp='",tm.glaacomp,"' ",
                   "   AND xccc010='",l_glar009,"'"
#         #180319-00029#1---mark---str
#         IF l_glcc011 <> '* ' THEN
#            LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"
#         ELSE
#            LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",
#                            "      xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                            "                      WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                            "                        AND glcc001='1' AND glcc011 <> '*' )",
#                            "      )"
#         END IF
#         #180319-00029#1---mark---end
         #180319-00029#1---add---str
          IF l_glcc016<> '*' THEN        
             LET l_sql = l_sql," AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",        
                               "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                               "  AND glcc001='1' AND glcc002 = '",l_glar001,"' ))"        
          ELSE        
             IF l_glcc011 <> '* ' THEN
                LET l_sql=l_sql," AND xcbb010='",l_glcc011,"'"
               
             ELSE
                 LET l_sql=l_sql," AND (xcbb010 IS NULL OR ",
                          "      xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
                          "                      WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                          "                        AND glcc001='1' AND glcc011 <> '*' )",
                          "      )"
                
             END IF
             LET l_sql = l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",        
                               "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                               "   ))"
                              
          END IF  
          #180319-00029#1---add---end
         
         LET l_sql=l_sql," GROUP BY xccc006"
        
         #180213-00012#1 add--s
         LET l_cnt = 0
         SELECT COUNT(glar001) INTO l_cnt
           FROM aglq510_tmp,glcc_t
          WHERE glarent=glccent AND glar001=glcc002 #科目
            AND glarent=g_enterprise AND glccld=tm.glaald
            AND glcc001 = '3'  #在制
            AND sys = '5'
            AND diff IN ('2','3','4','6')
         IF l_cnt > 0 THEN    #如果有在制科目
         #180213-00012#1 add--e
            #2)在制科目对应工单
            #成本分群条件
#            #180319-00029#1---mark---str
#            IF l_glcc011 <> '* ' THEN
#               LET l_wc=" xcbb010='",l_glcc011,"'"
#            ELSE
#               LET l_wc=" (xcbb010 IS NULL OR ",
#                        "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
#                        "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
#                        "                    AND glcc001='3' AND glcc011 <> '*' )",
#                        " )"
#            END IF
#            #180319-00029#1---mark---end
            #180319-00029#1---add---str
            IF l_glcc016<> '*' THEN        
#               LET l_sql = l_sql," AND (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",    #180509-00006#1---mark 
               LET l_wc = "  (xcbb003 IN (SELECT DISTINCT glcc016 FROM glcc_t ",    #180509-00006#1---add               
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "  AND glcc001='3' AND glcc002 = '",l_glar001,"' ))"        
            ELSE        
               IF l_glcc011 <> '* ' THEN
                  LET l_wc=" xcbb010='",l_glcc011,"'"
                 
               ELSE
                   LET l_wc=" (xcbb010 IS NULL OR ",
                        "  xcbb010 NOT IN (SELECT DISTINCT glcc011 FROM glcc_t ",
                        "                  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",
                        "                    AND glcc001='3' AND glcc011 <> '*' )",
                        " )"
                  
               END IF
#               LET l_sql = l_sql," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",  #180509-00006#1---mark 
               LET l_wc = l_wc," AND (xcbb003 NOT IN (SELECT DISTINCT glcc016 FROM glcc_t ",     #180509-00006#1---add          
                                 "  WHERE glccent=",g_enterprise," AND glccld='",tm.glaald,"'",        
                                 "   ))"               
            END IF  
            #180319-00029#1---add---end

            LET l_sql1="SELECT 2 seq,xccd006 item,SUM(amt) amount ",
                       "  FROM (",
                       "         (SELECT xccd006,SUM(xccd902) amt",
                       "            FROM xccd_t,xcbb_t ",
                       "           WHERE xccdent=xcbbent AND xccd004=xcbb001 AND xccd005=xcbb002 AND xccd007=xcbb003 ",
                       "             AND xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' ",
                       "             AND xccd001='1' AND xccd004=",tm.glar002," AND xccd005=",tm.glar003,
                       "             AND xcbbcomp='",tm.glaacomp,"' ",
                       "             AND xccd011='",l_glar009,"'",
                       "             AND ",l_wc,
                       "           GROUP BY xccd006 ",
                       "         )",
                       "         UNION ",
                       "         (SELECT xcch006 xccd006,SUM(xcch902) amt",
                       "            FROM xcch_t,xcbb_t ",
                       "           WHERE xcchent=xcbbent AND xcch004=xcbb001 AND xcch005=xcbb002 AND xcch007=xcbb003 ",
                       "             AND xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' ",
                       "             AND xcch001='1' AND xcch004=",tm.glar002," AND xcch005=",tm.glar003,
                       "             AND xcbbcomp='",tm.glaacomp,"' ",
                       "             AND xcch011 = '",l_glar009,"'",
                       "             AND ",l_wc,
                       "           GROUP BY xcch006 ",
                       "         )",
                       "       ) ",
                       " GROUP BY xccd006 "
            LET l_sql="SELECT seq,item,amount ",
                      "  FROM ( (",l_sql,") UNION (",l_sql1,") )",
                      " ORDER BY seq,item"
         END IF #180213-00012#1 add
         PREPARE aglq510_b_fill4_xccc_pr FROM l_sql
         DECLARE aglq510_b_fill4_xccc_cs CURSOR FOR aglq510_b_fill4_xccc_pr
         
         FOREACH aglq510_b_fill4_xccc_cs INTO l_seq,g_glar4_d[l_i].xrea005,g_glar4_d[l_i].xrea113 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'FOREACH aglq510_b_fill4_xccc_cs'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            LET g_glar4_d[l_i].sys4 = '5'
            IF cl_null(g_glar4_d[l_i].xrea113) THEN LET g_glar4_d[l_i].xrea113 = 0 END IF
            LET g_glar4_d[l_i].xrea103 = g_glar4_d[l_i].xrea113
            LET g_glar4_d[l_i].xrea019 = l_glar001
            LET g_glar4_d[l_i].xrea100 = l_glar009
            #科目说明
            CALL s_desc_get_account_desc(tm.glaald,g_glar4_d[l_i].xrea019) RETURNING g_glar4_d[l_i].xrea019_4_desc
            LET  l_i = l_i + 1
         END FOREACH
      END FOREACH
   END IF
   
   #检查投融资系统
   IF tm.chk_fm='Y' THEN
   END IF
   
   
   LET l_i = l_i - 1
   CALL g_glar4_d.deleteElement(g_glar4_d.getLength())
END FUNCTION

################################################################################
# Descriptions...: #171212-00013#2 add
# Memo...........:
# Usage..........: CALL aglq510_b_fill5()
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill5()
DEFINE l_sql      STRING
DEFINE l_glac008  LIKE glac_t.glac008
DEFINE l_i        LIKE type_t.num5

   CALL g_glaq5_d.clear()
   LET l_i=1
   
   LET l_sql = " SELECT glac008 FROM glac_t ",
               "  WHERE glacent = ",g_enterprise," AND glac001= '",g_glaa004,"' AND glac002=? "
   PREPARE aglq510_b_fill5_glac_pr FROM l_sql            
   
   LET l_sql = " SELECT glaq002,'',glaq005,glaqdocno,glapdocdt,SUM(CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END),SUM(glaq003-glaq004) ",
               "   FROM glaq_t,glap_t,glad_t ",
               "  WHERE glaqent = glapent AND glaqdocno = glapdocno AND glaqld = glapld ",
               "    AND gladent = glaqent AND gladld = glaqld AND glad001 = glaq002 AND glad037 = 'Y' ",
               "    AND glap007 = 'GL' AND glap002 = ",tm.glar002," AND glap004 = ",tm.glar003,
               "    AND glaqld = '",tm.glaald,"'",
               "  GROUP BY  glaq002,glaq005,glaqdocno,glapdocdt"
   PREPARE aglq510_b_fill5_pr FROM l_sql
   DECLARE aglq510_b_fill5_cs CURSOR FOR aglq510_b_fill5_pr
   FOREACH aglq510_b_fill5_cs INTO g_glaq5_d[l_i].glaq002,g_glaq5_d[l_i].glaq002_desc,g_glaq5_d[l_i].glaq005,
                                   g_glaq5_d[l_i].glaqdocno,g_glaq5_d[l_i].glapdocdt_1,g_glaq5_d[l_i].glaq010,
                                   g_glaq5_d[l_i].glaq003
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH aglq510_b_fill5_cs'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF                                   
      IF cl_null(g_glaq5_d[l_i].glaq010) THEN LET g_glaq5_d[l_i].glaq010 = 0 END IF
      IF cl_null(g_glaq5_d[l_i].glaq003) THEN LET g_glaq5_d[l_i].glaq003 = 0 END IF  
      EXECUTE aglq510_b_fill5_glac_pr USING g_glaq5_d[l_i].glaq002 INTO l_glac008     
      #当科目余额方向为借方，余额=借-贷，当科目余额方向为贷方，余额=贷-借
      IF l_glac008 = '2' THEN
         LET g_glaq5_d[l_i].glaq003 = g_glaq5_d[l_i].glaq003 * -1
      END IF

      CALL s_desc_get_account_desc(tm.glaald,g_glaq5_d[l_i].glaq002) RETURNING g_glaq5_d[l_i].glaq002_desc
      LET l_i = l_i + 1
   END FOREACH      
   LET l_i = l_i - 1
   CALL g_glaq5_d.deleteElement(g_glaq5_d.getLength())   
END FUNCTION

################################################################################
# Descriptions...: 根据“勾稽明细”页签资料检核AR/AP错误
# Memo...........:
# Usage..........: aglq510_chk_error1()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/07/18 By 09232 #180716-00006#1
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_chk_error1()
DEFINE l_tmp RECORD
      sys5          LIKE type_t.chr500,     #模组别
      glaq002       LIKE glaq_t.glaq002,    #科目
      glaq002_desc  LIKE type_t.chr100,     #科目名称
      glaq005       LIKE glaq_t.glaq005,    #币别
      glaq022       LIKE glaq_t.glaq021,    #交易对象
      glaq022_desc  LIKE type_t.chr100,     #交易对象名称
      glaqdocno     LIKE glaq_t.glaqdocno,  #总账凭证单号
      glaq010       LIKE glaq_t.glaq010,    #总账原币金额
      glaq003       LIKE glaq_t.glaq003,    #总账本币金额
      glgbdocno     LIKE glgb_t.glgbdocno,  #分录底稿单号
      glgb010       LIKE glgb_t.glgb010,    #分录底稿原币金额
      glgb003       LIKE glgb_t.glgb003,    #分录底稿本币金额
      xrcbdocno     LIKE xrcb_t.xrcbdocno,  #子系统单据号码
      xrcbseq       LIKE xrcb_t.xrcbseq,    #明细项次
      gzza001       LIKE oobx_t.oobx004,    #来源作业
      xrcb105       LIKE xrcb_t.xrcb105,    #子系统原币金额
      xrcb115       LIKE xrcb_t.xrcb115,    #子系统本币金额
      message_code  LIKE type_t.chr100,     #错误类型
      advise        LIKE type_t.chr100,     #建议做法
#      flag          LIKE type_t.chr1        #标记错误类型(用于排序)   #191120-00020#1 mark
      flag          LIKE type_t.chr2        #标记错误类型(用于排序)   #191120-00020#1 add
END RECORD
DEFINE l_glaq004    LIKE glaq_t.glaq004    #贷方金额
DEFINE l_sql        STRING
DEFINE l_glac008    LIKE glac_t.glac008
DEFINE l_glap007    LIKE glap_t.glap007 
DEFINE l_sdocno     LIKE glap_t.glapdocno
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE type_t.chr20
DEFINE l_flag       LIKE type_t.chr1   
DEFINE l_date_s     LIKE glav_t.glav004
DEFINE l_date_e     LIKE glav_t.glav004   
DEFINE l_dfin0030   LIKE type_t.chr1 
DEFINE l_wc         STRING
DEFINE l_wc1        STRING
DEFINE l_wc3        STRING    #180716-00006#2 add
DEFINE l_cnt        LIKE type_t.num5
#DEFINE l_xrca035    LIKE xrca_t.xrca035  #180716-00006#3 mark
DEFINE l_sfin1002   LIKE type_t.chr1
DEFINE l_sfin2002   LIKE type_t.chr1
DEFINE l_xrcc  RECORD
   xrcc108   LIKE xrcc_t.xrcc108,
   xrcc109   LIKE xrcc_t.xrcc109,
   xrce109   LIKE xrce_t.xrce109,
   xrce1091  LIKE xrce_t.xrce109,
   apce109   LIKE apce_t.apce109,
   xrcf103   LIKE xrcf_t.xrcf103,
   xrcc118   LIKE xrcc_t.xrcc118,
   xrcc119   LIKE xrcc_t.xrcc119,
   xrce119   LIKE xrce_t.xrce109,
   xrce1191  LIKE xrce_t.xrce119,
   apce119   LIKE apce_t.apce119,
   xrcf113   LIKE xrcf_t.xrcf113
END RECORD
DEFINE l_sum        LIKE xrca_t.xrca118
DEFINE l_glad027    LIKE glad_t.glad027
#180716-00006#3 add-s
DEFINE l_xrca RECORD
   xrca035   LIKE xrca_t.xrca035,
   xrca036   LIKE xrca_t.xrca036,
   xrcb021   LIKE xrcb_t.xrcb021,
   xrca001   LIKE xrca_t.xrca021   
END RECORD
#180716-00006#3 add-e
#181204-00026#9 ---s---
DEFINE l_apca057 LIKE apca_t.apca057        #員工編號
DEFINE l_apca057_desc LIKE type_t.chr100    #員工名稱
#181204-00026#9 ---e---


   #DELETE FROM aglq510_tmp01   #180716-00006#2 mark
   
   #取得会计周期起讫日
   SELECT MIN(glav004),MAX(glav004) INTO l_date_s,l_date_e  FROM glav_t 
    WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002 AND glav006=tm.glar003
   
   #冲账参数
   CALL cl_get_para(g_enterprise,tm.glaacomp,'S-FIN-1002') RETURNING l_sfin1002 #应收
   CALL cl_get_para(g_enterprise,tm.glaacomp,'S-FIN-2002') RETURNING l_sfin2002 #应付
#   #180716-00006#2 mark-s
#   #科目余额方向
#   LET l_sql=" SELECT glac008 FROM glac_t ",
#             " WHERE glacent=",g_enterprise," AND glac001='",g_glaa004,"' AND glac002=? "
#   PREPARE aglq510_chk_glac1 FROM l_sql
#   #180716-00006#2 mark-e
   #180716-00006#2 add-s
   IF tm.chk_ar='Y' AND tm.chk_ap='Y' THEN
      LET l_wc3=" AND sys IN ('1','2') "
   ELSE
      IF tm.chk_ar='Y' THEN
         LET l_wc3=" AND sys IN ('1') "
      END IF
      IF tm.chk_ap='Y' THEN
         LET l_wc3=" AND sys IN ('2') "
      END IF
   END IF
   #180716-00006#2 add-e
 
   #1、非子系统建立凭证
   INITIALIZE l_tmp.* TO NULL
   
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','','',SUM(glaq004) ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             #190408-00030---mark---str--
             #"          (CASE glac008
             #              WHEN '1' THEN
             #                  CASE 
             #                    WHEN glaq003 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq003 
             #                  END
             #              ELSE
             #                  CASE 
             #                    WHEN glaq004 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq010
             #                  END
             #            END) glaq010,",
             #190408-00030#1---mark---end--
              #190408-00030#1---add---str--
              "          (CASE glac008 ",
              "            WHEN '1' THEN ",
              "                CASE  ",
              "                  WHEN glaq003 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",  #原先是aglq003改成glaq010
              "                END ",
              "            ELSE ",
              "                CASE ", 
              "                  WHEN glaq004 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",
              "                END ",
              "          END) glaq010,",
              #190408-00030#1---add---end--           
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007='GL' AND glapstus<>'X' ",
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND diff NOT IN('0','5') ))",  #180716-00006#2 mark
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005",l_wc3," AND diff NOT IN('0','5') ))",  #180716-00006#2 add
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
             
   
   PREPARE aglq510_pre_chk1 FROM l_sql
   DECLARE aglq510_cur_chk1 CURSOR FOR aglq510_pre_chk1
   FOREACH aglq510_cur_chk1 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

      #181204-00026#9 ---s---
      IF l_tmp.glaq002 = 'EMPL' THEN
         #抓AP立帳單頭
         LET l_apca057 = NULL   
         SELECT apca057 INTO l_apca057 FROM apca_t
          WHERE apcaent = g_enterprise AND apcald = tm.glaald 
            AND apcadocno = l_tmp.xrcbdocno
         IF cl_null(l_apca057)THEN
             #抓AR立帳單頭
             SELECT xrca057 INTO l_apca057 FROM xrca_t
              WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                AND xrcadocno = l_tmp.xrcbdocno                   
         END IF
         CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
         IF NOT cl_null(l_apca057_desc)THEN
            LET l_tmp.glaq022_desc = l_apca057_desc 
         END IF                
      END IF
      #181204-00026#9 ---e---     
      #错误类型
      LET l_tmp.message_code  = g_agl00826 #cl_getmsg('agl-00826',g_dlang)
      
      #建议做法
      LET l_tmp.advise  = g_agl44594 #cl_getmsg('agl-44594',g_dlang)    #190221-00009#1  add
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      LET l_tmp.gzza001='aglt310'
      LET l_tmp.flag='1'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   
   #2、应过账未过账凭证
   INITIALIZE l_tmp.* TO NULL
   IF tm.chk_ar='Y' AND tm.chk_ap='Y' THEN
      LET l_wc=" AND glap007 IN ('AR','AP','GL') "
   ELSE
      IF tm.chk_ar='Y' THEN
         LET l_wc=" AND glap007 IN ('AR','GL') "
      END IF
      IF tm.chk_ap='Y' THEN
         LET l_wc=" AND glap007 IN ('AP','GL') "
      END IF
   END IF
   
   #LET l_sql=" SELECT '',glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','','',SUM(glaq004),glap007 ", #180716-00006#2 mark
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','','',SUM(glaq004),glap007 ", #180716-00006#2 add
             "   FROM ( SELECT glaq002,glaq005,glaq022,glaqdocno,tmp.sys sys,",  #180716-00006#2 add (tmp.sys)
             #190408-00030#1---mark---str--
             #"          (CASE glac008
             #              WHEN '1' THEN
             #                  CASE 
             #                    WHEN glaq003 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq003 
             #                  END
             #              ELSE
             #                  CASE 
             #                    WHEN glaq004 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq010
             #                  END
             #            END) glaq010,",
             #190408-00030#1---mark---end--
              #190408-00030#1---add---str--
              "          (CASE glac008 ",
              "            WHEN '1' THEN ",
              "                CASE  ",
              "                  WHEN glaq003 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",  #原先是aglq003改成glaq010 
              "                END ",
              "            ELSE ",
              "                CASE ", 
              "                  WHEN glaq004 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",
              "                END ",
              "          END) glaq010,", 
              #190408-00030#1---add---end--            
              "          glaq003,glaq004,glap007 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",  #180716-00006#2 add
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glapstus NOT IN ('X','S') ",l_wc,
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND diff NOT IN('0','5') ))",  #180716-00006#2 mark
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005",l_wc3," AND diff NOT IN('0','5') ))",  #180716-00006#2 add
              " GROUP BY glaq002,glaq005,glaq022,glaqdocno,glap007,sys ",  #180716-00006#2 add(sys)
              " ORDER BY glaq002,glaqdocno "   
    PREPARE aglq510_pre_chk2 FROM l_sql
    DECLARE aglq510_cur_chk2 CURSOR FOR aglq510_pre_chk2
   
    FOREACH aglq510_cur_chk2 INTO l_tmp.*,l_glaq004,l_glap007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #181204-00026#9---s---
      IF l_tmp.glaq002 = 'EMPL' THEN
         #抓AP立帳單頭
         LET l_apca057 = NULL   
         SELECT apca057 INTO l_apca057 FROM apca_t
          WHERE apcaent = g_enterprise AND apcald = tm.glaald 
            AND apcadocno = l_tmp.xrcbdocno
         IF cl_null(l_apca057)THEN
             #抓AR立帳單頭
             SELECT xrca057 INTO l_apca057 FROM xrca_t
              WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                AND xrcadocno = l_tmp.xrcbdocno                   
         END IF
         CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
         IF NOT cl_null(l_apca057_desc)THEN
            LET l_tmp.glaq022_desc = l_apca057_desc 
         END IF                
      END IF
      #181204-00026#9---e---      
      #错误类型
      LET l_tmp.message_code  = g_agl00827 #cl_getmsg('agl-00827',g_dlang)
      #建议做法
      LET l_tmp.advise  = g_agl44595   #cl_getmsg('agl-44595',g_dlang)    #190221-00009#1  add
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      
      #来源作业
      IF l_glap007='GL'THEN
         LET l_tmp.gzza001='aglt310'
      ELSE
         #子系统单据号码
         CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_sdocno
         IF NOT cl_null(l_sdocno) THEN #190108-00068#1 add
            CALL s_aooi200_fin_get_slip(l_sdocno) RETURNING l_success,l_slip
            #来源作业
            SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
             WHERE oobxent=g_enterprise AND oobx001=l_slip
          END IF                       #190108-00068#1 add
      END IF
      #LET l_tmp.sys5='7'   #180716-00006#2 mark
      LET l_tmp.flag='2'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   




   #3.应抛未抛凭证的交易单据
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=''
   IF tm.chk_ar='Y' THEN
      LET l_sql = " SELECT '1',xrcb029,'',xrca100,'','','','','','','','',xrcadocno,0,'',NVL(SUM(xrcb105),0),NVL(SUM(xrcb115),0),'','','' ",
               "   FROM xrca_t,xrcb_t",
               "  WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno", 
               "    AND xrcaent =",g_enterprise," AND xrcastus <>'X' AND xrcastus ='Y'  ",
               "    AND xrcald  ='",tm.glaald,"' AND xrca038 IS NULL AND xrca103>0 ",
               "    AND xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
               #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5'))", #180716-00006#2 mark
               "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5'))", #180716-00006#2 add
               "    GROUP BY xrcb029,xrca100,xrcadocno ",
               " UNION ",
               #应收核销
               " SELECT '1',xrce016,'',xrce100,'','','','','','','','',xrdadocno,0,'',NVL(SUM(xrce109),0),NVL(SUM(xrce119),0),'','','' ",
               "  FROM xrda_t,xrce_t",
               " WHERE xrdaent=xrceent AND xrdald=xrceld AND xrdadocno=xrcedocno", 
               "   AND xrdaent =",g_enterprise," AND xrdastus <>'X' AND xrdastus ='Y' ",
               "   AND xrdald  ='",tm.glaald,"' AND xrda014 IS NULL  ",
               "   AND xrdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
               #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 AND diff NOT IN('0','5') )",  #180716-00006#2 mark
               "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 ",l_wc3," AND diff NOT IN('0','5') )",  #180716-00006#2 add
               "    GROUP BY xrce016,xrce100,xrdadocno "
   END IF
   IF tm.chk_ap='Y' AND NOT cl_null(l_sql) THEN
      LET l_sql=l_sql," UNION "
   END IF
   IF tm.chk_ap='Y'  THEN
      LET l_sql=l_sql,
                " SELECT '2',apcb029,'',apca100,'','','','','','','','',apcadocno,0,'',NVL(SUM(apcb105),0),NVL(SUM(apcb115),0),'','','' ",
                "   FROM apca_t,apcb_t",
                "  WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno", 
                "    AND apcaent =",g_enterprise," AND apcastus <>'X' AND apcastus ='Y' ",
                "    AND apcald  ='",tm.glaald,"' AND apca038 IS NULL AND apca103>0 ",
                "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5')) ",   #180716-00006#2 mark
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",   #180716-00006#2 add
                "    GROUP BY apcb029,apca100,apcadocno ", 
                " UNION ",
                #应付核销
                " SELECT '2',apce016,'',apce100,'','','','','','','','',apdadocno,0,'',NVL(SUM(apce109),0),NVL(SUM(apce119),0),'','','' ",
                "  FROM apda_t,apce_t",
                " WHERE apdaent=apceent AND apdald=apceld AND apdadocno=apcedocno", 
                "   AND apdaent =",g_enterprise," AND apdastus <>'X' AND apdastus ='Y' ",
                "   AND apdald  ='",tm.glaald,"' AND apda014 IS NULL ",
                "   AND apdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 AND diff NOT IN('0','5') )",   #180716-00006#2 mark
                "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 ",l_wc3," AND diff NOT IN('0','5') )",   #180716-00006#2 add
                "   GROUP BY apce016,apce100,apdadocno "   
                #190704-00044#1---add---str--
                #直接沖帳                
               ," UNION ",
                " SELECT '2',apce016,'',apce100,'','','','','','','','',apcadocno,0,'',NVL(SUM(apce109),0),NVL(SUM(apce119),0),'','','' ",
                "   FROM apca_t,apce_t",
                "  WHERE apcaent=apceent AND apcald=apceld AND apcadocno=apcedocno",
                "    AND apcaent =",g_enterprise," AND apcastus <>'X' AND apcastus ='Y' ",
                "    AND apcald  ='",tm.glaald,"' AND apca038 IS NULL AND apca103>0 ",
                "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                "    AND (SELECT apca001 FROM apca_t a WHERE a.apcaent = apceent AND a.apcald = apceld AND a.apcadocno = apce003) NOT IN ('21','23','25') ",            
                "    GROUP BY apce016,apce100,apcadocno ",
                #aapq342待抵一律不含稅,直接沖帳金額不能取含稅金額
                " UNION ",
                " SELECT '2',apce016,'',apce100,'','','','','','','','',apcadocno,0,'',NVL(SUM(apce103),0),NVL(SUM(apce113),0),'','','' ",
                "   FROM apca_t,apce_t",
                "  WHERE apcaent=apceent AND apcald=apceld AND apcadocno=apcedocno",
                "    AND apcaent =",g_enterprise," AND apcastus <>'X' AND apcastus ='Y' ",
                "    AND apcald  ='",tm.glaald,"' AND apca038 IS NULL AND apca103>0 ",
                "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                "    AND (SELECT apca001 FROM apca_t b WHERE b.apcaent = apceent AND b.apcald = apceld AND b.apcadocno = apce003) IN ('21','23','25') ",            
                "    GROUP BY apce016,apce100,apcadocno "
                #190704-00044#1---add---end--                
   END IF
               
               
              
   PREPARE aglq510_pre_chk3 FROM l_sql
   DECLARE aglq510_cur_chk3 CURSOR FOR aglq510_pre_chk3
   
   FOREACH aglq510_cur_chk3 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk3'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add 
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00828',g_dlang)
      #建议做法
#190221-00009#1  add_S      
      IF l_tmp.sys5='2' THEN  #AP
         LET l_tmp.advise  = g_agl44596  #cl_getmsg('agl-44596',g_dlang)    
      END IF 
      IF l_tmp.sys5='1' THEN  #AR
         LET l_tmp.advise  = g_agl44618 #cl_getmsg('agl-44618',g_dlang)     
      END IF       
#190221-00009#1 add_E    
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      LET l_tmp.flag='3'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e    
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
  
   END FOREACH
   
   
   
   
   #4.期末调汇单据未产GL
   INITIALIZE l_tmp.* TO NULL
   IF tm.chk_ar='Y' AND tm.chk_ap='Y' THEN
      LET l_wc=" AND xreg003 IN ('AR','AP') "
      LET l_wc1=" AND xrem003 IN ('AR','AP') "
   ELSE
      IF tm.chk_ar='Y' THEN
         LET l_wc=" AND xreg003 IN ('AR') "
         LET l_wc1=" AND xrem003 IN ('AR') "
      END IF
      IF tm.chk_ap='Y' THEN
         LET l_wc=" AND xreg003 IN ('AP') "
         LET l_wc1=" AND xrem003 IN ('AP') "
      END IF
   END IF
   
             #应收/付重评价
   LET l_sql=" SELECT CASE WHEN xreg003='AR' THEN '1' ELSE '2' END sys5,",
             "        xreh019,'',xreh100,'','','','','','','','',xrehdocno,0,'',0,NVL(SUM(xreh115),0),'','','' ",
             "   FROM xreg_t,xreh_t  ",
             "  WHERE xregent=xrehent AND xregld=xrehld AND xregdocno=xrehdocno ",
             "    AND xregent=",g_enterprise," AND xregld='",tm.glaald,"' AND xreg005 IS NULL AND xregstus='Y' ",
             "    AND xreg001='",tm.glar002,"' AND xreg002='",tm.glar003,"'",l_wc,
             #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xreh019 AND glar009=xreh100 AND diff NOT IN('0','5') ) ",   #180716-00006#2 mark
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xreh019 AND glar009=xreh100 ",l_wc3," AND diff NOT IN('0','5') ) ",   #180716-00006#2 add
             "   GROUP BY xreh019,xreh100,xrehdocno,xreg003 ",
             " UNION ",
             #应收/付暂估回转及重新立暂估
             " SELECT CASE WHEN xrem003='AR' THEN '1' ELSE '2' END sys5,",
             "        xren019,'',xren100,'','','','','','','','',xrendocno,0,'',NVL(SUM(xren105),0),NVL(SUM(xren115),0),'','','' ",
             "   FROM xrem_t,xren_t  ",
             "  WHERE xrement=xrenent  AND xremdocno=xrendocno ",
             "    AND xrement=",g_enterprise," AND xremld='",tm.glaald,"' ",
             "    AND xrem001='",tm.glar002,"' AND xrem002='",tm.glar003,"' ",l_wc1,
             "    AND xrem005 IS NULL AND xrem006 IN ('1','2') AND xremstus='Y' ",
             #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xren019 AND glar009=xren100 AND diff NOT IN('0','5') ) ",   #180716-00006#2 mark
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xren019 AND glar009=xren100 ",l_wc3," AND diff NOT IN('0','5') ) ",   #180716-00006#2 add
             "   GROUP BY xren019,xren100,xrendocno,xrem003 "
   PREPARE aglq510_pre_chk4 FROM l_sql
   DECLARE aglq510_cur_chk4 CURSOR FOR aglq510_pre_chk4
   
   FOREACH aglq510_cur_chk4  INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = g_agl00829 #cl_getmsg('agl-00829',g_dlang)
      #建议做法
#190221-00009#1  add_S      
      IF l_tmp.sys5='2' THEN  #AP
         LET l_tmp.advise  = g_agl44597  #cl_getmsg('agl-44597',g_dlang)    
      END IF 
      IF l_tmp.sys5='1' THEN  #AR
         LET l_tmp.advise  = g_agl44620  #cl_getmsg('agl-44620',g_dlang)     
      END IF       
#190221-00009#1 add_E      
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      LET l_tmp.flag='4'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)       
   END FOREACH
   
   
   
   
   #5.交易单金额与底稿金额不符
   INITIALIZE l_tmp.* TO NULL
   INITIALIZE l_xrcc.* TO NULL
   #分录底稿sql
   LET l_sql=" SELECT glgbdocno,NVL(SUM(glgb010),0),NVL(SUM(glgb003-glgb004),0) glgb003 ",
             " from (SELECT glgbdocno,glgb002,",
             "              CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END glgb010 ,",
             "              glgb003,glgb004",
             "         FROM glgb_t WHERE glgbent=",g_enterprise," AND glgbld='",tm.glaald,"' ",
             "          AND glgbdocno=? AND glgb002=? )",
             " GROUP BY glgbdocno,glgb002  "
   PREPARE aglq510_pre_chk5 FROM l_sql 
   
   #总账sql
   LET l_sql=" SELECT glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003-glaq004),0) glgb003 ",
             " FROM (SELECT glaqdocno,glaq002,",
             "              CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END glaq010 ,",
             "              glaq003,glaq004",
             "         FROM glaq_t WHERE glaqent=",g_enterprise," AND glaqld='",tm.glaald,"' ",
             "          AND glaqdocno=? AND glaq002=? )",
             " GROUP BY glaqdocno,glaq002  "
   PREPARE aglq510_pre_chk5_1 FROM l_sql 
   

   #应收系统
   IF tm.chk_ar='Y' THEN
      #冲账参数3抓xrcc
      LET l_sql = " SELECT '1',xrcb029,'',xrca100,'','',xrca038,'','','','','',xrcbdocno,0,'','','','','','', ",
                  "        NVL(SUM(xrcc108),0),NVL(SUM(xrcc109),0),NVL(SUM(t2.xrce109),0),NVL(SUM(t1.xrce1091),0),NVL(SUM(apce109),0),NVL(SUM(xrcf103),0), ",      
                  "        NVL(SUM(xrcc118),0),NVL(SUM(xrcc119),0),NVL(SUM(t2.xrce119),0),NVL(SUM(t1.xrce1191),0),NVL(SUM(apce119),0),NVL(SUM(xrcf113),0) ",
                  "       ,xrca001 ",   #191111-00027#1
                  "  FROM xrca_t,xrcb_t ",
                  "  LEFT OUTER JOIN xrcc_t ON xrcbent=xrccent AND xrcbld=xrccld AND xrcbdocno=xrccdocno AND xrcbseq=xrccseq ",
                  "  LEFT OUTER JOIN(",
                  "                    SELECT xrce003,xrce004,xrce005,",
                  #180716-00006#2 mark-s
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce103  ELSE xrce109 END xrce1091, ",
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce113  ELSE xrce119 END xrce1191  ",
                  #180716-00006#2 mark-e
                  #180716-00006#2 add-s
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce103)  ELSE SUM(xrce109) END xrce1091, ",
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce113)  ELSE SUM(xrce119) END xrce1191  ",
                  #180716-00006#2 add-e
                  "                      FROM xrce_t,xrca_t ",
                  "                     WHERE xrceent = xrcaent ",
                  "                       AND xrceld  = xrcald ",
                  "                       AND xrcedocno = xrcadocno ",
                  "                       AND xrcaent=",g_enterprise ,
                  #"                       AND xrcastus = 'Y'  ) t1 ",   #180716-00006#2 mark
                  "                       AND xrcastus = 'Y' GROUP BY xrce003,xrce004,xrce005,xrca001 ) t1 ",   #180716-00006#2 add
                  "               ON xrccdocno= t1.xrce003 AND xrccseq=t1.xrce004 AND xrcc001=t1.xrce005    ",                  
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",  #180716-00006#2 mark
                  "                    SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",  #180716-00006#2 add
                  "                      FROM xrce_t,xrda_t ",
                  "                     WHERE xrceent = xrdaent ",
                  "                       AND xrceld  = xrdald ",
                  "                       AND xrcedocno = xrdadocno ",
                  "                       AND xrceent=",g_enterprise ,
                  #"                       AND xrdastus = 'Y' ) t2",   #180716-00006#2 mark
                  "                       AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005 ) t2 ",   #180716-00006#2 add
                  "               ON xrccdocno= t2.xrce003 AND xrccseq=t2.xrce004 AND xrcc001=t2.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark
                  "                     SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119 ",  #180716-00006#2 add
                  "                       FROM apce_t,apda_t ",
                  "                      WHERE apceent = apdaent ",
                  "                        AND apceld  = apdald ",
                  "                        AND apcedocno = apdadocno ",
                  "                        AND apceent=",g_enterprise ,
                  #"                        AND apdastus = 'Y' )", #180716-00006#2 mark
                  "                        AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 ) ",   #180716-00006#2 add
                  "               ON xrccdocno=apce003  AND xrccseq=apce004 AND xrcc001=apce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrcf008,xrcf009,xrcf010,xrcf103,xrcf113 ",  #180716-00006#2 mark
                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113",  #180716-00006#2 add
#                  #191125-00033#1---mark---str
#                  "                       FROM xrcf_t,xrcb_t ",
#                  "                      WHERE xrcfent = xrcbent ",
#                  "                        AND xrcfld  = xrcbld ",
#                  #191125-00033#1---mark---end
                  #191125-00033#1---add---str
                  "                       FROM xrcf_t,xrca_t ",
                  "                      WHERE xrcfent = xrcaent ",
                  "                        AND xrcfld  = xrcald ",
                  "                        AND xrcastus = 'Y' ",
                  #191125-00033#1---add---end
                  "                        AND xrcfent=",g_enterprise ,
                  #"                        AND xrcfdocno = xrcbdocno )",  #180716-00006#2 mark
#                  "                        AND xrcfdocno = xrcbdocno GROUP BY xrcf008,xrcf009,xrcf010 )",  #180716-00006#2 add    #191125-00033#1---mark
                  "                        AND xrcfdocno = xrcadocno GROUP BY xrcf008,xrcf009,xrcf010 )",  #191125-00033#1---add
                  "               ON xrccdocno=xrcf008 AND xrccseq=xrcf009 AND xrcc001=xrcf010 ",
                  " WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno ",
                  "   AND xrcbent=",g_enterprise," AND xrcbld='",tm.glaald,"'",
                  "   AND (xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=xrccent AND xreald=xrccld AND xrea005=xrccdocno AND xrea006=xrccseq AND xrea007=xrcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AR' )) ",
                  "   AND xrcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5') ) ",    #180716-00006#2 mark 
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') ) ",    #180716-00006#2 add                                                    
                  "   GROUP BY xrcb029,xrca100,xrca038,xrcbdocno "
                 ,"            ,xrca001 "     #191111-00027#1
      PREPARE aglq510_pre_chk5_2 FROM l_sql
      DECLARE aglq510_cur_chk5_2 CURSOR FOR aglq510_pre_chk5_2
      
      #冲账参数1/2 抓xrca
      LET l_sql = " SELECT '1',xrca035,'',xrca100,'','',xrca038,'','','','','',xrcadocno,0,'','','','','','', ",
                  "        NVL(SUM(xrcc108),0),NVL(SUM(xrcc109),0),NVL(SUM(t2.xrce109),0),NVL(SUM(t1.xrce1091),0),NVL(SUM(apce109),0),NVL(SUM(xrcf103),0), ",      
                  "        NVL(SUM(xrcc118),0),NVL(SUM(xrcc119),0),NVL(SUM(t2.xrce119),0),NVL(SUM(t1.xrce1191),0),NVL(SUM(apce119),0),NVL(SUM(xrcf113),0) ",
                   "      ,xrca001 ",   #191111-00027#1
#                  #190514-00012#1---mark---str
#                  "  FROM xrca_t,xrcb_t ",
#                  "  LEFT OUTER JOIN xrcc_t ON xrcbent=xrccent AND xrcbld=xrccld AND xrcbdocno=xrccdocno AND xrcbseq=xrccseq ",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add----str
                  " FROM xrca_t ",
                  "  LEFT OUTER JOIN xrcc_t ON xrcaent=xrccent AND xrcald=xrccld AND xrcadocno=xrccdocno  ",
                  #190514-00012#1---add----end
                  "  LEFT OUTER JOIN(",
                  "                    SELECT xrce003,xrce004,xrce005,",
                  #180716-00006#2 mark-s
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce103  ELSE xrce109 END xrce1091, ",
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce113  ELSE xrce119 END xrce1191  ",
                  #180716-00006#2 mark-e
                  #180716-00006#2 add-s
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce103)  ELSE SUM(xrce109) END xrce1091, ",
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce113)  ELSE SUM(xrce119) END xrce1191  ",
                  #180716-00006#2 add-e
                  "                      FROM xrce_t,xrca_t ",
                  "                     WHERE xrceent = xrcaent ",
                  "                       AND xrceld  = xrcald ",
                  "                       AND xrcedocno = xrcadocno ",
                  "                       AND xrcaent=",g_enterprise ,
                  #"                       AND xrcastus = 'Y' ) t1 ",  #180716-00006#2 mark
                  "                       AND xrcastus = 'Y' GROUP BY xrce003,xrce004,xrce005,xrca001 ) t1 ",  #180716-00006#2 add
                  "               ON xrccdocno= t1.xrce003 AND xrccseq=t1.xrce004 AND xrcc001=t1.xrce005    ",   
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",   #180716-00006#2 mark
                  "                    SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",  #180716-00006#2 add
                  "                      FROM xrce_t,xrda_t ",
                  "                     WHERE xrceent = xrdaent ",
                  "                       AND xrceld  = xrdald ",
                  "                       AND xrcedocno = xrdadocno ",
                  "                       AND xrceent=",g_enterprise ,
                  #"                       AND xrdastus = 'Y' ) t2",   #180716-00006#2 mark
                  "                       AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005 ) t2",   #180716-00006#2 add
                  "               ON xrccdocno= t2.xrce003 AND xrccseq=t2.xrce004 AND xrcc001=t2.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apce003,apce004,apce005,apce109,apce119 ",   #180716-00006#2 mark
                  "                     SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119",  #180716-00006#2 add
                  "                       FROM apce_t,apda_t ",
                  "                      WHERE apceent = apdaent ",
                  "                        AND apceld  = apdald ",
                  "                        AND apceent=",g_enterprise ,
                  "                        AND apcedocno = apdadocno ",
                  #"                        AND apdastus = 'Y' )",   #180716-00006#2 mark
                  "                        AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 )",   #180716-00006#2 add
                  "               ON xrccdocno=apce003  AND xrccseq=apce004 AND xrcc001=apce005 ",
#                  #190514-00012#1---mark----str
#                  "  LEFT OUTER JOIN( ",
#                  #"                     SELECT xrcf008,xrcf009,xrcf010,xrcf103,xrcf113 ",   #180716-00006#2 mark
#                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113 ",   #180716-00006#2 add
#                  "                       FROM xrcf_t,xrcb_t ",
#                  "                      WHERE xrcfent = xrcbent ",
#                  "                        AND xrcfent=",g_enterprise ,
#                  "                        AND xrcfld  = xrcbld ",
#                  #"                        AND xrcfdocno = xrcbdocno )",  #180716-00006#2 mark
#                  "                        AND xrcfdocno = xrcbdocno GROUP BY xrcf008,xrcf009,xrcf010 )",  #180716-00006#2 add
#                  #190514-00012#1---mark----end
                  #190514-00012#1---add----str
                  "  LEFT OUTER JOIN( ",
                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113 ",   
                  "                       FROM xrcf_t,xrca_t ",
                  "                      WHERE xrcfent = xrcaent ",
                  "                        AND xrcfent=",g_enterprise ,
                  "                        AND xrcfld  = xrcald ",
                  "                        AND xrcastus = 'Y' ",   #191125-00033#1--add
                  "                        AND xrcfdocno = xrcadocno GROUP BY xrcf008,xrcf009,xrcf010 )",  
                  #190514-00012#1---add----end
                  "               ON xrccdocno=xrcf008 AND xrccseq=xrcf009 AND xrcc001=xrcf010 ",
#                  #190514-00012#1---mark----str
#                  " WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno ",
#                  "   AND xrcbent=",g_enterprise," AND xrcbld='",tm.glaald,"'",
#                  #190514-00012#1---mark----end
                  #190514-00012#1---add----str
                  " WHERE  ",
                  "    xrcaent=",g_enterprise," AND xrcald='",tm.glaald,"'",
                  #190514-00012#1---add----end
                  "   AND (xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=xrccent AND xreald=xrccld AND xrea005=xrccdocno AND xrea006=xrccseq AND xrea007=xrcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AR' )) ",
                  "   AND xrcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5') ) ",     #180716-00006#2 mark 
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca035 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') ) ",     #180716-00006#2 add                                                   
                  "   GROUP BY xrca035,xrca100,xrca038,xrcadocno "
                 ,"           ,xrca001 "    #191111-00027#1
      PREPARE aglq510_pre_chk5_3 FROM l_sql
      DECLARE aglq510_cur_chk5_3 CURSOR FOR aglq510_pre_chk5_3
      
      
      IF g_glaa121 = 'Y'   THEN
         IF l_sfin1002='3' THEN
            
           LET l_sum=0         
           FOREACH aglq510_cur_chk5_2  INTO l_tmp.*,l_xrcc.*                                                  
                                                   ,l_xrca.xrca001   #191111-00027#1
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk5_2'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF
              
              #将冲销的金额加回
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #分录底稿金额
              EXECUTE aglq510_pre_chk5 USING l_tmp.xrcbdocno,l_tmp.glaq002 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              #190408-00030#1---mark---str--
              #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
              #IF l_glac008='2' THEN
              #   LET l_tmp.glgb010=l_tmp.glgb010*-1
              #   LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              #END IF
              #190408-00030#1---mark---end-- 
              #191111-00027#1-----s
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 
              END IF              
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum = l_sum * -1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum = l_sum * -1
              END IF
              #191111-00027#1-----e
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              LET l_tmp.message_code  = g_agl00830 #cl_getmsg('agl-00830',g_dlang)
              #建议做法
              LET l_tmp.advise  = g_agl44598 #cl_getmsg('agl-44598',g_dlang)    #190221-00009#1  add                 
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                  #IF l_glac008='2' THEN
                  #  LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #  LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add
                  #END IF
                  #190408-00030#1---mark---end--
                  #191111-00027#1-----s
                  IF l_glac008='2' THEN
                    LET l_tmp.glaq010=l_tmp.glaq010*-1
                    LET l_tmp.glaq003=l_tmp.glaq003*-1 
                  END IF                  
                  #191111-00027#1-----e
              END IF 
                        
              LET l_tmp.flag='5' 
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
              END IF
              #191111-00027#1-----e
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e              
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
           END FOREACH
           
         ELSE  #冲账参数为1/2时
            
            LET l_sum=0
            FOREACH aglq510_cur_chk5_3 INTO l_tmp.*,l_xrcc.*
                                                   ,l_xrca.xrca001    #191111-00027#1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk5_3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF


              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113 
              #分录底稿金额
              EXECUTE aglq510_pre_chk5 USING l_tmp.xrcbdocno,l_tmp.glaq002 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              #190408-00030#1---mark---str--
              #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
              #IF l_glac008='2' THEN
              #   LET l_tmp.glgb010=l_tmp.glgb010*-1
              #   LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              #END IF
              #190408-00030#1---mark---end--
              #191111-00027#1-----s
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1
              END IF
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum = l_sum * -1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum = l_sum * -1
              END IF
              #191111-00027#1-----e
              
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              LET l_tmp.message_code  = g_agl00830  #cl_getmsg('agl-00830',g_dlang)
              #建议做法
              LET l_tmp.advise  = g_agl44598 # cl_getmsg('agl-44598',g_dlang)    #190221-00009#1  add 
              
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                  #IF l_glac008='2' THEN
                  #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  #END IF
                  #190408-00030#1---mark---end--
                  #191111-00027#1-----s
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 
                  END IF
                  #191111-00027#1-----e
              END IF 
              LET l_tmp.flag='5'
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
              END IF
              #191111-00027#1-----e
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e                
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
        
         END IF
         
      ELSE  #不启用分录时
         IF l_sfin1002='3' THEN #冲账参数3
            LET l_sum=0         
            FOREACH aglq510_cur_chk5_2  INTO l_tmp.*,l_xrcc.*
                                                    ,l_xrca.xrca001   #191111-00027#1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk5_2'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF

               #将冲销的金额加回
               LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              
              #总账单号/原币金额/本币金额
               IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                  #IF l_glac008='2' THEN
                  #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  #END IF
                  #190408-00030#1---mark---end--
                  #191111-00027#1-----s
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 
                  END IF           
                  #191111-00027#1-----e
               ELSE
                  CONTINUE FOREACH
               END IF 
               #子系统原币/本币金额
               LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
               LET l_tmp.xrcb115=l_sum
               
               #191111-00027#1-----s
               IF l_xrca.xrca001 MATCHES '2*' THEN
                  LET l_sum = l_sum * -1
               END IF
               IF l_xrca.xrca001 MATCHES '0[246]' THEN
                  LET l_sum = l_sum * -1
               END IF               
               #191111-00027#1-----e
               #子系统本币与总账本币相等 or 子系统为0不显示
               IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                  CONTINUE FOREACH
               END IF
               IF NOT cl_null(l_tmp.xrcbdocno)  THEN #190108-00068#1 add
                  CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
               END IF                                #190108-00068#1 add
               #科目名称
               SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
               WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
               #错误类型
               #LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = g_agl00851 #cl_getmsg('agl-00851',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                   
               #来源作业
               SELECT oobx004 INTO l_tmp.gzza001 
                 FROM oobx_t 
                WHERE oobxent=g_enterprise AND oobx001=l_slip
               LET l_tmp.flag='5'
               #180716-00006#3 add-s
               #191111-00027#1-----s
               IF l_xrca.xrca001 MATCHES '2*' THEN
                  LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
               END IF
               IF l_xrca.xrca001 MATCHES '0[246]' THEN
                  LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
               END IF
               #191111-00027#1-----e
               IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
               IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
               IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
               IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
               IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
               IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
               #180716-00006#3 add-e  
               INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
            END FOREACH
            
         ELSE  #冲账参数1/2
            LET l_sum=0
            FOREACH aglq510_cur_chk5_3 INTO l_tmp.*,l_xrcc.*
                                                   ,l_xrca.xrca001   #191111-00027#1
               IF SQLCA.sqlcode THEN  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk5_3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
          
               
               LET l_sum = l_xrcc.xrcc118 - l_xrcc.xrcc119  + l_xrcc.xrce119 +l_xrcc.xrce1191+ l_xrcc.apce119+l_xrcc.xrcf113
               
               #总账单号/原币金额/本币金额
               IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                  #IF l_glac008='2' THEN
                  #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  #END IF
                  #190408-00030#1---mark---end--
                  #191111-00027#1-----s
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1
                  END IF
                  #191111-00027#1-----e
               ELSE
                  CONTINUE FOREACH
               END IF 
               #子系统原币/本币金额
               LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
               LET l_tmp.xrcb115=l_sum   

               #191111-00027#1-----s
               IF l_xrca.xrca001 MATCHES '2*' THEN
                  LET l_sum = l_sum * -1
               END IF
               IF l_xrca.xrca001 MATCHES '0[246]' THEN
                  LET l_sum = l_sum * -1
               END IF               
               #191111-00027#1-----e
               #子系统本币与总账本币相等 or 子系统为0不显示
               IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                  CONTINUE FOREACH
               END IF
               IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                  CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
               END IF                               #190108-00068#1 add
               #科目名称
               SELECT glacl004 INTO l_tmp.glaq002_desc 
                 FROM glacl_t
                WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
               #错误类型
               #LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00851',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                
               #来源作业
               SELECT oobx004 INTO l_tmp.gzza001 
                 FROM oobx_t 
                WHERE oobxent=g_enterprise AND oobx001=l_slip
                LET l_tmp.flag='5'
               #180716-00006#3 add-s
               #191111-00027#1-----s
               IF l_xrca.xrca001 MATCHES '2*' THEN
                  LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
               END IF
               IF l_xrca.xrca001 MATCHES '0[246]' THEN
                  LET l_tmp.xrcb105 = l_tmp.xrcb105 * -1
               END IF
               #191111-00027#1-----e
               IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
               IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
               IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
               IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
               IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
               IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
               #180716-00006#3 add-e                  
               INSERT INTO aglq510_tmp01 VALUES (l_tmp.*) 
            END FOREACH            
         END IF
      END IF
   END IF
      
      
   #应付系统
   INITIALIZE l_tmp.* TO NULL
   INITIALIZE l_xrcc.* TO NULL
   IF tm.chk_ap='Y' THEN
    

      #冲账参数3抓apcc
      LET l_sql = " SELECT '2',apcb029,'',apca100,'','',apca038,'','','','','',apcbdocno,0,'','','','','','', ",
                  "        NVL(SUM(apcc108),0),NVL(SUM(apcc109),0),NVL(SUM(t2.apce109),0),NVL(SUM(t1.apce1091),0),NVL(SUM(xrce109),0),NVL(SUM(apcf103),0),",
                  "        NVL(SUM(apcc118),0),NVL(SUM(apcc119),0),NVL(SUM(t2.apce119),0),NVL(SUM(t1.apce1191),0),NVL(SUM(xrce119),0),NVL(SUM(apcf113),0) ",
                  "       ,apca001 ",   #191111-00027#1
                  "  FROM apca_t,apcb_t ",
                  "  LEFT OUTER JOIN apcc_t ON apcbent=apccent AND apcbld=apccld AND apcbdocno=apccdocno AND apcbseq=apccseq ",
                  "  LEFT OUTER JOIN(",
                  #"                    SELECT apce003,apce004,apce005,apce109 apce1091,apce119 apce1191 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce1091,SUM(apce119) apce1191 ",  #180716-00006#2 add
                  "                      FROM apce_t,apca_t ",
                  "                     WHERE apceent = apcaent ",
                  "                       AND apceld  = apcald ",
                  "                       AND apcedocno = apcadocno ",
                  "                       AND apcaent=",g_enterprise ,
                  #"                       AND apcastus = 'Y' ) t1 ",   #180716-00006#2 mark 
                  "                       AND apcastus = 'Y' GROUP BY apce003,apce004,apce005 ) t1 ",   #180716-00006#2 add
                  "               ON apccdocno= t1.apce003 AND apccseq=t1.apce004 AND apcc001=t1.apce005 ", 
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119 ",  #180716-00006#2 add
                  "                      FROM apce_t,apda_t ",
                  "                     WHERE apceent = apdaent ",
                  "                       AND apceld  = apdald ",
                  "                       AND apcedocno = apdadocno ",
                  "                       AND apceent=",g_enterprise ,
                  #"                       AND apdastus = 'Y' ) t2",   #180716-00006#2 mark 
                  "                       AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 ) t2",   #180716-00006#2 add
                  "               ON apccdocno=t2.apce003 AND apccseq=t2.apce004 AND apcc001=t2.apce005   ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",   #180716-00006#2 mark
                  "                     SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",   #180716-00006#2 add
                  "                       FROM xrce_t,xrda_t ",
                  "                      WHERE xrceent = xrdaent ",
                  "                        AND xrceld  = xrdald ",
                  "                        AND xrcedocno = xrdadocno ",
                  "                        AND xrceent=",g_enterprise ,
                  #"                        AND xrdastus = 'Y' )",  #180716-00006#2 mark 
                  "                        AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005  )",  #180716-00006#2 add
                  "               ON apccdocno=xrce003  AND apccseq=xrce004 AND apcc001=xrce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apcf008,apcf009,apcf010,apcf103,apcf113 ",   #180716-00006#2 mark
                  "                     SELECT apcf008,apcf009,apcf010,SUM(apcf103) apcf103,SUM(apcf113) apcf113 ",   #180716-00006#2 add
                  "                       FROM apcf_t,apca_t ",
                  "                      WHERE apcfent = apcaent ",
                  "                        AND apcfld  = apcald ",
                  "                        AND apcfent=",g_enterprise ,
                  #"                        AND apcfdocno = apcadocno )", #180716-00006#2 mark
                  "                        AND apcfdocno = apcadocno GROUP BY apcf008,apcf009,apcf010  )", #180716-00006#2 add
                  "               ON apccdocno=apcf008 AND apccseq=apcf009 AND apcc001=apcf010 ",
                  " WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno ",
                  "   AND apcbent=",g_enterprise," AND apcbld='",tm.glaald,"'",
                  "   AND (apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=apccent AND xreald=apccld AND xrea005=apccdocno AND xrea006=apccseq AND xrea007=apcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AP' )) ",
                  "   AND apcastus<>'X' ",
                  "   AND apca001 NOT IN('21','23','24','25','26')",   #191111-00027#1
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5') ) ",  #180716-00006#2 mark 
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add                                                       
                  "   GROUP BY apcb029,apca100,apca038,apcbdocno "
                 ,"           ,apca001 "   #191111-00027#1
      PREPARE aglq510_pre_chk5_4 FROM l_sql
      DECLARE aglq510_cur_chk5_4 CURSOR FOR aglq510_pre_chk5_4
      
      #冲账参数1/2 抓apca
      LET l_sql = " SELECT '2',apca035,'',apca100,'','',apca038,'','','','','',apcadocno,0,'','','','','','', ",
                  "        NVL(SUM(apcc108),0),NVL(SUM(apcc109),0),NVL(SUM(t2.apce109),0),NVL(SUM(t1.apce1091),0),NVL(SUM(xrce109),0),NVL(SUM(apcf103),0),",
                  "        NVL(SUM(apcc118),0),NVL(SUM(apcc119),0),NVL(SUM(t2.apce119),0),NVL(SUM(t1.apce1191),0),NVL(SUM(xrce119),0),NVL(SUM(apcf113),0) ",
                  "       ,apca001 ",   #191111-00027#1
#                  #190514-00012#1---mark---str
#                  "  FROM apca_t,apcb_t ",
#                  "  LEFT OUTER JOIN apcc_t ON apcbent=apccent AND apcbld=apccld AND apcbdocno=apccdocno AND apcbseq=apccseq ",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  "  FROM apca_t ",
                  "  LEFT OUTER JOIN apcc_t ON apcaent=apccent AND apcald=apccld AND apcadocno=apccdocno ",
                  #190514-00012#1---add---end
                  "  LEFT OUTER JOIN(",
                  #"                    SELECT apce003,apce004,apce005,apce109 apce1091,apce119 apce1191 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce1091,SUM(apce119) apce1191 ",  #180716-00006#2 add
                  "                      FROM apce_t,apca_t ",
                  "                     WHERE apceent = apcaent ",
                  "                       AND apceld  = apcald ",
                  "                       AND apcedocno = apcadocno ",
                  "                       AND apcaent=",g_enterprise ,
                  #"                       AND apcastus = 'Y' ) t1 ",   #180716-00006#2 mark
                  "                       AND apcastus = 'Y' GROUP BY apce003,apce004,apce005) t1 ",   #180716-00006#2 add
                  "               ON apccdocno= t1.apce003 AND apccseq=t1.apce004 AND apcc001=t1.apce005 ",   
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT apce003,apce004,apce005,apce109,apce119 ", #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119 ", #180716-00006#2 add
                  "                      FROM apce_t,apda_t ",
                  "                     WHERE apceent = apdaent ",
                  "                       AND apceld  = apdald ",
                  "                       AND apcedocno = apdadocno ",
                  "                       AND apceent=",g_enterprise ,
                  #"                       AND apdastus = 'Y' ) t2",   #180716-00006#2 mark
                  "                       AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 ) t2",   #180716-00006#2 add
                  "               ON apccdocno=t2.apce003 AND apccseq=t2.apce004 AND apcc001=t2.apce005   ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",  #180716-00006#2 mark
                  "                     SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",  #180716-00006#2 add
                  "                       FROM xrce_t,xrda_t ",
                  "                      WHERE xrceent = xrdaent ",
                  "                        AND xrceld  = xrdald ",
                  "                        AND xrcedocno = xrdadocno ",
                  "                        AND xrceent=",g_enterprise ,
                  #"                        AND xrdastus = 'Y' )", #180716-00006#2 mark
                  "                        AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005 )", #180716-00006#2 add
                  "               ON apccdocno=xrce003  AND apccseq=xrce004 AND apcc001=xrce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apcf008,apcf009,apcf010,apcf103,apcf113 ", #180716-00006#2 mark
                  "                     SELECT apcf008,apcf009,apcf010,SUM(apcf103) apcf103,SUM(apcf113) apcf113 ", #180716-00006#2 add
                  "                       FROM apcf_t,apca_t ",
                  "                      WHERE apcfent = apcaent ",
                  "                        AND apcfld  = apcald ",
                  "                        AND apcfent=",g_enterprise ,
                  #"                        AND apcfdocno = apcadocno )", #180716-00006#2 mark
                  "                        AND apcfdocno = apcadocno GROUP BY apcf008,apcf009,apcf010 )", #180716-00006#2 add
                  "               ON apccdocno=apcf008 AND apccseq=apcf009 AND apcc001=apcf010 ",
#                  #190514-00012#1---mark---str
#                  " WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno ",
#                  "   AND apcbent=",g_enterprise," AND apcbld='",tm.glaald,"'",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  " WHERE  ",
                  "   apcaent=",g_enterprise," AND apcald='",tm.glaald,"'",
                  #190514-00012#1---add---end
                  "   AND (apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=apccent AND xreald=apccld AND xrea005=apccdocno AND xrea006=apccseq AND xrea007=apcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AP' )) ",
                  "   AND apcastus<>'X' ",
                  "   AND apca001 NOT IN('21','23','24','25','26')",   #191111-00027#1
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5') ) ",  #180716-00006#2 mark     
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca035 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add                                                      
                  "   GROUP BY apca035,apca100,apca038,apcadocno "
                 ,"           ,apca001 "   #191111-00027#1

      PREPARE aglq510_pre_chk5_5 FROM l_sql
      DECLARE aglq510_cur_chk5_5 CURSOR FOR aglq510_pre_chk5_5
      
      INITIALIZE l_xrcc.* TO NULL  
      IF g_glaa121 = 'Y'   THEN  #启用分录
         IF l_sfin2002='3' THEN  #冲账参数3
           LET l_sum=0  
           FOREACH aglq510_cur_chk5_4  INTO l_tmp.*,l_xrcc.*
                                           ,l_xrca.xrca001    #191111-00027#1
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk5_4'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF

              #将冲销的金额加回
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #分录底稿金额
              EXECUTE aglq510_pre_chk5 USING l_tmp.xrcbdocno,l_tmp.glaq002 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              #190408-00030#1---mark---str--
              #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
              #IF l_glac008='2' THEN
              #   LET l_tmp.glgb010=l_tmp.glgb010*-1
              #   LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              #END IF     
              #190408-00030#1---mark---end--
              #191111-00027#1-----s
              IF l_glac008='1' THEN   
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 
              END IF 
                         
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum = l_sum * -1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum = l_sum * -1
              END IF
              #191111-00027#1-----e              
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum    
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add              
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add   
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44598',g_dlang)    #190221-00009#1  add                
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                  #IF l_glac008='2' THEN
                  #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  #END IF        
                  #190408-00030#1---mark---end--      
                  #191111-00027#1-----s
                  IF l_glac008='1' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1
                  END IF
                  #191111-00027#1-----e
              END IF 
              LET l_tmp.flag='5'
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e        
              #191111-00027#1-----s              
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF 
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              #191111-00027#1-----e              
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
           END FOREACH
           
         ELSE  #冲账参数为1、2时
       
            LET l_sum=0  
            FOREACH aglq510_cur_chk5_5 INTO l_tmp.*,l_xrcc.*
                                                   ,l_xrca.xrca001   #191111-00027#1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk5_5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               
               
              LET l_sum = l_xrcc.xrcc118 - l_xrcc.xrcc119  + l_xrcc.xrce119+ l_xrcc.xrce1191 + l_xrcc.apce119+l_xrcc.xrcf113
               
              #分录底稿金额
              EXECUTE aglq510_pre_chk5 USING l_tmp.xrcbdocno,l_tmp.glaq002 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              #190408-00030#1---mark---str--
              #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
              #IF l_glac008='2' THEN
              #   LET l_tmp.glgb010=l_tmp.glgb010*-1
              #   LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              #END IF      
              #190408-00030#1---mark---end--  
              #191111-00027#1-----s
              IF l_glac008='1' THEN   #albireo 191113
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 
              END IF      
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum=l_sum*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum=l_sum*-1
              END IF
              #191111-00027#1-----e              
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum 
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add                 
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add  
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44598',g_dlang)    #190221-00009#1  add                
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  #190408-00030#1---mark---str--
                  #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark 
                  #IF l_glac008='2' THEN
                  #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                  #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  #END IF      
                  #190408-00030#1---mark---end--   
                  #191111-00027#1-----s
                  IF l_glac008 = '1' THEN 
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1
                  END IF
                  #191111-00027#1-----e                  
              END IF 
              LET l_tmp.flag='5'
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e  
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              #191111-00027#1-----e
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
         END IF
         
      ELSE  #未启用分录
         IF l_sfin2002='3' THEN  #冲账参数3
            LET l_sum=0  
            FOREACH aglq510_cur_chk5_4  INTO l_tmp.*,l_xrcc.*
                                                    ,l_xrca.xrca001   #191111-00027#1
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk5_4'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF

              #将冲销的金额加回
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                 EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                 #科目余额
                 #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                 EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                 #190408-00030#1---mark---str--
                 #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                 #IF l_glac008='2' THEN
                 #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                 #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                 #END IF 
                 #190408-00030#1---mark---end--   
                 #191111-00027#1-----s
                 IF l_glac008='1' THEN   
                    LET l_tmp.glaq010=l_tmp.glaq010*-1
                    LET l_tmp.glaq003=l_tmp.glaq003*-1 
                 END IF 
                 #191111-00027#1-----e                 
              ELSE
                 CONTINUE FOREACH 
              END IF 
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum = l_sum*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum=l_sum*-1
              END IF
              #191111-00027#1-----e
              #子系统本币与总账本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum        
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add                 
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
               WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              #LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00851',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                   
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
              LET l_tmp.flag='5'  
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e  
              #191111-00027#1-----s
               IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              #191111-00027#1-----e
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
            END FOREACH   
            
         ELSE  #冲账参数1/2
            LET l_sum=0  
            

            #add by lixwz210708 e---
            #
            #lixwz
            #尝试修改为中间表方式
            FOREACH aglq510_cur_chk5_5 INTO l_tmp.*,l_xrcc.*
                                                   ,l_xrca.xrca001   #191111-00027#1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk5_5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
             
               
              LET l_sum = l_xrcc.xrcc118 - l_xrcc.xrcc119  + l_xrcc.xrce119+l_xrcc.xrce1191 + l_xrcc.apce119+l_xrcc.xrcf113
                        # 本币应收金额 - 本币收款冲账金额 + 本币冲账金额 + 
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                 #取科目余额
               #   
               #    LET l_sql=" SELECT glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003-glaq004),0) glgb003 ",
               #              " FROM (SELECT glaqdocno,glaq002,",
               #              "              CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END glaq010 ,",
               #              "              glaq003,glaq004",
               #              "         FROM glaq_t WHERE glaqent=",g_enterprise," AND glaqld='",tm.glaald,"' ",
               #              "          AND glaqdocno=? AND glaq002=? )",
               #              " GROUP BY glaqdocno,glaq002  "


                 EXECUTE aglq510_pre_chk5_1 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                 #科目余额
                 #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                 EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                 #190408-00030#1---mark---str--
                 #前面xrcc的金額沒有做正負號處理,都是正數,底下做*-1的動作,後面在檢查l_sum=l_tmp.glgb003會因為一邊是正數一邊是負數,而檢查有錯,所以將下面mark
                 #IF l_glac008='2' THEN
                 #   LET l_tmp.glaq010=l_tmp.glaq010*-1
                 #   LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                 #END IF    
                 #190408-00030#1---mark---end--  
                 #191111-00027#1-----s
                 #根据科目类别，处理正负数
                 IF l_glac008='1' THEN  
                    LET l_tmp.glaq010=l_tmp.glaq010*-1
                    LET l_tmp.glaq003=l_tmp.glaq003*-1
                 END IF    
                 #191111-00027#1-----e                 
              ELSE
                 CONTINUE FOREACH 
              END IF 
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_sum = l_sum*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_sum=l_sum*-1
              END IF
              #191111-00027#1-----e
              #子系统本币与总账本币相等 or 子系统为0不显示
              #IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN   #180716-00006#2 mark
              IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN   #180716-00006#2 add
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum         
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add              
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              #LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00851',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                   
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
              LET l_tmp.flag='5'
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e     
              #191111-00027#1-----s
              IF l_xrca.xrca001 MATCHES '2*' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              IF l_xrca.xrca001 MATCHES '0[246]' THEN
                 LET l_tmp.xrcb105=l_tmp.xrcb105*-1
              END IF
              #191111-00027#1-----e               
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
            
         END IF
      END IF         
   END IF   
       
   
   
   
   
   #6.交易单单别不产生传票
   
   LET l_sql=''
   IF tm.chk_ar='Y' THEN
      LET l_sql = " SELECT '1',xrcb029,'',xrca100,'','','','','','','','',xrcadocno,0,'',NVL(SUM(xrcb105),0),NVL(SUM(xrcb115),0),'','','' ",
               "   FROM xrca_t,xrcb_t",
               "  WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno", 
               "    AND xrcaent =",g_enterprise," AND xrcastus <>'X'",
               "    AND xrcald  ='",tm.glaald,"' AND xrca038 IS NULL ",
               "    AND xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
              #"    AND xrca001 NOT IN('21','24','25','26')",        #190214-00011#1 mark
               "    AND xrca001 NOT IN('21','23','24','25','26')",   #190214-00011#1 add
               #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5'))",#180716-00006#2 mark
               "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5'))",#180716-00006#2 add
               "   GROUP BY xrcb029,xrca100,xrcadocno ",
               " UNION ",
               #应收核销
               " SELECT '1',xrce016,'',xrce100,'','','','','','','','',xrdadocno,0,'',NVL(SUM(xrce109),0),NVL(SUM(xrce119),0),'','','' ",
               "  FROM xrda_t,xrce_t",
               " WHERE xrdaent=xrceent AND xrdald=xrceld AND xrdadocno=xrcedocno", 
               "   AND xrdaent =",g_enterprise," AND xrdastus <>'X'",
               "   AND xrdald  ='",tm.glaald,"' AND xrda014 IS NULL ",
               "   AND xrdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
               #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 AND diff NOT IN('0','5'))", #180716-00006#2 mark
               "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 ",l_wc3," AND diff NOT IN('0','5'))", #180716-00006#2 add
               "   GROUP BY xrce016,xrce100,xrdadocno"
               
   END IF
   IF tm.chk_ap='Y' AND NOT cl_null(l_sql) THEN
      LET l_sql=l_sql," UNION "
   END IF
   IF tm.chk_ap='Y'  THEN
      LET l_sql=l_sql,
                " SELECT '2',apcb029,'',apca100,'','','','','','','','',apcadocno,0,'',NVL(SUM(apcb105),0),NVL(SUM(apcb115),0),'','','' ",
                "   FROM apca_t,apcb_t",
                "  WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno", 
                "    AND apcaent =",g_enterprise," AND apcastus <>'X'",
                "    AND apcald  ='",tm.glaald,"' AND apca038 IS NULL ",
                "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                #"    AND apca001 NOT IN('21','24','25','26')",   #181224-00063#1 mark
                "    AND apca001 NOT IN('21','23','24','25','26')",   #181224-00063#1 add 帳款單性質23:預付待抵單,是當aapt310性質是14:預付應付時產生的,產品已不使用性質14,但會有舊資料問題,故增加排除
                #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5')) ",  #180716-00006#2 mark
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",  #180716-00006#2 add
                "   GROUP BY apcb029,apca100,apcadocno",
                " UNION ",
                #应付核销
                " SELECT '2',apce016,'',apce100,'','','','','','','','',apdadocno,0,'',NVL(SUM(apce109),0),NVL(SUM(apce119),0),'','','' ",
                "  FROM apda_t,apce_t",
                " WHERE apdaent=apceent AND apdald=apceld AND apdadocno=apcedocno", 
                "   AND apdaent =",g_enterprise," AND apdastus <>'X'",
                "   AND apdald  ='",tm.glaald,"' AND apda014 IS NULL ",
                "   AND apdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 AND diff NOT IN('0','5'))",   #180716-00006#2 mark
                "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 ",l_wc3," AND diff NOT IN('0','5'))",   #180716-00006#2 add
                "   GROUP BY apce016,apce100,apdadocno"
   END IF
   
     
               
              
   PREPARE aglq510_pre_chk6 FROM l_sql
   DECLARE aglq510_cur_chk6 CURSOR FOR aglq510_pre_chk6
   
   FOREACH aglq510_cur_chk6 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk6'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_dfin0030 = "Y"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'Y'      
      END IF
      IF l_dfin0030 = "Y" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00831',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44601',g_dlang)    #190221-00009#1  add         
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      LET l_tmp.flag='6'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e  
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
  
   END FOREACH
   
   
   


   
   
   #7.交易单金额与底稿金额不符(启用交易对象才检查)
   #分录底稿sql
   LET l_sql=" SELECT glgbdocno,NVL(SUM(glgb010),0),NVL(SUM(glgb003-glgb004),0) glgb003 ",
             " from (SELECT glgbdocno,glgb002,",
             "              CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END glgb010 ,",
             "              glgb003,glgb004",
             "         FROM glgb_t WHERE glgbent=",g_enterprise," AND glgbld='",tm.glaald,"' ",
             "          AND glgbdocno=? AND glgb002=? AND glgb022=? )",
             " GROUP BY glgbdocno "
   PREPARE aglq510_pre_chk7 FROM l_sql 
   
   #总账sql
   LET l_sql=" SELECT glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003-glaq004),0) glgb003 ",
             " from (SELECT glaqdocno,glaq002,",
             "              CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END glaq010 ,",
             "              glaq003,glaq004",
             "         FROM glaq_t WHERE glaqent=",g_enterprise," AND glaqld='",tm.glaald,"' ",
             "          AND glaqdocno=? AND glaq002=? AND glaq022=?)",
             " GROUP BY glaqdocno  "
   PREPARE aglq510_pre_chk7_1 FROM l_sql
   
   #科目是否开启账款客商核算项
   LET l_sql=" SELECT glad027 FROM glad_t WHERE gladent=",g_enterprise," AND gladld='",tm.glaald,"' AND glad001=?"
   PREPARE aglq510_pre_chk7_6 FROM l_sql
   
   INITIALIZE l_xrcc.* TO NULL 
   INITIALIZE l_tmp.* TO NULL
   
   #应收系统
   IF tm.chk_ar='Y' THEN
      #冲账参数3抓xrcc
      LET l_sql = " SELECT '1',xrcb029,'',xrca100,xrca004,'',xrca038,'','','','','',xrcbdocno,0,'','','','','','', ",
                  "        NVL(SUM(xrcc108),0),NVL(SUM(xrcc109),0),NVL(SUM(t2.xrce109),0),NVL(SUM(t1.xrce1091),0),NVL(SUM(apce109),0),NVL(SUM(xrcf103),0), ",      
                  "        NVL(SUM(xrcc118),0),NVL(SUM(xrcc119),0),NVL(SUM(t2.xrce119),0),NVL(SUM(t1.xrce1191),0),NVL(SUM(apce119),0),NVL(SUM(xrcf113),0) ",
                  "  FROM xrca_t,xrcb_t ",
                  "  LEFT OUTER JOIN xrcc_t ON xrcbent=xrccent AND xrcbld=xrccld AND xrcbdocno=xrccdocno AND xrcbseq=xrccseq ",
                  "  LEFT OUTER JOIN(",
                  "                    SELECT xrce003,xrce004,xrce005,",
                  #180716-00006#2 mark-s
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce103  ELSE xrce109 END xrce1091, ",
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce113  ELSE xrce119 END xrce1191  ",
                  #180716-00006#2 mark-e
                  #180716-00006#2 add-s
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce103)  ELSE SUM(xrce109) END xrce1091, ",
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce113)  ELSE SUM(xrce119) END xrce1191  ",
                  #180716-00006#2 add-e                  
                  "                      FROM xrce_t,xrca_t ",
                  "                     WHERE xrceent = xrcaent ",
                  "                       AND xrceld  = xrcald ",
                  "                       AND xrcedocno = xrcadocno ",
                  "                       AND xrcaent=",g_enterprise ,
                  #"                       AND xrcastus = 'Y' ) t1 ",   #180716-00006#2 mark
                  "                       AND xrcastus = 'Y' GROUP BY xrce003,xrce004,xrce005,xrca001 ) t1 ",   #180716-00006#2 add
                  "               ON xrccdocno= t1.xrce003 AND xrccseq=t1.xrce004 AND xrcc001=t1.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",  #180716-00006#2 mark
                  "                    SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",  #180716-00006#2 add
                  "                      FROM xrce_t,xrda_t ",
                  "                     WHERE xrceent = xrdaent ",
                  "                       AND xrceld  = xrdald ",
                  "                       AND xrcedocno = xrdadocno ",
                  "                       AND xrceent=",g_enterprise ,
                  #"                       AND xrdastus = 'Y' ) t2",  #180716-00006#2 mark
                  "                       AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005) t2",  #180716-00006#2 add
                  "               ON xrccdocno= t2.xrce003 AND xrccseq=t2.xrce004 AND xrcc001=t2.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark
                  "                     SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119",  #180716-00006#2 add
                  "                       FROM apce_t,apda_t ",
                  "                      WHERE apceent = apdaent ",
                  "                        AND apceld  = apdald ",
                  "                        AND apcedocno = apdadocno ",
                  "                        AND apceent=",g_enterprise ,
                  #"                        AND apdastus = 'Y' )",  #180716-00006#2 mark
                  "                        AND apdastus = 'Y' GROUP BY apce003,apce004,apce005)",  #180716-00006#2 add
                  "               ON xrccdocno=apce003  AND xrccseq=apce004 AND xrcc001=apce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrcf008,xrcf009,xrcf010,xrcf103,xrcf113 ", #180716-00006#2 mark
                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113 ", #180716-00006#2 add
                  "                       FROM xrcf_t,xrcb_t ",
                  "                      WHERE xrcfent = xrcbent ",
                  "                        AND xrcfld  = xrcbld ",
                  "                        AND xrcfent=",g_enterprise ,
                  #"                        AND xrcfdocno = xrcbdocno )",  #180716-00006#2 mark
                  "                        AND xrcfdocno = xrcbdocno GROUP BY xrcf008,xrcf009,xrcf010 )",  #180716-00006#2 add
                  "               ON  xrccdocno=xrcf008 AND xrccseq=xrcf009 AND xrcc001=xrcf010 ",
                  " WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno ",
                  "   AND xrcbent=",g_enterprise," AND xrcbld='",tm.glaald,"'",
                  "   AND (xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=xrccent AND xreald=xrccld AND xrea005=xrccdocno AND xrea006=xrccseq AND xrea007=xrcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AR' )) ",
                  "   AND xrcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5') ) ",  #180716-00006#2 mark 
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add                                                     
                  "   GROUP BY xrcb029,xrca100,xrca038,xrcbdocno,xrca004 "
      PREPARE aglq510_pre_chk7_2 FROM l_sql
      DECLARE aglq510_cur_chk7_2 CURSOR FOR aglq510_pre_chk7_2
      
      
      #冲账参数1/2 抓xrca
      LET l_sql = " SELECT '1',xrca035,'',xrca100,xrca004,'',xrca038,'','','','','',xrcadocno,0,'','','','','','', ",
                  "        NVL(SUM(xrcc108),0),NVL(SUM(xrcc109),0),NVL(SUM(t2.xrce109),0),NVL(SUM(t1.xrce1091),0),NVL(SUM(apce109),0),NVL(SUM(xrcf103),0), ",      
                  "        NVL(SUM(xrcc118),0),NVL(SUM(xrcc119),0),NVL(SUM(t2.xrce119),0),NVL(SUM(t1.xrce1191),0),NVL(SUM(apce119),0),NVL(SUM(xrcf113),0) ",
#                  #190514-00012#1---mark---str
#                  "  FROM xrca_t,xrcb_t ",
#                  "  LEFT OUTER JOIN xrcc_t ON xrcbent=xrccent AND xrcbld=xrccld AND xrcbdocno=xrccdocno AND xrcbseq=xrccseq ",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  "  FROM xrca_t",
                  "  LEFT OUTER JOIN xrcc_t ON xrcaent=xrccent AND xrcald=xrccld AND xrcadocno=xrccdocno ",
                  #190514-00012#1---add---end
                  "  LEFT OUTER JOIN(",
                  "                    SELECT xrce003,xrce004,xrce005,",
                  #180716-00006#2 mark-s
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce103  ELSE xrce109 END xrce1091, ",
#                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN xrce113  ELSE xrce119 END xrce1191  ",
                  #180716-00006#2 mark-e
                  #180716-00006#2 add-s
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce103)  ELSE SUM(xrce109) END xrce1091, ",
                  "        CASE WHEN xrca001='21' OR xrca001='25' OR xrca001='26' THEN SUM(xrce113)  ELSE SUM(xrce119) END xrce1191  ",
                  #180716-00006#2 add-e
                  "                      FROM xrce_t,xrca_t ",
                  "                     WHERE xrceent = xrcaent ",
                  "                       AND xrceld  = xrcald ",
                  "                       AND xrcedocno = xrcadocno ",
                  "                       AND xrcaent=",g_enterprise ,
                  #"                       AND xrcastus = 'Y' ) t1 ",  #180716-00006#2 mark
                  "                       AND xrcastus = 'Y' GROUP BY xrce003,xrce004,xrce005,xrca001 ) t1 ",  #180716-00006#2 add
                  "               ON xrccdocno= t1.xrce003 AND xrccseq=t1.xrce004 AND xrcc001=t1.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",  #180716-00006#2 mark
                  "                    SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",  #180716-00006#2 add
                  "                      FROM xrce_t,xrda_t ",
                  "                     WHERE xrceent = xrdaent ",
                  "                       AND xrceld  = xrdald ",
                  "                       AND xrcedocno = xrdadocno ",
                  "                       AND xrceent=",g_enterprise ,
                  #"                       AND xrdastus = 'Y' ) t2",  #180716-00006#2 mark
                  "                       AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005 ) t2",  #180716-00006#2 add
                  "               ON xrccdocno= t2.xrce003 AND xrccseq=t2.xrce004 AND xrcc001=t2.xrce005    ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark 
                  "                     SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119 ",  #180716-00006#2 add
                  "                       FROM apce_t,apda_t ",
                  "                      WHERE apceent = apdaent ",
                  "                        AND apceld  = apdald ",
                  "                        AND apceent=",g_enterprise ,
                  "                        AND apcedocno = apdadocno ",
                  #"                        AND apdastus = 'Y' )", #180716-00006#2 mark
                  "                        AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 )", #180716-00006#2 add
                  "               ON xrccdocno=apce003  AND xrccseq=apce004 AND xrcc001=apce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrcf008,xrcf009,xrcf010,xrcf103,xrcf113 ",  #180716-00006#2 mark
#                  #190514-00012#1---mark---str
#                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113",  #180716-00006#2 add
#                  "                       FROM xrcf_t,xrcb_t ",
#                  "                      WHERE xrcfent = xrcbent ",
#                  "                        AND xrcfent=",g_enterprise ,
#                  "                        AND xrcfld  = xrcbld ",
#                  #"                        AND xrcfdocno = xrcbdocno )",  #180716-00006#2 mark
#                  "                        AND xrcfdocno = xrcbdocno GROUP BY xrcf008,xrcf009,xrcf010 )",  #180716-00006#2 add
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  "                     SELECT xrcf008,xrcf009,xrcf010,SUM(xrcf103) xrcf103,SUM(xrcf113) xrcf113",  
                  "                       FROM xrcf_t,xrca_t ",
                  "                      WHERE xrcfent = xrcaent ",
                  "                        AND xrcfent=",g_enterprise ,
                  "                        AND xrcfld  = xrcald ",
                  "                        AND xrcfdocno = xrcadocno GROUP BY xrcf008,xrcf009,xrcf010 )",  
                  #190514-00012#1---add---end
                  "               ON xrccdocno=xrcf008 AND xrccseq=xrcf009 AND xrcc001=xrcf010 ",
#                  #190514-00012#1---mark---str
#                  " WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno ",
#                  "   AND xrcbent=",g_enterprise," AND xrcbld='",tm.glaald,"'",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---end
                  " WHERE  ",
                  "    xrcaent=",g_enterprise," AND xrcald='",tm.glaald,"'",
                  #190514-00012#1---add---end
                  "   AND (xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=xrccent AND xreald=xrccld AND xrea005=xrccdocno AND xrea006=xrccseq AND xrea007=xrcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AR' )) ",
                  "   AND xrcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 AND diff NOT IN('0','5') ) ",     #180716-00006#2 mark
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca035 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') ) ",     #180716-00006#2 add                                                     
                  "   GROUP BY xrca035,xrca100,xrca038,xrcadocno,xrca004 "
   
   
      PREPARE aglq510_pre_chk7_3 FROM l_sql
      DECLARE aglq510_cur_chk7_3 CURSOR FOR aglq510_pre_chk7_3
      
      
      IF g_glaa121 = 'Y'   THEN
         IF l_sfin1002='3' THEN
           LET l_sum=0         
           FOREACH aglq510_cur_chk7_2  INTO l_tmp.*,l_xrcc.*
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk7_2'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF
              #科目没有开启账款客商核算项不处理
              EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
              IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
              IF l_glad027='N' THEN
                 CONTINUE FOREACH
              END IF              
             

              #将冲销的金额加回
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #分录底稿
              EXECUTE aglq510_pre_chk7 USING l_tmp.xrcbdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              END IF               
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币金额
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44624',g_dlang)    #190221-00009#1  add                
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
              
              #181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              #181204-00026#9 ---e---               
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF                     
              END IF 
              LET l_tmp.flag='7'  
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e                
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
           END FOREACH
           
         ELSE  #冲账参数为1/2时
            
            LET l_sum=0
            FOREACH aglq510_cur_chk7_3 INTO l_tmp.*,l_xrcc.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk7_3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               #科目没有开启账款客商核算项不处理
               EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
               IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
               IF l_glad027='N' THEN
                  CONTINUE FOREACH
               END IF
               
              #将冲销的金额加回 
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
               
              #分录底稿金额
              EXECUTE aglq510_pre_chk7 USING l_tmp.xrcbdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              END IF                      
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum              
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add             
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
               
              #181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              #181204-00026#9 ---e---
              
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44624',g_dlang)    #190221-00009#1  add                 
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF              
              END IF           
              LET l_tmp.flag='7' 
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e              
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
        
         END IF
         
      ELSE  #不启用分录时
         IF l_sfin1002='3' THEN #冲账参数3
            LET l_sum=0         
            FOREACH aglq510_cur_chk7_2  INTO l_tmp.*,l_xrcc.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk7_2'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               #科目没有开启账款客商核算项不处理
               EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
               
               IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
               IF l_glad027='N' THEN
                  CONTINUE FOREACH
               END IF

               #将冲销的金额加回
               LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              
               #总账单号/原币金额/本币金额
               IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF               
               ELSE
                  CONTINUE FOREACH
               END IF 
               
               #子系统本币与总账本币相等 or 子系统为0不显示
               IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                  CONTINUE FOREACH
               END IF
               #子系统原币/本币
               LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
               LET l_tmp.xrcb115=l_sum 
               IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                  CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
               END IF                               #190108-00068#1 add
               #科目名称
               SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
               WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               #交易对象名称
               SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
                WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

              #181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                    #抓AR立帳單頭
                    SELECT xrca057 INTO l_apca057 FROM xrca_t
                     WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                       AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              #181204-00026#9 ---e---
              
               #错误类型
               #LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00852',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                
               #来源作业
               SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               LET l_tmp.flag='7'
               #180716-00006#3 add-s
               IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
               IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
               IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
               IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
               IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
               IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
               #180716-00006#3 add-e               
               INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
            END FOREACH
            
         ELSE  #冲账参数1/2
            LET l_sum=0
            FOREACH aglq510_cur_chk7_3 INTO l_tmp.*,l_xrcc.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk7_3'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               #科目没有开启账款客商核算项不处理
               EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
               IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
               IF l_glad027='N' THEN
                  CONTINUE FOREACH
               END IF
               
               #将冲销的金额加回
               LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
               
               #总账单号/原币金额/本币金额
               IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF               
               ELSE
                  CONTINUE FOREACH
               END IF 
               
               #子系统本币与总账本币相等 or 子系统为0不显示
               IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                  CONTINUE FOREACH
               END IF
               #子系统原币/本币
               LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
               LET l_tmp.xrcb115=l_sum 
               IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                  CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
               END IF                               #190108-00068#1 add
               #科目名称
               SELECT glacl004 INTO l_tmp.glaq002_desc 
                 FROM glacl_t
                WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
               #交易对象名称
               SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
                WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

               #181204-00026#9 ---s---
               IF l_tmp.glaq002 = 'EMPL' THEN
                  #抓AP立帳單頭
                  LET l_apca057 = NULL   
                  SELECT apca057 INTO l_apca057 FROM apca_t
                   WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                     AND apcadocno = l_tmp.xrcbdocno
                  IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                  END IF
                  CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                  IF NOT cl_null(l_apca057_desc)THEN
                     LET l_tmp.glaq022_desc = l_apca057_desc 
                  END IF                
               END IF
               #181204-00026#9 ---e---
               
               #错误类型
               #LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00852',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                
               #来源作业
               SELECT oobx004 INTO l_tmp.gzza001 
                 FROM oobx_t 
                WHERE oobxent=g_enterprise AND oobx001=l_slip
               LET l_tmp.flag='7'
               #180716-00006#3 add-s
               IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
               IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
               IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
               IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
               IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
               IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
               #180716-00006#3 add-e               
               INSERT INTO aglq510_tmp01 VALUES (l_tmp.*) 
            END FOREACH            
         END IF
      END IF
   END IF


      
   #应付系统
   INITIALIZE l_xrcc.* TO NULL 
   INITIALIZE l_tmp.* TO NULL
   IF tm.chk_ap='Y' THEN
   
      #冲账参数3抓apcc
      LET l_sql = " SELECT '2',apcb029,'',apca100,apca004,'',apca038,'','','','','',apcbdocno,0,'','','','','','', ",
                  "        NVL(SUM(apcc108),0),NVL(SUM(apcc109),0),NVL(SUM(t2.apce109),0),NVL(SUM(t1.apce1091),0),NVL(SUM(xrce109),0),NVL(SUM(apcf103),0),",
                  "        NVL(SUM(apcc118),0),NVL(SUM(apcc119),0),NVL(SUM(t2.apce119),0),NVL(SUM(t1.apce1191),0),NVL(SUM(xrce119),0),NVL(SUM(apcf113),0) ",
                  "  FROM apca_t,apcb_t ",
                  "  LEFT OUTER JOIN apcc_t ON apcbent=apccent AND apcbld=apccld AND apcbdocno=apccdocno AND apcbseq=apccseq ",
                  "  LEFT OUTER JOIN(",
                  #"                    SELECT apce003,apce004,apce005,apce109 apce1091,apce119 apce1191 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce1091,SUM(apce119) apce1191 ",  #180716-00006#2 add
                  "                      FROM apce_t,apca_t ",
                  "                     WHERE apceent = apcaent ",
                  "                       AND apceld  = apcald ",
                  "                       AND apcedocno = apcadocno ",
                  "                       AND apcaent=",g_enterprise ,
                  #"                       AND apcastus = 'Y' ) t1 ",   #180716-00006#2 mark
                  "                       AND apcastus = 'Y' GROUP BY apce003,apce004,apce005 ) t1 ",   #180716-00006#2 add
                  "               ON apccdocno= t1.apce003 AND apccseq=t1.apce004 AND apcc001=t1.apce005 ", 
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119 ",  #180716-00006#2 add
                  "                      FROM apce_t,apda_t ",
                  "                     WHERE apceent = apdaent ",
                  "                       AND apceld  = apdald ",
                  "                       AND apcedocno = apdadocno ",
                  "                       AND apceent=",g_enterprise ,
                  #"                       AND apdastus = 'Y' ) t2",  #180716-00006#2 mark
                  "                       AND apdastus = 'Y' GROUP BY apce003,apce004,apce005) t2",  #180716-00006#2 add
                  "               ON apccdocno=t2.apce003 AND apccseq=t2.apce004 AND apcc001=t2.apce005   ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",   #180716-00006#2 mark
                  "                     SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",   #180716-00006#2 add
                  "                       FROM xrce_t,xrda_t ",
                  "                      WHERE xrceent = xrdaent ",
                  "                        AND xrceld  = xrdald ",
                  "                        AND xrcedocno = xrdadocno ",
                  "                        AND xrceent=",g_enterprise ,
                  #"                        AND xrdastus = 'Y' )",  #180716-00006#2 mark 
                  "                        AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005 )",  #180716-00006#2 add
                  "               ON apccdocno=xrce003  AND apccseq=xrce004 AND apcc001=xrce005 ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT apcf008,apcf009,apcf010,apcf103,apcf113 ",  #180716-00006#2 mark
                  "                     SELECT apcf008,apcf009,apcf010,SUM(apcf103) apcf103,SUM(apcf113) apcf113",  #180716-00006#2 add
                  "                       FROM apcf_t,apca_t ",
                  "                      WHERE apcfent = apcaent ",
                  "                        AND apcfld  = apcald ",
                  "                        AND apcfent=",g_enterprise ,
                  #"                        AND apcfdocno = apcadocno )", #180716-00006#2 mark
                  "                        AND apcfdocno = apcadocno group by apcf008,apcf009,apcf010 )", #180716-00006#2 add
                  "               ON  apccdocno=apcf008  AND apccseq=apcf009 AND apcc001=apcf010 ",
                  " WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno ",
                  "   AND apcbent=",g_enterprise," AND apcbld='",tm.glaald,"'",
                  "   AND (apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=apccent AND xreald=apccld AND xrea005=apccdocno AND xrea006=apccseq AND xrea007=apcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AP' )) ",
                  "   AND apcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5') ) ",   #180716-00006#2 mark
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",   #180716-00006#2 add                                                      
                  "   GROUP BY apcb029,apca100,apca038,apcbdocno,apca004 "
      PREPARE aglq510_pre_chk7_4 FROM l_sql
      DECLARE aglq510_cur_chk7_4 CURSOR FOR aglq510_pre_chk7_4
      
      #冲账参数1/2 抓apca
      LET l_sql = " SELECT '2',apca035,'',apca100,apca004,'',apca038,'','','','','',apcadocno,0,'','','','','','', ",
                  "        NVL(SUM(apcc108),0),NVL(SUM(apcc109),0),NVL(SUM(t2.apce109),0),NVL(SUM(t1.apce1091),0),NVL(SUM(xrce109),0),NVL(SUM(apcf103),0),",
                  "        NVL(SUM(apcc118),0),NVL(SUM(apcc119),0),NVL(SUM(t2.apce119),0),NVL(SUM(t1.apce1191),0),NVL(SUM(xrce119),0),NVL(SUM(apcf113),0) ",
#                  #190514-00012#1---mark---str
#                  "  FROM apca_t,apcb_t  ",
#                  "  LEFT OUTER JOIN apcc_t ON apcbent=apccent AND apcbld=apccld AND apcbdocno=apccdocno AND apcbseq=apccseq ",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  "  FROM apca_t  ",
                  "  LEFT OUTER JOIN apcc_t ON apcaent=apccent AND apcald=apccld AND apcadocno=apccdocno ",
                  #190514-00012#1---add---end
                  "  LEFT OUTER JOIN(",
                  #"                    SELECT apce003,apce004,apce005,apce109 apce1091,apce119 apce1191 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce1091,SUM(apce119) apce1191 ",  #180716-00006#2 add
                  "                      FROM apce_t,apca_t ",
                  "                     WHERE apceent = apcaent ",
                  "                       AND apceld  = apcald ",
                  "                       AND apcedocno = apcadocno ",
                  "                       AND apcaent=",g_enterprise ,
                  #"                       AND apcastus = 'Y' ) t1 ",  #180716-00006#2 mark
                  "                       AND apcastus = 'Y' GROUP BY apce003,apce004,apce005 ) t1 ",  #180716-00006#2 add                    
                  "               ON apccdocno= t1.apce003 AND apccseq=t1.apce004 AND apcc001=t1.apce005 ", 
                  "  LEFT OUTER JOIN( ",
                  #"                    SELECT apce003,apce004,apce005,apce109,apce119 ",  #180716-00006#2 mark
                  "                    SELECT apce003,apce004,apce005,SUM(apce109) apce109,SUM(apce119) apce119",  #180716-00006#2 add
                  "                      FROM apce_t,apda_t ",
                  "                     WHERE apceent = apdaent ",
                  "                       AND apceld  = apdald ",
                  "                       AND apcedocno = apdadocno ",
                  "                       AND apceent=",g_enterprise ,
                  #"                       AND apdastus = 'Y' ) t2",  #180716-00006#2 mark
                  "                       AND apdastus = 'Y' GROUP BY apce003,apce004,apce005 ) t2",  #180716-00006#2 add
                  "               ON apccdocno=t2.apce003 AND apccseq=t2.apce004 AND apcc001=t2.apce005   ",
                  "  LEFT OUTER JOIN( ",
                  #"                     SELECT xrce003,xrce004,xrce005,xrce109,xrce119 ",   #180716-00006#2 mark
                  "                     SELECT xrce003,xrce004,xrce005,SUM(xrce109) xrce109,SUM(xrce119) xrce119 ",   #180716-00006#2 add
                  "                       FROM xrce_t,xrda_t ",
                  "                      WHERE xrceent = xrdaent ",
                  "                        AND xrceld  = xrdald ",
                  "                        AND xrcedocno = xrdadocno ",
                  "                        AND xrceent=",g_enterprise ,
                  #"                        AND xrdastus = 'Y' )", #180716-00006#2 mark
                  "                        AND xrdastus = 'Y' GROUP BY xrce003,xrce004,xrce005)", #180716-00006#2 add
                  "               ON apccdocno=xrce003  AND apccseq=xrce004 AND apcc001=xrce005 ",
                  "  LEFT OUTER JOIN( ",
                 #"                     SELECT apcf008,apcf009,apcf010,apcf103,apcf113 ",  #180716-00006#2 mark
                  "                     SELECT apcf008,apcf009,apcf010,SUM(apcf103) apcf103,SUM(apcf113) apcf113 ",  #180716-00006#2 add
                  "                       FROM apcf_t,apca_t ",
                  "                      WHERE apcfent = apcaent ",
                  "                        AND apcfld  = apcald ",
                  "                        AND apcfent=",g_enterprise ,
                  #"                        AND apcfdocno = apcadocno )", #180716-00006#2 mark
                  "                        AND apcfdocno = apcadocno GROUP BY apcf008,apcf009,apcf010 )", #180716-00006#2 add
                  "               ON apccdocno=apcf008 AND apccseq=apcf009 AND apcc001=apcf010  ",
#                  #190514-00012#1---mark---str
#                  " WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno ",
#                  "   AND apcbent=",g_enterprise," AND apcbld='",tm.glaald,"'",
#                  #190514-00012#1---mark---end
                  #190514-00012#1---add---str
                  " WHERE  ",
                  "    apcaent=",g_enterprise," AND apcald='",tm.glaald,"'",
                  #190514-00012#1---add---end
                  "   AND (apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"' OR ",
                  "   EXISTS (SELECT 1 FROM xrea_t WHERE xreaent=apccent AND xreald=apccld AND xrea005=apccdocno AND xrea006=apccseq AND xrea007=apcc001 ",
                  "            AND xrea001<'",tm.glar002,"' AND xrea002<'",tm.glar003,"' AND xrea003='AP' )) ",
                  "   AND apcastus<>'X' ",
                  #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 AND diff NOT IN('0','5') ) ",    #180716-00006#2 mark 
                  "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca035 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",    #180716-00006#2 add                                                     
                  "   GROUP BY apca035,apca100,apca038,apcadocno,apca004 "
      PREPARE aglq510_pre_chk7_5 FROM l_sql
      DECLARE aglq510_cur_chk7_5 CURSOR FOR aglq510_pre_chk7_5
        
      IF g_glaa121 = 'Y'   THEN  #启用分录
         IF l_sfin2002='3' THEN  #冲账参数3
           LET l_sum=0  
           FOREACH aglq510_cur_chk7_4  INTO l_tmp.*,l_xrcc.*
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk7_4'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF
              #科目没有开启账款客商核算项不处理
              EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
              IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
              IF l_glad027='N' THEN
                 CONTINUE FOREACH
              END IF

              #将冲销的金额加回
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #分录底稿金额
              EXECUTE aglq510_pre_chk7 USING l_tmp.xrcbdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              END IF              
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum 
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
                              
              #181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              #181204-00026#9 ---e---
              
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44624',g_dlang)    #190221-00009#1  add                 
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF              
              END IF           
              LET l_tmp.flag='7'              
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e              
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
           END FOREACH
           
         ELSE  #冲账参数为1、2时
       
            LET l_sum=0  
            FOREACH aglq510_cur_chk7_5 INTO l_tmp.*,l_xrcc.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk7_5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               #科目没有开启账款客商核算项不处理
               EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
               IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
               IF l_glad027='N' THEN
                  CONTINUE FOREACH
               END IF
               
              #将冲销的金额加回 
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
               
              #分录底稿金额
              EXECUTE aglq510_pre_chk7 USING l_tmp.xrcbdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
              #科目余额
              #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
              EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
              IF l_glac008='2' THEN
                 LET l_tmp.glgb010=l_tmp.glgb010*-1
                 LET l_tmp.glgb003=l_tmp.glgb003*-1 #180716-00006#2 add
              END IF              
              #子系统本币与底稿本币相等 or 子系统为0不显示
              IF l_sum=l_tmp.glgb003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              
              #子系统原币/本币
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

              ##181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              ##181204-00026#9 ---e---
              
              #错误类型
              LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)
              #建议做法
              LET l_tmp.advise  = cl_getmsg('agl-44624',g_dlang)    #190221-00009#1  add                 
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF                   
              END IF 
              LET l_tmp.flag='7'         
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e               
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
         END IF
         
      ELSE  #未启用分录
         IF l_sfin2002='3' THEN  #冲账参数3
            LET l_sum=0  
            FOREACH aglq510_cur_chk7_4  INTO l_tmp.*,l_xrcc.*
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = 'aglq510_cur_chk7_4'
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 EXIT FOREACH
              END IF
              #科目没有开启账款客商核算项不处理
              EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
              IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
              IF l_glad027='N' THEN
                 CONTINUE FOREACH
              END IF

              #将冲销的金额加回 
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                 EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF              
              ELSE
                 CONTINUE FOREACH 
              END IF 
              
              #子系统本币与总账本币相等 or 子系统为0不显示 
              IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
               WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

              ##181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              ##181204-00026#9 ---e---
              #错误类型
              #LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00852',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
              LET l_tmp.flag='7' 
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e              
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)   
            END FOREACH   
            
         ELSE  #冲账参数1/2
            LET l_sum=0  
            #lixwz
            FOREACH aglq510_cur_chk7_5 INTO l_tmp.*,l_xrcc.*
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'aglq510_cur_chk7_5'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               #科目没有开启账款客商核算项不处理
               EXECUTE aglq510_pre_chk7_6 USING l_tmp.glaq002 INTO l_glad027 
               IF cl_null(l_glad027) THEN LET l_glad027='N' END IF
               IF l_glad027='N' THEN
                  CONTINUE FOREACH
               END IF
               
               
              #将冲销的金额加回 
              LET l_sum=l_xrcc.xrcc118-l_xrcc.xrcc119+l_xrcc.xrce119+l_xrcc.xrce1191+l_xrcc.apce119+l_xrcc.xrcf113
               
              #总账单号/原币金额/本币金额
              IF NOT cl_null(l_tmp.glaqdocno) THEN
                  EXECUTE aglq510_pre_chk7_1 USING l_tmp.glaqdocno,l_tmp.glaq002,l_tmp.glaq022 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
                  #科目余额
                  #EXECUTE aglq510_chk_glac1 INTO l_glac008   #180716-00006#2 mark
                  EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   #180716-00006#2 add
                  IF l_glac008='2' THEN
                     LET l_tmp.glaq010=l_tmp.glaq010*-1
                     LET l_tmp.glaq003=l_tmp.glaq003*-1 #180716-00006#2 add 
                  END IF              
              ELSE
                 CONTINUE FOREACH 
              END IF 
              #子系统本币与总账本币相等 or 子系统为0不显示 
              IF l_sum=l_tmp.glaq003 OR l_sum=0 THEN
                 CONTINUE FOREACH
              END IF
              #子系统原币/本币
              LET l_tmp.xrcb105=l_xrcc.xrcc108-l_xrcc.xrcc109+l_xrcc.xrce109+l_xrcc.xrce1091+l_xrcc.apce109+l_xrcc.xrcf103
              LET l_tmp.xrcb115=l_sum
              IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
                 CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
              END IF                               #190108-00068#1 add
              #科目名称
              SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
              WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
              #交易对象名称
              SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
               WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

              ##181204-00026#9 ---s---
              IF l_tmp.glaq002 = 'EMPL' THEN
                 #抓AP立帳單頭
                 LET l_apca057 = NULL   
                 SELECT apca057 INTO l_apca057 FROM apca_t
                  WHERE apcaent = g_enterprise AND apcald = tm.glaald 
                    AND apcadocno = l_tmp.xrcbdocno
                 IF cl_null(l_apca057)THEN
                     #抓AR立帳單頭
                     SELECT xrca057 INTO l_apca057 FROM xrca_t
                      WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                        AND xrcadocno = l_tmp.xrcbdocno                   
                 END IF
                 CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
                 IF NOT cl_null(l_apca057_desc)THEN
                    LET l_tmp.glaq022_desc = l_apca057_desc 
                 END IF                
              END IF
              ##181204-00026#9 ---e---               
              #错误类型
              #LET l_tmp.message_code  = cl_getmsg('agl-00832',g_dlang)   #181226-00067#1 mark
               LET l_tmp.message_code  = cl_getmsg('agl-00852',g_dlang)   #181226-00067#1 add
               #建议做法
               LET l_tmp.advise  = cl_getmsg('agl-44600',g_dlang)    #190221-00009#1  add                
              #来源作业
              SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
               WHERE oobxent=g_enterprise AND oobx001=l_slip
              LET l_tmp.flag='7'
              #180716-00006#3 add-s
              IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
              IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
              IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
              IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
              IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
              IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
              #180716-00006#3 add-e
              INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
            END FOREACH
            
         END IF
      END IF         
   END IF
   
   
   
   
   #8.违反“agli061会计科目依作业别设定设限维护作业的”设定
   INITIALIZE l_tmp.* TO NULL   
   LET l_sql=''
   IF tm.chk_ar='Y' THEN
      LET l_sql = " SELECT '1',xrcb029,'',xrca100,'','','','','','','','',xrcadocno,0,'',NVL(SUM(xrcb105),0),NVL(SUM(xrcb115),0),'','','' ",
               "   FROM xrca_t,xrcb_t",
               "  WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno", 
               "    AND xrcaent =",g_enterprise," AND xrcastus <>'X'",
               "    AND xrcald  ='",tm.glaald,"'",
               "    AND xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
               "    AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=xrcbent AND glbild=xrcbld AND glbi003=xrcb029 AND glbistus='Y' )",
               #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 )", #180716-00006#2 mark
               "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') )", #180716-00006#2 add
               "   GROUP BY xrcb029,xrca100,xrcadocno ",
               " UNION ",
               #应收核销
               " SELECT '1',xrce016,'',xrce100,'','','','','','','','',xrdadocno,0,'',NVL(SUM(xrce109),0),NVL(SUM(xrce119),0),'','','' ",
               "  FROM xrda_t,xrce_t",
               " WHERE xrdaent=xrceent AND xrdald=xrceld AND xrdadocno=xrcedocno", 
               "   AND xrdaent =",g_enterprise," AND xrdastus <>'X'",
               "   AND xrdald  ='",tm.glaald,"'",
               "   AND xrdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
               "   AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=xrceent AND glbild=xrceld AND glbi003=xrce016 AND glbistus='Y' )",
               #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 )",  #180716-00006#2 mark
               "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrce016 AND glar009=xrce100 ",l_wc3," AND diff NOT IN('0','5') )",  #180716-00006#2 add
               "   GROUP BY xrce016,xrce100,xrdadocno "
               
   END IF
   IF tm.chk_ap='Y' AND NOT cl_null(l_sql) THEN
      LET l_sql=l_sql," UNION "
   END IF
   IF tm.chk_ap='Y'  THEN
      LET l_sql=l_sql,
                " SELECT '2',apcb029,'',apca100,'','','','','','','','',apcadocno,0,'',NVL(SUM(apcb105),0),NVL(SUM(apcb115),0),'','','' ",
                "   FROM apca_t,apcb_t",
                "  WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno", 
                "    AND apcaent =",g_enterprise," AND apcastus <>'X'",
                "    AND apcald  ='",tm.glaald,"' ",
                "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                "    AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=apcbent AND glbild=apcbld AND glbi003=apcb029 AND glbistus='Y' )",
                #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ) ",  #180716-00006#2 mark
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add
                "   GROUP BY apcb029,apca100,apcadocno ",
                " UNION ",
                #应付核销
                " SELECT '2',apce016,'',apce100,'','','','','','','','',apdadocno,0,'',NVL(SUM(apce109),0),NVL(SUM(apce119),0),'','','' ",
                "  FROM apda_t,apce_t",
                " WHERE apdaent=apceent AND apdald=apceld AND apdadocno=apcedocno", 
                "   AND apdaent =",g_enterprise," AND apdastus <>'X'",
                "   AND apdald  ='",tm.glaald,"' ",
                "   AND apdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                "   AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=apceent AND glbild=apceld AND glbi003=apce029 AND glbistus='Y' )",
                #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 )", #180716-00006#2 mark
                "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apce016 AND glar009=apce100 ",l_wc3," AND diff NOT IN('0','5') )", #180716-00006#2 add
                "   GROUP BY apce016,apce100,apdadocno ",
                #费用分摊
                " UNION ",
                " SELECT '2',apdc007,'','','','','','','','','','',apdcdocno,0,'',0,NVL(SUM(apdc213),0),'','','' ",
                "  FROM apda_t,apdc_t ",
                " WHERE apdaent=apdcent AND apdald=apdcld AND apdadocno=apdcdocno ",
                "   AND apdaent =",g_enterprise," AND apdastus <>'X'",
                "   AND apdald  ='",tm.glaald,"' ",
                "   AND apdadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
                "   AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=apdcent AND glbild=apdcld AND glbi003=apdc007 AND glbistus='Y' )",
                #"   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apdc007 )",  #180716-00006#2 mark
                "   AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apdc007 ",l_wc3," AND diff NOT IN('0','5') )",  #180716-00006#2 add
                "   GROUP BY apdc007,apdcdocno "
                     
   END IF
   IF tm.chk_ar='Y' and tm.chk_ap='Y'  THEN
                 #应收/付重评价
      LET l_sql=l_sql," UNION ",
                " SELECT CASE WHEN xreg003='AR' THEN '1' ELSE '2' END sys5,",
                "        xreh019,'',xreh100,'','','','','','','','',xrehdocno,0,'',0,NVL(SUM(xreh115),0),'','','' ",
                "   FROM xreg_t,xreh_t  ",
                "  WHERE xregent=xrehent AND xregld=xrehld AND xregdocno=xrehdocno ",
                "    AND xregent=",g_enterprise," AND xregld='",tm.glaald,"' AND xreg005 IS NULL ",
                "    AND xreg001='",tm.glar002,"' AND xreg002='",tm.glar003,"'",l_wc,
                "    AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=xrehent AND glbild=xrehld AND glbi003=xreh019 AND glbistus='Y' )",
                #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xreh019 AND glar009=xreh100 ) ", #180716-00006#2 mark
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xreh019 AND glar009=xreh100 ",l_wc3," AND diff NOT IN('0','5') ) ", #180716-00006#2 add
                "   GROUP BY xreh019,xreh100,xrehdocno,xreg003 ",
                " UNION ",
                #应收/付暂估回转及重新立暂估
                " SELECT CASE WHEN xrem003='AR' THEN '1' ELSE '2' END sys5,",
                "        xren019,'',xren100,'','','','','','','','',xrendocno,0,'',NVL(SUM(xren105),0),NVL(SUM(xren115),0),'','','' ",
                "   FROM xrem_t,xren_t  ",
                "  WHERE xrement=xrenent  AND xremdocno=xrendocno ",
                "    AND xrement=",g_enterprise," AND xremld='",tm.glaald,"' ",
                "    AND xrem001='",tm.glar002,"' AND xrem002='",tm.glar003,"' ",l_wc1,
                "    AND xrem005 IS NULL AND xrem006 IN ('1','2')",
                "    AND EXISTS (SELECT 1 FROM glbi_t WHERE glbient=xrenent AND glbi003=xren019 AND glbistus='Y' )",
                #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xren019 AND glar009=xren100 ) ",  #180716-00006#2 mark
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xren019 AND glar009=xren100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add
                "   GROUP BY xren019,xren100,xrendocno,xrem003 "
   END IF
   
   PREPARE aglq510_pre_chk8 FROM l_sql
   DECLARE aglq510_cur_chk8 CURSOR FOR aglq510_pre_chk8
   
   FOREACH aglq510_cur_chk8 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk8'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add
       
      #根据科目+单别+对应的程式查看agli061是否有设限
      LET l_cnt=0
      LET l_flag='Y'
      SELECT count(1) INTO l_cnt FROM glbi_t 
       WHERE glbient=g_enterprise AND glbild=tm.glaald
         AND glbi001=l_tmp.gzza001 AND glbi002='2'
         AND glbi003=l_tmp.glaq002 AND (glbi004 = l_slip OR glbi004 = 'ALL')  
      IF l_cnt=0 THEN
         LET l_flag='N'
      END IF
      IF l_flag='N' THEN
         CONTINUE FOREACH
      END IF
      
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00833',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44603',g_dlang)    #190221-00009#1  add      
      LET l_tmp.flag='8'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
  
   END FOREACH
   
   
   
   
   
   
   
   #9.账款冲销参数与会记科目应用方式是否正确 
   IF l_sfin1002 MATCHES '[12]' THEN
      INITIALIZE l_tmp.* TO NULL
      LET l_sql=''
      IF tm.chk_ar='Y' THEN
         LET l_sql = " SELECT '1',xrcb029,'',xrca100,xrca004,'','','','','','','',xrcadocno,0,'',NVL(SUM(xrcb105),0),NVL(SUM(xrcb115),0),'','','',xrca035 ",
                  "            ,xrca036,xrcb021,xrca001 ",  #180716-00006#3 add
                  "   FROM xrca_t,xrcb_t",
                  "  WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno", 
                  "    AND xrcaent =",g_enterprise," AND xrcastus <>'X'",
                  "    AND xrcald  ='",tm.glaald,"' ",
                  "    AND xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                  #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 )",  #180716-00006#2 mark
                  "    AND xrca001 NOT IN('21','24','25','26')",
                  #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5') )",  #180716-00006#2 add  #180716-00006#3 mark
                  #180716-00006#3 add-s
                  "    AND (",
                  "           EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb029 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                  "        OR EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrcb021 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                  "        )",
                  #180716-00006#3 add-e                  
                  "   GROUP BY xrcb029,xrca100,xrca004,xrcadocno,xrca035 ",
                  "            ,xrca036,xrcb021,xrca001 ",  #180716-00006#3 add
                  " UNION ",
                  " SELECT '1',xrca035,'',xrca100,xrca004,'','','','','','','',xrcadocno,0,'',NVL(SUM(xrcb105),0),NVL(SUM(xrcb115),0),'','','',xrcb029 ",
                  "         ,xrca036,xrcb021,xrca001 ",  #180716-00006#3 add
                  "   FROM xrca_t,xrcb_t",
                  "  WHERE xrcaent=xrcbent AND xrcald=xrcbld AND xrcadocno=xrcbdocno", 
                  "    AND xrcaent =",g_enterprise," AND xrcastus <>'X'",
                  "    AND xrcald  ='",tm.glaald,"' ",
                  "    AND xrcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                  #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca035 AND glar009=xrca100)",  #180716-00006#2 mark
                  "    AND xrca001 NOT IN('21','24','25','26')",
                  #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca035 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5'))",  #180716-00006#2 add  #180716-00006#3 mark
                  #180716-00006#3 add-s
                  "    AND (",
                  "           EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca035 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                  "        OR EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xrca036 AND glar009=xrca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                  "        )",
                  #180716-00006#3 add-e                   
                  "   GROUP BY xrca035,xrca100,xrca004,xrcadocno,xrcb029 ",
                  "            ,xrca036,xrcb021,xrca001 " #180716-00006#3 add
              
                  
      END IF
      IF tm.chk_ap='Y' AND NOT cl_null(l_sql) THEN
         LET l_sql=l_sql," UNION "
      END IF
      IF tm.chk_ap='Y'  THEN
         LET l_sql=l_sql,
                   " SELECT '2',apcb029,'',apca100,apca004,'','','','','','','',apcadocno,0,'',NVL(SUM(apcb105),0),NVL(SUM(apcb115),0),'','','',apca035  ",
                   "        ,apca036,apcb021,apca001 ",  #180716-00006#3 add
                   "   FROM apca_t,apcb_t",
                   "  WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno", 
                   "    AND apcaent =",g_enterprise," AND apcastus <>'X'",
                   "    AND apcald  ='",tm.glaald,"'",
                   "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                   #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ) ",  #180716-00006#2 mark
                   "    AND apca001 NOT IN('21','24','25','26')",
                   #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add  #180716-00006#3 mark
                   #180716-00006#3 add-s
                   "    AND (",
                   "           EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb029 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                   "        OR EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apcb021 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                   "        )",
                   #180716-00006#3 add-e                     
                   "   GROUP BY apcb029,apca100,apca004,apcadocno,apca035 ",
                   "        ,apca036,apcb021,apca001 ",  #180716-00006#3 add               
                   " UNION ",                   
                   " SELECT '2',apca035,'',apca100,apca004,'','','','','','','',apcadocno,0,'',NVL(SUM(apcb105),0),NVL(SUM(apcb115),0),'','','',apcb029  ",
                   "        ,apca036,apcb021,apca001 ",  #180716-00006#3 add
                   "   FROM apca_t,apcb_t",
                   "  WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno", 
                   "    AND apcaent =",g_enterprise," AND apcastus <>'X'",
                   "    AND apcald  ='",tm.glaald,"'",
                   "    AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  
                   #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca035 AND glar009=apca100 ) ",  #180716-00006#2 mark
                   "    AND apca001 NOT IN('21','24','25','26')",
                   #"    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca035 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5') ) ",  #180716-00006#2 add  #180716-00006#3 mark
                   #180716-00006#3 add-s
                   "    AND (",
                   "           EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca035 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                   "        OR EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=apca036 AND glar009=apca100 ",l_wc3," AND diff NOT IN('0','5')) ",
                   "        )",
                   #180716-00006#3 add-e                    
                   "   GROUP BY apca035,apca100,apca004,apcadocno,apcb029 ",
                   "        ,apca036,apcb021,apca001 "  #180716-00006#3 add
      END IF
      
      PREPARE aglq510_pre_chk9 FROM l_sql
      DECLARE aglq510_cur_chk9 CURSOR FOR aglq510_pre_chk9
      
      #FOREACH aglq510_cur_chk9 INTO l_tmp.*,l_xrca035  #180716-00006#3 mark
      FOREACH aglq510_cur_chk9 INTO l_tmp.*,l_xrca.*  #180716-00006#3 add       
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'aglq510_cur_chk9'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         
#  #180716-00006#3 mark-s
#         IF l_tmp.glaq002=l_xrca035 THEN
#           CONTINUE FOREACH
#         END IF
#  #180716-00006#3 mark-e  

         #180716-00006#3 add-s
         IF l_xrca.xrca001 MATCHES '1[1346]' THEN   #axrt310/aapt310 要判断单头预收科目与账款科目和单身的科目是否一致
            IF l_tmp.glaq002=l_xrca.xrca035 AND l_xrca.xrca036 =l_xrca.xrcb021  THEN
              CONTINUE FOREACH
            END IF
         ELSE  #只需判断账款科目
            IF l_tmp.glaq002=l_xrca.xrca035 THEN
              CONTINUE FOREACH
            END IF
         END IF 
         #180716-00006#3 add-e
         
         #科目名称
         SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
         WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
         
         #交易对象名称
         SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
         WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

         #181204-00026#9 ---s---
         IF l_tmp.glaq002 = 'EMPL' THEN
            #抓AP立帳單頭
            LET l_apca057 = NULL   
            SELECT apca057 INTO l_apca057 FROM apca_t
             WHERE apcaent = g_enterprise AND apcald = tm.glaald 
               AND apcadocno = l_tmp.xrcbdocno
            IF cl_null(l_apca057)THEN
                #抓AR立帳單頭
                SELECT xrca057 INTO l_apca057 FROM xrca_t
                 WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                   AND xrcadocno = l_tmp.xrcbdocno                   
            END IF
            CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
            IF NOT cl_null(l_apca057_desc)THEN
               LET l_tmp.glaq022_desc = l_apca057_desc 
            END IF                
         END IF
         #181204-00026#9 ---e---
                  
         IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
            CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
            #来源作业
            SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
             WHERE oobxent=g_enterprise AND oobx001=l_slip
         END IF                               #190108-00068#1 add
         #错误类型
         LET l_tmp.message_code  = cl_getmsg('agl-00834',g_dlang)
         #建议做法
         LET l_tmp.advise  = cl_getmsg('agl-44604',g_dlang)    #190221-00009#1  add          
         LET l_tmp.flag='9'
         #180716-00006#3 add-s
         IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
         IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
         IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
         IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
         IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
         IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
         #180716-00006#3 add-e
         INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
     
      END FOREACH
   END IF




   #12.科目夸模组应用
   INITIALIZE l_tmp.* TO NULL
   LET l_glaq004=0
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','','',SUM(glaq004) ",
             "   FROM ( SELECT glaq002,glaq005,glaq022,glaqdocno,glap007,",
             "          (CASE WHEN sys='1' THEN 'AR' WHEN sys='1' THEN 'AP'  END) sys,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007 <>'GL'  AND glapstus<>'X' ",
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND diff NOT IN('0','5') ))",  #180716-00006#2 mark
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 ",l_wc3," AND diff NOT IN('0','5') ))",  #180716-00006#2 add
              "  where glap007<>sys ",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
             
   
   PREPARE aglq510_pre_chk12 FROM l_sql
   DECLARE aglq510_cur_chk12 CURSOR FOR aglq510_pre_chk12
   FOREACH aglq510_cur_chk12 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk12'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang

      ##181204-00026#9 ---s---
      IF l_tmp.glaq002 = 'EMPL' THEN
         #抓AP立帳單頭
         LET l_apca057 = NULL   
         SELECT apca057 INTO l_apca057 FROM apca_t
          WHERE apcaent = g_enterprise AND apcald = tm.glaald 
            AND apcadocno = l_tmp.xrcbdocno
         IF cl_null(l_apca057)THEN
             #抓AR立帳單頭
             SELECT xrca057 INTO l_apca057 FROM xrca_t
              WHERE xrcaent = g_enterprise AND xrcald = tm.glaald 
                AND xrcadocno = l_tmp.xrcbdocno                   
         END IF
         CALL s_axrt300_xrca_ref('xrca057','EMPL',l_apca057,'') RETURNING g_sub_success,l_apca057_desc
         IF NOT cl_null(l_apca057_desc)THEN
            LET l_tmp.glaq022_desc = l_apca057_desc 
         END IF                
      END IF
      #181204-00026#9 ---e---    
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00836',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44605',g_dlang)    #190221-00009#1  add      
      IF l_tmp.sys5='AR' THEN
         LET l_tmp.sys5='1'
      END IF 
      IF l_tmp.sys5='AP' THEN
         LET l_tmp.sys5='2'
      END IF 
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      #LET l_tmp.gzza001='aglt310'   #180716-00006#2 mark
      LET l_tmp.flag='12'
      #180716-00006#2 add-s
      #显示凭证来源单号
      CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_tmp.xrcbdocno   
      #来源单号
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add          
      #180716-00006#2 add-e
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   #补充检核5和检核7：当凭证单号来源由多张账款单抛转产生，当同科目币别模组sum子系统的金额和凭证金额一样时删除检核5和检核7的资料
   INITIALIZE l_tmp.* TO NULL
   LET l_sqL=" SELECT count(1),sys5,glaq002,glaq005,glaq022,glaqdocno,NVL(glaq003,0) glaq003,flag ",
             " FROM aglq510_tmp01 ",
             " WHERE flag IN ('5','7') AND glaqdocno IS NOT NULL ",
             " GROUP BY  sys5,glaq002,glaq005,glaqdocno,glaq003,flag,glaq022 "
   #add by lixwz210710 s---
   LET l_sql =" select a.*,b.cnt2,b.xrcb1152 from (
               SELECT count(1) cnt ,sys5,glaq002,glaq005,glaq022,glaqdocno,NVL(glaq003,0) glaq003,flag  
               FROM TT69331514_AGLQ510_TMP01  
               WHERE flag IN ('5','7') AND glaqdocno IS NOT NULL  
               GROUP BY  sys5,glaq002,glaq005,glaqdocno,glaq003,flag,glaq022
               ) a
               left join (
               SELECT count(1) cnt2,sum(xrcb115) xrcb1152, sys5,glaq002,glaq005,glaqdocno,flag,glaq022
               from TT69331514_AGLQ510_TMP01 group by sys5,glaq002,glaq005,glaqdocno,flag,glaq022
               ) b ON b.sys5=a.sys5  AND a.glaq002=b.glaq002  and a.glaq005 = b.glaq005 and a.glaqdocno=b.glaqdocno
               and a.flag =b.flag and (( a.flag ='7' AND a.glaq022 = b.glaq022 ) OR 1=1)
               where b.cnt2 >1 and b.xrcb1152 <> a.glaq003  "
   #add by lixwz210710 e---
   PREPARE aglq510_pre_tmp01 FROM l_sql
   DECLARE aglq510_cur_tmp01 CURSOR FOR aglq510_pre_tmp01
   
   FOREACH aglq510_cur_tmp01 INTO l_cnt,l_tmp.sys5,l_tmp.glaq002,l_tmp.glaq005,l_tmp.glaq022,l_tmp.glaqdocno,l_tmp.glgb003,l_tmp.flag 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_tmp01'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #同模组/科目/币种是否有同一凭证编号
      LET l_cnt=0
      LET l_sql =" SELECT count(1) ",
                 "   FROM aglq510_tmp01 ",
                 "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                 "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "
      IF l_tmp.flag='7' THEN
         LET l_sql=l_sql," AND glaq022='",l_tmp.glaq022,"'"
      END IF
      PREPARE aglq510_pre_tmp01_1 FROM l_sql
      EXECUTE aglq510_pre_tmp01_1 INTO l_cnt
      
      #将对应的子系统本币金额sum
      LET l_sql =" SELECT SUM(xrcb115) ",
                 "   FROM aglq510_tmp01 ",
                 "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                 "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "
      IF l_tmp.flag='7' THEN
         LET l_sql=l_sql," AND glaq022='",l_tmp.glaq022,"'"
      END IF
      PREPARE aglq510_pre_tmp01_2 FROM l_sql
      EXECUTE aglq510_pre_tmp01_2 INTO l_tmp.xrcb115 

      #科目只对应一张凭证or子系统与总账金额不等的不处理
      IF l_cnt<=1 OR l_tmp.xrcb115<>l_tmp.glgb003 THEN
         CONTINUE FOREACH
      END IF
      
      #子系统汇总后的本币金额与总账相同则删除该科目资料
      IF l_tmp.xrcb115=l_tmp.glgb003 THEN 
         let l_sql="DELETE FROM  aglq510_tmp01",
                   "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                   "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "
         IF l_tmp.flag='7' THEN
            LET l_sql=l_sql," AND glaq022='",l_tmp.glaq022,"'"
         END IF
         PREPARE aglq510_pre_tmp01_3 FROM l_sql
         EXECUTE aglq510_pre_tmp01_3          
      END IF 
      
   END FOREACH
       
              
   
   
END FUNCTION

################################################################################
# Descriptions...: 差异页签资料填充
# Memo...........: 差异页签改为错误明细 #190516-00019#1 mod
# Usage..........: aglq510_b_fill6()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/07/19 By 09232 #180716-00006#1
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill6()
DEFINE l_sql STRING 
#DEFINE l_ac   LIKE type_t.num5  #mark by wy 20210702#1
DEFINE l_ac   LIKE type_t.num10 #add by wy 20210702#1
DEFINE l_flag LIKE type_t.chr1  #180716-00006#3 add
   
   CALL g_glaq6_d.clear()  
   LET l_sql=" SELECT sys5,glaq002,glaq002_desc,glaq005,glaq022,glaq022_desc,glaqdocno,glaq010,glaq003,glgbdocno,glgb010,glgb003, ",
             #190221-00009#1 mark_S 
#             "        xrcbdocno,xrcbseq,gzza001,xrcb105,xrcb115,message_code,advise,flag ", 
#             " FROM aglq510_tmp01",
#             " ORDER BY sys5,glaq002,glaq005,flag "
             #190221-00009#1 mark_E
             #190221-00009#1 add_S             
             #"        xrcbdocno,xrcbseq,gzza001,xrcb105,xrcb115,message_code,advise,flag,message1 FROM ", #mark by wy 20210702#1 拿掉flag字段
             "        xrcbdocno,xrcbseq,gzza001,xrcb105,xrcb115,message_code,advise,message1 FROM ", #add by wy 20210702#1
             "        (SELECT sys5,glaq002,glaq002_desc,glaq005,glaq022,glaq022_desc,glaqdocno,glaq010,glaq003,glgbdocno,glgb010,glgb003, ",
             #"        xrcbdocno,xrcbseq,gzza001,xrcb105,xrcb115,message_code,advise,flag,", #mark by wy 20210702#1
             "        xrcbdocno,xrcbseq,gzza001,xrcb105,xrcb115,message_code,advise,",        #add by wy 20210702#1      
             "        (CASE WHEN flag IN ('1','6','12') THEN '1' ELSE '2' END) AS message1 ",
             " FROM aglq510_tmp01)"                 
             IF tm.chk_show = 'N' THEN 
               LET l_sql = l_sql CLIPPED," WHERE message1 = '2' " 
             END IF
             #LET l_sql = l_sql CLIPPED," ORDER BY sys5,glaq002,glaq005,flag " #mark by wy 20210702#1 拿掉flag字段
             LET l_sql = l_sql CLIPPED," ORDER BY sys5,glaq002,glaq005 " #add by wy 20210702#1  
             #190221-00009#1 add_E           

   PREPARE aglq510_b6_pre FROM l_sql
   DECLARE aglq510_b6_cur CURSOR FOR aglq510_b6_pre
   
   LET l_ac=1
   FOREACH aglq510_b6_cur INTO g_glaq6_d[l_ac].sys5,g_glaq6_d[l_ac].glaq002,g_glaq6_d[l_ac].glaq002_desc,g_glaq6_d[l_ac].glaq005,
                               g_glaq6_d[l_ac].glaq022,g_glaq6_d[l_ac].glaq022_desc,g_glaq6_d[l_ac].glaqdocno,g_glaq6_d[l_ac].glaq010,
                               g_glaq6_d[l_ac].glaq003,g_glaq6_d[l_ac].glgbdocno,g_glaq6_d[l_ac].glgb010,g_glaq6_d[l_ac].glgb003,
                               g_glaq6_d[l_ac].xrcbdocno,g_glaq6_d[l_ac].xrcbseq,g_glaq6_d[l_ac].gzza001,g_glaq6_d[l_ac].xrcb105,
#                               g_glaq6_d[l_ac].xrcb115,g_glaq6_d[l_ac].message_code,g_glaq6_d[l_ac].advise  #190221-00009#1 mark
                          #     g_glaq6_d[l_ac].xrcb115,g_glaq6_d[l_ac].message_code,g_glaq6_d[l_ac].advise,l_flag,g_glaq6_d[l_ac].message1  #190221-00009#1 add #mark by wy 20210702#1
                               g_glaq6_d[l_ac].xrcb115,g_glaq6_d[l_ac].message_code,g_glaq6_d[l_ac].advise,g_glaq6_d[l_ac].message1 #add by wy 20210702#1
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF                               
      #180716-00006#3 add-s
      LET g_glaq6_d[l_ac].diff_1=g_glaq6_d[l_ac].glaq010-g_glaq6_d[l_ac].xrcb105  #子系统与总账差异（原币）
      LET g_glaq6_d[l_ac].diff_2=g_glaq6_d[l_ac].glgb010-g_glaq6_d[l_ac].xrcb105  #子系统与底稿差异（原币）
      LET g_glaq6_d[l_ac].diff_3=g_glaq6_d[l_ac].glaq003-g_glaq6_d[l_ac].xrcb115  #子系统与总账差异（本币）
      LET g_glaq6_d[l_ac].diff_4=g_glaq6_d[l_ac].glgb003-g_glaq6_d[l_ac].xrcb115  #子系统与底稿差异（本币）
      #190221-00009#1 mark_S      
#      IF l_flag MATCHES '[16]' OR l_flag='12'   THEN
#         LET g_glaq6_d[l_ac].message1='1'
#      ELSE
#         LET g_glaq6_d[l_ac].message1='2'
#      END IF 
      #190221-00009#1 mark_E      
      #180716-00006#3 add-e
         
      LET l_ac = l_ac + 1                            
   END FOREACH
   
   
   
   
             
END FUNCTION

################################################################################
# Descriptions...: 根据“勾稽明细”页签资料检核NM模组错误
# Memo...........:
# Usage..........: aglq510_chk_error1()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/08/02 By 09232 #180716-00006#2
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_chk_error2()
DEFINE l_tmp RECORD
      sys5          LIKE type_t.chr500,     #模组别
      glaq002       LIKE glaq_t.glaq002,    #科目
      glaq002_desc  LIKE type_t.chr100,     #科目名称
      glaq005       LIKE glaq_t.glaq005,    #币别
      glaq022       LIKE glaq_t.glaq021,    #交易对象
      glaq022_desc  LIKE type_t.chr100,     #交易对象名称
      glaqdocno     LIKE glaq_t.glaqdocno,  #总账凭证单号
      glaq010       LIKE glaq_t.glaq010,    #总账原币金额
      glaq003       LIKE glaq_t.glaq003,    #总账本币金额
      glgbdocno     LIKE glgb_t.glgbdocno,  #分录底稿单号
      glgb010       LIKE glgb_t.glgb010,    #分录底稿原币金额
      glgb003       LIKE glgb_t.glgb003,    #分录底稿本币金额
      xrcbdocno     LIKE xrcb_t.xrcbdocno,  #子系统单据号码
      xrcbseq       LIKE xrcb_t.xrcbseq,    #明细项次
      gzza001       LIKE oobx_t.oobx004,    #来源作业
      xrcb105       LIKE xrcb_t.xrcb105,    #子系统原币金额
      xrcb115       LIKE xrcb_t.xrcb115,    #子系统本币金额
      message_code  LIKE type_t.chr100,     #错误类型
      advise        LIKE type_t.chr100,     #建议做法
#      flag          LIKE type_t.chr1        #标记错误类型(用于排序)   #191120-00020#1 mark
      flag          LIKE type_t.chr2        #标记错误类型(用于排序)   #191120-00020#1 add
END RECORD
DEFINE l_glaq004    LIKE glaq_t.glaq004    #贷方金额
DEFINE l_sql        STRING
DEFINE l_glac008    LIKE glac_t.glac008
DEFINE l_glap007    LIKE glap_t.glap007 
DEFINE l_sdocno     LIKE glap_t.glapdocno
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE type_t.chr20
DEFINE l_flag       LIKE type_t.chr1  
DEFINE l_date_s     LIKE glav_t.glav004
DEFINE l_date_e     LIKE glav_t.glav004   
DEFINE l_dfin0030   LIKE type_t.chr1 
DEFINE l_wc         STRING
DEFINE l_wc1        STRING
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_xrca035    LIKE xrca_t.xrca035
DEFINE l_sum        LIKE xrca_t.xrca118
DEFINE l_glad027    LIKE glad_t.glad027
#190516-00019#1 add -s
DEFINE l_nmbc002      LIKE nmbc_t.nmbc002
DEFINE l_nmbc002_desc LIKE nmaal_t.nmaal003
#190516-00019#1 add -e

   #取得会计周期起讫日
   SELECT MIN(glav004),MAX(glav004) INTO l_date_s,l_date_e  FROM glav_t 
    WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002 AND glav006=tm.glar003
   
   
   #1、非子系统建立凭证
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',1,SUM(glaq004) ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             #190408-00030#1---mark---str--
             #"          (CASE glac008
             #              WHEN '1' THEN
             #                  CASE 
             #                    WHEN glaq003 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq003 
             #                  END
             #              ELSE
             #                  CASE 
             #                    WHEN glaq004 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq010
             #                  END
             #            END) glaq010,",
             #190408-00030#1---mark---end--
              #190408-00030#1---add---str--
              "          (CASE glac008 ",
              "            WHEN '1' THEN ",
              "                CASE  ",
              "                  WHEN glaq003 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",  #原先是aglq003改成glaq010 
              "                END ",
              "            ELSE ",
              "                CASE ", 
              "                  WHEN glaq004 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",
              "                END ",
              "          END) glaq010,", 
              #190408-00030#1---add---end--           
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007='GL' AND glapstus<>'X' ",
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='4' AND diff NOT IN('0','5') ))",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
              
   PREPARE aglq510_4pre_chk1 FROM l_sql
   DECLARE aglq510_4cur_chk1 CURSOR FOR aglq510_4pre_chk1
   FOREACH aglq510_4cur_chk1 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00826',g_dlang)
      
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44594',g_dlang)    #190221-00009#1  add      
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      LET l_tmp.gzza001='aglt310'
      LET l_tmp.flag='1'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   #2、应过账未过账凭证
   INITIALIZE l_tmp.* TO NULL
   
   LET l_wc=" AND glap007 IN ('NM','GL') "
   
   
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',2,SUM(glaq004),glap007 ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004,glap007 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glapstus NOT IN ('X','S') ",l_wc,
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='4' AND diff NOT IN('0','5') ))",
              " GROUP BY glaq002,glaq005,glaq022,glaqdocno,glap007,sys ",
              " ORDER BY glaq002,glaqdocno "   
    PREPARE aglq510_4pre_chk2 FROM l_sql
    DECLARE aglq510_4cur_chk2 CURSOR FOR aglq510_4pre_chk2
   
    FOREACH aglq510_4cur_chk2 INTO l_tmp.*,l_glaq004,l_glap007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00827',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44595',g_dlang)    #190221-00009#1  add      
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      
      #来源作业
      IF l_glap007='GL'THEN
         LET l_tmp.gzza001='aglt310'
         LET l_tmp.sys5='7'
      ELSE
         #子系统单据号码
         CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_sdocno
         IF NOT cl_null(l_sdocno) THEN #190108-00068#1 add
            CALL s_aooi200_fin_get_slip(l_sdocno) RETURNING l_success,l_slip
            #来源作业
            SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
             WHERE oobxent=g_enterprise AND oobx001=l_slip
          END IF                       #190108-00068#1 add
      END IF
      
      LET l_tmp.flag='2'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   

   
   #3.应抛未抛凭证的交易单据
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=" SELECT sys,nmbt029,'',nmbt100,'','','','','','','','',nmbtdocno,0,'',SUM(nmbt103),SUM(nmbt113),'','',3 ",
             "  FROM ( ",
             "          SELECT sys,nmbt029,nmbt100,nmbtdocno,",
             "                 CASE WHEN nmbt004='1' OR nmbt004='3' THEN nmbt103 ELSE nmbt103*-1 END nmbt103 ,",
             "                 CASE WHEN nmbt004='1' OR nmbt004='3' THEN nmbt113 ELSE nmbt113*-1 END nmbt113 ",
             "           FROM nmbs_t,nmbt_t ",
             "           LEFT JOIN aglq510_tmp  ON nmbt029=glar001 AND nmbt100=glar009  ",
             "           WHERE nmbsent=nmbtent AND nmbsld=nmbtld AND nmbsdocno=nmbtdocno",
            #"             AND nmbtent=",g_enterprise," AND nmbtld='",tm.glaald,"' AND nmbt012 BETWEEN '",l_date_s,"' AND '",l_date_e,"'",    #181204-00026#9  mark
             "             AND nmbtent=",g_enterprise," AND nmbtld='",tm.glaald,"' AND nmbsdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  #181204-00026#9  add                        
             "             AND nmbsstus <>'X' and nmbs003 IS NULL ",
             "             AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=nmbt029 AND glar009=nmbt100 AND sys='4' AND diff NOT IN('0','5') ))", 
             " GROUP BY sys,nmbt029,nmbt100,nmbtdocno ",
             " ORDER BY nmbt029,nmbtdocno " 
   PREPARE aglq510_4pre_chk3 FROM l_sql
   DECLARE aglq510_4cur_chk3 CURSOR FOR aglq510_4pre_chk3
   
   FOREACH aglq510_4cur_chk3 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk3'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00828',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44619',g_dlang)    #190221-00009#1  add  
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      #180716-00006#3 add-s
      LET l_tmp.flag='3'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
   END FOREACH      
             
             
   




   #4.期末调汇单据未产GL
   INITIALIZE l_tmp.* TO NULL
             #anmt821/anmt822应收付票据重评价
   LET l_sql=" SELECT sys,xreh019,'',xreh100,'','','','','','','','',xrehdocno,0,'',0,NVL(SUM(xreh115),0),'','',4 ",
             "   FROM xreg_t,xreh_t  ",
             "   LEFT JOIN aglq510_tmp  ON xreh019=glar001 AND xreh100=glar009  ",
             "  WHERE xregent=xrehent AND xregld=xrehld AND xregdocno=xrehdocno ",
             "    AND xregent=",g_enterprise," AND xregld='",tm.glaald,"' AND xreg005 IS NULL AND xregstus='Y' ",
             "    AND xreg001='",tm.glar002,"' AND xreg002='",tm.glar003,"' AND xreg003='NM' ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=xreh019 AND glar009=xreh100 AND sys='4' AND diff NOT IN('0','5') ) ",   
             "   GROUP BY sys,xreh019,xreh100,xrehdocno",
             #anmt820银行调汇 
             " UNION ",
             " SELECT sys,nmde015,'',nmde100,'','','','','','','','',nmdedocno,0,'',0,NVL(SUM(nmde105),0),'','',4 ", 
             "   FROM nmde_t  ",
             "   LEFT JOIN aglq510_tmp  ON nmde015=glar001 AND nmde100=glar009  ",
             "  WHERE nmdeent=",g_enterprise," AND nmdeld='",tm.glaald,"' AND nmde017 IS NULL ",
             "    AND nmde001='",tm.glar002,"' AND nmde002='",tm.glar003,"' AND nmde003='NM' ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=nmde015 AND glar009=nmde100 AND sys='4' AND diff NOT IN('0','5') ) ",   
             "   GROUP BY sys,nmde015,nmde100,nmdedocno "
   PREPARE aglq510_4pre_chk4 FROM l_sql
   DECLARE aglq510_4cur_chk4 CURSOR FOR aglq510_4pre_chk4
   
   FOREACH aglq510_4cur_chk4 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF             
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00829',g_dlang)
      #建议做法   #NM
      LET l_tmp.advise  = cl_getmsg('agl-44621',g_dlang)    #190221-00009#1  add   
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      #180716-00006#3 add-s
      LET l_tmp.flag='4'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
   END FOREACH    
   
   
   #5.交易单金额与底稿金额不符
   #190516-00019#1 add -s
   #分录底稿sql
   LET l_sql=" SELECT glgbdocno,NVL(SUM(glgb010),0),NVL(SUM(glgb003-glgb004),0) glgb003 ",
             " from (SELECT glgbdocno,glgb002,",
             "              CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END glgb010 ,",
             "              glgb003,glgb004",
             "         FROM glgb_t WHERE glgbent=",g_enterprise," AND glgbld='",tm.glaald,"' ",
             "          AND glgbdocno=? AND glgb002=? )",
             " GROUP BY glgbdocno,glgb002  "
   PREPARE aglq510_4pre_chk5 FROM l_sql 
   #190516-00019#1 add -e
   IF g_glaa121 = 'Y' THEN   #181226-00067#1 add
      INITIALIZE l_tmp.* TO NULL
      #190516-00019#1 mark -s
#      #分录底稿sql
#      LET l_sql=" SELECT glgbdocno,NVL(SUM(glgb010),0),NVL(SUM(glgb003-glgb004),0) glgb003 ",
#                " from (SELECT glgbdocno,glgb002,",
#                "              CASE WHEN glgb003=0 THEN glgb010*-1 ELSE glgb010 END glgb010 ,",
#                "              glgb003,glgb004",
#                "         FROM glgb_t WHERE glgbent=",g_enterprise," AND glgbld='",tm.glaald,"' ",
#                "          AND glgbdocno=? AND glgb002=? )",
#                " GROUP BY glgbdocno,glgb002  "
#      PREPARE aglq510_4pre_chk5 FROM l_sql 
      #190516-00019#1 mark -e
      
      LET l_sql=" SELECT sys,glab005,'',nmbc100,'','','','','','','','',nmbcdocno,0,nmbc001,",
                "        CASE WHEN nmbc006='1' THEN NVL(SUM(nmbc103),0) ELSE NVL(SUM(nmbc103),0)*-1 END,",
                "        CASE WHEN nmbc006='1' THEN NVL(SUM(nmbc113),0) ELSE NVL(SUM(nmbc113),0)*-1 END,",
                "        '','',5 ",
                "   FROM nmbc_t ",
                "   LEFT JOIN nmas_t ON nmbcent=nmasent AND nmbc002=nmas002 AND nmbc100=nmas003  ",
                "   LEFT JOIN glab_t ON nmasent=glabent and nmas002=glab003 AND glab001 = '40' AND glab002 = '40'  ",
                "   LEFT JOIN aglq510_tmp  ON glab005=glar001 AND nmbc100=glar009  ",
                "   LEFT JOIN glaa_t ON nmbcent=glaaent AND nmbccomp=glaacomp AND glaa014='Y' ",
                "  WHERE nmbcent=",g_enterprise," AND glaald='",tm.glaald,"' AND nmbc005 BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
                "    AND nmbcstus <>'X' ",
                "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glab005 AND glar009=nmbc100 AND sys='4' AND diff NOT IN('0','5') )", 
                 " GROUP BY sys,glab005,nmbc100,nmbcdocno,nmbc006,nmbc001 ",
                 " ORDER BY glab005,nmbcdocno "      
      PREPARE aglq510_4pre_chk5_1 FROM l_sql
      DECLARE aglq510_4cur_chk5_1 CURSOR FOR aglq510_4pre_chk5_1
      
      FOREACH aglq510_4cur_chk5_1 INTO l_tmp.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'aglq510_4cur_chk5_1'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         #根据来源单 查总账单号
         IF l_tmp.gzza001 MATCHES 'axr3*' THEN
            SELECT xrca038 INTO l_tmp.glaqdocno 
             FROM xrca_t 
             WHERE xrcaent=g_enterprise AND xrcald=tm.glaald AND xrcadoncno=l_tmp.xrcbdocno 
               AND xrca038 IS NOT NULL  
         END IF
         
         IF l_tmp.gzza001 MATCHES 'aap3*' THEN
            SELECT apca038 INTO l_tmp.glaqdocno 
              FROM apca_t 
             WHERE apcaent=g_enterprise AND apcald=tm.glaald AND apcadoncno=l_tmp.xrcbdocno 
               AND apca038 IS NOT NULL
         END IF     
         
         
         IF l_tmp.gzza001='anmt540' OR l_tmp.gzza001='anmt541' OR l_tmp.gzza001='anmt310' OR l_tmp.gzza001='anmt520' OR l_tmp.gzza001='anmt460' THEN 
            SELECT nmbs003 INTO l_tmp.glaqdocno 
              FROM nmbs_t,nmbt_t
             WHERE nmbsent=nmbtent AND nmbsld=nmbtld AND nmbsdocno=nmbtdocno 
               AND nmbtent=g_enterprise AND nmbtld=tm.glaald AND nmbt002=l_tmp.xrcbdocno AND nmbs003 IS NOT NULL  
               
         END IF
         
         #总账单号null 不对比
         IF cl_null(l_tmp.glaqdocno) THEN
            CONTINUE FOREACH
         END IF      
         
         #总账金额 
         EXECUTE aglq510_4pre_chk5 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
         
         #科目余额形态
         EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   
         IF l_glac008='2' THEN
           LET l_tmp.glaq010=l_tmp.glaq010*-1
           LET l_tmp.glaq003=l_tmp.glaq003*-1 
         END IF
         
         #子系统本币与底稿本币相等 or 子系统为0不显示
         IF l_tmp.xrcb115=l_tmp.glaq003 OR l_sum=0 THEN
           CONTINUE FOREACH
         END IF
         #科目名称
         SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
         WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
         #错误类型
         LET l_tmp.message_code  = cl_getmsg('agl-00830',g_dlang)
         #建议做法
         LET l_tmp.advise  = cl_getmsg('agl-44598',g_dlang)    #190221-00009#1  add          
         #180716-00006#3 add-s
         LET l_tmp.flag='5'
         IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
         IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
         IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
         IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
         IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
         IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
         #180716-00006#3 add-e
         INSERT INTO aglq510_tmp01 VALUES (l_tmp.*) 
      END FOREACH
   END IF   #181226-00067#1 add
   #190516-00019#1 add -s
   #中间层资料
   #总账sql
   LET l_sql=" SELECT glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003-glaq004),0) glgb003 ",
             " FROM (SELECT glaqdocno,glaq002,",
             "              CASE WHEN glaq003=0 THEN glaq010*-1 ELSE glaq010 END glaq010 ,",
             "              glaq003,glaq004",
             "         FROM glaq_t WHERE glaqent=",g_enterprise," AND glaqld='",tm.glaald,"' ",
             "          AND glaqdocno=? AND glaq002=? )",
             " GROUP BY glaqdocno,glaq002  "
   PREPARE aglq510_4pre_chk5_12 FROM l_sql 
   
   LET l_sql=" SELECT sys,glab005,'',nmbc100,'','','','','','','','',nmbcdocno,0,nmbc001,nmbc002,",
             "        CASE WHEN nmbc006='1' THEN NVL(SUM(nmbc103),0) ELSE NVL(SUM(nmbc103),0)*-1 END,",
             "        CASE WHEN nmbc006='1' THEN NVL(SUM(nmbc113),0) ELSE NVL(SUM(nmbc113),0)*-1 END,",
             "        '','',5",
             "   FROM nmbc_t ",
             "   LEFT JOIN nmas_t ON nmbcent=nmasent AND nmbc002=nmas002 AND nmbc100=nmas003  ",
             "   LEFT JOIN glab_t ON nmasent=glabent and nmas002=glab003 AND glab001 = '40' AND glab002 = '40'  ",
             "   LEFT JOIN aglq510_tmp  ON glab005=glar001 AND nmbc100=glar009 AND sys='4' ",
             "   LEFT JOIN glaa_t ON nmbcent=glaaent AND nmbccomp=glaacomp AND glaa014='Y' ",
             "  WHERE nmbcent=",g_enterprise," AND glaald='",tm.glaald,"' AND nmbc005 BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND nmbcstus <>'X' ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glab005 AND glar009=nmbc100 AND sys='4' AND diff NOT IN('0','5') )", 
              " GROUP BY sys,glab005,nmbc100,nmbcdocno,nmbc006,nmbc001,nmbc002",
              " ORDER BY glab005,nmbcdocno,nmbc002"      
   PREPARE aglq510_4pre_chk5_11 FROM l_sql
   DECLARE aglq510_4cur_chk5_11 CURSOR FOR aglq510_4pre_chk5_11

   FOREACH aglq510_4cur_chk5_11 INTO l_tmp.sys5,        l_tmp.glaq002,l_tmp.glaq002_desc,l_tmp.glaq005,  l_tmp.glaq022,l_tmp.glaq022_desc,
                                     l_tmp.glaqdocno,   l_tmp.glaq010,l_tmp.glaq003,     l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003,
                                     l_tmp.xrcbdocno,   l_tmp.xrcbseq,l_tmp.gzza001,     l_nmbc002,      l_tmp.xrcb105,l_tmp.xrcb115,
                                     l_tmp.message_code,l_tmp.advise, l_tmp.flag
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk5_11'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      #根据来源单 查总账单号
      IF l_tmp.gzza001 MATCHES 'axrt3*' THEN
         SELECT xrca038 INTO l_tmp.glaqdocno 
          FROM xrca_t 
          WHERE xrcaent=g_enterprise AND xrcald=tm.glaald AND xrcadoncno=l_tmp.xrcbdocno 
            AND xrca038 IS NOT NULL  
      END IF
      
      IF l_tmp.gzza001 MATCHES 'aapt3*' THEN
         SELECT apca038 INTO l_tmp.glaqdocno 
           FROM apca_t 
          WHERE apcaent=g_enterprise AND apcald=tm.glaald AND apcadoncno=l_tmp.xrcbdocno 
            AND apca038 IS NOT NULL
      END IF     
      
      
      IF l_tmp.gzza001='anmt540' OR l_tmp.gzza001='anmt541' OR l_tmp.gzza001='anmt310' OR l_tmp.gzza001='anmt520' OR l_tmp.gzza001='anmt460' THEN 
      #181219-00040#28---add---(S)#181219-00040#28 mark
      #IF l_tmp.gzza001='anmt540' OR l_tmp.gzza001='anmt541' OR l_tmp.gzza001='anmt310' OR 
      #   l_tmp.gzza001='anmt520' OR l_tmp.gzza001='anmt460' OR l_tmp.gzza001='anmt710'  
      #   THEN 
      #181219-00040#28---add---(E)
         SELECT nmbs003 INTO l_tmp.glaqdocno 
           FROM nmbs_t,nmbt_t
          WHERE nmbsent=nmbtent AND nmbsld=nmbtld AND nmbsdocno=nmbtdocno 
            AND nmbtent=g_enterprise AND nmbtld=tm.glaald AND nmbt002=l_tmp.xrcbdocno AND nmbs003 IS NOT NULL  
            
      END IF
      
      #总账金额 
      EXECUTE aglq510_4pre_chk5_12 USING l_tmp.glaqdocno,l_tmp.glaq002 INTO l_tmp.glaqdocno,l_tmp.glaq010,l_tmp.glaq003
      #底稿金额
      IF g_glaa121 = 'Y' THEN 
         EXECUTE aglq510_4pre_chk5 USING l_tmp.xrcbdocno,l_tmp.glaq002 INTO l_tmp.glgbdocno,l_tmp.glgb010,l_tmp.glgb003
      END IF
      
      #科目余额形态
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008   
      IF l_glac008='2' THEN
        LET l_tmp.glaq010=l_tmp.glaq010*-1
        LET l_tmp.glaq003=l_tmp.glaq003*-1 
        IF g_glaa121 = 'Y' THEN 
           LET l_tmp.glgb010=l_tmp.glgb010*-1
           LET l_tmp.glgb003=l_tmp.glgb003*-1 
        END IF
      END IF
      
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      
      #子系统本币与总账本币相等 or 子系统为0不显示
      IF l_tmp.xrcb115=l_tmp.glaq003 OR l_sum=0 THEN
        CONTINUE FOREACH
      END IF
      IF g_glaa121 = 'Y' THEN 
         #子系统本币与总账本币相等且与底稿本币相等 or 子系统为0不显示
         IF (l_tmp.xrcb115=l_tmp.glaq003 AND l_tmp.xrcb115=l_tmp.glgb003) OR l_sum=0 THEN
           CONTINUE FOREACH
         END IF
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #取账户名称
      CALL s_desc_get_nmas002_desc(l_nmbc002) RETURNING l_nmbc002_desc
      #插入临时表
      INSERT INTO aglq510_tmp02(sys6,glar001,glar001_desc,glar009,nmbx003,nmbx003_desc,
                              soamt5,doamt5,zoamt5,samt5,damt5,zamt5)
      VALUES(l_tmp.sys5,l_tmp.glaq002,l_tmp.glaq002_desc,l_tmp.glaq005,l_nmbc002,l_nmbc002_desc,
             l_tmp.xrcb105,l_tmp.glgb010,l_tmp.glaq010,l_tmp.xrcb115,l_tmp.glgb003,l_tmp.glaq003)
   
   END FOREACH
   #190516-00019#1 add -e
   
   #补充检核5：当凭证单号来源由多张账款单抛转产生，当同科目币别模组sum子系统的金额和凭证金额一样时删除检核5的资料
   INITIALIZE l_tmp.* TO NULL
   LET l_sqL=" SELECT count(1),sys5,glaq002,glaq005,glaq022,glaqdocno,NVL(glaq003,0) glaq003,flag ",
             " FROM aglq510_tmp01 ",
             " WHERE flag IN ('5') AND glaqdocno IS NOT NULL ",
             " GROUP BY  sys5,glaq002,glaq005,glaqdocno,glaq003,flag,glaq022 "
   PREPARE aglq510_4pre_tmp01 FROM l_sql
   DECLARE aglq510_4cur_tmp01 CURSOR FOR aglq510_4pre_tmp01
   
   FOREACH aglq510_4cur_tmp01 INTO l_cnt,l_tmp.sys5,l_tmp.glaq002,l_tmp.glaq005,l_tmp.glaq022,l_tmp.glaqdocno,l_tmp.glgb003,l_tmp.flag
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4pre_tmp01'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #同模组/科目/币种是否有同一凭证编号
      LET l_cnt=0
      LET l_sql =" SELECT count(1) ",
                 "   FROM aglq510_tmp01 ",
                 "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                 "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "
      IF l_tmp.flag='7' THEN
         LET l_sql=l_sql," AND glaq022='",l_tmp.glaq022,"'"
      END IF
      PREPARE aglq510_4pre_tmp01_1 FROM l_sql
      EXECUTE aglq510_4pre_tmp01_1 INTO l_cnt
      
      #将对应的子系统本币金额sum
      LET l_sql =" SELECT SUM(xrcb115) ",
                 "   FROM aglq510_tmp01 ",
                 "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                 "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "
      IF l_tmp.flag='7' THEN
         LET l_sql=l_sql," AND glaq022='",l_tmp.glaq022,"'"
      END IF
      PREPARE aglq510_4pre_tmp01_2 FROM l_sql
      EXECUTE aglq510_4pre_tmp01_2 INTO l_tmp.xrcb115 
      #科目只对应一张凭证or子系统与总账金额不等的不处理
      IF l_cnt<=1 OR l_tmp.xrcb115<>l_tmp.glgb003 THEN
         CONTINUE FOREACH
      END IF
      
      #子系统汇总后的本币金额与总账相同则删除该科目资料
      IF l_tmp.xrcb115=l_tmp.glgb003 THEN 
         let l_sql="DELETE FROM  aglq510_tmp01",
                   "  WHERE sys5='",l_tmp.sys5,"' AND glaq002='",l_tmp.glaq002,"' ", 
                   "    AND glaq005='",l_tmp.glaq005,"' AND glaqdocno='",l_tmp.glaqdocno,"' AND flag='",l_tmp.flag,"' "

         PREPARE aglq510_4pre_tmp01_3 FROM l_sql
         EXECUTE aglq510_4pre_tmp01_3          
      END IF 
      
   END FOREACH
   
   

   #7应立账未立账
   INITIALIZE l_tmp.* TO NULL
             #anmt540/anmt541/anmt310
   LET l_sql=" SELECT sys,glab005,'',nmbb004,'','','','','','','','',nmbbdocno,nmbbseq,'',",
             "        CASE WHEN nmbb001='1' or nmbb001='3' THEN NVL(SUM(nmbb006),0) ELSE NVL(SUM(nmbb006),0)*-1 END,",
             "        CASE WHEN nmbb001='1' or nmbb001='3' THEN NVL(SUM(nmbb007),0) ELSE NVL(SUM(nmbb007),0)*-1 END,",
             "        '','',7 ",
             "   FROM nmba_t,nmbb_t ",
             "   LEFT JOIN nmas_t ON nmbbent=nmasent AND nmbb003=nmas002 AND nmbb004=nmas003  ",
             "   LEFT JOIN glab_t ON nmasent=glabent and nmas002=glab003 AND glab001 = '40' AND glab002 = '40'  ",
             "   LEFT JOIN aglq510_tmp  ON glab005=glar001 AND nmbb004=glar009  ",
             "   LEFT JOIN glaa_t ON nmbbent=glaaent AND nmbbcomp=glaacomp AND glaa014='Y' ",
             "  WHERE nmbaent=nmbbent AND nmbacomp=nmbbcomp AND nmbadocno=nmbbdocno ",
             "    AND nmbbent=",g_enterprise," AND glaald='",tm.glaald,"' AND nmbadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND nmbastus <>'X' and nmba003 IN ('anmt540','anmt541','anmt310','adet402','anmp802','anmt440','aapt352') ", 
            #"    AND nmbastus <>'X' and nmba003 IN ('anmt540','anmt541','anmt310','adet402','anmp802','anmt440','aapt352','anmt710') ", #181219-00040#28 add #181219-00040#28 mark
             "    AND nmba006='Y' ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glab005 AND glar009=nmbb004 AND sys='4' AND diff NOT IN('0','5') )",
             "    AND NOT EXISTS (SELECT 1 FROM nmbt_t WHERE nmbtent=nmbbent AND  nmbt002=nmbbdocno AND nmbt003=nmbbseq  )",             
             " GROUP BY sys,glab005,nmbb004,nmbbdocno,nmbbseq,nmbb001 ",
             #anmt520
             " UNION ",
             " SELECT sys,glab005,'',nmcq100,'','','','','','','','',nmcrdocno,nmcrseq,'',NVL(SUM(nmcr103),0),NVL(SUM(nmcr113),0),'','',7",
             "  FROM nmcr_t,nmcq_t ",
             "   LEFT JOIN nmas_t ON nmcqent=nmasent AND nmcq003=nmas002 AND nmcq100=nmas003  ",
             "   LEFT JOIN glab_t ON nmasent=glabent and nmas002=glab003 AND glab001 = '40' AND glab002 = '40'  ",
             "   LEFT JOIN aglq510_tmp  ON glab005=glar001 AND nmcq100=glar009  ",
             "   LEFT JOIN glaa_t ON nmcqent=glaaent AND nmcqcomp=glaacomp AND glaa014='Y' ",
             "  WHERE nmcrent=nmcqent AND nmcrcomp=nmcqcomp AND nmcrdocno=nmcqdocno ",
             "    AND nmcqent=",g_enterprise," AND glaald='",tm.glaald,"' AND nmcqdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND nmcqstus <>'X'  ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glab005 AND glar009=nmcq100 AND sys='4' AND diff NOT IN('0','5') )", 
             "    AND NOT EXISTS (SELECT 1 FROM nmbt_t WHERE nmbtent=nmcrent AND nmbt002=nmcrdocno AND nmbt003=nmcrseq  )",                
             " GROUP BY sys,glab005,nmcq100,nmcrdocno,nmcrseq ",
             #anmt460/anmt470
             " UNION ",
             " SELECT sys,glab005,'',nmck100,'','','','','','','','',nmcldocno,nmclseq,'',NVL(SUM(nmck103),0),NVL(SUM(nmck113),0),'','',7",
             "  FROM nmcl_t,nmck_t ",
             "   LEFT JOIN nmas_t ON nmckent=nmasent AND nmck004=nmas002 AND nmck100=nmas003  ",
             "   LEFT JOIN glab_t ON nmasent=glabent and nmas002=glab003 AND glab001 = '40' AND glab002 = '40'  ",
             "   LEFT JOIN aglq510_tmp  ON glab005=glar001 AND nmck100=glar009  ",
             "   LEFT JOIN glaa_t ON nmckent=glaaent AND nmckcomp=glaacomp AND glaa014='Y' ",
             "  WHERE nmclent=nmckent AND nmclcomp=nmckcomp AND nmcldocno=nmckdocno ",
             "    AND nmckent=",g_enterprise," AND glaald='",tm.glaald,"' AND nmckdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND nmckstus <>'X'  ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glab005 AND glar009=nmck100 AND sys='4' AND diff NOT IN('0','5') )", 
             "    AND NOT EXISTS (SELECT 1 FROM nmbt_t WHERE nmbtent=nmclent AND nmbt002=nmcldocno AND nmbt003=nmclseq  )",                
             " GROUP BY sys,glab005,nmck100,nmcldocno,nmclseq "
             
   PREPARE aglq510_4pre_chk7 FROM l_sql
   DECLARE aglq510_4cur_chk7 CURSOR FOR aglq510_4pre_chk7
   FOREACH aglq510_4cur_chk7 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk7'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add

      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00838',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44606',g_dlang)    #190221-00009#1  add      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip
      #180716-00006#3 add-s
      LET l_tmp.flag='7'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)     

      
   END FOREACH

   
   #12.科目夸模组应用
   INITIALIZE l_tmp.* TO NULL
   LET l_glaq004=0
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',12,SUM(glaq004) ",
             "   FROM ( SELECT glaq002,glaq005,glaq022,glaqdocno,glap007,",
             "          (CASE WHEN sys='4' THEN 'NM' END) sys,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007 <>'GL'  AND glapstus<>'X' ",
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='4' AND diff NOT IN('0','5') ))",
              "  where glap007<>sys ",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
             
   
   PREPARE aglq510_4pre_chk12 FROM l_sql
   DECLARE aglq510_4cur_chk12 CURSOR FOR aglq510_4pre_chk12
   FOREACH aglq510_4cur_chk12 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_cur_chk12'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00836',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44605',g_dlang)    #190221-00009#1  add      
      IF l_tmp.sys5='NM' THEN
         LET l_tmp.sys5='4'
      END IF 

      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      #LET l_tmp.gzza001='aglt310'   #180716-00006#2 mark
      LET l_tmp.flag='12'
      
      #180716-00006#2 add-s
      #显示凭证来源单号
      CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_tmp.xrcbdocno   
      #来源单号
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add 
      #180716-00006#2 add-e       
      #180716-00006#3 add-s
      LET l_tmp.flag='12'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       
      #180716-00006#3 add-e       
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   #181204-00026#9 ---s---   
   #由傳票角度檢核【現金類科目】glac016='Y', 有無產生相應的nmbc 異動表
   INITIALIZE l_tmp.* TO NULL
   LET l_sql= " SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',1,SUM(glaq004) ",
              "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,       ",
              "          (CASE glac008 WHEN '1' THEN                                 ",
              "              CASE WHEN glaq003 = 0 THEN glaq010*-1 ELSE glaq003 END  ",
              "           ELSE                                                       ",
              "              CASE WHEN glaq004 = 0 THEN glaq010*-1 ELSE glaq010 END  ",
              "           END) glaq010,glaq003,glaq004                               ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007='GL' AND glapstus<>'X' ",
              #科目現金科目卻不存在nmbc
              "            AND glaq002 IN (SELECT glac002 FROM glac_t,glaa_t WHERE glaaent = glacent AND glaa004 = glac001 AND glac016 = 'Y' ",
              "            AND glaaent = ",g_enterprise," AND glaald = '",tm.glaald,"' ",
              "            AND NOT EXISTS (SELECT 1 FROM nmbc_t WHERE nmbcent = glapent AND nmbcdocno = glaqdocno AND nmbcseq = glaqseq) ",
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='4' AND diff NOT IN('0','5') )))",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
              
   PREPARE aglq510_4pre_chk91 FROM l_sql
   DECLARE aglq510_4cur_chk91 CURSOR FOR aglq510_4pre_chk91
   FOREACH aglq510_4cur_chk91 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk91'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00898',g_dlang)      
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-00899',g_dlang)            
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      LET l_tmp.gzza001='aglt310'
      LET l_tmp.flag='2'
      #180716-00006#3 add-s
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       

      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   #181204-00026#9 ---e---   
END FUNCTION

################################################################################
# Descriptions...: 差异页签固资检核
# Memo...........:
# Usage..........: aglq510_chk_error3()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/08/20 By 09232   #180716-00006#3
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_chk_error3()
DEFINE l_tmp RECORD
      sys5          LIKE type_t.chr500,     #模组别
      glaq002       LIKE glaq_t.glaq002,    #科目
      glaq002_desc  LIKE type_t.chr100,     #科目名称
      glaq005       LIKE glaq_t.glaq005,    #币别
      glaq022       LIKE glaq_t.glaq021,    #交易对象
      glaq022_desc  LIKE type_t.chr100,     #交易对象名称
      glaqdocno     LIKE glaq_t.glaqdocno,  #总账凭证单号
      glaq010       LIKE glaq_t.glaq010,    #总账原币金额
      glaq003       LIKE glaq_t.glaq003,    #总账本币金额
      glgbdocno     LIKE glgb_t.glgbdocno,  #分录底稿单号
      glgb010       LIKE glgb_t.glgb010,    #分录底稿原币金额
      glgb003       LIKE glgb_t.glgb003,    #分录底稿本币金额
      xrcbdocno     LIKE xrcb_t.xrcbdocno,  #子系统单据号码
      xrcbseq       LIKE xrcb_t.xrcbseq,    #明细项次
      gzza001       LIKE oobx_t.oobx004,    #来源作业
      xrcb105       LIKE xrcb_t.xrcb105,    #子系统原币金额
      xrcb115       LIKE xrcb_t.xrcb115,    #子系统本币金额
      message_code  LIKE type_t.chr100,     #错误类型
      advise        LIKE type_t.chr100,     #建议做法
#      flag          LIKE type_t.chr1        #标记错误类型(用于排序)   #191120-00020#1 mark
      flag          LIKE type_t.chr2        #标记错误类型(用于排序)   #191120-00020#1 add
END RECORD
DEFINE l_glaq004    LIKE glaq_t.glaq004    #贷方金额
DEFINE l_sql        STRING
DEFINE l_glac008    LIKE glac_t.glac008
DEFINE l_glap007    LIKE glap_t.glap007 
DEFINE l_sdocno     LIKE glap_t.glapdocno
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE type_t.chr20
DEFINE l_flag       LIKE type_t.chr1   
DEFINE l_date_s     LIKE glav_t.glav004
DEFINE l_date_e     LIKE glav_t.glav004   
DEFINE l_dfin0030   LIKE type_t.chr1
DEFINE l_wc         STRING
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_xrca035    LIKE xrca_t.xrca035
DEFINE l_sum        LIKE xrca_t.xrca118
DEFINE l_glad027    LIKE glad_t.glad027
DEFINE l_faaj  RECORD
   faaj001    LIKE faaj_t.faaj001,
   faaj002    LIKE faaj_t.faaj002,
   faaj037    LIKE faaj_t.faaj037,
   flag       LIKE type_t.chr1       #1代表折旧科目，2代表资产科目
END RECORD

DEFINE l_faaj023  LIKE faaj_t.faaj023   #资产科目
DEFINE l_faaj024  LIKE faaj_t.faaj024   #折旧科目


   #取得会计周期起讫日
   SELECT MIN(glav004),MAX(glav004) INTO l_date_s,l_date_e  FROM glav_t 
    WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002 AND glav006=tm.glar003
   

  
   
   #1、非子系统建立凭证
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',1,SUM(glaq004) ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             #190408-00030#1---mark---str--
             #"          (CASE glac008
             #              WHEN '1' THEN
             #                  CASE 
             #                    WHEN glaq003 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq003 
             #                  END
             #              ELSE
             #                  CASE 
             #                    WHEN glaq004 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq010
             #                  END
             #            END) glaq010,",
             #190408-00030#1---mark---end--
              #190408-00030#1---add---str--
              "          (CASE glac008 ",
              "            WHEN '1' THEN ",
              "                CASE  ",
              "                  WHEN glaq003 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",  #原先是aglq003改成glaq010 
              "                END ",
              "            ELSE ",
              "                CASE ", 
              "                  WHEN glaq004 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",
              "                END ",
              "          END) glaq010,", 
              #190408-00030#1---add---end--           
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007='GL' AND glapstus<>'X' ",
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='3' AND diff NOT IN('0','5') ))",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
              
   PREPARE aglq510_3pre_chk1 FROM l_sql
   DECLARE aglq510_3cur_chk1 CURSOR FOR aglq510_3pre_chk1
   FOREACH aglq510_3cur_chk1 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00826',g_dlang)
      
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44594',g_dlang)    #190221-00009#1  add      
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      LET l_tmp.gzza001='aglt310'
      LET l_tmp.flag='1'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF  
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   #2、应过账未过账凭证
   INITIALIZE l_tmp.* TO NULL
   
   LET l_wc=" AND glap007 IN ('FA','GL') "
   
   
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',2,SUM(glaq004),glap007 ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004,glap007 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glapstus NOT IN ('X','S') ",l_wc,
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='3' AND diff NOT IN('0','5') ))",
              " GROUP BY glaq002,glaq005,glaq022,glaqdocno,glap007,sys ",
              " ORDER BY glaq002,glaqdocno "   
    PREPARE aglq510_3pre_chk2 FROM l_sql
    DECLARE aglq510_3cur_chk2 CURSOR FOR aglq510_3pre_chk2
   
    FOREACH aglq510_3cur_chk2 INTO l_tmp.*,l_glaq004,l_glap007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00827',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44595',g_dlang)    #190221-00009#1  add      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      
      #来源作业
      IF l_glap007='GL'THEN
         LET l_tmp.gzza001='aglt310'
         LET l_tmp.sys5='7'
      ELSE
         #子系统单据号码
         CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_sdocno
         IF NOT cl_null(l_sdocno) THEN   #190108-00068#1 add 
            CALL s_aooi200_fin_get_slip(l_sdocno) RETURNING l_success,l_slip
            #来源作业
            SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
             WHERE oobxent=g_enterprise AND oobx001=l_slip
         END IF                          #190108-00068#1 add 
      END IF
      
      LET l_tmp.flag='2'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF      
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   #3.科目夸模组应用
   INITIALIZE l_tmp.* TO NULL
   LET l_glaq004=0
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',12,SUM(glaq004) ",
             "   FROM ( SELECT glaq002,glaq005,glaq022,glaqdocno,glap007,",
             "          (CASE WHEN sys='3' THEN 'FA' END) sys,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007 <>'GL'  AND glapstus<>'X' ",
              "            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='3' AND diff NOT IN('0','5') ))",
              "  where glap007<>sys ",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
             
   
   PREPARE aglq510_3pre_chk12 FROM l_sql
   DECLARE aglq510_3cur_chk12 CURSOR FOR aglq510_3pre_chk12
   FOREACH aglq510_3cur_chk12 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk12'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00836',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44605',g_dlang)    #190221-00009#1  add      
      IF l_tmp.sys5='FA' THEN
         LET l_tmp.sys5='3'
      END IF 

      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      #LET l_tmp.gzza001='aglt310'   #180716-00006#2 mark
      LET l_tmp.flag='12'
      
      #180716-00006#2 add-s
      #显示凭证来源单号
      CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_tmp.xrcbdocno   
      #来源单号
      IF NOT cl_null(l_slip) THEN #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                      #190108-00068#1 add 
      #180716-00006#2 add-e       
      LET l_tmp.flag='12'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF   
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   
   
   
   #4.应抛未抛凭证的交易单据
   INITIALIZE l_tmp.* TO NULL
   #(1).必须产生底稿的作业
   LET l_sql=" SELECT sys,faca020,'',fabg015,fabg006,'','','','','','','',fabgdocno,0,'',0,NVL(SUM(faca009),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN faca_t ON fabgent=facaent AND fabgld=facald AND fabgdocno=facadocno  ",
             "   LEFT JOIN aglq510_tmp ON faca020=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005 IN ('43','44') AND fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=faca020 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5') )",
             "  GROUP BY sys,faca020,fabg015,fabg006,fabgdocno ",
             " UNION ",
             " SELECT sys,faca022,'',fabg015,fabg006,'','','','','','','',fabgdocno,0,'',0,NVL(SUM(faca009),0),'','',4 ",
             "   FROM fabg_t",
             "  INNER JOIN faca_t ON fabgent=facaent AND fabgld=facald AND fabgdocno=facadocno  ",
             "   LEFT JOIN aglq510_tmp ON faca022=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005 IN ('43','44') AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=faca022 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5') )",
             "  GROUP BY sys,faca022,fabg015,fabg006,fabgdocno ",
             " UNION ",
             " SELECT sys,fabh023,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh011),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005='0' AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",              
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh023 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5') )",
             "  GROUP BY sys,fabh023,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabh024,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh008),0),'','',4 ",
             "   FROM fabg_t",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh024=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005='0' AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh024 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5')) ",
             "  GROUP BY sys,fabh024,fabg015,fabgdocno "
   PREPARE aglq510_3pre_chk4 FROM l_sql
   DECLARE aglq510_3cur_chk4 CURSOR FOR aglq510_3pre_chk4
   FOREACH aglq510_3cur_chk4 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF NOT cl_null(l_tmp.xrcbdocno) THEN  #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                                #190108-00068#1 add 
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00828',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44622',g_dlang)    #190221-00009#1  add  
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip

      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       

      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH 

   #(2).由单别控制是否产生凭证资料
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=" SELECT sys,fabh023,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh011),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('14','8','6','21','9','23','24','31','39','45') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh023 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5')) ",
             "  GROUP BY sys,fabh023,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabh024,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh008),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh024=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('14','8','6','21','9','23','24','31','39','45') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh024 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabh024,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabp023,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabp006),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabp_t ON fabgent=fabpent AND fabgld=fabpld AND fabgdocno=fabpdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabp023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('30') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabp023 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabp023,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabp024,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabp007),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabp_t ON fabgent=fabpent AND fabgld=fabpld AND fabgdocno=fabpdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabp023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('30') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabp024 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabp024,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabo026,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabo019),0),'','',4 ",
             "   FROM fabg_t",
             "  INNER JOIN fabo_t ON fabgent=faboent AND fabgld=fabold AND fabgdocno=fabodocno  ",
             "   LEFT JOIN aglq510_tmp ON fabo026=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('4') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabo026 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabo026,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,fabo028,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabo018),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN fabo_t ON fabgent=faboent AND fabgld=fabold AND fabgdocno=fabodocno  ",
             "   LEFT JOIN aglq510_tmp ON fabo026=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('4') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabo028 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabo028,fabg015,fabgdocno ",
             " UNION ",
             " SELECT sys,facc006,'',facc002,'','','','','','','','',fabgdocno,0,'',NVL(SUM(facc004),0),NVL(SUM(facc005),0),'','',4 ",
             "   FROM fabg_t ",
             "  INNER JOIN facc_t ON fabgent=faccent AND fabgld=faccld AND fabgdocno=faccdocno  ",
             "   LEFT JOIN aglq510_tmp ON facc006=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('45') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=facc006 AND glar009=facc002 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,facc006,facc002,fabgdocno "
             
   PREPARE aglq510_3pre_chk4_1 FROM l_sql
   DECLARE aglq510_3cur_chk4_1 CURSOR FOR aglq510_3pre_chk4_1
   FOREACH aglq510_3cur_chk4_1 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add 
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add 
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00828',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44617',g_dlang)    #190221-00009#1  add  
      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip

      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       

      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH 
   
   
   
   
   
   #5交易单科目与固定资产科目不符
   INITIALIZE l_tmp.* TO NULL
   INITIALIZE l_faaj.* TO NULL
   #固资资料
   LET l_sql=" SELECT faaj023,faaj024 ",
             "  FROM faah_t,faaj_t",
             " WHERE faahent=faajent AND faah000=faaj000 AND faah001=faaj037 AND faah003=faaj001 AND faah004=faaj002 ",
             "   AND faahstus='Y' AND faajent=",g_enterprise," AND faajld='",tm.glaald,"' AND faaj001=? and faaj002=? and faaj037=? "
   PREPARE aglq510_3pre_chk5 FROM l_sql  
   
   #交易单资料
   LET l_sql=" SELECT sys,faca020,'',fabg015,fabg006,'','','','','','','',fabgdocno,0,'',0,NVL(SUM(faca009),0),'','',4,",
             "        faca003,faca004,faca005,'1' ",
             "   FROM fabg_t ",
             "  INNER JOIN faca_t ON fabgent=facaent AND fabgld=facald AND fabgdocno=facadocno  ",
             "   LEFT JOIN aglq510_tmp ON faca020=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005 IN ('43','44') AND fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=faca020 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5') )",
             "  GROUP BY sys,faca020,fabg015,fabg006,fabgdocno,faca003,faca004,faca005 ",
             " UNION ",
             " SELECT sys,faca022,'',fabg015,fabg006,'','','','','','','',fabgdocno,0,'',0,NVL(SUM(faca009),0),'','',4, ",
             "        faca003,faca004,faca005,'2' ",
             "   FROM fabg_t ",
             "  INNER JOIN faca_t ON fabgent=facaent AND fabgld=facald AND fabgdocno=facadocno  ",
             "   LEFT JOIN aglq510_tmp ON faca022=glar001 AND fabg015=glar009  ",
             "  WHERE fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",              
             "    AND fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg005 IN ('43','44') AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=faca022 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5') )",
             "  GROUP BY sys,faca022,fabg015,fabg006,fabgdocno,faca003,faca004,faca005 ",
             " UNION ",
             " SELECT sys,fabh023,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh011),0),'','',4, ",
             "        fabh001,fabh002,fabh000,'1' ",
             "   FROM fabg_t ",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"' AND fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('0','14','8','6','21','9','23','24','31','39','45') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh023 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5')) ",
             "  GROUP BY sys,fabh023,fabg015,fabg006,fabgdocno,fabh001,fabh002,fabh000 ",
             " UNION ",
             " SELECT sys,fabh024,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabh008),0),'','',4, ",
             "        fabh001,fabh002,fabh000,'2' ",
             "   FROM fabg_t ",
             "  INNER JOIN fabh_t ON fabgent=fabhent AND fabgld=fabhld AND fabgdocno=fabhdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabh024=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('0','14','8','6','21','9','23','24','31','39','45') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabh024 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabh024,fabg015,fabgdocno,fabh001,fabh002,fabh000 ",
             " UNION ",
             " SELECT sys,fabp023,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabp006),0),'','',4, ",
             "        fabp001,fabp002,fabp000,'2' ",             
             "   FROM fabg_t ",
             "  INNER JOIN fabp_t ON fabgent=fabpent AND fabgld=fabpld AND fabgdocno=fabpdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabp023=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('30') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabp023 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabp023,fabg015,fabgdocno,fabp001,fabp002,fabp000 ",
             " UNION ",
             " SELECT sys,fabp024,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabp007),0),'','',4, ",
             "        fabp001,fabp002,fabp000,'1' ",              
             "   FROM fabg_t",
             "  INNER JOIN fabp_t ON fabgent=fabpent AND fabgld=fabpld AND fabgdocno=fabpdocno  ",
             "   LEFT JOIN aglq510_tmp ON fabp024=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('30') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabp024 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabp024,fabg015,fabgdocno,fabp001,fabp002,fabp000 ",
             " UNION ",
             " SELECT sys,fabo026,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabo019),0),'','',4, ",
             "        fabo001,fabo002,fabo003,'1' ", 
             "   FROM fabg_t ",
             "  INNER JOIN fabo_t ON fabgent=faboent AND fabgld=fabold AND fabgdocno=fabodocno  ",
             "   LEFT JOIN aglq510_tmp ON fabo026=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('4') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabo026 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabo026,fabg015,fabgdocno,fabo001,fabo002,fabo003 ",
             " UNION ",
             " SELECT sys,fabo028,'',fabg015,'','','','','','','','',fabgdocno,0,'',0,NVL(SUM(fabo018),0),'','',4, ",
             "        fabo001,fabo002,fabo003,'2' ", 
             "   FROM fabg_t ",
             "  INNER JOIN fabo_t ON fabgent=faboent AND fabgld=fabold AND fabgdocno=fabodocno  ",
             "   LEFT JOIN aglq510_tmp ON fabo028=glar001 AND fabg015=glar009  ",
             "  WHERE fabgent=",g_enterprise," AND fabgld='",tm.glaald,"'  AND  fabg008 IS NULL AND fabgstus<>'X' ",
             "    AND fabg005 IN ('4') AND fabgdocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'", 
             "    AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=fabo028 AND glar009=fabg015 AND sys='3' AND diff NOT IN('0','5'))",
             "  GROUP BY sys,fabo028,fabg015,fabgdocno,fabo001,fabo002,fabo003 "
   PREPARE aglq510_3pre_chk5_1 FROM l_sql
   DECLARE aglq510_3cur_chk5_1 CURSOR FOR aglq510_3pre_chk5_1
   
   FOREACH aglq510_3cur_chk5_1 INTO l_tmp.*,l_faaj.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_3cur_chk5_1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #取固资科目
      EXECUTE  aglq510_3pre_chk5 USING l_faaj.faaj001,l_faaj.faaj002,l_faaj.faaj037 INTO  l_faaj023,l_faaj024
      IF l_faaj.flag='1' THEN  #累计折旧科目对比  
         IF l_tmp.glaq002=l_faaj024 THEN
            CONTINUE FOREACH
         END IF
      ELSE #资产科目
         IF l_tmp.glaq002=l_faaj023 THEN
            CONTINUE FOREACH
         END IF      
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00842',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44607',g_dlang)    #190221-00009#1  add      
      #来源作业
      SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
       WHERE oobxent=g_enterprise AND oobx001=l_slip

      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF       

      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH    
   
   
   
END FUNCTION

################################################################################
# Descriptions...: 差异页签成本检核
# Memo...........:
# Usage..........: aglq510_chk_error4()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/08/28 By 09232   #180716-00006#3
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_chk_error4()
DEFINE l_tmp RECORD
      sys5          LIKE type_t.chr500,     #模组别
      glaq002       LIKE glaq_t.glaq002,    #科目
      glaq002_desc  LIKE type_t.chr100,     #科目名称
      glaq005       LIKE glaq_t.glaq005,    #币别
      glaq022       LIKE glaq_t.glaq021,    #交易对象
      glaq022_desc  LIKE type_t.chr100,     #交易对象名称
      glaqdocno     LIKE glaq_t.glaqdocno,  #总账凭证单号
      glaq010       LIKE glaq_t.glaq010,    #总账原币金额
      glaq003       LIKE glaq_t.glaq003,    #总账本币金额
      glgbdocno     LIKE glgb_t.glgbdocno,  #分录底稿单号
      glgb010       LIKE glgb_t.glgb010,    #分录底稿原币金额
      glgb003       LIKE glgb_t.glgb003,    #分录底稿本币金额
      xrcbdocno     LIKE xrcb_t.xrcbdocno,  #子系统单据号码
      xrcbseq       LIKE xrcb_t.xrcbseq,    #明细项次
      gzza001       LIKE oobx_t.oobx004,    #来源作业
      xrcb105       LIKE xrcb_t.xrcb105,    #子系统原币金额
      xrcb115       LIKE xrcb_t.xrcb115,    #子系统本币金额
      message_code  LIKE type_t.chr100,     #错误类型
      advise        LIKE type_t.chr100,     #建议做法
#      flag          LIKE type_t.chr1        #标记错误类型(用于排序)  #191120-00020#1 mark
      flag          LIKE type_t.chr2        #标记错误类型(用于排序)   #191120-00020#1 add
END RECORD
DEFINE l_glaq004    LIKE glaq_t.glaq004    #贷方金额
DEFINE l_sql        STRING
DEFINE l_glac008    LIKE glac_t.glac008
DEFINE l_glap007    LIKE glap_t.glap007 
DEFINE l_sdocno     LIKE glap_t.glapdocno
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE type_t.chr20
DEFINE l_flag       LIKE type_t.chr1  
DEFINE l_date_s     LIKE glav_t.glav004
DEFINE l_date_e     LIKE glav_t.glav004   
DEFINE l_dfin0030   LIKE type_t.chr1
DEFINE l_wc         STRING
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_xrca035    LIKE xrca_t.xrca035
DEFINE l_sum        LIKE xrca_t.xrca118
DEFINE l_glad027    LIKE glad_t.glad027
DEFINE l_xcck055    LIKE xcck_t.xcck055 #判断哪只账务作业 
DEFINE l_glac011    LIKE glac_t.glac011




   #取得会计周期起讫日
   SELECT MIN(glav004),MAX(glav004) INTO l_date_s,l_date_e  FROM glav_t 
    WHERE glavent=g_enterprise AND glav001=g_glaa003 AND glav002=tm.glar002 AND glav006=tm.glar003
   

  
   
   #1、非子系统建立凭证
   INITIALIZE l_tmp.* TO NULL
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',1,SUM(glaq004) ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             #190408-00030#1---mark---str--
             #"          (CASE glac008
             #              WHEN '1' THEN
             #                  CASE 
             #                    WHEN glaq003 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq003 
             #                  END
             #              ELSE
             #                  CASE 
             #                    WHEN glaq004 = 0 THEN
             #                     glaq010*-1
             #                    ELSE
             #                     glaq010
             #                  END
             #            END) glaq010,",
             #190408-00030#1---mark---end--
              #190408-00030#1---add---str--
              "          (CASE glac008 ",
              "            WHEN '1' THEN ",
              "                CASE  ",
              "                  WHEN glaq003 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",  #原先是aglq003改成glaq010 
              "                END ",
              "            ELSE ",
              "                CASE ", 
              "                  WHEN glaq004 = 0 THEN ",
              "                   glaq010*-1 ",
              "                  ELSE ",
              "                   glaq010 ",
              "                END ",
              "          END) glaq010,", 
              #190408-00030#1---add---end--            
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007='GL' AND glapstus<>'X' ",
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='5' AND diff NOT IN('0','5') ))",   #190604-00035#1 mark
              "            AND tmp.sys = '5' ",               #190604-00035#1 add
              "            AND tmp.diff NOT IN ('0','5') ",   #190604-00035#1 add
              "       ) ",                                    #190604-00035#1 add
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
              
   PREPARE aglq510_5pre_chk1 FROM l_sql
   DECLARE aglq510_5cur_chk1 CURSOR FOR aglq510_5pre_chk1
   FOREACH aglq510_5cur_chk1 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00826',g_dlang)
      
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44594',g_dlang)    #190221-00009#1  add      
      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      LET l_tmp.gzza001='aglt310'
      LET l_tmp.flag='1'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF  
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   #2、应过账未过账凭证
   INITIALIZE l_tmp.* TO NULL
   
   LET l_wc=" AND glap007 IN ('XC','GL') "
   
   
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',2,SUM(glaq004),glap007 ",
             "   FROM ( SELECT tmp.sys sys,glaq002,glaq005,glaq022,glaqdocno,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004,glap007 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glapstus NOT IN ('X','S') ",l_wc,
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='5' AND diff NOT IN('0','5') ))",   #190604-00035#1 mark
              "            AND tmp.sys = '5' ",               #190604-00035#1 add
              "            AND tmp.diff NOT IN ('0','5') ",   #190604-00035#1 add
              "       ) ",                                    #190604-00035#1 add
              " GROUP BY glaq002,glaq005,glaq022,glaqdocno,glap007,sys ",
              " ORDER BY glaq002,glaqdocno "   
    PREPARE aglq510_5pre_chk2 FROM l_sql
    DECLARE aglq510_5cur_chk2 CURSOR FOR aglq510_5pre_chk2
   
    FOREACH aglq510_5cur_chk2 INTO l_tmp.*,l_glaq004,l_glap007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00827',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44595',g_dlang)    #190221-00009#1  add       
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      
      #来源作业
      IF l_glap007='GL'THEN
         LET l_tmp.gzza001='aglt310'
         LET l_tmp.sys5='7'
      ELSE
         #子系统单据号码
         CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_sdocno
         IF NOT cl_null(l_sdocno) THEN #190108-00068#1 add  
            CALL s_aooi200_fin_get_slip(l_sdocno) RETURNING l_success,l_slip
            #来源作业
            SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
             WHERE oobxent=g_enterprise AND oobx001=l_slip
          END IF                       #190108-00068#1 add 
      END IF
      
      LET l_tmp.flag='2'
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF      
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   
   
   
   
   
   #3.科目夸模组应用
   INITIALIZE l_tmp.* TO NULL
   LET l_glaq004=0
   LET l_sql=" SELECT sys,glaq002,'',glaq005,glaq022,'',glaqdocno,NVL(SUM(glaq010),0),NVL(SUM(glaq003),0),'','','','',0,'','','','','',12,SUM(glaq004) ",
             "   FROM ( SELECT glaq002,glaq005,glaq022,glaqdocno,glap007,",
             "          (CASE WHEN sys='5' THEN 'XC' END) sys,",
             "          (CASE glac008
                           WHEN '1' THEN
                               CASE 
                                 WHEN glaq003 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq003 
                               END
                           ELSE
                               CASE 
                                 WHEN glaq004 = 0 THEN
                                  glaq010*-1
                                 ELSE
                                  glaq010
                               END
                         END) glaq010,",
              "          glaq003,glaq004 ",
              "           FROM glap_t,glaq_t",
              "           LEFT JOIN glac_t ON glacent=glaqent AND glac002=glaq002 AND glac001='",g_glaa004,"'",
              "           LEFT JOIN aglq510_tmp tmp ON glaq002=tmp.glar001 AND glaq005=tmp.glar009  ",
              "          WHERE glapent=glaqent AND glapld=glaqld AND glapdocno=glaqdocno ",
              "            AND glapent=",g_enterprise," AND glapld='",tm.glaald,"' AND glap002='",tm.glar002,"' AND glap004='",tm.glar003,"'",
              "            AND glap007 <>'GL'  AND glapstus<>'X' ",
              #"            AND EXISTS (SELECT 1 FROM aglq510_tmp WHERE glar001=glaq002 AND glar009=glaq005 AND sys='5' AND diff NOT IN('0','5') ))",   #190604-00035#1 mark
              "            AND tmp.sys = '5' ",               #190604-00035#1 add
              "            AND tmp.diff NOT IN ('0','5') ",   #190604-00035#1 add
              "       ) ",                                    #190604-00035#1 add
              "  where glap007<>sys ",
              " GROUP BY sys,glaq002,glaq005,glaq022,glaqdocno ",
              " ORDER BY glaq002,glaqdocno "
             
   
   PREPARE aglq510_5pre_chk12 FROM l_sql
   DECLARE aglq510_5cur_chk12 CURSOR FOR aglq510_5pre_chk12
   FOREACH aglq510_5cur_chk12 INTO l_tmp.*,l_glaq004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_4cur_chk12'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      #交易对象名称
      SELECT pmaal004 INTO l_tmp.glaq022_desc FROM pmaal_t
      WHERE pmaalent=g_enterprise AND pmaal001=l_tmp.glaq022 AND  pmaal002=g_dlang
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00836',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44605',g_dlang)    #190221-00009#1  add      
      IF l_tmp.sys5='XC' THEN
         LET l_tmp.sys5='5'
      END IF 

      
      #余额形态      
      EXECUTE aglq510_chk_glac1 USING l_tmp.glaq002 INTO l_glac008
      #总账本币金额
      IF l_glac008='1' THEN
         LET l_tmp.glaq003=l_tmp.glaq003-l_glaq004
      ELSE
         LET l_tmp.glaq003=l_glaq004-l_tmp.glaq003
      END IF
      #LET l_tmp.gzza001='aglt310'   #180716-00006#2 mark
      LET l_tmp.flag='12'
      
      #显示凭证来源单号
      CALL aglt310_07(tm.glaald,l_tmp.glaqdocno,1) RETURNING l_tmp.xrcbdocno   
      #来源单号
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip     
      END IF                               #190108-00068#1
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF   
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   
   #4.當期應審核未審核、應產生傳票未產生傳票號
   INITIALIZE l_tmp.* TO NULL
   LET l_sql="SELECT '5','','','','','','','','','','','',xceadocno,'','','','','','','4' ",
             "  FROM xcea_t ",
             " WHERE xceaent=",g_enterprise," AND xceald='",tm.glaald,"' AND xcea004='",tm.glar002,"' AND xcea005='",tm.glar003,"'",
             "   AND xcea002 IN ('1','2','3','4','5','6','7') AND xcea101 IS NULL AND xceastus IN ('N','Y') "
             
   PREPARE aglq510_5pre_chk4 FROM l_sql
   DECLARE aglq510_5cur_chk4 CURSOR FOR aglq510_5pre_chk4
   FOREACH aglq510_5cur_chk4 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_5cur_chk4'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_dfin0030 = "N"
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
      END IF                               #190108-00068#1 add
      #取得该单据的单别参数是否要拋凭证
      CALL s_fin_get_doc_para(tm.glaald,tm.glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF cl_null(l_dfin0030) THEN
         LET l_dfin0030 = 'N'      
      END IF
      IF l_dfin0030 = "N" THEN
         CONTINUE FOREACH
      END IF
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00828',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44623',g_dlang)    #190221-00009#1  add  
      
      #来源单号
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         #来源作业
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip    
      END IF                               #190108-00068#1 add
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH 
   
   
   
   
   
   

   #5.應產生账务資料,卻未產生
   
   INITIALIZE l_tmp.* TO NULL
             #axct701
   LET l_sql="SELECT '5','','','','','','','','','','','','','','','','','','','5',xcck055 ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 IN ('301','3011','3012','207') AND xcck202>0 AND xcck001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcckent AND xceald=xcckld AND xcea004=xcck004 AND xcea005=xcck005 AND  xcea002='1') ",
             " UNION ",
             #axct702
             "SELECT '5','','','','','','','','','','','','','','','','','','','5',xcck055 ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 IN ('203','205','209','2030','2050','2090') AND xcck202>0 AND xcck001='1'  ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcckent AND xceald=xcckld AND xcea004=xcck004 AND xcea005=xcck005 AND  xcea002='2') ",
             " UNION ",
             #axct704
             "SELECT '5','','','','','','','','','','','','','','','','','','','5',xcck055 ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 = '311' AND xcck202>0 AND xcck001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcckent AND xceald=xcckld AND xcea004=xcck004 AND xcea005=xcck005 AND  xcea002='4') ",             
             " UNION ",
            #axct706
            "SELECT '5','','','','','','','','','','','','','','','','','','','5',xcck055 ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 IN ('303','305','307','215') AND xcck202>0 AND xcck001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcckent AND xceald=xcckld AND xcea004=xcck004 AND xcea005=xcck005 AND  xcea002='6') ", 
             " UNION ",
             #axct707
             "SELECT '5','','','','','','','','','','','','','','','','','','','5',xcck055 ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 IN('309X','305X') AND xcck202>0 AND xcck001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcckent AND xceald=xcckld AND xcea004=xcck004 AND xcea005=xcck005 AND  xcea002='7') ",
             " UNION ",
             #axct703
             "SELECT '5','','','','','','','','','','','','','','','','','','','5','03' ",
             "  FROM xcco_t ",
             " WHERE xccoent=",g_enterprise," AND xccold='",tm.glaald,"' AND xcco004='",tm.glar002,"' AND xcco005='",tm.glar003,"'",
             "   AND xcco010<>'4' AND xcco001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xccoent AND xceald=xccold AND xcea004=xcco004 AND xcea005=xcco005 AND  xcea002='3') ",
             " UNION ",
             #axct705
             "SELECT '5','','','','','','','','','','','','','','','','','','','5','05'",
             "  FROM xccd_t ",
             " WHERE xccdent=",g_enterprise," AND xccdld='",tm.glaald,"' AND xccd004='",tm.glar002,"' AND xccd005='",tm.glar003,"'",
             "   AND xccd304<>'4' AND xccd001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xccdent AND xceald=xccdld AND xcea004=xccd004 AND xcea005=xccd005 AND  xcea002='5') ",
             #axct705
             " UNION ",
             "SELECT '5','','','','','','','','','','','','','','','','','','','5','05' ",
             "  FROM xcch_t ",
             " WHERE xcchent=",g_enterprise," AND xcchld='",tm.glaald,"' AND xcch004='",tm.glar002,"' AND xcch005='",tm.glar003,"'",
             "   AND xcch304<>'4' AND xcch001='1' ",
             "   AND NOT EXISTS (SELECT 1 FROM xcea_t WHERE xceaent=xcchent AND xceald=xcchld AND xcea004=xcch004 AND xcea005=xcch005 AND  xcea002='5') "

   PREPARE aglq510_5pre_chk5 FROM l_sql
   DECLARE aglq510_5cur_chk5 CURSOR FOR aglq510_5pre_chk5
   FOREACH aglq510_5cur_chk5 INTO l_tmp.*,l_xcck055
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_5cur_chk5'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00846',g_dlang)
      #来源作业
      IF l_xcck055 ='301' OR l_xcck055='3011' OR l_xcck055='3012' OR l_xcck055='207' THEN
         LET l_tmp.gzza001='axct701'
      END IF

      IF l_xcck055 matches '20[359]' OR l_xcck055='2030' OR l_xcck055='2050' OR l_xcck055='2090' THEN
         LET l_tmp.gzza001='axct702'
      END IF
      
      IF l_xcck055 ='03' THEN
         LET l_tmp.gzza001='axct703'
      END IF
      
      IF l_xcck055 ='311'  THEN
         LET l_tmp.gzza001='axct704'
      END IF
      
      IF l_xcck055 ='05'  THEN
         LET l_tmp.gzza001='axct705'
      END IF

      IF l_xcck055 matches '30[357]' OR l_xcck055='215' THEN
         LET l_tmp.gzza001='axct706'
      END IF
      IF l_xcck055 ='309X' or l_xcck055='305X' THEN
         LET l_tmp.gzza001='axct707'
      END IF
      #建议做法
#190221-00009#1  add_S
      CASE l_tmp.gzza001
         WHEN 'axct701'
            LET l_tmp.advise  = cl_getmsg('agl-44610',g_dlang)
         WHEN 'axct702'
            LET l_tmp.advise  = cl_getmsg('agl-44611',g_dlang)
         WHEN 'axct703'
            LET l_tmp.advise  = cl_getmsg('agl-44612',g_dlang)
         WHEN 'axct704'
            LET l_tmp.advise  = cl_getmsg('agl-44613',g_dlang)
         WHEN 'axct705'
            LET l_tmp.advise  = cl_getmsg('agl-44614',g_dlang)
         WHEN 'axct706'
            LET l_tmp.advise  = cl_getmsg('agl-44615',g_dlang)
         WHEN 'axct707'
            LET l_tmp.advise  = cl_getmsg('agl-44616',g_dlang)
      END CASE      
#190221-00009#1  add_E  
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
   
   
   
   
   
   
   
   
   #6.1 不應列存貨科目者
   INITIALIZE l_tmp.* TO NULL
   LET l_sql="SELECT '5',apcb021,'',apca100,'','','','','','','','',apcbdocno,'','',NVL(SUM(apcb103),0),NVL(SUM(apcb113),0),'','','5', ",
             "       glac011 ",
             "  FROM apca_t,apcb_t ",
             "  LEFT JOIN glac_t ON apcbent=glacent AND apcb021=glac002 AND glac001='",g_glaa004,"'",
             "  LEFT JOIN imaa_t ON apcbent=imaaent AND apcb004=imaa001  ",
             " WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno ",
             #"   AND apcaent=",g_enterprise," AND apcbld='",tm.glaald,"' AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_s,"'", #190416-00021#1 mark
             "   AND apcaent=",g_enterprise," AND apcbld='",tm.glaald,"' AND apcadocdt BETWEEN '",l_date_s,"' AND '",l_date_e,"'",  #190416-00021#1 add
             "   AND apcastus<>'X' AND apcb004 IS NOT NULL AND imaa004 NOT IN ('A','M') ",
             " GROUP BY apcb021,apca100,apcbdocno,glac011 "
   PREPARE aglq510_5pre_chk6_1 FROM l_sql
   DECLARE aglq510_5cur_chk6_1 CURSOR FOR aglq510_5pre_chk6_1
   FOREACH aglq510_5cur_chk6_1 INTO l_tmp.*,l_glac011
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_5cur_chk6_1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF l_glac011<>'05' THEN
         CONTINUE FOREACH 
      END IF
      #科目名称
      SELECT glacl004 INTO l_tmp.glaq002_desc FROM glacl_t
      WHERE glaclent=g_enterprise AND glacl001=g_glaa004 AND glacl002=l_tmp.glaq002 AND glacl003=g_dlang
      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00847',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44608',g_dlang)    #190221-00009#1  add        
      #来源作业
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add
       
      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF   
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH 









   #6.2應列存貨科目未列正確科目者
   INITIALIZE l_tmp.* TO NULL

   LET l_sql="SELECT '5',apcb021,'',apca100,'','','','','','','','',apcbdocno,'','',apcb105,apcb115,'','','5' ",             
             "  FROM (",
             "         SELECT apcb021,apca100,apcbdocno,NVL(SUM(apcb105),0) apcb105,NVL(SUM(apcb115),0) apcb115,xcck055,glcc002,glcc005 ",
             "           FROM apca_t,apcb_t ",
#             "          INNER JOIN xcck_t ON apcbent=xcckent AND apcbld=xcckld AND apcbdocno=xcck006 AND apcbseq=xcck007 ",   #190806-00030#1---mark
             "          INNER JOIN xcck_t ON apcbent=xcckent AND apcbld=xcckld AND apcb002=xcck006 AND apcb003=xcck007 ", #190806-00030#1---add
             "           LEFT JOIN imag_t ON apcbent=imagent AND apcb004=imag001 AND imagsite='",tm.glaacomp,"'",
             "           LEFT JOIN imaf_t ON apcbent=imafent AND apcb004=imaf001 AND imafsite='",tm.glaacomp,"'",
             "           LEFT JOIN (",
             "                      SELECT pmdtdocno,pmdtseq,pmdt016,pmds012",
             "                        FROM pmds_t,pmdt_t ",
             #"                       WHERE pmdsent=pmdtent AND pmdsdocno=pmdtdocno )", #190416-00021#1 mark
             "                       WHERE pmdsent=pmdtent AND pmdsdocno=pmdtdocno AND pmdsent = ",g_enterprise," AND pmdssite = '",tm.glaacomp,"')", #190416-00021#1 add             "                          ON apcb002=pmdtdocno AND apcb003=pmdtseq ",
             "           LEFT JOIN glcc_t ON apcbent=glccent AND apcbld=glccld ",
             "                           AND (glcc011= imag011 OR glcc011='*') ",
             "                           AND (glcc012= imaf141 OR glcc012 = '*') ",    
             "                           AND (glcc013= pmds012 OR glcc013 = '*') ",
             "                           AND (glcc014='",tm.glaacomp,"' OR glcc014='*')",
             "                           AND (glcc015= pmdt016 OR glcc015 = '*')",
             "                           AND (glcc016= apcb004 OR glcc016 = '*') ", 
             "          WHERE apcaent=apcbent AND apcald=apcbld AND apcadocno=apcbdocno AND glcc001 = '1' ",
             "            AND xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "            AND xcck055 IN ('2011','203','2030')",
             "          GROUP BY apcb021,apca100,apcbdocno,xcck055,glcc002,glcc005 ",
             "        )",
             " WHERE CASE WHEN xcck055='2011' THEN glcc002  ELSE glcc005  END <>apcb021  "
             
   PREPARE aglq510_5pre_chk6_2 FROM l_sql
   DECLARE aglq510_5cur_chk6_2 CURSOR FOR aglq510_5pre_chk6_2
   FOREACH aglq510_5cur_chk6_2 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_5cur_chk6_2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      

      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00848',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44608',g_dlang)    #190221-00009#1  add        
      #来源作业
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add

      IF cl_null(l_tmp.glgb010) THEN  LET l_tmp.glgb010=0 END IF 
      IF cl_null(l_tmp.glgb003) THEN  LET l_tmp.glgb003=0 END IF 
      IF cl_null(l_tmp.glaq010) THEN  LET l_tmp.glaq010=0 END IF 
      IF cl_null(l_tmp.glaq003) THEN  LET l_tmp.glaq003=0 END IF 
      IF cl_null(l_tmp.xrcb105) THEN  LET l_tmp.xrcb105=0 END IF 
      IF cl_null(l_tmp.xrcb115) THEN  LET l_tmp.xrcb115=0 END IF   
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH







   #6.3本月有入庫,但無AP立帳記錄
   INITIALIZE l_tmp.* TO NULL
   LET l_sql="SELECT '5','','','','','','','','','','','',xcck006,xcck007,'','','','','','5' ",
             "  FROM xcck_t ",
             " WHERE xcckent=",g_enterprise," AND xcckld='",tm.glaald,"' AND xcck004='",tm.glar002,"' AND xcck005='",tm.glar003,"'",
             "   AND xcck055 IN ('2011','203','2030') AND xcck001='1' ",
#             "   AND NOT EXISTS (select 1 FROM apcb_t WHERE apcbent=xcckent AND apcbld=xcckld AND apcbdocno=xcck006 AND apcbseq=xcck007 )"  #190806-00030#1---mark
             "   AND NOT EXISTS (select 1 FROM apcb_t WHERE apcbent=xcckent AND apcbld=xcckld AND apcb002=xcck006 AND apcb003=xcck007 )"   #190806-00030#1---add

   PREPARE aglq510_5pre_chk6_3 FROM l_sql
   DECLARE aglq510_5cur_chk6_3 CURSOR FOR aglq510_5pre_chk6_3
   FOREACH aglq510_5cur_chk6_3 INTO l_tmp.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'aglq510_5cur_chk6_3'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      
      #错误类型
      LET l_tmp.message_code  = cl_getmsg('agl-00849',g_dlang)
      #建议做法
      LET l_tmp.advise  = cl_getmsg('agl-44609',g_dlang)    #190221-00009#1  add        
      #来源作业
      IF NOT cl_null(l_tmp.xrcbdocno) THEN #190108-00068#1 add
         CALL s_aooi200_fin_get_slip(l_tmp.xrcbdocno) RETURNING l_success,l_slip
         SELECT oobx004 INTO l_tmp.gzza001 FROM oobx_t 
          WHERE oobxent=g_enterprise AND oobx001=l_slip
      END IF                               #190108-00068#1 add
      
      INSERT INTO aglq510_tmp01 VALUES (l_tmp.*)
      
   END FOREACH
END FUNCTION

################################################################################
# Descriptions...: 取单据别开始位置和长度
# Memo...........:
# Usage..........: CALL aglq510_get_slip()
#                  RETURNING r_success,r_str_pos,r_end_pos
# Return code....: r_success   回传成功否
#                : r_str_pos   单别开始位置
#                : r_slip_len  单别长度
# Date & Author..: 2018/10/12  By 09232 #180815-00022#1
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_get_slip()
   DEFINE r_success   LIKE type_t.num5                  #回传参数1 回传成功否，标识单号检查是否成功 TRUE/FALSE
   DEFINE r_str_pos   LIKE type_t.num5                  #回传参数2 單別開始位置
   DEFINE r_slip_len  LIKE type_t.num5                  #回传参数3 單別長度
   DEFINE l_str_pos   LIKE type_t.num5                  #單別開始位置
   DEFINE l_con       LIKE type_t.num5                  #據點與單別間是否有分隔符號
   DEFINE l_site_len  LIKE type_t.num5                  #SITE段长度
   DEFINE l_slip_len  LIKE type_t.num5                  #单别段长度

   WHENEVER ERROR CONTINUE
   #预设值
   LET r_success = TRUE
   LET r_str_pos = 0
   LET r_slip_len = 0   

   #據點與單別間是否有分隔符號
   IF cl_get_para(g_enterprise,'','E-COM-0002') ='Y' THEN
      LET l_con     =1
   ELSE
      LET l_con     =0
   END IF

   #據點段長度
   LET l_site_len = cl_get_para(g_enterprise,'','E-COM-0003')
   IF l_site_len IS NULL THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00310'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success =FALSE
      LET r_str_pos = 0
      LET r_slip_len = 0    
      RETURN r_success,r_str_pos,r_slip_len
   END IF

   #單別段長度
   LET l_slip_len = cl_get_para(g_enterprise,'','E-COM-0001')
   IF l_slip_len IS NULL THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00310'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success =FALSE
      LET r_str_pos = 0
      LET r_slip_len = 0   
      RETURN r_success,r_str_pos,r_slip_len
   END IF

   IF cl_get_para(g_enterprise,'','E-COM-0008') = '1' THEN    #據點+單別
      LET l_str_pos = l_site_len+l_con+1
   ELSE                                                       #單別+據點
      LET l_str_pos = 1
   END IF

   LET r_str_pos = l_str_pos
   LET r_slip_len = l_slip_len

   RETURN r_success,r_str_pos,r_slip_len
END FUNCTION

################################################################################
# Descriptions...: 差异页签
# Memo...........:
# Usage..........: CALL aglq510_b_fill7()
# Input parameter: 
# Return code....: 
# Date & Author..: #190516-00019#1 add by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq510_b_fill7()
   DEFINE l_sql STRING
   DEFINE l_ac   LIKE type_t.num5
   
   CALL g_glar5_d.clear()  
   LET l_sql=" SELECT sys6,glar001,glar001_desc,glar009,glar017,glar017_desc,nmbx003,nmbx003_desc,",
             "        NVL(SUM(soamt5),0),NVL(SUM(doamt5),0),NVL(SUM(zoamt5),0),NVL(SUM(samt5),0),NVL(SUM(damt5),0),NVL(SUM(zamt5),0) ",
             "   FROM aglq510_tmp02",
             "  GROUP BY sys6,glar001,glar001_desc,glar009,glar017,glar017_desc,nmbx003,nmbx003_desc", 
             "  ORDER BY sys6,glar001,glar009,glar017,nmbx003"                       

   PREPARE aglq510_b7_pre FROM l_sql
   DECLARE aglq510_b7_cur CURSOR FOR aglq510_b7_pre
   
   LET l_ac=1
   FOREACH aglq510_b7_cur INTO g_glar5_d[l_ac].sys6,   g_glar5_d[l_ac].glar001,g_glar5_d[l_ac].glar001_desc,g_glar5_d[l_ac].glar009,g_glar5_d[l_ac].glar017,g_glar5_d[l_ac].glar017_desc,
                               g_glar5_d[l_ac].nmbx003,g_glar5_d[l_ac].nmbx003_desc,
                               g_glar5_d[l_ac].soamt5, g_glar5_d[l_ac].doamt5, g_glar5_d[l_ac].zoamt5,      g_glar5_d[l_ac].samt5,  g_glar5_d[l_ac].damt5,  g_glar5_d[l_ac].zamt5
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF   
      IF cl_null(g_glar5_d[l_ac].glar001)THEN CONTINUE FOREACH END IF      
      LET l_ac = l_ac + 1                            
   END FOREACH
   CALL g_glar5_d.deleteElement(g_glar5_d.getLength())   
END FUNCTION

PRIVATE FUNCTION  aglq510_getmsg() 

   LET g_agl00826 = cl_getmsg('agl-00826',g_dlang)
   LET g_agl00827 = cl_getmsg('agl-00827',g_dlang)
   LET g_agl00828 = cl_getmsg('agl-00828',g_dlang)
   LET g_agl00829 = cl_getmsg('agl-00829',g_dlang)
   LET g_agl00830 = cl_getmsg('agl-00830',g_dlang)
   LET g_agl00831 = cl_getmsg('agl-00831',g_dlang)
   LET g_agl00832 = cl_getmsg('agl-00832',g_dlang)
   LET g_agl00833 = cl_getmsg('agl-00833',g_dlang)
   LET g_agl00834 = cl_getmsg('agl-00834',g_dlang)
   LET g_agl00836 = cl_getmsg('agl-00836',g_dlang)
   LET g_agl00836 = cl_getmsg('agl-00836',g_dlang)
   LET g_agl00838 = cl_getmsg('agl-00838',g_dlang)
   LET g_agl00842 = cl_getmsg('agl-00842',g_dlang)
   LET g_agl00846 = cl_getmsg('agl-00846',g_dlang)
   LET g_agl00847 = cl_getmsg('agl-00847',g_dlang)
   LET g_agl00848 = cl_getmsg('agl-00848',g_dlang)
   LET g_agl00849 = cl_getmsg('agl-00849',g_dlang)
   LET g_agl00851 = cl_getmsg('agl-00851',g_dlang)
   LET g_agl00852 = cl_getmsg('agl-00852',g_dlang)
   LET g_agl00898 = cl_getmsg('agl-00898',g_dlang)
   LET g_agl00899 = cl_getmsg('agl-00899',g_dlang)
   LET g_agl44594 = cl_getmsg('agl-44594',g_dlang)
   LET g_agl44595 = cl_getmsg('agl-44595',g_dlang)
   LET g_agl44597 = cl_getmsg('agl-44597',g_dlang)
   LET g_agl44598 = cl_getmsg('agl-44598',g_dlang)
   LET g_agl44598 = cl_getmsg('agl-44598',g_dlang)
   LET g_agl44600 = cl_getmsg('agl-44600',g_dlang)
   LET g_agl44600 = cl_getmsg('agl-44600',g_dlang)
   LET g_agl44601 = cl_getmsg('agl-44601',g_dlang)
   LET g_agl44603 = cl_getmsg('agl-44603',g_dlang)
   LET g_agl44604 = cl_getmsg('agl-44604',g_dlang)
   LET g_agl44605 = cl_getmsg('agl-44605',g_dlang)
   LET g_agl44606 = cl_getmsg('agl-44606',g_dlang)
   LET g_agl44607 = cl_getmsg('agl-44607',g_dlang)
   LET g_agl44608 = cl_getmsg('agl-44608',g_dlang)
   LET g_agl44608 = cl_getmsg('agl-44608',g_dlang)
   LET g_agl44609 = cl_getmsg('agl-44609',g_dlang)
   LET g_agl44610 = cl_getmsg('agl-44610',g_dlang)
   LET g_agl44611 = cl_getmsg('agl-44611',g_dlang)
   LET g_agl44612 = cl_getmsg('agl-44612',g_dlang)
   LET g_agl44613 = cl_getmsg('agl-44613',g_dlang)
   LET g_agl44614 = cl_getmsg('agl-44614',g_dlang)
   LET g_agl44615 = cl_getmsg('agl-44615',g_dlang)
   LET g_agl44616 = cl_getmsg('agl-44616',g_dlang)
   LET g_agl44617 = cl_getmsg('agl-44617',g_dlang)
   LET g_agl44618 = cl_getmsg('agl-44618',g_dlang)
   LET g_agl44619 = cl_getmsg('agl-44619',g_dlang)
   LET g_agl44620 = cl_getmsg('agl-44620',g_dlang)
   LET g_agl44621 = cl_getmsg('agl-44621',g_dlang)
   LET g_agl44623 = cl_getmsg('agl-44623',g_dlang)
   LET g_agl44624 = cl_getmsg('agl-44624',g_dlang)
END FUNCTION

 
{</section>}
 
