#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="wssp054.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0005(1900-01-01 00:00:00), PR版次:0005(2018-11-29 15:44:30)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000073
#+ Filename...: wssp054
#+ Description: 建立工單生產報工資料
#+ Creator....: 07556(2016-08-18 13:40:36)
#+ Modifier...: 00000 -SD/PR- TOPSTD
 
{</section>}
 
{<section id="wssp054.global" type="s" >}
#應用 m00 樣板自動產生(Version:12)
#add-point:填寫註解說明 name="global.memo"
#170222-00022#6 2017/02/23  By 07556  1.增加班別
#                                     2.將原本判斷工單狀態需為未結案的改為不可是成本結案
#170425-00014#5 2017/04/26  By 07556  人時、機時由秒換算成分
#170807-00020#8 2017/08/25  By 08879  MES拋回單別判斷
#180621-00035#1 2018/06/21  By 07556  sMES錯誤訊息優化
#181124-00001#1 2018/11/26  By 07556    Response回饋增加建議處理方式
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT xml
#add-point:增加匯入項目 name="global.import"
IMPORT util
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_ws.inc"     #TIPTOP Service Gateway 使用的全域變數檔
#add-point:自定義模組變數(Module Variable) name="global.variable"
GLOBALS
DEFINE gi_err_code  STRING
DEFINE gi_err_msg   STRING
END GLOBALS

DEFINE g_sffbdocno  STRING                 #報工單號
DEFINE g_field      STRING
DEFINE g_errmsg     STRING
DEFINE g_sffb009    LIKE sffb_t.sffb009
#180621-00035#1 add-S
DEFINE g_field01    STRING
DEFINE g_field02    STRING
DEFINE g_field03    STRING
DEFINE g_field04    STRING
DEFINE g_field05    STRING
DEFINE g_field06    STRING
DEFINE g_field07    STRING
DEFINE g_field08    STRING
DEFINE g_field09    STRING
DEFINE g_field10    STRING
DEFINE g_field11    STRING
DEFINE g_field12    STRING
DEFINE g_field13    STRING
DEFINE g_field14    STRING
DEFINE g_field15    STRING
#180621-00035#1 add-E
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
{</section>}
 
{<section id="wssp054.main" type="s" >}
#+ 作業開始
MAIN
   DEFINE l_request_str  STRING
   DEFINE l_output_str   STRING
   #add-point:main段define name="main.define"
   
   #end add-point
   #add-point:main段define name="main.define_customerization"
   
   #end add-point
 
   #定義在其他link的程式則無效
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
 
   #wss進行初始化設定(web services)
   CALL cl_wss_init()
 
   #呼叫服務前置處理程序
   CALL awsp900_01_preprocess()    
 
   #呼叫服務函式，中介程式主要處理段
   IF g_status.code = "0" THEN
      CALL wssp054_process()
   END IF
        
   #呼叫服務後置處理程序
   CALL awsp900_01_postprocess()    
 
   #離開作業
   CALL cl_wss_exit()
 
END MAIN
 
{</section>}
 
{<section id="wssp054.process" type="s" >}
#+ 實際處理服務程式邏輯的FUNCTION內容
PRIVATE FUNCTION wssp054_process()
   #add-point: 服務邏輯主要處理段的ADP name="wssp054.process"
   DEFINE l_input_m     RECORD                  #---單頭傳入值---
             sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
             sffbdocdt  LIKE sffb_t.sffbdocdt,  #單據日期
             sffb009    LIKE sffb_t.sffb009,    #工作站
             sffb023    LIKE sffb_t.sffb023,    #備註
             sffb004    LIKE sffb_t.sffb004     #班別   #170222-00022#6
             
                        END RECORD 
   DEFINE l_input_d     RECORD                  #---單身傳入值---
             sffbseq    LIKE sffb_t.sffbseq,    #項次
             sffb002    LIKE sffb_t.sffb002,    #報工人員
             sffb005    LIKE sffb_t.sffb005,    #工單單號
             sffb007    LIKE sffb_t.sffb007,    #作業編號
             sffb008    LIKE sffb_t.sffb008,    #作業序
             sffb010    LIKE sffb_t.sffb010,    #機器編號
             sffb011    LIKE sffb_t.sffb011,    #作業人數
             sffb012    LIKE sffb_t.sffb012,    #完成日期
             sffb013    LIKE sffb_t.sffb013,    #完成時間
             sffb014    LIKE sffb_t.sffb014,    #工時
             sffb015    LIKE sffb_t.sffb015,    #機時
             sffb016    LIKE sffb_t.sffb016,    #單位
             sffb017    LIKE sffb_t.sffb017,    #良品數量
             sffb018    LIKE sffb_t.sffb018,    #報廢數量
             defect_qty LIKE sffb_t.sffb018     #不良品數量
             # add by lixwz 180815 s---
             ,wo_no_scrap_qty LIKE sffb_t.sffbud011,
             wo_no_unit_no LIKE sffb_t.sffbud001
             # add by lixwz 180815 e---
             ,unit_no LIKE sffb_t.sffbud002  #add by wangxt180824
                        END RECORD
   DEFINE l_data_node   xml.DomNode
   DEFINE l_node        xml.DomNode             #l_input_m 節點
   DEFINE l_node2       xml.DomNode             #l_input_d 節點
   DEFINE l_data_cnt1   LIKE type_t.num5        #l_input_m 資料數
   DEFINE l_data_cnt2   LIKE type_t.num5        #l_input_d 資料數
   DEFINE l_i           LIKE type_t.num5        #目前處理第幾筆l_input_m
   DEFINE l_j           LIKE type_t.num5        #目前處理第幾筆l_input_d   
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_para        LIKE type_t.chr80
   
   LET l_success = TRUE
   LET g_errno   = NULL
   LET g_errmsg  = NULL
   LET g_sffbdocno = NULL
   LET gi_err_code = NULL
   LET gi_err_msg  = NULL

   #180621-00035#1 add-S
   LET g_field01 = cl_getmsg('wss-02001',g_lang)  #doc_type_no
   LET g_field02 = cl_getmsg('wss-02002',g_lang)  #create_date
   LET g_field03 = cl_getmsg('wss-02003',g_lang)  #workstation_no
   LET g_field04 = cl_getmsg('wss-02005',g_lang)  #shift_no
   LET g_field05 = cl_getmsg('wss-02006',g_lang)  #wo_no
   LET g_field06 = cl_getmsg('wss-02007',g_lang)  #machine_no
   LET g_field07 = cl_getmsg('wss-02008',g_lang)  #op_no
   LET g_field08 = cl_getmsg('wss-02009',g_lang)  #unit_no
   LET g_field09 = cl_getmsg('wss-02010',g_lang)  #reporter  
   LET g_field10 = cl_getmsg('wss-02011',g_lang)  #seq
   LET g_field11 = cl_getmsg('wss-02012',g_lang)  #number_of_operators
   LET g_field12 = cl_getmsg('wss-02013',g_lang)  #complete_date
   LET g_field13 = cl_getmsg('wss-02014',g_lang)  #report_datetime_e
   LET g_field14 = cl_getmsg('wss-02015',g_lang)  #qty
   LET g_field15 = cl_getmsg('wss-02016',g_lang)  #scrap_qty   
   #180621-00035#1 add-E   
   
   CALL s_transaction_begin()
   
   WHILE TRUE
      #是否啟用MES 整合
      CALL cl_get_para(g_enterprise,g_site,'S-SYS-0003') RETURNING l_para
      IF cl_null(l_para) THEN LET l_para = 'N' END IF
      IF l_para = 'N' THEN
         LET g_errno = 'wss-00248'   #此營運據點沒有啟用MES整合，請查核！
         LET g_errmsg = cl_getmsg(g_errno,g_lang)
         LET l_success = FALSE
         EXIT WHILE
      END IF
      
      LET l_data_node = cl_aws_init()
      LET l_data_cnt1 = cl_aws_getMasterRowLength(l_data_node,'report')
      IF l_data_cnt1 = 0 THEN
         LET g_errno = 'asf-00230'   #無資料處理!
         LET g_errmsg = 'sffb_t:',cl_getmsg(g_errno,g_lang)
         LET l_success = FALSE
         EXIT WHILE         
      END IF
      
      #XML傳入單頭處理
      FOR l_i = 1 TO l_data_cnt1
         LET l_node = cl_aws_getMasterRow(l_data_node,'report',l_i)
         
         INITIALIZE l_input_m.* TO NULL                      
         LET l_input_m.sffbdocno  = cl_aws_getRowField(l_node,'doc_type_no')     #報工單號  
         LET l_input_m.sffbdocdt  = cl_aws_getRowField(l_node,'create_date')     #單據日期  
         LET l_input_m.sffb009    = cl_aws_getRowField(l_node,'workstation_no')  #工作站    
         LET l_input_m.sffb023    = cl_aws_getRowField(l_node,'remark')          #備註  
         LET l_input_m.sffb004    = cl_aws_getRowField(l_node,'shift_no')        #班別   #170222-00022#6
         LET g_sffb009            = l_input_m.sffb009
         

         #檢查 XML傳入單頭 必要輸入
         CALL wssp054_chk_master_required(l_input_m.*) RETURNING l_input_m.*
         IF NOT cl_null(g_errno) THEN
            IF cl_null(gi_err_msg) THEN
               LET gi_err_msg = cl_getmsg(g_errno,g_lang)
            END IF
            LET g_errmsg = g_field,':',gi_err_msg
            LET l_success = FALSE 
            EXIT WHILE  
         END IF
         
         #檢查 XML傳入單頭 欄位合理性
         CALL wssp054_chk_master_correct(l_input_m.*) RETURNING l_input_m.*
         IF NOT cl_null(g_errno) THEN
            IF cl_null(gi_err_msg) THEN
               LET gi_err_msg = cl_getmsg(g_errno,g_lang)
            END IF
            #LET g_errmsg = g_field,':',gi_err_msg #180621-00035#1 mark
            LET g_errmsg = g_field,',',gi_err_msg  #180621-00035#1 add
            LET l_success = FALSE 
            EXIT WHILE  
         END IF
         
         
         #XML傳入單身處理
         LET  l_data_cnt2 = cl_aws_getDetailRowLength(l_node,'report_detail')
         IF l_data_cnt2 = 0 THEN
            LET g_errno = 'asf-00230'   #無資料處理!
            LET g_errmsg = 'sfeb_t:',cl_getmsg(g_errno,g_lang)
            LET l_success = FALSE
            EXIT WHILE         
         END IF
         
         FOR l_j = 1 TO l_data_cnt2
            LET l_node2 = cl_aws_getDetailRow(l_node,'report_detail',l_j)
            
            INITIALIZE l_input_d.* TO NULL
            LET l_input_d.sffbseq    = cl_aws_getRowField(l_node2,'seq')                   #項次
            LET l_input_d.sffb002    = cl_aws_getRowField(l_node2,'reporter')              #報工人員
            LET l_input_d.sffb005    = cl_aws_getRowField(l_node2,'wo_no')                 #工單單號
            LET l_input_d.sffb007    = cl_aws_getRowField(l_node2,'op_no')                 #作業編號
            LET l_input_d.sffb008    = cl_aws_getRowField(l_node2,'op_seq')                #作業序 
            LET l_input_d.sffb010    = cl_aws_getRowField(l_node2,'machine_no')            #機器編號
            LET l_input_d.sffb011    = cl_aws_getRowField(l_node2,'number_of_operators')   #作業人數
            LET l_input_d.sffb012    = cl_aws_getRowField(l_node2,'complete_date')         #完成日期
            LET l_input_d.sffb013    = cl_aws_getRowField(l_node2,'report_datetime_e')     #完成時間
            LET l_input_d.sffb014    = cl_aws_getRowField(l_node2,'labor_hours')           #工時
            LET l_input_d.sffb015    = cl_aws_getRowField(l_node2,'machine_hours')         #機時
            LET l_input_d.sffb016    = cl_aws_getRowField(l_node2,'unit_no')               #單位
            LET l_input_d.sffb017    = cl_aws_getRowField(l_node2,'qty')                   #良品數量
            LET l_input_d.sffb018    = cl_aws_getRowField(l_node2,'scrap_qty')             #報廢數量
            LET l_input_d.defect_qty = cl_aws_getRowField(l_node2,'defect_qty')            #不良品數量
            # add by lixwz 180815 s---
            LET l_input_d.wo_no_scrap_qty = cl_aws_getRowField(l_node2,'wo_no_qty')
            LET l_input_d.wo_no_unit_no = cl_aws_getRowField(l_node2,'wo_no_unit_no') 
            # add by lixwz 180815 e---
            LET l_input_d.unit_no = cl_aws_getRowField(l_node2,'unit_no')   #add by wangxt180824
            
            
            #170425-00014#5-S
            #MES傳入秒，需轉換為分
            LET l_input_d.sffb014    = l_input_d.sffb014/60         #工時
            LET l_input_d.sffb015    = l_input_d.sffb015/60         #機時            
            #170425-00014#5-E

            #檢查 XML傳入單身 必要輸入
            CALL wssp054_chk_detail_required(l_input_d.*) RETURNING l_input_d.*
            IF NOT cl_null(g_errno) THEN
               IF cl_null(gi_err_msg) THEN
                  LET gi_err_msg = cl_getmsg(g_errno,g_lang)
               END IF
               #180621-00035#1 mark-S
               #IF NOT cl_null(l_input_d.sffbseq) THEN
               #   LET g_errmsg = g_field,'(sffbseq = ',l_input_d.sffbseq USING '<<<<<','):',gi_err_msg
               #ELSE
               #   LET g_errmsg = g_field,':',gi_err_msg
               #END IF
               #180621-00035#1 mark-E
               #180621-00035#1 add-S
               LET g_errmsg = '(',g_field05,':',l_input_d.sffb005,'+',     #工單單號
                                  g_field06,':',l_input_d.sffb010,'+',     #機器編號
                                  g_field07,':',l_input_d.sffb007,'+',     #作業編號
                                  g_field09,':',l_input_d.sffb002,') ',    #報工人員
                              g_field,':',gi_err_msg
               #180621-00035#1 add-E               
               LET l_success = FALSE 
               EXIT WHILE  
            END IF
            
            #檢查 XML傳入單身 欄位合理性
            CALL wssp054_chk_detail_correct(l_input_d.*) RETURNING l_input_d.*
            IF NOT cl_null(g_errno) THEN
               IF cl_null(gi_err_msg) THEN
                  LET gi_err_msg = cl_getmsg(g_errno,g_lang)
               END IF
               #LET g_errmsg = g_field,'(sffbseq = ',l_input_d.sffbseq USING '<<<<<','):',gi_err_msg  #180621-00035#1 mark
               #180621-00035#1 add-S
               LET g_errmsg = '(',g_field05,':',l_input_d.sffb005,'+',     #工單單號
                                  g_field06,':',l_input_d.sffb010,'+',     #機器編號
                                  g_field07,':',l_input_d.sffb007,'+',     #作業編號
                                  g_field09,':',l_input_d.sffb002,') ',    #報工人員
                              g_field,':',gi_err_msg
               #180621-00035#1 add-E 
               LET l_success = FALSE 
               EXIT WHILE  
            END IF
            
            #產生sffb_t資料
            CALL wssp054_ins_sffb(l_input_m.*,l_input_d.*)
            IF NOT cl_null(g_errno) THEN
               IF cl_null(gi_err_msg) THEN
                  LET gi_err_msg = cl_getmsg(g_errno,g_lang)
               END IF
               LET g_errmsg = gi_err_msg
               LET l_success = FALSE 
               EXIT WHILE  
            END IF
         END FOR
         
         ##產生sffb_t資料
         #CALL wssp054_ins_sffb(l_input_m.*)
         #IF NOT cl_null(g_errno) THEN
         #   IF cl_null(gi_err_msg) THEN
         #      LET gi_err_msg = cl_getmsg(g_errno,g_lang)
         #   END IF
         #   LET g_errmsg = gi_err_msg
         #   LET l_success = FALSE 
         #   EXIT WHILE  
         #END IF
      END FOR
      
      EXIT WHILE
   END WHILE
   
   IF l_success THEN
      CALL s_transaction_end('Y','0')  
   ELSE 
      CALL s_transaction_end('N','0')
   END IF
   
   #回傳結果
   LET gi_err_code = NULL
   LET gi_err_msg = NULL
   CALL g_errlog_arr.clear()
   
   IF l_success THEN
      INITIALIZE g_status.* TO NULL
      LET g_status.code = 0
      LET g_status.sqlcode = 0
      CALL cl_aws_addParameter("report_no", g_sffbdocno ,"string")
   ELSE   
      IF cl_null(g_errno) THEN
         LET g_errno = 'wss-00199'
      END IF 
      IF cl_null(g_errmsg) THEN
         LET g_errmsg = cl_getmsg(g_errno,g_lang)
      END IF
      LET g_status.code = g_errno
      LET g_status.description = g_errmsg
   END IF

   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="wssp054.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

# 檢查單頭必要輸入欄位是否有值
# p_input_m : 傳入接收端單頭資料RECORD
PRIVATE FUNCTION wssp054_chk_master_required(p_input_m)
   DEFINE p_input_m     RECORD                  #---單頭傳入值---
             sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
             sffbdocdt  LIKE sffb_t.sffbdocdt,  #單據日期
             sffb009    LIKE sffb_t.sffb009,    #工作站
             sffb023    LIKE sffb_t.sffb023,    #備註
             sffb004    LIKE sffb_t.sffb004     #班別   #170222-00022#6
             
                        END RECORD
   DEFINE l_flag        LIKE type_t.chr1        #是否為空
      
   LET g_errno = NULL
   LET g_field = NULL
   LET l_flag = 'N'
   
   CALL cl_err_collect_init()  
   WHILE TRUE
      #報工單別
      IF cl_null(p_input_m.sffbdocno) THEN
         LET l_flag = 'Y'
         #LET g_field = 'sffbdocno'   #180621-00035#1 mark
         LET g_field = g_field01      #180621-00035#1 add
         EXIT WHILE
      END IF
      
      #單據日期
      IF cl_null(p_input_m.sffbdocdt) THEN
         LET p_input_m.sffbdocdt = cl_get_today()
      END IF
            
      #170222-00022#6-S
      #班別
      IF cl_null(p_input_m.sffb004) THEN
         LET l_flag = 'Y'
         #LET g_field = 'shift_no'   #180621-00035#1 mark
         LET g_field = g_field04     #180621-00035#1 add
         EXIT WHILE
      END IF
      #170222-00022#6-E
      
      EXIT WHILE
   END WHILE
   CALL cl_err_collect_init()   #將錯誤訊息清空
   CALL cl_err_collect_show()  
   
   IF l_flag = 'Y' THEN
      LET g_errno = 'azz-00736'  #此欄位不可空白,請輸入資料！
   END IF 
                       
   RETURN p_input_m.*
END FUNCTION

# 檢查單身必要輸入欄位是否有值
# p_input_d : 傳入接收端單身資料RECORD
PRIVATE FUNCTION wssp054_chk_detail_required(p_input_d)
   DEFINE p_input_d     RECORD                  #---單身傳入值---
             sffbseq    LIKE sffb_t.sffbseq,    #項次
             sffb002    LIKE sffb_t.sffb002,    #報工人員
             sffb005    LIKE sffb_t.sffb005,    #工單單號
             sffb007    LIKE sffb_t.sffb007,    #作業編號
             sffb008    LIKE sffb_t.sffb008,    #作業序
             sffb010    LIKE sffb_t.sffb010,    #機器編號
             sffb011    LIKE sffb_t.sffb011,    #作業人數
             sffb012    LIKE sffb_t.sffb012,    #完成日期
             sffb013    LIKE sffb_t.sffb013,    #完成時間
             sffb014    LIKE sffb_t.sffb014,    #工時
             sffb015    LIKE sffb_t.sffb015,    #機時
             sffb016    LIKE sffb_t.sffb016,    #單位
             sffb017    LIKE sffb_t.sffb017,    #良品數量
             sffb018    LIKE sffb_t.sffb018,    #報廢數量
             defect_qty LIKE sffb_t.sffb018     #不良品數量
             # add by lixwz 180815 s---
             ,wo_no_scrap_qty LIKE sffb_t.sffbud011,
             wo_no_unit_no LIKE sffb_t.sffbud001
             # add by lixwz 180815 e---
             ,unit_no LIKE sffb_t.sffbud002  #add by wangxt180824             
                        END RECORD   

   DEFINE l_flag        LIKE type_t.chr1        #是否為空
      
   LET g_errno = NULL
   LET g_field = NULL
   LET l_flag = 'N'
   
   CALL cl_err_collect_init()  
   WHILE TRUE
  
      #報工項次
      IF cl_null(p_input_d.sffbseq) THEN
         LET p_input_d.sffbseq = 0
      END IF  
      
      #報工人員
      IF cl_null(p_input_d.sffb002) THEN
         LET p_input_d.sffb002 = g_user 
      END IF 
      
      #工單單號
      IF cl_null(p_input_d.sffb005) THEN
         LET l_flag = 'Y'
         #LET g_field = 'sffb005'   #180621-00035#1 mark
         LET g_field = g_field05    #180621-00035#1 add
         EXIT WHILE
      END IF 
      
      #作業編號
      IF p_input_d.sffb007 IS NULL THEN
         LET l_flag = 'Y'
         #LET g_field = 'sffb007'   #180621-00035#1 mark
         LET g_field = g_field07    #180621-00035#1 add
         EXIT WHILE
      END IF 
      
      #製程式
      IF p_input_d.sffb008 IS NULL THEN
         LET p_input_d.sffb008 = 1
      END IF 
      
      #工作站
      IF cl_null(g_sffb009) THEN 
         IF NOT cl_null(p_input_d.sffb010) THEN
            SELECT mrba022 
              INTO g_sffb009 
              FROM mrba_t
             WHERE mrbaent  = g_enterprise
               AND mrbasite = g_site
               AND mrba001  = p_input_d.sffb010
         END IF
      END IF
      
      #作業人數
      IF cl_null(p_input_d.sffb011) OR p_input_d.sffb011 = 0 THEN
         LET p_input_d.sffb011 = 1
      END IF 
      
      #完成日期
      IF cl_null(p_input_d.sffb012) THEN
         LET p_input_d.sffb012 = cl_get_today()
      END IF
      
      #完成時間
      IF cl_null(p_input_d.sffb013) THEN
         LET p_input_d.sffb013 = cl_get_time()
         LET p_input_d.sffb013 = p_input_d.sffb013[1,5]
      END IF
      
      #工時
      IF cl_null(p_input_d.sffb014) THEN
         LET p_input_d.sffb014 = 0
      END IF 
      
      #機時
      IF cl_null(p_input_d.sffb015) THEN
         LET p_input_d.sffb015 = 0
      END IF 
      
      #單位
      IF cl_null(p_input_d.sffb016) THEN
         SELECT sfcb020 
           INTO p_input_d.sffb016
           FROM sfcb_t
          WHERE sfcbent  = g_enterprise
            AND sfcbsite = g_site
            AND sfcbdocno= p_input_d.sffb005
            AND sfcb001  = 0
            AND sfcb002 = 10
            AND sfcb004  = p_input_d.sffb008
         IF cl_null(p_input_d.sffb016) THEN
            LET l_flag = 'Y'
            #LET g_field = 'sffb016'   #180621-00035#1 mark
            LET g_field = g_field08    #180621-00035#1 add
            EXIT WHILE
         END IF
      END IF 
      
      #良品數量
      IF cl_null(p_input_d.sffb017) THEN
         LET p_input_d.sffb017 = 0
      END IF 
      
      #報廢數量
      IF cl_null(p_input_d.sffb018) THEN
         LET p_input_d.sffb018 = 0
      END IF 
   
      EXIT WHILE
   END WHILE
   CALL cl_err_collect_init()   #將錯誤訊息清空
   CALL cl_err_collect_show() 

   IF l_flag = 'Y' THEN
      LET g_errno = 'azz-00736'  #此欄位不可空白,請輸入資料！
   END IF 
                       
   RETURN p_input_d.*                        
END FUNCTION

# 檢查單頭傳入欄位正確否
# p_input_m : 傳入接收端單頭資料RECORD
PRIVATE FUNCTION wssp054_chk_master_correct(p_input_m)
   DEFINE p_input_m     RECORD                  #---單頭傳入值---
             sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
             sffbdocdt  LIKE sffb_t.sffbdocdt,  #單據日期
             sffb009    LIKE sffb_t.sffb009,    #工作站
             sffb023    LIKE sffb_t.sffb023,    #備註
             sffb004    LIKE sffb_t.sffb004     #班別   #170222-00022#6
             
                        END RECORD
   DEFINE l_para        LIKE type_t.chr80
   DEFINE l_flag        LIKE type_t.chr1
                       
   LET g_errno = NULL
   LET g_field = NULL
   LET l_flag = 'N'
   
   CALL cl_err_collect_init()  
   WHILE TRUE
      #檢查單別
      #LET g_field = 'sffbdocno'                      #180621-00035#1 mark
      LET g_field = g_field01,':',p_input_m.sffbdocno #180621-00035#1 add
      IF NOT s_aooi200_chk_slip(g_site,'',p_input_m.sffbdocno,'asft335') THEN
         LET l_flag = 'Y'
         EXIT WHILE  
      END IF

      #170807-00020#8 add -str-
      #是否為MES抛回的單別
      CALL cl_get_doc_para(g_enterprise,g_site,p_input_m.sffbdocno,'D-MFG-0080') RETURNING l_para
      IF cl_null(l_para) THEN LET l_para = 'N' END IF
      IF l_para <> 'Y' THEN
         LET g_errno = 'wss-00247'   #此單別不為MES抛回的單別！
         EXIT WHILE
      END IF
      #170807-00020#8 add -end-
      
      #檢查單據日期
      #LET g_field = 'sffbdocdt'                      #180621-00035#1 mark
      LET g_field = g_field02,':',p_input_m.sffbdocdt #180621-00035#1 add
      IF NOT s_date_chk_close(p_input_m.sffbdocdt,'1') THEN
         LET l_flag = 'Y'
         EXIT WHILE  
      END IF
      
      #檢查工作站
      #LET g_field = 'sffb009'                        #180621-00035#1 mark
      LET g_field = g_field03,':',p_input_m.sffb009   #180621-00035#1 add
      IF NOT cl_null(p_input_m.sffb009) THEN
         INITIALIZE g_chkparam.* TO NULL               
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_input_m.sffb009
         IF NOT cl_chk_exist("v_ecaa001") THEN
            LET l_flag = 'Y'
            EXIT WHILE  
         END IF
      END IF
      
      #170222-00022#6-S
      #班別      
      #LET g_field = 'sffb004'                        #180621-00035#1 mark
      LET g_field = g_field04,':',p_input_m.sffb004   #180621-00035#1 add
      IF NOT cl_null(p_input_m.sffb004) THEN
         INITIALIZE g_chkparam.* TO NULL               
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_input_m.sffb004
         IF NOT cl_chk_exist("v_oogd001") THEN
            LET l_flag = 'Y'
            EXIT WHILE  
         END IF
      END IF
      #170222-00022#6-S 
      
      EXIT WHILE
   END WHILE
   
   IF l_flag = 'Y' THEN
      CALL wssp054_err_faill()
      LET g_errno = gi_err_code
      LET g_errmsg = gi_err_msg   #181124-00001#1 add
   END IF
   
   CALL cl_err_collect_init()   #將錯誤訊息清空
   CALL cl_err_collect_show() 
                       
   RETURN p_input_m.*
END FUNCTION

# 檢查單身傳入欄位正確否
# p_input_d   : 傳入接收端單身資料RECORD
PRIVATE FUNCTION wssp054_chk_detail_correct(p_input_d)
   DEFINE p_input_d     RECORD                  #---單身傳入值---
             sffbseq    LIKE sffb_t.sffbseq,    #項次
             sffb002    LIKE sffb_t.sffb002,    #報工人員
             sffb005    LIKE sffb_t.sffb005,    #工單單號
             sffb007    LIKE sffb_t.sffb007,    #作業編號
             sffb008    LIKE sffb_t.sffb008,    #作業序
             sffb010    LIKE sffb_t.sffb010,    #機器編號
             sffb011    LIKE sffb_t.sffb011,    #作業人數
             sffb012    LIKE sffb_t.sffb012,    #完成日期
             sffb013    LIKE sffb_t.sffb013,    #完成時間
             sffb014    LIKE sffb_t.sffb014,    #工時
             sffb015    LIKE sffb_t.sffb015,    #機時
             sffb016    LIKE sffb_t.sffb016,    #單位
             sffb017    LIKE sffb_t.sffb017,    #良品數量
             sffb018    LIKE sffb_t.sffb018,    #報廢數量
             defect_qty LIKE sffb_t.sffb018     #不良品數量
             # add by lixwz 180815 s---
             ,wo_no_scrap_qty LIKE sffb_t.sffbud011,
             wo_no_unit_no LIKE sffb_t.sffbud001
             # add by lixwz 180815 e---
             ,unit_no LIKE sffb_t.sffbud002  #add by wangxt180824
                        END RECORD    
   DEFINE l_flag        LIKE type_t.chr1
   DEFINE l_oocqstus    LIKE oocq_t.oocqstus
                       
   LET g_errno = NULL
   LET g_field = NULL
   LET l_flag = 'N'
                       
   CALL cl_err_collect_init()  
   WHILE TRUE        
      #檢查項次
      #LET g_field = 'sffbseq'                          #180621-00035#1 mark
      LET g_field = g_field10,':',p_input_d.sffbseq     #180621-00035#1 add   
      IF NOT cl_ap_chk_range(p_input_d.sffbseq,"0.000","1","","","azz-00079",1) THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF
      
      #檢查報工人員
      #LET g_field = 'sffb002'                          #180621-00035#1 mark
      LET g_field = g_field09,':',p_input_d.sffb002     #180621-00035#1 add
      INITIALIZE g_chkparam.* TO NULL
      LET g_chkparam.arg1 = p_input_d.sffb002     
      IF NOT cl_chk_exist("v_ooag001") THEN
         LET l_flag = 'Y'
         EXIT WHILE 
      END IF 
      
      #檢查工單單號
      #LET g_field = 'sffb005'                          #180621-00035#1 mark
      LET g_field = g_field05,':',p_input_d.sffb005     #180621-00035#1 add
      #170222-00022#6-S
      #IF NOT s_asft300_chk_stus(p_input_d.sffb005,'F') THEN
      LET g_chkparam.arg1 = g_site              
      LET g_chkparam.arg2 = p_input_d.sffb005   
      IF NOT cl_chk_exist("v_sfaadocno_10") THEN       
      #170222-00022#6-E
         LET l_flag = 'Y'
         EXIT WHILE  
      END IF
      
      #檢查作業編號
      #LET g_field = 'sffb007'                         #180621-00035#1 mark
      LET g_field = g_field07,':',p_input_d.sffb007    #180621-00035#1 add 
      LET l_oocqstus = NULL      
      SELECT oocqstus
        INTO l_oocqstus
        FROM oocq_t 
       WHERE oocqent = g_enterprise           
         AND oocq001 = '221' 
         AND oocq002 = p_input_d.sffb007
      IF SQLCA.sqlcode = 100 THEN
         LET g_errno = 'wss-00258'  #無此作業編號，請查核！
         EXIT WHILE 
      END IF
      IF l_oocqstus = 'N' THEN
         LET g_errno = 'aap-00002'  #輸入的資料無效！
         EXIT WHILE 
      END IF
      
      #檢查報工機器
      IF NOT cl_null(p_input_d.sffb010) THEN
         #LET g_field = 'sffb010'                      #180621-00035#1 mark
         LET g_field = g_field06,':',p_input_d.sffb010 #180621-00035#1 add
         INITIALIZE g_chkparam.* TO NULL               
         LET g_chkparam.arg1 = p_input_d.sffb010
         IF NOT cl_chk_exist("v_mrba001") THEN
            LET l_flag = 'Y'
            EXIT WHILE
         END IF         
      END IF
      
      #檢查作業人數
      #LET g_field = 'sffb011'                         #180621-00035#1 mark
      LET g_field = g_field11,':',p_input_d.sffb011    #180621-00035#1 add
      IF NOT cl_ap_chk_range(p_input_d.sffb011,"0.000","0","","","azz-00079",1) THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF        
      
      #檢查完工日期、完工時間
      #LET g_field = 'sffb012,sffb013'                 #180621-00035#1 mark
      LET g_field = g_field12,':',p_input_d.sffb012,",",g_field13,':',p_input_d.sffb013  #180621-00035#1 add  
      IF NOT s_asft335_check_time(p_input_d.sffb012,p_input_d.sffb013,'3',
                                  p_input_d.sffb005,0,p_input_d.sffb007,p_input_d.sffb008) THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF
      
      #檢查單位
      #LET g_field = 'sffb016'                         #180621-00035#1 mark
      LET g_field = g_field08,':',p_input_d.sffb016    #180621-00035#1 add
      INITIALIZE g_chkparam.* TO NULL               
      LET g_chkparam.arg1 = p_input_d.sffb016
      IF NOT cl_chk_exist("v_ooca001") THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF         
      
      #檢查良品數量
      #LET g_field = 'sffb017'                         #180621-00035#1 mark
      LET g_field = g_field14,':',p_input_d.sffb017    #180621-00035#1 add  
      IF NOT cl_ap_chk_range(p_input_d.sffb017,"0.000","1","","","azz-00079",1) THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF 
      
      #檢查報廢數量
      #LET g_field = 'sffb018'                         #180621-00035#1 mark
      LET g_field = g_field15,':',p_input_d.sffb018    #180621-00035#1 add 
      IF NOT cl_ap_chk_range(p_input_d.sffb018,"0.000","1","","","azz-00079",1) THEN
         LET l_flag = 'Y'
         EXIT WHILE
      END IF 
     
      EXIT WHILE
   END WHILE
   
   IF l_flag = 'Y' THEN
      CALL wssp054_err_faill()
      LET g_errno = gi_err_code
      LET g_errmsg = gi_err_msg   #181124-00001#1 add
   END IF
   
   CALL cl_err_collect_init()   #將錯誤訊息清空
   CALL cl_err_collect_show() 
   CALL g_errlog_arr.clear()   
                       
   RETURN p_input_d.*
   
END FUNCTION

# 產生sffb_t資料
# p_input_m : 傳入接收端單頭資料RECORD
# p_input_d : 傳入接收端單身資料RECORD
PRIVATE FUNCTION wssp054_ins_sffb(p_input_m,p_input_d)
   DEFINE p_input_m     RECORD                  #---單頭傳入值---
             sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
             sffbdocdt  LIKE sffb_t.sffbdocdt,  #單據日期
             sffb009    LIKE sffb_t.sffb009,    #工作站
             sffb023    LIKE sffb_t.sffb023,    #備註
             sffb004    LIKE sffb_t.sffb004     #班別   #170222-00022#6
             
                        END RECORD 
   DEFINE p_input_d     RECORD                  #---單身傳入值---
             sffbseq    LIKE sffb_t.sffbseq,    #項次
             sffb002    LIKE sffb_t.sffb002,    #報工人員
             sffb005    LIKE sffb_t.sffb005,    #工單單號
             sffb007    LIKE sffb_t.sffb007,    #作業編號
             sffb008    LIKE sffb_t.sffb008,    #作業序
             sffb010    LIKE sffb_t.sffb010,    #機器編號
             sffb011    LIKE sffb_t.sffb011,    #作業人數
             sffb012    LIKE sffb_t.sffb012,    #完成日期
             sffb013    LIKE sffb_t.sffb013,    #完成時間
             sffb014    LIKE sffb_t.sffb014,    #工時
             sffb015    LIKE sffb_t.sffb015,    #機時
             sffb016    LIKE sffb_t.sffb016,    #單位
             sffb017    LIKE sffb_t.sffb017,    #良品數量
             sffb018    LIKE sffb_t.sffb018,    #報廢數量
             defect_qty LIKE sffb_t.sffb018     #不良品數量
             # add by lixwz 180815 s---
             ,wo_no_scrap_qty LIKE sffb_t.sffbud011,
             wo_no_unit_no LIKE sffb_t.sffbud001
             # add by lixwz 180815 e---
             ,unit_no LIKE sffb_t.sffbud002  #add by wangxt180824
                        END RECORD       
   DEFINE l_flag1       LIKE type_t.num5
   DEFINE l_sffb        RECORD LIKE sffb_t.*
   
   LET g_errno = NULL
   
   CALL cl_err_collect_init()  
   WHILE TRUE
      INITIALIZE l_sffb.* TO NULL
      LET l_sffb.sffbent   = g_enterprise
      LET l_sffb.sffbsite  = g_site
      LET l_sffb.sffbdocno = p_input_m.sffbdocno
      LET l_sffb.sffbseq   = p_input_d.sffbseq
      LET l_sffb.sffbdocdt = p_input_m.sffbdocdt
      LET l_sffb.sffb001   = '3'
      LET l_sffb.sffb002   = p_input_d.sffb002
      
      #部門
      SELECT ooag003
        INTO l_sffb.sffb003
        FROM ooag_t
       WHERE ooagent = l_sffb.sffbent
         AND ooag001 = l_sffb.sffb002  
      IF cl_null(l_sffb.sffb003) THEN          
         LET l_sffb.sffb003 = g_dept
      END IF 
      
      LET l_sffb.sffb004 = p_input_m.sffb004
      LET l_sffb.sffb005 = p_input_d.sffb005
      LET l_sffb.sffb006 = 0
      LET l_sffb.sffb007 = p_input_d.sffb007
      LET l_sffb.sffb008 = p_input_d.sffb008
      LET l_sffb.sffb009 = p_input_m.sffb009
      LET l_sffb.sffb010 = p_input_d.sffb010
      LET l_sffb.sffb011 = p_input_d.sffb011
      LET l_sffb.sffb012 = p_input_d.sffb012
      LET l_sffb.sffb013 = p_input_d.sffb013
      LET l_sffb.sffb014 = p_input_d.sffb014
      LET l_sffb.sffb015 = p_input_d.sffb015
      LET l_sffb.sffb016 = p_input_d.sffb016
      LET l_sffb.sffb017 = p_input_d.sffb017
      LET l_sffb.sffb018 = p_input_d.sffb018
      LET l_sffb.sffb019 = 0
      LET l_sffb.sffb020 = 0
      LET l_sffb.sffb023 = p_input_m.sffb023
      
      #報工組別
      SELECT oogf001 
        INTO l_sffb.sffb024
        FROM oogf_t 
       WHERE oogfent  = l_sffb.sffbent
         AND oogfsite = l_sffb.sffbsite 
         AND oogf002  = l_sffb.sffb002 
         AND oogfstus = 'Y' 
         AND oogf003 <= l_sffb.sffbdocdt 
         AND ROWNUM <= 1 
       ORDER BY oogf001 
       
      #是否為組別報工
      IF cl_get_doc_para(l_sffb.sffbent,l_sffb.sffbsite,l_sffb.sffbdocno,'D-MFG-0068') ='Y' THEN
         IF cl_null(l_sffb.sffb024) THEN
            LET g_errno = 'wss-00256'  #單別使用組別報工，此報工人員不屬於任何組別，請查核！
            LET gi_err_msg = 'sffb002:',cl_getmsg(g_errno,g_lang) 
            EXIT WHILE
         END IF
      END IF
       
      LET l_sffb.sffbownid = g_user
      LET l_sffb.sffbowndp = g_dept
      LET l_sffb.sffbcrtid = g_user
      LET l_sffb.sffbcrtdp = g_dept
      LET l_sffb.sffbcrtdt = cl_get_current()
      LET l_sffb.sffbmodid = g_user
      LET l_sffb.sffbmoddt = cl_get_current()
      LET l_sffb.sffbcnfid = g_user
      LET l_sffb.sffbcnfdt = cl_get_current()
      LET l_sffb.sffbstus = 'Y'                  #直接確認
      
      #報工料號
      SELECT sfaa010
        INTO l_sffb.sffb029 
        FROM sfaa_t
       WHERE sfaaent = l_sffb.sffbent
         AND sfaasite  = l_sffb.sffbsite
         AND sfaadocno = l_sffb.sffb005
         
      LET l_sffb.sffb030 = s_asft335_default_sffb030(l_sffb.sffb009)
   
      CALL s_aooi200_gen_docno(l_sffb.sffbsite,l_sffb.sffbdocno,l_sffb.sffbdocdt,'asft335') 
         RETURNING l_flag1,l_sffb.sffbdocno
      IF NOT l_flag1 THEN
         LET g_errno = 'apm-00003'   #自動生成單據編號有誤，請重新確認  
         EXIT WHILE         
      END IF 
      
      INSERT INTO sffb_t(sffbent,sffbsite,sffbdocno,sffbseq,sffbdocdt,
                         sffb001,sffb002,sffb003,sffb004,sffb005,
                         sffb006,sffb007,sffb008,sffb009,sffb010,
                         sffb011,sffb012,sffb013,sffb014,sffb015,
                         sffb016,sffb017,sffb018,sffb019,sffb020,
                         sffb023,sffb024,sffb029,sffb030,
                         sffbownid,sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,
                         sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt,sffbstus
                         ,sffbud011,sffbud001,sffbud002)   # add by lixwz 180815 add sffbud002 by wangxt180824
                  VALUES(l_sffb.sffbent,   l_sffb.sffbsite,  l_sffb.sffbdocno, l_sffb.sffbseq,   l_sffb.sffbdocdt,
                         l_sffb.sffb001,   l_sffb.sffb002,   l_sffb.sffb003,   l_sffb.sffb004,   l_sffb.sffb005,
                         l_sffb.sffb006,   l_sffb.sffb007,   l_sffb.sffb008,   l_sffb.sffb009,   l_sffb.sffb010,
                         l_sffb.sffb011,   l_sffb.sffb012,   l_sffb.sffb013,   l_sffb.sffb014,   l_sffb.sffb015,
                         l_sffb.sffb016,   l_sffb.sffb017,   l_sffb.sffb018,   l_sffb.sffb019,   l_sffb.sffb020,
                         l_sffb.sffb023,   l_sffb.sffb024,   l_sffb.sffb029,   l_sffb.sffb030,
                         l_sffb.sffbownid, l_sffb.sffbowndp, l_sffb.sffbcrtid, l_sffb.sffbcrtdp, l_sffb.sffbcrtdt,
                         l_sffb.sffbmodid, l_sffb.sffbmoddt, l_sffb.sffbcnfid, l_sffb.sffbcnfdt, l_sffb.sffbstus
                         ,p_input_d.wo_no_scrap_qty,p_input_d.wo_no_unit_no,p_input_d.unit_no)    # add by lixwz 180815  #add by wangxt180824
      IF SQLCA.sqlcode THEN
         LET g_errno = SQLCA.sqlcode        
         LET gi_err_msg = 'ins sffb_t:',cl_getmsg(g_errno,g_lang)          
         EXIT WHILE
      END IF
 
      IF cl_null(g_sffbdocno) THEN
         LET g_sffbdocno = l_sffb.sffbdocno
      ELSE
         LET g_sffbdocno = g_sffbdocno,',',l_sffb.sffbdocno
      END IF
      
      EXIT WHILE
   END WHILE
   CALL cl_err_collect_init()   #將錯誤訊息清空
   CALL cl_err_collect_show() 
END FUNCTION

# 錯誤訊息匯總
PRIVATE FUNCTION wssp054_err_faill()
   DEFINE l_i            LIKE type_t.num5
 
   FOR l_i = 1 TO g_errcollect.getLength() 
      LET gi_err_code = g_errcollect[l_i].code   #紀錄最後一個錯誤代碼
      
      IF cl_null(gi_err_msg) THEN
         LET gi_err_msg = g_errcollect[l_i].message
      ELSE
         LET gi_err_msg = gi_err_msg,"///",g_errcollect[l_i].message
      END IF
   END FOR
   #181124-00001#1 add-s
   IF g_errcollect.getLength() = 0 THEN
      FOR l_i = 1 TO g_errlog_arr.getLength() 
         LET gi_err_code = g_errlog_arr[l_i].code   #紀錄最後一個錯誤代碼      
         IF cl_null(gi_err_msg) THEN
            LET gi_err_msg = gi_err_code,":",g_errlog_arr[l_i].message
         ELSE
            LET gi_err_msg = gi_err_msg,"///",gi_err_code,":",g_errlog_arr[l_i].message
         END IF
      END FOR
      CALL g_errlog_arr.clear() 
   END IF
   #181124-00001#1 add-e
END FUNCTION

#end add-point
 
{</section>}
 
