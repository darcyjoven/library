#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="cs_cpjt400.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0001(1900-01-01 00:00:00), PR版次:0001(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0001(1900-01-01 00:00:00), PR版次:0001(2019-07-15 14:37:01)
#+ Build......: 000012
#+ Filename...: cs_cpjt400
#+ Description: 項目預算維護元件
#+ Creator....: 00000(2019-07-12 15:48:15)
#+ Modifier...: 00000 -SD/PR- 00000
 
{</section>}
 
{<section id="cs_cpjt400.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"

#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="cs_cpjt400.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="cs_cpjt400.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="cs_cpjt400.other_dialog" type="s" >}

 
{</section>}
 
{<section id="cs_cpjt400.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: BPM元件
################################################################################
PUBLIC FUNCTION cs_cpjt400_ws_confirm(p_pjqaucdocno)
DEFINE p_pjqaucdocno   LIKE pjqauc_t.pjqaucdocno 
DEFINE l_pjqauc001     LIKE pjqauc_t.pjqauc001
DEFINE l_pjqaucmodid   LIKE pjqauc_t.pjqaucmodid
DEFINE l_pjqaucmoddt   LIKE pjqauc_t.pjqaucmoddt 
DEFINE r_success       LIKE type_t.num5
   
   LET r_success=TRUE
   
   LET l_pjqaucmodid = g_user
   LET l_pjqaucmoddt = cl_get_current()
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE pjqauc_t 
      SET (pjqaucstus,pjqaucmodid,pjqaucmoddt) 
        = ('Y',l_pjqaucmodid,l_pjqaucmoddt)     
    WHERE pjqaucent = g_enterprise AND pjqaucdocno=p_pjqaucdocno
    
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      LET r_success=FALSE
   END IF 
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
