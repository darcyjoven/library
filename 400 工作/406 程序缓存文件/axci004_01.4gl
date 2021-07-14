#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axci004_01.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0031(2019-12-18 10:12:38), PR版次:0031(2021-01-20 13:59:47)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000644
#+ Filename...: axci004_01
#+ Description: 成本BOM引入作業
#+ Creator....: 02291(2013-11-28 10:29:13)
#+ Modifier...: 12133 -SD/PR- 14586
 
{</section>}
 
{<section id="axci004_01.global" type="s" >}
#應用 c01b 樣板自動產生(Version:14)
#add-point:填寫註解說明 name="global.memo"
# mod 141223 add by zhangllc 项次key
#160318-00005#45  2016/03/26  By pengxin     修正azzi920重复定义之错误讯息
#160727-00019#20  2016/08/4   By 08742       系统中定义的临时表名称超过15码在执行时会出错,将系统中定义的临时表长度超过15码的改掉
#                                            Mod  axci004_01_ins_tmp--> axci004_tmp01
#160902-00048#2   2016/09/06  By 02097       針對SQL的WHERE條件中缺少ent的清單做補強
#161124-00048#16  2016/12/16  By 08734       星号整批调整
#161130-00004#1   2016/12/22  By Charles4m   調整計算項次的方式
#171027-00008#1   2017/10/27  By 05599       抓取bmaa_t時，再多加一個imaa_t並使用別名去關聯bmaa003元件料號，並增加條件imaa_t 別名<> 'X'
#171030-00022#1   2017/11/04  by 09767       抓取资料时，只取主键料号（后面有展开）
#171228-00016#1   2017/12/28  By 02295       效能优化
#171227-00001#1   2017/12/28  By 02295       1.当BOM中有虚拟件时,产生的资料会重复
#                                            2.虚拟件不产生时主件底数要冲重新计算
#171229-00014#1   2017/12/29  By 02295       BOM发料单位与基础单位不一样时,需要将发料单位转换成基础单位
#180118-00044#1   2017/01/19  By 02294       修正#171227-00001#1单号调整select字段顺序与foreach中字段不一致的错误
#171211-00028#9   2018/01/24  By 05423       自动引入时，需要考虑abmm200,abmm203产品特征关联相关设定；主件料号如果在asft300中有产品特征，且不在已有版本中，则需要新增。
#180313-00033#1   2018/03/14  By 02295       因为ENT没有加导致资料抓取有多笔资料,所以SQL中增加ENT的条件
#171211-00028#7   2018/03/20  By 02294       axci004数据引入时，如果选择的“主件料号”在abmm210时有联产品料号时，写入到axci004中BOM要有多份，即联产品也要依主件展一份相同的BOM.若联产品的料号在该版本成本BOM主件中有记录，不覆盖原有数据。
#180111-00043#30  2018/04/19  By 09505       修改设计器产生方法的时候说明默认给值是CALL s_aooi150_ins (传入参数)，将方法改为此方法的实际用途。
#180731-00017#9   2018/08/06  By 06137       調整to_date、to_char的寫法改掉，以符合其他資料庫語法
#190726-00024#1   2019/07/29  By 00272       [整單操作]=>[數據引入]時,INSERT INTO xcad_t出現-268的異常
#190916-00006#1   2019/09/16  By 00272       [整單操作]=>[數據引入]時,引入來源選P-BOM,有KEY 特性BOM,抓入該特性BOM的資料卻還抓入特性為' '的資料
#190917-00006#1   2019/09/23  By 00272       [整單操作]=>[數據引入]時,SQL 需加上條件bmba019 != '2' 同abmm210的條件
#180719-00053#1   2019/11/18  By 12787       1.畫面增加生效日期及失效日期欄位
#                                            2.生效日期預設今天
#                                            3.抓取BOM資料時，生失效日期的範圍改成畫面輸入的生失效日期範圍
#                                            4.调整选择标准成本基础数据时，引入失败问题
#191125-00030#1   2019/12/26  By 10042       新增欄位"回收料"
#200203-00021#1   2020/02/19  By 12133       主件底數依主件生產單位及基礎單位做換算
#200512-00034#1   2020/05/13  By 01996       调整产生副产品/回收料资料,需要考虑每个主件与半成品所有的,所以产生回收料资料需放在递归中产生
#200527-00017#1   2020/05/27  By 08734       调整引入bom资料时，若下阶料失效则排除掉
#200601-00023#1   2020/06/02  By 10983       展bom时排除bmba019=2的资料
#200603-00130#1   2020/06/04  By 01996       抓取副产品/回收料时,单位换算时用错了料号,应该用元件的料号
#200806-00061#1   2020/08/07  By 10983       调整管控的判断逻辑，x_level>=0即代表有存在bom
#201109-00009#89  2021/01/20  By 14586       模糊查詢功能，將使用者輸入的字串自動補入*
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:11) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:11) --- end ---
 
IMPORT os
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc" name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_xcad_m        RECORD
       xcad001 LIKE xcad_t.xcad001, 
   xcad012_1 LIKE type_t.chr500, 
   xcad013_1 LIKE type_t.chr500, 
   single LIKE type_t.chr500, 
   recycle LIKE type_t.chr500
       END RECORD
	   
#add-point:自定義模組變數(Module Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sql           STRING   
DEFINE g_wc            STRING  
#單頭 type 宣告
 type type_g_xcad1_m        RECORD
   pbom LIKE type_t.chr80, 
   xcadsite1 LIKE type_t.chr80, 
   xcadsite1_desc LIKE type_t.chr80, 
   bmaa002 LIKE type_t.chr80, 
   standard LIKE type_t.chr80, 
   xcad001_1 LIKE type_t.chr80
       END RECORD
DEFINE g_xcad1_m        type_g_xcad1_m
DEFINE g_xcad_m_o       type_g_xcad_m   #180719-00053#1 add
#171211-00028#9 add-S
#[按料件产品特征计算成本否]＝N时，所有的[产品特征]栏位隐藏写入空值
DEFINE g_fin_6013       LIKE type_t.chr10
#171211-00028#9 add-E
#end add-point
 
DEFINE g_xcad_m        type_g_xcad_m
 
   DEFINE g_xcad001_t LIKE xcad_t.xcad001
 
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_autocomplete_param  DYNAMIC ARRAY OF LIKE type_t.chr1000   #autocomplete功能的傳入參數   #190121-00003
DEFINE g_other_wc            LIKE type_t.chr2000           #其他條件   #190121-00003
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axci004_01.input" type="s" >}
#+ 資料輸入
PUBLIC FUNCTION axci004_01(--)
   #add-point:input段變數傳入 name="input.get_var"
   p_xcad001
   #end add-point
   )
   #add-point:input段define name="input.define_customerization"
   
   #end add-point
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num5
   DEFINE p_cmd           LIKE type_t.chr5
   DEFINE ls_mdl_str      STRING   #190925-00007
   DEFINE lp_js           STRING   #190925-00007
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE p_xcad001       LIKE xcad_t.xcad001
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_n             LIKE type_t.num5
   DEFINE ls_result       STRING  #180719-00053#1 add
   DEFINE l_time            STRING        #180719-00053#1 add
   DEFINE l_date_str        STRING        #180719-00053#1 add
   DEFINE lp_str            STRING        #201109-00009#89 add
   #end add-point
 
  
   WHENEVER ERROR CALL cl_err_msg_log   #180810-00046
 
   #畫面開啟 (identifier)
   OPEN WINDOW w_axci004_01 WITH FORM cl_ap_formpath("axc","axci004_01")
 
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   LET g_qryparam.state = "i"
   LET p_cmd = 'a'
   
   #輸入前處理
   #add-point:單頭前置處理 name="input.pre_input"
   WHENEVER ERROR CONTINUE
   LET g_xcad_m.xcad001  = p_xcad001
   LET g_xcad1_m.xcad001_1 = ''
   LET g_xcad1_m.xcadsite1  = ''
   LET g_xcad1_m.xcadsite1_desc = ''
   LET g_xcad_m.single='N'
   #180719-00053#1 add -S
   LET g_xcad_m.xcad012_1 = cl_get_current()
   LET g_xcad_m.xcad013_1 = ''
   #180719-00053#1 add -E
   #171211-00028#9 add-S
   #[按料件产品特征计算成本否]＝N时，所有的[产品特征]栏位隐藏写入空值
   LET g_fin_6013 = cl_get_para(g_enterprise,g_site,'S-FIN-6013')
   #171211-00028#9 add-E
   LET g_xcad_m.recycle='Y'   #191125-00030#1 add
   DISPLAY BY NAME g_xcad_m.xcad001,g_xcad_m.single,g_xcad1_m.xcad001_1,g_xcad1_m.xcadsite1,g_xcad1_m.xcadsite1_desc,g_xcad_m.xcad012_1,g_xcad_m.xcad013_1  #180719-00053#1 mod ‘add ,g_xcad_m.xcad012_1,g_xcad_m.xcad013_1’
   DISPLAY BY NAME g_xcad_m.recycle  #191125-00030#1 add
   #end add-point
  
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #輸入開始
      INPUT BY NAME g_xcad_m.xcad001,g_xcad_m.xcad012_1,g_xcad_m.xcad013_1,g_xcad_m.single,g_xcad_m.recycle ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION
         #add-point:單頭前置處理 name="input.action"
         
         #end add-point
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            #add-point:單頭輸入前處理 name="input.before_input"
            LET g_xcad1_m.pbom = '1'
            LET g_xcad1_m.standard = ''
            CALL axci004_01_set_entry()
            #end add-point
          
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xcad001
            #add-point:BEFORE FIELD xcad001 name="input.b.xcad001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xcad001
            
            #add-point:AFTER FIELD xcad001 name="input.a.xcad001"
            #此段落由子樣板a05產生
#           IF  NOT cl_null(g_xcad_m.xcad001) THEN 
#               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_xcad_m.xcad001 != g_xcad001_t )) THEN 
#                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xcad_t WHERE "||"xcadent = '" ||g_enterprise|| "' AND "||"xcad001 = '"||g_xcad_m.xcad001 ||"'",'std-00004',0) THEN 
#                     NEXT FIELD CURRENT
#                  END IF
#               END IF
#            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xcad001
            #add-point:ON CHANGE xcad001 name="input.g.xcad001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xcad012_1
            #add-point:BEFORE FIELD xcad012_1 name="input.b.xcad012_1"
             #180719-00053#1 add -S
            LET g_xcad_m_o.xcad012_1 = g_xcad_m.xcad012_1
             #180719-00053#1 add -S
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xcad012_1
            
            #add-point:AFTER FIELD xcad012_1 name="input.a.xcad012_1"
            #180719-00053#1 add -S
            IF NOT cl_null(g_xcad_m.xcad012_1) THEN 
               LET l_date_str = ''
               LET l_time = ''
               LET l_date_str = g_xcad_m.xcad012_1
               LET l_time = l_date_str.substring(1,10)
               LET g_xcad_m.xcad012_1 = l_date_str.substring(1,4) USING "####",'-',l_date_str.substring(6,7) USING "&&",'-',l_date_str.substring(9,10) USING "&&",' ',l_date_str.substring(12,19)
               
               LET l_time = l_date_str.substring(1,4) 
               IF l_time IS NULL OR cl_null (l_time) THEN 
                  LET g_xcad_m.xcad012_1 = ''
               END IF
               
               LET l_date_str = g_xcad_m_o.xcad012_1
               
               IF l_time = l_date_str.substring(1,10) THEN 
                  LET g_xcad_m.xcad012_1 = g_xcad_m_o.xcad012_1
               END IF
               
               
               IF  NOT cl_null(g_xcad_m.xcad013_1) THEN 
                  IF g_xcad_m.xcad012_1 > g_xcad_m.xcad013_1 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "art-00546"   #失效日期不可小于生效日期
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     NEXT FIELD xcad012_1
                  END IF 
               END IF  
            END IF               
            #180719-00053#1 add -E
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xcad012_1
            #add-point:ON CHANGE xcad012_1 name="input.g.xcad012_1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xcad013_1
            #add-point:BEFORE FIELD xcad013_1 name="input.b.xcad013_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xcad013_1
            
            #add-point:AFTER FIELD xcad013_1 name="input.a.xcad013_1"
            #180719-00053#1 add -S
            IF NOT cl_null(g_xcad_m.xcad013_1) THEN 
               LET l_time = ''
               LET l_date_str = ''
               LET l_date_str = g_xcad_m.xcad013_1
               LET l_time = l_date_str.substring(1,4) 
               LET g_xcad_m.xcad013_1 = l_date_str.substring(1,4) USING "####",'-',l_date_str.substring(6,7) USING "&&",'-',l_date_str.substring(9,10) USING "&&",' ',l_date_str.substring(12,19)
               IF l_time IS NULL OR cl_null (l_time) THEN 
                  LET g_xcad_m.xcad013_1 = ''
               END IF
               
               IF NOT cl_null(g_xcad_m.xcad012_1)  THEN 
                  IF g_xcad_m.xcad012_1 > g_xcad_m.xcad013_1 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "art-00546"   #失效日期不可小于生效日期
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     NEXT FIELD xcad013_1
                  END IF 
               END IF 
            END IF
            #180719-00053#1 add -E
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xcad013_1
            #add-point:ON CHANGE xcad013_1 name="input.g.xcad013_1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD single
            #add-point:BEFORE FIELD single name="input.b.single"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD single
            
            #add-point:AFTER FIELD single name="input.a.single"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE single
            #add-point:ON CHANGE single name="input.g.single"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD recycle
            #add-point:BEFORE FIELD recycle name="input.b.recycle"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD recycle
            
            #add-point:AFTER FIELD recycle name="input.a.recycle"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE recycle
            #add-point:ON CHANGE recycle name="input.g.recycle"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.xcad001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xcad001
            #add-point:ON ACTION controlp INFIELD xcad001 name="input.c.xcad001"
            
            #END add-point
 
 
         #Ctrlp:input.c.xcad012_1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xcad012_1
            #add-point:ON ACTION controlp INFIELD xcad012_1 name="input.c.xcad012_1"
            
            #END add-point
 
 
         #Ctrlp:input.c.xcad013_1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xcad013_1
            #add-point:ON ACTION controlp INFIELD xcad013_1 name="input.c.xcad013_1"
            
            #END add-point
 
 
         #Ctrlp:input.c.single
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD single
            #add-point:ON ACTION controlp INFIELD single name="input.c.single"
            
            #END add-point
 
 
         #Ctrlp:input.c.recycle
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD recycle
            #add-point:ON ACTION controlp INFIELD recycle name="input.c.recycle"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #add-point:單頭輸入後處理 name="input.after_input"
            
            #end add-point
            
      END INPUT
    
      #add-point:自定義input name="input.more_input"
      CONSTRUCT BY NAME g_wc ON xcad002_1
         BEFORE CONSTRUCT
            CALL cl_qbe_init()
         
         ON ACTION controlp INFIELD xcad002_1
            #add-point:ON ACTION controlp INFIELD xrad002
            #此段落由子樣板a08產生
            #開窗c段
                        INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " imaa004 = 'A'"
            CALL q_imaf001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xcad002_1      #顯示到畫面上
            LET g_qryparam.where = NULL

            NEXT FIELD xcad002_1                        #返回原欄位                  
         #201109-00009#89---add---(S)
         AFTER FIELD xcad002_1            
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
         #201109-00009#89---add---(E)             
      END CONSTRUCT
      
      #輸入開始
      INPUT BY NAME g_xcad1_m.pbom,g_xcad1_m.xcadsite1,g_xcad1_m.bmaa002, 
          g_xcad1_m.standard,g_xcad1_m.xcad001_1 ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION

         #自訂ACTION(master_input)
         
         BEFORE INPUT
            LET g_xcad1_m.pbom = '1'
            LET g_xcad1_m.standard = ''
            CALL axci004_01_set_entry()

         AFTER FIELD pbom
            IF g_xcad1_m.pbom = 1 THEN
               LET g_xcad1_m.standard = NULL
            END IF
            CALL axci004_01_set_entry()

         ON CHANGE pbom
            IF g_xcad1_m.pbom = 1 THEN
               LET g_xcad1_m.standard = NULL
            END IF
            CALL axci004_01_set_entry()

         AFTER FIELD xcadsite1
            IF NOT cl_null(g_xcad1_m.xcadsite1) THEN 
               CALL axci004_01_xcadsite_chk(g_xcad1_m.xcadsite1)
               IF NOT cl_null(g_errno) THEN 
                  LET g_xcad1_m.xcadsite1_desc = ''
                  DISPLAY g_xcad1_m.xcadsite1_desc TO xcadsite1_desc
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xcad1_m.xcadsite1
                  #160318-00005#45 --s add
                  CASE g_errno
                     WHEN 'sub-01333'
                        LET g_errparam.replace[1] = 'axci004'
                        LET g_errparam.replace[2] = cl_get_progname('axci004',g_lang,"2")
                        LET g_errparam.exeprog = 'axci004'
                  END CASE
                  #160318-00005#45 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xcad1_m.xcadsite1 = ''
                  NEXT FIELD xcadsite1
               END IF
            END IF
            
            CALL s_desc_get_department_desc(g_xcad1_m.xcadsite1) RETURNING g_xcad1_m.xcadsite1_desc
            DISPLAY BY NAME g_xcad1_m.xcadsite1_desc

         AFTER FIELD bmaa002
#            IF g_xcad1_m.bmaa002 IS NOT NULL THEN
#              LET l_n = 0 
#              SELECT COUNT(*) INTO l_n
#                FROM bmaa_t
#               WHERE bmaaent = g_enterprise AND bmaa002 = g_xcad1_m.bmaa002
#              IF l_n = 0 THEN
#                 CALL cl_err('','aim-00126',0)
#                 NEXT FIELD bmaa002
#              END IF
#            END IF

         AFTER FIELD standard
            IF g_xcad1_m.standard = 1 THEN
               LET g_xcad1_m.pbom = NULL
            END IF
            CALL axci004_01_set_entry()

         ON CHANGE standard
            IF g_xcad1_m.standard = 1 THEN
               LET g_xcad1_m.pbom = NULL
            END IF
            CALL axci004_01_set_entry()

         AFTER FIELD xcad001_1
            IF NOT cl_null(g_xcad1_m.xcad001_1) THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM xcad_t 
                WHERE xcadent = g_enterprise AND xcad001 = g_xcad1_m.xcad001_1
               IF l_n = 0 THEN
                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'axc-00047'   #160318-00005#45  mark
                  LET g_errparam.code = 'sub-01302'   #160318-00005#45  add
                  LET g_errparam.extend = ''
                  #160318-00005#45 --s add
                  LET g_errparam.replace[1] = 'axci004'
                  LET g_errparam.replace[2] = cl_get_progname('axci004',g_lang,"2")
                  LET g_errparam.exeprog = 'axci004'
                  #160318-00005#45 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xcad001_1
               END IF
               LET l_n=0
               SELECT COUNT(*) INTO l_n FROM xcad_t 
                WHERE xcadent = g_enterprise AND xcad001 = g_xcad1_m.xcad001_1 AND xcadstus = 'Y'
               IF l_n = 0 THEN
                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'axc-00048'   #160318-00005#45  mark
                  LET g_errparam.code = 'sub-01308'   #160318-00005#45  add
                  LET g_errparam.extend = ''
                  #160318-00005#45 --s add
                  LET g_errparam.replace[1] = 'axci004'
                  LET g_errparam.replace[2] = cl_get_progname('axci004',g_lang,"2")
                  LET g_errparam.exeprog = 'axci004'
                  #160318-00005#45 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xcad001_1
               END IF
            END IF


         ON ACTION controlp INFIELD xcad001


         ON ACTION controlp INFIELD xcadsite1
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xcad1_m.xcadsite1             #給予default值
            #最加AFTER FIELD的限制
            #須存在[T:组织档] 且 有效 且為"法人組織"or"营运組織否"or"核算組織否"
            LET g_qryparam.where = " bmaasite in (SELECT UNIQUE ooef001 FROM ooef_t ",
                                   "               WHERE ooefent=",g_enterprise," AND ooefstus = 'Y' ",
                                   "                 AND (ooef003 = 'Y' OR ooef201 = 'Y' OR ooef204 = 'Y') )"
            #給予arg
            CALL q_bmaasite()                                #呼叫開窗
            LET g_xcad1_m.xcadsite1 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_xcad1_m.xcadsite1 TO xcadsite1              #顯示到畫面上

            CALL s_desc_get_department_desc(g_xcad1_m.xcadsite1) RETURNING g_xcad1_m.xcadsite1_desc
            DISPLAY BY NAME g_xcad1_m.xcadsite1_desc

            NEXT FIELD xcadsite1                          #返回原欄位

         ON ACTION controlp INFIELD bmaa002
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xcad1_m.bmaa002             #給予default值
            CALL q_bmaa002_1()                                #呼叫開窗
            LET g_xcad1_m.bmaa002 = g_qryparam.return1              
            DISPLAY g_xcad1_m.bmaa002 TO bmaa002              #
            NEXT FIELD bmaa002                          #返回原欄位

         ON ACTION controlp INFIELD xcad001_1
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xcad1_m.xcad001_1             #給予default值
            LET g_qryparam.where = " xcadstus = 'Y' "
            #給予arg
            CALL q_xcad001()                                #呼叫開窗
            LET g_xcad1_m.xcad001_1 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_xcad1_m.xcad001_1 TO xcad001_1              #顯示到畫面上
            NEXT FIELD xcad001_1                          #返回原欄位

         AFTER INPUT

            
      END INPUT
      #end add-point
    
      #公用action
      ON ACTION accept
         ACCEPT DIALOG
        
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION close
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
 
   #add-point:畫面關閉前 name="input.before_close"
   
   #end add-point
   
   #畫面關閉
   CLOSE WINDOW w_axci004_01 
   
   #add-point:input段after input name="input.post_input"
   LET l_success = FALSE
   IF INT_FLAG THEN
      LET l_success = FALSE
   ELSE
      CALL axci004_01_ins_xcad() RETURNING l_success
   END IF
   LET INT_FLAG = FALSE
   RETURN l_success
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="axci004_01.other_dialog" readonly="Y" type="s" >}

 
{</section>}
 
{<section id="axci004_01.other_function" readonly="Y" type="s" >}
#營運據點欄位檢查
PRIVATE FUNCTION axci004_01_xcadsite_chk(p_xcadsite)
DEFINE l_n          LIKE type_t.num5 
DEFINE p_xcadsite   LIKE xcad_t.xcadsite

   LET g_errno = ''
   #輸入值須存在[T:组织档]
   LET l_n = 0 
   SELECT count(*) INTO l_n 
     FROM ooef_t
    WHERE ooef001 = p_xcadsite
      AND ooefent = g_enterprise
   IF l_n = 0 THEN 
      LET g_errno = 'axc-00005'
      RETURN                        
   END IF
   #輸入值須在[T:组织档]里有效
   LET l_n = 0 
   SELECT count(*) INTO l_n 
     FROM ooef_t
    WHERE ooef001 = p_xcadsite
      AND ooefent = g_enterprise
      AND ooefstus = 'Y'
   IF l_n = 0 THEN 
      LET g_errno = 'axc-00006'
      RETURN   
   END IF 
   #輸入值須存在[T:组织档]里為"法人組織"or"营运組織否"or"核算組織否"
   LET l_n = 0 
   SELECT count(*) INTO l_n 
     FROM ooef_t
    WHERE ooef001 = p_xcadsite
      AND ooefent = g_enterprise
      AND (ooef003 = 'Y' OR ooef201 = 'Y' OR ooef204 = 'Y')
   IF l_n = 0 THEN 
      LET g_errno = 'axc-00058'
      RETURN                        
   END IF
   
   #输入的据点需存在于bom中
   LET l_n = 0 
   SELECT count(*) INTO l_n 
     FROM bmaa_t
    WHERE bmaaent  = g_enterprise
      AND bmaasite = p_xcadsite
   IF l_n = 0 THEN 
      #此据点无BOM资料
      LET g_errno = 'axc-00608'
      RETURN                        
   END IF
   
   
   #輸入的營運據點不存在于該版本下
   LET l_n = 0 
   IF g_xcad1_m.standard = '1' THEN
      SELECT COUNT(*) INTO l_n 
        FROM xcad_t
       WHERE xcadsite = p_xcadsite AND xcad001 = g_xcad1_m.xcad001_1
         AND xcadent = g_enterprise
         AND xcadstus = 'Y'
      IF l_n = 0 THEN 
#         LET g_errno = 'axc-00080'  #160318-00005#45  mark
         LET g_errno = 'sub-01333'  #160318-00005#45  add
         RETURN     
      END IF         
   END IF
END FUNCTION
#料件欄位檢查
PRIVATE FUNCTION axci004_01_xcad002_chk(p_xcad002)
DEFINE l_n          LIKE type_t.num5 
DEFINE p_xcad002    LIKE xcad_t.xcad002
DEFINE l_status     LIKE imaa_t.imaastus
   
   #輸入值需存在于[T:物料主档]中
   LET l_n = 0 
   SELECT count(*) INTO l_n
     FROM imaf_t
    WHERE imaaf01 = p_xcad002
      AND imafent = g_enterprise
   IF l_n = 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00007'
      LET g_errparam.extend = p_xcad002
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF 
                  
   #輸入值需在[T:物料主档]中已確認
   LET l_status = ''
   SELECT imaastus INTO l_status
     FROM imaa_t
    WHERE imaa001 = p_xcad002
      AND imaaent = g_enterprise                 
   IF l_status <> 'Y' THEN 
      IF l_status = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axc-00040'
         LET g_errparam.extend = p_xcad002
         LET g_errparam.popup = TRUE
         CALL cl_err()
      ELSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axc-00008'
         LET g_errparam.extend = p_xcad002
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
      RETURN FALSE
   END IF  
   
   #輸入值需在[T:物料主档]中採購件
   LET l_n = 0 
   SELECT count(*) INTO l_n
     FROM imaa_t
    WHERE imaa001 = p_xcad002
      AND imaa004 = 'A'
      AND imaastus = 'Y'
      AND imaaent = g_enterprise    #160902-00048#2
   IF l_n = 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00054'
      LET g_errparam.extend = p_xcad002
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF 
   RETURN TRUE
END FUNCTION
#批量插入數據
PRIVATE FUNCTION axci004_01_ins_xcad()
#DEFINE l_xcad         RECORD LIKE xcad_t.*  #161124-00048#16  2016/12/16  By 08734 mark
#161124-00048#16  2016/12/16  By 08734 add(S)
DEFINE l_xcad RECORD  #成本BOM主檔
       xcadent LIKE xcad_t.xcadent, #企业编号
       xcadownid LIKE xcad_t.xcadownid, #资料所有者
       xcadowndp LIKE xcad_t.xcadowndp, #资料所有部门
       xcadcrtid LIKE xcad_t.xcadcrtid, #资料录入者
       xcadcrtdp LIKE xcad_t.xcadcrtdp, #资料录入部门
       xcadcrtdt LIKE xcad_t.xcadcrtdt, #资料创建日
       xcadmodid LIKE xcad_t.xcadmodid, #资料更改者
       xcadmoddt LIKE xcad_t.xcadmoddt, #最近更改日
       xcadstus LIKE xcad_t.xcadstus, #状态码
       xcadsite LIKE xcad_t.xcadsite, #营运据点
       xcad001 LIKE xcad_t.xcad001, #版本
       xcad002 LIKE xcad_t.xcad002, #主件料号
       xcadseq LIKE xcad_t.xcadseq, #项次
       xcad003 LIKE xcad_t.xcad003, #元件料号
       xcad004 LIKE xcad_t.xcad004, #组成用量
       xcad005 LIKE xcad_t.xcad005, #主件底数
       xcad006 LIKE xcad_t.xcad006, #变动损耗率
       xcad007 LIKE xcad_t.xcad007, #固定损耗量
       xcad008 LIKE xcad_t.xcad008, #损耗批量
       xcad009 LIKE xcad_t.xcad009, #作业编号
       xcad010 LIKE xcad_t.xcad010, #作业序
       xcad011 LIKE xcad_t.xcad011, #部位编号
       xcad012 LIKE xcad_t.xcad012, #生效日期
       xcad013 LIKE xcad_t.xcad013 #失效日期
      ,xcad014 LIKE xcad_t.xcad014, #主件产品特征 #171211-00028#9 add
       xcad015 LIKE xcad_t.xcad015  #元件产品特征 #171211-00028#9 add
END RECORD
#161124-00048#16  2016/12/16  By 08734 add(E)
DEFINE l_xcadcrtdt    DATETIME YEAR TO SECOND
DEFINE l_n            LIKE type_t.num5
DEFINE l_n1           LIKE type_t.num5
DEFINE r_success      LIKE type_t.num5
DEFINE l_stus         LIKE xcad_t.xcadstus
DEFINE l_bmba002      LIKE bmba_t.bmba002
DEFINE l_sql1         STRING
DEFINE l_bmba001_t    LIKE bmba_t.bmba001 #主件料号 用于记录旧值
DEFINE l_xcadseq      LIKE xcad_t.xcadseq   #add 141223
DEFINE l_xcadseq_1    LIKE xcad_t.xcadseq   #161130-00004#1 add
DEFINE l_xcadseq_2    LIKE xcad_t.xcadseq   #161130-00004#1 add
DEFINE l_imaa004      LIKE imaa_t.imaa004   #171027-00008#1 add
DEFINE l_bmba010      LIKE bmba_t.bmba010   #171229-00014#1-add
DEFINE l_imaa006      LIKE imaa_t.imaa006   #171229-00014#1-add
DEFINE l_success      LIKE type_t.num5      #171229-00014#1-add
#171211-00028#9 add-S
DEFINE l_bmba014      LIKE bmba_t.bmba014 
DEFINE l_sfac001      LIKE sfac_t.sfac001
DEFINE l_sfac006      LIKE sfac_t.sfac006
DEFINE l_imaa005      LIKE imaa_t.imaa005
DEFINE l_imaa005_2    LIKE imaa_t.imaa005
DEFINE l_feature      LIKE xcad_t.xcad014
DEFINE l_n2           LIKE type_t.num10
DEFINE l_n3           LIKE type_t.num10
#171211-00028#9 add-E
DEFINE l_xcad002_t    LIKE xcad_t.xcad002   #171211-00028#7  add
DEFINE l_bmab003      LIKE bmab_t.bmab003   #171211-00028#7  add
#180731-00017#9 Add By 06137  180806(S)
DEFINE l_bmab006      DATETIME YEAR TO SECOND   
DEFINE l_sql          STRING
#180731-00017#9 Add By 06137  180806(E)
#180719-00053#1 add -S
DEFINE ldt_xcad012      DATETIME YEAR TO SECOND
DEFINE ldt_xcad013      DATETIME YEAR TO SECOND
#180719-00053#1 add -E
#191125-00030#1 -S add
DEFINE l_bmac RECORD
       bmacsite  LIKE bmac_t.bmacsite,
       bmac001   LIKE bmac_t.bmac001,
       bmac003   LIKE bmac_t.bmac003,
       bmac004   LIKE bmac_t.bmac004,
       bmac005   LIKE bmac_t.bmac005,
       bmac006   LIKE bmac_t.bmac006,
       bmac007   LIKE bmac_t.bmac007,
       bmac008   LIKE bmac_t.bmac008
       END RECORD
DEFINE l_bmac001_wc   STRING
#191125-00030#1 -E add
#200203-00021#1 add
DEFINE l_imaa006_1 LIKE imaa_t.imaa006 
DEFINE l_bmaa004   LIKE bmaa_t.bmaa004
#200203-00021#1 add
   LET l_bmab006 = cl_get_current()    #180731-00017#9 Add By 06137  180806
   LET l_bmac001_wc = g_wc  #191125-00030#1 add

   DELETE FROM axci004_tmp01           #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
   LET r_success = TRUE
   SELECT UNIQUE xcadstus INTO l_stus FROM xcad_t
    WHERE xcadent = g_enterprise AND xcad001 = g_xcad_m.xcad001
   IF l_stus = 'Y' THEN
      #输入的版本已审核，不可引入资料！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00082'
      LET g_errparam.extend = g_xcad_m.xcad001
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE 
   END IF
   IF cl_null(g_wc)  THEN
      LET g_wc = " 1=1 "
   ELSE
      IF g_xcad1_m.pbom = '1' THEN
         LET g_wc = cl_replace_str(g_wc,'xcad002_1','bmba001')
      ELSE
         LET g_wc = cl_replace_str(g_wc,'xcad002_1','xcad002')
      END IF  
   END IF
   #180719-00053#1 add -S
   IF cl_null(g_xcad_m.xcad012_1) THEN
      LET g_wc = g_wc," AND (1=1 OR (xcad012 <= ? AND (xcad013 >=?))) "
   ELSE
      LET ldt_xcad012 = g_xcad_m.xcad012_1
      LET g_wc = g_wc," AND xcad012 <= ? AND (xcad013 >=? OR xcad013 IS NULL) "
   END IF
   
   IF cl_null(g_xcad_m.xcad013_1) THEN
      LET g_wc = g_wc," AND (1=1 OR (xcad013 >= ? AND (xcad012 <=?))) "
   ELSE
      LET ldt_xcad013 = g_xcad_m.xcad013_1
      LET g_wc = g_wc," AND xcad013 >= ? AND (xcad012 <=? OR xcad012 IS NULL) "
   END IF 
   IF g_xcad1_m.pbom = '1' THEN
      LET g_wc = cl_replace_str(g_wc,'xcad012','bmba005') 
      LET g_wc = cl_replace_str(g_wc,'xcad013','bmba006')
   END IF 
   #180719-00053#1 add -E
   IF cl_null(g_xcad1_m.bmaa002) THEN LET g_xcad1_m.bmaa002 = ' ' END IF  #add 141223
   
   
   #用于foreach中抓取料件bom的特性l_bmba002
   LET l_sql1 = " SELECT COUNT(*),bmba002 ",
                   #161130-00004#1 ---mark (s)---
                   #"   FROM bmba_t,imaa_t",
                   #"  WHERE bmbaent = imaaent AND bmba001 = imaa001 ",
                   #161130-00004#1 ---mark (e)---
                   #161130-00004#1 ---add (s)---
                   "    FROM bmba_t,bmaa_t,imaa_t", 
                   "   WHERE bmbaent = bmaaent AND bmba001 = bmaa001 and bmbaent = imaaent AND bmba001 = imaa001 AND bmbasite = bmaasite ", 
                   "     AND bmaastus = 'Y' ",
                   #"     AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",   #180731-00017#9 Mark By 06137  180806
                   #"     AND (bmba006 IS NULL OR bmba006>? )",      #180731-00017#9 Add By 06137  180806   #180719-00053#1 mark
                   #161130-00004#1 ---add (e)---
                   "    AND bmbaent = '",g_enterprise,"'",
                   "    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
                   "    AND imaa004 = 'A' AND ",g_wc CLIPPED 

   #171227-00001#1---add---s
   LET g_sql = " SELECT COUNT(*) FROM axci004_tmp01 ",
               "  WHERE xcadent = ",g_enterprise,
               "    AND xcad001 = '",g_xcad_m.xcad001,"' AND xcad002 = ? ",
               "    AND xcad003 = ? ",
               "    AND xcad009 = ? AND xcad010 = ? ",
               "    AND xcad011 = ? AND xcad012 = ? ",
               "    AND xcad013 IS NULL "
               ,"   AND xcad014 = ? AND xcad015 = ? "   #171211-00028#9 add
   PREPARE xcad_ext_chk1 FROM g_sql
   
   LET g_sql = " SELECT COUNT(*) FROM axci004_tmp01 ",
               "  WHERE xcadent = ",g_enterprise,
               "    AND xcad001 = '",g_xcad_m.xcad001,"' AND xcad002 = ? ",
               "    AND xcad003 = ? ",
               "    AND xcad009 = ? AND xcad010 = ? ",
               "    AND xcad011 = ? AND xcad012 = ? ",
               "    AND xcad013 = ? "
              ,"    AND xcad014 = ? AND xcad015 = ? " #171211-00028#9 add
   PREPARE xcad_ext_chk1_2 FROM g_sql     

   LET g_sql = " SELECT COUNT(*) FROM xcad_t ",
               "  WHERE xcadent = ",g_enterprise,
               "    AND xcad001 = '",g_xcad_m.xcad001,"' AND xcad002 = ? ",
               "    AND xcad003 = ? ",
               "    AND xcad009 = ? AND xcad010 = ? ",
               "    AND xcad011 = ? AND xcad012 = ? ",
               "    AND xcad013 IS NULL "
              ,"    AND xcad014 = ? AND xcad015 = ? " #171211-00028#9 add
   PREPARE xcad_ext_chk2 FROM g_sql
   
   LET g_sql = " SELECT COUNT(*) FROM xcad_t ",
               "  WHERE xcadent = ",g_enterprise,
               "    AND xcad001 = '",g_xcad_m.xcad001,"' AND xcad002 = ? ",
               "    AND xcad003 = ? ",
               "    AND xcad009 = ? AND xcad010 = ? ",
               "    AND xcad011 = ? AND xcad012 = ? ",
               "    AND xcad013 = ? "
              ,"    AND xcad014 = ? AND xcad015 = ? " #171211-00028#9 add
   PREPARE xcad_ext_chk2_2 FROM g_sql  
   #171227-00001#1---add---e
   
   #171228-00016#1---add---s
   IF g_xcad1_m.pbom = '1' THEN
#      LET g_sql = " SELECT 0,bmba001,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,bmbasite,bmba010, ",  #171229-00014#1-add bmba010 #171211-00028#9 mark
      LET g_sql = " SELECT 0,bmba001,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,' ',' ',bmba014,bmbasite,bmba010, ",  #171211-00028#9 mod
                  "        (SELECT imaa006 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa006 ",   #171229-00014#1-add 
                  "        ,(SELECT imaa005 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa005 ",   #171211-00028#9 add
                  "        ,(SELECT imaa006 FROM imaa_t WHERE imaaent=bmaaent AND imaa001=bmaa001) imaa006_1,bmaa004 ",   #200203-00021#1 add
                  "   FROM bmba_t,bmaa_t",
                  "  WHERE bmbaent = bmaaent AND bmba001 = bmaa001 AND bmbasite = bmaasite AND bmba002 = bmaa002 ",
                  "    AND bmbaent = ",g_enterprise, #180313-00033#1 add
                  "    AND bmaastus = 'Y' ",
                  "    AND bmba019 <> '2' ", #200601-00023#1---add
                  #"    AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",  #180731-00017#9 Mark By 06137  180806
                  "    AND (bmba006 IS NULL OR bmba006>? )",         #180731-00017#9 Add By 06137  180806 #180719-00053#1 mark #200527-00017#1 remark
                  "    AND bmba002 = ? ",
                  "    AND bmba001 = ? ",
                  "    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
                 "  ORDER BY bmba001 "
      PREPARE axci004_pre3 FROM g_sql
      DECLARE axci004_cur3 CURSOR FOR axci004_pre3                  
   ELSE
#      LET g_sql = " SELECT 0,xcad002,xcadseq,xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,xcad009,xcad010,xcad011,xcad012,xcad013,xcadsite ",   #171211-00028#9 mark
      LET g_sql = " SELECT 0,xcad002,xcadseq,xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,xcad009,xcad010,xcad011,xcad012,xcad013,xcad014,xcad015,'',xcadsite ",   #171211-00028#9 mod
                  "   FROM xcad_t",
                  "  WHERE xcadent = '",g_enterprise,"'",
                  "    AND xcad001 = '",g_xcad1_m.xcad001_1,"'",
                  "    AND xcad002 = ? "
                 ,"    AND xcad014 = ? "  #171211-00028#9 add
      PREPARE axci004_pre4 FROM g_sql
      DECLARE axci004_cur4 CURSOR FOR axci004_pre3                   
   END IF
   #171228-00016#1---add---e   
   #171211-00028#9 add-S 获取工单生产料号中的产品特征信息，如果现有的成本BOM中没有的产品特征，需要新增进来
   IF g_fin_6013 = 'Y' THEN
      LET g_sql = " SELECT DISTINCT bmaa001,bmaa002,NVL(sfac006,' ') sfac006 ",
                  "   FROM bmaa_t  LEFT OUTER JOIN bmba_t ON bmaa001 = bmba001 AND bmaa002 = bmba002 AND bmaaent = bmbaent AND bmaasite = bmbasite ",
                  "                LEFT OUTER JOIN sfac_t ON bmaaent = sfacent AND bmaa001 = sfac001,imaa_t ",
                  "  WHERE bmaaent = ",g_enterprise,
                  "    AND imaaent = bmaaent AND imaa001 = bmaa001 ",
                  "    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                  "    AND bmaa002 = '",g_xcad1_m.bmaa002,"'",
                  "    AND NOT EXISTS (SELECT 1 FROM xcad_t ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = NVL(sfac006,' ') ",
                  "                    ) " ,
                  "    AND NOT EXISTS (SELECT 1 FROM axci004_tmp01 ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = NVL(sfac006,' ') ",
                  "                    ) " ,
                  "  UNION ",
                  " SELECT DISTINCT bmaa001,bmaa002,NVL(sfac006,' ') sfac006 ",
                  "   FROM bmaa_t  LEFT OUTER JOIN bmba_t ON bmaa001 = bmba001 AND bmaa002 = bmba002 AND bmaaent = bmbaent AND bmaasite = bmbasite ",
                  "                LEFT OUTER JOIN sfac_t ON bmaaent = sfacent AND bmaa001 = sfac001,imaa_t ",
                  "  WHERE bmaaent = ",g_enterprise,
                  "    AND imaaent = bmaaent AND imaa001 = bmaa001 ",
                  "    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                  "    AND NOT EXISTS (SELECT 1 FROM xcad_t ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = NVL(sfac006,' ') ",
                  "                    ) " ,
                  "    AND NOT EXISTS (SELECT 1 FROM axci004_tmp01 ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = NVL(sfac006,' ') ",
                  "                    ) " ,
                  "    AND bmaa002 = ' '",
                  "    AND NOT EXISTS (SELECT 1 FROM bmaa_t WHERE bmaaent=bmbaent AND bmaa002 ='",g_xcad1_m.bmaa002,"')",
                  "  ORDER BY bmaa001,bmaa002,sfac006 " 
   ELSE
      LET g_sql = " SELECT DISTINCT bmaa001,bmaa002,' ' ",
                  "   FROM bmaa_t  LEFT OUTER JOIN bmba_t ON bmaa001 = bmba001 AND bmaa002 = bmba002 AND bmaaent = bmbaent AND bmaasite = bmbasite ",
                  "       ,imaa_t ",
                  "  WHERE bmaaent = ",g_enterprise,
                  "    AND imaaent = bmaaent AND imaa001 = bmaa001 ",
                  "    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                  "    AND bmaa002 = '",g_xcad1_m.bmaa002,"'",
                  "    AND NOT EXISTS (SELECT 1 FROM xcad_t ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = ' ' ",
                  "                    ) " ,
                  "    AND NOT EXISTS (SELECT 1 FROM axci004_tmp01 ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = ' ' ",
                  "                    ) " ,
                  "  UNION ",
                  " SELECT DISTINCT bmaa001,bmaa002,' ' ",
                  "   FROM bmaa_t  LEFT OUTER JOIN bmba_t ON bmaa001 = bmba001 AND bmaa002 = bmba002 AND bmaaent = bmbaent AND bmaasite = bmbasite ",
                  "       ,imaa_t ",
                  "  WHERE bmaaent = ",g_enterprise,
                  "    AND imaaent = bmaaent AND imaa001 = bmaa001 ",
                  "    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                  "    AND NOT EXISTS (SELECT 1 FROM xcad_t ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = ' ' ",
                  "                    ) " ,
                  "    AND NOT EXISTS (SELECT 1 FROM axci004_tmp01 ",
                  "                     WHERE xcadent = ",g_enterprise," AND xcad001 = '",g_xcad_m.xcad001,"' ",
                  "                       AND xcad002 = bmaa001 AND xcad014 = ' ' ",
                  "                    ) " ,
                  "    AND bmaa002 = ' '",
                  "    AND NOT EXISTS (SELECT 1 FROM bmaa_t WHERE bmaaent=bmbaent AND bmaa002 ='",g_xcad1_m.bmaa002,"')",
                  "  ORDER BY bmaa001,bmaa002 " 
   END IF   
   PREPARE axci004_feature_pre FROM g_sql
   DECLARE axci004_feature_curs CURSOR FOR axci004_feature_pre
   LET g_sql = " SELECT COUNT(1) FROM (",g_sql,") tsed"
   PREPARE axci004_wocnt_pre FROM g_sql
   DECLARE axci004_wocnt_curs CURSOR FOR axci004_wocnt_pre
   
   #主件特征对应特征类型特征值
   LET g_sql = " SELECT inam011,inam012,inam013,inam014,inam015,inam016,inam017,inam018,inam019,inam020, ",
               "        inam021,inam022,inam023,inam024,inam025,inam026,inam027,inam028,inam029,inam030, ",
               "        inam031,inam032,inam033,inam034,inam035,inam036,inam037,inam038,inam039,inam040, ",
               "        inam041,inam042,inam043,inam044,inam045,inam046,inam047,inam048,inam049,inam050  ",
               "   FROM inam_t ",
               "  WHERE inament = ? AND inam001 = ? AND inam002 = ? "
   PREPARE axci004_01_feature_p1 FROM g_sql
   
   #主件产品特征限定用料
   LET g_sql = " SELECT COUNT(1) FROM bmca_t ",
               "  WHERE bmcaent=? AND bmcasite=? ",
               "    AND bmca001=? AND bmca002=? AND bmca003=? AND bmca004=? AND bmca005=? AND bmca007=? AND bmca008=? "
   PREPARE axci004_01_feature_p2 FROM g_sql
   
   LET g_sql = " SELECT bmcb009,bmcb010,bmcb011,bmcb012 ",
               "   FROM bmcb_t ",
               "  WHERE bmcbent=? AND bmcbsite=? ",
               "    AND bmcb001=? AND bmcb002=? AND bmcb003=? AND bmcb004=? AND bmcb005=? AND bmcb007=? AND bmcb008=? ",
               "  ORDER BY bmcb009,bmcb010 "
   PREPARE axci004_01_feature_p3 FROM g_sql
   DECLARE axci004_01_feature_c3 CURSOR FOR axci004_01_feature_p3
   
   #主件与元件产品特征对应
   LET g_sql = " SELECT COUNT(1) FROM bmcc_t ",
               "  WHERE bmccent=? AND bmccsite=? ",
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? "
   PREPARE axci004_01_feature_p4 FROM g_sql
   
   LET g_sql = " SELECT bmcc009,bmcc010",
               "   FROM bmcc_t", 
               "  WHERE bmccent=? AND bmccsite=? ",   #161214-00023#1 去第一个AND
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? ",
               "  ORDER BY bmcc009 "
   PREPARE axci004_01_feature_p5 FROM g_sql
   DECLARE axci004_01_feature_c5 CURSOR FOR axci004_01_feature_p5
   
   LET g_sql = " SELECT bmcd010,bmcd011 ",
               "   FROM bmcd_t ",
               "  WHERE  bmcdent=? AND bmcdsite=?",
               "    AND bmcd001=? AND bmcd002=? AND bmcd003=? AND bmcd004=? AND bmcd005=? AND bmcd007=? AND bmcd008=? AND bmcd009=? ",
               "  ORDER BY bmcd009 "
   PREPARE axci004_01_feature_pcd FROM g_sql
   DECLARE axci004_01_feature_ccd CURSOR FOR axci004_01_feature_pcd  

   #限定元件特征
   LET g_sql = " SELECT bmce009,bmce010 ",
               "   FROM bmce_t ",
               "  WHERE bmceent=? AND bmcesite=? ",
               "    AND bmce001=? AND bmce002=? AND bmce003=? AND bmce004=? AND bmce005=? AND bmce007=? AND bmce008=? ",
               "  ORDER BY bmce009 "
   PREPARE axci004_01_feature_p6 FROM g_sql
   DECLARE axci004_01_feature_c6 CURSOR FOR axci004_01_feature_p6
   
   #料件特徵群組單身檔–屬性類型
   LET g_sql = " SELECT imeb006 FROM imaa_t,imeb_t ",
               "  WHERE imaaent = ? AND imaa001 = ? ",
               "    AND imebent = imaaent AND imeb001 = imaa005 AND imeb004 = ? "
   PREPARE axci004_01_feature_check_p1 FROM g_sql   
   #171211-00028#9 add-E
   
   #LET g_sql = '' #mark for meaningless
   #获取要导入的资料明细信息
   #mod 141223 add bmba009&xcadseq
   IF g_xcad1_m.pbom = '1' THEN
      #171227-00001#1---mod---s
      #LET g_sql = " SELECT bmba001,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,bmbasite ",
      #           #"   FROM bmba_t,imaa_t", #161130-00004#1 mark
      #           #"  WHERE bmbaent = imaaent AND bmba001 = imaa001 ", #161130-00004#1 mark
      #           #161130-00004#1 ---add (s)---
      #            "   FROM bmba_t,bmaa_t,imaa_t", 
      #            "  WHERE bmbaent = bmaaent AND bmba001 = bmaa001 and bmbaent = imaaent AND bmba001 = imaa001 AND bmbasite = bmaasite ", 
      #            "   AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",
      #            "    AND bmaastus = 'Y' ",
      #           #161130-00004#1 ---add (e)---
      #            "    AND bmbaent = '",g_enterprise,"'",
      #            "    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
      #            "    AND imaa004 = 'A' AND ",g_wc CLIPPED, 
      #            "  ORDER BY bmba001 "
#      LET g_sql = " SELECT bmba001,bmba002,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,bmbasite,bmba010, ",  #171229-00014#1-add bmba010 #180118-00044#1 add bmba002   #171211-00028#9 mark
      LET g_sql = " SELECT bmba001,bmba002,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,?,' ',bmba014,bmbasite,bmba010, ",  #171211-00028#9 mod
                  "        (SELECT imaa006 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa006 ",   #171229-00014#1-add
                  "        ,(SELECT imaa005 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa005 ",   #171211-00028#9 add
                  "        ,(SELECT imaa005 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba001) imaa005_2 ",   #171211-00028#9 add
                  "        ,(SELECT imaa006 FROM imaa_t WHERE imaaent=bmaaent AND imaa001=bmaa001) imaa006_1,bmaa004 ",   #200203-00021#1 add
                  "   FROM bmba_t,bmaa_t,imaa_t", 
                  "  WHERE bmbaent = bmaaent AND bmbasite = bmaasite AND bmba001 = bmaa001 AND bmba002 = bmaa002 ",
                  "    AND bmbaent = imaaent AND bmba001 = imaa001  ", 
                  #"    AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",     #180731-00017#9 Mark By 06137  180806
                  #"    AND (bmba006 IS NULL OR bmba006>? )",       #180731-00017#9 Add By 06137  180806 #180719-00053#1 mark
                  "    AND bmaastus = 'Y' ",
                  "    AND bmbaent = '",g_enterprise,"'",
                  "    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
                  "    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                  "    AND bmba002 = '",g_xcad1_m.bmaa002,"'",
                  "    AND bmba001 = ? ",  #171211-00028#9 add 
                  "    AND bmba019 != '2' ", #190917-00006#1 add
                 #190916-00006#1---mark---str---
                 #"  UNION ",
#                # " SELECT bmba001,bmba002,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,bmbasite,bmba010, ",   #171229-00014#1-add bmba010 #180118-00044#1 add bmba002  #171211-00028#9 mark
                 #" SELECT bmba001,bmba002,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,?,' ',bmba014,bmbasite,bmba010, ",   #171211-00028#9 mod
                 #"        (SELECT imaa006 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa006 ",   #171229-00014#1-add
                 #"        ,(SELECT imaa005 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba003) imaa005 ",   #171211-00028#9 add
                 #"        ,(SELECT imaa005 FROM imaa_t WHERE imaaent=bmbaent AND imaa001=bmba001) imaa005_2 ",   #171211-00028#9 add
                 #"   FROM bmba_t,bmaa_t,imaa_t", 
                 #"  WHERE bmbaent = bmaaent AND bmbasite = bmaasite AND bmba001 = bmaa001 AND bmba002 = bmaa002 ",
                 #"    AND bmbaent = imaaent AND bmba001 = imaa001  ", 
                 ##"    AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",  #180731-00017#9 Mark By 06137  180806
                 #"    AND (bmba006 IS NULL OR bmba006>? )",   #180731-00017#9 Add By 06137  180806
                 #"    AND bmaastus = 'Y' ",
                 #"    AND bmbaent = '",g_enterprise,"'",
                 #"    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
                 #"    AND imaa004 = 'A' AND ",g_wc CLIPPED,
                 #"    AND bmba002 = ' '",
                 #"    AND bmba001 = ? ", #171211-00028#9 add
                 #"    AND NOT EXISTS (SELECT 1 FROM bmaa_t WHERE bmaaent=bmbaent AND bmbasite=bmaasite AND bmaa001=bmba001 AND bmba002 ='",g_xcad1_m.bmaa002,"')",
                 #190916-00006#1---mark---end---
                  " ORDER BY bmba001"
      #171227-00001#1---mod---e            
   ELSE
#      LET g_sql = " SELECT xcad002,' ',xcadseq,xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,xcad009,xcad010,xcad011,xcad012,xcad013,xcadsite ", #180118-00044#1 add ' ' #171211-00028#9 mark
      LET g_sql = " SELECT xcad002,' ',xcadseq,xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,xcad009,xcad010,xcad011,xcad012,xcad013,xcad014,xcad015,'',xcadsite,'','','' ", #171211-00028#9 mod
                  "        ,(SELECT imaa005 FROM imaa_t WHERE imaaent= xcadent AND imaa001=xcad002) imaa005_2 ",   #171211-00028#9 add
                  "        ,'',''",#200203-00021#1 add
                  "   FROM xcad_t,imaa_t ",
                  "  WHERE xcadent = imaaent AND xcad002 = imaa001 ",
                  "    AND xcadent = '",g_enterprise,"'",
                  "    AND xcad001 = '",g_xcad1_m.xcad001_1,"'"
                  #171030-00022#1  add by 09767-->s
                  ,"    AND xcad002 NOT IN (SELECT xcad003 FROM xcad_t WHERE xcadent = '",g_enterprise,"'",
                  "    AND xcad001 = '",g_xcad1_m.xcad001_1,"')"
                  #171030-00022#1  add by 09767-->e
                  ," ORDER BY xcad002,xcadseq" #171211-00028#9 add
   END IF
   PREPARE xcad001_prep FROM g_sql    
   DECLARE xcad001_curs CURSOR FOR xcad001_prep 
   LET l_xcadcrtdt = cl_get_current()
   LET l_bmba001_t = ''
   LET l_xcad002_t = ''  #171211-00028#7  add
   #171211-00028#9 add-S 如果是p-bom，先foreach所有的工单中产品特征到主件料号、产品特征中
   #再展BOM插入到成本BOM中
   IF g_xcad1_m.pbom = '1' THEN
      INITIALIZE l_xcad.* TO NULL
#      FOREACH axci004_feature_curs INTO l_xcad.xcad002,l_bmba002,l_xcad.xcad014  #180719-00053#1 mark
      FOREACH axci004_feature_curs USING ldt_xcad012,ldt_xcad012,ldt_xcad013,ldt_xcad013,ldt_xcad012,ldt_xcad012,ldt_xcad013,ldt_xcad013 #180719-00053#1 add
                                    INTO l_xcad.xcad002,l_bmba002,l_xcad.xcad014  #180719-00053#1 add
         #FOREACH xcad001_curs USING l_xcad.xcad014,l_xcad.xcad002,l_xcad.xcad014,l_xcad.xcad002   #180731-00017#9 Mark By 06137  180806
        #FOREACH xcad001_curs USING l_xcad.xcad014,l_bmab006,l_xcad.xcad002,l_xcad.xcad014,l_bmab006,l_xcad.xcad002    #180731-00017#9 Add By 06137  180806 #190916-00006#1 mark
         FOREACH xcad001_curs USING l_xcad.xcad014,ldt_xcad012,ldt_xcad012,ldt_xcad013,ldt_xcad013,l_xcad.xcad002   #180719-00053#1 mod
                              INTO  l_xcad.xcad002,l_bmba002,l_xcad.xcadseq,l_xcad.xcad003,l_xcad.xcad004,  
                                    l_xcad.xcad005,l_xcad.xcad006,l_xcad.xcad007,l_xcad.xcad008,
                                    l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013,
                                    l_xcad.xcad014,l_xcad.xcad015,l_bmba014,
                                    l_xcad.xcadsite,l_bmba010,l_imaa006,l_imaa005,l_imaa005_2  
                                    ,l_imaa006_1,l_bmaa004 #200203-00021#1 add
            #判断现有的成本BOM或者暂存档中是否有此笔资料，如果有，则跳过，插入下一笔
            IF l_xcad.xcad013 IS NULL THEN
               LET l_n1 = 0
               EXECUTE xcad_ext_chk1 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                           l_xcad.xcad011,l_xcad.xcad012
                                          ,l_xcad.xcad014,l_xcad.xcad015
                                     INTO l_n1
               LET l_n2 = 0   
               IF l_n1 = 0 THEN
                  EXECUTE xcad_ext_chk2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                              l_xcad.xcad011,l_xcad.xcad012
                                             ,l_xcad.xcad014,l_xcad.xcad015   
                                        INTO l_n2
               END IF   
            ELSE
               LET l_n1 = 0
               EXECUTE xcad_ext_chk1_2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                             l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013
                                            ,l_xcad.xcad014,l_xcad.xcad015   
                                     INTO l_n1
               LET l_n2 = 0   
               IF l_n1 = 0 THEN 
                  EXECUTE xcad_ext_chk2_2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                                l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013
                                               ,l_xcad.xcad014,l_xcad.xcad015   
                                           INTO l_n2     
               END IF
            END IF
            IF l_n1 > 0 OR l_n2 > 0 THEN
               CONTINUE FOREACH
            END IF
            SELECT MAX(xcadseq) INTO l_xcadseq_1 FROM xcad_t 
             WHERE xcadent = g_enterprise
               AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002 AND xcad014 = l_xcad.xcad014
            IF cl_null(l_xcadseq_1) THEN LET l_xcadseq_1 = 0 END IF
             
            SELECT MAX(xcadseq) INTO l_xcadseq_2 FROM axci004_tmp01
             WHERE xcadent = g_enterprise
               AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002 AND xcad014 = l_xcad.xcad014
            IF cl_null(l_xcadseq_2) THEN LET l_xcadseq_2 = 0 END IF
            IF l_xcadseq_1 >= l_xcadseq_2 THEN
               LET l_xcadseq = l_xcadseq_1
            ELSE
               LET l_xcadseq = l_xcadseq_2
            END IF
            LET l_xcadseq = l_xcadseq + 1
            LET l_bmba001_t = l_xcad.xcad002
            LET l_xcad.xcadseq = l_xcadseq
            #如果有做特征管理，需要检查限定特征
            IF g_fin_6013 = 'Y' THEN
               IF l_bmba014 = 'Y' AND NOT cl_null(l_xcad.xcad014) THEN
                  CALL axci004_01_bom_feature(l_xcad.xcad002,l_bmba002,l_xcad.xcad003,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad014,l_imaa005)
                     RETURNING l_success,l_feature
                  IF NOT l_success THEN
                     CONTINUE FOREACH
                  END IF
                  LET l_xcad.xcad015 = l_feature
               ELSE
                  LET l_xcad.xcad015 = ' '
               END IF
            ELSE
               LET l_xcad.xcad014 = ' '
               LET l_xcad.xcad015 = ' '
            END IF
            IF l_bmba010 <> l_imaa006 THEN 
               CALL s_aooi250_convert_qty1(l_xcad.xcad003,l_bmba010,l_imaa006,l_xcad.xcad004) RETURNING l_success,l_xcad.xcad004
            END IF
            #200203-00021#1 add---(S)
            CALL s_aooi250_convert_qty(l_xcad.xcad002,l_bmaa004,l_imaa006_1,l_xcad.xcad005) 
               RETURNING l_success,l_xcad.xcad005
            #200203-00021#1 add---(E)
            LET l_imaa004 = ''
            SELECT imaa004 INTO l_imaa004 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = l_xcad.xcad003
            IF l_imaa004 <> 'X' THEN            
               INSERT INTO axci004_tmp01(x_level,xcadent,xcad001,xcadsite,xcad002,xcadseq,
                                         xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                                         xcad009,xcad010,xcad011,xcad012,xcad013,
                                         xcad014,xcad015,  
                                         xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt)
                             VALUES(0,g_enterprise,g_xcad_m.xcad001,l_xcad.xcadsite,l_xcad.xcad002,l_xcad.xcadseq,
                                    l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_xcad.xcad006,l_xcad.xcad007,l_xcad.xcad008,
                                    l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013,
                                    l_xcad.xcad014,l_xcad.xcad015,  
                                    'N',g_user,g_dept,g_user,g_dept,l_xcadcrtdt)
            END IF 
            CALL axci004_01_recycle_ins(l_xcad.xcad003,l_bmba002) RETURNING l_success   #200512-00034#1 add
            #單階BOM为N就是要往下展
            IF g_xcad_m.single = 'N' THEN 
               CALL axci004_01_bom(0,l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_bmba002,l_xcad.xcad002,l_xcad.xcad015) 
            END IF
         END FOREACH
         #171211-00028#7--add---s
         #判断是否有联产品资料，且和主件料号不同，若不一样，则复制主件的BOM结构给联产品
         #一个料号只走一次
         IF l_xcad.xcad002 <> l_xcad002_t OR cl_null(l_xcad002_t) THEN
            LET l_bmab003 = ''
            #180731-00017#9 Mark By 06137  180806(S)
            #SELECT bmab003 INTO l_bmab003 FROM bmab_t 
            #  WHERE bmabent = g_enterprise AND bmab001 = l_xcad.xcad002 AND bmab002 = l_bmba002
            #    AND bmabsite = l_xcad.xcadsite
            #    AND (bmab006 IS NULL OR to_char(bmab006,'YY/MM/DD hh24:mi:ss') > g_today )
            #180731-00017#9 Mark By 06137  180806(E)
            #180731-00017#9 Add By 06137  180806(S)            
            #PGS(D)-13589 memo -S- mark
#            LET l_sql = " SELECT bmab003 FROM bmab_t ",  
#                        "  WHERE bmabent = ", g_enterprise, 
#                        "    AND bmab001 = '",l_xcad.xcad002,"'", 
#                        "    AND bmab002 = '",l_bmba002,"'",
#                        "    AND bmabsite = '",l_xcad.xcadsite,"'",
#                        "    AND (bmab006 IS NULL OR bmab006 > ? ) "
            #PGS(D)-13589 memo -E- mark 
            #PGS(D)-13589 memo -S- add
            LET l_sql = " SELECT bmab003 FROM bmab_t ",  
                        "  WHERE bmabent = ", g_enterprise, 
                        "    AND bmab001 = '",l_xcad.xcad002,"'", 
                        "    AND bmab002 = '",l_bmba002,"'",
                        "    AND bmabsite = '",l_xcad.xcadsite,"'",
                        "    AND (bmab006 IS NULL OR bmab006 > ? ) AND ROWNUM = 1"
            #PGS(D)-13589 memo -E- add
            PREPARE axci004_01_bmab003 FROM l_sql
            EXECUTE axci004_01_bmab003 USING l_bmab006 INTO l_bmab003
            #180731-00017#9 Add By 06137  180806(E)  

            IF NOT cl_null(l_bmab003) THEN
               IF l_bmab003 <> l_xcad.xcad002 OR NOT cl_null(l_xcad.xcad014) THEN 
                  #CREATE TEMP TABLE
                  SELECT * FROM axci004_tmp01
                    WHERE xcadent = g_enterprise AND xcad002 = l_xcad.xcad002 AND xcad014 = l_xcad.xcad014
                   INTO TEMP axci004_detail
                  
                  #將key修正為調整後   
                  UPDATE axci004_detail SET xcad002 = l_bmab003,xcad014 = ' '
                  
                  INSERT INTO axci004_tmp01 SELECT * FROM axci004_detail

                  DROP TABLE axci004_detail #ODI-ORA#
               END IF
            END IF
         END IF
         LET l_xcad002_t = l_xcad.xcad002
         #171211-00028#7--add---e
         CALL axci004_01_recycle_ins(l_xcad.xcad002,l_bmba002) RETURNING l_success    #200512-00034#1 add
      END FOREACH
   END IF
   #如果是直接复制之前的版本，则直接查询之前的版本，复制产生即可
   IF (g_xcad1_m.pbom <> '1' OR cl_null(g_xcad1_m.pbom)) THEN   #180719-00053#1  mod  调整选择标准成本基础数据时，引入失败问题
   #171211-00028#9 add-E
   FOREACH xcad001_curs INTO  l_xcad.xcad002,l_bmba002,l_xcad.xcadseq,l_xcad.xcad003,l_xcad.xcad004,  #171227-00001#1 add bmba002
                              l_xcad.xcad005,l_xcad.xcad006,l_xcad.xcad007,l_xcad.xcad008,
                              l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013,
                              l_xcad.xcad014,l_xcad.xcad015,l_bmba014,   #171211-00028#9 add
                              l_xcad.xcadsite,l_bmba010,l_imaa006   #171229-00014#1 add l_bmba010,l_imaa006
                              ,l_imaa005,l_imaa005_2   #171211-00028#9 add
                              ,l_imaa006_1,l_bmaa004 #200203-00021#1 add
      #171227-00001#1---mark---s
      ##引入来源为P-BOM的，先指定需抓取料件bom的哪个特性l_bmba002
      #IF g_xcad1_m.pbom = '1' THEN
      #   LET l_n = 0 
      #   
      #   LET g_sql = l_sql1 CLIPPED," AND bmba002 = '",g_xcad1_m.bmaa002,"'", #特性
      #                              " AND bmba001 = '",l_xcad.xcad002,"'", #主件
      #                              " GROUP BY bmba002"
      #   PREPARE bmba002_prep2 FROM g_sql
      #   EXECUTE bmba002_prep2 INTO l_n,l_bmba002
      #   #料件特性有输入，但抓不到资料
      #   IF l_n = 0 THEN
      #      LET l_n = 0
      #      #料件特性有输入，但抓不到资料，抓特性为空的资料
      #      LET g_sql = l_sql1 CLIPPED," AND bmba002 = ' ' ",
      #                                 " AND bmba001 = '",l_xcad.xcad002,"'",
      #                                 " GROUP BY bmba002"
      #      PREPARE bmba002_prep FROM g_sql
      #      EXECUTE bmba002_prep INTO l_n,l_bmba002
      #      IF l_n <> 0 THEN
      #         LET l_bmba002 = ' '
      #      ELSE
      #         #若特性为空无资料，抓改料号的第一笔特性
      #         LET g_sql = l_sql1 CLIPPED, 
      #                    " AND bmba001 = '",l_xcad.xcad002,"'",
      #                    " GROUP BY bmba002"
      #         PREPARE bmba002_prep1 FROM g_sql
      #         DECLARE bmba002_curs1 SCROLL CURSOR FOR bmba002_prep1
      #         OPEN bmba002_curs1
      #         FETCH FIRST bmba002_curs1 INTO l_n,l_bmba002
      #         CLOSE bmba002_curs1
      #      END IF
      #   ELSE
      #      LET l_bmba002 = g_xcad1_m.bmaa002  
      #   END IF
      #END IF
      #171227-00001#1---mark---s
      #171227-00001#1---mod---s
      ##檢查xcad_t裏面是否已存在需插入料件，已存在过就不不重复插入
      #LET l_n1 = 0
      #SELECT COUNT(*) INTO l_n1 FROM axci004_tmp01             #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
      # WHERE xcadent = g_enterprise
      #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002
      #   AND xcad003 = l_xcad.xcad003
      #   #161130-00004#1 ---add (s)---
      #   AND xcad009 = l_xcad.xcad009 AND xcad010 = l_xcad.xcad010
      #   AND xcad011 = l_xcad.xcad011 AND xcad012 = l_xcad.xcad012
      #   AND xcad013 = l_xcad.xcad013
      #   #161130-00004#1 ---add (e)---
      #IF l_n1 > 0 THEN
      #   CONTINUE FOREACH
      #END IF
      #
      #LET l_n1 = 0
      #SELECT COUNT(*) INTO l_n1 FROM xcad_t
      # WHERE xcadent = g_enterprise
      #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002
      #   AND xcad003 = l_xcad.xcad003
      #   #161130-00004#1 ---add (s)---
      #   AND xcad009 = l_xcad.xcad009 AND xcad010 = l_xcad.xcad010
      #   AND xcad011 = l_xcad.xcad011 AND xcad012 = l_xcad.xcad012
      #   AND xcad013 = l_xcad.xcad013
      #   #161130-00004#1 ---add (e)---
      #IF l_n1 > 0 THEN
      #   CONTINUE FOREACH
      #END IF
#      
      IF l_xcad.xcad013 IS NULL THEN
         LET l_n1 = 0
         EXECUTE xcad_ext_chk1 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                     l_xcad.xcad011,l_xcad.xcad012
                                    ,l_xcad.xcad014,l_xcad.xcad015   #171211-00028#9 add
                               INTO l_n1
         #171211-00028#9 mark-S
#         IF l_n1 > 0 THEN 
#            CONTINUE FOREACH
#         END IF
         #171211-00028#9 mark-E
         LET l_n2 = 0   #171211-00028#9 mod l_n1-->l_n2
         IF l_n1 = 0 THEN  #171211-00028#9 add
            EXECUTE xcad_ext_chk2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                        l_xcad.xcad011,l_xcad.xcad012
                                       ,l_xcad.xcad014,l_xcad.xcad015   #171211-00028#9 add
                                  INTO l_n2     #171211-00028#9 mod l_n1-->l_n2
            #171211-00028#9 mark-S
#            IF l_n1 > 0 THEN
#               CONTINUE FOREACH
#            END IF
            #171211-00028#9 mark-E
         END IF   #171211-00028#9 add
      ELSE
         LET l_n1 = 0
         EXECUTE xcad_ext_chk1_2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                       l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013
                                      ,l_xcad.xcad014,l_xcad.xcad015   #171211-00028#9 add
                               INTO l_n1
         #171211-00028#9 mark-S                               
#         IF l_n1 > 0 THEN
#            CONTINUE FOREACH
#         END IF
         #171211-00028#9 mark-E
         LET l_n2 = 0   #171211-00028#9 mod l_n1-->l_n2
         IF l_n1 = 0 THEN  #171211-00028#9 add
            EXECUTE xcad_ext_chk2_2 USING l_xcad.xcad002,l_xcad.xcad003,l_xcad.xcad009,l_xcad.xcad010,
                                          l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013
                                         ,l_xcad.xcad014,l_xcad.xcad015   #171211-00028#9 add
                                     INTO l_n2     #171211-00028#9 mod l_n1-->l_n2
            #171211-00028#9 mark-S
#            IF l_n1 > 0 THEN
#               CONTINUE FOREACH
#            END IF
            #171211-00028#9 mark-E
         END IF #171211-00028#9 add
      END IF
      #171227-00001#1---mod---e
      #171211-00028#9 mark-S
#      #add 141223
#      IF g_xcad1_m.pbom = '1' THEN
#        #161130-00004#1 ---mark (s)---
#        #IF cl_null(l_bmba001_t) OR l_bmba001_t!=l_xcad.xcad002 THEN
#        #   LET l_xcadseq = 0
#        #END IF
#        #161130-00004#1 ---mark (e)---
#        #161130-00004#1 ---add (s)---
#         SELECT MAX(xcadseq) INTO l_xcadseq_1 FROM xcad_t 
#          WHERE xcadent = g_enterprise
#            AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002 
#         IF cl_null(l_xcadseq_1) THEN LET l_xcadseq_1 = 0 END IF
#
#         SELECT MAX(xcadseq) INTO l_xcadseq_2 FROM axci004_tmp01
#          WHERE xcadent = g_enterprise
#            AND xcad001 = g_xcad_m.xcad001 AND xcad002 = l_xcad.xcad002
#         IF cl_null(l_xcadseq_2) THEN LET l_xcadseq_2 = 0 END IF
#         IF l_xcadseq_1 >= l_xcadseq_2 THEN
#            LET l_xcadseq = l_xcadseq_1
#         ELSE
#            LET l_xcadseq = l_xcadseq_2
#         END IF
#        #161130-00004#1 ---add (e)---
#         LET l_xcadseq = l_xcadseq + 1
#         LET l_bmba001_t = l_xcad.xcad002
#         LET l_xcad.xcadseq = l_xcadseq
#      END IF
#      #add 141223 end
#
#      #171229-00014#1-add--s
#      IF l_bmba010 <> l_imaa006 THEN 
#         CALL s_aooi250_convert_qty1(l_xcad.xcad003,l_bmba010,l_imaa006,l_xcad.xcad004) RETURNING l_success,l_xcad.xcad004
#      END IF
#      #171229-00014#1-add--e
#      
#      #171027-00008#1---add---s
#      LET l_imaa004 = ''
#      SELECT imaa004 INTO l_imaa004 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = l_xcad.xcad003
#      IF l_imaa004 <> 'X' THEN      
#      #171027-00008#1---add---e
#        #mod 141223 add xcadseq
#        INSERT INTO axci004_tmp01(x_level,xcadent,xcad001,xcadsite,xcad002,xcadseq,           #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
#                                       xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
#                                       xcad009,xcad010,xcad011,xcad012,xcad013,
#                                       xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt)
#                     VALUES(0,g_enterprise,g_xcad_m.xcad001,l_xcad.xcadsite,l_xcad.xcad002,l_xcad.xcadseq,
#                            l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_xcad.xcad006,l_xcad.xcad007,l_xcad.xcad008,
#                            l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013,
#                            'N',g_user,g_dept,g_user,g_dept,l_xcadcrtdt)
#     END IF  #171027-00008#1               
#     #單階BOM为N就是要往下展
#     IF g_xcad_m.single = 'N' THEN 
#        #CALL axci004_01_bom(0,l_xcad.xcad003,l_bmba002)  ##171027-00008#1 mark
#        CALL axci004_01_bom(0,l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_bmba002,l_xcad.xcad002)  #171027-00008#1 add #171227-00001#1 add xcad004,xcad005
#     END IF
#   END FOREACH
   #171211-00028#9 mark-E
   
   #171211-00028#9 add-S
   #如果xcad或者暂存档中没有，则需要新增（如果是展P-BOM则需要根据产品特徵设定展据点BOM，如果是复制xcad的则直接展xcad的BOM即可）
      IF l_n1 = 0 AND l_n2 = 0 THEN 
         LET l_imaa004 = ''
         SELECT imaa004 INTO l_imaa004 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = l_xcad.xcad003
         IF l_imaa004 <> 'X' THEN            
            INSERT INTO axci004_tmp01(x_level,xcadent,xcad001,xcadsite,xcad002,xcadseq,           #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
                                      xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                                      xcad009,xcad010,xcad011,xcad012,xcad013,
                                      xcad014,xcad015,  #171211-00028#9 add
                                      xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt)
                          VALUES(0,g_enterprise,g_xcad_m.xcad001,l_xcad.xcadsite,l_xcad.xcad002,l_xcad.xcadseq,
                                 l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_xcad.xcad006,l_xcad.xcad007,l_xcad.xcad008,
                                 l_xcad.xcad009,l_xcad.xcad010,l_xcad.xcad011,l_xcad.xcad012,l_xcad.xcad013,
                                 l_xcad.xcad014,l_xcad.xcad015,  #171211-00028#9 add
                                 'N',g_user,g_dept,g_user,g_dept,l_xcadcrtdt)
         END IF  #171027-00008#1               
         #單階BOM为N就是要往下展
         IF g_xcad_m.single = 'N' THEN 
            CALL axci004_01_bom(0,l_xcad.xcad003,l_xcad.xcad004,l_xcad.xcad005,l_bmba002,l_xcad.xcad002,l_xcad.xcad015)  #171027-00008#1 add #171227-00001#1 add xcad004,xcad005 #171211-00028#9 add xcad015
         END IF
      END IF
      #如果工单中有xcad中不存在的产品特徵，也需要新增
   END FOREACH
   END IF
   #171211-00028#9 add-E
   
   LET l_n1 = 0 
   #SELECT COUNT(*) INTO l_n1 FROM axci004_tmp01 WHERE x_level = 0           #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01   #200806-00061#1---mark
   SELECT COUNT(*) INTO l_n1 FROM axci004_tmp01 WHERE x_level >= 0        #200806-00061#1---add
   IF l_n1 = 0 THEN
      #没有可插入资料，请重新输入！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00098'
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success  #171211-00028#9 add
   END IF
   
   #mark 产生临时表时已经分好了，如果临时表部分，效率会慢
   ##單階BOM
   #mod 141223 add xcadseq
   #IF g_xcad_m.single = 'Y' THEN 
   #   INSERT INTO xcad_t (xcadent,xcad001,xcadsite,xcad002,xcadseq,
   #                       xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
   #                       xcad009,xcad010,xcad011,xcad012,xcad013,
   #                       xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt) 
   #       SELECT xcadent,xcad001,xcadsite,xcad002,xcadseq,
   #              xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
   #              xcad009,xcad010,xcad011,xcad012,xcad013,
   #              'N',xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt
   #         FROM axci004_01_ins_tmp  
   #        WHERE x_level = 0  
   #ELSE
      INSERT INTO xcad_t (xcadent,xcad001,xcadsite,xcad002,xcadseq,
                          xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                          xcad009,xcad010,xcad011,xcad012,xcad013,
                          xcad014,xcad015,   #171211-00028#9 add
                          xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt) 
          SELECT xcadent,xcad001,xcadsite,xcad002,xcadseq,
                 xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                 xcad009,xcad010,xcad011,xcad012,xcad013,
                 xcad014,xcad015,   #171211-00028#9 add
                 'N',xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt
            FROM axci004_tmp01      #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01          
   #END IF
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "xcad_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE                   
   END IF
   
   #200512-00034#1 mark(s)
   ##191125-00030#1 -S add
   #IF g_xcad1_m.pbom = '1' AND g_xcad_m.recycle = 'Y' THEN
   #   LET ldt_xcad012 = ''
   #   LET ldt_xcad013 = ''
   #   LET l_sql = " SELECT bmacsite,bmac001,bmac003,bmac004,bmac005,",
   #                       "bmac006,bmac007,bmac008",
   #               "   FROM bmac_t",
   #               "  WHERE bmacent = ",g_enterprise,
   #               "    AND bmacsite = '",g_xcad1_m.xcadsite1,"'"
   #   IF cl_null(g_xcad_m.xcad012_1) THEN
   #      LET l_sql = l_sql," AND (1=1 OR (bmac007 <= ? AND (bmac008 >=?))) "
   #   ELSE
   #      LET ldt_xcad012 = g_xcad_m.xcad012_1
   #      LET l_sql = l_sql," AND bmac007 <= ? AND (bmac008 >=? OR bmac008 IS NULL) "
   #   END IF
   #   
   #   IF cl_null(g_xcad_m.xcad013_1) THEN
   #      LET l_sql = l_sql," AND (1=1 OR (bmac008 >= ? AND (bmac007 <=?))) "
   #   ELSE
   #      LET ldt_xcad013 = g_xcad_m.xcad013_1
   #      LET l_sql = l_sql," AND bmac008 >= ? AND (bmac007 <=? OR bmac007 IS NULL) "
   #   END IF
   #   IF NOT cl_null(l_bmac001_wc) THEN
   #      LET l_bmac001_wc = cl_replace_str(l_bmac001_wc,'xcad002_1','bmac001')
   #      LET l_sql = l_sql," AND ",l_bmac001_wc
   #   END IF
   #   
   #   PREPARE sel_bmac_pre FROM l_sql
   #   DECLARE sel_bmac_cur CURSOR FOR sel_bmac_pre
   #   FOREACH sel_bmac_cur USING ldt_xcad012,ldt_xcad013,ldt_xcad013,ldt_xcad012
   #      INTO l_bmac.bmacsite,l_bmac.bmac001,l_bmac.bmac003,l_bmac.bmac004,l_bmac.bmac005,
   #           l_bmac.bmac006,l_bmac.bmac007,l_bmac.bmac008
   #      #項次
   #      SELECT MAX(xcadseq)+1 INTO l_xcad.xcadseq
   #        FROM xcad_t 
   #       WHERE xcadent = g_enterprise
   #         AND xcad001 = g_xcad_m.xcad001
   #         AND xcad002 = l_bmac.bmac001
   #         AND xcad014 = ' '
   #      IF cl_null(l_xcad.xcadseq) THEN
   #         LET l_xcad.xcadseq = 1
   #      END IF
   #      
   #      #基礎單位
   #      SELECT imaa006 INTO l_imaa006
   #        FROM imaa_t
   #       WHERE imaaent = g_enterprise
   #         AND imaa001 = l_bmac.bmac001
   #      
   #      IF l_imaa006 <> l_bmac.bmac004 THEN
   #         CALL s_aooi250_convert_qty1(l_bmac.bmac001,l_bmac.bmac004,l_imaa006,l_bmac.bmac005)
   #            RETURNING l_success,l_bmac.bmac005
   #         
   #         CALL s_aooi250_convert_qty1(l_bmac.bmac001,l_bmac.bmac004,l_imaa006,l_bmac.bmac006)
   #            RETURNING l_success,l_bmac.bmac006
   #      END IF
   #      
   #      LET l_bmac.bmac005 = l_bmac.bmac005 * -1
   #      
   #      INSERT INTO xcad_t (xcadent,xcadsite,xcadseq,xcad001,xcad002,
   #                          xcad003,xcad004,xcad005,xcad006,xcad007,
   #                          xcad008,xcad012,xcad013,xcad014,xcad015,
   #                          xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,
   #                          xcadcrtdt)
   #      VALUES (g_enterprise,l_bmac.bmacsite,l_xcad.xcadseq,g_xcad_m.xcad001,l_bmac.bmac001,
   #              l_bmac.bmac003,l_bmac.bmac005,l_bmac.bmac006,0,0,
   #              0,l_bmac.bmac007,l_bmac.bmac008,' ',' ',
   #              'N',g_user,g_dept,g_user,g_dept,
   #              l_xcadcrtdt)
   #      IF SQLCA.SQLCODE THEN
   #         INITIALIZE g_errparam TO NULL
   #         LET g_errparam.code = SQLCA.sqlcode
   #         LET g_errparam.extend = "bmac_t INSERT INTO xcad_t"
   #         LET g_errparam.popup = TRUE
   #         CALL cl_err()
   #         LET r_success = FALSE                   
   #      END IF
   #   END FOREACH
   #END IF
   ##191125-00030#1 -E add
   #200512-00034#1 mark(e)
   
   RETURN r_success
END FUNCTION
#
PRIVATE FUNCTION axci004_01_set_entry()
   IF g_xcad1_m.pbom= '1' THEN 
      CALL axci004_01_set_comp_entry("xcadsite1,bmaa002",TRUE)
      CALL axci004_01_set_comp_entry("recycle",TRUE)  #191125-00030#1 add
      LET g_xcad1_m.xcad001_1 = ''
      #LET g_xcad1_m.bmaa002 = ''  #191125-00030#1 mark
   ELSE
      CALL axci004_01_set_comp_entry("xcadsite1,bmaa002",FALSE)
      CALL axci004_01_set_comp_entry("recycle",FALSE)  #191125-00030#1 add
   END IF 
   
   IF g_xcad1_m.standard = '1' THEN 
      CALL axci004_01_set_comp_entry("xcad001_1",TRUE)
      LET g_xcad1_m.xcadsite1 = ''
      LET g_xcad1_m.xcadsite1_desc = ''
      #191125-00030#1 -S add
      LET g_xcad1_m.bmaa002 = ''
      LET g_xcad_m.recycle = 'N'
      #191125-00030#1 -E add
   ELSE
      CALL axci004_01_set_comp_entry("xcad001_1",FALSE)
   END IF 
   DISPLAY BY NAME g_xcad1_m.xcadsite1_desc
END FUNCTION
#動態設定元件是否可輸入
PRIVATE FUNCTION axci004_01_set_comp_entry(ps_fields,pi_entry)
  DEFINE ps_fields STRING,
         pi_entry  LIKE type_t.num5           
  DEFINE lst_fields base.StringTokenizer,
         ls_field_name STRING
  DEFINE lwin_curr     ui.Window
  DEFINE lnode_win     om.DomNode,
         llst_items    om.NodeList,
         li_i          LIKE type_t.num5,        
         lnode_item    om.DomNode,
         ls_item_name  STRING

  IF g_bgjob = 'Y' AND g_gui_type NOT MATCHES "[13]"  THEN  
     RETURN
  END IF

  IF (ps_fields IS NULL) THEN
     RETURN
  END IF

  LET ps_fields = ps_fields.toLowerCase()

  LET lst_fields = base.StringTokenizer.create(ps_fields, ",")

  LET lwin_curr = ui.Window.getCurrent()
  LET lnode_win = lwin_curr.getNode()

  LET llst_items = lnode_win.selectByPath("//Form//*")

  WHILE lst_fields.hasMoreTokens()
    LET ls_field_name = lst_fields.nextToken()
    LET ls_field_name = ls_field_name.trim()

    IF (ls_field_name.getLength() > 0) THEN
       FOR li_i = 1 TO llst_items.getLength()
           LET lnode_item = llst_items.item(li_i)
           LET ls_item_name = lnode_item.getAttribute("colName")

           IF (ls_item_name IS NULL) THEN
              LET ls_item_name = lnode_item.getAttribute("name")

              IF (ls_item_name IS NULL) THEN
                 CONTINUE FOR
              END IF
           END IF

           LET ls_item_name = ls_item_name.trim()

           IF (ls_item_name.equals(ls_field_name)) THEN
              IF (pi_entry) THEN
                 CALL lnode_item.setAttribute("noEntry", "0")
                 CALL lnode_item.setAttribute("active", "1")
              ELSE
                 CALL lnode_item.setAttribute("noEntry", "1")
                 CALL lnode_item.setAttribute("active", "0")
              END IF

              EXIT FOR
           END IF
       END FOR
    END IF
  END WHILE
END FUNCTION

################################################################################
# Descriptions...: 展开bom
# Memo...........: #171211-00028#9 mod (add p_feature)
# Usage..........: CALL axci004_01_bom(p_level,p_xcad002,p_xcad004,p_xcad005,p_bmba002,p_bmba001,p_feature)

# Input parameter: p_level        阶数
#                : p_xcad002      主件料号
#                : p_xcad004      组成用量
#                : p_xcad005      主件底数
#                : p_bmba002      特性
#                : p_bmba001      主件料号
#                : p_feature      主件產品特徵
# Return code....: 无
#                : 
# Date & Author..: 日期 By 作者
# Modify.........: 180111-00043#30 By 09505
################################################################################
PRIVATE FUNCTION axci004_01_bom(p_level,p_xcad002,p_xcad004,p_xcad005,p_bmba002,p_bmba001,p_feature)
DEFINE p_level  LIKE type_t.num5
DEFINE p_xcad002 LIKE xcad_t.xcad003
DEFINE p_bmba002 LIKE bmba_t.bmba002
DEFINE p_bmba001 LIKE bmba_t.bmba001   #171027-00008#1 add
DEFINE p_xcad004 LIKE xcad_t.xcad004   #171227-00001#1 add
DEFINE p_xcad005 LIKE xcad_t.xcad005   #171227-00001#1 add
DEFINE p_feature LIKE xcad_t.xcad014   #171211-00028#9 add
DEFINE i        LIKE type_t.num5
DEFINE l_cnt    LIKE type_t.num5
DEFINE l_n1     LIKE type_t.num5
DEFINE l_xcadcrtdt    LIKE xcad_t.xcadcrtdt
DEFINE l_bmba001_t    LIKE bmba_t.bmba001 #主件料号 用于记录旧值
DEFINE l_xcadseq      LIKE xcad_t.xcadseq  #add 141223
DEFINE l_xcadseq_1    LIKE xcad_t.xcadseq  #161130-00004#1 add
DEFINE l_xcadseq_2    LIKE xcad_t.xcadseq  #161130-00004#1 add
DEFINE l_bmab006      DATETIME YEAR TO SECOND   #180731-00017#9 Add By 06137  180806

DEFINE sr DYNAMIC ARRAY OF RECORD
          x_level       LIKE type_t.num5,         #階數
          xcad002   LIKE xcad_t.xcad002,      #主件料號（本階主件）  
          xcadseq   LIKE xcad_t.xcadseq,      #add 141223      
          xcad003   LIKE xcad_t.xcad003,      #元件料號 
          xcad004   LIKE xcad_t.xcad004,      #組成用量
          xcad005   LIKE xcad_t.xcad005,
          xcad006   LIKE xcad_t.xcad006,
          xcad007   LIKE xcad_t.xcad007,
          xcad008   LIKE xcad_t.xcad008,
          xcad009   LIKE xcad_t.xcad009,
          xcad010   LIKE xcad_t.xcad010,
          xcad011   LIKE xcad_t.xcad011,
          xcad012   LIKE xcad_t.xcad012,
          xcad013   LIKE xcad_t.xcad013,
          xcad014   LIKE xcad_t.xcad014,  #171211-00028#9 add
          xcad015   LIKE xcad_t.xcad015,  #171211-00028#9 add
          bmba014   LIKE bmba_t.bmba014,  #171211-00028#9 add
          xcadsite  LIKE xcad_t.xcadsite,
          bmba010   LIKE bmba_t.bmba010,   #171229-00014#1-add
          imaa006   LIKE imaa_t.imaa006    #171229-00014#1-add      
         ,imaa005   LIKE imaa_t.imaa005   #171211-00028#9 add          
         ,imaa006_1 LIKE imaa_t.imaa006   #200203-00021#1 add
         ,bmaa004   LIKE bmaa_t.bmaa004   #200203-00021#1 add
          END RECORD
DEFINE l_imaa004_1    LIKE imaa_t.imaa004   #171027-00008#1 add
DEFINE l_imaa004_2    LIKE imaa_t.imaa004   #171027-00008#1 add
#180731-00017#9 Mark By 06137  180806(S)
#DEFINE g_vdate1       LIKE type_t.chr20  #171030-00022#1 add by 09767
#DEFINE g_vdate2       LIKE type_t.chr20  #171030-00022#1 add by 09767
#180731-00017#9 Mark By 06137  180806(E)
#180731-00017#9 Add By 06137  180806(S)
DEFINE g_vdate1       DATETIME YEAR TO SECOND
DEFINE g_vdate2       DATETIME YEAR TO SECOND
#180731-00017#9 Add By 06137  180806(E)
DEFINE l_success      LIKE type_t.num5   #171229-00014#1-add
DEFINE l_feature      LIKE xcad_t.xcad014   #171211-00028#9 add

   LET p_level = p_level + 1
   LET l_xcadcrtdt = cl_get_current()
   LET l_bmab006 = cl_get_current()    #180731-00017#9 Add By 06137  180806
   
   #171228-00016#1---mark---s
   #IF g_xcad1_m.pbom = '1' THEN
   #   LET g_sql = " SELECT 0,bmba001,bmba009,bmba003,bmba011,bmba012,0,0,0,bmba007,bmba008,bmba004,bmba005,bmba006,bmbasite ",
   #              #161130-00004#1 ---mark (s)---
   #              #"   FROM bmba_t",
   #              #"  WHERE bmbaent = '",g_enterprise,"'",
   #              #161130-00004#1 ---mark (e)---
   #              #161130-00004#1 ---add (s)---
   #               "   FROM bmba_t,bmaa_t",
   #               "  WHERE bmbaent = bmaaent AND bmba001 = bmaa001 AND bmbasite = bmaasite ",
   #               "    AND bmaastus = 'Y' ",
   #               "    AND (bmba006 IS NULL OR to_char(bmba006,'YY/MM/DD hh24:mi:ss')>'",g_today,"')",
   #              #161130-00004#1 ---add (e)---
   #               "    AND bmba002 = '",p_bmba002,"'",
   #               "    AND bmba001 = '",p_xcad002,"'",
   #               "    AND bmbasite = '",g_xcad1_m.xcadsite1,"'",
   #              "  ORDER BY bmba001 "
   #ELSE
   #   LET g_sql = " SELECT 0,xcad002,xcadseq,xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,xcad009,xcad010,xcad011,xcad012,xcad013,xcadsite ",
   #               "   FROM xcad_t",
   #               "  WHERE xcadent = '",g_enterprise,"'",
   #               "    AND xcad001 = '",g_xcad1_m.xcad001_1,"'",
   #               "    AND xcad002 = '",p_xcad002,"'"            
   #END IF  #mod 141223 add xcadseq
   #171228-00016#1---mark---e
    LET l_imaa004_1 =''   #171027-00008#1 add
    SELECT imaa004 INTO l_imaa004_1 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = p_xcad002 #171027-00008#1 add
    LET l_cnt = 1
    #171228-00016#1---mark---s
    #PREPARE axci004_pre3 FROM g_sql
    #DECLARE axci004_cur3 CURSOR FOR axci004_pre3
    #171228-00016#1---mark---e
    LET l_bmba001_t = ''
    LET l_xcadseq = 0  #add 141223   
    #171228-00016#1---mod---s    
    #FOREACH axci004_cur3 INTO sr[l_cnt].*
    IF g_xcad1_m.pbom = '1' THEN
       #FOREACH axci004_cur3 USING p_bmba002,p_xcad002 INTO sr[l_cnt].*            #180731-00017#9 Mark By 06137  180806
       FOREACH axci004_cur3 USING l_bmab006,p_bmba002,p_xcad002 INTO sr[l_cnt].*   #180731-00017#9 Add By 06137  180806   #180719-00053#1 mark #200527-00017#1 remark
       #FOREACH axci004_cur3 USING p_bmba002,p_xcad002 INTO sr[l_cnt].*    #180719-00053#1 add  #200527-00017#1 mark
    #171228-00016#1---mod---e
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "foreach1:"
             LET g_errparam.popup = TRUE
             CALL cl_err()
             EXIT FOREACH
          END IF
          LET g_vdate1 = sr[l_cnt].xcad012
          LET g_vdate2 = sr[l_cnt].xcad013 
          #171211-00028#9 add-S 如果有特征管理，需要看是否限定了元件的特征
          IF g_fin_6013 = 'Y' THEN
             IF NOT cl_null(p_feature) AND NOT cl_null(p_feature) THEN
                LET sr[l_cnt].xcad014 = p_feature
                CALL axci004_01_bom_feature(sr[l_cnt].xcad002,p_bmba002,sr[l_cnt].xcad003,sr[l_cnt].xcad011,sr[l_cnt].xcad012,sr[l_cnt].xcad009,sr[l_cnt].xcad010,sr[l_cnt].xcad014,sr[l_cnt].imaa005)
                    RETURNING l_success,l_feature
                 IF NOT l_success THEN
                    CONTINUE FOREACH
                 END IF
                 IF NOT cl_null(l_feature) THEN
                    LET sr[l_cnt].xcad015 = l_feature
                 ELSE
                    LET sr[l_cnt].xcad015 = ' '
                 END IF
              END IF
          ELSE
              LET sr[l_cnt].xcad014 = ' '
              LET sr[l_cnt].xcad015 = ' '
          END IF
          #171211-00028#9 add-E          
          #171027-00008#1---add---s
          IF l_imaa004_1 ='X' THEN
             #171227-00001#1---mod---s
             ##檢查xcad_t裏面是否已存在需插入料件
             #LET l_n1 = 0
             #SELECT COUNT(*) INTO l_n1 FROM axci004_tmp01            #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01 
             # WHERE xcadent = g_enterprise
             #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = p_bmba001
             #   AND xcad003 = sr[l_cnt].xcad003
             #  #161130-00004#1 ---add (s)---
             #   AND xcad009 = sr[l_cnt].xcad009 AND xcad010 = sr[l_cnt].xcad010
             #   AND xcad011 = sr[l_cnt].xcad011 AND xcad012 = sr[l_cnt].xcad012
             #   AND xcad013 = sr[l_cnt].xcad013
             #  #161130-00004#1 ---add (e)---
             #IF l_n1 > 0 THEN
             #   CONTINUE FOREACH
             #END IF
             #
             ##檢查xcad_t裏面是否已存在需插入料件
             #LET l_n1 = 0
             #SELECT COUNT(*) INTO l_n1 FROM xcad_t
             # WHERE xcadent = g_enterprise
             #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = p_bmba001    
             #   AND xcad003 = sr[l_cnt].xcad003
             #  #161130-00004#1 ---add (s)---
             #   AND xcad009 = sr[l_cnt].xcad009 AND xcad010 = sr[l_cnt].xcad010
             #   AND xcad011 = sr[l_cnt].xcad011 AND xcad012 = sr[l_cnt].xcad012
             #   AND xcad013 = sr[l_cnt].xcad013
             #  #161130-00004#1 ---add (e)---
             #IF l_n1 > 0 THEN
             #   CONTINUE FOREACH
             #END IF  
             LET l_n1 = 0 
             LET g_sql = "SELECT COUNT(*) FROM axci004_tmp01 ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",p_bmba001,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL  THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "     #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "     #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre6 FROM g_sql
             #EXECUTE g_sql_pre6 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre6 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre6 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre6 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre6 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E)
             #171030-00022#1  modify by 09767-->e
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF 
             
             LET l_n1 = 0  
             LET g_sql = "SELECT COUNT(*) FROM xcad_t ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",p_bmba001,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre25 FROM g_sql
             #EXECUTE g_sql_pre25 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre25 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre25 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre25 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre25 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E)                        

             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF             
             #171227-00001#1---mod---e             
          ELSE
          #171027-00008#1---add---e
             #檢查xcad_t裏面是否已存在需插入料件
             LET l_n1 = 0
             #171030-00022#1  mark by 09767-->s
             #SELECT COUNT(*) INTO l_n1 FROM axci004_tmp01            #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01 
             # WHERE xcadent = g_enterprise
             #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[l_cnt].xcad002
             #   AND xcad003 = sr[l_cnt].xcad003 
             #  #161130-00004#1 ---add (s)---
             #   AND xcad009 = sr[l_cnt].xcad009 AND xcad010 = sr[l_cnt].xcad010
             #   AND xcad011 = sr[l_cnt].xcad011 AND xcad012 = sr[l_cnt].xcad012
             #   AND xcad013 = sr[l_cnt].xcad013
             #  #161130-00004#1 ---add (e)---
             #171030-00022#1  mark by 09767-->e
             #171030-00022#1  modify by 09767-->s  
             LET g_sql = "SELECT COUNT(*) FROM axci004_tmp01 ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",sr[l_cnt].xcad002,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL  THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806 
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806 
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre FROM g_sql
             #EXECUTE g_sql_pre INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E)              
             #171030-00022#1  modify by 09767-->e
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF
             
             #檢查xcad_t裏面是否已存在需插入料件
             LET l_n1 = 0
             #171030-00022#1  mark by 09767-->s
             #SELECT COUNT(*) INTO l_n1 FROM xcad_t
             # WHERE xcadent = g_enterprise
             #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[l_cnt].xcad002
             #   AND xcad003 = sr[l_cnt].xcad003
             #   #161130-00004#1 ---add (s)---
             #    AND xcad009 = sr[l_cnt].xcad009 AND xcad010 = sr[l_cnt].xcad010
             #    AND xcad011 = sr[l_cnt].xcad011 AND xcad012 = sr[l_cnt].xcad012
             #    AND xcad013 = sr[l_cnt].xcad013
             #   #161130-00004#1 ---add (e)---
             #171030-00022#1  mark by 09767-->e
             
             #171030-00022#1  modify by 09767-->s  
             LET g_sql = "SELECT COUNT(*) FROM xcad_t ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",sr[l_cnt].xcad002,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre2 FROM g_sql
             #EXECUTE g_sql_pre2 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre2 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre2 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre2 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre2 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E) 
             #171030-00022#1  modify by 09767-->e
             
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF
          END IF  #171027-00008#1
          #add 141223
          IF g_xcad1_m.pbom = '1' THEN
             #IF cl_null(l_bmba001_t) OR l_bmba001_t!=sr[l_cnt].xcad002 THEN
             #   #LET l_xcadseq = 0
             #END IF
             LET l_xcadseq = l_xcadseq + 1
             #LET l_bmba001_t = sr[l_cnt].xcad002
             LET sr[l_cnt].xcadseq = l_xcadseq
          END IF
          #add 141223 end
          #200203-00021#1 add---(S)
          CALL s_aooi250_convert_qty(sr[l_cnt].xcad002,sr[l_cnt].bmaa004,sr[l_cnt].imaa006_1,sr[l_cnt].xcad005) 
            RETURNING l_success,sr[l_cnt].xcad005
          #200203-00021#1 add---(E)
   
          LET l_cnt = l_cnt + 1
       END FOREACH
    #171228-00016#1---add---s   
    ELSE
       FOREACH axci004_cur4 USING p_xcad002,p_feature INTO sr[l_cnt].*  #171211-00028#9 add p_feature
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "foreach1:"
             LET g_errparam.popup = TRUE
             CALL cl_err()
             EXIT FOREACH
          END IF
          LET g_vdate1 = sr[l_cnt].xcad012
          LET g_vdate2 = sr[l_cnt].xcad013        
          #171027-00008#1---add---s
          IF l_imaa004_1 ='X' THEN
             ##檢查xcad_t裏面是否已存在需插入料件
             LET l_n1 = 0 
             LET g_sql = "SELECT COUNT(*) FROM axci004_tmp01 ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",p_bmba001,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL  THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre23 FROM g_sql
             #EXECUTE g_sql_pre23 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre23 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre23 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre23 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre23 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E)  
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF 
             
             LET l_n1 = 0  
             LET g_sql = "SELECT COUNT(*) FROM xcad_t ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",p_bmba001,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre24 FROM g_sql
             #EXECUTE g_sql_pre24 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre24 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre24 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre24 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre24 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E) 

             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF                 
          ELSE
             #檢查xcad_t裏面是否已存在需插入料件
             LET l_n1 = 0 
             LET g_sql = "SELECT COUNT(*) FROM axci004_tmp01 ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",sr[l_cnt].xcad002,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL  THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre12 FROM g_sql
             #EXECUTE g_sql_pre12 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre12 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre12 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre12 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre12 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E) 
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF
             
             #檢查xcad_t裏面是否已存在需插入料件
             LET l_n1 = 0
             LET g_sql = "SELECT COUNT(*) FROM xcad_t ",
                "WHERE xcadent = '",g_enterprise,"'",          
                "AND xcad001 = '",g_xcad_m.xcad001,"'  AND xcad002 = '",sr[l_cnt].xcad002,"'",
                "AND xcad003 = '",sr[l_cnt].xcad003,"'"
             IF sr[l_cnt].xcad009 IS NULL THEN
                LET g_sql = g_sql," AND xcad009 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad009 ='",sr[l_cnt].xcad009,"'"
             END IF
             IF sr[l_cnt].xcad010 IS NULL THEN
                LET g_sql = g_sql," AND xcad010 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad010 ='",sr[l_cnt].xcad010,"'"
             END IF
             IF sr[l_cnt].xcad011 IS NULL THEN
                LET g_sql = g_sql," AND xcad011 IS NULL"
             ELSE
                LET g_sql = g_sql," AND xcad011 ='",sr[l_cnt].xcad011,"'"
             END IF
             IF sr[l_cnt].xcad012 IS NULL THEN
                LET g_sql = g_sql," AND xcad012 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad012,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate1,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad012 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             IF sr[l_cnt].xcad013 IS NULL THEN
                LET g_sql = g_sql," AND xcad013 IS NULL"
             ELSE
                #LET g_sql = g_sql," AND to_char(xcad013,'yyyy-mm-dd hh24:mi:ss') ='",g_vdate2,"'"   #180731-00017#9 Mark By 06137  180806
                LET g_sql = g_sql," AND xcad013 = ? "   #180731-00017#9 Add By 06137  180806
             END IF
             #171211-00028#9 add-S
             IF sr[l_cnt].xcad014 IS NULL THEN
               LET g_sql = g_sql," AND xcad014 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad014 = '",sr[l_cnt].xcad014,"' "
             END IF
             IF sr[l_cnt].xcad015 IS NULL THEN
               LET g_sql = g_sql," AND xcad015 IS NULL"
             ELSE
               LET g_sql = g_sql," AND xcad015 = '",sr[l_cnt].xcad015,"' "
             END IF
             #171211-00028#9 add-E
             PREPARE g_sql_pre22 FROM g_sql
             #EXECUTE g_sql_pre22 INTO l_n1   #180731-00017#9 Mark By 06137  180806
             #180731-00017#9 Add By 06137  180806(S)
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre22 USING g_vdate1,g_vdate2 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NOT NULL) THEN
                EXECUTE g_sql_pre22 USING g_vdate2 INTO l_n1
             END IF             
             IF (sr[l_cnt].xcad012 IS NOT NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre22 USING g_vdate1 INTO l_n1
             END IF
             IF (sr[l_cnt].xcad012 IS NULL) AND (sr[l_cnt].xcad013 IS NULL) THEN
                EXECUTE g_sql_pre22 INTO l_n1
             END IF             
             #180731-00017#9 Add By 06137  180806(E) 
             
             IF l_n1 > 0 THEN
                CONTINUE FOREACH
             END IF
          END IF 
         
          IF g_xcad1_m.pbom = '1' THEN
             LET l_xcadseq = l_xcadseq + 1
             LET sr[l_cnt].xcadseq = l_xcadseq
          END IF
   
          LET l_cnt = l_cnt + 1
       END FOREACH    
    END IF
    #171228-00016#1---add---e

    LET l_bmba001_t = ''    #161130-00004#1 add
    LET l_cnt = l_cnt - 1   #161130-00004#1 add
    IF l_cnt > 0 THEN       #161130-00004#1 add
      #FOR i = 1 TO l_cnt-1 #161130-00004#1 mark
       FOR i = 1 TO l_cnt   #161130-00004#1 add
           LET sr[i].x_level = p_level
           ##檢查xcad_t裏面是否已存在需插入料件
           #LET l_n1 = 0
           #SELECT COUNT(*) INTO l_n1 FROM axci004_01_ins_tmp 
           # WHERE xcadent = g_enterprise
           #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[i].xcad002
           #   AND xcad003 = sr[i].xcad003
           #IF l_n1 > 0 THEN
           #   CONTINUE FOR
           #END IF
           #
           ##檢查xcad_t裏面是否已存在需插入料件
           #LET l_n1 = 0
           #SELECT COUNT(*) INTO l_n1 FROM xcad_t
           # WHERE xcadent = g_enterprise
           #   AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[i].xcad002
           #   AND xcad003 = sr[i].xcad003
           #IF l_n1 > 0 THEN
           #   CONTINUE FOR
           #END IF
           
          #161130-00004#1 ---add (s)---
           IF g_xcad1_m.pbom = '1' THEN
              #171027-00008#1---add---s
              IF l_imaa004_1 ='X' THEN
                 SELECT MAX(xcadseq) INTO l_xcadseq_1 FROM xcad_t
                  WHERE xcadent = g_enterprise
                    AND xcad001 = g_xcad_m.xcad001 AND xcad002 = p_bmba001
                    AND xcad014 = p_feature  #171211-00028#9 add
                 IF cl_null(l_xcadseq_1) THEN LET l_xcadseq_1 = 0 END IF 
                 
                 SELECT MAX(xcadseq) INTO l_xcadseq_2 FROM axci004_tmp01
                  WHERE xcadent = g_enterprise
                    AND xcad001 = g_xcad_m.xcad001 AND xcad002 = p_bmba001 
                    AND xcad014 = p_feature  #171211-00028#9 add
                 IF cl_null(l_xcadseq_2) THEN LET l_xcadseq_2 = 0 END IF              
              ELSE
              #171027-00008#1---add---e
                 SELECT MAX(xcadseq) INTO l_xcadseq_1 FROM xcad_t
                  WHERE xcadent = g_enterprise
                    AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[i].xcad002
                    AND xcad014 = p_feature  #171211-00028#9 add
                 IF cl_null(l_xcadseq_1) THEN LET l_xcadseq_1 = 0 END IF 
                 
                 SELECT MAX(xcadseq) INTO l_xcadseq_2 FROM axci004_tmp01
                  WHERE xcadent = g_enterprise
                    AND xcad001 = g_xcad_m.xcad001 AND xcad002 = sr[i].xcad002
                    AND xcad014 = p_feature  #171211-00028#9 add 
                 IF cl_null(l_xcadseq_2) THEN LET l_xcadseq_2 = 0 END IF
              END IF  #171027-00008#1 add
              IF l_xcadseq_1 >= l_xcadseq_2 THEN
                 LET l_xcadseq = l_xcadseq_1
              ELSE
                 LET l_xcadseq = l_xcadseq_2
              END IF
               
              LET l_xcadseq = l_xcadseq + 1
              LET sr[i].xcadseq = l_xcadseq
           END IF
           LET l_bmba001_t = sr[i].xcad002 
           #LET sr[i].xcadseq = l_xcadseq      #171030-00022#1 mark by 09767
           #161130-00004#1 ---add (e)---
           
           #171229-00014#1-add
           IF sr[i].bmba010 <> sr[i].imaa006 THEN 
              CALL s_aooi250_convert_qty1(sr[i].xcad003,sr[i].bmba010,sr[i].imaa006,sr[i].xcad004) RETURNING l_success,sr[i].xcad004
           END IF
           #171229-00014#1-add
           
           #171027-00008#1---add---s
           LET l_imaa004_2 = ''
           SELECT imaa004 INTO l_imaa004_2 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = sr[i].xcad003
           IF l_imaa004_2 = 'X' THEN
              IF NOT cl_null(sr[i].xcad003) THEN #若為主件料號
                 #171227-00001#1---mod---s
                 #CALL axci004_01_bom(p_level,sr[i].xcad003,p_bmba002,p_bmba001)
                 LET sr[i].xcad005 = p_xcad005*sr[i].xcad005/p_xcad004               
                 IF l_imaa004_1 = 'X' THEN
                    CALL axci004_01_bom(p_level,sr[i].xcad003,sr[i].xcad004,sr[i].xcad005,p_bmba002,p_bmba001,sr[i].xcad015)  #171211-00028#9 add sr[i].xcad015
                 ELSE   
                    CALL axci004_01_bom(p_level,sr[i].xcad003,sr[i].xcad004,sr[i].xcad005,p_bmba002,p_xcad002,sr[i].xcad015)  #171211-00028#9 add sr[i].xcad015
                 END IF
                 #171227-00001#1---mod---e
              END IF           
           ELSE
              IF l_imaa004_1 = 'X' THEN
                 LET sr[i].xcad005 = p_xcad005*sr[i].xcad005/p_xcad004  #171227-00001#1
                 #171211-00028#9 add-S
                 IF cl_null(sr[i].xcad014) THEN LET sr[i].xcad014 = ' ' END IF
                 IF cl_null(sr[i].xcad015) THEN LET sr[i].xcad015 = ' ' END IF 
                 #171211-00028#9 add-E
                 INSERT INTO axci004_tmp01(x_level,xcadent,xcad001,xcadsite,xcad002,xcadseq,             #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
                                                xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                                                xcad009,xcad010,xcad011,xcad012,xcad013,
                                                xcad014,xcad015,  #171211-00028#9 add
                                                xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt)
                            VALUES(p_level,g_enterprise,g_xcad_m.xcad001,sr[i].xcadsite,p_bmba001,sr[i].xcadseq,
                                   sr[i].xcad003,sr[i].xcad004,sr[i].xcad005,sr[i].xcad006,sr[i].xcad007,sr[i].xcad008,
                                   sr[i].xcad009,sr[i].xcad010,sr[i].xcad011,sr[i].xcad012,sr[i].xcad013,
                                   sr[i].xcad014,sr[i].xcad015,   #171211-00028#9 add
                                   'N',g_user,g_dept,g_user,g_dept,l_xcadcrtdt)                     
              ELSE
              #171027-00008#1---add---e
                 #171211-00028#9 add-S
                 IF cl_null(sr[i].xcad014) THEN LET sr[i].xcad014 = ' ' END IF
                 IF cl_null(sr[i].xcad015) THEN LET sr[i].xcad015 = ' ' END IF 
                 #171211-00028#9 add-E
                 INSERT INTO axci004_tmp01(x_level,xcadent,xcad001,xcadsite,xcad002,xcadseq,             #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
                                                xcad003,xcad004,xcad005,xcad006,xcad007,xcad008,
                                                xcad009,xcad010,xcad011,xcad012,xcad013,
                                                xcad014,xcad015,  #171211-00028#9 add
                                                xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,xcadcrtdt)
                            VALUES(p_level,g_enterprise,g_xcad_m.xcad001,sr[i].xcadsite,sr[i].xcad002,sr[i].xcadseq,
                                   sr[i].xcad003,sr[i].xcad004,sr[i].xcad005,sr[i].xcad006,sr[i].xcad007,sr[i].xcad008,
                                   sr[i].xcad009,sr[i].xcad010,sr[i].xcad011,sr[i].xcad012,sr[i].xcad013,
                                   sr[i].xcad014,sr[i].xcad015,   #171211-00028#9 add
                                   'N',g_user,g_dept,g_user,g_dept,l_xcadcrtdt)
              END IF  #171027-00008#1
              IF SQLCA.sqlcode THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = SQLCA.sqlcode
                 LET g_errparam.extend = "ins xcad_t"
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
              
              END IF
              IF NOT cl_null(sr[i].xcad003) THEN #若為主件料號
                 CALL axci004_01_bom(p_level,sr[i].xcad003,sr[i].xcad004,sr[i].xcad005,p_bmba002,sr[i].xcad002,sr[i].xcad015)  #171227-00001#1 add xcad004,xcad005 #171211-00028#9 add xcad015
              END IF
           END IF   #171027-00008#1 add  
           CALL axci004_01_recycle_ins(sr[i].xcad003,p_bmba002) RETURNING l_success   #200512-00034#1 add           
       END FOR
    END IF #161130-00004#1 add
END FUNCTION

################################################################################
# Descriptions...: 创建临时表
# Memo...........:
# Usage..........: CALL axci004_01_create()
# Input parameter: 
# Return code....: r_success
# Date & Author..: 日期 By 作者
# Modify.........: 
################################################################################
PUBLIC FUNCTION axci004_01_create()
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_success    LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   CALL axci004_01_drop() RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   CREATE TEMP TABLE axci004_tmp01         
         (x_level   LIKE type_t.num10, 
          xcadent   LIKE xcad_t.xcadent,
          xcad001   LIKE xcad_t.xcad001,
          xcadsite  LIKE xcad_t.xcadsite,             
          xcad002   LIKE xcad_t.xcad002,
          xcadseq   LIKE xcad_t.xcadseq, #add 141223
          xcad003   LIKE xcad_t.xcad003,
          xcad004   LIKE xcad_t.xcad004,
          xcad005   LIKE xcad_t.xcad005,
          xcad006   LIKE xcad_t.xcad006,
          xcad007   LIKE xcad_t.xcad007,
          xcad008   LIKE xcad_t.xcad008,
          xcad009   LIKE xcad_t.xcad009,
          xcad010   LIKE xcad_t.xcad010,
          xcad011   LIKE xcad_t.xcad011,
          xcad012   LIKE xcad_t.xcad012,
          xcad013   LIKE xcad_t.xcad013,
          xcad014   LIKE xcad_t.xcad014,  #171211-00028#9 add
          xcad015   LIKE xcad_t.xcad015,  #171211-00028#9 add
          xcadstus  LIKE xcad_t.xcadstus,
          xcadownid LIKE xcad_t.xcadownid,
          xcadowndp LIKE xcad_t.xcadowndp,
          xcadcrtid LIKE xcad_t.xcadcrtid,
          xcadcrtdp LIKE xcad_t.xcadcrtdp,
          xcadcrtdt LIKE xcad_t.xcadcrtdt   
          );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axci004_tmp01'          #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   create index idx_axci004_tmp_01 on axci004_tmp01(xcadent, xcad001, xcad002) #161130-00004#1 add #ODI-ORA#
   IF cl_db_generate_analyze("axci004_tmp01") THEN END IF                      #161130-00004#1 add
   create unique index idx_axci004_tmp_02 on axci004_tmp01(xcadent,xcad001,xcad002,xcadseq,xcad014) #190726-00024#1 add
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 删除临时表
# Memo...........:
# Usage..........: CALL axci004_01_drop()
# Input parameter: 
# Return code....: 
# Date & Author..: 14/12/17 By zhanglllc
# Modify.........:
################################################################################
PUBLIC FUNCTION axci004_01_drop()
   DEFINE r_success    LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF


   DROP TABLE axci004_tmp01;         #160727-00019#20 Mod  axci004_01_ins_tmp--> axci004_tmp01 #ODI-ORA#
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 若设定限定特征，则带出相应的产品特征
# Memo...........: #171211-00028#9
################################################################################
PRIVATE FUNCTION axci004_01_bom_feature(p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,p_feature,p_imaa005)
DEFINE p_bmca001    LIKE bmca_t.bmca001
DEFINE p_bmca002    LIKE bmca_t.bmca002
DEFINE p_bmca003    LIKE bmca_t.bmca003
DEFINE p_bmca004    LIKE bmca_t.bmca004
DEFINE p_bmca005    LIKE bmca_t.bmca005
DEFINE p_bmca007    LIKE bmca_t.bmca007
DEFINE p_bmca008    LIKE bmca_t.bmca008
DEFINE p_feature    LIKE inam_t.inam002
DEFINE p_imaa005    LIKE imaa_t.imaa005
DEFINE r_success    LIKE type_t.num5
DEFINE r_feature    LIKE inam_t.inam002
DEFINE l_inam       RECORD
    inam011    LIKE inam_t.inam011,
    inam012    LIKE inam_t.inam012,
    inam013    LIKE inam_t.inam013,
    inam014    LIKE inam_t.inam014,
    inam015    LIKE inam_t.inam015,
    inam016    LIKE inam_t.inam016,
    inam017    LIKE inam_t.inam017,
    inam018    LIKE inam_t.inam018,
    inam019    LIKE inam_t.inam019,
    inam020    LIKE inam_t.inam020,
    inam021    LIKE inam_t.inam021,
    inam022    LIKE inam_t.inam022,
    inam023    LIKE inam_t.inam023,
    inam024    LIKE inam_t.inam024,
    inam025    LIKE inam_t.inam025,
    inam026    LIKE inam_t.inam026,
    inam027    LIKE inam_t.inam027,
    inam028    LIKE inam_t.inam028,
    inam029    LIKE inam_t.inam029,
    inam030    LIKE inam_t.inam030,
    inam031    LIKE inam_t.inam031,
    inam032    LIKE inam_t.inam032,
    inam033    LIKE inam_t.inam033,
    inam034    LIKE inam_t.inam034,
    inam035    LIKE inam_t.inam035,
    inam036    LIKE inam_t.inam036,
    inam037    LIKE inam_t.inam037,
    inam038    LIKE inam_t.inam038,
    inam039    LIKE inam_t.inam039,
    inam040    LIKE inam_t.inam040,
    inam041    LIKE inam_t.inam041,
    inam042    LIKE inam_t.inam042,
    inam043    LIKE inam_t.inam043,
    inam044    LIKE inam_t.inam044,
    inam045    LIKE inam_t.inam045,
    inam046    LIKE inam_t.inam046,
    inam047    LIKE inam_t.inam047,
    inam048    LIKE inam_t.inam048,
    inam049    LIKE inam_t.inam049,
    inam050    LIKE inam_t.inam050
                END RECORD
DEFINE l_bmcb  RECORD
    bmcb009    LIKE bmcb_t.bmcb009,
    bmcb010    LIKE bmcb_t.bmcb010,
    bmcb011    LIKE bmcb_t.bmcb011,
    bmcb012    LIKE bmcb_t.bmcb012
           END RECORD
DEFINE l_flag       LIKE type_t.chr1
DEFINE l_bmcb009_t  LIKE bmcb_t.bmcb009
DEFINE l_ac         LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
DEFINE l_bmcc  RECORD
    bmcc009    LIKE bmcc_t.bmcc009,
    bmcc010    LIKE bmcc_t.bmcc010
           END RECORD
DEFINE l_bmcd  RECORD
    bmcd010    LIKE bmcd_t.bmcd010,
    bmcd011    LIKE bmcd_t.bmcd011
           END RECORD
DEFINE l_bmce  RECORD
    bmce009    LIKE bmce_t.bmce009,
    bmce010    LIKE bmce_t.bmce010
           END RECORD
DEFINE l_imeb  DYNAMIC ARRAY OF RECORD
    imeb002    LIKE imeb_t.imeb002,    #特徵項次:記錄是哪一個特徵項次
    imeb004    LIKE imeb_t.imeb004,    #特徵類型:記錄該特徵類型
    imec003    LIKE imec_t.imec003     #特徵值:記錄該特徵項次的內容值
           END RECORD
DEFINE l_success    LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   LET r_feature = ' '
   
   #主件特征对应特征类型特征值
   INITIALIZE l_inam.* TO NULL
   EXECUTE axci004_01_feature_p1
     USING g_enterprise,p_bmca001,p_feature
      INTO l_inam.inam011,l_inam.inam012,l_inam.inam013,l_inam.inam014,l_inam.inam015,
           l_inam.inam016,l_inam.inam017,l_inam.inam018,l_inam.inam019,l_inam.inam020,
           l_inam.inam021,l_inam.inam022,l_inam.inam023,l_inam.inam024,l_inam.inam025,
           l_inam.inam026,l_inam.inam027,l_inam.inam028,l_inam.inam029,l_inam.inam030,
           l_inam.inam031,l_inam.inam032,l_inam.inam033,l_inam.inam034,l_inam.inam035,
           l_inam.inam036,l_inam.inam037,l_inam.inam038,l_inam.inam039,l_inam.inam040,
           l_inam.inam041,l_inam.inam042,l_inam.inam043,l_inam.inam044,l_inam.inam045,
           l_inam.inam046,l_inam.inam047,l_inam.inam048,l_inam.inam049,l_inam.inam050
   
   #主件产品特征限定用料
   LET l_n = 0
   EXECUTE axci004_01_feature_p2
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      LET l_bmcb009_t = ' '
      INITIALIZE l_bmcb.* TO NULL
      FOREACH axci004_01_feature_c3
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcb.bmcb009,l_bmcb.bmcb010,l_bmcb.bmcb011,l_bmcb.bmcb012
         #同特征类型的限定特征满足其中一项---》检查通过，直接检查下一特征类型
         IF l_flag = 'Y' AND l_bmcb009_t = l_bmcb.bmcb009 THEN
            CONTINUE FOREACH
         END IF
         #同特征类型的限定特征都不满足---》检查不通过，返回
         IF l_flag = 'N' AND l_bmcb009_t != l_bmcb.bmcb009 THEN
            RETURN r_success,r_feature
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam012) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam014) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam016) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam018) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam020) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam022) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam024) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam026) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam028) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam030) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam032) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam034) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam036) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam038) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam040) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam042) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam044) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam046) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam048) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            CALL axci004_01_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam050) RETURNING l_flag
         END IF
         LET l_bmcb009_t = l_bmcb.bmcb009
      END FOREACH
      IF l_flag = 'N' THEN
         RETURN r_success,r_feature
      END IF
   END IF
   
   IF cl_null(p_imaa005) THEN
      LET r_success = TRUE
      RETURN r_success,r_feature
   END IF
   
   LET l_ac = 1
   
   #主件与元件产品特征对应
   LET l_n = 0
   EXECUTE axci004_01_feature_p4
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
     INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      INITIALIZE l_bmcc.* TO NULL
      INITIALIZE l_bmcd.* TO NULL
      FOREACH axci004_01_feature_c5
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcc.bmcc009,l_bmcc.bmcc010 
         IF l_bmcc.bmcc010 = '2' THEN
            FOREACH axci004_01_feature_ccd
            USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,l_bmcc.bmcc009
            INTO l_bmcd.bmcd010,l_bmcd.bmcd011
               IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN    
                  IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1 
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF

               END IF
               IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF            
            
            END FOREACH
            CONTINUE FOREACH
         END IF
                 
         IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam012
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
               
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam014
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam016
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam018
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam020
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam022
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam024
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam026
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam028
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam030
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam032
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam034
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam036
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam038
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam040
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam042
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam044
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam046
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam048
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam050
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
      END FOREACH
   END IF
   
   #限定元件特征
   INITIALIZE l_bmce.* TO NULL
   FOREACH axci004_01_feature_c6
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_bmce.bmce009,l_bmce.bmce010
      LET l_imeb[l_ac].imeb004 = l_bmce.bmce009
      LET l_imeb[l_ac].imec003 = l_bmce.bmce010
      LET l_ac = l_ac + 1
   END FOREACH
   
   CALL l_imeb.deleteElement(l_ac)
   LET l_ac = l_ac - 1
   
   CALL s_feature_multi_create_string(p_bmca003,p_imaa005,l_imeb,'',g_site) RETURNING l_success,r_feature
   IF NOT l_success THEN
      RETURN r_success,r_feature
   END IF
   
   LET r_success = TRUE
   RETURN r_success,r_feature
END FUNCTION

################################################################################
# Descriptions...: 特征检查是否有设定限定用料
# Memo...........: #171211-00028#9
################################################################################
PRIVATE FUNCTION axci004_01_feature_check(p_bmcb001,p_bmcb009,p_bmcb011,p_bmcb012,p_inam012)
DEFINE p_bmcb001    LIKE bmcb_t.bmcb001
DEFINE p_bmcb009    LIKE bmcb_t.bmcb009
DEFINE p_bmcb011    LIKE bmcb_t.bmcb011
DEFINE p_bmcb012    LIKE bmcb_t.bmcb012
DEFINE p_inam012    LIKE inam_t.inam012
DEFINE r_flag       LIKE type_t.chr1
DEFINE l_imeb006    LIKE imeb_t.imeb006

   LET r_flag = 'N'
   
   IF cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      LET r_flag = 'Y'
      RETURN r_flag
   END IF
   
   LET l_imeb006 = ''
   EXECUTE axci004_01_feature_check_p1 USING g_enterprise,p_bmcb001,p_bmcb009 INTO l_imeb006
   
   IF cl_null(l_imeb006) THEN
      RETURN r_flag
   END IF
   
   IF NOT cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 >= p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   IF cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 <= p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   #起讫都有值，则说明是数值类型的
   IF NOT cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF p_inam012 >= p_bmcb011 AND p_inam012 <= p_bmcb012 THEN
         LET r_flag = 'Y'
         RETURN r_flag
      END IF
   END IF
   
   RETURN r_flag
END FUNCTION

################################################################################
# Descriptions...: 抓取回收料资料新增
# Memo...........:
# Usage..........: CALL axci004_01_recycle_ins(p_bmaa001,p_bmaa002)
#                  RETURNING r_succes
# Input parameter: p_bmaa001  主件料号
#                : p_bmaa002  特性
# Return code....: r_success  true/false
# Date & Author..: 20200513 By 01996
# Modify.........: #200512-00034#1 add
################################################################################
PRIVATE FUNCTION axci004_01_recycle_ins(p_bmaa001,p_bmaa002)
DEFINE p_bmaa001 LIKE bmaa_t.bmaa001
DEFINE p_bmaa002 LIKE bmaa_t.bmaa002  
DEFINE ldt_xcad012      DATETIME YEAR TO SECOND
DEFINE ldt_xcad013      DATETIME YEAR TO SECOND
DEFINE l_bmac RECORD
       bmacsite  LIKE bmac_t.bmacsite,
       bmac001   LIKE bmac_t.bmac001,
       bmac003   LIKE bmac_t.bmac003,
       bmac004   LIKE bmac_t.bmac004,
       bmac005   LIKE bmac_t.bmac005,
       bmac006   LIKE bmac_t.bmac006,
       bmac007   LIKE bmac_t.bmac007,
       bmac008   LIKE bmac_t.bmac008
       END RECORD
DEFINE l_bmac001_wc   STRING
DEFINE l_sql  STRING
DEFINE l_xcad RECORD  #成本BOM主檔
       xcadent LIKE xcad_t.xcadent, #企业编号
       xcadownid LIKE xcad_t.xcadownid, #资料所有者
       xcadowndp LIKE xcad_t.xcadowndp, #资料所有部门
       xcadcrtid LIKE xcad_t.xcadcrtid, #资料录入者
       xcadcrtdp LIKE xcad_t.xcadcrtdp, #资料录入部门
       xcadcrtdt LIKE xcad_t.xcadcrtdt, #资料创建日
       xcadmodid LIKE xcad_t.xcadmodid, #资料更改者
       xcadmoddt LIKE xcad_t.xcadmoddt, #最近更改日
       xcadstus LIKE xcad_t.xcadstus, #状态码
       xcadsite LIKE xcad_t.xcadsite, #营运据点
       xcad001 LIKE xcad_t.xcad001, #版本
       xcad002 LIKE xcad_t.xcad002, #主件料号
       xcadseq LIKE xcad_t.xcadseq, #项次
       xcad003 LIKE xcad_t.xcad003, #元件料号
       xcad004 LIKE xcad_t.xcad004, #组成用量
       xcad005 LIKE xcad_t.xcad005, #主件底数
       xcad006 LIKE xcad_t.xcad006, #变动损耗率
       xcad007 LIKE xcad_t.xcad007, #固定损耗量
       xcad008 LIKE xcad_t.xcad008, #损耗批量
       xcad009 LIKE xcad_t.xcad009, #作业编号
       xcad010 LIKE xcad_t.xcad010, #作业序
       xcad011 LIKE xcad_t.xcad011, #部位编号
       xcad012 LIKE xcad_t.xcad012, #生效日期
       xcad013 LIKE xcad_t.xcad013, #失效日期
       xcad014 LIKE xcad_t.xcad014, #主件产品特征 #171211-00028#9 add
       xcad015 LIKE xcad_t.xcad015  #元件产品特征 #171211-00028#9 add
END RECORD
DEFINE l_success LIKE type_t.num5
DEFINE l_xcadcrtdt    DATETIME YEAR TO SECOND
DEFINE r_success LIKE type_t.num5
DEFINE l_imaa006 LIKE imaa_t.imaa006
DEFINE l_cnt     LIKE type_t.num5      #200601-00023#1---add
   LET r_success = TRUE

   IF g_xcad1_m.pbom = '1' AND g_xcad_m.recycle = 'Y' THEN
      LET ldt_xcad012 = ''
      LET ldt_xcad013 = ''
      LET l_sql = " SELECT bmacsite,bmac001,bmac003,bmac004,bmac005,",
                          "bmac006,bmac007,bmac008",
                  "   FROM bmac_t",
                  "  WHERE bmacent = ",g_enterprise,
                  "    AND bmacsite = '",g_xcad1_m.xcadsite1,"'",
                  "    AND bmac001 = '",p_bmaa001,"'",
                  "    AND bmac002 = '",p_bmaa002,"'"
      IF cl_null(g_xcad_m.xcad012_1) THEN
         LET l_sql = l_sql," AND (1=1 OR (bmac007 <= ? AND (bmac008 >=?))) "
      ELSE
         LET ldt_xcad012 = g_xcad_m.xcad012_1
         LET l_sql = l_sql," AND bmac007 <= ? AND (bmac008 >=? OR bmac008 IS NULL) "
      END IF
      
      IF cl_null(g_xcad_m.xcad013_1) THEN
         LET l_sql = l_sql," AND (1=1 OR (bmac008 >= ? AND (bmac007 <=?))) "
      ELSE
         LET ldt_xcad013 = g_xcad_m.xcad013_1
         LET l_sql = l_sql," AND bmac008 >= ? AND (bmac007 <=? OR bmac007 IS NULL) "
      END IF
      #IF NOT cl_null(l_bmac001_wc) THEN
      #  LET l_bmac001_wc = cl_replace_str(l_bmac001_wc,'xcad002_1','bmac001')
      #  LET l_sql = l_sql," AND ",l_bmac001_wc
      #END IF
      
      PREPARE sel_bmac_pre FROM l_sql
      DECLARE sel_bmac_cur CURSOR FOR sel_bmac_pre
      FOREACH sel_bmac_cur USING ldt_xcad012,ldt_xcad013,ldt_xcad013,ldt_xcad012
         INTO l_bmac.bmacsite,l_bmac.bmac001,l_bmac.bmac003,l_bmac.bmac004,l_bmac.bmac005,
              l_bmac.bmac006,l_bmac.bmac007,l_bmac.bmac008
         #項次
         SELECT MAX(xcadseq)+1 INTO l_xcad.xcadseq
           FROM axci004_tmp01 
          WHERE xcadent = g_enterprise
            AND xcad001 = g_xcad_m.xcad001
            AND xcad002 = p_bmaa001
            AND xcad014 = ' '
         IF cl_null(l_xcad.xcadseq) THEN
            LET l_xcad.xcadseq = 1
         END IF
         #200601-00023#1---add---s
         LET l_cnt = 0
         SELECT COUNT(1) INTO l_cnt FROM axci004_tmp01 WHERE  xcadent = g_enterprise
                                                         AND  xcad001 = g_xcad_m.xcad001
                                                         AND  xcad002 = p_bmaa001
                                                         AND  xcad003 = l_bmac.bmac003
                                                         AND  xcad014 = ' '
         IF l_cnt > 0 THEN 
            CONTINUE FOREACH
         END IF
         #200601-00023#1---add---e
         #基礎單位
         SELECT imaa006 INTO l_imaa006
           FROM imaa_t
          WHERE imaaent = g_enterprise
#            AND imaa001 = l_bmac.bmac001  #200603-00130#1 mark 
            AND imaa001 = l_bmac.bmac003   #200603-00130#1 add
         
         IF l_imaa006 <> l_bmac.bmac004 THEN
#            CALL s_aooi250_convert_qty1(l_bmac.bmac001,l_bmac.bmac004,l_imaa006,l_bmac.bmac005) #200603-00130#1 mark
            CALL s_aooi250_convert_qty1(l_bmac.bmac003,l_bmac.bmac004,l_imaa006,l_bmac.bmac005)  #200603-00130#1 add
               RETURNING l_success,l_bmac.bmac005
            
#            CALL s_aooi250_convert_qty1(l_bmac.bmac001,l_bmac.bmac004,l_imaa006,l_bmac.bmac006) #200603-00130#1 mark
            CALL s_aooi250_convert_qty1(l_bmac.bmac003,l_bmac.bmac004,l_imaa006,l_bmac.bmac006)  #200603-00130#1 add
               RETURNING l_success,l_bmac.bmac006
         END IF
         
         LET l_bmac.bmac005 = l_bmac.bmac005 * -1
         LET l_xcadcrtdt = cl_get_current()
         
         INSERT INTO axci004_tmp01 (xcadent,xcadsite,xcadseq,xcad001,xcad002,
                             xcad003,xcad004,xcad005,xcad006,xcad007,
                             xcad008,xcad012,xcad013,xcad014,xcad015,
                             xcadstus,xcadownid,xcadowndp,xcadcrtid,xcadcrtdp,
                             xcadcrtdt)
         VALUES (g_enterprise,l_bmac.bmacsite,l_xcad.xcadseq,g_xcad_m.xcad001,p_bmaa001,
                 l_bmac.bmac003,l_bmac.bmac005,l_bmac.bmac006,0,0,
                 0,l_bmac.bmac007,l_bmac.bmac008,' ',' ',
                 'N',g_user,g_dept,g_user,g_dept,
                 l_xcadcrtdt)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "bmac_t INSERT INTO xcad_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE                   
         END IF
      END FOREACH
   END IF
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
